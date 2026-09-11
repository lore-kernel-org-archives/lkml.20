Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1562A46D2DA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117785; cv=none; b=oGWfyVJ6LfRReBZtqgAcUuAZukKyU4EbefgiVmL+aJ5q6/WYrv4yrwtLj371s3+wSQ9c8qdGZ7OcuwMxMcRmhcxqRsOgAzB1wenaEoUQOtzwmLiXQ/BfnSJxZDLlSOuYYR5pXIIMwF/m5tBENXgeo80atelozVAvsFBlaHSPw8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117785; c=relaxed/simple;
	bh=pilVMOERfyY22QKpbhtG99+BWInIBpqe64C/M9IYHp4=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=ZuE7GqrV0e9cRAs3H0l3Pmucg8GOclR4HT/vkCifPWQuWomBcd/4gU9zgCeEGZOFrGvym9UZvzvxAWuCtY/F1B8gY2HBoB3WIMxNyAtIOnownwAbl7vHehtrdupixUrI2ZxtLcqgq6ceZN0gUxN4mQJ2V4mreS23EPqBi7K1/YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7i0MZmn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7i0MZmn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677811F000FF;
	Fri, 11 Sep 2026 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789117783;
	bh=0KZHuvDVKADmlpo57k3z+qU0GhL8yEajgLzPcs18XCA=;
	h=Date:From:To:Cc:Subject:References;
	b=F7i0MZmnqihZQ/Mml9RDYnIrt8EfEQYVxRQllVeOUZsxRSah9DO7CbZ8vkYjLd8Lq
	 ps+e5JqTyIDWdnX7hSDFYnl/ybz2hgrTvTzBFsQhq+cUhNI6anafy57ncznyVtgoC4
	 d4+uie7a0C67Pc/Zzw9tC6RuwB8K46bWvD6kve5yhtZp+9qo+nkI+MAxJD8h0eNhg8
	 GkimWJyU8vqThS40Q/uuuzAEelsYC5DpablyMDgAgoOkgr/tzJNoaagbZQnR4IkAtN
	 w57EixCZp57yMe13iR7cAgo36ULOpI5Og0c8MtbM39/Ckwm+9ScLGJVi30BDHa/dwF
	 1gY6ZscqlHwYg==
Date: Fri, 11 Sep 2026 11:09:40 +0200
Message-ID: <20260911090541.892445443@kernel.org>
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
Subject: [patch V3 7/8] posix-cpu-timers: Prevent enqueueing when PF_EXITING
 is set
References: <20260911090341.949101445@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Thomas Gleixner <tglx@kernel.org>

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
Reviewed-by: Oleg Nesterov <oleg@redhat.com>

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
 



