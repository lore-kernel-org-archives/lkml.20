Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0D1475340
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960378; cv=none; b=kFgZFpApHO89biaMkN9c1HXLpCltTPiDxGSEkojusS8DEbZw/wdSgqRR+Qul+DnZe31jVADoShYkOqa3YGEWeH7bc1bglAdbTStDxH0gxJEL1KZ5ioj3bWWX6mmizWqMCld6TjZ6O+6dipwSC8z+NVQAkxWg/1G3qrkgEdFT0lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960378; c=relaxed/simple;
	bh=YGINu2udowb8AfUannrJSEA6uQRqVcF6Z9vdoEfJHyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ni5x81Q1+lf6GOLqdyD1Jleq6hJJSjedqf1r6zeZ73JFtf1KmQkUcwYMzRua8xcwe6uEjcVhsOyKHd/pNhtLi5mLGxcnJbiogsLsGpXYxMLbK9cjweHT77zuqQrOOO/SW8kRN16hfv9mHFEaypMBKbe+PalYK9aTAW+EgitQq0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fnqhi1JA; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fnqhi1JA"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2e81a3da3abso1867055ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791960372; x=1792565172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i33AKcFZr9OedDK5gfswdb7j4DkkZIUm6sbOML1I+Aw=;
        b=Fnqhi1JA6xRUHNs71rHSTcXVNwwp8WoZS3laFZ3rFIbPw6+ZZb48IIGLz/DKiurWlE
         DowhZzhBy3UKB1Rn/HNHwvhakV9H5mxnSgFVdwpYkF2Q/ICguseyOR3i+ph1flWJ8OVS
         rH6BhWh2WmpLqDihJEZIHG//7h1uyZFKxBilIjBuUTf9pnA4qpDHBL5Qc8csyPwHiI2a
         rWrFBtu7xgbZ5RueyJQ7RNEzRUnDZZWp2eIU82BJVcUouxUaYfX35RgmdqwVmL7vKio5
         lKeBOhYKiUoo9yTo+k/JlK/o+KchCUIlhXT/j/uxYlIrhYT4bfwwNaQn+7e8v0Ejucpc
         pQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960372; x=1792565172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i33AKcFZr9OedDK5gfswdb7j4DkkZIUm6sbOML1I+Aw=;
        b=aM1RCLQWzTypxCx9UFnmPvdJEvKuKptHkya0MQsfkNBBEVqF0HEQpvDxkKZ+ZaHkhE
         qH45sLytrTzR0SaPga8veT3pqydvl+XPVgzXFdC/D4jCTlePutHTh8NrSGVjBK5jFgh1
         HbTdifPa+zCiWZCyPlZAQdhCGoVVX7Ch3TESzhavZEdYpm8r/y6i9wx4BzXJ5Le5sDqd
         i6PvyrCPfP7fwrAH/0NFYGgBkww4N6BcsVlvaUAP7SSUxE6458wryDoxmX9JLBG4SuQI
         +MIhFFc313MxKA5wDopeGp7tebB6g8YEtIXRIoXDj/0e9foHY600bDNdpw8x7FiywvCF
         9XnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBFwKscrFzDS2844nz8nOPb69QJzp5q3l5DhypdUJOTQ3RDDIBGTth4F/bHOwySBdp9vo6O+OsItRUhMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIerwCVhN9o68ErbDk4of2E/PLuNMI21OsB3adFakJKIQ34o5wR
	coNZCoiRIFqSpXtCZqQ7RoDhQjladxil/zLEdmTkbp3xDWoBWnWJnF9S
X-Gm-Gg: AYBFou0lJeJbOUfFiFmJGbjXkvykFwacipg4pnCmBAlyEQPpesJi4FwpiksDXRCz94Y
	F9UaBVGy474VaL39OC5im6Q5Y/UZMuqnnGtwqsxn487heZA4kno0zllGJ/ABPNnyeBBs4jNE1R3
	Ix+PLK6gu13yna6rlfDAFNHN7wewvByfm7h06wXMS/aAeQYDumJ6a7Zbu6djBPEp06/4BtzcVok
	HPxdJA2T5gtq2C8qs5P38F7T8iDfU+dHsXZPJ3kJ0gCbw9RD+RESmLiWkrPAH+VOkWPvPrYAEsQ
	NouVBGQ6VWeOHE0wkNdSqfaFT07PIMn6bdEZos+GKoiaHqq6hbkeHCOaUYJpV+QYT39BpkPvttW
	tEti14uuNE0sOrxqXxL8pZ6V2lewQHFNMKFIuAihHPnC3ZjnG2GBgX8mBMTKSlMks52YWuwdqlD
	VtH5M3mxtxL3BZsBdX44gyYZNqMerCTbq4kfjgXfjn33ToQhzIn6OM9a2UO1kuLRnxfUOaB3Dx4
	WIEnEcr3oj4E7qM6xtr91wAQhYY9h2ssebZoUbn5xu3LiAQ
X-Received: by 2002:a17:90b:4a45:b0:3ab:2caf:c098 with SMTP id 98e67ed59e1d1-3ab3a32f5a5mr12010994a91.7.1791960372059;
        Tue, 13 Oct 2026 23:46:12 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3236371a91.2.2026.10.13.23.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:46:11 -0700 (PDT)
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
Subject: [PATCH v5 13/16] f2fs: fix zeroing paths for large folios
Date: Wed, 14 Oct 2026 14:44:42 +0800
Message-ID: <20261014064445.2835813-14-zhaonanzhe@xiaomi.com>
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
index 9cd1c34fe6c8..45861c31fe76 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1816,6 +1816,12 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
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
@@ -1825,13 +1831,15 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
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
 
@@ -2908,7 +2916,7 @@ bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index)
 	return test_bit(idx, ffs->state);
 }
 
-static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
+void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
 				       size_t len)
 {
 	struct f2fs_folio_state *ffs;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 36ec8266af69..ddff43bcb800 100644
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
index 30f1484d2f48..5a8dbe228fb1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -837,12 +837,13 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
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
@@ -860,12 +861,22 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
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
@@ -1329,6 +1340,7 @@ static int fill_zero(struct inode *inode, pgoff_t index,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct folio *folio;
 	struct f2fs_lock_context lc;
+	size_t folio_off;
 
 	if (!len)
 		return 0;
@@ -1343,7 +1355,14 @@ static int fill_zero(struct inode *inode, pgoff_t index,
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

