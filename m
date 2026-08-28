Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26E34028D9
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913698; cv=none; b=X1TkjfwN1IgPFeRNpcWxzgvrDng0g2/MokxBhRVBEB1aApEjfNasb5bzalzPjS3fv4P1a17LwyCfLnMsgBn/v0xRzlLB/qJYKpY/2VPghteTQk6sK591SrEcBqpTMJJg98EsedLVRw6Oe/MdG2hnB+7fiEMU9axB6O8WvJI4CkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913698; c=relaxed/simple;
	bh=GT2keGz9a11wGv3Pu54CfaY09O9hMb4Kov+LmHnLmmU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=hXjBhsn3GQNIhBGOAB4GMEjQGvmzPU8PX+/EviFYkVW/7Faxbm3nJTqb20D5k7iipuX8yc8rY4QUq7i5TUm9E53ydQi67B+wZNkIfbJvXi2PD5GSYULRmt5RyVj+729XTk85q797yt4zDyQ/VAwD80K1NNpNFTAuwhOdV/ybCb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=a5u48e+2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="a5u48e+2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=mHZz+wX0gouUyTzWxfn+wXM4U+Ln9tJes1IvBO2JVTM=; b=a5u48e+2ntdf+4L0WShPMKVzX8
	VaS+2UlaEPxOWrl7rNV3/6qhqZ5a+VJIgLMgaqPS9kHeMyAwUuuYP09SGdt8Bt6RXUfergkenY6st
	MeOvEK0pl6UzP8ecv7s8kWgJI5RScu+e/gb0oyL6wwxwS0KiyQneFvsPCLmi9jMHHrwMXnscN03ev
	OnGLjnTnNFApB8GJA4I9Wle/8ZXL8Nys7FexO+jb0TbYpk01tQu1WjNaFi6z6asmzkFB/OlmWf8xp
	50TWOLLjwggXgC9GARS3cmZpFRw0yftP3Jk9ioxFkoq/3lls9f04RWWK0WA/ztLoywIyIv+Tjiyrs
	PNQKmnrg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzu1T-0000000EWAm-2RN9;
	Fri, 28 Aug 2026 10:41:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id EAAA13031C8; Fri, 28 Aug 2026 12:41:21 +0200 (CEST)
Message-ID: <20260828104018.996963405@infradead.org>
User-Agent: quilt/0.68
Date: Fri, 28 Aug 2026 12:17:06 +0200
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
 linux-kernel@vger.kernel.org,
 tj@kernel.org
Subject: [PATCH 7/7] sched: Remove sched_class::balance()
References: <20260828101659.812011872@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Ever since commit 50653216e4ff ("sched: Add support to pick functions to take
rf"), we have the unfortunate situation that both sched_class::balance() and
sched_class::pick_task() have overlapping functionality in that they drop
rq->lock and balance tasks.

Additionally, prev_balance() is only called for a single RQ in the core-sched
case, resulting in 'missed' balance opportunities in this case.

Just like pick_task(), prev_balance() would iterate the classes and stop when
there is a runnable task found. The only difference is that pick_task() starts
from the top class, while prev_balance() would start from prev->class.

This means that if prev was an RT task, we'd get an extra visit to balance_dl()
-- and similary, if prev is fair, we'd visit balance_{dl,rt}() both. However,
this is not a problem, because both need_pull_{dl,rt}_task() will DTRT.

Therefore, move balance_{rt,dl}() into pick_task_{rt,dl}() and remove
sched_class::balance().

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c      |   23 -----------------------
 kernel/sched/deadline.c  |   10 ++++++----
 kernel/sched/fair.c      |   47 +++++++++++++----------------------------------
 kernel/sched/idle.c      |    7 -------
 kernel/sched/rt.c        |   14 ++++++--------
 kernel/sched/sched.h     |    5 -----
 kernel/sched/stop_task.c |    7 -------
 7 files changed, 25 insertions(+), 88 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6115,25 +6115,6 @@ static inline void schedule_debug(struct
 	schedstat_inc(this_rq()->sched_count);
 }
 
-static void prev_balance(struct rq *rq, struct rq_flags *rf)
-{
-	const struct sched_class *start_class = rq->donor->sched_class;
-	const struct sched_class *class;
-
-	/*
-	 * We must do the balancing pass before put_prev_task(), such
-	 * that when we release the rq->lock the task is in the same
-	 * state as before we took rq->lock.
-	 *
-	 * We can terminate the balance pass as soon as we know there is
-	 * a runnable task of @class priority or higher.
-	 */
-	for_active_class_range(class, start_class, &idle_sched_class) {
-		if (class->balance && class->balance(rq, rf))
-			break;
-	}
-}
-
 /*
  * Pick up the highest-prio task:
  */
@@ -6171,8 +6152,6 @@ __pick_next_task(struct rq *rq, struct r
 	}
 
 restart:
-	prev_balance(rq, rf);
-
 	for_each_active_class(class) {
 		p = class->pick_task(rq, rf);
 		if (unlikely(p == RETRY_TASK))
@@ -6282,8 +6261,6 @@ pick_next_task(struct rq *rq, struct rq_
 		goto out_set_next;
 	}
 
-	prev_balance(rq, rf);
-
 	smt_mask = cpu_smt_mask(cpu);
 
 restart:
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2705,7 +2705,7 @@ static void check_preempt_equal_dl(struc
 	resched_curr(rq);
 }
 
-static int balance_dl(struct rq *rq, struct rq_flags *rf)
+static void balance_dl(struct rq *rq, struct rq_flags *rf)
 {
 	/*
 	 * Note, rq->donor may change during rq lock drops,
@@ -2724,8 +2724,6 @@ static int balance_dl(struct rq *rq, str
 		pull_dl_task(rq);
 		rq_repin_lock(rq, rf);
 	}
-
-	return sched_stop_runnable(rq) || sched_dl_runnable(rq);
 }
 
 /*
@@ -2820,6 +2818,11 @@ static struct task_struct *__pick_task_d
 	struct dl_rq *dl_rq = &rq->dl;
 	struct task_struct *p;
 
+	rq_modified_begin(rq, &dl_sched_class);
+	balance_dl(rq, rf);
+	if (rq_modified_above(rq, &dl_sched_class))
+		return RETRY_TASK;
+
 again:
 	if (!sched_dl_runnable(rq))
 		return NULL;
@@ -3655,7 +3658,6 @@ DEFINE_SCHED_CLASS(dl) = {
 	.put_prev_task		= put_prev_task_dl,
 	.set_next_task		= set_next_task_dl,
 
-	.balance		= balance_dl,
 	.select_task_rq		= select_task_rq_dl,
 	.migrate_task_rq	= migrate_task_rq_dl,
 	.set_cpus_allowed       = set_cpus_allowed_dl,
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -464,12 +464,6 @@ select_task_rq_idle(struct task_struct *
 	return task_cpu(p); /* IDLE tasks as never migrated */
 }
 
-static int
-balance_idle(struct rq *rq, struct rq_flags *rf)
-{
-	return WARN_ON_ONCE(1);
-}
-
 /*
  * Idle tasks are unconditionally rescheduled:
  */
@@ -581,7 +575,6 @@ DEFINE_SCHED_CLASS(idle) = {
 	.put_prev_task		= put_prev_task_idle,
 	.set_next_task          = set_next_task_idle,
 
-	.balance		= balance_idle,
 	.select_task_rq		= select_task_rq_idle,
 	.set_cpus_allowed	= set_cpus_allowed_common,
 
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1596,7 +1596,7 @@ static void check_preempt_equal_prio(str
 	resched_curr(rq);
 }
 
-static int balance_rt(struct rq *rq, struct rq_flags *rf)
+static void balance_rt(struct rq *rq, struct rq_flags *rf)
 {
 	/*
 	 * Note, rq->donor may change during rq lock drops,
@@ -1615,8 +1615,6 @@ static int balance_rt(struct rq *rq, str
 		pull_rt_task(rq);
 		rq_repin_lock(rq, rf);
 	}
-
-	return sched_stop_runnable(rq) || sched_dl_runnable(rq) || sched_rt_runnable(rq);
 }
 
 /*
@@ -1715,14 +1713,15 @@ static struct task_struct *_pick_next_ta
 
 static struct task_struct *pick_task_rt(struct rq *rq, struct rq_flags *rf)
 {
-	struct task_struct *p;
+	rq_modified_begin(rq, &rt_sched_class);
+	balance_rt(rq, rf);
+	if (rq_modified_above(rq, &rt_sched_class))
+		return RETRY_TASK;
 
 	if (!sched_rt_runnable(rq))
 		return NULL;
 
-	p = _pick_next_task_rt(rq);
-
-	return p;
+	return _pick_next_task_rt(rq);
 }
 
 static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_struct *next)
@@ -2610,7 +2609,6 @@ DEFINE_SCHED_CLASS(rt) = {
 	.put_prev_task		= put_prev_task_rt,
 	.set_next_task          = set_next_task_rt,
 
-	.balance		= balance_rt,
 	.select_task_rq		= select_task_rq_rt,
 	.set_cpus_allowed       = set_cpus_allowed_common,
 	.rq_online              = rq_online_rt,
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2658,11 +2658,6 @@ struct sched_class {
 	void (*wakeup_preempt)(struct rq *rq, struct task_struct *p, int flags);
 
 	/*
-	 * schedule/pick_next_task/prev_balance: rq->lock
-	 */
-	int (*balance)(struct rq *rq, struct rq_flags *rf);
-
-	/*
 	 * schedule/pick_next_task: rq->lock
 	 */
 	struct task_struct *(*pick_task)(struct rq *rq, struct rq_flags *rf);
--- a/kernel/sched/stop_task.c
+++ b/kernel/sched/stop_task.c
@@ -15,12 +15,6 @@ select_task_rq_stop(struct task_struct *
 	return task_cpu(p); /* stop tasks as never migrate */
 }
 
-static int
-balance_stop(struct rq *rq, struct rq_flags *rf)
-{
-	return sched_stop_runnable(rq);
-}
-
 static void
 wakeup_preempt_stop(struct rq *rq, struct task_struct *p, int flags)
 {
@@ -107,7 +101,6 @@ DEFINE_SCHED_CLASS(stop) = {
 	.put_prev_task		= put_prev_task_stop,
 	.set_next_task          = set_next_task_stop,
 
-	.balance		= balance_stop,
 	.select_task_rq		= select_task_rq_stop,
 	.set_cpus_allowed	= set_cpus_allowed_common,
 


