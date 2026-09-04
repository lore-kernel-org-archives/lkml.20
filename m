Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E223472F72
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520973; cv=none; b=dqbrAcw3Tfe1NlKaIdaKMgUBBBvrTIKtItvHDpidFEZWERgz3VI2ohTUJUw7a7/d35LySoQK+GqBKVaGOU6YshOBdxac4/BT9uTeu83bC1XefJeIO8cNvOHJn0x8gEXByM8uWoIPXzd+UZFGVNlan2X6EppvNyAbd7yVZ2uoifM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520973; c=relaxed/simple;
	bh=knIRTAe2apaT7WsKjn236Vs8mYaHILNE7HiMwSnPr40=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=GC/KZYAIgX1zacu/zA7Oft9LDisKFU9RYtq755Shme9TiJyao8mt86mayjCgninfsZbzpDmxFzK6X3xr2KYgxEBDZwx9zft+qdKCNCJ3trziDWFxVFfy+iUOm3H2641tZh2rGwD+I6xif7nOWvWXBhwtA4bNvAnijPkSZuQVtlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDkHCvqP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDkHCvqP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E961F00A3D;
	Fri,  4 Sep 2026 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788520971;
	bh=xFD3aGiuhZc+pCkwkvbcraGTuUDOKB9doW8Ry6Um8pQ=;
	h=Date:From:To:Cc:Subject:References;
	b=RDkHCvqPxxhlrzTpIfmThu5P+JbhL6UehHoFN3qgmDSBB75FH1lxlpj1wtM95BExK
	 nHkJlw2vjI5tBMVc1JOsGGlo62VuXCNo6nZJ1MTbUYmPPr+GoN2XSybVoljeP1Kq4R
	 fnhZZrEyl1sl32hOvOiKn3bPh1DBLLBznQKDW8mB2FkDKkmojt8oMCdM0INo0yVmwU
	 SoSUYpVljCFirHwytNf4cdbGzcWcZioFmqG14Of+PM20pSx7wCycwfj+u2/SxhfAN2
	 KvQf8L9Sz303BZkNOToksFxmOQV5adxq6jfVQJvlP5rZVboD3d2DOasoI5u3p+NqDD
	 v2bYzWyjoDl0w==
Date: Fri, 04 Sep 2026 13:22:49 +0200
Message-ID: <20260904112202.400768514@kernel.org>
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
Subject: [patch 7/8] posix-cpu-timers: Prevent enqueueing when PF_EXITING is
 set
References: <20260904112100.683893401@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

To prepare for cleaning up POSIX CPU timers in do_exit(), prevent
enqueueing POSIX CPU timers on a task which has PF_EXITING set.

Queueing a timer on such a task is pointless because the task won't expire
the timer anymore.

Pretending that the timer is armed allows to keep the POSIX timer mechanism
"working" so that the timer stays accessible up to the point where a task
is unhashed.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 kernel/time/posix-cpu-timers.c |   27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

--- a/kernel/time/posix-cpu-timers.c
+++ b/kernel/time/posix-cpu-timers.c
@@ -628,6 +628,7 @@ static int posix_cpu_timer_del(struct k_
 	}
 
 	if (!ret) {
+		WARN_ON_ONCE(cpu_timer_queued(&timer->it.cpu));
 		put_pid(timer->it.cpu.pid);
 		timer->it_status = POSIX_TIMER_DISARMED;
 	}
@@ -674,6 +675,15 @@ void posix_cpu_timers_exit_group(struct
 	cleanup_timers(&tsk->signal->posix_cputimers);
 }
 
+static inline bool task_can_enqueue(struct k_itimer *timer, struct task_struct *p)
+{
+	if (likely(!(p->flags & PF_EXITING)))
+		return true;
+
+	/* Allow TGID type unless the last thread is on the way out. */
+	return clock_pid_type(timer->it_clock) == PIDTYPE_TGID && atomic_read(&p->signal->live);
+}
+
 /*
  * Insert the timer on the appropriate list before any timers that
  * expire later.  This must be called with the sighand lock held.
@@ -684,7 +694,24 @@ static void arm_timer(struct k_itimer *t
 	struct cpu_timer *ctmr = &timer->it.cpu;
 	u64 newexp = cpu_timer_getexpires(ctmr);
 
+	lockdep_assert_held(&p->sighand->siglock);
+
 	timer->it_status = POSIX_TIMER_ARMED;
+
+	/*
+	 * Don't enqueue timers when the task or the group is exiting. That
+	 * ensures that timer operations are still succeeding as long as the
+	 * tasks are visible, but won't enqueue the timers on the task or
+	 * process. They won't expire anyway because run_posix_cpu_timers()
+	 * exits early when PF_EXITING is set.
+	 *
+	 * Enqueue is skipped if PF_EXITING is set when the timer is per task
+	 * and when the last thread decremented p::signal::live to zero also for
+	 * per process timers.
+	 */
+	if (unlikely(!task_can_enqueue(timer, p)))
+		return;
+
 	if (!cpu_timer_enqueue(&base->tqhead, ctmr))
 		return;
 

