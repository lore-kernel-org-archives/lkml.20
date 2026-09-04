Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5038A47668A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520955; cv=none; b=IgMajBugiwyPIntV1Zr+7OlWS+3i9VqfGgWina0zzTS6LuM9tO4a/ACEhh4Mkm7q0MjaHw0xHKzSRQtJE2Sq73o3fdcmAQikwvHr13+jurh+UOEiqcOOejvvLL63a9DMVXW10d29YJOMSXslOe5iv3AWNW7riHrTbe7yy6Mp24g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520955; c=relaxed/simple;
	bh=RqDfYCiwlgyuPLoyc4f8FZMqURar5mmcP86OJFNPr/Q=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=dnTtNM3JuXMSBpKDbHr56cmjjdrXB8WlO/lcWryNQCpAN6OneZSAUtgfbdb7JE6Fr5cvnuAGfCmlf1pqGgPtam1jsymWY4ZtrSla8KCnCYNphHLiorCwWI5vr0jghN664GceSBkph2tokQhIVx5ILL40Ymj9fpa5T1dtrAkkzKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZV99/zwB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZV99/zwB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7D71F00ACA;
	Fri,  4 Sep 2026 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788520954;
	bh=eNxFTH4JlmV+mK5Fga9mVimS/lpVLPz1WN5SlwLP+BM=;
	h=Date:From:To:Cc:Subject:References;
	b=ZV99/zwBqkTQD6F4tyzL0U1D/ji74Gsl8agcUH4AlRn0mokiJc/VJy379I66rSiwd
	 l2QPeakGfPs9umtbK+4c/jAF0bvkWQS2kwgtCGYI1haHUI9Yq1c9pmBTTHl6dqbLD4
	 /7/wlqWjhvwE0pdY718XX4n5wRmcjrAkLv+A/4fPaVjoWBNBcVAFEUkjOHKEODVWZ9
	 4MWukSFt8jazuJfSoBDUxp1ukZHQ/ADC84n/q/fjz+7noCdTNBJoEpzN94m8uzNrAV
	 O3tI8KkXkZ9A+f+0TJHmDnWqHgfZUCoMBh+m1dLbAUTO6SjlXbMqjDGdaFxpKjaH01
	 ML2dBbf/EG/dg==
Date: Fri, 04 Sep 2026 13:22:31 +0200
Message-ID: <20260904112202.182757867@kernel.org>
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
 "Eric W. Biederman" <ebiederm@xmission.com>
Subject: [patch 3/8] posix-timers: Move posixtimer_exec_cleanup() out of
 exec.c
References: <20260904112100.683893401@kernel.org>
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
 	 * POSIX timer will not free an enqueued timer because the TID lookup
 	 * failed as the original target TID was the old leader.
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

