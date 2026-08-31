Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8A93C1986
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788214108; cv=none; b=EOtskr5j7F0fdJvSf48+TWdXYQ/NHN3d311aYen4yIQJldSYvDp+u7HWk9k8l3N2a8I5XEt2vLKxkqvcTowqU9ZV15cshxW3iavg5hmbk25HGWs1E1ucl9vaGAn4jn6qZifINre7YmKN5xPuHmnumyo6B+TYqCL1bykhppFRc04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788214108; c=relaxed/simple;
	bh=wS5EOvQTpKNBGE62SR8cCPxFF15GYC9/ZmGB4ltiQw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHSFWRptpsvcrC6bOGM1H6dzDZrZrcyUezjn9HBaev6H857Q+3jF3w0DoH/CPI2AWrkCP5G3kSDNzuSOKOfrJWvlNpmDO+urW9Zs5IJdNoAuFj2bkn3RDZRVmQKoSXr96ZqYaZ+iBby1eRCohI9P9AJ1WQwDhcbiuIPC2EHt4Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOeZZh0k; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOeZZh0k"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso3135724b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788214105; x=1788818905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGEBYtiy0saQqUn2f5UxlhfzLZ+y5Gfzq+Sc96GsWMw=;
        b=NOeZZh0kJYIaadxzIGqcHhKPTn/kAUWLA3q/L5+4wLVJBnvfuV0iCbaDBM27u+EjNk
         Qo1EG8+YtW4Vt5Cx4pZJBnp0nMU4plxO9OlwIHHh5o7k46r3ojnheEo0WHXJMB+hhtuU
         nK7VWT8tOL6MssCRp6y4in928nH8MOt4orMXY2+BJyxB7Mo3TxvBW7omteuxUOWEqvfC
         vSx/a1pLjRiM7hb1E2WTbZZlEmNeCVKw56HNw9WjzhUqRFsu9Qh1hIjwQmwCYwy34a8M
         ipCSPojxafA63DQkRWkCCuGNpyTo2MUkXM9EWtE/FYtYnzM8h8yt0f8TsH45DfyGcOMu
         waOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788214105; x=1788818905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGEBYtiy0saQqUn2f5UxlhfzLZ+y5Gfzq+Sc96GsWMw=;
        b=oWr7cil7TjYgAeQfbOv9B7YhvMt5pvwLe5hp6KtY/hHZnOHn2UV1Gdieq4gU+v9ZFa
         9uXwufMtm/paHso+nM9XGkHRaDwI/5TNrJzodDoUcqGkvMqMrQrQx8qqceFqZAvWfYxm
         7Wa4P2wM+AW0MmdptKfjoJDR3L1cLgrjerdiN8sJfIQSGkMvFkgx4MzLY51facz5jwGd
         HwOt9Ar2DUpkSGWphPA48oD8V/v5yAqPZhEesTrco8SOsCOVj7Ks3UtzhZwo/+c/rwiL
         NLwr/yRMGAgf6LoszZTVUMEhpiQIcpFDzC7dIu9dnZqOyYPhw9u7HLziUhUbNSEgpWEu
         C6pg==
X-Forwarded-Encrypted: i=1; AHgh+RrBqZlkRipjkIfSlxO7+MjlMK+PkLLUfP0ermTnwvdKPX9CfT2/oR5AWeedSbZOt2QQl0yLQftg8SKK3J4=@vger.kernel.org
X-Gm-Message-State: AFuF++nbHDMTzO54IaUUs1bMHT1ADeOEuBeNf4ee0GpoAsyLud/Rg24D
	yuuFwcFGr/zCG+SAarw7+5ly9onKAyzSTdI+k9drLzp7a9WIZ/bdvAKr/a7+1FWBT+U=
X-Gm-Gg: AR+sD13xj+PHrgZ2FNOdB5aiPMVlYWcAQ4zkJ8SrmAZqm897SkyUA8voTn5spASyug4
	Lz7harOE0KY0ZsS1qJZLf/eMh95L+xYoiQnh0YhzB9XymM4i/xMRpTYXEEjhI9d9excqW5FyI/t
	XVNsLv08ixBz3V/2/bjFUm4TcBVm0e/j3XygbY85A0Kl4sAo8hvOUoHyATvmpQhyDViuwJWAu8W
	tRjm+A8g9qSSw7Gq+XvwkAXchSCqgu9Z1pQ4ocFc1bmY6FjacABDCd9lTIOFaPJQroj6LirpFnV
	ynAR5u9tp6xlmfS0eyuQwvM+jGK+mIemGOmfyiRR7U+wstMDGuP1IA2NdH+pxieI867KbbjYZjE
	E0q94w8yfRs6DIfvDz9+acLgGSwhCYGiRGt8/zsFytbX1OHyRysVegZ0LwqoHZ5UESrvgwC81A5
	yKD4bEHV5lDtTTGYi0E/GoIBCTD5xbXiiAx2he9yhKmJAv4sk0ju0wJBlxvGRF2FSiKoB71G5Yf
	/9F
X-Received: by 2002:a05:6a00:181c:b0:84e:e741:174f with SMTP id d2e1a72fcca58-85b59c69513mr4794654b3a.7.1788214104404;
        Mon, 31 Aug 2026 15:08:24 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:91a4:c2d8:1d54:21ad])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85be9349383sm93839b3a.44.2026.08.31.15.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:08:23 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 10/11] f2fs: parameterize block size and mask macros
Date: Mon, 31 Aug 2026 15:08:11 -0700
Message-ID: <c570b8ce22c1e2732b3319a4ca9c2642aa5f523f.1788213716.git.zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788213716.git.zhangxp1998@gmail.com>
References: <cover.1788213716.git.zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Block size constants, shift counts, masks, and page-to-block ratios were
globally defined assuming a fixed 4KB block size.

Parameterize F2FS_BLKSIZE, F2FS_BLKSIZE_BITS, F2FS_BLKSIZE_MASK,
F2FS_BLKS_PER_PAGE, and CP_CHKSUM_OFFSET with struct f2fs_sb_info *sbi
to reference sbi->blocksize, sbi->log_blocksize, and runtime masks.

Update call sites across metadata operations, data I/O, file operations,
garbage collection, inline data, and sysfs information.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/checkpoint.c    | 23 ++++++++++++-----------
 fs/f2fs/data.c          | 25 ++++++++++++++-----------
 fs/f2fs/extent_cache.c  |  6 ++++--
 fs/f2fs/f2fs.h          | 15 +++++++++++----
 fs/f2fs/file.c          | 30 +++++++++++++++++-------------
 fs/f2fs/gc.c            | 11 ++++++-----
 fs/f2fs/inline.c        |  6 +++---
 fs/f2fs/inode.c         |  4 ++--
 fs/f2fs/node.c          |  7 ++++---
 fs/f2fs/node.h          |  2 +-
 fs/f2fs/segment.c       | 18 +++++++++++-------
 fs/f2fs/segment.h       |  4 ++--
 fs/f2fs/super.c         |  6 +++---
 fs/f2fs/sysfs.c         | 10 +++++-----
 fs/f2fs/xattr.c         |  2 +-
 include/linux/f2fs_fs.h | 22 +++++++++++-----------
 16 files changed, 107 insertions(+), 84 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index d0dcc918422e..015c7449e45a 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -288,7 +288,7 @@ static struct folio *__get_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index,
 		return ERR_PTR(err);
 	}
 
-	f2fs_update_iostat(sbi, NULL, FS_META_READ_IO, F2FS_BLKSIZE);
+	f2fs_update_iostat(sbi, NULL, FS_META_READ_IO, F2FS_BLKSIZE(sbi));
 
 	folio_lock(folio);
 	if (unlikely(!is_meta_folio(folio))) {
@@ -513,7 +513,7 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 
 		if (!err)
 			f2fs_update_iostat(sbi, NULL, FS_META_READ_IO,
-							F2FS_BLKSIZE);
+							F2FS_BLKSIZE(sbi));
 	}
 out:
 	blk_finish_plug(&plug);
@@ -1141,16 +1141,17 @@ static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
 	}
 }
 
-static __u32 f2fs_checkpoint_chksum(struct f2fs_checkpoint *ckpt)
+static __u32 f2fs_checkpoint_chksum(struct f2fs_sb_info *sbi,
+				     struct f2fs_checkpoint *ckpt)
 {
 	unsigned int chksum_ofs = le32_to_cpu(ckpt->checksum_offset);
 	__u32 chksum;
 
 	chksum = f2fs_crc32(ckpt, chksum_ofs);
-	if (chksum_ofs < CP_CHKSUM_OFFSET) {
+	if (chksum_ofs < CP_CHKSUM_OFFSET(sbi)) {
 		chksum_ofs += sizeof(chksum);
 		chksum = f2fs_chksum(chksum, (__u8 *)ckpt + chksum_ofs,
-				     F2FS_BLKSIZE - chksum_ofs);
+					F2FS_BLKSIZE(sbi) - chksum_ofs);
 	}
 	return chksum;
 }
@@ -1170,13 +1171,13 @@ static int get_checkpoint_version(struct f2fs_sb_info *sbi, block_t cp_addr,
 
 	crc_offset = le32_to_cpu((*cp_block)->checksum_offset);
 	if (crc_offset < CP_MIN_CHKSUM_OFFSET ||
-			crc_offset > CP_CHKSUM_OFFSET) {
+			crc_offset > CP_CHKSUM_OFFSET(sbi)) {
 		f2fs_folio_put(*cp_folio, true);
 		f2fs_warn(sbi, "invalid crc_offset: %zu", crc_offset);
 		return -EINVAL;
 	}
 
-	crc = f2fs_checkpoint_chksum(*cp_block);
+	crc = f2fs_checkpoint_chksum(sbi, *cp_block);
 	if (crc != cur_cp_crc(*cp_block)) {
 		f2fs_folio_put(*cp_folio, true);
 		f2fs_warn(sbi, "invalid crc value");
@@ -1713,7 +1714,7 @@ static void commit_checkpoint(struct f2fs_sb_info *sbi,
 	 */
 	struct folio *folio = f2fs_grab_meta_folio(sbi, blk_addr);
 
-	memcpy(folio_address(folio), src, PAGE_SIZE);
+	memcpy(folio_address(folio), src, F2FS_BLKSIZE(sbi));
 
 	folio_mark_dirty(folio);
 	if (unlikely(!folio_clear_dirty_for_io(folio)))
@@ -1848,7 +1849,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	get_sit_bitmap(sbi, __bitmap_ptr(sbi, SIT_BITMAP));
 	get_nat_bitmap(sbi, __bitmap_ptr(sbi, NAT_BITMAP));
 
-	crc32 = f2fs_checkpoint_chksum(ckpt);
+	crc32 = f2fs_checkpoint_chksum(sbi, ckpt);
 	*((__le32 *)((unsigned char *)ckpt +
 				le32_to_cpu(ckpt->checksum_offset)))
 				= cpu_to_le32(crc32);
@@ -1873,8 +1874,8 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	f2fs_update_meta_page(sbi, ckpt, start_blk++);
 
 	for (i = 1; i < 1 + cp_payload_blks; i++)
-		f2fs_update_meta_page(sbi, (char *)ckpt + i * F2FS_BLKSIZE,
-							start_blk++);
+		f2fs_update_meta_page(sbi, (char *)ckpt +
+				i * F2FS_BLKSIZE(sbi), start_blk++);
 
 	if (orphan_num) {
 		write_orphan_inodes(sbi, start_blk);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6ee4440c17dd..d7b22eaa746e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1227,7 +1227,7 @@ static void f2fs_submit_page_read(struct inode *inode, struct fsverity_info *vi,
 		f2fs_bug_on(sbi, 1);
 
 	inc_page_count(sbi, F2FS_RD_DATA);
-	f2fs_update_iostat(sbi, NULL, FS_DATA_READ_IO, F2FS_BLKSIZE);
+	f2fs_update_iostat(sbi, NULL, FS_DATA_READ_IO, F2FS_BLKSIZE(sbi));
 	f2fs_submit_read_bio(sbi, bio, DATA);
 }
 
@@ -2210,7 +2210,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 			count_in_cluster += map.m_len;
 			if (count_in_cluster == cluster_size) {
 				compr_cluster = false;
-				size += F2FS_BLKSIZE;
+				size += F2FS_BLKSIZE(sbi);
 			}
 		} else if (map.m_flags & F2FS_MAP_DELALLOC) {
 			flags = FIEMAP_EXTENT_UNWRITTEN;
@@ -2255,7 +2255,7 @@ static int f2fs_read_single_page(struct inode *inode, struct fsverity_info *vi,
 				 struct readahead_control *rac)
 {
 	struct bio *bio = *bio_ret;
-	const unsigned int blocksize = F2FS_BLKSIZE;
+	const unsigned int blocksize = F2FS_BLKSIZE(F2FS_I_SB(inode));
 	sector_t block_in_file;
 	sector_t last_block;
 	sector_t last_block_in_file;
@@ -2344,7 +2344,7 @@ static int f2fs_read_single_page(struct inode *inode, struct fsverity_info *vi,
 
 	inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
 	f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
-							F2FS_BLKSIZE);
+					F2FS_BLKSIZE(F2FS_I_SB(inode)));
 	*last_block_in_bio = block_nr;
 out:
 	*bio_ret = bio;
@@ -2362,7 +2362,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	struct bio *bio = *bio_ret;
 	unsigned int start_idx = cc->cluster_idx << cc->log_cluster_size;
 	sector_t last_block_in_file;
-	const unsigned int blocksize = F2FS_BLKSIZE;
+	const unsigned int blocksize = F2FS_BLKSIZE(sbi);
 	struct decompress_io_ctx *dic = NULL;
 	struct extent_info ei = {};
 	bool from_dnode = true;
@@ -2495,7 +2495,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		refcount_inc(&dic->refcnt);
 
 		inc_page_count(sbi, F2FS_RD_DATA);
-		f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE);
+		f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO,
+				   F2FS_BLKSIZE(sbi));
 		*last_block_in_bio = blkaddr;
 	}
 
@@ -2669,14 +2670,14 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		 */
 		f2fs_wait_on_block_writeback(inode, block_nr);
 
-		if (!bio_add_folio(bio, folio, F2FS_BLKSIZE,
-					offset << PAGE_SHIFT))
+		if (!bio_add_folio(bio, folio, F2FS_BLKSIZE(F2FS_I_SB(inode)),
+				offset << PAGE_SHIFT))
 			goto submit_and_realloc;
 
 		folio_in_bio = true;
 		inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
 		f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
-				F2FS_BLKSIZE);
+				F2FS_BLKSIZE(F2FS_I_SB(inode)));
 		last_block_in_bio = block_nr;
 	}
 	trace_f2fs_read_folio(folio, DATA);
@@ -4230,6 +4231,7 @@ static sector_t f2fs_bmap_compress(struct inode *inode, sector_t block)
 static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
 {
 	struct inode *inode = mapping->host;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	sector_t blknr = 0;
 
 	if (f2fs_has_inline_data(inode))
@@ -4240,7 +4242,7 @@ static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
 		filemap_write_and_wait(mapping);
 
 	/* Block number less than F2FS MAX BLOCKS */
-	if (unlikely(block >= max_file_blocks(F2FS_I_SB(inode), inode)))
+	if (unlikely(block >= max_file_blocks(sbi, inode)))
 		goto out;
 
 	if (f2fs_compressed_file(inode)) {
@@ -4442,7 +4444,8 @@ static int check_swap_activate(struct swap_info_struct *sis,
 out:
 	if (not_aligned)
 		f2fs_warn(sbi, "Swapfile (%u) is not align to section: 1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate(%lu * N)",
-			  not_aligned, blks_per_sec * F2FS_BLKSIZE);
+			  not_aligned,
+			  (unsigned long)blks_per_sec * F2FS_BLKSIZE(sbi));
 	return ret;
 }
 
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 37cf9fa8d537..2d3fdd82b13d 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -904,11 +904,13 @@ static int __get_new_block_age(struct inode *inode, struct extent_info *ei,
 	struct extent_info tei = *ei;	/* only fofs and len are valid */
 
 	/*
-	 * When I/O is not aligned to a PAGE_SIZE, update will happen to the last
+	 * When I/O is not aligned to the filesystem block size, update will
+	 * happen to the last
 	 * file block even in seq write. So don't record age for newly last file
 	 * block here.
 	 */
-	if ((f_size >> PAGE_SHIFT) == ei->fofs && f_size & (PAGE_SIZE - 1) &&
+	if ((f_size >> sbi->log_blocksize) == ei->fofs &&
+	    f_size & F2FS_BLKSIZE_MASK(sbi) &&
 			blkaddr == NEW_ADDR)
 		return -EINVAL;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c625a2572841..f83cdab66f54 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2234,7 +2234,7 @@ static inline struct f2fs_sb_info *F2FS_SB(struct super_block *sb)
 	return sb->s_fs_info;
 }
 
-static inline struct f2fs_sb_info *F2FS_I_SB(struct inode *inode)
+static inline struct f2fs_sb_info *F2FS_I_SB(const struct inode *inode)
 {
 	return F2FS_SB(inode->i_sb);
 }
@@ -2249,12 +2249,18 @@ static inline struct f2fs_sb_info *F2FS_F_SB(const struct folio *folio)
 	return F2FS_M_SB(folio->mapping);
 }
 
+static inline struct f2fs_sb_info *F2FS_P_SB(struct page *page)
+{
+	return F2FS_F_SB(page_folio(page));
+}
+
 #define SIT_ENTRY_PER_BLOCK(sbi)	((sbi)->sit_entries_per_block)
 #define NAT_ENTRY_PER_BLOCK(sbi)	((sbi)->nat_entries_per_block)
 #define DEF_ADDRS_PER_INODE_SBI(sbi)	((sbi)->addrs_per_inode)
 #define F2FS_ORPHANS_PER_BLOCK(sbi)	((sbi)->orphans_per_block)
 #define GET_ORPHAN_BLOCKS(sbi, n)	DIV_ROUND_UP((n), \
 					F2FS_ORPHANS_PER_BLOCK(sbi))
+#define CP_CHKSUM_OFFSET(sbi)		(F2FS_BLKSIZE(sbi) - sizeof(__le32))
 
 static inline struct f2fs_orphan_footer *
 f2fs_orphan_footer(void *orphan_block, struct f2fs_sb_info *sbi)
@@ -2303,7 +2309,7 @@ static inline struct f2fs_checkpoint *F2FS_CKPT(struct f2fs_sb_info *sbi)
 
 static inline struct node_footer *F2FS_NODE_FOOTER(const struct folio *folio)
 {
-	return folio_address(folio) + F2FS_BLKSIZE -
+	return folio_address(folio) + F2FS_BLKSIZE(F2FS_F_SB(folio)) -
 		sizeof(struct node_footer);
 }
 
@@ -2319,7 +2325,8 @@ static inline struct f2fs_inode *F2FS_INODE(const struct folio *folio)
 
 static inline __le32 *F2FS_INODE_NIDS(const struct folio *folio)
 {
-	return folio_address(folio) + F2FS_BLKSIZE - sizeof(struct node_footer) -
+	return folio_address(folio) + F2FS_BLKSIZE(F2FS_F_SB(folio)) -
+		sizeof(struct node_footer) -
 		SIZE_OF_I_NID;
 }
 
@@ -2968,7 +2975,7 @@ static inline void *__bitmap_ptr(struct f2fs_sb_info *sbi, int flag)
 		if (flag == NAT_BITMAP)
 			return tmp_ptr;
 		else
-			return (unsigned char *)ckpt + F2FS_BLKSIZE;
+			return (unsigned char *)ckpt + F2FS_BLKSIZE(sbi);
 	} else {
 		offset = (flag == NAT_BITMAP) ?
 			le32_to_cpu(ckpt->sit_ver_bitmap_bytesize) : 0;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6fafb32bc5f2..7001c18da506 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -110,7 +110,8 @@ static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
 	ret = filemap_fault(vmf);
 	if (ret & VM_FAULT_LOCKED)
 		f2fs_update_iostat(F2FS_I_SB(inode), inode,
-					APP_MAPPED_READ_IO, F2FS_BLKSIZE);
+					APP_MAPPED_READ_IO,
+					F2FS_BLKSIZE(F2FS_I_SB(inode)));
 
 	trace_f2fs_filemap_fault(inode, vmf->pgoff, flags, ret);
 
@@ -233,7 +234,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	}
 	folio_mark_dirty(folio);
 
-	f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, F2FS_BLKSIZE);
+	f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, F2FS_BLKSIZE(sbi));
 	f2fs_update_time(sbi, REQ_TIME);
 
 out_sem:
@@ -974,7 +975,7 @@ int f2fs_truncate(struct inode *inode)
 
 	trace_f2fs_truncate(inode);
 
-	if (time_to_inject(sbi, FAULT_TRUNCATE))
+	if (time_to_inject(F2FS_I_SB(inode), FAULT_TRUNCATE))
 		return -EIO;
 
 	err = f2fs_dquot_initialize(inode);
@@ -1675,7 +1676,8 @@ static int f2fs_collapse_range(struct inode *inode, loff_t offset, loff_t len)
 		return -EINVAL;
 
 	/* collapse range should be aligned to block size of f2fs. */
-	if (offset & (F2FS_BLKSIZE - 1) || len & (F2FS_BLKSIZE - 1))
+	if (offset & F2FS_BLKSIZE_MASK(F2FS_I_SB(inode)) ||
+	    len & F2FS_BLKSIZE_MASK(F2FS_I_SB(inode)))
 		return -EINVAL;
 
 	ret = f2fs_convert_inline_inode(inode);
@@ -1890,7 +1892,8 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 		return -EINVAL;
 
 	/* insert range should be aligned to block size of f2fs. */
-	if (offset & (F2FS_BLKSIZE - 1) || len & (F2FS_BLKSIZE - 1))
+	if (offset & F2FS_BLKSIZE_MASK(F2FS_I_SB(inode)) ||
+	    len & F2FS_BLKSIZE_MASK(F2FS_I_SB(inode)))
 		return -EINVAL;
 
 	ret = f2fs_convert_inline_inode(inode);
@@ -3193,7 +3196,8 @@ static int f2fs_ioc_defragment(struct file *filp, unsigned long arg)
 		return -EFAULT;
 
 	/* verify alignment of offset & size */
-	if (range.start & (F2FS_BLKSIZE - 1) || range.len & (F2FS_BLKSIZE - 1))
+	if (range.start & F2FS_BLKSIZE_MASK(sbi) ||
+	    range.len & F2FS_BLKSIZE_MASK(sbi))
 		return -EINVAL;
 
 	if (unlikely(F2FS_BYTES_TO_BLK(sbi, range.start + range.len) >
@@ -3279,7 +3283,7 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	if (src == dst && pos_out > pos_in && pos_out < pos_in + len)
 		goto out_unlock;
 	if (pos_in + len == src->i_size)
-		len = ALIGN(src->i_size, F2FS_BLKSIZE) - pos_in;
+		len = ALIGN(src->i_size, F2FS_BLKSIZE(sbi)) - pos_in;
 	if (len == 0) {
 		ret = 0;
 		goto out_unlock;
@@ -3297,9 +3301,9 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	}
 
 	/* verify the end result is block aligned */
-	if (!IS_ALIGNED(pos_in, F2FS_BLKSIZE) ||
-			!IS_ALIGNED(pos_in + len, F2FS_BLKSIZE) ||
-			!IS_ALIGNED(pos_out, F2FS_BLKSIZE))
+	if (!IS_ALIGNED(pos_in, F2FS_BLKSIZE(sbi)) ||
+			!IS_ALIGNED(pos_in + len, F2FS_BLKSIZE(sbi)) ||
+			!IS_ALIGNED(pos_out, F2FS_BLKSIZE(sbi)))
 		goto out_unlock;
 
 	ret = f2fs_convert_inline_inode(src);
@@ -4593,14 +4597,14 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 		to_end = true;
 	}
 
-	if (!IS_ALIGNED(range.start, F2FS_BLKSIZE) ||
-			(!to_end && !IS_ALIGNED(end_addr, F2FS_BLKSIZE))) {
+	if (!IS_ALIGNED(range.start, F2FS_BLKSIZE(sbi)) ||
+	    (!to_end && !IS_ALIGNED(end_addr, F2FS_BLKSIZE(sbi)))) {
 		ret = -EINVAL;
 		goto err;
 	}
 
 	index = F2FS_BYTES_TO_BLK(sbi, range.start);
-	pg_end = DIV_ROUND_UP(end_addr, F2FS_BLKSIZE);
+	pg_end = F2FS_BLK_ALIGN(sbi, end_addr);
 
 	ret = f2fs_convert_inline_inode(inode);
 	if (ret)
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index f15ab07a7347..299d5310e597 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1303,8 +1303,8 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	f2fs_put_page(fio.encrypted_page, false);
 	f2fs_folio_put(folio, true);
 
-	f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE);
-	f2fs_update_iostat(sbi, NULL, FS_GDATA_READ_IO, F2FS_BLKSIZE);
+	f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE(sbi));
+	f2fs_update_iostat(sbi, NULL, FS_GDATA_READ_IO, F2FS_BLKSIZE(sbi));
 
 	if (atomic_inode)
 		iput(atomic_inode);
@@ -1424,9 +1424,9 @@ static int move_data_block(struct inode *inode, block_t bidx,
 		}
 
 		f2fs_update_iostat(fio.sbi, inode, FS_DATA_READ_IO,
-							F2FS_BLKSIZE);
+						F2FS_BLKSIZE(fio.sbi));
 		f2fs_update_iostat(fio.sbi, NULL, FS_GDATA_READ_IO,
-							F2FS_BLKSIZE);
+						F2FS_BLKSIZE(fio.sbi));
 
 		folio_lock(mfolio);
 		if (unlikely(!is_meta_folio(mfolio) ||
@@ -1477,7 +1477,8 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	fio.new_blkaddr = newaddr;
 	f2fs_submit_page_write(&fio);
 
-	f2fs_update_iostat(fio.sbi, NULL, FS_GC_DATA_IO, F2FS_BLKSIZE);
+	f2fs_update_iostat(fio.sbi, NULL, FS_GC_DATA_IO,
+					F2FS_BLKSIZE(fio.sbi));
 
 	f2fs_update_data_blkaddr(&dn, newaddr);
 	set_inode_flag(inode, FI_APPEND_WRITE);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 73cd9b6ddcc5..3e0b9449ffba 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -448,7 +448,7 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct folio *ifolio,
 	 * Start by zeroing the full block, to ensure that all unused space is
 	 * zeroed and no uninitialized memory is leaked to disk.
 	 */
-	memset(dentry_blk, 0, F2FS_BLKSIZE);
+	memset(dentry_blk, 0, F2FS_BLKSIZE(F2FS_I_SB(dir)));
 
 	make_dentry_ptr_inline(dir, &src, inline_dentry);
 	make_dentry_ptr_block(dir, &dst, dentry_blk);
@@ -477,8 +477,8 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct folio *ifolio,
 		F2FS_I(dir)->i_inline_xattr_size = 0;
 
 	f2fs_i_depth_write(dir, 1);
-	if (i_size_read(dir) < PAGE_SIZE)
-		f2fs_i_size_write(dir, PAGE_SIZE);
+	if (i_size_read(dir) < F2FS_BLKSIZE(F2FS_I_SB(dir)))
+		f2fs_i_size_write(dir, F2FS_BLKSIZE(F2FS_I_SB(dir)));
 out:
 	f2fs_folio_put(folio, true);
 	return err;
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index b628fdc4198f..b947b724b3bc 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -165,7 +165,7 @@ static __u32 f2fs_inode_chksum(struct f2fs_sb_info *sbi, struct folio *folio)
 	chksum = f2fs_chksum(chksum, (__u8 *)&dummy_cs, cs_size);
 	offset += cs_size;
 	chksum = f2fs_chksum(chksum, (__u8 *)ri + offset,
-			     F2FS_BLKSIZE - offset);
+			     F2FS_BLKSIZE(sbi) - offset);
 	return chksum;
 }
 
@@ -447,7 +447,7 @@ static int do_read_inode(struct inode *inode)
 	set_nlink(inode, le32_to_cpu(ri->i_links));
 	inode->i_size = le64_to_cpu(ri->i_size);
 	inode->i_blocks = SECTOR_FROM_BLOCK(sbi,
-			le64_to_cpu(ri->i_blocks) - 1);
+					    le64_to_cpu(ri->i_blocks) - 1);
 
 	inode_set_atime(inode, le64_to_cpu(ri->i_atime),
 			le32_to_cpu(ri->i_atime_nsec));
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e7aa3b790214..8d16715a3aae 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -165,7 +165,7 @@ static struct folio *get_next_nat_folio(struct f2fs_sb_info *sbi, nid_t nid)
 
 	src_addr = folio_address(src_folio);
 	dst_addr = folio_address(dst_folio);
-	memcpy(dst_addr, src_addr, PAGE_SIZE);
+	memcpy(dst_addr, src_addr, F2FS_BLKSIZE(sbi));
 	folio_mark_dirty(dst_folio);
 	f2fs_folio_put(src_folio, true);
 
@@ -1498,7 +1498,8 @@ static int read_node_folio(struct folio *folio, blk_opf_t op_flags)
 	err = f2fs_submit_page_bio(&fio);
 
 	if (!err)
-		f2fs_update_iostat(sbi, NULL, FS_NODE_READ_IO, F2FS_BLKSIZE);
+		f2fs_update_iostat(sbi, NULL, FS_NODE_READ_IO,
+				   F2FS_BLKSIZE(sbi));
 
 	return err;
 }
@@ -3311,7 +3312,7 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *sbi)
 			return PTR_ERR(folio);
 
 		memcpy(nm_i->nat_bits + F2FS_BLK_TO_BYTES(sbi, i),
-					folio_address(folio), F2FS_BLKSIZE);
+					folio_address(folio), F2FS_BLKSIZE(sbi));
 		f2fs_folio_put(folio, true);
 	}
 
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 6a2b7c63f4a3..32125f8fc753 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -284,7 +284,7 @@ static inline void fill_node_footer(const struct folio *folio, nid_t nid,
 	unsigned int old_flag = 0;
 
 	if (reset)
-		memset(rn, 0, F2FS_BLKSIZE);
+		memset(rn, 0, F2FS_BLKSIZE(F2FS_F_SB(folio)));
 	else
 		old_flag = le32_to_cpu(footer->flag);
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index f58b26c84b3a..f2641a6080ae 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1316,7 +1316,8 @@ static void __submit_zone_reset_cmd(struct f2fs_sb_info *sbi,
 	submit_bio(bio);
 
 	atomic_inc(&dcc->issued_discard);
-	f2fs_update_iostat(sbi, NULL, FS_ZONE_RESET_IO, dc->di.len * F2FS_BLKSIZE);
+	f2fs_update_iostat(sbi, NULL, FS_ZONE_RESET_IO,
+			   dc->di.len * F2FS_BLKSIZE(sbi));
 }
 #endif
 
@@ -1419,7 +1420,8 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 
 		atomic_inc(&dcc->issued_discard);
 
-		f2fs_update_iostat(sbi, NULL, FS_DISCARD_IO, len * F2FS_BLKSIZE);
+		f2fs_update_iostat(sbi, NULL, FS_DISCARD_IO,
+			   len * F2FS_BLKSIZE(sbi));
 
 		lstart += len;
 		start += len;
@@ -2797,7 +2799,7 @@ void f2fs_update_meta_page(struct f2fs_sb_info *sbi,
 	if (IS_ERR(folio))
 		return;
 
-	memcpy(folio_address(folio), src, PAGE_SIZE);
+	memcpy(folio_address(folio), src, F2FS_BLKSIZE(sbi));
 	folio_mark_dirty(folio);
 	f2fs_folio_put(folio, true);
 }
@@ -4152,7 +4154,7 @@ void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct folio *folio,
 	f2fs_submit_page_write(&fio);
 
 	stat_inc_meta_count(sbi, folio->index);
-	f2fs_update_iostat(sbi, NULL, io_type, F2FS_BLKSIZE);
+	f2fs_update_iostat(sbi, NULL, io_type, F2FS_BLKSIZE(sbi));
 }
 
 void f2fs_do_write_node_page(unsigned int nid, struct f2fs_io_info *fio)
@@ -4162,7 +4164,8 @@ void f2fs_do_write_node_page(unsigned int nid, struct f2fs_io_info *fio)
 	set_summary(&sum, nid, 0, 0);
 	do_write_page(&sum, fio);
 
-	f2fs_update_iostat(fio->sbi, NULL, fio->io_type, F2FS_BLKSIZE);
+	f2fs_update_iostat(fio->sbi, NULL, fio->io_type,
+					F2FS_BLKSIZE(fio->sbi));
 }
 
 void f2fs_outplace_write_data(struct dnode_of_data *dn,
@@ -4178,7 +4181,8 @@ void f2fs_outplace_write_data(struct dnode_of_data *dn,
 	do_write_page(&sum, fio);
 	f2fs_update_data_blkaddr(dn, fio->new_blkaddr);
 
-	f2fs_update_iostat(sbi, dn->inode, fio->io_type, F2FS_BLKSIZE);
+	f2fs_update_iostat(sbi, dn->inode, fio->io_type,
+					F2FS_BLKSIZE(sbi));
 }
 
 int f2fs_inplace_write_data(struct f2fs_io_info *fio)
@@ -4220,7 +4224,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		f2fs_update_device_state(fio->sbi, fio->ino,
 						fio->new_blkaddr, 1);
 		f2fs_update_iostat(fio->sbi, fio_inode(fio),
-						fio->io_type, F2FS_BLKSIZE);
+						fio->io_type, F2FS_BLKSIZE(fio->sbi));
 	}
 
 	return err;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 2275404e769c..2c85c085961b 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -116,7 +116,7 @@ f2fs_start_segno(struct f2fs_sb_info *sbi, unsigned int segno)
 
 #define SECTOR_FROM_BLOCK(sbi, blk_addr)				\
 	(((sector_t)blk_addr) << F2FS_LOG_SECTORS_PER_BLOCK(sbi))
-#define SECTOR_TO_BLOCK(sbi, sectors)					\
+#define SECTOR_TO_BLOCK(sbi, sectors)				\
 	((sectors) >> F2FS_LOG_SECTORS_PER_BLOCK(sbi))
 
 /*
@@ -432,7 +432,7 @@ static inline void seg_info_to_sit_folio(struct f2fs_sb_info *sbi,
 	int i;
 
 	raw_sit = folio_address(folio);
-	memset(raw_sit, 0, PAGE_SIZE);
+	memset(raw_sit, 0, F2FS_BLKSIZE(sbi));
 	for (i = 0; i < end - start; i++) {
 		rs = &raw_sit->entries[i];
 		se = get_seg_entry(sbi, start + i);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b962c14cbcc1..ca6403a0ed88 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1610,7 +1610,7 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 			return -EINVAL;
 		}
 		min_size = MIN_INLINE_XATTR_SIZE;
-		max_size = MAX_INLINE_XATTR_SIZE_FOR_BLOCKSIZE(F2FS_BLKSIZE);
+		max_size = MAX_INLINE_XATTR_SIZE_FOR_BLOCKSIZE(F2FS_BLKSIZE(sbi));
 
 		if (F2FS_OPTION(sbi).inline_xattr_size < min_size ||
 				F2FS_OPTION(sbi).inline_xattr_size > max_size) {
@@ -4079,10 +4079,10 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	}
 
 	/* only support block_size equals to PAGE_SIZE */
-	if (le32_to_cpu(raw_super->log_blocksize) != F2FS_BLKSIZE_BITS) {
+	if (le32_to_cpu(raw_super->log_blocksize) != PAGE_SHIFT) {
 		f2fs_info(sbi, "Invalid log_blocksize (%u), supports only %u",
 			  le32_to_cpu(raw_super->log_blocksize),
-			  F2FS_BLKSIZE_BITS);
+			  PAGE_SHIFT);
 		return -EFSCORRUPTED;
 	}
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 811e350a1430..aaca9ed9b169 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1871,8 +1871,8 @@ static int __maybe_unused disk_map_seq_show(struct seq_file *seq,
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	int i;
 
-	seq_printf(seq, "Address Layout   : %5luB Block address (# of Segments)\n",
-					F2FS_BLKSIZE);
+	seq_printf(seq, "Address Layout   : %5uB Block address (# of Segments)\n",
+		   F2FS_BLKSIZE(sbi));
 	seq_printf(seq, " SB            : %12s\n", "0/1024B");
 	seq_printf(seq, " seg0_blkaddr  : 0x%010x\n", SEG0_BLKADDR(sbi));
 	seq_printf(seq, " Checkpoint    : 0x%010x (%10d)\n",
@@ -1889,13 +1889,13 @@ static int __maybe_unused disk_map_seq_show(struct seq_file *seq,
 	seq_printf(seq, " Main          : 0x%010x (%10d)\n",
 			SM_I(sbi)->main_blkaddr,
 			le32_to_cpu(F2FS_RAW_SUPER(sbi)->segment_count_main));
-	seq_printf(seq, " Block size    : %12lu KB\n", F2FS_BLKSIZE >> 10);
+	seq_printf(seq, " Block size    : %12u KB\n", F2FS_BLKSIZE(sbi) >> 10);
 	seq_printf(seq, " Segment size  : %12d MB\n",
-			(BLKS_PER_SEG(sbi) << (F2FS_BLKSIZE_BITS - 10)) >> 10);
+			(BLKS_PER_SEG(sbi) << (F2FS_BLKSIZE_BITS(sbi) - 10)) >> 10);
 	seq_printf(seq, " Segs/Sections : %12d\n",
 			SEGS_PER_SEC(sbi));
 	seq_printf(seq, " Section size  : %12d MB\n",
-			(BLKS_PER_SEC(sbi) << (F2FS_BLKSIZE_BITS - 10)) >> 10);
+			(BLKS_PER_SEC(sbi) << (F2FS_BLKSIZE_BITS(sbi) - 10)) >> 10);
 	seq_printf(seq, " # of Sections : %12d\n",
 			le32_to_cpu(F2FS_RAW_SUPER(sbi)->section_count));
 
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 99c863513725..98059e583b09 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -850,4 +850,4 @@ int __init f2fs_init_xattr_cache(void)
 void f2fs_destroy_xattr_cache(void)
 {
 	kmem_cache_destroy(inline_xattr_slab);
-}
\ No newline at end of file
+}
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index f622d26f37a7..957bb713ff24 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -14,12 +14,9 @@
 #define F2FS_SUPER_OFFSET		1024	/* byte-size offset */
 #define F2FS_MIN_LOG_SECTOR_SIZE	9	/* 9 bits for 512 bytes */
 #define F2FS_MAX_LOG_SECTOR_SIZE	PAGE_SHIFT	/* Max is Block Size */
-#define F2FS_LOG_SECTORS_PER_BLOCK(sbi)	((sbi)->log_blocksize - 9) /* log number for sector/blk */
 #define F2FS_MIN_LOG_BLOCKSIZE		12
 #define F2FS_MIN_BLKSIZE		4096UL
-#define F2FS_BLKSIZE			PAGE_SIZE /* support only block == page */
 #define F2FS_MAX_BLKSIZE		PAGE_SIZE
-#define F2FS_BLKSIZE_BITS		PAGE_SHIFT /* bits for F2FS_BLKSIZE */
 #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
 #define F2FS_EXTENSION_LEN		8	/* max size of extension */
 
@@ -27,15 +24,19 @@
 #define NEW_ADDR		((block_t)-1)	/* used as block_t addresses */
 #define COMPRESS_ADDR		((block_t)-2)	/* used as compressed data flag */
 
-#define F2FS_BLKSIZE_MASK		(F2FS_BLKSIZE - 1)
+#define F2FS_BLKSIZE(sbi)		((sbi)->blocksize)
+#define F2FS_BLKSIZE_BITS(sbi)		((sbi)->log_blocksize)
+#define F2FS_BLKSIZE_MASK(sbi)		(F2FS_BLKSIZE(sbi) - 1)
+#define F2FS_LOG_SECTORS_PER_BLOCK(sbi)	(F2FS_BLKSIZE_BITS(sbi) - 9)
+#define F2FS_BLKS_PER_PAGE(sbi)		(PAGE_SIZE / F2FS_BLKSIZE(sbi))
 #define F2FS_BYTES_TO_BLK(sbi, bytes)					\
-	((unsigned long long)(bytes) >> (sbi)->log_blocksize)
+	((unsigned long long)(bytes) >> F2FS_BLKSIZE_BITS(sbi))
 #define F2FS_BLK_TO_BYTES(sbi, blk)					\
-	((unsigned long long)(blk) << (sbi)->log_blocksize)
+	((unsigned long long)(blk) << F2FS_BLKSIZE_BITS(sbi))
 #define F2FS_BLK_END_BYTES(sbi, blk)					\
 	(F2FS_BLK_TO_BYTES(sbi, (blk) + 1) - 1)
 #define F2FS_BLK_ALIGN(sbi, x)						\
-	DIV_ROUND_UP_ULL((x), (sbi)->blocksize)
+	DIV_ROUND_UP_ULL((x), F2FS_BLKSIZE(sbi))
 
 /* 0, 1(node nid), 2(meta nid) are reserved node id */
 #define F2FS_RESERVED_NODE_NUM		3
@@ -221,7 +222,6 @@ struct f2fs_checkpoint {
 	unsigned char sit_nat_version_bitmap[];
 } __packed;
 
-#define CP_CHKSUM_OFFSET	(F2FS_BLKSIZE - sizeof(__le32))	/* default chksum offset in checkpoint */
 #define CP_MIN_CHKSUM_OFFSET						\
 	(offsetof(struct f2fs_checkpoint, sit_nat_version_bitmap))
 
@@ -271,7 +271,7 @@ struct node_footer {
 } __packed;
 
 /* Address Pointers in an Inode */
-#define DEF_ADDRS_PER_INODE	((F2FS_BLKSIZE - OFFSET_OF_END_OF_I_EXT	\
+#define DEF_ADDRS_PER_INODE	((PAGE_SIZE - OFFSET_OF_END_OF_I_EXT	\
 					- SIZE_OF_I_NID	\
 					- sizeof(struct node_footer)) / sizeof(__le32))
 #define CUR_ADDRS_PER_INODE(inode)	(DEF_ADDRS_PER_INODE - \
@@ -279,10 +279,10 @@ struct node_footer {
 #define DEF_NIDS_PER_INODE	5	/* Node IDs in an Inode */
 #define ADDRS_PER_INODE(inode)	addrs_per_page(inode, true)
 /* Address Pointers in a Direct Block */
-#define DEF_ADDRS_PER_BLOCK	((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
+#define DEF_ADDRS_PER_BLOCK	((PAGE_SIZE - sizeof(struct node_footer)) / sizeof(__le32))
 #define ADDRS_PER_BLOCK(inode)	addrs_per_page(inode, false)
 /* Node IDs in an Indirect Block */
-#define NIDS_PER_BLOCK		((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
+#define NIDS_PER_BLOCK		((PAGE_SIZE - sizeof(struct node_footer)) / sizeof(__le32))
 
 #define ADDRS_PER_PAGE(folio, inode)	(addrs_per_page(inode, IS_INODE(folio)))
 
-- 
2.53.0

