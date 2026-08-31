Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79EA3DCDB5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168164; cv=none; b=JPeYKW3SKYYRZ8h1F2wtEbXYUaAC1xMK3QKM6eeJsbnNt5jEErmS1CONBykJj0cPf3Prf3Z2vQPFYEXR+qUGqxAjiMHZV2S2KxY9NM8M7GZ2c2gY2rRXnCqdMV2F33cmULH+Hr+gQmbljbRIqQQ8/mRSmHd7NtxAc+/h2LQdznI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168164; c=relaxed/simple;
	bh=vLIwIj9CY32BEBALFFlV94qTy++/Tu8TwrK1a806r/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQY5JbJEQx7WxoMYXjrI7y3FMY9OFMC/if4ap0u8DB7lezbUSR69cKmUXiCJuno9Q1wxlGyv88YkLbJszslsCvkUapFcv8WlNlgkChQG4bjG+3Dtqc+GBvD5akeXb+f6BhPwZKszWyGcmglQCNzStgeom19WX0iV5Q3ciaI1igo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJ9i/lGC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJ9i/lGC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47831F00A3F;
	Mon, 31 Aug 2026 09:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788168162;
	bh=n4a+Rmw7OyCgDc+ssPabYOmdo6Oy7BLAhFKE3yiudc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SJ9i/lGCmhDhYNcfwuB3G0LxA2MwzgW1Oi211e61sIwDEPmBgIDcmb6mBH+DDnn06
	 kHpZtf1dVe+MUSbBpKt4FpAP+FqOntzDwY6uGjU5pSH/3UUvN7RZcSUQ7ecdZ2J6oB
	 kKl+yvB3dGv8t3+03EGJA7F+Ujxt9AMoj9/wOM/VoegNnEMVw/o1CQuV+Zcr0LOxgL
	 nibL/BtpqbjbO9X4jxEuTtWEWERKkV42BNPFon6PjpDArEULzf6dePwQ767uNOAMdU
	 Go8AD4aBQGauF/O5jF4GRgCUxd/5gZTcwM7RsZO2CCPmCj21iEe3iZCm9vnuxkgHHz
	 xxju761xJWHig==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v5 02/12] f2fs: cache: initialize meta cache
Date: Mon, 31 Aug 2026 17:22:17 +0800
Message-ID: <20260831092227.739737-3-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260831092227.739737-1-chao@kernel.org>
References: <20260831092227.739737-1-chao@kernel.org>
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
index e2f39ff42510..74b88ef2f6b5 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -191,4 +191,16 @@ void f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_dirty);
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
index 7114e24756e3..ce76871ac68c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -668,6 +668,9 @@ static bool __has_merged_page(struct bio *bio, struct inode *inode,
 	if (!inode && !folio && !ino)
 		return true;
 
+	if (f2fs_is_cache_bio(bio))
+		return false;
+
 	bio_for_each_folio_all(fi, bio) {
 		struct folio *target = fi.folio;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 353decad2c62..38027711f2f8 100644
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
index 1314b6ccced9..858bd36f5f1b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2081,6 +2081,8 @@ static void f2fs_put_super(struct super_block *sb)
 	iput(sbi->meta_inode);
 	sbi->meta_inode = NULL;
 
+	f2fs_destroy_cache(META_CACHE(sbi));
+
 	/* Should check the page counts after dropping all node/meta pages */
 	for (i = 0; i < NR_COUNT_TYPE; i++) {
 		if (!get_pages(sbi, i))
@@ -5231,12 +5233,16 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
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
@@ -5564,6 +5570,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
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

