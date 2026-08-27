Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105754A2E1C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853110; cv=none; b=HZ32gUS/Wk02o8PSFD8zH9oz4o5SeUaVF96gEzEamIIrti9F8d/fv0LNH/sBdJ8Ajc18fe/PLJH2/u4OLwDd7GMPDfbK4R1XySg0Lm+PCvMeoMnruPgOWjckd3c6HumfcnTOkGyGOjTP23/0LAQgTANheNPV1ZqKmyo6A3wQO7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853110; c=relaxed/simple;
	bh=T2tkDEOHndMoaIub4e5PKFpO2ZM3G550YypurBfow2g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UnQVfyFu++wRGTnbd9Hk1s8R6Mzqk1U4mgG405ZevFEakOYYFjOMji54IiV9gNaqrSPyhpR5dh7uoEZSbUt0JJDIcr7veJDR9c8PTYMELDmLlOuJk9/J5WBJGjmLzszvgg6WchDdJjBGmzMQPB6wd7XrDpMwgSr2IAroYE5fBmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sq68anAG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sq68anAG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAC61F00A3F;
	Thu, 27 Aug 2026 17:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787853109;
	bh=IkmCuwYCIyOyQTowqI44mjsyuNN22PK3ZMnQIRyifA8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Sq68anAGhb1qfgM62+rWWV91ihJvRHPPzBt5DgWpdXPPo4oYJP23g5gJKCQ7k+nYO
	 vxCT1B6cAGo7104CBJZnuUOmqp/dpzgbZCQXSwQ0uyTCXmj/Zml2R5bfac1xjHOyKW
	 cBIm6NLrlrLXPes+bZ8EnM2oqctNK3TSoNz/qtv22UmCib6AM7h3Q55DGgIb+VH5II
	 fXEwA8hyIKslgM32EjSabO55CtqdddMgpqgiXDd/I4l+/JnVib/N2zZHh6k5+Qndji
	 eAwNY34azHU5qIeUh075zIwaylxNvogM8pzqKTF3HQLPyErKAZh2+eIXSsFrWHGbBg
	 X33VJDw2DiI9Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Frederic Weisbecker <frederic@kernel.org>, Hyunwoo Kim
 <imv4bel@gmail.com>, brauner@kernel.org, peterz@infradead.org,
 anna-maria@linutronix.de, ebiederm@xmission.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Use list_del_init_careful() in flush_sigqueue()
In-Reply-To: <87pkz3g39u.ffs@fw13>
References: <875x10hrkt.ffs@fw13> <8733w3j1i1.ffs@fw13>
 <aowkvvxg8cPP5V0X@redhat.com> <aoww8qi_ce_8ECA9@redhat.com>
 <aoxOVAd8ooqHFW12@localhost.localdomain> <87pkz6gms6.ffs@fw13>
 <ao3kt-eRxw4agOj7@redhat.com> <87fr02gegn.ffs@fw13>
 <ao6zmDB9EjsqPIVN@redhat.com> <87zey8g05g.ffs@fw13>
 <ao8_NUo0ACPAA4QB@redhat.com> <87pkz3g39u.ffs@fw13>
Date: Thu, 27 Aug 2026 19:51:45 +0200
Message-ID: <87h5kffo3y.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 27 2026 at 14:24, Thomas Gleixner wrote:
> I'm actually tempted to move the posix timer cleanup _before_
> de_thread() and just make sure that no new timers can be created anymore.

Something like that:

--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1148,6 +1148,16 @@ int begin_new_exec(struct linux_binprm *
 	 */
 	bprm->point_of_no_return = true;
 
+	/*
+	 * This sets SIGNAL_EXEC in current::signal::flags, which prevents new
+	 * POSIX timers from being created and further POSIX timer signals from
+	 * being queued. It also deletes all existing POSIX timers and flushs
+	 * the corresponding signals from current's and the shared pending list.
+	 */
+	retval = signal_exec_start();
+	if (retval)
+		goto out;
+
 	/* Make this the only thread in the thread group */
 	retval = de_thread(me);
 	if (retval)
@@ -1192,14 +1202,6 @@ int begin_new_exec(struct linux_binprm *
 	if (retval)
 		goto out_unlock;
 
-#ifdef CONFIG_POSIX_TIMERS
-	spin_lock_irq(&me->sighand->siglock);
-	posix_cpu_timers_exit(me);
-	spin_unlock_irq(&me->sighand->siglock);
-	exit_itimers(me);
-	flush_itimer_signals();
-#endif
-
 	/*
 	 * Make the signal table private.
 	 */
@@ -1324,6 +1326,8 @@ int begin_new_exec(struct linux_binprm *
 		}
 		bprm->execfd = retval;
 	}
+
+	signal_exec_done();
 	return 0;
 
 out_unlock:
--- a/include/linux/posix-timers.h
+++ b/include/linux/posix-timers.h
@@ -119,6 +119,7 @@ bool posixtimer_init_sigqueue(struct sig
 void posixtimer_send_sigqueue(struct k_itimer *tmr);
 bool posixtimer_deliver_signal(struct kernel_siginfo *info, struct sigqueue *timer_sigq);
 void posixtimer_free_timer(struct k_itimer *timer);
+void posixtimer_flush_exec(void);
 long posixtimer_create_prctl(unsigned long ctrl);
 
 /* Init task static initializer */
@@ -146,6 +147,7 @@ static inline void posixtimer_rearm_itim
 static inline bool posixtimer_deliver_signal(struct kernel_siginfo *info,
 					     struct sigqueue *timer_sigq) { return false; }
 static inline void posixtimer_free_timer(struct k_itimer *timer) { }
+static inline void posixtimer_flush_exec(void) { }
 static inline long posixtimer_create_prctl(unsigned long ctrl) { return -EINVAL; }
 #endif
 
--- a/include/linux/sched/signal.h
+++ b/include/linux/sched/signal.h
@@ -261,6 +261,8 @@ struct signal_struct {
 #define SIGNAL_STOP_STOPPED	0x00000001 /* job control stop in effect */
 #define SIGNAL_STOP_CONTINUED	0x00000002 /* SIGCONT since WCONTINUED reap */
 #define SIGNAL_GROUP_EXIT	0x00000004 /* group exit in progress */
+#define SIGNAL_EXEC		0x00000008 /* exec in progress */
+
 /*
  * Pending notifications to parent.
  */
@@ -285,6 +287,24 @@ extern void ignore_signals(struct task_s
 extern void flush_signal_handlers(struct task_struct *, int force_default);
 extern int dequeue_signal(sigset_t *mask, kernel_siginfo_t *info, enum pid_type *type);
 
+static inline int signal_exec_start(void)
+{
+	scoped_guard(spinlock_irq, &current->sighand->siglock) {
+		/* Is a group action in progress already? */
+		if (current->signal->flags & (SIGNAL_GROUP_EXIT | SIGNAL_EXEC))
+			return -EAGAIN;
+		current->signal->flags |= SIGNAL_EXEC;
+	}
+	posixtimer_flush_exec();
+	return 0;
+}
+
+static inline void signal_exec_done(void)
+{
+	guard(spinlock_irq)(&current->sighand->siglock);
+	current->signal->flags &= SIGNAL_EXEC;
+}
+
 static inline int kernel_dequeue_signal(void)
 {
 	struct task_struct *task = current;
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1991,6 +1991,23 @@ void posixtimer_send_sigqueue(struct k_i
 		return;
 
 	/*
+	 * If the process is in the middle of exec(), don't queue signals as the
+	 * posix timers of this process are not longer accessible and about to
+	 * be removed. This prevents a race between queueing the signal on a
+	 * exiting former thread group leader in case of a non-leader exec().
+	 * Aside of that it makes no sense to queue anything now when it has to
+	 * be flushed a split second later anyway.
+	 *
+	 * As this conditional is required just use the opportunity and check
+	 * for a group exit too, where queueing signals is equally pointless.
+	 *
+	 * If the signal is already pending or on the ignore list, then nothing
+	 * changes and the final posix timer and signal cleanup will handle them.
+	 */
+	if (unlikely(t->signal->flags & (SIGNAL_GROUP_EXIT | SIGNAL_EXEC)))
+		goto unlock;
+
+	/*
 	 * Update @tmr::sigqueue_seq for posix timer signals with sighand
 	 * locked to prevent a race against dequeue_signal().
 	 */
@@ -2081,6 +2098,7 @@ void posixtimer_send_sigqueue(struct k_i
 	result = TRACE_SIGNAL_DELIVERED;
 out:
 	trace_signal_generate(sig, &q->info, t, tmr->it_pid_type != PIDTYPE_PID, result);
+unlock:
 	unlock_task_sighand(t, &flags);
 }
 
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -462,6 +462,24 @@ static int common_timer_create(struct k_
 	return 0;
 }
 
+static bool timer_set_valid(struct k_itimer *new_timer)
+{
+	guard(spinlock)(&current->sighand->siglock);
+
+	/* If there is a group action in progress, fail */
+	if (current->signal->flags & (SIGNAL_GROUP_EXIT | SIGNAL_EXEC))
+		return false;
+
+	/*
+	 * new_timer::it_signal contains the signal pointer with
+	 * bit 0 set, which makes it invalid for syscall operations.
+	 * Store the unmodified signal pointer to make it valid.
+	 */
+	WRITE_ONCE(new_timer->it_signal, current->signal);
+	hlist_add_head_rcu(&new_timer->list, &current->signal->posix_timers);
+	return true;
+}
+
 /* Create a POSIX.1b interval timer. */
 static int do_timer_create(clockid_t which_clock, struct sigevent *event,
 			   timer_t __user *created_timer_id)
@@ -552,20 +570,33 @@ static int do_timer_create(clockid_t whi
 	 * sighand::siglock is required to protect signal::posix_timers.
 	 */
 	scoped_guard (spinlock_irq, &new_timer->it_lock) {
-		guard(spinlock)(&current->sighand->siglock);
+		if (timer_set_valid(new_timer)) {
+			/*
+			 * After unlocking @new_timer is subject to concurrent removal and
+			 * cannot be touched anymore
+			 */
+			return 0;
+		}
+
 		/*
-		 * new_timer::it_signal contains the signal pointer with
-		 * bit 0 set, which makes it invalid for syscall operations.
-		 * Store the unmodified signal pointer to make it valid.
+		 * A group exit or exec() is in progress. The timer has not been
+		 * marked valid for syscall operations, so it can't be armed or
+		 * firing and the sigqueue is guaranteed to be not queued
+		 * anywhere.
+		 *
+		 * This still needs to invoke kc::timer_del() so that the
+		 * underlying clock implementation can do their cleanups if
+		 * required. E.g. POSIX CPU timers need to put the reference on
+		 * timer::it::cpu::pid.
+		 *
+		 * As the timer cannot be firing kc::timer_del() cannot fail
+		 * with TIMER_RETRY.
 		 */
-		WRITE_ONCE(new_timer->it_signal, current->signal);
-		hlist_add_head_rcu(&new_timer->list, &current->signal->posix_timers);
+		WARN_ON_ONCE(kc->timer_del(new_timer));
+		/* Fall through and unhash the timer */
+		error = -ESRCH;
 	}
-	/*
-	 * After unlocking @new_timer is subject to concurrent removal and
-	 * cannot be touched anymore
-	 */
-	return 0;
+
 out:
 	posix_timer_unhash_and_free(new_timer);
 	return error;
@@ -1120,6 +1151,25 @@ void exit_itimers(struct task_struct *ts
 	}
 }
 
+/* Invoked by the task which runs exec() via signal_exec_start() */
+void posixtimer_flush_exec(void)
+{
+	/*
+	 * Contrary to do_exit() don't invoke posix_cpu_timers_exit(). The
+	 * timers are all mopped up in exit_itimers() right away and the
+	 * SIGNAL_EXEC flag ensures that no new ones can be created.
+	 */
+	exit_itimers(current);
+
+	/*
+	 * Now that all timers are gone flush queued POSIX timer signals in
+	 * current::pending and current::signal::shared_pending. If this is a
+	 * multi-threaded exec() then the other tasks will flush their
+	 * task::pending signals in release_task().
+	 */
+	flush_itimer_signals();
+}
+
 SYSCALL_DEFINE2(clock_settime, const clockid_t, which_clock,
 		const struct __kernel_timespec __user *, tp)
 {
