Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4B7361961
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796676; cv=none; b=I7XiYr8inTwhXHJiD7xN5Agrw3kcFdSXSlhW+yM/0estvVUC6St//SF07k/E7A3CZRsu+MtEmtOODlTXoXbwC8qsdQl2P59Gl64IERBIaTjYbj4zN9hSfick2MWlJdbxgN93jD+CRn01Pb4pT9YbwjdWJvgibfylcKRkhAT7hDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796676; c=relaxed/simple;
	bh=TetGDuwGWfXD0mWY+Sfb0/wS00TsPyql0WGYAen447o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fi0A0u9364hhw4zH75A2KMKQxvWMW2rRqXR9xLPnSEqOneqhXaHbTH+44hqDpzdgCRi4opZpXXKLwpbkfJEckw46obsf1A9H7PHCqsUM2m3/0d0UnDSTKB+k9tkEJOivw66YuvtGJNeBaSU35cWnOm4AegCQoRViLYIiGgWezrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhhCQ2TP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhhCQ2TP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375981F0089B;
	Mon, 12 Oct 2026 09:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791796674;
	bh=gT3Ud09meFB3kUMvE/7JMtDXtX7QL+6/HzUw8GPVB4E=;
	h=From:To:Cc:Subject:Date;
	b=hhhCQ2TPs8MTRrcJ/1lYhMWmGe1uMXQXINoT40yqbjNjNP/U0WOYUXSaluI/+hhUs
	 4e4HwhVmN2OssJnkJZ2B5nPJPn61k4O4r6ywS9i+Svcv/wKbbOoSeGp4IAfkC6A/2o
	 SSGT/yzNzCYJGWP4Ond0rAzgoB06rXuTVs8gBPVfhGk2OdIOxmRexr5cRYP1peDd+F
	 Qwgc1YaHyIPc/9gd0WNqr+UnDB/k7HgE1jsydUv2el6A3uOdpXEjObPmR05PskEhj5
	 SYol90j3GSox1YuHOU25jUmlrNJ0MYtLdyd/bjmmwAEobuDWvVWP+8p4veNUB32D0F
	 5IAtYa4LZGXUg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daehojeong@google.com>,
	Wenjie Qi <qiwenjie@xiaomi.com>
Subject: [PATCH v3 3/5] f2fs: cache: wake up f2fs_writeback when exceeding threshold
Date: Mon, 12 Oct 2026 09:17:37 +0000
Message-ID: <20261012091737.308136-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

This patch introduces cache_wb_dirty_threshold and cache_wb_total_threshold
sysfs nodes under /sys/fs/f2fs/<disk>/, and wakes up the f2fs_writeback
kthread when dirty meta/node caches exceed cache_wb_dirty_threshold and
total cached entries exceed cache_wb_total_threshold; a zero threshold
disables the corresponding check. By default, cache_wb_dirty_threshold is
8192 and cache_wb_total_threshold is 0.

If both thresholds are zero, f2fs_writeback only runs periodically, unless
checkpoint is disabled, as nothing else will flush dirty caches then.

f2fs_writeback won't be woken up unless there are enough dirty caches for
f2fs_write_{meta,node}_caches() to gather. And if thresholds are exceeded
but one round fails to write any caches, e.g. due to cp_error, freezing,
frozen fs, or lock contention, threshold based wakeup is throttled until
a later round makes progress, in order to avoid busy-looping. To detect
progress, introduce a new parameter for f2fs_write_{meta,node}_caches()
and f2fs_writeback_node_caches() to return the number of caches submitted
for writeback.

Thanks Daeho and Wenjie for help and suggestion on this patch.

Suggested-by: Daeho Jeong <daehojeong@google.com>
Suggested-by: Wenjie Qi <qiwenjie@xiaomi.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- fix to throttle cache writeback in f2fs_writeback
- fix to handle chckpoint disable case correctly
 Documentation/ABI/testing/sysfs-fs-f2fs |  21 ++++
 fs/f2fs/cache.c                         | 124 ++++++++++++++++++++++--
 fs/f2fs/cache.h                         |   6 ++
 fs/f2fs/checkpoint.c                    |  10 +-
 fs/f2fs/f2fs.h                          |   7 +-
 fs/f2fs/node.c                          |  11 ++-
 fs/f2fs/sysfs.c                         |   8 +-
 7 files changed, 171 insertions(+), 16 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 5b196806b3bc..3d2e78a8bb7d 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -1027,3 +1027,24 @@ Contact:	"Chao Yu" <chao@kernel.org>
 Description:	This is a writable entry to control writeback interval of
 		f2fs_writeback-x:y, the range is [100, 30000], by default the value
 		is 5000, unit is ms.
+
+What:		/sys/fs/f2fs/<disk>/cache_wb_dirty_threshold
+Date:		October 2026
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	This is a writable entry for metadata cache. f2fs_writeback-x:y
+		will be woken up for writeback once the number of dirty meta and
+		node caches reaches this value. 0 disables this check. By default
+		the value is 8192, unit is cache entries.
+
+What:		/sys/fs/f2fs/<disk>/cache_wb_total_threshold
+Date:		October 2026
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	This is a writable entry for metadata cache. f2fs_writeback-x:y
+		will be woken up for writeback only if the total number of cached
+		entries also reaches this value. 0 disables this check. By default
+		the value is 0, unit is cache entries.
+
+		If both cache_wb_dirty_threshold and cache_wb_total_threshold are
+		0, f2fs_writeback-x:y only runs every cache_wb_interval, unless
+		checkpoint is disabled, in which case it will still be woken up
+		once there are enough dirty caches to be gathered for writeback.
diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index f385fe928b5b..c53dc4629ac2 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -81,6 +81,7 @@ bool f2fs_mark_cache_dirty(struct f2fs_cached_block *entry)
 		f2fs_cache_update_tag(entry, F2FS_CACHE_TAG_NONE,
 						F2FS_CACHE_TAG_DIRTY);
 		inc_cache_count(cache->sbi, type);
+		f2fs_wake_up_cache_wb(cache->sbi);
 		return true;
 	}
 
@@ -681,6 +682,74 @@ unsigned long f2fs_shrink_node_cache(struct f2fs_sb_info *sbi,
 	return f2fs_do_shrink_cache(NODE_CACHE(sbi), nr_to_scan);
 }
 
+static inline unsigned long f2fs_total_cached_entries(struct f2fs_sb_info *sbi)
+{
+	unsigned long total = READ_ONCE(META_CACHE(sbi)->num_entries) +
+			      READ_ONCE(NODE_CACHE(sbi)->num_entries);
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (test_opt(sbi, COMPRESS_CACHE))
+		total += READ_ONCE(COMPRESS_CACHE(sbi)->num_entries);
+#endif
+	return total;
+}
+
+static inline s64 f2fs_nr_dirty_caches(struct f2fs_sb_info *sbi)
+{
+	return get_nr_caches(sbi, F2FS_DIRTY_META) +
+		get_nr_caches(sbi, F2FS_DIRTY_NODES);
+}
+
+/*
+ * f2fs_write_{meta,node}_caches() skip writeback until there are enough
+ * dirty caches to gather, so don't wake up f2fs_writeback for nothing.
+ */
+static inline bool f2fs_cache_wb_collectable(struct f2fs_sb_info *sbi,
+						s64 nr_dirty, int type)
+{
+	return nr_dirty && nr_dirty >= nr_caches_to_skip(sbi, type);
+}
+
+static bool f2fs_cache_wb_exceeded(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_cache_kthread *cache_thread = &sbi->cache_thread;
+	unsigned int total_threshold, dirty_threshold;
+	s64 nr_meta, nr_node;
+
+	total_threshold = READ_ONCE(cache_thread->cache_wb_total_threshold);
+	dirty_threshold = READ_ONCE(cache_thread->cache_wb_dirty_threshold);
+
+	/*
+	 * Both thresholds are disabled, rely on periodic writeback only,
+	 * unless checkpoint is disabled, as nothing else will flush dirty
+	 * caches then.
+	 */
+	if (!total_threshold && !dirty_threshold &&
+	    !is_sbi_flag_set(sbi, SBI_CP_DISABLED))
+		return false;
+
+	if (total_threshold &&
+	    f2fs_total_cached_entries(sbi) < total_threshold)
+		return false;
+
+	nr_meta = get_nr_caches(sbi, F2FS_DIRTY_META);
+	nr_node = get_nr_caches(sbi, F2FS_DIRTY_NODES);
+
+	if (dirty_threshold && nr_meta + nr_node < dirty_threshold)
+		return false;
+
+	return f2fs_cache_wb_collectable(sbi, nr_meta, META) ||
+		f2fs_cache_wb_collectable(sbi, nr_node, NODE);
+}
+
+static bool f2fs_should_wake_up_cache_wb(struct f2fs_sb_info *sbi)
+{
+	/* last round made no progress, wait for periodic writeback */
+	if (READ_ONCE(sbi->cache_thread.cache_wb_throttled))
+		return false;
+
+	return f2fs_cache_wb_exceeded(sbi);
+}
+
 static int f2fs_cache_writeback_kthread(void *data)
 {
 	struct f2fs_sb_info *sbi = data;
@@ -690,15 +759,27 @@ static int f2fs_cache_writeback_kthread(void *data)
 	set_freezable();
 
 	while (!kthread_should_stop()) {
-		unsigned int interval = cache_thread->cache_wb_interval;
+		unsigned int interval = READ_ONCE(cache_thread->cache_wb_interval);
+		long nr_meta = 0, nr_node = 0;
+		s64 nr_dirty;
 
 		wait_event_freezable_timeout(*wq,
-				kthread_should_stop(),
+				kthread_should_stop() ||
+				f2fs_should_wake_up_cache_wb(sbi),
 				msecs_to_jiffies(interval));
 
 		if (kthread_should_stop())
 			break;
 
+		/*
+		 * If thresholds are exceeded, throttle threshold based wakeup
+		 * until a round makes progress, otherwise we may busy-loop if
+		 * this round can not write anything, e.g. on cp_error, freezing,
+		 * frozen fs, or lock contention.
+		 */
+		WRITE_ONCE(cache_thread->cache_wb_throttled,
+				f2fs_cache_wb_exceeded(sbi));
+
 		if (f2fs_readonly(sbi->sb))
 			continue;
 
@@ -711,14 +792,41 @@ static int f2fs_cache_writeback_kthread(void *data)
 		if (!sb_start_write_trylock(sbi->sb))
 			continue;
 
-		f2fs_write_meta_caches(sbi);
-		f2fs_write_node_caches(sbi);
+		nr_dirty = f2fs_nr_dirty_caches(sbi);
+
+		f2fs_write_meta_caches(sbi, &nr_meta);
+		f2fs_write_node_caches(sbi, &nr_node);
 
 		sb_end_write(sbi->sb);
+
+		/*
+		 * Don't rely on the delta of dirty caches only, as caches may
+		 * be dirtied concurrently; also count in caches cleaned by
+		 * others, e.g. checkpoint triggered by f2fs_balance_fs_bg().
+		 */
+		if (nr_meta || nr_node || f2fs_nr_dirty_caches(sbi) < nr_dirty)
+			WRITE_ONCE(cache_thread->cache_wb_throttled, false);
+
+		cond_resched();
 	}
 	return 0;
 }
 
+void f2fs_wake_up_cache_wb(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_cache_kthread *cache_thread = &sbi->cache_thread;
+
+	/* pairs with smp_store_release() in f2fs_start_cache_wb_thread() */
+	if (!smp_load_acquire(&cache_thread->cache_wb_task))
+		return;
+
+	if (!f2fs_should_wake_up_cache_wb(sbi))
+		return;
+
+	if (wq_has_sleeper(&cache_thread->cache_wb_wq))
+		wake_up(&cache_thread->cache_wb_wq);
+}
+
 int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_cache_kthread *cache_thread = &sbi->cache_thread;
@@ -731,6 +839,9 @@ int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi)
 
 	init_waitqueue_head(&cache_thread->cache_wb_wq);
 	cache_thread->cache_wb_interval = DEF_DIRTY_CACHE_TIMEOUT;
+	cache_thread->cache_wb_dirty_threshold = DEF_CACHE_WB_DIRTY_THRESH;
+	cache_thread->cache_wb_total_threshold = 0;
+	cache_thread->cache_wb_throttled = false;
 	snprintf(name, sizeof(name), "f2fs_writeback-%u:%u",
 			MAJOR(dev), MINOR(dev));
 
@@ -738,7 +849,8 @@ int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi)
 	if (IS_ERR(task))
 		return PTR_ERR(task);
 
-	cache_thread->cache_wb_task = task;
+	/* pairs with smp_load_acquire() in f2fs_wake_up_cache_wb() */
+	smp_store_release(&cache_thread->cache_wb_task, task);
 	return 0;
 }
 
@@ -750,5 +862,5 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi)
 		return;
 
 	kthread_stop(cache_thread->cache_wb_task);
-	cache_thread->cache_wb_task = NULL;
+	WRITE_ONCE(cache_thread->cache_wb_task, NULL);
 }
diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
index 3df3a562c46f..5408727dd321 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -234,13 +234,19 @@ unsigned long f2fs_shrink_node_cache(struct f2fs_sb_info *sbi,
 #define MIN_DIRTY_CACHE_TIMEOUT 100
 #define MAX_DIRTY_CACHE_TIMEOUT 30000
 
+#define DEF_CACHE_WB_DIRTY_THRESH	(8192)
+
 struct f2fs_cache_kthread {
 	struct task_struct *cache_wb_task;
 	wait_queue_head_t cache_wb_wq;
 	unsigned int cache_wb_interval;
+	unsigned int cache_wb_dirty_threshold;
+	unsigned int cache_wb_total_threshold;
+	bool cache_wb_throttled;	/* last round made no progress */
 };
 
 int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
 void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
+void f2fs_wake_up_cache_wb(struct f2fs_sb_info *sbi);
 
 #endif /* _LINUX_F2FS_CACHE_H */
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 2e5e0ee5feb2..fd0a6c03987e 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -581,10 +581,11 @@ static bool __f2fs_write_meta_cache(struct f2fs_cached_block *entry,
 	return false;
 }
 
-void f2fs_write_meta_caches(struct f2fs_sb_info *sbi)
+void f2fs_write_meta_caches(struct f2fs_sb_info *sbi, long *nr_written)
 {
 	struct f2fs_lock_context lc;
 	long nr_to_write = LONG_MAX;
+	long nwritten;
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
 		return;
@@ -599,8 +600,11 @@ void f2fs_write_meta_caches(struct f2fs_sb_info *sbi)
 		return;
 
 	nr_to_write = adjust_flush_cache_number(sbi, META);
-	f2fs_sync_meta_caches(sbi, nr_to_write, false, FS_META_IO);
+	nwritten = f2fs_sync_meta_caches(sbi, nr_to_write, false, FS_META_IO);
 	f2fs_up_write_trace(&sbi->cp_global_sem, &lc);
+
+	if (nr_written)
+		*nr_written = nwritten;
 }
 
 long f2fs_sync_meta_caches(struct f2fs_sb_info *sbi, long nr_to_write,
@@ -1553,7 +1557,7 @@ static int block_operations(struct f2fs_sb_info *sbi)
 		f2fs_up_write(&sbi->node_write);
 		atomic_inc(&sbi->wb_sync_req[NODE]);
 		err = f2fs_writeback_node_caches(sbi, LONG_MAX,
-			true, false, FS_CP_NODE_IO);
+			true, false, FS_CP_NODE_IO, NULL);
 		atomic_dec(&sbi->wb_sync_req[NODE]);
 		if (err) {
 			f2fs_up_write(&sbi->node_change);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 089a62c054ea..362f06cb398d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4132,7 +4132,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from);
 int f2fs_truncate_xattr_node(struct inode *inode);
 int f2fs_wait_on_node_caches_writeback(struct f2fs_sb_info *sbi,
 					unsigned int seq_id);
-int f2fs_write_node_caches(struct f2fs_sb_info *sbi);
+int f2fs_write_node_caches(struct f2fs_sb_info *sbi, long *nr_written);
 int f2fs_remove_inode_cache(struct inode *inode);
 struct f2fs_cached_block *f2fs_new_inode_cache(struct inode *inode);
 struct f2fs_cached_block *f2fs_new_node_cache(struct dnode_of_data *dn, unsigned int ofs);
@@ -4151,7 +4151,8 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
 int f2fs_fsync_node_caches(struct f2fs_sb_info *sbi, struct inode *inode,
 					bool atomic, unsigned int *seq_id);
 int f2fs_writeback_node_caches(struct f2fs_sb_info *sbi, long nr_to_write,
-			bool sync, bool do_balance, enum iostat_type io_type);
+			bool sync, bool do_balance, enum iostat_type io_type,
+			long *nr_written);
 int f2fs_build_free_nids(struct f2fs_sb_info *sbi, bool sync, bool mount);
 bool f2fs_alloc_nid(struct f2fs_sb_info *sbi, nid_t *nid);
 void f2fs_alloc_nid_done(struct f2fs_sb_info *sbi, nid_t nid);
@@ -4317,7 +4318,7 @@ int f2fs_ra_meta_caches(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 			int type, bool sync);
 void f2fs_ra_meta_caches_cond(struct f2fs_sb_info *sbi, pgoff_t index,
 							unsigned int ra_blocks);
-void f2fs_write_meta_caches(struct f2fs_sb_info *sbi);
+void f2fs_write_meta_caches(struct f2fs_sb_info *sbi, long *nr_written);
 long f2fs_sync_meta_caches(struct f2fs_sb_info *sbi, long nr_to_write,
 				bool sync, enum iostat_type io_type);
 void f2fs_add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino, int type);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 7b2ff2c3dd03..1863e8f1c859 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2111,7 +2111,8 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 }
 
 int f2fs_writeback_node_caches(struct f2fs_sb_info *sbi, long nr_to_write,
-			bool sync, bool do_balance, enum iostat_type io_type)
+			bool sync, bool do_balance, enum iostat_type io_type,
+			long *nr_written)
 {
 	pgoff_t index;
 	struct f2fs_cached_block *entries[F2FS_ONSTACK_CACHES];
@@ -2231,6 +2232,9 @@ int f2fs_writeback_node_caches(struct f2fs_sb_info *sbi, long nr_to_write,
 
 	trace_f2fs_write_caches(sbi, nr_to_write, nwritten, NODE);
 
+	if (nr_written)
+		*nr_written = nwritten;
+
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 	return ret;
@@ -2271,7 +2275,7 @@ int f2fs_wait_on_node_caches_writeback(struct f2fs_sb_info *sbi,
 	return f2fs_cp_error(sbi) ? -EIO : 0;
 }
 
-int f2fs_write_node_caches(struct f2fs_sb_info *sbi)
+int f2fs_write_node_caches(struct f2fs_sb_info *sbi, long *nr_written)
 {
 	struct blk_plug plug;
 	long nr_to_write = LONG_MAX;
@@ -2296,7 +2300,8 @@ int f2fs_write_node_caches(struct f2fs_sb_info *sbi)
 
 	nr_to_write = adjust_flush_cache_number(sbi, NODE);
 	blk_start_plug(&plug);
-	f2fs_writeback_node_caches(sbi, nr_to_write, false, true, FS_NODE_IO);
+	f2fs_writeback_node_caches(sbi, nr_to_write, false, true, FS_NODE_IO,
+								nr_written);
 	blk_finish_plug(&plug);
 	return 0;
 }
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index afce74744d4d..95f8dc0c4218 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1019,7 +1019,9 @@ static ssize_t f2fs_sbi_store(struct f2fs_attr *a,
 					a->struct_type == GC_THREAD);
 	bool thread_entry = !strcmp(a->attr.name, "ckpt_thread_ioprio") ||
 			!strcmp(a->attr.name, "critical_task_priority") ||
-			!strcmp(a->attr.name, "cache_wb_interval");
+			!strcmp(a->attr.name, "cache_wb_interval") ||
+			!strcmp(a->attr.name, "cache_wb_dirty_threshold") ||
+			!strcmp(a->attr.name, "cache_wb_total_threshold");
 
 	if (gc_entry || thread_entry) {
 		if (!down_read_trylock(&sbi->sb->s_umount))
@@ -1363,6 +1365,8 @@ ATGC_INFO_RW_ATTR(atgc_age_threshold, age_threshold);
 
 /* WB_THREAD ATTR */
 WB_THREAD_RW_ATTR(cache_wb_interval, cache_wb_interval);
+WB_THREAD_RW_ATTR(cache_wb_dirty_threshold, cache_wb_dirty_threshold);
+WB_THREAD_RW_ATTR(cache_wb_total_threshold, cache_wb_total_threshold);
 
 F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(free_segments);
@@ -1552,6 +1556,8 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(adjust_lock_priority),
 	ATTR_LIST(critical_task_priority),
 	ATTR_LIST(cache_wb_interval),
+	ATTR_LIST(cache_wb_dirty_threshold),
+	ATTR_LIST(cache_wb_total_threshold),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.49.0

