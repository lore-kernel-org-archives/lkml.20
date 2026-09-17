Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B273845B0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619636; cv=none; b=u3KJAh1AqkXr1DayUG4hZy1IY87eFy+eXDPaCmal0DJtQH7QuoSX2tgHVwLJWGVW7Tr+hVwtx/c9s6m8KvmmDZ6yJ+nXUxyIcqZWdT8Sw7+LztTwCJhGLs4RwWJ7QTi4WAfBi2IBsMXU/7m7rV8Svetm0a/Tppo0PGQ2eHgDmz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619636; c=relaxed/simple;
	bh=KaT9NI0t5qrzBJ05W03jZ2i9577k9kTBGqpTJPCzuf8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nC9Jjc4MFQIni8mOTiIGbJl5K4nCHe4rWT+kDmsQIGhvxsQZRaGL80KxrJQ/VyMToJs+6ifOMiCCc/Lafq2ERNZCEaIFWOy+TIdlZfbqfJGf2IFCRw9bXIFy6rOk+JdEUQxFvPkLpJZ9r9kfb3UgVDJ2ihYKWVUXZOytvfODnu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CZfRZlMg; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CZfRZlMg"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd7d0751efso4700895ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789619635; x=1790224435; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdNyvCbcOZhKLcqXh8qFyV08oHNPuc9KtGoMTg2NP9I=;
        b=CZfRZlMgoqBPr4q4N3dStkfk/aeqjW1RkpS1/q+985/IbIwYj1Tb/r/Vo6UfEv/VzM
         YPe5f6AZtwG2x1tE4FdQgZXQECfYF7Ma5tZMNCEFGTdgyTCiKuyFAEeDOcAy6qa+zEJg
         lUAQY5HyDFvghswufc/rVhXsz2b+8JJ+KtUll1aTQPsfRPP9KGHsDUTQLjmP8cTjAUvs
         TNmuWWE1C8GvMHT9W+peDBo+MybeEgSX7PkJ03FVEQ5yuypYemxQXZqbTMgiHBOYKO8f
         zhm7+1fBXjRBaS/w2OWEVJTqIQB+brWdVTbPMxqwGQ3/b1AHFbfFHRJabMPvKu2C6xEQ
         8Sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619635; x=1790224435;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdNyvCbcOZhKLcqXh8qFyV08oHNPuc9KtGoMTg2NP9I=;
        b=d6Ee7HkX+FI7IaPcQpcDR16yNSMAmc4nAGXZhRTdo6WzuX725KynDSnqwHmYvEkBth
         fm3LvFVTWiBr0Vam2P/j+cWtVUcdEWoAGlGF7ZdwLkjRtf39ZBCg1JJLUaTL8uHP+/7S
         cEI5Gp/0czPq07W3heCAYQKwKAxswZOQe2sOimKXY18Nn+YG4rXasrYv+PJ4pUMpI9EV
         V5XPL/5VFt2FswmO80GySkbK+27JgRRa/6nYFYEp34d1lh5g31OZg8XB9ay8OF2g64cE
         5EyIzYrL+lZm5XFuP0lR4BOjHvnKN8PM4kfP9GUyw0iPhYQA5pW190qXLfjH2/He/qa2
         v4tQ==
X-Gm-Message-State: AFuF++mmr8BF7RqB4y3xcVdx3A/dm8SpgVeTpHiTH+CkXOtHP/XfvM2U
	eyN8ZT0VGOiSS663fpcj+IdDWdHM3yXkWF7r9Had4P0Gh35HpcigyATonRH1qUlKV/Kot64dJeb
	HlIcUUPBeLPPQ8yz8zjpd2FUOFw9S5xDTL26ctB7Tl7UtREf/rOIBGNNukBpDjztU/UlddKfABk
	kc0W0g9ATZT1T19ZUulDvMnTsacHG64fRPV1mkzKGNqRvVBDEMC3uzDpk=
X-Received: from plgo14.prod.google.com ([2002:a17:902:d4ce:b0:2dd:47fd:3a9c])
 (user=suleiman job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f60c:b0:2d3:6cb4:e79e with SMTP id d9443c01a7336-2dd9c8cc333mr28001715ad.5.1789619634309;
 Wed, 16 Sep 2026 21:33:54 -0700 (PDT)
Date: Thu, 17 Sep 2026 04:33:25 +0000
In-Reply-To: <20260917043339.2093426-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917043339.2093426-2-suleiman@google.com>
Subject: [RFC PATCH 01/12] sched: Abstract task_struct->blocked_on by locking primitive.
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

Abstract task_struct->blocked_on by type of locking primitive, so
that it can be used by things other than mutexes.

Signed-off-by: John Stultz <jstultz@google.com>
Signed-off-by: Suleiman Souhlal <suleiman@google.com>
---
 include/linux/sched.h  | 40 +++++++++++++++++++--------
 kernel/fork.c          |  2 +-
 kernel/locking/mutex.c |  8 +++---
 kernel/sched/core.c    | 62 ++++++++++++++++++++++++++++++++++++------
 kernel/sched/sched.h   |  2 +-
 5 files changed, 89 insertions(+), 25 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 705970d07614..6edd0c7891c5 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -832,6 +832,16 @@ struct task_ipi_mask {
 struct task_ipi_mask { };
 #endif
 
+enum blocked_on_type {
+	BO_T_NONE,
+	BO_T_MUTEX,
+};
+
+struct blocked_on_lock {
+	void *lock;
+	enum blocked_on_type type;
+};
+
 struct task_struct {
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 	/*
@@ -1259,7 +1269,7 @@ struct task_struct {
 	struct rt_mutex_waiter		*pi_blocked_on;
 #endif
 
-	struct mutex			*blocked_on;	/* lock we're blocked on */
+	struct blocked_on_lock		blocked_on;	/* lock we're blocked on */
 	raw_spinlock_t			blocked_lock;
 
 	/*
@@ -2221,10 +2231,15 @@ extern int __cond_resched_rwlock_write(rwlock_t *lock) __must_hold(lock);
 static inline struct mutex *__get_task_blocked_on(struct task_struct *p)
 {
 	lockdep_assert_held_once(&p->blocked_lock);
-	return p->blocked_on;
+	return p->blocked_on.lock;
 }
 
-static inline void __set_task_blocked_on(struct task_struct *p, struct mutex *m)
+/*
+ * These helpers set and clear the task blocked_on pointer, as well
+ * as setting the initial blocked_on_state, or clearing it
+ */
+static inline void __set_task_blocked_on(struct task_struct *p, void *m,
+					 enum blocked_on_type type)
 {
 	WARN_ON_ONCE(!m);
 	/* The task should only be setting itself as blocked */
@@ -2236,11 +2251,12 @@ static inline void __set_task_blocked_on(struct task_struct *p, struct mutex *m)
 	 * with a different mutex. Note, setting it to the same
 	 * lock repeatedly is ok.
 	 */
-	WARN_ON_ONCE(p->blocked_on && p->blocked_on != m);
-	p->blocked_on = m;
+	WARN_ON_ONCE(p->blocked_on.lock && p->blocked_on.lock != m);
+	p->blocked_on.lock = m;
+	p->blocked_on.type = type;
 }
 
-static inline void __clear_task_blocked_on(struct task_struct *p, struct mutex *m)
+static inline void __clear_task_blocked_on(struct task_struct *p, void *m)
 {
 	/* Currently we serialize blocked_on under the task::blocked_lock */
 	lockdep_assert_held_once(&p->blocked_lock);
@@ -2249,21 +2265,23 @@ static inline void __clear_task_blocked_on(struct task_struct *p, struct mutex *
 	 * blocked_on relationships, but make sure we are not
 	 * clearing the relationship with a different lock.
 	 */
-	WARN_ON_ONCE(m && p->blocked_on && p->blocked_on != m);
-	p->blocked_on = NULL;
+	WARN_ON_ONCE(m && p->blocked_on.lock && p->blocked_on.lock != m);
+	p->blocked_on.lock = NULL;
+	p->blocked_on.type = BO_T_NONE;
 }
 
-static inline void clear_task_blocked_on(struct task_struct *p, struct mutex *m)
+static inline void clear_task_blocked_on(struct task_struct *p, void *m)
 {
 	guard(raw_spinlock_irqsave)(&p->blocked_lock);
 	__clear_task_blocked_on(p, m);
 }
+
 #else
-static inline void __clear_task_blocked_on(struct task_struct *p, struct rt_mutex *m)
+static inline void __clear_task_blocked_on(struct task_struct *p, void *m)
 {
 }
 
-static inline void clear_task_blocked_on(struct task_struct *p, struct rt_mutex *m)
+static inline void clear_task_blocked_on(struct task_struct *p, void *m)
 {
 }
 #endif /* !CONFIG_PREEMPT_RT */
diff --git a/kernel/fork.c b/kernel/fork.c
index a5934a317634..6b3f369aad2b 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2266,7 +2266,7 @@ __latent_entropy struct task_struct *copy_process(
 
 	lockdep_init_task(p);
 
-	p->blocked_on = NULL; /* not blocked yet */
+	p->blocked_on.lock = NULL; /* not blocked yet */
 	p->blocked_donor = NULL; /* nobody is boosting p yet */
 
 #ifdef CONFIG_BCACHE
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 942a939cee95..b7565ad15494 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -689,7 +689,7 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 	}
 
 	raw_spin_lock(&current->blocked_lock);
-	__set_task_blocked_on(current, lock);
+	__set_task_blocked_on(current, lock, BO_T_MUTEX);
 	set_current_state(state);
 	trace_contention_begin(lock, LCB_F_MUTEX);
 	for (;;) {
@@ -734,7 +734,7 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 		 * that has cleared our blocked_on state, re-set
 		 * it to the lock we are trying to acquire.
 		 */
-		__set_task_blocked_on(current, lock);
+		__set_task_blocked_on(current, lock, BO_T_MUTEX);
 		set_current_state(state);
 		/*
 		 * Here we order against unlock; we must either see it change
@@ -762,7 +762,7 @@ __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclas
 
 			raw_spin_lock_irqsave(&lock->wait_lock, flags);
 			raw_spin_lock(&current->blocked_lock);
-			__set_task_blocked_on(current, lock);
+			__set_task_blocked_on(current, lock, BO_T_MUTEX);
 			set_current_state(state);
 
 			if (opt_acquired)
@@ -1038,7 +1038,7 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
 		 */
 		donor = current->blocked_donor;
 		if (donor) {
-			struct mutex *next_lock;
+			void *next_lock;
 
 			raw_spin_lock_nested(&donor->blocked_lock, SINGLE_DEPTH_NESTING);
 			next_lock = __get_task_blocked_on(donor);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 7885ff76e69f..2e8fe4b9bb88 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -150,6 +150,24 @@ static int __init setup_proxy_exec(char *str)
 	}
 	return 1;
 }
+
+static inline struct task_struct *__blocked_on_owner(struct blocked_on_lock *bo)
+{
+	switch (bo->type) {
+	case BO_T_NONE:
+		return NULL;
+	case BO_T_MUTEX:
+		return __mutex_owner(bo->lock);
+	default:
+		WARN_ON_ONCE(1);
+		return NULL;
+	}
+}
+
+static inline struct task_struct *task_blocked_on_owner(struct task_struct *p)
+{
+	return __blocked_on_owner(&p->blocked_on);
+}
 #else
 static int __init setup_proxy_exec(char *str)
 {
@@ -6799,7 +6817,7 @@ static void proxy_deactivate(struct rq *rq, struct task_struct *donor)
 	unsigned long state = READ_ONCE(donor->__state);
 
 	WARN_ON_ONCE(state == TASK_RUNNING);
-	WARN_ON_ONCE(donor->blocked_on);
+	WARN_ON_ONCE(donor->blocked_on.lock);
 	/*
 	 * Because we got donor from pick_next_task(), it is *crucial*
 	 * that we call proxy_resched_idle() before we deactivate it.
@@ -6884,6 +6902,28 @@ static void proxy_migrate_task(struct rq *rq, struct rq_flags *rf,
 	proxy_reacquire_rq_lock(rq, rf);
 }
 
+static void
+lock_blocked_on_lock(struct blocked_on_lock *bo)
+{
+	if (bo->type == BO_T_MUTEX)
+		raw_spin_lock(&((struct mutex *)bo->lock)->wait_lock);
+	else
+		WARN_ON_ONCE(1);
+}
+
+static void
+unlock_blocked_on_lock(struct blocked_on_lock *bo)
+{
+	if (bo->type == BO_T_MUTEX)
+		raw_spin_unlock(&((struct mutex *)bo->lock)->wait_lock);
+	else
+		WARN_ON_ONCE(1);
+}
+
+DEFINE_LOCK_GUARD_1(blocked_on_lock, struct blocked_on_lock,
+		    lock_blocked_on_lock(_T->lock),
+		    unlock_blocked_on_lock(_T->lock))
+
 /*
  * Find runnable lock owner to proxy for mutex blocked donor
  *
@@ -6914,6 +6954,7 @@ static struct task_struct *
 find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 	__must_hold(__rq_lockp(rq))
 {
+	struct blocked_on_lock bo, *blocked_on;
 	struct task_struct *owner = NULL;
 	bool curr_in_chain = false;
 	int this_cpu = cpu_of(rq);
@@ -6922,10 +6963,15 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 
 	/* Follow blocked_on chain. */
 	for (p = donor; p->is_blocked; p = owner) {
-		/* if its PROXY_WAKING, do return migration or run if current */
-		struct mutex *mutex = p->blocked_on;
-		if (!mutex) {
-			clear_task_blocked_on(p, mutex);
+		/* copy the entire blocked_on structure */
+		raw_spin_lock(&p->blocked_lock);
+		bo = p->blocked_on;
+		raw_spin_unlock(&p->blocked_lock);
+		blocked_on = &bo;
+
+		/* Something changed in the chain, so pick again */
+		if (!blocked_on->lock) {
+			clear_task_blocked_on(p, NULL);
 			if (task_current(rq, p)) {
 				p->is_blocked = 0;
 				return p;
@@ -6937,11 +6983,11 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 		 * By taking mutex->wait_lock we hold off concurrent mutex_unlock()
 		 * and ensure @owner sticks around.
 		 */
-		guard(raw_spinlock)(&mutex->wait_lock);
+		guard(blocked_on_lock)(blocked_on);
 		guard(raw_spinlock)(&p->blocked_lock);
 
 		/* Check again that p is blocked with blocked_lock held */
-		if (mutex != __get_task_blocked_on(p)) {
+		if (blocked_on->lock != __get_task_blocked_on(p)) {
 			/*
 			 * Something changed in the blocked_on chain and
 			 * we don't know if only at this level. So, let's
@@ -6954,7 +7000,7 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 		if (task_current(rq, p))
 			curr_in_chain = true;
 
-		owner = __mutex_owner(mutex);
+		owner = __blocked_on_owner(blocked_on);
 		if (!owner) {
 			/*
 			 * If there is no owner, either clear blocked_on
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e656c7059bf8..a386ac33e295 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2505,7 +2505,7 @@ static inline bool task_is_blocked(struct task_struct *p)
 	if (!sched_proxy_exec())
 		return false;
 
-	return !!p->blocked_on;
+	return !!p->blocked_on.lock;
 }
 
 static inline int task_on_cpu(struct rq *rq, struct task_struct *p)
-- 
2.55.0.1082.g2b9226bbc0-goog

