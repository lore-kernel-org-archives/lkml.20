Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC143905F4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434873; cv=none; b=RjCA/YEaF8oSCzCk8NDUZrBTeisYdOLj+K4N173zsZfw6QNsA4FRclD/S74by86HwbpxVpQcuVWJckTkA+QH+8PirViT21tCuKIU8AJCQMbEIRkrtf4/HVzRb7lSeZFkWqdWZwQepgkhalkILa3m3nRHq6nkGWIMh5vSp6bwSY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434873; c=relaxed/simple;
	bh=bpt7RHW5YEvSeuRX4i+k8HqnnLI/qvItvdzE0CmtwNA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p4hpI6GvKoiuA4rFx7WaXPWcdXtGbkwbewSyY3XjeJWjxnqREDddH2ffz5cOkVcwZClIqTxcFRbDNEYfJWz/iMfHI2YWPDj82u0pyCG1xgj4sbjiOYVv8MvUHnlhIf14us93VAVzMmLDjiCHV4W65IkVXJWPbCnEiZmCwbShdIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABztIZJI; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABztIZJI"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-485850cbac3so116339f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788434867; x=1789039667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2uZzEoi17n5jSyEBNDhQETxzMK74y33vCW7uiC5o2HE=;
        b=ABztIZJIJVmK9btclm2spMMEFIAXu2elvHrNfRp/Fij7+f+tgF/no27qNivYqDOIYp
         w+YRtoFQNt4AH7PXasHpuE4AZO61HvY69GM3KoO8zEHuJJUVyQd/qLjZqdv/dUPU+tG8
         y6cpk/YBGnufZqTiPtyLvCbIE5bQ1qkOUb8PltKfMX8toEi7QGxuMBXN0nT+YINJqSpZ
         RbYfhLdlZjLMcBJ+ICOFJBKmfBuC2M0ZyGK8JGcpL+s2/ywtcCZLdiaTrCrpqagMnyfQ
         BS0Jq0jcm/wYdfMGyd266gCTiUC5Jz3iqvpRPsOoj1IPvt5eWOWxtRCy9arQaq8I4Rfs
         n/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434867; x=1789039667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2uZzEoi17n5jSyEBNDhQETxzMK74y33vCW7uiC5o2HE=;
        b=tIxO7yDhZaRpNUisCcLD0Rb2lNh5bACuhOO74u1OU37Y/K2qioEtwgK/fAs9vzR0bF
         cPnlK60DbqnOfkNVIglXNieJz2ULmik8NlnRRGFenUgcsN0+vELo8KnxIxyOwi6PxpqZ
         eDLTF7wkgn66+urtgU3LVLbi7eNp5BW9fY65Yn4c92nFR+zbnFGSqvEa2+C2TYn9AWTS
         hfU2PHqEyS+zZEi0CttBXteceIQpUHfG2KpKKoTZtLJj/PdcXCuHzmjT+7p41O00yTPj
         p54Qjl/QCK58+ilzj2qE0bsNW4W/pbiUnlRJnz0wTctcpY+1AGK85iY02heUmPyLzFuP
         uFjA==
X-Forwarded-Encrypted: i=1; AKwUvBy8x5MzCO8R0ogasHBZvavXKCms2ZDtbJFeQZOgL5i9eFUqaksO/euQXmSw67vpe2lL176J4ym5Tx/ilv8=@vger.kernel.org
X-Gm-Message-State: AFuF++m34OQFhfgspQjvNFJ3RNMQqMkcL29DvJ0RQIhROU4Tg9NYXjYW
	RX3Ku+Kiznbm2AoentFhqVsUhs30Hu1D99srdcGbW3XqZXZhH857mxwa
X-Gm-Gg: AYBFou2kc+QICFXqKhSiz3xDdNUqQwTX0tPQQ2tzPUBzsECUYiuf1tjKK6jRgIojZNR
	z3kOb+kQyexYBsLD7JbgHiv4JW7MnR3IDdA2aAep7/zh3O3WUl4pZJerGa+r2UnmqdnTYcmZPcL
	HzzGXcKCIgWdaMnSlmyUcNv/BLPHZsV+tPiV40F69q0iSQaazMyCj1xDWOJbR5IvZepookHcM7V
	vW9/cva3584SjtKfQfwWhSIAOvFrLMCkobeJgsmbppjsAWTpRa+QD0xFkzDd+WoOjVWFNg+G5c5
	ZiKc13/UIQf9Iz++dYO9k3l+VsX276mVDnNbfCrfh2oUat6nGKHyH6j7d/A/ui41ZkJoqI+Erv7
	9UgKoNE9p3ZpuesYWkjMujtV6ur1I9rCXZDeQZZCF8hC2AIqQJY7v9tKQmzvpP1vcswOWBd0oT3
	3tyGq6eCL7mID4qzNMjX+Qqc/F3YPyZeAHBkO3iUUn8n5GQoZ0NIYqppLxaq9P1Mk0CYe5p3aCV
	J/5GcCk4tPi/ad9e12pi4jk2tg6UItuGj+pMU+b9Wh73duV+hK6B57coXIkCRUMM5B8vvbA/IP0
	4e6o4zPrqTv0xdbF8XLA5a8vQjg9eW9BlW+evoxEy0vD7g6Y8G439a0qHtTaxo5wLyHXJGLEdvz
	3
X-Received: by 2002:a05:6000:41cb:b0:484:44ec:2c14 with SMTP id ffacd0b85a97d-48488dece71mr21694820f8f.1.1788434866683;
        Thu, 03 Sep 2026 04:27:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed30c0sm13509281f8f.24.2026.09.03.04.27.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 04:27:46 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Boqun Feng <boqun@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH] softirq: Preserve interrupt context during IRQ exit
Date: Thu,  3 Sep 2026 13:27:37 +0200
Message-Id: <20260903112737.49551-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__irq_exit_rcu() drops HARDIRQ_OFFSET before deferred hrtimer rearm,
softirq dispatch, and timersd wakeup. This work is still on the IRQ
return path, but in_task() reports task context.

Context-sensitive code called from this window therefore sees task
context. ftrace records normal-context flags and selects its normal
recursion slot. KCSAN attributes IRQ-exit accesses to the interrupted
task, while KMSAN can select and modify that task's metadata.

Keep HARDIRQ_OFFSET until the IRQ-exit work is done. For direct softirq
handling, replace it with SOFTIRQ_OFFSET and restore it afterwards. Other
__do_softirq() call paths keep their existing accounting.

With hardirq context retained, ftrace records hardirq context, KCSAN uses
interrupt attribution, and KMSAN no longer uses the interrupted task's
state.

Since softirq eligibility is now tested before HARDIRQ_OFFSET is removed,
use irq_count() == HARDIRQ_OFFSET. This preserves the old !in_interrupt()
semantics, including PREEMPT_RT's task-local softirq-disable state.

Drop HARDIRQ_OFFSET before tick_irq_exit(), as before.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20260813130826.GW687043@noisy.programming.kicks-ass.net
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
I reworked Peter's draft linked above into this version and tested it.

Changes:
- Use in_hardirq() in softirq_handle_begin() instead of ksirqd, since
  __do_softirq() also has task-context callers, including ktimerd.
- Use irq_count() for the eligibility test so PREEMPT_RT's task-local
  BH-disabled state remains part of the decision.

Tested with non-RT, threadirqs and PREEMPT_RT x86-64 QEMU boot/stress.
The QEMU kernels had lockdep and IRQ tracing enabled and reported no new
warnings.

A focused RT test rejected every BH-disabled IRQ-exit observation. The
old-mask negative control admitted every one.

ftrace marked direct IRQ-exit work as hardirq rather than normal context.

A separate A/B changed printk caller attribution from task to CPU,
in_task() from 1 to 0 and interrupt_context_level() from 0 to 2. Fault
injection no longer consumed the interrupted task's fail_nth state.

KCSAN attributed all 16 target reports to interrupt context.

KMSAN did not select or change task state in 64K IRQ-exit windows. All
28 KMSAN KUnit tests passed.

The exact TIP source also passed A/B boot/stress on a Pi 400
(Cortex-A72, arm64).

For additional coverage, the mainline adaptation passed A/B boot/stress
on a Microchip SAM9X75 Curiosity (ARM926EJ-S/ARMv5TEJ).

vmlinux linked successfully for arm64, ARM, RISC-V and s390.

 kernel/softirq.c | 48 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/kernel/softirq.c b/kernel/softirq.c
index 5d02c36c40e3..63aeaa5f62e9 100644
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
+	if (softirq_count() == SOFTIRQ_OFFSET)
+		lockdep_softirqs_off(_RET_IP_);
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
+	if (softirq_count() == SOFTIRQ_OFFSET)
+		lockdep_softirqs_on(_RET_IP_);
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
 
@@ -670,7 +691,7 @@ restart:
 
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

