Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553BC429803
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169065; cv=none; b=JKFJNdC/c6TdbMnmnkYxjq97oKc5opu/R+dlMIH7LnMPjdXWskqJcctdPAP7nrAX55R2mAcZnBdIPyZSrbGv6D+gcp502WVePIl3L4yePyp2C6vpT2M0B0YYWUOIRBg4pcXj7v0TdOcM7OaXe7PmLrQurjTiMh4a6ERkueERXxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169065; c=relaxed/simple;
	bh=5iExL8fY29WCg7/MwAg3ksM/F2+M2Va4yxmAYwDxTW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyRtEsQ714JKy22zd9Fy+sNtAcw4SMNH/HISnLVrbhw3K3dkhd6y2J9Lkb8sCY5xCxaSTGpPmg1wvWlsDbkOgx5/+wP0kRmBmpSxol8XXO+HI2lqvYUn9oPS+PMENWHeUG0N80fBMi7XKbUv6+F/3L6cYJ8DdsMNs1K1ZwkQ5ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvmJk7e/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvmJk7e/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462A51F00899;
	Fri, 11 Sep 2026 23:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789169064;
	bh=JlnFarw8NbRhZwSeLVRGnXLjwW1I1fHp0/OuJUgPT/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nvmJk7e/8/Jz7HomVpSXd2ACrfEGDX0iaB5GdN6QaNOTSEnzAi3tffP33UxfPH5RZ
	 X5Yh97LxLTCBvBzH88OxKwJTb3cjxhuNta8uEHQv0/6J++FBLi732+JrSOnOm3trrt
	 k7+PvAkabXL0MxA7WMyy9f25sNRru3UnvwpbiGezPeInFG433oPKQJFVTFqO4XwRUx
	 rQIkibLcqtQRf3q61JOkOy8bWrYzlcr+XYyp0zs/EodPcEg3ghzJ32rbjgOhJaIjc8
	 EV34RwzKSS2aIoqzeTFusnOZAC8hR91V2w+hgMKstHSSpf0MlPiIfJ2aVrT7wPeqjI
	 7QqRzQICBTwTQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v7 08/12] f2fs: cache: initialize compress cache
Date: Sat, 12 Sep 2026 07:24:01 +0800
Message-ID: <20260911232405.1815804-9-chao@kernel.org>
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

This patch introduces compress_blocks in f2fs_sb_info structure, initializes
and destroys the compress cache during filesystem mount and unmount.

It adds an ino union field in struct f2fs_cached_block (sharing space
with writeback linkage for zero memory overhead) to track per-inode
cached blocks, and registers compress cache into the memory shrinker.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.c |  9 ++++++++-
 fs/f2fs/cache.h | 14 ++++++++++----
 fs/f2fs/f2fs.h  |  6 ++++++
 fs/f2fs/super.c |  9 ++++++++-
 4 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 7c809773356a..7260c157654b 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -176,7 +176,10 @@ static struct f2fs_cached_block *f2fs_create_cache(
 	entry->index = index;
 
 	atomic_set(&entry->refcount, 0);
-	entry->next_entry = NULL;
+	if (!IS_COMPRESS_CACHE(cache))
+		entry->next_entry = NULL;
+	else
+		entry->ino = 0;
 	INIT_LIST_HEAD(&entry->list);
 
 	entry->cache = cache;
@@ -631,6 +634,10 @@ unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
 		return freed;
 
 	freed += f2fs_do_shrink_cache(NODE_CACHE(sbi), nr_to_scan - freed);
+	if (freed >= nr_to_scan)
+		return freed;
+
+	freed += f2fs_do_shrink_cache(COMPRESS_CACHE(sbi), nr_to_scan - freed);
 	return freed;
 }
 
diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
index 143f82b588d1..d2dd77ca2bc1 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -18,12 +18,15 @@ struct f2fs_rwsem;
 struct f2fs_io_info;
 enum page_type;
 
-/* Represents a single cached block (meta, node) */
+/* Represents a single cached block (meta, node or compress) */
 struct f2fs_cached_block {
 	struct list_head list;		/* LRU list head */
 	struct f2fs_cached_block_list *cache;	/* parent cache list */
-	struct f2fs_cached_block *next_entry;	/* chain for merged BIO */
-	unsigned long index;		/* key in radix tree, (meta: pba, node: nid) */
+	union {
+		struct f2fs_cached_block *next_entry;/* chain for merged BIO */
+		nid_t ino;		/* inode number for compress cache */
+	};
+	unsigned long index;		/* key in radix tree, (meta/compress: pba, node: nid) */
 	unsigned long state;		/* cache entry state (e.g., Dirty, UpToDate) */
 	void *data;			/* blocksize-aligned memory (4KB or 16KB) */
 	atomic_t refcount;		/* reference count */
@@ -34,6 +37,7 @@ struct f2fs_sb_info;
 enum f2fs_cache_type {
 	F2FS_META_CACHE,
 	F2FS_NODE_CACHE,
+	F2FS_COMPRESS_CACHE,
 };
 
 /* Main cache control structure (per sb_info) */
@@ -43,12 +47,13 @@ struct f2fs_cached_block_list {
 	spinlock_t tree_lock;		/* Lock for radix tree */
 	struct list_head lru_list;	/* Single global LRU list */
 	spinlock_t list_lock;		/* Lock for LRU list */
-	enum f2fs_cache_type type;	/* Cache type (Node or Meta) */
+	enum f2fs_cache_type type;	/* Cache type (Node, Meta, Compress) */
 	unsigned long num_entries;	/* Current number of entries */
 };
 
 #define IS_META_CACHE(cache) (cache->type == F2FS_META_CACHE)
 #define IS_NODE_CACHE(cache) (cache->type == F2FS_NODE_CACHE)
+#define IS_COMPRESS_CACHE(cache) (cache->type == F2FS_COMPRESS_CACHE)
 
 /* Flags for f2fs_cached_block state */
 enum f2fs_cached_state {
@@ -200,6 +205,7 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
 
 #define META_CACHE(sbi)		(&(sbi)->meta_blocks)
 #define NODE_CACHE(sbi)		(&(sbi)->node_blocks)
+#define COMPRESS_CACHE(sbi)	(&(sbi)->compress_blocks)
 
 #define f2fs_find_meta_cache(sbi, blkaddr)		\
 	f2fs_find_cache(META_CACHE(sbi), blkaddr, 0)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d6681276708e..1e23e02cac8b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2106,6 +2106,7 @@ struct f2fs_sb_info {
 	/* f2fs internal cache */
 	struct f2fs_cached_block_list meta_blocks;
 	struct f2fs_cached_block_list node_blocks;
+	struct f2fs_cached_block_list compress_blocks;
 
 	/* internal cache flush thread */
 	struct f2fs_cache_kthread cache_thread;
@@ -2384,6 +2385,11 @@ static inline bool f2fs_is_node_cache(struct f2fs_cached_block *entry)
 	return entry->cache && entry->cache == NODE_CACHE(entry->cache->sbi);
 }
 
+static inline bool f2fs_is_compress_cache(struct f2fs_cached_block *entry)
+{
+	return entry->cache && entry->cache == COMPRESS_CACHE(entry->cache->sbi);
+}
+
 static inline struct f2fs_bio *F2FS_BIO(struct bio *bio)
 {
 	return container_of(bio, struct f2fs_bio, bio);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 73f94134d354..5f21a3813671 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2071,6 +2071,7 @@ static void f2fs_put_super(struct super_block *sb)
 
 	f2fs_destroy_compress_inode(sbi);
 
+	f2fs_destroy_cache(COMPRESS_CACHE(sbi));
 	f2fs_destroy_cache(NODE_CACHE(sbi));
 	f2fs_destroy_cache(META_CACHE(sbi));
 
@@ -5269,10 +5270,14 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (err)
 		goto free_meta_cache;
 
+	err = f2fs_init_cache(sbi, COMPRESS_CACHE(sbi), F2FS_COMPRESS_CACHE);
+	if (err)
+		goto free_node_cache;
+
 	err = f2fs_get_valid_checkpoint(sbi);
 	if (err) {
 		f2fs_err(sbi, "Failed to get valid F2FS checkpoint");
-		goto free_node_cache;
+		goto free_compress_cache;
 	}
 
 	if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_QUOTA_NEED_FSCK_FLAG))
@@ -5587,6 +5592,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 free_devices:
 	destroy_device_list(sbi);
 	kvfree(sbi->ckpt);
+free_compress_cache:
+	f2fs_destroy_cache(COMPRESS_CACHE(sbi));
 free_node_cache:
 	f2fs_destroy_cache(NODE_CACHE(sbi));
 free_meta_cache:
-- 
2.49.0

