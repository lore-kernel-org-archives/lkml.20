Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE3E3F824B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994349; cv=none; b=FixbYNQsm75IKXeOU1CISAYG3GuLDgaxHoo+fSq4/qKqZ+ck0OCxZyYlxYJZEglzLlATE9Wi8z/awaws80cXKJZPeCPpYMd62eIgRU7S3BkUYE4lTB790F0k4GG3ci9WDuzE356x920s3/JjlJsXIGFKnvvWrZm8ZNhYpEi6tQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994349; c=relaxed/simple;
	bh=rnsG3A+ee6yo9tquFGuRos2grmFPPE6Si2Pxkstm0DE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pwhg3mhEcwTHvzt/jUz8weDBkP4wblOMt7YDjJy/YwQjptmD2x8MnF/waNdNidQlC8Yt0SGeO4dvapKm/4EUqTC4D+8gYFLb76h94FNO8jmtGgQ30x83Sc6yDQgVQxtlmRq6YSXxnD52EOpF4MUpI5kxe7+Eg0dGL0fCWED/1KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=N81THiN0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="N81THiN0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1CF5152B;
	Wed, 14 Oct 2026 09:12:11 -0700 (PDT)
Received: from [10.57.88.29] (unknown [10.57.88.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CD533F871;
	Wed, 14 Oct 2026 09:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791994334; bh=rnsG3A+ee6yo9tquFGuRos2grmFPPE6Si2Pxkstm0DE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=N81THiN0VHhdwIy2kqW3CcQqEOPZGi30TGe6mtPP+C8E++GPpqHY6l7YyglwbtVON
	 08n03BhQzeezLC8jQbHxmE7RsUURvtP/HTlh+JlYmxaC3i7vI1x9ENCXloW/WW6C3y
	 lDwHvh9RapyMF6RNMvPfF51K+/ouJBZFb7MDeyL0=
Message-ID: <4ce12bff-9532-4b27-98f2-a807bbccfaf7@arm.com>
Date: Wed, 14 Oct 2026 17:12:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] sched: Account blkio delay independently of delayed dequeue
From: Christian Loehle <christian.loehle@arm.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: Balbir Singh <bsingharora@gmail.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Valentin Schneider <vschneid@redhat.com>, Josh Snyder <joshs@netflix.com>,
 linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
References: <20261014081731.1068794-1-zhanxusheng@xiaomi.com>
 <fab66e31-7c7e-4a81-be59-1a4c1458ff43@arm.com>
Content-Language: en-US
In-Reply-To: <fab66e31-7c7e-4a81-be59-1a4c1458ff43@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Starting blkio delay accounting in __block_task() ties the interval to
removal from the runqueue. With EEVDF delayed dequeue, this misses the
initial part of an I/O sleep, or the entire sleep if the task wakes
before it is dequeued. Final dequeue can also run in another task's
context, causing delayacct_blkio_start() to timestamp the wrong task.

Start accounting in try_to_block_task(), when the current task commits
to blocking, before delayed dequeue or proxy execution can retain it on
the runqueue. End accounting when clearing is_blocked, including queued
wakeups and the proxy execution paths that let the current task continue.

Reported-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Closes: https://lore.kernel.org/r/20261014081731.1068794-1-zhanxusheng@xiaomi.com
Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 kernel/sched/core.c  | 27 +++++++++++++++++----------
 kernel/sched/sched.h |  4 +---
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1fe40de6ebe3..824c8278d2fc 100644
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
@@ -3737,12 +3737,20 @@ ttwu_stat(struct task_struct *p, int cpu, int wake_flags)
 		__schedstat_inc(p->stats.nr_wakeups_sync);
 }
 
+static inline void unblock_task(struct task_struct *p)
+{
+	if (p->is_blocked && p->in_iowait)
+		delayacct_blkio_end(p);
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
@@ -3839,10 +3847,8 @@ ttwu_do_activate(struct rq *rq, struct task_struct *p, int wake_flags,
 		en_flags |= ENQUEUE_RQ_SELECTED;
 	if (wake_flags & WF_MIGRATED)
 		en_flags |= ENQUEUE_MIGRATED;
-	else if (p->in_iowait) {
-		delayacct_blkio_end(p);
+	else if (p->in_iowait)
 		atomic_dec(&task_rq(p)->nr_iowait);
-	}
 
 	activate_task(rq, p, en_flags);
 	wakeup_preempt(rq, p, wake_flags);
@@ -4415,10 +4421,8 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 
 		cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
 		if (task_cpu(p) != cpu) {
-			if (p->in_iowait) {
-				delayacct_blkio_end(p);
+			if (p->in_iowait)
 				atomic_dec(&task_rq(p)->nr_iowait);
-			}
 
 			wake_flags |= WF_MIGRATED;
 			psi_ttwu_dequeue(p);
@@ -6762,6 +6766,9 @@ static bool try_to_block_task(struct rq *rq, struct task_struct *p,
 
 	p->is_blocked = 1;
 
+	if (p->in_iowait)
+		delayacct_blkio_start();
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
index 4c25fbe84fb5..638c7709654a 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3072,10 +3072,8 @@ static inline void __block_task(struct rq *rq, struct task_struct *p)
 	if (p->sched_contributes_to_load)
 		rq->nr_uninterruptible++;
 
-	if (p->in_iowait) {
+	if (p->in_iowait)
 		atomic_inc(&rq->nr_iowait);
-		delayacct_blkio_start();
-	}
 
 	ASSERT_EXCLUSIVE_WRITER(p->on_rq);
 
-- 
2.34.1
