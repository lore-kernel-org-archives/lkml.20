Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322B038F630
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179983; cv=none; b=RmGoIYSYnCk9Rp52APOmY8cIxbNj66uLD/Fu+P39TjDXhygakFoJ1xTERdN+YS6tQ/eUVdF+0E0agv/KDKr6Ny6YIx5cLKilbNA2bbEW4ZD4X432lIvlLlJm6JTySBUNRtlPBvsIy1RkMcyo11HPt088WUnT81iLs9LmSAxUFY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179983; c=relaxed/simple;
	bh=MIroo+oWA41krNykMcWeeH2okdAemzXl5AQpxiZX6u4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZ846oTQB9CWh8Le7vY4Z+31wha3w24lEujqPU81kr92VaZgoFgSKpWTkxNU0QdeYnJOF8FxUYHqyCZZSL6EFR09ImMiO9wBYoDPc7r6QGDgwaz97HvnzHit8wTetcxUqzumKauClhK4Uir46EC7zweVK/AcdvNADrJiLiqHFqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=a4IA+8r1; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="a4IA+8r1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=ASsJvhG8AELMQ5KQkM/mNhuNT0ZTjSHv2ZrjZjXvQHU=; b=
	a4IA+8r1G3AZXW/0m9pNceRstLs+LvkVvDoIByxik6O5Moc5Awnfbr1o/wijDKPH4kiXz5M1A78zX
	caBcvcPeRxcsDThe8EQbcNe4VXSFTpXnhiUkJ7JuUbEXyn4f+Y32AHsCK1IjeaavT/bYGccJrW3gW
	zynYuqDLLoNS3/fWv8V239VtsyZU1SHwCLduGCZ/V/Eg2oMdbAPcgSzIqV1QUGiQYyBLMG2XvDy2Z
	opEj14lnBf9GpbsDz1nk4xdEjn71b2n2MCI75JILoB4ANJjj7LLKhMgwpOV0ALxcWluvJI5153CeA
	3e1t6zAlL7Tif3lORdHaVv9bP1nyFCk+HQ==;
Received: from [81.79.79.1] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x9Pab-006ECW-48; Wed, 23 Sep 2026 18:12:56 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-dev@igalia.com,
	dri-devel@lists.freedesktop.org,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Chia-I Wu <olv@google.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Steven Price <steven.price@arm.com>,
	Tejun Heo <tj@kernel.org>
Subject: [RFC v5 3/3] drm/panthor: Create per queue priority workqueues
Date: Wed, 23 Sep 2026 17:12:51 +0100
Message-ID: <20260923161251.45428-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923161251.45428-1-tvrtko.ursulin@igalia.com>
References: <20260923161251.45428-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split the single workqueue shared between the driver internal logic and
DRM scheduler use into separate ones, where the DRM scheduler one is
created per GPU priority level using the appropriate mapping to
workqueue priorities.

Low and medium GPU priority are served by a normal workqueue,
high is server by a WQ_HIGHPRI instance, while realtime GPU priority is
using the newly added WQ_RTPRI flag for lowest possible latency.

These workqueues are device global and for all three we set the maximum
concurrency to two in order to keep the GPU optimally fed with work.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Chia-I Wu <olv@google.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Tejun Heo <tj@kernel.org>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 37 ++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 5b34032deff8..de32ad68230c 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -152,11 +152,18 @@ struct panthor_scheduler {
 	 *
 	 * Used for the scheduler tick, group update or other kind of FW
 	 * event processing that can't be handled in the threaded interrupt
-	 * path. Also passed to the drm_gpu_scheduler instances embedded
-	 * in panthor_queue.
+	 * path.
 	 */
 	struct workqueue_struct *wq;
 
+	/**
+	 * @submit_wq: Per priority workqueues for the DRM scheduler
+	 *
+	 * Passed to the drm_gpu_scheduler instances embedded
+	 * in panthor_queue based on the queue priority.
+	 */
+	struct workqueue_struct *submit_wq[PANTHOR_CSG_PRIORITY_COUNT];
+
 	/**
 	 * @heap_alloc_wq: Workqueue used to schedule tiler_oom works.
 	 *
@@ -3582,8 +3589,14 @@ group_create_queue(struct panthor_group *group,
 		goto err_free_queue;
 	}
 
+	if (group->priority >= ARRAY_SIZE(group->ptdev->scheduler->submit_wq) ||
+	    !group->ptdev->scheduler->submit_wq[group->priority]) {
+		ret = -EINVAL;
+		goto err_free_queue;
+	}
+
 	sched_args.name = queue->name;
-
+	sched_args.submit_wq = group->ptdev->scheduler->submit_wq[group->priority];
 	ret = drm_sched_init(&queue->scheduler, &sched_args);
 	if (ret)
 		goto err_free_queue;
@@ -4073,6 +4086,15 @@ static void panthor_sched_fini(struct drm_device *ddev, void *res)
 	if (!sched || !sched->csg_slot_count)
 		return;
 
+	if (sched->submit_wq[PANTHOR_CSG_PRIORITY_MEDIUM])
+		destroy_workqueue(sched->submit_wq[PANTHOR_CSG_PRIORITY_MEDIUM]);
+
+	if (sched->submit_wq[PANTHOR_CSG_PRIORITY_HIGH])
+		destroy_workqueue(sched->submit_wq[PANTHOR_CSG_PRIORITY_HIGH]);
+
+	if (sched->submit_wq[PANTHOR_CSG_PRIORITY_RT])
+		destroy_workqueue(sched->submit_wq[PANTHOR_CSG_PRIORITY_RT]);
+
 	if (sched->wq)
 		destroy_workqueue(sched->wq);
 
@@ -4174,7 +4196,14 @@ int panthor_sched_init(struct panthor_device *ptdev)
 	 */
 	sched->heap_alloc_wq = alloc_workqueue("panthor-heap-alloc", WQ_UNBOUND, 0);
 	sched->wq = alloc_workqueue("panthor-csf-sched", WQ_MEM_RECLAIM | WQ_UNBOUND, 0);
-	if (!sched->wq || !sched->heap_alloc_wq) {
+	sched->submit_wq[PANTHOR_CSG_PRIORITY_MEDIUM] = alloc_workqueue("panthor-drm", WQ_MEM_RECLAIM | WQ_UNBOUND, 2);
+	sched->submit_wq[PANTHOR_CSG_PRIORITY_LOW] = sched->submit_wq[PANTHOR_CSG_PRIORITY_MEDIUM];
+	sched->submit_wq[PANTHOR_CSG_PRIORITY_HIGH] = alloc_workqueue("panthor-drm-high", WQ_HIGHPRI | WQ_MEM_RECLAIM | WQ_UNBOUND, 2);
+	sched->submit_wq[PANTHOR_CSG_PRIORITY_RT] = alloc_workqueue("panthor-drm-rt", WQ_RTPRI | WQ_MEM_RECLAIM | WQ_UNBOUND, 2);
+	if (!sched->wq || !sched->heap_alloc_wq ||
+	    !sched->submit_wq[PANTHOR_CSG_PRIORITY_MEDIUM] ||
+	    !sched->submit_wq[PANTHOR_CSG_PRIORITY_HIGH] ||
+	    !sched->submit_wq[PANTHOR_CSG_PRIORITY_RT]) {
 		panthor_sched_fini(&ptdev->base, sched);
 		drm_err(&ptdev->base, "Failed to allocate the workqueues");
 		return -ENOMEM;
-- 
2.55.0

