Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655681;
	b=MfKIF7hOPEOU2f5zjpRdksWPusNRPCkom1mOjlx/DkToRtP9Xeqg/Et8ERqFSMpKGLsG
	 H+O3xx+hfojeMxPrq/FXOoL1UFAY+woBpnFkICnTWkm3yKPuYWJNZDyWqmQ2Oy/cxvkc7
	 zjxRQVc/Jb8x2T0OKiSTPyQw1hMtomM+Yj+LqBOBeagVh6/8XJPdWr4Wf9iLX+RqVSJc4
	 aoNQHO7+QenstwZFXEgSwhZwuwS8O4gy+GSkZEjHu15faDhxSV9aJfm2x0JYsGp/tbyAl
	 /0/bbgidJASC5iXxLzYX9h6gPYrxdKfvsmIH7N/LpCZJ8CN+/sahhRL9YKHBt60SC6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DcsfVmg9lqhQkDJnOn8GHeE1c/RlJPp+Ost5Rs5+0vQ=;
	b=4b4IQX59k4S2gPRFa8Lr6Rss/adCIq279O4mnykbWnrSPO1t6XVNjYGoWAj1qSuapY52
	 jh52xboUqU1CUSSxJL/nKQcde7MQrUazYLkz9WQHGIdNb3QTpUvguZ9kjqwUzTVSdWxe0
	 NQnx5rnj8Re6yKPn0buLZ8rQMb/rmDqOc2HCkyZWq41qAUrZU8JHU+TOpXbqriCM2esEF
	 2tEWbtaTGoNgXaTbYhCPi2oXZr7K+2zpm6uQsopFgVamm3D497tUQRx0VLCWMqudLX7ti
	 KnsDTpcjIHM0lOPFZEtG7FM8s8krJPSlGAtFlXsmMVGoXqwEg1jAc6JiPSCpb5wqPsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I9s8hTXF;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87948606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87948606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I9s8hTXF
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4821449so840146a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655681; x=1793260481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcsfVmg9lqhQkDJnOn8GHeE1c/RlJPp+Ost5Rs5+0vQ=;
        b=I9s8hTXFRpdLB3w2yUDw+Pdq6+4OzZaGsT/jUaYeC/UUmTGDsNXKynzPE5d+1PGmUp
         wiwnSBP3OYkTBHD/nSgGWmS+dAxs8VCwu/+pHR+tvSKvnN3OLsqbaHVeWqxIGYbt+2or
         CiV2AZyl04FbJxz6dPlAdaZ+hao/bN/C3CtHYcXHh9zDI9awgpbDiSbnfQrN/zNmCLZm
         s9cn/5q8es0QxnaNesibmiqGHu1zIibFihJj2i0wrKChmWhKTBQ+totpYeDwTbDYRzhe
         6WXXLBqtQS+bNTwJDjle/Mdc+apScRZEbDpyQ1Dv8vWpWtkNkZup1RmdU5ySHqGPAYKa
         Gqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655681; x=1793260481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcsfVmg9lqhQkDJnOn8GHeE1c/RlJPp+Ost5Rs5+0vQ=;
        b=eqZQHdauZ8UPttxQhVu7JC5xk1p5HL9xHNmL2bcoFGZNpkEgP+ei7n4mOYM8XPkTtk
         A8hUfLtGiHyqhK7SWbLapeQHqSuGGMsXpbRzWa/1ClbqxQv8oLl76q1TAAANvJShw7IO
         8P5bmiLa4uguN8uebnuO9oYDkbHcnRjJfiWQTOe25E67GLuq2g3a/NzqKWapPfvxaAal
         r7kPWCRTEMqNYAU+SssE2DXfp/ahG37feYA69FDNtwcMe2yIFUukfYg95oRYkP8eem5d
         Ztv2wwxRLkN4m+XzK1JrpsEiy30Y1icNgPdk+peVlTIZPCZOtoLprqWWyxsYGWFpSdnu
         b6cQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbzXFk8YNdLTFFL1/9EsSk19JvcbTIop9DVVSCTpTRQ3bWwZ1RifnbbwLnAQVhWitz9b0VfPBkNgyZsUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2O7wQkk4naEdOypT5bZht055Ikm5vm/a/KNLnUbWyXdD/Kd/N
	SN8p8iJQM5TCDSxXozWaAREo6T4todWmV2XXVtcOM+mFV2vhEISNPvX1
X-Gm-Gg: AYBFou3rhwUdl3C2tlxXwwgYlUSxy1Fo6Z7cSod4/aY8hFUC0sjkEk/L6ZDTMoN7VcZ
	8R/StO3ZRKterOQtQUqzAtoMuxTSdKMMC9yqwqkq81OBEi6DQtxeLBmlhgfUoLefWA7Kz2suSar
	Po+/z52xiGz3wUkiUoWPII4k6XC3Yyn5mdzx28alhCVjzH1Qy3rx+yhwF3nMddLZkynqFXQ3YQW
	VeashkkYBj6jrZN+V/5ykJfneDWi8fghwIEqxsOhI1P2+JYZ8ZrvAq+ZxnDbI+eBCgNP+fVUGH9
	fWjCHhvHePTNlYZIqefj5rEHDFELKAMdrtzzYcUF+kV+99M86mQ1nQygTh90SbWB0PsUtLQf2YS
	e2lxJ/bzjhGBhgY3S5Dqd5UFKAlEjiaKwJj0NzmNuthOj/ouFbdujKIF8MbMQvwvoxZhqvTqtYf
	DfE7yeqj89RnSQ68sFoCoj7eqc5is1jnhhOdPf1x9XY+hiiMxdNiZatYrEp1JW6P0cXSorXbKD9
	4PfA/dNiSdSOUJpQUwq8mAxWbaslE3vLjTu4TJg4VLQ/qq9Sfz4hCbp5M9L49elvAONVY1dFlBU
	sj+hrH1HmIrV7qFFBaxwaVnb7nsjJN+s3lKaIpk=
X-Received: by 2002:a17:90b:5243:b0:3ac:a7ee:6760 with SMTP id 98e67ed59e1d1-3ad86ccdc8fmr3664564a91.23.1792655680945;
        Thu, 22 Oct 2026 00:54:40 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm3202562a91.6.2026.10.22.00.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:54:40 -0700 (PDT)
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
Subject: [PATCH v6 12/15] f2fs: fix zeroing paths for large folios
Date: Thu, 22 Oct 2026 15:53:39 +0800
Message-ID: <20261022075343.3043003-13-nzzhao.sigma@gmail.com>
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
index 24613b00f843..f71fb7c993ef 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1839,6 +1839,12 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
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
@@ -1848,13 +1854,15 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
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
 
@@ -2931,7 +2939,7 @@ bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index)
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

