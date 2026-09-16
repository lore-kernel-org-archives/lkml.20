Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAA54B8292;
	Wed, 16 Sep 2026 16:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577294; cv=none; b=j+/NDD2sU9K1Mj7M1EUwg753b8zIBuzVeTDXOsXjHLtAuV4+dbOXS4nIEsdhmk+17anAdlCV3UWG4cs+Tv4FG1tKaIGSQcLs8iyiAqc8+WyBGMjJRb/JS7NowWuj6UGG4BBkGkBtAMExpCRSsawqX8c4qBBmiNLgKuTNvtlsCj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577294; c=relaxed/simple;
	bh=qmrC//6rWvtWJHYeq7t3PvQu8iVVMVlcVRyM0AlBRRw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=bxWCKPU05DfIFc02hsxHtU4nNtwEm0ucGOBPGDuidkJlfiFRiDyprx2B3CbvV5gYf4W8S1NyqLuME7hDXW8wfv+jX7eHhM7BOLT7OwUXrET0SNaR3rcciAT/wd7F995EjrQFp6BWCu8Wf20BlGbiWMlM6Eb2wjzqio4wgFsbWNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uL076NOM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z2RTEJwM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uL076NOM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z2RTEJwM"
Date: Wed, 16 Sep 2026 16:48:04 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789577285;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QX4G6sISxojmtWIxHOrZk7zJUDDMAMC25N7PKohEfoY=;
	b=uL076NOM49f43x75JYBXclhZ5K/6JPnOy92m4DbNMG4FlJBSSRLs/IUUZOnk0HMHn5IqTE
	FrDq7Q+qZs5+HyFLRKh4Fi2QfP494RaI248wFu/kbRkm/7wTtyK0FKl2/r7jbYcOApkOL6
	A70XwfXX12+mhsi9sPCC/tYO/2FIWHmzwIoc8sw4S7hdXENTiiFmqwg7Fyk04I5u21IVTy
	smy5gl/iYPuGrFLksGNW3tOElU6t0M88zTdFZUh98Sdw0FKBEj+D8pk5CdX4pcgcuL01aO
	kh86nPzzx0I3lMib88ReFnX200ihWyM4X3cmhoeblC34qmhPdRVtHGqGJ7dXYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789577285;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QX4G6sISxojmtWIxHOrZk7zJUDDMAMC25N7PKohEfoY=;
	b=z2RTEJwMGX55+C4J11rSpXYW8LoZk03FynFdLQzy7I6h7x7rNK2XzLf2rz3N/NvJ8LmpzV
	vmB4A/jU8mzyXZBw==
From: "tip-bot2 for Thomas Gleixner" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] posix-cpu-timers: Prevent enqueueing when
 PF_EXITING is set
Cc: Thomas Gleixner <tglx@kernel.org>, Kijo Park <red993688@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Frederic Weisbecker <frederic@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911090541.892445443@kernel.org>
References: <20260911090541.892445443@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178957728414.1720534.3277090460371753615.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     54ad1e0ea42c3dc25de39b09220af408e4913820
Gitweb:        https://git.kernel.org/tip/54ad1e0ea42c3dc25de39b09220af408e49=
13820
Author:        Thomas Gleixner <tglx@kernel.org>
AuthorDate:    Fri, 11 Sep 2026 11:09:40 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Wed, 16 Sep 2026 18:44:04 +02:00

posix-cpu-timers: Prevent enqueueing when PF_EXITING is set

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
Tested-by: Kijo Park <red993688@gmail.com>
Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Link: https://patch.msgid.link/20260911090541.892445443@kernel.org
---
 kernel/time/posix-cpu-timers.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/kernel/time/posix-cpu-timers.c b/kernel/time/posix-cpu-timers.c
index cf4bd1f..ddaf81b 100644
--- a/kernel/time/posix-cpu-timers.c
+++ b/kernel/time/posix-cpu-timers.c
@@ -628,6 +628,7 @@ static int posix_cpu_timer_del(struct k_itimer *timer)
 	}
=20
 	if (!ret) {
+		WARN_ON_ONCE(cpu_timer_queued(&timer->it.cpu));
 		put_pid(timer->it.cpu.pid);
 		timer->it_status =3D POSIX_TIMER_DISARMED;
 	}
@@ -675,6 +676,27 @@ void posix_cpu_timers_exit_group(struct task_struct *tsk)
 }
=20
 /*
+ * This function validates that POSIX CPU timers can be safely enqueued on t=
he
+ * target task.
+ *
+ * Enqueue is allowed when PF_EXITING is not set. If set then it is only all=
owed
+ * for process shared timers (type =3D PIDTYPE_TGID) as long as tsk::signal:=
:flags
+ * does not have SIGNAL_GROUP_EXIT set. PIDTYPE_PID targets are not allowed =
at
+ * all when the task has PF_EXITING set.
+ *
+ * This guarantees that after the POSIX timer cleanup in posixtimer_exit() no
+ * POSIX CPU timers are queued on the task or in case of a group exit on the
+ * process.
+ */
+static inline bool task_can_enqueue_timer(struct task_struct *tsk, enum pid_=
type type)
+{
+	if (likely(!(tsk->flags & PF_EXITING)))
+		return true;
+
+	return type =3D=3D PIDTYPE_TGID && !(tsk->signal->flags & SIGNAL_GROUP_EXIT=
);
+}
+
+/*
  * Insert the timer on the appropriate list before any timers that
  * expire later.  This must be called with the sighand lock held.
  */
@@ -684,7 +706,13 @@ static void arm_timer(struct k_itimer *timer, struct tas=
k_struct *p)
 	struct cpu_timer *ctmr =3D &timer->it.cpu;
 	u64 newexp =3D cpu_timer_getexpires(ctmr);
=20
+	lockdep_assert_held(&p->sighand->siglock);
+
 	timer->it_status =3D POSIX_TIMER_ARMED;
+
+	if (unlikely(!task_can_enqueue_timer(p, clock_pid_type(timer->it_clock))))
+		return;
+
 	if (!cpu_timer_enqueue(&base->tqhead, ctmr))
 		return;
=20
