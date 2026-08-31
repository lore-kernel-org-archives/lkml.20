Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC9E3CE48F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195744; cv=pass; b=B1iZF/E15cpiDFDRuUgstKebnvFjMFyCjKwJOBfS1ZfUlZIpMDHnLFDVKDm8mSabi6bubqAcNHfTUjCT+0vDgzDrGB/YQHDx9OW3icYnCEym0IfBHbfB1s8QeW73c/tzCi9Ko5TMYXLD7ywUE096i8wXxvcGok0+FoWYBATXqG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195744; c=relaxed/simple;
	bh=LwkNEZNS3n4XrPO4aPp3xwZH1tCkEtoJpNFfuxleVVc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oy8m6DDT74y8JxWAIJuOa+1t2aa6W1fc9ZAbtHPDtFpj75H7/sYtfFMEMPff6oUgWrA2m5oBYRMxFM++Za6fT+IcqJ4cAaKm23jxhER+9ADdsP/bBL80PuJ6pkRdeTREZDvm5I59E3ZZNUKGOQAaMo1LPVQh1OFdc+4vqvxKMMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9EY+Abw; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9EY+Abw"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a5ded53570so5412675a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195740; cv=none;
        d=google.com; s=arc-20260327;
        b=acGj5XqZXNwtVsWsqrWIdOhpMk6Z5O+2byAhitya2O4Yluocq+ZJpuVsy6v/qu5z0p
         XbFMyXypnzS1Sn+wenLnCcVP2Wip2h4GTDpAlOxNp/Z+WzGPExS4Gs+lRgtFavF2EKzR
         tHzKHb3XXtz6uNbjMc/7jXcQW5wcuDSs7ijCqGTWcN27Ed9EO3gLNKk+QFQSLL2bEngs
         D+kddrvRbH5N216y+/zvBMs0LHQuSI4M8+JyMa00KASUAf1T05GfYSlDzJx/L/yZkLvC
         OlyvcuJ+atno2UY0L6gfAHSkz1P7hkhfARf2Ano7YoRhwZl8ZJY2HVBPYh8w6sE77zbk
         s3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=teJG0g7hnXcKnDzhThesv9by/6HQHdAle5mTs9kt9nQ=;
        fh=IXQ2Y2pKrzCnUMM9g3Q37+SA/lbFrHIzKEMHa+ghlv0=;
        b=my8jIau4N9N8A7JISKw1Lqsf8nVUvqdn8b3toFnSznjRa3jOOtPwtQVFnaQQUHWG0k
         dOfnOuPmWVJnUlcLfDK28AdEbYFxtakBPZXkNE58EVrP+/8BcG7gxIVeLTsu6dP4PhCG
         +TqCkll45SgVX5TkkeK0mUlSSNndYeynsOWWHV2VPtYeXUuF8OyZKGjQecO7imaz6NxJ
         ET27KedRKl8kQLuMvWbN6jBvv6edSdCrntB39fvSXcQh0g/CevZb9GyYdZGrzmyR3T+Z
         wi4OgrJBYY9LjC4lxQexL93BN1bfnxwlsz3znysRITxMUrAoMmdSk+foxyBKrhDGM9wA
         iTuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788195740; x=1788800540; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=teJG0g7hnXcKnDzhThesv9by/6HQHdAle5mTs9kt9nQ=;
        b=g9EY+AbwAFx62Qdq2skmVmunFMQlfk6o7F40ZgMX7sWgs9r72kBvKfoyqj7uA+ZxvZ
         HsOQEx6/3IoMfgW3NcKDg0AE5GxfqZy7Tnu/zkG/LL+pn2pkZmUeYAo9StBD/9bwcGb9
         xyI4ZtGMeGs7/0fDlMQcdN6Rqbbpb0IBLSy4jSWaMpNeOr5EVpfZZekZ/wbgZOCcrcbh
         Hz8y50zMIPpzylfxYuuc2YWX/u71D3a8Vmz3UhheK258sMx4EE3i+Fc5EoITQeSzLyRZ
         My4GpXiaJMxZGaeU+TBMyN3IiwQOIsMRXn9Z/xd2EiWP6TMg+X0MspjhnyFyZu6t/z2k
         uiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195740; x=1788800540;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teJG0g7hnXcKnDzhThesv9by/6HQHdAle5mTs9kt9nQ=;
        b=K+W+wnNXHWroP8EIcUmeNyKIWmhqyjlDscm38/X3Y/m7zZCE9kRnHZO9sK+F35ujQK
         c3tVwD/j2lkLPXjghQxehaA3mMu/qC286AAsKyGzX/MFu6AE8REC2zUZiqeyYfb7d/Z2
         4II/74w28Ka4fAGnM79wrPDY1cyDLJA0mh2Qv8ZvwEHykoaQYnr1ikZooFu0GMuJ6aeY
         s1SwMF+c2bLM+dLBAVKHzQVAmCnx4/sxAUYMji76aV17hkMpa1x/gji6S188JABR9cea
         6BSdazl5jaZA+YmTLz0OTrCUi5RqU+Kgh456Ua5W5cGcNr8wNrOyce4BvU2vdBN6F19n
         wAiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwi74ZOYuba2GoZBREaunQDkKJD+mpcB7ABDT7039tpsA6iN0pUNq3vPPlV/zixPopRiq3iOmIuPa//wL8=@vger.kernel.org
X-Gm-Message-State: AFuF++kqK2QYg3QKe1ODD1KV2o2GOBViBbFlNKJsv9DxrwYvvrfuSUEH
	7re6uNWLwNWXM2B/p97Lwm8iq1lT29QFErq9MVjUNp/utoUtvGZn3Rm0mqWK6oRQKxMOCkpTIHk
	NwUM8KicQFBsksJwudYPKR2tKrH+ZzW4=
X-Gm-Gg: AYBFou33qONWeOzptarPI8TrPNyD2TuxNQo2mNtN6ysMOUPC6eIziJ/XCQb9UEXON33
	1r7KVVH0ZkdqDuea6yy1rQwU20uuTYROiYwuR5ioA4foZw5XjX8AjTWWZHUv5Gxiv8wOS9cfPr6
	GGDpt8Pzfubay8yduINuy+ibGZu2PwIyaxTCMsVIZF9WfxdiFtQE7s381eekd+7I870TTczn8CG
	wXpHYdpIu9vIGiAIvgg6gIewvOrNfK/KFibDq+GUD+WJGT3UX86gi7MsWfvaCeyB/xxt4tRrS6s
	shiu6+L4YGiBXJDi4BEX2Qs4Zp379M8JwcygDg4HNbYaCuBjfkHDYXJavKA0+D0fH+ginGWMXw6
	jJlY=
X-Received: by 2002:a05:6402:44d7:b0:6a3:87b7:b5a9 with SMTP id
 4fb4d7f45d1cf-6a60d3b4e36mr13066477a12.12.1788195739867; Mon, 31 Aug 2026
 10:02:19 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 17:02:19 +0000
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 17:02:19 +0000
From: Kelvin Zhang <zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAH=xXfHWPg6qRwW+N2ziH1cvG3OD3wJc1z_Tm04MtFCpqYmQFg@mail.gmail.com>
References: <CAH=xXfHWPg6qRwW+N2ziH1cvG3OD3wJc1z_Tm04MtFCpqYmQFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 17:02:19 +0000
X-Gm-Features: AcwNN1Xi0qvK__iKs1OGoOeUZnFVYZx4O_pVp3wZ4FKlQ3H9KUcUJdc3IQXeQKs
Message-ID: <CAH=xXfETWeSSEsKEFcZBqFBhxsfG4gPCeVOYPnGC0wraY7y_+w@mail.gmail.com>
Subject: [PATCH v4 08/11] f2fs: parameterize sector conversion macros
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
