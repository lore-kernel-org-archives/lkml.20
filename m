Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3671D514E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270904; cv=none; b=BTtvccgqlpBeEy9TULZlt2XP4xGUflmL7YYMOldg4wuDCbvBECo6p3wXeT2ichKO9qAH9kw069AcBzU/aqbgz8XQ0FGUuCF+ZMLackMG6734ELwCIrupVf21wyeHEIXiPekusXlBlB68FC4Q79DV0roloPToT+swrJfAvT2+yqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270904; c=relaxed/simple;
	bh=E9iBDSd0F+VFOLfBAeE7XB7kTLFkpCL7XnKeEoR64/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QV1Lu58/1QLEukOBjc6uQ4M3WL3c/cCsQaY4NKNYaKO74x04NIZ3e3u/GMkdadSH2gP2cFYCwFr7EYfrkTessT2RI02h2iXc4DoWl14HnUTERmtZN+0vejq3dlcBJOI6uucvPbBgSOnXbt9+3T+uHZebbDXfWzpQlsskAovsssc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HhIk1rjZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=p6jPemJy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HhIk1rjZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="p6jPemJy"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788270899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jQWyz0zLAk1rifjb78xRUnQXRcjCfUEYgBKEXS8+YA4=;
	b=HhIk1rjZKrQOaBkJ1qP6TkuyafKYgBHKwMabdkVxj1jdJHf13WoVLLixGFpXGxVzENmoVW
	Y9iOcPsH8yKuMbeLHmlKH+vIOmV+F2h3QwVAXK5qI/h6zUMTMNOln+e93hoOAKRbiT7Kvd
	phd+3T0C4u6b8ionzoLdp2SeEt/VHoxP/1DEZ5oI0LZJNWxOL2yhMb2WE8V6TPH2wvrzZU
	vITYc/GMlDN6bKwXfzwk1CU3uGAJfJv9GjU44ZjPIz6o5nKRPp5yO+J/itMsJH192PRXUu
	gO9m8etR1p1LMHZxXjLeaCwFaxyf3bUSMJfonRVOo1/HRsy4pesZHhzmpudXnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788270899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jQWyz0zLAk1rifjb78xRUnQXRcjCfUEYgBKEXS8+YA4=;
	b=p6jPemJy9RuyNqla2PFBCAYvIXumKOsNHG07QT0D63rpy1x7Vgnl6lOyc4SZBph9mhY023
	Mv28KjuLrVsdh2DQ==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Yao Kai <yaokai34@huawei.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v4 1/2] futex: Provide rt_mutex_.*_schedule() equivalents for futex scheduling
Date: Tue,  1 Sep 2026 15:54:51 +0200
Message-ID: <20260901135453.3121948-2-bigeasy@linutronix.de>
In-Reply-To: <20260901135453.3121948-1-bigeasy@linutronix.de>
References: <20260901135453.3121948-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There is rt_mutex_{pre|post}_schedule() around
rt_mutex_wait_proxy_lock() to ensure that sched_submit_work()/
sched_update_worker() is invoked before we schedule out and block on
rt_mutex while waiting for it become available.

The reason is that blocking on rt_mutex assigns a pi_waiter for the PI
chain and sched_submit_work() will also assign a pi_waiter if it blocks
on lock but a this point we already have a waiter assigned.
We can't skip sched_submit_work() entirely because I/O relies on the
fact that I/O queue is flushed while it blocks on a sleeping lock.
Therefore sched_submit_work() is moved before we block on the lock.

Sleeping lock in this context means mutex or rw_semaphore not spinlock_t
on PREEMPT_RT. Because the mutex abstraction on PREEMPT_RT uses the same
abstraction as the futex proxy lock, the futex code ended up using
rt_mutex_{pre|post}_schedule(), too.
Using it is/ was just to keep the task_struct::sched_rt_mutex assertion
happy. Futex proxy lock is used only in the syscall context of a task.
At this point it never got any I/O that needs to be flushed and it can't
be a workqueue that needs to notify that it will be scheduled out.
Therefore sched_submit_work() does nothing here.

By mistake futex_wait_requeue_pi() -> rt_mutex_wait_proxy_lock() did not
get the rt_mutex_{pre|post}_schedule() annotation. This was not noticed
because in this callchain the lock is (usually) not contended and so
rt_mutex_slowlock_block() does not schedule, triggering the assert.

Adding rt_mutex_pre_schedule() here looks wrong (as noted by PeterZ)
because at this point there is a pi_waiter recorded and invoking
sched_submit_work() with a possible lock contention would be wrong.

Add rt_mutex_futex_{pre|post}_schedule() which toggles the
sched_rt_mutex assert and does not involve sched_submit_work(). Add
asserts here to ensure that sched_submit_work() would do nothing. Use it
only in futex proxy lock case which is rt_mutex_wait_proxy_lock().
Remove it from futex_lock_pi().

Fixes: d14f9e930b90 ("locking/rtmutex: Use rt_mutex specific scheduler help=
ers")
Reported-by: Yao Kai <yaokai34@huawei.com>
Closes: https://lore.kernel.org/all/20260717084922.4153317-2-yaokai34@huawe=
i.com
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/sched/rt.h     |  2 ++
 kernel/futex/pi.c            | 16 +++-------------
 kernel/locking/rtmutex_api.c |  2 ++
 kernel/sched/core.c          | 16 ++++++++++++++++
 4 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/include/linux/sched/rt.h b/include/linux/sched/rt.h
index 4e3338103654c..922935cc33833 100644
--- a/include/linux/sched/rt.h
+++ b/include/linux/sched/rt.h
@@ -52,8 +52,10 @@ static inline bool rt_or_dl_task_policy(struct task_stru=
ct *tsk)
=20
 #ifdef CONFIG_RT_MUTEXES
 extern void rt_mutex_pre_schedule(void);
+extern void rt_mutex_futex_pre_schedule(void);
 extern void rt_mutex_schedule(void);
 extern void rt_mutex_post_schedule(void);
+extern void rt_mutex_futex_post_schedule(void);
=20
 /*
  * Must hold either p->pi_lock or task_rq(p)->lock.
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index 88788e584ec8a..98f1b962e59a0 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -1070,17 +1070,11 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int f=
lags, ktime_t *time, int tryl
 		 * Caution; releasing @hb in-scope. The hb->lock is still locked
 		 * while the reference is dropped. The reference can not be dropped
 		 * after the unlock because if a user initiated resize is in progress
-		 * then we might need to wake him. This can not be done after the
-		 * rt_mutex_pre_schedule() invocation. The hb will remain valid because
-		 * the thread, performing resize, will block on hb->lock during
-		 * the requeue.
+		 * then we might need to wake him. The hb will remain valid
+		 * because the thread, performing resize, will block on
+		 * hb->lock during the requeue.
 		 */
 		futex_private_hash_put(no_free_ptr(hbr.fph));
-		/*
-		 * Must be done before we enqueue the waiter, here is unfortunately
-		 * under the hb lock, but that *should* work because it does nothing.
-		 */
-		rt_mutex_pre_schedule();
=20
 		rt_mutex_init_waiter(&rt_waiter);
=20
@@ -1146,10 +1140,6 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int fl=
ags, ktime_t *time, int tryl
 		 * the
 		 */
 		futex_q_lockptr_lock(&q);
-		/*
-		 * Waiter is unqueued.
-		 */
-		rt_mutex_post_schedule();
 no_block:
 		/*
 		 * Fixup the pi_state owner and possibly acquire the lock if we
diff --git a/kernel/locking/rtmutex_api.c b/kernel/locking/rtmutex_api.c
index 5d48d64725b12..eb18b094473c9 100644
--- a/kernel/locking/rtmutex_api.c
+++ b/kernel/locking/rtmutex_api.c
@@ -423,6 +423,7 @@ int __sched rt_mutex_wait_proxy_lock(struct rt_mutex_ba=
se *lock,
 {
 	int ret;
=20
+	rt_mutex_futex_pre_schedule();
 	raw_spin_lock_irq(&lock->wait_lock);
 	/* sleep on the mutex */
 	set_current_state(TASK_INTERRUPTIBLE);
@@ -433,6 +434,7 @@ int __sched rt_mutex_wait_proxy_lock(struct rt_mutex_ba=
se *lock,
 	 */
 	fixup_rt_mutex_waiters(lock, true);
 	raw_spin_unlock_irq(&lock->wait_lock);
+	rt_mutex_futex_post_schedule();
=20
 	return ret;
 }
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f78275192036b..449ccd871be81 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7637,6 +7637,17 @@ void rt_mutex_pre_schedule(void)
 	sched_submit_work(current);
 }
=20
+/*
+ * Used within the futex syscall context, skips sched_submit_work() becaus=
e none
+ * its work will be done. Asserts ensure that it is indeed the case.
+ */
+void rt_mutex_futex_pre_schedule(void)
+{
+	lockdep_assert(!(current->flags & (PF_WQ_WORKER | PF_IO_WORKER)));
+	lockdep_assert(!current->plug);
+	lockdep_assert(!fetch_and_set(current->sched_rt_mutex, 1));
+}
+
 void rt_mutex_schedule(void)
 {
 	lockdep_assert(current->sched_rt_mutex);
@@ -7649,6 +7660,11 @@ void rt_mutex_post_schedule(void)
 	lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
 }
=20
+void rt_mutex_futex_post_schedule(void)
+{
+	lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
+}
+
 /*
  * rt_mutex_setprio - set the current priority of a task
  * @p: task to boost
--=20
2.55.0

