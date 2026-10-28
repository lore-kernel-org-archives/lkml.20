Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202298;
	b=oH4Kay4bz5S9U12k19at/LLy3EqR+A9Gag7y4nMMGqEzvT0jYJFtaTvUuLUeJLfHITKl
	 1K3hQGq952qkyEnI0EH5+7u2kLaOqHHB0AX/ofOFd/kSZfpO56fjwMmQ3uYBrKix/h0hD
	 BGFaUJarN8L5l4lXaZMiIDlanDbbAie1+WqZcrwhwri7ExrRZT/bZIiwi2iKqoK/Upc9q
	 UdU7VyuZ7etyspJ7OIok2S9sDwRjuzZOnhcn87Aon6n++0uOSIr1SL0+p4/Aw01QTjU7J
	 KsgBba2tl17yQ360qBdcwtiacFsZdAPW10ZUESWI5X6ksXlzc0qqX1LhNtvEoqH5jNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vffwMS4HeaCkClJ+JwZt+OcdLFIE7CJ+0mO1DPsWdEc=;
	b=axXJ+6Xs2aS5sqHPd1IQOelRGF8CeCggkF5RPPkai/bfWeSRUXl5sDAgOuS8UrPRlOTv
	 5jaeTYV7Vtf8dg6NASBPAtX/B1PShUlai/L8DgCzFusmFB+SRCNgJEOKZUFKbApp+CjlD
	 Wl+Rgq8zTJtsFcte2ENr139puF+PyO/AgChF2lsLm0PTTeKUCB78wi+ouTwQmeKYKQQLi
	 qBX4BDgwucGdqCR5yzmF/6C1/5o3xQyLocF6+1rHyz3fE4lY0AzX6OvjAtMZRTN+kOhqF
	 0ogYIaqLzf9ykvxqX1tFO+Ob03qIU/mvcanmV1NIkm+aASutH6AZgf98XnriTVk1ytw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qp7auMnH;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1506B606C05C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1506B606C05C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qp7auMnH
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2e609985789so3244775ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202297; x=1793807097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vffwMS4HeaCkClJ+JwZt+OcdLFIE7CJ+0mO1DPsWdEc=;
        b=Qp7auMnHKrfCaS8i2Q31y5Lrpa2Sm30Sdxgdj7GdUGNiy6yWzECrfTiPkWOMZvCi2e
         4rIECyiyyTRsKj3EOBZfp5l1ttWc0QbCI+M+OdnlojCogBuU73mT0OM0PxR+2CXTpTXm
         7HaviLG0RU0yagnPIsxWxyKb1RsPZQY5lkDyWZA/up7vsm79ps/9fa6cu4fki0Lmku5Z
         VAnJ8NzrJLfuyaFiw8t6Nq1wO9qtdRZjNJjfw2eiE1oQJfdhcNRv1AiX6HfA5bfRiC4z
         4b9rsAJo8yNFtuVGcUW4dA2TKerME9/w/aaz6JHosKdiR9MQqNp3SjfIG0l0mCYsccsr
         6u9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202297; x=1793807097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vffwMS4HeaCkClJ+JwZt+OcdLFIE7CJ+0mO1DPsWdEc=;
        b=bKsrkL1vEkLFb9QpWcnQVd4o+Gp4+No9AUNNWFij+z1Zp9cDvbT6Zy6cb1cZZbyIXk
         7BsmE2yqTBYBfMmDZ02rWomnBvA3Sm88NjNWlLSLcMO3stByL/Fi2BknqyarhBSkqcXY
         ZsmThh8RcDl/oeLTc7SB9y5yCTdWVbilX8YhGz64KujiZRIMU8Ug/423yMsGkdIfafuB
         ub8VEBT6eQVtGFijrIJntu0Sl/UveZV/nf9Q3kNX+vQV8etdCXzF/+cq2ZhOg/r6snAo
         TjuH6wnPsim5JR/k7WD6hheGpaHdMnTp9rq5b3OPu782NGotnHJpjU1Bf+C9MPIwLNfL
         HXTA==
X-Forwarded-Encrypted: i=1; AKwUvBwT2J6HhW1t24Aii5rlIbNuFBKg+hIWxwNI5V8KQZhClplQ94lCdk0ZjNrcrGpSMNlRTIw6/2yVruAwI98=@vger.kernel.org
X-Gm-Message-State: AFq9FYI81hOEZ9v3c4+ijnrcECJuxIfmCIwlconEuXi2W+o1GFznPD1+
	D6QQakV0DfHettV8RDbcF3JtbTEbrl9DcoQettTPfI9VWbY22uwuJ+qq
X-Gm-Gg: AYBFou1Gk/Bi8q2JQ4Z1NkAwUzVeLJzz+JGJMukmHprM3yU/zC75tnTIBxJ11O+T4qe
	xYNrlDiGqvEF17PL3eN82MLi46tJbq8jTSdxrYORMGn85nftbUIhxOYylDjGdmt5XWgab4px/Bk
	/l4CTSGbxurHhjC9U8uJXIKYIRB/yZ/aq0a92mvHuZBkXse7mx7Rx2MxYOdtVJc1wMqG5FW07oj
	9dc4q6v0rMhCNCYi50Gq4knRl4M8hhVjDfi5G6h6xIyfuaG+BwnhGi6T+BEHcx5f287O1b48m7v
	zYXjn26GTOGN2k7tbXaPhYajFlrEldKQJsqcZQEn7InOsD9cAlEpDUF5xtyI+SCBvgb+ahvum6O
	2eVhBgCJb+P6fY8Irn0c2lxdkup88hPLQlEcVsqOQMCvZbxa+4xcwoOTUDLVv29bSJ+VCWvaSYS
	3SYvlJU/JOTh/+uP5AAaaDNeo7H2tqvKQcdcMqoK5NIpcijpym/Dx/JJs5AIbXTaYEBpwK1c3Gr
	bPm4WP7jM83G7WBL5hhuTHY0BQka4PlAtDlKe5r35zgxVey1qUmrWgbdg1a14JOXLEa/wy7p1K5
	k87ZozyMXDr+71GfpRyWvxvpe+BN+UlN9p6H1oGoh8rgRZ9lpNiqeD55pCvBwX3nx/Q=
X-Received: by 2002:a17:903:2a83:b0:2e6:913:57ed with SMTP id d9443c01a7336-2eb004f318emr25410335ad.14.1793202297314;
        Wed, 28 Oct 2026 08:44:57 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be5105sm24111655ad.37.2026.10.28.08.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:56 -0700 (PDT)
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
	Ryan Roberts <Ryan.Roberts@arm.com>,
	kernel test robot <yi1.lai@intel.com>
Subject: [PATCH v8 08/15] f2fs: make GC migration large-folio aware
Date: Wed, 28 Oct 2026 23:43:59 +0800
Message-ID: <20261028154407.1601430-9-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
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
 fs/f2fs/data.c    | 72 ++++++++++++++++++++++++++++++++++-------------
 fs/f2fs/f2fs.h    |  2 ++
 fs/f2fs/file.c    |  3 ++
 fs/f2fs/gc.c      | 47 +++++++++++++++++++++++++++----
 fs/f2fs/segment.c |  2 +-
 5 files changed, 100 insertions(+), 26 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6040bda749b7..039916bad57b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -364,7 +364,7 @@ static void f2fs_cache_write_end_bio(struct bio *bio)
 	bio_put(bio);
 }
 
-static bool f2fs_ffs_has_dirty_subpage(struct folio *folio)
+bool f2fs_ffs_has_dirty_subpage(struct folio *folio)
 {
 	struct f2fs_folio_state *ffs;
 	unsigned long flags;
@@ -1685,20 +1685,16 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
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
@@ -1734,7 +1730,7 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 		goto put_err;
 	}
 got_it:
-	if (folio_test_uptodate(folio)) {
+	if (f2fs_ffs_test_blk_uptodate(folio, index)) {
 		folio_unlock(folio);
 		return folio;
 	}
@@ -1747,9 +1743,11 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
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
@@ -1809,7 +1807,6 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 
 	/* wait for read completion */
 	folio_lock(folio);
-
 	if (unlikely(folio->mapping != mapping)) {
 		f2fs_folio_put(folio, true);
 		return ERR_PTR(-EIO);
@@ -1818,7 +1815,7 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 	/*
 	 * ffs can be released while the folio was unlocked above.  Rebuild it
 	 * for a fully uptodate folio; a partially uptodate one cannot be
-	 * rebuilt and will fail the uptodate check below.
+	 * rebuilt and will fail the subpage check below.
 	 */
 	if (folio_test_large(folio) && !f2fs_folio_has_ffs(folio)) {
 		if (!f2fs_ffs_find_or_alloc(folio)) {
@@ -1827,7 +1824,7 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 		}
 	}
 
-	if (unlikely(!folio_test_uptodate(folio))) {
+	if (unlikely(!f2fs_ffs_test_blk_uptodate(folio, index))) {
 		f2fs_folio_put(folio, true);
 		return ERR_PTR(-EIO);
 	}
@@ -2976,6 +2973,22 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
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
@@ -3069,7 +3082,6 @@ bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
 
 	return dirty;
 }
-
 static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state *ffs,
 			const struct folio *folio, unsigned int start,
 			unsigned int end)
@@ -3567,7 +3579,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 		return true;
 
 	if (fio) {
-		if (page_private_gcing(fio->page))
+		if (folio_test_f2fs_gcing(fio->folio))
 			return true;
 		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
 			f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
@@ -3593,8 +3605,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
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
@@ -3636,7 +3651,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	/* This page is already truncated */
 	if (fio->old_blkaddr == NULL_ADDR) {
 		folio_clear_uptodate(folio);
-		folio_clear_f2fs_gcing(folio);
+		if (!f2fs_ffs_has_dirty_subpage(folio))
+			folio_clear_f2fs_gcing(folio);
 		goto out_writepage;
 	}
 got_it:
@@ -3686,6 +3702,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	fio->version = ni.version;
 
 	__folio_start_writeback(folio, folio_test_dirty(folio));
+	if (f2fs_folio_has_ffs(folio)) {
+		ffs = (struct f2fs_folio_state *)folio->private;
+		atomic_inc(&ffs->write_pages_pending);
+		pending_added = true;
+	}
 
 	if (fio->compr_blocks && fio->old_blkaddr == COMPRESS_ADDR)
 		f2fs_i_compr_blocks_update(inode, fio->compr_blocks - 1, false);
@@ -3700,6 +3721,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		err = -EIO;
 		goto out_writepage;
 	}
+	submitted = true;
 	set_inode_flag(inode, FI_APPEND_WRITE);
 	if (atomic_commit)
 		folio_clear_f2fs_atomic(folio);
@@ -3708,6 +3730,13 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 out:
 	if (fio->need_lock == LOCK_REQ)
 		f2fs_unlock_op(fio->sbi, &lc);
+	/*
+	 * Do not clear gcing flag on failure here: the caller will redirty
+	 * the folio and keep the flag so that it can be guaranteed by
+	 * checkpoint, or drop the flag by itself, e.g. move_data_page().
+	 */
+	if (!submitted && pending_added)
+		f2fs_ffs_put_write_pending(folio, 1);
 	return err;
 }
 
@@ -5510,6 +5539,9 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 				goto done;
 			}
 
+			f2fs_ffs_mark_subrange_dirty(folio,
+				offset_in_folio(folio, (loff_t)blkidx << PAGE_SHIFT),
+				PAGE_SIZE);
 			folio_mark_dirty(folio);
 			f2fs_folio_put(folio, true);
 		}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 328c3ff36b47..e20805d4a099 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4504,7 +4504,9 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				int compr_blocks, bool allow_balance);
 bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
 struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio);
+bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index);
 void f2fs_ffs_mark_subrange_dirty(struct folio *folio, size_t offset, size_t len);
+bool f2fs_ffs_has_dirty_subpage(struct folio *folio);
 bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
 					    size_t len);
 void f2fs_write_failed(struct inode *inode, loff_t to);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 33964da53584..ef9b9baa1a79 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3182,6 +3182,9 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 
 			f2fs_folio_wait_writeback(folio, true, true);
 
+			f2fs_ffs_mark_subrange_dirty(folio,
+				offset_in_folio(folio, (loff_t)idx << PAGE_SHIFT),
+				PAGE_SIZE);
 			folio_mark_dirty(folio);
 			folio_set_f2fs_gcing(folio);
 			f2fs_folio_put(folio, true);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index c66ca03d0d5a..337ecf4df945 100644
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
@@ -1558,28 +1567,56 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
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
+				/*
+				 * Keep gcing flag for redirtied folio, so that
+				 * it can be guaranteed by checkpoint.
+				 */
+				if (large)
+					f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
 				folio_mark_dirty(folio);
+				folio_set_f2fs_gcing(folio);
+			} else if (!f2fs_ffs_has_dirty_subpage(folio)) {
+				/* migrate this block in later GC */
+				folio_clear_f2fs_gcing(folio);
+			}
+		} else if (large && folio_test_dirty(folio)) {
+			/*
+			 * The folio is left both dirty and under writeback,
+			 * submit the cached bio before unlocking it, otherwise
+			 * a WB_SYNC_ALL writer may lock the folio and wait on
+			 * its writeback in folio_prepare_writeback(), while we
+			 * are blocked on folio_lock() for the next block of the
+			 * same folio, before the bio is submitted.
+			 */
+			f2fs_submit_merged_write_cond(F2FS_I_SB(inode), NULL,
+							folio);
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

