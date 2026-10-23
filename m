Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792793082;
	b=xn/m2jfBHsb4DIupoi3WAlpKImpRAU4HHwqOh/a96kNeVnIctIqrseSiS/7apqQH9M7v
	 sZxTCrxekMTZkkMYaLJYFrdGQP5CEdBZGXPycl0DorOo5LA7INmQ20IL2B+h0OaOCHnt1
	 9GgBzWXzs2M/CCQqXYQO86WGuHinEFxwFoaP8LA+uKOW7Us+VDs3mr0+GY4+qyohIKLAq
	 c8whT05iCH1MbjDnUEokDKrxcl46zKgBTquggPFUk5LAl2JI+CK4N5fSfKMF41XhVMRXU
	 wtQKGpPQZlIAa6mR5gsO1HMtjhrb8CipAVV9obPVl+IcbIB3iENMEOhSV7jP0GrT15A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792793082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=pqYs5BWYlr+iDPOmXZQFuOxlpt+sOEv0/mQJj/g4A40=;
	b=RuMbQ6ABqsQFDej3dFNHMk23G+ZvEyHuFORhgCWds5XoqOWcWVHsxtzTO6kVx5kozCXw
	 yW0zfK5qJDrWA6hnlf3dRi2x/ClBWzmTTeFTRbsdvOvCfSpwQEIZvzDpPgeWXL0yZnL27
	 wjs3S53gP/RI+fhZqhz95Ysexj5U3TflejAnzyQF78rqZ9Uar8g+xTQckx/wyc2ChD1VA
	 YI4wHkHI1BIYE6OMbvsWdJdNd7ntu6LHyfWzIn6qP5b+fpn9FDcmAGZdfhQeqEaM2hHUr
	 Xquv5O06O3zm8bs7E8tpdzwQxckNlfjV+mV8C34HpcyyPHw8hkLxWv804A7Ek9/bHVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GgbEtCHk;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5F760A2602
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B5F760A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GgbEtCHk
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a05c820ecbso1893895b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792793081; x=1793397881; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqYs5BWYlr+iDPOmXZQFuOxlpt+sOEv0/mQJj/g4A40=;
        b=GgbEtCHkLxvLob7EGwvLyp1wqyNvkIuUZpcIMT2dLdIJnKPB9p2LqnCy76KvkwicGO
         ieY9Mpv64fpmLqv4qguFXhmYLomcaMO9PAN5Ff5T66QK5Jvc0GuIGhIFOcl3yRBqZ2vd
         y1GMAcaUEGpKFrXckSGdbABoDVmgkNfxgfeBNJ1VMJcRFaePDnVN90JnbzPLT1xhiFi/
         lBtCutv30A/LNvnUPT/CyIxjCwBBRCT2LnL1a54xhQ8kR+5NaPo2S3A6iYEIDkFqCaao
         3GNQN7ojDwQ04K/3ECz9/oGDvG1trPw4iyl89Lv+mLf/i4ZvXy/Yc3KSvJ5pePJ+zZys
         BfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792793081; x=1793397881;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pqYs5BWYlr+iDPOmXZQFuOxlpt+sOEv0/mQJj/g4A40=;
        b=Cmor6D+8rQq6P1YkjyVEJnfSZtEnEJaAJV6V8lb5H9wru3duLIol3zKAaZKByuACuN
         cFZwRru6T3xU9FF9D6iuuXPSWoz34sW9AuNmcwrhurnmj+32XgNNsMBw7JgEBxNWrc2v
         vWhGcKj77R/2RNDCSr4WZ6K0KaWefgGnvL0laG8dKpFSo5Hg2VmJ2o89mV5lmrp/vSx7
         o/iZS6tvawEVBgH7gZ/Uf4Ug/v+D423ihSjjRYi8oIcESAkj779f2iqlS5J0d9x5WSGr
         AbQbtof1JA5QfRlOyq7PYdhpQMlUHJrSTxyBgRLz1XT8hvFsuNqJkgDuXGAnlDDPP3pz
         In2Q==
X-Gm-Message-State: AFq9FYKIvXXzLJ4xqbdoQBlImpUv0U4KjPjzO2nEm/IrpcEfvvhJHEhU
	C/qvFwZWup0L3xr0vmGcrrAW9lhrceNUmcxd/BwO3EJzZ1LCrl2Y1b4unwGjz3cNhw3hkQcObiP
	ssCRMfbcBBNEzVgtUXjnmAL4hJLeIsUVt+X0/RH1DIMzcrsHpL+GJ9hLwAUs6SIskNZdN8yz2m7
	GM3BN3XpPk0nYvuMSKygXdF4H4MdVmUqRYV7xv2i9XlZ7IXdR7
X-Received: from pgby28-n1.prod.google.com ([2002:a05:6a02:651c:10b0:cc7:e64a:83f5])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:808b:b0:3e0:e60f:2e5b
 with SMTP id adf61e73a8af0-3e7bfa90f30mr174607637.30.1792793079908; Fri, 23
 Oct 2026 15:04:39 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:04:18 +0000
In-Reply-To: <20261023220431.1106611-1-jstultz@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023220431.1106611-1-jstultz@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023220431.1106611-8-jstultz@google.com>
Subject: [PATCH v33 7/7] sched/proxy: Add deactivated (sleeping) owner
 handling to find_proxy_task()
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Valentin Schneider <valentin.schneider@arm.com>, "Connor O'Brien" <connoro@google.com>, 
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Valentin Schneider <vschneid@redhat.com>, 
	Suleiman Souhlal <suleiman@google.com>, Andrea Righi <arighi@nvidia.com>, Metin Kaya <Metin.Kaya@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, kuyo chang <kuyo.chang@mediatek.com>, 
	hupu <hupu.gm@gmail.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>, 
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su <sh_def@163.com>, 
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

From: Peter Zijlstra <peterz@infradead.org>

If the blocked_on chain resolves to a sleeping owner, deactivate
the donor task, and enqueue it on the sleeping owner task.
Then re-activate it later when the owner is woken up.

NOTE: This has been particularly challenging to get working
properly, and some of the locking is particularly awkward. I'd
very much appreciate review and feedback for ways to simplify
this.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
Signed-off-by: Connor O'Brien <connoro@google.com>
[jstultz: This was broken out from the larger proxy() patch]
Signed-off-by: John Stultz <jstultz@google.com>
---
v5:
* Split out from larger proxy patch
v6:
* Major rework, replacing the single list head per task with
  per-task list head and nodes, creating a tree structure so
  we only wake up descendants of the task woken.
* Reworked the locking to take the task->pi_lock, so we can
  avoid mid-chain wakeup races from try_to_wake_up() called by
  the ww_mutex logic.
v7:
* Drop unnecessary __nested lock annotation, as we already drop
  the lock prior.
* Add comments on #else & #endif lines, and clearer function
  names, and commit message tweaks as suggested by Metin Kaya
* Move activate_blocked_entities() call from ttwu_queue to
  try_to_wake_up() to simplify locking. Thanks to questions from
  Metin Kaya
* Fix irqsave/irqrestore usage now we call this outside where
  the pi_lock is held
* Fix activate_blocked_entitites not preserving wake_cpu
* Fix for UP builds
v8:
* Minor checkpatch fixup
* Drop proxy_deactivate and cleanups suggested by Metin
v9:
* Fix bug causing possibly uninitialized cpu value to be used with
  activate_blocked_entities()
* Improved comment around preserving wake_cpu suggested by Metin
* Add additional lockdep asserts, suggested by Metin
* Tweaked placement of lockdep assert, suggested by Metin
* Fixed comment referring to structure entry name
* Fix to call proxy_resched_idle() _prior_ to calling
  proxy_enqueue_on_owner() where we deactivate the task, this
  avoids stale references to rq_selected() when the task may
  have been migrated to another rq.
* Fix to remove the blocked_head list at the start of
  activate_blocked_entities() so we only do a finite amount
  of work, avoiding a potential livelock of two cpus removing
  and adding tasks to the list at the same time if the owner
  went back to sleep while blocked entities were being woken.
v11:
* Big rework to get rid of recursion. Had to add another list
  item to the task_stuct to do this as we are in atomic context
  and cannot allocate memory while activating blocked entities.
  Will need to watch carefully for bugs, as switching to a
  list_head in the task_struct instead of a pointer on the
  stack opens up the potential for races on the shared state,
  but I think I've got the locking sorted.
* Moved proxy_set_task_cpu helper to earlier in the series
* Minor rework for try_to_deactivate_task changes
* Minor variable name cleanups suggested by Metin
v13:
* Switch to use donor from next for proxy_enqueue_on_owner
* Switch to using block_task instead of deactivate_task
v14:
* Ensure we call block_task() last in proxy_enqueue_on_owner
  and not touch it again to avoid races where it might be
  activated on another cpu
* Make sure we activate blocked_entities when we exit from ttwu
* Fix to enqueue the last task in the chain (p) on the blocked
  owner instead of donor, so that we preserve the chain
  structure so mid-chain wakeups propagate properly
* Rework of sleeping_owner handling so that we properly deal
  with delayed-dequeued (sched_delayed) tasks (also removes
  now unused proxy_deactivate() logic)
v15:
* Rework do_activate_task to be activate_task() and have it
  call __activate_task(), suggested by Carlos Llamas
* Put task_struct additions under CONFIG_SCHED_PROXY_EXEC
v16:
* Rework do_activate_blocked_waiter locking to use scoped_guard
* Rework find_proxy_task() logic to use guard
v18:
* Integrate Suleiman's suggested optimization to check sleeping
  owner status before task_cpu, to avoid unnecssarily
  proxy-migrating tasks to then just dequeue them.
* Add on_cpu check to fix for a very hard to reproduce race where
  a late blocked_task_activation() happens while the task is already
  on_cpu elsewhere. When we get to  __schedule() we block the task
  (!on_rq) but haven't yet switched away. blocked_task_activation()
  would then incorrectly activate on a different runqueue.
* Add init_task initialization for sleeping owner lists, as
  suggested by Suleiman
v19:
* Build fixup for !CONFIG_SMP
v22:
* Rework to avoid gotos in guard() scopes, using break and
  switch() on action values. Suggested by K Prateek.
v25:
* Fix elevated nr_uninterruptible and nr_iowait counts,
  which were causing bad loadavg values. Reported and
  fixed by David Stevens <stevensd@google.com>
v28:
* In __proxy_remove_from_sleeping_owner() we call
  put_task(), which might free the owner while we are
  still holing the owners->blocked_lock. So be sure
  to get_task()/put_task() around the owner usage to
  ensure we don't prematurely free the task.
* Also reorder the put_task/unlock lines in
  activate_blocked_waiters(), to avoid a similar issue
v30:
* Optimize activate_blocked_waiters() so we don't do so much
  unnecessary work when proxy-exec is enabled. If there are
  no blocked waiters, we can return early.
v31:
* K Prateek's noticed a potential race where if a sleeping owner
  is woken in paralell with the waiter enquing itself on the
  sleeping owner, the waiting task could get stuck on that owner
  until it sleeps and is woken up again. So double check after
  we grab the blocked_lock to avoid this.
* Maria Yu and Tengfei Fan reported an issue with rq->nr_iowait
  values getting out of balance, and provided a helpful
  reproducer. To fix this, make sure we do the atomic_dec() in
  do_activate_blocked_waiter() before we call
  proxy_set_task_cpu() so we always dec on the same rq we
  inc'ed.
v32:
* Atul Kumar Pant noticed a task could wakeup and then sleep
  before we call into do_activate_blocked_waiter() and in
  that case we would activate the task on the target_rq.
  As the target_rq is where the owner is being woken on, if
  the waiter already woke and ran the activation could move
  it to a cpu outside its affinity mask. So add an extra
  is_blocked check to ensure the task is still blocked on
  the owner.
* PeterZ shared a number of cleanups utilizing guard to make
  the code simpler.
* PeterZ pointed out we could see owner races in
  proxy_remove_from_sleeping_owner(), so re-sample owner after
  we take the lock to ensure we're consistent, and add a BUG_ON
  in __proxy_remove_from_sleeping_owner() to enforce
  p->sleeping_owner  == owner.
* PeterZ noted we're calling activate_blocked_waiters()
  extraniously in sched_ttwu_pending(), so drop that.
v33:
* David Stevens <stevensd@google.com> reported seeing
  "psi: inconsistent task state!" warnings, which was caused
  when we activate the blocked waiter list, proxy-migrating the
  tasks to the owners' rq. Since we currently don't signal to
  the PSI layer, the TSK_MEMSTALL flag persists when the
  following activation happens, throwing the error. This results
  in the source CPU's count of TSK_MEMSTALL becoming permanently
  non-zero, leading to very exaggerated memory PSI.
  To avoid this, check if the target_cpu is the task_cpu(p) and
  if not call psi_ttwu_dequeue() to clear the flags before the
  activation.
* David also noted that when activating blocked tasks, the
  enqueue flag was being set to ENQUEUE_MIGRATED if the owner's
  wake_flags had WF_MIGRATED set, but the waiters task_cpu may
  already be the target_cpu during the activation, so we
  shouldn't activate the waiters with ENQUEUE_MIGRATED in this
  case. So change the logic that sets ENQUEUE_MIGRATED to be
  where we check if the waiter's task_cpu == target_cpu
* It was reported that in some cases unblocked tasks were being
  placed outside of their CPU affinity mask. If the call to
  do_activate_blocked_waiter() was delayed, its possible the
  task has already been woken. We already have checks for task
  state == TASK_WAKING, p->on_rq, task_on_cpu(), but its still
  possible the task woke and then blocked again (sleeping or
  re-waiting on the same or different mutex). So before
  activating on the prior sleeping owner's rq, ensure the
  task_is_blocked() to make sure we don't migrate a
  sleeping task outside of its affinity mask.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: Andrea Righi <arighi@nvidia.com>
Cc: Metin Kaya <Metin.Kaya@arm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Zimuzo Ezeozue <zezeozue@google.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Qais Yousef <qyousef@layalina.io>
Cc: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: kuyo chang <kuyo.chang@mediatek.com>
Cc: hupu <hupu.gm@gmail.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>
Cc: zhidao su (Xiaomi) <soolaugust@gmail.com>
Cc: Hui Su <sh_def@163.com>
Cc: Shubhang Kaushik (Ampere) <sh@gentwo.org>
Cc: kernel-team@android.com
---
 include/linux/sched.h      |   7 +
 include/linux/sched/task.h |   1 +
 init/init_task.c           |   6 +
 kernel/fork.c              |   6 +
 kernel/sched/core.c        | 333 ++++++++++++++++++++++++++++++++++---
 5 files changed, 332 insertions(+), 21 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 12a7e094a3e6b..3fae2f1438583 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1266,6 +1266,13 @@ struct task_struct {
 
 	struct mutex			*blocked_on;	/* lock we're blocked on */
 	raw_spinlock_t			blocked_lock;
+#ifdef CONFIG_SCHED_PROXY_EXEC
+	struct list_head		blocked_head;  /* tasks blocked on this task */
+	struct list_head		blocked_node;  /* our entry on someone elses blocked_head */
+	/* Node for list of tasks to process blocked_head list for blocked entitiy activations */
+	struct list_head		blocked_activation_node;
+	struct task_struct		*sleeping_owner; /* task our blocked_node is enqueued on */
+#endif
 
 	/*
 	 * The task that is boosting this task; a back link for the current
diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index 90ed5bc3c7afe..26c19ee980456 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -160,6 +160,7 @@ static inline void put_task_struct(struct task_struct *t)
 }
 
 DEFINE_FREE(put_task, struct task_struct *, if (_T) put_task_struct(_T))
+DEFINE_GUARD(get_task, struct task_struct *, get_task_struct(_T), put_task_struct(_T))
 
 static inline void put_task_struct_many(struct task_struct *t, int nr)
 {
diff --git a/init/init_task.c b/init/init_task.c
index ce7c2b07d855d..aed3f7d8a5cc3 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -213,6 +213,12 @@ struct task_struct init_task __aligned(L1_CACHE_BYTES) = {
 						 &init_task.alloc_lock),
 #endif
 	.blocked_donor = NULL,
+#ifdef CONFIG_SCHED_PROXY_EXEC
+	.blocked_head = LIST_HEAD_INIT(init_task.blocked_head),
+	.blocked_node = LIST_HEAD_INIT(init_task.blocked_node),
+	.blocked_activation_node = LIST_HEAD_INIT(init_task.blocked_activation_node),
+	.sleeping_owner = NULL,
+#endif
 #ifdef CONFIG_RT_MUTEXES
 	.pi_waiters	= RB_ROOT_CACHED,
 	.pi_top_task	= NULL,
diff --git a/kernel/fork.c b/kernel/fork.c
index 394906afafd30..f87f806c2958b 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2277,6 +2277,12 @@ __latent_entropy struct task_struct *copy_process(
 
 	p->blocked_on = NULL; /* not blocked yet */
 	p->blocked_donor = NULL; /* nobody is boosting p yet */
+#ifdef CONFIG_SCHED_PROXY_EXEC
+	INIT_LIST_HEAD(&p->blocked_head);
+	INIT_LIST_HEAD(&p->blocked_node);
+	INIT_LIST_HEAD(&p->blocked_activation_node);
+	p->sleeping_owner = NULL;
+#endif
 
 #ifdef CONFIG_BCACHE
 	p->sequential_io	= 0;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0cb41a884ea70..be3ce8b554fed 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2229,7 +2229,7 @@ inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 	return p->sched_class->dequeue_task(rq, p, flags);
 }
 
-void activate_task(struct rq *rq, struct task_struct *p, int flags)
+static inline void __activate_task(struct rq *rq, struct task_struct *p, int flags)
 {
 	if (task_on_rq_migrating(p))
 		flags |= ENQUEUE_MIGRATED;
@@ -2240,6 +2240,76 @@ void activate_task(struct rq *rq, struct task_struct *p, int flags)
 	ASSERT_EXCLUSIVE_WRITER(p->on_rq);
 }
 
+#ifdef CONFIG_SCHED_PROXY_EXEC
+static inline
+void __proxy_remove_from_sleeping_owner(struct task_struct *owner, struct task_struct *p)
+{
+	lockdep_assert_held(&owner->blocked_lock);
+
+	BUG_ON(p->sleeping_owner != owner);
+
+	list_del_init(&p->blocked_node);
+	WRITE_ONCE(p->sleeping_owner, NULL);
+	put_task_struct(owner); // matches get in proxy_enqueue_on_owner
+}
+
+static inline void proxy_remove_from_sleeping_owner(struct task_struct *p)
+{
+	struct task_struct *owner;
+
+retry:
+	owner = data_race(READ_ONCE(p->sleeping_owner));
+	if (!owner)
+		return;
+
+	/*
+	 * __proxy_remove_from_sleeping_owner() does a
+	 * put on owner to match the get done in
+	 * proxy_enqueue_on_owner(). If that put is the
+	 * last one and it frees owner, we'd be freeing
+	 * a lock we held. So get/put owner around its
+	 * usage her to ensure that doesn't happen.
+	 */
+	scoped_guard(get_task, owner) {
+		guard(raw_spinlock)(&owner->blocked_lock);
+
+		if (owner != READ_ONCE(p->sleeping_owner))
+			goto retry;
+		__proxy_remove_from_sleeping_owner(owner, p);
+	}
+}
+
+void activate_task(struct rq *rq, struct task_struct *p, int en_flags)
+{
+	lockdep_assert_rq_held(rq);
+
+	if (!sched_proxy_exec()) {
+		__activate_task(rq, p, en_flags);
+		return;
+	}
+
+	proxy_remove_from_sleeping_owner(p);
+	/*
+	 * By calling __activate_task() with blocked_lock held, we
+	 * order against the find_proxy_task() blocked_task case
+	 * such that no more blocked tasks will be enqueued on p
+	 * once we release p->blocked_lock.
+	 */
+	guard(raw_spinlock)(&p->blocked_lock);
+	WARN_ON(task_cpu(p) != cpu_of(rq));
+	__activate_task(rq, p, en_flags);
+}
+#else
+static inline void proxy_remove_from_sleeping_owner(struct task_struct *p)
+{
+}
+
+void activate_task(struct rq *rq, struct task_struct *p, int en_flags)
+{
+	__activate_task(rq, p, en_flags);
+}
+#endif
+
 void deactivate_task(struct rq *rq, struct task_struct *p, int flags)
 {
 	WARN_ON_ONCE(flags & DEQUEUE_SLEEP);
@@ -3815,6 +3885,184 @@ static inline void proxy_reset_donor(struct rq *rq)
 	resched_curr(rq);
 }
 
+static inline void proxy_set_task_cpu(struct task_struct *p, int cpu)
+{
+	unsigned int wake_cpu;
+
+	/*
+	 * Since we are enqueuing a blocked task on a cpu it may
+	 * not be able to run on, preserve wake_cpu when we
+	 * __set_task_cpu so we can return the task to where it
+	 * was previously runnable.
+	 */
+	wake_cpu = p->wake_cpu;
+	__set_task_cpu(p, cpu);
+	p->wake_cpu = wake_cpu;
+}
+
+static void do_activate_blocked_waiter(struct rq *target_rq, struct task_struct *p, int en_flags)
+{
+	struct rq_flags rf;
+	int target_cpu = cpu_of(target_rq);
+
+	scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
+		/* If task is no longer blocked, don't activate */
+		if (!p->is_blocked)
+			return;
+
+		/* Avoid racing with ttwu */
+		if (READ_ONCE(p->__state) == TASK_WAKING)
+			return;
+
+		if (READ_ONCE(p->on_rq)) {
+			/*
+			 * We raced with a non mutex handoff activation of p.
+			 * That activation will also take care of activating
+			 * all of the tasks after p in the blocked_head list,
+			 * so we're done here.
+			 */
+			return;
+		}
+		if (task_on_cpu(task_rq(p), p)) {
+			/*
+			 * Its possible this activation is very late, and
+			 * we already were woken up and are running on a
+			 * different cpu. If that task blocked, it could be
+			 * dequeued (so on_rq == 0), but still on_cpu.
+			 * Bail in this case, as we definitely don't want to
+			 * activate a task when its on_cpu elsewhere.
+			 */
+			return;
+		}
+
+		scoped_guard (raw_spinlock, &p->blocked_lock) {
+			/*
+			 * Again, if activation is delayed, it's possible the
+			 * task has been woken and is no longer blocked_on,
+			 * but went back to sleep, so double check blocked_on
+			 * before activating onto the owner's rq
+			 */
+			if (!task_is_blocked(p))
+				return;
+		}
+
+		/*
+		 * Have to make sure we handle nr_iowait adjustment before
+		 * we call proxy_set_task_cpu() to ensure we are adjusting
+		 * the same runqueue we left (where block_task()
+		 * incremented nr_iowait).
+		 */
+		if (p->in_iowait) {
+			delayacct_blkio_end(p);
+			atomic_dec(&task_rq(p)->nr_iowait);
+		}
+
+		if (task_cpu(p) != target_cpu) {
+			en_flags |= ENQUEUE_MIGRATED;
+			psi_ttwu_dequeue(p);
+			proxy_set_task_cpu(p, target_cpu);
+		}
+		rq_lock_irqsave(target_rq, &rf);
+		/*
+		 * proxy_enqueue_on_owner() called block_task() which
+		 * increments nr_uninterruptible, so we need to reverse
+		 * that when we activate the blocked waiter
+		 */
+		if (p->sched_contributes_to_load)
+			target_rq->nr_uninterruptible--;
+		update_rq_clock(target_rq);
+		activate_task(target_rq, p, en_flags);
+		resched_curr(target_rq);
+		rq_unlock_irqrestore(target_rq, &rf);
+	}
+}
+
+static void activate_blocked_waiters(struct rq *target_rq,
+				     struct task_struct *owner,
+				     int wake_flags)
+{
+	struct list_head bal_head;
+	unsigned long flags;
+	int en_flags = ENQUEUE_WAKEUP | ENQUEUE_NOCLOCK;
+
+	if (!sched_proxy_exec())
+		return;
+
+	/*
+	 * A whole bunch of waiting donor tasks back this blocked
+	 * lock owner task, wake them all up to give this task its
+	 * 'fair' share.
+	 *
+	 * This is a little unique here and the locking is messy.
+	 * At this point we only hold the blocked_lock, so the
+	 * owner task may be able to run and do all sorts of
+	 * things while we are processing the blocked_head list,
+	 * including going back to sleep, which can cause tasks
+	 * to be added to the owners->blocked_head while we are
+	 * processing it!
+	 * Thus, we pull the entire list off the owner->blocked_head
+	 * here so that we will only process a finite amount of
+	 * tasks. Tasks added after this will be processed by the
+	 * future wake events.
+	 * Even though we have pulled the list off the blocked_head
+	 * the removed list is *still* "owned" and serialized by
+	 * the owner->blocked_lock! As we have to serialize against
+	 * mid-chain wakeups, who may try to remove themselves from
+	 * the list.
+	 */
+	raw_spin_lock_irqsave(&owner->blocked_lock, flags);
+	if (!list_empty(&owner->blocked_activation_node)) {
+		raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
+		return;
+	}
+
+	if (list_empty(&owner->blocked_head)) {
+		raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
+		return;
+	}
+
+	get_task_struct(owner);
+	INIT_LIST_HEAD(&bal_head);
+	list_add_tail(&owner->blocked_activation_node, &bal_head);
+	raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
+
+	while (!list_empty(&bal_head)) {
+		struct list_head tmp_head;
+
+		INIT_LIST_HEAD(&tmp_head);
+		owner = list_first_entry(&bal_head, struct task_struct, blocked_activation_node);
+
+		raw_spin_lock_irqsave(&owner->blocked_lock, flags);
+		list_replace_init(&owner->blocked_head, &tmp_head);
+		list_del_init(&owner->blocked_activation_node);
+		while (!list_empty(&tmp_head)) {
+			struct task_struct *p;
+
+			p = list_first_entry(&tmp_head,
+					     struct task_struct,
+					     blocked_node);
+			WARN_ON(p == owner);
+			__proxy_remove_from_sleeping_owner(owner, p);
+			raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
+
+			do_activate_blocked_waiter(target_rq, p, en_flags);
+
+			raw_spin_lock_irqsave(&p->blocked_lock, flags);
+			if (list_empty(&p->blocked_activation_node)) {
+				get_task_struct(p);
+				list_add_tail(&p->blocked_activation_node, &bal_head);
+			}
+			raw_spin_unlock_irqrestore(&p->blocked_lock, flags);
+
+			raw_spin_lock_irqsave(&owner->blocked_lock, flags);
+		}
+		raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
+		put_task_struct(owner); // put matches get prior to adding to local bal_head
+	}
+}
+
+static inline struct task_struct *proxy_resched_idle(struct rq *rq);
+
 /*
  * Checks to see if task p has been proxy-migrated to another rq
  * and needs to be returned. If so, we deactivate the task here
@@ -3872,6 +4120,10 @@ static inline bool proxy_needs_return(struct rq *rq, struct task_struct *p)
 {
 	return false;
 }
+
+static inline void activate_blocked_waiters(struct rq *target_rq,
+					    struct task_struct *owner,
+					    int wake_flags) {}
 #endif /* CONFIG_SCHED_PROXY_EXEC */
 
 static void
@@ -3945,8 +4197,10 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
 
 	update_rq_clock(rq);
 	if (p->is_blocked) {
-		if (p->se.sched_delayed)
+		if (p->se.sched_delayed) {
+			proxy_remove_from_sleeping_owner(p);
 			enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
+		}
 		if (proxy_needs_return(rq, p))
 			return 0;
 	}
@@ -3975,13 +4229,15 @@ void sched_ttwu_pending(void *arg)
 	update_rq_clock(rq);
 
 	llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
+		int wake_flags;
 		if (WARN_ON_ONCE(p->on_cpu))
 			smp_cond_load_acquire(&p->on_cpu, !VAL);
 
 		if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
 			set_task_cpu(p, cpu_of(rq));
 
-		ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0, &rf);
+		wake_flags = p->sched_remote_wakeup ? WF_MIGRATED : 0;
+		ttwu_do_activate(rq, p, wake_flags, &rf);
 	}
 
 	/*
@@ -4488,6 +4744,7 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 		ttwu_queue(p, cpu, wake_flags);
 	}
 out:
+	activate_blocked_waiters(cpu_rq(task_cpu(p)), p, wake_flags);
 	if (success)
 		ttwu_stat(p, task_cpu(p), wake_flags);
 
@@ -6822,21 +7079,6 @@ static bool try_to_block_task(struct rq *rq, struct task_struct *p,
 }
 
 #ifdef CONFIG_SCHED_PROXY_EXEC
-static inline void proxy_set_task_cpu(struct task_struct *p, int cpu)
-{
-	unsigned int wake_cpu;
-
-	/*
-	 * Since we are enqueuing a blocked task on a cpu it may
-	 * not be able to run on, preserve wake_cpu when we
-	 * __set_task_cpu so we can return the task to where it
-	 * was previously runnable.
-	 */
-	wake_cpu = p->wake_cpu;
-	__set_task_cpu(p, cpu);
-	p->wake_cpu = wake_cpu;
-}
-
 static inline struct task_struct *proxy_resched_idle(struct rq *rq)
 {
 	put_prev_set_next_task(rq, rq->donor, rq->idle);
@@ -6984,6 +7226,29 @@ static void proxy_migrate_task(struct rq *rq, struct rq_flags *rf,
 	proxy_reacquire_rq_lock(rq, rf);
 }
 
+static void proxy_enqueue_on_owner(struct rq *rq, struct task_struct *owner,
+				   struct task_struct *p)
+{
+	lockdep_assert_rq_held(rq);
+	lockdep_assert_held(&owner->blocked_lock);
+	/*
+	 * ttwu_activate() will pick them up and place them on whatever rq
+	 * @owner will run next.
+	 */
+	WARN_ON(p == owner);
+	WARN_ON(!p->on_rq);
+	WARN_ON(p->sleeping_owner);
+	get_task_struct(owner);
+	WRITE_ONCE(p->sleeping_owner, owner);
+	/*
+	 * ttwu_do_activate must not have a chance to activate p
+	 * elsewhere before it's fully extricated from its old rq.
+	 */
+	list_add(&p->blocked_node, &owner->blocked_head);
+	proxy_resched_idle(rq);
+	block_task(rq, p, READ_ONCE(p->__state));
+}
+
 #define MAX_PROXY_CHAIN_DEPTH 1024
 
 /*
@@ -7087,11 +7352,37 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 		}
 
 		if (!READ_ONCE(owner->on_rq) || owner->se.sched_delayed) {
-			/* XXX Don't handle blocked owners/delayed dequeue yet */
+			/*
+			 * rq->curr must not be added to the blocked_head list or else
+			 * ttwu_do_activate could enqueue it elsewhere before it switches
+			 * out here. The approach to avoid this is the same as in the
+			 * migrate_task case.
+			 */
 			if (curr_in_chain)
 				goto resched_idle;
-			__clear_task_blocked_on(p, NULL);
-			goto deactivate;
+			/*
+			 * If !@owner->on_rq, holding @rq->lock will not pin the task,
+			 * so we cannot drop @mutex->wait_lock until we're sure its a blocked
+			 * task on this rq.
+			 *
+			 * We use @owner->blocked_lock to serialize against ttwu_activate().
+			 * Either we see its new owner->on_rq or it will see our list_add().
+			 */
+			WARN_ON(owner == p);
+			raw_spin_unlock(&p->blocked_lock);
+			raw_spin_lock(&owner->blocked_lock);
+			/*
+			 * Before actually adding to the sleeping owner, double check
+			 * we didn't race with an owner wakeup before grabbing the
+			 * owner's blocked_lock.
+			 */
+			if (!READ_ONCE(owner->on_rq) || owner->se.sched_delayed)
+				proxy_enqueue_on_owner(rq, owner, p);
+
+			raw_spin_unlock(&owner->blocked_lock);
+			raw_spin_lock(&p->blocked_lock);
+
+			return NULL; /* retry task selection */
 		}
 
 		owner_cpu = task_cpu(owner);
-- 
2.56.0.257.gf7497c7d27-goog

