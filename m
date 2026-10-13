Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CC24F7CC7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892639; cv=none; b=YCqil7SXWWJWpoOWEtpPo7WjgM6nUtVJtkWbpcMd+5NfLhM0yNCDZXxR6HZoS15Ll1mjTEEPQGT9m6QypDfm94wJvWFG0Uewr5NBdyn2S9yOjBLsGJOWG9hbjcPqjyyXF4yOx4s+bHGsmHbgCdc56b+fB6G4V1j9fbPdlJAjmN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892639; c=relaxed/simple;
	bh=RGUdJev9pWsq+UGZcitYUHfc22yNV24BofK127tveAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JuDZVVWGhNOWr2tkvNaeWVw7eFAAZ/Qq76dvDPwMCFblrlQi8QHsa3pcbXZaLeYTqlZMxe8W+gc1/m3khBI8KNRALFoHPf1KNbUpLgpMUPc4V2ca5bEO/s0kK7nKATFGAkW5lK479Ol8LDB8r6S5LliBLgKVbBd5Hq5CUe3KFdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lW7XL8y4; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lW7XL8y4"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4821449so986907a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892637; x=1792497437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9gsvnTnLcZq00lA5Q+EX6jNuiTQD9wMpA8dz28l3ns=;
        b=lW7XL8y4dHrle1zzOHQiEH5FBsyze+Sz2YROXOyqPMI7vyxj2WqVIBeka1QDVhmapI
         zZTqEofHtMyrGikhaxeeLnzsRRFUcrjM2O5XvrAoyNKKe3XuwBsMhgLc3TdUj3ClLHV6
         Z4TYghlcGlhGkA92dL8R2pqZ0QArezZb7YdpvK6TWpZlEAQhO4zBonogeW8LL4v3tOT6
         rfAS1dHNWWAiLikUx17N3WxV3nJEDnZMm50IVLOjG/+mcaXdVfvcbMw4TLOt+MYPHAI2
         Ng8LqObT4Uw3vfZ5Rof+eMTf+Wj7xOBmVsmWWy7b53GFLe2x6OiikA/bjkAO6vhi6pZg
         1ArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892637; x=1792497437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s9gsvnTnLcZq00lA5Q+EX6jNuiTQD9wMpA8dz28l3ns=;
        b=h5Ih2zmKUWN9hyL1JTrkF3iYpAXM0xHlOBoZkgaq6MX+MCC3XjEiIKzQrVz7B2IeDr
         9Q4Ba7QBR1VNmYua0ooTprFHpV9j0vfWKn5JulVXksn6Zk0NUom/MBRjZ2oQyD3jxW9K
         cpSqCRMgB21m5WAg3rp2QXaM04LeqgnhGHT6l1wIj2ZHcIVqw13Yef1wa2Zepn86fUBD
         us/N3cE/3w1Si1Trr9qg2oC/wyfngZ89oSut6+kKahd4Fl+fGZ/m4uPdmlTcsR3hLFT0
         b/ldmFUr9KoNx7vABya5PiFmzUXFkVeVnRAMjjJuyU9v6pCoVGjQnmYM2IX/12qXS68R
         Dc4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzJiKTREvPdroBME+jifalpB893+OXXzNGCscgDy2zdmOmv1HsowlgZ4h4SIm3bEbFcq4AcBZR3/bN9myk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJK6Fv5VPUiBqC6VC8c+kcqQS90XAn36Y3QAogHK79brg1z6gp2
	NznNxhRjnMCx8ISDFb5LgHC3NQEiQ0oksOgATULi69L5FHZgsumqm4IQ
X-Gm-Gg: AYBFou3clU7hLG6aBzkyGn4kxXqutAO8FqFk+AdRzqGg/f4qvsKQPiCqgrz42cuzRNc
	tyOe5wJZGfZY+xN5J/HlBtgmKxb0YtY+TgH2X5T77zSIZaAC3xS8Tdo1MYC3qY2xx5tNoWk1LKw
	bUPCbM5z5GCQR8sgQN8LDot5Bqh13QlAkY/YRAeC3GeqwyAVtZcR8JnQvLvpStxKyppJ9Qd4THq
	9+MqeuOBeipSwpf2VKcjeG5JWtUigZlVd0Lzunnf+07n6J20KY5kkr1eNURPhtUQHZZJaibf9bB
	Jxcx/dS0MDKdy+A+RjrosavbYJ2V1G3f9Cm4AXKaGgdHrgls+UK0r7ldf7NBQAx3CPZodx6CPy4
	dviUS+wiXCUHxrkwXBjnDDBzY08ewyd5V+K0yM8YGZHB0kHF5AKO/nmodli3smQxEYwd+gfOjFx
	GqDEBKslCHkOCh1i7pYZtZoXyzWVx5197LzmMGPuQQ3v6U2RCSgVoCLLb/ZWznXSWlBy7l7Goy0
	IT5bU8brVLtkdpoTS0r7Czn+7zd6NSPBZ15
X-Received: by 2002:a17:90b:3c07:b0:3ab:1a24:56e4 with SMTP id 98e67ed59e1d1-3ab3aca1257mr9173351a91.30.1791892637395;
        Tue, 13 Oct 2026 04:57:17 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm21248516a91.13.2026.10.13.04.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:57:16 -0700 (PDT)
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
Subject: [PATCH v4 10/18] f2fs: make GC migration large-folio aware
Date: Tue, 13 Oct 2026 19:56:13 +0800
Message-ID: <20261013115621.968742-11-nzzhao.sigma@gmail.com>
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
 fs/f2fs/data.c | 71 ++++++++++++++++++++++++++++++++------------------
 fs/f2fs/f2fs.h |  1 +
 fs/f2fs/gc.c   | 36 ++++++++++++++++++++++---
 3 files changed, 79 insertions(+), 29 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d158c343f..4484f65fd 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1455,19 +1455,26 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode,
 
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
 
 	/* wait for GCed page writeback via generic cache */
 	f2fs_wait_on_block_writeback(inode, blkaddr);
 
-	if (!bio_add_folio(bio, folio, PAGE_SIZE, 0))
+	if (!bio_add_folio(bio, folio, PAGE_SIZE, offset))
 		f2fs_bug_on(sbi, 1);
 
 	inc_cache_count(sbi, F2FS_RD_DATA);
@@ -1609,20 +1616,16 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
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
@@ -1658,7 +1661,7 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 		goto put_err;
 	}
 got_it:
-	if (folio_test_uptodate(folio)) {
+	if (f2fs_ffs_test_blk_uptodate(folio, index)) {
 		folio_unlock(folio);
 		return folio;
 	}
@@ -1671,15 +1674,17 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
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
@@ -1696,7 +1701,7 @@ struct folio *f2fs_find_data_folio(struct inode *inode, pgoff_t index,
 	folio = f2fs_filemap_get_folio(mapping, index, FGP_ACCESSED, 0);
 	if (IS_ERR(folio))
 		goto read;
-	if (folio_test_uptodate(folio))
+	if (f2fs_ffs_test_blk_uptodate(folio, index))
 		return folio;
 	f2fs_folio_put(folio, false);
 
@@ -1705,11 +1710,11 @@ struct folio *f2fs_find_data_folio(struct inode *inode, pgoff_t index,
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
@@ -1733,7 +1738,8 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 
 	/* wait for read completion */
 	folio_lock(folio);
-	if (unlikely(folio->mapping != mapping || !folio_test_uptodate(folio))) {
+	if (unlikely(folio->mapping != mapping ||
+		    !f2fs_ffs_test_blk_uptodate(folio, index))) {
 		f2fs_folio_put(folio, true);
 		return ERR_PTR(-EIO);
 	}
@@ -2913,6 +2919,22 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
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
+	ffs = (struct f2fs_folio_state *)folio->private;
+	nr_subpages = folio_nr_pages(folio);
+	idx = index - folio->index;
+	return test_bit(nr_subpages + idx, ffs->state);
+}
+
 static unsigned int __ffs_mark_subrange_dirty(struct folio *folio,
 			struct f2fs_folio_state *ffs, size_t offset, size_t len)
 {
@@ -3006,7 +3028,6 @@ bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
 
 	return dirty;
 }
-
 static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state *ffs,
 			const struct folio *folio, unsigned int start,
 			unsigned int end)
@@ -5115,7 +5136,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 		 */
 		f2fs_submit_page_read(inode,
 				      NULL, /* can't write to fsverity files */
-				      folio, blkaddr, 0, true);
+				      folio, index, blkaddr, 0, true);
 
 		folio_lock(folio);
 		if (unlikely(folio->mapping != mapping)) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 876339eb2..c98607017 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4471,6 +4471,7 @@ struct f2fs_folio_state *f2fs_ffs_alloc(struct f2fs_sb_info *sbi,
 					struct folio *folio);
 void f2fs_ffs_attach(struct folio *folio, struct f2fs_folio_state *ffs);
 struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio);
+bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index);
 void f2fs_ffs_mark_subrange_dirty(struct folio *folio, size_t offset, size_t len);
 bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
 					    size_t len);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index d7fae1890..5bb117e5e 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1512,12 +1512,19 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
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
@@ -1532,6 +1539,8 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			err = -EAGAIN;
 			goto out;
 		}
+		if (large)
+			f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
 		folio_mark_dirty(folio);
 		folio_set_f2fs_gcing(folio);
 	} else {
@@ -1544,32 +1553,51 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
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
 		f2fs_folio_wait_writeback(folio, true, true);
 
+		if (large) {
+			ffs = (struct f2fs_folio_state *)folio->private;
+			f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
+		}
 		folio_mark_dirty(folio);
 		if (folio_clear_dirty_for_io(folio)) {
-			inode_dec_dirty_block(inode);
-			f2fs_remove_dirty_inode(inode);
+			if (!large) {
+				inode_dec_dirty_block(inode);
+				f2fs_remove_dirty_inode(inode);
+			} else if (f2fs_ffs_clear_subrange_dirty_and_test(folio,
+							foff, PAGE_SIZE)) {
+				folio_mark_dirty(folio);
+			}
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
-- 
2.43.0

