Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208C3B5E08
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619647; cv=none; b=Jo/YkKhC+6xVBuc7ncM+oxrX8Ndst+HpWVZtzE0K/Re2YWkK9nqnQZGzdlDpvc7if2clDMT9RR5rM9OPiIOohUW+Rd+/wDjYcr3Y/DbOoEgw0YZI2J1vprzRLv61CnWTYu1KjhzfE/Nfjz1GO8QC5Tl+FrYya0GMhFddB5ehmzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619647; c=relaxed/simple;
	bh=DzM1wwGRb2tHik98ddoG6RceyOa+DELhGaixssLReuc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HIQzDOr8dwLg+6nekVKmRDN4gyFhEQsQK6blyVxfHgGbcZ/vhnrrl6amC/I+Cwt6WaEkxHkNXkWyj7yGlTpRrgT5Q3Ji6biYt2Onxh4wcopM0543ATdHUavSQqTo+WVlDi67LelXaBje5HLVlzywf3eAMU08QY4cG0Jj2tNuiyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=djDDNR8T; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="djDDNR8T"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso838300a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789619644; x=1790224444; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ARME4+OC5I5xyK4kMYGfPWWw6m/P7auePB5jMoGWdY0=;
        b=djDDNR8TZ9Oz06EJdza++P41hV3ZhzOAzgT6qq55gTziYHqF1fMO9QHx3cZ2ED0vjQ
         YAtuTxeRyRd1H5erJ6wJf4GZtdtwuSyCbyeF4S8eEu7KGYMa1aV5QLADFsl++LKUWVk3
         qSDfIJQIGr0SnXu9ezXU6LrgnoQQM444r/pfMfFyB28wkm1762q09fdw3NjfDTSG70wr
         LpAVDG1gbSl901XSbtPHhgvizWis2vpugtU57qK3zMolbV8i5yvzSZegjQE6pSxkGjyJ
         RK+vBeG6kT2fJtCa4Cd8iNzIOfcL1Rt9q/aEnRlvUfe5cS7DL3vNPdtXN514W6qOV6cP
         rpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619644; x=1790224444;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARME4+OC5I5xyK4kMYGfPWWw6m/P7auePB5jMoGWdY0=;
        b=kvbxknSVbWoA8mJgRFhntqH57fCjJoiOT88pdR1r/azFJfXjMJ+JpRnmglQPhotW/n
         LyHNrsNu9oFsQL2FRG7Y/isnoCWRkv905GSH+ix/L2Q1AJsBfLzFd/66WWzFMVDMLxeN
         ziXTRbV2/Hh7Z+g2O16vXu6gJSAOs2EWXtlHLdgG6V0VZmpaHWtT1B4hhwpuk9x4SsMh
         62PqWLLW/jgi0upXtqTUjydyk6TmJDmawbyDvNhu/U7Xb/3/rjsb8zut1O3Ob8GHEBhy
         RBc6SXGDSArY1DUafT2URZvAUl4doIKlGX6WNQ8Q00kfSBRsCRfQay6uqP1Odfj6doVH
         8p1w==
X-Gm-Message-State: AFuF++l9SuViNlAnOuY853K9pSJIS5AO00wOYzfWkqQAA9IbjwQ46h94
	Erqf+bEvZCjjg31UBXyIssHVwfXP/E1L1B4/lMc58n8fqJNeNYKYeA0RnSvjC2afCAeXwovLHRH
	RSAewY2BmutY2DnSIUnyVhm8yRnXKL7M8o5u38TkeIW3kUEE7J7NQh+0nDZt3PKyH18S/sYE4Rw
	SkHzszjcfyE3hzOcdJ0Kl4CjBZYFr8ibBYRIje8xkYBlOGpvHd96U640o=
X-Received: from pjbmj9.prod.google.com ([2002:a17:90b:3689:b0:39d:bebd:df7e])
 (user=suleiman job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3b91:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39e1e2bf7a7mr15545672a91.6.1789619643055;
 Wed, 16 Sep 2026 21:34:03 -0700 (PDT)
Date: Thu, 17 Sep 2026 04:33:31 +0000
In-Reply-To: <20260917043339.2093426-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917043339.2093426-8-suleiman@google.com>
Subject: [RFC PATCH 07/12] futex: Make FUTEX_*_PING use Proxy Execution.
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

Set the locker side proxy execution bits, so that a task blocked on
a PING futex can act as a donor.

Signed-off-by: Suleiman Souhlal <suleiman@google.com>
---
 include/linux/futex.h | 11 +++++++++++
 include/linux/sched.h | 12 ++++++++++++
 kernel/futex/ping.c   |  7 +++++++
 kernel/sched/core.c   |  7 +++++++
 4 files changed, 37 insertions(+)

diff --git a/include/linux/futex.h b/include/linux/futex.h
index b1b422b480fb..84eca792e44a 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -170,4 +170,15 @@ static inline struct task_struct *ping_mutex_owner(struct ping_mutex *ping_mutex
 	return READ_ONCE(ping_mutex->owner);
 }
 
+static inline void ping_mutex_lock_wait_lock(struct ping_mutex *ping_mutex)
+{
+	lockdep_assert_irqs_disabled();
+	raw_spin_lock(&ping_mutex->wait_lock);
+}
+
+static inline void ping_mutex_unlock_wait_lock(struct ping_mutex *ping_mutex)
+{
+	raw_spin_unlock(&ping_mutex->wait_lock);
+}
+
 #endif /* _LINUX_FUTEX_H */
diff --git a/include/linux/sched.h b/include/linux/sched.h
index a7de5c496e3c..200f41c38333 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -835,6 +835,7 @@ struct task_ipi_mask { };
 enum blocked_on_type {
 	BO_T_NONE,
 	BO_T_MUTEX,
+	BO_T_PING_FUTEX,
 };
 
 struct blocked_on_lock {
@@ -2257,6 +2258,13 @@ static inline void __set_task_blocked_on(struct task_struct *p, void *m,
 	p->blocked_on.type = type;
 }
 
+static inline void set_task_blocked_on(struct task_struct *p, void *m,
+				       enum blocked_on_type type)
+{
+	guard(raw_spinlock_irqsave)(&p->blocked_lock);
+	__set_task_blocked_on(p, m, type);
+}
+
 static inline void __clear_task_blocked_on(struct task_struct *p, void *m)
 {
 	/* Currently we serialize blocked_on under the task::blocked_lock */
@@ -2278,6 +2286,10 @@ static inline void clear_task_blocked_on(struct task_struct *p, void *m)
 }
 
 #else
+static inline void set_task_blocked_on(struct task_struct *p, void *m,
+				       enum blocked_on_type type)
+{
+}
 static inline void __clear_task_blocked_on(struct task_struct *p, void *m)
 {
 }
diff --git a/kernel/futex/ping.c b/kernel/futex/ping.c
index ebcd3c4a7793..689f149f7150 100644
--- a/kernel/futex/ping.c
+++ b/kernel/futex/ping.c
@@ -370,6 +370,9 @@ int futex_lock_ping(u32 __user *uaddr, unsigned int flags, ktime_t *time,
 
 		queued = false;
 		while (1) {
+			set_task_blocked_on(current, &q.ping_state->ping_mutex,
+					    BO_T_PING_FUTEX);
+
 			set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
 			if (!queued) {
 				futex_queue(&q, hb, current);
@@ -382,6 +385,9 @@ int futex_lock_ping(u32 __user *uaddr, unsigned int flags, ktime_t *time,
 
 			futex_do_wait(&q, to);
 
+			clear_task_blocked_on(current,
+					      &q.ping_state->ping_mutex);
+
 			futex_q_lockptr_lock(&q);
 			if (to && !to->task) {
 				ret = -ETIMEDOUT;
@@ -511,6 +517,7 @@ int futex_unlock_ping(u32 __user *uaddr, unsigned int flags)
 	/* Leave it queued, it gets unqueued on the lock side */
 	get_task_struct(top_waiter->task);
 	wake_q_add_safe(&wake_q, top_waiter->task);
+	clear_task_blocked_on(top_waiter->task, &ping_state->ping_mutex);
 	spin_unlock(&hb->lock);
 
 	/*
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 2e8fe4b9bb88..1d35b1d90ea2 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -68,6 +68,7 @@
 #include <linux/wait_api.h>
 #include <linux/workqueue_api.h>
 #include <linux/livepatch_sched.h>
+#include <linux/futex.h>
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 # ifdef CONFIG_GENERIC_IRQ_ENTRY
@@ -158,6 +159,8 @@ static inline struct task_struct *__blocked_on_owner(struct blocked_on_lock *bo)
 		return NULL;
 	case BO_T_MUTEX:
 		return __mutex_owner(bo->lock);
+	case BO_T_PING_FUTEX:
+		return ping_mutex_owner(bo->lock);
 	default:
 		WARN_ON_ONCE(1);
 		return NULL;
@@ -6907,6 +6910,8 @@ lock_blocked_on_lock(struct blocked_on_lock *bo)
 {
 	if (bo->type == BO_T_MUTEX)
 		raw_spin_lock(&((struct mutex *)bo->lock)->wait_lock);
+	else if (bo->type == BO_T_PING_FUTEX)
+		ping_mutex_lock_wait_lock(bo->lock);
 	else
 		WARN_ON_ONCE(1);
 }
@@ -6916,6 +6921,8 @@ unlock_blocked_on_lock(struct blocked_on_lock *bo)
 {
 	if (bo->type == BO_T_MUTEX)
 		raw_spin_unlock(&((struct mutex *)bo->lock)->wait_lock);
+	else if (bo->type == BO_T_PING_FUTEX)
+		ping_mutex_unlock_wait_lock(bo->lock);
 	else
 		WARN_ON_ONCE(1);
 }
-- 
2.55.0.1082.g2b9226bbc0-goog

