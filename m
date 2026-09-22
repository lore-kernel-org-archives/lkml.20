Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32781388E6F;
	Tue, 22 Sep 2026 14:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088922; cv=none; b=Olp/DHhvk5Uh5R6gzZnPMelLokfhPJn8TSWTKn8evyqeVyPlYLVcsz8hFRKfXMV1QdJSYikO1TvO29n7hmwSWA9phDo2o4fLxWfyOfyr6yKIdmd6qQUbQxycVB+BNGlbCVIOhz+f1FnpD2vLOkLBMzB22hbNpYNjjf6+1tPfYz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088922; c=relaxed/simple;
	bh=fWh68O1VVT5hX4kN1vo8CuAlKyBjytQkL5UJjhZ0vk4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mBAO/sRRMORzUvlmjJXRBXwhcUKAf8mrFCeuUGiF/PgZGcqDEeGwKrLCg59+c2BujnoeledHAZTr4xDKpezn4WbAYJXl6mZpN+MqJ9mk/+WfqEdJjSuC+U7VteVtt/vpt1MRagX3VmW1JjDNPsJ3RBX3T+JM2Lt7wInM2MRr0IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jc58LaCq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jc58LaCq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA201F000FF;
	Tue, 22 Sep 2026 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790088920;
	bh=btsAOjmvEG3UfY/0+Dti8pyBnrPe0Fbr1sdzHKjTxq4=;
	h=From:To:Cc:Subject:Date;
	b=jc58LaCq7r7ygQXeWHpde/AFMkBFU2GtjMxgvNwS8dv9KoeI0J2lA4lHHadEkl7wu
	 GVtXLfyxtANTFZ42lIzXEe9YktYWrP2MjYtBewLpq5uwy2dhcTddxStRcq0TsFwq7y
	 OQgoBhqrDSvpNaOP1CkS4Jis96nfh8fS3dje8qSco1vp8rq+n8zxlObIcpEs7Hk0qh
	 EDr5wvhKSGVAFEcE36TZXWJpAhqGWUM8/unhcMr2rr0n59ZmcJlXdF4cxCW1Y8bCIp
	 +pzO9r4PJJZIvOJhMU2ukFBN+0JLKDVk19JK3SACYcWvfzTajlqq+CFT49InPSX84Q
	 fOq2y4mU1xDeQ==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v4] drm/sched: Protect entity->last_scheduled with spinlock
Date: Tue, 22 Sep 2026 16:54:42 +0200
Message-ID: <20260922145441.619097-2-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The entity->last_scheduled field has always been set and read with
special RCU functions in addition to memory barriers.

This was added in

commit 70102d77ff22 ("drm/scheduler: add drm_sched_entity_error and use rcu for last_scheduled")

however, no proper justification for that mechanism was provided. There
seems to be no obvious reason, since the entity lock is available and
taken at all places that evaluate the last_scheduled field. The only
exception is drm_sched_entity_error(), which is not performance critical
in any way.

Improve robustness, readability and maintainability by replacing RCU and
barriers with the lock.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 51 ++++++++++--------------
 include/drm/gpu_scheduler.h              | 10 ++---
 2 files changed, 24 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index e4069fcb0272..7be0387bac3c 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -136,7 +136,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			      DRM_SCHED_PRIORITY_KERNEL : priority;
 	entity->num_sched_list = num_sched_list;
 	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
-	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
 	if (!sched_list[0]->sched_rq) {
@@ -233,10 +232,10 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
 	struct dma_fence *fence;
 	int r;
 
-	rcu_read_lock();
-	fence = rcu_dereference(entity->last_scheduled);
+	spin_lock(&entity->lock);
+	fence = entity->last_scheduled;
 	r = fence ? fence->error : 0;
-	rcu_read_unlock();
+	spin_unlock(&entity->lock);
 
 	return r;
 }
@@ -319,9 +318,9 @@ void drm_sched_entity_kill(struct drm_sched_entity *entity)
 	/* Make sure this entity is not used by the scheduler at the moment */
 	wait_for_completion(&entity->entity_idle);
 
-	/* The entity is guaranteed to not be used by the scheduler */
-	prev = rcu_dereference_check(entity->last_scheduled, true);
-	dma_fence_get(prev);
+	spin_lock(&entity->lock);
+	prev = dma_fence_get(entity->last_scheduled);
+	spin_unlock(&entity->lock);
 	while ((job = drm_sched_entity_queue_pop(entity))) {
 		struct drm_sched_fence *s_fence = job->s_fence;
 
@@ -413,8 +412,7 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
 		entity->dependency = NULL;
 	}
 
-	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
-	RCU_INIT_POINTER(entity->last_scheduled, NULL);
+	dma_fence_put(entity->last_scheduled);
 	drm_sched_entity_stats_put(entity->stats);
 }
 EXPORT_SYMBOL(drm_sched_entity_fini);
@@ -536,6 +534,10 @@ drm_sched_job_dependency(struct drm_sched_job *job,
 
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 {
+	/* Helper to avoid dropping the reference while the entity lock is held,
+	 * just to have some more robustness.
+	 */
+	struct dma_fence *prev_last_scheduled;
 	struct drm_sched_job *sched_job;
 
 	sched_job = drm_sched_entity_queue_peek(entity);
@@ -552,22 +554,15 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	if (entity->guilty && atomic_read(entity->guilty))
 		dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
 
-	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
-	rcu_assign_pointer(entity->last_scheduled,
-			   dma_fence_get(&sched_job->s_fence->finished));
-
-	/*
-	 * If the queue is empty we allow drm_sched_entity_select_rq() to
-	 * locklessly access ->last_scheduled. This only works if we set the
-	 * pointer before we dequeue and if we a write barrier here.
-	 */
-	smp_wmb();
-
 	spin_lock(&entity->lock);
+	prev_last_scheduled = entity->last_scheduled;
+	entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
 	spsc_queue_pop(&entity->job_queue);
 	drm_sched_rq_pop_entity(entity);
 	spin_unlock(&entity->lock);
 
+	dma_fence_put(prev_last_scheduled);
+
 	/* Jobs and entities might have different lifecycles. Since we're
 	 * removing the job from the entities queue, set the jobs entity pointer
 	 * to NULL to prevent any future access of the entity through this job.
@@ -591,21 +586,15 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 	if (spsc_queue_count(&entity->job_queue))
 		return;
 
-	/*
-	 * Only when the queue is empty are we guaranteed that
-	 * drm_sched_run_job_work() cannot change entity->last_scheduled. To
-	 * enforce ordering we need a read barrier here. See
-	 * drm_sched_entity_pop_job() for the other side.
-	 */
-	smp_rmb();
-
-	fence = rcu_dereference_check(entity->last_scheduled, true);
+	spin_lock(&entity->lock);
+	fence = entity->last_scheduled;
 
 	/* stay on the same engine if the previous job hasn't finished */
-	if (fence && !dma_fence_is_signaled(fence))
+	if (fence && !dma_fence_is_signaled(fence)) {
+		spin_unlock(&entity->lock);
 		return;
+	}
 
-	spin_lock(&entity->lock);
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
 	rq = sched ? sched->sched_rq[entity->rq_priority] : NULL;
 	if (rq != entity->rq) {
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 7a64cc11de08..563d7fb88a6d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -100,8 +100,8 @@ struct drm_sched_entity {
 	 * @lock:
 	 *
 	 * Lock protecting the run-queue (@rq) to which this entity belongs,
-	 * @priority, the list of schedulers (@sched_list, @num_sched_list) and
-	 * the @rr_ts field.
+	 * @priority, @last_scheduled and the list of schedulers (@sched_list,
+	 * @num_sched_list) and @rr_ts.
 	 */
 	spinlock_t			lock;
 
@@ -215,11 +215,9 @@ struct drm_sched_entity {
 	/**
 	 * @last_scheduled:
 	 *
-	 * Points to the finished fence of the last scheduled job. Only written
-	 * by drm_sched_entity_pop_job(). Can be accessed locklessly from
-	 * drm_sched_job_arm() if the queue is empty.
+	 * Points to the finished fence of the last scheduled job.
 	 */
-	struct dma_fence __rcu		*last_scheduled;
+	struct dma_fence		*last_scheduled;
 
 	/**
 	 * @last_user: last group leader pushing a job into the entity.

base-commit: bc3f07516a99280d5c5a34b358ee92a30a653cca
-- 
2.55.0

