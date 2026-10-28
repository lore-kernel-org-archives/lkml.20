Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202318;
	b=ffIgy7sZHWrheh9t0mr7ehGCRZKYNWeuHhytmxdUUgm9tzxqoxUsZnki5yu5DhrlmDTb
	 ENJg7ORZa7LdrGmlwsyYXIUr6vQBSBHttC2uf39KTIsizct8FaNVohsCeOIvW4TfvY0U/
	 x1IcQi7jnLb7dJSGCnAnP2wsgC2jV0Kuns5oXoiwS55GAbdvz3V6r5YAJ8e/XNSoDGqi1
	 vu298NjV2EOeeWOpmegvm6qDR8vqot7NdXXg7HzMyP1LaZzZ7dBiaceb+8efjq6S98Ej3
	 N3PSCGX3qXQpN3x9mrpP1+rZDPM43BBDKOIwqzQE/9IFLAMG3wmqYopLD79AqQv9PGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7s2V/JSFPmAtncKl1XH2cagAkIbveg/MT0dKEEuJMwc=;
	b=x4uiDKX4RO5pWhR0YRYDsfh6jGBCO60nP9HFzy0SaO3o/HxMeSGfdi+Uprxol2efr1iZ
	 gvy1dy719flSKZ3ZgK3La558QuADcmJCI99kdET9ZtHMdkYw3udwlg9zJ+hTLzJpUBxVM
	 rH6/p3xVisJSr2FMztPDTiicKp0+F8iylUemD7H3MR/INuzE5+TqvTEGmqscn2Mf6Xlmd
	 i520QNDcctkUJ9gFRHoyTyV3cc4SHfDsyJXPlFFbDKbpBhPqbh2hxkBIFl47xyChsTR1x
	 LzggDnCgKT9BZQUbEz5SNUR6NAfomnuI6qC8c+dI2yAx4MeH48l+8dI3sbvYVny7FJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fm9p1jZH;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D16606A761
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D16606A761
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fm9p1jZH
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2e613f813b0so3057835ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202317; x=1793807117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7s2V/JSFPmAtncKl1XH2cagAkIbveg/MT0dKEEuJMwc=;
        b=Fm9p1jZHnHK8VqTjlJRWTSSan5ae+kajGI5P2K2gO1rMo3mdjfrXmqeImo3yZU0WC3
         o6we7XBfAiDRXNhgoiXuvxuvt4zL8e4uv93/BRLuH7wvQk8Ro9YViMNEU88qC+aoj2Xk
         CbZ/oq2+Q6TBXiHj8h6r6gVk4PofjzoSqfvh7M2lEVk8bDuyyM6g3tENZ2P1wuM+y38u
         uA/QeV+W2jGdaN3Hxp49B0KXkPTSQXHOz214Mjaw8n5GyrywCEnSRSJK4O7ICLW16pbN
         G7/6sJx6W/U8gqFt4eKVqNax7irHdvQLiP9YhzQe9+3PeTfJqR+EOjIEUxuqVLTbyT0Z
         KtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202317; x=1793807117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7s2V/JSFPmAtncKl1XH2cagAkIbveg/MT0dKEEuJMwc=;
        b=WuJfeJGOolhX/pWCVQ2hhwjLRRvwvZmkbM5VUFbjhAFyd88lO3e3etWllJy4KkVrwT
         Cxr9nWsGqQRPWqy3SNID/Y5FG1rig7SjD/cVeLj0xX+XM362qlJh82mha5gvKPHeglsW
         6OJiw/dVDI/2uqPw1IZerCujGITUn/7NxkWYwkAb3w3x89Ehp5AvpFgzZAfscPmSkhaj
         rCK+J8Zet8e8eL2uoaE0zsimoFA05lc0/SpMckjA62sV/Jc7kUX634TZqEO0bCZp+1PI
         JJOsqjELmbB6GkaSPs3e2dzzNKWAlVE0L/djHw7giUhvQEg5NcFuz9nNNFCHZ5Q1mZGc
         uZQQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4THGC9CpEfEKlSMrnu1C21E+DEUiWWn0oXAUahNitIvRySXczjrFaMmxsqa0jgDs0IBQwOeZKPAZbQpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZuiA4QQQZ239TRU+kcvsckUcjHUMbYXr+noQ/inSdkickWGVD
	JkR3kfDkAyRJYPFkWW/jHqw6wZa5ZXCzM09XafDaqMCMA5Kx1Z0qSVoC
X-Gm-Gg: AYBFou2HKqEzQgow0O/3gL+N5lLdTji8S/nshYuQkFdqp8+RDgKBZTkix2G4fOhn2zv
	kIuiwT9t6Ayk8BJ7hraAFwCWt8cTkA+icmqXfyb0mRm01jHMNw6B095pyphHMQNWEusnS0qtwgh
	oabmbVOzlcfI+guzN7rvbkDkaaD6eoZUYd1VYsMIdzRtG5ruFNZWFVQEDp3bwP93odOBZ0a7XdQ
	QHDPFvD+ZBk1w7L4v5jkJHj1YdTd46lV4CWk2Tk4pvSu5XmunUK3JIQ+a5DcMF/K9YaGlcx38G2
	9a5icyfVUYUbDtX6x5i+a/eeEHSdG7KVEJTCm99TmeiHXQXmSvD0cnLZFPjd4Y74rwP66oUfsdA
	Orwd9bq4VUEOup9/Lq5DwCG7sjYXDymTH83Gnu/WN0toSBKry7dYP43yInqfO/E5xw11oanIZ5I
	P4AIFls7Bxkt4fqQfSkI3tAGjY6lJxUBrRpyOUwhUJ2iKYMinkeBvb4abmrOAZK33s/V/WYmr2S
	JUbHQrWj8fn0SExzccnV0GjsfLsLOvAjom/hagOwCLUsAMfCuMaxFi9+gpM27gJtPhfucHuvW3C
	M/697o0blCXfIJpTqmaP6CsspfU7iV6n1vVReLKqDgDoncK8mMa1lD1r8doASuKBpOs=
X-Received: by 2002:a17:903:ac7:b0:2e8:81e2:1d42 with SMTP id d9443c01a7336-2eb0753fdd0mr10397185ad.39.1793202317085;
        Wed, 28 Oct 2026 08:45:17 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be5105sm24111655ad.37.2026.10.28.08.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:45:16 -0700 (PDT)
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
Subject: [PATCH v8 12/15] f2fs: fix zeroing paths for large folios
Date: Wed, 28 Oct 2026 23:44:03 +0800
Message-ID: <20261028154407.1601430-13-nzzhao.sigma@gmail.com>
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
index 16775df79212..da54fe425f78 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1861,6 +1861,12 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
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
@@ -1870,13 +1876,15 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
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
 
@@ -2953,7 +2961,7 @@ bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index)
 	return test_bit(idx, ffs->state);
 }
 
-static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
+void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
 				       size_t len)
 {
 	struct f2fs_folio_state *ffs;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e20805d4a099..412053e1e507 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4491,6 +4491,7 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 			bool for_write);
 struct folio *f2fs_get_new_data_folio(struct inode *inode,
 			struct f2fs_cached_block *ientry, pgoff_t index, bool new_i_size);
+void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset, size_t len);
 int f2fs_do_write_data_page(struct f2fs_io_info *fio);
 int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag);
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ef9b9baa1a79..36258d401818 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -846,12 +846,13 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
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
@@ -869,12 +870,22 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
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
@@ -1338,6 +1349,7 @@ static int fill_zero(struct inode *inode, pgoff_t index,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct folio *folio;
 	struct f2fs_lock_context lc;
+	size_t folio_off;
 
 	if (!len)
 		return 0;
@@ -1352,7 +1364,14 @@ static int fill_zero(struct inode *inode, pgoff_t index,
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

