Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D2D390CB2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044890; cv=none; b=QS026ad0dsXsQlHC+L3dhvfprJkFU4JoxsiJgMqIepWtTZ1KtSzEnJlFAMc78O6YfFOLlQmFWKBDu1W1krJqTjplILI/76Fgh8ItG6J5E4ZCWDl16GZqcqHLjh2zdvwbwCKPoZUBg1Le9vApPrcl0eR7CzBkruV6B/12ZYk2gPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044890; c=relaxed/simple;
	bh=F1pogCcXlT+P5+rX1WGJKvfR9rbVeC2F6L5bsRkd9OM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mqumzHcrqBcOD12AmWqdAmWRMUb8G2Q3Ui2WkzYIAtdsnEOPHZaOwtiUVdPIosjNlBCG9xJlhObaE2QtYYdDk71BSx11TuDw6O7xAPNwygna2dP3xhjklcI3j1M0lflaNWoRI53z4NgP1/cPHO8ChmgWy4xbn+DNk3X00Tv7iKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gzNXGtZ+; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gzNXGtZ+"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94f086fedso52934285ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790044887; x=1790649687; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVLP7k1jt3zrpm9nliu8dhIv1j6eIUkDEelfB7sPC3U=;
        b=gzNXGtZ+DGS0twehqyP/n1epk5XS5VB7jlpPrnCkBQqWmRGHvStcPEp/0GBDKYNcld
         bO38PkloBOEWdzrTLbwmJHqdMlxuBXPjoMvSK9S9AUJuUNScJ//vznRPcZKExyPkNLDo
         sMaQ/j9X7JWevCtsusM/tSLxLRiCJ1r4B41nn/KVH7KG1dM0EBnVhk7vl3ty6EMFR8ib
         v+uQthQvQ3H+0cLCZKyCXls8PJGJIJSv3GE/aDJyVbyUrvD0a5aJKWta0IB652Gitovr
         6ssKsqmvP5oQ6rkPx/nGjh7g9k8zCDxd50YY1Fob+CU4ZPErmVK9P0Hc2/VwBa7XOwBI
         0Z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044887; x=1790649687;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVLP7k1jt3zrpm9nliu8dhIv1j6eIUkDEelfB7sPC3U=;
        b=zTb9VZOvKSH+cwLwlYtNQG9spp0ORRM8XeC3d5LzDwyqvenfzlmLrTY91yN99aLkNQ
         vpa/eaECp5vguAziaHObj0whNaROyUZ/Qs1/TevfXV/LEzGP8zJhITv+Da45r3SdgzKg
         ELvPJ++CnIdCV2CshSfFZS1PcNjPEoqT/fuyvUqEwBHk+DaZMHABPAut4ZhuBVe+n7u6
         rAFWf7keHt3oMmKjeUoB2g8qxccVWNS/dwclUoSUzXBvd1p4Uvbp6yNN2AoGCnVPcziP
         2ZZ683GXX6L8SqIOXTMIuKdt+vXZeeZhX/o2XODV+Ta/00Wz5PRZ5E2/MH1LzffGEy2K
         PdSg==
X-Gm-Message-State: AFuF++mLlsygnjBVypCNhKs4+6N41Q1uUK1ysmi3g0pm/q/toFNmq9W7
	5D0OqJi0ElKff7AVDrO84ehcGP/1bqbDqnBhD30ItBy7UPScoylEwr20FMJDcmjyOgf/hs3iRfi
	wTiMbaaDEMlmFhJKrrAZpdsgdRMMjIU4Th0h+hU2eFUe1PEOTJvQZ0B0DjuJi3HRj9y+I4f9H3g
	7vM4genVhH4ruL7wVUK//1TH7sff+DNbVVuEHHK5w16Jfcff9M
X-Received: from plba5.prod.google.com ([2002:a17:903:1005:b0:2dd:764d:af1e])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:8c8:b0:2dd:c053:ec71
 with SMTP id d9443c01a7336-2ddc054099amr137844055ad.36.1790044886289; Mon, 21
 Sep 2026 19:41:26 -0700 (PDT)
Date: Tue, 22 Sep 2026 02:41:12 +0000
In-Reply-To: <20260922024117.1514332-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922024117.1514332-1-jstultz@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922024117.1514332-3-jstultz@google.com>
Subject: [PATCH v32 2/2] sched: Add deactivated (sleeping) owner handling to find_proxy_task()
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Valentin Schneider <valentin.schneider@arm.com>, "Connor O'Brien" <connoro@google.com>, 
	John Stultz <jstultz@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Suleiman Souhlal <suleiman@google.com>, kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, 
	kernel-team@android.com
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

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Zimuzo Ezeozue <zezeozue@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Metin Kaya <Metin.Kaya@arm.com>
Cc: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: kuyo chang <kuyo.chang@mediatek.com>
Cc: hupu <hupu.gm@gmail.com>
Cc: kernel-team@android.com
---
 include/linux/sched.h      |   7 +
 include/linux/sched/task.h |   1 +
 init/init_task.c           |   6 +
 kernel/fork.c              |   6 +
 kernel/sched/core.c        | 319 ++++++++++++++++++++++++++++++++++---
 5 files changed, 318 insertions(+), 21 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index d7cc77181ef98..cab1ad90749d0 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1261,6 +1261,13 @@ struct task_struct {
 
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
index e0c1ca8c6a188..e9288e68ba91b 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -161,6 +161,7 @@ static inline void put_task_struct(struct task_struct *t)
 }
 
 DEFINE_FREE(put_task, struct task_struct *, if (_T) put_task_struct(_T))
+DEFINE_GUARD(get_task, struct task_struct *, get_task_struct(_T), put_task_struct(_T))
 
 static inline void put_task_struct_many(struct task_struct *t, int nr)
 {
diff --git a/init/init_task.c b/init/init_task.c
index adb207cd987c5..3000a587a1eb1 100644
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
index 416758c8a3d43..bf6a4af7d1d0c 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2265,6 +2265,12 @@ __latent_entropy struct task_struct *copy_process(
 
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
index 00d9e3520e79d..962153a343b8a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2226,7 +2226,7 @@ inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 	return p->sched_class->dequeue_task(rq, p, flags);
 }
 
-void activate_task(struct rq *rq, struct task_struct *p, int flags)
+static inline void __activate_task(struct rq *rq, struct task_struct *p, int flags)
 {
 	if (task_on_rq_migrating(p))
 		flags |= ENQUEUE_MIGRATED;
@@ -2237,6 +2237,76 @@ void activate_task(struct rq *rq, struct task_struct *p, int flags)
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
@@ -3779,6 +3849,170 @@ static inline void proxy_reset_donor(struct rq *rq)
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
+		proxy_set_task_cpu(p, target_cpu);
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
+	if (wake_flags & WF_MIGRATED)
+		en_flags |= ENQUEUE_MIGRATED;
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
@@ -3823,6 +4057,10 @@ static inline bool proxy_needs_return(struct rq *rq, struct task_struct *p)
 {
 	return false;
 }
+
+static inline void activate_blocked_waiters(struct rq *target_rq,
+					    struct task_struct *owner,
+					    int wake_flags) {}
 #endif /* CONFIG_SCHED_PROXY_EXEC */
 
 static void
@@ -3896,8 +4134,10 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
 
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
@@ -3926,13 +4166,15 @@ void sched_ttwu_pending(void *arg)
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
@@ -4439,6 +4681,7 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 		ttwu_queue(p, cpu, wake_flags);
 	}
 out:
+	activate_blocked_waiters(cpu_rq(task_cpu(p)), p, wake_flags);
 	if (success)
 		ttwu_stat(p, task_cpu(p), wake_flags);
 
@@ -6780,21 +7023,6 @@ static bool try_to_block_task(struct rq *rq, struct task_struct *p,
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
@@ -6914,6 +7142,29 @@ static void proxy_migrate_task(struct rq *rq, struct rq_flags *rf,
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
 /*
  * Find runnable lock owner to proxy for mutex blocked donor
  *
@@ -7001,11 +7252,37 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
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
 				return proxy_resched_idle(rq);
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
2.55.0.1082.g2b9226bbc0-goog

