Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8623C4B89
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373809; cv=none; b=o3Ct/bDCYBY/btjQFCqamJQ1tJq642PMsaSdeq7LQDC8vo85149ZPG02YOCW0HjG5n0LRxzX2GQTf7RGyYvls2uraZEZmLCAmOgpFygkuM/FU0b2xa7xxC5knJoxKLBnR7h4cqtaKLMUev1nQKjH2XPaJyWUR1ORaRjATil60nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373809; c=relaxed/simple;
	bh=6uBM40hs9OgLmV6dBlL0yYTEZixWN7V4EFhuwNMMWbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z97R3cRPEDk/AoqLYPiDjcRBWoSmNQUrTh99Wvrgj8C03bUV1x64tlrv2kmhbWY5OmIJOJPoaXclm3rYzrvLT2COLCE+g6wsEs7pZkMgx9vM0Sl4e9/qF3BSS/skSNghD46HcQjemFCYZUS8PmgSGtc1W51G79O5p526xZrqZ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jy4RYaM3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jy4RYaM3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310581F0089E;
	Wed,  7 Oct 2026 11:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373798;
	bh=o7AKynYn/YaLPC6ZGec+I8tbwyuxRUcwNNuNurUAQMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jy4RYaM3O+vNN7qlGbn1NJVtQIbJBoakpyKp2pApgqVBDf8/Vgc/4rlnkpzePvQNc
	 NmxuPQs84nv3tYkLcmuJcF1VaVbZLQlOqtfrQzYByMVrWYW+JJTIWB3r60Xb1EZfV0
	 w9RzC99s6zLefqLKZ+Q+f22h7ZNLvZKDPUSqZ19Q/yGukDIm14g8CkAlXjCGIYNKtH
	 4O9r3ant1+Kv8xfiVlt8jatHF6/hHH5pB/W9kxIGj1gqwxclOPC7qroZzGgNhMFxWX
	 0yF3SudhQ6ZEn92bBZ4a8nhJ8xzvK+C6ZjkM5s/Hx/3kYAtRUxZ11gLVLIDFGTmwLT
	 9oN8rmp/0W67A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 2/5] f2fs: cache: shrink meta and node caches in f2fs_balance_fs_bg
Date: Wed,  7 Oct 2026 11:49:46 +0000
Message-ID: <20261007114949.2428048-2-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261007114949.2428048-1-chao@kernel.org>
References: <20261007114949.2428048-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

This patch introduces META_BLOCK and NODE_BLOCK memory types to monitor
meta and node cache usage against available free memory, and integrates
them into f2fs_balance_fs_bg().

In f2fs_balance_fs_bg(), shrink 128 clean cached blocks of each types when
memory is insufficient (cache memory usage is larger than 50% of low memory).

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.c   | 12 ++++++++++++
 fs/f2fs/cache.h   |  6 ++++++
 fs/f2fs/node.c    | 10 ++++++++++
 fs/f2fs/node.h    |  2 ++
 fs/f2fs/segment.c |  8 ++++++++
 5 files changed, 38 insertions(+)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 04b5408cbc58..f385fe928b5b 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -669,6 +669,18 @@ unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
 	return freed;
 }
 
+unsigned long f2fs_shrink_meta_cache(struct f2fs_sb_info *sbi,
+					unsigned long nr_to_scan)
+{
+	return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
+}
+
+unsigned long f2fs_shrink_node_cache(struct f2fs_sb_info *sbi,
+					unsigned long nr_to_scan)
+{
+	return f2fs_do_shrink_cache(NODE_CACHE(sbi), nr_to_scan);
+}
+
 static int f2fs_cache_writeback_kthread(void *data)
 {
 	struct f2fs_sb_info *sbi = data;
diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
index 6c4db910d767..3df3a562c46f 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -84,6 +84,8 @@ enum f2fs_cache_request_flag {
 
 #define F2FS_ONSTACK_CACHES		(32)
 
+#define METADATA_CACHE_SHRINK_NUMBER	(128)
+
 #define F2FS_CACHE_FLAG_TEST_FUNC(name, flagname)			\
 static inline bool f2fs_cache_test_##name(				\
 			const struct f2fs_cached_block *entry)		\
@@ -223,6 +225,10 @@ void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
 
 unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
 				unsigned long nr_to_scan);
+unsigned long f2fs_shrink_meta_cache(struct f2fs_sb_info *sbi,
+				unsigned long nr_to_scan);
+unsigned long f2fs_shrink_node_cache(struct f2fs_sb_info *sbi,
+				unsigned long nr_to_scan);
 
 #define DEF_DIRTY_CACHE_TIMEOUT 5000
 #define MIN_DIRTY_CACHE_TIMEOUT 100
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index be14dfa31e53..7b2ff2c3dd03 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -123,6 +123,16 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 #else
 		res = false;
 #endif
+	} else if (type == META_BLOCK) {
+		mem_size = (META_CACHE(sbi)->num_entries *
+				(sizeof(struct f2fs_cached_block) +
+				F2FS_BLKSIZE(sbi))) >> PAGE_SHIFT;
+		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
+	} else if (type == NODE_BLOCK) {
+		mem_size = (NODE_CACHE(sbi)->num_entries *
+				(sizeof(struct f2fs_cached_block) +
+				F2FS_BLKSIZE(sbi))) >> PAGE_SHIFT;
+		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
 	} else {
 		if (!bdi_wb_dirty_exceeded(sbi->sb->s_bdi))
 			return true;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 2704a5c6a54d..ff1f04864391 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -158,6 +158,8 @@ enum mem_type {
 	AGE_EXTENT_CACHE,	/* indicates age extent cache */
 	DISCARD_CACHE,	/* indicates memory of cached discard cmds */
 	COMPRESS_BLOCK,	/* indicates memory of cached compressed blocks */
+	META_BLOCK,	/* indicates memory of cached meta blocks */
+	NODE_BLOCK,	/* indicates memory of cached node blocks */
 	BASE_CHECK,	/* check kernel status */
 };
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 794e0d99fc7c..dab66ab3311d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -510,6 +510,14 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
 		f2fs_shrink_age_extent_tree(sbi,
 				AGE_EXTENT_CACHE_SHRINK_NUMBER);
 
+	/* try to shrink meta cache when there is no enough memory */
+	if (!f2fs_available_free_memory(sbi, META_BLOCK))
+		f2fs_shrink_meta_cache(sbi, METADATA_CACHE_SHRINK_NUMBER);
+
+	/* try to shrink node cache when there is no enough memory */
+	if (!f2fs_available_free_memory(sbi, NODE_BLOCK))
+		f2fs_shrink_node_cache(sbi, METADATA_CACHE_SHRINK_NUMBER);
+
 	/* check the # of cached NAT entries */
 	if (!f2fs_available_free_memory(sbi, NAT_ENTRIES))
 		f2fs_try_to_free_nats(sbi, NAT_ENTRY_PER_BLOCK(sbi));
-- 
2.49.0

