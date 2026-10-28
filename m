Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202293;
	b=YXBzJq4GgSwBtWq/FRRg/Jpz/N4ZoFqUG8VbdC6/S2dEkjxDKhuqVsp0P9SfQXBIzgL2
	 H5gmXcHJlABAnHp5LTil7oXXnBddDrRR8pcdynzo5eyp21tDH8q16Y65FkWmNWLFTbIY0
	 G3wO3C3p/A4XTh46TIGb4IVnqSbBeCjzqu5a6DXBH3HpBJPBbGNmhiuTl7RwtXumZxS8d
	 Fyl3ZY3CSFgcfskWlkAeESz2YRfdntcVdqykCqty4tNdcrtkaplDGGn6bsZ1QyaKdKVlI
	 iIBFK18q9REhIJEdEi++4enuHUk/I5uwu/0d0a4kddBbhzZh0o9GXUtL2/et1C1vDbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LORGcuc8O0L/vH21hXMJWtdhT1Zde6A3278YgqRw6ZI=;
	b=YiXp9XHOmqYJMkOpwCIEoWpmLZdGXLt9gWnAwqM1yc9Ge2bBCrVw93i/kZnxMPWdfFTq
	 XMQq11X+JWTN7CcoTUzHLlHwmAwKuQnsBSzjTn0ffA36MKM0uriRs3H0kkbIbutwuo5Pp
	 G+pAn2Fab59nqVzzw85p7cP7+d4dBhtUs3WeHPuUN3kehooyRtFLv1+093YOxyAo1YzBN
	 r23Vo/0tH/gGntlSdu3FhbAUTQvaRyj8sCEVU9md+dtvUJDObdnkT69hf/xY9mCqISDay
	 8LrRfn3JZMArmunELkIOiOnh/JljHUjWGTQJu+bXHPN43/ME07NQKdhlXcalJ+4BJkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFWbiwTo;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300D2606C05C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 300D2606C05C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFWbiwTo
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3ae434786fcso601197a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202292; x=1793807092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LORGcuc8O0L/vH21hXMJWtdhT1Zde6A3278YgqRw6ZI=;
        b=mFWbiwToNAG2sJAOiBO8q8nP8W3gIqyCjWQHLTX4iJItPyfZSJiQFqEcI9BdVGD33M
         QM3OoZbCVdWAS7Hudilh/xmMJAnR17BxJr4cetHV8GGRDPlsHr23bTqQUcww5JAnKaQ2
         njpdXqNQWmQJt9adhydoUeA20qkESozTdkGSE+zb0/+dzYyQzw1cw12Mmqpt8N2bQR1/
         X6AoWPpaf+H1GsMmVAbBTNvOw7XB/5HHO6beERfPSl1leecHRPSdSCWIAuuSBhdOR0Pg
         gkpktJFUScenjMYXHDr7rdeQlpBA7wb+ofZOh2UK/45NNyl43NSBuZIaIr9sBr42q/nQ
         jqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202292; x=1793807092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LORGcuc8O0L/vH21hXMJWtdhT1Zde6A3278YgqRw6ZI=;
        b=sEt0g/k/solb81P5i56NPXCMll2hcluDq3Cvy7iODyiyOpbrL5xkWHQTmdRPk+pUDb
         8gYoHNUcSwu41k7BprblPxz2/5JJjLv8GbL73csHyyQpzhVbDA/p+U/slhuf0Kbyn41+
         Ry4VpRUppFyLCyMoWjOF+KbiRmAUFl3UiuTZSWYxGKBh8H5q0brdO3LlA5tswJubD5zy
         EldKDpotAGXYxLesLIhH3/YBzp2Zw+nki0wnM2Q5T9+Gwv12tL7Y3iK8rIuFGReKPxhx
         GWIN7+OHY27XvA5ACp5cvd4AXA+YKm5wzIu8Ikm7PhNlAJc7khE4W5UUnzbKIumo+nuK
         8+mA==
X-Forwarded-Encrypted: i=1; AKwUvBzcDX6d28pxDCLHn/JOu8r/S8LtYeUL+nVaXTP23ScTMbN7FySD6hT42HJcpej+mhDOGYelDntdvfOMy+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkn5JepDvhZNDca9ZH4pDbnMmJqrsBkRoPk2c1dAuo1Np4s4VF
	RW9x25Vvxd5uPbFJ3+8/zx+PONaYNODyOyba9O7QaSbLTv0ojJp6wXnd
X-Gm-Gg: AYBFou1CTWFgjV9MNmOy5xnoAT6s35jjZsKkO+oWhusWIvzEHu6fs/vMrIFstLi4p2B
	gOKgnoTAfBly0bgq4Z3KNiBALXGOh0YE7TV774uYOXEcXMEp5SHvVjtj5EqC1xjaw7v8ErmKbQR
	Txr4aZVXXDB+6NyTOIaPQfXEJgV5eW2+wqT4hOqPToSmre766T9P8s8UmzhO8id/HO183at3pmK
	+ABrrxJOWaqZ0S3fhqWPYnlqEOSvgiblySqFuFyApE+X/jvLiO2dxn5RMdoEHDqUizxhwznKxTT
	yms4ivCGIx/nR/u+tMsK7Q8JIC+hnPGlFWQe3BVHn8Q8inJm3XAZF2pu2lAeeRiUiYBBMOxS2G1
	IxpOohQCqHdmmmPKnOJSi1y+GygsX+BpqNh4QdotSw9MgwoEqrau9VVbvM7hs1TfRUFZ7XDUnYy
	ZZXPxIQR8DMG1E/yzrWTMVivE5tHQB/x7ImTQHVON/nBPmR9py9yJVJlbaSER7f7VpnhTz1AHNY
	wHmXi/i1szuAk9+rnZi8b7kw9hUBeb12W3eIwGfn3JyLR+F8RcJPq2dI18KN0rpn0fwebz9gYLX
	csoytN7SxD/55D+PtiTa4EDDXYvxQBOTCdRhqxnwA+C3tDxI/aujye1YNxmUnIyVt4qK
X-Received: by 2002:a17:90b:2891:b0:3ab:2c2b:1026 with SMTP id 98e67ed59e1d1-3ae580a1c9dmr2178793a91.34.1793202292144;
        Wed, 28 Oct 2026 08:44:52 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be5105sm24111655ad.37.2026.10.28.08.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:51 -0700 (PDT)
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
Subject: [PATCH v8 07/15] f2fs: prepare mmap write faults for large folios
Date: Wed, 28 Oct 2026 23:43:58 +0800
Message-ID: <20261028154407.1601430-8-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
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
 fs/f2fs/f2fs.h |   4 ++
 fs/f2fs/file.c | 105 +++++++++++++++++++++++++++++++++----------------
 2 files changed, 76 insertions(+), 33 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 99db13fc9299..328c3ff36b47 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4503,6 +4503,10 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
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
index 85b4f1a2ff0d..33964da53584 100644
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
 
@@ -200,62 +229,72 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
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
+	/*
+	 * The whole valid range of a large folio will be dirtied below, so
+	 * all of its subpages must be uptodate.  A racing COLLAPSE_RANGE,
+	 * INSERT_RANGE or punch hole can invalidate part of the folio via
+	 * f2fs_invalidate_folio() while it is unlocked, so return
+	 * VM_FAULT_NOPAGE and let the faulting access be retried.
+	 */
+	if (folio_test_large(folio) && !folio_test_uptodate(folio)) {
+		folio_unlock(folio);
+		err = -EFAULT;
+		goto out_sem;
 	}
 
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

