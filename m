Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDAE448CF3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833567; cv=none; b=C19dFhshVBNDVN94f2vz5hSPjhdUi7PfhIuwTY6Q+zX7Eak6wg8oet09cf8+j4+YInHthVc3MHHpMNAfNLZxW98kIl1czFJK8gQZyE04o+B8AjHqhkSI+Xx8ZhQc3bpE9ZUqx/eCC31tOgy/NLO0hIacSIoxaDVix7phIgOYfFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833567; c=relaxed/simple;
	bh=J07u+Y+od4U9DNLyceXGi4qT5b4byBc5aLo+hCTMRcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJBzxyBeZSPcshfq3cnKWOD4yJTBIjZ0u2hNZw+ahPBg6L1+ic5De+ry5vXzqK1jQiANQR53RjQGfutt1Ew3AQ6Bf9ttA4Ji57lZEOuIjTfK8tyTytSBHBIB4Xd6tfuSQOBlbtjbAQmXndpbrBRX6C+QmcwMQH6OMy9gNb/wd8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8LMUzv4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8LMUzv4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A73F1F00A3E;
	Thu, 27 Aug 2026 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787833564;
	bh=cIOSmM3+MscJhXAvtBG4p+lD0KjlO3frMeZXWu/BMmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E8LMUzv4l159EO6t44sZ2Pmofnk1Tbio9GuCihbDcwhphp0qaRvc8UY9nFdi2a2mD
	 9u8caEaqrXsvs1IfzTiCivPUwTSea5S9Zrp8HmbBQ/K6dMDw7UtCwBF+e+/RGxOTaC
	 bHbn6ZLzAMLp+Da/pYkEftva/h3aHKNe6npSJbP7HU/sTbpgi9wSymVD9qZaqGS+Xf
	 QewghDP1KLwD8xn9waqZufZtQav61EJy8n51njxjthTaTuKb6Wvtj5LoC8z9uHBBV9
	 Clycn1okiJUFO9ks7eBApBh7cWzP5qFgR7K2Asp+2RVwVFo6rtsO8QdwdSNedASXhw
	 D5Npwt9mni8UQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v4 12/12] f2fs: cache: show per-cache usage in debugfs
Date: Thu, 27 Aug 2026 20:25:40 +0800
Message-ID: <20260827122541.19967-13-chao@kernel.org>
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

This patch exposes per-cache memory usage (entry struct memory vs.
cached block buffer memory) for meta, node, and compress caches under
the memory section in debugfs:
  - meta entry: xxx KB, meta cache: xxx KB
  - node entry: xxx KB, node cache: xxx KB
  - compress entry: xxx KB, compress cache: xxx KB

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.h |  1 +
 fs/f2fs/debug.c | 49 ++++++++++++++++++++++++++++++++++++++++---------
 fs/f2fs/f2fs.h  |  2 ++
 3 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
index 474aaf5966f2..9d519c3b7c94 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -38,6 +38,7 @@ enum f2fs_cache_type {
 	F2FS_META_CACHE,
 	F2FS_NODE_CACHE,
 	F2FS_COMPRESS_CACHE,
+	NR_CACHE_TYPES,
 };
 
 /* Main cache control structure (per sb_info) */
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 8cd06f7ba9e7..68a9d589da8c 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -380,17 +380,36 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 		si->cache_mem += si->ext_mem[i];
 	}
 
-	si->page_mem = 0;
-	si->page_mem += (unsigned long long)META_CACHE(sbi)->num_entries << PAGE_SHIFT;
-	si->cache_mem += META_CACHE(sbi)->num_entries * sizeof(struct f2fs_cached_block);
-	si->page_mem += (unsigned long long)NODE_CACHE(sbi)->num_entries << PAGE_SHIFT;
-	si->cache_mem += NODE_CACHE(sbi)->num_entries * sizeof(struct f2fs_cached_block);
+	si->cache_entry_mem[F2FS_META_CACHE] =
+		(unsigned long long)META_CACHE(sbi)->num_entries *
+		sizeof(struct f2fs_cached_block);
+	si->cache_data_mem[F2FS_META_CACHE] =
+		(unsigned long long)META_CACHE(sbi)->num_entries * sbi->blocksize;
+
+	si->cache_entry_mem[F2FS_NODE_CACHE] =
+		(unsigned long long)NODE_CACHE(sbi)->num_entries *
+		sizeof(struct f2fs_cached_block);
+	si->cache_data_mem[F2FS_NODE_CACHE] =
+		(unsigned long long)NODE_CACHE(sbi)->num_entries * sbi->blocksize;
+
+	si->cache_mem += si->cache_entry_mem[F2FS_META_CACHE] +
+			 si->cache_entry_mem[F2FS_NODE_CACHE];
+	si->page_mem = si->cache_data_mem[F2FS_META_CACHE] +
+			si->cache_data_mem[F2FS_NODE_CACHE];
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (test_opt(sbi, COMPRESS_CACHE)) {
-		unsigned long npages = COMPRESS_CACHE(sbi)->num_entries;
-
-		si->page_mem += (unsigned long long)npages << PAGE_SHIFT;
-		si->cache_mem += npages * sizeof(struct f2fs_cached_block);
+		si->cache_entry_mem[F2FS_COMPRESS_CACHE] =
+			(unsigned long long)COMPRESS_CACHE(sbi)->num_entries *
+			sizeof(struct f2fs_cached_block);
+		si->cache_data_mem[F2FS_COMPRESS_CACHE] =
+			(unsigned long long)COMPRESS_CACHE(sbi)->num_entries *
+			sbi->blocksize;
+
+		si->cache_mem += si->cache_entry_mem[F2FS_COMPRESS_CACHE];
+		si->page_mem += si->cache_data_mem[F2FS_COMPRESS_CACHE];
+	} else {
+		si->cache_entry_mem[F2FS_COMPRESS_CACHE] = 0;
+		si->cache_data_mem[F2FS_COMPRESS_CACHE] = 0;
 	}
 #endif
 }
@@ -749,6 +768,18 @@ static int stat_show(struct seq_file *s, void *v)
 				si->ext_mem[EX_READ] >> 10);
 		seq_printf(s, "  - block age extent cache: %llu KB\n",
 				si->ext_mem[EX_BLOCK_AGE] >> 10);
+		seq_printf(s, "  - meta entry: %llu KB, meta cache: %llu KB\n",
+				si->cache_entry_mem[F2FS_META_CACHE] >> 10,
+				si->cache_data_mem[F2FS_META_CACHE] >> 10);
+		seq_printf(s, "  - node entry: %llu KB, node cache: %llu KB\n",
+				si->cache_entry_mem[F2FS_NODE_CACHE] >> 10,
+				si->cache_data_mem[F2FS_NODE_CACHE] >> 10);
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+		if (test_opt(sbi, COMPRESS_CACHE))
+			seq_printf(s, "  - compress entry: %llu KB, compress cache: %llu KB\n",
+					si->cache_entry_mem[F2FS_COMPRESS_CACHE] >> 10,
+					si->cache_data_mem[F2FS_COMPRESS_CACHE] >> 10);
+#endif
 		seq_printf(s, "  - paged : %llu KB\n",
 				si->page_mem >> 10);
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d55749b03ed2..59b05f65784f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4457,6 +4457,8 @@ struct f2fs_stat_info {
 	unsigned int block_count[2];
 	unsigned int inplace_count;
 	unsigned long long base_mem, cache_mem, page_mem;
+	unsigned long long cache_entry_mem[NR_CACHE_TYPES];
+	unsigned long long cache_data_mem[NR_CACHE_TYPES];
 	struct f2fs_dev_stats *dev_stats;
 };
 
-- 
2.49.0

