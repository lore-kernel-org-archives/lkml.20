Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB323BD25E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789523709; cv=none; b=OJmIkYXqFkntAjf5yd3IQjUgOmtoB+voChnClCu9L99f0xAW3Wzk1BUz5Hh5Q9+/hL2uwi1TiWykEPvkKB6p6xlP+SbjYVWa7w8tmZ0w1svZndiR3lco4oN44xgVkcwhoMBu8Z8+ozG+ZDB6ryq6hM6myI1wfH63olUhn+JTYNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789523709; c=relaxed/simple;
	bh=7oDlP/J2S9VfSBjoPeD4+zfCSRNR+RRAiFiJrr4ksPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWKYTSwuG2c77pt+xddGvuypETPSVJS3BLmMP4mjukEvKwvGY0QDjo21kxFd+KJi24n3JRAa8ixr9bqv5zsp0zXnrX7S1wqqVV3OGbHStLSzM4F8pLpfVBIbwNUMau6TR+1R2ns6XULS/skuwPr5mQ3ENcCWRMvC7lfq0H4Vor4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJVtYXcN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJVtYXcN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3171F00893;
	Wed, 16 Sep 2026 01:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789523700;
	bh=XkEOzG7Ks/N0W+NbSKd4jM4lxlxBW29dep7AC9T1gcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CJVtYXcNQioeKA0ldSkLqVA5hBERv5CPLwxTAe105msW282uP+u7xDBvgXvw2zcuV
	 jvcwnPvBVbrigRPv31V/VCiQFs2AS+2q8gfLfGZd8fkBi9wX1zSu2Gw08lI1luRk+I
	 QRdcZJSPIlRR8+m8MrhK7Kzgax9HNUMlBnSvOrsvApJbMrZAfiJ2Wm6SnCS63JbvDu
	 upZqG1+5xPNXLh1mspJt2puvkX0ck6ydohb2Rl1BTsNjWhuDioF/qRWm3vWzdDWNa/
	 tVZ5+5jZA4oJpi7HVOSxHQYE79liNsVQe2mzijf5r7su/r9x6F/AcTyJCS2zq3Jd2J
	 QM2A9BgGbEvGg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v8 11/12] f2fs: cache: introduce tracepoints
Date: Wed, 16 Sep 2026 09:54:39 +0800
Message-ID: <20260916015440.2232938-12-chao@kernel.org>
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

This patch introduces ftrace tracepoints to observe and profile metadata
cache operations:
- trace_f2fs_cache_set_dirty to trace marking a cached block dirty
- trace_f2fs_write_cache to trace single block writeback submission
- trace_f2fs_write_caches to tracesbatch writeback and sync sessions

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.c             |  3 ++
 fs/f2fs/checkpoint.c        |  6 ++++
 fs/f2fs/node.c              |  4 +++
 fs/f2fs/segment.c           |  3 ++
 include/trace/events/f2fs.h | 71 +++++++++++++++++++++++++++++++++++++
 5 files changed, 87 insertions(+)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 27624b6799a9..3f345e5d5186 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -15,6 +15,7 @@
 #include "f2fs.h"
 #include "cache.h"
 #include "node.h"
+#include <trace/events/f2fs.h>
 #include "segment.h"
 
 void f2fs_cache_wait_writeback_cond(struct f2fs_cached_block *entry,
@@ -73,6 +74,8 @@ bool f2fs_mark_cache_dirty(struct f2fs_cached_block *entry)
 		enum count_type type = IS_META_CACHE(cache) ?
 				F2FS_DIRTY_META : F2FS_DIRTY_NODES;
 
+		trace_f2fs_cache_set_dirty(entry,
+				IS_META_CACHE(cache) ? META : NODE);
 		f2fs_cache_update_tag(entry, F2FS_CACHE_TAG_NONE,
 						F2FS_CACHE_TAG_DIRTY);
 		inc_page_count(cache->sbi, type);
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index fe7e8bab644b..406bd3b1c77f 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -550,6 +550,8 @@ static bool __f2fs_write_meta_cache(struct f2fs_cached_block *entry,
 {
 	struct f2fs_sb_info *sbi = entry->cache->sbi;
 
+	trace_f2fs_write_cache(entry, META);
+
 	if (unlikely(f2fs_cp_error(sbi))) {
 		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
 			f2fs_cache_clear_uptodate(entry);
@@ -611,6 +613,8 @@ long f2fs_sync_meta_caches(struct f2fs_sb_info *sbi, long nr_to_write,
 	struct blk_plug plug;
 	bool background = nr_to_write != LONG_MAX;
 
+	trace_f2fs_write_caches(sbi, nr_to_write, 0, META);
+
 	blk_start_plug(&plug);
 
 	while ((nr = f2fs_cache_gang_lookup_tag(META_CACHE(sbi), entries,
@@ -666,6 +670,8 @@ long f2fs_sync_meta_caches(struct f2fs_sb_info *sbi, long nr_to_write,
 
 	blk_finish_plug(&plug);
 
+	trace_f2fs_write_caches(sbi, nr_to_write, nwritten, META);
+
 	return nwritten;
 }
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index fe5e4c4eff23..aa485a09ea6c 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2110,6 +2110,8 @@ int f2fs_writeback_node_caches(struct f2fs_sb_info *sbi, long nr_to_write,
 	int ret = 0;
 	int nr, done = 0;
 
+	trace_f2fs_write_caches(sbi, nr_to_write, 0, NODE);
+
 next_step:
 	index = 0;
 
@@ -2217,6 +2219,8 @@ int f2fs_writeback_node_caches(struct f2fs_sb_info *sbi, long nr_to_write,
 	if (nwritten)
 		f2fs_submit_merged_write(sbi, NODE);
 
+	trace_f2fs_write_caches(sbi, nr_to_write, nwritten, NODE);
+
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 	return ret;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 87e24d0306e8..15cffbb5b407 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4226,6 +4226,9 @@ void f2fs_do_write_node_cache(unsigned int nid, struct f2fs_io_info *fio)
 {
 	struct f2fs_summary sum;
 
+	if (fio->is_cache)
+		trace_f2fs_write_cache(fio->cache_entry, NODE);
+
 	set_summary(&sum, nid, 0, 0);
 	do_write_block(&sum, fio);
 
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index d53be932df01..df4cd346ae72 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1430,6 +1430,50 @@ DEFINE_EVENT(f2fs__folio, f2fs_set_page_dirty,
 	TP_ARGS(folio, type)
 );
 
+DECLARE_EVENT_CLASS(f2fs__cached_block,
+
+	TP_PROTO(struct f2fs_cached_block *block, int type),
+
+	TP_ARGS(block, type),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(pgoff_t, index)
+		__field(int,	type)
+		__field(int,	dirty)
+		__field(int,	uptodate)
+	),
+
+	TP_fast_assign(
+		__entry->dev	= block->cache->sbi->sb->s_dev;
+		__entry->index	= block->index;
+		__entry->type	= type;
+		__entry->dirty	= f2fs_cache_test_dirty(block);
+		__entry->uptodate = f2fs_cache_test_uptodate(block);
+	),
+
+	TP_printk("dev = (%d,%d), %s, index = %lu, dirty = %d, uptodate = %d",
+		show_dev(__entry->dev),
+		show_block_type(__entry->type),
+		(unsigned long)__entry->index,
+		__entry->dirty,
+		__entry->uptodate)
+);
+
+DEFINE_EVENT(f2fs__cached_block, f2fs_write_cache,
+
+	TP_PROTO(struct f2fs_cached_block *block, int type),
+
+	TP_ARGS(block, type)
+);
+
+DEFINE_EVENT(f2fs__cached_block, f2fs_cache_set_dirty,
+
+	TP_PROTO(struct f2fs_cached_block *block, int type),
+
+	TP_ARGS(block, type)
+);
+
 TRACE_EVENT(f2fs_replace_atomic_write_block,
 
 	TP_PROTO(struct inode *inode, struct inode *cow_inode, pgoff_t index,
@@ -1574,6 +1618,33 @@ TRACE_EVENT(f2fs_writepages,
 		__entry->for_sync)
 );
 
+TRACE_EVENT(f2fs_write_caches,
+
+	TP_PROTO(struct f2fs_sb_info *sbi, long nr_to_write, long nwritten, int type),
+
+	TP_ARGS(sbi, nr_to_write, nwritten, type),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(long,	nr_to_write)
+		__field(long,	nwritten)
+		__field(int,	type)
+	),
+
+	TP_fast_assign(
+		__entry->dev		= sbi->sb->s_dev;
+		__entry->nr_to_write	= nr_to_write;
+		__entry->nwritten	= nwritten;
+		__entry->type		= type;
+	),
+
+	TP_printk("dev = (%d,%d), %s, nr_to_write = %ld, nwritten = %ld",
+		show_dev(__entry->dev),
+		show_block_type(__entry->type),
+		__entry->nr_to_write,
+		__entry->nwritten)
+);
+
 TRACE_EVENT(f2fs_readpages,
 
 	TP_PROTO(struct inode *inode, pgoff_t start, unsigned int nrpage),
-- 
2.49.0

