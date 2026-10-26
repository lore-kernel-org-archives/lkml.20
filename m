Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985911;
	b=nYr/zuc8ZMkbW27VU3EDDMgwz/4NafCN6IFCfxC2b1YWPuJUOLUHL8wqZa5lSVQUSLcs
	 gcAyoTPNL+7L/mSHKLnaiEQOLQmOhD0/lC5QfWqEpGYEPVoEsVsdjFtFqhFyO4JkEKJU/
	 8S1MkB2bs2Eg1QSLxkFowr68obvCUofxdcaUW9Ds7hNyRjM4R0Qbn5XHOqhyEccwgxgJx
	 2gFW1POCwNKnTVUM91J5n5LKeLBgm2qAV7u73bCLr3Q8JyqatxHLeEWgsejyp7hZOVZrt
	 DklIWcI8cTxTaI6Wp1y3BVNjGs1mnZy6vFcA61mUuFRgA2zBldgKBNV479p4cFleMbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7oDoEqU57PNNhoXy/np/pZwkE7ArsywdT3eDblPhuWE=;
	b=z5NHbUZMK47FSjZGBr4Nmo97jjXzDTN1RoA/zwmtG7G/ON4ciykq5aF5CIhHLSoai17w
	 e8ZML4VGyymgUgHBk4PEjdg06sUNQkcWF2xXEb1LnfyFz8nYWvyiK1S8XNDf6KxfH1cCV
	 I8QQYqIH5oLb6AHDiME47ghtnIr5WYS3zfg5PQjLz/JOpEVp/Fu7ZCq6npXgi2URA0I6y
	 /Xb6WbWa2ARUJZr/gP1X6kjAc/2bmZXdlOYQIsYClhN/dNM6QXsEBAyBonczI3DX4MxpM
	 1seYmzIcAd4yhuhnMscObnWA446mit0D3+ubYLJmIrbJftGt94pDpkJiMLDn9FYvyFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bS2srXFz;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4CC606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD4CC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bS2srXFz
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3ad211ad92bso577902a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985910; x=1793590710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7oDoEqU57PNNhoXy/np/pZwkE7ArsywdT3eDblPhuWE=;
        b=bS2srXFz3uKHimr7PJVofomBNwok9/1KdpVCJofNHqgpPkpR3957c1IX/E1BrI3QPP
         ejEnBMgmZg34BIOX2HpgDdWdVp3osd733+nlvpDXzp9487PekH2AnvBH/YOP53eiKyeo
         JugQQwMD7TpET9H5nu6FuJZr2vCs23Uxs9jUWCgWCuYfvAeeJOuvcRbd/1TMA7BY/hY0
         8xAOdpX3mguZZeaUGwIsd4BGnwB2//K/I+Z7ob+Zyt7lhR1+Pp32AfY2EJP246LQ/VX5
         thFuLGVj1cxUWry8mqVk2NHnqB9WHi3U6mp9j9qI8OEN1en2ah02yxsPsB/ZPFmnQYLB
         Vj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985910; x=1793590710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7oDoEqU57PNNhoXy/np/pZwkE7ArsywdT3eDblPhuWE=;
        b=x6BR4m9p00Twk0LCVWz0qWeyEthIeiCEQdjQ9XiDnioGAH3ciYJU158tP/27FUqbpw
         cOaztfqgCzOUsv6OoiZWRnO+IS7rHmofbTggcoBdo0+crl8rNMuAtqO13JCdOjBwmVtN
         sMne5XQqzE6z/o03HOsYAnIsghtWIZrQX6LY9DwUxYITVUrAAx6im4NuhML7BWY2LmiE
         ptqj0EsKxBLbx+WKZpdFVYOK9gMM+9j3TYq3mFtADQBfhNjwOmZLCoSnohvmR/j7lLK6
         o8owMWjRbQKsvENndl9bFB+7jwn9lOUmPoTU1prWJAH4/6OQD9JCeVzzjoJugSYxcvPj
         flqg==
X-Forwarded-Encrypted: i=1; AKwUvBxMF/ioRWiZ32D8OMLGGp7nvJl2rdmO2/I70zh8XkcIapCoin3oAUxHZb064zAdTTugAUlb6c54FDYavjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8JQNtBRT62ubyxeCONnuPNcsmXtA0lXNbOvgku5Nu16+DLrqd
	1AjZQ57lnQ62dRlhhV/TDy2Di46FdMkvFLr8r+ZNzIWFX26w24I1ae1B
X-Gm-Gg: AYBFou2hrdH8Oyb4n15RiwhoE8wrgiwUJZ7bD7ebAdhUKfkP5EDqG6PpTB35MgVcorD
	XQ8qwl9NQEzmgd1/7LB3yuhwVxg53yT0tqGv4fa/ydizP+nTjgzkP0Cm3jVwrxDr9fo1OlpBwPv
	gVhWIgc9XG7wrf3dSFFIY/JpleBiyqTwp0BG54UmcVuz64XG2N8ZMXU/B0rhsxb/YTC3aWoa621
	2dyi6fHsImVU2anZrfaLxAfaOiaEOfRfmr4N0r8vSOsJ+daISH/xzhke8TZo/NjnSnyoKD8TkX/
	0olUYkl/EAdONCZyH+EdvjxGfBkWcvY0rPtkh8TJq7Gv0KXY3zMB2gbVZrbl5ItuA1l/luAxWC9
	WwH9qmwIG6Bcl3kY8rm4OJ9Ank/hUA8bG3B91aiznbcdiKVLMWywSY4JPx26C2/L5l+jgN/cIlr
	m2xYFO4/hIphxAn1PSFGhX/gqYh9OXGF9lBS7FG6JHJG+ApOXtRe1UhmLVzdfQsR/+ag6OUrof4
	e7PncLIWCFca6jm10YOjDXjBiL/gNN07cbioY5Rde+DQl3/akVTEXnRehmZlhawzNCp+Ool2xfl
	eOIAPpcfvEPk+4dOFf9qlXVOwED++EMiIY3A38CMl9xeqM4SpzGg6n7ENfBLhj2DroI=
X-Received: by 2002:a17:90b:35c6:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3adeae64f23mr4224680a91.40.1792985909976;
        Sun, 25 Oct 2026 20:38:29 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm6409823a91.8.2026.10.25.20.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:38:29 -0700 (PDT)
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
Subject: [PATCH v7 08/15] f2fs: make GC migration large-folio aware
Date: Mon, 26 Oct 2026 11:37:38 +0800
Message-ID: <20261026033745.784107-9-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
References: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
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

GC can operate on a 4K block that is cached inside a large folio.
The data lookup helpers therefore need to test and update uptodate
state for the addressed subpage instead of rejecting large folios or
treating the whole folio as the target block.

Let f2fs_get_read_data_folio() and f2fs_get_lock_data_folio() to use
subpage uptodate state. Submit single-block reads at the requested
folio offset and zero only the addressed 4K range for NEW_ADDR.

Also update `move_data_page` to mark, clear, and restore dirty
state for the target subpage, and submit write I/O with the subpage
offset recorded in f2fs_io_info.

The write_pages_pending reference is taken by f2fs_do_write_data_page()
and dropped from its common error path, so a block that is truncated
concurrently no longer leaks the counter.

Reported-by: kernel test robot <yi1.lai@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202610081027.b13dcf10-lkp@intel.com
Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c    | 70 +++++++++++++++++++++++++++++++++--------------
 fs/f2fs/f2fs.h    |  1 +
 fs/f2fs/gc.c      | 28 +++++++++++++++----
 fs/f2fs/segment.c |  2 +-
 4 files changed, 75 insertions(+), 26 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d027c949823b..b3ada22cb0cb 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1679,20 +1679,16 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
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
@@ -1728,7 +1724,7 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 		goto put_err;
 	}
 got_it:
-	if (folio_test_uptodate(folio)) {
+	if (f2fs_ffs_test_blk_uptodate(folio, index)) {
 		folio_unlock(folio);
 		return folio;
 	}
@@ -1741,9 +1737,11 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
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
@@ -1803,7 +1801,6 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 
 	/* wait for read completion */
 	folio_lock(folio);
-
 	if (unlikely(folio->mapping != mapping)) {
 		f2fs_folio_put(folio, true);
 		return ERR_PTR(-EIO);
@@ -1812,7 +1809,7 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 	/*
 	 * ffs can be released while the folio was unlocked above.  Rebuild it
 	 * for a fully uptodate folio; a partially uptodate one cannot be
-	 * rebuilt and will fail the uptodate check below.
+	 * rebuilt and will fail the subpage check below.
 	 */
 	if (folio_test_large(folio) && !f2fs_folio_has_ffs(folio)) {
 		if (!f2fs_ffs_find_or_alloc(folio)) {
@@ -1821,7 +1818,7 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 		}
 	}
 
-	if (unlikely(!folio_test_uptodate(folio))) {
+	if (unlikely(!f2fs_ffs_test_blk_uptodate(folio, index))) {
 		f2fs_folio_put(folio, true);
 		return ERR_PTR(-EIO);
 	}
@@ -2970,6 +2967,22 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
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
@@ -3063,7 +3076,6 @@ bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
 
 	return dirty;
 }
-
 static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state *ffs,
 			const struct folio *folio, unsigned int start,
 			unsigned int end)
@@ -3561,7 +3573,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 		return true;
 
 	if (fio) {
-		if (page_private_gcing(fio->page))
+		if (folio_test_f2fs_gcing(fio->folio))
 			return true;
 		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
 			f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
@@ -3587,8 +3599,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	struct dnode_of_data dn;
 	struct node_info ni;
 	struct f2fs_lock_context lc;
+	struct f2fs_folio_state *ffs;
 	bool ipu_force = false;
 	bool atomic_commit;
+	bool pending_added = false;
+	bool submitted = false;
 	int err = 0;
 
 	/* Use COW inode to make dnode_of_data for atomic write */
@@ -3617,8 +3632,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		return -EINVAL;
 
 	/* Deadlock due to between page->lock and f2fs_lock_op */
-	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc))
+	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc)) {
+		if (!f2fs_ffs_has_dirty_subpage(folio))
+			folio_clear_f2fs_gcing(folio);
 		return -EAGAIN;
+	}
 
 	err = f2fs_get_dnode_of_data(&dn, F2FS_FIO_LBLK(fio),
 				     LOOKUP_NODE);
@@ -3630,7 +3648,6 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	/* This page is already truncated */
 	if (fio->old_blkaddr == NULL_ADDR) {
 		folio_clear_uptodate(folio);
-		folio_clear_f2fs_gcing(folio);
 		goto out_writepage;
 	}
 got_it:
@@ -3680,6 +3697,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	fio->version = ni.version;
 
 	__folio_start_writeback(folio, folio_test_dirty(folio));
+	if (f2fs_folio_has_ffs(folio)) {
+		ffs = (struct f2fs_folio_state *)folio->private;
+		atomic_inc(&ffs->write_pages_pending);
+		pending_added = true;
+	}
 
 	if (fio->compr_blocks && fio->old_blkaddr == COMPRESS_ADDR)
 		f2fs_i_compr_blocks_update(inode, fio->compr_blocks - 1, false);
@@ -3694,6 +3716,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		err = -EIO;
 		goto out_writepage;
 	}
+	submitted = true;
 	set_inode_flag(inode, FI_APPEND_WRITE);
 	if (atomic_commit)
 		folio_clear_f2fs_atomic(folio);
@@ -3702,6 +3725,13 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 out:
 	if (fio->need_lock == LOCK_REQ)
 		f2fs_unlock_op(fio->sbi, &lc);
+	if (!submitted) {
+		if (pending_added) {
+			f2fs_ffs_put_write_pending(folio, 1);
+		} else if (!f2fs_ffs_has_dirty_subpage(folio)) {
+			folio_clear_f2fs_gcing(folio);
+		}
+	}
 	return err;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 915ca72cf276..1b63dd961f15 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4493,6 +4493,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				int compr_blocks, bool allow_balance);
 bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
 struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio);
+bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index);
 void f2fs_ffs_mark_subrange_dirty(struct folio *folio, size_t offset, size_t len);
 bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
 					    size_t len);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index c66ca03d0d5a..c3e01f6811b4 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1520,12 +1520,19 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
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
@@ -1540,6 +1547,8 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			err = -EAGAIN;
 			goto out;
 		}
+		if (large)
+			f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
 		folio_mark_dirty(folio);
 		folio_set_f2fs_gcing(folio);
 	} else {
@@ -1558,28 +1567,37 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			.need_lock = LOCK_REQ,
 			.io_type = FS_GC_DATA_IO,
 		};
-		bool is_dirty = folio_test_dirty(folio);
+		bool is_dirty = f2fs_ffs_test_blk_dirty(folio, bidx);
 
 retry:
 		f2fs_folio_wait_writeback(folio, true, true);
 
+		if (large)
+			f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
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
 
 		folio_set_f2fs_gcing(folio);
 
 		err = f2fs_do_write_data_page(&fio);
 		if (err) {
-			folio_clear_f2fs_gcing(folio);
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
index cbb65e0343c8..e017a5f2a67f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3863,7 +3863,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 		if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
 			return CURSEG_COLD_DATA_PINNED;
 
-		if (page_private_gcing(fio->page)) {
+		if (folio_test_f2fs_gcing(fio->folio)) {
 			if (fio->sbi->am.atgc_enabled &&
 				(fio->io_type == FS_DATA_IO) &&
 				(fio->sbi->gc_mode != GC_URGENT_HIGH) &&
-- 
2.43.0

