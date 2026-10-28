Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202313;
	b=zGbUVOdU36tREF6ibNdutF3Eh0UxG2Jpa1kgfpVwNS/xxK3S2XuWp+7vPw4oC80Rby01
	 NyL+xFW5xWFzRTdzK5hCJ1MQYllLmJ7SZWUqmwIoVSSeYqpfNdTLodrCatlqUYS7mwpjS
	 tbkYLMx4dgJXasdACTTfYciiN6CQthLNe/k1M5iC0ZxdEn6YCzwr0TNb6LVR0AQzcyQ03
	 nUTPSg2JJYlwVatmBptusPQ8McJfr2Y79FmafWNtCjdyKinVBiYdMFynAC/13tpnhaBlZ
	 osB7i5uIPcJjThzfSbF5RXQh50MlPaeVVVhrK3NTj2nFxHe1PpInLNAcMv7gVEJo0Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pnvm2ffQ47kEKQYG/Jpzm/e4KWcDnVu7ijOSI5382Wk=;
	b=xEU3RiGRn4NCJDiw8T3ZpeKOXAMeu8jpkc2YSTqZRaTEdxwfs/9pzeKHnzVXh5TGuohX
	 IvZKVAhtkJ+kPy6K60i7ZxchwX7hVN8B11kmSL/qcDgv2ij7SvWByZyRQeDCNXkStPOfK
	 hQxq1GgaHnVlHPV4X5pMhjZ1LOqhsR6nmB+upnwvFicToKNRIYrWA+TGLe2DCFolqK4Kj
	 60PvC8G7zsguoXjQocpbCWV2EBXLKt/dMG6Thhw0uj+kO+UOK678NTQhIPv8Wfdqiu1La
	 52G8iU345WrVLyF9NQEjp3O1ZfX4BjPklDYqNtE56ISItWroBUSSOY73UPIOl10i0fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=odwEvFjH;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5405D606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5405D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=odwEvFjH
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3ad6011ecebso295722a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202312; x=1793807112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pnvm2ffQ47kEKQYG/Jpzm/e4KWcDnVu7ijOSI5382Wk=;
        b=odwEvFjHtrgXy0Za7+e/zXlRIjTJk0njFuZsp4DgrAv22anaZSl0hGAqTY7iX+RGXc
         2+HGy6YXnZUqwB4JTwVl03NjO9dD/IKPiCz31uMqzj5CUZBC894SsusIYh/oR2CSKS07
         semopzHfxOFxCV8QTgGhVtGmAqWUKZQiJBY5n0+6Xfnis/GO7NFs53DBCRFEZkk/ghVK
         YbXwZSMjOgCCoDh5fW07cdk2GXrFM1D2jN2dwTh4MABfYtwPwTRSRTuZG4kAfyIdCYqO
         zgL0X5FkDHZv+GncbG4sFKGimgNyck8lkYUPYD044MyK2HIxzxvZiiZ2NqbniPKTuUFp
         q5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202312; x=1793807112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnvm2ffQ47kEKQYG/Jpzm/e4KWcDnVu7ijOSI5382Wk=;
        b=1Sv5GMk90JVreEmyaV6J9YhW/UEuNmdgNV//kedZQSHEnKpJjteCfmENbGRuSkrbYQ
         DKKxRewpbT6zXm6DgFt8ENhSI89WwbQpYBaNmQrpIxTX4OM8HrabUpaGT1P4reJw3tAW
         XfommHGEkCf7aL88WSYnkoUNkA5PwVaEY6xVhRGAyquRikE0RSkaz3vSKdYvWcQOqzzk
         PchUnZ2KOMtkXURDvFk99ZWBOU8exBr+7NSGsx3zmmqa+ekbVXauic6EJQevl8RfBYcJ
         CGU1FiBEzISsC6ZcS06AYOZhuzzLui6A7M3ICIaDz/ekpcP3usCMau8d/XS04TszJ7kC
         jAYw==
X-Forwarded-Encrypted: i=1; AKwUvBz1M5aQkX+AJFT7kKIbVdqrLXTrdHO3Xjv6y0ihdtndk2k0xOaYmtECkzYPOMnFE8GfW5TkzLj71Ig3GtI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2d0X31aLuU9jealtosiDd4eOLJndgGTsR3aooj8bb/wiopmm1
	n9/bhOP5usOOeNADgwRXNu8xnAZGf7tj6kYD+E2gBbtcBULp561z+yUd
X-Gm-Gg: AYBFou32n+8YzBwGgXmohQb9GIT26nF1YavtB58r/fm1BMa5XJRgJpRs4cz3P4/1Sjc
	H8kVwYk0e+FcWEZz4gdWYnJnmaZwmaxd5pLh9vKB1EHFHnd8JMFjkgq31f+j73au3xtCkLzaOYS
	3S5fgSWoUXIMgDQJUHAvcPSzaWCKMI30EZOS4deG8mz28jspGdgpFobre7SXazi54XTkLRf3wqe
	7OujED1ITEpzqLtKksAf7WDG7VtcD/hkoic+CEvFOGtocutlO+hbVShhmjyhuC0TutUpYiKyJIy
	Nul59DeT1F8q7puhRNUTRKX14zakLztF8MAKPiOztKMTwi5Gvqk8tbjHiCnnc3BFqZnzV2rh+hx
	enRX/ZzgeeVL8W6LekKk5fpxnNk+y1as77EQoVwFKjU1YJvuGw68mj5Ji+3R90QY4UkgzZ5IGm/
	A+Gt96P8zXAYhIHyle5bnh7OnftocD7HPspg7m7POIsuilO2aJn4dcT6oBGi4AxrM+v23NGsVz0
	dwzD2Ej/kevaOsRZvorNLJD1so+wA4FO3qqdefnZuTPCaHjVj5FOV1GRUzLW+N8FEtfXYvMkY19
	H+vvCV1uU7zD9UfVlsv54XWvnDUkOdAE24ytefAfTYETMjC/MJuI8mfqTskuBzWOAIY=
X-Received: by 2002:a17:90b:3810:b0:3ac:b08a:ed2c with SMTP id 98e67ed59e1d1-3ae5822fb8amr2110195a91.40.1793202312214;
        Wed, 28 Oct 2026 08:45:12 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be5105sm24111655ad.37.2026.10.28.08.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:45:11 -0700 (PDT)
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
Subject: [PATCH v8 11/15] f2fs: handle partial truncate of large folio dirty subpages
Date: Wed, 28 Oct 2026 23:44:02 +0800
Message-ID: <20261028154407.1601430-12-nzzhao.sigma@gmail.com>
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
index d76038d82e16..16775df79212 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -410,7 +410,6 @@ static void f2fs_ffs_put_write_pending(struct folio *folio, unsigned int nr)
 	if (folio_test_writeback(folio))
 		folio_end_writeback(folio);
 }
-
 static void f2fs_write_end_bio(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi = bio->bi_private;
@@ -2977,6 +2976,41 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
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
@@ -3754,7 +3788,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 
 	/* This page is already truncated */
 	if (fio->old_blkaddr == NULL_ADDR) {
-		folio_clear_uptodate(folio);
+		f2fs_clear_truncated_page_state(folio, fio->folio_offset);
 		if (!f2fs_ffs_has_dirty_subpage(folio))
 			folio_clear_f2fs_gcing(folio);
 		goto out_writepage;
@@ -3906,12 +3940,31 @@ static int f2fs_write_folio_dirty_range(struct folio *folio, int *submitted,
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
@@ -5473,10 +5526,41 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
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

