Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673911;
	b=VOTkWcwTMONv3xP8OhucNMgryCVTlZiKswjRM+JaGHAC5eg9L2tfnYWnn2snoAkQ9b/y
	 /QlvDZfSXQZtu5vgL27ZL4PZ2cOfYyEaf7rpYRLTOffanqmj8kAm4yqXt53Woqkr7uHvY
	 rdRPl+FIr3Ix5r/Ko2QXAfQc52BnoWo5Y5ZUzWlEU4FwJHDnKlODguwopgHT07LacAjQD
	 g1uwJB4rlsLtY2EmjjqgEneQNRExx8OqsC8C6ZDeRgFDjauim3CmSo/Zz8LNQ1dey4AWT
	 dDOUx4aHX4HGH640GFLgoQKAvLWQJlpXeiE58vsYZS1oqwuUOqar41D+4JNu8pd14sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673911;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ADVWOpaXZmb5/8HpAlDA8d/XF3j1q+Zq9gbJ9wcX1A8=;
	b=4zmRbHGKRA/CJQHWyAZuq2twOYjaVI6bp3bIlIE/28166ZBAJSN1wJ66DanvwqU0o8+q
	 pkbqIfdbKryPgxHZmct5y+1ZTuU67KKuFDpy8S7VjKs8YuXBKTPm/G5d4U5WhDc4P6Gd3
	 cG/XTQHAyoOdvxH1MShPs9KUb2y5r2x5C/ieXc6U53xpVZdYwamhT0ccLWRg6z1JB7TTb
	 i6BfJruQ19psJfV6y8X5DIjh4xz5h9oQ3HYOB/K+spvnwSz4ySBFRSnXIlN9ydyhCmd6K
	 2cfuN5Xf/1Zhm9vAOHDXELyeJ9xUylzWqCri+wKVKSgFZ93FbzdNlfPS0A1E04L+OsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B3KmawJV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F87606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B3KmawJV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6A01F000C5;
	Thu, 22 Oct 2026 12:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792673911;
	bh=ADVWOpaXZmb5/8HpAlDA8d/XF3j1q+Zq9gbJ9wcX1A8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B3KmawJVW5S9LXxcbinBU3cVlLSUeLZGD8gul3A7OdJ2pChlkaTyMMX5Zsg46L6n1
	 P93VIh3rtAl3R0yh6krVZDt9xyXImFrg4cUBsynf8zlS35CNAHWbxKce0W8KqdZaYy
	 1oie7D0S8xHCQSZ+kNAdiahuC3CT1d1Tq/8RFEJJI/vtQ8ed7y4elxKgVsotmcMjUK
	 A63BTFys2RDCCvBpveIkZIIpWeeuJPoyPvnDzKQ6sWOorLn84x5A7FOrPXcn5FfFf0
	 ME1iQjklv/W/STJAH1g77L8bc6M1qtMqkvrjShqZynr2jmFVCnmpJuwUKPQLPLnjSn
	 u6vpldS0gL0PQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 3/3] f2fs: remove max_atc_write_bio_size
Date: Thu, 22 Oct 2026 12:58:20 +0000
Message-ID: <20261022125820.2210579-3-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261022125820.2210579-1-chao@kernel.org>
References: <20261022125820.2210579-1-chao@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
 fs/f2fs/data.c                          |  3 +--
 fs/f2fs/f2fs.h                          |  2 --
 fs/f2fs/super.c                         |  1 -
 fs/f2fs/sysfs.c                         |  2 --
 5 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 65d45d8edc68..7b7843d3d67b 100644
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
index e2f5b95b5c6d..6f7a008c6e21 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -415,8 +415,7 @@ static void f2fs_write_end_io(struct bio *bio)
 	sbi = bio->bi_private;
 
 	if (bio_in_atomic() &&
-	    (bio->bi_iter.bi_size > sbi->max_atc_write_bio_size ||
-	     F2FS_BIO(bio)->entry_cnt > f2fs_max_write_bio_cnt(bio))) {
+		F2FS_BIO(bio)->entry_cnt > f2fs_max_write_bio_cnt(bio)) {
 		struct work_struct *w;
 
 		w = &container_of(bio, struct f2fs_bio, bio)->work;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 05a7e96febdf..e638538131de 100644
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
index bd79cbbeba20..b321b9cff351 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5261,7 +5261,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 		err = -EINVAL;
 		goto free_sb_buf;
 	}
-	sbi->max_atc_write_bio_size = UINT_MAX;
 
 	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
 	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 3f50c291b355..046239761550 100644
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
@@ -1536,7 +1535,6 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(seq_file_ra_mul),
 	ATTR_LIST(gc_segment_mode),
 	ATTR_LIST(gc_reclaimed_segments),
-	ATTR_LIST(max_atc_write_bio_size),
 	ATTR_LIST(max_fragment_chunk),
 	ATTR_LIST(max_fragment_hole),
 	ATTR_LIST(current_atomic_write),
-- 
2.49.0

