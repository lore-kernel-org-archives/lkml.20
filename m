Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE9441F375
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433733; cv=none; b=hw5q9v1tJRF+LETvU2EcdxgslC1X/1HVkZcRpTQMDUeQOsfNd+CpZMcejVZ0U0o3Cq3DXONVUrAWVrG+v0nbjegYhGbKTW9+JKaNuXIi7nGG05E+6gunJC/EQFW7Up/sX4CqrU13wRg0HL0tZMeKGbaRol2Tk4WK5ZLA99KU20I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433733; c=relaxed/simple;
	bh=9Hq3rOhXNPgGYBCZf6iLBoKs3YTsBkkSC976GeTbQKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H/YUHEDHjz8bWKoAB8dmaLqNfJEYUJVT3UxlvH6+0ggOCn7MtUTV13R9is/6dsQAun9qc8WVIdYbwimqga/hoLr9wLEIK5a3nf4GyHsl5Zq6gPsZPNXVYLi30mI2sz4wv72I7UxIhSZBa9aFAyEotjCL6+Wk+KdNgau52Qw+EuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eMsAuqxI; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eMsAuqxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=W7
	uxPsg2yV1Kc5xnwOKfzi77adFCBaHqSznqh8m176A=; b=eMsAuqxIhPF4EAd3gk
	K2tTqacCtYl/y7Y3K9QnTvLRaWgtiyrVawS7jhAmv4Nlh2098AOQV2aK9PcUnh5Z
	WXjW4tiVfd4yo0vMzaC/Vyg9/hgQmCab94cDddIX6EipCknjr64GnCG+3x5p9exh
	pPPIUX+1/3V4VuwbFDKL9Ym3M=
Received: from localhost (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgBXZR3gVJlq0nm0Pg--.54365S2;
	Thu, 03 Sep 2026 19:07:13 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	John Stultz <jstultz@google.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH] sched/cputime: Account cgroup fields to the scheduling context
Date: Thu,  3 Sep 2026 19:07:12 +0800
Message-ID: <5733b51108eda90c1bda98a68d58b5e6ccbc24ec.1788433334.git.sh_def@163.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgBXZR3gVJlq0nm0Pg--.54365S2
X-Coremail-Antispam: 1Uf129KBjvAXoWfGFyxAF1Dur1kAryrtr4rGrg_yoW8JF4fGo
	WkK3Wvvr1DXwnrJ3ykJF4ktF9xu3yUKryDZFWIkr15Wa17G395Ww47Kw1YqF13Xr1Y9a4U
	uFyI9ay3Zr48Ja1kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRQZ2-UUUUU
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwQFOrWqZVOHacAAA3P

Proxy execution separates the scheduling context from the execution
context. Scheduler runtime accounting charges cgroup time to the donor,
while tick and vtime accounting use the execution task when updating
cgroup fields.

When the donor and execution task belong to different cgroups, this can
charge cpu.stat usage to the donor cgroup while charging cpu.stat user
and system fields to the execution task's cgroup.

Before this fix, a reproducer with donor and execution tasks in separate
cgroups showed the donor cgroup gaining usage time while the execution
cgroup gained system time.

Account cgroup fields to the scheduling context as well. Separate
per-CPU cpustat accounting from cgroup field accounting so the former
continues to follow the execution context while the latter follows the
scheduling context.

Keep a per-rq cputime owner so delayed virtual cputime accounting is
charged to the scheduling context that owned the interval.

A wakeup can reset rq->donor while holding an rq lock. If the reset is
remote or occurs outside task context, defer the cputime boundary until
the target CPU next enters the scheduler. This avoids accessing remote
or interrupt-context vtime and per-CPU cpustat state. Hold a reference
to the old cputime owner while the deferred boundary is pending.

Keep CPU cpustat classification based on the execution task and cgroup
field classification based on the accounting owner, including nice_usec.
Generic vtime residuals are flushed at proxy boundaries so they cannot
span two scheduling contexts.

Leave per-task, thread-group, and force-idle accounting unchanged.

Tested: proxy execution cgroup reproducer with
CONFIG_SCHED_PROXY_EXEC=y and CONFIG_VIRT_CPU_ACCOUNTING_GEN=y.
Tested: CONFIG_SCHED_PROXY_EXEC=y with CONFIG_VIRT_CPU_ACCOUNTING=n.
Built with CONFIG_SCHED_PROXY_EXEC=n and CONFIG_VIRT_CPU_ACCOUNTING_GEN=y.

Fixes: aa4f74dfd42b ("sched: Fix runtime accounting w/ split exec & sched contexts")
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/core.c    |  17 ++++
 kernel/sched/cputime.c | 189 +++++++++++++++++++++++++++++++++++++----
 kernel/sched/sched.h   |   8 ++
 3 files changed, 197 insertions(+), 17 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f78275192036..43c09110cc98 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3759,6 +3759,11 @@ static inline void proxy_reset_donor(struct rq *rq)
 {
 	WARN_ON_ONCE(rq->donor == rq->curr);
 
+	/* Establish the cputime boundary locally from task context. */
+	if (rq == this_rq() && in_task())
+		sched_cputime_donor_changed(rq, rq->curr);
+	else
+		sched_cputime_donor_defer(rq);
 	put_prev_set_next_task(rq, rq->donor, rq->curr);
 	rq_set_donor(rq, rq->curr);
 	zap_balance_callbacks(rq);
@@ -5363,6 +5368,10 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	 */
 	prev_state = READ_ONCE(prev->__state);
 	vtime_task_switch(prev);
+#ifdef CONFIG_SCHED_PROXY_EXEC
+	if (sched_proxy_exec())
+		sched_cputime_switch(rq, prev);
+#endif
 	perf_event_task_sched_in(prev, current);
 	finish_task(prev);
 	tick_nohz_task_switch();
@@ -7227,6 +7236,11 @@ static void __sched notrace __schedule(int sched_mode)
 keep_resched:
 	rq->last_seen_need_resched_ns = 0;
 
+#ifdef CONFIG_SCHED_PROXY_EXEC
+	if (prev == next && sched_proxy_exec())
+		sched_cputime_donor_changed(rq, rq->donor);
+#endif
+
 	is_switch = prev != next;
 	if (likely(is_switch)) {
 		rq->nr_switches++;
@@ -8326,6 +8340,9 @@ void __init init_idle(struct task_struct *idle, int cpu)
 
 	rq->idle = idle;
 	rq_set_donor(rq, idle);
+#ifdef CONFIG_SCHED_PROXY_EXEC
+	rq->cputime_donor = idle;
+#endif
 	rcu_assign_pointer(rq->curr, idle);
 	idle->on_rq = TASK_ON_RQ_QUEUED;
 	idle->on_cpu = 1;
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 06bddaa738e5..5cda78496c23 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -103,17 +103,29 @@ static u64 irqtime_tick_accounted(u64 dummy)
 
 #endif /* !CONFIG_IRQ_TIME_ACCOUNTING */
 
-static inline void task_group_account_field(struct task_struct *p, int index,
-					    u64 tmp)
+static inline struct task_struct *cgroup_account_task(struct task_struct *p)
+{
+#ifdef CONFIG_SCHED_PROXY_EXEC
+	struct task_struct *donor;
+
+	/* Cgroup fields follow the scheduling context, not the execution task. */
+	if (sched_proxy_exec()) {
+		donor = this_rq()->cputime_donor;
+		if (donor)
+			return donor;
+	}
+#endif
+	return p;
+}
+
+static inline void account_cpustat_field(int index, u64 tmp)
 {
-	/*
-	 * Since all updates are sure to touch the root cgroup, we
-	 * get ourselves ahead and touch it first. If the root cgroup
-	 * is the only cgroup, then nothing else should be necessary.
-	 *
-	 */
 	__this_cpu_add(kernel_cpustat.cpustat[index], tmp);
+}
 
+static inline void account_cgroup_field(struct task_struct *p, int index,
+					u64 tmp)
+{
 	cgroup_account_cputime_field(p, index, tmp);
 }
 
@@ -124,16 +136,23 @@ static inline void task_group_account_field(struct task_struct *p, int index,
  */
 void account_user_time(struct task_struct *p, u64 cputime)
 {
-	int index;
+	struct task_struct *cgroup_task = cgroup_account_task(p);
+	int index, cgroup_index;
 
 	/* Add user time to process. */
 	p->utime += cputime;
 	account_group_user_time(p, cputime);
 
 	index = (task_nice(p) > 0) ? CPUTIME_NICE : CPUTIME_USER;
+	if (cgroup_task == p)
+		cgroup_index = index;
+	else
+		cgroup_index = (task_nice(cgroup_task) > 0) ?
+			CPUTIME_NICE : CPUTIME_USER;
 
-	/* Add user time to cpustat. */
-	task_group_account_field(p, index, cputime);
+	/* Add user time to cpustat and the cgroup. */
+	account_cpustat_field(index, cputime);
+	account_cgroup_field(cgroup_task, cgroup_index, cputime);
 
 	/* Account for user time used */
 	acct_account_cputime(p);
@@ -146,7 +165,9 @@ void account_user_time(struct task_struct *p, u64 cputime)
  */
 void account_guest_time(struct task_struct *p, u64 cputime)
 {
+	struct task_struct *cgroup_task = cgroup_account_task(p);
 	u64 *cpustat = kcpustat_this_cpu->cpustat;
+	int index, cgroup_index;
 
 	/* Add guest time to process. */
 	p->utime += cputime;
@@ -154,11 +175,19 @@ void account_guest_time(struct task_struct *p, u64 cputime)
 	p->gtime += cputime;
 
 	/* Add guest time to cpustat. */
-	if (task_nice(p) > 0) {
-		task_group_account_field(p, CPUTIME_NICE, cputime);
+	index = (task_nice(p) > 0) ? CPUTIME_NICE : CPUTIME_USER;
+	if (cgroup_task == p)
+		cgroup_index = index;
+	else
+		cgroup_index = (task_nice(cgroup_task) > 0) ?
+			CPUTIME_NICE : CPUTIME_USER;
+	if (index == CPUTIME_NICE) {
+		account_cpustat_field(index, cputime);
+		account_cgroup_field(cgroup_task, cgroup_index, cputime);
 		cpustat[CPUTIME_GUEST_NICE] += cputime;
 	} else {
-		task_group_account_field(p, CPUTIME_USER, cputime);
+		account_cpustat_field(index, cputime);
+		account_cgroup_field(cgroup_task, cgroup_index, cputime);
 		cpustat[CPUTIME_GUEST] += cputime;
 	}
 }
@@ -172,12 +201,15 @@ void account_guest_time(struct task_struct *p, u64 cputime)
 void account_system_index_time(struct task_struct *p,
 			       u64 cputime, enum cpu_usage_stat index)
 {
+	struct task_struct *cgroup_task = cgroup_account_task(p);
+
 	/* Add system time to process. */
 	p->stime += cputime;
 	account_group_system_time(p, cputime);
 
-	/* Add system time to cpustat. */
-	task_group_account_field(p, index, cputime);
+	/* Add system time to cpustat and the cgroup. */
+	account_cpustat_field(index, cputime);
+	account_cgroup_field(cgroup_task, index, cputime);
 
 	/* Account for system time used */
 	acct_account_cputime(p);
@@ -245,7 +277,8 @@ void __account_forceidle_time(struct task_struct *p, u64 delta)
 {
 	__schedstat_add(p->stats.core_forceidle_sum, delta);
 
-	task_group_account_field(p, CPUTIME_FORCEIDLE, delta);
+	account_cpustat_field(CPUTIME_FORCEIDLE, delta);
+	account_cgroup_field(p, CPUTIME_FORCEIDLE, delta);
 }
 #endif /* CONFIG_SCHED_CORE */
 
@@ -988,6 +1021,30 @@ void vtime_task_switch_generic(struct task_struct *prev)
 	write_seqcount_end(&vtime->seqcount);
 }
 
+#if defined(CONFIG_SCHED_PROXY_EXEC)
+static void vtime_flush_pending(struct task_struct *tsk)
+{
+	struct vtime *vtime = &tsk->vtime;
+
+	write_seqcount_begin(&vtime->seqcount);
+	if (vtime->utime) {
+		account_user_time(tsk, vtime->utime);
+		vtime->utime = 0;
+	}
+
+	if (vtime->gtime) {
+		account_guest_time(tsk, vtime->gtime);
+		vtime->gtime = 0;
+	}
+
+	if (vtime->stime) {
+		account_system_time(tsk, irq_count(), vtime->stime);
+		vtime->stime = 0;
+	}
+	write_seqcount_end(&vtime->seqcount);
+}
+#endif /* CONFIG_SCHED_PROXY_EXEC */
+
 void vtime_init_idle(struct task_struct *t, int cpu)
 {
 	struct vtime *vtime = &t->vtime;
@@ -1300,3 +1357,101 @@ void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
 EXPORT_SYMBOL_GPL(kcpustat_cpu_fetch);
 
 #endif /* CONFIG_VIRT_CPU_ACCOUNTING_GEN */
+
+#ifdef CONFIG_SCHED_PROXY_EXEC
+static void __sched_cputime_release_donor(struct rq *rq)
+{
+	struct task_struct *hold = rq->cputime_donor_hold;
+
+	rq->cputime_donor_hold = NULL;
+	if (hold)
+		put_task_struct(hold);
+}
+
+static void sched_cputime_release_donor(struct rq *rq)
+{
+	lockdep_assert_rq_held(rq);
+	__sched_cputime_release_donor(rq);
+}
+
+static void sched_cputime_release_donor_switch(struct rq *rq)
+{
+	/*
+	 * The rq lock is carried across the context switch physically,
+	 * but its lockdep state has been released.
+	 */
+	lockdep_assert_irqs_disabled();
+	__sched_cputime_release_donor(rq);
+}
+
+void sched_cputime_donor_defer(struct rq *rq)
+{
+	lockdep_assert_rq_held(rq);
+
+	if (rq->cputime_donor_hold)
+		WARN_ON_ONCE(rq->cputime_donor_hold != rq->cputime_donor);
+	if (rq->cputime_donor_hold)
+		return;
+
+	get_task_struct(rq->cputime_donor);
+	rq->cputime_donor_hold = rq->cputime_donor;
+}
+
+void sched_cputime_donor_changed(struct rq *rq,
+				 struct task_struct *new_donor)
+{
+	lockdep_assert_rq_held(rq);
+
+	if (rq->cputime_donor == new_donor) {
+		sched_cputime_release_donor(rq);
+		return;
+	}
+
+	/* Commit the current interval before changing its cgroup owner. */
+	if (!sched_proxy_exec())
+		goto update_owner;
+
+	if (is_idle_task(rq->curr))
+		goto update_owner;
+
+#ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
+	if (vtime_accounting_enabled_this_cpu()) {
+		vtime_account_kernel(rq->curr);
+		vtime_flush_pending(rq->curr);
+	}
+#elif defined(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE)
+	vtime_account_kernel(rq->curr);
+	vtime_flush(rq->curr);
+#endif
+
+update_owner:
+	rq->cputime_donor = new_donor;
+	sched_cputime_release_donor(rq);
+}
+
+void sched_cputime_switch(struct rq *rq, struct task_struct *prev)
+{
+	/* The rq lock is carried across the context switch physically. */
+	lockdep_assert_irqs_disabled();
+
+	/* rq->donor already names the next scheduling context here. */
+	if (!sched_proxy_exec())
+		goto update_owner;
+
+#ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
+	if (vtime_accounting_enabled_this_cpu()) {
+		if (rq->cputime_donor != prev)
+			vtime_flush_pending(prev);
+
+		if (rq->donor != current) {
+			rq->cputime_donor = current;
+			vtime_flush_pending(current);
+		}
+	}
+#endif
+
+update_owner:
+	rq->cputime_donor = rq->donor;
+	sched_cputime_release_donor_switch(rq);
+}
+#endif /* CONFIG_SCHED_PROXY_EXEC */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e656c7059bf8..bb268e8160c7 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1175,6 +1175,10 @@ struct rq {
 #ifdef CONFIG_SCHED_PROXY_EXEC
 	struct task_struct __rcu	*donor;  /* Scheduling context */
 	struct task_struct __rcu	*curr;   /* Execution context */
+	/* Cgroup cputime owner; lags donor while the previous task is flushed. */
+	struct task_struct	*cputime_donor;
+	/* Reference held while a remote donor change awaits local accounting. */
+	struct task_struct	*cputime_donor_hold;
 #else
 	union {
 		struct task_struct __rcu *donor; /* Scheduler context */
@@ -1466,6 +1470,10 @@ static inline bool available_idle_cpu(int cpu)
 }
 
 #ifdef CONFIG_SCHED_PROXY_EXEC
+void sched_cputime_donor_changed(struct rq *rq, struct task_struct *new_donor);
+void sched_cputime_donor_defer(struct rq *rq);
+void sched_cputime_switch(struct rq *rq, struct task_struct *prev);
+
 static inline void rq_set_donor(struct rq *rq, struct task_struct *t)
 {
 	rcu_assign_pointer(rq->donor, t);
-- 
2.54.0

