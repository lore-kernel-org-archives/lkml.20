Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785959;
	b=HPgDDFaYapy/rp+TQ+hihHFZ+knfCphEr7agsZ3edetWKZexZC0/gB9lwKTpoab8v24t
	 AWciCKJ/JaRKsRuPCTNb9yriWGzDQgtzLBJlF+i+gjmBYehklDeRuZIUxpuRIMKwoo2s8
	 /njgJuD4MruiyR38wc1FHhffj+bQXNWNvj42pgvOWrKHJhC6iyJnDfgGSB+Su0R+EyDZW
	 64xenaZLYPmkynUBFlYXxWZdpa8ntq/BkxHJRXQZ5n5V4b6cXkxTkOkh7o1qmi+0gHfKD
	 Qba6qhjpMOOlI5dCC53+Rc3I/ulvmnRpFAs0d5C8pUVJSqUKqVzl6Rysm4qZiy64zBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785959;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tTkkH+50dWZUwY3TSxmWptcoX8N+xo55pLRLGQOZv2A=;
	b=ADHkmEvOZx632k4yYhTblo+z/UCRgI9CzDxgQ3IMR6zWu6YSjbr729fdO/NprtfPH8PU
	 qcsJ9G+969Q5DohDKFsQzDqKs2KmN9OUnDeQe5+2F4bXKW8/xPSF5ZzT9e/AT1T4EV/cA
	 8XmwFeRGHNoyA2lB6q98ofb53Gl/nEhvyvEitocuVQTYyBR8H700Pv92bUf2hpK0WqQ+M
	 0gqCtOlDOTV2axm0RktxNxp9vW75KJwoirNcExUXtJ0FNhEJCp6hjRCqx0VVqm/yFk1lu
	 3LiQxHe62vP+cPn2e1ts9GkUg3tqZ4qN+YSbT879UTfTUvjtBOFCs4wv3FmeNww0nUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=in4v05Eg;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47A1606D805
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D47A1606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=in4v05Eg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=tTkkH+50dWZUwY3TSxmWptcoX8N+xo55pLRLGQOZv2A=;
	t=1793785958; x=2109145958; b=in4v05EgxAZBIZ27xC5YEY252WByb+uskFs18/7EZKg0Y8Q
	4MlVOUlHdMXABgd+mTKrSG21hc6a2usSXGipE//OiZ26XWGjrQf8lGoAf4DVSyuzvEi7vDWXSK3Y6
	gzA0syM6I2gl1qr5MAt5U1I0rZc32TPU2sKfz74q4TVUBGj2SgYZ+NgNXBrq1qSEmvpZ6Jirt/NKn
	diPubo06LbTXNbWZF6MeLKDvAumc7rdtoglWCzEhcoBlnm1kQqXL25Bx6+ZZjk0pR1lpTZ/Cj8SqT
	0JyUMzDE1iEz13+/2j+SCP+9m8bvIHHJLVOX8i4SmWnJ8AKR8RcC9nw3H3G9QqQg==;
Received: from [81.79.79.1] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xOXfY-00285J-AJ; Wed, 04 Nov 2026 10:52:36 +0100
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
Subject: [PATCH v8 6/6] drm/panthor: Create per queue priority workqueues
Date: Wed,  4 Nov 2026 09:52:25 +0000
Message-ID: <20261104095225.32654-7-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104095225.32654-1-tvrtko.ursulin@igalia.com>
References: <20261104095225.32654-1-tvrtko.ursulin@igalia.com>
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
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 37 ++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a343c5180e01..cbff37e5e1d1 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -153,11 +153,18 @@ struct panthor_scheduler {
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
@@ -3572,8 +3579,14 @@ group_create_queue(struct panthor_group *group,
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
@@ -4070,6 +4083,15 @@ static void panthor_sched_fini(struct drm_device *ddev, void *res)
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
 
@@ -4172,7 +4194,14 @@ int panthor_sched_init(struct panthor_device *ptdev)
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

