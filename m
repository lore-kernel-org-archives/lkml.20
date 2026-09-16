Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41943A7F4C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789523696; cv=none; b=my+LJLdhcN+Oh+n3siT5aB5FnTv9uGw0Xwmbrc35xbI6q4jWyQRbXsLvaMef9iy3Y08CMqIh8G1VA0F5SLAHQDPQI4zwsJhXNljz3r/eHgA35jVBveDUmo6L5JR1scgPQ/LoLb+58EbaZutGv7aSXpImRiwx5BM9ajFVzJwTM5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789523696; c=relaxed/simple;
	bh=qJc05S9QoOPaxRqqLWcNS24hRI2u1k+hxLQIpt724vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTOJRKPPcEQFg4o3wm8u/iYOPX03MUBHW1jPFh+gsJX8V7BrYsGTkwiDArFf6y1sErNG7gkJqYo2LmZclhPcYRKb8WlmpM5tTRAJ1qS6CFV8G0UDIgULJ2KUwqnWLPk1Qa71n7h2G9zXSaBMZtjTaApDqkHtCP5s3ox18aMZc1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQZ+KH9r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQZ+KH9r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F601F00898;
	Wed, 16 Sep 2026 01:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789523688;
	bh=SNax8LZ5BiFC7qyyGJiQSVkVdoqWzSwk2la4Wc54AFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZQZ+KH9rd41OwsXFNUEhO1XHYFikKYhFBvbQDcr1175xS/Fvj/HEpSLZQ3Ojp7Lo0
	 3QwG4rDmqEKLmc6dR13AcYpnxI/+sWcUOrv3CfbC2mpjSXiHfDQT3oSzC8N+Ooauci
	 /SbSaL77pwZnpL9W2ECGHoF+Jh1EtkHcx4loxV8vV5dJvyNlRRiR8huSs9tEAo48J2
	 42tNxtkPK8nG9p25YDsCaAbSVWq9clUHl4gIjZ4adsdZJ5CuWRFxmbGrbEOiA+wyEb
	 zH41Oz7r/L9jD8s9gKeSod12ADpEdpVaL2wcg68g2q/etWWpInBOCAn8QPiqSo5g6z
	 CUJtjyQsPQ90Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v8 02/12] f2fs: cache: initialize meta cache
Date: Wed, 16 Sep 2026 09:54:30 +0800
Message-ID: <20260916015440.2232938-3-chao@kernel.org>
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

This patch introduces meta_blocks in f2fs_sb_info structure, initializes
and destroys the meta cache during filesystem mount and unmount.

It also introduces helper wrappers for meta cache operation.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.h | 9 +++++++++
 fs/f2fs/data.c  | 3 +++
 fs/f2fs/f2fs.h  | 3 +++
 fs/f2fs/super.c | 9 +++++++--
 4 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
index 1fa279f9d69e..d8123a86cdf8 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -193,4 +193,13 @@ void f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_dirty);
 void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
 		unsigned long start, unsigned long len, bool drop_dirty);
 
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
index 6a2f09c61dcd..bc3d378371e5 100644
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
@@ -5263,12 +5265,14 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (err)
 		goto free_percpu;
 
+	f2fs_init_cache(sbi, META_CACHE(sbi), F2FS_META_CACHE);
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
@@ -5596,7 +5600,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	make_bad_inode(sbi->meta_inode);
 	iput(sbi->meta_inode);
 	sbi->meta_inode = NULL;
-free_page_array_cache:
+free_meta_cache:
+	f2fs_destroy_cache(META_CACHE(sbi));
 	f2fs_destroy_page_array_cache(sbi);
 free_percpu:
 	destroy_percpu_info(sbi);
-- 
2.49.0

