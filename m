Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAF4308F03
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619653; cv=none; b=HyPYOynmDECxF+uGcw+oodexwjN0dlHG+lZW7qjKwHyni87aKPLZQbhSsKsvNwKynm4gJKdRItVcm9AiRhc+w5wapyUENucbs4H0uHfcl9Mkji72wyAuSYyRZo7dHbApxXIsZFzitxMahRdmOyxTHcYDOB4WeeOzIu18emLnSyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619653; c=relaxed/simple;
	bh=A+sazoCMTCHkkpJA961/vMdwqnJh5sK8J0YEg37gHAU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TSXYZWfSLzUO/yONWkn/gZc+WmbmkQ2jc8UvZzzylFqyNHtfbgUItBjN55IbzPvoJOQJGjdzdbngURDBnmvB+bRh50U4cOVdTXT8bwgbkJdfqpm3Fd7vcSaU4wC+Tp5Uh/Pr6ALRNBkWtgmgy5HYQ0rAURd8G5iGGn6Xdkr/IEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jZhKwRwM; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jZhKwRwM"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8663802b58fso554390b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789619650; x=1790224450; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wK7P7ZXM1Y+/SB1GLNPOHQ3UpocI9LUwl87jU+Ccbrc=;
        b=jZhKwRwMbkC4QAMX6qkrmDOETSpUhMIhceDTdH/B2C190P9YRXrhj9kI6hC2BrUkW0
         8eALoU5ht1e24NwUP78dVaTEuWGG8LSGhRJnsFcFMcyNQklXIhlD6mzSskGj76LZ668p
         zat4LeAf6Bd2Rpbj1f5DrgzqfPOQs4wVAj1bGqRhnnpwcXfofiJ3H8TKDrxZUccJ26P2
         fxzcU0V/Btp32fDYU6wU11ouFbKD4U2TeHRJuDL18V/6fhq9j/w1DTt+gHp4rGPQwa/5
         lPBAgD+Sq+iD1gHfJxsE+c/W8i207AbvJpTFSyC213V3W4bbt3p/c5YVcdE/e3tkes8l
         Ovvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619650; x=1790224450;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wK7P7ZXM1Y+/SB1GLNPOHQ3UpocI9LUwl87jU+Ccbrc=;
        b=JykpoDjae/1mWp/jvul+3jFrVBwYUXK1wXgb5mx5kxA1x4hCwMsgD89ILkkGTbsbAV
         Kix3NmtOGMuRk56MDRIp51ri//2iHkI0B7t5TptnVGlFKsAeV4YFb6rnPRjXm6OObRzD
         2iUEa5Ym3qTPKDta1vRoOIYhgfkLxOkrQRhrmpRJjh3wmKExpVGEFOhYwB2ii0xT76Ir
         Qqtc8Xz09awMo+FOG4MkxhJ1pQELb+n1E4GWJIp/++8uKM7MlIqweRt0fvWzDQ2hUmnl
         sFBQCXXctMLKhMCJwXqS9EV9sWgQGQflYRaig8RK7++bwsoypcAtNnQbwt6tGJNdFPxG
         wjsQ==
X-Gm-Message-State: AFuF++kY9psb/5jhVroZQ3Mnnb2yGO9rFCmlPGxODukLiptl/e+1ICz2
	n3CKK27tNXqCgYAJfPKH132PFc+dEnf7JUiezh6Aea2RBNwSrGbx6uiSLb8quoVZw9mg38U3mpN
	UAR11+EB8cA1z4lrtBTdq5J6MF6cSXyP0IgP3Z1DEHnQPknZUzO5CuFQAUQNdLxZVhJExBzEDIR
	72BndwxOxSs+gB41a9QHDvJALFk11bRaYoDJ25h38HkavGVUhDkyZ8EZ8=
X-Received: from pfks17.prod.google.com ([2002:a05:6a00:1951:b0:86a:c4c7:7f02])
 (user=suleiman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2e83:b0:86e:ff2c:49dc with SMTP id d2e1a72fcca58-8723988b639mr10689588b3a.24.1789619635736;
 Wed, 16 Sep 2026 21:33:55 -0700 (PDT)
Date: Thu, 17 Sep 2026 04:33:26 +0000
In-Reply-To: <20260917043339.2093426-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917043339.2093426-3-suleiman@google.com>
Subject: [RFC PATCH 02/12] futex: Switch PI futex to use p->pi_futex_lock
 instead of p->pi_lock.
From: Suleiman Souhlal <suleiman@google.com>
To: linux-kernel@vger.kernel.org
Cc: Suleiman Souhlal <suleiman@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	zhidao su <soolaugust@gmail.com>, John Stultz <jstultz@google.com>, 
	Qais Yousef <qyousef@google.com>, ssouhlal@FreeBSD.org
Content-Type: text/plain; charset="UTF-8"

Switch PI futexes to use p->pi_futex_lock instead of p->pi_lock.

When augmenting PING futexes with proxy execution, we get lock order
inversions, due to the lock order being p->pi_lock -> mutex->wait_lock
in the scheduler, but wait_lock -> p->pi_lock in futex code.

So move the futex code to use a new lock, p->pi_futex_lock, to
protect p->pi_state_list and pi_state->owner.

Signed-off-by: Suleiman Souhlal <suleiman@google.com>
---
 include/linux/sched.h |  1 +
 init/init_task.c      |  1 +
 kernel/fork.c         |  1 +
 kernel/futex/core.c   | 39 ++++++++++++++++++++------------------
 kernel/futex/pi.c     | 44 +++++++++++++++++++++----------------------
 5 files changed, 46 insertions(+), 40 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 6edd0c7891c5..a7de5c496e3c 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1257,6 +1257,7 @@ struct task_struct {
 
 	/* Protection of the PI data structures: */
 	raw_spinlock_t			pi_lock;
+	raw_spinlock_t			pi_futex_lock;
 
 	struct wake_q_node		wake_q;
 
diff --git a/init/init_task.c b/init/init_task.c
index adb207cd987c..3e9d62f2668a 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -181,6 +181,7 @@ struct task_struct init_task __aligned(L1_CACHE_BYTES) = {
 	.journal_info	= NULL,
 	INIT_CPU_TIMERS(init_task)
 	.pi_lock	= __RAW_SPIN_LOCK_UNLOCKED(init_task.pi_lock),
+	.pi_futex_lock	= __RAW_SPIN_LOCK_UNLOCKED(init_task.pi_futex_lock),
 	.blocked_lock	= __RAW_SPIN_LOCK_UNLOCKED(init_task.blocked_lock),
 	.timer_slack_ns = 50000, /* 50 usec default slack */
 	.thread_pid	= &init_struct_pid,
diff --git a/kernel/fork.c b/kernel/fork.c
index 6b3f369aad2b..80fa3c2d6ea4 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1835,6 +1835,7 @@ SYSCALL_DEFINE1(set_tid_address, int __user *, tidptr)
 static void rt_mutex_init_task(struct task_struct *p)
 {
 	raw_spin_lock_init(&p->pi_lock);
+	raw_spin_lock_init(&p->pi_futex_lock);
 #ifdef CONFIG_RT_MUTEXES
 	p->pi_waiters = RB_ROOT_CACHED;
 	p->pi_top_task = NULL;
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index a061f54b606d..13c7ea3a26b3 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1354,8 +1354,8 @@ static void exit_pi_state_list(struct task_struct *curr)
 	might_sleep();
 	/*
 	 * Ensure the hash remains stable (no resize) during the while loop
-	 * below. The hb pointer is acquired under the pi_lock so we can't block
-	 * on the mutex.
+	 * below. The hb pointer is acquired under the pi_futex_lock so we
+	 * can't block on the mutex.
 	 */
 	WARN_ON(curr != current);
 	guard(private_hash)(current->mm);
@@ -1364,7 +1364,7 @@ static void exit_pi_state_list(struct task_struct *curr)
 	 * pi_state_list anymore, but we have to be careful
 	 * versus waiters unqueueing themselves:
 	 */
-	raw_spin_lock_irq(&curr->pi_lock);
+	raw_spin_lock_irq(&curr->pi_futex_lock);
 	while (!list_empty(head)) {
 		next = head->next;
 		pi_state = list_entry(next, struct futex_pi_state, list);
@@ -1384,22 +1384,25 @@ static void exit_pi_state_list(struct task_struct *curr)
 			 * progress and retry the loop.
 			 */
 			if (!refcount_inc_not_zero(&pi_state->refcount)) {
-				raw_spin_unlock_irq(&curr->pi_lock);
+				raw_spin_unlock_irq(&curr->pi_futex_lock);
 				cpu_relax();
-				raw_spin_lock_irq(&curr->pi_lock);
+				raw_spin_lock_irq(&curr->pi_futex_lock);
 				continue;
 			}
-			raw_spin_unlock_irq(&curr->pi_lock);
+			raw_spin_unlock_irq(&curr->pi_futex_lock);
 
 			spin_lock(&hb->lock);
 			raw_spin_lock_irq(&pi_state->pi_mutex.wait_lock);
-			raw_spin_lock(&curr->pi_lock);
+			raw_spin_lock(&curr->pi_futex_lock);
 			/*
 			 * We dropped the pi-lock, so re-check whether this
 			 * task still owns the PI-state:
 			 */
 			if (head->next != next) {
-				/* retain curr->pi_lock for the loop invariant */
+				/*
+				 * retain curr->pi_futex_lock for the loop
+				 * invariant
+				 */
 				raw_spin_unlock(&pi_state->pi_mutex.wait_lock);
 				spin_unlock(&hb->lock);
 				put_pi_state(pi_state);
@@ -1411,7 +1414,7 @@ static void exit_pi_state_list(struct task_struct *curr)
 			list_del_init(&pi_state->list);
 			pi_state->owner = NULL;
 
-			raw_spin_unlock(&curr->pi_lock);
+			raw_spin_unlock(&curr->pi_futex_lock);
 			raw_spin_unlock_irq(&pi_state->pi_mutex.wait_lock);
 			spin_unlock(&hb->lock);
 		}
@@ -1419,9 +1422,9 @@ static void exit_pi_state_list(struct task_struct *curr)
 		rt_mutex_futex_unlock(&pi_state->pi_mutex);
 		put_pi_state(pi_state);
 
-		raw_spin_lock_irq(&curr->pi_lock);
+		raw_spin_lock_irq(&curr->pi_futex_lock);
 	}
-	raw_spin_unlock_irq(&curr->pi_lock);
+	raw_spin_unlock_irq(&curr->pi_futex_lock);
 }
 #else
 static inline void exit_pi_state_list(struct task_struct *curr) { }
@@ -1513,25 +1516,25 @@ static void futex_cleanup_begin(struct task_struct *tsk)
 	mutex_lock(&tsk->futex.exit_mutex);
 
 	/*
-	 * Switch the state to FUTEX_STATE_EXITING under tsk->pi_lock.
+	 * Switch the state to FUTEX_STATE_EXITING under tsk->pi_futex_lock.
 	 *
 	 * This ensures that all subsequent checks of tsk->futex_state in
 	 * attach_to_pi_owner() must observe FUTEX_STATE_EXITING with
-	 * tsk->pi_lock held.
+	 * tsk->pi_futex_lock held.
 	 *
 	 * It guarantees also that a pi_state which was queued right before
-	 * the state change under tsk->pi_lock by a concurrent waiter must
+	 * the state change under tsk->pi_futex_lock by a concurrent waiter must
 	 * be observed in exit_pi_state_list().
 	 */
-	raw_spin_lock_irq(&tsk->pi_lock);
+	raw_spin_lock_irq(&tsk->pi_futex_lock);
 	tsk->futex.state = FUTEX_STATE_EXITING;
-	raw_spin_unlock_irq(&tsk->pi_lock);
+	raw_spin_unlock_irq(&tsk->pi_futex_lock);
 }
 
 static void futex_cleanup_end(struct task_struct *tsk)
 	__releases(&tsk->futex.exit_mutex)
 {
-	scoped_guard(raw_spinlock_irq, &tsk->pi_lock)
+	scoped_guard(raw_spinlock_irq, &tsk->pi_futex_lock)
 		tsk->futex.state = FUTEX_STATE_DEAD;
 
 	/*
@@ -1579,7 +1582,7 @@ void futex_exec_done(struct task_struct *tsk)
 	 * ordering guarantee required here is that the previous store to
 	 * tsk::mm in the calling code cannot be reordered against this store.
 	 */
-	guard(raw_spinlock_irq)(&tsk->pi_lock);
+	guard(raw_spinlock_irq)(&tsk->pi_futex_lock);
 	tsk->futex.state = FUTEX_STATE_OK;
 }
 
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index 98f1b962e59a..ceeeca1910ca 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -51,18 +51,18 @@ static void pi_state_update_owner(struct futex_pi_state *pi_state,
 	lockdep_assert_held(&pi_state->pi_mutex.wait_lock);
 
 	if (old_owner) {
-		raw_spin_lock(&old_owner->pi_lock);
+		raw_spin_lock(&old_owner->pi_futex_lock);
 		WARN_ON(list_empty(&pi_state->list));
 		list_del_init(&pi_state->list);
-		raw_spin_unlock(&old_owner->pi_lock);
+		raw_spin_unlock(&old_owner->pi_futex_lock);
 	}
 
 	if (new_owner) {
-		raw_spin_lock(&new_owner->pi_lock);
+		raw_spin_lock(&new_owner->pi_futex_lock);
 		WARN_ON(!list_empty(&pi_state->list));
 		list_add(&pi_state->list, &new_owner->futex.pi_state_list);
 		pi_state->owner = new_owner;
-		raw_spin_unlock(&new_owner->pi_lock);
+		raw_spin_unlock(&new_owner->pi_futex_lock);
 	}
 }
 
@@ -177,7 +177,7 @@ void put_pi_state(struct futex_pi_state *pi_state)
  *
  *	(and pi_mutex 'obviously')
  *
- * p->pi_lock:
+ * p->pi_futex_lock:
  *
  *	p->futex.pi_state_list -> pi_state->list, relation
  *	pi_mutex->owner -> pi_state->owner, relation
@@ -191,7 +191,7 @@ void put_pi_state(struct futex_pi_state *pi_state)
  *
  *   hb->lock
  *     pi_mutex->wait_lock
- *       p->pi_lock
+ *       p->pi_futex_lock
  *
  * Futex kernel state:
  *
@@ -222,12 +222,12 @@ void put_pi_state(struct futex_pi_state *pi_state)
  *
  * The state has two related locks:
  *
- * 1) p::pi_lock
+ * 1) p::pi_futex_lock
  *
- *    p::pi_lock has to be taken by the waiter when evaluating the state to
- *    protect against a concurrent exit/exec cleanup by the owner. If the state
- *    is OK then the waiter can be attached to the owner while still holding
- *    pi_lock.
+ *    p::pi_futex_lock has to be taken by the waiter when evaluating the state
+ *    to protect against a concurrent exit/exec cleanup by the owner. If the
+ *    state is OK then the waiter can be attached to the owner while still
+ *    holding pi_futex_lock.
  *
  *    The cleanup code has to hold it for all state transitions to ensure that
  *    the stores to the state cannot be reordered against previous stores on
@@ -482,13 +482,13 @@ static int attach_to_pi_owner(u32 __user *uaddr, u32 uval, union futex_key *key,
 	 * We need to look at the task state to figure out whether the task is
 	 * exiting. To protect against the change of the task state from
 	 * FUTEX_STATE_OK to FUTEX_STATE_EXISTING in futex_cleanup_begin() it is
-	 * required to do this protected by p->pi_lock, which prevents the owner
-	 * from concurrently starting the exit cleanup.
+	 * required to do this protected by p->pi_futex_lock, which prevents
+	 * the owner from concurrently starting the exit cleanup.
 	 *
-	 * If the state is FUTEX_STATE_OK pi_lock must be held until the waiter
-	 * is attached to protect against a concurrent exit()/exec().
+	 * If the state is FUTEX_STATE_OK pi_futex_lock must be held until the
+	 * waiter is attached to protect against a concurrent exit()/exec().
 	 */
-	raw_spin_lock_irq(&p->pi_lock);
+	raw_spin_lock_irq(&p->pi_futex_lock);
 
 	/* Validate that the task is ready for futex operations. */
 	if (unlikely(p->futex.state != FUTEX_STATE_OK)) {
@@ -503,14 +503,14 @@ static int attach_to_pi_owner(u32 __user *uaddr, u32 uval, union futex_key *key,
 		 * re-evaluates the situation.
 		 */
 		if (p->futex.state == FUTEX_STATE_EXITING) {
-			raw_spin_unlock_irq(&p->pi_lock);
+			raw_spin_unlock_irq(&p->pi_futex_lock);
 			*exiting = p;
 			return -EBUSY;
 		}
 
 		int ret = handle_exit_race(uaddr, uval);
 
-		raw_spin_unlock_irq(&p->pi_lock);
+		raw_spin_unlock_irq(&p->pi_futex_lock);
 		put_task_struct(p);
 		return ret;
 	}
@@ -524,14 +524,14 @@ static int attach_to_pi_owner(u32 __user *uaddr, u32 uval, union futex_key *key,
 		 * key's mm is freed.
 		 */
 		if (unlikely(p->mm != key->private.mm)) {
-			raw_spin_unlock_irq(&p->pi_lock);
+			raw_spin_unlock_irq(&p->pi_futex_lock);
 			put_task_struct(p);
 			return -EPERM;
 		}
 	}
 
 	__attach_to_pi_owner(p, key, ps);
-	raw_spin_unlock_irq(&p->pi_lock);
+	raw_spin_unlock_irq(&p->pi_futex_lock);
 
 	put_task_struct(p);
 
@@ -650,9 +650,9 @@ int futex_lock_pi_atomic(u32 __user *uaddr, struct futex_hash_bucket *hb,
 		 * because @task is known and valid.
 		 */
 		if (set_waiters) {
-			raw_spin_lock_irq(&task->pi_lock);
+			raw_spin_lock_irq(&task->pi_futex_lock);
 			__attach_to_pi_owner(task, key, ps);
-			raw_spin_unlock_irq(&task->pi_lock);
+			raw_spin_unlock_irq(&task->pi_futex_lock);
 		}
 		return 1;
 	}
-- 
2.55.0.1082.g2b9226bbc0-goog

