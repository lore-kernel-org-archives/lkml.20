Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BB74F93AD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892653; cv=none; b=YWKZIE8ABv0PgCDm3Eb7xOM+V2Ti5XL8m/DqX06SmH9CJOro59y70hTSJQhDJxBPPEUKk7VpBtQKcq+Jf/Xo43FuxtDlO3Ihy/nbXYBuuQemEJwNHfJ1jD2wZLPaMDZVXySpz2CVPxj0eA6oood1Fn6fYos+dEmde7nI6glKPwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892653; c=relaxed/simple;
	bh=AHw6Bf13raUR4J91CWzBLYaYoTidZP9qEYsmTEI5MNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUkgMLEk1wGi0YdS1IS8MzNGrneytTJP2EOsV5rTPUx1jaHDXna5u8RZU85/KASihV0Kj0vZGnzBPRBn8TaT+4TT9d+XuC6VeMAqQcrpFCfWUTu2fSZBTf7na3U5ulGAbg4Dg1WO4vGsD5QalE+xcZAQbSu+lz/e+sRNJGnbuBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLzC1pYP; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLzC1pYP"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso1376571a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892651; x=1792497451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCytcjZSgMUY384rNP4MPOBmVD1ndl+qrXFK7w2nFwg=;
        b=LLzC1pYPomY+k0uj2DzCdEDV/HAravoWqXYx7XKa/F/Lc+wXm9DH7n37qGsLijcTrQ
         1xOeQYIcHbeG2eSMlRykCQyMy//8ZK7TWZiOV4mhP5JLVQ0GU5x6bvRwe8BZVXT0IBTq
         cDYP/aq5k+2c8Z6v35gAG0xgvWWCHukvPrrE6NGmvAOrjy6qIPriue2bd+VQWXyMLjRU
         3GBWRQmGoBvyXhRbHMueQj629vpaOFYNZ4vjNQwjuhMb6YkNMl/xcnOFoBIME2NvhElu
         QWTFq/DupuoacFzzDWMhAhTuwozBGwth42w51PtslPv6ykePQl0UE8DLpOHPtIITI1+V
         lMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892651; x=1792497451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PCytcjZSgMUY384rNP4MPOBmVD1ndl+qrXFK7w2nFwg=;
        b=ecestOPBOF7rBQehw3drsbAFJTUkR3CWufVJPSOJy9zp97QfOv8v5QZnI+o3UUwUwk
         RYlPF3bLiP5epm/XynnBoWNPdbss2k9BVRmIg1Q5+EY+p3DqYONUQ/hIhgWRhgh6jqJu
         2EIbv2scQqHVQgd8jNKGXqVp5Z6GyNmBeYKzTfhfnaZMv6ww30GtkeQNd/hFjSx2A9dI
         BHFvqCea1sijS1x/zEmWRuij7f69cPCQNZHhNRUkuJGl0mzSgL6MW+MaCH1fPrD84tN4
         oyZ52tfJyeG6rleiuUnr3MWDwYcJLUGMN5lMIWlxHNxXTYo5C70DBMx1BFkuB4LnRdhx
         06yg==
X-Forwarded-Encrypted: i=1; AKwUvBwBjr7SeEDHG0i/jrf4fS8jgzTBFcoUIqlsOz5zHudjYa03OPn7/K5pYdAjgeIQYqJaZS1qEoKfP0R0jLo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKH154+V9zi2A9q3GvARGWO2Q1h4XG4+itXJ3N+WhtB6gnFxJ2
	v7s0WFPkMWTeDYywp57yjeqDgbJcbeHG4GdTvBFHa18Q3Oc/PaXqSTtF
X-Gm-Gg: AYBFou1e/mmHFoN/s9tYFDNp4WNQRD5JS6ID1tYx5/k2FMKJSNfNNcLxrsnkF0p7x3p
	S3t1De5n0OvNuF4qmgknqyt3Ltfvq/Ca6ri8USTSFqm65m57N4CxHdsyo16S8tGW9lL2TJ07QJb
	wVggXjj+PWrzZk5LjSdl7tCxrRwyfoQQPxV3JZCzEetoG2Onn8HWmp4F/ficeaZRQGfn3M1E4CU
	g6OpxljKwwYaOq/hs3qORjQKWwzZCl5xfqDbb5ylKf/7oBhcLZl1qxQiupKviWAQ5ftEuo9Txks
	A8i7IU6++ZEyOWi57fHjsrbhC9xKIj+XWIYjsrF/63ysmkqhMrqcVs5N4zBsKHHqyyyxkDNizbl
	XaA6E0+SHH8mZg+q3tuIVZ9KEOvjGyWU/mAqNuGMQVyZ1NBjv/HcVnryIEcxty6H5MzcC2uclCg
	EgCkKawPHGq7UvBha0woK5lF0S/9PJ4xdpioafFlbo530HRD1petPcdSkxmqJc9onJ+9hmH6QVw
	4p6zCFWXwqyhjSUpLZrFwb0+hI2IFdb6rzm
X-Received: by 2002:a17:90b:2886:b0:39e:6c6a:6577 with SMTP id 98e67ed59e1d1-3ab3a966524mr10308058a91.58.1791892650937;
        Tue, 13 Oct 2026 04:57:30 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm21248516a91.13.2026.10.13.04.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:57:30 -0700 (PDT)
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
Subject: [PATCH v4 13/18] f2fs: handle partial truncate of large folio dirty subpages
Date: Tue, 13 Oct 2026 19:56:16 +0800
Message-ID: <20261013115621.968742-14-nzzhao.sigma@gmail.com>
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

A large folio can be partial truncated and stays in folio mapping, we
need to clear the subrange dirty bits and uptodate bits that the partial
truncate covers. If this partial truncate happens to clear the last
subrange dirty bits, then cancel the whole folio dirty state.

Also add a guard in f2fs_write_folio_dirty_range() so a large folio
subpage whose disk block was already truncated (NULL_ADDR) is skipped

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 128 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 122 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0c4c41871..61fe4a0c5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -328,6 +328,27 @@ static void f2fs_read_end_io(struct bio *bio)
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
@@ -379,7 +400,8 @@ static void f2fs_write_end_bio(struct bio *bio)
 			wake_up(&sbi->cp_wait);
 
 		if (finished) {
-			folio_clear_f2fs_gcing(folio);
+			if (!f2fs_ffs_has_dirty_subpage(folio))
+				folio_clear_f2fs_gcing(folio);
 			folio_end_writeback(folio);
 		}
 	}
@@ -2923,6 +2945,40 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
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
+static void f2fs_clear_truncated_page_state(struct folio *folio, pgoff_t i)
+{
+	if (f2fs_folio_has_ffs(folio)) {
+		ffs_clear_subrange_uptodate(folio,
+				(loff_t)i << PAGE_SHIFT, PAGE_SIZE);
+	} else {
+		folio_clear_uptodate(folio);
+		folio_clear_f2fs_gcing(folio);
+	}
+}
+
 bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index)
 {
 	struct f2fs_folio_state *ffs;
@@ -3807,12 +3863,31 @@ static int f2fs_write_folio_dirty_range(struct folio *folio, int *submitted,
 		}
 
 		err = f2fs_get_dnode_of_data(&dn, data_idx, LOOKUP_NODE);
-		if (err)
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
+		}
+		if (err && err != -ENOENT)
 			goto block_done;
 		dn_held = true;
 
 		fio.old_blkaddr = dn.data_blkaddr;
 
+		/* This page is already truncated */
+		if (err == -ENOENT || fio.old_blkaddr == NULL_ADDR) {
+			f2fs_clear_truncated_page_state(folio, i);
+			err = 0;
+			goto block_done;
+		}
+
 got_it:
 		if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
 		    !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
@@ -4360,6 +4435,7 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 		bool verity_in_progress;
 		int folio_submitted = 0;
 		bool bias_added = false;
+		bool dirty;
 
 		submitted = 0;
 		retry = false;
@@ -4481,8 +4557,9 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
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
 			inode_dec_dirty_block(inode);
@@ -4493,6 +4570,14 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 		 */
 		if (bias_added &&
 		    atomic_dec_and_test(&ffs->write_pages_pending)) {
+			/*
+			 * For a large folio we clear PAGE_PRIVATE_GCING only
+			 * when the last dirty bit is cleared, otherwise the
+			 * remaining subpages are no longer written back as
+			 * checkpoint-guaranteed data (f2fs_is_cp_guaranteed()).
+			 */
+			if (!dirty)
+				folio_clear_f2fs_gcing(folio);
 			folio_end_writeback(folio);
 		} else if (!folio_submitted && folio_test_writeback(folio)) {
 			/*
@@ -5310,10 +5395,41 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
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
+		folio_clear_uptodate(folio);
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
 		inode_dec_dirty_block(inode);
 		f2fs_remove_dirty_inode(inode);
 	}
-- 
2.43.0

