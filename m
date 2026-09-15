Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B1A2E2665
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789445998; cv=none; b=IXgM6JpC9udG05v02aBKPxlr6gyNMl+TVSmJSFqJ9ZWVeccHucmcLL2WGZwbRJ2umwk9/e8qw45j3QlxrVE25ZomFfPZXL01nL/wEA+/pPAuClR5b9is0JA13+j1TZwMQMmR0kA39jLytmFk7lLqDhVmQWgYy3IHP8H+Wu6AO0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789445998; c=relaxed/simple;
	bh=6Ce73nvdYYa65NgUDIFSu6Y4p67i74X+bPvVHyDmCuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLVmilgiuGOEqoh5axyMzNz9CBYi8z6R0oFNe92ECYc6Vvm1pjYzEtkpBMvpg2pobWrlIeBfh3BEe5n0wmo4ZDL0y9RhnIlFkZom9mzIS468MHY+q4K2t+FWCK5DkpGm03XdqbLimcjCGMHA45KEhaREg//zSkCFBa6C7nHb390=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=nDItdpZ2; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="nDItdpZ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=De
	OCd2h208uK1PYoGe91k/+tE0iG3xiMqrnXEBxLGoA=; b=nDItdpZ2gY3tkibnzL
	8VOcQRG0rALZmtHCyTfD1Mn5/3dYCFD/3hEoP/GL27ekdMG8Ax3oH/qwedJ4Puwh
	kaETytQykHHN+NgjbBjjxbIGZ5BJnAq5XD7VbBG6Lbhm5B92NcBTJ3P1xenHaNqk
	kbL630GB+BGYjH2egyQDU/a4A=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgDXreo9x6hq3jBvHw--.36918S9;
	Tue, 15 Sep 2026 12:19:16 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Subject: [PATCH v2 07/14] f2fs: make GC migration large-folio aware
Date: Tue, 15 Sep 2026 12:19:02 +0800
Message-ID: <20260915041909.2903887-8-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PikvCgDXreo9x6hq3jBvHw--.36918S9
X-Coremail-Antispam: 1Uf129KBjvJXoW3Kr4DCrWUAry3XF4UJF1xAFb_yoWDuw4xpF
	WUGF98KrWkJF1xWrn7tFn8Zr1Fk34fXr4UuFWxG34ft3WYqwn5KF18t34YyF1ftrW8A3Z2
	qF4jka4UWF4UJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UShFsUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBogXHl2qox0UMQwAA34

GC can operate on a 4K block that is cached inside a large folio.
The data lookup helpers therefore need to test and update uptodate
state for the addressed subpage instead of rejecting large folios or
treating the whole folio as the target block.

Let f2fs_get_read_data_folio(), f2fs_find_data_folio(), and
f2fs_get_lock_data_folio() to use subpage uptodate state. Submit
single-block reads at the requested folio offset and zero only the
addressed 4K range for NEW_ADDR.

Also update `move_data_page` to mark, clear, and restore dirty
state for the target subpage, and submit write I/O with the subpage
offset recorded in f2fs_io_info.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c    | 75 ++++++++++++++++++++++++++++++-----------------
 fs/f2fs/f2fs.h    |  1 +
 fs/f2fs/gc.c      | 30 +++++++++++++++++--
 fs/f2fs/segment.c |  2 +-
 4 files changed, 78 insertions(+), 30 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 1f9c99689f38..287d83debf95 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1226,19 +1226,26 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode,
 
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
 
-	bio = f2fs_grab_read_bio(inode, vi, blkaddr, 1, op_flags, folio->index,
+	if (f2fs_folio_has_ffs(folio)) {
+		offset = offset_in_folio(folio, (loff_t)index << PAGE_SHIFT);
+		f2fs_update_read_folio_pending(folio, 1);
+	}
+
+	bio = f2fs_grab_read_bio(inode, vi, blkaddr, 1, op_flags, index,
 				 for_write);
 
 	/* wait for GCed page writeback via META_MAPPING */
 	f2fs_wait_on_block_writeback(inode, blkaddr);
 
-	if (!bio_add_folio(bio, folio, PAGE_SIZE, 0))
+	if (!bio_add_folio(bio, folio, PAGE_SIZE, offset))
 		f2fs_bug_on(sbi, 1);
 
 	inc_page_count(sbi, F2FS_RD_DATA);
@@ -1379,20 +1386,16 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 	struct dnode_of_data dn;
 	struct folio *folio;
 	int err;
-retry:
+
 	folio = f2fs_grab_cache_folio(mapping, index, for_write);
 	if (IS_ERR(folio))
 		return folio;
 
 	if (folio_test_large(folio)) {
-		pgoff_t folio_index = mapping_align_index(mapping, index);
-		unsigned long nr_pages = folio_nr_pages(folio);
-
-		f2fs_folio_put(folio, true);
-		invalidate_inode_pages2_range(mapping, folio_index,
-				folio_index + nr_pages - 1);
-		f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
-		goto retry;
+		if (!f2fs_ffs_find_or_alloc(folio)) {
+			err = -ENOMEM;
+			goto put_err;
+		}
 	}
 
 	if (f2fs_lookup_read_extent_cache_block(inode, index,
@@ -1428,7 +1431,7 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 		goto put_err;
 	}
 got_it:
-	if (folio_test_uptodate(folio)) {
+	if (f2fs_ffs_test_blk_uptodate(folio, index)) {
 		folio_unlock(folio);
 		return folio;
 	}
@@ -1441,15 +1444,17 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 	 * f2fs_init_inode_metadata.
 	 */
 	if (dn.data_blkaddr == NEW_ADDR) {
-		folio_zero_segment(folio, 0, folio_size(folio));
-		if (!folio_test_uptodate(folio))
-			folio_mark_uptodate(folio);
+		size_t offset = offset_in_folio(folio,
+						(loff_t)index << PAGE_SHIFT);
+
+		folio_zero_segment(folio, offset, offset + PAGE_SIZE);
+		f2fs_ffs_mark_subrange_uptodate(folio, offset, PAGE_SIZE);
 		folio_unlock(folio);
 		return folio;
 	}
 
-	f2fs_submit_page_read(inode, f2fs_need_verity(inode, folio->index),
-			      folio, dn.data_blkaddr, op_flags, for_write);
+	f2fs_submit_page_read(inode, f2fs_need_verity(inode, index),
+			      folio, index, dn.data_blkaddr, op_flags, for_write);
 	return folio;
 
 put_err:
@@ -1466,7 +1471,7 @@ struct folio *f2fs_find_data_folio(struct inode *inode, pgoff_t index,
 	folio = f2fs_filemap_get_folio(mapping, index, FGP_ACCESSED, 0);
 	if (IS_ERR(folio))
 		goto read;
-	if (folio_test_uptodate(folio))
+	if (f2fs_ffs_test_blk_uptodate(folio, index))
 		return folio;
 	f2fs_folio_put(folio, false);
 
@@ -1475,11 +1480,11 @@ struct folio *f2fs_find_data_folio(struct inode *inode, pgoff_t index,
 	if (IS_ERR(folio))
 		return folio;
 
-	if (folio_test_uptodate(folio))
+	if (f2fs_ffs_test_blk_uptodate(folio, index))
 		return folio;
 
 	folio_wait_locked(folio);
-	if (unlikely(!folio_test_uptodate(folio))) {
+	if (unlikely(!f2fs_ffs_test_blk_uptodate(folio, index))) {
 		f2fs_folio_put(folio, false);
 		return ERR_PTR(-EIO);
 	}
@@ -1503,7 +1508,8 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 
 	/* wait for read completion */
 	folio_lock(folio);
-	if (unlikely(folio->mapping != mapping || !folio_test_uptodate(folio))) {
+	if (unlikely(folio->mapping != mapping ||
+		    !f2fs_ffs_test_blk_uptodate(folio, index))) {
 		f2fs_folio_put(folio, true);
 		return ERR_PTR(-EIO);
 	}
@@ -2667,6 +2673,22 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
 		folio_mark_uptodate(folio);
 }
 
+bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int idx, nr_subpages;
+
+	f2fs_bug_on(F2FS_F_SB(folio), !folio_contains(folio, index));
+
+	if (!f2fs_folio_has_ffs(folio))
+		return folio_test_dirty(folio);
+
+	ffs = folio->private;
+	nr_subpages = folio_nr_pages(folio);
+	idx = index - folio->index;
+	return test_bit(nr_subpages + idx, ffs->state);
+}
+
 void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
 				    size_t offset, size_t len)
 {
@@ -2724,14 +2746,13 @@ bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
 	if (!f2fs_folio_has_ffs(folio))
 		return false;
 
-	ffs = (struct f2fs_folio_state *)folio->private;
+	ffs = folio->private;
 	spin_lock_irqsave(&ffs->state_lock, flags);
 	dirty = __ffs_clear_subrange_dirty(folio, ffs, offset, len);
 	spin_unlock_irqrestore(&ffs->state_lock, flags);
 
 	return dirty;
 }
-
 static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state *ffs,
 			const struct folio *folio, unsigned int start,
 			unsigned int end)
@@ -3225,7 +3246,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 		return true;
 
 	if (fio) {
-		if (page_private_gcing(fio->page))
+		if (folio_test_f2fs_gcing(fio->folio))
 			return true;
 		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
 			f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
@@ -4781,7 +4802,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 		 */
 		f2fs_submit_page_read(inode,
 				      NULL, /* can't write to fsverity files */
-				      folio, blkaddr, 0, true);
+				      folio, index, blkaddr, 0, true);
 
 		folio_lock(folio);
 		if (unlikely(folio->mapping != mapping)) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f48e2627d90a..6be08e45341c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4394,6 +4394,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				int compr_blocks, bool allow_balance);
 bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
 struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio);
+bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index);
 void f2fs_ffs_mark_subrange_dirty(struct folio *folio, size_t offset, size_t len);
 bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
 					    size_t len);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 16fce62740d7..147836f1155f 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1509,12 +1509,19 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 						unsigned int segno, int off)
 {
 	struct folio *folio;
+	size_t foff = 0;
+	bool large = false;
 	int err = 0;
 
 	folio = f2fs_get_lock_data_folio(inode, bidx, true);
 	if (IS_ERR(folio))
 		return PTR_ERR(folio);
 
+	if (f2fs_folio_has_ffs(folio)) {
+		large = true;
+		foff = offset_in_folio(folio, (loff_t)bidx << PAGE_SHIFT);
+	}
+
 	if (!check_valid_map(F2FS_I_SB(inode), segno, off)) {
 		err = -ENOENT;
 		goto out;
@@ -1529,6 +1536,8 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			err = -EAGAIN;
 			goto out;
 		}
+		if (large)
+			f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
 		folio_mark_dirty(folio);
 		folio_set_f2fs_gcing(folio);
 	} else {
@@ -1541,32 +1550,49 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			.op_flags = REQ_SYNC,
 			.old_blkaddr = NULL_ADDR,
 			.folio = folio,
+			.folio_offset = bidx - folio->index,
+			.folio_blkcnt = 1,
 			.encrypted_page = NULL,
 			.need_lock = LOCK_REQ,
 			.io_type = FS_GC_DATA_IO,
 		};
-		bool is_dirty = folio_test_dirty(folio);
+		struct f2fs_folio_state *ffs = NULL;
+		bool is_dirty = f2fs_ffs_test_blk_dirty(folio, bidx);
 
 retry:
 		f2fs_folio_wait_writeback(folio, DATA, true, true);
 
+		if (large) {
+			ffs = folio->private;
+			f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
+		}
 		folio_mark_dirty(folio);
 		if (folio_clear_dirty_for_io(folio)) {
 			inode_dec_dirty_pages(inode);
 			f2fs_remove_dirty_inode(inode);
+			if (large &&
+			    f2fs_ffs_clear_subrange_dirty_and_test(folio, foff, PAGE_SIZE))
+				folio_mark_dirty(folio);
 		}
 
+		if (large)
+			atomic_inc(&ffs->write_pages_pending);
 		folio_set_f2fs_gcing(folio);
 
 		err = f2fs_do_write_data_page(&fio);
 		if (err) {
 			folio_clear_f2fs_gcing(folio);
+			if (large)
+				atomic_dec(&ffs->write_pages_pending);
 			if (err == -ENOMEM) {
 				memalloc_retry_wait(GFP_NOFS);
 				goto retry;
 			}
-			if (is_dirty)
+			if (is_dirty) {
+				if (large)
+					f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
 				folio_mark_dirty(folio);
+			}
 		}
 	}
 out:
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 644ddfb984c9..a81cc8c5c34a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3860,7 +3860,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 		if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
 			return CURSEG_COLD_DATA_PINNED;
 
-		if (page_private_gcing(fio->page)) {
+		if (folio_test_f2fs_gcing(fio->folio)) {
 			if (fio->sbi->am.atgc_enabled &&
 				(fio->io_type == FS_DATA_IO) &&
 				(fio->sbi->gc_mode != GC_URGENT_HIGH) &&
-- 
2.43.0

