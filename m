Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC18E37E2E6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788479798; cv=none; b=NMcfl51/WsSdq7VeTmgkC4ntmOVCazhq7m2uE7bk5m8zbkMdmWlXVx2t69sjim9xH4ltLXxFyXSd/mcQrr3Df/kTpcnCSZlzm2z3u75dTJIqR6veUaaGgCcLQtCnxfIuDbzeC1K0MJKy2+gZ3wRadx3oAvCWI/8TkZhbJjCYMoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788479798; c=relaxed/simple;
	bh=8iK9i/NqLUeuHV2sAqvUJRpqeFg1lmTTuf15Lkxscmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7miWiVH1WRq/7evCbz78Zho102kfNWkOBvx+Mk8HHZ3yOCdhoZpaC0GS/fwrpFLYA6cBZLwdpTxIP/A4UrM3WmZ0tfsbxJVM7UlTkXGrBWCkWmeruMD8Ho5hh+AIQBk8KvoZgCjKE/+cqrMBuL+xjXcuY2SNb6HFbD7nzkUTP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3LBvENQ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3LBvENQ"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so588548a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788479795; x=1789084595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MFGytssX5xYfgUs57Q55SXrdDTErkoIleyvcFFl1lvo=;
        b=Q3LBvENQviL/zKfvRJEXtZskpCTqN3/6nUf8/t/kBgVFm+5E66/JN+G5WjHvAz8r4O
         gCtJ0qjba8iE7p1Q9+ZwdhcNdbuKjPEWr0/pL4pNj0/wzAJhwQKkGrh+/Cju7uCFTjcf
         ztXamgKmNoP3wmc65UeidanTmRea/MAwj+Pq9MLyFZvEnCtiLaHIzfohB50XT/Hdw0QD
         E9Ny9U4vtF8bRWfO9zpHzvOmWfJ2hGl7iKnZ9PBW4FGRdwMTSdY1Jwdqvn1v6Di+8iD5
         T3sS8fLIjPFqQHwSGRwKRs7/Rzo5jO8pVGRubu20MdjrLd+0iMosX4jIvcF3nzVoXAcf
         hdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788479795; x=1789084595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MFGytssX5xYfgUs57Q55SXrdDTErkoIleyvcFFl1lvo=;
        b=XqINxt6Qwrzy1csibLULJ00cYCWPfOddlky0LoPvaVGbnYBH8wgu8AtnF0WvJ+OoQy
         uw5LnQaOxK5hib7mHCDGD4kGT/RhCZlc59s628fU9ii+tjS+/FqOoOyH/Q5PQcBpCoc6
         qSz8HX+RG6h99HefGNVDiCh8kNK1eUi+fRCdKtK15Yeea4RjpDUqJuFrFkaU/Uvq9WGX
         b6T4go9f5noJmcewl0W3PbPFCQRLama9oiGjFmNQsH7yKiiOSLbJEhaHplTFXGs5/59Z
         b2sBXjGCTmtVe4FkUN64082dgmnEZ//i344vWRrtuEthtWLhvSxg+dHchxBBljjtIsKr
         xFXw==
X-Forwarded-Encrypted: i=1; AKwUvByvGsCyC1P+z/cygU2mZlcljXW/Rwj4WUVEZz0SA+Uic5KFrftaqtsOCa6lkNFBlp0dOretyGLt7RR+/gQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m5usMVY29dAoaoT22o3g8+c4L68uWtpRq/iufSVWLqxUZcNA6l
	+WlzLPjRcHfBF3nnTvUdescO8aswGK4fuMZ2qTBG1AwfSOKmip6A6vaw
X-Gm-Gg: AYBFou0MbVIDaUUs4bO+wUwOSbAIImGs6P5WtLMDK30TW1pmDp194f62CQ2rv9Mm+6J
	ZAGi6csQBTtziNW1EJk8SQ1UsjcfdGd+gmOasSrz0UZUyvJotpJHuJlQP/P7B9usNx0rcOSCJbm
	vJ9AOxk2R2SQZB0WEoLp4CiWQ7yQsq3AoLstyU/i1KYzDqbqWN7GCy2tskIUItdeIW4OHNRuaSv
	Kr436uWzzKwj65YImwEhGpD9BdDMiycyMl7YGoUI0oYLVvYjopfcrzFVpzkLM5e4TP4btTixHuD
	em88UUzffob7pKD6OFQG3yeE8gkh5CgvViPpOlciMyPrgm5Xupyq6KF4p/KOrNfAXs5EJ+0Gko8
	X02a9UdkVjepYE6nlynHWGjUfFGreswxdKpoHExoSQg1Sz47jcsBNQhOruGrxzThHahgZeVH6uH
	d1Qf8c4+N2hhZNFvjsUewPnqxvq+6iqVey4WwOBLoV2kiWRBCZy14PYs4/F8+P3Z9hfg==
X-Received: by 2002:a17:90b:1d45:b0:398:9bd4:d1a with SMTP id 98e67ed59e1d1-39b262995b8mr3063563a91.25.1788479795047;
        Thu, 03 Sep 2026 16:56:35 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:29c4:4984:db20:3bb4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm1997386eec.27.2026.09.03.16.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 16:56:34 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 08/11] f2fs: parameterize sector conversion macros
Date: Thu,  3 Sep 2026 16:56:20 -0700
Message-ID: <534c0147c80d739938e90cc9f1c349fc9ae3f6fd.1788479509.git.zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788479509.git.zhangxp1998@gmail.com>
References: <cover.1788479509.git.zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 460d95c9414c..c8716926aee1 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -439,7 +439,7 @@ struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
 	}
 
 	if (sector)
-		*sector = SECTOR_FROM_BLOCK(blk_addr);
+		*sector = SECTOR_FROM_BLOCK(sbi, blk_addr);
 	return bdev;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 06ac655a16e9..0de36ae0795d 100644
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
@@ -2815,7 +2816,7 @@ static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
 						struct inode *inode,
 						block_t count)
 {
-	blkcnt_t sectors = count << F2FS_LOG_SECTORS_PER_BLOCK;
+	blkcnt_t sectors = count << F2FS_LOG_SECTORS_PER_BLOCK(sbi);
 
 	spin_lock(&sbi->stat_lock);
 	if (unlikely(sbi->total_valid_block_count < count)) {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index edc352569e87..6c29a18b9fbd 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4506,8 +4506,8 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
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
index 79c0a1301996..aa22e457d5b3 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -221,11 +221,11 @@ static bool sanity_check_compress_inode(struct inode *inode,
 		return false;
 	}
 	if (le64_to_cpu(ri->i_compr_blocks) >
-			SECTOR_TO_BLOCK(inode->i_blocks)) {
+			SECTOR_TO_BLOCK(sbi, inode->i_blocks)) {
 		f2fs_warn(sbi,
 			"%s: inode (ino=%llx) has inconsistent i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
 			__func__, inode->i_ino, le64_to_cpu(ri->i_compr_blocks),
-			SECTOR_TO_BLOCK(inode->i_blocks));
+			SECTOR_TO_BLOCK(sbi, inode->i_blocks));
 		return false;
 	}
 	if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
@@ -447,7 +447,8 @@ static int do_read_inode(struct inode *inode)
 	i_gid_write(inode, le32_to_cpu(ri->i_gid));
 	set_nlink(inode, le32_to_cpu(ri->i_links));
 	inode->i_size = le64_to_cpu(ri->i_size);
-	inode->i_blocks = SECTOR_FROM_BLOCK(le64_to_cpu(ri->i_blocks) - 1);
+	inode->i_blocks = SECTOR_FROM_BLOCK(sbi,
+			le64_to_cpu(ri->i_blocks) - 1);
 
 	inode_set_atime(inode, le64_to_cpu(ri->i_atime),
 			le32_to_cpu(ri->i_atime_nsec));
@@ -696,6 +697,7 @@ struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino)
 
 void f2fs_update_inode(struct inode *inode, struct folio *node_folio)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_inode *ri;
 	struct extent_tree *et = fi->extent_tree[EX_READ];
@@ -712,7 +714,8 @@ void f2fs_update_inode(struct inode *inode, struct folio *node_folio)
 	ri->i_uid = cpu_to_le32(i_uid_read(inode));
 	ri->i_gid = cpu_to_le32(i_gid_read(inode));
 	ri->i_links = cpu_to_le32(inode->i_nlink);
-	ri->i_blocks = cpu_to_le64(SECTOR_TO_BLOCK(READ_ONCE(inode->i_blocks)) + 1);
+	ri->i_blocks = cpu_to_le64(SECTOR_TO_BLOCK(sbi,
+					   READ_ONCE(inode->i_blocks)) + 1);
 
 	if (!f2fs_is_atomic_file(inode) ||
 			is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7bf8fa992600..c6adeeae9194 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1310,7 +1310,7 @@ static void __submit_zone_reset_cmd(struct f2fs_sb_info *sbi,
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
@@ -1518,7 +1518,7 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
 	struct discard_info di = {0};
 	struct rb_node **insert_p = NULL, *insert_parent = NULL;
 	unsigned int max_discard_blocks =
-			SECTOR_TO_BLOCK(bdev_max_discard_sectors(bdev));
+			SECTOR_TO_BLOCK(sbi, bdev_max_discard_sectors(bdev));
 	block_t end = lstart + len;
 
 	dc = __lookup_discard_cmd_ret(&dcc->root, lstart,
@@ -2041,8 +2041,8 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 
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
@@ -114,10 +114,10 @@ f2fs_start_segno(struct f2fs_sb_info *sbi, unsigned int segno)
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
  * In the victim_sel_policy->alloc_mode, there are three block allocation modes.
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4c95229ac3f1..0bd6df924a97 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3944,7 +3944,7 @@ static int __f2fs_commit_super(struct f2fs_sb_info *sbi, struct folio *folio,
 	bio = bio_alloc(sbi->sb->s_bdev, 1, opf, GFP_NOFS);
 
 	/* it doesn't need to set crypto context for superblock update */
-	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(folio->index);
+	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(sbi, folio->index);
 
 	if (!bio_add_folio(bio, folio, folio_size(folio), 0))
 		f2fs_bug_on(sbi, 1);
@@ -4519,7 +4519,7 @@ static int f2fs_report_zone_cb(struct blk_zone *zone, unsigned int idx,
 {
 	struct f2fs_report_zones_args *rz_args = data;
 	block_t unusable_blocks = (zone->len - zone->capacity) >>
-					F2FS_LOG_SECTORS_PER_BLOCK;
+					F2FS_LOG_SECTORS_PER_BLOCK(rz_args->sbi);
 
 	if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
 		return 0;
@@ -4562,10 +4562,10 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 
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
index e98bff846b23..33995cd3dd6d 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -14,7 +14,7 @@
 #define F2FS_SUPER_OFFSET		1024	/* byte-size offset */
 #define F2FS_MIN_LOG_SECTOR_SIZE	9	/* 9 bits for 512 bytes */
 #define F2FS_MAX_LOG_SECTOR_SIZE	PAGE_SHIFT	/* Max is Block Size */
-#define F2FS_LOG_SECTORS_PER_BLOCK	(PAGE_SHIFT - 9) /* log number for sector/blk */
+#define F2FS_LOG_SECTORS_PER_BLOCK(sbi)	((sbi)->log_blocksize - 9) /* log number for sector/blk */
 #define F2FS_MIN_LOG_BLOCKSIZE		12
 #define F2FS_MIN_BLKSIZE		4096UL
 #define F2FS_BLKSIZE			PAGE_SIZE /* support only block == page */
-- 
2.53.0

