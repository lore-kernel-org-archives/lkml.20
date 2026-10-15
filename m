Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19092488232;
	Thu, 15 Oct 2026 08:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053844; cv=none; b=K3z4qT9HXo/Su66HEVR8ECvLdL01hSRxXnd9hXcvueSNoCMCWbwbCXYjhIResxFHH1bTcxeEtG5v9eDPdqVlUA2EDKqM1rMGU70NffvhYdNdiCJbi74dkSTvqSpKDSTpqOok1NZPO88omrrP2uCcUUiZcYFmMvrifQ0aIJd0cyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053844; c=relaxed/simple;
	bh=iqI7eqILXG9u0SIH9IUbmKjP1OxjJ/Y/ZrbVPi+2Uhw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ujwBX5dbi2Ak+tw5y2Kmz1uzHZ6Wmtt91xVY1/KsgGy1FIgNUZVD89PHrELHcGEHyCYoZTjHny/PoyrjOv6y5ixRSA6auR5jwY2p1XWxO13rZ3c2LCU5LL+L0K90rM1ju8RuYa0yGf7/jQ+LID9CpuF1zTpbLuLYdqofv3Cx0Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U9yj2Bws; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ke4QYrIl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U9yj2Bws";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ke4QYrIl"
Date: Thu, 15 Oct 2026 08:43:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792053836;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZSSKqGiluUM2J6FDWS2C6/QvGT2tZ/QWUlRa0+Go5c=;
	b=U9yj2BwsrVNhAFu1dLZZGLLTL2PnsC4SDoNPN2vqYN/9EGKg2wsv+KyXAIEA3+wnIxNBKZ
	phjt64hQ1Gx1Dfhnpy0vWkj4NbpwyARdmm6Nr8CITjzzfT+DeAa7j4mnsuJNOEbZjXuEdR
	uwpy3ytWZpNgAglSljn9JQSlYvyXAsaqAyEiaXa1zOxIB9FIXG2Uny7MEWzlHiKOSyM4JN
	2KNsa4+OQa3b/M+GoeNQP8z6Qq2L1E4+BxAFGs254jIrXskX70ZHhSk2PJL8kYEW1EJIvy
	Npu5p2Ld7yGtn/HBYnHqBfzNjYBMYizC/y/wL1YgtlbMoCWwWFBWTPJrpSkanw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792053836;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZSSKqGiluUM2J6FDWS2C6/QvGT2tZ/QWUlRa0+Go5c=;
	b=ke4QYrIl9LmwVK1Z3GbFEH/HlN+RNleekDnmP0YpV4M2YuePD3IFPXrGf+osRLLzuSekkW
	zk/95mO0FR7C4ODA==
From: "tip-bot2 for Karl Mehltretter" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/core] softirq: Preserve interrupt context on return from interrupt
Cc: Peter Zijlstra <peterz@infradead.org>,
 Karl Mehltretter <kmehltretter@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Bradley Morgan <brads@mainlining.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org, maz@kernel.org
In-Reply-To: <20261011060742.30584-1-kmehltretter@gmail.com>
References: <20261011060742.30584-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205383441.2666988.1122915713819009723.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/core branch of tip:

Commit-ID:     feb5c9a2447a7d65a17d949c81c1f21864cde172
Gitweb:        https://git.kernel.org/tip/feb5c9a2447a7d65a17d949c81c1f21864c=
de172
Author:        Karl Mehltretter <kmehltretter@gmail.com>
AuthorDate:    Sun, 11 Oct 2026 08:07:42 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 10:38:13 +02:00

softirq: Preserve interrupt context on return from interrupt

__irq_exit_rcu() removes HARDIRQ_OFFSET from preempt_count() before the
interrupt exit work. On the outermost interrupt exit, with no NMI or
softirq state remaining, this makes context checks report task context. The
softirq-dispatch, timer-wakeup and tick-exit checks account for the early
decrement, but other code reached in this window sees the wrong context:

  - ftrace, perf and the ring buffer record task context and use the
    task recursion and context slots.
  - KCSAN attributes accesses to the interrupted task. KMSAN uses and
    changes the interrupted task's KMSAN context. KCOV and the printk
    caller id see a task.
  - On PREEMPT_RT can_spin_trylock() and local_trylock() reject hard
    interrupt context to avoid interfering with PI when the interrupted
    task is blocked on a lock. Those checks do not reject calls made in
    this window. BPF programs attached to sched_waking or sched_wakeup
    can reach the trylock path through kmalloc_nolock().
  - An oops kills the interrupted task instead of ending in "Fatal
    exception in interrupt".

The early decrement predates git. No failure caused by this
misclassification is known. lockdep is unaffected because
lockdep_hardirq_exit() is the last operation in irq_exit().

Keep HARDIRQ_OFFSET until the end of __irq_exit_rcu(), including
tick_irq_exit(). Softirq handlers must run in BH context, so replace
HARDIRQ_OFFSET with SOFTIRQ_OFFSET while they run and restore it
afterwards. Use one raw counter update for each transition to preserve
the preemption disable location recorded by irq_enter_rcu(), and update
lockdep explicitly. Detect IRQ exit with in_hardirq() in
softirq_handle_begin() because __do_softirq() can be reached through
do_softirq_own_stack() and cannot take an argument.

Adjust the exit checks for HARDIRQ_OFFSET still being present. Use
irq_count() =3D=3D HARDIRQ_OFFSET for softirq dispatch, as in irq_enter_rcu().
Use hardirq_count() =3D=3D HARDIRQ_OFFSET for the timer thread wakeup and
tick_irq_exit(). NMI exits use a separate path. An IRQ nested in an NMI
has an extra HARDIRQ_OFFSET from NMI entry, so it is excluded too. The
timer thread check must ignore softirq_count() to allow wakeups when an
IRQ interrupts softirq processing or a BH-disabled section. The timer
thread handles all pending softirqs, including any raised during its
wakeup.

A softirq raised from a tracepoint on the final preempt_count_sub()
waits for the next interrupt exit and can trigger NOHZ tick-stop
warnings. Handling that instrumentation case does not justify a check
on every interrupt exit. A tracepoint on tick_irq_exit() can also raise
a softirq after the normal softirq handling has finished.

The number of counter updates and interrupt time accounting are
unchanged. The preemptoff tracer now reports the interrupt and subsequent
softirq processing as one section. With nofuncgraph-irqs, function graph
tracing also skips the IRQ exit work, including the __do_softirq() frame.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Assisted-by: LLM
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/r/20260813130826.GW687043@noisy.programming.kic=
ks-ass.net
Link: https://patch.msgid.link/20261011060742.30584-1-kmehltretter@gmail.com
---
 Documentation/core-api/entry.rst | 16 +++++---
 kernel/softirq.c                 | 60 ++++++++++++++++++++++++-------
 2 files changed, 57 insertions(+), 19 deletions(-)

diff --git a/Documentation/core-api/entry.rst b/Documentation/core-api/entry.=
rst
index 79fdaed..0994213 100644
--- a/Documentation/core-api/entry.rst
+++ b/Documentation/core-api/entry.rst
@@ -197,8 +197,9 @@ return true, handles NOHZ tick state and interrupt time a=
ccounting. This
 means that up to the point where irq_enter_rcu() is invoked in_hardirq()
 returns false.
=20
-irq_exit_rcu() handles interrupt time accounting, undoes the preemption
-count update and eventually handles soft interrupts and NOHZ tick state.
+irq_exit_rcu() handles interrupt time accounting, handles soft interrupts if
+possible, handles the NOHZ tick state and finally undoes the preemption count
+update.
=20
 In theory, the preemption count could be updated in irqentry_enter(). In
 practice, deferring this update to irq_enter_rcu() allows the preemption-cou=
nt
@@ -207,10 +208,13 @@ irqentry_exit(), which are described in the next paragr=
aph. The only downside
 is that the early entry code up to irq_enter_rcu() must be aware that the
 preemption count has not yet been updated with the HARDIRQ_OFFSET state.
=20
-Note that irq_exit_rcu() must remove HARDIRQ_OFFSET from the preemption count
-before it handles soft interrupts, whose handlers must run in BH context rat=
her
-than irq-disabled context. In addition, irqentry_exit() might schedule, which
-also requires that HARDIRQ_OFFSET has been removed from the preemption count.
+Note that soft interrupt handlers must run in BH context rather than in hard
+interrupt context. irq_exit_rcu() therefore replaces HARDIRQ_OFFSET with
+SOFTIRQ_OFFSET in the preemption count while it handles soft interrupts and
+puts HARDIRQ_OFFSET back afterwards, so that the remaining interrupt exit wo=
rk
+is still attributed to the interrupt. HARDIRQ_OFFSET is removed before
+irq_exit_rcu() returns because irqentry_exit() might schedule, which requires
+that HARDIRQ_OFFSET has been removed from the preemption count.
=20
 Even though interrupt handlers are expected to run with local interrupts
 disabled, interrupt nesting is common from an entry/exit perspective. For
diff --git a/kernel/softirq.c b/kernel/softirq.c
index c3729c5..7fc2200 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -350,8 +350,8 @@ static inline void ksoftirqd_run_end(void)
 	local_irq_enable();
 }
=20
-static inline void softirq_handle_begin(void) { }
-static inline void softirq_handle_end(void) { }
+static inline bool softirq_handle_begin(void) { return false; }
+static inline void softirq_handle_end(bool from_irq_exit) { }
=20
 static inline bool should_wake_ksoftirqd(void)
 {
@@ -481,15 +481,38 @@ void __local_bh_enable_ip(unsigned long ip, unsigned in=
t cnt)
 }
 EXPORT_SYMBOL(__local_bh_enable_ip);
=20
-static inline void softirq_handle_begin(void)
+static inline bool softirq_handle_begin(void)
 {
-	__local_bh_disable_ip(_RET_IP_, SOFTIRQ_OFFSET);
+	if (!in_hardirq()) {
+		__local_bh_disable_ip(_RET_IP_, SOFTIRQ_OFFSET);
+		return false;
+	}
+
+	/*
+	 * Only reached from irq_exit(), with HARDIRQ_OFFSET still set.
+	 * Replace it with SOFTIRQ_OFFSET before handle_softirqs() enables
+	 * interrupts. Use the raw operation to preserve the preemption
+	 * disable location recorded by irq_enter_rcu(), and update lockdep
+	 * directly.
+	 */
+	__preempt_count_sub(HARDIRQ_OFFSET - SOFTIRQ_OFFSET);
+	lockdep_softirqs_off(_RET_IP_);
+	WARN_ON_ONCE(irq_count() !=3D SOFTIRQ_OFFSET);
+
+	return true;
 }
=20
-static inline void softirq_handle_end(void)
+static inline void softirq_handle_end(bool from_irq_exit)
 {
-	__local_bh_enable(SOFTIRQ_OFFSET);
-	WARN_ON_ONCE(in_interrupt());
+	if (!from_irq_exit) {
+		__local_bh_enable(SOFTIRQ_OFFSET);
+		WARN_ON_ONCE(in_interrupt());
+		return;
+	}
+
+	lockdep_softirqs_on(_RET_IP_);
+	__preempt_count_add(HARDIRQ_OFFSET - SOFTIRQ_OFFSET);
+	WARN_ON_ONCE(irq_count() !=3D HARDIRQ_OFFSET);
 }
=20
 static inline void ksoftirqd_run_begin(void)
@@ -605,6 +628,7 @@ static void handle_softirqs(bool ksirqd)
 	unsigned long old_flags =3D current->flags;
 	int max_restart =3D MAX_SOFTIRQ_RESTART;
 	struct softirq_action *h;
+	bool from_irq_exit;
 	bool in_hardirq;
 	__u32 pending;
 	int softirq_bit;
@@ -618,7 +642,7 @@ static void handle_softirqs(bool ksirqd)
=20
 	pending =3D local_softirq_pending();
=20
-	softirq_handle_begin();
+	from_irq_exit =3D softirq_handle_begin();
 	in_hardirq =3D lockdep_softirq_start();
 	account_softirq_enter(current);
=20
@@ -670,7 +694,7 @@ restart:
=20
 	account_softirq_exit(current);
 	lockdep_softirq_end(in_hardirq);
-	softirq_handle_end();
+	softirq_handle_end(from_irq_exit);
 	current_restore_flags(old_flags, PF_MEMALLOC);
 }
=20
@@ -716,7 +740,7 @@ static inline void tick_irq_exit(void)
=20
 	/* Make sure that timer wheel updates are propagated */
 	if ((sched_core_idle_cpu(cpu) && !need_resched()) || tick_nohz_full_cpu(cpu=
)) {
-		if (!in_hardirq())
+		if (hardirq_count() =3D=3D HARDIRQ_OFFSET)
 			tick_nohz_irq_exit();
 	}
 #endif
@@ -748,8 +772,12 @@ static inline void __irq_exit_rcu(void)
 	lockdep_assert_irqs_disabled();
 #endif
 	account_hardirq_exit(current);
-	preempt_count_sub(HARDIRQ_OFFSET);
-	if (!in_interrupt() && local_softirq_pending()) {
+
+	/*
+	 * HARDIRQ_OFFSET is still set. Only the outermost interrupt handles
+	 * softirqs, and only if it did not hit a softirq or BH disabled section.
+	 */
+	if (irq_count() =3D=3D HARDIRQ_OFFSET && local_softirq_pending()) {
 		/*
 		 * If we left hrtimers unarmed, make sure to arm them now,
 		 * before enabling interrupts to run softirq.
@@ -758,11 +786,17 @@ static inline void __irq_exit_rcu(void)
 		invoke_softirq();
 	}
=20
+	/*
+	 * Wake the timer thread even if the interrupt hit a softirq or a
+	 * section with BHs disabled. Only the outermost interrupt can wake it.
+	 */
 	if (IS_ENABLED(CONFIG_IRQ_FORCED_THREADING) && force_irqthreads() &&
-	    local_timers_pending_force_th() && !(in_nmi() | in_hardirq()))
+	    local_timers_pending_force_th() &&
+	    hardirq_count() =3D=3D HARDIRQ_OFFSET)
 		wake_timersd();
=20
 	tick_irq_exit();
+	preempt_count_sub(HARDIRQ_OFFSET);
 }
=20
 /**
