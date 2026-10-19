Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9E440BCBB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406894; cv=none; b=aMAFQwSfrB93JY4LZMP9SFphS3Iyljix2Lc8n2FQgLBf/HYE3T+0tILocESxvtMHZhN+zm3LC5JgBszYEcAorb0i6yC8U5UBcfxOdRaSV0z4aB6MBbt97JOqKA6rC5qylAMl/H1Iz9SuhSAEmuXkn7RCs0H1y7f7eHMN7MPVmcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406894; c=relaxed/simple;
	bh=EHRsBuc14/lIkrBEemRCG/3MCGJQgCbWeCkTS8QBP0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B71NfxVtu8Hl4PGKNP/bvEE3l+1ivL7eNntTdgFOy8FM5XIfZmTiYADSZaOuG67yT2xaQ0SeJHIRR2rsjAut3tttyKj5Gr3M1JBNafa6ZRcZeljiZLDYgoybYY9pR32YGJV11zTWSwFxrbGaU7BH1l7ZSzLAS0AttwON7/jEZMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mvs4+ofh; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mvs4+ofh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=bC
	Xl7cve3CAIbrfRCz01nACwtiYINjYCSZOPwpBbyKI=; b=mvs4+ofh08/HLvK9hu
	RpdXneXK6ddQnbDv6n3MFg66hpFF8PfQMF524vBLdXfTdLwk7xv3rgaplJ5o9mv2
	WMQEdjjUAs34axFvC1lLcERU7BFqviox6dKZaj1hZZiiCZIK+zV9MOdlMOmjJU5q
	mQl1d8uSyJ6weTW3VQSegPBgQ=
Received: from localhost (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAHnyUm9dVqQncjAw--.31350S2;
	Mon, 19 Oct 2026 18:47:03 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: hannes@cmpxchg.org,
	surenb@google.com,
	peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	sh_def@163.com
Subject: [PATCH 2/2] sched/psi: Deliver pending RT poll events after polling expires
Date: Mon, 19 Oct 2026 19:46:59 +0900
Message-ID: <20261019104700.3296133-3-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019104700.3296133-1-sh_def@163.com>
References: <20261019104700.3296133-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgAHnyUm9dVqQncjAw--.31350S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtF4xZFW3uFyrJF48Gr45KFg_yoWfZr18pa
	98Cry7Gr48Jry2vFZ5W3WFvryFqwn7J39rtrWxAw1kG3WaqryrtFyYyr15t3y3CFW3CF10
	yFs0y3srKr47tF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piWrW5UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6QeW9WrV9SffmgAA3l

A PSI real-time trigger can defer a threshold notification until its
rate-limit window ends. If pressure stops or the polling window expires
before then, the rtpoll worker can become idle without delivering it.

Compute pending deadlines from the trigger list when reinitializing or
scheduling passive polling. This avoids a duplicate group-level cache while
preserving pending trigger windows without reprocessing consumed samples.
Return to idle once the pending notification is delivered and no pressure
remains.

Fixes: e6df4ead85d9 ("psi: fix possible trigger missing in the window")
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/psi.c | 176 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 136 insertions(+), 40 deletions(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 733ecacc2adb4..27b5473122f15 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -461,13 +461,14 @@ static u64 window_update(struct psi_window *win, u64 now, u64 value)
 	return growth;
 }
 
-static void update_triggers(struct psi_group *group, u64 now,
-						   enum psi_aggregators aggregator)
+static u64 update_triggers(struct psi_group *group, u64 now,
+			   enum psi_aggregators aggregator)
 {
 	struct psi_trigger *t;
 	u64 *total = group->total[aggregator];
 	struct list_head *triggers;
 	u64 *aggregator_total;
+	u64 pending_deadline = ULLONG_MAX;
 
 	if (aggregator == PSI_AVGS) {
 		triggers = &group->avg_triggers;
@@ -507,8 +508,10 @@ static void update_triggers(struct psi_group *group, u64 now,
 			}
 		}
 		/* Limit event signaling to once per window */
-		if (now < t->last_event_time + t->win.size)
+		if (now < t->last_event_time + t->win.size) {
+			pending_deadline = min(pending_deadline, t->last_event_time + t->win.size);
 			continue;
+		}
 
 		/* Generate an event */
 		if (cmpxchg(&t->event, 0, 1) == 0) {
@@ -521,6 +524,21 @@ static void update_triggers(struct psi_group *group, u64 now,
 		/* Reset threshold breach flag once event got generated */
 		t->pending_event = false;
 	}
+
+	return pending_deadline;
+}
+
+static u64 psi_next_pending_rtpoll_deadline(struct psi_group *group)
+{
+	struct psi_trigger *t;
+	u64 deadline = ULLONG_MAX;
+
+	list_for_each_entry(t, &group->rtpoll_triggers, node) {
+		if (t->pending_event)
+			deadline = min(deadline, t->last_event_time + t->win.size);
+	}
+
+	return deadline;
 }
 
 static u64 update_averages(struct psi_group *group, u64 now)
@@ -623,6 +641,28 @@ static void init_rtpoll_triggers(struct psi_group *group, u64 now)
 	group->rtpoll_next_update = now + group->rtpoll_min_period;
 }
 
+static void psi_rtpoll_reinit_triggers(struct psi_group *group, u64 now)
+{
+	struct psi_trigger *t;
+
+	if (psi_next_pending_rtpoll_deadline(group) == ULLONG_MAX) {
+		init_rtpoll_triggers(group, now);
+		return;
+	}
+
+	/* Rebase expired windows without consuming the current sample. */
+	list_for_each_entry(t, &group->rtpoll_triggers, node) {
+		if (t->pending_event || now - t->win.start_time <= t->win.size)
+			continue;
+
+		/* Preserve the sample without rewinding a newer registration baseline. */
+		window_reset(&t->win, now,
+			     max(t->win.start_value,
+				 group->rtpoll_total[t->state]), 0);
+	}
+	group->rtpoll_next_update = now;
+}
+
 /* Schedule rtpolling if it's not already scheduled or forced. */
 static void psi_schedule_rtpoll_work(struct psi_group *group, unsigned long delay,
 				   bool force)
@@ -646,46 +686,77 @@ static void psi_schedule_rtpoll_work(struct psi_group *group, unsigned long dela
 		atomic_set(&group->rtpoll_scheduled, 0);
 }
 
+static bool psi_rtpoll_has_active_states(struct psi_group *group)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		struct psi_group_cpu *groupc = per_cpu_ptr(group->pcpu, cpu);
+		unsigned int seq;
+		u32 state_mask;
+
+		do {
+			seq = psi_read_begin(cpu);
+			state_mask = groupc->state_mask;
+		} while (psi_read_retry(cpu, seq));
+
+		if (state_mask & group->rtpoll_states)
+			return true;
+	}
+
+	return false;
+}
+
+static void psi_schedule_rtpoll_passive(struct psi_group *group, u64 deadline,
+					u64 now)
+{
+	u32 changed_states;
+	unsigned long delay;
+
+	group->rtpoll_until = now;
+	group->rtpoll_next_update = deadline;
+	delay = deadline > now ? nsecs_to_jiffies(deadline - now) + 1 : 1;
+	psi_schedule_rtpoll_work(group, delay, true);
+	/* Let a new state change replace this timer with an immediate poll. */
+	atomic_set(&group->rtpoll_scheduled, 0);
+	/* Pair with task-side atomic_xchg() before sampling per-CPU state. */
+	smp_mb();
+
+	/* Pair with state changes that raced the transition to the deadline timer. */
+	collect_percpu_times(group, PSI_POLL, &changed_states);
+	if (!(changed_states & group->rtpoll_states) &&
+	    !psi_rtpoll_has_active_states(group))
+		return;
+
+	now = sched_clock();
+	psi_rtpoll_reinit_triggers(group, now);
+	group->rtpoll_until = now + group->rtpoll_min_period * UPDATES_PER_WINDOW;
+	psi_schedule_rtpoll_work(group,
+				 nsecs_to_jiffies(group->rtpoll_min_period) + 1,
+				 false);
+}
+
 static void psi_rtpoll_work(struct psi_group *group)
 {
 	bool force_reschedule = false;
+	bool rtpoll_expired;
 	u32 changed_states, sampled_states;
-	u64 now;
+	u64 now, pending_deadline;
 
 	mutex_lock(&group->rtpoll_trigger_lock);
 
 	now = sched_clock();
+	rtpoll_expired = now > group->rtpoll_until;
 
-	if (now > group->rtpoll_until) {
+	if (rtpoll_expired) {
 		/*
-		 * We are either about to start or might stop rtpolling if no
-		 * state change was recorded. Resetting rtpoll_scheduled leaves
-		 * a small window for psi_group_change to sneak in and schedule
-		 * an immediate rtpoll_work before we get to rescheduling. One
-		 * potential extra wakeup at the end of the rtpolling window
-		 * should be negligible and rtpoll_next_update still keeps
-		 * updates correctly on schedule.
+		 * Resetting rtpoll_scheduled leaves a small window for a task
+		 * change to race with this worker. The barrier pairs with the
+		 * atomic_xchg() in psi_schedule_rtpoll_work(): either this worker
+		 * observes the state change, or the task change schedules the worker.
 		 */
 		atomic_set(&group->rtpoll_scheduled, 0);
-		/*
-		 * A task change can race with the rtpoll worker that is supposed to
-		 * report on it. To avoid missing events, ensure ordering between
-		 * rtpoll_scheduled and the task state accesses, such that if the
-		 * rtpoll worker misses the state update, the task change is
-		 * guaranteed to reschedule the rtpoll worker:
-		 *
-		 * rtpoll worker:
-		 *   atomic_set(rtpoll_scheduled, 0)
-		 *   smp_mb()
-		 *   LOAD states
-		 *
-		 * task change:
-		 *   STORE states
-		 *   if atomic_xchg(rtpoll_scheduled, 1) == 0:
-		 *     schedule rtpoll worker
-		 *
-		 * The atomic_xchg() implies a full barrier.
-		 */
+		/* Pair with task-side atomic_xchg() before sampling per-CPU state. */
 		smp_mb();
 	} else {
 		/* The rtpolling window is not over, keep rescheduling */
@@ -699,9 +770,8 @@ static void psi_rtpoll_work(struct psi_group *group)
 	changed_states |= sampled_states;
 
 	if (changed_states & group->rtpoll_states) {
-		/* Initialize trigger windows when entering rtpolling mode */
-		if (now > group->rtpoll_until)
-			init_rtpoll_triggers(group, now);
+		if (rtpoll_expired)
+			psi_rtpoll_reinit_triggers(group, now);
 
 		/*
 		 * Keep the monitor active for at least the duration of the
@@ -712,17 +782,42 @@ static void psi_rtpoll_work(struct psi_group *group)
 			group->rtpoll_min_period * UPDATES_PER_WINDOW;
 	}
 
-	if (now > group->rtpoll_until) {
-		group->rtpoll_next_update = ULLONG_MAX;
-		goto out;
-	}
-
 	if (now >= group->rtpoll_next_update) {
-		update_triggers(group, now, PSI_POLL);
+		pending_deadline = update_triggers(group, now, PSI_POLL);
 		memcpy(group->rtpoll_total, group->total[PSI_POLL], sizeof(group->rtpoll_total));
+
+		if (pending_deadline != ULLONG_MAX &&
+		    !(changed_states & group->rtpoll_states)) {
+			psi_schedule_rtpoll_passive(group, pending_deadline, now);
+			goto out;
+		}
+
 		group->rtpoll_next_update = now + group->rtpoll_min_period;
 	}
 
+	if (now > group->rtpoll_until) {
+		pending_deadline = psi_next_pending_rtpoll_deadline(group);
+		if (pending_deadline != ULLONG_MAX) {
+			psi_schedule_rtpoll_passive(group,
+						    pending_deadline, now);
+			goto out;
+		}
+
+		if (psi_rtpoll_has_active_states(group)) {
+			now = sched_clock();
+			init_rtpoll_triggers(group, now);
+			group->rtpoll_until = now +
+				group->rtpoll_min_period * UPDATES_PER_WINDOW;
+			psi_schedule_rtpoll_work(group,
+						 nsecs_to_jiffies(group->rtpoll_min_period) + 1,
+				 false);
+			goto out;
+		}
+
+		group->rtpoll_next_update = ULLONG_MAX;
+		goto out;
+	}
+
 	psi_schedule_rtpoll_work(group,
 		nsecs_to_jiffies(group->rtpoll_next_update - now) + 1,
 		force_reschedule);
@@ -1482,6 +1577,7 @@ void psi_trigger_destroy(struct psi_trigger *t)
 			/* Destroy rtpoll_task when the last trigger is destroyed */
 			if (group->rtpoll_states == 0) {
 				group->rtpoll_until = 0;
+				group->rtpoll_next_update = ULLONG_MAX;
 				group->rtpoll_pending_states = 0;
 				task_to_destroy = rcu_dereference_protected(
 						group->rtpoll_task,
-- 
2.55.0

