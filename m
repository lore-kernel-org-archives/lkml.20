Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B59E3F1AD7
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749806; cv=none; b=ie2PGNZOkTFIf2ezhccsKsoU6uRklJvsczuQBw/uXyvFJL15GPwi4W+kZZI5udjvPB7cMxUN2ByiREEEJpy4X/Sm8P1NQhuWLiWN2JZHW/YDy0C4pYmim69vzjp+HLXmupve6nh67nQKt1oyyy1FuhBaQ/8qvP9G+Ta1awur94c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749806; c=relaxed/simple;
	bh=2e+ePTt7fAXSGB0chgyASrs/asZF1pXCIoSOUMvObIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dZAPNXRJqwL/tqZa5IsNUDxeRtz9L1dM04ZCSbZFfk++MsZ56SSt+CS2/s6BpDSRe/1uK94tnZTk+nuyMYuGWMDooD77CnK+Pwy/zy+H8ADiWp1I9LXIRRaVrf3lkg/i1CggTbvG2qTSwqDNnoNsMDPPfYuDPNRdmyzeKoDIMeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=lPIzxeKD; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="lPIzxeKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Xs
	BIZC7IR9A7r1RXPLN8NZNQ5js4QQye/w5nXDK3zng=; b=lPIzxeKD1l8InKp8ad
	tYXOp5UU7idKQ6+qk5VKhBcLPJ7VwxbCCMk52rmHG72sI+20v+2hugj0CWKWgeVh
	1fq8+FMsklwqy5A2/CSYzWEyU/UlRvGM4xQ1TSI07OOkGfaPlYWXUsaDWDA0ZgaR
	lC7wnusgqHJUEr+grSwaifYx4=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wB3P5N85Y5qx4G3Gg--.15517S2;
	Wed, 26 Aug 2026 21:09:17 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <nzzhao@126.com>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	Pengfei Li <lipengfei28@xiaomi.com>
Subject: [PATCH 11/14] f2fs: fix zeroing paths for large folios
Date: Wed, 26 Aug 2026 21:09:12 +0800
Message-ID: <20260826130916.2231342-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3P5N85Y5qx4G3Gg--.15517S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF4DKF1xAFy7Gr15CFW7Jwb_yoW7Jr45pF
	W5GasrGrs5Gr48ur1xXF1DZw1rK3s3Wr4UCFWxGasIya4Yq3s5KF18t34j9Fs8tr48Arna
	q3W8KFyrWF1UJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UCQ6JUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsB3WpmqO5X1ULQAA3Y

Several f2fs zeroing paths still use PAGE_SIZE based offsets after
a file mapping can contain large folios.  This is fine for order-0
folios, but it zeros the wrong range once the target block is not at
offset 0 in a large folio.

Use offset_in_folio() to translate the file block index to the folio
offset before zeroing data in truncate_partial_data_page(), fill_zero(),
and f2fs_get_new_data_folio().

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 13 ++++++++++---
 fs/f2fs/f2fs.h |  1 +
 fs/f2fs/file.c | 27 ++++++++++++++++++++++-----
 3 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 15774e8e8795..0b167b14a9a5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1582,9 +1582,16 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
 		goto got_it;
 
 	if (dn.data_blkaddr == NEW_ADDR) {
-		folio_zero_segment(folio, 0, folio_size(folio));
-		if (!folio_test_uptodate(folio))
+		size_t off = offset_in_folio(folio,
+					(loff_t)index << PAGE_SHIFT);
+
+		folio_zero_segment(folio, off, off + PAGE_SIZE);
+		if (folio_test_large(folio)) {
+			f2fs_ffs_find_or_alloc(folio);
+			f2fs_ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
+		} else if (!folio_test_uptodate(folio)) {
 			folio_mark_uptodate(folio);
+		}
 	} else {
 		f2fs_folio_put(folio, true);
 
@@ -2670,7 +2677,7 @@ static bool __ffs_mark_subrange_uptodate(struct folio *folio,
 	return bitmap_full(ffs->state, nr_subpages);
 }
 
-static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
+void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
 				       size_t len)
 {
 	struct f2fs_folio_state *ffs;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0ffbe2bd04c8..6ae249bf9aa1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4330,6 +4330,7 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 			bool for_write);
 struct folio *f2fs_get_new_data_folio(struct inode *inode,
 			struct folio *ifolio, pgoff_t index, bool new_i_size);
+void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset, size_t len);
 int f2fs_do_write_data_page(struct f2fs_io_info *fio);
 int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag);
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 02d687527241..4272013dbe38 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -811,12 +811,12 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 static int truncate_partial_data_page(struct inode *inode, u64 from,
 								bool cache_only)
 {
-	loff_t offset = from & (PAGE_SIZE - 1);
 	pgoff_t index = from >> PAGE_SHIFT;
 	struct address_space *mapping = inode->i_mapping;
 	struct folio *folio;
+	size_t folio_off;
 
-	if (!offset && !cache_only)
+	if (!(from & (PAGE_SIZE - 1)) && !cache_only)
 		return 0;
 
 	if (cache_only) {
@@ -834,12 +834,21 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
 		return PTR_ERR(folio) == -ENOENT ? 0 : PTR_ERR(folio);
 truncate_out:
 	f2fs_folio_wait_writeback(folio, DATA, true, true);
-	folio_zero_segment(folio, offset, folio_size(folio));
+	folio_off = offset_in_folio(folio, from);
+	folio_zero_segment(folio, folio_off, folio_size(folio));
 
 	/* An encrypted inode should have a key and truncate the last page. */
 	f2fs_bug_on(F2FS_I_SB(inode), cache_only && IS_ENCRYPTED(inode));
-	if (!cache_only)
+	if (!cache_only) {
+		if (folio_test_large(folio)) {
+			f2fs_ffs_find_or_alloc(folio);
+			f2fs_ffs_mark_subrange_uptodate(folio, folio_off,
+					folio_size(folio) - folio_off);
+			f2fs_ffs_mark_subrange_dirty(folio, folio_off,
+					folio_size(folio) - folio_off);
+		}
 		folio_mark_dirty(folio);
+	}
 	f2fs_folio_put(folio, true);
 	return 0;
 }
@@ -1310,6 +1319,7 @@ static int fill_zero(struct inode *inode, pgoff_t index,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct folio *folio;
 	struct f2fs_lock_context lc;
+	size_t folio_off;
 
 	if (!len)
 		return 0;
@@ -1324,7 +1334,14 @@ static int fill_zero(struct inode *inode, pgoff_t index,
 		return PTR_ERR(folio);
 
 	f2fs_folio_wait_writeback(folio, DATA, true, true);
-	folio_zero_range(folio, start, len);
+	folio_off = offset_in_folio(folio,
+				   (loff_t)index << PAGE_SHIFT) + start;
+	folio_zero_range(folio, folio_off, len);
+	if (folio_test_large(folio)) {
+		f2fs_ffs_find_or_alloc(folio);
+		f2fs_ffs_mark_subrange_uptodate(folio, folio_off, len);
+		f2fs_ffs_mark_subrange_dirty(folio, folio_off, len);
+	}
 	folio_mark_dirty(folio);
 	f2fs_folio_put(folio, true);
 	return 0;
-- 
2.43.0

