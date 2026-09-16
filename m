Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942674B0E57;
	Wed, 16 Sep 2026 16:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577306; cv=none; b=FlJNq1o7HH2yOQsCNgIxs7/uGMxmJs5EUVKKaINElKqna6HW3SKckeNtWFEmzF2MizosO+lNRbNVQM7aOQY6rCIxasZQVjCx5dCXJH7E6rP+CNoW8+1sfkSGVOiun5l9H/3fwBKF+jYMITXcBY+tenTKArHU3fYUOxN3L4rvxjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577306; c=relaxed/simple;
	bh=3hGhHmtAqYUbuH/zVjBZaZNE3/mW1A1rrNOi4kW/N8o=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=QMWqa1qEliud2v83VuMayhocwvL+0rsSq/ilqUmitXE/5M/K2qarWXqjJ2jHkC9/bnqug9JrbbCNTYX9T6qN7x+o76fttzNK+k8UWnWPSedn7bcdrwt4egzS/n4I/nt3DCWt57PnAtRz5cHvcJpj8iAg9JEIVV/N+lnsMwT4ZsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XHfl3vtU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JG4k9T94; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XHfl3vtU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JG4k9T94"
Date: Wed, 16 Sep 2026 16:48:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789577284;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cJmrEo6QzxVrYpgSO3ZsSMWHxZEOyslKfadD+X8c+JE=;
	b=XHfl3vtUNNimia1WTjqXXOqI6a7Hg1AugX+ir6Ob40sorhT5eQI9qdDiUdH3m276XG2rgt
	YHDysNpd7XoVTt++N0x4feskX4Q3raMWJLj9e9//cxIm3fGzqpdbvgai6wn0ttREo4UUJZ
	EhcMa5Vx228ls10gHlgUxfC4qhwImbiry5Q2zskgbPlFiP4Vyd8H3zLJaR4HC1NjQS73cZ
	wbGmquaHB350b+9U76EckJnbe6krEcoFdL/Ex1avlkRXKvBZb1gIMNmfs5PX6BrCeP3Mw5
	lwt94RKmRC0nvwTcZeMYgzfzlJQxZ7mc4fxGhoZ88kd2zDtIbd8kPCHEUpMmSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789577284;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cJmrEo6QzxVrYpgSO3ZsSMWHxZEOyslKfadD+X8c+JE=;
	b=JG4k9T94dFOA/jPBJpSYQoTzzq9FaNkphB6QXH6Sg7AiYJ93BHGqI0YeEkZS1QLOBCP85d
	g+rkRl9J9hYacjBg==
From: "tip-bot2 for Thomas Gleixner" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] posix-timers: Handle exit in do_exit() completely
Cc: Thomas Gleixner <tglx@kernel.org>, Kijo Park <red993688@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Frederic Weisbecker <frederic@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911090541.947206186@kernel.org>
References: <20260911090541.947206186@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178957728271.1720534.17162278399020789474.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     7b07d15ed1d78cb49309754a2d14dacdddb058c7
Gitweb:        https://git.kernel.org/tip/7b07d15ed1d78cb49309754a2d14dacdddb=
058c7
Author:        Thomas Gleixner <tglx@kernel.org>
AuthorDate:    Fri, 11 Sep 2026 11:09:44 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Wed, 16 Sep 2026 18:44:04 +02:00

posix-timers: Handle exit in do_exit() completely

Now that POSIX CPU timers cannot be enqueued on a task after PF_EXITING is
set and process wide timers cannot be enqueued when PF_EXITING is set and
the last thread in the group is exiting, it is possible to mop up POSIX
timers in do_exit() completely.

This requires to cancel an eventually pending POSIX CPU timer task work
right there because do_exit() invokes exit_task_work() later, which would
be acting on torn down data.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Tested-by: Kijo Park <red993688@gmail.com>
Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Link: https://patch.msgid.link/20260911090541.947206186@kernel.org
---
 include/linux/posix-timers.h   |  6 +----
 kernel/exit.c                  | 10 +-------
 kernel/time/posix-cpu-timers.c | 41 +++++++++++++++++++++++++++------
 kernel/time/posix-timers.c     | 15 +++++++-----
 kernel/time/posix-timers.h     |  3 ++-
 5 files changed, 50 insertions(+), 25 deletions(-)

diff --git a/include/linux/posix-timers.h b/include/linux/posix-timers.h
index 0033a06..00767ac 100644
--- a/include/linux/posix-timers.h
+++ b/include/linux/posix-timers.h
@@ -192,8 +192,6 @@ struct k_itimer {
 } ____cacheline_aligned_in_smp;
=20
 void run_posix_cpu_timers(void);
-void posix_cpu_timers_exit(struct task_struct *task);
-void posix_cpu_timers_exit_group(struct task_struct *task);
 void set_process_cpu_timer(struct task_struct *task, unsigned int clock_idx,
 			   u64 *newval, u64 *oldval);
=20
@@ -201,7 +199,7 @@ int update_rlimit_cpu(struct task_struct *task, unsigned =
long rlim_new);
=20
 #ifdef CONFIG_POSIX_TIMERS
 void posixtimer_exec(void);
-void posixtimer_exit(void);
+void posixtimer_exit(bool group_dead);
=20
 static inline void posixtimer_putref(struct k_itimer *tmr)
 {
@@ -231,7 +229,7 @@ static inline bool posixtimer_valid(const struct k_itimer=
 *timer)
 }
 #else  /* CONFIG_POSIX_TIMERS */
 static inline void posixtimer_exec(void) { }
-static inline void posixtimer_exit(void) { }
+static inline void posixtimer_exit(bool group_dead) { }
 static inline void posixtimer_sigqueue_getref(struct sigqueue *q) { }
 static inline void posixtimer_sigqueue_putref(struct sigqueue *q) { }
 #endif /* !CONFIG_POSIX_TIMERS */
diff --git a/kernel/exit.c b/kernel/exit.c
index 4ca9759..06a1eb1 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -167,12 +167,6 @@ static void __exit_signal(struct release_task_post *post=
, struct task_struct *ts
 					lockdep_tasklist_lock_is_held());
 	spin_lock(&sighand->siglock);
=20
-#ifdef CONFIG_POSIX_TIMERS
-	posix_cpu_timers_exit(tsk);
-	if (group_dead)
-		posix_cpu_timers_exit_group(tsk);
-#endif
-
 	if (group_dead) {
 		tty =3D sig->tty;
 		sig->tty =3D NULL;
@@ -966,12 +960,12 @@ void __noreturn do_exit(long code)
 			panic("Attempted to kill init! exitcode=3D0x%08x\n",
 				tsk->signal->group_exit_code ?: (int)code);
=20
-		posixtimer_exit();
-
 		if (tsk->mm)
 			setmax_mm_hiwater_rss(&tsk->signal->maxrss, tsk->mm);
 	}
=20
+	posixtimer_exit(group_dead);
+
 	acct_collect(code, group_dead);
 	if (group_dead)
 		tty_audit_exit();
diff --git a/kernel/time/posix-cpu-timers.c b/kernel/time/posix-cpu-timers.c
index ddaf81b..9f90500 100644
--- a/kernel/time/posix-cpu-timers.c
+++ b/kernel/time/posix-cpu-timers.c
@@ -661,18 +661,29 @@ static void cleanup_timers(struct posix_cputimers *pct)
 	cleanup_timerqueue(&pct->bases[CPUCLOCK_SCHED].tqhead);
 }
=20
+static inline void posix_cpu_timers_exit_work(void);
+
 /*
- * These are both called with the siglock held, when the current thread
- * is being reaped.  When the final (leader) thread in the group is reaped,
- * posix_cpu_timers_exit_group will be called after posix_cpu_timers_exit.
+ * Invoked from posixtimer_exit_task() after PF_EXITING was set in tsk::flag=
s or
+ * from posixtimer_exec_cleanup().
  */
-void posix_cpu_timers_exit(struct task_struct *tsk)
+void posix_cpu_timers_exit_task(void)
 {
-	cleanup_timers(&tsk->posix_cputimers);
+	posix_cpu_timers_exit_work();
+
+	guard(spinlock_irq)(&current->sighand->siglock);
+	cleanup_timers(&current->posix_cputimers);
 }
-void posix_cpu_timers_exit_group(struct task_struct *tsk)
+
+/*
+ * Invoked from posixtimer_exit_group() after PF_EXITING was set in tsk::fla=
gs.
+ */
+void posix_cpu_timers_exit_group(void)
 {
-	cleanup_timers(&tsk->signal->posix_cputimers);
+	posix_cpu_timers_exit_task();
+
+	guard(spinlock_irq)(&current->sighand->siglock);
+	cleanup_timers(&current->signal->posix_cputimers);
 }
=20
 /*
@@ -1257,6 +1268,20 @@ static void posix_cpu_timers_work(struct callback_head=
 *work)
 	mutex_unlock(&cw->mutex);
 }
=20
+static inline void posix_cpu_timers_exit_work(void)
+{
+	/* Canceling the work is only valid for exit() but not for exec() */
+	if (!(current->flags & PF_EXITING))
+		return;
+	/*
+	 * current->flags has PF_EXITING set so this can be done lockless and
+	 * with interrupts enabled as PF_EXITING prevents the interrupt from
+	 * scheduling the work.
+	 */
+	if (current->posix_cputimers_work.scheduled)
+		task_work_cancel(current, &current->posix_cputimers_work.work);
+}
+
 /*
  * Invoked from the posix-timer core when a cancel operation failed because
  * the timer is marked firing. The caller holds rcu_read_lock(), which
@@ -1387,6 +1412,8 @@ static inline void __run_posix_cpu_timers(struct task_s=
truct *tsk)
 	lockdep_posixtimer_exit();
 }
=20
+static inline void posix_cpu_timers_exit_work(void) { }
+
 static void posix_cpu_timer_wait_running(struct k_itimer *timr)
 {
 	cpu_relax();
diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
index 8fb040a..188dbed 100644
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -1116,17 +1116,20 @@ static void posixtimer_delete_timers(void)
 	}
 }
=20
-void posixtimer_exit(void)
+void posixtimer_exit(bool group_dead)
 {
-	hrtimer_cancel(&current->signal->real_timer);
-	posixtimer_delete_timers();
+	if (group_dead) {
+		hrtimer_cancel(&current->signal->real_timer);
+		posix_cpu_timers_exit_group();
+		posixtimer_delete_timers();
+	} else {
+		posix_cpu_timers_exit_task();
+	}
 }
=20
 void posixtimer_exec(void)
 {
-	scoped_guard(spinlock_irq, &current->sighand->siglock)
-		posix_cpu_timers_exit(current);
-
+	posix_cpu_timers_exit_task();
 	posixtimer_delete_timers();
 	flush_itimer_signals();
 }
diff --git a/kernel/time/posix-timers.h b/kernel/time/posix-timers.h
index 4ea9611..79fd7ea 100644
--- a/kernel/time/posix-timers.h
+++ b/kernel/time/posix-timers.h
@@ -51,3 +51,6 @@ int common_timer_set(struct k_itimer *timr, int flags,
 		     struct itimerspec64 *old_setting);
 void posix_timer_set_common(struct k_itimer *timer, struct itimerspec64 *new=
_setting);
 int common_timer_del(struct k_itimer *timer);
+
+void posix_cpu_timers_exit_task(void);
+void posix_cpu_timers_exit_group(void);
