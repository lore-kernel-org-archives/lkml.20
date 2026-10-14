Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33B73A4521
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960348; cv=none; b=dpS8DMWX25nPHnfKJcQ0QmhSQA+JqHL+HFarnNjFX4BxuWs9qMVcTc3qUnxEVszdkLdOvrQLATZclRUvEYpYXyqJwfxBvKcZbei5seOVtDlLTlDbWaz1/1A9MKLgATvZmivKgakD6/t+zHghNNiAAn/+vspPrW5NIOC2N5OW8rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960348; c=relaxed/simple;
	bh=3dlOgtZmFfVqUVF+JPIad7hyWkVD0UNdb2k73V/D9wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cbTej4gjUYNOzE3PYA3dBsBIz7tGKRN3w0TNYuG8cjpLt33Ei88aHZe+kGTfE6mMeR7b5m2Pi5TEhU+5yyOWy8HkL6HUPJ6ybl+P8IAcnHdYTqexzbhe4gDJDbCEwbL3HbV/TQHTLWHCQI+9z+66+dnYt0/dnE2sPHlC379DhZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNozwIeP; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNozwIeP"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac749e0719so53986a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791960341; x=1792565141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEKIlPH2igusDvI9TwS0fA4c3tyUSHkbTzcqfoClEHY=;
        b=jNozwIePVTS+8jfVx9WXY22XxYK6P9A7Flbg+1dWJvWp6Vy5wVpxcnsZvIbZUHN22H
         z0WWhf+AuDbYBn0NqCswxiAetHXJTUC9ntbTvWUApPlg2qJT1ZwvWOHOBgZwLcEwx/jn
         0L/Qq3SiNlNF4fFVSw8vVmtNSMZz5sI3XYj0OhSIhzpjdY0wSLfbC1qJyrktW/fjQ4Wu
         bjDJOGx6Z30czKdaB2Q4SL9gZXI+qFpSV2iPOkkkcsaMoqzwI788i5oB8pUSWlKg8laa
         Zs9aFCqc+oxkzfeKrWGxqAv66f7Yok6ilVB4Z7/PitynMjH73bBfdKwIiGZRt5MJIYa4
         yC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960341; x=1792565141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mEKIlPH2igusDvI9TwS0fA4c3tyUSHkbTzcqfoClEHY=;
        b=PUz2MonslV423an4G4R9ZHyMgqyHKnbuOmhmZ/9A31mM3/vGlT8wauE8yTc/6hWiHK
         3oyaDbzF1zOEoTj1xD8R49Bq6l0LDZ6tM8BXHy3pms0A1EgBJIDrUSDU+2REmLHRAf4i
         iLrIrF6GDdoEpeh8XlevFHG5C38yJI/k8JVOoinmVYLPr+AFTnylDubBnpJVabGx6M2M
         5TpK6wteefXTMjjt45VRF8lxeN5AEiw+wgyY+uwzztpyf5hbgsobMFiEbwLXIcb4+ZYu
         kUnKYuLv8V2VBf1FOybStSNgett+RleXaMQvhHH42YpvcgLEB/1Cgd3NCS4ucd+jlUk/
         NB7A==
X-Forwarded-Encrypted: i=1; AKwUvBzcCBKTvyZbJXf+oQoD6UJ3SqJWMWWcF0ckhkBehLVOxVUPTi66aYSXYM/6WvGhEERlBXYnau/jQd2aQzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjyLatvjV8FlcTRTaXXzQwim0mjPCKyDqb+cs6qUzwGbBmn87A
	ebk3zW1WsdTfjXPprHFTBtfhW/DsHa4vA96WMcVq2qs62U6sWipLBHVB
X-Gm-Gg: AYBFou2RfrjNBqFCOHynhxL3sFoyWgkaLfgL3TTVdImKiNC6yQ5zoiV8oZ8pSjfFA1C
	H3N6r3JzLtGUVImijGZdqMkf64zEqB13akkN5vX0fwWLLf0N85QpnGkmr6RidpELcgeRDbM0tOn
	turrHh2tNRc+TuK5l7lgOvFLZ6i1bmrA2F6UpIFKjUboa8nqNdHCtj8BN1cZlDYxvyWeflbiYNd
	djPefXr2lzFmu1RBRQf2mInMhATMEBO8J/SSCp9DYkvrnEGx0O0CscQQsanlzJY6LM31zXpGsCe
	Bi8F7HtxcM+PqsBnwPZ97IHj443Q5BdBpi+ZuhZx8txDoF/FVQ4TR1P1xZEe4Cpof/gD34o+XVh
	BtxIzTxEdmHdFUb6B6MMIoTsTWa17d8D9soxy9IHHNsy6/LsJlFvLWqo29OVd3F2Xuea4zQYc16
	CwIfHweJ1UKHiZjgKJftMxbqyKViwwbemjRkLQChPjeWK9hekMWAod74xGSZQ7PoLoAdFWo5Hef
	gj5/g0LotztpF8TOV6QbszYbmzb/EcG3OAw3emRny6nmmo=
X-Received: by 2002:a17:90b:4b92:b0:3a8:6b84:234d with SMTP id 98e67ed59e1d1-3ab3a366814mr12040482a91.6.1791960340616;
        Tue, 13 Oct 2026 23:45:40 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3236371a91.2.2026.10.13.23.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:45:40 -0700 (PDT)
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
Subject: [PATCH v5 06/16] f2fs: account large folio dirty data at block granularity
Date: Wed, 14 Oct 2026 14:44:35 +0800
Message-ID: <20261014064445.2835813-7-zhaonanzhe@xiaomi.com>
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

Originally inode->dirty_pages was accounted once per folio, but f2fs
needs the counter to be accounted in blocks.

This introduces batch dirty page add/sub accounting; for a large folio
the changed dirty page count is computed from the dirty bitmap bit
changes.

Found by f2fs/006 (lfs + checkpoint=disable) and generic/363.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/checkpoint.c | 38 ++++++++++++++++++++++----
 fs/f2fs/compress.c   |  4 +--
 fs/f2fs/data.c       | 44 +++++++++++++++++++++++-------
 fs/f2fs/dir.c        |  2 +-
 fs/f2fs/f2fs.h       | 65 ++++++++++++++++++++++++++++++++++----------
 fs/f2fs/gc.c         |  2 +-
 fs/f2fs/inline.c     |  2 +-
 fs/f2fs/node.c       |  2 +-
 8 files changed, 123 insertions(+), 36 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 3ad709f69893..1ed38c668fc5 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1324,20 +1324,46 @@ static void __remove_dirty_inode(struct inode *inode, enum inode_type type)
 	stat_dec_dirty_inode(F2FS_I_SB(inode), type);
 }
 
-void f2fs_update_dirty_folio(struct inode *inode, struct folio *folio)
+/*
+ * Account @nr dirty pages (negative when dirtiness is cleared) for @inode.
+ */
+void f2fs_account_dirty_blocks(struct inode *inode, int nr)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	enum inode_type type = S_ISDIR(inode->i_mode) ? DIR_INODE : FILE_INODE;
 
-	if (!S_ISDIR(inode->i_mode) && !S_ISREG(inode->i_mode) &&
-			!S_ISLNK(inode->i_mode))
+	if (!nr)
 		return;
 
 	spin_lock(&sbi->inode_lock[type]);
-	if (type != FILE_INODE || test_opt(sbi, DATA_FLUSH))
-		__add_dirty_inode(inode, type);
-	inode_inc_dirty_pages(inode);
+	if (nr > 0) {
+		if (type != FILE_INODE || test_opt(sbi, DATA_FLUSH))
+			__add_dirty_inode(inode, type);
+		inode_add_dirty_blocks(inode, nr);
+	} else {
+		inode_sub_dirty_blocks(inode, -nr);
+		__remove_dirty_inode(inode, type);
+	}
 	spin_unlock(&sbi->inode_lock[type]);
+}
+
+void f2fs_update_dirty_folio(struct inode *inode, struct folio *folio)
+{
+	if (!S_ISDIR(inode->i_mode) && !S_ISREG(inode->i_mode) &&
+			!S_ISLNK(inode->i_mode))
+		return;
+
+	/*
+	 * Large folios have a subpage dirty bitmap, so defer their dirty accounting
+	 * to the f2fs_ffs_*subrange_dirty*() helpers.  This avoids nesting
+	 * ffs->state_lock with the inode dirty list lock.
+	 */
+	if (f2fs_folio_has_ffs(folio)) {
+		folio_set_f2fs_reference(folio);
+		return;
+	}
+
+	f2fs_account_dirty_blocks(inode, 1);
 
 	folio_set_f2fs_reference(folio);
 }
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c0e39f580993..162bd8ef822a 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1065,7 +1065,7 @@ static void cancel_cluster_writeback(struct compress_ctx *cc,
 	/* Cancel writeback and stay locked. */
 	for (i = 0; i < cc->cluster_size; i++) {
 		if (i < submitted) {
-			inode_inc_dirty_pages(cc->inode);
+			inode_inc_dirty_block(cc->inode);
 			lock_page(cc->rpages[i]);
 		}
 		clear_page_private_gcing(cc->rpages[i]);
@@ -1409,7 +1409,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		}
 		(*submitted)++;
 unlock_continue:
-		inode_dec_dirty_pages(cc->inode);
+		inode_dec_dirty_block(cc->inode);
 		folio_unlock(fio.folio);
 	}
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9701d2d2da89..b5c048134e00 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2921,10 +2921,18 @@ static unsigned int __ffs_mark_subrange_dirty(struct folio *folio,
 	return bitmap_weight(ffs->state, 2 * nr_subpages) - before;
 }
 
+/*
+ * Mark the given range dirty for writeback.
+ *
+ * Callers must guarantee that the corresponding subpages are already
+ * uptodate: a dirty subpage always holds the latest data, whose
+ * on-disk copy may be stale.
+ */
 void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
 				    size_t offset, size_t len)
 {
 	struct f2fs_folio_state *ffs;
+	unsigned int set;
 	unsigned long flags;
 
 	f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
@@ -2935,21 +2943,27 @@ void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
 	ffs = (struct f2fs_folio_state *)folio->private;
 
 	spin_lock_irqsave(&ffs->state_lock, flags);
-	__ffs_mark_subrange_dirty(folio, ffs, offset, len);
+	set = __ffs_mark_subrange_dirty(folio, ffs, offset, len);
 	spin_unlock_irqrestore(&ffs->state_lock, flags);
+
+	if (set)
+		f2fs_account_dirty_blocks(folio->mapping->host, set);
 }
 
 static bool __ffs_clear_subrange_dirty(struct folio *folio,
-			struct f2fs_folio_state *ffs, size_t offset, size_t len)
+			struct f2fs_folio_state *ffs, size_t offset, size_t len,
+			unsigned int *cleared)
 {
 	unsigned int nr_subpages = folio_nr_pages(folio);
-	unsigned int start, end;
+	unsigned int start, end, before;
 
 	start = offset >> PAGE_SHIFT;
 	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
 	end = min(end, nr_subpages);
 
+	before = bitmap_weight(ffs->state, 2 * nr_subpages);
 	bitmap_clear(ffs->state, nr_subpages + start, end - start);
+	*cleared = before - bitmap_weight(ffs->state, 2 * nr_subpages);
 	return find_next_bit(ffs->state, 2 * nr_subpages, nr_subpages) <
 			2 * nr_subpages;
 }
@@ -2961,13 +2975,15 @@ static bool __ffs_clear_subrange_dirty(struct folio *folio,
  * @len: byte length of the subrange
  *
  * Clear the dirty bits of the 4K subpages covered by [offset, offset + len),
- * and return whether the folio still has any dirty subpage left.
+ * account the cleared subpages against the inode dirty counters, and return
+ * whether the folio still has any dirty subpage left.
  */
 bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
 					    size_t len)
 {
 	struct f2fs_folio_state *ffs;
 	unsigned long flags;
+	unsigned int cleared = 0;
 	bool dirty;
 
 	if (!f2fs_folio_has_ffs(folio))
@@ -2975,9 +2991,12 @@ bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
 
 	ffs = (struct f2fs_folio_state *)folio->private;
 	spin_lock_irqsave(&ffs->state_lock, flags);
-	dirty = __ffs_clear_subrange_dirty(folio, ffs, offset, len);
+	dirty = __ffs_clear_subrange_dirty(folio, ffs, offset, len, &cleared);
 	spin_unlock_irqrestore(&ffs->state_lock, flags);
 
+	if (cleared)
+		f2fs_account_dirty_blocks(folio->mapping->host, -cleared);
+
 	return dirty;
 }
 
@@ -3880,7 +3899,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 		goto redirty_out;
 
 out:
-	inode_dec_dirty_pages(inode);
+	inode_dec_dirty_block(inode);
 	if (err) {
 		folio_clear_uptodate(folio);
 		folio_clear_f2fs_gcing(folio);
@@ -4376,11 +4395,16 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 		 * partially written back), the folio must stay dirty so that
 		 * the remaining subranges are written back later.
 		 */
+		/*
+		 * Redirty the folio if dirty subranges remain in a large
+		 * folio, or if order-0 writeback fails due to an error.
+		 */
 		if (f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
-					(err ? pos : end_pos) - folio_pos(folio)))
+					(err ? pos : end_pos) - folio_pos(folio)) ||
+					err)
 			folio_redirty_for_writepage(wbc, folio);
-		else
-			inode_dec_dirty_pages(inode);
+		else if (!f2fs_folio_has_ffs(folio))
+			inode_dec_dirty_block(inode);
 
 		/*
 		 * Release the bias taken above and we end writeback here if
@@ -5219,7 +5243,7 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 		return;
 
 	if (folio_test_dirty(folio)) {
-		inode_dec_dirty_pages(inode);
+		inode_dec_dirty_block(inode);
 		f2fs_remove_dirty_inode(inode);
 	}
 
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 97f7fef6b068..70847313ca6a 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -937,7 +937,7 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, void *dentry_block,
 		folio_clear_uptodate(folio);
 		folio_detach_private(folio);
 
-		inode_dec_dirty_pages(dir);
+		inode_dec_dirty_block(dir);
 		f2fs_remove_dirty_inode(dir);
 	}
 	f2fs_folio_put(folio, true);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6db23a3c25a9..9edff1e79f2c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2919,9 +2919,10 @@ static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
 	f2fs_i_blocks_write(inode, count, false, true);
 }
 
-static inline void inc_cache_count(struct f2fs_sb_info *sbi, int count_type)
+static inline void add_cache_counts(struct f2fs_sb_info *sbi,
+					int count_type, int nr)
 {
-	atomic_inc(&sbi->nr_caches[count_type]);
+	atomic_add(nr, &sbi->nr_caches[count_type]);
 
 	if (count_type == F2FS_DIRTY_DENTS ||
 			count_type == F2FS_DIRTY_NODES ||
@@ -2931,31 +2932,66 @@ static inline void inc_cache_count(struct f2fs_sb_info *sbi, int count_type)
 		set_sbi_flag(sbi, SBI_IS_DIRTY);
 }
 
-static inline void inode_inc_dirty_pages(struct inode *inode)
+static inline void sub_cache_counts(struct f2fs_sb_info *sbi,
+					int count_type, int nr)
 {
-	atomic_inc(&F2FS_I(inode)->dirty_pages);
-	inc_cache_count(F2FS_I_SB(inode), S_ISDIR(inode->i_mode) ?
-				F2FS_DIRTY_DENTS : F2FS_DIRTY_DATA);
-	if (IS_NOQUOTA(inode))
-		inc_cache_count(F2FS_I_SB(inode), F2FS_DIRTY_QDATA);
+	atomic_sub(nr, &sbi->nr_caches[count_type]);
+}
+
+static inline void inc_cache_count(struct f2fs_sb_info *sbi, int count_type)
+{
+	add_cache_counts(sbi, count_type, 1);
 }
 
 static inline void dec_cache_count(struct f2fs_sb_info *sbi, int count_type)
 {
-	atomic_dec(&sbi->nr_caches[count_type]);
+	sub_cache_counts(sbi, count_type, 1);
+}
+
+/*
+ * Account @nr dirty pages for @inode; one page is
+ * (PAGE_SIZE >> log_blocksize) filesystem blocks.
+ */
+static inline void inode_add_dirty_blocks(struct inode *inode, int nr)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	int blocks = nr * (PAGE_SIZE >> sbi->log_blocksize);
+
+	atomic_add(blocks, &F2FS_I(inode)->dirty_pages);
+	if (S_ISDIR(inode->i_mode))
+		add_cache_counts(sbi, F2FS_DIRTY_DENTS, blocks);
+	else
+		add_cache_counts(sbi, F2FS_DIRTY_DATA, blocks);
+	if (IS_NOQUOTA(inode))
+		add_cache_counts(sbi, F2FS_DIRTY_QDATA, blocks);
 }
 
-static inline void inode_dec_dirty_pages(struct inode *inode)
+static inline void inode_sub_dirty_blocks(struct inode *inode, int nr)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	int blocks = nr * (PAGE_SIZE >> sbi->log_blocksize);
+
 	if (!S_ISDIR(inode->i_mode) && !S_ISREG(inode->i_mode) &&
 			!S_ISLNK(inode->i_mode))
 		return;
 
-	atomic_dec(&F2FS_I(inode)->dirty_pages);
-	dec_cache_count(F2FS_I_SB(inode), S_ISDIR(inode->i_mode) ?
-				F2FS_DIRTY_DENTS : F2FS_DIRTY_DATA);
+	atomic_sub(blocks, &F2FS_I(inode)->dirty_pages);
+	if (S_ISDIR(inode->i_mode))
+		sub_cache_counts(sbi, F2FS_DIRTY_DENTS, blocks);
+	else
+		sub_cache_counts(sbi, F2FS_DIRTY_DATA, blocks);
 	if (IS_NOQUOTA(inode))
-		dec_cache_count(F2FS_I_SB(inode), F2FS_DIRTY_QDATA);
+		sub_cache_counts(sbi, F2FS_DIRTY_QDATA, blocks);
+}
+
+static inline void inode_inc_dirty_block(struct inode *inode)
+{
+	inode_add_dirty_blocks(inode, 1);
+}
+
+static inline void inode_dec_dirty_block(struct inode *inode)
+{
+	inode_sub_dirty_blocks(inode, 1);
 }
 
 static inline void inc_atomic_write_cnt(struct inode *inode)
@@ -4384,6 +4420,7 @@ void f2fs_remove_orphan_inode(struct f2fs_sb_info *sbi, nid_t ino);
 int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi);
 int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi);
 void f2fs_update_dirty_folio(struct inode *inode, struct folio *folio);
+void f2fs_account_dirty_blocks(struct inode *inode, int nr);
 void f2fs_remove_dirty_inode(struct inode *inode);
 int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type,
 								bool from_cp);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 89e50f871b75..d7fae1890835 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1555,7 +1555,7 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 
 		folio_mark_dirty(folio);
 		if (folio_clear_dirty_for_io(folio)) {
-			inode_dec_dirty_pages(inode);
+			inode_dec_dirty_block(inode);
 			f2fs_remove_dirty_inode(inode);
 		}
 
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index ab7537ff7ebd..49905aa08418 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -199,7 +199,7 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
 	f2fs_outplace_write_data(dn, &fio);
 	f2fs_folio_wait_writeback(folio, true, true);
 	if (dirty) {
-		inode_dec_dirty_pages(dn->inode);
+		inode_dec_dirty_block(dn->inode);
 		f2fs_remove_dirty_inode(dn->inode);
 	}
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e7522e7eedf8..d96ccf1c90ff 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1699,7 +1699,7 @@ static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
 		goto folio_out;
 
 	ret = f2fs_write_inline_data(inode, folio);
-	inode_dec_dirty_pages(inode);
+	inode_dec_dirty_block(inode);
 	f2fs_remove_dirty_inode(inode);
 	if (ret)
 		folio_mark_dirty(folio);
-- 
2.43.0

