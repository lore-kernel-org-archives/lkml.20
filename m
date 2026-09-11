Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE8F41441F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169057; cv=none; b=qVYGn/3woPl1h/i+MZPCdprW5ng8A4LRUwaO74prx+kq3/8Cnf/W1wOGUQR96JnTKpXCQtxpJmP4XqdIdMqANHFlRLkde4dhrFInX+Ece1O4O7URPATR2iEt8hZ01hb35TjpeQvdbI5F81UpngFxz08RdY733hMycteyJS7cgqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169057; c=relaxed/simple;
	bh=UyPR2LAnZfJByWoTcYVMcEYOxaTr8iAHewV3/u2a+J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdKybkVaN/RaLbSx2jf47yF88Q/1A5W+8gjosDa7A6+JWEjC4q2bglGdioKTGBHPtT9Vx4Sk57lbX61WFzdlpdDfUy3rQ5ssWfUyq9yw+0iAj0LFDS5Nj9Xxj3q9wWF/zzYC3M35xdvulx+XTb+Y2jB13RQ3rRSe0ar9b5seJ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NCUAy6u0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NCUAy6u0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6401F0089B;
	Fri, 11 Sep 2026 23:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789169055;
	bh=pe1JYxtGY958LUuVZSf9JUsa4bXEAsALSb/91tPNYs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NCUAy6u0M5T/SJ5Oi3vWFgytM44TIOurKmOwClQMonPML01bJyx/1bRC4SpBDTxvq
	 Nj5tGX/nIV5racFqr/AA5XYykohKvqhcGPUD/kVhvXdtxZV1QPiHUw7L9AEbnJRF6G
	 fHS4geLpSsR94TDDDbGPoXE8//ErFQmISZHD+MXTRzuZ8B/jT5wiJ4t7c+U/6v9u9O
	 811xJ5t2/tpV4Ikzi+nCjg8PubCO5VJV0jA8nAk2rhUkqgUI3fz4tjIw2mAtFGdI3e
	 4AVs/MjHFlsaXpwIYcqRMjfPSZfLQ192gJ9VGOPG6uY6P+WqW3JRDxC6eaiK9t98/g
	 G2paNcZXLpEOQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v7 02/12] f2fs: cache: initialize meta cache
Date: Sat, 12 Sep 2026 07:23:55 +0800
Message-ID: <20260911232405.1815804-3-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
In-Reply-To: <20260911232405.1815804-1-chao@kernel.org>
References: <20260911232405.1815804-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

This patch introduces meta_blocks in f2fs_sb_info structure, initializes
and destroys the meta cache during filesystem mount and unmount.

It also introduces helper wrappers for meta cache operation.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.h | 12 ++++++++++++
 fs/f2fs/data.c  |  3 +++
 fs/f2fs/f2fs.h  |  3 +++
 fs/f2fs/super.c | 10 +++++++++-
 4 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
index 72dbf26ab26e..d5ee51691fac 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -194,4 +194,16 @@ void f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_dirty);
 void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
 		unsigned long start, unsigned long len, bool drop_dirty);
 
+int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
+void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
+
+#define META_CACHE(sbi)		(&(sbi)->meta_blocks)
+
+#define f2fs_find_meta_cache(sbi, blkaddr)		\
+	f2fs_find_cache(META_CACHE(sbi), blkaddr)
+#define f2fs_invalidate_meta_caches(sbi, start, len)	\
+	f2fs_drop_cache_range(META_CACHE(sbi), start, len, false)
+#define f2fs_truncate_meta_caches(sbi, start, len)	\
+	f2fs_drop_cache_range(META_CACHE(sbi), start, len, true)
+
 #endif /* _LINUX_F2FS_CACHE_H */
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d868b939caee..59fef2132177 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -670,6 +670,9 @@ static bool __has_merged_page(struct f2fs_sb_info *sbi, struct bio *bio,
 	if (!inode && !folio && !ino)
 		return true;
 
+	if (f2fs_is_cache_bio(bio))
+		return false;
+
 	bio_for_each_folio_all(fi, bio) {
 		struct folio *target = fi.folio;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c0c7d51c830f..85c4bf40b4aa 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2107,6 +2107,9 @@ struct f2fs_sb_info {
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 	struct lock_class_key cp_global_sem_key;
 #endif
+
+	/* f2fs internal cache */
+	struct f2fs_cached_block_list meta_blocks;
 };
 
 /* Definitions to access f2fs_sb_info */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6a2f09c61dcd..b731b9bb7b54 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2094,6 +2094,8 @@ static void f2fs_put_super(struct super_block *sb)
 	iput(sbi->meta_inode);
 	sbi->meta_inode = NULL;
 
+	f2fs_destroy_cache(META_CACHE(sbi));
+
 	/* Should check the page counts after dropping all node/meta pages */
 	for (i = 0; i < NR_COUNT_TYPE; i++) {
 		if (!get_pages(sbi, i))
@@ -5263,12 +5265,16 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (err)
 		goto free_percpu;
 
+	err = f2fs_init_cache(sbi, META_CACHE(sbi), F2FS_META_CACHE);
+	if (err)
+		goto free_page_array_cache;
+
 	/* get an inode for meta space */
 	sbi->meta_inode = f2fs_iget(sb, F2FS_META_INO(sbi));
 	if (IS_ERR(sbi->meta_inode)) {
 		f2fs_err(sbi, "Failed to read F2FS meta data inode");
 		err = PTR_ERR(sbi->meta_inode);
-		goto free_page_array_cache;
+		goto free_meta_cache;
 	}
 
 	err = f2fs_get_valid_checkpoint(sbi);
@@ -5596,6 +5602,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	make_bad_inode(sbi->meta_inode);
 	iput(sbi->meta_inode);
 	sbi->meta_inode = NULL;
+free_meta_cache:
+	f2fs_destroy_cache(META_CACHE(sbi));
 free_page_array_cache:
 	f2fs_destroy_page_array_cache(sbi);
 free_percpu:
-- 
2.49.0

