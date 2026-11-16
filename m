Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802159;
	b=16wwDIxaDO/Vyb2KehDlzVOnFdvvLK23BNbQnOVKGF3Hh6nURZMr0UJl+z7M53TdwwY7
	 6ed/09aowguR+HN0FX1wm+2rikA7Oa4UNc/M4osWoa9Dhc2dTHwvjIZrEmETH0QdTfjQ8
	 0ITD3n4FJPARjJRcZV7MzgHfDMrc5twCZQ/pKLf7v+7mQRUwVOMniDgCFgSUYVbhFZ2fz
	 iFGtnPL/BfZoto/kKerzPaM7wc6Hun0vbT7mdHUt/GIE5zbVuJcauO3uM0Bieo/h2exTe
	 Zi9aoYu24zlsymr48Mfl2P8xPtu1+twXbABUenkB1PtLt0ghwMXTYf53EkCJog5Auwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AMdUKRQlAJUKk0DcfTjI5nVHuAmHsiYW7/Tij+xmyXk=;
	b=b3PKzfrp1/RASGh0k2eqm2kK0hT5U3n7h4/KVaLneQjqvupnwk3USCwuVStwa9HdL8Z2
	 8tFhLIfcJ/60mNNj+ml3HrIDnNkkzdY4La2jHZM8Sjkjo5EDwpI2QQpx4JahsX/i0Tdlf
	 MFC2ZzJLFHhcDYIxHELhLc6A8dMXH29S5+P9gEUKuHRFfrMBBi7w4Y1MPLRgp95sGznyD
	 b7rDamoxxVIcUg4UNaskN+aws7tfM6+FKXm6f3r95FTdXEXUrOkBfY9FNoGmtiDonCvWe
	 P6WURqKpgq6MZnf6S6zeRQEyrwzisF850KxiMr7Xnw+7fHEG3tWamXBkc1n7CHsxWYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aVfcvAsf;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA48606A893
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCA48606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aVfcvAsf
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso3506354a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802158; x=1795406958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMdUKRQlAJUKk0DcfTjI5nVHuAmHsiYW7/Tij+xmyXk=;
        b=aVfcvAsfW2PeG0kRgYoDPmtMw+SFaAdAAgB/ChaeStprrzwpJEGFxeYTOzAgb7Bb/i
         ymu/Jm4fTKkRHzkwraBXUVyqtXM4eiXOFFmDwGZ2sVMNe9hpXXw1eFXePcCL1O/sGnmF
         pf0WwDkg9CVZZp2gLEM/wx+TEncbzxopfU3wlauMxDNckl3MUC5nyyrcctUfBOOEFzax
         0E6rbQMgEiFJw5CB960fYeNuW0UKR0pxvGWohwjZf4P/dAi9kq+z486QZq+SLSIx1uDg
         Tc/WCi4SLrd3IjOY+5RTKLx+8oIDg1x5xKzV0trQJGKb8gx2ei3T0WlVETwYdqmtFCOu
         eO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802158; x=1795406958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AMdUKRQlAJUKk0DcfTjI5nVHuAmHsiYW7/Tij+xmyXk=;
        b=VpbGpKJt3pG0brbp3IG8FApVM4GoexuOkfsuawKCLPJvqUTUj6Es6ZkpovoPLCKX2C
         rznfVZm08TkeSSUIFKTDxJ//U/n1IBVwC/wZeVvWjCBHwh+DWPJs+liyfIxiZULNqI6l
         p6vQ2E2gBAMtLTKIs+tTenh80UbF7bpoMUyAu2bvDOFkGYNBJWb18IJntW+3GmsPqkqz
         JabRZh+3El2rHqeBd7Pl5dUdGwbkCrljbMojyQgkuDXXChpy47N9oS+J5Betfidg+zTc
         drEAtI4mivV+eKMxoILfx0WpDvM+JUQas/1j2vGMYrcn/yqj90Ypdic8A9EUsLSYA3gj
         nJwg==
X-Gm-Message-State: APuU4Z9y88l5QOWO25sNVShcrBbmTeUp1+7yLZhDgc9XBdhsy8uskCUo
	/apg/A9LHDiY0qMPOTTesLy4rcwUHNRlYSvkHdcDUAeY8NGMfSSEz0BTS3bwfg==
X-Gm-Gg: AYBFou11fFha0jGPLtQq/2ZyqsfM3y4dfne0yAEYY7vdsYNWmpkLbMuE965Vs4N4jJF
	2DtFI333swbonsgrNvfO0Ii2Ok8h3DL/N5xaw1i6A46bMqX6rMkUnvSZZopWuCVzewdbZ0DrGRy
	g5voJ3HBdVRvwWBQiM1j8pjY3V8Ed0or/xIUQx9WRQcEgcTIcDgvd9pB6tEcHDovrkbOryuzPb1
	zSG/JKVMfSGZqlNqCkMQkENSXs3P7x7lNWHR2Q58guBTz4G6pOjYh2j1HksYNtvJI3KHDReo4GV
	hL5wx/NGi4Rs/OLYfSv+AWMuElwWNdMFD32OZSfT1fW1s/AlHPo+E397kAPFaO34O30+oedIl+T
	wj/vwhOLiOJ0X+FDsQq9pQBsWW8kQGRAHYjyrtrxgVheZ/LpBFqQAE9ycbatH3soDWPmYu82lIn
	9nkr0CjExciu1vko/An/sexPFd5w/C6nD8R2dj93csV1y2qbHBeeYAeu5kTe07lUJp8rueQibr0
	DFoKEXLv1HsyxEH+qVqaGMaB7uq/d5+hF7sHG+htZeSF4yGFEsyuEmlDTOWiiVH+u7h6l/fAJzX
	7ajxFa6J6EORlsA5nESpEkdEIlYWQArol6mn6xcG4fgbst4Ql8WWKTk+VjvTZoFcPaeRSZT0N6N
	aF08+Qej5b85uz9ICnSBO/78oEk6qxSgf66lsjic/wbhIeJo=
X-Received: by 2002:a17:90b:2cc3:b0:3b0:9e42:b67c with SMTP id 98e67ed59e1d1-3b1b0d800e0mr9276558a91.61.1794802157998;
        Sun, 15 Nov 2026 20:09:17 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:17 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 10/20] f2fs: support subpage blocks in collapse and insert range
Date: Sun, 15 Nov 2026 20:08:41 -0800
Message-ID: <20261116040851.2849696-11-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261116040851.2849696-1-daeho43@gmail.com>
References: <20261116040851.2849696-1-daeho43@gmail.com>
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

Also take i_gc_rwsem[WRITE] and invalidate_lock before that writeback
and keep them until the moved blocks are written back and the page
cache is dropped, as move range does. After the block exchange, the
page cache holds the old data of the source blocks until then. With
subpage blocks, page_mkwrite dirties every block of a folio up to EOF,
so a store to a neighbouring block in between writes the old data back,
over a hole or over the moved data. This also keeps GC away from the
inode until then, for any block size.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 115 ++++++++++++++++++++++++++++---------------------
 1 file changed, 65 insertions(+), 50 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 72c601d240d4..d4472143dea0 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1671,6 +1671,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 		} else {
 			struct folio *fsrc, *fdst;
 			size_t src_off, dst_off;
+			pgoff_t dst_fidx = f2fs_lblk_to_folio_index(sbi, dst + i);
 			bool same_folio;
 
 			fsrc = f2fs_get_lock_data_folio(src_inode,
@@ -1683,11 +1684,11 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 
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
 
@@ -1795,30 +1796,30 @@ static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_lock_context lc;
-	pgoff_t nrpages = F2FS_BLK_ALIGN(sbi, i_size_read(inode));
+	pgoff_t nrblocks = F2FS_BLK_ALIGN(sbi, i_size_read(inode));
 	pgoff_t start = F2FS_BYTES_TO_BLK(sbi, offset);
 	pgoff_t end = F2FS_BYTES_TO_BLK(sbi, offset + len);
 	int ret;
 
-	f2fs_balance_fs(sbi, true);
-
-	/* avoid gc operation during block exchange */
-	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-	filemap_invalidate_lock(inode->i_mapping);
+	/*
+	 * Write back under invalidate_lock, which blocks page_mkwrite, so
+	 * that truncate_pagecache() below cannot drop a racing mmap store to
+	 * the blocks before @offset in the head folio.
+	 */
+	ret = filemap_write_and_wait_range(inode->i_mapping,
+					   round_down(offset, PAGE_SIZE), LLONG_MAX);
+	if (ret)
+		return ret;
 
 	ret = f2fs_zero_post_eof_page(inode, offset + len, false, false);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
 	f2fs_lock_op(sbi, &lc);
 	f2fs_drop_extent_tree(inode);
-	truncate_pagecache(inode, offset);
-	ret = __exchange_data_block(inode, inode, end, start, nrpages - end, true);
+	truncate_pagecache(inode, round_down(offset, PAGE_SIZE));
+	ret = __exchange_data_block(inode, inode, end, start, nrblocks - end, true);
 	f2fs_unlock_op(sbi, &lc);
-
-out_unlock:
-	filemap_invalidate_unlock(inode->i_mapping);
-	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	return ret;
 }
 
@@ -1839,28 +1840,35 @@ static int f2fs_collapse_range(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
-	/* write out all dirty pages from offset */
-	ret = filemap_write_and_wait_range(inode->i_mapping, offset, LLONG_MAX);
-	if (ret)
-		return ret;
+	f2fs_balance_fs(F2FS_I_SB(inode), true);
+
+	/*
+	 * Avoid GC during the block exchange, and keep both locks until the
+	 * moved blocks are written back and the page cache is dropped. Until
+	 * then, it holds the old data of the source blocks, which neither
+	 * page_mkwrite nor GC may write back.
+	 */
+	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	filemap_invalidate_lock(inode->i_mapping);
 
 	ret = f2fs_do_collapse(inode, offset, len);
 	if (ret)
-		return ret;
+		goto out_unlock;
 
 	/* write out all moved pages, if possible */
-	filemap_invalidate_lock(inode->i_mapping);
-	ret = filemap_write_and_wait_range(inode->i_mapping, offset, LLONG_MAX);
+	ret = filemap_write_and_wait_range(inode->i_mapping,
+					   round_down(offset, PAGE_SIZE), LLONG_MAX);
 	if (ret)
 		goto out_unlock;
-	truncate_pagecache(inode, offset);
+	truncate_pagecache(inode, round_down(offset, PAGE_SIZE));
 
 	new_size = i_size_read(inode) - len;
 	ret = f2fs_truncate_blocks(inode, new_size, true);
-out_unlock:
-	filemap_invalidate_unlock(inode->i_mapping);
 	if (!ret)
 		f2fs_i_size_write(inode, new_size);
+out_unlock:
+	filemap_invalidate_unlock(inode->i_mapping);
+	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	return ret;
 }
 
@@ -2040,7 +2048,7 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct address_space *mapping = inode->i_mapping;
-	pgoff_t nr, pg_start, pg_end, delta, idx;
+	pgoff_t nr, blk_start, blk_end, delta, idx;
 	loff_t new_size;
 	int ret = 0;
 
@@ -2053,8 +2061,8 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 		return -EINVAL;
 
 	/* insert range should be aligned to block size of f2fs. */
-	if (offset & F2FS_BLKSIZE_MASK(F2FS_I_SB(inode)) ||
-	    len & F2FS_BLKSIZE_MASK(F2FS_I_SB(inode)))
+	if (offset & F2FS_BLKSIZE_MASK(sbi) ||
+	    len & F2FS_BLKSIZE_MASK(sbi))
 		return -EINVAL;
 
 	ret = f2fs_convert_inline_inode(inode);
@@ -2069,29 +2077,34 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
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
@@ -2103,20 +2116,23 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 					idx + delta, nr, false);
 		f2fs_unlock_op(sbi, &lc);
 	}
-out_unlock:
-	filemap_invalidate_unlock(mapping);
-	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	if (ret)
-		return ret;
+		goto out_unlock;
 
-	/* write out all moved pages, if possible */
-	filemap_invalidate_lock(mapping);
-	ret = filemap_write_and_wait_range(mapping, offset, LLONG_MAX);
-	truncate_pagecache(inode, offset);
-	filemap_invalidate_unlock(mapping);
+	/*
+	 * Write out all moved pages, if possible. Keep both locks until the
+	 * page cache is dropped. Until then, it holds the old data of the
+	 * source blocks, which neither page_mkwrite nor GC may write back.
+	 */
+	ret = filemap_write_and_wait_range(mapping,
+					   round_down(offset, PAGE_SIZE), LLONG_MAX);
+	truncate_pagecache(inode, round_down(offset, PAGE_SIZE));
 
 	if (!ret)
 		f2fs_i_size_write(inode, new_size);
+out_unlock:
+	filemap_invalidate_unlock(mapping);
+	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	return ret;
 }
 
@@ -2298,8 +2314,7 @@ static long f2fs_fallocate(struct file *file, int mode,
 	}
 
 	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode))) {
-		if ((mode & (FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_INSERT_RANGE)) ||
-		    f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
+		if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
 			ret = -EOPNOTSUPP;
 			goto out;
 		}
-- 
2.56.0.611.g1030f0b940-goog

