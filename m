Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985924;
	b=Wwra04ayKzv1qpTJkz4xg4Z6K9zjoAoNk14iJHsQT6nQbu0xaM7Ms2htp60tQvBKf4HU
	 b1BCGzKqMCsICiio2cH6XdWASptKWa4Ma/CT5gH89HsefBDZrR6FYfjoUa0qF5FNUDYBq
	 f3awShqtcu/taWS381P9LfmbxBIYjbcvYnpKEeWK7pInLlSjg3n8LkiSKq6LVUpUVGxlp
	 BaWQX8PmM3mrt3CL6p7DD4Qp99K3FT7kEOHUEol12C+3cfz5zvf16LH/pPg5D0sFq7YAF
	 y8pui3UycS7OmVva/f7S3SJ9OHrehPvbqn+NEi9LZLWV4fI5A7j2vBWAJRShgJpToiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gRXMIt1xZlGHxLGBAD5XVRfeBcwnFPnW7+Pvj+Pw9YI=;
	b=jwou8jEvkesqmfUAjM8Xc23tU5Fij8/y6cf6sCTcO8Z1o/feENcoxEinrRrhGvqFWTJ9
	 ES6axhki72uzu2z549bPfeAjrhZkNft8f6vIX9ATQupHGj8c7D4wJgTY0LMz5KQHSf7RG
	 suye1O2BKBHYuxM6/RjLFv2bMYuvxjSJpusF4vLuFqWmxzKl5EXjJeJQVfRf8nzkYXFlj
	 tnhRlYmom25MFMYL2b2ur1tZD7/k3RRTBt1zBdrdgNYvgvxkcwOy1OeXtbTmpSGNSVzs+
	 ikr1/Piq5h4U713QL7pnjwPDFELykaHINdpDmPqHdrHfJbTH+V7AYr6GMSX0FlErDlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o1hwsNDl;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C3A606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78C3A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o1hwsNDl
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e97ddaf3c4so11484285ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985924; x=1793590724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRXMIt1xZlGHxLGBAD5XVRfeBcwnFPnW7+Pvj+Pw9YI=;
        b=o1hwsNDlHV7Gz7kAmC+gm/DtT5m1nF6a2kpumMHUEBZgnDEkLyERNXAY3AZli4+dn7
         U+sQPU4hfa+KR3TEVE1lrVnRhDrzzzzleE2ifNe4RQHM8kNaoselbOWCtWXbUJ6sluLa
         ZPkthR78QO+5/sGfH9fw6KqaigZ6fSb7QDO6AJuoHB3bHDueqyVMhb9YeKrlqDw0/2Wq
         HS57pCZx8Fd0w0SZCLQVD6SHwmTT9BvzM62apOJRcScPDPlPWFTe5//m1epETUZkUnfW
         KUiGhj2JHbQEAylS0jn6tQvUCUMs+MTuLhE8cqIsZ5heXcdc2u/pbHysWgwRwlAsRpel
         8X4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985924; x=1793590724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gRXMIt1xZlGHxLGBAD5XVRfeBcwnFPnW7+Pvj+Pw9YI=;
        b=y+b5yphlpHcpqhB1SrmmQiVvkrL53TbbtTtH2tzbMzatjgDuSxclWrBOJwiSZ8tgo9
         BRP6XOmXEBB8Lm0N0xjFLi0Hbdk0ERtGD3IFzOYtMHN0faRJ3iXYMyDjAPTmOFMUTuzl
         lfQ8DQ/veQQQEvynXF06WGZHYIWaagWQngniVs0oLaAI2JXQW3Vq89E8dh8srLO46Zuu
         U1KpGUka9c29/r2lkJRCt5bM3JqRNw2IlcJiP2tkzXDQfFeJhCkx88K68xD7xzVTgcQ5
         jcWRjo03U0vyS1TyLS8THCAVKpQSkJJPX//2ZJym+4yBJWjSx793hKW5/CpPjn916C+T
         So1Q==
X-Forwarded-Encrypted: i=1; AKwUvByLZHKpRGUlKH8T28ynAwLGiLetLXF24tP/lo+BsGtud68D3BrIoVyykRxXUxpb0Aa4hBgjWQavMUxQxqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUKLx95sq/lL4p/ejxjy0XPwBZPJ2SKRVUgsy1a09mCT84sHCr
	7EC1ipC/B7dNk12RYgAfZB5r3JdOXb6ssfcUZdkXEAhf/9b/P32nwZ6v
X-Gm-Gg: AYBFou30ileuaOCfVTRlLiehBMxJnavYY3kqNdeB+6jOh8NYNqkq2ju4JgWiINLFNpB
	ppgmd/PHuJ9mR/N9bCyFKZj3m+E2zNQXU0c7b/3iHAmvv1Xu2sNeG1w/EFaYdQ8g3s8PBjo1j6B
	SU2Awd28T4KoftDtDdKIHrJPCWKWgIohd3L/nEv3pHFvSBkCGgy76kjILYy17+6kwOJCfdqJOS0
	eUvxV1HJZJ8H16atbCmM1HtXzbRngvuw+t/ng7zh7MLeqdE3wDOYqfYq/K4QAIW+PGGzP50/iXD
	Fvb5/OPQ9sf0054hIPIMjejjU56nc8vXtSGSmBrZozxvwMXqryNdfPz4k/SPW/RscvxAwGlLjA4
	3QD7ye4i6BHfVgOjrxmkylXYAOLU16r/WggriC3p9OaIbfnxvjEeMdJ91LSO5lX1RY1y7eSkaSz
	UxYQcCNmFiGBXyQ2JTP7Habi3Opl7gDqMUF5nx/+PjJmAluk+OQhwIGdTTCj9Nnz/fp3NmUIDCj
	JR57Xmd2t9zmL2ZN8qi5tQVYGRY6BHj45NXYl+e+HeX1/YKqKX8vd0TtX2EICxvQuc9o/LudFjL
	AeYjhuGfJr2/iRNrDA==
X-Received: by 2002:a17:90b:4a12:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3adeaae86a1mr5173447a91.30.1792985923731;
        Sun, 25 Oct 2026 20:38:43 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm6409823a91.8.2026.10.25.20.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:38:43 -0700 (PDT)
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
Subject: [PATCH v7 11/15] f2fs: handle partial truncate of large folio dirty subpages
Date: Mon, 26 Oct 2026 11:37:41 +0800
Message-ID: <20261026033745.784107-12-nzzhao.sigma@gmail.com>
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

A large folio can be partial truncated and stays in folio mapping, we
need to clear the subrange dirty bits and uptodate bits that the partial
truncate covers. If this partial truncate happens to clear the last
subrange dirty bits, then cancel the whole folio dirty state.

Also add a guard in f2fs_write_folio_dirty_range() so a large folio
subpage whose disk block was already truncated (NULL_ADDR) is skipped

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 89 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2dacc9211cc2..33750ebf31cb 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -404,7 +404,6 @@ static void f2fs_ffs_put_write_pending(struct folio *folio, unsigned int nr)
 	if (folio_test_writeback(folio))
 		folio_end_writeback(folio);
 }
-
 static void f2fs_write_end_bio(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi = bio->bi_private;
@@ -2971,6 +2970,41 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
 		folio_mark_uptodate(folio);
 }
 
+static void ffs_clear_subrange_uptodate(struct folio *folio,
+					size_t offset, size_t len)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int nr_subpages, start, end;
+	unsigned long flags;
+
+	f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
+
+	if (!f2fs_folio_has_ffs(folio))
+		return;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	nr_subpages = folio_nr_pages(folio);
+	start = offset >> PAGE_SHIFT;
+	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	end = min(end, nr_subpages);
+
+	spin_lock_irqsave(&ffs->state_lock, flags);
+	bitmap_clear(ffs->state, start, end - start);
+	spin_unlock_irqrestore(&ffs->state_lock, flags);
+}
+
+static void f2fs_clear_truncated_page_state(struct folio *folio, pgoff_t i)
+{
+	if (f2fs_folio_has_ffs(folio)) {
+		ffs_clear_subrange_uptodate(folio,
+				(loff_t)i << PAGE_SHIFT, PAGE_SIZE);
+		folio_clear_uptodate(folio);
+	} else {
+		folio_clear_uptodate(folio);
+		folio_clear_f2fs_gcing(folio);
+	}
+}
+
 bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index)
 {
 	struct f2fs_folio_state *ffs;
@@ -3751,7 +3785,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 
 	/* This page is already truncated */
 	if (fio->old_blkaddr == NULL_ADDR) {
-		folio_clear_uptodate(folio);
+		f2fs_clear_truncated_page_state(folio, fio->folio_offset);
 		goto out_writepage;
 	}
 got_it:
@@ -3901,12 +3935,31 @@ static int f2fs_write_folio_dirty_range(struct folio *folio, int *submitted,
 		}
 
 		err = f2fs_get_dnode_of_data(&dn, data_idx, LOOKUP_NODE);
-		if (err)
+		/*
+		 * If a subpage of folio for a cow file is dirtied but not
+		 * reserve a cow block, fallback to original inode to lookup
+		 * block address
+		 */
+		if (atomic_commit && (err == -ENOENT ||
+		    (!err && dn.data_blkaddr == NULL_ADDR))) {
+			f2fs_put_dnode(&dn);
+			set_new_dnode(&dn, inode, NULL, NULL, 0);
+			err = f2fs_get_dnode_of_data(&dn, data_idx,
+						     LOOKUP_NODE);
+		}
+		if (err && err != -ENOENT)
 			goto block_done;
 		dn_held = true;
 
 		fio.old_blkaddr = dn.data_blkaddr;
 
+		/* This page is already truncated */
+		if (err == -ENOENT || fio.old_blkaddr == NULL_ADDR) {
+			f2fs_clear_truncated_page_state(folio, i);
+			err = 0;
+			goto block_done;
+		}
+
 got_it:
 		if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
 		    !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
@@ -5455,10 +5508,41 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 
 	if (inode->i_ino >= F2FS_ROOT_INO(sbi) &&
-				(offset || length != folio_size(folio)))
+				(offset || length != folio_size(folio))) {
+		size_t clear_start = round_up(offset, PAGE_SIZE);
+		size_t clear_end = round_down(offset + length, PAGE_SIZE);
+		size_t clear_length;
+		bool dirty;
+
+		/*
+		 * If the truncated range falls within a single subpage, no
+		 * subpage state needs to be cleared.
+		 */
+		if (clear_start >= clear_end || !f2fs_folio_has_ffs(folio))
+			return;
+
+		clear_length = clear_end - clear_start;
+		dirty = f2fs_ffs_clear_subrange_dirty_and_test(folio,
+						clear_start, clear_length);
+		ffs_clear_subrange_uptodate(folio, clear_start, clear_length);
+		folio_clear_uptodate(folio);
+
+		/*
+		 * If the truncated subrange happens to clear the remaining
+		 * dirty bitmap of the whole folio, cancel the folio-level
+		 * dirty state.
+		 */
+		if (!dirty && folio_test_dirty(folio))
+			folio_cancel_dirty(folio);
+		if (!dirty && !folio_test_writeback(folio))
+			folio_clear_f2fs_gcing(folio);
 		return;
+	}
 
-	if (folio_test_dirty(folio)) {
+	if (f2fs_folio_has_ffs(folio)) {
+		f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
+							folio_size(folio));
+	} else if (folio_test_dirty(folio)) {
 		inode_dec_dirty_block(inode);
 		f2fs_remove_dirty_inode(inode);
 	}
-- 
2.43.0

