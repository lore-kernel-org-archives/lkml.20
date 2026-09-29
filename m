Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4C14DAFBA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672125; cv=none; b=hFbr/wrCtG/vkRgDrSdH4lGla0W4qpC4Zf6UcfmfCRWoLPl+XOJ5DvXRV6KCG+3jUhpXAA+CSdtNvXhHnSyRVyyhEgQF5Z0Tnb8n0gF3OOrogVofIrFSSDOkzi5OhogesnVjif3K9Xg5n9+PlMrN3i6fb7eYXSTcmXCV/1oGIaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672125; c=relaxed/simple;
	bh=fkGyrHQfjnQa8m2PVu6UAl5ngC+b9Y/m2h2YKsvoMVk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=b65GNfnzbzkWh07GtDpwNuG533BIbYdwKAGgGUoQMauKp96BKqoqM6PUQML9EjKhuT2vC2eI2mFOnwZ6ndpuGzQugTQp20yA1RyCptr7kgYLzUFiaIpYJUwSR0lelfhGFhQNfk+PSWo2BGeFqKTMJ3fuJ9E7vY+ZJ2nwmB+gZ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Zdz8fxvG; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Zdz8fxvG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=A49TiMB6f/APMxxtc1WbkmNkvhpO/yBDcNjhxpQwAnY=; b=Zdz8fxvG6MkQAq0BV6ZDJNCJBO
	m/0PVjArDmiMhfn+BZVDCnN0a+a+5g1tGzYLYQ37WP02hBYQpaCy1AygVAKWv0q2ns1BVvEJSY+BA
	vkJAuFugEF356mjNb4zzgFa2v98PXDv0qd65BHljFOjAH6AvlU7+JWkI3m7NrHWjkY59tpGkujrVv
	t+K4g40VM4FEvjTkkY9abfHJLwES4h6ZRkHBDTkBhek80MyJz/IcafybobFRa1wFhrTTg1YsOUE1N
	ZT/QuIJmt1HfIeiKMxALjwgyTUhIp760pxJaRJ9mGGNFvxl1B1bkMAsO+zyyubw83GPjEn3cwFEhJ
	vPsKgtuw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBTcF-00000002O1v-42CP;
	Tue, 29 Sep 2026 08:55:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id A9838300BDE; Tue, 29 Sep 2026 10:55:10 +0200 (CEST)
Message-ID: <20260929085319.981147568@infradead.org>
User-Agent: quilt/0.68
Date: Tue, 29 Sep 2026 10:49:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 tj@kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] sched: Rename/clarify sched_class::task_tick(.queued) argument
References: <20260929084923.092062266@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

For some reason the sched_class::task_tick() argument that indicates it being
an hrtick, is called @queued. I'm sure naming is hard and all, but lets fix
this.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/deadline.c |    4 ++--
 kernel/sched/ext/ext.c  |    2 +-
 kernel/sched/fair.c     |   12 ++++++------
 kernel/sched/idle.c     |    2 +-
 kernel/sched/rt.c       |    2 +-
 kernel/sched/sched.h    |    2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2879,7 +2879,7 @@ static void put_prev_task_dl(struct rq *
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_dl(struct rq *rq, struct task_struct *p, int queued)
+static void task_tick_dl(struct rq *rq, struct task_struct *p, int hrtick)
 {
 	update_curr_dl(rq);
 
@@ -2889,7 +2889,7 @@ static void task_tick_dl(struct rq *rq,
 	 * not being the leftmost task anymore. In that case NEED_RESCHED will
 	 * be set and schedule() will start a new hrtick for the next task.
 	 */
-	if (hrtick_enabled_dl(rq) && queued && p->dl.runtime > 0 &&
+	if (hrtick_enabled_dl(rq) && hrtick && p->dl.runtime > 0 &&
 	    is_leftmost(&p->dl, &rq->dl))
 		start_hrtick_dl(rq, &p->dl);
 }
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -3809,7 +3809,7 @@ void scx_tick(struct rq *rq)
 	update_other_load_avgs(rq);
 }
 
-static void task_tick_scx(struct rq *rq, struct task_struct *curr, int queued)
+static void task_tick_scx(struct rq *rq, struct task_struct *curr, int hrtick)
 {
 	struct scx_sched *sch = scx_task_sched(curr);
 
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6772,7 +6772,7 @@ static void put_prev_entity(struct cfs_r
 }
 
 static void
-entity_tick(struct cfs_rq *cfs_rq, struct sched_entity *curr, int queued)
+entity_tick(struct cfs_rq *cfs_rq, struct sched_entity *curr, int hrtick)
 {
 	/*
 	 * Update run-time statistics of the 'current'.
@@ -6787,10 +6787,10 @@ entity_tick(struct cfs_rq *cfs_rq, struc
 
 #ifdef CONFIG_SCHED_HRTICK
 	/*
-	 * queued ticks are scheduled to match the slice, so don't bother
+	 * hrticks are scheduled to match the slice, so don't bother
 	 * validating it and just reschedule.
 	 */
-	if (queued) {
+	if (hrtick) {
 		resched_curr(rq_of(cfs_rq));
 		return;
 	}
@@ -15309,7 +15309,7 @@ static inline void task_tick_core(struct
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
+static void task_tick_fair(struct rq *rq, struct task_struct *curr, int hrtick)
 {
 	struct sched_entity *se = &curr->se;
 
@@ -15319,7 +15319,7 @@ static void task_tick_fair(struct rq *rq
 
 		for_each_sched_entity(se) {
 			cfs_rq = cfs_rq_of(se);
-			entity_tick(cfs_rq, se, queued);
+			entity_tick(cfs_rq, se, hrtick);
 
 			weight = __calc_prop_weight(cfs_rq, se, weight);
 		}
@@ -15328,7 +15328,7 @@ static void task_tick_fair(struct rq *rq
 		reweight_eevdf(cfs_rq, se, weight, se->on_rq);
 	}
 
-	if (queued)
+	if (hrtick)
 		return;
 
 	if (static_branch_unlikely(&sched_numa_balancing))
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -538,7 +538,7 @@ dequeue_task_idle(struct rq *rq, struct
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_idle(struct rq *rq, struct task_struct *curr, int queued)
+static void task_tick_idle(struct rq *rq, struct task_struct *curr, int hrtick)
 {
 	update_curr_idle(rq);
 }
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2541,7 +2541,7 @@ static inline void watchdog(struct rq *r
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_rt(struct rq *rq, struct task_struct *p, int queued)
+static void task_tick_rt(struct rq *rq, struct task_struct *p, int hrtick)
 {
 	struct sched_rt_entity *rt_se = &p->rt;
 
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2737,7 +2737,7 @@ struct sched_class {
 	 * sched_tick: rq->lock
 	 * sched_tick_remote: rq->lock
 	 */
-	void (*task_tick)(struct rq *rq, struct task_struct *p, int queued);
+	void (*task_tick)(struct rq *rq, struct task_struct *p, int hrtick);
 	/*
 	 * sched_cgroup_fork: p->pi_lock
 	 */


