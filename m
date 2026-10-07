Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F18480DEC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373819; cv=none; b=emEKtOPa7+MlwTL35s3xFXASDac79dv7wAFYCegbiN1v8HC8oi7Oldgl0l5Z934aAWcjl77YZhFILVTuFvT/qZ1p3KWDGijqgXeofjQVzbQXGB179rKme8D96CXh8RuWy0rvfxicuWlU9tsVaYjud2D+oMF0P+d36P8b5XL7eQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373819; c=relaxed/simple;
	bh=PlWCbGZOZOdHVSsjcKr+Tov2/M6ZUTcsjJoIzYuwcGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHzNKnTHeo6NH2IT9SybGNZPNoI0yYhESGY7e1gdUtFLYhY8b4e75z5nOQYnAhf1ywas9dogiS2mvejyDGOlgPYeT+S9yu+VsaOCZrNHOMB+07y3m0jIeoCVAMGwe5Bj6/tYZLFjmLMKnVLKvAWOdWExQZNu+eUL3V4ib6Cgsh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVEhxJsQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVEhxJsQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F0A1F008A1;
	Wed,  7 Oct 2026 11:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373801;
	bh=IcOcFcagufUXMd9/FtYIV90ZFdfYqRj22aJmPkT6wEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EVEhxJsQue1b/2Am6aMrVUfdv6SgIcPU/VJXmoMIie1Y5kH7WrkqqOqBR08MPrAq5
	 iX2EokIPTMHBGbt1l1b3rqssrJEegkUdtPchECwUIpp2HIKEg7WN2+WLD3fDzOgQNb
	 2Q9IxFLDrIPAePd3w/eJ4qJw3o0Fj14XA+kbQeEiejbOpZi9ALTksSr+sfGKrWGScA
	 uY0ZLHLf9A2CkuTmnWX38jDNtUtggPopOnDzEMYhUhtkAHzzayl0Jn8Mb++TamEXUC
	 t5XnoGCSDR+NLRq4/WXo/85LpC2iPcasQJjAhmhDTp3UiI1/lDu7XqUbLLcWAA7gz2
	 aAxj9tkIE3yIQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 5/5] f2fs: introduce max_atc_write_bio_entry_cnt
Date: Wed,  7 Oct 2026 11:49:49 +0000
Message-ID: <20261007114949.2428048-5-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261007114949.2428048-1-chao@kernel.org>
References: <20261007114949.2428048-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

Commit 3de6b8094115 ("f2fs: Run f2fs_write_end_io() asynchronously")
introduced max_atc_write_bio_size to offload write bio completion to a
workqueue when f2fs_write_end_io() is called in atomic context.

However, using the bio byte size (bi_iter.bi_size) as the threshold has
limitations once large folios or multi-page bvecs are involved:

1. In f2fs_write_end_bio(), execution time is dominated by the
   completion loop (bio_for_each_folio_all() for pagecache folios,
   or while(entry) for cached metadata blocks), where per-entry
   locking, status clearing, sanity checks, and writeback end are
   performed. The CPU latency in atomic context scales with the number
   of entries in the bio, not its byte size.
2. For large folios, a large bio (e.g. 1MB comprised of single large
   folios) only iterates a few times through the loop. Throttling solely
   by max_atc_write_bio_size unnecessarily offloads such low-latency
   bios to the workqueue, adding context-switch overhead.
3. Conversely, relying on bio->bi_vcnt is insufficient because the block
   layer (bvec_try_merge_page) merges physically consecutive pages/folios
   into the same bio_vec segment. Thus, a bio with bi_vcnt == 1 could
   still contain multiple entries and iterate many times in end_io.

To address this, track the exact number of entries (folios or cached
blocks) queued to the write bio via entry_cnt in struct f2fs_bio, and
introduce a sysfs attribute max_atc_write_bio_entry_cnt. This enables
precise control over atomic context latency without penalizing large
folios.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 11 +++++++++++
 fs/f2fs/data.c                          |  7 ++++++-
 fs/f2fs/f2fs.h                          |  3 +++
 fs/f2fs/super.c                         |  1 +
 fs/f2fs/sysfs.c                         |  2 ++
 5 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index f50739f90ae9..5ff693dd4bff 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -1014,6 +1014,17 @@ Description:	Every time a write operation completes f2fs_write_end_io() is
 		(atc) context. The default value for this attribute is UINT_MAX
 		which means that this functionality is disabled by default.
 
+What:		/sys/fs/f2fs/<disk>/max_atc_write_bio_entry_cnt
+Date:		October 2026
+Contact:	Chao Yu <chao@kernel.org>
+Description:	Every time a write operation completes f2fs_write_end_io() is
+		called. This function may be called from an atomic context,
+		e.g. from inside an interrupt handler. This attribute controls
+		the maximum number of entries (folios or cached blocks) in a
+		write bio that is completed in atomic (atc) context. The default
+		value for this attribute is UINT_MAX which means that this
+		functionality is disabled by default.
+
 What:		/sys/fs/f2fs/<disk>/pinned_area_max_secno
 Date:		August 2026
 Contact:	"Daeho Jeong" <daehojeong@google.com>
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0a6aa24caa07..395794d00194 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -398,7 +398,8 @@ static void f2fs_write_end_io(struct bio *bio)
 
 	sbi = bio->bi_private;
 
-	if (in_atomic() && bio->bi_iter.bi_size > sbi->max_atc_write_bio_size) {
+	if (in_atomic() && (bio->bi_iter.bi_size > sbi->max_atc_write_bio_size ||
+			F2FS_BIO(bio)->entry_cnt > sbi->max_atc_write_bio_entry_cnt)) {
 		struct work_struct *w;
 
 		w = &container_of(bio, struct f2fs_bio, bio)->work;
@@ -551,6 +552,7 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 						fio->type, fio->temp);
 		bio->bi_write_stream = f2fs_io_type_to_write_stream(bdev, fio->type,
 								    fio->temp);
+		F2FS_BIO(bio)->entry_cnt = 0;
 	}
 	iostat_alloc_and_bind_ctx(sbi, bio, NULL);
 
@@ -1218,6 +1220,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 		goto alloc_new;
 	}
 
+	F2FS_BIO(io->bio)->entry_cnt++;
+
 	if (fio->io_wbc)
 		wbc_account_cgroup_owner(fio->io_wbc, fio->folio,
 				folio_size(fio->folio));
@@ -1324,6 +1328,7 @@ void f2fs_submit_cache_write(struct f2fs_io_info *fio)
 	}
 
 	f2fs_bio_add_cache(fio, io->bio);
+	F2FS_BIO(io->bio)->entry_cnt++;
 
 	io->last_block_in_bio = fio->new_blkaddr;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 089a62c054ea..0acbc4d299af 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1778,6 +1778,7 @@ struct f2fs_gc_kthread {
 struct f2fs_bio {
 	struct work_struct work;
 	struct f2fs_cached_block *entry;
+	unsigned int entry_cnt;
 	struct bio bio;
 };
 
@@ -1807,6 +1808,8 @@ struct f2fs_sb_info {
 	/* for bio operations */
 	/* Largest write bio size completed in atomic context (atc). */
 	u32 max_atc_write_bio_size;
+	/* Largest write bio entry count completed in atomic context (atc). */
+	u32 max_atc_write_bio_entry_cnt;
 	struct f2fs_bio_info *write_io[NR_PAGE_TYPE];	/* for write bios */
 	/* keep migration IO order for LFS mode */
 	struct f2fs_rwsem io_order_lock;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d683240040f0..9e55febe18f4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5211,6 +5211,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto free_sb_buf;
 	}
 	sbi->max_atc_write_bio_size = UINT_MAX;
+	sbi->max_atc_write_bio_entry_cnt = UINT_MAX;
 
 	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
 	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 95f8dc0c4218..32dfd564094b 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1285,6 +1285,7 @@ F2FS_SBI_RW_ATTR(umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
 F2FS_SBI_RW_ATTR(gc_pin_file_thresh, gc_pin_file_threshold);
 F2FS_SBI_RW_ATTR(gc_reclaimed_segments, gc_reclaimed_segs);
 F2FS_SBI_RW_ATTR(max_atc_write_bio_size, max_atc_write_bio_size);
+F2FS_SBI_RW_ATTR(max_atc_write_bio_entry_cnt, max_atc_write_bio_entry_cnt);
 F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
 F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
@@ -1536,6 +1537,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_segment_mode),
 	ATTR_LIST(gc_reclaimed_segments),
 	ATTR_LIST(max_atc_write_bio_size),
+	ATTR_LIST(max_atc_write_bio_entry_cnt),
 	ATTR_LIST(max_fragment_chunk),
 	ATTR_LIST(max_fragment_hole),
 	ATTR_LIST(current_atomic_write),
-- 
2.49.0

