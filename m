Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.198.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493065;
	b=TrRF9bqF9pmo4oEs7VsaOBLXKyNuJhs+f0dEZz0mGRoH+x3d5MveB/zSmhFMsc+4YEGw
	 Dcc9g+XDLjS800HVV4uepcxy5KqnK28eC1sZODmT0r4EdA97DSoYTtyLJhSIHcq/MZrkl
	 QBqguVEEx4EBXeGapXxnaAgNiAeG/Go4vA80iG46ucaHusVfZfnqZcPAYCsrpZUCR3ZOt
	 j6J5gqTILgyw3mAlsEqLXBZdnYcxEZX67C2EHmqAaQ9pT7MtMmgUehtjwL9XM3hRWLvPN
	 56TRSCtSz1KbMG7bOLfX3CkOOmPqtop7QAilb55NSNKHSFtyBZjuEXFbHDhxLVE6cgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493065;
	h=DMARC-Filter:Received:X-Titan-User-Uid:DKIM-Signature:X-AuthUser:
	 Received:Date:Feedback-ID:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 X-F-Verdict:X-Titan-Src-Out:X-CMAE-Score:X-CMAE-Analysis;
	bh=8Ae72R5vbMZG2Y0zSinia9yHBl3puAbsWYLV2Ao18Xk=;
	b=SeD4LEWxaGPREGS97Gn3/li5o1P3pet6P0t4nA9OlXr5YrcUxwsuHXqnyrrw2Kxqyut6
	 qUrGTXofcbrbJeuvH/qvHTxWbVJy7ZcGRmtSogLdLMui1SPxNhOsHnil+LpinGoE0YPiV
	 Hvc3E2D8siAZzg+rDq3pT8Kib5JDeh8G/h+KJpyJnLyvQatW2qeq/fmttdqDqBNwyJOE1
	 TsvoC80Iw3JUDo9bDhfERn3a6Ze1IweU0W+lzpPJJ6leuqQFlX6sFtv+G9/on/P8VV4q2
	 2ZvSpNmf4OWyE4cIPiAlXGJEpO9Ojm+ITqSRIGP+jjwje7/L0UtA9eGTynOAlBr23KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=techsingularity.net;
	spf=pass smtp.mailfrom=techsingularity.net;
	dkim=pass header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=PVq6FOSx;
	arc=none smtp.remote-ip=18.198.158.5
Received: from mail12.out.titan.email (mail12.out.titan.email [18.198.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57550606A88E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57550606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=PVq6FOSx
Received: from localhost (localhost [127.0.0.1])
	by smtp-out0101.titan.email (Postfix) with ESMTP id 4jQMsr58wwzBrJd;
	Thu, 12 Nov 2026 14:17:36 +0000 (UTC)
X-Titan-User-Uid: eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..XmHipCtrYPb96E_O.w5vfXo9dA0Bp14QFHNZ6d_Lrmjt58ip4y_RK9tg49g20uwUwUQB4Ts-6QlBRn-Z6bB-0xsqgcitSdoEPPYv9rONwwlwyIoN1sbApm2NjOLgZ_D_pmqz4KqsS2g.j45PDo10Vlbmmx6jwb6XPQ
DKIM-Signature: a=rsa-sha256; bh=8Ae72R5vbMZG2Y0zSinia9yHBl3puAbsWYLV2Ao18Xk=;
	c=relaxed/relaxed; d=techsingularity.net;
	h=subject:date:cc:message-id:to:mime-version:from:from:to:cc:subject:date:message-id:in-reply-to:reply-to:references;
	q=dns/txt; s=titan1; t=1794493056; v=1;
	b=PVq6FOSx0yW0pRzmYxUqu0pnyBgeTyNQxIz8qSrP+35HwmmmYJ10kNCOZ6v8M7UuQ1jfO/mZ
	zaZi5ueu3UAqd1ktdmtJwdyqgCUXU/nDqzLAz1kP5GA/ytO1X9oNFE+PUKvhFkq3fn+5DETByoK
	Rm+R0XsGW9qDL638341ThaTs=
X-AuthUser: mgorman@techsingularity.net
Received: from techsingularity.net (unknown [84.203.169.71])
	by smtp-out0101.titan.email (Postfix) with ESMTPA id 4jQMsk0HBHzBrJh;
	Thu, 12 Nov 2026 14:17:29 +0000 (UTC)
Date: Thu, 12 Nov 2026 14:17:29 +0000
Feedback-ID: :mgorman@techsingularity.net:techsingularity.net:flockmailId
From: Mel Gorman <mgorman@techsingularity.net>
To: Steven Rostedt <rostedt@goodmis.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Seiji Nishikawa <snishika@redhat.com>, 
	Mian Yousaf Kaukab <ykaukab@suse.de>, LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] sched/rt: Do not account migrate-disabled tasks as
 pushable
Message-ID: <avXKCDm7NiVejDiF@techsingularity.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1794493056487294508.1930444.5324121627980721470@prod-euc1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=KNjj5FFo c=1 sm=1 tr=0 ts=6af5ca80
 a=z2qhHIlv8qvig73Ub5HWqw==:117 a=z2qhHIlv8qvig73Ub5HWqw==:17
 a=Q9fys5e9bTEA:10 a=CEWIc4RMnpUA:10 a=R_Myd5XaAAAA:8
 a=w6ywC2K9UwzzExR3jiYA:9 a=3ZKOabzyN94A:10 a=PUjeQqilurYA:10
 a=L2g4Dz8VuBQ37YGmWQah:22

RT_PUSH_IPI is intended to minimise latency and rq lock contention when
migrating tasks to balance RT task distribution. The problem is that
if a CPU is rt_overloaded but has no tasks that can be pushed then IPIs
can be fired continually at the same CPU but fail to move any task due
to migrate_disable() on PREEMPT_RT. A specific case was "pgrep" running
at RT priority, its CPU being the target of a continuous stream of IPIs
without any task moving.  While the pgrep can be bound to another CPU by
the application, the underlying problem was that pgrep is spinlock-intensive
which disables migration on PREEMPT_RT.

Commit dae5c0292080 ("sched/rt,dl: Skip migrate-disabled tasks when
picking a push candidate") stops pick_next_pushable_task() returning a
migrate-disabled task which fixes the balancer trying to push pinned tasks
off the CPU. It notes

    The self-IPI path is closed by the rto_next_cpu() fix above, and that
    part works. But the runqueue is still marked overloaded, because the
    pinned task is still advertised as pushable. Other CPUs now send the
    push-IPIs during their own RT balancing, and the same loop runs again.
    Closing the self-IPI path did not stop a pinned task from triggering
    push balancing.

As above, the runqueue is still marked overloaded by enqueue_task_rt()
and put_prev_task_rt() even if the task is migrate-disabled. A
migrate-disabled task reaches the pushable list through enqueue_task_rt()
or put_prev_task_rt() when it is preempted, or when it wakes while
still migrate-disabled. Either path calls enqueue_pushable_task() to set
rq->rt.overloaded and rto_mask if unset. Once set, every pull from another
CPU that fires an IPI may only find migrate-disabled tasks rendering the IPI
useless for a condition that was detectable when placed on the pushable list.

Stop adding migrate-disabled tasks to the pushable list if RT_PUSH_IPI is
enabled. This is not a heuristic as migrate-disabled tasks cannot move. Even
when migration is enabled, the rq still has no pushable candidates until the
task schedules. The !RT_PUSH_IPI behaviour is preserved and migrate-disabled
tasks are added to the pushable list. Without IPI, the alternative path in
pull_rt_task() must find runqueues with off-CPU migrate-disabled tasks. It
can then push the running task away allowing the migrate-disabled task
to run.

A test case creates a "victim" task with short work/sleep cycles allowed
to run on CPU1 and CPU2 that optionally disables migration (md=1) while
running.  A second task mostly does work pinned on CPU1 with short sleeps,
a third task mostly sleeps on CPU2 so CPU2 pulls frequently.  The results are

| Kernel (7.4-rc2)      |     CPU1-md=1 |   CPU2-md=1 |    CPU1-md=0 |    CPU2-md=0 |
|-----------------------|---------------|-------------|--------------|--------------|
| vanilla-rt-push-ipi   | 41474.7 ±0.1% |           0 | 4784.4 ±0.2% |   85.0 ±9.9% |
| patch-rt-push-ipi     |             0 | 0.3 ±380.6% | 4792.1 ±0.3% |  87.1 ±10.8% |
| patch-no-rt-push-ipi  |             0 |           0 |            0 |            0 |
(RT push IPIs per CPU per 5 s interval, mean ±CoV over 30 intervals,
 md=1 means the "victim" with cpumask for CPUs 1-2 disables migration)

The vanilla 7.4-rc2 kernel fired 40k+ IPIs every 5 seconds with
low variance over 30 samples with a migrate-disabled task sitting on
CPU1. Separate testing showed that the IPIs were not resulting in tasks
moving and therefore spurious. The patch stops the spurious IPIs (second
row). Disabling RT_PUSH_IPI also showed no IPIs but it was confirmed that
tasks were still moved.

Note that altering the RT class only is deliberate and deadline
is left alone. The justification for RT is eliminating ineffective
RT_PUSH_IPIs. Deadline is trickier -- it tries to push the task running
on the rq that holds an off-CPU, migrate-disabled task, so that the
migrate-disabled task can run there instead of waiting while another CPU
runs later-deadline work. The cost of that push is bounded, unlike arbitrary
IPIs, and justifiable because deadline ordering is otherwise violated.

For deadline the same two decision sites exist, and any change must update
both together.

In the specific context of put_prev_task_dl(), the task is going off-CPU
with migration disabled, so pushing the running task may take longer
than letting the running task use its budget. The problem is that the
time to migrate the running task can only be estimated but ignoring EDF
requirements is a root-domain-wide violation of deadline principles.
That is out of scope for this patch.

In the specific context of enqueue_task_dl(), it could be justified on
the basis that the task is only enqueued, not yet running. This is the
same question as put_prev_task_dl() -- honour EDF ordering or ignore it.
That is also out of scope for this patch.

Updating deadline in a similar fashion is not justified by the RT IPI
problem. It has different requirements that merit its own patch and
separate justification.

[ykaukab@suse.de: authored fix for spurious IPIs when RT_PUSH_IPI enabled]
[mgorman@techsingularity.net: deadline, changelog, preserve !RT_PUSH_IPI]
Signed-off-by: Yousaf Kaukab <ykaukab@suse.de>
Signed-off-by: Mel Gorman <mgorman@techsingularity.net>
---
 kernel/sched/rt.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 1535046a23ff..bb640278d30e 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -396,6 +396,13 @@ static inline void rt_queue_pull_task(struct rq *rq)
 
 static void enqueue_pushable_task(struct rq *rq, struct task_struct *p)
 {
+	if (p->nr_cpus_allowed <= 1)
+		return;
+#ifdef HAVE_RT_PUSH_IPI
+	if (sched_feat(RT_PUSH_IPI) && is_migration_disabled(p))
+		return;
+#endif
+
 	plist_del(&p->pushable_tasks, &rq->rt.pushable_tasks);
 	plist_node_init(&p->pushable_tasks, p->prio);
 	plist_add(&p->pushable_tasks, &rq->rt.pushable_tasks);
@@ -1448,7 +1455,7 @@ enqueue_task_rt(struct rq *rq, struct task_struct *p, int flags)
 	if (task_is_blocked(p))
 		return;
 
-	if (!task_current(rq, p) && p->nr_cpus_allowed > 1)
+	if (!task_current(rq, p))
 		enqueue_pushable_task(rq, p);
 }
 
@@ -1746,7 +1753,7 @@ static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_s
 	 * The previous task needs to be made eligible for pushing
 	 * if it is still active
 	 */
-	if (on_rt_rq(&p->rt) && p->nr_cpus_allowed > 1)
+	if (on_rt_rq(&p->rt))
 		enqueue_pushable_task(rq, p);
 }
 
-- 
2.55.0

