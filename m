Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85EB39934B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788477115; cv=none; b=PrAxcDAumJ97/s/Y88a9kPPb7LtjqGFOmTt4KK9TBM/Axag95HyG7AOHmylA96nf5LU70Mq03Wei0BAL7y59+aJ3uKuKtyB//3Mh0f4qb03hyjUq/5zNrLeC0C6PePDz0MaefZI9pQciZP9TaGdNmJH29TaxscEBjLqH59eHpSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788477115; c=relaxed/simple;
	bh=Nn/4xO3KjXXBGL+Eupx5njUhwEaCJ9VzoatunVuZGJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KT/LViQCzMvGqed00DiO8h7vPRjBYJQs2SZEtmhA2ohwb2xBcgfuidMu9o15O1bhq5ktRtlR0Ccn+eGbORUUEBi25M10gCV60IlTrh601GSCLmg7ZwmvUDJJ23TjNhDrifJ7FmXk3hRdrBf3lDPb+ikENK1vhtSnaSx3O82vlVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ME17cVKW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ME17cVKW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc891373e0so3835095ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788477111; x=1789081911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xHSOBAgNWDLnBxg1bVYblXXkiHXU97I78a7dWBX6r/o=;
        b=ME17cVKWxBR1x2nYNYo/9NmHunqYSCGDksND7qlwdhDLb9Sh2okVPtpWgDXocQaiKl
         gpRxGCB5TlkLLQwiZ4/Kt3fl2xwcsQf07Z2sCW8c1BjCajcC1MPXAVdLhlT2PaCRIZ+v
         OTK/ja10ozff1W8IdKW4k+QQhPb4QDGem+vQmJZg2kr2h3vH6I5OKUE/Ruk+Fx5Z0KJU
         OEdNwbUvhkLgCzOZfjVapGsTd21IzyxHSdgsHjLbqTjbSScTmtonPQq6/s3LNpFTQhbo
         i7W/lYSH2675CXAtKtgjA90Gq9Z0lYsEFs7GxwLJc7PTKfeUz7h5PgcmNyvkhGWCZ0gy
         CGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788477111; x=1789081911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xHSOBAgNWDLnBxg1bVYblXXkiHXU97I78a7dWBX6r/o=;
        b=ciyRwaqUE+0UibYgbQDS3VWrPj7sAT6/4tTno20ZrytpWj0USF2USuqW6Um2Ze9OTm
         hdgYCBkJr5zt4LLXQ6iRiu6ckPcMDO5UURiu75pARu7ngY2MZyAsSK2mxpOApdpBjHIq
         0FrTluhYehaN6glRA9zzQCffKfjglh7q5rn2TrKTZ91hAdLRgjsO2kW+kXOLwk7g3tDo
         szi2SSaZxeC6UVeYKXYfIrHfcy0yGyYd0eyAEyT5JUXJ0p9HgunztqhFRsRkS0rISH0/
         tb2K0jB7Og6nT3U5wXiW6orK5NxR95EuA7v8NapMl8zBCK/Gx2lURRd6hSZuznsKgB6T
         Vzeg==
X-Forwarded-Encrypted: i=1; AKwUvBzKKVM8Rp0wyF5QaLWXuWel0McP4YPSMM6XelrTKlxQXkbOhcA8PLY7wbO3E85ZL1qfmJzud4njwa7y3GA=@vger.kernel.org
X-Gm-Message-State: AFuF++mc4sJVMZds6juMt3HVzAHWbaUFKyuam4/PnJwedLJQJw9GXkxr
	fBSPyA8K3F2Df/42QjIcVk6sX1BLHPWhFJ4OdUlDOO7sx0w8hcTCi9jz
X-Gm-Gg: AYBFou0aTu4yqxPYAktKSS+DPOZ5xcfojykflmHd5CqV8jl9jj6Zhr5Vab/vHAaKDK/
	6Pze4ukq9RevipFoCqIf1F0J95GoZyXsybq1eJMfOLcXX79pVagb+lbWlX9uOhV9tFyULbCO5tB
	Zrvj+dZ7io3g1NVyNGl8XyUHYwWG/KK8Nqq+Kbjju3dFPEGB5202+Zg2V1xpYf8RaoIxq5ftmjm
	wLOlwimu8rMILUiszUle1/uCu0yjLED2ey91/KtnGj2xd9jizmE4vejL0Oh2zCkgGl3LXAWvndv
	GGQxRsiZFbhTC9KDO3UUNyNd9UK5Htg7V+cxvvHtQcIq+ts3sN9+Z+np+cHVprim/4uAIyw+g0j
	UXfeJxXrBut1ozIbtLgc+w9IE1oMNQ+Hn3/MDMK6S4jLABDazGTJgVstmxtPCz3i9ZKx0BX5a1T
	t5vx/gvzHLsLGvxkH+tIC6SCElgvFstoKwrUQrpKg0fRPhb7neZF2lI9gUlB+7mmDzZ6Lsp21y5
	DwR
X-Received: by 2002:a17:90b:1dc3:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39b26207ee4mr3051335a91.17.1788477110871;
        Thu, 03 Sep 2026 16:11:50 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:29c4:4984:db20:3bb4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm1131472a91.9.2026.09.03.16.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 16:11:50 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 09/11] f2fs: parameterize byte and block conversion macros
Date: Thu,  3 Sep 2026 16:11:36 -0700
Message-ID: <782055ac2a263ecccacf10d27c6bcb874693f8cc.1788476500.git.zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788476500.git.zhangxp1998@gmail.com>
References: <cover.1788476500.git.zhangxp1998@gmail.com>
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
index e615477307f9..a3490be98c51 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1866,7 +1866,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		blk = start_blk + BLKS_PER_SEG(sbi) - nm_i->nat_bits_blocks;
 		for (i = 0; i < nm_i->nat_bits_blocks; i++)
 			f2fs_update_meta_page(sbi, nm_i->nat_bits +
-					F2FS_BLK_TO_BYTES(i), blk + i);
+					F2FS_BLK_TO_BYTES(sbi, i), blk + i);
 	}
 
 	/* write out checkpoint buffer at block 0 */
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6a74af3fb396..d058617b50f4 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1977,12 +1977,12 @@ static bool __f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len,
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
@@ -2025,7 +2025,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 			return err;
 		}
 
-		phys = F2FS_BLK_TO_BYTES(ni.blk_addr);
+		phys = F2FS_BLK_TO_BYTES(sbi, ni.blk_addr);
 		offset = offsetof(struct f2fs_inode, i_addr) +
 					sizeof(__le32) * (DEF_ADDRS_PER_INODE(sbi) -
 					get_inline_xattr_addrs(inode));
@@ -2059,7 +2059,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 			return err;
 		}
 
-		phys = F2FS_BLK_TO_BYTES(ni.blk_addr);
+		phys = F2FS_BLK_TO_BYTES(sbi, ni.blk_addr);
 		len = inode->i_sb->s_blocksize;
 
 		f2fs_folio_put(folio, true);
@@ -2078,6 +2078,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		u64 start, u64 len)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_map_blocks map;
 	sector_t start_blk, last_blk, blk_len, max_len;
 	pgoff_t next_pgofs;
@@ -2101,7 +2102,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 
 	inode_lock_shared(inode);
 
-	maxbytes = F2FS_BLK_TO_BYTES(max_file_blocks(inode));
+	maxbytes = F2FS_BLK_TO_BYTES(sbi, max_file_blocks(sbi, inode));
 	if (start > maxbytes) {
 		ret = -EFBIG;
 		goto out;
@@ -2121,10 +2122,10 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
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
@@ -2146,7 +2147,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	if (!compr_cluster && !(map.m_flags & F2FS_MAP_FLAGS)) {
 		start_blk = next_pgofs;
 
-		if (F2FS_BLK_TO_BYTES(start_blk) < maxbytes)
+		if (F2FS_BLK_TO_BYTES(sbi, start_blk) < maxbytes)
 			goto prep_next;
 
 		flags |= FIEMAP_EXTENT_LAST;
@@ -2194,14 +2195,14 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
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
@@ -2215,7 +2216,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 			flags = FIEMAP_EXTENT_UNWRITTEN;
 		}
 
-		start_blk += F2FS_BYTES_TO_BLK(size);
+		start_blk += F2FS_BYTES_TO_BLK(sbi, size);
 	}
 
 prep_next:
@@ -2235,7 +2236,8 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 static inline loff_t f2fs_readpage_limit(struct inode *inode)
 {
 	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
-		return F2FS_BLK_TO_BYTES(max_file_blocks(inode));
+		return F2FS_BLK_TO_BYTES(F2FS_I_SB(inode),
+				max_file_blocks(F2FS_I_SB(inode), inode));
 
 	return i_size_read(inode);
 }
@@ -2263,7 +2265,8 @@ static int f2fs_read_single_page(struct inode *inode, struct fsverity_info *vi,
 
 	block_in_file = (sector_t)index;
 	last_block = block_in_file + nr_pages;
-	last_block_in_file = F2FS_BYTES_TO_BLK(f2fs_readpage_limit(inode) +
+	last_block_in_file = F2FS_BYTES_TO_BLK(F2FS_I_SB(inode),
+				f2fs_readpage_limit(inode) +
 							blocksize - 1);
 	if (last_block > last_block_in_file)
 		last_block = last_block_in_file;
@@ -2374,7 +2377,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 
 	f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
 
-	last_block_in_file = F2FS_BYTES_TO_BLK(f2fs_readpage_limit(inode) +
+	last_block_in_file = F2FS_BYTES_TO_BLK(sbi,
+				f2fs_readpage_limit(inode) +
 							blocksize - 1);
 
 	/* get rid of pages beyond EOF */
@@ -4236,7 +4240,7 @@ static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
 		filemap_write_and_wait(mapping);
 
 	/* Block number less than F2FS MAX BLOCKS */
-	if (unlikely(block >= max_file_blocks(inode)))
+	if (unlikely(block >= max_file_blocks(F2FS_I_SB(inode), inode)))
 		goto out;
 
 	if (f2fs_compressed_file(inode)) {
@@ -4352,7 +4356,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
 	 * to be very smart.
 	 */
 	cur_lblock = 0;
-	last_lblock = F2FS_BYTES_TO_BLK(i_size_read(inode));
+	last_lblock = F2FS_BYTES_TO_BLK(sbi, i_size_read(inode));
 
 	while (cur_lblock < last_lblock && cur_lblock < sis->max) {
 		struct f2fs_map_blocks map;
@@ -4607,12 +4611,14 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
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
@@ -4633,7 +4639,7 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if (err)
 		return err;
 
-	iomap->offset = F2FS_BLK_TO_BYTES(map.m_lblk);
+	iomap->offset = F2FS_BLK_TO_BYTES(sbi, map.m_lblk);
 
 	/*
 	 * When inline encryption is enabled, sometimes I/O to an encrypted file
@@ -4653,11 +4659,11 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
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
@@ -4666,11 +4672,11 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
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
index e1006931f1af..2b8bb42e235a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4022,7 +4022,7 @@ void f2fs_inode_synced(struct inode *inode);
 int f2fs_dquot_initialize(struct inode *inode);
 int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
 int f2fs_do_quota_sync(struct super_block *sb, int type);
-loff_t max_file_blocks(struct inode *inode);
+loff_t max_file_blocks(struct f2fs_sb_info *sbi, struct inode *inode);
 void f2fs_quota_off_umount(struct super_block *sb);
 void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag);
 void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
@@ -5269,8 +5269,9 @@ static inline void f2fs_truncate_meta_inode_pages(struct f2fs_sb_info *sbi,
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
index 2c72e028cec2..6fafb32bc5f2 100644
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
@@ -1161,7 +1165,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			return -EOPNOTSUPP;
 		if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED) &&
 			!IS_ALIGNED(attr->ia_size,
-			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
+			F2FS_BLK_TO_BYTES(sbi, fi->i_cluster_size)))
 			return -EINVAL;
 
 		if (f2fs_is_pinned_file(inode)) {
@@ -1177,7 +1181,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			 * pinned file.
 			 */
 			else if (!IS_ALIGNED(attr->ia_size,
-				F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
+				F2FS_BLK_TO_BYTES(sbi, CAP_BLKS_PER_SEC(sbi))))
 				return -EINVAL;
 		}
 	}
@@ -2648,7 +2652,8 @@ static int f2fs_keep_noreuse_range(struct inode *inode,
 				loff_t offset, loff_t len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	u64 max_bytes = F2FS_BLK_TO_BYTES(max_file_blocks(inode));
+	u64 max_bytes = F2FS_BLK_TO_BYTES(sbi,
+					max_file_blocks(sbi, inode));
 	u64 start, end;
 	int ret = 0;
 
@@ -3191,8 +3196,8 @@ static int f2fs_ioc_defragment(struct file *filp, unsigned long arg)
 	if (range.start & (F2FS_BLKSIZE - 1) || range.len & (F2FS_BLKSIZE - 1))
 		return -EINVAL;
 
-	if (unlikely((range.start + range.len) >> PAGE_SHIFT >
-					max_file_blocks(inode)))
+	if (unlikely(F2FS_BYTES_TO_BLK(sbi, range.start + range.len) >
+					max_file_blocks(sbi, inode)))
 		return -EINVAL;
 
 	err = mnt_want_write_file(filp);
@@ -3326,9 +3331,9 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
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
@@ -3994,7 +3999,7 @@ int f2fs_precache_extents(struct inode *inode)
 	map.m_next_extent = &m_next_extent;
 	map.m_seg_type = NO_CHECK_TYPE;
 	map.m_may_create = false;
-	end = F2FS_BLK_ALIGN(i_size_read(inode));
+	end = F2FS_BLK_ALIGN(F2FS_I_SB(inode), i_size_read(inode));
 
 	while (map.m_lblk < end) {
 		map.m_len = end - map.m_lblk;
@@ -4594,7 +4599,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 		goto err;
 	}
 
-	index = F2FS_BYTES_TO_BLK(range.start);
+	index = F2FS_BYTES_TO_BLK(sbi, range.start);
 	pg_end = DIV_ROUND_UP(end_addr, F2FS_BLKSIZE);
 
 	ret = f2fs_convert_inline_inode(inode);
@@ -5385,7 +5390,8 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 	 * buffered IO, if DIO meets any holes.
 	 */
 	if (dio && i_size_read(inode) &&
-		(F2FS_BYTES_TO_BLK(pos) < F2FS_BLK_ALIGN(i_size_read(inode))))
+		(F2FS_BYTES_TO_BLK(sbi, pos) <
+		 F2FS_BLK_ALIGN(sbi, i_size_read(inode))))
 		return 0;
 
 	/* No-wait I/O can't allocate blocks. */
@@ -5406,8 +5412,8 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
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
index f565b6873832..f58b26c84b3a 100644
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
index 5fd163e60296..3aa8a2198471 100644
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

