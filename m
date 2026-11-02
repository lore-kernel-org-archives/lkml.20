Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648426;
	b=PtdJlsymmi8hI7UZ5u7iXaSB45AvmSc9ZSTUxTWz8TgKEdBbbx8osewzFA0P7LoVifYB
	 pqMO5vfqFlwfkO0vHYTDS/bWN0yBaMsHWtmhy889FHlT1PVOFOPoQWdwrvyGDUKTmve5m
	 jkERm+gIj7y9NbexNYE5MP3wspkTeTtTFfwf0zSDgZhJfZDou9p5XEyCrS5rEnC8y9AEO
	 oP6R62W6ghFa0kz9wWIFVdIIwX4SHz5YvAXKj6MUEO80mgV/e8NmR7mOMmTmUcSNDsoE7
	 0Q5Lm0dX7manoOcQyKAWSRPMYeUazVdSKHyopitAqVjVsmeNObPf61SLpzuypmjP61Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y8IZnBsQxe10jjN/vGbP+pxieyV6s+i8M8IhvLraaUU=;
	b=TnOSXjKO9MVeSZ92W4iaJWf+VCuMYjb17Z3Unnr0HqWI8R68L4Efb/Vqpgq9lc879Y7q
	 qGa59Q73XA7+sf8DIIdRRPZwMtnQx7R9V3sZKVkaCftm/HyR9TnDiBNjMrVTbO6NnVBuQ
	 dpPby4+TiSNeKBfcxH1KYX1DCBPzeXjjVz4wdOiMgWdGrBNHExPEo4lj+AtwTxNS6Vjc0
	 d94igcl8NYPFOSBFcP6FcpwXRcjdf4rDTbjlmCUyxWpZOWlG1rjcPW3JR37N3e9gJedW2
	 XpPIb2bZ6MVct6no4eW/BjS3rhqQO5m7NNlwX4/FlAFuUIkwxvBV5TbsvVE+QFjVuQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EdCrvoZ/";
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BB5606EE97
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31BB5606EE97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EdCrvoZ/
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1754504a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648425; x=1794253225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8IZnBsQxe10jjN/vGbP+pxieyV6s+i8M8IhvLraaUU=;
        b=EdCrvoZ/GEX+0xZ+WXgGVWXYTNjTbIN8ZHi8uNOgaTuzENexHl6DB46hbgi4ZH5kvM
         SGXlHOvr8wunf5/D3a3xBy8M5ofr3+7rAoqYi0tNrakHcL5QCQOzkTXYNFUudupJbg2I
         D+rPkZoNOjCwyMlCbx9NFooVA036rJtAdrqQz5DEkD/iuKEY1hz6M5DPRK7s2YTkuMYV
         ooG+VGUdOQMNJrptbumntm8bYq5DVvmnCPsZwWRX/U1kZ0INSBMhr9YfuxVdenqP35r+
         hppI0MQHvLE2vOeBfAJigqtyJ3hwfkQkLKnE5Bql1iSqWz2mr9cU8W3EOpsd+kARmG5i
         onaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648425; x=1794253225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y8IZnBsQxe10jjN/vGbP+pxieyV6s+i8M8IhvLraaUU=;
        b=HeA+odXtxbRdAylssiebFWiozEnrPmVqzpqwolxKQwWiWH3LsZrC98lbZZOJqcQto0
         DMk1cWwPxHHD5xKapRsU8E0PQvNNwGkdVfIbEBYuG1bdxYgav6lPNgIBEjNl2ii/2tYR
         qas+3qMrnuyyzsuXioTYPyFcXAZG8wQcQ+tzZVLi4t0ZOMqqJNjg5yCk6FQZYd+8vDi1
         zBRJioGoGK5g92fs2Z1p2F2gdKV68tX/CEf/FA+x5HDeIL0LKK8SnX1owMVo2b8P4zeH
         8BGgIxMwMO6Vuyznah8maQ/0sFVxoHiVDdWoAYms0Df+zEeVvGBZ0eINwoZ8NX6Tu0+9
         NG4A==
X-Gm-Message-State: AFq9FYJIFDdxutrQp02hsYxGCt13OTTjxgYgaYSV0bEClOD0dt2Q5jgR
	HIw2c3fMZVq+j4jeSSEUM38eOwynX3+nX+3KtdgPt8P73vHwqzYWqzb1f97mmvoT
X-Gm-Gg: AYBFou1TvMQTE3/HbYt+dP4QYHIJv8UGHLB/nwgWHu02av1zTZLyD6PcHBL9QgmONhp
	a+CYIFUgvw93gZZhNDgcFFVlALwSNpwWLj/m56Y/6KbHZ87UNKg8ZrEG7mBIrVqNMPLL9imgZkk
	9Cp03kOvkqgrlAsCGCvZTtGhUsQ3dI4CXBwWVDv+HOqqw12E+99DEAnSIyWw+f3XoMIFkbFFh/X
	bRN5YC7PEIJ80sLigD4aEkaXXSSWGnyprryMg2nLf/wbZyKb2YdcbNn9lLZRlD7ppQjY/3dWC/X
	RHtGrE7aUI6dy4M6nyB2pbrEDA1aMWZ8UHWGL6+s/rSwGx729RUh8wLwYb5h+GVMTTB21lpAkUZ
	RLWp/YvOZJl2gm9VNFrQf3TZ0kzGN28BblV9PiJMKpfnNackyPse5oTo5bBbZK9w6R2kCl6lvpD
	2AWCjM1paaYgYZFmIKqM18LXWdxvGK/dDpMp0SbB/GwxAicqpP4rtrlbCXezL4vhPp6ekuSIkF3
	Vg/vwHVtZnnphmZlj2fIu21Jr82RSEidQ0OAMmOR90NJOh6+IvMvZaLHeRVZVfVX81Nx4pSxSBg
	YPwyf7njp8P0P7MDzw+djxCgOXu2B9GGHBy/P5lXiWc6/l0fYpAFY7HCLc8SVqGJnbO0a78GHBI
	xVzRaKrniL1cuMsTMuCHsRatGxY67umjERMqFh/GlwrH8ag==
X-Received: by 2002:a05:6a20:7f9f:b0:3e2:3222:2559 with SMTP id adf61e73a8af0-3e92908c5eamr9596022637.62.1793648425514;
        Mon, 02 Nov 2026 11:40:25 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364c48d4sm241826a12.27.2026.11.02.11.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:40:24 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 10/20] f2fs: support subpage blocks in collapse and insert range
Date: Mon,  2 Nov 2026 11:39:42 -0800
Message-ID: <20261102193952.3002018-11-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261102193952.3002018-1-daeho43@gmail.com>
References: <20261102193952.3002018-1-daeho43@gmail.com>
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

From: Daeho Jeong <daehojeong@google.com>

The folio holding offset may hold blocks before the shifted range.
Write back the page cache from the PAGE_SIZE boundary below offset
under invalidate_lock before truncating it from there, so that no
data is lost. Detect src and dst in the same folio by folio index
instead of block index, as a folio holds several blocks. Remove the
-EOPNOTSUPP check.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 72 +++++++++++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 36da0d558ef0..3ef810653bb2 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1659,6 +1659,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 		} else {
 			struct folio *fsrc, *fdst;
 			size_t src_off, dst_off;
+			pgoff_t dst_fidx = f2fs_lblk_to_folio_index(sbi, dst + i);
 			bool same_folio;
 
 			fsrc = f2fs_get_lock_data_folio(src_inode,
@@ -1671,11 +1672,11 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 
 			/*
 			 * For same-inode operations (collapse/insert), src and
-			 * dst may fall within the same large folio. Detect this
+			 * dst may fall within the same folio. Detect this
 			 * to avoid self-deadlock on folio lock.
 			 */
 			same_folio = src_inode == dst_inode &&
-				     folio_contains(fsrc, dst + i);
+				     folio_contains(fsrc, dst_fidx);
 			if (same_folio) {
 				struct dnode_of_data dn;
 
@@ -1783,7 +1784,7 @@ static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_lock_context lc;
-	pgoff_t nrpages = F2FS_BLK_ALIGN(sbi, i_size_read(inode));
+	pgoff_t nrblocks = F2FS_BLK_ALIGN(sbi, i_size_read(inode));
 	pgoff_t start = F2FS_BYTES_TO_BLK(sbi, offset);
 	pgoff_t end = F2FS_BYTES_TO_BLK(sbi, offset + len);
 	int ret;
@@ -1794,14 +1795,24 @@ static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(inode->i_mapping);
 
+	/*
+	 * Write back under invalidate_lock, which blocks page_mkwrite, so
+	 * that truncate_pagecache() below cannot drop a racing mmap store to
+	 * the blocks before @offset in the head folio.
+	 */
+	ret = filemap_write_and_wait_range(inode->i_mapping,
+					   round_down(offset, PAGE_SIZE), LLONG_MAX);
+	if (ret)
+		goto out_unlock;
+
 	ret = f2fs_zero_post_eof_page(inode, offset + len, false, false);
 	if (ret)
 		goto out_unlock;
 
 	f2fs_lock_op(sbi, &lc);
 	f2fs_drop_extent_tree(inode);
-	truncate_pagecache(inode, offset);
-	ret = __exchange_data_block(inode, inode, end, start, nrpages - end, true);
+	truncate_pagecache(inode, round_down(offset, PAGE_SIZE));
+	ret = __exchange_data_block(inode, inode, end, start, nrblocks - end, true);
 	f2fs_unlock_op(sbi, &lc);
 
 out_unlock:
@@ -1827,21 +1838,17 @@ static int f2fs_collapse_range(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
-	/* write out all dirty pages from offset */
-	ret = filemap_write_and_wait_range(inode->i_mapping, offset, LLONG_MAX);
-	if (ret)
-		return ret;
-
 	ret = f2fs_do_collapse(inode, offset, len);
 	if (ret)
 		return ret;
 
 	/* write out all moved pages, if possible */
 	filemap_invalidate_lock(inode->i_mapping);
-	ret = filemap_write_and_wait_range(inode->i_mapping, offset, LLONG_MAX);
+	ret = filemap_write_and_wait_range(inode->i_mapping,
+					   round_down(offset, PAGE_SIZE), LLONG_MAX);
 	if (ret)
 		goto out_unlock;
-	truncate_pagecache(inode, offset);
+	truncate_pagecache(inode, round_down(offset, PAGE_SIZE));
 
 	new_size = i_size_read(inode) - len;
 	ret = f2fs_truncate_blocks(inode, new_size, true);
@@ -2028,7 +2035,7 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct address_space *mapping = inode->i_mapping;
-	pgoff_t nr, pg_start, pg_end, delta, idx;
+	pgoff_t nr, blk_start, blk_end, delta, idx;
 	loff_t new_size;
 	int ret = 0;
 
@@ -2041,8 +2048,8 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 		return -EINVAL;
 
 	/* insert range should be aligned to block size of f2fs. */
-	if (offset & F2FS_BLKSIZE_MASK(F2FS_I_SB(inode)) ||
-	    len & F2FS_BLKSIZE_MASK(F2FS_I_SB(inode)))
+	if (offset & F2FS_BLKSIZE_MASK(sbi) ||
+	    len & F2FS_BLKSIZE_MASK(sbi))
 		return -EINVAL;
 
 	ret = f2fs_convert_inline_inode(inode);
@@ -2057,29 +2064,34 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
-	/* write out all dirty pages from offset */
-	ret = filemap_write_and_wait_range(mapping, offset, LLONG_MAX);
-	if (ret)
-		return ret;
-
-	pg_start = F2FS_BYTES_TO_BLK(sbi, offset);
-	pg_end = F2FS_BYTES_TO_BLK(sbi, offset + len);
-	delta = pg_end - pg_start;
+	blk_start = F2FS_BYTES_TO_BLK(sbi, offset);
+	blk_end = F2FS_BYTES_TO_BLK(sbi, offset + len);
+	delta = blk_end - blk_start;
 	idx = F2FS_BLK_ALIGN(sbi, i_size_read(inode));
 
 	/* avoid gc operation during block exchange */
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(mapping);
 
+	/*
+	 * Write back under invalidate_lock, which blocks page_mkwrite, so
+	 * that truncate_pagecache() below cannot drop a racing mmap store to
+	 * the blocks before @offset in the head folio.
+	 */
+	ret = filemap_write_and_wait_range(mapping,
+					   round_down(offset, PAGE_SIZE), LLONG_MAX);
+	if (ret)
+		goto out_unlock;
+
 	ret = f2fs_zero_post_eof_page(inode, offset + len, false, false);
 	if (ret)
 		goto out_unlock;
-	truncate_pagecache(inode, offset);
+	truncate_pagecache(inode, round_down(offset, PAGE_SIZE));
 
-	while (!ret && idx > pg_start) {
+	while (!ret && idx > blk_start) {
 		struct f2fs_lock_context lc;
 
-		nr = idx - pg_start;
+		nr = idx - blk_start;
 		if (nr > delta)
 			nr = delta;
 		idx -= nr;
@@ -2099,8 +2111,9 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 
 	/* write out all moved pages, if possible */
 	filemap_invalidate_lock(mapping);
-	ret = filemap_write_and_wait_range(mapping, offset, LLONG_MAX);
-	truncate_pagecache(inode, offset);
+	ret = filemap_write_and_wait_range(mapping,
+					   round_down(offset, PAGE_SIZE), LLONG_MAX);
+	truncate_pagecache(inode, round_down(offset, PAGE_SIZE));
 	filemap_invalidate_unlock(mapping);
 
 	if (!ret)
@@ -2286,8 +2299,7 @@ static long f2fs_fallocate(struct file *file, int mode,
 	}
 
 	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode))) {
-		if ((mode & (FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_INSERT_RANGE)) ||
-		    f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
+		if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
 			ret = -EOPNOTSUPP;
 			goto out;
 		}
-- 
2.56.0.317.g454f8302e1-goog

