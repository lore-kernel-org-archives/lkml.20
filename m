Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A03379C40;
	Wed, 16 Sep 2026 16:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577299; cv=none; b=NAZC9WFFyNKfA+7VY8zTFcDTRC9hPRSaaOIJkk4cJ2xvxK//YncNBlVIhtNRZbXE8i+XAiRzEmWFsxs2N7sB3GMksZY7LVPVFsCmolJCTz7ptOWdt1A+NA/evxHckNZ08qKwxfnqh418WcPQUDLPIIlWWU7h73F6OAJSyYrG68g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577299; c=relaxed/simple;
	bh=u1rg05+fhIdhawwd6p90Nr46mY8XQlO9KBO2wrdhmx4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Ve0Dghwiiyx2YjBgldMNhieIq9rH8i5i/KcEWqihs+9NUwGgDlc7tL5HyEMFy7TJIG11c2UxcYCr3VGP7PedvMnVIF2m+xT4ioOSdTXMzk5GAz6CP4epyI0yr/blMvUZB/7v7xO6zemFnouOuqfLHcUduvXaz0MJX1zl9CPZrFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fE/ObMHO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TMabFiRl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fE/ObMHO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TMabFiRl"
Date: Wed, 16 Sep 2026 16:48:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789577290;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JTVVyOaMfpDEFzw7VM7pCSmpd1VsQhXtJWClLVdOQDg=;
	b=fE/ObMHOE3+CzPspVAsmQ46NTU5wbopiwKVhEyn8R19m7iqZZFOfE1reVizDgiEvSPeMlX
	zMlQH+mW6dwtcksODVo2pDqFxU55ru383h1PeTAyeFB8smbEn5yEjKUR39DxMdlouiK1iQ
	VOtepzh0uv7xCgFt6lT9lzWXiaVkg7Z509iCCEOB2PR6BzTJcpkyrk6aYFdUaLpLT6gx/1
	IajPNAGDUNtMaCngx0upiJ9qOLVq2VRuUrt/65DJvQVzO+D5hrEsUhDV2ho6dvss759apn
	YoGOWJ3otNWk1IZYbjvDsHc41r29vpOKqwL7INefSgE7q0EeUyU7vSeVHW2F6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789577290;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JTVVyOaMfpDEFzw7VM7pCSmpd1VsQhXtJWClLVdOQDg=;
	b=TMabFiRlybWq4M6K3n4oEr1vpqSIVqRYZ4Z8PjTK8Mou3yqORPCEX34xuco1f/pNy+/8EN
	kznMkE0GCc48KiCQ==
From: "tip-bot2 for Thomas Gleixner" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] posix-timers: Move POSIX timer group exit related
 code out of do_exit()
Cc: Thomas Gleixner <tglx@kernel.org>, Kijo Park <red993688@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911090541.733966325@kernel.org>
References: <20260911090541.733966325@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178957728864.1720534.15046408980892509783.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     24adce0b86c940ac3dcee0bcd75e799634fc9664
Gitweb:        https://git.kernel.org/tip/24adce0b86c940ac3dcee0bcd75e799634f=
c9664
Author:        Thomas Gleixner <tglx@kernel.org>
AuthorDate:    Fri, 11 Sep 2026 11:09:26 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Wed, 16 Sep 2026 18:44:03 +02:00

posix-timers: Move POSIX timer group exit related code out of do_exit()

Move the POSIX timer group exit handling into the posix timer code and
provide a proper stub when POSIX timers are disabled in Kconfig.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Tested-by: Kijo Park <red993688@gmail.com>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Link: https://patch.msgid.link/20260911090541.733966325@kernel.org
---
 include/linux/posix-timers.h |  2 ++
 include/linux/sched/task.h   |  1 -
 kernel/exit.c                |  7 +++----
 kernel/time/posix-timers.c   | 16 +++++++++-------
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/include/linux/posix-timers.h b/include/linux/posix-timers.h
index 7b31da6..3050f9e 100644
--- a/include/linux/posix-timers.h
+++ b/include/linux/posix-timers.h
@@ -233,6 +233,7 @@ int update_rlimit_cpu(struct task_struct *task, unsigned =
long rlim_new);
=20
 #ifdef CONFIG_POSIX_TIMERS
 void posixtimer_exec(void);
+void posixtimer_exit(void);
=20
 static inline void posixtimer_putref(struct k_itimer *tmr)
 {
@@ -262,6 +263,7 @@ static inline bool posixtimer_valid(const struct k_itimer=
 *timer)
 }
 #else  /* CONFIG_POSIX_TIMERS */
 static inline void posixtimer_exec(void) { }
+static inline void posixtimer_exit(void) { }
 static inline void posixtimer_sigqueue_getref(struct sigqueue *q) { }
 static inline void posixtimer_sigqueue_putref(struct sigqueue *q) { }
 #endif /* !CONFIG_POSIX_TIMERS */
diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index e0c1ca8..90ed5bc 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -94,7 +94,6 @@ static inline void exit_thread(struct task_struct *tsk)
 extern __noreturn void do_group_exit(int);
=20
 extern void exit_files(struct task_struct *);
-extern void exit_itimers(struct task_struct *);
=20
 extern pid_t kernel_clone(struct kernel_clone_args *kargs);
 struct task_struct *copy_process(struct pid *pid, int trace, int node,
diff --git a/kernel/exit.c b/kernel/exit.c
index 424c44a..4ca9759 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -966,13 +966,12 @@ void __noreturn do_exit(long code)
 			panic("Attempted to kill init! exitcode=3D0x%08x\n",
 				tsk->signal->group_exit_code ?: (int)code);
=20
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
diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
index 9611ed4..8fb040a 100644
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -1077,13 +1077,9 @@ SYSCALL_DEFINE1(timer_delete, timer_t, timer_id)
 	return 0;
 }
=20
-/*
- * Invoked from do_exit() when the last thread of a thread group exits.
- * At that point no other task can access the timers of the dying
- * task anymore.
- */
-void exit_itimers(struct task_struct *tsk)
+static void posixtimer_delete_timers(void)
 {
+	struct task_struct *tsk =3D current;
 	struct hlist_head timers;
 	struct hlist_node *next;
 	struct k_itimer *timer;
@@ -1120,12 +1116,18 @@ void exit_itimers(struct task_struct *tsk)
 	}
 }
=20
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
=20
-	exit_itimers(current);
+	posixtimer_delete_timers();
 	flush_itimer_signals();
 }
=20
