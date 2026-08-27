Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C542944210C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833555; cv=none; b=L0PEwNKeM6W7rjD+ZucVsOBiW0LsYmPyMtCgwZxkqVhO3twtzGp/zwccQpgQsOJ4dnE21xTgzP9S3uwxA8e+eYak6QnvNZGUosE5W64QXLzajAKvOKEWkeDU321VWOEdVGHda1mCWJ9fd+JCJ+4a5f54oUANUYW5T7Y+GU+4U9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833555; c=relaxed/simple;
	bh=bBx+yV7IJJhyABE+6s6KRhMsI4Bfhep+4wemGuyC/L8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jx/+J+auvd1iopup0t0uLoa3JW5/OcYjddqam/RBlW59F3JkCr1CckW5VEui0Gb65jMW984QdMGv0AOJsyNWwvgHcI0KMkr9s/Ns7XbtoIKr6HS0SeMFsBnN392/bMJsXwypNDirYIMGZmkzoUYLdv9VJdOMlb+IKOJWl911UG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8oWJkbE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8oWJkbE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97971F000E9;
	Thu, 27 Aug 2026 12:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787833553;
	bh=eUeyWzt4w0SobbG2JLAydbAuwXZJy+479kyABQ2pQ/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C8oWJkbEb3RtEOuC/YrC//ruTEWQTh/GE7Ao+o1jiZGyFuttuFdT2yvTKwoORQQZs
	 ANDIdbd9S5kFWFCOUlg5yY9aCV/BS2B254/FbO2rt3XGM67CMflaega2GkKalzXjlZ
	 9AP7WzytinG3598cLnvWRtE/ezIBdPtdiE4UUBbrTG84qfhuEuIvMV9aD3Z0kAjZE3
	 UDcWwWgDA9puNaH2V57bTj+a0DlfieHPJnT/Vnsl5xdx8BWIML64Wb9WjOH+kjmU9A
	 1AfFVt9AFvfSmIT6fCemLts+ULy2CYEhrAf18gSdm5TM28GG+t21Ge3+iFdND75/tn
	 pI7eLBD4SE4lg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v4 04/12] f2fs: cache: introduce writeback thread
Date: Thu, 27 Aug 2026 20:25:32 +0800
Message-ID: <20260827122541.19967-5-chao@kernel.org>
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

This patch introduces a background writeback kthread (f2fs_writeback-x:y)
to periodically flush dirty metadata cache entries with a default
interval of 5 seconds.

It manages thread lifecycle across mount, unmount, and remount (rw/ro)
transitions.

It introduces a sysfs entry /sys/fs/f2fs/<disk>/cache_wb_interval to control
writeback interval.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  6 +++
 fs/f2fs/cache.c                         | 56 +++++++++++++++++++++++++
 fs/f2fs/cache.h                         | 12 ++++++
 fs/f2fs/f2fs.h                          |  3 ++
 fs/f2fs/super.c                         | 31 +++++++++++++-
 fs/f2fs/sysfs.c                         | 13 +++++-
 6 files changed, 119 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 0cebc89799dd..d2665b7f1f14 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -1020,3 +1020,9 @@ Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	This is a read-only entry to show the upper bound section number
 		for pinned files. Pinned files will only be allocated within
 		sections 0 to pinned_area_max_secno - 1.
+
+What:		/sys/fs/f2fs/<disk>/cache_wb_interval
+Date:		August 2026
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	This is a writable entry to control writeback interval of
+		f2fs_writeback-x:y, by default the value is 5000, unit is ms.
diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 0cb8622ef580..59cc60ad4f91 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -640,3 +640,59 @@ unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
 {
 	return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
 }
+
+static int f2fs_cache_writeback_kthread(void *data)
+{
+	struct f2fs_sb_info *sbi = data;
+	struct f2fs_cache_kthread *cache_thread = &sbi->cache_thread;
+	wait_queue_head_t *wq = &cache_thread->cache_wb_wq;
+	unsigned int interval = cache_thread->cache_wb_interval;
+
+	set_freezable();
+
+	while (!kthread_should_stop()) {
+		wait_event_freezable_timeout(*wq,
+				kthread_should_stop(),
+				msecs_to_jiffies(interval));
+
+		if (kthread_should_stop())
+			break;
+		if (f2fs_cp_error(sbi))
+			continue;
+	}
+	return 0;
+}
+
+int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_cache_kthread *cache_thread = &sbi->cache_thread;
+	struct task_struct *task;
+	dev_t dev = sbi->sb->s_dev;
+	char name[36];
+
+	if (cache_thread->cache_wb_task)
+		return 0;
+
+	init_waitqueue_head(&cache_thread->cache_wb_wq);
+	snprintf(name, sizeof(name), "f2fs_writeback-%u:%u",
+			MAJOR(dev), MINOR(dev));
+
+	task = kthread_run(f2fs_cache_writeback_kthread, sbi, "%s", name);
+	if (IS_ERR(task))
+		return PTR_ERR(task);
+
+	cache_thread->cache_wb_task = task;
+	cache_thread->cache_wb_interval = DEF_DIRTY_CACHE_TIMEOUT;
+	return 0;
+}
+
+void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_cache_kthread *cache_thread = &sbi->cache_thread;
+
+	if (!cache_thread->cache_wb_task)
+		return;
+
+	kthread_stop(cache_thread->cache_wb_task);
+	cache_thread->cache_wb_task = NULL;
+}
diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
index 5f7e74f0c873..7adab25ff3ed 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -194,4 +194,16 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
 unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
 				unsigned long nr_to_scan);
 
+#define DEF_DIRTY_CACHE_TIMEOUT 5000
+
+struct f2fs_cache_kthread {
+	struct task_struct *cache_wb_task;
+	wait_queue_head_t cache_wb_wq;
+	atomic_t cache_wb_trigger;
+	unsigned int cache_wb_interval;
+};
+
+int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
+void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
+
 #endif /* _LINUX_F2FS_CACHE_H */
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0f855ac7d1e8..9fe9fadbb810 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2111,6 +2111,9 @@ struct f2fs_sb_info {
 
 	/* f2fs internal cache */
 	struct f2fs_cached_block_list meta_blocks;
+
+	/* internal cache flush thread */
+	struct f2fs_cache_kthread cache_thread;
 };
 
 /* Definitions to access f2fs_sb_info */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 32e80c70e141..9bb19f4c5fd2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2020,6 +2020,7 @@ static void f2fs_put_super(struct super_block *sb)
 	 * flush all issued checkpoints and stop checkpoint issue thread.
 	 * after then, all checkpoints should be done by each process context.
 	 */
+	f2fs_stop_cache_wb_thread(sbi);
 	f2fs_stop_ckpt_thread(sbi);
 
 	/*
@@ -2826,6 +2827,7 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 	unsigned int flags = fc->sb_flags;
 	int err;
 	bool need_restart_gc = false, need_stop_gc = false;
+	bool need_restart_wb = false, need_stop_wb = false;
 	bool need_restart_flush = false, need_stop_flush = false;
 	bool need_restart_discard = false, need_stop_discard = false;
 	bool need_enable_checkpoint = false, need_disable_checkpoint = false;
@@ -2984,6 +2986,18 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 		need_stop_gc = true;
 	}
 
+	if (flags & SB_RDONLY) {
+		if (sbi->cache_thread.cache_wb_task) {
+			f2fs_stop_cache_wb_thread(sbi);
+			need_restart_wb = true;
+		}
+	} else if (!sbi->cache_thread.cache_wb_task) {
+		err = f2fs_start_cache_wb_thread(sbi);
+		if (err)
+			goto restore_gc;
+		need_stop_wb = true;
+	}
+
 	if (flags & SB_RDONLY) {
 		sync_inodes_sb(sb);
 
@@ -3006,7 +3020,7 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 	} else {
 		err = f2fs_create_flush_cmd_control(sbi);
 		if (err)
-			goto restore_gc;
+			goto restore_wb;
 		need_stop_flush = true;
 	}
 
@@ -3103,6 +3117,13 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 		clear_opt(sbi, FLUSH_MERGE);
 		f2fs_destroy_flush_cmd_control(sbi, false);
 	}
+restore_wb:
+	if (need_restart_wb) {
+		if (f2fs_start_cache_wb_thread(sbi))
+			f2fs_warn(sbi, "background cache writeback thread has stopped");
+	} else if (need_stop_wb) {
+		f2fs_stop_cache_wb_thread(sbi);
+	}
 restore_gc:
 	if (need_restart_gc) {
 		if (f2fs_start_gc_thread(sbi))
@@ -5497,6 +5518,12 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 			goto sync_free_meta;
 	}
 
+	if (!f2fs_readonly(sb)) {
+		err = f2fs_start_cache_wb_thread(sbi);
+		if (err)
+			goto stop_gc_thread;
+	}
+
 	/* recover broken superblock */
 	if (recovery) {
 		err = f2fs_commit_super(sbi, true);
@@ -5519,6 +5546,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->umount_lock_holder = NULL;
 	return 0;
 
+stop_gc_thread:
+	f2fs_stop_gc_thread(sbi);
 sync_free_meta:
 	/* safe to flush all the data */
 	sync_filesystem(sbi->sb);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 811e350a1430..a9e8e0456ef5 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -40,6 +40,7 @@ enum {
 	RESERVED_BLOCKS,	/* struct f2fs_sb_info */
 	CPRC_INFO,	/* struct ckpt_req_control */
 	ATGC_INFO,	/* struct atgc_management */
+	WB_THREAD,	/* struct f2fs_cache_kthread */
 };
 
 static const char *gc_mode_names[MAX_GC_MODE] = {
@@ -98,6 +99,8 @@ static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
 		return (unsigned char *)&sbi->cprc_info;
 	else if (struct_type == ATGC_INFO)
 		return (unsigned char *)&sbi->am;
+	else if (struct_type == WB_THREAD)
+		return (unsigned char *)&sbi->cache_thread;
 	return NULL;
 }
 
@@ -1008,7 +1011,8 @@ static ssize_t f2fs_sbi_store(struct f2fs_attr *a,
 	bool gc_entry = (!strcmp(a->attr.name, "gc_urgent") ||
 					a->struct_type == GC_THREAD);
 	bool thread_entry = !strcmp(a->attr.name, "ckpt_thread_ioprio") ||
-			!strcmp(a->attr.name, "critical_task_priority");
+			!strcmp(a->attr.name, "critical_task_priority") ||
+			!strcmp(a->attr.name, "cache_wb_interval");
 
 	if (gc_entry || thread_entry) {
 		if (!down_read_trylock(&sbi->sb->s_umount))
@@ -1218,6 +1222,9 @@ static struct f2fs_attr f2fs_attr_##name = __ATTR(name, 0444, name##_show, NULL)
 #define ATGC_INFO_RW_ATTR(name, elname)				\
 	F2FS_RW_ATTR(ATGC_INFO, atgc_management, name, elname)
 
+#define WB_THREAD_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(WB_THREAD, f2fs_cache_kthread, name, elname)
+
 /* GC_THREAD ATTR */
 GC_THREAD_RW_ATTR(gc_urgent_sleep_time, urgent_sleep_time);
 GC_THREAD_RW_ATTR(gc_min_sleep_time, min_sleep_time);
@@ -1347,6 +1354,9 @@ ATGC_INFO_RW_ATTR(atgc_candidate_count, max_candidate_count);
 ATGC_INFO_RW_ATTR(atgc_age_weight, age_weight);
 ATGC_INFO_RW_ATTR(atgc_age_threshold, age_threshold);
 
+/* WB_THREAD ATTR */
+WB_THREAD_RW_ATTR(cache_wb_interval, cache_wb_interval);
+
 F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(free_segments);
 F2FS_GENERAL_RO_ATTR(ovp_segments);
@@ -1533,6 +1543,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(lock_duration_priority),
 	ATTR_LIST(adjust_lock_priority),
 	ATTR_LIST(critical_task_priority),
+	ATTR_LIST(cache_wb_interval),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.49.0

