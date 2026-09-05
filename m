Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EC93839AA
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788634741; cv=none; b=D7REd8QnWyyOccPMP+Hq3ZqPRT1dwUYVegHyNEmCFFzFbTdwoR8p6FMupyVzvjYwFCCreNHw7IvOSUvVe+O5vSJnheC/baiog2vmcW4xqP1umqUksLiRtmVkenoTd4LdJ3aDMY60irtzOdz0Qua6I1TnsW2Mh4NPeVcFQ3Y37+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788634741; c=relaxed/simple;
	bh=/CaTHJCcjyBgOctgjb3FVA++734VieBxGpqBjau3cm4=;
	h=Date:Message-ID:From:To:Cc:Subject; b=W89jwF3AYG6uS2QvOihnzvEYEspMKmgcWatRZvBo7k2eVghhAyfewn6vY5ifLFSjOiRKv8xoAJVB5o3MR+wI42BMImoNhD8Zk/vIS1g4KtSwt4JLwIgzlsgW9Y9UxzyRft54gGNNA+SIJm8sRnLQUCvZkEAt2BSTmXy8ItBqNcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKwJ6Wjh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKwJ6Wjh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BA21F00A3A;
	Sat,  5 Sep 2026 18:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788634739;
	bh=o4k4Um8yWaB2wx+MB74FsSWCb5uFqnkX5fYli84JgS4=;
	h=Date:From:To:Cc:Subject;
	b=OKwJ6WjhXhwbmjufUTmfcraWMOLs9ZJK+dudvQwqFGkGF2Y19MdrCO2aFtyjg1CgM
	 PlN1bxRgJZb6rCz2778SCWaLdRlM9ENXIf5XW4IMKvGFVlKd0oZ2Bk0jGHHzVK0fL5
	 t+XW02vlUTqdreHGfswoVo/0VfrWNoltq/eQFxXwX81liIlQrSbjpOZA62kO8wccTN
	 HaXZhi5/ujk5vS0v6chbOM2FBl8ZqxFmi9F/dqMt1VEqqIqBXtl0STZ3b7FZSPWCQt
	 jRM0ZAxkc2REe5N0ND12Z1vxS2sCz09jplL4HHNvCNk2dIeiwoaW4VaDIYf4/tbBxk
	 pKgAvKNsaL7yg==
Date: Sat, 05 Sep 2026 20:58:56 +0200
Message-ID: <20260905181551.738186850@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "Cc: Hyunwoo Kim" <imv4bel@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 John Stultz <jstultz@google.com>,
 Ingo Molnar <mingo@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Subject: [patch V2 0/8] exec/exit: POSIX timer related bugfixes and related
 cleanups
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

This is a follow up to V1 which can be found here:

  https://lore.kernel.org/20260904112100.683893401@kernel.org

Recent findings from Hyunwoo unearthed two bugs in handling POSIX timers on
exec().

The relevant patches, reports and discussions can be found here:

   https://patch.msgid.link/aok1rdkBgZsynHZB@v4bel
   https://patch.msgid.link/ao7Q8miiuLAPVnWv@v4bel

TLDR:

Both problems are related to non-leader exec(). POSIX CPU timers which are
targeted at tasks hold a pid reference of the target task, which is used to
look up the task in the related POSIX timer operations.

The non-leader exec() switches the TID of the old and the new leader, which
obviously invalidates these references for pid_task(PIDTYPE_PID) lookups.

This causes UAFs due to the resulting list corruptions or premature freeing
without removing the underlying POSIX CPU timers from the involved tasks.

The first issue which corrupts the signal pending list is solved by:

    - Preventing the queueing of per task signals on a task which has
      PF_EXITING set.

    - Protecting the unlocked setting of PF_EXITING in exit_signals() with
      sighand lock.

    - Flushing all per task signals right in exit_signals()

The second issue which keeps the POSIX CPU timers queued on the new leader
is solved by:

    - Moving the exec related POSIX timer cleanup right after de_thread()
      which ensures that the timers queued in new_leader::posix_cputimers
      are removed before the underlying POSIX timers are deleted.

After looking deeper at the exit() handling it turned out that the POSIX
timer cleanups can be done early in do_exit() instead of delaying them
until release_task().

The reason for this late cleanup is that POSIX CPU timers can be created,
rearmed and deleted as long as a task is visible, i.e. the pid is hashed
and sighand is not NULL. This allows to retrieve information from the timer
up to the point where the task is gone for real and that can't be changed
easily as that'd be a user visible change.

But once PF_EXITING is set on a task the task does not longer expire POSIX
CPU timers. So it makes no sense that the timers stay queued in
task::posix_cputimers after that point.

The only thing which needs to be prevented is that timers are requeued on
task::posix_cputimers once PF_EXITING is set or requeued on
signal::posix_cputimers when PF_EXITING is set and signal::live is zero,
which indicates that the thread group is dead.

With that solved the timers can be dequeued from task::posix_cputimer
pending when a task exits and from signal::posix_cputimer pending once the
threadgroup reaches the dead state, i.e. signal::live goes to zero in
do_exit().

The changes vs. V1:

    - Prevent requeuing POSIX timer signals in posixtimer_sig_unignore()
      when the target is exiting - Oleg, Frederic

    - Use signal::flags SIGNAL_GROUP_EXIT instead of signal::live to
      determine whether there is a group exit in progress - Eric

    - Refine existing and add new comments

The delta patch against V1 is below.

The series applies on 7.3-rc1 and is avalaible from git:

    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git posix-timers

Thanks,

	tglx

---
diff --git a/fs/exec.c b/fs/exec.c
index caed7c3566ca..67418118df5a 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1156,9 +1156,9 @@ int begin_new_exec(struct linux_binprm * bprm)
 	/*
 	 * This must be done here to ensure that POSIX CPU timers which were
 	 * armed on the current task are dequeued from me::posix_cputimers.
-	 * That ensures that in case of a TID switch the deletion of the related
-	 * POSIX timer will not free an enqueued timer because the TID lookup
-	 * failed as the original target TID was the old leader.
+	 * Otherwise in case of a TID switch the deletion of the related POSIX
+	 * timer would not remove an enqueued timer because the TID lookup
+	 * of the old TID fails.
 	 */
 	posixtimer_exec();
 
diff --git a/kernel/signal.c b/kernel/signal.c
index a3c6a47460af..f93d8f77ec1a 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1029,6 +1029,21 @@ static inline bool legacy_queue(struct sigpending *signals, int sig)
 	return (sig < SIGRTMIN) && sigismember(&signals->signal, sig);
 }
 
+/*
+ * When PF_EXITING is set the task is on the way out and has t::pending
+ * flushed already. Prevent queueing of PIDTYPE_PID signals as they would
+ * be leaked.
+ */
+static inline bool task_can_queue_signal(struct task_struct *t, enum pid_type type)
+{
+	lockdep_assert_held(&t->sighand->siglock);
+
+	if (!(t->flags & PF_EXITING))
+		return true;
+
+	return type != PIDTYPE_PID;
+}
+
 static int __send_signal_locked(int sig, struct kernel_siginfo *info,
 				struct task_struct *t, enum pid_type type, bool force)
 {
@@ -1041,7 +1056,7 @@ static int __send_signal_locked(int sig, struct kernel_siginfo *info,
 
 	result = TRACE_SIGNAL_IGNORED;
 
-	if (unlikely(type == PIDTYPE_PID && (t->flags & PF_EXITING)))
+	if (!task_can_queue_signal(t, type))
 		goto ret;
 
 	if (!prepare_signal(sig, t, force))
@@ -1982,11 +1997,25 @@ static inline struct task_struct *posixtimer_get_target(struct k_itimer *tmr)
 	struct task_struct *t = pid_task(tmr->it_pid, tmr->it_pid_type);
 
 	if (t && tmr->it_pid_type != PIDTYPE_PID &&
-	    same_thread_group(t, current) && !current->exit_state)
+	    same_thread_group(t, current) && !(current->flags & PF_EXITING))
 		t = current;
 	return t;
 }
 
+/*
+ * Find the target task for the POSIX timer signal and prevent that a
+ * PIDTYPE_PID signal is queued on a task which has PF_EXITING set.
+ */
+static inline struct task_struct *posixtimer_get_unignore_target(struct k_itimer *tmr)
+{
+	struct task_struct *t = posixtimer_get_target(tmr);
+
+	if (t && task_can_queue_signal(t, tmr->it_pid_type))
+		return t;
+
+	return NULL;
+}
+
 void posixtimer_send_sigqueue(struct k_itimer *tmr)
 {
 	struct sigqueue *q = &tmr->sigq;
@@ -2004,7 +2033,7 @@ void posixtimer_send_sigqueue(struct k_itimer *tmr)
 	if (!likely(lock_task_sighand(t, &flags)))
 		return;
 
-	if (unlikely(tmr->it_pid_type == PIDTYPE_PID && (t->flags & PF_EXITING)))
+	if (!task_can_queue_signal(t, tmr->it_pid_type))
 		goto unlock;
 
 	/*
@@ -2154,7 +2183,7 @@ static void posixtimer_sig_unignore(struct task_struct *tsk, int sig)
 		 * has exited by now, drop the reference count.
 		 */
 		guard(rcu)();
-		target = posixtimer_get_target(tmr);
+		target = posixtimer_get_unignore_target(tmr);
 		if (target)
 			posixtimer_queue_sigqueue(&tmr->sigq, target, tmr->it_pid_type);
 		else
diff --git a/kernel/time/posix-cpu-timers.c b/kernel/time/posix-cpu-timers.c
index 29ee485d4d0b..53e47c1b56c2 100644
--- a/kernel/time/posix-cpu-timers.c
+++ b/kernel/time/posix-cpu-timers.c
@@ -686,13 +686,25 @@ void posix_cpu_timers_exit_group(void)
 	cleanup_timers(&current->signal->posix_cputimers);
 }
 
-static inline bool task_can_enqueue(struct k_itimer *timer, struct task_struct *p)
+/*
+ * This function validates that POSIX CPU timers can be safely enqueued on the
+ * target task.
+ *
+ * Enqueue is allowed when PF_EXITING is not set. If set then it is only allowed
+ * for process shared timers (type = PIDTYPE_TGID) as long as tsk::signal::flags
+ * does not have SIGNAL_GROUP_EXIT set. PIDTYPE_PID targets are not allowed at
+ * all when the task has PF_EXITING set.
+ *
+ * This guarantees that after the POSIX timer cleanup in posixtimer_exit() no
+ * POSIX CPU timers are queued on the task or in case of a group exit on the
+ * process.
+ */
+static inline bool task_can_enqueue_timer(struct task_struct *tsk, enum pid_type type)
 {
-	if (likely(!(p->flags & PF_EXITING)))
+	if (likely(!(tsk->flags & PF_EXITING)))
 		return true;
 
-	/* Allow TGID type unless the last thread is on the way out. */
-	return clock_pid_type(timer->it_clock) == PIDTYPE_TGID && atomic_read(&p->signal->live);
+	return type == PIDTYPE_TGID && !(tsk->signal->flags & SIGNAL_GROUP_EXIT);
 }
 
 /*
@@ -709,18 +721,7 @@ static void arm_timer(struct k_itimer *timer, struct task_struct *p)
 
 	timer->it_status = POSIX_TIMER_ARMED;
 
-	/*
-	 * Don't enqueue timers when the task or the group is exiting. That
-	 * ensures that timer operations are still succeeding as long as the
-	 * tasks are visible, but won't enqueue the timers on the task or
-	 * process. They won't expire anyway because run_posix_cpu_timers()
-	 * exits early when PF_EXITING is set.
-	 *
-	 * Enqueue is skipped if PF_EXITING is set when the timer is per task
-	 * and when the last thread decremented p::signal::live to zero also for
-	 * per process timers.
-	 */
-	if (unlikely(!task_can_enqueue(timer, p)))
+	if (unlikely(!task_can_enqueue_timer(p, clock_pid_type(timer->it_clock))))
 		return;
 
 	if (!cpu_timer_enqueue(&base->tqhead, ctmr))


