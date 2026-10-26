Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985929;
	b=nQrtJyX00JJMr6YEFWAzTcfCZQo8i6L5tYc9hqhYcN8I5aTWo0B62A30tyB77VWb0os2
	 HporRBc1PfhMAuNzmZpcdDxVOOQngcbrBDKxTsmIuTBCtsNfrmKbKhA4B6/y10ST9CAhZ
	 OgcvaUG3qwqO327zbWuRV73HBSATF+K/3F4E6vCmUja5Rj6iI0wwyNYB4oGYKiqAF9+vH
	 iUeNE/IGJvVyzBBc0/TEj76ZDSQQ5vnKvQqGCic6PKfJWy8EUwY94OM4Vx4Y8fHNq6/3h
	 7p/SBZFDZ6ELKQH0l5jfUvjOca8Zw2icDi/PD2SF8ADlJhTxvbKzO4QuI2ls1MNFg3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sPD0TlvRSW9AoDUlEQvQhAQDfXBM+OsJ3GRNelFftIM=;
	b=ImOxv80JWpBJlGOprBX8FPtY6Wzxtl4hlMfbsC+AIAHv7YN3Lf1AWxPzeroi8jBfpWvH
	 /kbhzc7ckJDtgFYZTJzQ6Otn7CzDuiDNftnzzlHMgh6aD56rd4nnARItdu1wOFEnkKsC1
	 kbptM7qAViJAPuGcmDX0a+/WD0s8789Vf/Np/msnOruWY/pMMcc1sKJL4XGTY23iC395K
	 e2SbgbDmGViYIluAZbOvhqcMaJDusPrDaZE7sMnED809DIRrbTasM3dPm6z3DdQXXY2sU
	 yNLUL6yVJaXAb5eI4SB1cNd6imz9/Shd2FmV0blok/U7KpzS02iRWZv0xhjTDRdmQLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=goIPnJvM;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FDD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8FDD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=goIPnJvM
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3ae1dca6bc0so358258a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985928; x=1793590728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPD0TlvRSW9AoDUlEQvQhAQDfXBM+OsJ3GRNelFftIM=;
        b=goIPnJvMFv1b0c9iQp1tG/26wxILunOxJCh1r3Ozur+UOEPBMTXlBxqzCXAu+GKVPY
         sTc6LTbsTBNZdafTDACLCNjyAbxkTuiDA4ztUX+0a2UT5VRhprgRRLvJts1u1fHT3PFv
         yD3ohJWCnk/qqZ49s8YyiXHA97ZM5c+l5ozoqoJgg9gjn5XajTWGM3a0zWygtAAUyA7y
         s05hA+1x4YfdKbhcVR+J75jtabKgZztGpEdv2hXfM9a63rGMP1AbTIC/JMi0GbXZj9sS
         hdJrkYfcl3Nhc38QlD/qrw9BsRsDIStMvDIZAa6GP7cb8Rn4ggf2SwbZ5D6caWMo47mO
         CNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985928; x=1793590728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPD0TlvRSW9AoDUlEQvQhAQDfXBM+OsJ3GRNelFftIM=;
        b=syh+GgXUHd23ZiRBiMU0c1eQccT1ChtnatO9WX7plWetIDpEbgi9eeJ2zVEqlx3Igc
         VeyTAdzi3AcTsTaS9FWy6z3a1eptf6UdE9u0rSoNL2iycXBKPMl/KfQHwv9lEYU/G1U2
         BOusCxvkeCSMvJDwmRWEda/ca2/EBBToER2VIAFoGcrxUTwBIwbIQpUIv5JFVttGtgjD
         vdbK0DqtGi26Pl8LF/CeK5vBHVVQ7D75xry1W7y4H/4Ok0OjmEag6Rf4htDOrWf1bYQE
         VccnvsSlopHJOvkWBkjYO7VseNij//VJIYGIsGXKz+dKS0lTElci6fvt0yH0LV23DsSt
         mNFg==
X-Forwarded-Encrypted: i=1; AKwUvBxb8eoHOvOq02TSD9c6W4KZVVpbv+IcTLqCCfnaavfW5x2ScZlfSY9BdbRurLR1+vnzWYYfyjeY6IUSuGw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsKajrF2tMwaNrvP02OnYWZTlniW3T1Y53r0T7xO2i0kujikM2
	BIOwgQrPdHcGJNr+pJzpLVCoKx0YIV7t2TfgoiFiiVYoQSlyx83Az/Ul
X-Gm-Gg: AYBFou0Ht57hK54HXYh2PthAokZ3psbdAZPCZXqMmoj6NjacRarn9ld3eBpd5PgEQGs
	vfce0+Pb+7W3Cnzn+zlIxvYlM50d/IbAnDkAF6uy/V6RuGZh0GdQd/BtqhwguLqwMtVPE8Wqg/h
	dPjgPoMLncX8DXj/TswH99nPaZFTuH+s6z6WQ28FWEQL5FpcXnfPUZvPY/KVPtdy4M8l7z8dfVG
	V8UGVMMeMWdo66yodTAYjlpu27UOBNBi570cdQLtZiHofr2mcwRo5ZRrH04U+T738roYMsLrtFr
	+MH/2qAEKjLup80xin8H2MQHQnbWDANa3xra0LkQbrACzPT9syAov9mAOMQB27dT9q/CXJyaBY5
	/Fd7EGzu59ayaCC0VYiM6pUrGr2Kp4tnPX2g7btZIjbvZqaRRUt2YVQTEp+0iUQRCw6r6qDlLfa
	xYUDnHVuoStUEvZG04an+X2WqKzZnDWZiTLjhjlgMoqUQklrxIfCXtsxRa731GtmcJdCxGHw84H
	KokNsZ961XaVvctFKJB42bxs5ypZlz2VC4tYN3IsGZNhRU8FnqDXfjCqMrfC7HW76Yqig7fltAE
	C5tmgI59Q+YxnvHj/9nwvJafC4///AysVIu1pcp8M7Hk965jbDQri7ZstQ5mC5ELrMY=
X-Received: by 2002:a17:90b:2782:b0:3ad:8769:8741 with SMTP id 98e67ed59e1d1-3adea1aec3amr4617770a91.4.1792985928296;
        Sun, 25 Oct 2026 20:38:48 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm6409823a91.8.2026.10.25.20.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:38:47 -0700 (PDT)
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
Subject: [PATCH v7 12/15] f2fs: fix zeroing paths for large folios
Date: Mon, 26 Oct 2026 11:37:42 +0800
Message-ID: <20261026033745.784107-13-nzzhao.sigma@gmail.com>
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

Several f2fs zeroing paths still use PAGE_SIZE based offsets after
a file mapping can contain large folios.  This is fine for order-0
folios, but it zeros the wrong range once the target block is not at
offset 0 in a large folio.

Use offset_in_folio() to translate the file block index to the folio
offset before zeroing data in truncate_partial_data_page(), fill_zero(),
and f2fs_get_new_data_folio().

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 18 +++++++++++++-----
 fs/f2fs/f2fs.h |  1 +
 fs/f2fs/file.c | 29 ++++++++++++++++++++++++-----
 3 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 33750ebf31cb..29d39737232d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1855,6 +1855,12 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
 		return ERR_PTR(-ENOMEM);
 	}
 
+	if (folio_test_large(folio) && !f2fs_ffs_find_or_alloc(folio)) {
+		f2fs_folio_put(folio, true);
+		f2fs_put_cache(ientry, true);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	set_new_dnode(&dn, inode, ientry, NULL, 0);
 	err = f2fs_reserve_block(&dn, index);
 	if (err) {
@@ -1864,13 +1870,15 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
 	if (!ientry)
 		f2fs_put_dnode(&dn);
 
-	if (folio_test_uptodate(folio))
+	if (f2fs_ffs_test_blk_uptodate(folio, index))
 		goto got_it;
 
 	if (dn.data_blkaddr == NEW_ADDR) {
-		folio_zero_segment(folio, 0, folio_size(folio));
-		if (!folio_test_uptodate(folio))
-			folio_mark_uptodate(folio);
+		size_t off = offset_in_folio(folio,
+					(loff_t)index << PAGE_SHIFT);
+
+		folio_zero_segment(folio, off, off + PAGE_SIZE);
+		f2fs_ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
 	} else {
 		f2fs_folio_put(folio, true);
 
@@ -2947,7 +2955,7 @@ bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index)
 	return test_bit(idx, ffs->state);
 }
 
-static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
+void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
 				       size_t len)
 {
 	struct f2fs_folio_state *ffs;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1b63dd961f15..2c9343eb6b5e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4480,6 +4480,7 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 			bool for_write);
 struct folio *f2fs_get_new_data_folio(struct inode *inode,
 			struct f2fs_cached_block *ientry, pgoff_t index, bool new_i_size);
+void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset, size_t len);
 int f2fs_do_write_data_page(struct f2fs_io_info *fio);
 int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag);
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 808b72d3d78a..439e84a4aec3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -833,12 +833,13 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 static int truncate_partial_data_page(struct inode *inode, u64 from,
 								bool cache_only)
 {
-	loff_t offset = from & (PAGE_SIZE - 1);
 	pgoff_t index = from >> PAGE_SHIFT;
 	struct address_space *mapping = inode->i_mapping;
 	struct folio *folio;
+	size_t folio_off;
+	size_t blk_end;
 
-	if (!offset && !cache_only)
+	if (!(from & (PAGE_SIZE - 1)) && !cache_only)
 		return 0;
 
 	if (cache_only) {
@@ -856,12 +857,22 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
 		return PTR_ERR(folio) == -ENOENT ? 0 : PTR_ERR(folio);
 truncate_out:
 	f2fs_folio_wait_writeback(folio, true, true);
-	folio_zero_segment(folio, offset, folio_size(folio));
+	folio_off = offset_in_folio(folio, from);
+	blk_end = min_t(size_t, round_up(folio_off, PAGE_SIZE),
+					folio_size(folio));
+	folio_zero_segment(folio, folio_off, blk_end);
 
 	/* An encrypted inode should have a key and truncate the last page. */
 	f2fs_bug_on(F2FS_I_SB(inode), cache_only && IS_ENCRYPTED(inode));
-	if (!cache_only)
+	if (!cache_only) {
+		/*
+		 * The folio was read back above, so the subpage is
+		 * already uptodate and dirty data stays valid.
+		 */
+		f2fs_ffs_mark_subrange_dirty(folio, folio_off,
+				blk_end - folio_off);
 		folio_mark_dirty(folio);
+	}
 	f2fs_folio_put(folio, true);
 	return 0;
 }
@@ -1325,6 +1336,7 @@ static int fill_zero(struct inode *inode, pgoff_t index,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct folio *folio;
 	struct f2fs_lock_context lc;
+	size_t folio_off;
 
 	if (!len)
 		return 0;
@@ -1339,7 +1351,14 @@ static int fill_zero(struct inode *inode, pgoff_t index,
 		return PTR_ERR(folio);
 
 	f2fs_folio_wait_writeback(folio, true, true);
-	folio_zero_range(folio, start, len);
+	folio_off = offset_in_folio(folio,
+				   (loff_t)index << PAGE_SHIFT) + start;
+	folio_zero_range(folio, folio_off, len);
+	/*
+	 * This subpage must be uptodate here, which is guaranteed by
+	 * f2fs_get_new_data_folio() above.
+	 */
+	f2fs_ffs_mark_subrange_dirty(folio, folio_off, len);
 	folio_mark_dirty(folio);
 	f2fs_folio_put(folio, true);
 	return 0;
-- 
2.43.0

