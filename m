Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0D04779B2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960351; cv=none; b=q1vrZmWkpZiKs4UZDlc3jRTvEHvuW5X0GLPSyWf3ZiT3+PxrJIM8IvZ0AWk4Fa2LaRTi/JLe0f9S64hHCqWtDAFv7uC/GOBV2OlqeidZUCydCZa2hEMA+23CyN01q6LIdiUu5fah9CHejjvUL/BC/xgceA30G0zO/PO5F/6uZEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960351; c=relaxed/simple;
	bh=BIn70+oa8QqS0TIHuIuXpIo/aCE5GqKfsAhydYPCPoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahgsSEnNHlUIT2jf6sz1jT4jUGfajQQgq0Wdz1wXGuX8Pj+MpQAvsL0hw+9R9MR4bSijNfXSLBEhSmuCsxlKsPLrhrZz+GVcePMVsS6ZJPKwzNJ0QPYw7O9qdfjtPayWZ5X7Vc5c3K/Me3F20sOpNDNUqdhCbYy8rzYH3uS0mg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiqd0LAM; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiqd0LAM"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso1846936a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791960345; x=1792565145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iq0JUoaxWVUD6dRb+7CnNaLcmONU4gHxT5O+hxYjY8M=;
        b=eiqd0LAMH5SkNIzUdbui+44yjM0r4eJEY1onp3npHegg1zmuVrmFb7PpnDNeiA1UKE
         WuzpjmG4eqjhy4jIRWEz4Wbce4QoTTB8o4GPnc+IWqLxScnpzDHqZ7rUO+F9z0E2I+Z+
         TmFYs1rniFQCRJFbV6K0z5+cT/iRrN5ri9MB23IYpNTkWOs14/lsktNNNJq48K+jEWA1
         gNR8VjYz+lkRTYg9+gsuSQIn04YMpdGxPqvwQslxdCY/mmVdcNYF/TgttzU2dBKruW9b
         +KOTMrOsgtCgRPaGJn1uQVoLiG1wUZ6OLWdYavkgfeOkXQECpM7xlNLq7NnF9UlDShNy
         na5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960345; x=1792565145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iq0JUoaxWVUD6dRb+7CnNaLcmONU4gHxT5O+hxYjY8M=;
        b=XQqfuvjbwNjIvYYWw2Ywb+oVvHFE0+S7fL61+gI8/VnFOKjciWjqMW2mOwczDT1uba
         4PvuaGueDZhvvHNUAGIjCLXkerJUi6PGTgIgIrC82kdw4xR61D0u+xm2WmwR0fE60csG
         CbOv8tgRUla+9PvB9Ff+nKQCzjkrSJnyF50QBwTpFgHQJMiqsXVnfBVd0WQhYqI/yMzz
         9IBDo8Z2/U8svLUZRzIxX1FkCGokVWM8JwU34bxV5Vsd92c2yli8vKnjm/ytQdJaJSmL
         32yaFp1x3Ep9q/YVJ52DPTxCf3rzyG9HS4aeq1dFfCQ7yddjb8oXNF1T3sRmmJZslk9a
         9K7g==
X-Forwarded-Encrypted: i=1; AKwUvBxBfTG2xhCJVB6Stvi3XJzHnD86nPzt7whG++WDhQc8PnD+zezQUjNeqgv0zZGtKXj55K2oiAItweAnbLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYILjQR7RoQ5JsKgtKYa2IUFiKwt2LbVV5oUty2koa+T6O8sbpUT
	JbZrhdbak6sXnYbdPhZGuP5h7yGa14qE+CpRDHfwdlUO6H4YPgAPdmWJ
X-Gm-Gg: AYBFou3OYInNYvVt8wCeqLVRIoezfgwrb2+v63Ct9xTu7LBR8tyN34sxQuGTgtZx1e8
	w7wz+zbVenPVNmnDfjqM8Wbnc6RwWKUZyhOlH3gxLCbiDP59fO9XgiIxXsjvy3PvvfHaXqlx94i
	Z/R6vNE3Z2x/QIY5tQ0t1UGZiqhYD5aLR6GJ1EOfTbyHXYOvZHRhm+NXBhs3176wqoC1R5ZCMWC
	Dd2jPgFUwpWn8+rqB9COPRk5HH9Uc83ksEslmbddrGvm+0GaL04fmroEtMxkOCWbKwHOwi8Y9MY
	Uc6dFE5O6e/oabAhKoZ9AniQGv9iZ9cEZS16Xm/D1mEfWhMhi5R3CLzj9s+ohP//ugYF+898gos
	EQ0952M1NpL6EfwPy+hrvazP5j+x/D5AScgpR1AJnoKRJz4vQnVKaSvdlAwqBwdKDFGZvjYDdeH
	AIIFcGyEyidUse4g0NVyHVSspWcf+ceA5b9Wt4B8tOg+m3NNMstxVbw8HW488o6AygE1pT25xBs
	Db8zCb8C9GKGkHISRGINbFmD4gkf2wjoceF
X-Received: by 2002:a17:90b:4d86:b0:3a6:d8e0:c359 with SMTP id 98e67ed59e1d1-3ab3a2fe039mr12110258a91.2.1791960345069;
        Tue, 13 Oct 2026 23:45:45 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3236371a91.2.2026.10.13.23.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:45:44 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
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
Subject: [PATCH v5 07/16] f2fs: prepare mmap write faults for large folios
Date: Wed, 14 Oct 2026 14:44:36 +0800
Message-ID: <20261014064445.2835813-8-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 fs/f2fs/f2fs.h |  4 +++
 fs/f2fs/file.c | 96 ++++++++++++++++++++++++++++++++------------------
 2 files changed, 65 insertions(+), 35 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9edff1e79f2c..d976e6ad058b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4492,6 +4492,10 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				enum iostat_type io_type,
 				int compr_blocks, bool allow_balance);
 bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
+struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio);
+void f2fs_ffs_mark_subrange_dirty(struct folio *folio, size_t offset, size_t len);
+bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
+					    size_t len);
 void f2fs_write_failed(struct inode *inode, loff_t to);
 void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool f2fs_release_folio(struct folio *folio, gfp_t wait);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e53cdb4467b4..30f1484d2f48 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -118,14 +118,48 @@ static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
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
 
@@ -166,7 +200,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (f2fs_compressed_file(inode)) {
-		int ret = f2fs_is_compressed_cluster(inode, folio->index);
+		int ret = f2fs_is_compressed_cluster(inode, pidx);
 
 		if (ret < 0) {
 			err = ret;
@@ -184,11 +218,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
 
-	err = f2fs_zero_post_eof_page(inode,
-		(folio->index + 1) << PAGE_SHIFT, true, false);
-	if (err)
-		goto out_pagefault;
-
 	file_update_time(vmf->vma->vm_file);
 	filemap_invalidate_lock_shared(inode->i_mapping);
 
@@ -204,62 +233,59 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	}
 
 	folio_lock(folio);
-	/*
-	 * A concurrent buffered write can extend isize, so we store isize in a
-	 * local variable to let the zeroing offset match the EOF check below.
-	 */
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
+	if (folio_test_large(folio) && !f2fs_ffs_find_or_alloc(folio)) {
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
 	ret = vmf_fs_error(err);
 
-	trace_f2fs_vm_page_mkwrite(inode, folio->index, vmf->vma->vm_flags, ret);
+	trace_f2fs_vm_page_mkwrite(inode, pidx, vmf->vma->vm_flags, ret);
 	return ret;
 }
 
-- 
2.43.0

