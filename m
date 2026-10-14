Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02D8480DED
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792012898; cv=none; b=WGbhcCQmr+LztDAp/sBoDZI8hRhU6w/k6GRhzJ6W2aY4z8EWW8pQIxartgKL1Gfsp/YEuMfGAgl8snQZURyOCM6QQMtt54J4Jzn/oCSrFL4ltr8uwog5kxcTAlPIouazBIgavzsUnHc1k4UyWaJnX1qjXZf+fo3FpZHcqYUYfl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792012898; c=relaxed/simple;
	bh=Z5sBfGJfFUHq6SrNoKo9ClbQsjhf0q8HrKf8iTnITIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OyBQdlxpzE70iHmKiHzazMhTKo6rdPC33cxbapfDtgBaYJ2BJKHsdBfv5MUGXOam9CPnHUkR5eC2zOYITEOX+Sb5pYFsCRkZPlxpGqga3ct179rYFFisfs6e1m+VFTa3NUFRH1NqcSIPnyg4YPt90WsqHIrK41zj6LC0acKCqAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=S8RvbXiG; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="S8RvbXiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1792012889;
	bh=Z5sBfGJfFUHq6SrNoKo9ClbQsjhf0q8HrKf8iTnITIY=;
	h=From:Date:Subject:To:Cc:From;
	b=S8RvbXiGBH1mKNLo8BhDXeN4WunjOmaRB5r8L7K4eT+6JBDBY1A9jREoG6Qk93NsC
	 b0HNNeJt96gDvCLjxf4P5qcwINF307OZw7xI7HwGTHjHeMmZ3Z+8GRtdzMV4Egucrh
	 a4Q/3HA5/Bm+zWzbXjLe8Kb5ZZmspjtKJSYxf/TY=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id 98F6040112;
	Wed, 14 Oct 2026 14:21:29 -0700 (PDT)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Wed, 14 Oct 2026 14:21:02 -0700
Subject: [PATCH] sched/rt: Remove unreachable migration-disabled push path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-sched-rt-dead-md-push-v1-1-5f9757be3c80@gentwo.org>
X-B4-Tracking: v=1; b=H4sIAD3yz2oC/x3MPQqAMAxA4atIZgNtFRWvIg7aRJvBHxoVQby7x
 fEb3ntAOQortNkDkS9R2dYEm2fgw7DOjELJ4IyrrLElqg9MGA8kHggXwv3UgL5pxrL2BbvJQGr
 3yJPc/7fr3/cDnHMtAGcAAAA=
X-Change-ID: 20261014-sched-rt-dead-md-push-c88b47c3e2f0
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: linux-kernel@vger.kernel.org, 
 "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792012889; l=4258;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=Z5sBfGJfFUHq6SrNoKo9ClbQsjhf0q8HrKf8iTnITIY=;
 b=TCYAQYgC7cFcpAIeciy+717vbbYFgMTf1YuFuq0Zodr4w9xLDi/Ko/tbeQhScS6CLnFmJazfq
 CEVvQgdeATNAw27PN8yKbR58w5vMaxXf6fHJ5BrtCdSXvgu+xi/odF5
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

push_rt_task() selects next_task with pick_next_pushable_task().
That helper does not return migration-disabled tasks.

The relevant path is:

    push_rt_task()
      next_task = pick_next_pushable_task()
      is_migration_disabled(next_task)
      find_lock_lowest_rq(next_task)

Before the migration-disabled check, rq->lock is held, so the selected
queued task cannot run and change its migration-disabled state.

find_lock_lowest_rq() can temporarily drop rq->lock. If that happens,
it rechecks is_migration_disabled(task) after reacquiring the locks and
rejects the task if it changed state. push_rt_task() then consults
pick_next_pushable_task() again; it either exits or retries only a task
returned by that helper.

The migration-disabled branch in push_rt_task() is therefore
unreachable. Remove it along with the @pull argument, which exists only
for that branch.

This does not change the migration-disabled handling in pull_rt_task(),
which uses pick_highest_pushable_task() and retains its existing
donor-push recovery.

Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
Tested on 80-core SMP, non-SMT Ampere Altra system:

  - Built and booted with CONFIG_IRQ_WORK=y.
  - Ran repeated SCHED_FIFO affinity changes among CPUs 78 and 79 with
    RT_PUSH_IPI enabled and disabled; both runs completed and cleaned
    up all worker tasks.
  - With RT_PUSH_IPI enabled, function tracing confirmed repeated
    execution of rto_push_irq_work_func() via irq_work_single().
---
 kernel/sched/rt.c | 48 +++---------------------------------------------
 1 file changed, 3 insertions(+), 45 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 85303add726df4c2da846c427aab2d627fca9589..f85edc6f896c72d2251b5eb59ee7ffd0e23934f5 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1957,7 +1957,7 @@ static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
  * running task can migrate over to a CPU that is running a task
  * of lesser priority.
  */
-static int push_rt_task(struct rq *rq, bool pull)
+static int push_rt_task(struct rq *rq)
 {
 	struct task_struct *next_task;
 	struct rq *lowest_rq;
@@ -1981,48 +1981,6 @@ static int push_rt_task(struct rq *rq, bool pull)
 		return 0;
 	}
 
-	if (is_migration_disabled(next_task)) {
-		struct task_struct *push_task = NULL;
-		int cpu;
-
-		if (!pull || rq->push_busy)
-			return 0;
-
-		/*
-		 * Invoking find_lowest_rq() on anything but an RT task doesn't
-		 * make sense. Per the above priority check, curr has to
-		 * be of higher priority than next_task, so no need to
-		 * reschedule when bailing out.
-		 *
-		 * Note that the stoppers are masqueraded as SCHED_FIFO
-		 * (cf. sched_set_stop_task()), so we can't rely on rt_task().
-		 */
-		if (rq->donor->sched_class != &rt_sched_class)
-			return 0;
-
-		cpu = find_lowest_rq(rq->curr);
-		if (cpu == -1 || cpu == rq->cpu)
-			return 0;
-
-		/*
-		 * Given we found a CPU with lower priority than @next_task,
-		 * therefore it should be running. However we cannot migrate it
-		 * to this other CPU, instead attempt to push the current
-		 * running task on this CPU away.
-		 */
-		push_task = get_push_task(rq);
-		if (push_task) {
-			preempt_disable();
-			raw_spin_rq_unlock(rq);
-			stop_one_cpu_nowait(rq->cpu, push_cpu_stop,
-					    push_task, &rq->push_work);
-			preempt_enable();
-			raw_spin_rq_lock(rq);
-		}
-
-		return 0;
-	}
-
 	if (WARN_ON(next_task == rq->curr))
 		return 0;
 
@@ -2078,7 +2036,7 @@ static int push_rt_task(struct rq *rq, bool pull)
 static void push_rt_tasks(struct rq *rq)
 {
 	/* push_rt_task will return true if it moved an RT */
-	while (push_rt_task(rq, false))
+	while (push_rt_task(rq))
 		;
 }
 
@@ -2236,7 +2194,7 @@ void rto_push_irq_work_func(struct irq_work *work)
 	 */
 	if (has_pushable_tasks(rq)) {
 		raw_spin_rq_lock(rq);
-		while (push_rt_task(rq, true))
+		while (push_rt_task(rq))
 			;
 		raw_spin_rq_unlock(rq);
 	}

---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261014-sched-rt-dead-md-push-c88b47c3e2f0

Best regards,
-- 
Shubhang Kaushik (Ampere) <sh@gentwo.org>

