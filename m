Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6025B403B1E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169062; cv=none; b=S+9NmO1TwLzCvkYZqGhFfOfsPljNPvoPcrHW6VrKJ/OAWwRHLrmqVJBPPZP366oA8ewZaB+T8OesshOUvaJ+wBzNhz/3Odyr8uLkyMtCZImTYpWIS+QEIegpuq4Sqh45OLq5qaIgbXPfMBNZQ5cz01QPEgv5jXxisqfk88M9+EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169062; c=relaxed/simple;
	bh=QnOXpTTJaKI+dVQYF2RoWeilpWio3hf3A3afYt+enpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g+UJdW8QINsx6wfM+0oTv8kKMIOqn8DTmRiZPqCsYKqvWnjp7ON709b5e2Rib6p+hVeM4lm/RusIw6+bR2obztVS9fI0Odk2Mw5MfA9wh59vOZzUdLangr/FXGQN48utNGxw6cDVqRM6X3n+SwaFLsMhymEeC6xCG/q6a/eLk0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRaKneLo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRaKneLo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F381F0089B;
	Fri, 11 Sep 2026 23:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789169061;
	bh=OYC7tnjlMICy2285vsCu7hsIl1iQc0bcDEelCbLHpYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SRaKneLohyPPxVge8ZqXMB88TDIDVM5eb01xO8zEGvfAZ0fAT5cqrOHbJMWYBI4L0
	 hOnSd/8sy7Z9raVFZafYPmaFuPwUmq3D/zwXqmqQrQrKLqIGUg7yYokE0nRQEqfTgn
	 QhbXQof1pbZUEkLPWmVCkdEveHzh2TIK9yOVh9h5Sq4PFXx2QZPeePsPQIRZV7U7HV
	 BdwpV5xtlLyvzwJnS7Ijr8JZDY8RW0OzOFjHk/6o0yGJaKR9yep6mGRaCcNW0plS/+
	 iBKW6TFii14XjqZJeVUVXOWyk29fSFDNYkfY8keft89tNn/ert6fK1/KAjlncW1CTQ
	 ZQBiwq4A2wJAw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v7 06/12] f2fs: cache: initialize node cache
Date: Sat, 12 Sep 2026 07:23:59 +0800
Message-ID: <20260911232405.1815804-7-chao@kernel.org>
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

This patch introduces node_blocks in f2fs_sb_info structure, initializes
and destroys the node cache during filesystem mount and unmount.

It also introduces helper wrappers for node cache operation, and registers
node cache into the memory shrinker and writeback kthread.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.c |  9 ++++++++-
 fs/f2fs/cache.h | 11 +++++++++++
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/super.c |  9 ++++++++-
 4 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index e99165e1c785..f265e45ee210 100644
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
index a0218c235c39..f02ea0638930 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -198,6 +198,7 @@ int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
 void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
 
 #define META_CACHE(sbi)		(&(sbi)->meta_blocks)
+#define NODE_CACHE(sbi)		(&(sbi)->node_blocks)
 
 #define f2fs_find_meta_cache(sbi, blkaddr)		\
 	f2fs_find_cache(META_CACHE(sbi), blkaddr, 0)
@@ -206,6 +207,16 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
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
index 0361e4cc0e0a..d1ed5d0f5335 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2092,6 +2092,7 @@ static void f2fs_put_super(struct super_block *sb)
 	sbi->node_inode = NULL;
 
 	f2fs_destroy_cache(META_CACHE(sbi));
+	f2fs_destroy_cache(NODE_CACHE(sbi));
 
 	/* Should check the page counts after dropping all node/meta pages */
 	for (i = 0; i < NR_COUNT_TYPE; i++) {
@@ -5285,10 +5286,14 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (err)
 		goto free_page_array_cache;
 
+	err = f2fs_init_cache(sbi, NODE_CACHE(sbi), F2FS_NODE_CACHE);
+	if (err)
+		goto free_meta_cache;
+
 	err = f2fs_get_valid_checkpoint(sbi);
 	if (err) {
 		f2fs_err(sbi, "Failed to get valid F2FS checkpoint");
-		goto free_meta_cache;
+		goto free_node_cache;
 	}
 
 	if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_QUOTA_NEED_FSCK_FLAG))
@@ -5614,6 +5619,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 free_devices:
 	destroy_device_list(sbi);
 	kvfree(sbi->ckpt);
+free_node_cache:
+	f2fs_destroy_cache(NODE_CACHE(sbi));
 free_meta_cache:
 	f2fs_destroy_cache(META_CACHE(sbi));
 free_page_array_cache:
-- 
2.49.0

