Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655660;
	b=ezz6Bke8YZXAOgyZV5EbBCILnq8rtlC4nOWjT4clGOduTj/XViLGV1Vojay9rQZlH/nx
	 naJaNXwTLC8I0z6zlylbH/lYACqV87QdGM4yzKW5ft5QMv14qehXYL26qVeAyITdcTPCE
	 LKHyOKfZSTnQzcwVa0YWJLvMfaspo8hWLZrOl7X1qUJDZdCv+n+OytFlhXV4ix+YSZb7u
	 CAX7yY7FK7TifLjSabS/VyoYn1v7aHMBG2ud1oPKF8iJbZkf3VNzz6hR1sD8fg83rs+uD
	 kUCzXG3IaBUxyM17uwQ1/awhkOZLs/f7flD/+SAf3moJCvsoWaYKFxFzpTGKaUC9XvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xH8iNd9WnjMnVC8aNeUQIIpc1ap9O6kroHREtqw8lw0=;
	b=f5VccZ13bazx+ql4cf1fhshYl899kqt+qVPO/omXZy0m0mRKzKKGzJLqiYa5pNRIL5km
	 /KvypOLALsWLrZIlsQxPZOgiMSpDDVDfHZ3XB95uaNieyGDPloKWY5FqPi2J0HcbQInVA
	 pC2wsMFqAvDTAe+ZSDOVuSq2u6hI22QuE5xd2/RKuZCGTPPdrkUj8KKG/1n6BraYBTFnw
	 AKUCoQFkvcl+TQtq/L0cNd6Qq7owKVx+7Ck+tcEQDlNYiaJ2VeF3/FzIEQj+qSdttkjs/
	 YSySltEy5UbWVyiT0YXAIT7Dn82eCd6GhJMD8x6sofjQIfaqpYxUpO/r92xr25rOIRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bUo2pbZS;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA63606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA63606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bUo2pbZS
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac63aee1ecso403862a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655660; x=1793260460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xH8iNd9WnjMnVC8aNeUQIIpc1ap9O6kroHREtqw8lw0=;
        b=bUo2pbZSagRAZ+akRuveRfN8qqHvN/e8ApliOgTTMhBtv/22Y8+WIltzsi8i2ddbgo
         Boy++iICqCNXO7fU90LYPVP+Za70qXTfIDcHcWT540TI5r0uS6H0qQv2+8S854NOjZsN
         7OF7Hn93Gr5GQJqj7aLgpjpkJEEZ59Yvm87qPzeMIRaGoRjOXeBRTqzdnAde/duyNgEf
         fWEYMIzAAVpInTz+BenikMfuA9A5oIES2ByrYOvmkzHYwEW+GVek0uij4HHU3d3DPHr4
         XVAk642XJPJX6AUF+v9pEYyl1SbT2dKSP+Q65136pPw/GkBYLSLUYOcw22yoDCBoBUUc
         T+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655660; x=1793260460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xH8iNd9WnjMnVC8aNeUQIIpc1ap9O6kroHREtqw8lw0=;
        b=ioNCQBYmwJXht6qxcC80Li5X7MfvUCVKvZgohlCAMSLtdNDYN9fAol93g4UvKkrRSE
         0GMeeNSZO2AWrOjLilXCtWPeBbGktPw97OrbIiJnWESEw/J7LopnFk1fOW00eenCsoBr
         FFXKTvO4eZHwoujAu5XksbFMenKHeiIr8r/InLe45pEnEIV+bNquAcOGUrtGHcU80BTN
         olpXCscCnUdnY7p1KPHIEkpTeHbSEd/OmipL2sGmLglqJFWNrALMKgdRPt2Pbm9MG+37
         EunKYtXBBTbZB4fJIqkN8WfUsdg5dU2GA71QKr5gUd+BYNyfRugDJ0EhIrcyBWWvE07a
         WKfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXdaTuzMdKuBGOD38HDNLT1qOKrL8eXLOdsLIGlGKZqnL3HlR99YzrY4IIWqjJNNe7W/ztrxh6k4eg/zo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS7LHOm8IT8ZrGjNugUcdaEpEbdQqHtoiIP3YhTTgrWyak1okh
	3kBA1eQyLXWNw3gY/bjhkvtT9o34ylFv84qtp9k4E61WoNm1bVk1ZR4J
X-Gm-Gg: AYBFou0AdBRNlNWOLKZU6s5m2s8XUCey+fqDaUU+niB90ToQni0DixIcno30FTsLtNP
	sKCSk/Uj2xE2Xj3BUPMfgeQSMJNXhrhn2rQvJBN9+7UqaNiptqhZBexz2KZdcKCTUwHYRVuY2fX
	u2BIML1XktJW3UqMDxeNRrTpwoVG5X1gkeeGJX4JHNEdWxZywK1mSnYoFBU/Z4hnbLOer9NAeYm
	qdH+DX81mdeJuyQwrvlWR0TEv5Rg1Feh4P7aXzti8nrdix1wB+xP+ZAAQbuhYK7yU1EcJoBiFxA
	AKv4SObLDqISaCdSsvHBHJfGPEQP/4yrNJx7x4bKXLCw0HSs+NzE1XnOxBn2+Rd6Uq9K//lYpzB
	FwnkW9F1TuwUF7dNZBduXK+gUGIWlHvhqzhuDr4M5C0lW12l2CExf6KEppx1eHBqch/muXGhk3B
	Q57tyYV1TDlScQumJPtC/B8vWfKGmeYrblNDUdoLdwEXyWL1jZYTIax9/xfvqTUwrip0vYSGZip
	lRmrBrSnz+sr7hTUIJrIX6BYzeJU7vmNEPnqAHto8+fTKRktrPfy13i3xu0Q3ww9JlS59ElAA8C
	Pi6pWyUdm3awoDMUCQ==
X-Received: by 2002:a17:90b:4c49:b0:3a8:32f2:f4a5 with SMTP id 98e67ed59e1d1-3ad86f1c242mr3848025a91.53.1792655659586;
        Thu, 22 Oct 2026 00:54:19 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm3202562a91.6.2026.10.22.00.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:54:19 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v6 07/15] f2fs: prepare mmap write faults for large folios
Date: Thu, 22 Oct 2026 15:53:34 +0800
Message-ID: <20261022075343.3043003-8-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
References: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
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
 fs/f2fs/f2fs.h |  4 +++
 fs/f2fs/file.c | 96 ++++++++++++++++++++++++++++++++------------------
 2 files changed, 65 insertions(+), 35 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b89664e28a92..915ca72cf276 100644
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
index 85b4f1a2ff0d..808b72d3d78a 100644
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
 
@@ -162,7 +196,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (f2fs_compressed_file(inode)) {
-		int ret = f2fs_is_compressed_cluster(inode, folio->index);
+		int ret = f2fs_is_compressed_cluster(inode, pidx);
 
 		if (ret < 0) {
 			err = ret;
@@ -180,11 +214,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
 
-	err = f2fs_zero_post_eof_page(inode,
-		(folio->index + 1) << PAGE_SHIFT, true, false);
-	if (err)
-		goto out_pagefault;
-
 	file_update_time(vmf->vma->vm_file);
 	filemap_invalidate_lock_shared(inode->i_mapping);
 
@@ -200,62 +229,59 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
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

