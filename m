Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFE446AF10
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117770; cv=none; b=O87ryf6Eov7bDh5ag2qOHAjm8lD31nb1ttbRs2g8cW+GJlA6L8ZJ5sUi+LNEwkpuEL5tPhgcLuP7UAjajPQQqMKj/nilNO99hFGaah4EdqbHR2yBI56d1EtuYu4g6h3yyKq03FvWLPAiuyKU9uc2EZwA9Njo4W3tr5cPS39vfI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117770; c=relaxed/simple;
	bh=QcPT1O5udzEAHQAmOkNNZGnR4Yeb5MhJJrpiMVo0GQE=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=sMYpT+vKXg2AoW+/pKZzJkdGUkS6fgDEnfVTTfMP566Xgwhk+SZ1mdE8N108Qky6us/93+uZuiFiil8r7bdD5tOyJoGuo2a+enu4ImRwb8APvDaU4KJH/cX7314GKoMrXZgykX1q7oAe3fAt7V+7W4r7HL0MCteMUnzBojOYRRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9mzOQDY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9mzOQDY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFECC1F000FF;
	Fri, 11 Sep 2026 09:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789117769;
	bh=4INRM/YFXOw3QS2Rbcs8f2iICDzucWZWY3PKQdTudD0=;
	h=Date:From:To:Cc:Subject:References;
	b=e9mzOQDYV4QwlL/YIRdXw4EqI+ySCVp1r5a0N+ijY90+NLikW7Ktw9vR2cIaCvPmT
	 2Sifs1UL/UvyebxjHpl9aD8RTGPKCVrv0T4nGfaxs8k0zrus+VN4sSESwwzxyDZZ6A
	 fvxx2h0n0U+dCOTP0469BCooUc24EjRTBxNVioExYA0sIciUiX4lKqHn+nmF16LVeC
	 tFXcDEfmj2kD1GjQU9JCp//v7c6e3TjjDVGpXmhB/ml46VAxPkb0SUWzGXViOXRhic
	 YKzrTQ3m6HZjGTLJ5vGS23o7m8JN04vC28qpveAb3+5hmQg+vrVEY0+Cye459XWLZp
	 lBdmN4UejlKyQ==
Date: Fri, 11 Sep 2026 11:09:26 +0200
Message-ID: <20260911090541.733966325@kernel.org>
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
Subject: [patch V3 4/8] posix-timers: Move POSIX timer group exit related code
 out of do_exit()
References: <20260911090341.949101445@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Thomas Gleixner <tglx@kernel.org>

Move the POSIX timer group exit handling into the posix timer code and
provide a proper stub when POSIX timers are disabled in Kconfig.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

---
 include/linux/posix-timers.h |    2 ++
 include/linux/sched/task.h   |    1 -
 kernel/exit.c                |    7 +++----
 kernel/time/posix-timers.c   |   16 +++++++++-------
 4 files changed, 14 insertions(+), 12 deletions(-)
--- a/include/linux/posix-timers.h
+++ b/include/linux/posix-timers.h
@@ -233,6 +233,7 @@ int update_rlimit_cpu(struct task_struct
 
 #ifdef CONFIG_POSIX_TIMERS
 void posixtimer_exec(void);
+void posixtimer_exit(void);
 
 static inline void posixtimer_putref(struct k_itimer *tmr)
 {
@@ -262,6 +263,7 @@ static inline bool posixtimer_valid(cons
 }
 #else  /* CONFIG_POSIX_TIMERS */
 static inline void posixtimer_exec(void) { }
+static inline void posixtimer_exit(void) { }
 static inline void posixtimer_sigqueue_getref(struct sigqueue *q) { }
 static inline void posixtimer_sigqueue_putref(struct sigqueue *q) { }
 #endif /* !CONFIG_POSIX_TIMERS */
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -94,7 +94,6 @@ static inline void exit_thread(struct ta
 extern __noreturn void do_group_exit(int);
 
 extern void exit_files(struct task_struct *);
-extern void exit_itimers(struct task_struct *);
 
 extern pid_t kernel_clone(struct kernel_clone_args *kargs);
 struct task_struct *copy_process(struct pid *pid, int trace, int node,
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -963,13 +963,12 @@ void __noreturn do_exit(long code)
 			panic("Attempted to kill init! exitcode=0x%08x\n",
 				tsk->signal->group_exit_code ?: (int)code);
 
-#ifdef CONFIG_POSIX_TIMERS
-		hrtimer_cancel(&tsk->signal->real_timer);
-		exit_itimers(tsk);
-#endif
+		posixtimer_exit();
+
 		if (tsk->mm)
 			setmax_mm_hiwater_rss(&tsk->signal->maxrss, tsk->mm);
 	}
+
 	acct_collect(code, group_dead);
 	if (group_dead)
 		tty_audit_exit();
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -1077,13 +1077,9 @@ SYSCALL_DEFINE1(timer_delete, timer_t, t
 	return 0;
 }
 
-/*
- * Invoked from do_exit() when the last thread of a thread group exits.
- * At that point no other task can access the timers of the dying
- * task anymore.
- */
-void exit_itimers(struct task_struct *tsk)
+static void posixtimer_delete_timers(void)
 {
+	struct task_struct *tsk = current;
 	struct hlist_head timers;
 	struct hlist_node *next;
 	struct k_itimer *timer;
@@ -1120,12 +1116,18 @@ void exit_itimers(struct task_struct *ts
 	}
 }
 
+void posixtimer_exit(void)
+{
+	hrtimer_cancel(&current->signal->real_timer);
+	posixtimer_delete_timers();
+}
+
 void posixtimer_exec(void)
 {
 	scoped_guard(spinlock_irq, &current->sighand->siglock)
 		posix_cpu_timers_exit(current);
 
-	exit_itimers(current);
+	posixtimer_delete_timers();
 	flush_itimer_signals();
 }
 



