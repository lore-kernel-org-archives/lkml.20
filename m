Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14C027A92D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788479800; cv=none; b=NGgNcZpbt0TJ1CZakuVOhu6yT6bhOkQC6qXqGb6ghbKJKWYp2DFDW2iAvOOtfgqw35Wv2+IxQvqW+RXXfAQHeYmtFL3P5ex4e0DxeSY0Aja4z+6PYPK/i+SYzRoY0s2ivtTgyfR86BlVL9uNj6oaF+c1cUfHP5EsVTHfZ3KggtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788479800; c=relaxed/simple;
	bh=gODfPG2HdHktrlVtg7ms+FRdmMTtRU215fGhul/y3V4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQeVXM7DCoc0cUvGZ9HHhLb/euh/0oIyFUwNRg5gRGAVcIAR4brptFfRn78jYs1D6cDPnyn9cbs66xjpTl3H59MAHtqyjwCwRhSyJT/182mfTUo3F7qR/1YWWaLgnFPWlEkgbGZkXIlcI3vusMhQ091yuU8lVHsaMcfev44TDcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bO172Ofz; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bO172Ofz"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d71ae3455aso5846085ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788479797; x=1789084597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0WqqHY1bFKVz896PwW4TtV+Us1aSvJ/ISPE7i5Zph8=;
        b=bO172OfzjSEOt+gLe19jp/jhl+UFn/Ml9ZSK4HUbLaaV+m1XUv4FduoOjzmorVuueS
         xBFl2/ZdCA8ianB1V6PAju/U47ef09dv4ZIr4R5Vau4Lh9RPxntAD6Cz/dh9QVKb/8fq
         tj+fLgFSiqeEw/8vakTAbx2/6VJFoI0DIWZ0Nq3uDxdpqQjCWAWozLcsDk0ZbSa+ppG2
         kSg+YouXcNKf5soCDAWd6K/LxwJ6sf7dsLDTV3eBhFSVnvNIGeL1vqOI/uVUrYMQPtQe
         iTODlDUEqwMilKQtQs9i/vlnMvFW6YR4H+jvFVSYci0VERKOtT0OHgLr0BCPscgVZbXT
         VWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788479797; x=1789084597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R0WqqHY1bFKVz896PwW4TtV+Us1aSvJ/ISPE7i5Zph8=;
        b=bQGclUoG7whLbKXFm3hIiH4802fmkr3H6oOeoMp4TtZ0ebqTf8U7Z4hzxp7KLJuSDH
         +4U3f/jbOWiSDWs0/7xvPXHXQQsRdGFUtTAp3tFGzFIWHfNGVGlzrUC/fNcHx40hlooE
         DoVI4am9ZvwMFP+QMXBPJJIAPsCfxJUPxnDkMApCg/dePyymVAA96cT/n/LjtX9dTeOb
         qZR9saRcPNgEBY+WpN/7/ehBnewdQzY/MWNAkyKZZANx9O8hD1hrPWL4LIve/RpLf4RP
         Z2QJJH/y5Mn/DOCUHUXe3Bk57EP2R2ODAEqpv/3QtdHfMNiVMdDBl5U5bGpXl3zTcLEZ
         Nh5g==
X-Forwarded-Encrypted: i=1; AKwUvBywAX6VE8dqyKYiEgKS9eni/KLb9eVsINowvCmUGgGUQ+F6HdbY53fapDQ0eQpox+o5//2iJioV29D9k88=@vger.kernel.org
X-Gm-Message-State: AFuF++mUllaU/cQP+0CjXGa+sQ5aOl67MybkrQA5NaVwDbqpIlUPVgUG
	RFprN8MdiaewAbPpEhgBdQ5Lpgp1RbGYu9B4OETWflEmUTe4tZM5z4b2
X-Gm-Gg: AYBFou07RB4E9wsGmXCnxCJccRxnGn4dNOPFPdplcJdAkDLlr3wA4Jj+j1rKNGttFuY
	AEdisEbGqO0/9oJ9GMaIdYS5JJeMFbjs5r2ZDaaNSRXMIZgmnaW0QIIiuZUaT/ijJZVa/7t/erR
	jEmegkoLqSXYQk7WPg4FxUs+5+4wiPGqzNyLsnb4NK7qk7p5f+awOmmC2fMy27KUHex2Mju5+4h
	+L+l7d5W4SOaYnYIpE/t3lbQ6RmJiO8Rd7McQJ6VXKd5th9zIyxw3fVdA1CLcYYHfSn1IyWqeO2
	fP0A4hIv2fC0sWCm3VV+U7vBSXJx1PbsIgTPtyvjnfFBSaheQf8d6ir7q+2XY2NKkQaud0i7yTD
	oiRaTrAQufFqxRYZZSFcV35+M2C3cM23ErYBPPQs+8eW2NR1sLNpc0kXfSe1IV8nNOqENUZWlw9
	1z0U1nG4lQ7SZjsz67WIWMVGWcAEktxlqW2kRXV0rF9X7xUUmiReSt0ot6K95C9gkcfA==
X-Received: by 2002:a17:903:468d:b0:2d9:56d8:75f with SMTP id d9443c01a7336-2db1266772dmr39257205ad.9.1788479796724;
        Thu, 03 Sep 2026 16:56:36 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:29c4:4984:db20:3bb4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm2206021eec.21.2026.09.03.16.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 16:56:36 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 09/11] f2fs: parameterize byte and block conversion macros
Date: Thu,  3 Sep 2026 16:56:21 -0700
Message-ID: <7b563b3096652abe81f77edc886ab98c416f189f.1788479509.git.zhangxp1998@gmail.com>
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

Byte-to-block and block-to-byte conversion helpers previously relied on
global PAGE_SIZE, PAGE_SHIFT, or F2FS_BLKSIZE_BITS.

Parameterize F2FS_BYTES_TO_BLK, F2FS_BLK_TO_BYTES, F2FS_BLK_END_BYTES,
F2FS_BLK_ALIGN, and max_file_blocks with struct f2fs_sb_info *sbi using
sbi->log_blocksize.

Update all call sites across data mapping, file operations, fiemap queries,
fsverity checks, NAT bitmap allocations, and truncate paths.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/checkpoint.c    |  2 +-
 fs/f2fs/data.c          | 58 +++++++++++++++++++++++------------------
 fs/f2fs/debug.c         |  2 +-
 fs/f2fs/f2fs.h          |  7 ++---
 fs/f2fs/file.c          | 54 +++++++++++++++++++++-----------------
 fs/f2fs/node.c          |  7 ++---
 fs/f2fs/recovery.c      |  4 +--
 fs/f2fs/segment.c       |  9 ++++---
 fs/f2fs/super.c         |  9 ++++---
 fs/f2fs/verity.c        |  6 +++--
 include/linux/f2fs_fs.h | 13 ++++++---
 11 files changed, 97 insertions(+), 74 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index c7183d4b6765..4d1a0544bbf0 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1858,7 +1858,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		blk = start_blk + BLKS_PER_SEG(sbi) - nm_i->nat_bits_blocks;
 		for (i = 0; i < nm_i->nat_bits_blocks; i++)
 			f2fs_update_meta_page(sbi, nm_i->nat_bits +
-					F2FS_BLK_TO_BYTES(i), blk + i);
+					F2FS_BLK_TO_BYTES(sbi, i), blk + i);
 	}
 
 	/* write out checkpoint buffer at block 0 */
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c8716926aee1..a4006b92da55 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1942,12 +1942,12 @@ static bool __f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len,
 	if (pos + len > i_size_read(inode))
 		return false;
 
-	map.m_lblk = F2FS_BYTES_TO_BLK(pos);
+	map.m_lblk = F2FS_BYTES_TO_BLK(F2FS_I_SB(inode), pos);
 	map.m_next_pgofs = NULL;
 	map.m_next_extent = NULL;
 	map.m_seg_type = NO_CHECK_TYPE;
 	map.m_may_create = false;
-	last_lblk = F2FS_BLK_ALIGN(pos + len);
+	last_lblk = F2FS_BLK_ALIGN(F2FS_I_SB(inode), pos + len);
 
 	while (map.m_lblk < last_lblk) {
 		map.m_len = last_lblk - map.m_lblk;
@@ -1990,7 +1990,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 			return err;
 		}
 
-		phys = F2FS_BLK_TO_BYTES(ni.blk_addr);
+		phys = F2FS_BLK_TO_BYTES(sbi, ni.blk_addr);
 		offset = offsetof(struct f2fs_inode, i_addr) +
 					sizeof(__le32) * (DEF_ADDRS_PER_INODE(sbi) -
 					get_inline_xattr_addrs(inode));
@@ -2024,7 +2024,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 			return err;
 		}
 
-		phys = F2FS_BLK_TO_BYTES(ni.blk_addr);
+		phys = F2FS_BLK_TO_BYTES(sbi, ni.blk_addr);
 		len = inode->i_sb->s_blocksize;
 
 		f2fs_folio_put(folio, true);
@@ -2043,6 +2043,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		u64 start, u64 len)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_map_blocks map;
 	sector_t start_blk, last_blk, blk_len, max_len;
 	pgoff_t next_pgofs;
@@ -2066,7 +2067,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 
 	inode_lock_shared(inode);
 
-	maxbytes = F2FS_BLK_TO_BYTES(max_file_blocks(inode));
+	maxbytes = F2FS_BLK_TO_BYTES(sbi, max_file_blocks(sbi, inode));
 	if (start > maxbytes) {
 		ret = -EFBIG;
 		goto out;
@@ -2086,10 +2087,10 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 			goto out;
 	}
 
-	start_blk = F2FS_BYTES_TO_BLK(start);
-	last_blk = F2FS_BYTES_TO_BLK(start + len - 1);
+	start_blk = F2FS_BYTES_TO_BLK(sbi, start);
+	last_blk = F2FS_BYTES_TO_BLK(sbi, start + len - 1);
 	blk_len = last_blk - start_blk + 1;
-	max_len = F2FS_BYTES_TO_BLK(maxbytes) - start_blk;
+	max_len = F2FS_BYTES_TO_BLK(sbi, maxbytes) - start_blk;
 
 next:
 	memset(&map, 0, sizeof(map));
@@ -2111,7 +2112,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	if (!compr_cluster && !(map.m_flags & F2FS_MAP_FLAGS)) {
 		start_blk = next_pgofs;
 
-		if (F2FS_BLK_TO_BYTES(start_blk) < maxbytes)
+		if (F2FS_BLK_TO_BYTES(sbi, start_blk) < maxbytes)
 			goto prep_next;
 
 		flags |= FIEMAP_EXTENT_LAST;
@@ -2159,14 +2160,14 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	} else if (compr_appended) {
 		unsigned int appended_blks = cluster_size -
 						count_in_cluster + 1;
-		size += F2FS_BLK_TO_BYTES(appended_blks);
+		size += F2FS_BLK_TO_BYTES(sbi, appended_blks);
 		start_blk += appended_blks;
 		compr_cluster = false;
 	} else {
-		logical = F2FS_BLK_TO_BYTES(start_blk);
+		logical = F2FS_BLK_TO_BYTES(sbi, start_blk);
 		phys = __is_valid_data_blkaddr(map.m_pblk) ?
-			F2FS_BLK_TO_BYTES(map.m_pblk) : 0;
-		size = F2FS_BLK_TO_BYTES(map.m_len);
+			F2FS_BLK_TO_BYTES(sbi, map.m_pblk) : 0;
+		size = F2FS_BLK_TO_BYTES(sbi, map.m_len);
 		flags = 0;
 
 		if (compr_cluster) {
@@ -2180,7 +2181,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 			flags = FIEMAP_EXTENT_UNWRITTEN;
 		}
 
-		start_blk += F2FS_BYTES_TO_BLK(size);
+		start_blk += F2FS_BYTES_TO_BLK(sbi, size);
 	}
 
 prep_next:
@@ -2200,7 +2201,8 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 static inline loff_t f2fs_readpage_limit(struct inode *inode)
 {
 	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
-		return F2FS_BLK_TO_BYTES(max_file_blocks(inode));
+		return F2FS_BLK_TO_BYTES(F2FS_I_SB(inode),
+				max_file_blocks(F2FS_I_SB(inode), inode));
 
 	return i_size_read(inode);
 }
@@ -2228,7 +2230,8 @@ static int f2fs_read_single_page(struct inode *inode, struct fsverity_info *vi,
 
 	block_in_file = (sector_t)index;
 	last_block = block_in_file + nr_pages;
-	last_block_in_file = F2FS_BYTES_TO_BLK(f2fs_readpage_limit(inode) +
+	last_block_in_file = F2FS_BYTES_TO_BLK(F2FS_I_SB(inode),
+				f2fs_readpage_limit(inode) +
 							blocksize - 1);
 	if (last_block > last_block_in_file)
 		last_block = last_block_in_file;
@@ -2339,7 +2342,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 
 	f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
 
-	last_block_in_file = F2FS_BYTES_TO_BLK(f2fs_readpage_limit(inode) +
+	last_block_in_file = F2FS_BYTES_TO_BLK(sbi,
+				f2fs_readpage_limit(inode) +
 							blocksize - 1);
 
 	/* get rid of pages beyond EOF */
@@ -4161,7 +4165,7 @@ static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
 		filemap_write_and_wait(mapping);
 
 	/* Block number less than F2FS MAX BLOCKS */
-	if (unlikely(block >= max_file_blocks(inode)))
+	if (unlikely(block >= max_file_blocks(F2FS_I_SB(inode), inode)))
 		goto out;
 
 	if (f2fs_compressed_file(inode)) {
@@ -4277,7 +4281,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
 	 * to be very smart.
 	 */
 	cur_lblock = 0;
-	last_lblock = F2FS_BYTES_TO_BLK(i_size_read(inode));
+	last_lblock = F2FS_BYTES_TO_BLK(sbi, i_size_read(inode));
 
 	while (cur_lblock < last_lblock && cur_lblock < sis->max) {
 		struct f2fs_map_blocks map;
@@ -4532,12 +4536,14 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 			    unsigned int flags, struct iomap *iomap,
 			    struct iomap *srcmap)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_map_blocks map = { NULL, };
 	pgoff_t next_pgofs = 0;
 	int err;
 
-	map.m_lblk = F2FS_BYTES_TO_BLK(offset);
-	map.m_len = F2FS_BYTES_TO_BLK(offset + length - 1) - map.m_lblk + 1;
+	map.m_lblk = F2FS_BYTES_TO_BLK(sbi, offset);
+	map.m_len = F2FS_BYTES_TO_BLK(sbi, offset + length - 1) -
+							map.m_lblk + 1;
 	map.m_next_pgofs = &next_pgofs;
 	map.m_seg_type = f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
 						inode->i_write_hint);
@@ -4558,7 +4564,7 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if (err)
 		return err;
 
-	iomap->offset = F2FS_BLK_TO_BYTES(map.m_lblk);
+	iomap->offset = F2FS_BLK_TO_BYTES(sbi, map.m_lblk);
 
 	/*
 	 * Sometimes I/O to an encrypted file has to be broken up to guarantee
@@ -4578,11 +4584,11 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		if (WARN_ON_ONCE(map.m_pblk == NEW_ADDR))
 			return -EINVAL;
 
-		iomap->length = F2FS_BLK_TO_BYTES(map.m_len);
+		iomap->length = F2FS_BLK_TO_BYTES(sbi, map.m_len);
 		iomap->type = IOMAP_MAPPED;
 		iomap->flags |= IOMAP_F_MERGED;
 		iomap->bdev = map.m_bdev;
-		iomap->addr = F2FS_BLK_TO_BYTES(map.m_pblk);
+		iomap->addr = F2FS_BLK_TO_BYTES(sbi, map.m_pblk);
 
 		if (flags & IOMAP_WRITE && map.m_last_pblk)
 			iomap->private = (void *)map.m_last_pblk;
@@ -4591,11 +4597,11 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 			return -ENOTBLK;
 
 		if (map.m_pblk == NULL_ADDR) {
-			iomap->length = F2FS_BLK_TO_BYTES(next_pgofs) -
+			iomap->length = F2FS_BLK_TO_BYTES(sbi, next_pgofs) -
 							iomap->offset;
 			iomap->type = IOMAP_HOLE;
 		} else if (map.m_pblk == NEW_ADDR) {
-			iomap->length = F2FS_BLK_TO_BYTES(map.m_len);
+			iomap->length = F2FS_BLK_TO_BYTES(sbi, map.m_len);
 			iomap->type = IOMAP_UNWRITTEN;
 		} else {
 			f2fs_bug_on(F2FS_I_SB(inode), 1);
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 5980b9d79afb..a6cfceafe2fe 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -343,7 +343,7 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 	/* build nm */
 	si->base_mem += sizeof(struct f2fs_nm_info);
 	si->base_mem += __bitmap_size(sbi, NAT_BITMAP);
-	si->base_mem += F2FS_BLK_TO_BYTES(NM_I(sbi)->nat_bits_blocks);
+	si->base_mem += F2FS_BLK_TO_BYTES(sbi, NM_I(sbi)->nat_bits_blocks);
 	si->base_mem += NM_I(sbi)->nat_blocks *
 				f2fs_bitmap_size(NAT_ENTRY_PER_BLOCK(sbi));
 	si->base_mem += NM_I(sbi)->nat_blocks / 8;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0de36ae0795d..c0bccc763e70 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4021,7 +4021,7 @@ void f2fs_inode_synced(struct inode *inode);
 int f2fs_dquot_initialize(struct inode *inode);
 int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
 int f2fs_do_quota_sync(struct super_block *sb, int type);
-loff_t max_file_blocks(struct inode *inode);
+loff_t max_file_blocks(struct f2fs_sb_info *sbi, struct inode *inode);
 void f2fs_quota_off_umount(struct super_block *sb);
 void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag);
 void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
@@ -5267,8 +5267,9 @@ static inline void f2fs_truncate_meta_inode_pages(struct f2fs_sb_info *sbi,
 							NULL, 0, DATA);
 
 	truncate_inode_pages_range(META_MAPPING(sbi),
-			F2FS_BLK_TO_BYTES((loff_t)blkaddr),
-			F2FS_BLK_END_BYTES((loff_t)(blkaddr + cnt - 1)));
+			F2FS_BLK_TO_BYTES(sbi, (loff_t)blkaddr),
+			F2FS_BLK_END_BYTES(sbi,
+					    (loff_t)(blkaddr + cnt - 1)));
 }
 
 static inline void f2fs_invalidate_internal_cache(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6c29a18b9fbd..5892247b3622 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -513,7 +513,8 @@ static bool __found_offset(struct address_space *mapping,
 static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 {
 	struct inode *inode = file->f_mapping->host;
-	loff_t maxbytes = F2FS_BLK_TO_BYTES(max_file_blocks(inode));
+	loff_t maxbytes = F2FS_BLK_TO_BYTES(F2FS_I_SB(inode),
+			max_file_blocks(F2FS_I_SB(inode), inode));
 	struct dnode_of_data dn;
 	pgoff_t pgofs, end_offset;
 	loff_t data_ofs = offset;
@@ -537,9 +538,10 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 		}
 	}
 
-	pgofs = (pgoff_t)(offset >> PAGE_SHIFT);
+	pgofs = F2FS_BYTES_TO_BLK(F2FS_I_SB(inode), offset);
 
-	for (; data_ofs < isize; data_ofs = (loff_t)pgofs << PAGE_SHIFT) {
+	for (; data_ofs < isize;
+			data_ofs = F2FS_BLK_TO_BYTES(F2FS_I_SB(inode), pgofs)) {
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
 		err = f2fs_get_dnode_of_data(&dn, pgofs, LOOKUP_NODE);
 		if (err && err != -ENOENT) {
@@ -559,7 +561,7 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 		/* find data/hole in dnode block */
 		for (; dn.ofs_in_node < end_offset;
 				dn.ofs_in_node++, pgofs++,
-				data_ofs = (loff_t)pgofs << PAGE_SHIFT) {
+				data_ofs = F2FS_BLK_TO_BYTES(F2FS_I_SB(inode), pgofs)) {
 			block_t blkaddr;
 
 			blkaddr = f2fs_data_blkaddr(&dn);
@@ -595,7 +597,8 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 static loff_t f2fs_llseek(struct file *file, loff_t offset, int whence)
 {
 	struct inode *inode = file->f_mapping->host;
-	loff_t maxbytes = F2FS_BLK_TO_BYTES(max_file_blocks(inode));
+	loff_t maxbytes = F2FS_BLK_TO_BYTES(F2FS_I_SB(inode),
+			max_file_blocks(F2FS_I_SB(inode), inode));
 
 	switch (whence) {
 	case SEEK_SET:
@@ -846,9 +849,9 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		goto out_err;
 	}
 
-	free_from = (pgoff_t)F2FS_BLK_ALIGN(from);
+	free_from = (pgoff_t)F2FS_BLK_ALIGN(sbi, from);
 
-	if (free_from >= max_file_blocks(inode))
+	if (free_from >= max_file_blocks(sbi, inode))
 		goto free_partial;
 
 	if (lock)
@@ -959,9 +962,10 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
 
 int f2fs_truncate(struct inode *inode)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int err;
 
-	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
+	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 
 	if (!(S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode) ||
@@ -970,7 +974,7 @@ int f2fs_truncate(struct inode *inode)
 
 	trace_f2fs_truncate(inode);
 
-	if (time_to_inject(F2FS_I_SB(inode), FAULT_TRUNCATE))
+	if (time_to_inject(sbi, FAULT_TRUNCATE))
 		return -EIO;
 
 	err = f2fs_dquot_initialize(inode);
@@ -986,8 +990,8 @@ int f2fs_truncate(struct inode *inode)
 			 * leak in evict() path.
 			 */
 			truncate_inode_pages_range(inode->i_mapping,
-					F2FS_BLK_TO_BYTES(0),
-					F2FS_BLK_END_BYTES(0));
+					F2FS_BLK_TO_BYTES(sbi, 0),
+					F2FS_BLK_END_BYTES(sbi, 0));
 			return err;
 		}
 	}
@@ -1157,7 +1161,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			return -EOPNOTSUPP;
 		if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED) &&
 			!IS_ALIGNED(attr->ia_size,
-			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
+			F2FS_BLK_TO_BYTES(sbi, fi->i_cluster_size)))
 			return -EINVAL;
 
 		if (f2fs_is_pinned_file(inode)) {
@@ -1173,7 +1177,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			 * pinned file.
 			 */
 			else if (!IS_ALIGNED(attr->ia_size,
-				F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
+				F2FS_BLK_TO_BYTES(sbi, CAP_BLKS_PER_SEC(sbi))))
 				return -EINVAL;
 		}
 	}
@@ -2644,7 +2648,8 @@ static int f2fs_keep_noreuse_range(struct inode *inode,
 				loff_t offset, loff_t len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	u64 max_bytes = F2FS_BLK_TO_BYTES(max_file_blocks(inode));
+	u64 max_bytes = F2FS_BLK_TO_BYTES(sbi,
+					max_file_blocks(sbi, inode));
 	u64 start, end;
 	int ret = 0;
 
@@ -3187,8 +3192,8 @@ static int f2fs_ioc_defragment(struct file *filp, unsigned long arg)
 	if (range.start & (F2FS_BLKSIZE - 1) || range.len & (F2FS_BLKSIZE - 1))
 		return -EINVAL;
 
-	if (unlikely((range.start + range.len) >> PAGE_SHIFT >
-					max_file_blocks(inode)))
+	if (unlikely(F2FS_BYTES_TO_BLK(sbi, range.start + range.len) >
+					max_file_blocks(sbi, inode)))
 		return -EINVAL;
 
 	err = mnt_want_write_file(filp);
@@ -3322,9 +3327,9 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	}
 
 	f2fs_lock_op(sbi, &lc);
-	ret = __exchange_data_block(src, dst, F2FS_BYTES_TO_BLK(pos_in),
-				F2FS_BYTES_TO_BLK(pos_out),
-				F2FS_BYTES_TO_BLK(len), false);
+	ret = __exchange_data_block(src, dst, F2FS_BYTES_TO_BLK(sbi, pos_in),
+				F2FS_BYTES_TO_BLK(sbi, pos_out),
+				F2FS_BYTES_TO_BLK(sbi, len), false);
 
 	if (!ret) {
 		if (dst_max_i_size)
@@ -3990,7 +3995,7 @@ int f2fs_precache_extents(struct inode *inode)
 	map.m_next_extent = &m_next_extent;
 	map.m_seg_type = NO_CHECK_TYPE;
 	map.m_may_create = false;
-	end = F2FS_BLK_ALIGN(i_size_read(inode));
+	end = F2FS_BLK_ALIGN(F2FS_I_SB(inode), i_size_read(inode));
 
 	while (map.m_lblk < end) {
 		map.m_len = end - map.m_lblk;
@@ -4590,7 +4595,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 		goto err;
 	}
 
-	index = F2FS_BYTES_TO_BLK(range.start);
+	index = F2FS_BYTES_TO_BLK(sbi, range.start);
 	pg_end = DIV_ROUND_UP(end_addr, F2FS_BLKSIZE);
 
 	ret = f2fs_convert_inline_inode(inode);
@@ -5381,7 +5386,8 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 	 * buffered IO, if DIO meets any holes.
 	 */
 	if (dio && i_size_read(inode) &&
-		(F2FS_BYTES_TO_BLK(pos) < F2FS_BLK_ALIGN(i_size_read(inode))))
+		(F2FS_BYTES_TO_BLK(sbi, pos) <
+		 F2FS_BLK_ALIGN(sbi, i_size_read(inode))))
 		return 0;
 
 	/* No-wait I/O can't allocate blocks. */
@@ -5402,8 +5408,8 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 	}
 
 	/* Do not preallocate blocks that will be written partially in 4KB. */
-	map.m_lblk = F2FS_BLK_ALIGN(pos);
-	map.m_len = F2FS_BYTES_TO_BLK(pos + count);
+	map.m_lblk = F2FS_BLK_ALIGN(sbi, pos);
+	map.m_len = F2FS_BYTES_TO_BLK(sbi, pos + count);
 	if (map.m_len > map.m_lblk)
 		map.m_len -= map.m_lblk;
 	else
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 7dabfada1b54..e7aa3b790214 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -3294,9 +3294,10 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *sbi)
 	if (!enabled_nat_bits(sbi, NULL))
 		return 0;
 
-	nm_i->nat_bits_blocks = F2FS_BLK_ALIGN((nat_bits_bytes << 1) + 8);
+	nm_i->nat_bits_blocks = F2FS_BLK_ALIGN(sbi,
+					       (nat_bits_bytes << 1) + 8);
 	nm_i->nat_bits = f2fs_kvzalloc(sbi,
-			F2FS_BLK_TO_BYTES(nm_i->nat_bits_blocks), GFP_KERNEL);
+			F2FS_BLK_TO_BYTES(sbi, nm_i->nat_bits_blocks), GFP_KERNEL);
 	if (!nm_i->nat_bits)
 		return -ENOMEM;
 
@@ -3309,7 +3310,7 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *sbi)
 		if (IS_ERR(folio))
 			return PTR_ERR(folio);
 
-		memcpy(nm_i->nat_bits + F2FS_BLK_TO_BYTES(i),
+		memcpy(nm_i->nat_bits + F2FS_BLK_TO_BYTES(sbi, i),
 					folio_address(folio), F2FS_BLKSIZE);
 		f2fs_folio_put(folio, true);
 	}
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index aaa5227739c8..b52718741ddc 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -734,9 +734,9 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		}
 
 		if (!file_keep_isize(inode) &&
-			(i_size_read(inode) <= ((loff_t)index << PAGE_SHIFT)))
+			(i_size_read(inode) <= F2FS_BLK_TO_BYTES(sbi, index)))
 			f2fs_i_size_write(inode,
-				(loff_t)(index + 1) << PAGE_SHIFT);
+				F2FS_BLK_TO_BYTES(sbi, index + 1));
 
 		/*
 		 * dest is reserved block, invalidate src block
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c6adeeae9194..eb27b92fbad8 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3592,8 +3592,8 @@ static unsigned int __issue_discard_cmd_range(struct f2fs_sb_info *sbi,
 
 int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
 {
-	__u64 start = F2FS_BYTES_TO_BLK(range->start);
-	__u64 end = start + F2FS_BYTES_TO_BLK(range->len) - 1;
+	__u64 start = F2FS_BYTES_TO_BLK(sbi, range->start);
+	__u64 end = start + F2FS_BYTES_TO_BLK(sbi, range->len) - 1;
 	unsigned int start_segno, end_segno;
 	block_t start_block, end_block;
 	struct cp_control cpc;
@@ -3624,7 +3624,8 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
 	}
 
 	cpc.reason = CP_DISCARD;
-	cpc.trim_minlen = max_t(__u64, 1, F2FS_BYTES_TO_BLK(range->minlen));
+	cpc.trim_minlen = max_t(__u64, 1,
+				F2FS_BYTES_TO_BLK(sbi, range->minlen));
 	cpc.trim_start = start_segno;
 	cpc.trim_end = end_segno;
 
@@ -3658,7 +3659,7 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
 					start_block, end_block);
 out:
 	if (!err)
-		range->len = F2FS_BLK_TO_BYTES(trimmed);
+		range->len = F2FS_BLK_TO_BYTES(sbi, trimmed);
 	return err;
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0bd6df924a97..da97f0f38ea0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3884,7 +3884,7 @@ static const struct export_operations f2fs_export_ops = {
 	.get_parent = f2fs_get_parent,
 };
 
-loff_t max_file_blocks(struct inode *inode)
+loff_t max_file_blocks(struct f2fs_sb_info *sbi, struct inode *inode)
 {
 	loff_t result = 0;
 	loff_t leaf_count;
@@ -3918,7 +3918,8 @@ loff_t max_file_blocks(struct inode *inode)
 	 * fit within U32_MAX + 1 data units.
 	 */
 
-	result = umin(result, F2FS_BYTES_TO_BLK(((loff_t)U32_MAX + 1) * 4096));
+	result = umin(result, F2FS_BYTES_TO_BLK(sbi,
+						((loff_t)U32_MAX + 1) * 4096));
 
 	return result;
 }
@@ -4370,7 +4371,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 
 	nat_blocks = nat_segs << log_blocks_per_seg;
 	nat_bits_bytes = nat_blocks / BITS_PER_BYTE;
-	nat_bits_blocks = F2FS_BLK_ALIGN((nat_bits_bytes << 1) + 8);
+	nat_bits_blocks = F2FS_BLK_ALIGN(sbi, (nat_bits_bytes << 1) + 8);
 	if (__is_set_ckpt_flags(ckpt, CP_NAT_BITS_FLAG) &&
 		(cp_payload + F2FS_CP_PACKS +
 		NR_CURSEG_PERSIST_TYPE + nat_bits_blocks >= blocks_per_seg)) {
@@ -5192,7 +5193,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (err)
 		goto free_options;
 
-	sb->s_maxbytes = max_file_blocks(NULL) <<
+	sb->s_maxbytes = max_file_blocks(sbi, NULL) <<
 				le32_to_cpu(raw_super->log_blocksize);
 	sb->s_max_links = F2FS_LINK_MAX;
 
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 39f482515445..ee838f880c4a 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -75,7 +75,8 @@ static int pagecache_write(struct inode *inode, const void *buf, size_t count,
 	struct address_space *mapping = inode->i_mapping;
 	const struct address_space_operations *aops = mapping->a_ops;
 
-	if (pos + count > F2FS_BLK_TO_BYTES(max_file_blocks(inode)))
+	if (pos + count > F2FS_BLK_TO_BYTES(F2FS_I_SB(inode),
+			max_file_blocks(F2FS_I_SB(inode), inode)))
 		return -EFBIG;
 
 	while (count) {
@@ -239,7 +240,8 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
 
 	/* Get the descriptor */
 	if (pos + size < pos ||
-	    pos + size > F2FS_BLK_TO_BYTES(max_file_blocks(inode)) ||
+	    pos + size > F2FS_BLK_TO_BYTES(F2FS_I_SB(inode),
+			max_file_blocks(F2FS_I_SB(inode), inode)) ||
 	    pos < f2fs_verity_metadata_pos(inode) || size > INT_MAX) {
 		f2fs_warn(F2FS_I_SB(inode), "invalid verity xattr");
 		f2fs_handle_error(F2FS_I_SB(inode),
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 33995cd3dd6d..4c9540981db4 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -28,10 +28,15 @@
 #define COMPRESS_ADDR		((block_t)-2)	/* used as compressed data flag */
 
 #define F2FS_BLKSIZE_MASK		(F2FS_BLKSIZE - 1)
-#define F2FS_BYTES_TO_BLK(bytes)	((unsigned long long)(bytes) >> F2FS_BLKSIZE_BITS)
-#define F2FS_BLK_TO_BYTES(blk)		((unsigned long long)(blk) << F2FS_BLKSIZE_BITS)
-#define F2FS_BLK_END_BYTES(blk)		(F2FS_BLK_TO_BYTES(blk + 1) - 1)
-#define F2FS_BLK_ALIGN(x)		(F2FS_BYTES_TO_BLK((x) + F2FS_BLKSIZE - 1))
+#define F2FS_BYTES_TO_BLK(sbi, bytes)					\
+	((unsigned long long)(bytes) >> (sbi)->log_blocksize)
+#define F2FS_BLK_TO_BYTES(sbi, blk)					\
+	((unsigned long long)(blk) << (sbi)->log_blocksize)
+#define F2FS_BLK_END_BYTES(sbi, blk)					\
+	(F2FS_BLK_TO_BYTES(sbi, (blk) + 1) - 1)
+#define F2FS_BLK_ALIGN(sbi, bytes)					\
+	F2FS_BYTES_TO_BLK(sbi, (unsigned long long)(bytes) +		\
+				 (sbi)->blocksize - 1)
 
 /* 0, 1(node nid), 2(meta nid) are reserved node id */
 #define F2FS_RESERVED_NODE_NUM		3
-- 
2.53.0

