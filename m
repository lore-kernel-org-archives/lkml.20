Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE403A4539
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666980; cv=none; b=oAkifsBPqShs/rVOOIDaRqvfsrcp1izoD4QbosUEQi2xXtBE77lUAp1OVaOcLl534LXTtcT1f2mvtXbwI6tBZ1PTiXVPgAePl7XuyT0LCAX9QHmcIBKKTB+WSkZOlCpIlwOzvbtFf0VvlaybZMwFlIWMzkuiWuobvIMoi9Eek84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666980; c=relaxed/simple;
	bh=bIY3Q+gsjsbdOx8bP7qX2uTyclEtvAuAJFztawGW4Fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b61Gj0MFZaIB1y2ycm8ObGX2ymll8fel7A8fHY4mZ8IIJ8iavMfyp0rq0HRZQgE+d9ZZv4dD423P6UFIzkwYhG1CEHIE1rOggI/3MpUhm7HoJ8kI/ZJtm5x6PcAgALsJ7VVuItr5Sgf6tZBnq9IcKvVWQDKTqaatL1JB+Mqfzxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s968W4lJ; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s968W4lJ"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a491fecaa5so542936a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666976; x=1791271776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnEfE1pe6kxoyichRQ4zL3yWerWQ5FxxofpTTQKI/p8=;
        b=s968W4lJmDei7vRl9XAZhs2fixx1nAgxXGx/kAoQGuTSrAT4dMmFjZmy7Un1egIsKa
         G0wzp9i8uNxIgmlXE/Af+QFUSVglOObByVk2q9fTDa1MbvCq+J+8xyRCNQAqBLOELDFZ
         hMEtUpHSE16MAXJVxkwT5Py+Cu6XISO2K4ELrG7caVvo7BnO/wcfaDeSEfV76cE2ZeWk
         lx+fqNJOfHXEvR1KJ8ufN/l6gyRouKWed5gSk5sb15xLqF9JuMPZMtp1YsB1pLlBdLlZ
         Xfgcq1g1Eu8SjfMse3iV+K/3Z2F9sy4jNoiY248VTSi1AMNYKf6b3zC5kUE97Td+nR8U
         69aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666976; x=1791271776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnEfE1pe6kxoyichRQ4zL3yWerWQ5FxxofpTTQKI/p8=;
        b=Gce1VlVxa8YEX6KMc4eTJqI1uL3QKak5xIDnoHzkjIyFjYwYdIKLzVKvKst0aJRzZx
         NQ6ht44TxQ3eBlPSPTX/nKI4SdIQDMdSs/z3j5VUz6IgIhdIQMooGyteB9yktq0iXSgq
         BbMU8Xt6c2seuw4GogHWy4PYAjAhzGyFnDrEscT6BD3zdHXmo0kiojKsulqJBKGLBWHx
         byw8PQrg6szhKKTuk39fYmk9tKXCD/E5wcxNDfm9C+hrT+UGND+j57ebNTuyRQkuVLMA
         0+ZaXRMQEFYcL8k2K0cMT03yg4IdqO+a+e/arTCRkybmwh6BDyI11AXmU6Vbeq0Asjz3
         amYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxprZXJWjflE2nXKz2e9/mC3O4nON4lVHX8dY7tmEewDszhReUHB86ZVnnVFFEFRBGVkG0HZ/VxqVS8qsU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3u97nga+3PNY2wu06cvyXi0brucihu/i6Bitkh9z2/WSw6uSJ
	q4Y1bHqzZXFCf7ljFzHXZhYNmoTNWEatU85JRb6Xx9i1disLXbgtLZUp
X-Gm-Gg: AYBFou1z96M7job40IRpOoqHcevoFpmQNJtsC9UDAqJ6vP0/5ZpgROl8NDJHPo6+V+j
	zHG902K4CUTH8lPuuVXjwLibBYV4zpvdPXJoavH53ZdJTclkX254uP2BlD+odpgkjXQf510dbP9
	1OtqVDWSKQyJaCt5FJOpTcF9KcQTApfKD5/75TTr0Q8uxOM7NWcbbJQ8LH7k0aVVXa7TFU88hgh
	AfPrhKHShlhX5MepKwm2bi8wP1nnxuInkslIE+ZmPWzdoUNXOtdeI4hR3rLPNF4f+O1sHoVnZVX
	Qt2fRKq9QiTDdzO9Egqba9YAnGs0YiebgSotzVk+pwOYlKWdJc3APXP4s6aurq1qZuKV6WSBmez
	SkInUHqHHz4Immj0dsZN6SM5KNg4VOfqcnI7Ppaz1BIT+RQblYuncnMm/+HH22SLmgkHmAtfPuY
	aJnyxtSNfVBoig0DXqzS6ABAuDsaw7+2B88ojPLKU3wmvuNiFDyiETwQqI+JdXCqKTBqfMStj66
	rwYLwFwjcgjmygHG4R4btwxFqur7b0fnBc=
X-Received: by 2002:a17:90b:4b0f:b0:39e:4c80:f67f with SMTP id 98e67ed59e1d1-3a098983faemr12981101a91.30.1790666976228;
        Tue, 29 Sep 2026 00:29:36 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49804220fsm3900170a91.12.2026.09.29.00.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:29:35 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Wenjie Qi <qiwenjie@xiaomi.com>
Subject: [RFC PATCH 2/6] f2fs: add compressed clean node cache representation
Date: Tue, 29 Sep 2026 15:29:15 +0800
Message-ID: <233c44340813cb2186ee187c00f2522e6ad578cb.1790665952.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790665952.git.qiwenjie@xiaomi.com>
References: <cover.1790665952.git.qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A clean node-cache entry currently retains a full block until it is
reclaimed. Add an optional compressed representation that keeps the entry
and its NID in memory with a smaller payload.

Use an extended NODE_CACHE entry and per-mount 256, 512 and 1024-byte
private slabs. Raw entries remain on the existing LRU, while compressed
entries use one queue per allocation size.

Keep raw and compressed ownership exclusive, and make detach and teardown
aware of the compressed queues. If the compression resources cannot be
initialized, leave node compression disabled instead of failing the mount.
The generic entry layout remains unchanged when the feature is disabled.

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/Kconfig               |  12 ++
 fs/f2fs/Makefile              |   1 +
 fs/f2fs/cache.c               |  27 ++-
 fs/f2fs/cache.h               |   8 +
 fs/f2fs/debug.c               |  10 +-
 fs/f2fs/f2fs.h                |   7 +
 fs/f2fs/node_cache_compress.c | 303 ++++++++++++++++++++++++++++++++++
 fs/f2fs/node_cache_compress.h |  78 +++++++++
 fs/f2fs/node_cache_policy.h   |  23 +++
 fs/f2fs/super.c               |   4 +
 10 files changed, 462 insertions(+), 11 deletions(-)
 create mode 100644 fs/f2fs/node_cache_compress.c
 create mode 100644 fs/f2fs/node_cache_compress.h
 create mode 100644 fs/f2fs/node_cache_policy.h

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 5916a02fb46d..5aa54916e594 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -99,6 +99,18 @@ config F2FS_FS_COMPRESSION
 	  Enable filesystem-level compression on f2fs regular files,
 	  multiple back-end compression algorithms are supported.
 
+config F2FS_FS_NODE_CACHE_COMPRESSION
+	bool "F2FS clean node cache compression"
+	depends on F2FS_FS
+	select LZ4_COMPRESS
+	select LZ4_DECOMPRESS
+	default n
+	help
+	  Retain clean node-cache blocks in a private compressed store.
+	  This is independent of file-data compression and COMPRESS_CACHE.
+	  The store uses 256, 512 and 1024 byte slab buckets.
+	  Compression is disabled at runtime until a nonzero threshold is set.
+
 config F2FS_FS_LZO
 	bool "LZO compression support"
 	depends on F2FS_FS_COMPRESSION
diff --git a/fs/f2fs/Makefile b/fs/f2fs/Makefile
index fbf49c30b066..e1e4b98707e9 100644
--- a/fs/f2fs/Makefile
+++ b/fs/f2fs/Makefile
@@ -9,4 +9,5 @@ f2fs-$(CONFIG_F2FS_FS_XATTR) += xattr.o
 f2fs-$(CONFIG_F2FS_FS_POSIX_ACL) += acl.o
 f2fs-$(CONFIG_FS_VERITY) += verity.o
 f2fs-$(CONFIG_F2FS_FS_COMPRESSION) += compress.o
+f2fs-$(CONFIG_F2FS_FS_NODE_CACHE_COMPRESSION) += node_cache_compress.o
 f2fs-$(CONFIG_F2FS_IOSTAT) += iostat.o
diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 8f81aed132ed..3d1d530cdd82 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -17,6 +17,7 @@
 #include "node.h"
 #include <trace/events/f2fs.h>
 #include "segment.h"
+#include "node_cache_compress.h"
 
 void f2fs_cache_wait_writeback_cond(struct f2fs_cached_block *entry,
 					enum page_type type)
@@ -127,7 +128,7 @@ static int f2fs_cache_refcount(struct f2fs_cached_block *entry)
 
 static void f2fs_do_free_cache(struct f2fs_cached_block *entry)
 {
-	kfree(entry->data);
+	f2fs_nc_free_data(entry);
 	kfree(entry);
 }
 
@@ -159,6 +160,7 @@ static struct f2fs_cached_block *f2fs_create_cache(
 {
 	struct f2fs_sb_info *sbi = cache->sbi;
 	struct f2fs_cached_block *entry;
+	size_t entry_size = f2fs_nc_entry_alloc_size(cache);
 	unsigned int flags = GFP_NOFS;
 
 	if (index == ULONG_MAX)
@@ -166,10 +168,10 @@ static struct f2fs_cached_block *f2fs_create_cache(
 
 	if (nofail) {
 		flags |= __GFP_NOFAIL;
-		entry = kzalloc_obj(*entry, flags);
+		entry = kzalloc(entry_size, flags);
 		entry->data = kmalloc(sbi->blocksize, flags);
 	} else {
-		entry = f2fs_kzalloc(sbi, sizeof(*entry), flags);
+		entry = f2fs_kzalloc(sbi, entry_size, flags);
 		if (!entry)
 			return ERR_PTR(-ENOMEM);
 
@@ -220,6 +222,7 @@ static struct f2fs_cached_block *f2fs_insert_cache(
 		f2fs_bug_on(cache->sbi, !list_empty(&e->list));
 		list_add_tail(&e->list, &cache->lru_list);
 		cache->num_entries++;
+		f2fs_nc_entry_attached(e);
 	}
 	f2fs_cache_get(e);
 	spin_unlock_irqrestore(&cache->tree_lock, flags);
@@ -429,8 +432,9 @@ static void f2fs_do_truncate_cache(struct f2fs_cached_block *entry,
 	if (!radix_tree_delete(&cache->root, entry->index))
 		f2fs_bug_on(cache->sbi, !entry->cache);
 
-	entry->cache = NULL;
 	cache->num_entries--;
+	f2fs_nc_entry_detached(entry);
+	entry->cache = NULL;
 
 	atomic_dec(&entry->refcount);
 	f2fs_bug_on(cache->sbi, !f2fs_cache_refcount(entry));
@@ -514,14 +518,24 @@ int f2fs_init_cache(struct f2fs_sb_info *sbi,
 
 void f2fs_destroy_cache(struct f2fs_cached_block_list *cache)
 {
-	struct list_head *head = &cache->lru_list;
+	struct list_head *head;
 	struct f2fs_cached_block *entry;
 	unsigned long flags;
+	unsigned int queue;
 
 	f2fs_cache_wait_on_all_writeback(cache);
 next:
 	spin_lock(&cache->list_lock);
-	if (list_empty(head)) {
+	head = NULL;
+	for (queue = 0; queue < F2FS_NC_NR_QUEUES; queue++) {
+		struct list_head *candidate = f2fs_nc_queue_head(cache, queue);
+
+		if (candidate && !list_empty(candidate)) {
+			head = candidate;
+			break;
+		}
+	}
+	if (!head) {
 		spin_unlock(&cache->list_lock);
 		return;
 	}
@@ -530,6 +544,7 @@ void f2fs_destroy_cache(struct f2fs_cached_block_list *cache)
 	spin_lock_irqsave(&cache->tree_lock, flags);
 	radix_tree_delete(&cache->root, entry->index);
 	cache->num_entries--;
+	f2fs_nc_entry_detached(entry);
 	list_del_init(&entry->list);
 	spin_unlock_irqrestore(&cache->tree_lock, flags);
 
diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
index c4c3d09a0008..8a1eab71b1ae 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -64,6 +64,9 @@ enum f2fs_cached_state {
 	F2FS_BLOCK_WRITEBACK,		/* cache data is writeback state */
 	F2FS_BLOCK_REFERENCED,		/* cache was accessed recently, shrinker will skip it for once */
 	F2FS_BLOCK_INLINE_DATA,		/* indicate inline data */
+#ifdef CONFIG_F2FS_FS_NODE_CACHE_COMPRESSION
+	F2FS_BLOCK_COMPRESSED,
+#endif
 };
 
 enum {
@@ -144,6 +147,11 @@ F2FS_CACHE_FLAG_CLEAR_FUNC(inline, INLINE_DATA);
 F2FS_CACHE_FLAG_TEST_FUNC(referenced, REFERENCED);
 F2FS_CACHE_FLAG_SET_FUNC(referenced, REFERENCED);
 F2FS_CACHE_FLAG_TEST_AND_CLEAR_FUNC(referenced, REFERENCED);
+#ifdef CONFIG_F2FS_FS_NODE_CACHE_COMPRESSION
+F2FS_CACHE_FLAG_TEST_FUNC(compressed, COMPRESSED);
+F2FS_CACHE_FLAG_SET_FUNC(compressed, COMPRESSED);
+F2FS_CACHE_FLAG_CLEAR_FUNC(compressed, COMPRESSED);
+#endif
 
 static inline void *cache_address(const struct f2fs_cached_block *entry)
 {
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 6fe606e2c70d..a6096537b495 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -19,6 +19,7 @@
 #include "node.h"
 #include "segment.h"
 #include "gc.h"
+#include "node_cache_compress.h"
 
 static LIST_HEAD(f2fs_stat_list);
 static DEFINE_SPINLOCK(f2fs_stat_lock);
@@ -297,6 +298,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 static void update_mem_info(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_stat_info *si = F2FS_STAT(sbi);
+	struct f2fs_nc_memory node_memory;
 	int i;
 
 	if (si->base_mem)
@@ -386,11 +388,9 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 	si->cache_data_mem[F2FS_META_CACHE] =
 		(unsigned long long)META_CACHE(sbi)->num_entries * sbi->blocksize;
 
-	si->cache_entry_mem[F2FS_NODE_CACHE] =
-		(unsigned long long)NODE_CACHE(sbi)->num_entries *
-		sizeof(struct f2fs_cached_block);
-	si->cache_data_mem[F2FS_NODE_CACHE] =
-		(unsigned long long)NODE_CACHE(sbi)->num_entries * sbi->blocksize;
+	f2fs_nc_memory_usage(sbi, &node_memory);
+	si->cache_entry_mem[F2FS_NODE_CACHE] = node_memory.entry_bytes;
+	si->cache_data_mem[F2FS_NODE_CACHE] = node_memory.data_bytes;
 
 	si->cache_mem += si->cache_entry_mem[F2FS_META_CACHE] +
 			 si->cache_entry_mem[F2FS_NODE_CACHE];
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 089a62c054ea..16cc050124dd 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -26,6 +26,10 @@
 #include <linux/part_stat.h>
 #include <linux/rw_hint.h>
 
+#ifdef CONFIG_F2FS_FS_NODE_CACHE_COMPRESSION
+struct f2fs_nc_ctx;
+#endif
+
 #include <linux/fscrypt.h>
 #include <linux/fsverity.h>
 
@@ -2106,6 +2110,9 @@ struct f2fs_sb_info {
 	struct f2fs_cached_block_list meta_blocks;
 	struct f2fs_cached_block_list node_blocks;
 	struct f2fs_cached_block_list compress_blocks;
+#ifdef CONFIG_F2FS_FS_NODE_CACHE_COMPRESSION
+	struct f2fs_nc_ctx *node_compress;
+#endif
 
 	/* internal cache flush thread */
 	struct f2fs_cache_kthread cache_thread;
diff --git a/fs/f2fs/node_cache_compress.c b/fs/f2fs/node_cache_compress.c
new file mode 100644
index 000000000000..486da4ed6082
--- /dev/null
+++ b/fs/f2fs/node_cache_compress.c
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/atomic.h>
+#include <linux/f2fs_fs.h>
+#include <linux/refcount.h>
+#include <linux/slab.h>
+
+#include "f2fs.h"
+#include "node_cache_compress.h"
+
+static const u32 f2fs_nc_bucket_sizes[] = {
+	F2FS_NC_BUCKET_256_SIZE,
+	F2FS_NC_BUCKET_512_SIZE,
+	F2FS_NC_BUCKET_1024_SIZE,
+};
+
+/* One private slab and active-object count for each compressed bucket. */
+struct f2fs_nc_store {
+	struct kmem_cache *caches[ARRAY_SIZE(f2fs_nc_bucket_sizes)];
+	atomic_long_t objects[ARRAY_SIZE(f2fs_nc_bucket_sizes)];
+};
+
+static int f2fs_nc_store_bucket_from_size(u32 alloc_size)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(f2fs_nc_bucket_sizes); i++)
+		if (alloc_size == f2fs_nc_bucket_sizes[i])
+			return i;
+	return -EINVAL;
+}
+
+static struct f2fs_nc_store *f2fs_nc_store_create(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_nc_store *store;
+	char name[64];
+	int i;
+
+	store = kzalloc_obj(*store, GFP_NOFS);
+	if (!store)
+		return NULL;
+	for (i = 0; i < ARRAY_SIZE(f2fs_nc_bucket_sizes); i++) {
+		if (snprintf(name, sizeof(name), "f2fs-nc-%u-%u-%u",
+			     MAJOR(sbi->sb->s_dev), MINOR(sbi->sb->s_dev),
+			     f2fs_nc_bucket_sizes[i]) >= sizeof(name))
+			goto fail;
+		store->caches[i] = kmem_cache_create(name,
+						     f2fs_nc_bucket_sizes[i], 0,
+				SLAB_RECLAIM_ACCOUNT | SLAB_NO_MERGE, NULL);
+		if (!store->caches[i])
+			goto fail;
+	}
+	return store;
+
+fail:
+	while (i--)
+		kmem_cache_destroy(store->caches[i]);
+	kfree(store);
+	return NULL;
+}
+
+static void f2fs_nc_store_destroy(struct f2fs_nc_store *store)
+{
+	int i;
+
+	if (!store)
+		return;
+	for (i = ARRAY_SIZE(f2fs_nc_bucket_sizes); i-- > 0;) {
+		WARN_ON_ONCE(atomic_long_read(&store->objects[i]));
+		kmem_cache_destroy(store->caches[i]);
+	}
+	kfree(store);
+}
+
+static void f2fs_nc_store_free(struct f2fs_nc_store *store, void *object,
+			       u32 alloc_size)
+{
+	int bucket = f2fs_nc_store_bucket_from_size(alloc_size);
+
+	if (WARN_ON_ONCE(!store || !object || bucket < 0))
+		return;
+	kmem_cache_free(store->caches[bucket], object);
+	atomic_long_dec(&store->objects[bucket]);
+}
+
+/*
+ * Per-superblock compression state.  Compressed objects hold references, so
+ * the context can outlive its mount until every detached object is freed.
+ */
+struct f2fs_nc_ctx {
+	struct f2fs_sb_info *sbi;
+	struct f2fs_nc_store *store;
+	/* Compressed queues only; raw entries use NODE_CACHE()->lru_list. */
+	struct list_head queues[F2FS_NC_NR_QUEUES - 1];
+	/* Current population and compressed bytes by queue. */
+	atomic_long_t attached[F2FS_NC_NR_QUEUES];
+	atomic64_t attached_payload[F2FS_NC_NR_QUEUES - 1];
+	atomic64_t attached_slot_bytes[F2FS_NC_NR_QUEUES - 1];
+	/* Cumulative detach statistics since mount. */
+	atomic64_t detached[F2FS_NC_NR_QUEUES];
+	/* Mount reference plus references held by compressed objects. */
+	refcount_t refs;
+};
+
+static struct f2fs_node_cached_block *f2fs_nc_node_entry(struct f2fs_cached_block *entry)
+{
+	return container_of(entry, struct f2fs_node_cached_block, base);
+}
+
+static void f2fs_nc_ctx_release(struct f2fs_nc_ctx *ctx)
+{
+	int i;
+
+	for (i = 0; i < F2FS_NC_NR_QUEUES; i++)
+		WARN_ON_ONCE(atomic_long_read(&ctx->attached[i]));
+	f2fs_nc_store_destroy(ctx->store);
+	kfree(ctx);
+}
+
+static void f2fs_nc_ctx_put(struct f2fs_nc_ctx *ctx)
+{
+	if (refcount_dec_and_test(&ctx->refs))
+		f2fs_nc_ctx_release(ctx);
+}
+
+static void f2fs_nc_account_add(struct f2fs_nc_ctx *ctx, unsigned int queue,
+				u32 len, u32 alloc_size)
+{
+	atomic_long_inc(&ctx->attached[queue]);
+	if (queue == F2FS_NC_RAW)
+		return;
+	atomic64_add(len, &ctx->attached_payload[queue - 1]);
+	atomic64_add(alloc_size, &ctx->attached_slot_bytes[queue - 1]);
+}
+
+static void f2fs_nc_account_del(struct f2fs_nc_ctx *ctx, unsigned int queue,
+				u32 len, u32 alloc_size)
+{
+	WARN_ON_ONCE(atomic_long_read(&ctx->attached[queue]) <= 0);
+	atomic_long_dec(&ctx->attached[queue]);
+	if (queue == F2FS_NC_RAW)
+		return;
+	WARN_ON_ONCE(atomic64_read(&ctx->attached_payload[queue - 1]) < len);
+	WARN_ON_ONCE(atomic64_read(&ctx->attached_slot_bytes[queue - 1]) <
+			alloc_size);
+	atomic64_sub(len, &ctx->attached_payload[queue - 1]);
+	atomic64_sub(alloc_size, &ctx->attached_slot_bytes[queue - 1]);
+}
+
+size_t f2fs_nc_entry_alloc_size(struct f2fs_cached_block_list *cache)
+{
+	if (IS_NODE_CACHE(cache) && cache->sbi->node_compress)
+		return sizeof(struct f2fs_node_cached_block);
+	return sizeof(struct f2fs_cached_block);
+}
+
+void f2fs_nc_init(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_nc_ctx *ctx;
+	int i;
+
+	ctx = kzalloc_obj(*ctx, GFP_NOFS);
+	if (!ctx)
+		goto fail_open;
+	ctx->sbi = sbi;
+	ctx->store = f2fs_nc_store_create(sbi);
+	if (!ctx->store)
+		goto fail_open;
+	for (i = 0; i < ARRAY_SIZE(ctx->queues); i++)
+		INIT_LIST_HEAD(&ctx->queues[i]);
+	refcount_set(&ctx->refs, 1);
+	sbi->node_compress = ctx;
+	return;
+
+fail_open:
+	if (ctx)
+		f2fs_nc_ctx_release(ctx);
+	f2fs_warn_ratelimited(sbi,
+			      "node cache compression resources are unavailable");
+}
+
+void f2fs_nc_destroy(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_nc_ctx *ctx = sbi->node_compress;
+
+	if (!ctx)
+		return;
+	sbi->node_compress = NULL;
+	f2fs_nc_ctx_put(ctx);
+}
+
+struct list_head *f2fs_nc_queue_head(struct f2fs_cached_block_list *cache,
+				     unsigned int queue)
+{
+	struct f2fs_nc_ctx *ctx;
+
+	if (queue == F2FS_NC_RAW)
+		return &cache->lru_list;
+	if (!IS_NODE_CACHE(cache) || queue >= F2FS_NC_NR_QUEUES)
+		return NULL;
+	ctx = cache->sbi->node_compress;
+	return ctx ? &ctx->queues[queue - 1] : NULL;
+}
+
+unsigned int f2fs_nc_entry_queue(const struct f2fs_cached_block *entry)
+{
+	const struct f2fs_node_cached_block *node;
+	int bucket;
+
+	if (!f2fs_cache_test_compressed(entry))
+		return F2FS_NC_RAW;
+	node = container_of(entry, struct f2fs_node_cached_block, base);
+	bucket = f2fs_nc_store_bucket_from_size(node->compressed_alloc_size);
+	if (WARN_ON_ONCE(bucket < 0))
+		return F2FS_NC_RAW;
+	return bucket + 1;
+}
+
+void f2fs_nc_entry_attached(struct f2fs_cached_block *entry)
+{
+	struct f2fs_nc_ctx *ctx;
+
+	if (!entry->cache || !IS_NODE_CACHE(entry->cache))
+		return;
+	ctx = entry->cache->sbi->node_compress;
+	if (ctx)
+		f2fs_nc_account_add(ctx, F2FS_NC_RAW, 0, 0);
+}
+
+void f2fs_nc_entry_detached(struct f2fs_cached_block *entry)
+{
+	struct f2fs_node_cached_block *node;
+	struct f2fs_nc_ctx *ctx;
+	unsigned int queue;
+	u32 len = 0, alloc_size = 0;
+
+	if (!entry->cache || !IS_NODE_CACHE(entry->cache))
+		return;
+	ctx = entry->cache->sbi->node_compress;
+	if (!ctx)
+		return;
+	queue = f2fs_nc_entry_queue(entry);
+	if (queue != F2FS_NC_RAW) {
+		node = f2fs_nc_node_entry(entry);
+		len = node->compressed_len;
+		alloc_size = node->compressed_alloc_size;
+	}
+	atomic64_inc(&ctx->detached[queue]);
+	f2fs_nc_account_del(ctx, queue, len, alloc_size);
+}
+
+void f2fs_nc_free_data(struct f2fs_cached_block *entry)
+{
+	struct f2fs_node_cached_block *node;
+	struct f2fs_nc_ctx *ctx;
+	void *object;
+	u32 alloc_size;
+
+	if (!f2fs_cache_test_compressed(entry)) {
+		kfree(entry->data);
+		return;
+	}
+	node = f2fs_nc_node_entry(entry);
+	ctx = node->owner;
+	object = entry->data;
+	alloc_size = node->compressed_alloc_size;
+	if (WARN_ON_ONCE(!ctx || !object ||
+			 f2fs_nc_store_bucket_from_size(alloc_size) < 0))
+		return;
+	f2fs_cache_clear_compressed(entry);
+	entry->data = NULL;
+	node->owner = NULL;
+	node->compressed_len = 0;
+	node->compressed_alloc_size = 0;
+	node->compressed_crc = 0;
+	f2fs_nc_store_free(ctx->store, object, alloc_size);
+	f2fs_nc_ctx_put(ctx);
+}
+
+void f2fs_nc_memory_usage(struct f2fs_sb_info *sbi,
+			  struct f2fs_nc_memory *memory)
+{
+	struct f2fs_nc_ctx *ctx = sbi->node_compress;
+	u64 entries = 0, data = 0;
+	unsigned int i;
+
+	if (!ctx) {
+		memory->entry_bytes = (u64)NODE_CACHE(sbi)->num_entries *
+				sizeof(struct f2fs_cached_block);
+		memory->data_bytes = (u64)NODE_CACHE(sbi)->num_entries *
+				sbi->blocksize;
+		return;
+	}
+	spin_lock(&NODE_CACHE(sbi)->list_lock);
+	for (i = 0; i < F2FS_NC_NR_QUEUES; i++)
+		entries += atomic_long_read(&ctx->attached[i]);
+	data = (u64)atomic_long_read(&ctx->attached[F2FS_NC_RAW]) *
+			sbi->blocksize;
+	for (i = 0; i < F2FS_NC_NR_QUEUES - 1; i++)
+		data += atomic64_read(&ctx->attached_slot_bytes[i]);
+	spin_unlock(&NODE_CACHE(sbi)->list_lock);
+	memory->entry_bytes = entries * sizeof(struct f2fs_node_cached_block);
+	memory->data_bytes = data;
+}
diff --git a/fs/f2fs/node_cache_compress.h b/fs/f2fs/node_cache_compress.h
new file mode 100644
index 000000000000..e1a9b45d67e3
--- /dev/null
+++ b/fs/f2fs/node_cache_compress.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __F2FS_NODE_CACHE_COMPRESS_H__
+#define __F2FS_NODE_CACHE_COMPRESS_H__
+
+#include "cache.h"
+#include "node_cache_policy.h"
+
+struct f2fs_nc_ctx;
+
+/* Attributed cache memory, excluding worker workspace and slab metadata. */
+struct f2fs_nc_memory {
+	u64 entry_bytes;	/* Cache-entry storage. */
+	u64 data_bytes;	/* Raw buffers plus compressed slab slots. */
+};
+
+#ifdef CONFIG_F2FS_FS_NODE_CACHE_COMPRESSION
+/* Extended NODE_CACHE entry; base must remain the first member. */
+struct f2fs_node_cached_block {
+	struct f2fs_cached_block base;
+	struct f2fs_nc_ctx *owner;	/* Context owning compressed data. */
+	u32 compressed_len;		/* Valid compressed payload bytes. */
+	u32 compressed_alloc_size;	/* Private-slab slot size. */
+	u32 compressed_crc;		/* CRC of the original node block. */
+};
+
+static_assert(offsetof(struct f2fs_node_cached_block, base) == 0);
+
+size_t f2fs_nc_entry_alloc_size(struct f2fs_cached_block_list *cache);
+void f2fs_nc_init(struct f2fs_sb_info *sbi);
+void f2fs_nc_destroy(struct f2fs_sb_info *sbi);
+void f2fs_nc_free_data(struct f2fs_cached_block *entry);
+struct list_head *f2fs_nc_queue_head(struct f2fs_cached_block_list *cache,
+				     unsigned int queue);
+unsigned int f2fs_nc_entry_queue(const struct f2fs_cached_block *entry);
+void f2fs_nc_entry_attached(struct f2fs_cached_block *entry);
+void f2fs_nc_entry_detached(struct f2fs_cached_block *entry);
+void f2fs_nc_memory_usage(struct f2fs_sb_info *sbi,
+			  struct f2fs_nc_memory *memory);
+#else
+static inline size_t f2fs_nc_entry_alloc_size(struct f2fs_cached_block_list *cache)
+{
+	return sizeof(struct f2fs_cached_block);
+}
+
+static inline void f2fs_nc_init(struct f2fs_sb_info *sbi) { }
+
+static inline void f2fs_nc_destroy(struct f2fs_sb_info *sbi) { }
+
+static inline void f2fs_nc_free_data(struct f2fs_cached_block *entry)
+{
+	kfree(entry->data);
+}
+
+static inline struct list_head *f2fs_nc_queue_head(struct f2fs_cached_block_list *cache,
+						   unsigned int queue)
+{
+	return queue == F2FS_NC_RAW ? &cache->lru_list : NULL;
+}
+
+static inline unsigned int
+f2fs_nc_entry_queue(const struct f2fs_cached_block *entry)
+{
+	return F2FS_NC_RAW;
+}
+
+static inline void f2fs_nc_entry_attached(struct f2fs_cached_block *entry) { }
+static inline void f2fs_nc_entry_detached(struct f2fs_cached_block *entry) { }
+
+static inline void f2fs_nc_memory_usage(struct f2fs_sb_info *sbi,
+					struct f2fs_nc_memory *memory)
+{
+	memory->entry_bytes = (u64)NODE_CACHE(sbi)->num_entries *
+			sizeof(struct f2fs_cached_block);
+	memory->data_bytes = (u64)NODE_CACHE(sbi)->num_entries * sbi->blocksize;
+}
+#endif
+
+#endif /* __F2FS_NODE_CACHE_COMPRESS_H__ */
diff --git a/fs/f2fs/node_cache_policy.h b/fs/f2fs/node_cache_policy.h
new file mode 100644
index 000000000000..efe906bfcc58
--- /dev/null
+++ b/fs/f2fs/node_cache_policy.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __F2FS_NODE_CACHE_POLICY_H__
+#define __F2FS_NODE_CACHE_POLICY_H__
+
+#include <linux/types.h>
+
+#define F2FS_NC_BUCKET_256_SIZE		256U
+#define F2FS_NC_BUCKET_512_SIZE		512U
+#define F2FS_NC_BUCKET_1024_SIZE	1024U
+#define F2FS_NC_MAX_OBJECT_SIZE		F2FS_NC_BUCKET_1024_SIZE
+
+/*
+ * Keep compressed queues in the same order as f2fs_nc_bucket_sizes[].
+ * Raw entries remain on NODE_CACHE(sbi)->lru_list.
+ */
+enum f2fs_nc_queue {
+	F2FS_NC_RAW,
+	F2FS_NC_256,
+	F2FS_NC_512,
+	F2FS_NC_1024,
+	F2FS_NC_NR_QUEUES,
+};
+#endif /* __F2FS_NODE_CACHE_POLICY_H__ */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 294f6f2c28a5..461209293dba 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -32,6 +32,7 @@
 #include <linux/fserror.h>
 
 #include "f2fs.h"
+#include "node_cache_compress.h"
 #include "node.h"
 #include "segment.h"
 #include "xattr.h"
@@ -2071,6 +2072,7 @@ static void f2fs_put_super(struct super_block *sb)
 
 	f2fs_destroy_cache(COMPRESS_CACHE(sbi));
 	f2fs_destroy_cache(NODE_CACHE(sbi));
+	f2fs_nc_destroy(sbi);
 	f2fs_destroy_cache(META_CACHE(sbi));
 
 	/* Should check the page counts after dropping all node/meta pages */
@@ -5263,6 +5265,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	f2fs_init_cache(sbi, META_CACHE(sbi), F2FS_META_CACHE);
 	f2fs_init_cache(sbi, NODE_CACHE(sbi), F2FS_NODE_CACHE);
 	f2fs_init_cache(sbi, COMPRESS_CACHE(sbi), F2FS_COMPRESS_CACHE);
+	f2fs_nc_init(sbi);
 
 	err = f2fs_get_valid_checkpoint(sbi);
 	if (err) {
@@ -5581,6 +5584,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 free_compress_cache:
 	f2fs_destroy_cache(COMPRESS_CACHE(sbi));
 	f2fs_destroy_cache(NODE_CACHE(sbi));
+	f2fs_nc_destroy(sbi);
 	f2fs_destroy_cache(META_CACHE(sbi));
 	f2fs_destroy_page_array_cache(sbi);
 free_percpu:
-- 
2.43.0

