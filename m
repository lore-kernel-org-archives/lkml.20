Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802158;
	b=gLK5j/zQ9NtywQ5kq6JQofopupmNp7nhM1AWJY4XJiyL7muukPfbXgiQCKSX6jqF8yr7
	 oJQdyE2N8DgEwBa0UoBVzSpy4xr70yVzCMdHO5sPTQ48cbSYqtYbuKgS8G13yajZwIeex
	 ktCMvyqy8ow5+qxH6ZluOgnJ8d+u8sYyb8qKFcIaYNSsmXZfFTjqcVUU9xwQcA1kQmo1C
	 UIl84b6nm/Y2noMD8EtyAeiSHrzA6SJHgc0KGtyLI0xuJ6G+rkNLe/jP9g+tU0J+iWL/B
	 RssA2bJUM7IwIavFK+jYIcZJrvMuuxd5vhiXkAIuNR+NsV+duy3DLoUzkAO0NR0KhyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j0VPKgO989n+NNDklN+XyKtXoYiDkcwuRGozm/ZuM+g=;
	b=1BGRVGaepvyS3+VdI+A42Z1xJ47h5cDmZUArDugc+/iicz0v+2MKIHR4QQZVXkNX3n0C
	 5J5Oenhh8gAJihSG+F6DAJLCNzJneneKD2RdfXSeEHBMDrRhdGMTsGkI5O0o9DP2GRRtB
	 OuB1IFpYI2oEt4Am5jbW4Nb3Yx1QgyO8MBpqiwzKRqBSmuoXq23ptRctv2D4q13xPkCoP
	 YqZVifXpThbMrASo7SJ1TpH+fFHAcYQ4aKJ+EhPtXNq/++1v4WjM8wzQ8MZ8St/gx/l74
	 cVjzqUhcI4INEWl35lwCWheivEi/s4+AUeXFHOYyAIZQKwqgqGKAP+Y5HMTMYTTjtig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AH7AU4Vb;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9C3606A887
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A9C3606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AH7AU4Vb
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so1785107a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802156; x=1795406956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j0VPKgO989n+NNDklN+XyKtXoYiDkcwuRGozm/ZuM+g=;
        b=AH7AU4Vb4W6Nvw3Gke2unKzYaLzgyVPw/4pVJ7V49gEtY26IujPsbkuIDKtv9Wydan
         WKXnlEg3sfkpjwqhBbDzqtlyRCfD9sz+sFOzDNvtFqj//Znv/JM7t/2SWtPxkYnKLTbw
         RUUPgloeiEfHjq5QcHePXLPIblkJPaQGIOQuFuqb0QEwAdFY3/kTUe5RGVraCYrJC8XI
         93MUkwvIhPwMHCQVpRcaTVbSHJG/+CmnAmWkYg1JFEIsspj6uxB4DVeWlnwGPzk0oH/d
         aESQQ/epZhxVKiWzIQCmejw9O/hRAC3PM8UsZ0Vmgx9A+Oni7iIY29CCP0Lmccorjvwd
         zZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802156; x=1795406956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j0VPKgO989n+NNDklN+XyKtXoYiDkcwuRGozm/ZuM+g=;
        b=bVYu+RyiqsorC6+As0Pu7T87j1a/rM8rPBV4Qhe07vrPq2xfhtl+tQJ+p1EX/8h9QB
         bBkvbnN0zrPRm2MnqqCdmibWPQtAyHV+mB8URJbJtz0glyVvjtfhIDRHPdV7A+wIVtWD
         QcbOJ6xC+cAuhhc6n9k/hcEDzOY/djD4fj1G15ybnOtJt2KGlisZ35+7FyI06NG4Yemn
         iqR7FDlUSD8zLiiIw40iRPHXKezf6G6vHqiaNKl1yKB9wkuxt5lc8/WmLheSd68QksJb
         OSpFkRXeGrcOn8Bje/EKTUCHE6Q7VOsTn8iW1mbulCCggak22U/TMKZYHKHi4Se7JPlM
         YxBQ==
X-Gm-Message-State: APuU4Z9OEITApoeVbMOyivnockUjJFEGA4Dn4Lqn83s0JDuDX56TcHmv
	Tcikp37FZjYYTIG7QgqNhDAzDbNH+LJorTbLcLER+SFeOFKU5vWFymsp2QDkUg==
X-Gm-Gg: AYBFou3ZdXKHNuM2NUDpFK6AszQoVsR+e2J7Z/YA2dxWX0vgbgCZJ2gJNp+DwlU+WH8
	/iNuOMdOjFqmCJhhRw7nFJcEFgZTxMbEF87rUrHe3FXsGcksrwZVswO0JlIRy6aDqQ0rePgPmQy
	kYgFuU4lhbF7P3duuAfkFzM3MPu0iHGHrGlnA2f41ErjDJzXpndx5VnYn4erSk769xux+Rfolo4
	hN6Gf87AatCjfiKZaHqJQ46vhu94lAIvbAczPOIKxk3QNzuxjYPaU1EyJdSzqgQodpSPwRMkMro
	ywNL0q8f80LbO+YsE24BqKfT9HGU/L2w//B0gaqILyOI/h+/+Zsw6pOyuAEqaygLbEtICgv4/3m
	Qvuaa/T6/q18KwdR1QbwWnMSEFGEAjW30nsjgv+kB7lRvw8bQUB/ZQCEgP9KaoSVOcKBkBpfDnL
	akvjZL96wYigqW938kE2NA2q3j2+cdbkyeq8jhHnXqATcf3LaRw0csYBx1olU9INJkfwUoQD+ZL
	pIjDv/j0ie2cGEbWsBWgbUixx4/f8dBu+40zM1t+fK/hg0juTtiq0fycznbI8sm4qdrp0ETZBZx
	SoPxdL0yT64uRin+qgssNLphAjcZm1cj1ZKjYJqa2ONfQ92K6r2lISQYHMDGJwcrFMbrmLuKQr4
	bdu7g+8W9qS2lVo+KGsqpQo6IyOXe4BsFMrIueLPt6Uq+HG8=
X-Received: by 2002:a17:90b:5906:b0:3b0:934c:5e41 with SMTP id 98e67ed59e1d1-3b1b0b4acecmr8869559a91.29.1794802155256;
        Sun, 15 Nov 2026 20:09:15 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:14 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 08/20] f2fs: adapt range operations and mmap for subpage blocks
Date: Sun, 15 Nov 2026 20:08:39 -0800
Message-ID: <20261116040851.2849696-9-daeho43@gmail.com>
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

- A writable PTE covers the whole folio, so page_mkwrite prepares
  every block of the folio up to EOF and dirties only those blocks. It
  reserves them only where it may allocate, i.e. not for a pinned file
  or a compressed cluster.
- Align zero range, punch hole, preallocation and truncation to the
  block size instead of PAGE_SIZE. When i_size grows, write-protect the
  folio straddling the old EOF so that stores to its new blocks fault
  into page_mkwrite.
- Update i_size of an extending direct write in ->end_io(), before
  iomap invalidates the page cache of the written range, as ext4 does.
  Otherwise, a read in between zero-fills the blocks beyond the old
  i_size in the folio straddling it and marks them uptodate, which hides
  the data just written.
- Unmap every base page overlapping a punched or zeroed range, and
  truncate the page cache without truncate_pagecache_range(), whose
  unmap underflows for a range ending in the first page.
- For SEEK_DATA, treat a NEW_ADDR block as data only if the block
  itself is dirty.
- When truncation zeroes the tail of a page, mark only the block
  holding the new EOF dirty, not the blocks after it.

The SEEK_DATA change also applies to large folios when the block size
equals PAGE_SIZE. The direct write change applies to any block size, so
i_size is also updated before the sync of an O_DSYNC direct write.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c |  69 ++++++++++--
 fs/f2fs/f2fs.h |   4 +-
 fs/f2fs/file.c | 300 +++++++++++++++++++++++++++++++++----------------
 3 files changed, 261 insertions(+), 112 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 54b2024ece7b..98ceea49e426 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3257,7 +3257,7 @@ bool f2fs_ffs_dirty_blk_range(struct folio *folio, unsigned int from,
 
 static bool find_next_valid_block(const struct folio *folio,
 				  size_t orig_off, size_t *need_off,
-				  size_t len)
+				  size_t len, bool read_full)
 {
 	struct f2fs_sb_info *sbi = F2FS_M_SB(folio->mapping);
 	size_t start = orig_off;
@@ -3265,6 +3265,20 @@ static bool find_next_valid_block(const struct folio *folio,
 	size_t head, tail;
 	pgoff_t index;
 
+	/* Find every block that is not uptodate, not only the partial ones. */
+	if (read_full) {
+		for (head = round_down(*need_off, F2FS_BLKSIZE(sbi)); head < end;
+		     head += F2FS_BLKSIZE(sbi)) {
+			index = f2fs_folio_lblk(sbi, folio) +
+				F2FS_BYTES_TO_BLK(sbi, head);
+			if (!f2fs_ffs_test_blk_uptodate(folio, index)) {
+				*need_off = head;
+				return true;
+			}
+		}
+		return false;
+	}
+
 	if (start & F2FS_BLKSIZE_MASK(sbi)) {
 		head = round_down(start, F2FS_BLKSIZE(sbi));
 		index = f2fs_folio_lblk(sbi, folio) +
@@ -5289,7 +5303,8 @@ static bool f2fs_balance_fs_folio_locked(struct folio *folio,
 
 static int prepare_large_folio_write_begin(struct inode *inode,
 					  struct folio *folio, loff_t pos,
-					  unsigned int len)
+					  unsigned int len, bool read_full,
+					  bool preallocated, bool balance)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	size_t ori_off = offset_in_folio(folio, pos);
@@ -5301,11 +5316,11 @@ static int prepare_large_folio_write_begin(struct inode *inode,
 		return -EOPNOTSUPP;
 
 	/*
-	 * when the write did not come through f2fs_write_iter, we preallocate all
-	 * blocks in the write range here.
+	 * f2fs_balance_fs_folio_locked() unlocks the folio to balance. Skip it
+	 * for page_mkwrite (!@balance), which cannot unlock the folio and has
+	 * called f2fs_balance_fs() before locking it.
 	 */
-	if (!is_inode_flag_set(inode, FI_PREALLOCATED_ALL) &&
-	    !IS_DEVICE_ALIASING(inode)) {
+	if (!preallocated && !IS_DEVICE_ALIASING(inode)) {
 		pgoff_t first = F2FS_BYTES_TO_BLK(sbi, pos);
 		pgoff_t last = F2FS_BLK_ALIGN(sbi, pos + len);
 		pgoff_t idx;
@@ -5318,8 +5333,9 @@ static int prepare_large_folio_write_begin(struct inode *inode,
 						   &node_changed);
 			if (err)
 				return err;
-			if (f2fs_balance_fs_folio_locked(folio, folio->mapping,
-						   node_changed))
+			if (balance &&
+			    f2fs_balance_fs_folio_locked(folio, folio->mapping,
+							 node_changed))
 				return -EAGAIN;
 		}
 	}
@@ -5329,14 +5345,15 @@ static int prepare_large_folio_write_begin(struct inode *inode,
 	/* Skip read if the folio is already fully uptodate or the write
 	 * covers the entire folio.
 	 */
-	if (folio_test_uptodate(folio) || len == folio_size(folio))
+	if (folio_test_uptodate(folio) ||
+	    (!read_full && len == folio_size(folio)))
 		return 0;
 
 	/*
 	 * Skip read if the write starts at a block boundary and reaches EOF,
 	 * and zero the rest of the folio instead.
 	 */
-	if (!f2fs_verity_in_progress(inode) &&
+	if (!read_full && !f2fs_verity_in_progress(inode) &&
 	    !(pos & F2FS_BLKSIZE_MASK(sbi)) && (pos + len) >= i_size_read(inode)) {
 		size_t zoff = ori_off + len;
 
@@ -5349,7 +5366,7 @@ static int prepare_large_folio_write_begin(struct inode *inode,
 	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
 
 	while (find_next_valid_block(folio, ori_off,
-				     &need_off, len)) {
+				     &need_off, len, read_full)) {
 		struct dnode_of_data dn;
 		pgoff_t index = f2fs_folio_lblk(sbi, folio) +
 				F2FS_BYTES_TO_BLK(sbi, need_off);
@@ -5449,6 +5466,20 @@ static int prepare_large_folio_atomic_write_begin(struct inode *inode,
 	return 0;
 }
 
+int f2fs_prepare_subpage_mkwrite(struct inode *inode, struct folio *folio,
+				 loff_t pos, unsigned int len, bool need_alloc)
+{
+	/*
+	 * mkwrite runs without inode_lock, so FI_PREALLOCATED_ALL may have
+	 * been set by a concurrent write() for a different range: reserve
+	 * the blocks here, unless @need_alloc is false, as for a pinned file
+	 * or a compressed cluster. It calls f2fs_balance_fs() before locking
+	 * the folio, which it cannot unlock here, so do not balance.
+	 */
+	return prepare_large_folio_write_begin(inode, folio, pos, len, true,
+					       !need_alloc, false);
+}
+
 static int f2fs_write_begin(const struct kiocb *iocb,
 			    struct address_space *mapping,
 			    loff_t pos, unsigned len, struct folio **foliop,
@@ -5557,7 +5588,10 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 		err = prepare_large_folio_atomic_write_begin(inode,
 					mapping, folio, pos, len, retried);
 	} else {
-		err = prepare_large_folio_write_begin(inode, folio, pos, blen);
+		err = prepare_large_folio_write_begin(inode, folio, pos, blen,
+				false,
+				is_inode_flag_set(inode, FI_PREALLOCATED_ALL),
+				true);
 	}
 	if (err) {
 		if (err == -EAGAIN) {
@@ -5633,6 +5667,7 @@ static int f2fs_write_end(const struct kiocb *iocb,
 			struct folio *folio, void *fsdata)
 {
 	struct inode *inode = folio->mapping->host;
+	loff_t old_size = i_size_read(inode);
 
 	trace_f2fs_write_end(inode, pos, len, copied);
 
@@ -5662,6 +5697,8 @@ static int f2fs_write_end(const struct kiocb *iocb,
 		if (pos + copied > i_size_read(inode) &&
 				!f2fs_verity_in_progress(inode))
 			f2fs_i_size_write(inode, pos + copied);
+		if (i_size_read(inode) > old_size)
+			pagecache_isize_extended(inode, old_size, pos);
 		return copied;
 	}
 #endif
@@ -5687,6 +5724,14 @@ static int f2fs_write_end(const struct kiocb *iocb,
 unlock_out:
 	f2fs_folio_put(folio, true);
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
+
+	/*
+	 * The folio straddling the old EOF may still be mapped writable, and
+	 * the blocks between the old EOF and pos in it are not prepared.
+	 * Write-protect it so that mmap stores to them fault.
+	 */
+	if (i_size_read(inode) > old_size)
+		pagecache_isize_extended(inode, old_size, pos);
 	return copied;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 449f8c672810..f588603dd1d0 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4094,7 +4094,7 @@ int f2fs_getattr(const struct mnt_idmap *idmap, const struct path *path,
 		 struct kstat *stat, u32 request_mask, unsigned int flags);
 int f2fs_setattr(const struct mnt_idmap *idmap, struct dentry *dentry,
 		 struct iattr *attr);
-int f2fs_truncate_hole(struct inode *inode, pgoff_t pg_start, pgoff_t pg_end);
+int f2fs_truncate_hole(struct inode *inode, pgoff_t blk_start, pgoff_t blk_end);
 void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count);
 int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
 						bool readonly, bool need_lock);
@@ -4543,6 +4543,8 @@ void f2fs_ffs_clear_subrange_uptodate(struct folio *folio, size_t offset,
 				      size_t len);
 bool f2fs_ffs_dirty_blk_range(struct folio *folio, unsigned int from,
 			      unsigned int to, unsigned int *start, unsigned int *count);
+int f2fs_prepare_subpage_mkwrite(struct inode *inode, struct folio *folio,
+				 loff_t pos, unsigned int len, bool need_alloc);
 void f2fs_write_failed(struct inode *inode, loff_t to);
 void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool f2fs_release_folio(struct folio *folio, gfp_t wait);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4c4eb02eb486..bec7988ca54b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -36,23 +36,24 @@
 #include <trace/events/f2fs.h>
 #include <uapi/linux/f2fs.h>
 
-static int fill_zero(struct inode *inode, pgoff_t index,
+static int fill_zero(struct inode *inode, pgoff_t bidx,
 					loff_t start, loff_t len);
 
 static int do_zero_post_eof_page(struct inode *inode, loff_t new_size)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	loff_t old_size = i_size_read(inode);
 	unsigned int offset, len;
-	pgoff_t index;
+	pgoff_t bidx;
 	int err;
 
-	offset = old_size & (PAGE_SIZE - 1);
+	offset = old_size & F2FS_BLKSIZE_MASK(sbi);
 
 	if (!offset)
 		return 0;
 
-	len = min_t(loff_t, PAGE_SIZE - offset, new_size - old_size);
-	index = old_size >> PAGE_SHIFT;
+	len = min_t(loff_t, F2FS_BLKSIZE(sbi) - offset, new_size - old_size);
+	bidx = F2FS_BYTES_TO_BLK(sbi, old_size);
 
 	if (f2fs_has_inline_data(inode)) {
 		/* data post eof should be always zero */
@@ -63,7 +64,7 @@ static int do_zero_post_eof_page(struct inode *inode, loff_t new_size)
 			return err;
 	}
 
-	err = fill_zero(inode, index, offset, len);
+	err = fill_zero(inode, bidx, offset, len);
 	if (err)
 		return err;
 	return filemap_write_and_wait_range(inode->i_mapping,
@@ -144,11 +145,11 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	bool need_alloc = !f2fs_is_pinned_file(inode);
 	pgoff_t pidx = folio->index + folio_page_idx(folio, vmf->page);
 	loff_t pos = (loff_t)pidx << PAGE_SHIFT;
+	pgoff_t bidx = F2FS_BYTES_TO_BLK(sbi, pos);
 	loff_t isize;
 	loff_t folio_start;
 	loff_t valid_end;
 	size_t dirty_len;
-	size_t subpage_off;
 	pgoff_t i, nr;
 	int err = 0;
 	vm_fault_t ret;
@@ -212,14 +213,17 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	folio_lock(folio);
 	isize = i_size_read(inode);
 	folio_start = folio_pos(folio);
-	subpage_off = offset_in_folio(folio, pos);
 	valid_end = min_t(loff_t, folio_start + folio_size(folio), isize);
 	dirty_len = valid_end - folio_start;
 
+	/*
+	 * With subpage blocks, the folio can stay mapped after a partial
+	 * invalidation, so its blocks that are not uptodate are read below.
+	 */
 	if (unlikely(folio->mapping != inode->i_mapping ||
 			pos >= isize ||
-			!f2fs_ffs_test_blk_uptodate(folio,
-			folio->index + (subpage_off >> PAGE_SHIFT)))) {
+			(!f2fs_has_subpage_blocks(sbi) &&
+			 !f2fs_ffs_test_blk_uptodate(folio, bidx)))) {
 		folio_unlock(folio);
 		err = -EFAULT;
 		goto out_sem;
@@ -240,6 +244,25 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 	nr = DIV_ROUND_UP(dirty_len, PAGE_SIZE);
 
+	if (f2fs_has_subpage_blocks(sbi)) {
+		/*
+		 * A writable PTE covers the whole base folio.  Like ext4's
+		 * block_page_mkwrite(), prepare every filesystem block through EOF
+		 * before returning it writable, but dirty only those blocks.  This
+		 * prevents a later store in a sibling 4K block from bypassing block
+		 * allocation while also keeping blocks beyond i_size clean.
+		 */
+		f2fs_folio_wait_writeback(folio, false, true);
+		err = f2fs_prepare_subpage_mkwrite(inode, folio,
+						   folio_pos(folio), dirty_len,
+						   need_alloc);
+		if (err) {
+			folio_unlock(folio);
+			goto out_sem;
+		}
+		goto zero_tail;
+	}
+
 	for (i = 0; i < nr; i++) {
 		err = f2fs_get_block_mkwrite(inode, folio, folio->index + i,
 					     need_alloc);
@@ -249,6 +272,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 		}
 	}
 
+zero_tail:
 	/* page is wholly or partially inside EOF */
 	if (folio_start + folio_size(folio) > isize) {
 		size_t offset = offset_in_folio(folio, isize);
@@ -256,8 +280,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 		folio_zero_segment(folio, offset, folio_size(folio));
 	}
 
-	if (folio_test_large(folio))
-		f2fs_ffs_mark_subrange_dirty(folio, 0, dirty_len);
+	f2fs_ffs_mark_subrange_dirty(folio, 0, dirty_len);
 	f2fs_folio_mark_dirty(folio);
 
 	f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, dirty_len);
@@ -503,7 +526,9 @@ static bool __found_offset(struct address_space *mapping,
 {
 	block_t blkaddr = f2fs_data_blkaddr(dn);
 	struct inode *inode = mapping->host;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	bool compressed_cluster = false;
+	bool dirty = false;
 
 	if (f2fs_compressed_file(inode)) {
 		block_t first_blkaddr = data_blkaddr(dn->inode, dn->node_entry,
@@ -512,12 +537,38 @@ static bool __found_offset(struct address_space *mapping,
 		compressed_cluster = first_blkaddr == COMPRESS_ADDR;
 	}
 
+	/* Only SEEK_DATA needs to know whether a reserved block is dirty. */
+	if (blkaddr == NEW_ADDR && whence == SEEK_DATA) {
+		pgoff_t f_index = f2fs_lblk_to_folio_index(sbi, index);
+
+		if (xa_get_mark(&mapping->i_pages, f_index, PAGECACHE_TAG_DIRTY)) {
+			struct folio *folio = filemap_get_folio(mapping, f_index);
+
+			if (!IS_ERR(folio)) {
+				/*
+				 * ffs is freed under the folio lock. We hold the
+				 * dnode, so only trylock the folio, and take the
+				 * block as dirty, as the dirty tag says, if the
+				 * folio is busy.
+				 */
+				if (folio_trylock(folio)) {
+					if (folio->mapping == mapping)
+						dirty = f2fs_ffs_test_blk_dirty(folio,
+									index);
+					folio_unlock(folio);
+				} else {
+					dirty = true;
+				}
+				f2fs_folio_put(folio, false);
+			}
+		}
+	}
+
 	switch (whence) {
 	case SEEK_DATA:
 		if (__is_valid_data_blkaddr(blkaddr))
 			return true;
-		if (blkaddr == NEW_ADDR &&
-		    xa_get_mark(&mapping->i_pages, index, PAGECACHE_TAG_DIRTY))
+		if (dirty)
 			return true;
 		if (compressed_cluster)
 			return true;
@@ -815,20 +866,22 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 					 dn->ofs_in_node, nr_free);
 }
 
-static int truncate_partial_data_page(struct inode *inode, u64 from,
+static int truncate_partial_data_block(struct inode *inode, u64 from,
 								bool cache_only)
 {
-	pgoff_t index = from >> PAGE_SHIFT;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	pgoff_t bidx = F2FS_BYTES_TO_BLK(sbi, from);
+	pgoff_t f_index = f2fs_lblk_to_folio_index(sbi, bidx);
 	struct address_space *mapping = inode->i_mapping;
 	struct folio *folio;
 	size_t folio_off;
-	size_t blk_end;
+	size_t zero_end;
 
-	if (!(from & (PAGE_SIZE - 1)) && !cache_only)
+	if (!(from & F2FS_BLKSIZE_MASK(sbi)) && !cache_only)
 		return 0;
 
 	if (cache_only) {
-		folio = filemap_lock_folio(mapping, index);
+		folio = filemap_lock_folio(mapping, f_index);
 		if (IS_ERR(folio))
 		       return 0;
 		if (folio_test_uptodate(folio))
@@ -837,25 +890,26 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
 		return 0;
 	}
 
-	folio = f2fs_get_lock_data_folio(inode, index, true);
+	folio = f2fs_get_lock_data_folio(inode, bidx, true);
 	if (IS_ERR(folio))
 		return PTR_ERR(folio) == -ENOENT ? 0 : PTR_ERR(folio);
 truncate_out:
 	f2fs_folio_wait_writeback(folio, true, true);
 	folio_off = offset_in_folio(folio, from);
-	blk_end = min_t(size_t, round_up(folio_off, PAGE_SIZE),
+	zero_end = min_t(size_t, round_up(folio_off, PAGE_SIZE),
 					folio_size(folio));
-	folio_zero_segment(folio, folio_off, blk_end);
+	folio_zero_segment(folio, folio_off, zero_end);
 
 	/* An encrypted inode should have a key and truncate the last page. */
-	f2fs_bug_on(F2FS_I_SB(inode), cache_only && IS_ENCRYPTED(inode));
+	f2fs_bug_on(sbi, cache_only && IS_ENCRYPTED(inode));
 	if (!cache_only) {
 		/*
 		 * The folio was read back above, so the subpage is
-		 * already uptodate and dirty data stays valid.
+		 * already uptodate and dirty data stays valid. Mark only
+		 * the block holding the new EOF dirty.
 		 */
 		f2fs_ffs_mark_subrange_dirty(folio, folio_off,
-				blk_end - folio_off);
+			round_up(folio_off, F2FS_BLKSIZE(sbi)) - folio_off);
 		f2fs_folio_mark_dirty(folio);
 	}
 	f2fs_folio_put(folio, true);
@@ -870,7 +924,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 	pgoff_t free_from;
 	int count = 0, err = 0;
 	struct f2fs_cached_block *ientry;
-	bool truncate_page = false;
+	bool truncate_block = false;
 
 	trace_f2fs_truncate_blocks_enter(inode, from);
 
@@ -915,7 +969,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 	if (f2fs_has_inline_data(inode)) {
 		f2fs_truncate_inline_inode(inode, ientry, from);
 		f2fs_put_cache(ientry, true);
-		truncate_page = true;
+		truncate_block = true;
 		goto out;
 	}
 
@@ -944,9 +998,9 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 	if (lock)
 		f2fs_unlock_op(sbi, &lc);
 free_partial:
-	/* lastly zero out the first data page */
+	/* lastly zero out the first data block */
 	if (!err)
-		err = truncate_partial_data_page(inode, from, truncate_page);
+		err = truncate_partial_data_block(inode, from, truncate_block);
 out_err:
 	trace_f2fs_truncate_blocks_exit(inode, err);
 	return err;
@@ -1019,9 +1073,8 @@ int f2fs_truncate(struct inode *inode)
 			 * Always truncate page #0 to avoid page cache
 			 * leak in evict() path.
 			 */
-			truncate_inode_pages_range(inode->i_mapping,
-					F2FS_BLK_TO_BYTES(sbi, 0),
-					F2FS_BLK_END_BYTES(sbi, 0));
+			truncate_inode_pages_range(inode->i_mapping, 0,
+						   PAGE_SIZE - 1);
 			return err;
 		}
 	}
@@ -1310,7 +1363,7 @@ const struct inode_operations f2fs_file_inode_operations = {
 	.fileattr_set	= f2fs_fileattr_set,
 };
 
-static int fill_zero(struct inode *inode, pgoff_t index,
+static int fill_zero(struct inode *inode, pgoff_t bidx,
 					loff_t start, loff_t len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -1324,15 +1377,14 @@ static int fill_zero(struct inode *inode, pgoff_t index,
 	f2fs_balance_fs(sbi, true);
 
 	f2fs_lock_op(sbi, &lc);
-	folio = f2fs_get_new_data_folio(inode, NULL, index, false);
+	folio = f2fs_get_new_data_folio(inode, NULL, bidx, false);
 	f2fs_unlock_op(sbi, &lc);
 
 	if (IS_ERR(folio))
 		return PTR_ERR(folio);
 
 	f2fs_folio_wait_writeback(folio, true, true);
-	folio_off = offset_in_folio(folio,
-				   (loff_t)index << PAGE_SHIFT) + start;
+	folio_off = f2fs_folio_byte_offset(sbi, folio, bidx) + start;
 	folio_zero_range(folio, folio_off, len);
 	/*
 	 * This subpage must be uptodate here, which is guaranteed by
@@ -1344,41 +1396,68 @@ static int fill_zero(struct inode *inode, pgoff_t index,
 	return 0;
 }
 
-int f2fs_truncate_hole(struct inode *inode, pgoff_t pg_start, pgoff_t pg_end)
+int f2fs_truncate_hole(struct inode *inode, pgoff_t blk_start, pgoff_t blk_end)
 {
 	int err;
 
-	while (pg_start < pg_end) {
+	while (blk_start < blk_end) {
 		struct dnode_of_data dn;
 		pgoff_t end_offset, count;
 
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
-		err = f2fs_get_dnode_of_data(&dn, pg_start, LOOKUP_NODE);
+		err = f2fs_get_dnode_of_data(&dn, blk_start, LOOKUP_NODE);
 		if (err) {
 			if (err == -ENOENT) {
-				pg_start = f2fs_get_next_block_offset(&dn,
-								pg_start);
+				blk_start = f2fs_get_next_block_offset(&dn,
+								blk_start);
 				continue;
 			}
 			return err;
 		}
 
 		end_offset = ADDRS_PER_PAGE(dn.node_entry, inode);
-		count = min(end_offset - dn.ofs_in_node, pg_end - pg_start);
+		count = min(end_offset - dn.ofs_in_node, blk_end - blk_start);
 
 		f2fs_bug_on(F2FS_I_SB(inode), count == 0 || count > end_offset);
 
 		f2fs_truncate_data_blocks_range(&dn, count);
 		f2fs_put_dnode(&dn);
 
-		pg_start += count;
+		blk_start += count;
 	}
 	return 0;
 }
 
+/*
+ * unmap_mapping_range() computes page count solely from holelen, which causes
+ * under-unmapping when start is not PAGE_SIZE aligned. Outward-align to PAGE_SIZE
+ * to guarantee all overlapping base pages are unmapped.
+ *
+ * Then truncate the page cache without truncate_pagecache_range(), whose own
+ * unmap underflows when the range ends in the first page and unmaps the rest
+ * of the file.
+ */
+static void f2fs_truncate_pagecache_range(struct inode *inode,
+					  loff_t start, loff_t end)
+{
+	struct address_space *mapping = inode->i_mapping;
+	loff_t unmap_start, unmap_len;
+
+	if (!f2fs_has_subpage_blocks(F2FS_I_SB(inode))) {
+		truncate_pagecache_range(inode, start, end - 1);
+		return;
+	}
+
+	unmap_start = round_down(start, PAGE_SIZE);
+	unmap_len = round_up(end, PAGE_SIZE) - unmap_start;
+	unmap_mapping_range(mapping, unmap_start, unmap_len, 0);
+	truncate_inode_pages_range(mapping, start, end - 1);
+}
+
 static int f2fs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 {
-	pgoff_t pg_start, pg_end;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	pgoff_t blk_start, blk_end;
 	loff_t off_start, off_end;
 	int ret;
 
@@ -1390,47 +1469,46 @@ static int f2fs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
-	pg_start = ((unsigned long long) offset) >> PAGE_SHIFT;
-	pg_end = ((unsigned long long) offset + len) >> PAGE_SHIFT;
+	blk_start = F2FS_BYTES_TO_BLK(sbi, offset);
+	blk_end = F2FS_BYTES_TO_BLK(sbi, offset + len);
 
-	off_start = offset & (PAGE_SIZE - 1);
-	off_end = (offset + len) & (PAGE_SIZE - 1);
+	off_start = offset & F2FS_BLKSIZE_MASK(sbi);
+	off_end = (offset + len) & F2FS_BLKSIZE_MASK(sbi);
 
-	if (pg_start == pg_end) {
-		ret = fill_zero(inode, pg_start, off_start,
+	if (blk_start == blk_end) {
+		ret = fill_zero(inode, blk_start, off_start,
 						off_end - off_start);
 		if (ret)
 			return ret;
 	} else {
 		if (off_start) {
-			ret = fill_zero(inode, pg_start++, off_start,
-						PAGE_SIZE - off_start);
+			ret = fill_zero(inode, blk_start++, off_start,
+						F2FS_BLKSIZE(sbi) - off_start);
 			if (ret)
 				return ret;
 		}
 		if (off_end) {
-			ret = fill_zero(inode, pg_end, 0, off_end);
+			ret = fill_zero(inode, blk_end, 0, off_end);
 			if (ret)
 				return ret;
 		}
 
-		if (pg_start < pg_end) {
-			loff_t blk_start, blk_end;
-			struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+		if (blk_start < blk_end) {
+			loff_t byte_start, byte_end;
 			struct f2fs_lock_context lc;
 
 			f2fs_balance_fs(sbi, true);
 
-			blk_start = (loff_t)pg_start << PAGE_SHIFT;
-			blk_end = (loff_t)pg_end << PAGE_SHIFT;
+			byte_start = F2FS_BLK_TO_BYTES(sbi, blk_start);
+			byte_end = F2FS_BLK_TO_BYTES(sbi, blk_end);
 
 			f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 			filemap_invalidate_lock(inode->i_mapping);
 
-			truncate_pagecache_range(inode, blk_start, blk_end - 1);
+			f2fs_truncate_pagecache_range(inode, byte_start, byte_end);
 
 			f2fs_lock_op(sbi, &lc);
-			ret = f2fs_truncate_hole(inode, pg_start, pg_end);
+			ret = f2fs_truncate_hole(inode, blk_start, blk_end);
 			f2fs_unlock_op(sbi, &lc);
 
 			filemap_invalidate_unlock(inode->i_mapping);
@@ -1621,7 +1699,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 			f2fs_folio_wait_writeback(fdst, true, true);
 			memcpy_folio(fdst, dst_off, fsrc, src_off,
 				    F2FS_BLKSIZE(sbi));
-			if (folio_test_large(fdst)) {
+			if (f2fs_is_multiblock_folio(sbi, fdst)) {
 				f2fs_ffs_mark_subrange_uptodate(fdst,
 						dst_off, F2FS_BLKSIZE(sbi));
 				f2fs_ffs_mark_subrange_dirty(fdst, dst_off,
@@ -1830,7 +1908,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct address_space *mapping = inode->i_mapping;
-	pgoff_t index, pg_start, pg_end;
+	pgoff_t blk_start, blk_end;
 	loff_t new_size = i_size_read(inode);
 	loff_t off_start, off_end;
 	int ret = 0;
@@ -1851,31 +1929,33 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 	if (ret)
 		return ret;
 
-	pg_start = ((unsigned long long) offset) >> PAGE_SHIFT;
-	pg_end = ((unsigned long long) offset + len) >> PAGE_SHIFT;
+	blk_start = F2FS_BYTES_TO_BLK(sbi, offset);
+	blk_end = F2FS_BYTES_TO_BLK(sbi, offset + len);
 
-	off_start = offset & (PAGE_SIZE - 1);
-	off_end = (offset + len) & (PAGE_SIZE - 1);
+	off_start = offset & F2FS_BLKSIZE_MASK(sbi);
+	off_end = (offset + len) & F2FS_BLKSIZE_MASK(sbi);
 
-	if (pg_start == pg_end) {
-		ret = fill_zero(inode, pg_start, off_start,
+	if (blk_start == blk_end) {
+		ret = fill_zero(inode, blk_start, off_start,
 						off_end - off_start);
 		if (ret)
 			return ret;
 
 		new_size = max_t(loff_t, new_size, offset + len);
 	} else {
+		pgoff_t index;
+
 		if (off_start) {
-			ret = fill_zero(inode, pg_start++, off_start,
-						PAGE_SIZE - off_start);
+			ret = fill_zero(inode, blk_start++, off_start,
+						F2FS_BLKSIZE(sbi) - off_start);
 			if (ret)
 				return ret;
 
 			new_size = max_t(loff_t, new_size,
-					(loff_t)pg_start << PAGE_SHIFT);
+					F2FS_BLK_TO_BYTES(sbi, blk_start));
 		}
 
-		for (index = pg_start; index < pg_end;) {
+		for (index = blk_start; index < blk_end;) {
 			struct dnode_of_data dn;
 			struct f2fs_lock_context lc;
 			unsigned int end_offset;
@@ -1884,9 +1964,9 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 			f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 			filemap_invalidate_lock(mapping);
 
-			truncate_pagecache_range(inode,
-				(loff_t)index << PAGE_SHIFT,
-				((loff_t)pg_end << PAGE_SHIFT) - 1);
+			f2fs_truncate_pagecache_range(inode,
+				F2FS_BLK_TO_BYTES(sbi, index),
+				F2FS_BLK_TO_BYTES(sbi, blk_end));
 
 			f2fs_lock_op(sbi, &lc);
 
@@ -1900,7 +1980,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 			}
 
 			end_offset = ADDRS_PER_PAGE(dn.node_entry, inode);
-			end = min(pg_end, end_offset - dn.ofs_in_node + index);
+			end = min(blk_end, end_offset - dn.ofs_in_node + index);
 
 			ret = f2fs_do_zero_range(&dn, index, end);
 			f2fs_put_dnode(&dn);
@@ -1916,11 +1996,11 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 
 			index = end;
 			new_size = max_t(loff_t, new_size,
-					(loff_t)index << PAGE_SHIFT);
+					F2FS_BLK_TO_BYTES(sbi, index));
 		}
 
 		if (off_end) {
-			ret = fill_zero(inode, pg_end, 0, off_end);
+			ret = fill_zero(inode, blk_end, 0, off_end);
 			if (ret)
 				goto out;
 
@@ -1930,10 +2010,14 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 
 out:
 	if (new_size > i_size_read(inode)) {
-		if (mode & FALLOC_FL_KEEP_SIZE)
+		if (mode & FALLOC_FL_KEEP_SIZE) {
 			file_set_keep_isize(inode);
-		else
+		} else {
+			loff_t old_size = i_size_read(inode);
+
 			f2fs_i_size_write(inode, new_size);
+			pagecache_isize_extended(inode, old_size, new_size);
+		}
 	}
 	return ret;
 }
@@ -2034,7 +2118,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 			.should_migrate_blocks = false,
 			.err_gc_skipped = true,
 			.nr_free_secs = 0 };
-	pgoff_t pg_start, pg_end;
+	pgoff_t blk_start, blk_end;
 	loff_t new_size;
 	loff_t off_end;
 	block_t expanded = 0;
@@ -2054,12 +2138,12 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 
 	f2fs_balance_fs(sbi, true);
 
-	pg_start = ((unsigned long long)offset) >> PAGE_SHIFT;
-	pg_end = ((unsigned long long)offset + len) >> PAGE_SHIFT;
-	off_end = (offset + len) & (PAGE_SIZE - 1);
+	blk_start = F2FS_BYTES_TO_BLK(sbi, offset);
+	blk_end = F2FS_BYTES_TO_BLK(sbi, offset + len);
+	off_end = (offset + len) & F2FS_BLKSIZE_MASK(sbi);
 
-	map.m_lblk = pg_start;
-	map.m_len = pg_end - pg_start;
+	map.m_lblk = blk_start;
+	map.m_len = blk_end - blk_start;
 	if (off_end)
 		map.m_len++;
 
@@ -2071,9 +2155,9 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 		block_t sec_len;
 
 		if (map.m_lblk % sec_blks) {
-			pg_start = rounddown(map.m_lblk, sec_blks);
-			map.m_lblk = pg_start;
-			map.m_len = pg_end - pg_start;
+			blk_start = rounddown(map.m_lblk, sec_blks);
+			map.m_lblk = blk_start;
+			map.m_len = blk_end - blk_start;
 			if (off_end)
 				map.m_len++;
 		}
@@ -2089,7 +2173,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 				f2fs_warn_ratelimited(sbi,
 					"ino:%llu, start:%lu, end:%lu, need to trigger GC to "
 					"reclaim enough free segment when checkpoint is enabled",
-					inode->i_ino, pg_start, pg_end);
+					inode->i_ino, blk_start, blk_end);
 				goto out_err;
 			}
 		}
@@ -2135,20 +2219,24 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 		if (!expanded)
 			return err;
 
-		last_off = pg_start + expanded - 1;
+		last_off = blk_start + expanded - 1;
 
 		/* update new size to the failed position */
-		new_size = (last_off == pg_end) ? offset + len :
-					(loff_t)(last_off + 1) << PAGE_SHIFT;
+		new_size = (last_off == blk_end) ? offset + len :
+					F2FS_BLK_TO_BYTES(sbi, last_off + 1);
 	} else {
-		new_size = ((loff_t)pg_end << PAGE_SHIFT) + off_end;
+		new_size = F2FS_BLK_TO_BYTES(sbi, blk_end) + off_end;
 	}
 
 	if (new_size > i_size_read(inode)) {
-		if (mode & FALLOC_FL_KEEP_SIZE)
+		if (mode & FALLOC_FL_KEEP_SIZE) {
 			file_set_keep_isize(inode);
-		else
+		} else {
+			loff_t old_size = i_size_read(inode);
+
 			f2fs_i_size_write(inode, new_size);
+			pagecache_isize_extended(inode, old_size, new_size);
+		}
 	}
 
 	return err;
@@ -5623,11 +5711,27 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
 static int f2fs_dio_write_end_io(struct kiocb *iocb, ssize_t size, int error,
 				 unsigned int flags)
 {
-	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(iocb->ki_filp));
+	struct inode *inode = file_inode(iocb->ki_filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	/* iomap advances ki_pos after ->end_io() */
+	loff_t end = iocb->ki_pos + size;
+	loff_t old_size = i_size_read(inode);
 
 	dec_cache_count(sbi, F2FS_DIO_WRITE);
 	if (error)
 		return error;
+
+	/*
+	 * Update i_size before iomap invalidates the page cache of the
+	 * written range. Otherwise, a read in between zero-fills the blocks
+	 * beyond the old i_size in the folio straddling it and marks them
+	 * uptodate, which hides the data just written. An extending write
+	 * waits for the I/O, so this runs in the task holding inode_lock.
+	 */
+	if (size && end > old_size) {
+		f2fs_i_size_write(inode, end);
+		pagecache_isize_extended(inode, old_size, end);
+	}
 	f2fs_update_time(sbi, REQ_TIME);
 	f2fs_update_iostat(sbi, NULL, APP_DIRECT_IO, size);
 	return 0;
@@ -5758,8 +5862,6 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 
 	if (ret < 0)
 		goto out;
-	if (pos + ret > inode->i_size)
-		f2fs_i_size_write(inode, pos + ret);
 	if (!do_opu)
 		set_inode_flag(inode, FI_UPDATE_WRITE);
 
-- 
2.56.0.611.g1030f0b940-goog

