Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876663BA241
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789523703; cv=none; b=s9eWDGrznl7uVFVmhhN2FQw6BgCjX5CBVCvC+K2zbxvsCXAWHs2srUii2+GrJP4oZC8C9U7MYioa09G9kXRKMBnbOCIA1IzCjgHJWnrUs9OUl6N68KSNEpNcRnNGMH9Tdm393ZXjyj1oNUyNX9aR7U/w+D8xTf/+v43PtOjqsOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789523703; c=relaxed/simple;
	bh=yS29tiyPXYJ6lOB71y1Lt/SA05okCbENl1LhXVsMYek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rch+tPXhTCKyvH7SSKTWeikOtnLYF3YCOfVfCleUoVySmG63qVqrmqyFXA3jbbo9KrsXToPjhGNFWYRDNVRsiAXu3z3zQIK1AK06GbaiRS8M4oUYkeNNcHy2x9R9xRJRKlASo06p0o6yciUoZxC7omMsMEpXoXIxrU9usEKA3QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPufc22D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPufc22D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5409E1F0089C;
	Wed, 16 Sep 2026 01:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789523694;
	bh=GinoQy/muHeKxdK6nE4tgrNECL7TsVBMYnIxA2p+zRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VPufc22DOxzhvHXn2716wsuf2NgiGu4A4HBwPT6MhIf+U/cEh5vL8IhmmAEi28H+H
	 8ip4NaxF/GqvkFLzS5Oxjk11vOMymdaXtvJc7XyoJd4BJJbBV2hQSXaoGVC1UyLMTA
	 X9PqT10EguY5QshiIfErOduWtjOoE8OhFudnBCqArgrO9xdOqZHVbyWN51YVbDFWu7
	 uidaxx0SPkoGHQ8cfQQGyrrf7FI1qoy2kKzbIcgBwqMBYIZBCk30fiK+8NHfjpqEow
	 9qWA9QoUNUhAesgb00rnzrnkqwmwoF7svwI/+GZoUp+Dj/0OzIKkTgItFWsNmnOIAt
	 Wq3tlDgj35vsw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v8 06/12] f2fs: cache: initialize node cache
Date: Wed, 16 Sep 2026 09:54:34 +0800
Message-ID: <20260916015440.2232938-7-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916015440.2232938-1-chao@kernel.org>
References: <20260916015440.2232938-1-chao@kernel.org>
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

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.c |  9 ++++++++-
 fs/f2fs/cache.h | 11 +++++++++++
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/super.c |  7 +++++--
 4 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 4d82697060d0..8ab5e0e46b4e 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -624,7 +624,14 @@ static unsigned long f2fs_do_shrink_cache(struct f2fs_cached_block_list *cache,
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
index 1e84e66eca79..1eabd787b4b7 100644
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

