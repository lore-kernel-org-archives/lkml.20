Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661942;
	b=KEDapReDBumW70I0uIUa7y0tmtbx1g44A41b+mqQ7U0MQx+Ao3AnqWHys1rJZPmmGpzx
	 G9j5zyUUCukbWtZfIm+EKQC/mXz5PFZkOXeR1ydHgwLklbgL2IMSoayHKlDMdwj5xk9/b
	 yVHelb1w8aa447gXkavVpYMMEEdZrU/ci7va9kM6wosUWQP3OA3eCaAVQDDtRPJr3yxgf
	 YJDamvncK03ImdSoPWWlWxw1lNv2SCphaoX1GOVGzrnn/CaRe1hF+kJkh3ZXfeSmZINE+
	 frYmIEq8HpbDIxlyINupwTO8P2okCO3o8dCWt3SQ6idhAitfVtMR+zD/29gqXRRmiIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661942;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d/esycuTb9nfJgABmuNcc5M22++wxUVlqxX/q/QqJUE=;
	b=fApmiID+RyQIMDH2CuTYJbgunwQeu5f9JtpKf4M4tC7VJxa5cHmy2FOYTJUjsr1XXnUb
	 KVOLPqnxerXl2px/PbSn2gNWyc0rKGFfruXaOKaIQKOnG5slRWUaISY73AEZ1I/jQy+Fs
	 FKuWBLWopGDqMeVxQ7KHpe2vuCE+yC6SlfYymynXFg5sILZ8OFWeU7tZUnzEjqCR91VRy
	 5/AArYUirWNYQg+mESXNvC13nK8wF9zAq/Qux2RVbEhFGq16RgUehI1BCEA3zLhxz8UxH
	 rnTYwlFINRv7i6L29gfIRuvLjeehPBQ0g7lZxp0AkuziGFAF5KrET7JZe+Hnz/tZ3yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=i3iEehNH;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE924606A328
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE924606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=i3iEehNH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=d/esycuTb9nfJgABmuNcc5M22++wxUVlqxX/q/QqJUE=; b=
	i3iEehNH+Ev9jFhoCSTTS9zlu2nHb8rrximAqBTq4jga8NdQPV21sWgijSKxPoVtmftCQ6VoBksmA
	v/M0Ah1x2+LhqmSlrSkgfgQNn1S+UY9T9m/zTX8hZHyVD1aB34gAWGYkp2nh8jKPAske9e2v/hvCn
	ezX/AlargJofR9htYM3jLTAttDoznjd6ooD4ajcHOP86L8iVsQKXUoJneU9NoU24h0cLlvgKHXoMo
	1ZobIVbzp1Z7kmZRYOJUvMQXZKJQWo0JztvUhUwVbIWCBPCTNwW0UkVNbJyeD0tG7JkTaODszTVmO
	qzOr2tm1K9i2BZsGS5vy7DK0iLzjWBiHYA==;
Received: from [81.79.79.1] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xJpG9-006ers-5z; Thu, 22 Oct 2026 11:38:53 +0200
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
Subject: [PATCH v7 4/4] drm/panthor: Create per queue priority workqueues
Date: Thu, 22 Oct 2026 10:38:48 +0100
Message-ID: <20261022093848.5727-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022093848.5727-1-tvrtko.ursulin@igalia.com>
References: <20261022093848.5727-1-tvrtko.ursulin@igalia.com>
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
2.56.0

