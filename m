Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E993E23D2B1
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791698882; cv=none; b=rutCUOYSjLkQQGOB/FuLxFXi3NXyZ1H9p/RBmBQOod8hldq4ASBnSd3mKCFD/D7Tu0JZTzInvwVs5q4ujl/4UTiGNes7JR9PznnjsPU2hlUB2zH9VMbxuSpUbAqXQW/lquJlGthL3HmBrTbne79+rkt4k4wNN7pf1sdjv5ZVrNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791698882; c=relaxed/simple;
	bh=LoQfu2WFhFb7I7CXB6hcrQiqkzCUkLE4CzLYOc1+HTM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PhduusWT5o/6BJZ9Ahe2wk0kLnmY84CmGaqDVxw/IJ9ZxkS/fUH48pQYCk5JHkRy9TMfdxgn+zhkqJvStauvXMBSUiWjeoO0Grub6wTVF2vlOkpYiJeEzLHQkxng7ikx03BwItLkpsSyzGDda/9zObcKkTARZOYf3mtibP0XNwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUK7MdeA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUK7MdeA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a01933b584so8451605e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791698879; x=1792303679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wLPfyyzZnXx9ps6Css6vbcFog+sE8xY9CJOiW8YPbMY=;
        b=lUK7MdeA1Sc60EJJea2rysAJ6la88mjREq59sODiIp5HQJK4XgOzzUvXOouJfuZhR6
         aVtzMniYM7gFAcPHZQygx2E1mODww837BsuPyP/guZkPu8uTM5rZKU/BNDhIS9+Xmu/2
         QwxAWLmMaYaeEdxNP5u/qbGDynOfLjQ4t8kW/+rtnEb16bsbsQ5+SrwzdpFYegRk7nvs
         TFQ0ClK6s6kUsFa/YM6YK6VST9tsAx+0nPrI8hvckq6QeD8/7ummter7FC13O3A5NTgh
         mTvYMNnpVbXobabqER6kSeEhZuG0NKeWKRJMnCN0vfOZqOEh4D6UtbGwiSfNbzs+5XON
         J5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791698879; x=1792303679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLPfyyzZnXx9ps6Css6vbcFog+sE8xY9CJOiW8YPbMY=;
        b=apRCgtFBmixF3i/3qm7TzDJLRJIZAyZIT23Tb10/FdvaGH0MpLi8kH09SpoIBKRzuF
         SefyQ0ntfRtWw+U3fbH5hoQyyvv4MEBTzmZ6v7T5e9H5wwNQsC0sG1oVzDOOwh6txNsr
         TZXUfErY+dCtaYUi24iPX3hu9XVzWUB9qhLojN2dKmn6zHB7Lac3v8BSwSdslMX3e3NK
         gBu80hT/0gCt1Jud2psC+MOIaNbr0MpRhxpm8vzm/6b+Gjlmtp4/BaB/apSsdfD2ipvT
         uD6CsbncoUGvkdt0YwIAHuGEX3wfcm7lKh0LIjH88wTOUP11wM57XHQyqhq6S9F/LzPd
         hw3g==
X-Forwarded-Encrypted: i=1; AKwUvBxMhjTD0MmbtjM40xOKz4+O2xK/r9zZS0EP7wp6dpqNfYexsgCq8DW6z24Y+s5jBCBxXEJZv5vCPLtpjfs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrdGRdH2PEZQNYixc/yQN0uCmUCnxtA4a20e6FKhcMdIiTEb8G
	8quaXfmVzKTiQBHpSA/BCKzPsCcmrDzExeETMesXXOqSwYfmgfolMP6l
X-Gm-Gg: AYBFou3eYrS1q37mNbTVhm3hnNxHMuc5Di0UL8enPV9QhvIwx6IB2il0ij1VR2wnyUG
	ZYFc3GUTj7EDduuN4EPgCiTqmfH3hQUg3esqD3zOgnyoUf2FnyONlN5OSt0zE45AqGhSWjNQn/f
	BB7Uj3dcEYNCdBHDpFhgHeCVfM57cF2N6LG35dymamScGsoAi8Suk9KMcV231EcASRqot2OdLzf
	EOd40axVCfGyGcH8cRH3yyNjs6bFDFz05kxtP+ty5Ri4tDbWgKOfZifNRvnM5z6w4EXXstMrSSG
	0Uf56TGAe0xCuYAQkBh8c9GAw/hIS+O7IfaGc9u7/BrVIAge/t3NsDg0ELP4HIcQ46xG2okjf8t
	dRRhayXaNNdrIxJs1oLH2BoNLkvx54HRsa4OC/MfV4k9NapT3sOXT+JjcRawL5rmQEjIZWEXi72
	Inhy3zZ/zVe26wQe87ewd2w8+aX4Rr+AwF+Pg25x+gCYn69RPmiF+PdoylAegPyGlYl2SCQWooH
	uloq0PPAPM03xashtazRzfQfUo+QeII87Qx28LDSRbjBCh7Ku/oj1cYR6DgX07CWSPFfI+d33gj
	Jk3uPPMnMHZC0HlYJpkBllgAOOC/e9JjnkDhNVJYww98yAy0hXer94eaz3vJtCShERVfO7knWD8
	4dlndbBhyObGd
X-Received: by 2002:a05:600c:840c:b0:4a1:8515:2d25 with SMTP id 5b1f17b1804b1-4a18e3e3604mr139433265e9.0.1791698878807;
        Sat, 10 Oct 2026 23:07:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a124-4001-d491-d32f-6b9f-21c5.310.pool.telefonica.de. [2a02:3100:a124:4001:d491:d32f:6b9f:21c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a198b0cfe3sm58764425e9.3.2026.10.10.23.07.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 23:07:58 -0700 (PDT)
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
	Bradley Morgan <brads@mainlining.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH v6] softirq: Preserve interrupt context during IRQ exit
Date: Sun, 11 Oct 2026 08:07:42 +0200
Message-Id: <20261011060742.30584-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__irq_exit_rcu() removes HARDIRQ_OFFSET from preempt_count() before
the IRQ exit work. On the outermost IRQ exit, with no NMI or softirq
state remaining, this makes context checks report task context. The
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
irq_count() == HARDIRQ_OFFSET for softirq dispatch, as in irq_enter_rcu().
Use hardirq_count() == HARDIRQ_OFFSET for the timer thread wakeup and
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
Link: https://lore.kernel.org/r/20260813130826.GW687043@noisy.programming.kicks-ass.net
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Changes in v6:
- Keep HARDIRQ_OFFSET through tick_irq_exit() and use
  hardirq_count() == HARDIRQ_OFFSET for its nesting check (Frederic).
- Update entry.rst to document NOHZ handling before the final
  preemption-count decrement.
- Test in_hardirq() directly in softirq_handle_begin() (Frederic).
- Drop the in_nmi() test from the timer thread wakeup condition
  (Frederic). NMI entry adds HARDIRQ_OFFSET, so the equality check
  excludes IRQs nested in an NMI.
- Drop the earlier Reviewed-by tags pending reconfirmation of the
  tick_irq_exit() behavior change.

Testing:
QEMU IRQ-exit probes (v5/v6):

                                                        v5          v6
  Tick-exit calls (hardirq/total)                   0/5553   5339/5339
  Tick-exit function-graph records                    5555           0
  KMSAN selections (task/total)             427205/3492324   0/2992433

The two tick-exit rows count tick_nohz_irq_exit(); function-graph
tracing used nofuncgraph-irqs. Captures had timer activity and zero
trace loss.
Each KMSAN kernel passed all 28 KUnit tests; those tests generated all
KMSAN reports.

Additional testing covered 67 guest boots and 10 kernel/softirq.o builds
across five architectures, including RT/non-RT stress, KCOV
configurations and 600-second rcutorture.
The KCSAN probe deliberately triggered reports to check IRQ-exit
context.

Matched configurations of the unpatched base and v6 were compared on
Pi 400, Pi 500+, BeagleV Ahead, AMD/KVM and UP ARMv6 Pi 1B+. Pi 500+ and
AMD tick-exit traces confirmed hardirq context with v6 and zero trace
loss. The NOHZ_FULL tick stopped on both versions on Pi 500+ and BeagleV
Ahead. Pi 1B+ base/v6 workloads completed without reported errors.

On physical SAM9X75 (cpuidle-at91), base/v6 tick-exit traces showed
hardirq flags in 0/556 and 540/540 calls, with 558 and zero
function-graph records under nofuncgraph-irqs. Both kernels showed idle
and Ethernet activity, with zero trace loss.

On Pi 500+, accounted CPU time exceeded wall time under intermittent
workloads on both the unpatched base and v6. No v6-specific regression
was established.

v5: https://lore.kernel.org/r/20260930191432.62760-1-kmehltretter@gmail.com
 Documentation/core-api/entry.rst | 16 +++++----
 kernel/softirq.c                 | 60 +++++++++++++++++++++++++-------
 2 files changed, 57 insertions(+), 19 deletions(-)

diff --git a/Documentation/core-api/entry.rst b/Documentation/core-api/entry.rst
index 79fdaed954d9..09942135aad1 100644
--- a/Documentation/core-api/entry.rst
+++ b/Documentation/core-api/entry.rst
@@ -197,8 +197,9 @@ return true, handles NOHZ tick state and interrupt time accounting. This
 means that up to the point where irq_enter_rcu() is invoked in_hardirq()
 returns false.
 
-irq_exit_rcu() handles interrupt time accounting, undoes the preemption
-count update and eventually handles soft interrupts and NOHZ tick state.
+irq_exit_rcu() handles interrupt time accounting, handles soft interrupts if
+possible, handles the NOHZ tick state and finally undoes the preemption count
+update.
 
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
index 5d02c36c40e3..be49e6469f3a 100644
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
@@ -481,15 +481,38 @@ void __local_bh_enable_ip(unsigned long ip, unsigned int cnt)
 }
 EXPORT_SYMBOL(__local_bh_enable_ip);
 
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
@@ -605,6 +628,7 @@ static void handle_softirqs(bool ksirqd)
 	unsigned long old_flags = current->flags;
 	int max_restart = MAX_SOFTIRQ_RESTART;
 	struct softirq_action *h;
+	bool from_irq_exit;
 	bool in_hardirq;
 	__u32 pending;
 	int softirq_bit;
@@ -618,7 +642,7 @@ static void handle_softirqs(bool ksirqd)
 
 	pending = local_softirq_pending();
 
-	softirq_handle_begin();
+	from_irq_exit = softirq_handle_begin();
 	in_hardirq = lockdep_softirq_start();
 	account_softirq_enter(current);
 
@@ -670,7 +694,7 @@ restart:
 
 	account_softirq_exit(current);
 	lockdep_softirq_end(in_hardirq);
-	softirq_handle_end();
+	softirq_handle_end(from_irq_exit);
 	current_restore_flags(old_flags, PF_MEMALLOC);
 }
 
@@ -716,7 +740,7 @@ static inline void tick_irq_exit(void)
 
 	/* Make sure that timer wheel updates are propagated */
 	if ((sched_core_idle_cpu(cpu) && !need_resched()) || tick_nohz_full_cpu(cpu)) {
-		if (!in_hardirq())
+		if (hardirq_count() == HARDIRQ_OFFSET)
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
+	if (irq_count() == HARDIRQ_OFFSET && local_softirq_pending()) {
 		/*
 		 * If we left hrtimers unarmed, make sure to arm them now,
 		 * before enabling interrupts to run softirq.
@@ -758,11 +786,17 @@ static inline void __irq_exit_rcu(void)
 		invoke_softirq();
 	}
 
+	/*
+	 * Wake the timer thread even if the interrupt hit a softirq or a
+	 * section with BHs disabled. Only the outermost interrupt can wake it.
+	 */
 	if (IS_ENABLED(CONFIG_IRQ_FORCED_THREADING) && force_irqthreads() &&
-	    local_timers_pending_force_th() && !(in_nmi() | in_hardirq()))
+	    local_timers_pending_force_th() &&
+	    hardirq_count() == HARDIRQ_OFFSET)
 		wake_timersd();
 
 	tick_irq_exit();
+	preempt_count_sub(HARDIRQ_OFFSET);
 }
 
 /**

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
