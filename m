Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4196B38CFED
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616819; cv=none; b=JqXm4cPVvL4kKugcLM6l4Z9szt2wnz7r8u4f/0u2kBgODhQINY37bog/XbfzozvmBSb44LMJW5nbyKWs+zRP4/+EN2P0lTQ2XgeR6R2ENzfAq+m05T43qpLxixVf2SCfgqqTxz4a1XcLvkOW7ZacyTgzmNys0mbTRYNAJxzh9JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616819; c=relaxed/simple;
	bh=oXxWnRS+AdfFJqDsjojKHzCcVJO8S5rnuvTS7DO7YnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AKgRAeTNWHOFi9Kj9LcNdDn1xVolZpgD0oNDz8BN59zGnCEBXHOuQLXj7QsS/uyigLQWyJrNue0C+XeNKTTApgysU5g8X2G01fQsOkSqTRj34uQw0YsFuWs18ycxoGagGq9h7hscfq3A4UJgGbRKLMO8F9/x9nz6tPWE/BhXZRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=epLnaBH5; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="epLnaBH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/5
	9agzCrPmhBck/yw6BbEltqL63IxYMentpbd6nNL1A=; b=epLnaBH509CkYc8HYU
	gSGHHQEuNiHPuAcYt6TOQ5FqSl2E0QLwR0kEdojoXe2oOqyzqo6ROtuaVD8xP//1
	kybmSQ4gEJtRKZklDNbZrPmaXiklCpEzRTG1pZ+7qToDu3SOVyOTOdMIfnhVfPJS
	r67SNYSiFEZClNGLCZ/5zoWvk=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnr1ISIJxqmAdmAw--.23231S2;
	Sat, 05 Sep 2026 21:58:44 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Tim Chen <tim.c.chen@linux.intel.com>,
	"Chen, Yu C" <yu.c.chen@intel.com>
Cc: Hui Su <sh_def@163.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	John Stultz <jstultz@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] sched/numa: Drive NUMA task tick from execution context
Date: Sat,  5 Sep 2026 21:58:43 +0800
Message-ID: <20260905135843.2818510-1-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <0d6117e597e6ca3ab3179c6304d6e5e454f53759.camel@linux.intel.com>
References: <20260903041154.2479761-1-sh_def@163.com> <20260903041154.2479761-2-sh_def@163.com> <4593a7a4-cde1-499c-bba8-2fbe24f35422@intel.com> <08f682ba75a4700694d6f94719b367b4d26c032f.camel@linux.intel.com> <20260904141017.1512404-1-sh_def@163.com> <0d6117e597e6ca3ab3179c6304d6e5e454f53759.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnr1ISIJxqmAdmAw--.23231S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3AFyrWF4xWrW8tF15uF1kAFb_yoWxWFy7pa
	98ZrW2qa1kJ3W0yFyUZrs3uFy3X3s3Jr1UXrn0kFyrCr1Yqw15tF40gF1YvFZI9rs29Fy2
	vr40v39ru3Wjq3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUx-BtUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwRTOLmqcIBQ4FgAA3Z

On Fri, Sep 4, 2026 at 1:15 PM, Tim Chen wrote:
> Yes, you have a good point. The code I proposed just look at whether
> we have consumed our allotment in the current slice.
>
> What we should have looked at is whether the donor's total run time has
> exceeded its quota when doing core scheduling. And we may happen to
> hit __entity_slice_used() at the front of the slice after advancing
> the deadline and __entity_slice_used()
> returns false instead of true, even though I have consumed more than
> my fair share when looking at longer time period across multiple slices.
>
> The accumulated run time of the donor since it was picked for running
> should be used for selection time baseline.
>
> So maybe a patch like the following instead.

Thanks for the updated prototype.

I tested the pick-time vruntime snapshot further. With a fixed weight,
it behaves as expected: it fixes the proxy case and continues to match
the existing runtime-based predicate in the non-proxy tests I ran.

I then tested it with CONFIG_FAIR_GROUP_SCHED, using nested cgroups and
changing the hierarchical weights in an observation-only setup. The
kernel computes the existing predicate, the pick-time vruntime predicate,
and a pick-time task-clock predicate on the same tick, while the existing
predicate remains the actual return value.

I think the "same weight scaling" condition in the non-proxy equivalence
is the interesting part here. If the hierarchical weight changes after
core_slice_vruntime is captured, vused represents service accumulated
since the pick-time baseline, while vslice is converted using the current
weight.

Across 11 instrumented runs I observed 5985 non-proxy samples. 29 of
those were explicitly identified as cases where the same task's
sched_entity had been reweighted after the current selection-time
baseline was taken. The existing and task-clock predicates matched in all
5985 non-proxy samples, while the vruntime predicate differed in four of
the 29 reweight-after-pick samples.

I also reproduced the divergence with actual runnable load in the
hierarchy. In one causal trace:

        selection=5
        pick_hweight=1048576
        current_hweight=15138

        reweight_vruntime=768327601->768327601

        existing:
                rtime=7980540
                used=1

        pick-time vruntime:
                vused=7980540
                vslice=145462386
                used=0

        task-clock:
                rtime=7980540
                used=1

This was the same selection: the pick-time baseline had already been
established, the hierarchical weight then changed, and there was no
new pick before the predicate was evaluated.

In this example reweight_eevdf() did not change se->vruntime, so the
divergence does not depend on a vruntime coordinate adjustment. The
weight change alone is enough for the accumulated vused and the
current-weight vslice to no longer necessarily use the same scale.

I also observed the reverse predicate direction in the observation-only
runs, although I have not yet reduced that case to the same detailed
causal trace.

One way to keep the vruntime approach would be to rebase the accumulated
virtual service whenever the relevant weight changes, preserving the
vused / vslice ratio across the reweight. Simply resetting
core_slice_vruntime at reweight time would lose service already consumed
before the reweight.

A simpler alternative I have been testing is to keep the check in the
same real-time domain as the existing predicate:

        set_next_entity():
                core_sched_start = se->exec_start;

        __entity_slice_used():
                rtime = se->exec_start - se->core_sched_start;

                return rtime * min_nr_tasks > se->slice;

update_se() advances the donor's exec_start from rq_clock_task() while
it is the scheduling context, including during proxy execution, even
though the task-level sum_exec_runtime is charged to rq->curr. This
keeps the force-idle slice check in the same real-time domain as the
existing sum_exec_runtime - prev_sum_exec_runtime comparison and avoids
converting accumulated service across weight changes.

For reference, the local task-clock variant I am testing is below. It
is not intended as a formal posting yet:

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 8b3d47a325cc..c32d9931129f 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -590,6 +590,9 @@ struct sched_entity {
 	u64				sum_exec_runtime;
 	u64				prev_sum_exec_runtime;
 	u64				vruntime;
+#ifdef CONFIG_SCHED_CORE
+	u64				core_sched_start;
+#endif
 	/* Approximated virtual lag: */
 	s64				vlag;
 	/* 'Protected' deadline, to give out minimum quantums: */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f78275192036..22ae5dc57337 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4580,6 +4580,9 @@ static void __sched_fork(u64 clone_flags, struct task_struct *p)
 	p->se.prev_sum_exec_runtime	= 0;
 	p->se.nr_migrations		= 0;
 	p->se.vruntime			= 0;
+#ifdef CONFIG_SCHED_CORE
+	p->se.core_sched_start		= 0;
+#endif
 	p->se.vlag			= 0;
 	p->se.rel_deadline		= 0;
 	INIT_LIST_HEAD(&p->se.group_node);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8dff37059faf..1bd05c906d3a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6502,6 +6502,9 @@ set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
 	}
 
 	se->prev_sum_exec_runtime = se->sum_exec_runtime;
+#ifdef CONFIG_SCHED_CORE
+	se->core_sched_start = se->exec_start;
+#endif
 }
 
 static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags);
@@ -14748,10 +14751,9 @@ static void rq_offline_fair(struct rq *rq)
 static inline bool
 __entity_slice_used(struct sched_entity *se, int min_nr_tasks)
 {
-	u64 rtime = se->sum_exec_runtime - se->prev_sum_exec_runtime;
-	u64 slice = se->slice;
+	u64 rtime = se->exec_start - se->core_sched_start;

-	return (rtime * min_nr_tasks > slice);
+	return (rtime * min_nr_tasks > se->slice);
 }
 
 #define MIN_NR_TASKS_DURING_FORCEIDLE	2

The task-clock version has matched the existing predicate in the
non-proxy tests so far and fixes the proxy reproducer as well. I am
still validating reselection, migration, and the remaining proxy
boundary cases, so I have not posted either implementation.

Do you think keeping the check in the original real-time/task-clock
domain is a reasonable direction here, or would you prefer preserving
the vruntime approach by carrying the accumulated service across
reweights?

Thanks,
Hui

