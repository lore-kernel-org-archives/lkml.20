Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985906;
	b=u4/+VI3wIsISPPyl7MZ6RXVVfXA0JEUnia/5vBJsFeSI1FecLyi8onJTtgsNW/DjTpQV
	 N0+Em41AQ84jRE9H4E19Y5lXIs8yBYdCy9wQ2nKkigB1HVJW2VfrjRcxXJS6RxvCnqMbD
	 CXpLCIXtH4S1N33jV+PYZGi+aysB5u2Dz+ELPQR4JnPXd7oCRpsC7PiPKJPs/pR/y2k0Y
	 yf2cINaEXS2ZYBLGAsSR+0F5eJ1u4rRNXSgYp22JezbZTtW5YkKWE1LwPr6J3tf4xeoVN
	 slf9DLxzfpRW6kSmBfBDsYSvPlpl0OwZJHuoBP8ss/Qy6jLZCyeceaiLIqsNFAgtlOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xH8iNd9WnjMnVC8aNeUQIIpc1ap9O6kroHREtqw8lw0=;
	b=dmDYwwfkDpmNConREInH5Hog7wi04Os6egGZT2lJ0n27U6jeObC6/eaMbl3iAkOaIdnE
	 pntJoYAF5mu57ke0k54Pjz71PPJaerBXqpxk7ayHXZES60nV0p/iDUUYrg3OxcTfcgRJg
	 DmfxSrfIqBKaKe+xyCCsi0BLRtnk82/U9M2a/GOvIGYZ4U9yFtGkvC05quhv3NddSR/Ml
	 h5TwLTdb+y3Rn8R/3XbU2WUIq5v1gnPAJr/jQEiKjwhUNmEjoewX+mC/+O4heSEOvgbv4
	 3GP0DkFRFiKnI68SGcjeUp+XSyAxTMZxoRV+K4e/S+aASJcbcmalXDGGUmXkqd1tJHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Po6FIXhL;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC30F606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC30F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Po6FIXhL
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so1779054a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985905; x=1793590705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xH8iNd9WnjMnVC8aNeUQIIpc1ap9O6kroHREtqw8lw0=;
        b=Po6FIXhLbwy4nmxTucIyCKT0USxHNa5pEymJPMu4wC9JH1sOhfXf/+OfIZpAMrbOY7
         h1qvg1Rhn5eVChSIrUBYFIy314SF0/I1JYL4OyHkXewWbYfYwY1r5SRoBT+1teshK/Dd
         GPm2sv5UAtYTjZQkyaGykv4+Sygd7p+Ys56SXIxxTNNAP+mzGb8+zClOgU13xBqj6wo3
         H61VTINAFgmov0RZx2VOrv6+/By6tnNZrCXvPB+1a3E4OAi8NuRb00dom6RHyLrXLZIx
         dqONW3faUdNMaUBXJqYpqS/VDMBy7SlFRWzk+aS2P8D2Q1CBK3/wr28dAwfL2+IqCIgq
         byDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985905; x=1793590705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xH8iNd9WnjMnVC8aNeUQIIpc1ap9O6kroHREtqw8lw0=;
        b=HpGbvU9xd98KsBB1yj4A724MbL+VvxPikNhMHjkWe5y3J+E1pCqPvYei6jDHt1n9uF
         u/4P3CIVVlJ+Y36SXP+Z6pRq3jwX6v4b95oFCvIPS1FHFmVdGi0Cpjpq4fEDupEwI92n
         fuoBQ0fpSqysOj6DqOOgMwepu2WOUUqsVBb+ww1U8fiHBV0/ECasNVjdO9sGUPE2Tyvk
         bifkBdhcY3FWbyJbFVYdtpcwJoFfDxmssXTGbL3Fv/LFc2eLGjFAiG9fuClyit6wImQe
         0kDKzrgmrvTPykvgnI6UL6dCuD2r4N+v+ITrQBui/IdMH5se3emTe9WynsvbEkcxyXG5
         4gvw==
X-Forwarded-Encrypted: i=1; AKwUvBwd1gGFv/THOsOVJN26Q5eoQ2fyUkQ/K8kxCD1/7EJj4ERfY/dKTZAK69ANa4U+WAc5lYiiwBfZoynMdEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8AKsjQ46Nbls+zg8jVGMHQh6zvXAi15CDEVi97L7ezBkDh7Fr
	I9aoYE4ONeiMW2xXI0/GOIoEqiuNRbONh3CkRbJ9JaODzrIaivN6q2Ia
X-Gm-Gg: AYBFou1O0jAP3orqAe1ac2yq+aA8adXh83gfNXF9zVrruX1nVe+YaDRELZKhXg31Gmn
	8VsvLY00B7VRm7ktysksdn+N2W7Ikz/30zOhn5GFY5y+0Lt+gDTiC1///KVYowCZIUA0Wg0NfYk
	SgDLeDsDIfK98fg3g0pjsIz7aIzXryxsIrnHRLZ/OEHfw6p4eDhLbNilhOTg3feQJVSVdBh0Np7
	H5g8ApSiJ2KYIlWv2L4IvAYh+WbPLFHew5l1yR+acUrtaREbjRTyOqarvl9Fp4QlukzjlbtIBsZ
	6faD+ukkBUGvQnQbNNCpMdZ55UdhMSHC5iAB2ZjbA+chNUgBdTqlPeWDi90F+7+1/S1aq9u1GZ8
	g5RzRsYhamanROODxgEnLWxoeTBmrQH3L4qzNt05Bhfw59oDlZYF27l3syIBaad/cBw5hoKahrT
	/NWRCy321KhexNxd6T2FOfJK9+FCHeJad6sGxazFvXMpAt8UyshTVZ18rLguWKz4uUzKHr80WlI
	CG5ntU1XbTnXma8Ndu2DJbutbjUA78JtPfJ83ZWQf9jUb2P9FKkXPq+e+utmQVkmlyjYfScGo3j
	LEnzzftlKGVBrlzCaf1a8+5mTDQHhR1e6ErbKYiAZC4Z9BcP/460PldGXXxvzjhWBj0=
X-Received: by 2002:a17:90b:2642:b0:3ac:9df3:6b07 with SMTP id 98e67ed59e1d1-3adead488demr4751824a91.24.1792985905155;
        Sun, 25 Oct 2026 20:38:25 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm6409823a91.8.2026.10.25.20.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:38:24 -0700 (PDT)
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
Subject: [PATCH v7 07/15] f2fs: prepare mmap write faults for large folios
Date: Mon, 26 Oct 2026 11:37:37 +0800
Message-ID: <20261026033745.784107-8-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
References: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
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

