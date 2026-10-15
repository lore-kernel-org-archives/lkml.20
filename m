Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A5A51C078
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064292; cv=none; b=Xju1PkRJQXZpE3lCeyOA7l0L8MxSzvlQbRBHOcxpZTKLbeVsnzYVVkBPvMBbshe9kvAJit0qupij5ZsZaeAhEQBIHxbbjjcvGz8j5pfkvILo6Q5O+cULSMMpokXRFD6VEFTntRCumsQ4xpJ7PnoPDDR1IiHnY/NhWcyOJsSi6xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064292; c=relaxed/simple;
	bh=umiMISdru6YuYxrfBTwb8+2F9qdcXXf3bL3QaUo6Y0o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Y7jT28scOlxycX+TMqh9CNX28beHqRqiSXLXEBbHeAVmR5k1QPZLK6IIAUfxqwTxHPKJY7wlFf2M3Db3SXUIoTmGWTPaTBSj+A7wDIesIPZDtGFdbXoakmHGHo2wmwdXYVq4w0pFixWX+KK8NF0LCOiBUOHpRh+FAKYGB9s9QWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tnAchyA/; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tnAchyA/"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D30601477;
	Thu, 15 Oct 2026 04:37:56 -0700 (PDT)
Received: from [10.57.88.29] (unknown [10.57.88.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4957A3F673;
	Thu, 15 Oct 2026 04:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792064280; bh=umiMISdru6YuYxrfBTwb8+2F9qdcXXf3bL3QaUo6Y0o=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=tnAchyA/p0akaxU2YPKSlELNpt/fAfDL63S9j2kemqleWEJYmZBVO+B2Ehu1ikTzq
	 Pw4WFAampv+1CRt+L1MFk854jHpWUsHCxdD8u3hjtq0ijG90kSH4UUbT+W524Ojwpr
	 1xo0tRHUSMRr58aJK3srA+hBJeiykLiTqr9aDV00=
Message-ID: <fd8578a1-e60b-4993-ab51-2b5d63abcf77@arm.com>
Date: Thu, 15 Oct 2026 12:37:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCHv2] sched: Account I/O waits independently of delayed dequeue
From: Christian Loehle <christian.loehle@arm.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Balbir Singh <bsingharora@gmail.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Valentin Schneider <vschneid@redhat.com>, Josh Snyder <joshs@netflix.com>,
 Kayra Cizmeci <kayracizmeci@gmail.com>, linux-kernel@vger.kernel.org
References: <20261014081731.1068794-1-zhanxusheng@xiaomi.com>
 <fab66e31-7c7e-4a81-be59-1a4c1458ff43@arm.com>
 <4ce12bff-9532-4b27-98f2-a807bbccfaf7@arm.com>
 <20261015025912.1541134-1-zhanxusheng@xiaomi.com>
 <a71b6375-f460-49fc-aee6-9f01d58163c2@arm.com>
Content-Language: en-US
In-Reply-To: <a71b6375-f460-49fc-aee6-9f01d58163c2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Starting blkio delay accounting and incrementing rq->nr_iowait in
__block_task() ties both to removal from the runqueue. With EEVDF delayed
dequeue, this misses the initial part of an I/O sleep, or the entire
sleep if the task wakes before it is dequeued. Such tasks are also
missing from procs_blocked while their dequeue is delayed. Final dequeue
can run in another task's context, causing delayacct_blkio_start() to
timestamp the wrong task.

Start both forms of accounting in try_to_block_task(), when the current
task commits to blocking, before delayed dequeue or proxy execution can
retain it on the runqueue. End both when clearing is_blocked, including
queued wakeups and the proxy execution paths that let the current task
continue. Checking is_blocked excludes wakeups that precede blocking.

Save the CPU charged at the start of the wait. Delayed tasks can migrate
while still queued, and proxy execution can also move blocked tasks.
Decrement the saved CPU's counter on unblock, regardless of the task's
current placement, and remove the old dequeue-based accounting.

CPU iowait continues to classify idle time using the counter on the
charged CPU; it does not accumulate the full per-task blocked duration.

Reported-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Closes: https://lore.kernel.org/r/20261014081731.1068794-1-zhanxusheng@xiaomi.com
Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 include/linux/sched.h |  2 ++
 kernel/sched/core.c   | 33 ++++++++++++++++++++-------------
 kernel/sched/sched.h  |  5 -----
 3 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index d35ae49a991f..d558816cc05a 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -880,6 +880,8 @@ struct task_struct {
 	 */
 	int				recent_used_cpu;
 	int				wake_cpu;
+	/* CPU charged while is_blocked && in_iowait. */
+	int				iowait_cpu;
 
 	int				prio;
 	int				static_prio;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1fe40de6ebe3..85eba26f00d6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -636,7 +636,7 @@ int task_llc(const struct task_struct *p)
  *
  * p->is_blocked <- { 0, 1 }:
  *
- *   is set by try_to_block_task() and cleared by ttwu_do_wakeup() and tracks
+ *   is set by try_to_block_task() and cleared by unblock_task() and tracks
  *   if the task is blocked. Traditionally this would mirror p->on_rq, however
  *   due things like DELAY_DEQUEUE and PROXY_EXEC, this can diverge.
  *
@@ -3737,12 +3737,22 @@ ttwu_stat(struct task_struct *p, int cpu, int wake_flags)
 		__schedstat_inc(p->stats.nr_wakeups_sync);
 }
 
+static inline void unblock_task(struct task_struct *p)
+{
+	if (p->is_blocked && p->in_iowait) {
+		delayacct_blkio_end(p);
+		atomic_dec(&cpu_rq(p->iowait_cpu)->nr_iowait);
+	}
+
+	p->is_blocked = 0;
+}
+
 /*
  * Mark the task runnable.
  */
 static inline void ttwu_do_wakeup(struct task_struct *p)
 {
-	p->is_blocked = 0;
+	unblock_task(p);
 	WRITE_ONCE(p->__state, TASK_RUNNING);
 	trace_sched_wakeup(p);
 }
@@ -3839,10 +3849,6 @@ ttwu_do_activate(struct rq *rq, struct task_struct *p, int wake_flags,
 		en_flags |= ENQUEUE_RQ_SELECTED;
 	if (wake_flags & WF_MIGRATED)
 		en_flags |= ENQUEUE_MIGRATED;
-	else if (p->in_iowait) {
-		delayacct_blkio_end(p);
-		atomic_dec(&task_rq(p)->nr_iowait);
-	}
 
 	activate_task(rq, p, en_flags);
 	wakeup_preempt(rq, p, wake_flags);
@@ -4415,11 +4421,6 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 
 		cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
 		if (task_cpu(p) != cpu) {
-			if (p->in_iowait) {
-				delayacct_blkio_end(p);
-				atomic_dec(&task_rq(p)->nr_iowait);
-			}
-
 			wake_flags |= WF_MIGRATED;
 			psi_ttwu_dequeue(p);
 			set_task_cpu(p, cpu);
@@ -6762,6 +6763,12 @@ static bool try_to_block_task(struct rq *rq, struct task_struct *p,
 
 	p->is_blocked = 1;
 
+	if (p->in_iowait) {
+		p->iowait_cpu = cpu_of(rq);
+		atomic_inc(&rq->nr_iowait);
+		delayacct_blkio_start();
+	}
+
 	/*
 	 * We check should_block after signal_pending because we
 	 * will want to wake the task in that case. But if
@@ -6934,7 +6941,7 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 		if (!mutex) {
 			clear_task_blocked_on(p, mutex);
 			if (task_current(rq, p)) {
-				p->is_blocked = 0;
+				unblock_task(p);
 				return p;
 			}
 			goto deactivate;
@@ -6970,7 +6977,7 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 			 */
 			__clear_task_blocked_on(p, NULL);
 			if (task_current(rq, p)) {
-				p->is_blocked = 0;
+				unblock_task(p);
 				return p;
 			}
 			goto deactivate;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 4c25fbe84fb5..eaad943a27a0 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3072,11 +3072,6 @@ static inline void __block_task(struct rq *rq, struct task_struct *p)
 	if (p->sched_contributes_to_load)
 		rq->nr_uninterruptible++;
 
-	if (p->in_iowait) {
-		atomic_inc(&rq->nr_iowait);
-		delayacct_blkio_start();
-	}
-
 	ASSERT_EXCLUSIVE_WRITER(p->on_rq);
 
 	/*

-- 
2.34.1
