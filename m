Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75543E2AB6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787903818; cv=none; b=pqak1OnVwh1pakR7M64epimGnP8J65cHXwKlyC2VZYLcSa+9ByIs5gNUYHqZWeuamFa7TVMx3W/Xhw8gDGlQVloj6e7JyVnUbkPiuX0dqqi7iDltGOTKblRYWWDaAj++lVmm8k/2RV66sro3FArC35xI9GZp+sGTmHqCk+v2mio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787903818; c=relaxed/simple;
	bh=ro634XVMhtw9WYQC2xn1URYgTBufOhqDk9NHwyb7fzE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=ENb4wKo5uId+IkWqSQAENSxg2MGO0q6eIAZoe2jupSFC2TxUDKt+stAy9ExDEhauPdP+6on8wq2chT7qmVvurKe+7VVC6Y2d7sFfXuMJDwqZCz/ahIpN2HcA8s0TTX75Dthj70BEOm3L+UGnHGqkIlAS8bmJmO6tAzCBs181bAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=U2QcOiW1; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="U2QcOiW1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=zsXQHZ11n0M3yUj8f8e+hKw2WpdtXgIQ8/yIqhe1w/A=; b=U2QcOiW14oY1O5rqO4aQ1onuXS
	SzXS0P5/gknvm6KlHtP3nCHYMZ+5U3Ns8mOyCjWKrXzcCq9GRrx7vPKlhbVSSay24ldsl+J6tLcDE
	XmvpbNGz4oo0Ms7YBCcyO/32vj7l3fmP9orjRdjuAHjZ7nA2br3U+vTWEEQOyJbvFi3jh3fiFfm+K
	1qJqhFlp8yno+oQGe81uJIRfi2mxvroN50ZJuuC9P3ps9FT2JTOHT/vPNfMckSK7LVBvRucdeET0o
	RGBCJexeitQGzIIRuaEK11dHvJYb6w+V/SPRM1o4EH9z4AbvrNPhgZarZFWcFWFvaWvMP0RWdyjso
	e3VUBQug==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wzrS1-000000086Qz-3CVA;
	Fri, 28 Aug 2026 07:56:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 3E6963006FA; Fri, 28 Aug 2026 09:56:36 +0200 (CEST)
Message-ID: <20260828075558.320346065@infradead.org>
User-Agent: quilt/0.68
Date: Fri, 28 Aug 2026 09:41:00 +0200
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
Subject: [PATCH 1/4] sched: Rename/clarify sched_class::task_tick(.queued) argument
References: <20260828074059.232353141@infradead.org>
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
@@ -2876,7 +2876,7 @@ static void put_prev_task_dl(struct rq *
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_dl(struct rq *rq, struct task_struct *p, int queued)
+static void task_tick_dl(struct rq *rq, struct task_struct *p, int hrtick)
 {
 	update_curr_dl(rq);
 
@@ -2886,7 +2886,7 @@ static void task_tick_dl(struct rq *rq,
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
@@ -3787,7 +3787,7 @@ void scx_tick(struct rq *rq)
 	update_other_load_avgs(rq);
 }
 
-static void task_tick_scx(struct rq *rq, struct task_struct *curr, int queued)
+static void task_tick_scx(struct rq *rq, struct task_struct *curr, int hrtick)
 {
 	struct scx_sched *sch = scx_task_sched(curr);
 
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6542,7 +6542,7 @@ static void put_prev_entity(struct cfs_r
 }
 
 static void
-entity_tick(struct cfs_rq *cfs_rq, struct sched_entity *curr, int queued)
+entity_tick(struct cfs_rq *cfs_rq, struct sched_entity *curr, int hrtick)
 {
 	/*
 	 * Update run-time statistics of the 'current'.
@@ -6557,10 +6557,10 @@ entity_tick(struct cfs_rq *cfs_rq, struc
 
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
@@ -15020,7 +15020,7 @@ static inline void task_tick_core(struct
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
+static void task_tick_fair(struct rq *rq, struct task_struct *curr, int hrtick)
 {
 	struct sched_entity *se = &curr->se;
 
@@ -15030,7 +15030,7 @@ static void task_tick_fair(struct rq *rq
 
 		for_each_sched_entity(se) {
 			cfs_rq = cfs_rq_of(se);
-			entity_tick(cfs_rq, se, queued);
+			entity_tick(cfs_rq, se, hrtick);
 
 			weight = __calc_prop_weight(cfs_rq, se, weight);
 		}
@@ -15039,7 +15039,7 @@ static void task_tick_fair(struct rq *rq
 		reweight_eevdf(cfs_rq, se, weight, se->on_rq);
 	}
 
-	if (queued)
+	if (hrtick)
 		return;
 
 	if (static_branch_unlikely(&sched_numa_balancing))
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -535,7 +535,7 @@ dequeue_task_idle(struct rq *rq, struct
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
@@ -2538,7 +2538,7 @@ static inline void watchdog(struct rq *r
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_rt(struct rq *rq, struct task_struct *p, int queued)
+static void task_tick_rt(struct rq *rq, struct task_struct *p, int hrtick)
 {
 	struct sched_rt_entity *rt_se = &p->rt;
 
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2718,7 +2718,7 @@ struct sched_class {
 	 * sched_tick: rq->lock
 	 * sched_tick_remote: rq->lock
 	 */
-	void (*task_tick)(struct rq *rq, struct task_struct *p, int queued);
+	void (*task_tick)(struct rq *rq, struct task_struct *p, int hrtick);
 	/*
 	 * sched_cgroup_fork: p->pi_lock
 	 */


