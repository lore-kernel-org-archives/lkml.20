Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B602B46EF75
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117765; cv=none; b=kAK7aWWxBj4s4CwWqXUwIC2gBn431ouvBEKy8nplb/8CoLEcJ0X0+CmYpHwPohkIHCvfpZSSM7mmrgXpgjJ7+EFJDMjtFbM0HrKQGz8+lXkDgLz3RStl6n6AAxzgVX4TxCG1ZWEs5WBU+5dn5FIxO1o1+b+BCXjhvI35VpBI8Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117765; c=relaxed/simple;
	bh=m4av7ji0x6kS/u6ed7sla9Cu3XdBv00+2vaVwnR2V+E=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=lenLZZKCQEbQJPBa+3lhusPfcnfdVpETgy2jF/D9ksQmIwBjUO47ajch6iieOmg0/AnVRrTyZRLyptRktdV30U3raKTYhAKAOQDDPdMI5u++lzFiJJvGIDx/BiZcErZzbUwaIsU8HW7qAj8fbLe4GeYLo41Tt+3Px8+iKlzr64k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggFcWWTo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggFcWWTo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0056F1F0089A;
	Fri, 11 Sep 2026 09:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789117764;
	bh=o2IMJBxKAnWcJJCJl7behcNLb4eQ0DIE8Ze3uBOYl5s=;
	h=Date:From:To:Cc:Subject:References;
	b=ggFcWWToC6nYnkHoPBqqANi/pgJ+PC2+xdgHzpdqewBTMBEFWf3q8d92Dg44WAGit
	 97NxwntS3MgCXGyUCdvlwuIz13efON1vi5fqFRL52WO8F2LYDDfk5AF3QaC29T9y+9
	 ph1p8pZ5Xldk0gmByKkaNc7/wy5wtr6mHLSp1zqKeIG3FHYzOUN4L+BxFXAFyRF7JL
	 mFi3dAHiZi4651MPcNp17/gbUMgDXEjvhpf8QbGAXlLmfB21vX8c9SqT1iAbsFJlH5
	 bweS2gjU/1NIwUx33z2WAwIU/Bu5Up14L3MB5W/I5cJ0+rX0NSbPUA4OHe6SwARdav
	 iFkbKsePVwVxg==
Date: Fri, 11 Sep 2026 11:09:21 +0200
Message-ID: <20260911090541.680668094@kernel.org>
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
Subject: [patch V3 3/8] posix-timers: Move posixtimer_exec_cleanup() out of
 exec.c
References: <20260911090341.949101445@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Thomas Gleixner <tglx@kernel.org>

Move it to the POSIX timer code and provide a proper stub when POSIX timers
are disabled in Kconfig.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

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



