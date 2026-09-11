Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81385439F71
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125673; cv=none; b=GCO1hvB7g+9tl2p9C9KvCdtTDm3SB3u780VlrGSzdW1v/eD0hoedAiK7z216C1Gv/+3MYSMrZf0jAL+hSoviciuY4YyD00UT2kndErHYSCwUrzWj+1p+V76nHIh4J8ZO0zKK4WQmqhardNNZcXO4RJdCYiPw/qVKodka1GE8MHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125673; c=relaxed/simple;
	bh=zOY9khzGGQ3KIzt6hyLiACs2ClVnYZDjUl73dowDOKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bv6hOSJC0TuBz8o0PoQf98H0OxSMMxALIFksc3Pif9Y/EC9S4TZwLhYtfx7AzWg0a9I2/mRrFoVWAR/YmoqyFrHy78HJWswnHYreb1U45HKFTuUJ0wr//VoU0awG/Q107VuRACje0kVPmX9OBRFKA5icNSqsXF/gV8eohcobtck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=S/b6TMoQ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="S/b6TMoQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i9R+LZVjJ7eEOWywOX1SUUFSudK+unBrzcvXnS2h+w4=; b=S/b6TMoQQgcR6TLK3fVHXgpd8i
	fEl9URlb49TgHVYCe3xBFdJNd4sKGrF9TEfQ7SeHPOPJvyW9AM+95wGzqMTzAMqH+7069O22IiqqK
	KUqDx6KicVeVQub7tqP1Q0cPZJRK0JS7yaT2VoDz6TroB1krrvHsruxTR9WPxJlSztFo02gy54srH
	mZ2rbHpjkkr/CLffX2gak7eIUWt7HIFJ2BMSq8+thwDgIQ6DDqhMMpeFSd6IXu78cAwiHcqSMPpL6
	DwssZ8OMP1dq7gVT0Xk5iQ4N0g7cNpHV3Z/ZEMlmCAjxl0nDF5Fok+umzBBTik60yeyqxthTXSBQO
	fdo3q3pA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zJR-0000000BMyk-1C1k;
	Fri, 11 Sep 2026 11:20:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 61427300400; Fri, 11 Sep 2026 13:20:56 +0200 (CEST)
Date: Fri, 11 Sep 2026 13:20:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Shubhang Kaushik <shubhang@os.amperecomputing.com>,
	Christoph Lameter <cl@gentwo.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Restart hrtick after same-task repicks
Message-ID: <20260911112056.GY776954@noisy.programming.kicks-ass.net>
References: <20260813-sched-fair-hrtick-restart-v1-1-4230d1e18fbb@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-sched-fair-hrtick-restart-v1-1-4230d1e18fbb@gentwo.org>

On Thu, Aug 13, 2026 at 02:23:48PM -0700, Shubhang Kaushik (Ampere) wrote:
> Fair hrtick is implemented with a one-shot timer, so each precise
> preemption point has to be programmed explicitly. The usual fair path
> does this from set_next_task_fair(), which calls hrtick_start_fair().
> 
> The missed path is:
> 
>   hrtick
>     -> task_tick_fair(..., queued=1)
>        -> entity_tick()
> 	  -> resched_curr()
>     -> schedule()
>        -> pick_task_fair() picks current again
>        -> put_prev_set_next_task()
> 	  -> next == prev
> 	  -> return
> 
> Since set_next_task_fair() is skipped, hrtick_start_fair() is not called
> and no new fair hrtick is started.

Indeed. However, you missed this is also true for DL.

Does something like the below work for you?

---
 kernel/sched/core.c      |  2 +-
 kernel/sched/deadline.c  |  8 ++++++--
 kernel/sched/ext/ext.c   |  5 ++++-
 kernel/sched/fair.c      | 15 ++++++++++-----
 kernel/sched/idle.c      |  5 ++++-
 kernel/sched/rt.c        |  7 +++++--
 kernel/sched/sched.h     | 16 ++++++++++++----
 kernel/sched/stop_task.c |  5 ++++-
 8 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 91f059a55695..a39d12d38070 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7241,7 +7241,7 @@ static void __sched notrace __schedule(int sched_mode)
 			 * on_cpu.
 			 */
 			donor->sched_class->put_prev_task(rq, donor, donor);
-			donor->sched_class->set_next_task(rq, donor, true);
+			donor->sched_class->set_next_task(rq, donor, SNT_PICK);
 		}
 	} else {
 		rq_set_donor(rq, next);
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index de6a361a87c7..21d904d92c64 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2773,11 +2773,14 @@ static void start_hrtick_dl(struct rq *rq, struct sched_dl_entity *dl_se)
  * DL keeps current in tree, because ->deadline is not typically changed while
  * a task is runnable.
  */
-static void set_next_task_dl(struct rq *rq, struct task_struct *p, bool first)
+static void set_next_task_dl(struct rq *rq, struct task_struct *p, enum snt_e type)
 {
 	struct sched_dl_entity *dl_se = &p->dl;
 	struct dl_rq *dl_rq = &rq->dl;
 
+	if (type == SNT_REPICK)
+		goto repick;
+
 	p->se.exec_start = rq_clock_task(rq);
 	if (on_dl_rq(&p->dl))
 		update_stats_wait_end_dl(dl_rq, dl_se);
@@ -2788,7 +2791,7 @@ static void set_next_task_dl(struct rq *rq, struct task_struct *p, bool first)
 	WARN_ON_ONCE(dl_rq->curr);
 	dl_rq->curr = dl_se;
 
-	if (!first)
+	if (type != SNT_PICK)
 		return;
 
 	if (rq->donor->sched_class != &dl_sched_class)
@@ -2796,6 +2799,7 @@ static void set_next_task_dl(struct rq *rq, struct task_struct *p, bool first)
 
 	deadline_queue_push_tasks(rq);
 
+repick:
 	if (hrtick_enabled_dl(rq))
 		start_hrtick_dl(rq, &p->dl);
 }
diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 51de1d8b72a1..31a300f2d3b2 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -3003,10 +3003,13 @@ static enum scx_dsp_verdict dispatch_one(struct rq *rq, struct task_struct *prev
 	return verdict;
 }
 
-static void set_next_task_scx(struct rq *rq, struct task_struct *p, bool first)
+static void set_next_task_scx(struct rq *rq, struct task_struct *p, enum snt_e type)
 {
 	struct scx_sched *sch = scx_task_sched(p);
 
+	if (type == SNT_REPICK)
+		return;
+
 	if (p->scx.flags & SCX_TASK_QUEUED) {
 		/*
 		 * Core-sched might decide to execute @p before it is
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 4d0b94465d19..f469e469b402 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15242,14 +15242,18 @@ static void switched_to_fair(struct rq *rq, struct task_struct *p)
 	}
 }
 
-static void set_next_task_fair(struct rq *rq, struct task_struct *p, bool first)
+static void set_next_task_fair(struct rq *rq, struct task_struct *p, enum snt_e type)
 {
 	struct sched_entity *se = &p->se;
-	bool throttled = false;
 	struct cfs_rq *cfs_rq = &rq->cfs;
 	unsigned long weight = NICE_0_LOAD;
+	bool first = type == SNT_PICK;
+	bool throttled = false;
 	bool on_rq = se->on_rq;
 
+	if (type == SNT_REPICK)
+		goto repick;
+
 	clear_buddies(cfs_rq, se);
 
 	if (on_rq)
@@ -15293,11 +15297,12 @@ static void set_next_task_fair(struct rq *rq, struct task_struct *p, bool first)
 
 	WARN_ON_ONCE(se->sched_delayed);
 
-	if (hrtick_enabled_fair(rq))
-		hrtick_start_fair(rq, p);
-
 	update_misfit_status(p, rq);
 	sched_fair_update_stop_tick(rq, p);
+
+repick:
+	if (hrtick_enabled_fair(rq))
+		hrtick_start_fair(rq, p);
 }
 
 void init_cfs_rq(struct cfs_rq *cfs_rq)
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index eb73b65ce6c4..76f3c84ca684 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -487,8 +487,11 @@ static void put_prev_task_idle(struct rq *rq, struct task_struct *prev, struct t
 	update_rq_avg_idle(rq);
 }
 
-static void set_next_task_idle(struct rq *rq, struct task_struct *next, bool first)
+static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt_e type)
 {
+	if (type == SNT_REPICK)
+		return;
+
 	update_idle_core(rq);
 	scx_update_idle(rq, true, true);
 	schedstat_inc(rq->sched_goidle);
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 85303add726d..1535046a23ff 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1654,11 +1654,14 @@ static void wakeup_preempt_rt(struct rq *rq, struct task_struct *p, int flags)
 		check_preempt_equal_prio(rq, p);
 }
 
-static inline void set_next_task_rt(struct rq *rq, struct task_struct *p, bool first)
+static inline void set_next_task_rt(struct rq *rq, struct task_struct *p, enum snt_e type)
 {
 	struct sched_rt_entity *rt_se = &p->rt;
 	struct rt_rq *rt_rq = &rq->rt;
 
+	if (type == SNT_REPICK)
+		return;
+
 	p->se.exec_start = rq_clock_task(rq);
 	if (on_rt_rq(&p->rt))
 		update_stats_wait_end_rt(rt_rq, rt_se);
@@ -1666,7 +1669,7 @@ static inline void set_next_task_rt(struct rq *rq, struct task_struct *p, bool f
 	/* The running task is never eligible for pushing */
 	dequeue_pushable_task(rq, p);
 
-	if (!first)
+	if (type != SNT_PICK)
 		return;
 
 	/*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c3ad70e58b8..944366e2d142 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2630,6 +2630,12 @@ struct affinity_context {
 
 extern s64 update_curr_common(struct rq *rq);
 
+enum snt_e {
+	SNT_NORMAL,
+	SNT_PICK,
+	SNT_REPICK,
+};
+
 struct sched_class {
 
 #ifdef CONFIG_UCLAMP_TASK
@@ -2687,7 +2693,7 @@ struct sched_class {
 	 * __schedule: rq->lock
 	 */
 	void (*put_prev_task)(struct rq *rq, struct task_struct *p, struct task_struct *next);
-	void (*set_next_task)(struct rq *rq, struct task_struct *p, bool first);
+	void (*set_next_task)(struct rq *rq, struct task_struct *p, enum snt_e type);
 
 	/*
 	 * select_task_rq: p->pi_lock
@@ -2790,7 +2796,7 @@ static inline void put_prev_task(struct rq *rq, struct task_struct *prev)
 
 static inline void set_next_task(struct rq *rq, struct task_struct *next)
 {
-	next->sched_class->set_next_task(rq, next, false);
+	next->sched_class->set_next_task(rq, next, SNT_NORMAL);
 }
 
 static inline void
@@ -2811,11 +2817,13 @@ static inline void put_prev_set_next_task(struct rq *rq,
 
 	__put_prev_set_next_dl_server(rq, prev, next);
 
-	if (next == prev)
+	if (next == prev) {
+		next->sched_class->set_next_task(rq, next, SNT_REPICK);
 		return;
+	}
 
 	prev->sched_class->put_prev_task(rq, prev, next);
-	next->sched_class->set_next_task(rq, next, true);
+	next->sched_class->set_next_task(rq, next, SNT_PICK);
 }
 
 /*
diff --git a/kernel/sched/stop_task.c b/kernel/sched/stop_task.c
index c909ca0d8c87..1e0109ec36b3 100644
--- a/kernel/sched/stop_task.c
+++ b/kernel/sched/stop_task.c
@@ -27,8 +27,11 @@ wakeup_preempt_stop(struct rq *rq, struct task_struct *p, int flags)
 	/* we're never preempted */
 }
 
-static void set_next_task_stop(struct rq *rq, struct task_struct *stop, bool first)
+static void set_next_task_stop(struct rq *rq, struct task_struct *stop, enum snt_e type)
 {
+	if (type == SNT_REPICK)
+		return;
+
 	stop->se.exec_start = rq_clock_task(rq);
 }
 
