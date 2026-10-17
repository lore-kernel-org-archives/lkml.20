Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248CD23393F
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202651; cv=none; b=olTj1lTqSrHsfB7rVtPOsjbx4Vh0N6bPqUdwsHm84b5+p5Ol0ZMV+Vhx652tpJWbDMw8rukMuewVBgIwvmdVYGXJDyxdwmSUILpaGu5PV3g8jBPbVWG00ymrIsNe1liIu3WeoDFayC72x4zeP+SfCWFVMyru/SWrJZKoduPD0lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202651; c=relaxed/simple;
	bh=Sn1Dfez+DIsC3sB5f8kL8f9w4EKjYoLXAqMSE3MoPDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kaaM9ffIz/ZaAW0m1q/0QRuX31E2Z0cLJDIC/4vVMxF87cvu9f24kuSdrcgmEM/TA4DjIZBymDDJPvV3Er3u2aOWsndctROBWumz2yU+uU/UNMiGzWZTk7jNvfzMsA/H/VZPzb62QhlIZdunec9JeD0PQLPQWO2H/yQA/yDZHMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llPq5Mxb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="llPq5Mxb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060A61F000C7;
	Sat, 17 Oct 2026 02:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792202649;
	bh=RKiZoTfO9HDHKNcvEigrJ8aHqQJWoppKggx0SJQ8qTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=llPq5MxbzaRmJckoK+czolYJGVZzmXYG7pStgFHS3fj23F9eUCeDYyqA/PjAn1Lkv
	 9B7vYmtHGpFS/wR5J1mxpUuuvLaFJX+norVnNhRkAvnyccVxasop5DjJ/sSkrtGsgl
	 Mid7sj+FvfYXsjxGMRNNWe8TyrJQynKZfC5iQ/8S7wuSMPtFdBlWp0igGmpURkzsvn
	 UTrI0H3uA57wOyuUoqj+jaZ2wnC9kgZGxLdg/6oS2M7QFUywmUtPoz9iFYf+SzQN3c
	 jJXr8PwmSLIJEMrgVt9OdEqxFWr6PP2VgsFoHfej1WA0lsz6J+5zufdL8/Qi1Ho+/R
	 e2IGP/iL9uFZQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 2/2] f2fs: remove max_atc_write_bio_size
Date: Sat, 17 Oct 2026 02:03:58 +0000
Message-ID: <20261017020358.305503-2-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261017020358.305503-1-chao@kernel.org>
References: <20261017020358.305503-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

Commit 3de6b8094115 ("f2fs: Run f2fs_write_end_io() asynchronously")
introduced max_atc_write_bio_size to offload the completion of large
write bios to sbi->wq when f2fs_write_end_io() is called in atomic
context.

However, relying on bio->bi_iter.bi_size has two issues:
1. bi_size is not reliable at completion time: on a direct blk-mq path
   (e.g. SCSI or UFS), blk_update_request() consumes the bio iterator
   via bio_advance() before calling bio_endio(), so bi_size is already 0
   in f2fs_write_end_io(), whereas on a DM / zoned path (e.g. dm-linear)
   only the clone bio is advanced and orig_bio->bi_iter.bi_size stays
   intact.
2. With large folios enabled, folio size may be larger than 4KB, so
   bi_size cannot indicate how many folios are in a bio.

Since max_write_bio_{folio,entry}_cnt module parameters have been
introduced to limit the number of folios or cached blocks completed in
atomic context without depending on the bio iterator, let's remove
max_atc_write_bio_size logic and its sysfs entry.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 10 ----------
 fs/f2fs/data.c                          |  4 ++--
 fs/f2fs/f2fs.h                          |  2 --
 fs/f2fs/super.c                         |  1 -
 fs/f2fs/sysfs.c                         |  2 --
 5 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 3d2e78a8bb7d..3520c29f3b9c 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -1004,16 +1004,6 @@ Description:	It can be used to tune priority of f2fs critical task, e.g. f2fs_ck
 		- it requires user has CAP_SYS_NICE capability.
 		- the range is [100, 139], by default the value is 120.
 
-What:		/sys/fs/f2fs/<disk>/max_atc_write_bio_size
-Date:		June 2026
-Contact:	Bart Van Assche <bvanassche@acm.org>
-Description:	Every time a write operation completes f2fs_write_end_io() is
-		called. This function may be called from an atomic context,
-		e.g. from inside an interrupt handler. This attribute controls
-		the maximum size of a write bio that is completed in atomic
-		(atc) context. The default value for this attribute is UINT_MAX
-		which means that this functionality is disabled by default.
-
 What:		/sys/fs/f2fs/<disk>/pinned_area_max_secno
 Date:		August 2026
 Contact:	"Daeho Jeong" <daehojeong@google.com>
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3caadb30496a..867024c4c72d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -414,8 +414,8 @@ static void f2fs_write_end_io(struct bio *bio)
 
 	sbi = bio->bi_private;
 
-	if (in_atomic() && (bio->bi_iter.bi_size > sbi->max_atc_write_bio_size ||
-		F2FS_BIO(bio)->entry_cnt > f2fs_max_write_bio_cnt(bio))) {
+	if (in_atomic() &&
+		F2FS_BIO(bio)->entry_cnt > f2fs_max_write_bio_cnt(bio)) {
 		struct work_struct *w;
 
 		w = &container_of(bio, struct f2fs_bio, bio)->work;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4333d88cf076..e3ee28f0201f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1806,8 +1806,6 @@ struct f2fs_sb_info {
 	struct f2fs_sm_info *sm_info;		/* segment manager */
 
 	/* for bio operations */
-	/* Largest write bio size completed in atomic context (atc). */
-	u32 max_atc_write_bio_size;
 	struct f2fs_bio_info *write_io[NR_PAGE_TYPE];	/* for write bios */
 	/* keep migration IO order for LFS mode */
 	struct f2fs_rwsem io_order_lock;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1664928fedca..10be5888273c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5183,7 +5183,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 		err = -EINVAL;
 		goto free_sb_buf;
 	}
-	sbi->max_atc_write_bio_size = UINT_MAX;
 
 	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
 	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 95f8dc0c4218..67202b7f8293 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1284,7 +1284,6 @@ F2FS_SBI_RW_ATTR(gc_idle_interval, interval_time[GC_TIME]);
 F2FS_SBI_RW_ATTR(umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
 F2FS_SBI_RW_ATTR(gc_pin_file_thresh, gc_pin_file_threshold);
 F2FS_SBI_RW_ATTR(gc_reclaimed_segments, gc_reclaimed_segs);
-F2FS_SBI_RW_ATTR(max_atc_write_bio_size, max_atc_write_bio_size);
 F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
 F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
@@ -1535,7 +1534,6 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(seq_file_ra_mul),
 	ATTR_LIST(gc_segment_mode),
 	ATTR_LIST(gc_reclaimed_segments),
-	ATTR_LIST(max_atc_write_bio_size),
 	ATTR_LIST(max_fragment_chunk),
 	ATTR_LIST(max_fragment_hole),
 	ATTR_LIST(current_atomic_write),
-- 
2.49.0

