Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15034BD370
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017791; cv=none; b=Ac9T4j1qi4PvvoD2xpr6DY8b+4lbaMD8U/EJyqVeq3wvaTzPsq+HjuO12Bht9pdgRTcj8FNJyUz9g6ez94m8JpYyLaXvnLLnQfKDVFuuZsvMmBHMCpMXpicsqzbLjT7DChxpdcGWHNmg98wTFxFzrFfRW13GAr6SkqVFIMVS4xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017791; c=relaxed/simple;
	bh=EZoYzXQPXdyFKTiPzoiAI99j3Ti9QUPKVhQ8aiGcbMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gE8IYfHAG6tcXqCkveAqeUrDeo5HOCFwXAdHDVxq7ocnpwI/D07lchIzDIHMHct5LGC1zv+gkbfKzGFywX2eRgECBISBWJDq2V9BP1+YNCXM8GDsds4hCPOtijbpU/91rihNKiMhU6T3ramO30go9nh7nf9PM/dJl/+9RNq/HFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=P/WnryW0; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="P/WnryW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1792017136;
	bh=EZoYzXQPXdyFKTiPzoiAI99j3Ti9QUPKVhQ8aiGcbMI=;
	h=From:Date:Subject:To:Cc:From;
	b=P/WnryW01x4sVMPKXShsWbxjaRK2wbMzd0ta55+PApYIaZ35w2eFkKTb89QnWLyEj
	 7wqP2uuoQ31It6YJyoVUduBbPJhrB6kvAnW5iuh08IyWJJZXpHxZ3VbkkouXCJtqf5
	 FKEENO54GGepRXXt2SCnYLSCrMuwOebZ7MUCt4k8=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id 76A0840112;
	Wed, 14 Oct 2026 15:32:16 -0700 (PDT)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Wed, 14 Oct 2026 15:32:10 -0700
Subject: [PATCH v2] sched/rt,dl: Remove unreachable migration-disabled push
 checks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-sched-rt-dead-md-push-v2-1-9f57f1a530dc@gentwo.org>
X-B4-Tracking: v=1; b=H4sIAOkC0GoC/4WNQQ6DIBBFr2Jm3WkAtVJXvUfjQmEQFgUDlrYx3
 r3UC3T5XvLf3yBRdJSgrzaIlF1ywRcQpwqUHf1M6HRhEExcOOMNJmVJY1xR06jxoXF5JotKyqn
 pVE3CMCjbJZJx76N7Hwpbl9YQP8dN5j/7r5g5cmzNtWu7iWol2W0mv77COcQZhn3fv5Y/P++7A
 AAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792017136; l=5021;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=EZoYzXQPXdyFKTiPzoiAI99j3Ti9QUPKVhQ8aiGcbMI=;
 b=yi9KNuzmFFDqeV90yItmddrxB5HVzSvGD4GXaZrzSens0ZVNokGy+4MEn1dOi6tP3ovumNd4u
 d/Zxl+2cUcnB4tupJ5d+D9kk4b3GzoroHv5uyiptaoLjobNaRXsm6M1
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

push_rt_task() and push_dl_task() select their candidates with
pick_next_pushable_task() and pick_next_pushable_dl_task(),
respectively. Both helpers skip migration-disabled tasks.

The source rq lock is held after candidate selection. The selected task
is queued, not executing, and cannot enter a migration-disabled region
while that lock is held.

find_lock_lowest_rq() and find_lock_later_rq() can drop the source rq
lock. If that happens, they recheck is_migration_disabled() after
reacquiring the locks and reject a task that changed state. Their
callers then either exit or retry with a task selected by the same
helper, which again excludes migration-disabled tasks.

The migration-disabled fallback in push_rt_task() and the corresponding
check in push_dl_task() are therefore unreachable. Remove them. The RT
fallback is the only user of the @pull argument, so remove that
argument too.

This does not change the migration-disabled handling in pull_rt_task()
or pull_dl_task(), which use different candidate selectors and retain
their existing donor-push recovery.

Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
Tested on 80-core SMP, non-SMT Ampere Altra system:

  - Built and booted with CONFIG_IRQ_WORK=y.
  - Ran repeated SCHED_FIFO affinity changes among CPUs 78 and 79 with
    RT_PUSH_IPI enabled and disabled; both runs completed and cleaned
    up all worker tasks.
  - With RT_PUSH_IPI enabled, function tracing confirmed repeated
    execution of rto_push_irq_work_func() via irq_work_single().

Changes in v2:
  - Also remove the unreachable migration-disabled check in push_dl_task().
  - Clarify that both push paths exclude migration-disabled tasks.

Link to v1: https://lore.kernel.org/r/20261014-sched-rt-dead-md-push-v1-1-5f9757be3c80@gentwo.org
---
 kernel/sched/deadline.c |  3 ---
 kernel/sched/rt.c       | 48 +++---------------------------------------------
 2 files changed, 3 insertions(+), 48 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 0663c00c41c04213fda2ebaf16a0bdf34e0849a8..e9d952853f14aaf48cdca6f89135090adee5f6ba 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3158,9 +3158,6 @@ static int push_dl_task(struct rq *rq)
 		return 0;
 	}
 
-	if (is_migration_disabled(next_task))
-		return 0;
-
 	if (WARN_ON(next_task == rq->curr))
 		return 0;
 
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

