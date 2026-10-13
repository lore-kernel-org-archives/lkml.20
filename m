Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5075D4F96DD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892664; cv=none; b=nARVeFyW0ljgZKr9Nhzzv186kTJrhtEhM/dWNywjRzKTRazCsu7g40m6Yts6mUJ9kx44ng8VfcZU0MukZA5GDMVX04q5t6C57qbRItAuS5auzpPyU9f7fS9E5KdgryAuoCadEFm3Frlm0BerObc4l91Y3YIooKiw2lWo2xFNNvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892664; c=relaxed/simple;
	bh=Gn37nMD1My10xOjDFkMRnr5Mw2UC2D03y2wpntQkjhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rxm3yxWQe47Z1PmIqxmtu3LWFq4oWbv1Pa9msyUHLSkDnA6xJcHywXZovAF6TP9QjJg6M0+H4YtAcP5gOgO+gJN8iCQcDowbvhr9SRL8vY+HTolh5AqRoMm3FBfxzC84sxrWnFKppoy6sqde61PyDAqOwpReWIfvQ2CiF5b11SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwXQljk+; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwXQljk+"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-39569e136f9so876306a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892663; x=1792497463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBaTPspCN3/uMYPsCb7NttxnkmVn8zwdNqmUI3MSBIM=;
        b=WwXQljk+by4RFxdbvVgoIU1/cj4S0ziI2938Forq/qxqJVR4p+FrvsVISqYNIJQXN+
         IdZ/XDlnLMi0b9wEmGOxXjt0teNIQvTel9K476vzdYXzP5PtgdZIfk3HvusLXZ2mqoDz
         Cd6upmKLT3hoqRdKeN55SdnXmwK9o1Ie1T262aPdq++i+ABI+9KWjcZMl2N19TiC+8ti
         bs3LuBhEaRc8yA/vHVGlmuz/5Lqbf+8KDzEjJhokt5yVKZe6muntzQrT/Ckty+oPY7Ir
         hqIoyWSXlAexUVO0rsR7UTUkasjrxa2+Sz07e29BH+76wIkqmWiG995Jc+EoXWWJEyBf
         5uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892663; x=1792497463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WBaTPspCN3/uMYPsCb7NttxnkmVn8zwdNqmUI3MSBIM=;
        b=Q200Z08kki3RAH+DzCD0K01rdIZOR6WeOrVxKIMdhtaDXk5YPpX6kuxVLJu/V+jACk
         7bVLlm+L68naYSGYThj5l8vGtMhNZ1JqhBgHuQYekb036NrmHXgmBYLTnidogc5yz1qm
         93MfrZKz3M1aBaTy1kQMVg1zQzyiqE5BzkRfw7FHNNKBaiF1DFNDoDFVsDu+hTQWg7GH
         wCgTbj44vGt0CLBPa77zscTxjItAnHXUdKhYD1FrhT6MvXdDZCiZX85aRkyhTBKcgGAy
         DNRORm1gxSew+Jd5ZNTge03KLbEH8A2QR9G9jlLXKi7ztLx2LAgYZaJSZuxpJPxh+vkS
         /Ocw==
X-Forwarded-Encrypted: i=1; AKwUvBwYlej40i4X9j58R+RLiOLvK5FU9Aook0etAte2lnIFSzVQrkMBI5VeC2Kb9OqiUqdPLrORi01OHVAaUn8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1MUL1vJ44A/DRJiCU9FlLWfg8ACPMhSPSVMc6t7ImERJ37Mgg
	ReFrxaZ16+Zg55kxkKsL8TgYoASULyL5PC0a63Rn2nZQgvXnZnm+nSuA
X-Gm-Gg: AYBFou1iA3s/NPlCTFATBXwUixAou/kIMcI77aq8vC6M1hr3/Kk2HSSqz2mU8LIajKP
	7sMSo/PF813Ign5DMsp2UUMBZBGDYIWqOp7qg0LZLpZ7FVeV1nO1si7+A+5gu8sQQcQqfDlHdYF
	8+uRrjUaGygKgqIONAFD90hU32eMv6MBkjU7wv/pCMW8tfJTtRKVVCfWPUBm4N6moOMvail+4t7
	+khcBMy4YkRAfkZtodOAJmz+kjTue9phv+DdXBG60N7kqDhUVXqcpAUuHqEE2tzqZtKkoXVSmVY
	LF/DZXLB6ZxadP3GK2lernmCbfqyZDuzJkPuoeVRsX+wCuweqgAYt0286v87R0dlajsyCV+BZUo
	NaoVL8aHoniESWaVQDaH7jjhSKnq7FG0kKAQNgZX+z/hs6ZKfMbeNqLQQGOnxDTFfeIF8H6LDsx
	EnyDx2NLVnXj8bjaYBmhGrE0uKG11Hor8w2yJ4TEcXt+Wymjxcu8jfKNApn+8FN4RyJydkqMsuP
	JHBH107tKpKL2o9N/x2M+MHy1mthsIpXP7t
X-Received: by 2002:a17:90a:e7cb:b0:3aa:ee81:a62d with SMTP id 98e67ed59e1d1-3ab3a7480f9mr11231808a91.35.1791892662564;
        Tue, 13 Oct 2026 04:57:42 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm21248516a91.13.2026.10.13.04.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:57:41 -0700 (PDT)
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
Subject: [PATCH v4 15/18] f2fs: fix zeroing paths for large folios
Date: Tue, 13 Oct 2026 19:56:18 +0800
Message-ID: <20261013115621.968742-16-nzzhao.sigma@gmail.com>
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
index 433d8f2b0..48376cbcc 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1799,6 +1799,12 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
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
@@ -1808,13 +1814,15 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
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
 
@@ -2922,7 +2930,7 @@ bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index)
 	return test_bit(idx, ffs->state);
 }
 
-static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
+void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
 				       size_t len)
 {
 	struct f2fs_folio_state *ffs;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c98607017..a925d1a59 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4455,6 +4455,7 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 			bool for_write);
 struct folio *f2fs_get_new_data_folio(struct inode *inode,
 			struct f2fs_cached_block *ientry, pgoff_t index, bool new_i_size);
+void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset, size_t len);
 int f2fs_do_write_data_page(struct f2fs_io_info *fio);
 int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag);
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 37d41f593..69d1344a5 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -842,12 +842,13 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
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
@@ -865,12 +866,22 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
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
@@ -1335,6 +1346,7 @@ static int fill_zero(struct inode *inode, pgoff_t index,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct folio *folio;
 	struct f2fs_lock_context lc;
+	size_t folio_off;
 
 	if (!len)
 		return 0;
@@ -1349,7 +1361,14 @@ static int fill_zero(struct inode *inode, pgoff_t index,
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

