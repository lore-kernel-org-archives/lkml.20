Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49711412BFA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913699; cv=none; b=QJFmab/I2B6/oey2zCJdUF/bzyGFKp3nswMJJmiFe4RKSI8YXfShwfcJ43dgBWu51fWNGI4tHvZtAeIj49PWr6HU4fc31rwo5tb2tD6KRXYg4clwAHNUGr8OJNTuxuOYoUIQBSWdCKO6nS/9tPiPLZ98XgMk7dOGT3fHgzGYbN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913699; c=relaxed/simple;
	bh=n2FwlhhN0bBbNwBLFjEW4/4SeO+G8UfQSZ+nbFA1GTs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=EEw4RdL9VuyzlYRmZ6hEEtVe4ay03UKTUd6LwVieMn/Wc4KoKy1pNtvAFvQ6ZSCzSSg1TgU7ptpgfyNbT4Nj/wk3hvLW6QnkIPB/8X9ThavM+AcXQs1oKoG+2OkSprbRYy8Y58dk3ss1OQ7YKEBmMZCC6BPD+ltLVp0PyVoaN48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rvcW1jt5; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rvcW1jt5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=UIjmU2oXAMcjl83pKKX4YVTcYXES3RkU5FaOkjGU5BQ=; b=rvcW1jt5WVE2YLC1z4L8OQqKgL
	DqyjUnzP5Vz6q36e3qXhG7bcVWzMTdx+GVfx2fs5psvWplLoYAkp7gIps3nrxR2TE37hk0t5ENLUt
	UbRV+CZ4J1+gpzbEgyhJ3XgOKp3P2xbGDvMUuHybo7as3hnQ0VT9VmJUuR9zE2zAb6riIpRqKbJpT
	8BDN6wY+bHPoF2Of/eXNRpfU6JOIv5qGczDftr6OLRYqQoozQPGgeap5K1PX7JAro5aKD6TeAv7R0
	Ub4nUSTBOoGXK+xnia/KsX2k3gfHxgRdyL8A36jkkLsgELbqlwRb23D5a15/Zg8/iDvSFHudRWUAs
	PtrEG43Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzu1S-0000000EWAe-3xCZ;
	Fri, 28 Aug 2026 10:41:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id DAB3C303071; Fri, 28 Aug 2026 12:41:21 +0200 (CEST)
Message-ID: <20260828104018.583549667@infradead.org>
User-Agent: quilt/0.68
Date: Fri, 28 Aug 2026 12:17:02 +0200
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
Subject: [PATCH 3/7] sched/core: Allow newidle for core-sched
References: <20260828101659.812011872@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

As reported [1], it is possible for newidle, as called from pick_task_fair(),
to migrate a task that was already selected for the SMT sibling.

That is, in case of core scheduling (pick_next_task()'s restart_multi label),
pick_task() is called for each SMT sibling. Suppose SMT0 picks task A, and SMT1
has no tasks and does newidle, it must not be possible (but currently is) to
migrate A to SMT1 and also select A.

Avoids the 'stealing', but doesn't yet enable newidle just yet.

[1] https://patch.msgid.link/20260603095108.GA1684319@bytedance.com

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c  |    3 ++-
 kernel/sched/fair.c  |    6 ++----
 kernel/sched/sched.h |   15 ++++++++++++++-
 3 files changed, 18 insertions(+), 6 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3049,7 +3049,8 @@ static int affine_move_task(struct rq *r
 		return -EINVAL;
 	}
 
-	if (task_on_cpu(rq, p) || READ_ONCE(p->__state) == TASK_WAKING) {
+	if (task_on_cpu(rq, p) || task_on_core(rq, p) ||
+	    READ_ONCE(p->__state) == TASK_WAKING) {
 		/*
 		 * MIGRATE_ENABLE gets here because 'p == current', but for
 		 * anything else we cannot do is_migration_disabled(), punt
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10906,7 +10903,8 @@ int can_migrate_task(struct task_struct
 	env->flags &= ~LBF_ALL_PINNED;
 
 	if (task_on_cpu(env->src_rq, p) ||
-	    task_current_donor(env->src_rq, p)) {
+	    task_current_donor(env->src_rq, p) ||
+	    task_on_core(env->src_rq, p)) {
 		schedstat_inc(p->stats.nr_failed_migrations_running);
 		return 0;
 	}
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1573,6 +1573,14 @@ static inline bool task_has_sched_core(s
 	return !!p->core_cookie;
 }
 
+static inline bool task_on_core(struct rq *rq, struct task_struct *p)
+{
+	if (sched_core_disabled())
+		return false;
+
+	return rq->core_pick == p;
+}
+
 #else /* !CONFIG_SCHED_CORE: */
 
 static inline bool sched_core_enabled(struct rq *rq)
@@ -1618,6 +1626,11 @@ static inline bool task_has_sched_core(s
 	return false;
 }
 
+static inline bool task_on_core(struct rq *rq, struct task_struct *p)
+{
+	return false;
+}
+
 #endif /* !CONFIG_SCHED_CORE */
 
 #ifdef CONFIG_RT_GROUP_SCHED
@@ -4148,7 +4161,7 @@ void move_queued_task_locked(struct rq *
 static inline
 bool task_is_pushable(struct rq *rq, struct task_struct *p, int cpu)
 {
-	if (!task_on_cpu(rq, p) &&
+	if (!task_on_cpu(rq, p) && !task_on_core(rq, p) &&
 	    cpumask_test_cpu(cpu, &p->cpus_mask))
 		return true;
 


