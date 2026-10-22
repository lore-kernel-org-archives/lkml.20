Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673586;
	b=X07ZjzGYBbLxyedwIgR1szsGV0/b3Pqp+6pjm00tC4SfKm/tT6QYwrbLopq2Gn2iHIK4
	 lfEv64BWlFCxhpz60hDhDAIrcYolbX426jYCP4/SEkPlSDbXfBy8O9cNfuPiIoZ1gbRDm
	 xHaPChUr3kaBFFUkSPfc+V/CZjeG29Sa0d8OMeKXfa+vX2ispwjAORMGQSQuQE3mcZSny
	 YIwipmhu/IlOGcgTxfIUGmuduWmwRrGN309UroxIde8wC3lTNXQE/h1NjL3m5bEIi9uIW
	 9UjeRWleWivhMGiN9qmv0wRDuxVe6EMylN9sOrawEYhqeT+Q9rjtUPJ/WZszmqPTorg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673586;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=f3425FFwqY4+ykygrz2W1w/JyuCVFU9bZFNGhlsY4u4=;
	b=Nhn6xRyc1tDPosV3gtDkuGOQIOkTNhm4CMNDnmxJD4N/o5tAuEB/JEZwWlRnCvtxPrb2
	 uC8gAuCyAbuWp/TnkkvCJhThFkLUQpcKeCXfIED92eNxCNEvchT67pJdI5AUQWRrDTbvQ
	 8vBWimt0aXgLnZyo/emhVfocC8L/vQEoUJgGU3TUH1Q+JLbEQ2+uf5VCY/aoWEMtVoJJ8
	 DyQWNqpgEjRQi/1BEXY6yQ0pWbdxt6frJBf5hHJD6NNEl2LwHknt2jZacSgISA7RrYmaX
	 /o5Si8ejV2sG5r7Avc2ynWibGXZV+n1u/GXbXS0gXDslUYFgLl2lYDHTu6D5ItinroQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kj16Mgas;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4559A606A336
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kj16Mgas
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DC51F000C2;
	Thu, 22 Oct 2026 12:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792673585;
	bh=f3425FFwqY4+ykygrz2W1w/JyuCVFU9bZFNGhlsY4u4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kj16MgasWVl8hOMHuDqyew0FxWjoNWqjQtGJiRUni2hZnZA+2gejVwlEndYitzM8A
	 1kGal2hP8cykmGouQK6FwBYDg+25sqPu+L5pnarOzg7ikigoRfVPJaztMXC955hkhO
	 bzXP/aRRnAoU7PLLziY8CtPSrW3OIpCIgMYvm7fQTx9TAs5s0GLQck6LTSqigPxZnq
	 RtRhSoRtUmYiqYkGRjDam9lfAM6/l4+aUdfkFvTho0st7ZWHs3PzA1tqmibwe0wcd/
	 al1ISjek0Cxz68Ijr8EW/jl4Bns7+pbzXh5tQEeg1t9d89Ut2YrrCFP/wYC/CZ+TzF
	 7kndehlPHlzvA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH 7/7] f2fs: cache: fix to initialize f2fs_writeback info at mount time
Date: Thu, 22 Oct 2026 12:52:44 +0000
Message-ID: <20261022125244.2205275-7-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261022125244.2205275-1-chao@kernel.org>
References: <20261022125244.2205275-1-chao@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

f2fs_start_cache_wb_thread() initializes cache_wb_wq and f2fs_writeback
tunables every time f2fs_writeback thread is started, e.g. in remount,
which causes below race conditions:

1. cache_wb_interval, cache_wb_dirty_threshold and
   cache_wb_total_threshold configured via sysfs will be reset to
   default value after remount.

2. remount will reinitialize cache_wb_wq, which may be used by another
   thread, e.g. f2fs_wake_up_cache_wb(), concurrently.

Let's introduce f2fs_init_cache_wb_info() to initialize them only once
in f2fs_fill_super(), then f2fs_start_cache_wb_thread() only needs to
reset cache_wb_throttled, and READ_ONCE()/WRITE_ONCE() is enough for
cache_wb_task.

Cc: stable@kernel.org
Fixes: f45afeabd5df ("f2fs: cache: introduce writeback thread")
Fixes: eeadc4807c95 ("f2fs: cache: wake up f2fs_writeback when exceeding threshold")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.c | 23 ++++++++++++++---------
 fs/f2fs/cache.h |  1 +
 fs/f2fs/super.c |  1 +
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index ddf94b5791e7..6cac7662fc1a 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -844,8 +844,7 @@ void f2fs_wake_up_cache_wb(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_cache_kthread *cache_thread = &sbi->cache_thread;
 
-	/* pairs with smp_store_release() in f2fs_start_cache_wb_thread() */
-	if (!smp_load_acquire(&cache_thread->cache_wb_task))
+	if (!READ_ONCE(cache_thread->cache_wb_task))
 		return;
 
 	if (!f2fs_should_wake_up_cache_wb(sbi))
@@ -855,6 +854,17 @@ void f2fs_wake_up_cache_wb(struct f2fs_sb_info *sbi)
 		wake_up(&cache_thread->cache_wb_wq);
 }
 
+void f2fs_init_cache_wb_info(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_cache_kthread *cache_thread = &sbi->cache_thread;
+
+	init_waitqueue_head(&cache_thread->cache_wb_wq);
+	cache_thread->cache_wb_interval = DEF_DIRTY_CACHE_TIMEOUT;
+	cache_thread->cache_wb_dirty_threshold = DEF_CACHE_WB_DIRTY_THRESH;
+	cache_thread->cache_wb_total_threshold = 0;
+	cache_thread->cache_wb_throttled = false;
+}
+
 int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_cache_kthread *cache_thread = &sbi->cache_thread;
@@ -865,11 +875,7 @@ int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi)
 	if (cache_thread->cache_wb_task)
 		return 0;
 
-	init_waitqueue_head(&cache_thread->cache_wb_wq);
-	cache_thread->cache_wb_interval = DEF_DIRTY_CACHE_TIMEOUT;
-	cache_thread->cache_wb_dirty_threshold = DEF_CACHE_WB_DIRTY_THRESH;
-	cache_thread->cache_wb_total_threshold = 0;
-	cache_thread->cache_wb_throttled = false;
+	WRITE_ONCE(cache_thread->cache_wb_throttled, false);
 	snprintf(name, sizeof(name), "f2fs_writeback-%u:%u",
 			MAJOR(dev), MINOR(dev));
 
@@ -877,8 +883,7 @@ int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi)
 	if (IS_ERR(task))
 		return PTR_ERR(task);
 
-	/* pairs with smp_load_acquire() in f2fs_wake_up_cache_wb() */
-	smp_store_release(&cache_thread->cache_wb_task, task);
+	WRITE_ONCE(cache_thread->cache_wb_task, task);
 	return 0;
 }
 
diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
index 5408727dd321..cd017c1b188f 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -245,6 +245,7 @@ struct f2fs_cache_kthread {
 	bool cache_wb_throttled;	/* last round made no progress */
 };
 
+void f2fs_init_cache_wb_info(struct f2fs_sb_info *sbi);
 int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
 void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
 void f2fs_wake_up_cache_wb(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ba2ec6123251..12a051ba51ac 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5356,6 +5356,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	f2fs_init_cache(sbi, META_CACHE(sbi), F2FS_META_CACHE);
 	f2fs_init_cache(sbi, NODE_CACHE(sbi), F2FS_NODE_CACHE);
 	f2fs_init_cache(sbi, COMPRESS_CACHE(sbi), F2FS_COMPRESS_CACHE);
+	f2fs_init_cache_wb_info(sbi);
 
 	err = f2fs_get_valid_checkpoint(sbi);
 	if (err) {
-- 
2.49.0

