Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D1A30E853
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 01:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788917800; cv=none; b=cfvKVHBbRRjT0xfhi4eIPHr9dCs0z6YbKcsDdAD6LaBoAewrp7rjE5dBO8mEHALN7ryu0aq3OLVxz4dujSFW6sSUsHxV/Hdp8ohSvMOBGsbfGsuGnWIrweD8ly7exZGB9WJjf2MEKHpeW+bP986SVkS4WjSnRG3ppxxA3H2/N+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788917800; c=relaxed/simple;
	bh=tejK8KZk0VINGa3S96/myKOzE7ngiSFD6XsWu2uEtRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oa8lmN7GL8qCa/m1mwEU5CcfxD++/kuUu5QlZ67Di35hZA96sg2jAPsZWEGCoQHuvwhonoqcSNraOuB1972WocPxwNQCP3ioqczd6+LBu47mr9YKMAsmg1G2ht5Sau7nrlCsjJusbjsPvsSnwbIZLyJ/HHfdFr1euq4Emy9Z5CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUsvwKPB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUsvwKPB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8F01F00A3E;
	Wed,  9 Sep 2026 01:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788917798;
	bh=XllkS7EiYFyAdu5uEytbrlt0OEplESq0dKQpkQz3uPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZUsvwKPBVPdyHkoJWI7Yvvthu6Rb1EDrS7FbHVt25MBI6cuZZpxqJqDF/MFO8EZ/9
	 iFc0CQlTMkLYdPBew2DiabYCZDTuCeYVwcN3y+b/NFVkG7+jw1scHmrI8FnH3bOZ/Q
	 Fve2x0qGelwlbiDGf94mktI6skCdgWcqibE6Yz2UTLOuBouljOA0xxcjcGybPcqN6P
	 cL3vYPLu/L0uuxbZEEt3zbsokU0o0/6P4lTcBXxyOhW04AO2oVCX5oeSgDP8aERpDI
	 0vtc/H/RuZGRRVqy4P7U4pYuxkK32vzfv4up9MUmannIhalUAjtZ8k3GbqBgfnJCHR
	 HF8fJzyhBBjVw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v6 06/12] f2fs: cache: initialize node cache
Date: Wed,  9 Sep 2026 09:36:05 +0800
Message-ID: <20260909013611.3418568-7-chao@kernel.org>
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
index 772fe0ad0f90..e65f8e619d2b 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -620,7 +620,14 @@ static unsigned long f2fs_do_shrink_cache(struct f2fs_cached_block_list *cache,
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
index 57c6147c82da..9d4d7eca4adb 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -197,6 +197,7 @@ int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
 void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
 
 #define META_CACHE(sbi)		(&(sbi)->meta_blocks)
+#define NODE_CACHE(sbi)		(&(sbi)->node_blocks)
 
 #define f2fs_find_meta_cache(sbi, blkaddr)		\
 	f2fs_find_cache(META_CACHE(sbi), blkaddr, 0)
@@ -205,6 +206,16 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
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
index cceb14077b42..6b89cc56ef87 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2108,6 +2108,7 @@ struct f2fs_sb_info {
 
 	/* f2fs internal cache */
 	struct f2fs_cached_block_list meta_blocks;
+	struct f2fs_cached_block_list node_blocks;
 
 	/* internal cache flush thread */
 	struct f2fs_cache_kthread cache_thread;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 53f3b548e201..c9cae916ddd5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2092,6 +2092,7 @@ static void f2fs_put_super(struct super_block *sb)
 	sbi->node_inode = NULL;
 
 	f2fs_destroy_cache(META_CACHE(sbi));
+	f2fs_destroy_cache(NODE_CACHE(sbi));
 
 	/* Should check the page counts after dropping all node/meta pages */
 	for (i = 0; i < NR_COUNT_TYPE; i++) {
@@ -5283,10 +5284,14 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
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
@@ -5612,6 +5617,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
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

