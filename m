Received: from mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723B845039
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787901631; cv=none; b=Bh9jrXpb/UClaSqb3tthv4YrfsqKjsDmxNKMNafcNaGmHiBVvo2RA17s5X4wa19O6U7Uhk3VtYdJW6BwLXukIa+/QxtIPJGdh1Ynp9jN0Ll4TqxU6cV11Rin72X0hK7hPaO1kQ3JYsUl5z713O3j1V0ex7s2+jvJKd5mBqa6QF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787901631; c=relaxed/simple;
	bh=lyJSjacjcFvHRNzPVGXfZPUd0xoPdr41+3jUabfwPgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WaP47DCQYY22rC+duQssctCvxtx/a+X1+O+LKeV8nqbDnpdT7D0qj2sBRP/3g4xFgN3dF3JAHDvUISQ8dsGLrdlsYA029yBa+V2ov9wWSQFrhvUXZy7ZrymRd9Rcodk298hYUjzsILT5Ch2YHPx0MBYg4q179WOR6n73ez585EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AxEFuAZO; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AxEFuAZO"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lyJSjacjcFvHRNzPVGXfZPUd0xoPdr41+3jUabfwPgg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787901627; v=1; x=1788506427;
 b=AxEFuAZONFGlr+bnw4xYt96k2snAK+cHqXcfjKqIZrWo47gtiMpW8MbRhrdcBeTw++RJHdRV
 Xo5GMAG2LxFjM6J2IL2L3Gc82v/LzfjDAihUYnJcz6Woaf3NfW8v4qrpzdPlpc+A7/kH1gAt+VF
 MW7jtwXFpa/XBoya2x6aa0Ow=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 60ab96d263ab17e5;
	Fri, 28 Aug 2026 07:20:16 +0000
X-Mizu-Trace-ID: 60ab96d263ab17e5
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: axboe@kernel.dk,
	hch@lst.de
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH] loop: defer the queue limits clear to a workqueue
Date: Fri, 28 Aug 2026 15:20:04 +0800
Message-ID: <20260828072004.273519-1-cui.tao@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

loop_clear_limits() calls queue_limits_commit_update() directly from
the loop workqueue that processes the request.  That does a
non-atomic struct assignment to q->limits without freezing the queue,
which races with lockless readers of q->limits on other CPUs - bio
splitting reads max_hw_sectors, the discard path reads
max_hw_discard_sectors - and can let them observe torn values.  The
trigger is a discard or write-zeroes request on a loop device whose
backing file does not support the corresponding fallocate operation.

The code already has an XXX comment saying this should move to a
workqueue.  Do that: schedule a work item on the system workqueue,
where it is safe to freeze the queue and update the limits using
queue_limits_commit_update_frozen().  Accumulate pending modes in
lo->clear_limits_mode so that failures between scheduling and
execution of the work item are not lost, and cancel the work item
before the device is freed.  If the device is reconfigured to a
backing file that does support the operation in that window, the
stale clear takes effect and discard is disabled until the next
reconfiguration.

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 drivers/block/loop.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 6f12976035b0..5a1e8b6794ed 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -67,6 +67,8 @@ struct loop_device {
 	struct list_head        rootcg_cmd_list;
 	struct list_head        idle_worker_list;
 	struct rb_root          worker_tree;
+	struct work_struct      clear_limits_work;
+	int			clear_limits_mode;
 	struct timer_list       timer;
 	bool			sysfs_inited;
 
@@ -222,9 +224,12 @@ static void loop_set_size(struct loop_device *lo, loff_t size)
 		kobject_uevent(&disk_to_dev(lo->lo_disk)->kobj, KOBJ_CHANGE);
 }
 
-static void loop_clear_limits(struct loop_device *lo, int mode)
+static void loop_clear_limits_workfn(struct work_struct *work)
 {
+	struct loop_device *lo =
+		container_of(work, struct loop_device, clear_limits_work);
 	struct queue_limits lim = queue_limits_start_update(lo->lo_queue);
+	int mode = lo->clear_limits_mode;
 
 	if (mode & FALLOC_FL_ZERO_RANGE)
 		lim.max_write_zeroes_sectors = 0;
@@ -234,14 +239,13 @@ static void loop_clear_limits(struct loop_device *lo, int mode)
 		lim.discard_granularity = 0;
 	}
 
-	/*
-	 * XXX: this updates the queue limits without freezing the queue, which
-	 * is against the locking protocol and dangerous.  But we can't just
-	 * freeze the queue as we're inside the ->queue_rq method here.  So this
-	 * should move out into a workqueue unless we get the file operations to
-	 * advertise if they support specific fallocate operations.
-	 */
-	queue_limits_commit_update(lo->lo_queue, &lim);
+	queue_limits_commit_update_frozen(lo->lo_queue, &lim);
+}
+
+static void loop_clear_limits(struct loop_device *lo, int mode)
+{
+	lo->clear_limits_mode |= mode;
+	schedule_work(&lo->clear_limits_work);
 }
 
 static int lo_fallocate(struct loop_device *lo, struct request *rq, loff_t pos,
@@ -1781,6 +1785,7 @@ static void lo_free_disk(struct gendisk *disk)
 		destroy_workqueue(lo->workqueue);
 	loop_free_idle_workers(lo, true);
 	timer_shutdown_sync(&lo->timer);
+	cancel_work_sync(&lo->clear_limits_work);
 	mutex_destroy(&lo->lo_mutex);
 	kfree(lo);
 }
@@ -2100,6 +2105,7 @@ static int loop_add(int i)
 	spin_lock_init(&lo->lo_lock);
 	spin_lock_init(&lo->lo_work_lock);
 	INIT_WORK(&lo->rootcg_work, loop_rootcg_workfn);
+	INIT_WORK(&lo->clear_limits_work, loop_clear_limits_workfn);
 	INIT_LIST_HEAD(&lo->rootcg_cmd_list);
 	disk->major		= LOOP_MAJOR;
 	disk->first_minor	= i << part_shift;
-- 
2.43.0

