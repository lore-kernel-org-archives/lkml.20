Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3645013A5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788634760; cv=none; b=TKhr8Ggz/VRuYmV3LX/yRnTq3NXlxjCuYVYHcUo2YjX1h8Osra5hWts0QN29Hw6dnrYAH3t2IzbFuyNjMfDGWKDTiZA8ygkB+BWREMPW3pHIlMVnfo4KoF41yDHig8Z2VN5QBvsbShtZT07qeub799PS/drPUPfzwZk6sJlDD1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788634760; c=relaxed/simple;
	bh=5eedEYn8Z68QDtxB6uO/1ARiw+HAA6+XsotMn7WIIp0=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=ASaV4A7MRNW/O5xvmI/vAJUIho2uWDVsnPbFVKf3L3alvg0f9RGmGOOoD2QD8boac8NIKm5dHLfRUO2RcwQVVGTRS232tLsLjYYy/j4VUT9hIKxCHyi9MGQWvcGq9yPIJ4hpFyyAcGFrNkFUYt/AJYpWi62SVM4VNqcN/U1tbM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0n3Uc8v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0n3Uc8v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F581F00A3A;
	Sat,  5 Sep 2026 18:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788634757;
	bh=2kUc2gyunyVdJuieYMrU6cHtPZKVp3xH/1+8tPD2gtI=;
	h=Date:From:To:Cc:Subject:References;
	b=d0n3Uc8vgOMstvlZKTNS4cAtPK5c9TrrGWO7oA1jIg55tdx94/RrLSnpt0CmVVG+k
	 BPsU38x5R97P4yb6YswuwUgcqyKLfiiEakDRcGga0zAQDrQMSOpY354tziP+Wd3jCV
	 GHgZJgZT1GNTRR5zLxnK0RZtEGnD6neoxcDSaTKwqTx2MkhRM4W1fefOCJwEDD/yQH
	 4LmYSvRG8t6YczpJZiH66ZqUg6jn8PFRlFhK5QSxcnGi4Wr+zUX8kKVrA3cU5lM1Bd
	 XjsLxOm78L/4D03jBgYbaidPYHvAkDiSeoiKAEi+FiDCvp4NPCFrR2LEEG9vf5XzFd
	 enmO4KbaLeBkw==
Date: Sat, 05 Sep 2026 20:59:15 +0200
Message-ID: <20260905185839.816745170@kernel.org>
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
Subject: [patch V2 4/8] posix-timers: Move POSIX timer group exit related code
 out of do_exit()
References: <20260905181551.738186850@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Move the POSIX timer group exit handling into the posix timer code and
provide a proper stub when POSIX timers are disabled in Kconfig.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
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
 

