Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF0941A57D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870843; cv=none; b=jzg/maMnrMlLz1DirMJBccFZQf5cE7ZXV98cOz0JJK5tjmRkPdbaKeRv9Gam2FwsN5p+2xn/JVPRllz1OwRQqFDCaS1umU0IxD1ScZGuCCGjPT6G33Q1lL2+E2pV9rTjBAtS2iJEUWu5mnAqAMDnxwZ2oxgCKzw5Z7NfLV3O+Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870843; c=relaxed/simple;
	bh=nJ8thWtX0BR62hoBu0k165fv9DNktquCGNZn1jHoWYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VovZZ/Pu8uYy7KW1aIH8mF3nmVu0Us1W4AJNsxNR+g7wVAU/pUJo7L9AEDP5FiYoX7DQaNELQmXNWyt/eg6b+8s98o9Cz+uIt5NPTrmiCtR2JWPveg/bpv/5H69uToxJOjov5qhMX0Ga4tskQ0Oliz52HrQ+cIh0ZZ+oZlAwGdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=sZF/a/Gm; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="sZF/a/Gm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=VkkAeWhMQotf/bduL267u6rKPFOe7GrQo4YVproPxHQ=; b=
	sZF/a/Gmco+AM03+a519Or6eOC1D43q4fCgDdxp6kyUxJMDSSiYtENY5xxCu1G8mTSyXBInc/5GDj
	y0I6JNdSZ/NCVO/2QIAIZkosdElMB69tOMCR71DANR2nsD45GT29pGrPvs+L5dm5RKbQ4SL9YrtGX
	hcddsMU8+4azC0TrwF6Az9saGQSb8s3zBVjkNshyS89IxHsyu67/YMXO+jj2020jDFTtddOScDtvC
	LnV70zr//IfZWLZy2qizEtvzH7N3k7jxTx/fmv6/3INasxsJyL4A3D+UOew3XYbXTemh8rXk6r8FF
	JfkUIE8+oR/NHtY7wdv1ZOsiN/iXuXHh7Q==;
Received: from [81.79.79.1] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xCJJV-00ABvw-QP; Thu, 01 Oct 2026 18:07:17 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Chia-I Wu <olv@google.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Steven Price <steven.price@arm.com>,
	Tejun Heo <tj@kernel.org>
Subject: [RFC v6 3/3] drm/panthor: Create per queue priority workqueues
Date: Thu,  1 Oct 2026 17:07:11 +0100
Message-ID: <20261001160711.59888-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001160711.59888-1-tvrtko.ursulin@igalia.com>
References: <20261001160711.59888-1-tvrtko.ursulin@igalia.com>
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
index 5b34032deff8..257895e5e48b 100644
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
+	sched->submit_wq[PANTHOR_CSG_PRIORITY_RT] = alloc_workqueue("panthor-drm-rt", WQ_RT | WQ_MEM_RECLAIM | WQ_UNBOUND, 2);
+	if (!sched->wq || !sched->heap_alloc_wq ||
+	    !sched->submit_wq[PANTHOR_CSG_PRIORITY_MEDIUM] ||
+	    !sched->submit_wq[PANTHOR_CSG_PRIORITY_HIGH] ||
+	    !sched->submit_wq[PANTHOR_CSG_PRIORITY_RT]) {
 		panthor_sched_fini(&ptdev->base, sched);
 		drm_err(&ptdev->base, "Failed to allocate the workqueues");
 		return -ENOMEM;
-- 
2.55.0

