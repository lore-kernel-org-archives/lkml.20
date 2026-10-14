Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BA245D5FF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960331; cv=none; b=cZ9Fx2c2jsAkraFmZG0G0Q7aVtS8bSdy+JtdzsdrFujITvKFnLmkAbgmHIQz3Hz3YvFuqiDF0p9M/FRRtCN/KKhn7WYnQcRfGheUxM8noHYotEWF7PzH8PSo0R4EFxG59KPw7oJj6ropWI0w3RD3FPb4gxxuf8erENGZs7NlX/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960331; c=relaxed/simple;
	bh=V0+hxg36HMOcJSKUskGyKvPPU6Ww0N2zYfC6uQ2/egI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGI1KCZ5lQnWpb0AzC0ONujUYDMNKU6djyNMxbhcZFI2R0D0FLuVSo25+d3r4P5NdJcbLjQ8thxTvdssmig+a3LEsYhWEgZecU+oiVsancwxyEqHwX8vU8Ut2EahLG13seoRTfIMvG+Yj6cw59RFeVYhpbvPFEaYlMloJ9VrSUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oyIMa2JG; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oyIMa2JG"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4821449so1451699a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791960327; x=1792565127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g1mqZSAK5ECOMDo37eNCrWHNUg3oPAUf+RNOk/vBMLY=;
        b=oyIMa2JGt3jw4WXOHjLa5aQKLjcd+Gj+aNkyQ6noF3Q6HPGdFJs7ss/Llg7UVLCV4H
         hYmwYACttVj8hT/Z54ggmTMXFxLtc5KLp3U6A6mJA4qkKPBTCqAG1jWAfe9zHvL5UHpA
         CEIVIk79TT5O0dafreucX/WtYwqIpGOkROiYLOEkQWyVMiF61/5Jx0nMg3OJDpoDDIPY
         npSP3w6MuMiN0/leRAjz1wiMpUypUYNPbaCn/OBWFxsGhQz5hlWrMiVmTbw1/Z2Rizx5
         trnuwgVeHZ/isjad9k01B+/xPisS/0oL18zSv/1a9s6lGMFVD87YNSllOALtckXYf38B
         6kmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960327; x=1792565127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g1mqZSAK5ECOMDo37eNCrWHNUg3oPAUf+RNOk/vBMLY=;
        b=Y4FilLuymFeBmrlYEC3AHoQ/u03sDXOzQfZHLtixJu8LKSSxZbUfh/hPh+pt2Ja1po
         ya8ecVlw1bYeGGXkv/KIZC6U7Ia8CldV5A4TVlIWHy80QLUK8fK+dKOTNy/p6+zJlT03
         9VktHAJvMD9PTN2xo91QtwVLz0A5IrX70DS8aBKb8xCOFi/4lovxJaj8pz8v6sLHKPJ/
         YZ9yjW8wpi2Ch2cj10D6oQrfr5Qe7BrNOff7VfuTknOCgHqV4aLn4glpUBO68Fy+t/ol
         iInPtqgnjt0D0dqyfBV3m2waVVtVJ4GB57olgMKhNJrIs60rSA5EXehLMiST2cgr3T3E
         TLTA==
X-Forwarded-Encrypted: i=1; AKwUvBymt47YwBGYaskEDgEVH2xBxE2FHQaUtINU68EU6mgcjN/aTGOK7puAIkCTOJkVFOF7dqxB4AwY4vZj2mU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKa33YjkbHpvKJpD4Vfgti7kr+Qtt8uME15WjBmxbc0hx4PwTXT
	X3ZD5YY/bltou+ZneOVIb8O/Kcx1lzBBN3us89c076GkhifQkJgJME3n
X-Gm-Gg: AYBFou0Fr+yB2hkfZPM0BoEfilX133gyYCv8RhBIrqe8FKGgANiCdy0Xwa54Kk0dFHq
	B4sjGm6+THJVr2XH84G9apICeJRL0izVS0FFbhFCO3D+V+YV5daxJl/BfpG73pWWYm9iAvxpI6+
	1C6bb4m1A01Dr0deTchZx+wlir9+hK+NZdtwMVDxs7ZkuhPlsuWyeZtsfudWlzrdN1V+7/bJg79
	J6MOW+apV0LuxB+r/yFR0lQ2sqXzdbuYBJ7awG/lL/uLb/NDOPBHjs7BIXf0B2d5En9v53Z4eFj
	NZP/exUGr8nR2NGOgpXDDST9FUiemMjvK8vRM3EJCMOuD/tWbvm4E2RUFYW9n2WBsj6S+guN/1J
	qadX2mQ/q0oVN5dmElBrVlyRNghwhRPlyklfcuVwhEKH/ZyAk2PcG/1QjhoZ1FBkvt+B2VN/YKw
	chk3z0ep5DIzjU7OPTiIJ0Lfwt1xPe2WHZbbm2HWb0FXuX26DBiBsfsRFVaeIiGALBYLhxj2QUb
	d21AVgW+uK2DVYfFmeLL0/B+99KeReMnNlqdw==
X-Received: by 2002:a17:90b:224e:b0:3a8:9db2:a4f with SMTP id 98e67ed59e1d1-3ab3af75ac1mr11360958a91.51.1791960327198;
        Tue, 13 Oct 2026 23:45:27 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3236371a91.2.2026.10.13.23.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:45:26 -0700 (PDT)
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
Subject: [PATCH v5 03/16] f2fs: support regular file buffered writes on large folios
Date: Wed, 14 Oct 2026 14:44:32 +0800
Message-ID: <20261014064445.2835813-4-zhaonanzhe@xiaomi.com>
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

To avoid the complexity of unlocking a large folio in write_begin,
preallocate partial blocks for inodes that can use large folios.
During write_begin, read only the partial head and tail 4K subpages
that need read-before-write, and skip read I/O for the full middle
subpages covered by the write.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 405 ++++++++++++++++++++++++++++++++++++++++++++++---
 fs/f2fs/f2fs.h |   1 +
 fs/f2fs/file.c |  17 ++-
 3 files changed, 399 insertions(+), 24 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 429fe8998ca3..a1d2f3b7d9df 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -93,6 +93,20 @@ struct bio_post_read_ctx {
 	block_t fs_blkaddr;
 };
 
+static bool __ffs_mark_subrange_uptodate(struct folio *folio,
+		struct f2fs_folio_state *ffs, size_t offset, size_t len)
+{
+	unsigned int nr_subpages = folio_nr_pages(folio);
+	unsigned int start, end;
+
+	start = offset >> PAGE_SHIFT;
+	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	end = min(end, nr_subpages);
+
+	bitmap_set(ffs->state, start, end - start);
+	return bitmap_full(ffs->state, nr_subpages);
+}
+
 /*
  * Update and unlock a bio's pages, and free the bio.
  *
@@ -107,6 +121,23 @@ struct bio_post_read_ctx {
  * called (i.e., I/O error or decryption error, but *not* verity error), and
  * release the bio's reference to the decompress_io_ctx of the page's cluster.
  */
+/*
+ * Update read_pages_pending.
+ */
+static inline void f2fs_update_read_folio_pending(struct folio *folio, int nr)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned long flags;
+
+	if (!f2fs_folio_has_ffs(folio))
+		return;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	spin_lock_irqsave(&ffs->state_lock, flags);
+	ffs->read_pages_pending += nr;
+	spin_unlock_irqrestore(&ffs->state_lock, flags);
+}
+
 static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 {
 	struct folio_iter fi;
@@ -128,7 +159,8 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 		}
 
 		if (folio_test_large(folio)) {
-			struct f2fs_folio_state *ffs = folio->private;
+			struct f2fs_folio_state *ffs =
+				(struct f2fs_folio_state *)folio->private;
 
 			spin_lock_irqsave(&ffs->state_lock, flags);
 			ffs->read_pages_pending -= nr_pages;
@@ -1424,19 +1456,26 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode,
 
 /* This can handle encryption stuffs */
 static void f2fs_submit_page_read(struct inode *inode, struct fsverity_info *vi,
-				  struct folio *folio, block_t blkaddr,
-				  blk_opf_t op_flags, bool for_write)
+				  struct folio *folio, pgoff_t index,
+				  block_t blkaddr, blk_opf_t op_flags,
+				  bool for_write)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
+	size_t offset = 0;
+
+	if (f2fs_folio_has_ffs(folio)) {
+		offset = offset_in_folio(folio, (loff_t)index << PAGE_SHIFT);
+		f2fs_update_read_folio_pending(folio, 1);
+	}
 
-	bio = f2fs_grab_read_bio(inode, vi, blkaddr, 1, op_flags, folio->index,
+	bio = f2fs_grab_read_bio(inode, vi, blkaddr, 1, op_flags, index,
 				 for_write);
 
 	/* wait for GCed page writeback via generic cache */
 	f2fs_wait_on_block_writeback(inode, blkaddr);
 
-	if (!bio_add_folio(bio, folio, PAGE_SIZE, 0))
+	if (!bio_add_folio(bio, folio, PAGE_SIZE, offset))
 		f2fs_bug_on(sbi, 1);
 
 	inc_cache_count(sbi, F2FS_RD_DATA);
@@ -1444,6 +1483,39 @@ static void f2fs_submit_page_read(struct inode *inode, struct fsverity_info *vi,
 	f2fs_submit_read_bio(sbi, bio, DATA);
 }
 
+/*
+ * Synchronously read a single 4K subpage by reusing f2fs_submit_page_read()
+ * so that iostat, trace, blk-crypto and post-read handling are all preserved.
+ * The caller must have already allocated ffs for the folio.
+ */
+static int f2fs_submit_page_read_sync(struct inode *inode, struct folio *folio,
+				      pgoff_t index, block_t blkaddr)
+{
+	struct f2fs_folio_state *ffs =
+		(struct f2fs_folio_state *)folio->private;
+
+	if (folio_test_large(folio) && !f2fs_folio_has_ffs(folio))
+		return -EAGAIN;
+
+	/* Add bias so end_io does not call folio_end_read(). */
+	f2fs_update_read_folio_pending(folio, 1);
+
+	f2fs_submit_page_read(inode, NULL, folio, index, blkaddr,
+			      REQ_OP_READ, false);
+
+	/* Wait until all bios have completed (pending drops back to our bias). */
+	while (READ_ONCE(ffs->read_pages_pending) != 1)
+		f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
+
+	/* Remove the bias. */
+	f2fs_update_read_folio_pending(folio, -1);
+
+	if (!f2fs_ffs_test_blk_uptodate(folio, index))
+		return -EIO;
+
+	return 0;
+}
+
 static void __set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr)
 {
 	__le32 *addr = get_dnode_addr(dn->inode, dn->node_entry);
@@ -1617,8 +1689,8 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 		return folio;
 	}
 
-	f2fs_submit_page_read(inode, f2fs_need_verity(inode, folio->index),
-			      folio, dn.data_blkaddr, op_flags, for_write);
+	f2fs_submit_page_read(inode, f2fs_need_verity(inode, index),
+			      folio, index, dn.data_blkaddr, op_flags, for_write);
 	return folio;
 
 put_err:
@@ -2780,6 +2852,110 @@ static void ffs_detach_free(struct folio *folio)
 	kfree(ffs);
 }
 
+bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int idx;
+
+	f2fs_bug_on(F2FS_F_SB(folio), !folio_contains(folio, index));
+
+	if (folio_test_uptodate(folio))
+		return true;
+
+	if (!f2fs_folio_has_ffs(folio))
+		return false;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	idx = index - folio->index;
+	return test_bit(idx, ffs->state);
+}
+
+static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
+				       size_t len)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned long flags;
+	bool mark_uptodate = false;
+
+	f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
+
+	if (!f2fs_folio_has_ffs(folio)) {
+		folio_mark_uptodate(folio);
+		return;
+	}
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	spin_lock_irqsave(&ffs->state_lock, flags);
+	mark_uptodate = __ffs_mark_subrange_uptodate(folio, ffs, offset, len) &&
+			!ffs->read_pages_pending;
+	spin_unlock_irqrestore(&ffs->state_lock, flags);
+	if (mark_uptodate)
+		folio_mark_uptodate(folio);
+}
+
+static unsigned int __ffs_mark_subrange_dirty(struct folio *folio,
+			struct f2fs_folio_state *ffs, size_t offset, size_t len)
+{
+	unsigned int nr_subpages = folio_nr_pages(folio);
+	unsigned int start, end, before;
+
+	start = offset >> PAGE_SHIFT;
+	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	end = min(end, nr_subpages);
+
+	before = bitmap_weight(ffs->state, 2 * nr_subpages);
+	bitmap_set(ffs->state, nr_subpages + start, end - start);
+	return bitmap_weight(ffs->state, 2 * nr_subpages) - before;
+}
+
+static void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
+				    size_t offset, size_t len)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned long flags;
+
+	f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
+
+	if (!f2fs_folio_has_ffs(folio))
+		return;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+
+	spin_lock_irqsave(&ffs->state_lock, flags);
+	__ffs_mark_subrange_dirty(folio, ffs, offset, len);
+	spin_unlock_irqrestore(&ffs->state_lock, flags);
+}
+
+static bool find_next_valid_block(const struct folio *folio,
+				  size_t orig_off, size_t *need_off,
+				  size_t len)
+{
+	size_t start = orig_off;
+	size_t end = start + len;
+	size_t head, tail;
+	pgoff_t index;
+
+	if (start & (PAGE_SIZE - 1)) {
+		head = round_down(start, PAGE_SIZE);
+		index = folio->index + (head >> PAGE_SHIFT);
+		if (!f2fs_ffs_test_blk_uptodate(folio, index)) {
+			*need_off = head;
+			return true;
+		}
+	}
+
+	if (end & (PAGE_SIZE - 1)) {
+		tail = round_down(end, PAGE_SIZE);
+		index = folio->index + (tail >> PAGE_SHIFT);
+		if (!f2fs_ffs_test_blk_uptodate(folio, index)) {
+			*need_off = tail;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 static int f2fs_read_data_large_folio(struct inode *inode,
 		struct fsverity_info *vi,
 		struct readahead_control *rac, struct folio *folio)
@@ -4145,6 +4321,147 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 	return 0;
 }
 
+/*
+ * Drop the folio lock when a node was changed, then balance the
+ * filesystem and reacquire the lock.
+ *
+ * Return: true if the folio became unusable while unlocked (being
+ * truncated), false if the folio is still usable.
+ */
+static bool f2fs_balance_fs_folio_locked(struct folio *folio,
+		struct address_space *mapping, bool node_changed)
+{
+	struct inode *inode = folio->mapping->host;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned int orig_order;
+	bool had_ffs;
+
+	if (!node_changed || IS_NOQUOTA(inode) ||
+			!has_not_enough_free_secs(sbi, 0, 0))
+		return false;
+
+	had_ffs = f2fs_folio_has_ffs(folio);
+	orig_order = folio_order(folio);
+	folio_unlock(folio);
+	f2fs_balance_fs(sbi, true);
+	folio_lock(folio);
+
+	/*
+	 * Writeback may have started on the folio during the unlock
+	 * window, so wait for it before the caller proceeds.
+	 */
+	f2fs_folio_wait_writeback(folio, true, true);
+
+	if (folio->mapping != mapping)
+		return true;
+
+	if (folio_order(folio) != orig_order)
+		return true;
+
+	/* large folio was released */
+	if (had_ffs && !f2fs_folio_has_ffs(folio))
+		return true;
+
+	return false;
+}
+
+static int prepare_large_folio_write_begin(struct inode *inode,
+					  struct folio *folio, loff_t pos,
+					  unsigned int len)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_folio_state *ffs;
+	size_t ori_off = offset_in_folio(folio, pos);
+	size_t need_off = ori_off;
+	int err = 0;
+
+	/*
+	 * when the write did not come through f2fs_write_iter, we preallocate all
+	 * blocks in the write range here.
+	 */
+	if (!is_inode_flag_set(inode, FI_PREALLOCATED_ALL) &&
+	    !IS_DEVICE_ALIASING(inode)) {
+		pgoff_t first = F2FS_BYTES_TO_BLK(sbi, pos);
+		pgoff_t last = F2FS_BLK_ALIGN(sbi, pos + len);
+		pgoff_t idx;
+
+		for (idx = first; idx < last; idx++) {
+			block_t blkaddr = NULL_ADDR;
+			bool node_changed = false;
+
+			err = __reserve_data_block(inode, idx, &blkaddr,
+						   &node_changed);
+			if (err)
+				return err;
+			if (f2fs_balance_fs_folio_locked(folio, folio->mapping,
+						   node_changed))
+				return -EAGAIN;
+		}
+	}
+
+	ffs = f2fs_ffs_find_or_alloc(folio);
+	if (!ffs)
+		return -ENOMEM;
+
+	/* Skip read if the folio is already fully uptodate or the write
+	 * covers the entire folio.
+	 */
+	if (folio_test_uptodate(folio) || len == folio_size(folio))
+		return 0;
+
+	if (!f2fs_verity_in_progress(inode) &&
+	    !(pos & (PAGE_SIZE - 1)) && (pos + len) >= i_size_read(inode)) {
+		size_t zoff = ori_off + len;
+
+		if (zoff < folio_size(folio))
+			folio_zero_segment(folio, zoff, folio_size(folio));
+		return 0;
+	}
+
+	/* Inline data must have been converted before reaching here. */
+	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
+
+	while (find_next_valid_block(folio, ori_off,
+				     &need_off, len)) {
+		struct dnode_of_data dn;
+		pgoff_t index = folio->index + (need_off >> PAGE_SHIFT);
+		block_t blkaddr;
+
+		if (!f2fs_lookup_read_extent_cache_block(inode, index,
+							&blkaddr)) {
+			if (IS_DEVICE_ALIASING(inode))
+				return -ENODATA;
+
+			set_new_dnode(&dn, inode, NULL, NULL, 0);
+			err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
+			if (err)
+				return err;
+			blkaddr = dn.data_blkaddr;
+			f2fs_put_dnode(&dn);
+
+			if (blkaddr == NEW_ADDR) {
+				size_t off = offset_in_folio(folio,
+							     (loff_t)index << PAGE_SHIFT);
+
+				folio_zero_segment(folio, off, off + PAGE_SIZE);
+				f2fs_ffs_mark_subrange_uptodate(folio, off,
+							       PAGE_SIZE);
+				continue;
+			}
+
+			if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
+						  DATA_GENERIC_ENHANCE_READ))
+				return -EFSCORRUPTED;
+		}
+
+		err = f2fs_submit_page_read_sync(inode, folio, index, blkaddr);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static int f2fs_write_begin(const struct kiocb *iocb,
 			    struct address_space *mapping,
 			    loff_t pos, unsigned len, struct folio **foliop,
@@ -4156,6 +4473,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	pgoff_t index = pos >> PAGE_SHIFT;
 	bool need_balance = false;
 	block_t blkaddr = NULL_ADDR;
+	fgf_t fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT;
+	unsigned int blen;
 	int err = 0;
 
 	trace_f2fs_write_begin(inode, pos, len);
@@ -4203,9 +4522,15 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	 * Do not use FGP_STABLE to avoid deadlock.
 	 * Will wait that below with our IO control.
 	 */
-	folio = f2fs_filemap_get_folio(mapping, index,
-				FGP_LOCK | FGP_WRITE | FGP_CREAT,
-				mapping_gfp_mask(mapping));
+	/*
+	 * Inline data is carried in the first subpage.  Keep the index #0
+	 * folio order-0 so that the existing inline read/convert paths
+	 * (prepare_write_begin()) still apply; large folios are used from
+	 * the second folio on.
+	 */
+	fgp |= fgf_set_order(f2fs_has_inline_data(inode) ? PAGE_SIZE : len);
+	folio = f2fs_filemap_get_folio(mapping, index, fgp,
+				      mapping_gfp_mask(mapping));
 	if (IS_ERR(folio)) {
 		err = PTR_ERR(folio);
 		goto fail;
@@ -4215,11 +4540,15 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 
 	*foliop = folio;
 
+	/* Clamp the write length to the folio size. */
+	blen = min_t(unsigned int, len,
+		     folio_size(folio) - offset_in_folio(folio, pos));
+
 	if (f2fs_is_atomic_file(inode))
 		err = prepare_atomic_write_begin(sbi, folio, pos, len,
 					&blkaddr, &need_balance);
-	else
-		err = prepare_write_begin(sbi, folio, pos, len,
+	else if (!folio_test_large(folio))
+		err = prepare_write_begin(sbi, folio, pos, blen,
 					&blkaddr, &need_balance);
 	if (err)
 		goto put_folio;
@@ -4239,7 +4568,19 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 
 	f2fs_folio_wait_writeback(folio, false, true);
 
-	if (len == folio_size(folio) || folio_test_uptodate(folio))
+	if (folio_test_large(folio)) {
+		err = prepare_large_folio_write_begin(inode,
+					folio, pos, blen);
+		if (!err)
+			return 0;
+		if (err == -EAGAIN) {
+			f2fs_folio_put(folio, true);
+			goto repeat;
+		}
+		goto put_folio;
+	}
+
+	if (blen == folio_size(folio) || folio_test_uptodate(folio))
 		return 0;
 
 	if (!(pos & (PAGE_SIZE - 1)) && (pos + len) >= i_size_read(inode) &&
@@ -4267,7 +4608,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 		 */
 		f2fs_submit_page_read(inode,
 				      NULL, /* can't write to fsverity files */
-				      folio, blkaddr, 0, true);
+				      folio, index, blkaddr, 0, true);
 
 		folio_lock(folio);
 		if (unlikely(folio->mapping != mapping)) {
@@ -4299,15 +4640,20 @@ static int f2fs_write_end(const struct kiocb *iocb,
 	trace_f2fs_write_end(inode, pos, len, copied);
 
 	/*
-	 * This should be come from len == PAGE_SIZE, and we expect copied
-	 * should be PAGE_SIZE. Otherwise, we treat it with zero copied and
-	 * let generic_perform_write() try to copy data again through copied=0.
+	 * If a short copy happens on a folio that isn't uptodate, we treat
+	 * it with zero copied and let generic_perform_write() try to copy
+	 * data again through copied=0.
 	 */
 	if (!folio_test_uptodate(folio)) {
-		if (unlikely(copied != len))
+		if (unlikely(copied != len)) {
 			copied = 0;
-		else
+		} else if (folio_test_large(folio)) {
+			f2fs_ffs_mark_subrange_uptodate(folio,
+					offset_in_folio(folio, pos), len);
+		} else {
+			/* This should be come from len == PAGE_SIZE */
 			folio_mark_uptodate(folio);
+		}
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -4326,6 +4672,9 @@ static int f2fs_write_end(const struct kiocb *iocb,
 	if (!copied)
 		goto unlock_out;
 
+	if (folio_test_large(folio))
+		f2fs_ffs_mark_subrange_dirty(folio, offset_in_folio(folio, pos),
+								   copied);
 	folio_mark_dirty(folio);
 
 	if (f2fs_is_atomic_file(inode))
@@ -4382,8 +4731,22 @@ static bool f2fs_dirty_data_folio(struct address_space *mapping,
 
 	trace_f2fs_set_page_dirty(folio, DATA);
 
-	if (!folio_test_uptodate(folio))
-		folio_mark_uptodate(folio);
+	if (!folio_test_uptodate(folio)) {
+		bool uptodate = true;
+
+		if (f2fs_folio_has_ffs(folio)) {
+			struct f2fs_folio_state *ffs =
+				(struct f2fs_folio_state *)folio->private;
+			unsigned long flags;
+
+			spin_lock_irqsave(&ffs->state_lock, flags);
+			uptodate = bitmap_full(ffs->state, folio_nr_pages(folio)) &&
+				   !ffs->read_pages_pending;
+			spin_unlock_irqrestore(&ffs->state_lock, flags);
+		}
+		if (uptodate)
+			folio_mark_uptodate(folio);
+	}
 	BUG_ON(folio_test_swapcache(folio));
 
 	if (filemap_dirty_folio(mapping, folio)) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 963cd2cdf7ba..6db23a3c25a9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4454,6 +4454,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				struct writeback_control *wbc,
 				enum iostat_type io_type,
 				int compr_blocks, bool allow_balance);
+bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
 void f2fs_write_failed(struct inode *inode, loff_t to);
 void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool f2fs_release_folio(struct folio *folio, gfp_t wait);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1ff505e4ba11..e53cdb4467b4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5424,9 +5424,20 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 			return ret;
 	}
 
-	/* Do not preallocate blocks that will be written partially in 4KB. */
-	map.m_lblk = F2FS_BLK_ALIGN(sbi, pos);
-	map.m_len = F2FS_BYTES_TO_BLK(sbi, pos + count);
+	if (!dio && mapping_large_folio_support(inode->i_mapping)) {
+		/*
+		 * Preallocate all blocks touched by a large-folio buffered write so
+		 * the regular write_begin path does not need to unlock the folio for
+		 * f2fs_balance_fs().  Rechecking large-folio state after unlock is
+		 * unreliable since partial truncation can split the folio.
+		 */
+		map.m_lblk = F2FS_BYTES_TO_BLK(sbi, pos);
+		map.m_len = F2FS_BLK_ALIGN(sbi, pos + count);
+	} else {
+		/* Do not preallocate blocks that will be written partially in 4KB. */
+		map.m_lblk = F2FS_BLK_ALIGN(sbi, pos);
+		map.m_len = F2FS_BYTES_TO_BLK(sbi, pos + count);
+	}
 	if (map.m_len > map.m_lblk)
 		map.m_len -= map.m_lblk;
 	else
-- 
2.43.0

