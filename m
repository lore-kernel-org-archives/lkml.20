Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966412C21FD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 01:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788917796; cv=none; b=MquwhAEwo+1QWM5jtrtFTjIDfq3OnuZO6DkGVeQGb6oE5Oe3YfVRbBM4CdNIzm+6jPv3hLOTX5Ad+sTZVENm+DZZfZ4sZoGx3J2+TCS42pqmKuAndfHyiI07w4fXpqmJGQnFnGTDHW8clVgVM2eD3EJII4eTFGcHLQ/8C/cgplo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788917796; c=relaxed/simple;
	bh=AgCZm0HfsMNllRxUTgmhqHMHg8cf0R9KqYd3JMCYZhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YC9Z46QkeNXPufXkhiynAwkI7LW85DQzr+JLSKKWNUKvKikfG1/4Xjb0IqE+Q9jZlwXd1sXM/j36OP3NBCC4hqgBz3t+78pJE2YrArpa2NU1WwVKBw1o7dBjWiJk03XPXjUeDQs+g+KdRkXpT3UlnQpECzpRfstogD7MovP2i1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CdnZef10; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CdnZef10"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2A71F00A3E;
	Wed,  9 Sep 2026 01:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788917794;
	bh=b8qj0z1aNkswL3Omwmi1z5sO5jypIhGVErmWjvY4l3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CdnZef1019ttwzjiOwtDPE0pwVtc4Gbewm8yUYuN94of0ZKjWXwSPovLrqx1aiqgL
	 +5/DXWzX3gBtSmtgKLy8dZQWMkQ/ODsxME9Be/BthUmrxN5x5xXlF208WdxUPZM/wC
	 Ih1ozqOQvPVCP0POu5G2hObmkoHMNTUbpugszxXPgGH7Vgbwsg32SJKS34iOdoI5AP
	 m/8vZWnRe/RdVV8WL69rUVGxMlqc3X763Ra2gzwapil3fNDzNJ6vyJQXawIRUPr7VI
	 JYbnMOJL82rZP9nnV/yzolMytTyp833pP8cjt/pFVFRjPFmTs3QoiAOXLI02alQl3c
	 J07UpF3AJtAbg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v6 02/12] f2fs: cache: initialize meta cache
Date: Wed,  9 Sep 2026 09:36:01 +0800
Message-ID: <20260909013611.3418568-3-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260909013611.3418568-1-chao@kernel.org>
References: <20260909013611.3418568-1-chao@kernel.org>
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
index 3c902cbae5b3..6408f8cb5723 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -193,4 +193,16 @@ void f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_dirty);
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
index d9fe1bba75d6..7b7f7be3f0ed 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -669,6 +669,9 @@ static bool __has_merged_page(struct f2fs_sb_info *sbi, struct bio *bio,
 	if (!inode && !folio && !ino)
 		return true;
 
+	if (f2fs_is_cache_bio(bio))
+		return false;
+
 	bio_for_each_folio_all(fi, bio) {
 		struct folio *target = fi.folio;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 81f1bcc58cd3..8bce5cc2b09a 100644
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
index f96abecb3c55..f6ac2a56b0da 100644
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
@@ -5261,12 +5263,16 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
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
@@ -5594,6 +5600,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
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

