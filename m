Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B5F4FECCC
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788634754; cv=none; b=Qpzv86VFyqPHxGEw7k/Hx/mjpGTRxyXGOnSuhRh29e3FfDPkdLleq0rh8Yv3CwcYYoFMNX9IfMRMHyR4WG3WQdTWA8Q08Z15bQc/V2B/ZfyhJRywRpPAdphBb4UDHISijINf1oTuYVD+0y6ozXF+w0mbxsbQtbLUXNQ+5uKvtCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788634754; c=relaxed/simple;
	bh=mDk2bQySUrJhdtfJ12Stba7VPpmFF4fHG2BPn1U1ih0=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=AibMgy0M5QodCIxr/iKvOHBJQt+1QueCXYHS0aicCc/JslsFeCVz4QWQmh1dMpipKniqhVfnLFMAon+97LECd+sqZubRip+iSoblReH9l7ZKExTn5Pi+JqmemCzgcW0QPWVGs6K0BuTrPjQo7aU+yTSt4jLbQ2mVkYrEXQKXtU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRr17moj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRr17moj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D941F00A3D;
	Sat,  5 Sep 2026 18:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788634753;
	bh=21dLz+aWw/v1qU19J/pr3WuhJ11q+7EA9bh2f3xhJDQ=;
	h=Date:From:To:Cc:Subject:References;
	b=KRr17mojpo6SoytIz8DbLCcWc6ziF+jSzpjWtswtLJdF6j1dDbm8KoguoR04dykF3
	 48D62hMkvzAvZdPql/8dCnyDj3yMpY3CxqlrUYS7UoRxqmbqqNb0ideZ1FrGprmuxn
	 pF3ErlhgDvUgc+RuvLiXHX+H7l3H+VDvWcOd+5TF6v7qAtgcSRKafPT3+7Rut7kZQD
	 NbaY4UkopCFZXhYODEwpPVaiwJ2BMZpyoq82akwEEF4d9JRS2al04GGh04lQOq/A5S
	 DrYz0yrb4neXJx1cC1y/IOrbiwWVfPQ7qYgC9R+is51XdkDMIYSC7bkK4Rrq7/n1U1
	 EFBVZGnSjZaBw==
Date: Sat, 05 Sep 2026 20:59:10 +0200
Message-ID: <20260905185839.768037117@kernel.org>
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
Subject: [patch V2 3/8] posix-timers: Move posixtimer_exec_cleanup() out of
 exec.c
References: <20260905181551.738186850@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Move it to the POSIX timer code and provide a proper stub when POSIX timers
are disabled in Kconfig.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 fs/exec.c                    |   13 +------------
 include/linux/posix-timers.h |    3 +++
 kernel/time/posix-timers.c   |    9 +++++++++
 3 files changed, 13 insertions(+), 12 deletions(-)

--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1115,17 +1115,6 @@ static struct file *bprm_identity_file(c
 	return bprm->file;
 }
 
-static void posixtimer_exec(struct task_struct *me)
-{
-#ifdef CONFIG_POSIX_TIMERS
-	spin_lock_irq(&me->sighand->siglock);
-	posix_cpu_timers_exit(me);
-	spin_unlock_irq(&me->sighand->siglock);
-	exit_itimers(me);
-	flush_itimer_signals();
-#endif
-}
-
 /*
  * Calling this is the point of no return. None of the failures will be
  * seen by userspace since either the process is already taking a fatal
@@ -1171,7 +1160,7 @@ int begin_new_exec(struct linux_binprm *
 	 * timer would not remove an enqueued timer because the TID lookup
 	 * of the old TID fails.
 	 */
-	posixtimer_exec(me);
+	posixtimer_exec();
 
 	/* see the comment in check_unsafe_exec() */
 	current->fs->in_exec = 0;
--- a/include/linux/posix-timers.h
+++ b/include/linux/posix-timers.h
@@ -232,6 +232,8 @@ void set_process_cpu_timer(struct task_s
 int update_rlimit_cpu(struct task_struct *task, unsigned long rlim_new);
 
 #ifdef CONFIG_POSIX_TIMERS
+void posixtimer_exec(void);
+
 static inline void posixtimer_putref(struct k_itimer *tmr)
 {
 	if (rcuref_put(&tmr->rcuref))
@@ -259,6 +261,7 @@ static inline bool posixtimer_valid(cons
 	return !(val & 0x1UL);
 }
 #else  /* CONFIG_POSIX_TIMERS */
+static inline void posixtimer_exec(void) { }
 static inline void posixtimer_sigqueue_getref(struct sigqueue *q) { }
 static inline void posixtimer_sigqueue_putref(struct sigqueue *q) { }
 #endif /* !CONFIG_POSIX_TIMERS */
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -1120,6 +1120,15 @@ void exit_itimers(struct task_struct *ts
 	}
 }
 
+void posixtimer_exec(void)
+{
+	scoped_guard(spinlock_irq, &current->sighand->siglock)
+		posix_cpu_timers_exit(current);
+
+	exit_itimers(current);
+	flush_itimer_signals();
+}
+
 SYSCALL_DEFINE2(clock_settime, const clockid_t, which_clock,
 		const struct __kernel_timespec __user *, tp)
 {

