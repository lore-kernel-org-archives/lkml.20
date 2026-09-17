Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A49C46F482
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630437; cv=none; b=VFV9S0TBYsQx3N59bK7iBtGbsWUsXKhU9ncf6CGGzSmLdmwz28bcYk3YHYxq6YiO53FCLrndWqPitdrdRLlyHUoJ6MSolAUjWf+x4nt2RpN6zkKj7QwUdYhlr9bmDSYtzaum6RVuq7e4kLpHBHRgoLPGqGbuONBUG2lM73AdySE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630437; c=relaxed/simple;
	bh=PcJdzcDgzbP45nyEueNEhno3kjh9NLX67lhAFXpI10s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecKQkNQVZxPVQpJMpdoJB3oh+HJ0SmP38N1NZYvqs6SPOOS6IzfIq5cV2W/IuSlIYJ91ia0+3pIEfDHx5nnBfs0XJTwICNrW1o9QhF5UNSGMoOJpm3szjHDC/Gvgz5HHhbHkMDIThdyQnH00Mpuu/YO0YdIxlV1hUgIqWcUNsjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxg0vrbe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxg0vrbe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FCC1F000FF;
	Thu, 17 Sep 2026 07:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789630435;
	bh=4cGCXX1mvu9N92x0nMTOvPtTo3sAsVkuF26H1EMF9N8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cxg0vrbetwzox+H88WGRgRtp5PJOfnmArlAjWaJHztKdBJuAE6n65tHl95Nk8vIre
	 qW9Hgu5J78RJpr5v3c7gEOaAqZxJ5OPHcQpqfuf/iyPNgD9ZyHEH70wf3OVdklNKdN
	 NIPRKUFCyALTpa4R7b6+EVJH81uF2fXRUoQz7hR0Yu7UiZd4Dpq2WL+7MaFCunDFIe
	 vnZXyqGCdcNMOYAV6bobXi6fs2zp5IWDi+BXKaNpI48WRMGZ8HBRW0v4VhNgWT669x
	 olcfponst1Myj3bg3B18BuS/t4v8TwiGZt8JLD1wmbtLnDaA8/fn5dSF4gUj06vMFr
	 a/ZSiihTawU/w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	Zhiguo Niu <zhiguo.niu@unisoc.com>
Subject: [PATCH v9 06/12] f2fs: cache: initialize node cache
Date: Thu, 17 Sep 2026 15:33:37 +0800
Message-ID: <20260917073343.2823157-7-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260917073343.2823157-1-chao@kernel.org>
References: <20260917073343.2823157-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

This patch introduces node_blocks in f2fs_sb_info structure, initializes
and destroys the node cache during filesystem mount and unmount.

It also introduces helper wrappers for node cache operation, and registers
node cache into the memory shrinker and writeback kthread.

Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.c |  9 ++++++++-
 fs/f2fs/cache.h | 11 +++++++++++
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/super.c |  7 +++++--
 4 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index cec7e362001d..4579fa9ad560 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -626,7 +626,14 @@ static unsigned long f2fs_do_shrink_cache(struct f2fs_cached_block_list *cache,
 unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
 					unsigned long nr_to_scan)
 {
-	return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
+	unsigned long freed;
+
+	freed = f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
+	if (freed >= nr_to_scan)
+		return freed;
+
+	freed += f2fs_do_shrink_cache(NODE_CACHE(sbi), nr_to_scan - freed);
+	return freed;
 }
 
 static int f2fs_cache_writeback_kthread(void *data)
diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
index 2273a5ab4924..e1376883133a 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -194,6 +194,7 @@ void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
 		unsigned long start, unsigned long len, bool drop_dirty);
 
 #define META_CACHE(sbi)		(&(sbi)->meta_blocks)
+#define NODE_CACHE(sbi)		(&(sbi)->node_blocks)
 
 #define f2fs_find_meta_cache(sbi, blkaddr)		\
 	f2fs_find_cache(META_CACHE(sbi), blkaddr, 0)
@@ -202,6 +203,16 @@ void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
 #define f2fs_truncate_meta_caches(sbi, start, len)	\
 	f2fs_drop_cache_range(META_CACHE(sbi), start, len, true)
 
+#define f2fs_grab_node_cache(sbi, blkaddr)		\
+	f2fs_grab_cache(NODE_CACHE(sbi), blkaddr,	\
+	F2FS_CACHE_LOCK_CREATE)
+#define f2fs_find_node_cache(sbi, blkaddr)		\
+	f2fs_find_cache(NODE_CACHE(sbi), blkaddr)
+#define f2fs_invalidate_node_cache(sbi, blkaddr)	\
+	f2fs_drop_cache_range(NODE_CACHE(sbi), blkaddr, 1, false)
+#define f2fs_truncate_node_caches(sbi, start, len)	\
+	f2fs_drop_cache_range(NODE_CACHE(sbi), start, len, true)
+
 unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
 				unsigned long nr_to_scan);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e2b29067eb0a..51c191c514bc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2108,6 +2108,7 @@ struct f2fs_sb_info {
 
 	/* f2fs internal cache */
 	struct f2fs_cached_block_list meta_blocks;
+	struct f2fs_cached_block_list node_blocks;
 
 	/* internal cache flush thread */
 	struct f2fs_cache_kthread cache_thread;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1e6b9374df97..fa19152cd4da 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2092,6 +2092,7 @@ static void f2fs_put_super(struct super_block *sb)
 	sbi->node_inode = NULL;
 
 	f2fs_destroy_cache(META_CACHE(sbi));
+	f2fs_destroy_cache(NODE_CACHE(sbi));
 
 	/* Should check the page counts after dropping all node/meta pages */
 	for (i = 0; i < NR_COUNT_TYPE; i++) {
@@ -5282,11 +5283,12 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto free_percpu;
 
 	f2fs_init_cache(sbi, META_CACHE(sbi), F2FS_META_CACHE);
+	f2fs_init_cache(sbi, NODE_CACHE(sbi), F2FS_NODE_CACHE);
 
 	err = f2fs_get_valid_checkpoint(sbi);
 	if (err) {
 		f2fs_err(sbi, "Failed to get valid F2FS checkpoint");
-		goto free_meta_cache;
+		goto free_node_cache;
 	}
 
 	if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_QUOTA_NEED_FSCK_FLAG))
@@ -5612,7 +5614,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 free_devices:
 	destroy_device_list(sbi);
 	kvfree(sbi->ckpt);
-free_meta_cache:
+free_node_cache:
+	f2fs_destroy_cache(NODE_CACHE(sbi));
 	f2fs_destroy_cache(META_CACHE(sbi));
 	f2fs_destroy_page_array_cache(sbi);
 free_percpu:
-- 
2.49.0

