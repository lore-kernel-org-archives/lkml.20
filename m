Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DB947140A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117790; cv=none; b=A9WhI8OrMU/a1qPx/89xD51AwIwFMqUwOoricyqNzr3WTlMCdOnXdzXbgUHjheAPN0hZQncu/irjL6Tix/rdrtxgZJeoKX0hFJJ8X2y5N+Kix0HIs2tkkk+48nX+aU/i9gGwDBrH//Ilq/hVyKELyIlB7UpW8nJu9oQDNXr5XJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117790; c=relaxed/simple;
	bh=V3ePJRAq7QpAXPjdQXzXFk6raKaFcVFbV+/o+6iRCSY=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=sEVuFFBCCO7UEjelrVUxJ7UE3H8HPKkZVXB8ZBF552ybkiMlssfo8uSlgP/DdguUd/8Lxt2/4nWETwpFMsqEjIORctZshIGICHLOcebbZTIhnBLBSgWrlZNROCk1SdMqBxlWrBbx2gv0DFCq2ILlAqjHqYLEZMGs1StJHSDkpGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrxlnEp7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrxlnEp7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA63F1F00893;
	Fri, 11 Sep 2026 09:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789117787;
	bh=zUUGFJhvSjvnKzK/NZpUJT7SkPRgvkt9USv3AC43/M8=;
	h=Date:From:To:Cc:Subject:References;
	b=JrxlnEp7b66rbxxS8yPf7CrtsDrJK5QmMS9LGNS+elltJC+/dJMCsIaouuK2DVIaJ
	 69lebeXSo/Mhb2h0S05fo3hDXmhDDdJ60w1PnztoYwxz5Maaf5zik3/rExf4jWuTp+
	 UcQ/96qc+2HijjeoMFuqdwa0YffUelD4HVlrhfOubx9Q8L6ZR8GGcZ/26l1pxpJWAJ
	 PkANTN10LeAF3y+RnCWquKz61rypsuCtLxAGKdWHXxRava2PHJT83r5a+NCzo4nfdd
	 b4V78umwpA9rBw1FIuRbRCJeKbf/EuG4VG+sf+Wm/e+NRwT5FiooScwLZbdL4jklhb
	 mghVPj7iVJb7g==
Date: Fri, 11 Sep 2026 11:09:44 +0200
Message-ID: <20260911090541.947206186@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Hyunwoo Kim <imv4bel@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 John Stultz <jstultz@google.com>,
 Ingo Molnar <mingo@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Alan Stern <stern@rowland.harvard.edu>
Subject: [patch V3 8/8] posix-timers: Handle exit in do_exit() completely
References: <20260911090341.949101445@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Thomas Gleixner <tglx@kernel.org>

Now that POSIX CPU timers cannot be enqueued on a task after PF_EXITING is
set and process wide timers cannot be enqueued when PF_EXITING is set and
the last thread in the group is exiting, it is possible to mop up POSIX
timers in do_exit() completely.

This requires to cancel an eventually pending POSIX CPU timer task work
right there because do_exit() invokes exit_task_work() later, which would
be acting on torn down data.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
V3: Don't touch pending posix timer work on exec() - Oleg
---
 include/linux/posix-timers.h   |    6 ++----
 kernel/exit.c                  |   10 ++--------
 kernel/time/posix-cpu-timers.c |   41 ++++++++++++++++++++++++++++++++++-------
 kernel/time/posix-timers.c     |   15 +++++++++------
 kernel/time/posix-timers.h     |    3 +++
 5 files changed, 50 insertions(+), 25 deletions(-)
--- a/include/linux/posix-timers.h
+++ b/include/linux/posix-timers.h
@@ -192,8 +192,6 @@ struct k_itimer {
 } ____cacheline_aligned_in_smp;
 
 void run_posix_cpu_timers(void);
-void posix_cpu_timers_exit(struct task_struct *task);
-void posix_cpu_timers_exit_group(struct task_struct *task);
 void set_process_cpu_timer(struct task_struct *task, unsigned int clock_idx,
 			   u64 *newval, u64 *oldval);
 
@@ -201,7 +199,7 @@ int update_rlimit_cpu(struct task_struct
 
 #ifdef CONFIG_POSIX_TIMERS
 void posixtimer_exec(void);
-void posixtimer_exit(void);
+void posixtimer_exit(bool group_dead);
 
 static inline void posixtimer_putref(struct k_itimer *tmr)
 {
@@ -231,7 +229,7 @@ static inline bool posixtimer_valid(cons
 }
 #else  /* CONFIG_POSIX_TIMERS */
 static inline void posixtimer_exec(void) { }
-static inline void posixtimer_exit(void) { }
+static inline void posixtimer_exit(bool group_dead) { }
 static inline void posixtimer_sigqueue_getref(struct sigqueue *q) { }
 static inline void posixtimer_sigqueue_putref(struct sigqueue *q) { }
 #endif /* !CONFIG_POSIX_TIMERS */
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -167,12 +167,6 @@ static void __exit_signal(struct release
 					lockdep_tasklist_lock_is_held());
 	spin_lock(&sighand->siglock);
 
-#ifdef CONFIG_POSIX_TIMERS
-	posix_cpu_timers_exit(tsk);
-	if (group_dead)
-		posix_cpu_timers_exit_group(tsk);
-#endif
-
 	if (group_dead) {
 		tty = sig->tty;
 		sig->tty = NULL;
@@ -963,12 +957,12 @@ void __noreturn do_exit(long code)
 			panic("Attempted to kill init! exitcode=0x%08x\n",
 				tsk->signal->group_exit_code ?: (int)code);
 
-		posixtimer_exit();
-
 		if (tsk->mm)
 			setmax_mm_hiwater_rss(&tsk->signal->maxrss, tsk->mm);
 	}
 
+	posixtimer_exit(group_dead);
+
 	acct_collect(code, group_dead);
 	if (group_dead)
 		tty_audit_exit();
--- a/kernel/time/posix-cpu-timers.c
+++ b/kernel/time/posix-cpu-timers.c
@@ -661,18 +661,29 @@ static void cleanup_timers(struct posix_
 	cleanup_timerqueue(&pct->bases[CPUCLOCK_SCHED].tqhead);
 }
 
+static inline void posix_cpu_timers_exit_work(void);
+
 /*
- * These are both called with the siglock held, when the current thread
- * is being reaped.  When the final (leader) thread in the group is reaped,
- * posix_cpu_timers_exit_group will be called after posix_cpu_timers_exit.
+ * Invoked from posixtimer_exit_task() after PF_EXITING was set in tsk::flags or
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
+ * Invoked from posixtimer_exit_group() after PF_EXITING was set in tsk::flags.
+ */
+void posix_cpu_timers_exit_group(void)
 {
-	cleanup_timers(&tsk->signal->posix_cputimers);
+	posix_cpu_timers_exit_task();
+
+	guard(spinlock_irq)(&current->sighand->siglock);
+	cleanup_timers(&current->signal->posix_cputimers);
 }
 
 /*
@@ -1257,6 +1268,20 @@ static void posix_cpu_timers_work(struct
 	mutex_unlock(&cw->mutex);
 }
 
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
@@ -1387,6 +1412,8 @@ static inline void __run_posix_cpu_timer
 	lockdep_posixtimer_exit();
 }
 
+static inline void posix_cpu_timers_exit_work(void) { }
+
 static void posix_cpu_timer_wait_running(struct k_itimer *timr)
 {
 	cpu_relax();
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -1116,17 +1116,20 @@ static void posixtimer_delete_timers(voi
 	}
 }
 
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
 
 void posixtimer_exec(void)
 {
-	scoped_guard(spinlock_irq, &current->sighand->siglock)
-		posix_cpu_timers_exit(current);
-
+	posix_cpu_timers_exit_task();
 	posixtimer_delete_timers();
 	flush_itimer_signals();
 }
--- a/kernel/time/posix-timers.h
+++ b/kernel/time/posix-timers.h
@@ -51,3 +51,6 @@ int common_timer_set(struct k_itimer *ti
 		     struct itimerspec64 *old_setting);
 void posix_timer_set_common(struct k_itimer *timer, struct itimerspec64 *new_setting);
 int common_timer_del(struct k_itimer *timer);
+
+void posix_cpu_timers_exit_task(void);
+void posix_cpu_timers_exit_group(void);

