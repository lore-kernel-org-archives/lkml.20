Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820594D0CD6;
	Wed, 16 Sep 2026 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577311; cv=none; b=mwqEheqXup8JmQGYO3JZQ77hUk5mOBSaP7C+5KmQksEqE9RRgrhcZSc0gsmZFwQ7sUt/dqXE5aV9t/sqGLzAFUS5tVDL0KURMsxJ3Kq2Bb8Fk4Xkgk4hwpFSBFMLJxh3R3DcxLWGR+xImnZq1Gpj2RhOrLS+zz4N3JQTHOtb5MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577311; c=relaxed/simple;
	bh=bjBHfE9U4yMmC26G7Qh7/UJq2BE8tB2Gr83JXD4SupU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=dSVVtHlf9k0LX2vhNODlu52qNBB0bZxgADBin8iaL90qNtBFtu03ibZ+9afTZ2w2WXoA9i5cPEy5WM5yh6vhX+RxaRIx5Fv1rQQXxC9hMPTR4HzzgNtqlBc8/CpqjPq7j4sbOAOA8gUwgza1vb/82jui0Q6sRPglkkKRZod3Hn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hJxarrYG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nwYmJAkN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hJxarrYG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nwYmJAkN"
Date: Wed, 16 Sep 2026 16:48:10 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789577291;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2Z+hpDMcu2CjUORJejQfYC0FseI27BaUYh49CYrQog=;
	b=hJxarrYGmWN2ncSUlbi5lzh2Ehs1hsR+jC8tognhQr5/wVer45mxyKM5wlgOUPZaBKLyLW
	xji3X/aRR3bATsssPxnozuIzUEVd2FMZjXqrR2aMm4oRI5LYWF2yOud77lEBlyeexwEGAI
	NqagLiFoU6YpBxNZm9Y6uaR+ZQtTlKOU+sC+gXym7WV7HNtwLpXCxmiNk3Ajdnj/dH6cp1
	vDs61qeuE9oiMqPVCZ2Bs4AATJl9gzccZGinp7Q7x7mP6gQ2yJAZkdspMIsd0sR00GSqjQ
	Zivn3IFJVMgeO4KavWXnrkr3jRnIFfE1+onjyg8u8gMbCSWq4E/+xuyFvt+VhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789577291;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2Z+hpDMcu2CjUORJejQfYC0FseI27BaUYh49CYrQog=;
	b=nwYmJAkN4PkUAQooWay89NRVCb1V2H76gxYP7vWwhxxjedVhLNCNCaz15L6KsWbMUpVo6H
	tsgplZVJyxCkDEDg==
From: "tip-bot2 for Thomas Gleixner" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/core] posix-timers: Move posixtimer_exec_cleanup() out of exec.c
Cc: Thomas Gleixner <tglx@kernel.org>, Kijo Park <red993688@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911090541.680668094@kernel.org>
References: <20260911090541.680668094@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178957729020.1720534.15333229888843755952.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     7117334f022ba0cc7475f688efa68dd56e60f65b
Gitweb:        https://git.kernel.org/tip/7117334f022ba0cc7475f688efa68dd56e6=
0f65b
Author:        Thomas Gleixner <tglx@kernel.org>
AuthorDate:    Fri, 11 Sep 2026 11:09:21 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Wed, 16 Sep 2026 18:44:03 +02:00

posix-timers: Move posixtimer_exec_cleanup() out of exec.c

Move it to the POSIX timer code and provide a proper stub when POSIX timers
are disabled in Kconfig.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Tested-by: Kijo Park <red993688@gmail.com>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Link: https://patch.msgid.link/20260911090541.680668094@kernel.org
---
 fs/exec.c                    | 13 +------------
 include/linux/posix-timers.h |  3 +++
 kernel/time/posix-timers.c   |  9 +++++++++
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 8196434..1fc5671 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1115,17 +1115,6 @@ static struct file *bprm_identity_file(const struct li=
nux_binprm *bprm)
 	return bprm->file;
 }
=20
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
@@ -1171,7 +1160,7 @@ int begin_new_exec(struct linux_binprm * bprm)
 	 * timer would not remove an enqueued timer because the TID lookup
 	 * of the old TID fails.
 	 */
-	posixtimer_exec(me);
+	posixtimer_exec();
=20
 	/* see the comment in check_unsafe_exec() */
 	current->fs->in_exec =3D 0;
diff --git a/include/linux/posix-timers.h b/include/linux/posix-timers.h
index 9a1a0c6..7b31da6 100644
--- a/include/linux/posix-timers.h
+++ b/include/linux/posix-timers.h
@@ -232,6 +232,8 @@ void set_process_cpu_timer(struct task_struct *task, unsi=
gned int clock_idx,
 int update_rlimit_cpu(struct task_struct *task, unsigned long rlim_new);
=20
 #ifdef CONFIG_POSIX_TIMERS
+void posixtimer_exec(void);
+
 static inline void posixtimer_putref(struct k_itimer *tmr)
 {
 	if (rcuref_put(&tmr->rcuref))
@@ -259,6 +261,7 @@ static inline bool posixtimer_valid(const struct k_itimer=
 *timer)
 	return !(val & 0x1UL);
 }
 #else  /* CONFIG_POSIX_TIMERS */
+static inline void posixtimer_exec(void) { }
 static inline void posixtimer_sigqueue_getref(struct sigqueue *q) { }
 static inline void posixtimer_sigqueue_putref(struct sigqueue *q) { }
 #endif /* !CONFIG_POSIX_TIMERS */
diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
index 436ba79..9611ed4 100644
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -1120,6 +1120,15 @@ void exit_itimers(struct task_struct *tsk)
 	}
 }
=20
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
