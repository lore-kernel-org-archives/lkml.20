Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB824F30CE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563368; cv=none; b=DX5XJ/jCGPNDLYzrznkOmSqoQ3mJ3Le/MnqLiJ6J+qxWmi97h+6hjU0zCxha5jqWeEe0A/xxN5kYkRraExE8GFjigF5Rv3KJWqzWRgvNDav2dem6QSQfbowtQls6QwTWGJm/gofRquVlqrm5s0HD8vFJjMLXpTmxaz3mVnniMIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563368; c=relaxed/simple;
	bh=2xVQ0sWwrSN92AseOFcLX2QIvKywmDiELJ6zxo5Vz7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVpnaCW0048AMyWhUJouYysoISy6r1CqC8ORiZPZMj5K3XScQNTsJlFHNeQ6I2/4vjdDROdStpz3oUOGoDEcF9iQCU3QZWLUVuKxlPD3VFIGGGJo1LSwHIHSJyfJx5+i6YkjycpKF/yucPafBVHXIALx9hQUE8tpV8V7x0jXX64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=dmzp4MxL; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="dmzp4MxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=R/
	8fjZ1tbecRkCn6eLp605xNHPOeT45L2LuYqMwzJIs=; b=dmzp4MxL6vnywiXgEa
	+qzUqFBm/qy7DwAyykqVzAJuwkSz+vAfuSfIVHHBYUtxOSfsJq/nVGYa56RV27kQ
	9gnCONEKVtGJog9rMhST154zfmvveACF3oldBFaDj/a+e0x7Z6hCrx/Bk3QxbUL4
	YH2pX9zdVbMBYoum30aOuCR8o=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgDH3_w0FslqWTz5BA--.13078S3;
	Sat, 10 Oct 2026 00:28:40 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>,
	Barry Song <baohua@kernel.org>,
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
Subject: [PATCH v3 12/17] f2fs: handle partial truncate of large folio dirty subpages
Date: Sat, 10 Oct 2026 00:28:23 +0800
Message-ID: <20261009162828.4188050-2-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
References: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PikvCgDH3_w0FslqWTz5BA--.13078S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3Wr4rGFyDuF1ftw13Aw4fXwb_yoWxXr4DpF
	WUGrn8Gr4DJ3Zrur1fXFn8Xw1Sk3s7XrWxCayxG34fJ3WYq3s3KF4kt34FkFs5Jry8AF4f
	Xr4Utay5WF4UtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjLvNUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBoxmgcGrJFjkH6gAA3L

A large folio can be partial truncated and stays in folio mapping, we
need to clear the subrange dirty bits and uptodate bits that the partial
truncate covers. If this partial truncate happens to clear the last
subrange dirty bits, then cancel the whole folio dirty state.

Also add a guard in f2fs_write_single_data_folio() so a large folio
subpage whose disk block was already truncated (NULL_ADDR) is skipped

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 115 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 109 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 21c43019167a..138a77044e95 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -329,6 +329,27 @@ static void f2fs_read_end_io(struct bio *bio)
 	f2fs_verify_and_finish_bio(bio, intask);
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
 static void f2fs_write_end_bio(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi = bio->bi_private;
@@ -380,7 +401,8 @@ static void f2fs_write_end_bio(struct bio *bio)
 			wake_up(&sbi->cp_wait);
 
 		if (finished) {
-			folio_clear_f2fs_gcing(folio);
+			if (!f2fs_ffs_has_dirty_subpage(folio))
+				folio_clear_f2fs_gcing(folio);
 			folio_end_writeback(folio);
 		}
 	}
@@ -2893,6 +2915,29 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
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
 bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index)
 {
 	struct f2fs_folio_state *ffs;
@@ -3771,12 +3816,35 @@ static int f2fs_write_folio_dirty_range(struct folio *folio, int *submitted,
 
 		err = f2fs_get_dnode_of_data(&dn, data_idx, LOOKUP_NODE);
 
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
+			/* Original inode has no block, handled as truncated below */
+			if (err == -ENOENT)
+				err = 0;
+		}
 		if (err)
 			goto block_done;
 		dn_held = true;
 
 		fio.old_blkaddr = dn.data_blkaddr;
 
+		/* This page is already truncated */
+		if (fio.old_blkaddr == NULL_ADDR) {
+			ffs_clear_subrange_uptodate(folio,
+					(unsigned long long)i << PAGE_SHIFT,
+					PAGE_SIZE);
+			goto block_done;
+		}
+
 got_it:
 		if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
 		    !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
@@ -4325,6 +4393,7 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 		bool verity_in_progress;
 		int folio_submitted = 0;
 		bool bias_added = false;
+		bool dirty;
 
 		submitted = 0;
 		next = true;
@@ -4432,15 +4501,19 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 		 * partially written back), the folio must stay dirty so that
 		 * the remaining subranges are written back later.
 		 */
-		if (f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
-					(err ? pos : end_pos) - folio_pos(folio)))
+		dirty = f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
+					(err ? pos : end_pos) - folio_pos(folio));
+		if (dirty)
 			folio_redirty_for_writepage(wbc, folio);
 		else if (!f2fs_folio_has_ffs(folio))
 			inode_dec_dirty_pages(inode);
 
 		if (bias_added) {
-			if (atomic_dec_and_test(&ffs->write_pages_pending))
+			if (atomic_dec_and_test(&ffs->write_pages_pending)) {
+				if (!dirty)
+					folio_clear_f2fs_gcing(folio);
 				folio_end_writeback(folio);
+			}
 		} else if (!folio_submitted && folio_test_writeback(folio)) {
 			folio_end_writeback(folio);
 		}
@@ -5243,10 +5316,40 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
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
 		inode_dec_dirty_pages(inode);
 		f2fs_remove_dirty_inode(inode);
 	}
-- 
2.43.0

