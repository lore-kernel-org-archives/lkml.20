Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB7B4F7995
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892635; cv=none; b=Ae907Tz+FIo7gVQ3M58TqrPwuGtwJ8EFbkyw+QZaFgEho+fFepD/WkV0+5Z5BCvKSeQThaRWu5K25F3CAXn2kCX7H4HYbzAqXtE5lMpENBWaODgLOcxuSS675qFklSk2LREDmlUH/yHo66BJR5349DGf7KZWBUvzQDOjw5Ry5YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892635; c=relaxed/simple;
	bh=p2YeVfNfdnfVcjd9sCYs/iiWea6E7iLrQMk1KTjwEgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/3NikpOcRaxhpSJ7/RxtoqA8sf0DcCgjJXLJ2p8ZOU8rcsRZMhVEg+JExrgutUzJC/PO0lEpJZHFPpvxvFrgFOH7XAGIGRN1ocLNHjCVj751u+VG/uRQ8WGaa4sgkTR182LVON51FsYRhqRMlF+BLIUfRZqX1fj89IWkboytSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6Ro93LU; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6Ro93LU"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3ab00078c22so85926a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892632; x=1792497432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tUCgCRsOlq9BAGXeOk1uN6rtd7xYn5TxPQZMxbJkExY=;
        b=J6Ro93LUOjra25BVl4USNRFv4752Q6j6hFV9jAjCtoG4C5F5ifHAcQtQmopnuqZPJe
         YJ0reGHV2Qv/iGkyC79l1IgdmeTzznS16KBDPgOXt5X0QQWIwt+VEzy+bCxz3OqHBrh+
         yOmxbskeDEt9HbIfRYzepNdT1dUgwzTEc8BgxIG9HO3pms4Wao1ffGb0fY826N/NmtAF
         VYBBNWcPr6j/Z2mGfeDmuFwkbBu8nct+Qs3dTrWcbWO5ak5ZOcrnuxPOhOrXrfUTieCb
         i46XNcYoTyhT5oUHQRF0lrPL8rYL4wHpsOwH6z+yRzcwYRgYftSqfriEcK/d8Mr/0wl+
         qptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892632; x=1792497432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tUCgCRsOlq9BAGXeOk1uN6rtd7xYn5TxPQZMxbJkExY=;
        b=Ulx3wVC03+PeN8W/uh7RqjZRYTUs7Lv5NHk0qqsc3uMu6sUYxl38s5g476lThjUvs3
         oGMVOI7V05B/gI4pTKdqlyzMXN7Z4IGLMs09byza39iYH9WaCyQMk0iqvznCwDBU3eWK
         vMQ6JsqW9T+utrEaFAGqydRidPptXt3DWAYBtCrHK7wG5zfpyepJyKLCQTg90MOPSh7M
         2coohob1MwkXmE2PXPuoq4EfBqw3O3aY4bwc+/+b/fUe/nKnVmq333kkEXIHrcq2C0zn
         PLc4NAUWT6r5K/d7e6yLB8lib36naujr6IYNqpXyebk4iVwsdK+D8PPli0bAsJeCkSrY
         XEfw==
X-Forwarded-Encrypted: i=1; AKwUvByFxtfwRK8dEyK4lSq55Q+huUowxmf5Xpg8GjpY+GXdM8qNtdpjQZcfZ7YZUnNeJtKmyv5Pyhz7eseCUQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXuSTdNcEAUPRGV+sMm4haqXzGZI32PEMo1c4KCg/CndD9inVO
	IBbuSHmMv1kXPvHtD2F8uYLnNIN02XVj4KKyxA0ullrJfcuJb8okgE/w
X-Gm-Gg: AYBFou2VuuN0o4DrT3VzRYeqSvyxN429UIGJixnJu3hUKUOJ/a2aW7eD+d02eQ3AxDd
	0ZYArazJJdkejzCDZy8LzJXNrOYgiYwYcdKEsUqyRbP/bnC0VRmLjM+Et3bCAKBtOOCXx7YuktC
	QWOAJid8rgNb1atFkJ8pPnrTH9jVgDlSkTxAmjYffnJKfrG00fibEOg46FQHsGhcTJvRoR+1EPC
	yogpf1hloy3bUyyWLhIX9+J6t/6UDK6YX13yqim6TpFuLi3HdGvbR551HZofnjLciZjt2U1kEmS
	gVDL1aC/xRY6iakl6WwiAWpMLmHj8rTZuxPN807liv0ncejh5rnARdvXa3Kdjd3O6SlBGF4dNDB
	6qPn4fSWLLTu7tYXZa7cTbFWEhJg7kVTB3YMU+qUMKTTAjZRRtLGyGZpwb1kAb3V3BQ5qg0TZlp
	CLbeHvyov8HyfRvQ0rURvk3L3GEGSYIK+UbbdmFvfa4bOg7JwQKQrL4Rps5n2lECxwwwiZbxsKY
	7mtBGC40gzvWT+RphSCVXRKUrSOyJxoj+fZ
X-Received: by 2002:a17:90b:3912:b0:3a4:930e:6c35 with SMTP id 98e67ed59e1d1-3ab3a369eafmr6931610a91.4.1791892632244;
        Tue, 13 Oct 2026 04:57:12 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm21248516a91.13.2026.10.13.04.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:57:11 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v4 09/18] f2fs: prepare mmap write faults for large folios
Date: Tue, 13 Oct 2026 19:56:12 +0800
Message-ID: <20261013115621.968742-10-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
References: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

Now write protect `mmap` also need to support large folio,
Change `f2fs_vm_page_mkwrite` to achieve that.

Note it currently marks the whole large folio dirty
to avoid data loss which causes write amplification.
Further optimization is welcome.

The folio_zero_segment() in mkwrite is extended to zero the
post-EOF part of the faulted folio for both order-0 and large
folios, so the f2fs_zero_post_eof_page() call that was added
to cover the removed shortcut is no longer needed.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c |  55 +++++++++++++++++++------
 fs/f2fs/f2fs.h |   7 ++++
 fs/f2fs/file.c | 108 +++++++++++++++++++++++++++++++++++--------------
 3 files changed, 127 insertions(+), 43 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f994a31f8..d158c343f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2794,33 +2794,64 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 }
 #endif
 
-struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio)
+struct f2fs_folio_state *f2fs_ffs_alloc(struct f2fs_sb_info *sbi,
+					struct folio *folio)
 {
 	struct f2fs_folio_state *ffs;
-	unsigned int nr_subpages = folio_nr_pages(folio);
-	unsigned long private = (unsigned long)folio->private;
+	unsigned int nr_subpages;
 
-	f2fs_bug_on(F2FS_F_SB(folio), !folio_test_large(folio));
-	f2fs_bug_on(F2FS_F_SB(folio),
-		    test_bit(F2FS_FOLIO_PRIVATE_NOT_POINTER, &private));
-
-	if (f2fs_folio_has_ffs(folio))
-		return (struct f2fs_folio_state *)folio->private;
+	if (!folio_test_large(folio) || f2fs_folio_has_ffs(folio))
+		return NULL;
 
-	ffs = f2fs_kmalloc(F2FS_F_SB(folio),
+	nr_subpages = folio_nr_pages(folio);
+	ffs = f2fs_kmalloc(sbi,
 			struct_size(ffs, state, BITS_TO_LONGS(2 * nr_subpages)),
 			GFP_NOFS | __GFP_ZERO);
 	if (!ffs)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	spin_lock_init(&ffs->state_lock);
+	return ffs;
+}
+
+void f2fs_ffs_attach(struct folio *folio, struct f2fs_folio_state *ffs)
+{
+	unsigned int nr_subpages = folio_nr_pages(folio);
+
+	if (!ffs)
+		return;
+
+	if (!folio_test_large(folio) || f2fs_folio_has_ffs(folio)) {
+		kfree(ffs);
+		return;
+	}
+
 	if (folio_test_uptodate(folio))
 		bitmap_set(ffs->state, 0, nr_subpages);
 	if (folio_test_dirty(folio))
 		bitmap_set(ffs->state, nr_subpages, nr_subpages);
 
 	folio_attach_private(folio, ffs);
-	return ffs;
+}
+
+struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned long private = (unsigned long)folio->private;
+
+	f2fs_bug_on(F2FS_F_SB(folio), !folio_test_large(folio));
+	f2fs_bug_on(F2FS_F_SB(folio),
+		    test_bit(F2FS_FOLIO_PRIVATE_NOT_POINTER, &private));
+
+	if (f2fs_folio_has_ffs(folio))
+		return (struct f2fs_folio_state *)folio->private;
+
+	ffs = f2fs_ffs_alloc(F2FS_F_SB(folio), folio);
+	if (IS_ERR(ffs))
+		return NULL;
+
+	f2fs_ffs_attach(folio, ffs);
+	return (struct f2fs_folio_state *)folio->private;
 }
 
 static void ffs_detach_free(struct folio *folio)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e5c1d6a65..876339eb2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4467,6 +4467,13 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				enum iostat_type io_type,
 				int compr_blocks, bool allow_balance);
 bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
+struct f2fs_folio_state *f2fs_ffs_alloc(struct f2fs_sb_info *sbi,
+					struct folio *folio);
+void f2fs_ffs_attach(struct folio *folio, struct f2fs_folio_state *ffs);
+struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio);
+void f2fs_ffs_mark_subrange_dirty(struct folio *folio, size_t offset, size_t len);
+bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
+					    size_t len);
 void f2fs_write_failed(struct inode *inode, loff_t to);
 void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool f2fs_release_folio(struct folio *folio, gfp_t wait);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f7ed20f0c..37d41f593 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -118,14 +118,49 @@ static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+static int f2fs_get_block_mkwrite(struct inode *inode, struct folio *folio,
+				  pgoff_t index, bool need_alloc)
+{
+	struct dnode_of_data dn;
+	int err;
+
+	set_new_dnode(&dn, inode, NULL, NULL, 0);
+	if (need_alloc) {
+		err = f2fs_get_block_locked(&dn, index);
+	} else {
+		err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
+		f2fs_put_dnode(&dn);
+		if (f2fs_is_pinned_file(inode) &&
+		    !__is_valid_data_blkaddr(dn.data_blkaddr))
+			err = -EIO;
+	}
+
+	if (err)
+		return err;
+
+	f2fs_folio_wait_writeback(folio, false, true);
+
+	/* wait for GCed page writeback via META_MAPPING */
+	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
+
+	return 0;
+}
+
 static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 {
 	struct folio *folio = page_folio(vmf->page);
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct dnode_of_data dn;
 	bool need_alloc = !f2fs_is_pinned_file(inode);
+	struct f2fs_folio_state *ffs = NULL;
+	pgoff_t pidx = folio->index + folio_page_idx(folio, vmf->page);
+	loff_t pos = (loff_t)pidx << PAGE_SHIFT;
 	loff_t isize;
+	loff_t folio_start;
+	loff_t valid_end;
+	size_t dirty_len;
+	size_t subpage_off;
+	pgoff_t i, nr;
 	int err = 0;
 	vm_fault_t ret;
 
@@ -162,7 +197,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (f2fs_compressed_file(inode)) {
-		int ret = f2fs_is_compressed_cluster(inode, folio->index);
+		int ret = f2fs_is_compressed_cluster(inode, pidx);
 
 		if (ret < 0) {
 			err = ret;
@@ -172,6 +207,17 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 		}
 	}
 #endif
+	/*
+	 * Preallocate the folio state before the block allocation and page
+	 * locking work, so that -ENOMEM can not be reported too late.
+	 */
+	ffs = f2fs_ffs_alloc(sbi, folio);
+	if (IS_ERR(ffs)) {
+		err = PTR_ERR(ffs);
+		ffs = NULL;
+		goto out;
+	}
+
 	/* should do out of any locked page */
 	if (need_alloc)
 		f2fs_balance_fs(sbi, true);
@@ -180,11 +226,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
 
-	err = f2fs_zero_post_eof_page(inode,
-		(folio->index + 1) << PAGE_SHIFT, true, false);
-	if (err)
-		goto out_pagefault;
-
 	file_update_time(vmf->vma->vm_file);
 	filemap_invalidate_lock_shared(inode->i_mapping);
 
@@ -194,57 +235,62 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	 * local variable to let the zeroing offset match the EOF check below.
 	 */
 	isize = i_size_read(inode);
+	folio_start = folio_pos(folio);
+	subpage_off = offset_in_folio(folio, pos);
+	valid_end = min_t(loff_t, folio_start + folio_size(folio), isize);
+	dirty_len = valid_end - folio_start;
 
 	if (unlikely(folio->mapping != inode->i_mapping ||
-			folio_pos(folio) > isize ||
-			!folio_test_uptodate(folio))) {
+			pos >= isize ||
+			!f2fs_ffs_test_blk_uptodate(folio,
+			folio->index + (subpage_off >> PAGE_SHIFT)))) {
 		folio_unlock(folio);
 		err = -EFAULT;
 		goto out_sem;
 	}
 
-	set_new_dnode(&dn, inode, NULL, NULL, 0);
-	if (need_alloc) {
-		/* block allocation */
-		err = f2fs_get_block_locked(&dn, folio->index);
-	} else {
-		err = f2fs_get_dnode_of_data(&dn, folio->index, LOOKUP_NODE);
-		f2fs_put_dnode(&dn);
-		if (f2fs_is_pinned_file(inode) &&
-		    !__is_valid_data_blkaddr(dn.data_blkaddr))
-			err = -EIO;
-	}
-
-	if (err) {
+	f2fs_ffs_attach(folio, ffs);
+	ffs = NULL;
+	if (folio_test_large(folio) && !f2fs_folio_has_ffs(folio) &&
+	    !f2fs_ffs_find_or_alloc(folio)) {
 		folio_unlock(folio);
+		err = -ENOMEM;
 		goto out_sem;
 	}
 
-	f2fs_folio_wait_writeback(folio, false, true);
+	nr = DIV_ROUND_UP(dirty_len, PAGE_SIZE);
 
-	/* wait for GCed page writeback via generic cache */
-	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
+	for (i = 0; i < nr; i++) {
+		err = f2fs_get_block_mkwrite(inode, folio, folio->index + i,
+					     need_alloc);
+		if (err) {
+			folio_unlock(folio);
+			goto out_sem;
+		}
+	}
 
 	/* page is wholly or partially inside EOF */
-	if (((loff_t)(folio->index + 1) << PAGE_SHIFT) > isize) {
-		loff_t offset;
+	if (folio_start + folio_size(folio) > isize) {
+		size_t offset = offset_in_folio(folio, isize);
 
-		offset = isize & ~PAGE_MASK;
 		folio_zero_segment(folio, offset, folio_size(folio));
 	}
+
+	if (folio_test_large(folio))
+		f2fs_ffs_mark_subrange_dirty(folio, 0, dirty_len);
 	folio_mark_dirty(folio);
 
-	f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, F2FS_BLKSIZE(sbi));
+	f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, dirty_len);
 	f2fs_update_time(sbi, REQ_TIME);
 
 out_sem:
 	filemap_invalidate_unlock_shared(inode->i_mapping);
-out_pagefault:
 	sb_end_pagefault(inode->i_sb);
 out:
+	kfree(ffs);
 	ret = vmf_fs_error(err);
 
-	trace_f2fs_vm_page_mkwrite(inode, folio->index, vmf->vma->vm_flags, ret);
+	trace_f2fs_vm_page_mkwrite(inode, pidx, vmf->vma->vm_flags, ret);
 	return ret;
 }
 
-- 
2.43.0

