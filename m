Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5311F43E4B1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833552; cv=none; b=p0ZrF5pxxNLvhOkp8FZukUrsqy05blSX0Wx2zFaafPm5WzBZx2eqJSVlkisN/8q0p+ge5yghiPcPBNNyMwUWcj41XpBY13En5VWn8AV09lFZMtIhCNtbrAfIcXuxDEevJWpmyR4ujEHrvMtV1jpNCKN90T+V3Jo5DvcxyZhxC+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833552; c=relaxed/simple;
	bh=CEfnBNl9AS70PAFsDUfrD3r/s6Z+jCLQAq199bxUL9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbSUCkPwNR1gwwhPyTzMNUsfrigJehe5dCsYPPRS1mAqPlu20ZV+IgdchFLmsQD5bTPyZ5HyAw0iUAnxr9lkk9sKUd3o1VxMNpDLxueugGEYg3276pNv0eH31AKZO4NEyhZHObZ8R788VcXA/n7dOnOYfEYKwj+COZYVqkDwCMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAvJbe4f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAvJbe4f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329191F000E9;
	Thu, 27 Aug 2026 12:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787833551;
	bh=1whlCASNGAm3B0YuCliHXR5uVhRAnNBvZHd43fmII9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UAvJbe4fbOAF3NeJ5xXB7IAyT8wG0e5VbPTSIvSKFsD668wqkA+lzSCQ1mtmsUhPb
	 kekjMbeBSBNgJ/siNiuYM6l0mwhazkbgmkliioraNZ3BWp8DF6qRoyHOZMXdOyAMFC
	 GRUCC7mEFmpVGpdQ6gsy0WAEL4Idz1aHw4n/4EX5Y3LUPvY2I1w9XH22oFhIsb9zaP
	 rbCLC4mWICDeDwPm+ELkj/N7SBwC8BiBPhYEfBThgtai4eWRWWNCYucqh8n9EKb1nQ
	 f4tZBF24wQmFalPhfhXrpoO0NYgO2Vp0jT7Grp9PtL2c5Lyv61iSMB8Ci9NXQBu25H
	 mifSR8Y4NM3Nw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v4 02/12] f2fs: cache: initialize meta cache
Date: Thu, 27 Aug 2026 20:25:30 +0800
Message-ID: <20260827122541.19967-3-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
In-Reply-To: <20260827122541.19967-1-chao@kernel.org>
References: <20260827122541.19967-1-chao@kernel.org>
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
index 0e201a36fcd5..cb5a466526fc 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -179,4 +179,16 @@ void f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_dirty);
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
index 75ab768bb4f7..2c91382ffc3c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -695,6 +695,9 @@ static bool __has_merged_page(struct bio *bio, struct inode *inode,
 	if (!inode && !folio && !ino)
 		return true;
 
+	if (f2fs_is_cache_bio(bio))
+		return false;
+
 	bio_for_each_folio_all(fi, bio) {
 		struct folio *target = fi.folio;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 84ee4601126d..0f855ac7d1e8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2108,6 +2108,9 @@ struct f2fs_sb_info {
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 	struct lock_class_key cp_global_sem_key;
 #endif
+
+	/* f2fs internal cache */
+	struct f2fs_cached_block_list meta_blocks;
 };
 
 /* Definitions to access f2fs_sb_info */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c1e315282ec6..32e80c70e141 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2075,6 +2075,8 @@ static void f2fs_put_super(struct super_block *sb)
 	iput(sbi->meta_inode);
 	sbi->meta_inode = NULL;
 
+	f2fs_destroy_cache(META_CACHE(sbi));
+
 	/* Should check the page counts after dropping all node/meta pages */
 	for (i = 0; i < NR_COUNT_TYPE; i++) {
 		if (!get_pages(sbi, i))
@@ -5225,12 +5227,16 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
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

