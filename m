Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D544BA9F6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788634775; cv=none; b=qr9ZKqaYJf7eAXWWE1BoaS4nJUx6amOopjyZC1k0ecBtk1CZWL1Uz6szWMOd27II3sa5bqYjOHxX9EJug6jeYNveWYRV6GJFy1M5Wk/z3x7sMRvfo06Sai25X38Z19pCnfNeMg98MIQTMWGX8TIRiOklPTqV8Dz3vHKOBGxz/Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788634775; c=relaxed/simple;
	bh=iS0fDnU0CzhdPHP9v5BeijjKsNbG4F7jO+hfIvC6mbI=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=tZog0eArmAOcwCwmfGw63llgDlML7ZMKzbATtax1ihpelF1MwSDTTDzozK8YFIjbPZFOsARYBSdgdV0hgYsduBTYM9ejMA0RU9CiMjhrzTS96McPjIXLl8DLsMZnr2P/9aYSSa4cakeoPB0kIugxDAaPAtc4aEM+1523BDBhgks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bevV0pjH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bevV0pjH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F981F00A3A;
	Sat,  5 Sep 2026 18:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788634771;
	bh=pE55xBuW66e0oD82HU5uty+aTXH5GE8qHA8qC9ozYsE=;
	h=Date:From:To:Cc:Subject:References;
	b=bevV0pjHekP3M0nx/PoT6qzMaNjo7KQwt9rrg7CHZIgc9GW1JhIC1dK2GajvxUD+p
	 ha4lip2fj1uQsBgLBkQ06llk67xFfJ0PflknRhL9ZTmanVmBNY9wDNdaoK/9JKT8BS
	 tsGLjeSM3jeGlfJiUGQtB2S4LwSXwHGNvM7wqtCC4UMbCNOb91+In/mMg+6OLcHcua
	 vxKNPgrYHcExcfObBcnFApfW9iWe3QPz9Vf2QoCizeJFRk9l5nQ/8dRwotos6x5Ge1
	 I254yRPEPdZ36yOOndBcqIwe1bf5NwBINauVA8V1k2mQNomUPSI1fjvkHWTtdYuE2I
	 /INKvc2bXVAxA==
Date: Sat, 05 Sep 2026 20:59:28 +0200
Message-ID: <20260905185839.972374320@kernel.org>
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
Subject: [patch V2 7/8] posix-cpu-timers: Prevent enqueueing when PF_EXITING
 is set
References: <20260905181551.738186850@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

To prepare for cleaning up POSIX CPU timers in do_exit(), prevent
enqueueing POSIX CPU timers on a task which has PF_EXITING set.  Queueing a
timer on such a task is pointless because the task won't expire the timer
anymore.

The same applies to process wide timers when tsk::signal::flags has
SIGNAL_GROUP_EXIT set.

Pretending that the timer is armed allows to keep the POSIX timer mechanism
"working" so that the timer stays accessible up to the point where a task
is unhashed.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 kernel/time/posix-cpu-timers.c |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

--- a/kernel/time/posix-cpu-timers.c
+++ b/kernel/time/posix-cpu-timers.c
@@ -628,6 +628,7 @@ static int posix_cpu_timer_del(struct k_
 	}
 
 	if (!ret) {
+		WARN_ON_ONCE(cpu_timer_queued(&timer->it.cpu));
 		put_pid(timer->it.cpu.pid);
 		timer->it_status = POSIX_TIMER_DISARMED;
 	}
@@ -675,6 +676,27 @@ void posix_cpu_timers_exit_group(struct
 }
 
 /*
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
+{
+	if (likely(!(tsk->flags & PF_EXITING)))
+		return true;
+
+	return type == PIDTYPE_TGID && !(tsk->signal->flags & SIGNAL_GROUP_EXIT);
+}
+
+/*
  * Insert the timer on the appropriate list before any timers that
  * expire later.  This must be called with the sighand lock held.
  */
@@ -684,7 +706,13 @@ static void arm_timer(struct k_itimer *t
 	struct cpu_timer *ctmr = &timer->it.cpu;
 	u64 newexp = cpu_timer_getexpires(ctmr);
 
+	lockdep_assert_held(&p->sighand->siglock);
+
 	timer->it_status = POSIX_TIMER_ARMED;
+
+	if (unlikely(!task_can_enqueue_timer(p, clock_pid_type(timer->it_clock))))
+		return;
+
 	if (!cpu_timer_enqueue(&base->tqhead, ctmr))
 		return;
 

