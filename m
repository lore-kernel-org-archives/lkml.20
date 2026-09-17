Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CD74E50A6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619642; cv=none; b=pLGBl4Jdcv4OEsVrBsl0W3PB0O5vXvQueo9VTdG8m07mu/8D8NNNkafy2YnkrTcX3ZRPhHinpd51xtwmd9Ukt/CcZ+kRhxGfhqB2be0gIEw9R+TUde4r+oDcqIzbM4f2E/jJWQproRLE63XuvC5RwuOt1Ae8AkHGYtun+S2s4FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619642; c=relaxed/simple;
	bh=Al6Q1DUpXZERjzS25RSPq/CvMSV4ceqw+EJvZwL0TTE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FlcMQE/tMhId9Zm84AJ28F8GMfLxnsExj/ObB7euBGAFwQeBH0wXJvqz8KRbLi4wXAqtMeUWC7TDS2srt6spF6OCNo84s3qo5pdVjAEvxYeasD/0LztlqOyAVjUaI4EST5AxlLBFclXWFZWEPmGDuezKSk0+JNyA3a2DtctZ028=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dm6pKZ/Q; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dm6pKZ/Q"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d9057fab9eso7381035ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789619639; x=1790224439; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNXNZ2ZvOvqqCDqnBH76pSiKJ4ociBPqoDsGS+F/MjI=;
        b=dm6pKZ/QRUC9/YBlBZU0toSaxcNdQac78EoamqdyZbQji5AoIuafsTyMshKgBYRGNc
         KSIG6GmTFUmwdtz28V5LXKaETaUAR2LVMeGOluyWkTY2TX6zSv0DPANku7zOBnGpA1JZ
         nbGSBVwSUfd3NaZydA6676t7f7TZkLDpmcUb01YKzBzficwghEoc0QXIssHyMs6Fj4IF
         dShVEelyd+iAP0zhdBEHjth9IT74lrfW2ktoEi28uIw1hTI2cTVsi5UyBIH9VtfspU05
         h5MwX1Dv2njvYR4WG5Cz0e4MUVCgnZ4x2uojz7TtWpTWOQ3qX6VgSWRCALXEYuAxaIgc
         ObaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619639; x=1790224439;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNXNZ2ZvOvqqCDqnBH76pSiKJ4ociBPqoDsGS+F/MjI=;
        b=lgWUmSGk+Tj4fiOkiP+ABMY70yCzu/TmOZ+so3BUQu4VUQXnocDUkrDQoVsio+hxPC
         OD2cHVQNlgLwuYkixa2Xy/GokyrdL+bsfQhGw7zChdYCyJ0tCkLPS5VNf84yyZ24DR9z
         HLoa/E9GR04KKF7vRxa7sjfmEAcEpSqs7RqJavBx1d1tZpQ5amPc7gvrOWQKYQae0Bg1
         ygbNypDzDjdET0xbWbiqqVASo0ZYvkG2g6XawaprNRF70Y25kXb+wb/X2yc26Nh+nZ8Q
         rWsj0lRE9q/utLQ0oHzCTF4qb+zIrwEqFNxyjm3Op7lcPu2795/QrWySB2mTfUNbOgp4
         iTag==
X-Gm-Message-State: AFuF++nKOHEIUD3npHrogZx8KPMBwhhmGuSL6Z1Ui5Ga7IhnyuVUg44e
	GttjUjNkwa7vkxyIYQX4vXslV1J7j4imBMBa9XgT0VNFwGZr4E151A2zaCxiOqyUyGcweB8RYDx
	XGeuaP9dTZGJkIAzf0vULkYz44monJtPv2wbM74sgXthKB5yACa598F0XZfeb4AzMiY07oXZmbx
	J0xLvMfsHjBgO/322YF0iuEBXzgDOqsK9UeSxMFif3nTmNq0oqQKRdqoY=
X-Received: from plrp19.prod.google.com ([2002:a17:902:b093:b0:2dd:5048:500c])
 (user=suleiman job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1904:b0:2d6:ffa1:429b with SMTP id d9443c01a7336-2dd8df0c3ebmr104225105ad.7.1789619638913;
 Wed, 16 Sep 2026 21:33:58 -0700 (PDT)
Date: Thu, 17 Sep 2026 04:33:28 +0000
In-Reply-To: <20260917043339.2093426-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917043339.2093426-5-suleiman@google.com>
Subject: [RFC PATCH 04/12] futex: Introduce stealable PI futex, FUTEX_*_PING.
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

Introduce a New Generation of PI futexes, FUTEX_*_PING.

They are used similarly to FUTEX_*_PI, where the owner is expected
to write its TID in the futex.

The main user-visible difference with regular PI futexes is that the
kernel is allowed to set the FUTEX_WAITERS bit with an empty TID.
This is to allow for a new locker to steal the lock from the top
waiter, which is supposed to improve performance in workloads that
don't need strict RT handling.

An example of how they're meant to be used:
Lock:
	static __thread pid_t tid = gettid();
	uint32_t oldval = 0;
	if (atomic_compare_exchange_strong(ftx, &oldval, tid)
		return;
	if (futex(ftx, FUTEX_LOCK_PING, 0, NULL) != 0)
		err(1, "FUTEX_LOCK_PING");

Unlock:
	static __thread pid_t tid = gettid();
	uint32_t oldval = tid;
	if (atomic_compare_exchange_strong(ftx, &oldval, 0))
		return;
	if (futex(ftx, FUTEX_UNLOCK_PING, 0, NULL) != 0)
		err(1, "FUTEX_UNLOCK_PING");

Signed-off-by: Suleiman Souhlal <suleiman@google.com>
---
 include/linux/futex.h       |  11 +
 include/linux/futex_types.h |   1 +
 include/uapi/linux/futex.h  |   3 +
 kernel/futex/Makefile       |   2 +-
 kernel/futex/futex.h        |  13 +-
 kernel/futex/pi.c           |  15 ++
 kernel/futex/ping.c         | 503 ++++++++++++++++++++++++++++++++++++
 kernel/futex/syscalls.c     |   6 +
 8 files changed, 552 insertions(+), 2 deletions(-)
 create mode 100644 kernel/futex/ping.c

diff --git a/include/linux/futex.h b/include/linux/futex.h
index 18ed18d5cbc1..b1b422b480fb 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -66,6 +66,7 @@ static inline void futex_init_task(struct task_struct *tsk)
 {
 	memset(&tsk->futex, 0, sizeof(tsk->futex));
 	INIT_LIST_HEAD(&tsk->futex.pi_state_list);
+	INIT_LIST_HEAD(&tsk->futex.ping_state_list);
 	tsk->futex.state = FUTEX_STATE_OK;
 	mutex_init(&tsk->futex.exit_mutex);
 }
@@ -159,4 +160,14 @@ void futex_mm_init(struct mm_struct *mm);
 static inline void futex_mm_init(struct mm_struct *mm) { }
 #endif
 
+struct ping_mutex {
+	raw_spinlock_t wait_lock;
+	struct task_struct *owner;
+};
+
+static inline struct task_struct *ping_mutex_owner(struct ping_mutex *ping_mutex)
+{
+	return READ_ONCE(ping_mutex->owner);
+}
+
 #endif /* _LINUX_FUTEX_H */
diff --git a/include/linux/futex_types.h b/include/linux/futex_types.h
index d320c0571f0c..50cb30d6e54b 100644
--- a/include/linux/futex_types.h
+++ b/include/linux/futex_types.h
@@ -26,6 +26,7 @@ struct futex_sched_data {
 	struct compat_robust_list_head __user	*compat_robust_list;
 #endif
 	struct list_head			pi_state_list;
+	struct list_head			ping_state_list;
 	struct futex_pi_state			*pi_state_cache;
 	struct mutex				exit_mutex;
 	unsigned int				state;
diff --git a/include/uapi/linux/futex.h b/include/uapi/linux/futex.h
index 10a36c551675..e2c15db7274e 100644
--- a/include/uapi/linux/futex.h
+++ b/include/uapi/linux/futex.h
@@ -22,6 +22,9 @@
 #define FUTEX_WAIT_REQUEUE_PI	11
 #define FUTEX_CMP_REQUEUE_PI	12
 #define FUTEX_LOCK_PI2		13
+#define	FUTEX_LOCK_PING		14
+#define	FUTEX_UNLOCK_PING	15
+#define	FUTEX_TRYLOCK_PING	16
 
 #define FUTEX_PRIVATE_FLAG	128
 #define FUTEX_CLOCK_REALTIME	256
diff --git a/kernel/futex/Makefile b/kernel/futex/Makefile
index dce70f8a322b..c4cfaf122894 100644
--- a/kernel/futex/Makefile
+++ b/kernel/futex/Makefile
@@ -2,4 +2,4 @@
 
 CONTEXT_ANALYSIS := y
 
-obj-y += core.o syscalls.o pi.o requeue.o waitwake.o
+obj-y += core.o syscalls.o pi.o ping.o requeue.o waitwake.o
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index e450f60b180b..c0560d30aaaa 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -167,7 +167,10 @@ struct futex_pi_state {
 	/*
 	 * The PI object:
 	 */
-	struct rt_mutex_base pi_mutex;
+	union {
+		struct rt_mutex_base pi_mutex;
+		struct ping_mutex ping_mutex;
+	};
 
 	struct task_struct *owner;
 	refcount_t refcount;
@@ -214,6 +217,7 @@ struct futex_q {
 	void *wake_data;
 	union futex_key key;
 	struct futex_pi_state *pi_state;
+	struct futex_pi_state *ping_state;
 	struct rt_mutex_waiter *rt_waiter;
 	union futex_key *requeue_pi_key;
 	u32 bitset;
@@ -405,6 +409,8 @@ extern int attach_to_pi_owner(u32 __user *uaddr, u32 uval, union futex_key *key,
 			      struct futex_pi_state **ps,
 			      struct task_struct **exiting,
 			      bool ping);
+extern void get_ping_state(struct futex_pi_state *ping_state);
+extern void put_ping_state(struct futex_pi_state *ping_state);
 
 /*
  * Express the locking dependencies for lockdep:
@@ -488,4 +494,9 @@ extern int futex_lock_pi(u32 __user *uaddr, unsigned int flags, ktime_t *time, i
 
 bool futex_robust_list_clear_pending(void __user *pop, unsigned int flags);
 
+extern int futex_unlock_ping(u32 __user *uaddr, unsigned int flags);
+
+extern int futex_lock_ping(u32 __user *uaddr, unsigned int flags, ktime_t *time,
+			   int trylock);
+
 #endif /* _FUTEX_H */
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index aefcc0491d60..e7e6e347f97d 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -287,6 +287,8 @@ int attach_to_pi_state(u32 __user *uaddr, u32 uval,
 	 */
 	if (!ping)
 		raw_spin_lock_irq(&pi_state->pi_mutex.wait_lock);
+	else
+		raw_spin_lock_irq(&pi_state->ping_mutex.wait_lock);
 
 	/*
 	 * Since {uval, pi_state} is serialized by wait_lock, and our current
@@ -353,6 +355,9 @@ int attach_to_pi_state(u32 __user *uaddr, u32 uval,
 	if (!ping) {
 		get_pi_state(pi_state);
 		raw_spin_unlock_irq(&pi_state->pi_mutex.wait_lock);
+	} else {
+		get_ping_state(pi_state);
+		raw_spin_unlock_irq(&pi_state->ping_mutex.wait_lock);
 	}
 	*ps = pi_state;
 	return 0;
@@ -443,6 +448,16 @@ static void __attach_to_pi_owner(struct task_struct *p, union futex_key *key,
 		rt_mutex_init_proxy_locked(&pi_state->pi_mutex, p);
 		WARN_ON(!list_empty(&pi_state->list));
 		list_add(&pi_state->list, &p->futex.pi_state_list);
+	} else {
+		/*
+		 * Initialize the pi_mutex in locked state and make @p
+		 * the owner of it:
+		 */
+		pi_state->ping_mutex.owner = p;
+		raw_spin_lock_init(&pi_state->ping_mutex.wait_lock);
+
+		WARN_ON(!list_empty(&pi_state->list));
+		list_add(&pi_state->list, &p->futex.ping_state_list);
 	}
 
 	/* Store the key for possible exit cleanups: */
diff --git a/kernel/futex/ping.c b/kernel/futex/ping.c
new file mode 100644
index 000000000000..3d732489513b
--- /dev/null
+++ b/kernel/futex/ping.c
@@ -0,0 +1,503 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/plist.h>
+#include <linux/slab.h>
+#include <linux/sched/task.h>
+
+#include "futex.h"
+
+static int futex_trylock_ping_state(u32 __user *uaddr,
+				    struct futex_pi_state *ping_state);
+
+static void ping_state_update_owner(struct futex_pi_state *ping_state,
+				    struct task_struct *new_owner)
+{
+	struct task_struct *old_owner = ping_state->owner;
+
+	lockdep_assert_held(&ping_state->ping_mutex.wait_lock);
+
+	if (old_owner) {
+		raw_spin_lock(&old_owner->pi_futex_lock);
+		WARN_ON(list_empty(&ping_state->list));
+		list_del_init(&ping_state->list);
+		raw_spin_unlock(&old_owner->pi_futex_lock);
+	}
+
+	if (new_owner) {
+		raw_spin_lock(&new_owner->pi_futex_lock);
+		WARN_ON(!list_empty(&ping_state->list));
+		list_add(&ping_state->list, &new_owner->futex.ping_state_list);
+		ping_state->owner = new_owner;
+		raw_spin_unlock(&new_owner->pi_futex_lock);
+	}
+}
+
+static int lock_pi_update_atomic(u32 __user *uaddr, u32 uval, u32 newval)
+{
+	int err;
+	u32 curval;
+
+	if (unlikely(should_fail_futex(true)))
+		return -EFAULT;
+
+	err = futex_cmpxchg_value_locked(&curval, uaddr, uval, newval);
+	if (unlikely(err))
+		return err;
+
+	/* If user space value changed, let the caller retry */
+	return curval != uval ? -EAGAIN : 0;
+}
+
+void
+get_ping_state(struct futex_pi_state *ping_state)
+{
+	WARN_ON_ONCE(!refcount_inc_not_zero(&ping_state->refcount));
+}
+
+/*
+ * Drops a reference to the pi_state object and frees or caches it
+ * when the last reference is gone.
+ */
+void
+put_ping_state(struct futex_pi_state *ping_state)
+{
+	if (!ping_state)
+		return;
+
+	if (!refcount_dec_and_test(&ping_state->refcount))
+		return;
+
+	/*
+	 * If ping_state->owner is NULL, the owner is most probably dying
+	 * and has cleaned up the pi_state already
+	 */
+	if (ping_state->owner) {
+		unsigned long flags;
+
+		raw_spin_lock_irqsave(&ping_state->ping_mutex.wait_lock, flags);
+		ping_state_update_owner(ping_state, NULL);
+		WRITE_ONCE(ping_state->ping_mutex.owner, NULL);
+		raw_spin_unlock_irqrestore(&ping_state->ping_mutex.wait_lock,
+					   flags);
+	}
+
+	if (current->futex.pi_state_cache) {
+		kfree(ping_state);
+	} else {
+		/*
+		 * pi_state->list is already empty.
+		 * clear pi_state->owner.
+		 * refcount is at 0 - put it back to 1.
+		 */
+		ping_state->owner = NULL;
+		refcount_set(&ping_state->refcount, 1);
+		current->futex.pi_state_cache = ping_state;
+	}
+}
+
+static void futex_unqueue_ping(struct futex_q *q)
+{
+	if (!plist_node_empty(&q->list))
+		__futex_unqueue(q);
+
+	WARN_ON(!q->ping_state);
+	put_ping_state(q->ping_state);
+	q->ping_state = NULL;
+}
+
+/* Returns >0 if lock acquired, <0 on error */
+static int futex_trylock_ping_state(u32 __user *uaddr,
+				    struct futex_pi_state *ping_state)
+{
+	struct task_struct *owner;
+	u32 uval, new, newtid;
+	int ret;
+
+	ret = 0;
+	raw_spin_lock_irq(&ping_state->ping_mutex.wait_lock);
+	owner = ping_mutex_owner(&ping_state->ping_mutex);
+	if (owner == NULL) {
+		newtid = task_pid_vnr(current);
+
+		ret = futex_get_value_locked(&uval, uaddr);
+		if (ret)
+			goto err;
+		if (uval & FUTEX_TID_MASK) {
+			ret = -EAGAIN;
+			goto err;
+		}
+		new = newtid | FUTEX_WAITERS;
+		ret = lock_pi_update_atomic(uaddr, uval, new);
+		if (ret)
+			goto err;
+		if (ping_state->owner != current)
+			ping_state_update_owner(ping_state, current);
+		WRITE_ONCE(ping_state->ping_mutex.owner, current);
+		ret = 1;
+	}
+	raw_spin_unlock_irq(&ping_state->ping_mutex.wait_lock);
+	return ret;
+
+err:
+	raw_spin_unlock_irq(&ping_state->ping_mutex.wait_lock);
+	switch (ret) {
+	case -EFAULT:
+		ret = fault_in_user_writeable(uaddr);
+		break;
+	case -EAGAIN:
+		ret = 0;
+		break;
+	case -EINVAL:
+		break;
+	default:
+		WARN_ON(1);
+	}
+	return ret;
+}
+
+static int futex_lock_ping_atomic(u32 __user *uaddr,
+				  struct futex_hash_bucket *hb,
+				  union futex_key *key,
+				  struct futex_pi_state **ps,
+				  struct task_struct *task,
+				  struct task_struct **exiting)
+{
+	u32 uval, newval, vpid = task_pid_vnr(task);
+	struct futex_q *top_waiter;
+	int ret;
+
+	/*
+	 * Read the user space value first so we can validate a few
+	 * things before proceeding further.
+	 */
+	if (futex_get_value_locked(&uval, uaddr))
+		return -EFAULT;
+
+	if (unlikely(should_fail_futex(true)))
+		return -EFAULT;
+
+	/*
+	 * Detect deadlocks.
+	 */
+	if ((unlikely((uval & FUTEX_TID_MASK) == vpid)))
+		return -EDEADLK;
+
+	if ((unlikely(should_fail_futex(true))))
+		return -EDEADLK;
+
+	/*
+	 * Lookup existing state first. If it exists, try to attach to
+	 * its ping_state.
+	 */
+	top_waiter = futex_top_waiter(hb, key);
+	if (top_waiter) {
+		struct futex_pi_state *_ps;
+
+		_ps = top_waiter->ping_state;
+		if (_ps == NULL)
+			return -EINVAL;
+		ret = futex_trylock_ping_state(uaddr, _ps);
+		if (ret > 0) {
+			/* We stole the lock from the top waiter. */
+			raw_spin_lock_irq(&_ps->ping_mutex.wait_lock);
+			WARN_ON_ONCE(!refcount_read(&_ps->refcount));
+			get_ping_state(_ps);
+			raw_spin_unlock_irq(&_ps->ping_mutex.wait_lock);
+			*ps = _ps;
+			return 1;
+		} else if (ret < 0)
+			return ret;
+		return attach_to_pi_state(uaddr, uval, top_waiter->ping_state,
+					  ps, true);
+	}
+
+	/*
+	 * No waiter and user TID is 0. We are here because the
+	 * waiters or the owner died bit is set or called from
+	 * requeue_cmp_pi or for whatever reason something took the
+	 * syscall.
+	 */
+	if (!(uval & FUTEX_TID_MASK)) {
+		/*
+		 * We take over the futex. No other waiters and the user space
+		 * TID is 0. We preserve the owner died bit.
+		 */
+		newval = uval & FUTEX_OWNER_DIED;
+		newval |= vpid;
+
+		ret = lock_pi_update_atomic(uaddr, uval, newval);
+		if (ret)
+			return ret;
+		return 1;
+	}
+
+	/*
+	 * First waiter. Set the waiters bit before attaching ourself to
+	 * the owner. If owner tries to unlock, it will be forced into
+	 * the kernel and blocked on hb->lock.
+	 */
+	newval = uval | FUTEX_WAITERS;
+	ret = lock_pi_update_atomic(uaddr, uval, newval);
+	if (ret)
+		return ret;
+	/*
+	 * If the update of the user space value succeeded, we try to
+	 * attach to the owner. If that fails, no harm done, we only
+	 * set the FUTEX_WAITERS bit in the user space variable.
+	 */
+	return attach_to_pi_owner(uaddr, newval, key, ps, exiting, true);
+}
+
+/*
+ * Return values:
+ *     < 0: error.
+ *     0: did not get the lock.
+ *     1: got the lock.
+ */
+int futex_lock_ping(u32 __user *uaddr, unsigned int flags, ktime_t *time,
+		    int trylock)
+{
+	struct hrtimer_sleeper timeout, *to;
+	struct task_struct *exiting;
+	struct futex_q q = futex_q_init;
+	bool queued;
+	int ret;
+
+	if (refill_pi_state_cache())
+		return -ENOMEM;
+
+	to = futex_setup_timer(time, &timeout, flags, 0);
+
+retry:
+	ret = get_futex_key(uaddr, flags, &q.key, FUTEX_WRITE);
+	if (unlikely(ret != 0))
+		goto out;
+
+retry_private:
+	if (1) {
+		CLASS(hbr, hbr)(&q.key);
+		auto hb = hbr.hb;
+
+		futex_q_lock(&q, hb);
+
+		ret = futex_lock_ping_atomic(uaddr, hb, &q.key, &q.ping_state,
+					     current, &exiting);
+		if (unlikely(ret)) {
+			/*
+			 * Atomic work succeeded and we got the lock,
+			 * or failed. Either way, we do _not_ block.
+			 */
+			switch (ret) {
+			case 1:
+				ret = 0;
+				/* Got the lock */
+				put_ping_state(q.ping_state);
+				q.ping_state = NULL;
+				goto out_unlock;
+			case -EFAULT:
+				goto uaddr_faulted;
+			case -EBUSY:
+			case -EAGAIN:
+				/*
+				 * Two reasons for this:
+				 * - EBUSY: Task is exiting and we just wait
+				 * for the exit to complete.
+				 * - EAGAIN: The user space value changed.
+				 */
+				futex_q_unlock(hb);
+				/*
+				 * Handle the case where the owner is in the
+				 * middle of exiting. Wait for the exit to
+				 * complete otherwise this task might loop
+				 * forever, aka. live lock.
+				 */
+				wait_for_owner_exiting(ret, exiting);
+				cond_resched();
+				goto retry;
+			default:
+				goto out_unlock;
+			}
+		}
+
+		WARN_ON(!q.ping_state);
+		if (trylock) {
+			/*
+			 * futex_lock_ping_atomic() trylocks and we did not
+			 * get the lock.
+			 */
+			put_ping_state(q.ping_state);
+			q.ping_state = NULL;
+			ret = -EWOULDBLOCK;
+			goto out_unlock;
+		}
+
+		queued = false;
+		while (1) {
+			set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
+			if (!queued) {
+				futex_queue(&q, hb, current);
+				queued = true;
+			} else {
+				WARN_ON_ONCE(plist_node_empty(&q.list));
+				spin_unlock(&hb->lock);
+				__release(q->lock_ptr);
+			}
+
+			futex_do_wait(&q, to);
+
+			futex_q_lockptr_lock(&q);
+			if (to && !to->task) {
+				ret = -ETIMEDOUT;
+				goto out_unqueue;
+			}
+			if (signal_pending(current)) {
+				ret = -EINTR;
+				goto out_unqueue;
+			}
+
+			ret = futex_trylock_ping_state(uaddr, q.ping_state);
+			if (ret > 0) {
+				/* Got the futex */
+				ret = 0;
+				goto out_unqueue;
+			} else if (ret < 0)
+				goto out_unqueue;
+		}
+
+out_unqueue:
+		if (ret != 0 && q.ping_state->owner == current) {
+			/*
+			 * We are pi_state owner but don't own the futex.
+			 * This can happen if we get picked by the previous
+			 * owner but get out without acquiring the lock for
+			 * some reason.
+			 * A later commit addresses this.
+			 */
+			WARN_ON_ONCE(1);
+		}
+		/* This also puts the ping_state */
+		futex_unqueue_ping(&q);
+out_unlock:
+		futex_q_unlock(hb);
+		__release(q.lock_ptr);
+		goto out;
+
+uaddr_faulted:
+		futex_q_unlock(hb);
+		__release(q.lock_ptr);
+
+		ret = fault_in_user_writeable(uaddr);
+		if (ret)
+			goto out;
+		if (!(flags & FLAGS_SHARED))
+			goto retry_private;
+		goto retry;
+	}
+
+out:
+	if (to) {
+		hrtimer_cancel(&to->timer);
+		destroy_hrtimer_on_stack(&to->timer);
+	}
+
+	return ret;
+}
+
+int futex_unlock_ping(u32 __user *uaddr, unsigned int flags)
+{
+	struct futex_pi_state *ping_state;
+	u32 new, uval, vpid = task_pid_vnr(current);
+	union futex_key key = FUTEX_KEY_INIT;
+	struct futex_q *top_waiter;
+	DEFINE_WAKE_Q(wake_q);
+	int ret;
+
+retry:
+	if (get_user(uval, uaddr))
+		return -EFAULT;
+	/*
+	 * We release only a lock we actually own:
+	 */
+	if ((uval & FUTEX_TID_MASK) != vpid)
+		return -EPERM;
+
+	ret = get_futex_key(uaddr, flags, &key, FUTEX_WRITE);
+	if (ret)
+		return ret;
+
+	CLASS(hbr, hbr)(&key);
+	auto hb = hbr.hb;
+	spin_lock(&hb->lock);
+	top_waiter = futex_top_waiter(hb, &key);
+
+	if (!top_waiter) {
+		spin_unlock(&hb->lock);
+		/* No waiters in the kernel, we can just clear FUTEX_WAITERS */
+		ret = lock_pi_update_atomic(uaddr, uval, 0);
+		if (ret) {
+			switch (ret) {
+			case -EFAULT:
+				goto uaddr_faulted;
+			case -EAGAIN:
+				cond_resched();
+				goto retry;
+			default:
+				WARN_ON_ONCE(1);
+			}
+		}
+		return ret;
+	}
+
+	ping_state = top_waiter->ping_state;
+	ret = -EINVAL;
+	if (!ping_state)
+		goto out_unlock;
+	raw_spin_lock_irq(&ping_state->ping_mutex.wait_lock);
+	if (ping_state->owner != current) {
+		raw_spin_unlock_irq(&ping_state->ping_mutex.wait_lock);
+		goto out_unlock;
+	}
+	get_ping_state(ping_state);
+	/* Leave it queued, it gets unqueued on the lock side */
+	get_task_struct(top_waiter->task);
+	wake_q_add_safe(&wake_q, top_waiter->task);
+	spin_unlock(&hb->lock);
+
+	/*
+	 * Unconditionally set FUTEX_WAITERS.
+	 * It will get removed by the next unlocker who notices there is
+	 * no top_waiter.
+	 */
+	new = FUTEX_WAITERS;
+	ret = lock_pi_update_atomic(uaddr, uval, new);
+	if (ret) {
+		raw_spin_unlock_irq(&ping_state->ping_mutex.wait_lock);
+		put_ping_state(ping_state);
+		switch (ret) {
+		case -EFAULT:
+			goto uaddr_faulted;
+		case -EAGAIN:
+			cond_resched();
+			goto retry;
+		default:
+			WARN_ON_ONCE(1);
+			return ret;
+		}
+	}
+
+	ping_state_update_owner(ping_state, top_waiter->task);
+	WRITE_ONCE(ping_state->ping_mutex.owner, NULL);
+	raw_spin_unlock_irq_wake(&ping_state->ping_mutex.wait_lock, &wake_q);
+	put_ping_state(ping_state);
+	return 0;
+
+out_unlock:
+	spin_unlock(&hb->lock);
+	return ret;
+
+uaddr_faulted:
+	ret = fault_in_user_writeable(uaddr);
+	if (ret)
+		return ret;
+	goto retry;
+}
diff --git a/kernel/futex/syscalls.c b/kernel/futex/syscalls.c
index 2fa19d9d008d..2e6847f0be79 100644
--- a/kernel/futex/syscalls.c
+++ b/kernel/futex/syscalls.c
@@ -151,6 +151,12 @@ long do_futex(u32 __user *uaddr, int op, u32 val, ktime_t *timeout,
 		return futex_unlock_pi(uaddr, flags, uaddr2);
 	case FUTEX_TRYLOCK_PI:
 		return futex_lock_pi(uaddr, flags, NULL, 1);
+	case FUTEX_LOCK_PING:
+		return futex_lock_ping(uaddr, flags, timeout, 0);
+	case FUTEX_UNLOCK_PING:
+		return futex_unlock_ping(uaddr, flags);
+	case FUTEX_TRYLOCK_PING:
+		return futex_lock_ping(uaddr, flags, NULL, 1);
 	case FUTEX_WAIT_REQUEUE_PI:
 		val3 = FUTEX_BITSET_MATCH_ANY;
 		return futex_wait_requeue_pi(uaddr, flags, val, timeout, val3,
-- 
2.55.0.1082.g2b9226bbc0-goog

