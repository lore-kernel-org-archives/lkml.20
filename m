Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901BF51A744
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788864266; cv=none; b=Bvqm18NjkAJRtXptAOIh/oEqcQ+lixOKroBErdy7dl4kN39XmviNcsxkXwIhB0vTr9xiObE5KiC1xEsTiUyItyBTjzhTWXfZ36ZY7L08vHIOU2Ku3E1VeUUUcEaBW2oVaqpqVnKSJvpYYfZ8JA27WSvQKthHkzD9M/vYf2ONUN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788864266; c=relaxed/simple;
	bh=9xak/eEUs5NQol4R3nW0/ngnYX9/NQlme548Y45UfuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvkCQX0/CsetNj2wwOm3xO7yfpD2vfY6tMfwCL7sYNXUZ7d/YXzRB1kksoupeYg05AeurOrobVtbycS8asL3IWzENqXllvogU1Uo5LDZLmO4d3NAy8k6SiPPbtal0NkAJ1UXKoi1qIrpPwm6iOP3nMTDUPqH5QK3jSNAQiqH8OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tWMm2vLC; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tWMm2vLC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lLdOHzlOUuMAE6/mCdT7tOsAWTvVhmgud7DfTS9Cvqo=; b=tWMm2vLCVou4VKAjXK0Mqy3Dpv
	NIDljMDy6fImnhrTBmuvACbQT8sbAu7MZV5FErEkWZwQK4eIylgvjtxrjyKGU/uqusUcEUhBM422c
	be4oBRR3cY5NavJYfhQsEnKPcF3v5Fc9mJOL0yhBOtenKWob9Z6xEvn0wJB3QqCsi0LMXX+vtcusr
	qJ3AMnSW7nM2BkuqRAllBus0ucmRMnscZ6lGDngYOSgzHx+lh+08pzsjkV+HYvqnOUbkNyFIo8IDB
	xr50e5MIX9Vwx/wUHIvvzkjRDn6S4QmTv83FOM5EFFSNWT/OLxOtiiffQDci+eeLO2HrXyyk/Eebs
	aK30LYLQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tJA-00000008Lbr-1XUZ;
	Tue, 08 Sep 2026 10:44:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 71276300B5F; Tue, 08 Sep 2026 12:44:07 +0200 (CEST)
Date: Tue, 8 Sep 2026 12:44:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Hui Su <sh_def@163.com>, mingo@redhat.com, tim.c.chen@linux.intel.com,
	kprateek.nayak@amd.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, connoro@google.com, jstultz@google.com,
	linux-kernel@vger.kernel.org, arighi@nvidia.com
Subject: Re: [PATCH v3 1/2] sched/numa: Drive NUMA task tick from execution
 context
Message-ID: <20260908104407.GD687043@noisy.programming.kicks-ass.net>
References: <20260904085244.799276-1-sh_def@163.com>
 <20260904085244.799276-2-sh_def@163.com>
 <20260908083545.GM4121339@noisy.programming.kicks-ass.net>
 <a89a2aef-f374-4fd6-aafe-ca21d21c980d@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a89a2aef-f374-4fd6-aafe-ca21d21c980d@intel.com>

On Tue, Sep 08, 2026 at 06:02:26PM +0800, Chen, Yu C wrote:
> On 9/8/2026 4:35 PM, Peter Zijlstra wrote:
> > What about something like so?
> > 
> 
> Thanks Peter for taking a look at this. I think this version achieves
> better decoupling since the logic is added per scheduling class,
> rather than inserting random hooks into the core scheduler.

Right :-)

> > -static void task_tick_scx(struct rq *rq, struct task_struct *curr, int queued)
> > +static void task_tick_scx(struct rq *rq, int queued)
> >   {
> > +	struct task_struct *curr = rq->donor;
> 
> struct task_struct *donor = rq->donor

Nah, it wants to be curr, like the argument was called before. I'll fix
that class check.

> >   	struct scx_sched *sch = scx_task_sched(curr);
> > +	if (donor->sched_class != &ext_sched_class)
> > +		return;
> > +
> >   	update_curr_scx(rq);
> >   	/*
> 
> [ ... ]
> 
> > -static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
> > +static void task_tick_fair(struct rq *rq, int queued)
> >   {
> > -	struct sched_entity *se = &curr->se;
> > +	struct task_struct *curr = rq->curr, *donor = rq->donor;
> > -	if (se->on_rq) {
> > -		unsigned long weight = NICE_0_LOAD;
> > -		struct cfs_rq *cfs_rq;
> > +	if (donor->sched_class == &fair_sched_class) {
> > +		struct sched_entity *se = &donor->se;
> > -		for_each_sched_entity(se) {
> > -			cfs_rq = cfs_rq_of(se);
> > -			entity_tick(cfs_rq, se, queued);
> > +		if (se->on_rq) {
> > +			unsigned long weight = NICE_0_LOAD;
> > +			struct cfs_rq *cfs_rq;
> > -			weight = __calc_prop_weight(cfs_rq, se, weight);
> > +			for_each_sched_entity(se) {
> > +				cfs_rq = cfs_rq_of(se);
> > +				entity_tick(cfs_rq, se, queued);
> > +
> > +				weight = __calc_prop_weight(cfs_rq, se, weight);
> > +			}
> > +
> > +			se = &donor->se;
> > +			reweight_eevdf(cfs_rq, se, weight, se->on_rq);
> >   		}
> > -		se = &curr->se;
> > -		reweight_eevdf(cfs_rq, se, weight, se->on_rq);
> > +		if (queued)
> > +			return;
> > +
> > +		update_misfit_status(donor, rq);
> > +		check_update_overutilized_status(task_rq(donor));
> > +
> > +		task_tick_core(rq, donor);
> >   	}
> > -	if (queued)
> > -		return;
> 
> The queued check might still be needed: if donor is not a fair task, we
> still
> want to skip the numa balancing/sched_cache for hrtick event?

Oh right. I have a patch pending that renames that thing. But yes, I
very much rushed this PoC patch without minding the details very much.

I also wondered if we should have task_tick() do curr_class->task_tick()
last, rather than first. But I couldn't immediately find a compelling
argument either way around.

Updated...

---
 kernel/sched/core.c      | 16 +++++++++++++---
 kernel/sched/deadline.c  |  7 ++++++-
 kernel/sched/ext/ext.c   |  6 +++++-
 kernel/sched/fair.c      | 49 ++++++++++++++++++++++++++----------------------
 kernel/sched/idle.c      |  5 +++--
 kernel/sched/rt.c        |  6 +++++-
 kernel/sched/sched.h     |  2 +-
 kernel/sched/stop_task.c |  2 +-
 8 files changed, 61 insertions(+), 32 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 853afc869715..1f42bb856337 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -910,6 +910,16 @@ static void __used hrtick_clear(struct rq *rq)
 		hrtimer_cancel(&rq->hrtick_timer);
 }
 
+static inline void task_tick(struct rq *rq, int queued)
+{
+	const struct sched_class *curr_class = rq->curr->sched_class,
+				*donor_class = rq->donor->sched_class;
+
+	curr_class->task_tick(rq, queued);
+	if (sched_proxy_exec() && donor_class != curr_class)
+		donor_class->task_tick(rq, queued);
+}
+
 /*
  * High-resolution timer tick.
  * Runs from hardirq context with interrupts disabled.
@@ -923,7 +933,7 @@ static enum hrtimer_restart hrtick(struct hrtimer *timer)
 
 	rq_lock(rq, &rf);
 	update_rq_clock(rq);
-	rq->donor->sched_class->task_tick(rq, rq->donor, 1);
+	task_tick(rq, 1);
 	rq_unlock(rq, &rf);
 
 	return HRTIMER_NORESTART;
@@ -5800,7 +5810,7 @@ void sched_tick(void)
 	if (dynamic_preempt_lazy() && tif_test_bit(TIF_NEED_RESCHED_LAZY))
 		resched_curr(rq);
 
-	donor->sched_class->task_tick(rq, donor, 0);
+	task_tick(rq, 0);
 	if (sched_feat(LATENCY_WARN))
 		resched_latency = cpu_resched_latency(rq);
 	calc_global_load_tick(rq);
@@ -5896,7 +5906,7 @@ static void sched_tick_remote(struct work_struct *work)
 				u64 delta = rq_clock_task(rq) - curr->se.exec_start;
 				WARN_ON_ONCE(delta > (u64)NSEC_PER_SEC * 30);
 			}
-			curr->sched_class->task_tick(rq, curr, 0);
+			task_tick(rq, 0);
 
 			calc_load_nohz_remote(rq);
 		}
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index de6a361a87c7..65b83ff81201 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2876,8 +2876,13 @@ static void put_prev_task_dl(struct rq *rq, struct task_struct *p, struct task_s
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_dl(struct rq *rq, struct task_struct *p, int queued)
+static void task_tick_dl(struct rq *rq, int queued)
 {
+	struct task_struct *p = rq->donor;
+
+	if (p->sched_class != &dl_sched_class)
+		return;
+
 	update_curr_dl(rq);
 
 	update_dl_rq_load_avg(rq_clock_pelt(rq), rq, 1);
diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 51de1d8b72a1..9c760d46f8dd 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -3789,10 +3789,14 @@ void scx_tick(struct rq *rq)
 	update_other_load_avgs(rq);
 }
 
-static void task_tick_scx(struct rq *rq, struct task_struct *curr, int queued)
+static void task_tick_scx(struct rq *rq, int queued)
 {
+	struct task_struct *curr = rq->donor;
 	struct scx_sched *sch = scx_task_sched(curr);
 
+	if (curr->sched_class != &ext_sched_class)
+		return;
+
 	update_curr_scx(rq);
 
 	/*
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b8bd308c2d5b..bbb239a22c5e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15046,37 +15046,42 @@ static inline void task_tick_core(struct rq *rq, struct task_struct *curr) {}
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
+static void task_tick_fair(struct rq *rq, int queued)
 {
-	struct sched_entity *se = &curr->se;
+	struct task_struct *curr = rq->curr, *donor = rq->donor;
 
-	if (se->on_rq) {
-		unsigned long weight = NICE_0_LOAD;
-		struct cfs_rq *cfs_rq;
+	if (donor->sched_class == &fair_sched_class) {
+		struct sched_entity *se = &donor->se;
 
-		for_each_sched_entity(se) {
-			cfs_rq = cfs_rq_of(se);
-			entity_tick(cfs_rq, se, queued);
+		if (se->on_rq) {
+			unsigned long weight = NICE_0_LOAD;
+			struct cfs_rq *cfs_rq;
 
-			weight = __calc_prop_weight(cfs_rq, se, weight);
+			for_each_sched_entity(se) {
+				cfs_rq = cfs_rq_of(se);
+				entity_tick(cfs_rq, se, queued);
+
+				weight = __calc_prop_weight(cfs_rq, se, weight);
+			}
+
+			se = &donor->se;
+			reweight_eevdf(cfs_rq, se, weight, se->on_rq);
 		}
 
-		se = &curr->se;
-		reweight_eevdf(cfs_rq, se, weight, se->on_rq);
+		if (!queued) {
+			update_misfit_status(donor, rq);
+			check_update_overutilized_status(task_rq(donor));
+
+			task_tick_core(rq, donor);
+		}
 	}
 
-	if (queued)
-		return;
+	if (curr->sched_class == &fair_sched_class && !queued) {
+		if (static_branch_unlikely(&sched_numa_balancing))
+			task_tick_numa(rq, curr);
 
-	if (static_branch_unlikely(&sched_numa_balancing))
-		task_tick_numa(rq, curr);
-
-	task_tick_cache(rq, curr);
-
-	update_misfit_status(curr, rq);
-	check_update_overutilized_status(task_rq(curr));
-
-	task_tick_core(rq, curr);
+		task_tick_cache(rq, curr);
+	}
 }
 
 /*
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index eb73b65ce6c4..077eed68869e 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -535,9 +535,10 @@ dequeue_task_idle(struct rq *rq, struct task_struct *p, int flags)
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_idle(struct rq *rq, struct task_struct *curr, int queued)
+static void task_tick_idle(struct rq *rq, int queued)
 {
-	update_curr_idle(rq);
+	if (rq->donor->sched_class == &idle_sched_class)
+		update_curr_idle(rq);
 }
 
 static void switching_to_idle(struct rq *rq, struct task_struct *p)
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 85303add726d..5e4ff18589c2 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2538,10 +2538,14 @@ static inline void watchdog(struct rq *rq, struct task_struct *p) { }
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_rt(struct rq *rq, struct task_struct *p, int queued)
+static void task_tick_rt(struct rq *rq, int queued)
 {
+	struct task_struct *p = rq->donor;
 	struct sched_rt_entity *rt_se = &p->rt;
 
+	if (p->sched_class != &rt_sched_class)
+		return;
+
 	update_curr_rt(rq);
 	update_rt_rq_load_avg(rq_clock_pelt(rq), rq, 1);
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c3ad70e58b8..ca6ef6f0dcb4 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2727,7 +2727,7 @@ struct sched_class {
 	 * sched_tick: rq->lock
 	 * sched_tick_remote: rq->lock
 	 */
-	void (*task_tick)(struct rq *rq, struct task_struct *p, int queued);
+	void (*task_tick)(struct rq *rq, int queued);
 	/*
 	 * sched_cgroup_fork: p->pi_lock
 	 */
diff --git a/kernel/sched/stop_task.c b/kernel/sched/stop_task.c
index c909ca0d8c87..c3ad1eb4bc5f 100644
--- a/kernel/sched/stop_task.c
+++ b/kernel/sched/stop_task.c
@@ -71,7 +71,7 @@ static void put_prev_task_stop(struct rq *rq, struct task_struct *prev, struct t
  * and everything must be accessed through the @rq and @curr passed in
  * parameters.
  */
-static void task_tick_stop(struct rq *rq, struct task_struct *curr, int queued)
+static void task_tick_stop(struct rq *rq, int queued)
 {
 }
 
