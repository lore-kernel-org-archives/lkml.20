Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985901;
	b=LePYxCjvYJ64zY1kFfYsLMuJpoxlPUWpVMwRjN38Pz1m5ZmxWzNiQmO1NM3Q+IC8UC7s
	 TGYA1hFlqB0qhIRCNxFc2YsOhAgCH3ydA8Anf1LRfhpLtiSXaLJBrzVXiIx38gzGNasX1
	 c1IUCPjC2emeCpCHG/nXU4Zq+vYWFYoSnZq0mD31dJnGWjSotjNEDIU9mJ9kqGIZfgO/i
	 52pkB9b2pox0724rt7FnvFeqmewH5IXZ8HNuXb0oieAwkznvusmuFaAK9H5PVURftgQPs
	 fTKFakEhXB1/Ee6BQvst21ZXsnFUrzQXL0UFZQzpswDbLWTGzRfIigDaYWmb3gR4yog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TDJnbuNjUXD/VKOz2g2l4zls4B0yVKnauXVO81bXHo0=;
	b=ohidkga8sB9v1RDsyL9rEpcmFWIK0OIfJ0ADd+420457W4yLtlc9XM17lMVemuUfhq9X
	 VHUBmZinSQcheadwH/U94ew0SZAIfyNs8I//FqLMRwdCTMhbMWBOAtdKzgPOfM7s4CXWk
	 JTKb42fD2vNpC616Uk03qcbqlj3u/2EBuyWTuZE7nvzmOIeQgo53rVQSIPYxXHTNxbB+a
	 GWON7Ubb/cgLwIicixb0hDXKN4eksi3UCg6q3ZjkcwXkD9FgNrZKNtdN7XNkE40334gDQ
	 9rc+EyNna/zbDwgKdG4gjiGdTBp3O/yacwVSqv/4nUglJbDAF2/n41j+P1R9BKU49FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EmmaK114;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369E0606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 369E0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EmmaK114
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3ab37ea4798so567958a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985900; x=1793590700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDJnbuNjUXD/VKOz2g2l4zls4B0yVKnauXVO81bXHo0=;
        b=EmmaK114NsL1KGgQoVxT9BasGgmr5wYw8o7uNMTQzrJ6oyA5ZjNfa1BmbtOypt2tv2
         NPdEr3T9DaC92Z343/tuqeN1Ft9YgUvp9R7NNfXdb7UAy2c5OnreBmfH1+7yR7fwcu1b
         bGBxBq9k+8/YulPfoJ1+wsC5MlBhv/9TbL6+Yqyk3KPbq1tbRemVy8iqt4MHc4VnBuhE
         G+hzuP2/8jWoQBFkySQGldTNevgkIrQczODvfkhl+yo+MPlGFI5OgJzJMeAVtIGtq75l
         YN/aeMotDA1umziD/7D6qafz9K4/mKywFn4COaloGjXZTVhXnBbODLA+h0lEgD0R6TJu
         cF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985900; x=1793590700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TDJnbuNjUXD/VKOz2g2l4zls4B0yVKnauXVO81bXHo0=;
        b=gs09jM9SaT7FO5FeqL0yMbpv7C5rLV4cL3Ifhqz36kXNuAMWuPZoo8Km4TNj+kPNMl
         d6FD+HlBTF/L1kN9DTTF4x8HxzLp+hMJO0Cep0+7Jyn9qk/uN+qz/LGymtfF0I7X5+s7
         hvMxfMjVLw0as03je2+3Hl104djiTm1UhPq4bz40PqMziIiOchwpnwZovIxQfrOjhy3H
         hSSajblm3vmr3crSt4iJhWm6NbDSqnSALbc6RSEIi/tFoZ+ItVQnAFBRMEaMDIAfpo4v
         bo4frHRzfLiS78bR/ZrUdbNYgWvtlDA94HoZq44BG2G6UrifLCQtda+kFO6kjxAufGbP
         Tqgg==
X-Forwarded-Encrypted: i=1; AKwUvBwxzBDMbognh9zcmrzg6ip9uPVadKnEFR20xfkuZO7uZ8u0LvPDonk6evdOGu89bynF2a4+I00TwI79fSo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLR7Zhk8QyC2KzgqQT1dODSJ5qTs5tPFp/o2QzIKNz0uk5eIsrJ
	jV8i+WaCZ6ocv326cU6StQjuvyRlrXYHd+J7flpmMZUPrnZdl5Dw8svN
X-Gm-Gg: AYBFou3YZoGW+WJWM1FKP84II0Wyf+Ftm7GS20bTxZArnQ41A4TvIzwG1byFGnfWJsk
	Umk/796qjjnToaqJ787R6DnyfEvMhP0S1qXJIfHK0WhBk3zZKwnSilt+14oPJYBz3sMxsSZ9dQd
	UbPqoJG83TnHVmU+tJub65BRismGV6EDgAe4tQhp2+fxLMpJFw6cyRMsGOwDcBAn7iNiu+0WS8o
	cj91lu0CcbzZfxvJG/hnZsTwUkIiLrRli5pRkyI+D1t9HMvmJJ6otW5194PsRr4oUGidrO4/DU7
	Ub8aYL/smlb0sRzA2kPMALIVExepfOXktLKTLJEecjheUubGYYK50LRD+Bg5ecrUbb3ZFdlrDaQ
	FJDSS39jbdPe7vdq6zAeiVeMazyI0eef7WfkHW24bzRAlpNB1jmpm9b/Fv1B4+bItCSqO+g78h9
	YdIl6ot4gVDmKCueBgHXAEYkfCkURF/y8fH1fmZDuUwGFP5uVXMPjmyrt0DVLmfv7zBTTpDnD1t
	DyD3M7F4VmE5Cs2CeLiDdrKgEy5WFS4dNdyGkT+N4Qfd69kcxaXu4Zj/EIzIY0iPkgY1ekSLHNv
	va1n1U8vT4y0+0LdzA==
X-Received: by 2002:a17:90b:2745:b0:3ac:ea3b:f28b with SMTP id 98e67ed59e1d1-3adeafaeb57mr4468354a91.24.1792985900442;
        Sun, 25 Oct 2026 20:38:20 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm6409823a91.8.2026.10.25.20.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:38:20 -0700 (PDT)
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
Subject: [PATCH v7 06/15] f2fs: account large folio dirty data at block granularity
Date: Mon, 26 Oct 2026 11:37:36 +0800
Message-ID: <20261026033745.784107-7-nzzhao.sigma@gmail.com>
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
 fs/f2fs/data.c       | 50 +++++++++++++++++++++++-----------
 fs/f2fs/dir.c        |  2 +-
 fs/f2fs/f2fs.h       | 65 ++++++++++++++++++++++++++++++++++----------
 fs/f2fs/gc.c         |  2 +-
 fs/f2fs/inline.c     |  2 +-
 fs/f2fs/node.c       |  2 +-
 8 files changed, 123 insertions(+), 42 deletions(-)

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
index a0822d06e3bc..d027c949823b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2985,10 +2985,18 @@ static unsigned int __ffs_mark_subrange_dirty(struct folio *folio,
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
@@ -2999,21 +3007,27 @@ void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
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
@@ -3025,13 +3039,15 @@ static bool __ffs_clear_subrange_dirty(struct folio *folio,
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
@@ -3039,9 +3055,12 @@ bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
 
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
 
@@ -3951,7 +3970,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 		goto redirty_out;
 
 out:
-	inode_dec_dirty_pages(inode);
+	inode_dec_dirty_block(inode);
 	if (err) {
 		folio_clear_uptodate(folio);
 		folio_clear_f2fs_gcing(folio);
@@ -4330,14 +4349,13 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 		 */
 		if (unlikely(f2fs_cp_error(sbi))) {
 			mapping_set_error(folio->mapping, -EIO);
-			if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY) {
+			if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY)
 				folio_redirty_for_writepage(wbc, folio);
-			} else {
-				if (f2fs_folio_has_ffs(folio))
-					f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
-									folio_size(folio));
-				inode_dec_dirty_pages(inode);
-			}
+			else if (f2fs_folio_has_ffs(folio))
+				f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
+								folio_size(folio));
+			else
+				f2fs_account_dirty_blocks(inode, -1);
 			goto retry_out;
 		}
 
@@ -4454,8 +4472,8 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 		if (f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
 					(err ? pos : end_pos) - folio_pos(folio)) || err)
 			folio_redirty_for_writepage(wbc, folio);
-		else
-			inode_dec_dirty_pages(inode);
+		else if (!f2fs_folio_has_ffs(folio))
+			inode_dec_dirty_block(inode);
 
 		/*
 		 * Release the bias taken above and we end writeback here if
@@ -5307,7 +5325,7 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
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
index df0091591ff5..b89664e28a92 100644
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
index 72c7f9ceafc2..c66ca03d0d5a 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1565,7 +1565,7 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 
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
index 424e95ca5878..1fdef678dcef 100644
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

