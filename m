Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB46404BE9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223358; cv=none; b=hYzZeIcyEhua8Y2SBiCbfAmMMXF4S5VUovgc3gxeuUwnxGIWiJburBiwpSfr7m7HgEbtJtGLz8VfK3yuLQthmiNm+KMS+izsjEE1IYyw2EbPL9NTKQEf7ytL1yMEL/RtUGbkt+NreFoEioBeHU2ML6JtGBe9pQQ9pOvDYK6CMr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223358; c=relaxed/simple;
	bh=wd+z82daAPeQeFK3XyhpW1aFmGnFyCzSi/HyRuHpMxo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FV1JNfvUni4QTk+YSx4ENQUu7zW19YTui43rAOqL5uTLkn+9YQ91EDmYqBiO/9FwkLKYB/QIiE/D0QoD4kYDECG+bYuhOmxIgcRh9wKt1qF7IiiDApCtmcwZbHBqSAjwNgaSnLP6Sx+nDX3a7LZhqdq9o3oYyBCaAYjo0rn0YlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQ/OtO4U; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQ/OtO4U"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so987469f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790223352; x=1790828152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YWVcmr61uvRESgmYqL0NJuQ5Q9SFbNbhCJjJopGH0Ag=;
        b=IQ/OtO4UnDptwGbeeO5wM4cW8j/TeBBfLAEaVaK3EujFkWHGodpSMNrzauR/VrgWAN
         VxgXXhtS1OT/TGDRnSrOc4Ag2KAwd7aXM7hgBZiilUEZJSan/RLnAKVOhxM4h9hKYNqQ
         diOGy5LKbRU4jhmJJJtarJ98s448qggtx83aLn6RK8rrHPTifb5IWxmvCH+I1aot9Bi7
         I9EcOWxcQUEp2FC+quj0+P9INAEsMQaUMOeUcIeMhs/XJVW7ampPLfRyywG0ctZZLuUT
         7CuWYybtjjmrg5jHZPdXBjaVO4hH2D55k0Sd2geH0XzKRLbtHk8sBJpPZFTvDhyghpil
         Sqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790223352; x=1790828152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YWVcmr61uvRESgmYqL0NJuQ5Q9SFbNbhCJjJopGH0Ag=;
        b=vQv4ny1yAjIvLaaRsmWc4q2EP+6mjgu6cAmjZkZ8T5YAwvtA7OaFNBrpPqH59ScRDm
         oKBT1UXlWQZ+hORVRKCtevQcz0v+44XQAzvdn8CzGrOrlQ6F+qo7fuk5FageVKVtRwKG
         2FBKcMwbUbPr4CsnoMz3enSj+xXR9vO4Rt1T/XmXUObSR+yHw24/IdknqSaE9Go6BIBd
         0axtYHXi+wPDXmvarZQuNsolxMHA95A8PSMxxx6vkDhaWmdWWA+UQ9FUDoEBskYF4DCs
         QMf+Tck0cGPEb2UqSYF5UTpXAAvfWnEsE1jXyBT1DRBbF+s94qmeFFkdZt9/1pNEWmts
         wMeg==
X-Forwarded-Encrypted: i=1; AKwUvBzw2e4K0HKOByr5/AW6C2QpBwXNyJI6Pms6ZUgNcKG91bJG8VWwjUqfhmCKmxBjGLP/LdZZ2IY2y7Uokj4=@vger.kernel.org
X-Gm-Message-State: AFuF++lxCaP4+aHpIKE+6D7yZa5z5B7gxdOiJZ3CiZj4KO6H0HeBG7gj
	z7SqVd1pZ+LkGsxU92RxrT5Tks6JXPJavaC3kinKHcxb8I4HssbQ5Hth
X-Gm-Gg: AYBFou3fAXHxerhdnKafElr3mzbDlLMQ43W69WYOcAJTskFstnVWS1l/l2ft7rXMJGx
	qSMWSm1IIqYywKwpOOsV9LDr3IW2ErXZq4pQ4MIhJUwHtpDlIvcppSymevN/NtATREziWhNV4s3
	3MrEHpPcSLxTumUR7BFL1+j3jMJWYw2i5eTJvtdP82Oy8oI0bM6JC/ULqR4p4O0/ThVK/ktR/By
	HZ1vATur0FTSd4r66pahwvJgakkXWLFUoLaoDJtmS8m9SgQMGYayaPQa7Kq6H8vcwYnvhEUbd+l
	C1NSAvOKcdifxeMXLo8LJd8keVFuNd1XsqN+sXCbVrGkND1/Qvfi4V0jyJSCCR8gBjPAaBsRfG6
	BSc9vyTzZ/KxOzUbHL0T+52EyO/K3WOzIHn7a568shIEdwKmv1Cxn3yLYh+ygOLN7qk5p+Ai6CL
	lyVMy4HICjXwT8ET2muxXr96O2QD1Ub0XDAYjJ0cbKX1AQr/Z0L/TdhBnmkJyZa2//+CgPLHx1P
	281aGDqxdcmzACLHvlQ2W+L5r8T5gXLBXvMKYfJH2LqvovCrr2KEbuwzVL7J5jeq36qNckXEMwt
	aInrx1Iz/7a9CVDJEEIORAhtaHorJMoJLsVaNSTqu+zbqIAy/EmbsM5Mu4K+wXsI7o8v0BuZK2Y
	eyrvKfvdB
X-Received: by 2002:a05:6000:2406:b0:487:27f6:a4d0 with SMTP id ffacd0b85a97d-488716a5f55mr1807168f8f.32.1790223351681;
        Wed, 23 Sep 2026 21:15:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-adbf-6901-6c54-85ea-c6d5-a48d.310.pool.telefonica.de. [2a02:3100:adbf:6901:6c54:85ea:c6d5:a48d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682668dcsm12187186f8f.1.2026.09.23.21.15.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 21:15:51 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Boqun Feng <boqun@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH v3] softirq: Preserve interrupt context during IRQ exit
Date: Thu, 24 Sep 2026 06:15:38 +0200
Message-Id: <20260924041538.52574-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__irq_exit_rcu() removes HARDIRQ_OFFSET first and then runs
hrtimer_rearm_deferred(), invoke_softirq() and wake_timersd(). This is
interrupt exit work with interrupts disabled, but preempt_count already
describes the interrupted task again. Everything which derives the
context from preempt_count gets it wrong in that window:

  - ftrace, perf and the ring buffer record task context and use the
    task recursion and context slots.
  - KCSAN attributes the accesses to the interrupted task, KMSAN uses
    and changes its state. KCOV and the printk caller id see a task.
  - On PREEMPT_RT can_spin_trylock() and local_trylock() reject hard
    interrupt context to avoid interfering with PI when the interrupted
    task is blocked on a lock. That check does not reject calls made in
    this window. BPF programs attached to sched_waking or sched_wakeup
    can reach it through kmalloc_nolock().
  - An oops kills the interrupted task instead of ending in "Fatal
    exception in interrupt".

Tracing and the sanitizers see the wrong context in this window. No
failure caused by this misclassification is known. The early removal of
HARDIRQ_OFFSET predates git. lockdep is not affected because
lockdep_hardirq_exit() is the last operation in irq_exit().

Keep HARDIRQ_OFFSET until right before tick_irq_exit(), which needs
in_hardirq() to be false for the outermost interrupt. Softirq handlers
must not run with HARDIRQ_OFFSET set, so softirq_handle_begin() replaces
it with SOFTIRQ_OFFSET and softirq_handle_end() reverts that, each in a
single raw preempt_count update. The raw operations keep the preemption
disable location recorded by irq_enter_rcu(), and lockdep is updated by
hand. softirq_handle_begin() detects the case with
in_hardirq() because __do_softirq() is reached through the stack switch
in do_softirq_own_stack() and cannot take an argument.

The checks run before HARDIRQ_OFFSET is removed. !in_interrupt() becomes
irq_count() == HARDIRQ_OFFSET, as in irq_enter_rcu(). The timer thread
check becomes !in_nmi() && hardirq_count() == HARDIRQ_OFFSET. It does
not test softirq_count(): the timer thread must also wake when the
interrupt hit softirq processing or a section with BHs disabled.
A softirq raised in the timer thread wakeup is handled by the timer
thread, which handles all pending softirqs.

A softirq raised in the final preempt_count_sub(), e.g. by a consumer of
the preempt_enable tracepoint, misses these checks. Wake ksoftirqd for
it as raise_softirq_irqoff() would. Otherwise it waits for the next
interrupt exit and a cpuidle driver reports it as pending at idle entry.

The number of preempt_count updates and the interrupt time accounting
are unchanged. The preemptoff tracer now reports the interrupt and the
softirq processing on top of it as one section, and function graph with
nofuncgraph-irqs also skips the interrupt exit work, including the
__do_softirq() frame.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20260813130826.GW687043@noisy.programming.kicks-ass.net
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Thanks for the review, Sebastian.
    
    v3 also adds a pending softirq check after the final
    preempt_count_sub(). A preempt_enable tracepoint callback can raise a
    softirq there, after the softirq and timer thread checks. With an RCU
    reader in that callback I saw 10 NOHZ tick-stop warnings per boot in
    QEMU without the new check, and none on the base kernel or with the
    check. The check wakes ksoftirqd for newly pending softirqs. Does this
    case justify the extra check on every IRQ exit?
    
    Changes in v3:
    - Operands swapped, no casts, one irq_count() check per direction,
      lockdep_softirqs_off() before it (Sebastian).
    - Timer thread check without IRQ_EXIT_TIMERS, order of the exit work
      kept (Sebastian).
    - from_hardirq renamed to from_irq_exit, comment as Sebastian suggested.
    - ksoftirqd wakeup for a softirq raised in the final
      preempt_count_sub(), see above.
    - Documentation/core-api/entry.rst updated.
    - Rebased on tip/master c81f6d2398d0.
    
    I am not proposing this for stable.
    
    Testing: base against v3 in QEMU on x86-64 in separate configurations
    (non-RT, threadirqs, RT, KCSAN, KMSAN, rcutorture), on arm32, arm64,
    ppc64, s390x, parisc, sparc64, riscv64, loongarch64 and m68k, and on a
    SAM9X75 (also RT), a Raspberry Pi 500+ and a Raspberry Pi 400. No
    regressions observed in these runs.
    
    v2: https://lore.kernel.org/r/20260905023210.82853-1-kmehltretter@gmail.com

 Documentation/core-api/entry.rst | 16 ++++---
 kernel/softirq.c                 | 79 +++++++++++++++++++++++++++-----
 2 files changed, 77 insertions(+), 18 deletions(-)

diff --git a/Documentation/core-api/entry.rst b/Documentation/core-api/entry.rst
index 79fdaed954d9d..ff3df997b151f 100644
--- a/Documentation/core-api/entry.rst
+++ b/Documentation/core-api/entry.rst
@@ -197,8 +197,9 @@ return true, handles NOHZ tick state and interrupt time accounting. This
 means that up to the point where irq_enter_rcu() is invoked in_hardirq()
 returns false.
 
-irq_exit_rcu() handles interrupt time accounting, undoes the preemption
-count update and eventually handles soft interrupts and NOHZ tick state.
+irq_exit_rcu() handles interrupt time accounting, handles soft interrupts if
+possible, undoes the preemption count update and finally handles the NOHZ tick
+state.
 
 In theory, the preemption count could be updated in irqentry_enter(). In
 practice, deferring this update to irq_enter_rcu() allows the preemption-count
@@ -207,10 +208,13 @@ irqentry_exit(), which are described in the next paragraph. The only downside
 is that the early entry code up to irq_enter_rcu() must be aware that the
 preemption count has not yet been updated with the HARDIRQ_OFFSET state.
 
-Note that irq_exit_rcu() must remove HARDIRQ_OFFSET from the preemption count
-before it handles soft interrupts, whose handlers must run in BH context rather
-than irq-disabled context. In addition, irqentry_exit() might schedule, which
-also requires that HARDIRQ_OFFSET has been removed from the preemption count.
+Note that soft interrupt handlers must run in BH context rather than in hard
+interrupt context. irq_exit_rcu() therefore replaces HARDIRQ_OFFSET with
+SOFTIRQ_OFFSET in the preemption count while it handles soft interrupts and
+puts HARDIRQ_OFFSET back afterwards, so that the remaining interrupt exit work
+is still attributed to the interrupt. HARDIRQ_OFFSET is removed before
+irq_exit_rcu() returns because irqentry_exit() might schedule, which requires
+that HARDIRQ_OFFSET has been removed from the preemption count.
 
 Even though interrupt handlers are expected to run with local interrupts
 disabled, interrupt nesting is common from an entry/exit perspective. For
diff --git a/kernel/softirq.c b/kernel/softirq.c
index c3729c5b284b0..efa6707edc0e9 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -350,8 +350,8 @@ static inline void ksoftirqd_run_end(void)
 	local_irq_enable();
 }
 
-static inline void softirq_handle_begin(void) { }
-static inline void softirq_handle_end(void) { }
+static inline bool softirq_handle_begin(void) { return false; }
+static inline void softirq_handle_end(bool from_irq_exit) { }
 
 static inline bool should_wake_ksoftirqd(void)
 {
@@ -481,15 +481,40 @@ void __local_bh_enable_ip(unsigned long ip, unsigned int cnt)
 }
 EXPORT_SYMBOL(__local_bh_enable_ip);
 
-static inline void softirq_handle_begin(void)
+static inline bool softirq_handle_begin(void)
 {
-	__local_bh_disable_ip(_RET_IP_, SOFTIRQ_OFFSET);
+	bool from_irq_exit = in_hardirq();
+
+	if (!from_irq_exit) {
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
+	WARN_ON_ONCE(irq_count() != SOFTIRQ_OFFSET);
+
+	return true;
 }
 
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
+	WARN_ON_ONCE(irq_count() != HARDIRQ_OFFSET);
 }
 
 static inline void ksoftirqd_run_begin(void)
@@ -605,6 +630,7 @@ static void handle_softirqs(bool ksirqd)
 	unsigned long old_flags = current->flags;
 	int max_restart = MAX_SOFTIRQ_RESTART;
 	struct softirq_action *h;
+	bool from_irq_exit;
 	bool in_hardirq;
 	__u32 pending;
 	int softirq_bit;
@@ -618,7 +644,7 @@ static void handle_softirqs(bool ksirqd)
 
 	pending = local_softirq_pending();
 
-	softirq_handle_begin();
+	from_irq_exit = softirq_handle_begin();
 	in_hardirq = lockdep_softirq_start();
 	account_softirq_enter(current);
 
@@ -670,7 +696,7 @@ static void handle_softirqs(bool ksirqd)
 
 	account_softirq_exit(current);
 	lockdep_softirq_end(in_hardirq);
-	softirq_handle_end();
+	softirq_handle_end(from_irq_exit);
 	current_restore_flags(old_flags, PF_MEMALLOC);
 }
 
@@ -742,14 +768,20 @@ static inline void wake_timersd(void) { }
 
 static inline void __irq_exit_rcu(void)
 {
+	u32 pending;
+
 #ifndef __ARCH_IRQ_EXIT_IRQS_DISABLED
 	local_irq_disable();
 #else
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
+	if (irq_count() == HARDIRQ_OFFSET && local_softirq_pending()) {
 		/*
 		 * If we left hrtimers unarmed, make sure to arm them now,
 		 * before enabling interrupts to run softirq.
@@ -758,10 +790,33 @@ static inline void __irq_exit_rcu(void)
 		invoke_softirq();
 	}
 
+	/*
+	 * Wake the timer thread even if the interrupt hit a softirq or a
+	 * section with BHs disabled. Only nested interrupts and NMIs are
+	 * excluded.
+	 */
 	if (IS_ENABLED(CONFIG_IRQ_FORCED_THREADING) && force_irqthreads() &&
-	    local_timers_pending_force_th() && !(in_nmi() | in_hardirq()))
+	    local_timers_pending_force_th() &&
+	    !in_nmi() && hardirq_count() == HARDIRQ_OFFSET)
 		wake_timersd();
 
+	pending = local_softirq_pending();
+
+	/*
+	 * tick_irq_exit() relies on in_hardirq() being false for the
+	 * outermost interrupt.
+	 */
+	preempt_count_sub(HARDIRQ_OFFSET);
+
+	/*
+	 * A softirq raised in preempt_count_sub(), e.g. by a tracepoint,
+	 * missed the checks above. Wake ksoftirqd as raise_softirq_irqoff()
+	 * would have done.
+	 */
+	if (unlikely(local_softirq_pending() & ~pending) && !in_interrupt() &&
+	    should_wake_ksoftirqd())
+		wakeup_softirqd();
+
 	tick_irq_exit();
 }
 

base-commit: c81f6d2398d063009cc9ad2c98f126daaa7669e2
-- 
2.53.0

