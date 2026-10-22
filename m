Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655652;
	b=KS9qRKPOjxMAC5d34ka44cavj29o/cyERVVuIl6dXNrBR7Uin6gE7x2khk0aYTTi27wz
	 sxhuCIkqY7U6uQ2A5JmqsTl8/iErewc3n41zYTh5KvYcU4eKIHX/xkD+F83tYHTT2oyiC
	 gfabQOeEzu+IaTgMTKpUDkw4hlswQxxdvu3hG2tDYtY3pcoDDoZH3uT+WEIkzG+Qa4X2q
	 gT+nQ/nfghVE8Zy6D6tJZJpt9or7ar50/Hnt8M3nNbQxNR/zem4/5PzCYuOJdPqhErKDA
	 MaWYkokqmM7FCrUw9mNKoAa/6DV7984Uel5UUOR+TeY54i0muUXfVcE/94hSbCXcCuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kq/iCBjCAwhFNF4WAnD17PBhgJb8ksFtp1/3O5GxLGE=;
	b=tNog0tyOGy/5ILZgoy1EJyNxQgTLNiQMLVzaoF+vxGsI3ZaLyRdSX7TfK06QkJi43Q8D
	 xOP4cWir/AbTZ+MPpTOTt7QvTs8LeZXyXmpdbyuDTIp9/vrw8grv8LA6FQ8/k5KdjHTVP
	 8o0bY9aDr8IF3Rrd91nRgdEgVurtKHex49o7SXYCDHGlxuzSTaGxWDEWbkYNAuOzPSQDQ
	 zo+tNJGDhxsSeVbDr771CF8Xh5ZjpOj3lU7K1W+xLMEqHcSaiJpbhD9b/qcgZDW/OLv4x
	 hegrARuwg0v0z6fsRRake4B9kGUPn0mDgKPuo+4R00zZZcQHQMZfbdLNWklYmXscRRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXQRT35P;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC12B606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC12B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXQRT35P
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac63aee1ecso403821a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655651; x=1793260451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq/iCBjCAwhFNF4WAnD17PBhgJb8ksFtp1/3O5GxLGE=;
        b=jXQRT35PGGNdsw1QY2Pev/WXKb/J+QTFVD46cZFRmMfikDcksRWH0Luz48VMud+BIB
         t2+wbwqKZ2IBWC1BvIe8tcSlT8ZF3f6JDqo/X2+glS72cdmSl6iNfTML90tFZuyWapLH
         8z704Ah4ZoS/953m6RPCS4Q1c8n9GmjcsBJNRzQXipel7wfVFUlEt/QftzT9L0ds3bHC
         GEJy69XGXLiEcHaO5btlBQsuLzFPzHWqT4sbCeD4YC0CLB5dviNOmSsofqoRwWsnGcvd
         hXSXxH690RUMyPUASTBQsx7QyaIZ4B0NW1NRXOE6BJJ3vUh0eagEZxBjvGnWclG1LuVc
         gN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655651; x=1793260451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kq/iCBjCAwhFNF4WAnD17PBhgJb8ksFtp1/3O5GxLGE=;
        b=ZsMnDQCp1mSFhqVXZ6tGvLctyd4IpxllIVJ57CeLi4QnaFk3WP8CRb/lcQJQcqFXoR
         zAmi7kV9GIeXynttCC1BQzU0JV1L0MXn3K5xeTztD11qkKL+WBSJfINea+euT91S+dKm
         m6XYlN8ZV4CNYOvkBh8VEK5VvXTjyDbo4LXF0Oiqbs/CEffjj/FP5Mb4QZEGVx3IUF7Q
         rJCm3rURzrKMxqjK2tfBwzXgvWeHW8nWTQrF9jCiHX3MHseff8jmYoC+p9isZ1RATSHK
         F+ZydqcrKCrVplctfzlGwQUz2w6fq6fIa9TmXCui0ls7OGjiNfRjmClvp161JjBlHRiU
         KuuA==
X-Forwarded-Encrypted: i=1; AKwUvBzkQOlajodRODt4X4Q08OqJwyLLhulli5uqNcI2LQVWIGtv6IOwk+Zny9srPEkXe3vZBHsQMgNKVRPLS1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPwB44EAn9Tdp2A0e8Dt8wlIHG63+9e4/Ol/C8UqLvh6tZR5Bi
	tm7k9QqSEXuSKgLSWs3q1BgNBsX0MJ7fbxS8HEydvIatMG3iAdoM0/u+
X-Gm-Gg: AYBFou0NeVYCx4hZZvo6941p1eGX4EpkKM3Hv8HZ/gjrKG0ywjf8B8DEImEPO13u20U
	DSZP1Z1JGawhiyuw+CEEsiy0JbSsmoErt5XRXUvRy9a7nKzC1ZdsevaJcmBaL7irg+1ATQoFpu8
	Orly8uMp6QQQ3KuxcwHH0EgFSHztmQ0axfbHkTN7YVgN7tT49TsgxTufDmC0CeOt6iBsqhnM/S5
	X1y4vSsI5RMu3qc3Ol/gyaPgGkuwbG8lkPdx0rt2xDjZjcdLEWkncGl230mZTttT+h4vjAKijeL
	iDoIsGdxTf5q/30EY0gKnc5BFHO6rJHt+5lmVpbZ72NUH3pH/fbhhzSgH69b2cLeFGch/eNIB+N
	nOwCmi2ojPVjzDxOdkNd0XwrGB4oKqr1fb6BDe/J09tJyAIWA9h4CcHTrISIEFwdxJsYMpjqxFt
	QQrZFDUETqLtn3rhdnheskE9Bkg33xhPsFyT1n9dyQkDamVNaepkbltFSo1VqWKIE4DtmlgRp0B
	2fYMkcJ+zzF2PfTTLXIevyMulBOUuXtaCaiwWchfUOiToXRNfh5UX0yBXLxca6cJMd19HSvVbXx
	lz2FQe8jHprP9PHn2A==
X-Received: by 2002:a17:90b:4c4c:b0:3ac:9176:e837 with SMTP id 98e67ed59e1d1-3ad86f1b205mr3691972a91.50.1792655650853;
        Thu, 22 Oct 2026 00:54:10 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm3202562a91.6.2026.10.22.00.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:54:10 -0700 (PDT)
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
Subject: [PATCH v6 05/15] f2fs: support large folio writeback
Date: Thu, 22 Oct 2026 15:53:32 +0800
Message-ID: <20261022075343.3043003-6-nzzhao.sigma@gmail.com>
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

Large folio can contain multiple dirty ranges.
Add a folio-based writeback path for large-folio mapping files
and keep the legacy f2fs_write_cache_pages() path unchanged for
non large-folio mapping files.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c    | 521 +++++++++++++++++++++++++++++++++++++++++++++-
 fs/f2fs/segment.c |   8 +-
 2 files changed, 521 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e3d6e3087bb9..74583f0f1833 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -358,6 +358,49 @@ static void f2fs_cache_write_end_bio(struct bio *bio)
 	bio_put(bio);
 }
 
+static bool f2fs_ffs_has_dirty_subpage(struct folio *folio)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned long flags;
+	unsigned int nr_subpages;
+	bool dirty;
+
+	if (!f2fs_folio_has_ffs(folio))
+		return false;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	nr_subpages = folio_nr_pages(folio);
+
+	spin_lock_irqsave(&ffs->state_lock, flags);
+	dirty = find_next_bit(ffs->state, 2 * nr_subpages,
+				nr_subpages) < 2 * nr_subpages;
+	spin_unlock_irqrestore(&ffs->state_lock, flags);
+
+	return dirty;
+}
+
+/*
+ * Drop a write page pending of @folio.  When the last pending is gone,
+ * clear PAGE_PRIVATE_GCING if no dirty subpage is left, and end
+ * writeback if it was started.
+ */
+static void f2fs_ffs_put_write_pending(struct folio *folio, unsigned int nr)
+{
+	struct f2fs_folio_state *ffs;
+
+	if (!f2fs_folio_has_ffs(folio))
+		goto release;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	if (!atomic_sub_and_test(nr, &ffs->write_pages_pending))
+		return;
+release:
+	if (!f2fs_ffs_has_dirty_subpage(folio))
+		folio_clear_f2fs_gcing(folio);
+	if (folio_test_writeback(folio))
+		folio_end_writeback(folio);
+}
+
 static void f2fs_write_end_bio(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi = bio->bi_private;
@@ -373,6 +416,8 @@ static void f2fs_write_end_bio(struct bio *bio)
 
 	bio_for_each_folio_all(fi, bio) {
 		struct folio *folio = fi.folio;
+		unsigned int nr_pages = fi.length >> PAGE_SHIFT;
+		unsigned int npages = nr_pages;
 		enum count_type type;
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -392,7 +437,8 @@ static void f2fs_write_end_bio(struct bio *bio)
 			}
 		}
 
-		dec_cache_count(sbi, type);
+		while (nr_pages--)
+			dec_cache_count(sbi, type);
 
 		/*
 		 * we should access sbi before folio_end_writeback() to
@@ -402,8 +448,7 @@ static void f2fs_write_end_bio(struct bio *bio)
 				wq_has_sleeper(&sbi->cp_wait))
 			wake_up(&sbi->cp_wait);
 
-		folio_clear_f2fs_gcing(folio);
-		folio_end_writeback(folio);
+		f2fs_ffs_put_write_pending(folio, npages);
 	}
 
 	bio_put(bio);
@@ -2922,7 +2967,7 @@ static unsigned int __ffs_mark_subrange_dirty(struct folio *folio,
 	return bitmap_weight(ffs->state, 2 * nr_subpages) - before;
 }
 
-static void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
+void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
 				    size_t offset, size_t len)
 {
 	struct f2fs_folio_state *ffs;
@@ -2940,6 +2985,99 @@ static void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
 	spin_unlock_irqrestore(&ffs->state_lock, flags);
 }
 
+static bool __ffs_clear_subrange_dirty(struct folio *folio,
+			struct f2fs_folio_state *ffs, size_t offset, size_t len)
+{
+	unsigned int nr_subpages = folio_nr_pages(folio);
+	unsigned int start, end;
+
+	start = offset >> PAGE_SHIFT;
+	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	end = min(end, nr_subpages);
+
+	bitmap_clear(ffs->state, nr_subpages + start, end - start);
+	return find_next_bit(ffs->state, 2 * nr_subpages, nr_subpages) <
+			2 * nr_subpages;
+}
+
+/**
+ * f2fs_ffs_clear_subrange_dirty_and_test - clear dirty bits and test remaining
+ * @folio: the large folio
+ * @offset: start byte offset within the folio
+ * @len: byte length of the subrange
+ *
+ * Clear the dirty bits of the 4K subpages covered by [offset, offset + len),
+ * and return whether the folio still has any dirty subpage left.
+ */
+bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
+					    size_t len)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned long flags;
+	bool dirty;
+
+	if (!f2fs_folio_has_ffs(folio))
+		return false;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	spin_lock_irqsave(&ffs->state_lock, flags);
+	dirty = __ffs_clear_subrange_dirty(folio, ffs, offset, len);
+	spin_unlock_irqrestore(&ffs->state_lock, flags);
+
+	return dirty;
+}
+
+static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state *ffs,
+			const struct folio *folio, unsigned int start,
+			unsigned int end)
+{
+	unsigned int nr_subpages = folio_nr_pages(folio);
+
+	return find_next_bit(ffs->state, nr_subpages + end + 1,
+			nr_subpages + start) - nr_subpages;
+}
+
+static unsigned int ffs_next_clean_subpage(struct f2fs_folio_state *ffs,
+			const struct folio *folio, unsigned int start,
+			unsigned int end)
+{
+	unsigned int nr_subpages = folio_nr_pages(folio);
+
+	return find_next_zero_bit(ffs->state, nr_subpages + end + 1,
+			nr_subpages + start) - nr_subpages;
+}
+
+static unsigned int ffs_find_dirty_range(struct folio *folio,
+					u64 *range_start, u64 range_end)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int start, end, nr_pages;
+
+	if (*range_start >= range_end)
+		return 0;
+
+	if (!f2fs_folio_has_ffs(folio))
+		return range_end - *range_start;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	start = offset_in_folio(folio, *range_start) >> PAGE_SHIFT;
+	end = DIV_ROUND_UP(min_not_zero(offset_in_folio(folio, range_end),
+					folio_size(folio)), PAGE_SIZE) - 1;
+
+	start = ffs_next_dirty_subpage(ffs, folio, start, end);
+	if (start > end)
+		return 0;
+
+	if (start == end)
+		nr_pages = 1;
+	else
+		nr_pages = ffs_next_clean_subpage(ffs, folio,
+						 start + 1, end) - start;
+
+	*range_start = folio_pos(folio) + ((u64)start << PAGE_SHIFT);
+	return (u64)nr_pages << PAGE_SHIFT;
+}
+
 static bool find_next_valid_block(const struct folio *folio,
 				  size_t orig_off, size_t *need_off,
 				  size_t len)
@@ -3477,7 +3615,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	if (ipu_force ||
 		(__is_valid_data_blkaddr(fio->old_blkaddr) &&
 					need_inplace_update(fio))) {
-		folio_start_writeback(folio);
+		__folio_start_writeback(folio, folio_test_dirty(folio));
 		f2fs_put_dnode(&dn);
 		if (fio->need_lock == LOCK_REQ)
 			f2fs_unlock_op(fio->sbi, &lc);
@@ -3504,7 +3642,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 
 	fio->version = ni.version;
 
-	folio_start_writeback(folio);
+	__folio_start_writeback(folio, folio_test_dirty(folio));
 
 	if (fio->compr_blocks && fio->old_blkaddr == COMPRESS_ADDR)
 		f2fs_i_compr_blocks_update(inode, fio->compr_blocks - 1, false);
@@ -3512,6 +3650,13 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	/* LFS mode write path */
 	f2fs_outplace_write_data(&dn, fio);
 	trace_f2fs_do_write_data_page(folio, OPU);
+	/*
+	 * The outplace write path failed to submit this block.
+	 */
+	if (!fio->submitted) {
+		err = -EIO;
+		goto out_writepage;
+	}
 	set_inode_flag(inode, FI_APPEND_WRITE);
 	if (atomic_commit)
 		folio_clear_f2fs_atomic(folio);
@@ -3523,6 +3668,144 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	return err;
 }
 
+static int f2fs_write_folio_dirty_range(struct folio *folio, int *submitted,
+					struct writeback_control *wbc,
+					enum iostat_type io_type,
+					u64 *pos, u64 len)
+{
+	struct inode *inode = folio->mapping->host;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	bool atomic_commit = f2fs_is_atomic_file(inode) &&
+				folio_test_f2fs_atomic(folio);
+	struct inode *dn_inode = atomic_commit ?
+				F2FS_I(inode)->cow_inode : inode;
+	struct f2fs_folio_state *ffs = NULL;
+	u64 folio_start = folio_pos(folio);
+	pgoff_t start_idx = (*pos - folio_start) >> PAGE_SHIFT;
+	pgoff_t end_idx = (*pos - folio_start + len - 1) >> PAGE_SHIFT;
+	int err = 0;
+
+	for (pgoff_t i = start_idx; i <= end_idx && !err; i++) {
+		struct dnode_of_data dn;
+		struct node_info ni;
+		pgoff_t data_idx = folio->index + i;
+		bool ipu_force = false;
+		bool dn_held = false;
+		bool submitted_blk = false;
+		struct f2fs_io_info fio = {
+			.sbi = sbi,
+			.ino = inode->i_ino,
+			.type = DATA,
+			.op = REQ_OP_WRITE,
+			.op_flags = wbc_to_write_flags(wbc),
+			.old_blkaddr = NULL_ADDR,
+			.folio = folio,
+			.folio_offset = i,
+			.folio_blkcnt = 1,
+			.encrypted_page = NULL,
+			.submitted = 0,
+			.need_lock = LOCK_DONE,
+			.meta_gc = f2fs_meta_inode_gc_required(inode) ? 1 : 0,
+			.io_type = io_type,
+			.io_wbc = wbc,
+		};
+
+		if (f2fs_folio_has_ffs(folio)) {
+			ffs = (struct f2fs_folio_state *)folio->private;
+			atomic_inc(&ffs->write_pages_pending);
+		}
+
+		set_new_dnode(&dn, dn_inode, NULL, NULL, 0);
+
+		if (need_inplace_update(&fio) &&
+		    f2fs_lookup_read_extent_cache_block(inode, data_idx,
+							&fio.old_blkaddr)) {
+			if (!f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
+						   DATA_GENERIC_ENHANCE)) {
+				err = -EFSCORRUPTED;
+				goto block_done;
+			}
+			ipu_force = true;
+			goto got_it;
+		}
+
+		err = f2fs_get_dnode_of_data(&dn, data_idx, LOOKUP_NODE);
+		if (err)
+			goto block_done;
+		dn_held = true;
+
+		fio.old_blkaddr = dn.data_blkaddr;
+
+got_it:
+		if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
+		    !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
+					   DATA_GENERIC_ENHANCE)) {
+			err = -EFSCORRUPTED;
+			goto block_done;
+		}
+
+		if (fio.meta_gc)
+			f2fs_wait_on_block_writeback(inode, fio.old_blkaddr);
+
+		if (ipu_force ||
+		    (__is_valid_data_blkaddr(fio.old_blkaddr) &&
+					    need_inplace_update(&fio))) {
+			f2fs_put_dnode(&dn);
+			dn_held = false;
+			err = f2fs_inplace_write_data(&fio);
+			trace_f2fs_do_write_data_page(folio, IPU);
+			if (err)
+				goto block_done;
+
+			if (submitted)
+				(*submitted)++;
+			submitted_blk = true;
+			set_inode_flag(inode, FI_UPDATE_WRITE);
+			goto block_done;
+		}
+
+		err = f2fs_get_node_info(sbi, dn.nid, &ni, false);
+		if (err)
+			goto block_done;
+
+		fio.version = ni.version;
+
+		f2fs_outplace_write_data(&dn, &fio);
+		/*
+		 * The outplace write path failed to submit this block.
+		 */
+		if (!fio.submitted) {
+			err = -EIO;
+			goto block_done;
+		}
+		if (submitted)
+			(*submitted)++;
+		submitted_blk = true;
+		set_inode_flag(inode, FI_APPEND_WRITE);
+		trace_f2fs_do_write_data_page(folio, OPU);
+block_done:
+		if (dn_held)
+			f2fs_put_dnode(&dn);
+		/*
+		 * If this block was not submitted, roll back its
+		 * write pages pending.
+		 */
+		if (!submitted_blk && ffs)
+			f2fs_ffs_put_write_pending(folio, 1);
+		if (!err) {
+			*pos = ((loff_t)data_idx + 1) << PAGE_SHIFT;
+			spin_lock(&F2FS_I(inode)->i_size_lock);
+			if (F2FS_I(inode)->last_disk_size < *pos)
+				F2FS_I(inode)->last_disk_size = *pos;
+			spin_unlock(&F2FS_I(inode)->i_size_lock);
+		} else {
+			file_set_keep_isize(inode);
+		}
+	}
+
+	return err;
+}
+
 int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				struct bio **bio,
 				sector_t *last_block,
@@ -3972,6 +4255,226 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	return ret;
 }
 
+static int f2fs_write_cache_folios(struct address_space *mapping,
+				   struct writeback_control *wbc,
+				   enum iostat_type io_type)
+{
+	struct folio *folio = NULL;
+	struct inode *inode = mapping->host;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_lock_context lc;
+	u64 pos = 0;
+	u64 end_pos = 0;
+	u32 r_len = 0;
+	int err = 0;
+	int submitted = 0;
+	int nwritten = 0;
+	bool op_locked = false;
+	bool retry = false;
+
+	if (get_dirty_pages(inode) <= SM_I(sbi)->min_hot_blocks)
+		set_inode_flag(inode, FI_HOT_DATA);
+	else
+		clear_inode_flag(inode, FI_HOT_DATA);
+
+	while ((folio = writeback_iter(mapping, wbc, folio, &err))) {
+		struct f2fs_folio_state *ffs = NULL;
+		u64 isize;
+		size_t poff;
+		pgoff_t end_index;
+		bool verity_in_progress;
+		int folio_submitted = 0;
+		bool bias_added = false;
+
+		submitted = 0;
+		retry = false;
+
+		if (err) {
+			folio_redirty_for_writepage(wbc, folio);
+			goto retry_out;
+		}
+
+		if (atomic_read(&sbi->wb_sync_req[DATA]) &&
+		    wbc->sync_mode == WB_SYNC_NONE) {
+			folio_redirty_for_writepage(wbc, folio);
+			/*
+			 * A WB_SYNC_ALL writeback is in progress, so defer
+			 * this writeback.  Mark the error as -EBUSY to let
+			 * writeback_iter() stop iterating.
+			 */
+			err = -EBUSY;
+			goto retry_out;
+		}
+
+		/*
+		 * If cp_error is set, all subpages of this folio are not written
+		 * back unless the filesystem is mounted with errors=remount-ro.
+		 */
+		if (unlikely(f2fs_cp_error(sbi))) {
+			mapping_set_error(folio->mapping, -EIO);
+			if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY) {
+				folio_redirty_for_writepage(wbc, folio);
+			} else {
+				if (f2fs_folio_has_ffs(folio))
+					f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
+									folio_size(folio));
+				inode_dec_dirty_pages(inode);
+			}
+			goto retry_out;
+		}
+
+		/*
+		 * Writing back one large folio performs multiple block allocations, so
+		 * best-effort balance the filesystem before writing it back.
+		 */
+		if (!F2FS_I(inode)->wb_task && has_not_enough_free_secs(sbi, 0, 0)) {
+			folio_redirty_for_writepage(wbc, folio);
+			retry = true;
+			folio_unlock(folio);
+			f2fs_balance_fs(sbi, true);
+			folio_lock(folio);
+			goto retry;
+		}
+retry:
+		pos = folio_pos(folio);
+		end_pos = pos + folio_size(folio);
+		isize = i_size_read(inode);
+		verity_in_progress = f2fs_verity_in_progress(inode);
+		poff = 0;
+		end_index = 0;
+
+		if (retry) {
+
+			if (unlikely(folio->mapping != mapping))
+				goto retry_out;
+
+			if (!folio_test_dirty(folio))
+				goto retry_out;
+
+			if (folio_test_writeback(folio)) {
+				if (wbc->sync_mode == WB_SYNC_NONE)
+					goto retry_out;
+				f2fs_folio_wait_writeback(folio, true, true);
+			}
+
+			if (!folio_clear_dirty_for_io(folio))
+				goto retry_out;
+		}
+
+		/* To avoid dealing with the complexity for one subrange is in bio
+		 * while we trylock_op failed before writing another subrange.
+		 * Try to lock_op before any subrange write for the folio.
+		 */
+		if (!op_locked) {
+			if (!f2fs_trylock_op(sbi, &lc)) {
+				folio_redirty_for_writepage(wbc, folio);
+				err = 0;
+				if (wbc->sync_mode != WB_SYNC_ALL)
+					goto retry_out;
+
+				retry = true;
+				folio_unlock(folio);
+				f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
+				folio_lock(folio);
+				goto retry;
+			}
+			op_locked = true;
+		}
+
+		if (!verity_in_progress) {
+			poff = offset_in_folio(folio, isize);
+			end_index = isize >> PAGE_SHIFT;
+
+			if (folio->index > end_index ||
+			    (folio->index == end_index && poff == 0))
+				goto out;
+
+			if (end_pos > isize) {
+				folio_zero_segment(folio, poff, folio_size(folio));
+				end_pos = isize;
+			}
+		}
+
+		folio_start_writeback(folio);
+
+		/*
+		 * Large folios can be submitted as multiple bios, which may
+		 * complete while we are still submitting the remaining dirty
+		 * ranges.  Hold a bias on write_pages_pending to prevent
+		 * folio_end_writeback() from being called early.
+		 */
+		if (!bias_added && f2fs_folio_has_ffs(folio)) {
+			ffs = (struct f2fs_folio_state *)folio->private;
+			WARN_ON_ONCE(atomic_read(&ffs->write_pages_pending) != 0);
+			atomic_inc(&ffs->write_pages_pending);
+			bias_added = true;
+		}
+
+		while ((r_len = ffs_find_dirty_range(folio, &pos, end_pos))) {
+			err = f2fs_write_folio_dirty_range(folio, &submitted,
+					wbc, io_type, &pos, r_len);
+			folio_submitted += submitted;
+			nwritten += submitted;
+			if (err)
+				goto out;
+		}
+
+		/* If none of the subpages of a folio is submitted, keep the atomic flag */
+		if (folio_submitted &&
+		    f2fs_is_atomic_file(inode) &&
+		    folio_test_f2fs_atomic(folio))
+			folio_clear_f2fs_atomic(folio);
+
+out:
+		/*
+		 * Clear the dirty state of the subranges that were written back.
+		 * If some subranges are still dirty (e.g. the folio was only
+		 * partially written back), or if the writeback failed, the
+		 * folio must stay dirty so that the remaining subranges are
+		 * written back later.
+		 */
+		if (f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
+					(err ? pos : end_pos) - folio_pos(folio)) || err)
+			folio_redirty_for_writepage(wbc, folio);
+		else
+			inode_dec_dirty_pages(inode);
+
+		/*
+		 * Release the bias taken above and we end writeback here if
+		 * no write bio is in flight.
+		 */
+		if (bias_added) {
+			f2fs_ffs_put_write_pending(folio, 1);
+		} else if (!folio_submitted && folio_test_writeback(folio)) {
+			/*
+			 * Order-0 folios take no bias, so end the writeback
+			 * if nothing was submitted.
+			 */
+			folio_end_writeback(folio);
+		}
+
+retry_out:
+		if (op_locked) {
+			f2fs_unlock_op(sbi, &lc);
+			op_locked = false;
+		}
+
+		folio_unlock(folio);
+	}
+
+	if (nwritten)
+		f2fs_submit_merged_write_cond(F2FS_M_SB(mapping), mapping->host,
+					       NULL);
+
+	/*
+	 * Prevent the -EBUSY error that stopped writeback_iter() from
+	 * propagating to the user.
+	 */
+	if (err == -EBUSY)
+		err = 0;
+	return err;
+}
+
 static inline bool __should_serialize_io(struct inode *inode,
 					struct writeback_control *wbc)
 {
@@ -4066,7 +4569,11 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	account_writeback(inode, true);
 
 	blk_start_plug(&plug);
-	ret = f2fs_write_cache_pages(mapping, wbc, io_type);
+	if (mapping_large_folio_support(inode->i_mapping) &&
+	    !f2fs_has_inline_data(inode))
+		ret = f2fs_write_cache_folios(mapping, wbc, io_type);
+	else
+		ret = f2fs_write_cache_pages(mapping, wbc, io_type);
 	blk_finish_plug(&plug);
 
 	account_writeback(inode, false);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 80f58c586e33..cbb65e0343c8 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4173,7 +4173,13 @@ static void do_write_block(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 				"%s Failed to allocate data block, ino:%u, index:%lu, type:%d, old_blkaddr:0x%x, new_blkaddr:0x%x, err:%d",
 				__func__, fio->ino, folio->index, type,
 				fio->old_blkaddr, fio->new_blkaddr, err);
-			folio_end_writeback(folio);
+			/*
+			 * For a large folio, the caller rolls back
+			 * write_pages_pending and ends writeback when the last
+			 * pending write is gone.
+			 */
+			if (!f2fs_folio_has_ffs(folio))
+				folio_end_writeback(folio);
 		}
 		f2fs_bug_on(fio->sbi, !is_set_ckpt_flags(fio->sbi,
 							CP_ERROR_FLAG));
-- 
2.43.0

