Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880B41F1304
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 02:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788575543; cv=none; b=t8+IOH2qCsnvKZXe7FAkGB/20UVDK6cn3Tq7HDtV3LzOO8RgDxFeFYnVxpc/DYQu8pA7O5c4ZgD8RKi+Pe1fJ5BJiHrdfEjx3iHALy9b2onNN/Y+ZvEXGslJ3w8oOZwlJvdwlkj9pvPgSEruMNcJ8Oe7iu0AWXbbKjaqkrCBEAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788575543; c=relaxed/simple;
	bh=FHSwKWmr15F4+dbJiVQPWLYocXuRn8IsL1SPh0QyZd0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ow4EKrEmj2BUdzyARzIB4lwlvrw9u/7947EyhvZAixqtAol6b4YpeAaxu8RTud9IAzjx6uPZrMES7io8fFL6yLBZJwnwGmgl9vXljQ9sSIrWrr86N1QWkpDNCgu/D5x/aAaP7anbTIWVvU0RaMgajMEEVdbW6m4NC7iZL+1wLno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+Gq+Wlo; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+Gq+Wlo"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1103929f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 19:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788575539; x=1789180339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xe0WRjqcJrv7t9DOf1oWH8cjhW47z0878LelzZd53P8=;
        b=S+Gq+WloF359H/S3AWFuDe9ePOxb8pQ1DSWK0bkrJ6t4wWDPT5e9B8Os5IW1k1nr1+
         VTLrkYUR2PhLx1dMS8492OtB+c9UTo++IywBCHDEqmNcCV7ojKifo/DjHAUg8A8Iusk9
         dwjVve0R76fUrfZKIhe7WAm/9B9En5tYtlXgjJFZ0MKEwwMf0Fl4dqaS4Mw8FEHglklP
         BHZ2aETo5W83ouyZfyTzBTqPkpVmYty0lA+Lcz/hEw/Ll0x2U3kOMsXWgxfRkah3xy0U
         feVReTe5nEViAzk+uf/oSr8mzsd8PnsTGYLjhTnUj1qK+wXwiUbzqC+lNYZgpv4rV/hQ
         Rglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788575539; x=1789180339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xe0WRjqcJrv7t9DOf1oWH8cjhW47z0878LelzZd53P8=;
        b=bE0j4zRkmyX0vvvnL/caxG529pxrsKla+uiSdWKhh2GL/TOPAxEgfutdaR7Q5ARYW3
         ygBZPcrAKY+HF1lMaxOuqwei1XHzU4EzkPLF54+RdXlLLYPXIY8H4pcOD2IyeO+Mnj+M
         rlUMjcYrrqd8GQ5FVIrOjmtOetee+BDpLv97BNuimwFFdTChAg6E/odyBSD39gg20YPm
         0Wt44MoAs6inze4VjoslY+7SAt0jPUaRVlW54mT2Us9BiRTXPBKI68cTqTZQE5ZvIBP7
         QKMamiEZxZMAscC704idq2Z5Sr4OW3Vff37YS0G3jVl70fI3e97LO4aMVTyYoupW0LQE
         mpvw==
X-Forwarded-Encrypted: i=1; AKwUvByuySFU9kWIM2X9WjqbXvdYtMWZyx0MFr8vQk9u4/p3QQ+BV+VZG4/TM47svFSpr3g8mW7Ccg0Os5jK3s0=@vger.kernel.org
X-Gm-Message-State: AFuF++loc7u+qnSxuGJR9R+qii+SVhjIhfo9n5I0nl4wSKQPswRLY3lA
	DO0OkeCwwyNpePH9/QLXcO+Pu600pO+CAL4N6THpC1g0qmLqDxYI0/3Y
X-Gm-Gg: AYBFou0ic01dHTq4ovj4bj7FqmRR5BuZizSSByRtUs3MC+q5hUY0zZRDGWO9Dk2Pa7n
	8QEV2p48mEDJWiFBhRoZ7bG1jP8lk49xX8GOjlKsMy1Quyj0SI3Ec6cXN5IeT+EMsVaS6Yhvb5u
	uXxobgeBwxnmyile/r2wUhSm2YeavrNq4ChL6P1Uc/ZH6cEqpkvt2IlFLm29u1ZSOgCWRFSaHvq
	56A/1K3pikSiuT5+gG7mdmjICy6pp4Gcs4ntHtuEi7CICql3RjwevtZDQVKU2lPa/LVy8cCnGe0
	+SxchDb7UvrdT7dNbmvEjqGQihfh7pzTVLGARuldJyUJ4+INCW+VY3/nxaQNIMpy//+bLmOtMee
	NfI9LIoCdtDaR+UudHVoNFcVMn79nIg6wP3TEX9zz5ID0dDKD0b0xC+DFgsUKXOSPt7ssa9SCNU
	uNQnMlRLKt4TGgje48ECKpI+TP9Njcon2JZrnRVRuF8/7OErMFdo6NYBeA214v9qCn6ltuJrv+d
	3hM/dz1gXASDImUe9D1MK1Q9IOVqT7y7gghH5TEfm3BV3noR8qA0HX6o0oIOxkPLi1jugejWiLD
	sf7lEF/VXli4uK6Srd+uJHV1XqHSZ0biQxWfG4urjrOw4qp35TXkWkNUzNqO11BILcs=
X-Received: by 2002:a05:6000:491d:b0:484:3785:210e with SMTP id ffacd0b85a97d-485872d4f0fmr11096202f8f.25.1788575538567;
        Fri, 04 Sep 2026 19:32:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm10622504f8f.14.2026.09.04.19.32.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 19:32:18 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH v2] softirq: Preserve interrupt context during IRQ exit
Date: Sat,  5 Sep 2026 04:32:10 +0200
Message-Id: <20260905023210.82853-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__irq_exit_rcu() drops HARDIRQ_OFFSET before deferred hrtimer rearm,
entry into softirq dispatch, and timersd wakeup. The rearm, wakeup, and
softirq entry code before softirq_handle_begin() are still on the IRQ
return path, but in_task() reports task context.

Context-sensitive code called from this window therefore sees task
context. ftrace records normal-context flags and selects its normal
recursion slot. KCSAN attributes IRQ-exit accesses to the interrupted
task, while KMSAN can select and modify that task's metadata.

Keep HARDIRQ_OFFSET across this IRQ-exit window. For direct softirq
handling, replace it with SOFTIRQ_OFFSET and restore it afterwards. Other
__do_softirq() call paths keep their existing accounting.

With hardirq context retained, ftrace records hardirq context, KCSAN uses
interrupt attribution, and KMSAN no longer uses the interrupted task's
state.

Test softirq eligibility before removing HARDIRQ_OFFSET with
irq_count() == HARDIRQ_OFFSET. This preserves the old !in_interrupt()
semantics, including PREEMPT_RT's task-local softirq-disable state. For
timersd, require exactly one hardirq nesting level and no NMI, preserving
the old predicate.

Drop HARDIRQ_OFFSET before tick_irq_exit(), as before. Preempt-off tracing
now covers the IRQ-exit work continuously instead of showing an artificial
on/off transition.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20260813130826.GW687043@noisy.programming.kicks-ass.net
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes since v1:
- Warn if the hardirq-to-softirq transition does not produce exactly one
  SOFTIRQ_OFFSET, and update lockdep state unconditionally (Frederic).
- Tighten the commit message around the affected IRQ-exit window, the
  timersd predicate and preempt-off tracing.
- Add exact-v2 QEMU, sanitizer, hardware and idle-latency results to the
  review notes.

v1: https://lore.kernel.org/r/20260903112737.49551-1-kmehltretter@gmail.com

The exact v2 source passed non-RT, threadirqs and PREEMPT_RT x86-64 QEMU
boot/stress, including CPU hotplug, with panic_on_warn=1, lockdep and IRQ
tracing. The same three modes passed a continuous context-invariant test;
neither new warning fired.

KCSAN attributed all 25 target reports to interrupt context. KMSAN selected
or changed task state zero times in 24K IRQ-exit windows and passed all 28
KUnit tests.

vmlinux linked successfully for arm64, ARM, RISC-V and s390.

The exact v2 TIP source passed config-identical A/B boot/stress on a Pi 400
(Cortex-A72, arm64) with panic_on_warn=1: 2000/2000 ping, no boot splat and
no new dmesg output. Focused ftrace, printk/fault-injection and continuous-
invariant diagnostics also passed on the same source.

A second A/B on the Pi 400 with threadirqs enabled also passed. Four
ktimers threads were active on each side, 2000/2000 ping completed, and the
dmesg buffer remained empty after the workload.

A four-boot ABBA cyclictest run on the Pi found no idle timer-latency
regression. Across 6M samples per side, p99 was 5 us on both kernels and
p99.9 was 7 us on the baseline versus 5 us patched.

For additional portability coverage, the mainline v2 adaptation passed
config-identical A/B boot/stress on a SAM9X75 (ARM926EJ-S/ARMv5TEJ) with
panic_on_warn=1, 1000/1000 ping, no boot splat and no new dmesg output.

 kernel/softirq.c | 48 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/kernel/softirq.c b/kernel/softirq.c
index 5d02c36c40e3..7381b6b4d551 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -350,8 +350,8 @@ static inline void ksoftirqd_run_end(void)
 	local_irq_enable();
 }
 
-static inline void softirq_handle_begin(void) { }
-static inline void softirq_handle_end(void) { }
+static inline bool softirq_handle_begin(void) { return false; }
+static inline void softirq_handle_end(bool from_hardirq) { }
 
 static inline bool should_wake_ksoftirqd(void)
 {
@@ -481,15 +481,35 @@ void __local_bh_enable_ip(unsigned long ip, unsigned int cnt)
 }
 EXPORT_SYMBOL(__local_bh_enable_ip);
 
-static inline void softirq_handle_begin(void)
+static inline bool softirq_handle_begin(void)
 {
-	__local_bh_disable_ip(_RET_IP_, SOFTIRQ_OFFSET);
+	bool from_hardirq = in_hardirq();
+
+	if (!from_hardirq) {
+		__local_bh_disable_ip(_RET_IP_, SOFTIRQ_OFFSET);
+		return false;
+	}
+
+	/* Replace the retained hardirq context with normal softirq context. */
+	__preempt_count_add((int)SOFTIRQ_OFFSET - (int)HARDIRQ_OFFSET);
+	WARN_ON_ONCE(softirq_count() != SOFTIRQ_OFFSET);
+	lockdep_softirqs_off(_RET_IP_);
+
+	return true;
 }
 
-static inline void softirq_handle_end(void)
+static inline void softirq_handle_end(bool from_hardirq)
 {
-	__local_bh_enable(SOFTIRQ_OFFSET);
-	WARN_ON_ONCE(in_interrupt());
+	if (!from_hardirq) {
+		__local_bh_enable(SOFTIRQ_OFFSET);
+		WARN_ON_ONCE(in_interrupt());
+		return;
+	}
+
+	WARN_ON_ONCE(softirq_count() != SOFTIRQ_OFFSET);
+	lockdep_softirqs_on(_RET_IP_);
+	__preempt_count_sub((int)SOFTIRQ_OFFSET - (int)HARDIRQ_OFFSET);
+	WARN_ON_ONCE(!in_hardirq());
 }
 
 static inline void ksoftirqd_run_begin(void)
@@ -605,6 +625,7 @@ static void handle_softirqs(bool ksirqd)
 	unsigned long old_flags = current->flags;
 	int max_restart = MAX_SOFTIRQ_RESTART;
 	struct softirq_action *h;
+	bool from_hardirq;
 	bool in_hardirq;
 	__u32 pending;
 	int softirq_bit;
@@ -618,7 +639,7 @@ static void handle_softirqs(bool ksirqd)
 
 	pending = local_softirq_pending();
 
-	softirq_handle_begin();
+	from_hardirq = softirq_handle_begin();
 	in_hardirq = lockdep_softirq_start();
 	account_softirq_enter(current);
 
@@ -670,7 +691,7 @@ static void handle_softirqs(bool ksirqd)
 
 	account_softirq_exit(current);
 	lockdep_softirq_end(in_hardirq);
-	softirq_handle_end();
+	softirq_handle_end(from_hardirq);
 	current_restore_flags(old_flags, PF_MEMALLOC);
 }
 
@@ -740,6 +761,8 @@ static inline void wake_timersd(void) { }
 
 #endif
 
+#define IRQ_EXIT_TIMERS	(NMI_MASK | HARDIRQ_MASK)
+
 static inline void __irq_exit_rcu(void)
 {
 #ifndef __ARCH_IRQ_EXIT_IRQS_DISABLED
@@ -748,8 +771,7 @@ static inline void __irq_exit_rcu(void)
 	lockdep_assert_irqs_disabled();
 #endif
 	account_hardirq_exit(current);
-	preempt_count_sub(HARDIRQ_OFFSET);
-	if (!in_interrupt() && local_softirq_pending()) {
+	if (irq_count() == HARDIRQ_OFFSET && local_softirq_pending()) {
 		/*
 		 * If we left hrtimers unarmed, make sure to arm them now,
 		 * before enabling interrupts to run softirq.
@@ -759,9 +781,11 @@ static inline void __irq_exit_rcu(void)
 	}
 
 	if (IS_ENABLED(CONFIG_IRQ_FORCED_THREADING) && force_irqthreads() &&
-	    local_timers_pending_force_th() && !(in_nmi() | in_hardirq()))
+	    local_timers_pending_force_th() &&
+	    (preempt_count() & IRQ_EXIT_TIMERS) == HARDIRQ_OFFSET)
 		wake_timersd();
 
+	preempt_count_sub(HARDIRQ_OFFSET);
 	tick_irq_exit();
 }
 

base-commit: 2af470916a208b576ac9975d221d9a378cf8ace9
-- 
2.53.0

