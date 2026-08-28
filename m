Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B344411A12
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913697; cv=none; b=o0tdf9tSrVCJSUZSP34QrDPFbUYN9VgfR7QiMrmB4WeFkNko31gj1ssPk9J0lsdcU7fVFh1K3aWX0HHi2xB9EON6ycNVWheJ1DYUKXBdELZOq+vqS/9UnuZJjNdT10JnASFg6RokjMu8jYUFnG4e/MwUpqARq7CGU1UZgcDWJAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913697; c=relaxed/simple;
	bh=x75Nn42OGuPkUaph2bNV9DA0Be9pp6Tx1RtXKAiVkqM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=eVvNK9fkgpJmL8G5Ty3aepUCMjb8R5TPtBa/dihQzg4+V6kFvZBvt/cW3QhwqEqbvE1dSHjUVJAptHfIOm6J07Fj1Rz1COpsUFJ4pSEFSJeC2mSwh4of+/r9e2N01wAzWgHBTQoUqwWAZma2xtoM4vFl2SK3cbfEPvw2U5vFiDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=N3x4KzAS; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="N3x4KzAS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=lB9EtaL/P3ii3s+ArDjR6Oxn8NL0qwk8vBA/yDHTIYs=; b=N3x4KzASY7fX2zS07zZ7frLIi0
	PxDxOsYcSyFViwC0D8U+N0hi0ZWRCxfhQHdY15UfrVedakj+0RJ6242d1hXtxOhCyRk/XogR7R4am
	g9OUcSn7pj3Nl8q6jhxV5tjsuKILiQ/zdXMaVrsLqSa5wG+Pmkt5UJM/nhXOX2Uh7vcGs05Pk2bMc
	ThC/DSemkG7ETU1TQyKOXz/Ajehknf+j4vHUZTMOiH7m86Wp4oewHW/3mTOZxfRSE4/p5DznmmWby
	qhscRJiPp7FXepQGrBlXSoZQXXE9V92yL9AqT1oHd7QcBQUCVtmREH8obz9mvVsMD2e6r3yapRtaS
	QlRQWXeA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzu1T-0000000EWAo-2VWH;
	Fri, 28 Aug 2026 10:41:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id E29C73030AD; Fri, 28 Aug 2026 12:41:21 +0200 (CEST)
Message-ID: <20260828104018.787096901@infradead.org>
User-Agent: quilt/0.68
Date: Fri, 28 Aug 2026 12:17:04 +0200
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
Subject: [PATCH 5/7] sched/fair: Reflow pick_task_fair() / newidle
References: <20260828101659.812011872@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

This is all histerical artifacts. Clean up the code to be less convoluted.

Note: this also re-enables balance for core-sched.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/fair.c |   51 +++++++++++++--------------------------------------
 1 file changed, 13 insertions(+), 38 deletions(-)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5942,7 +5942,7 @@ static inline unsigned long cfs_rq_load_
 	return cfs_rq->avg.load_avg;
 }
 
-static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
+static void sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 	__must_hold(__rq_lockp(this_rq));
 
 static inline unsigned long task_util(struct task_struct *p)
@@ -10049,11 +10049,17 @@ struct task_struct *pick_task_fair(struc
 	struct cfs_rq *cfs_rq = &rq->cfs;
 	struct sched_entity *se;
 	struct task_struct *p;
-	int new_tasks;
 
 again:
-	if (!cfs_rq->h_nr_queued)
-		goto idle;
+	if (unlikely(!cfs_rq->h_nr_queued)) {
+		rq_modified_begin(rq, &fair_sched_class);
+		sched_balance_newidle(rq, rf);
+		if (rq_modified_above(rq, &fair_sched_class))
+			return RETRY_TASK;
+
+		if (!cfs_rq->h_nr_queued)
+			return NULL;
+	}
 
 	/* Might not have done put_prev_entity() */
 	if (cfs_rq->curr && cfs_rq->curr->on_rq)
@@ -10065,17 +10071,6 @@ struct task_struct *pick_task_fair(struc
 
 	p = task_of(se);
 	return p;
-
-idle:
-	if (sched_core_enabled(rq))
-		return NULL;
-
-	new_tasks = sched_balance_newidle(rq, rf);
-	if (new_tasks < 0)
-		return RETRY_TASK;
-	if (new_tasks > 0)
-		goto again;
-	return NULL;
 }
 
 static struct task_struct *
@@ -14531,13 +14526,8 @@ static inline void nohz_newidle_balance(
 /*
  * sched_balance_newidle is called by schedule() if this_cpu is about to become
  * idle. Attempts to pull tasks from other CPUs.
- *
- * Returns:
- *   < 0 - we released the lock and there are !fair tasks present
- *     0 - failed, no new tasks
- *   > 0 - success, new (fair) tasks present
  */
-static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
+static void sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 	__must_hold(__rq_lockp(this_rq))
 {
 	unsigned long next_balance = jiffies + HZ;
@@ -14554,7 +14544,7 @@ static int sched_balance_newidle(struct
 	 * Return 0; the task will be enqueued when switching to idle.
 	 */
 	if (this_rq->ttwu_pending)
-		return 0;
+		return;
 
 	/*
 	 * We must set idle_stamp _before_ calling sched_balance_rq()
@@ -14567,7 +14557,7 @@ static int sched_balance_newidle(struct
 	 * Do not pull tasks towards !active CPUs...
 	 */
 	if (!cpu_active(this_cpu))
-		return 0;
+		return;
 
 	/*
 	 * This is OK, because current is on_cpu, which avoids it being picked
@@ -14596,7 +14586,6 @@ static int sched_balance_newidle(struct
 	t0 = sched_clock_cpu(this_cpu);
 	__sched_balance_update_blocked_averages(this_rq);
 
-	rq_modified_begin(this_rq, &fair_sched_class);
 	raw_spin_rq_unlock(this_rq);
 
 	for_each_domain(this_cpu, sd) {
@@ -14654,18 +14643,6 @@ static int sched_balance_newidle(struct
 	if (curr_cost > this_rq->max_idle_balance_cost)
 		this_rq->max_idle_balance_cost = curr_cost;
 
-	/*
-	 * While browsing the domains, we released the rq lock, a task could
-	 * have been enqueued in the meantime. Since we're not going idle,
-	 * pretend we pulled a task.
-	 */
-	if (this_rq->cfs.h_nr_queued && !pulled_task)
-		pulled_task = 1;
-
-	/* If a higher prio class was modified, restart the pick */
-	if (rq_modified_above(this_rq, &fair_sched_class))
-		pulled_task = -1;
-
 out:
 	/* Move the next balance forward */
 	if (time_after(this_rq->next_balance, next_balance))
@@ -14677,8 +14654,6 @@ static int sched_balance_newidle(struct
 		nohz_newidle_balance(this_rq);
 
 	rq_repin_lock(this_rq, rf);
-
-	return pulled_task;
 }
 
 /*


