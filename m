Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588403F9F25
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 19:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791401501; cv=none; b=U6Sb131qrfCB4BpYqDQz5vxLEmzxAp55vgZEmEd0ga4rwCEkiHGst9bmffF4vYvEEPLlwDaXPtf0vtkndOjkDU1qk+6k+lkH/0hFmFQNYZ3yaiLgjoRtWn/w9izgo3n+E3GXBE5enlJDAYy+DsM/3q0bPzjGUbc1RU6mHoyXxxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791401501; c=relaxed/simple;
	bh=sPf4XkyKHL5C/iZQhm5GFAQoQfQC9eB63ArM/UykqbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AgsEZsiV1bmCnYF46p/mJAsXAlxmXzdz+NwzcohcNu6j9tU9w27mzsP5P+Auo4gwGisrneMvmW4IzntBPRyDl1uSIJBOO7O6AloHv4c/Ps/uF4GaZ9EugDOwPm9u8uXhF7ax6+1YnM7v84MPMK6eMfVQQtJ4C2r3dmOVMo4UFHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCY265FO; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCY265FO"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e623eda81cso4206395ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791401500; x=1792006300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+a6G9l8U8LHfxZ8VgLGKsGq7UAi+F+l/ig1DUT9bFV4=;
        b=XCY265FOG1fhVHTerlbKOdVyk26Cqg6w6y1uo+rG1YmyfMUx8bLcXGBFUNY9X9+oAF
         tXy66gAr/OaZp7n/mULgmbBzu24pCQnbraZLeo6FaqSbB7RD+99gOwJy1YDrT5R6/VO3
         6HYUqQoHWKgmzf8BI8thYYBhoCkNbQ6uGH3fBZCLcbH7aLTIOiafBFQPOpdjVnwxtwXU
         6x4qNqNJIg2M5DLLau+R+3IkbBf0FbwfqTB9fL7i/+/uDWynh3Wj1WV6IUQUsRjJZ44K
         M5vBzpgR5JBJY/CDHvvPEBm1qGW2N7k2Ft1wZiJgRFXUbbwbtqNN+PdW9jLGGwj/qlrh
         YfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791401500; x=1792006300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+a6G9l8U8LHfxZ8VgLGKsGq7UAi+F+l/ig1DUT9bFV4=;
        b=CBLn4OgPZ45XFGfYXzTP9fJ48EPMAwxv1EG91ez52Z1HpUyP5YRB62C8ITUXB71hZG
         fiX40eUxlYVeJxC+mKo45k/mAVlLI0CccnhLC5GsIKP9JgiK6/rxSLEl6IG2lcvX5Mk6
         6K0YMEbjTPB1JDZm+3JvfVzd2BKVlqzhFXjVQwPQB4ehKru/lJiLYMIoNOmVWzJsqHs+
         PbAxpi0Fj4//xgpVz5WabVvfFSzb0Kh+P40YEk7s7RdXs3KBGpin+9FCNfJgtGj5aL3J
         P6ClWQU7YXUoFYHrIzR3z895JX9YMZEQYVmneymx11RbSLMb3d0FbARNQoXsdTO1TIgi
         RcTA==
X-Gm-Message-State: AFq9FYIxgWt7oS+XyFrIRN2tws3sMBmIVyKq5FJbq1Bi+0yTPCxn+AAk
	zOsLIGnMobhPKQccO1fejjGx5ZbZXYh7RdF0vdc+wYmQYGcEz72lclgilyNQwPve
X-Gm-Gg: AYBFou0zKfdwElMxK7PebhP0z7R7EGkuKHmCKjx7bCNdEcCokMOUCAspr0J6X/7aYIo
	jF2QDDmrwhz0FDuOYFLaDMbBgaG20qAisCU0NUoNK+73vDsBkUKaL/ci7cD04W6hoLZ7gbuUpud
	VuMo06UwEtrilCJY/bqpcJ11Chn+yxf4pedD9G0AnP/m/qLlUfDxZOfyNE+SGsxQL5WGEZI987T
	62Mgw3DJRzJOhT/H8WAmd0XNOaH/WH0vrNpUHJbWYNvwnSxmKLPI09RNgBIk7v7u2H7geMn2UXC
	UheAGCfyELwx5309HfYTEI9CWk/aHL01CGL3LuMuFEoGBPTQrmpw5WknGJWvymt0Sci/JafgVpf
	G+gs2arqeUjyvh9cGQxdPEub5BKXc/slmrsyARwHCk7uuWqp/FjJ7vINavuzYC+dtOqxlDOtjTt
	TSbp9lVuMewbHdKAkW4lOZu/i4ZJS7JausM9jD05jyJnuxWbUpkPewgH3nYfc8MothmdvuskhuS
	jY297/izDoKYHvImHS00h01Gr53NuVCuwY74pGlCvocHSqfrS4nubYG3qn0hyIPGR9j6v0mhMRO
	+fR3uISEXsRCgwk=
X-Received: by 2002:a17:903:3846:b0:2df:a4d8:57ad with SMTP id d9443c01a7336-2e60057831dmr28952575ad.72.1791401499570;
        Wed, 07 Oct 2026 12:31:39 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482d316sm16125975ad.49.2026.10.07.12.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 12:31:38 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: cache: wake up the writeback thread while checkpoint is disabled
Date: Wed,  7 Oct 2026 19:31:31 +0000
Message-ID: <20261007193131.1785199-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

Dirty node and meta caches are written back by the cache writeback
thread and by checkpoint. The thread wakes up every cache_wb_interval
(5 seconds by default) and writes at most 512 node caches and one
contiguous run of meta caches. Checkpoint, which f2fs_balance_fs_bg()
triggers when there are too many dirty caches, writes the rest.

While checkpoint is disabled, checkpoint does not run: f2fs_sync_fs()
returns early and f2fs_balance_fs() returns before doing anything. So
dirty node caches pile up without a limit. They are kmalloc'd, and the
shrinker skips dirty entries, so this memory cannot be reclaimed. When
node and meta blocks were in the page cache, the dirty pages were
counted as dirty page cache, and the flusher threads wrote them back in
the background.

A checkpoint=disable test that remounts the filesystem with
checkpoint=disable and runs fsstress -p 32 for 300 seconds left about
160K dirty node caches (2.7GB of kmalloc-16k) with 16KB blocks and
about 226K with 4KB blocks in QEMU, and drop_caches freed none of them.

While checkpoint is disabled, wake up the thread from
f2fs_mark_cache_dirty() once there are as many dirty node or meta
caches as f2fs_write_node_caches() and f2fs_write_meta_caches() collect
before writing, and let the thread go on without waiting while that is
still true and each round writes some of them. Each round writes the
same number of caches as before. Split nr_caches_to_collect() out of
nr_caches_to_skip() to share these numbers without the dirty_exceeded
check.

With this, the same test keeps about 4K dirty node caches with both
4KB and 16KB blocks. Nothing changes while checkpoint is enabled.

Fixes: 7a1cf2a76b71 ("f2fs: cache: use meta cache")
Fixes: 493b9dc8b52c ("f2fs: cache: use node cache")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/cache.c   | 59 +++++++++++++++++++++++++++++++++++++++++++++--
 fs/f2fs/cache.h   |  1 +
 fs/f2fs/segment.h | 13 +++++++----
 3 files changed, 67 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 04b5408cbc5..6b6f49fae25 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -61,6 +61,42 @@ void f2fs_cache_update_tag(struct f2fs_cached_block *entry,
 	spin_unlock_irqrestore(&cache->tree_lock, flags);
 }
 
+/*
+ * While checkpoint is disabled, checkpoint does not write back dirty node and
+ * meta caches, and the writeback thread is the only one that writes them. Tell
+ * whether there are as many dirty caches as f2fs_write_node_caches() and
+ * f2fs_write_meta_caches() collect before writing, so that the thread should
+ * write them now instead of every cache_wb_interval.
+ */
+static bool f2fs_cache_wb_needed(struct f2fs_sb_info *sbi)
+{
+	if (likely(!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
+		return false;
+
+	return get_nr_caches(sbi, F2FS_DIRTY_NODES) >=
+				nr_caches_to_collect(sbi, NODE) ||
+		get_nr_caches(sbi, F2FS_DIRTY_META) >=
+				nr_caches_to_collect(sbi, META);
+}
+
+static void f2fs_wake_cache_wb_thread(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_cache_kthread *cache_thread = &sbi->cache_thread;
+
+	if (!f2fs_cache_wb_needed(sbi))
+		return;
+
+	/* pairs with smp_store_release() in f2fs_start_cache_wb_thread() */
+	if (!smp_load_acquire(&cache_thread->cache_wb_task))
+		return;
+
+	if (READ_ONCE(cache_thread->cache_wb_urgent))
+		return;
+
+	WRITE_ONCE(cache_thread->cache_wb_urgent, true);
+	wake_up(&cache_thread->cache_wb_wq);
+}
+
 bool f2fs_mark_cache_dirty(struct f2fs_cached_block *entry)
 {
 	struct f2fs_cached_block_list *cache = entry->cache;
@@ -81,6 +117,7 @@ bool f2fs_mark_cache_dirty(struct f2fs_cached_block *entry)
 		f2fs_cache_update_tag(entry, F2FS_CACHE_TAG_NONE,
 						F2FS_CACHE_TAG_DIRTY);
 		inc_cache_count(cache->sbi, type);
+		f2fs_wake_cache_wb_thread(cache->sbi);
 		return true;
 	}
 
@@ -679,10 +716,13 @@ static int f2fs_cache_writeback_kthread(void *data)
 
 	while (!kthread_should_stop()) {
 		unsigned int interval = cache_thread->cache_wb_interval;
+		s64 nr_dirty;
 
 		wait_event_freezable_timeout(*wq,
-				kthread_should_stop(),
+				kthread_should_stop() ||
+				READ_ONCE(cache_thread->cache_wb_urgent),
 				msecs_to_jiffies(interval));
+		WRITE_ONCE(cache_thread->cache_wb_urgent, false);
 
 		if (kthread_should_stop())
 			break;
@@ -699,10 +739,23 @@ static int f2fs_cache_writeback_kthread(void *data)
 		if (!sb_start_write_trylock(sbi->sb))
 			continue;
 
+		nr_dirty = get_nr_caches(sbi, F2FS_DIRTY_NODES) +
+				get_nr_caches(sbi, F2FS_DIRTY_META);
+
 		f2fs_write_meta_caches(sbi);
 		f2fs_write_node_caches(sbi);
 
 		sb_end_write(sbi->sb);
+
+		/*
+		 * Each round writes a limited number of caches. Go on without
+		 * waiting while there are still many dirty caches, as long as
+		 * this round wrote some of them.
+		 */
+		if (f2fs_cache_wb_needed(sbi) &&
+			get_nr_caches(sbi, F2FS_DIRTY_NODES) +
+			get_nr_caches(sbi, F2FS_DIRTY_META) < nr_dirty)
+			WRITE_ONCE(cache_thread->cache_wb_urgent, true);
 	}
 	return 0;
 }
@@ -719,6 +772,7 @@ int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi)
 
 	init_waitqueue_head(&cache_thread->cache_wb_wq);
 	cache_thread->cache_wb_interval = DEF_DIRTY_CACHE_TIMEOUT;
+	cache_thread->cache_wb_urgent = false;
 	snprintf(name, sizeof(name), "f2fs_writeback-%u:%u",
 			MAJOR(dev), MINOR(dev));
 
@@ -726,7 +780,8 @@ int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi)
 	if (IS_ERR(task))
 		return PTR_ERR(task);
 
-	cache_thread->cache_wb_task = task;
+	/* pairs with smp_load_acquire() in f2fs_wake_cache_wb_thread() */
+	smp_store_release(&cache_thread->cache_wb_task, task);
 	return 0;
 }
 
diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
index 6c4db910d76..1d0216d2128 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -232,6 +232,7 @@ struct f2fs_cache_kthread {
 	struct task_struct *cache_wb_task;
 	wait_queue_head_t cache_wb_wq;
 	unsigned int cache_wb_interval;
+	bool cache_wb_urgent;		/* write back without waiting */
 };
 
 int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 526764ba31a..58804e9cc29 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -983,11 +983,8 @@ static inline bool sec_usage_check(struct f2fs_sb_info *sbi, unsigned int secno)
  * 512 blocks (2MB) * 8 for nodes, and
  * 256 blocks * 8 for meta are set.
  */
-static inline int nr_caches_to_skip(struct f2fs_sb_info *sbi, int type)
+static inline int nr_caches_to_collect(struct f2fs_sb_info *sbi, int type)
 {
-	if (bdi_wb_dirty_exceeded(sbi->sb->s_bdi))
-		return 0;
-
 	if (type == DATA)
 		return BLKS_PER_SEG(sbi);
 	else if (type == NODE)
@@ -998,6 +995,14 @@ static inline int nr_caches_to_skip(struct f2fs_sb_info *sbi, int type)
 		return 0;
 }
 
+static inline int nr_caches_to_skip(struct f2fs_sb_info *sbi, int type)
+{
+	if (bdi_wb_dirty_exceeded(sbi->sb->s_bdi))
+		return 0;
+
+	return nr_caches_to_collect(sbi, type);
+}
+
 /*
  * When writing cache asynchronously, align nr_to_write to BIO_MAX_VECS.
  */
-- 
2.56.0.360.g66cac248cb-goog

