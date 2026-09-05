Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C3C49E5CA
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622043; cv=none; b=IVYBMlMA8RuiBCEjdKPO7rVqVUI+PYEcQWr/22JCgu51s8GAv07YL8OaPzIsUkyNY2lXC8hRyLPsjLmR9dsNzokcY+7MzAMVjVzxvD5O2sIshmyXR6PjwKHoGosJFg7s9VBRAwaNhpYWfiY3OGMalWL0VzlmH2Q73CJ3qIdtQqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622043; c=relaxed/simple;
	bh=tMQJVYJRQF3dBnJ/EJVxZ9yPBJ8gF4Va+0gud6j2SRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J46/KbASHHwxjq3sxUfnSLw6IDDYIGuhQcHtiiScf6iNVzTC/qGW1GmfbeGpk6ZmUGuqr3nmTqzTf51w+BNt4KxnAxlt9Es3IXgkZwegBrOkfewJB8cZNlM3BqhNM1nNifO/61wTOh7K+7VrLF7IVC8xIN9jMVAvqGodaS0UGmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gn2kWUUX; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gn2kWUUX"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a7f27637d6so2239810a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788622040; x=1789226840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fMDzWqUveBSzd5QyaJkSDxL5FMTYjVkFKS0zQ+Fx1Uo=;
        b=Gn2kWUUXukbwCwQUcU8FfxI96GvF/qA3yi+l/E4mkW5k0/0RS9Lxw2HAbZeJq4lJkS
         6tZiyF3mx74vmZoHq4uDkPvdNKG2VEIoT3YC88GAMeXZCY6UdZWpL+HhxjlmYuRhdugG
         HgHNQrPymz5GODDqKr4fF3nv9vPh6Nqi6VeD7lJ2h3AkJ2r3ASGXCW7clYvO0HJ0caeq
         0JydRTT2tUJxnSxeKdKPwIkiV6k5YmuooAnOR7bM/FdZ2lx/Qb/7er56GZqiqhb/7Yqj
         E+ugYHNFuMB++77CqtMT7Mke9UQ2VGlCtgFPRy7+mJCrQzMctg4FhzdGGaa7cKFjeozE
         i8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622040; x=1789226840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fMDzWqUveBSzd5QyaJkSDxL5FMTYjVkFKS0zQ+Fx1Uo=;
        b=Orpb03sa8v27FyY7qa7fxI6UmQmXZqfVjUuCMsV+j/E9I8TE+OfLxpZZr0JaUI3lTu
         BTt0w8yhBxC2EHEmhOITOQ+D3uxU6pFKWsMjXjbU+N2f8/AxL/Zr4LV5fMkOIyxLYCJ1
         qCwy/XJSrZE0LfgS5Wjd3jbHmAtLrlb8DTXRbkpOnV+q4S11q7uhJH6Viuh7ue9evUnW
         8y+VaeHebjzvtMBEkzSXc3JMVmNVOsyFD05CyGQaSGfjnCDHYdMnD0k+gYgw10EiDqXu
         jcWBwfHYOXFiiQ/yPOdVoTwlg/QdTlh1sR0O3wpKh4LR98eP0cEDcpY6FGMnelNXOJ2J
         q52w==
X-Forwarded-Encrypted: i=1; AKwUvBw7iHecmlSpoMrWSLNxeBKWzEVY3Trl+48l1rnSrD9NH2qTt6W5OwbdTz4acNZwjS4iywAL//x4x8GDfLg=@vger.kernel.org
X-Gm-Message-State: AFuF++neGtJgZlWwkFqZ/q4Ma1Urv7ShGXtHvclebL0tdeAA+AgjGKpE
	+UdbivUkpeE4oRVjyevA1an+/XbwXGoDNdpdInronJJv1Cla9t+IKzKC
X-Gm-Gg: AYBFou3KPGAXwWgVhtX1OT01eL9YgrWyY24b5iSb3awpp2yyddkxszcVQDryrnL2A2k
	ggvRUf9GiIiJSUmyUgf4hwxKQ7xSzuKlxjk0xYdFy1d337uEtS3zUMHiFPB9dadlyyTtL9U10ae
	ysJprFUO+aqnmCFz/qhR8PaP8FOWCnEYkQw83+c03rkcszi/U7V14I1DlwczLNo1pwvS2MQPjVs
	hNDxVsc7l9elRNXqum10HzoUBhorBd5CwyfaY4VRiEwOh//o7SEjJytjYnzKDiZLCdLXG1s8Mew
	QHU2BAqy7zMRAhcc1BcRR49qHoMYGhH2Wtnxf4YE+mC5Xi17civATw9648NO3g4tsAXydIu9dnQ
	R/oMEIknvlNaCIHeSwtdGkkDA3ZaQvnO+9rzD9f2QR4ekeM4NpQ4FnI8oDFNV0umOtbnwJG6NIr
	5gLP9IZi/VrRhUTYpbfAYfqfuJXbckGS41TeizYm5zehjpJ9Zcr2p6
X-Received: by 2002:a17:906:c107:b0:c25:ec7a:a488 with SMTP id a640c23a62f3a-c260c9780b9mr862792266b.1.1788622040355;
        Sat, 05 Sep 2026 08:27:20 -0700 (PDT)
Received: from localhost.localdomain ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm236702166b.34.2026.09.05.08.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:27:19 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <bhe@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	stable@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>,
	Ye Liu <ye.liu@linux.dev>,
	lirongqing <lirongqing@baidu.com>
Subject: [PATCH RESEND] mm/vmalloc: Use dedicated unbound workqueues for vmap drain
Date: Sat,  5 Sep 2026 17:27:17 +0200
Message-ID: <20260905152717.11711-1-urezki@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drain_vmap_area_work() function can take >10ms to complete
when there are many accumulated vmap areas in a system with
high CPU count, causing workqueue watchdog warnings when run
via schedule_work():

  workqueue: drain_vmap_area_work hogged CPU for >10000us

Move the top-level drain work to a dedicated WQ_UNBOUND
workqueue so the scheduler can run this background work
on any available CPU, improving responsiveness. Use the
WQ_MEM_RECLAIM to ensure forward progress under memory
pressure.

Move purge helpers to separate WQ_UNBOUND | WQ_MEM_RECLAIM
workqueue. This allows drain_vmap_work to wait for helpers
completion without creating dependency on the same rescuer
thread and avoid a potential parent/child deadlock.

Simplify purge helper scheduling by removing cpumask-based
iteration to iterating directly over vmap nodes checking
work_queued state.

Cc: stable@vger.kernel.org
Cc: Dev Jain <dev.jain@arm.com>
Cc: Ye Liu <ye.liu@linux.dev>
Cc: lirongqing <lirongqing@baidu.com>
Fixes: 72210662c5a2 ("mm: vmalloc: offload free_vmap_area_lock lock")
Link: https://lore.kernel.org/all/20260319074307.2325-1-lirongqing@baidu.com/
Reviewed-by: Baoquan He <bhe@redhat.com>
Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 79 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 27 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bea9f76ed7e7..89c327a6ce7d 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -972,6 +972,7 @@ static struct vmap_node {
 	struct list_head purge_list;
 	struct work_struct purge_work;
 	unsigned long nr_purged;
+	bool work_queued;
 } single;
 
 /*
@@ -1090,6 +1091,8 @@ static void reclaim_and_purge_vmap_areas(void);
 static BLOCKING_NOTIFIER_HEAD(vmap_notify_list);
 static void drain_vmap_area_work(struct work_struct *work);
 static DECLARE_WORK(drain_vmap_work, drain_vmap_area_work);
+static struct workqueue_struct *drain_vmap_helpers_wq;
+static struct workqueue_struct *drain_vmap_wq;
 
 static __cacheline_aligned_in_smp atomic_long_t vmap_lazy_nr;
 
@@ -2351,6 +2354,16 @@ static void purge_vmap_node(struct work_struct *work)
 	reclaim_list_global(&local_list);
 }
 
+static bool
+schedule_drain_vmap_work(struct workqueue_struct *wq,
+		struct work_struct *work)
+{
+	if (wq)
+		return queue_work(wq, work);
+
+	return false;
+}
+
 /*
  * Purges all lazily-freed vmap areas.
  */
@@ -2358,19 +2371,12 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
 		bool full_pool_decay)
 {
 	unsigned long nr_purged_areas = 0;
+	unsigned int nr_purge_nodes = 0;
 	unsigned int nr_purge_helpers;
-	static cpumask_t purge_nodes;
-	unsigned int nr_purge_nodes;
 	struct vmap_node *vn;
-	int i;
 
 	lockdep_assert_held(&vmap_purge_lock);
 
-	/*
-	 * Use cpumask to mark which node has to be processed.
-	 */
-	purge_nodes = CPU_MASK_NONE;
-
 	for_each_vmap_node(vn) {
 		INIT_LIST_HEAD(&vn->purge_list);
 		vn->skip_populate = full_pool_decay;
@@ -2390,10 +2396,9 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
 		end = max(end, list_last_entry(&vn->purge_list,
 			struct vmap_area, list)->va_end);
 
-		cpumask_set_cpu(node_to_id(vn), &purge_nodes);
+		nr_purge_nodes++;
 	}
 
-	nr_purge_nodes = cpumask_weight(&purge_nodes);
 	if (nr_purge_nodes > 0) {
 		flush_tlb_kernel_range(start, end);
 
@@ -2401,29 +2406,31 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
 		nr_purge_helpers = atomic_long_read(&vmap_lazy_nr) / lazy_max_pages();
 		nr_purge_helpers = clamp(nr_purge_helpers, 1U, nr_purge_nodes) - 1;
 
-		for_each_cpu(i, &purge_nodes) {
-			vn = &vmap_nodes[i];
+		for_each_vmap_node(vn) {
+			vn->work_queued = false;
+
+			if (list_empty(&vn->purge_list))
+				continue;
 
 			if (nr_purge_helpers > 0) {
 				INIT_WORK(&vn->purge_work, purge_vmap_node);
+				vn->work_queued = schedule_drain_vmap_work(
+					READ_ONCE(drain_vmap_helpers_wq), &vn->purge_work);
 
-				if (cpumask_test_cpu(i, cpu_online_mask))
-					schedule_work_on(i, &vn->purge_work);
-				else
-					schedule_work(&vn->purge_work);
-
-				nr_purge_helpers--;
-			} else {
-				vn->purge_work.func = NULL;
-				purge_vmap_node(&vn->purge_work);
-				nr_purged_areas += vn->nr_purged;
+				if (vn->work_queued) {
+					nr_purge_helpers--;
+					continue;
+				}
 			}
-		}
 
-		for_each_cpu(i, &purge_nodes) {
-			vn = &vmap_nodes[i];
+			/* Sync path. Process locally. */
+			purge_vmap_node(&vn->purge_work);
+			nr_purged_areas += vn->nr_purged;
+		}
 
-			if (vn->purge_work.func) {
+		/* Wait for completion if queued any. */
+		for_each_vmap_node(vn) {
+			if (vn->work_queued) {
 				flush_work(&vn->purge_work);
 				nr_purged_areas += vn->nr_purged;
 			}
@@ -2487,7 +2494,8 @@ static void free_vmap_area_noflush(struct vmap_area *va)
 
 	/* After this point, we may free va at any time */
 	if (unlikely(nr_lazy > nr_lazy_max))
-		schedule_work(&drain_vmap_work);
+		schedule_drain_vmap_work(READ_ONCE(drain_vmap_wq),
+			&drain_vmap_work);
 }
 
 /*
@@ -5587,3 +5595,20 @@ void __init vmalloc_init(void)
 	vmap_node_shrinker->scan_objects = vmap_node_shrink_scan;
 	shrinker_register(vmap_node_shrinker);
 }
+
+static int __init vmalloc_init_workqueue(void)
+{
+	struct workqueue_struct *drain_wq, *helpers_wq;
+	unsigned int flags = WQ_UNBOUND | WQ_MEM_RECLAIM;
+
+	drain_wq = alloc_workqueue("vmap_drain", flags, 0);
+	WARN_ON_ONCE(drain_wq == NULL);
+	WRITE_ONCE(drain_vmap_wq, drain_wq);
+
+	helpers_wq = alloc_workqueue("vmap_drain_helpers", flags, 0);
+	WARN_ON_ONCE(helpers_wq == NULL);
+	WRITE_ONCE(drain_vmap_helpers_wq, helpers_wq);
+
+	return 0;
+}
+early_initcall(vmalloc_init_workqueue);
-- 
2.47.3

