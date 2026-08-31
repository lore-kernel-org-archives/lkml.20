Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEA83AE1B9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788154397; cv=pass; b=OCsUc66b9adVf6D3r6wZerh5UDRmqRKdagKSZJH1yVlW4AyhiE9CRp60GnhMGCnRQckRmnLAA+1p8Z6rlL3bOxsKEu3hOskyIjw+laLHb69S/4jfySozEvYRmXY7Wn6L484R0d0EfZJHwNr/HoCKT2oSjwKN4RyG6t1wxVxk/GQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788154397; c=relaxed/simple;
	bh=LwkNEZNS3n4XrPO4aPp3xwZH1tCkEtoJpNFfuxleVVc=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AUUqVCciNyPxCeWpX1kmwT6a4tc3ezHxcuKliPGCqgerAiGTU+cd5rw//pXFlCDrnEuXuB+PNz2LD3J226j6Yf/Re3OScotjqDxneREC5ZUs/cEuRg6UZRRDyhttgEPZkR2XNdZoqDmHs17Gpon6ADsNHIoHhDsSqtjkOsQ7wMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkLKob15; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkLKob15"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so4663658a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788154394; cv=none;
        d=google.com; s=arc-20260327;
        b=XuNv2yROFy7QifoNp+khA/cuo0OBFwzfEWAwv5iy+P5sT2D7HF25zWXgl1XCbEDUz7
         Drg+vz30nxonqeLmzMx/Bgq714jGjL1qyCT/afBln9NGNQYu75Crws0IID1vicab+qZf
         AE7OqOpRpLvmTrcIqO/eAtLh+H84jeBfGPAC+3o8RqknavjwQNqfyIgm14yBfY5jQDq1
         O0pfEYI9giCOU0lIdgazODg1uLuNy22xHm+gWh5BA223T5T+mwqNKRlfNvZAvj8WUEGq
         TfNiRDzE7GOIT4z7vMisqbynfgVFVjOl0I+kHyCTgJ+kEk03kSjPUX9YLDsy3Saq4wNq
         IP1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=teJG0g7hnXcKnDzhThesv9by/6HQHdAle5mTs9kt9nQ=;
        fh=bMcIl9aGZCteSgBGQSI/fpRzzv+synlXV7lsuL8tV24=;
        b=Y4hKPsPZi3H8ZDevATVYOtClpWV3ZewrJ6mjoDZJRC0pjrMn/dyNXg9ql3EiSHsyKJ
         jvMKe8YHUQO5jfE+27u8BxnI0AHHGtetw5ZsGYZ3EUQ8EFcIUtY1a9XiMHPsreZ4Y/na
         Qsk/+lr7jNfs6d/oYXuRtPrKTjJYo9pyr8c0K4ydO/hiHeDzJjRKtL/hDF4sNjF1rrSQ
         tGN45t/4Ozh+jamNsT6y0TmexCZoOdJO/rC9z/y+oeqSOJ3eluCA+NK0gEpqvLmJfMqz
         hHaW7sz1t215b+00au7gJd/PiDavOrLK5QlHqER5R3Qtaq0XITTXf51WEMzkSme7RA+/
         krqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788154394; x=1788759194; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=teJG0g7hnXcKnDzhThesv9by/6HQHdAle5mTs9kt9nQ=;
        b=WkLKob15etMkALCOJ67YUU9SO0CaVVYrqE9KxrOUs6ZK/KAukhonNiT7z/Xj2jhkvk
         KPjQcA4pXx6Q9Q5DvzSeCJaV4CFFEgGPcz8+77IgdbZ5FzdcnykK9z/5491dZ8pu2a5m
         zl1e8xgrgciCb3jW9jcWxcFmXklSjQURhGO2q6YQQLszlUtrOAGMwjZduxb+CWjblvGd
         Hqk//JQZGnH2o8TUtGE4qlvqfRwI5BHxKhP5eFBzFrISJxY/iV5Bl16p85QinVl+jxoM
         a00yYWui9O3viPSu/XevK5ulVGdao+TJWpOIQ0TozcJE8l61TEtsMumVaYmS1PujGCsc
         jpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788154394; x=1788759194;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=teJG0g7hnXcKnDzhThesv9by/6HQHdAle5mTs9kt9nQ=;
        b=rmawvf2Uw2WVXl04/TfCluHdlwsmFm9O06CJOSVpI04P2NM0UPxhWfCk9HWrzC+Dru
         HUrhr9IRljSmRT5m1MD91PovrhQYPBDuFklTsBJTyJPJcKYXr/ec/4NRNzMCvMYwsuqW
         5oFSr3mmFuj6GD02oJ8S6B6zCervCqcrW6GI6hWvb65AIutJVQc5ygvfMmEV5QAnzLVA
         9fagGDkv8OL2vSJM6jiEJvjYM4DtWt498TFGlQJyB8zBQZRzKBRdURpb7h95KGk6kL8B
         UfCunS0POy2oz/O3GuWyL11zJeJVvVfjRxoAJax8FF0w1cdRhZg0cFQcG0Bv3tB+Yw//
         aC7w==
X-Forwarded-Encrypted: i=1; AKwUvBw/RPiIt7obldwLLd3NyfVNHACwce/7EDB8bXNCT2uKHcVy6uyj0t7qnGwlZESUy+/uMf0yzBk5Rje1qrc=@vger.kernel.org
X-Gm-Message-State: AFuF++kxSqXafJfa8C+lZl+hUxPfM+a9f//Os0A5Gf7m4vdUmCuLRf3g
	3AXQihJbJPCTYfa2DV4aGYZEHa3zp4IDxwJND02WXDDF89GHk4psc1sWv8al+5DH0WyaVa48EHR
	zcPgXBEeKCPSktgDWs+EMObSt8897SaC0DUbQW1Y=
X-Gm-Gg: AYBFou0yB1WRKZkx1rmdjX4Ad8K1barwBSUWYmQO/bLZDbVhPCsjpiYu4iiibKuWYF2
	5O2oULJEVD11PU6qaigSBrvO9f5Txk58h20SwLA6vmPUVB9alKFXRrm3D2+RGjYLbOdtM1c81KV
	Rz0XswuzJ805/o0Ks5HIy31fIJAaVVyKWI6h3yjMhNvWnatxIY2ElUxIqC8yEkoK2V+ZmquGtJ7
	+vEdEWUGRG/5YOFxC2rO/cu8Cm1JzrxYK2Cw/B2YyWAA30NQ2MA2ZpO82VES6REnecNDNBycOID
	gLmCDrrhyiVJ1vQ21IE10iJMS7TzQsjPF+iYU25cfNOWFyyEjIofVr5bjCvh2ZuHdixj15E4Tvx
	oZg==
X-Received: by 2002:a05:6402:5107:b0:6a5:dfb6:3618 with SMTP id
 4fb4d7f45d1cf-6a60d318ddamr13168124a12.5.1788154393701; Sun, 30 Aug 2026
 22:33:13 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 07:33:13 +0200
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 07:33:13 +0200
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH=xXfEFL7w7nsU3xjNubKJ1soYMqT-DbJBuyzfEX4Rv3rdFEA@mail.gmail.com>
References: <CAH=xXfEFL7w7nsU3xjNubKJ1soYMqT-DbJBuyzfEX4Rv3rdFEA@mail.gmail.com>
Date: Mon, 31 Aug 2026 07:33:13 +0200
X-Gm-Features: AcwNN1UoJMpz8YqPE1o6OJ4-pQE3eDamohPnpbvZ0InrZnHz_uUCWsqEar_y02E
Message-ID: <CAH=xXfGk1xWbG+TN6w6rMBuvygJNnYJStvbmGggwAfXE-M-X=Q@mail.gmail.com>
Subject: [PATCH v3 08/11] f2fs: parameterize sector conversion macros
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sector-to-block and block-to-sector conversion helpers previously
assumed a fixed sector count per block derived from 4KB pages.

Parameterize F2FS_LOG_SECTORS_PER_BLOCK, SECTOR_FROM_BLOCK, and
SECTOR_TO_BLOCK with struct f2fs_sb_info *sbi, using
sbi->log_sectors_per_block.

Update all call sites across metadata I/O, data mapping, discard
operations, and zoned block device reporting.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/data.c          |  2 +-
 fs/f2fs/f2fs.h          |  5 +++--
 fs/f2fs/file.c          |  4 ++--
 fs/f2fs/inode.c         | 11 +++++++----
 fs/f2fs/segment.c       | 14 +++++++-------
 fs/f2fs/segment.h       |  8 ++++----
 fs/f2fs/super.c         | 10 +++++-----
 include/linux/f2fs_fs.h |  2 +-
 8 files changed, 30 insertions(+), 26 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 751b7a457d9a..44e1ae43565e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -466,7 +466,7 @@ struct block_device *f2fs_target_device(struct
f2fs_sb_info *sbi,
 	}

 	if (sector)
-		*sector = SECTOR_FROM_BLOCK(blk_addr);
+		*sector = SECTOR_FROM_BLOCK(sbi, blk_addr);
 	return bdev;
 }

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 247e56522441..b90c5a42703f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2609,7 +2609,8 @@ static inline int F2FS_HAS_BLOCKS(struct inode *inode)
 {
 	block_t xattr_block = F2FS_I(inode)->i_xattr_nid ? 1 : 0;

-	return (inode->i_blocks >> F2FS_LOG_SECTORS_PER_BLOCK) > xattr_block;
+	return (inode->i_blocks >>
+		F2FS_LOG_SECTORS_PER_BLOCK(F2FS_I_SB(inode))) > xattr_block;
 }

 static inline bool f2fs_has_xattr_block(unsigned int ofs)
@@ -2815,7 +2816,7 @@ static inline void dec_valid_block_count(struct
f2fs_sb_info *sbi,
 						struct inode *inode,
 						block_t count)
 {
-	blkcnt_t sectors = count << F2FS_LOG_SECTORS_PER_BLOCK;
+	blkcnt_t sectors = count << F2FS_LOG_SECTORS_PER_BLOCK(sbi);

 	spin_lock(&sbi->stat_lock);
 	if (unlikely(sbi->total_valid_block_count < count)) {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d440231b8cb9..2c72e028cec2 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4510,8 +4510,8 @@ static int f2fs_reserve_compress_blocks(struct
file *filp, unsigned long arg)
 static int f2fs_secure_erase(struct block_device *bdev, struct inode *inode,
 		pgoff_t off, block_t block, block_t len, u32 flags)
 {
-	sector_t sector = SECTOR_FROM_BLOCK(block);
-	sector_t nr_sects = SECTOR_FROM_BLOCK(len);
+	sector_t sector = SECTOR_FROM_BLOCK(F2FS_I_SB(inode), block);
+	sector_t nr_sects = SECTOR_FROM_BLOCK(F2FS_I_SB(inode), len);
 	int ret = 0;

 	if (flags & F2FS_TRIM_FILE_DISCARD) {
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 20b0561fe35d..b628fdc4198f 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -221,11 +221,11 @@ static bool sanity_check_compress_inode(struct
inode *inode,
 		return false;
 	}
 	if (le64_to_cpu(ri->i_compr_blocks) >
-			SECTOR_TO_BLOCK(inode->i_blocks)) {
+			SECTOR_TO_BLOCK(sbi, inode->i_blocks)) {
 		f2fs_warn(sbi,
 			"%s: inode (ino=%llx) has inconsistent i_compr_blocks:%llu,
i_blocks:%llu, run fsck to fix",
 			__func__, inode->i_ino, le64_to_cpu(ri->i_compr_blocks),
-			SECTOR_TO_BLOCK(inode->i_blocks));
+			SECTOR_TO_BLOCK(sbi, inode->i_blocks));
 		return false;
 	}
 	if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
@@ -446,7 +446,8 @@ static int do_read_inode(struct inode *inode)
 	i_gid_write(inode, le32_to_cpu(ri->i_gid));
 	set_nlink(inode, le32_to_cpu(ri->i_links));
 	inode->i_size = le64_to_cpu(ri->i_size);
-	inode->i_blocks = SECTOR_FROM_BLOCK(le64_to_cpu(ri->i_blocks) - 1);
+	inode->i_blocks = SECTOR_FROM_BLOCK(sbi,
+			le64_to_cpu(ri->i_blocks) - 1);

 	inode_set_atime(inode, le64_to_cpu(ri->i_atime),
 			le32_to_cpu(ri->i_atime_nsec));
@@ -695,6 +696,7 @@ struct inode *f2fs_iget_retry(struct super_block
*sb, unsigned long ino)

 void f2fs_update_inode(struct inode *inode, struct folio *node_folio)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_inode *ri;
 	struct extent_tree *et = fi->extent_tree[EX_READ];
@@ -711,7 +713,8 @@ void f2fs_update_inode(struct inode *inode, struct
folio *node_folio)
 	ri->i_uid = cpu_to_le32(i_uid_read(inode));
 	ri->i_gid = cpu_to_le32(i_gid_read(inode));
 	ri->i_links = cpu_to_le32(inode->i_nlink);
-	ri->i_blocks = cpu_to_le64(SECTOR_TO_BLOCK(READ_ONCE(inode->i_blocks)) + 1);
+	ri->i_blocks = cpu_to_le64(SECTOR_TO_BLOCK(sbi,
+					   READ_ONCE(inode->i_blocks)) + 1);

 	if (!f2fs_is_atomic_file(inode) ||
 			is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b29df65ab5b7..f565b6873832 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1310,7 +1310,7 @@ static void __submit_zone_reset_cmd(struct
f2fs_sb_info *sbi,
 	/* sanity check on discard range */
 	__check_sit_bitmap(sbi, dc->di.lstart, dc->di.lstart + dc->di.len);

-	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(dc->di.start);
+	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(sbi, dc->di.start);
 	bio->bi_private = dc;
 	bio->bi_end_io = f2fs_submit_discard_endio;
 	submit_bio(bio);
@@ -1327,7 +1327,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 {
 	struct block_device *bdev = dc->bdev;
 	unsigned int max_discard_blocks =
-			SECTOR_TO_BLOCK(bdev_max_discard_sectors(bdev));
+			SECTOR_TO_BLOCK(sbi, bdev_max_discard_sectors(bdev));
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 	struct list_head *wait_list = (dpolicy->type == DPOLICY_FSTRIM) ?
 					&(dcc->fstrim_list) : &(dcc->wait_list);
@@ -1389,8 +1389,8 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,

 		dc->di.len += len;

-		__blkdev_issue_discard(bdev, SECTOR_FROM_BLOCK(start),
-				SECTOR_FROM_BLOCK(len), GFP_NOFS, &bio);
+		__blkdev_issue_discard(bdev, SECTOR_FROM_BLOCK(sbi, start),
+				SECTOR_FROM_BLOCK(sbi, len), GFP_NOFS, &bio);
 		f2fs_bug_on(sbi, !bio);

 		/*
@@ -1518,7 +1518,7 @@ static void __update_discard_tree_range(struct
f2fs_sb_info *sbi,
 	struct discard_info di = {0};
 	struct rb_node **insert_p = NULL, *insert_parent = NULL;
 	unsigned int max_discard_blocks =
-			SECTOR_TO_BLOCK(bdev_max_discard_sectors(bdev));
+			SECTOR_TO_BLOCK(sbi, bdev_max_discard_sectors(bdev));
 	block_t end = lstart + len;

 	dc = __lookup_discard_cmd_ret(&dcc->root, lstart,
@@ -2041,8 +2041,8 @@ static int __f2fs_issue_discard_zone(struct
f2fs_sb_info *sbi,

 	/* For sequential zones, reset the zone write pointer */
 	if (f2fs_blkz_is_seq(sbi, devi, blkstart)) {
-		sector = SECTOR_FROM_BLOCK(blkstart);
-		nr_sects = SECTOR_FROM_BLOCK(blklen);
+		sector = SECTOR_FROM_BLOCK(sbi, blkstart);
+		nr_sects = SECTOR_FROM_BLOCK(sbi, blklen);
 		div64_u64_rem(sector, bdev_zone_sectors(bdev), &remainder);

 		if (remainder || nr_sects != bdev_zone_sectors(bdev)) {
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 534e376cbc92..2275404e769c 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -114,10 +114,10 @@ f2fs_start_segno(struct f2fs_sb_info *sbi,
unsigned int segno)
 #define f2fs_bitmap_size(nr)			\
 	(BITS_TO_LONGS(nr) * sizeof(unsigned long))

-#define SECTOR_FROM_BLOCK(blk_addr)					\
-	(((sector_t)blk_addr) << F2FS_LOG_SECTORS_PER_BLOCK)
-#define SECTOR_TO_BLOCK(sectors)					\
-	((sectors) >> F2FS_LOG_SECTORS_PER_BLOCK)
+#define SECTOR_FROM_BLOCK(sbi, blk_addr)				\
+	(((sector_t)blk_addr) << F2FS_LOG_SECTORS_PER_BLOCK(sbi))
+#define SECTOR_TO_BLOCK(sbi, sectors)					\
+	((sectors) >> F2FS_LOG_SECTORS_PER_BLOCK(sbi))

 /*
  * In the victim_sel_policy->alloc_mode, there are three block
allocation modes.
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3ba4df757213..46973207cd7b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3944,7 +3944,7 @@ static int __f2fs_commit_super(struct
f2fs_sb_info *sbi, struct folio *folio,
 	bio = bio_alloc(sbi->sb->s_bdev, 1, opf, GFP_NOFS);

 	/* it doesn't need to set crypto context for superblock update */
-	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(folio->index);
+	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(sbi, folio->index);

 	if (!bio_add_folio(bio, folio, folio_size(folio), 0))
 		f2fs_bug_on(sbi, 1);
@@ -4520,7 +4520,7 @@ static int f2fs_report_zone_cb(struct blk_zone
*zone, unsigned int idx,
 {
 	struct f2fs_report_zones_args *rz_args = data;
 	block_t unusable_blocks = (zone->len - zone->capacity) >>
-					F2FS_LOG_SECTORS_PER_BLOCK;
+					F2FS_LOG_SECTORS_PER_BLOCK(rz_args->sbi);

 	if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
 		return 0;
@@ -4563,10 +4563,10 @@ static int init_blkz_info(struct f2fs_sb_info
*sbi, int devi)

 	zone_sectors = bdev_zone_sectors(bdev);
 	if (sbi->blocks_per_blkz && sbi->blocks_per_blkz !=
-				SECTOR_TO_BLOCK(zone_sectors))
+				SECTOR_TO_BLOCK(sbi, zone_sectors))
 		return -EINVAL;
-	sbi->blocks_per_blkz = SECTOR_TO_BLOCK(zone_sectors);
-	FDEV(devi).nr_blkz = div_u64(SECTOR_TO_BLOCK(nr_sectors),
+	sbi->blocks_per_blkz = SECTOR_TO_BLOCK(sbi, zone_sectors);
+	FDEV(devi).nr_blkz = div_u64(SECTOR_TO_BLOCK(sbi, nr_sectors),
 					sbi->blocks_per_blkz);
 	if (nr_sectors & (zone_sectors - 1))
 		FDEV(devi).nr_blkz++;
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index d4151970ae86..f89609356be8 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -14,7 +14,7 @@
 #define F2FS_SUPER_OFFSET		1024	/* byte-size offset */
 #define F2FS_MIN_LOG_SECTOR_SIZE	9	/* 9 bits for 512 bytes */
 #define F2FS_MAX_LOG_SECTOR_SIZE	PAGE_SHIFT	/* Max is Block Size */
-#define F2FS_LOG_SECTORS_PER_BLOCK	(PAGE_SHIFT - 9) /* log number for
sector/blk */
+#define F2FS_LOG_SECTORS_PER_BLOCK(sbi)	((sbi)->log_blocksize - 9) /*
log number for sector/blk */
 #define F2FS_MIN_LOG_BLOCKSIZE		12
 #define F2FS_MIN_BLKSIZE		4096UL
 #define F2FS_BLKSIZE			PAGE_SIZE /* support only block == page */
-- 
2.53.0
