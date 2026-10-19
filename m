Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B838848877F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413931; cv=none; b=XHb7KFX20nJ2tjylJ0pDIQEKJ/6i8R5vJ+1c+oHJMxyZNsfXm2cQX5o9aDWF1286skmJOsCJF2P1xMhCR6Ry8fj7p+RLREPYRhEmFLc7YQnOdTsChzsAvTUek+DmUVXrxZmDdQOx+MKAX7wDv9j87QID2rEKuZroszpGV/s45bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413931; c=relaxed/simple;
	bh=Sx6g6/OhIlK/UruXlc1kpx6xEoSUH2XUWqLtdIYfKXQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=d7ICrQNiLM7NrhEtoOJMoObirqsm1VYFYjGjVwQj/RN5snS3NaujYB8uOd3O2auiclsnjR67QUUvyhw0vf3isiOv4KHIyJMiU33oVVh4JTIqDSDIyY4sjgubh6btRWxyhSQHQ2n3ClHm1mfC1qbGXsLMHtkmr+GKx3vFSS6zrus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NZmqrvMV; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NZmqrvMV"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c40bbd26f74so174824666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792413927; x=1793018727; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NVJQb4s7J1RH25YiZPfBsDZyQ07ORbqyxm7vmxap9cY=;
        b=NZmqrvMVRqyND9YNXcgpTNlED2JyyPbY3Qw7TSgNZReAyxJGi8kHaXHPeqXCT4Xt3W
         ep2cLILlr+6eldViZisuNViKGuDnaFxgGAVd8fdgp2U166aafNqGvo1U4D9Mu/cuud9N
         M49/4Gqzn4jb/X1dhSegkcCXV6pBOxhnGNptoEtepgX5fJRzCR1exNduhTu9o5jHFk3z
         ZgqhwGIOoZGdbuPYk9zFlW2545iWGhP/JAqT7J/XfmwHa/8jmQcxa7lQiY6cYMok6lox
         JrloVe+8v6xTJLZDqjk0gStPiuxZswaFmquFIrBQ2nEDJgiEJXd2ykYgTM84Tauk/Css
         JH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413927; x=1793018727;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVJQb4s7J1RH25YiZPfBsDZyQ07ORbqyxm7vmxap9cY=;
        b=cHBxSN8xfVtZ7ZO0EwclB2pyfu7kTBGDPf7hHm0wBBKSNeslUzqtKP9wEfLgX0kJpr
         XfzaOTSFOt7+jxggnxyNXnzUTKxLCIDQjJVfrlsZf1+i/vhTzUaHfBGAtIFFyOgsPl9W
         zlJBhWNX40PuJUX5iivR7klP5lLK0C66aV03fdHVKOnrcy6bWtw30J5jNmHk0oreCtd3
         pY/HYradz/SJqzMJGhMauXGfbFkSUD9YjqkCnVSAC1xajirm6yZuLEa7kX9+UG97X5OH
         1L7s2P5NtLGUD/RrIJA8WSKcp2feZYEr4L+F/eoYDHQqwf8Nfj+nMKZgriPl9kKQkBuu
         At0w==
X-Forwarded-Encrypted: i=1; AKwUvByKIJVVEN9YxWVR9AIU8tmwYFuekST8kCc9oFP+Uh2375A7kENssU4OcTwQj77vChbYrXNLEDVvXVBFXXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF5Cnp0R7ENUAN3COV3OTAx3Yk2jswNyrIvwrzmByWXTH/qnhk
	YmU3UmkofHnPaFUdi88xeY0z5OpfRDsadjbJiLszE7U0q3fp57I2KyoILAOx5EW16ehczmpoqco
	So3EjBkM5IwVg6bxAi6f0IgygV5pjQg==
X-Received: from ejbo18.prod.google.com ([2002:a17:906:3592:b0:c36:3d60:e17c])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:ba89:b0:c2e:4b90:3c55 with SMTP id a640c23a62f3a-c41999706aemr474593466b.5.1792413926615;
 Mon, 19 Oct 2026 05:45:26 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:45:22 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261019124522.3702174-1-jprusakowski@google.com>
Subject: [PATCH] f2fs: zero post-EOF data regardless of fsync_mode when
 extending file size
From: Jan Prusakowski <jprusakowski@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Jan Prusakowski <jprusakowski@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit 5eced87b7d19 ("f2fs: fix to zero post-EOF data when extending
file size") gated post-EOF page zeroing and writeback behind
fsync_mode=strict. In the default fsync_mode=posix, extending a file
across an unaligned EOF boundary via truncate(), fallocate(), or write()
past EOF leaves stale on-disk data in [old_size, PAGE_ALIGN(old_size))
unzeroed when the page is not cached or after crash recovery, exposing
stale data and failing xfstest generic/794.

Zero and write back the partial post-EOF page on file size extension
regardless of fsync_mode, while avoiding unnecessary block allocations
and synchronous writeback:

1. Use f2fs_get_lock_data_folio() instead of fill_zero() in
   do_zero_post_eof_page() so that sparse holes (-ENOENT) are skipped
   without allocating physical blocks, and avoid calling
   f2fs_balance_fs() while f2fs_setattr() holds i_gc_rwsem[WRITE].
2. Skip post-EOF disk zeroing for inline files (whose post-EOF bytes are
   already zeroed in the inode page and upon inline conversion) and
   compressed clusters.
3. Only request synchronous writeback in f2fs_write_checks() when
   iocb->ki_pos > i_size_read(inode) (when the write starts past EOF,
   leaving an unwritten gap) and in f2fs_expand_inode_data() when
   !(mode & FALLOC_FL_KEEP_SIZE), avoiding synchronous writeback on
   normal sequential append writes.

Fixes: 5eced87b7d19 ("f2fs: fix to zero post-EOF data when extending file size")
Assisted-by: LLM
Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 fs/f2fs/file.c | 74 ++++++++++++++++++++++++++------------------------
 1 file changed, 38 insertions(+), 36 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3b5ad281b518..d8fb72aa7a6d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -36,36 +36,39 @@
 #include <trace/events/f2fs.h>
 #include <uapi/linux/f2fs.h>
 
-static int fill_zero(struct inode *inode, pgoff_t index,
-					loff_t start, loff_t len);
-
 static int do_zero_post_eof_page(struct inode *inode, loff_t new_size)
 {
 	loff_t old_size = i_size_read(inode);
-	unsigned int offset, len;
-	pgoff_t index;
+	unsigned int offset = old_size & (PAGE_SIZE - 1);
+	pgoff_t index = old_size >> PAGE_SHIFT;
+	struct folio *folio;
+	unsigned int len;
 	int err;
 
-	offset = old_size & (PAGE_SIZE - 1);
-
 	if (!offset)
 		return 0;
 
-	len = min_t(loff_t, PAGE_SIZE - offset, new_size - old_size);
-	index = old_size >> PAGE_SHIFT;
+	if (f2fs_has_inline_data(inode))
+		return 0;
 
-	if (f2fs_has_inline_data(inode)) {
-		/* data post eof should be always zero */
-		if (new_size <= MAX_INLINE_DATA(inode))
-			return 0;
-		err = f2fs_convert_inline_inode(inode);
-		if (err)
+	if (f2fs_compressed_file(inode)) {
+		err = f2fs_is_compressed_cluster(inode, index);
+		if (err < 0)
 			return err;
+		if (err)
+			return 0;
 	}
 
-	err = fill_zero(inode, index, offset, len);
-	if (err)
-		return err;
+	folio = f2fs_get_lock_data_folio(inode, index, true);
+	if (IS_ERR(folio))
+		return PTR_ERR(folio) == -ENOENT ? 0 : PTR_ERR(folio);
+
+	len = min_t(loff_t, PAGE_SIZE - offset, new_size - old_size);
+	f2fs_folio_wait_writeback(folio, true, true);
+	folio_zero_range(folio, offset, len);
+	folio_mark_dirty(folio);
+	f2fs_folio_put(folio, true);
+
 	return filemap_write_and_wait_range(inode->i_mapping,
 				old_size, old_size + len - 1);
 }
@@ -74,29 +77,26 @@ static int f2fs_zero_post_eof_page(struct inode *inode,
 					loff_t new_size, bool lock, bool writeback)
 {
 	loff_t old_size = i_size_read(inode);
-	bool strict =
-		F2FS_OPTION(F2FS_I_SB(inode)).fsync_mode == FSYNC_MODE_STRICT;
 
 	if (old_size >= new_size)
 		return 0;
 
-	if (!strict && mapping_empty(inode->i_mapping))
-		return 0;
-
-	if (lock)
-		filemap_invalidate_lock(inode->i_mapping);
-	/* zero or drop pages only in range of [old_size, new_size] */
-	truncate_inode_pages_range(inode->i_mapping, old_size, new_size - 1);
-	if (lock)
-		filemap_invalidate_unlock(inode->i_mapping);
+	if (!mapping_empty(inode->i_mapping)) {
+		if (lock)
+			filemap_invalidate_lock(inode->i_mapping);
+		/* zero or drop pages only in range of [old_size, new_size] */
+		truncate_inode_pages_range(inode->i_mapping, old_size,
+							new_size - 1);
+		if (lock)
+			filemap_invalidate_unlock(inode->i_mapping);
+	}
 
-	if (!writeback || !strict)
+	if (!writeback)
 		return 0;
 	/*
-	 * In fsync_mode=strict, when we expand an unaligned EOF size, we
-	 * should zero post EOF data and writeback the data immediately,
-	 * so that it can avoid exposing stale data after metadata flush
-	 * and POR.
+	 * When we expand an unaligned EOF size, we should zero post-EOF
+	 * data and writeback the data immediately, so that it can avoid
+	 * exposing stale data after metadata flush and POR.
 	 */
 	return do_zero_post_eof_page(inode, new_size);
 }
@@ -1984,7 +1984,8 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 	if (err)
 		return err;
 
-	err = f2fs_zero_post_eof_page(inode, offset + len, true, true);
+	err = f2fs_zero_post_eof_page(inode, offset + len, true,
+					!(mode & FALLOC_FL_KEEP_SIZE));
 	if (err)
 		return err;
 
@@ -5367,7 +5368,8 @@ static ssize_t f2fs_write_checks(struct kiocb *iocb, struct iov_iter *from)
 		return err;
 
 	err = f2fs_zero_post_eof_page(inode,
-		iocb->ki_pos + iov_iter_count(from), true, true);
+		iocb->ki_pos + iov_iter_count(from), true,
+		iocb->ki_pos > i_size_read(inode));
 	if (err)
 		return err;
 	return count;
-- 
2.56.0.176.g3575e65682-goog

