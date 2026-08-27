Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC6D361947;
	Thu, 27 Aug 2026 22:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787871151; cv=none; b=qbZ0aLWiEBZQziQBzZyBTISPjp19Hmm3QufH5Mh47mghXBVghYQV/RRyZzCNYMVcMDRWFhugL6+dlkO0L8SgheEs7Tjr4XEXVf3HYj/SlyS+PZJ4AlrTNF1/swKA5PbIR1PDRAxbbMow2cFznXQ0iTfWole/3Vd+0mgMp4vvsKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787871151; c=relaxed/simple;
	bh=ie8eCO8d9rYdmbLawy5lLe2IJUuIJSJ82wOa0mcAUeI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uZAsnJgMfEaaKpRdR3SiJ2CKG+nK5X/tIK1aAI4EzGSEYHJZw6hZj0U91DudUWe6cnQnj8T8ZBAuumgQkygjyTr+Wc6tSFc9t1nlq78hedKjCkMwZrrubm9+ID6OgIS+s7pWoN25jhhtBVm0mvNKslU5h63VGkLQI7vwUD5h/ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwq+ivvI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwq+ivvI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85381F00A3A;
	Thu, 27 Aug 2026 22:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787871149;
	bh=lXAAlRJJICEwxPvO50wysYDy3+dxhI2WWZmqCrXCRYo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mwq+ivvIAuL2AOYpW6TudhUaWmYLqPiHCPc6tWW6AhtdlfgrFO6UNQV5Dauv0tj2K
	 CotNhtkyx8YLO7Y7LeNCzryGR6XakrYxzL/FfYfHPxF9qGGa1umuoKc88p+x544bnt
	 Ib0wBxqJ9fSRscsFZ7lFj1vE2Bw4YN5L0H4cCDzhPkwOGAblRkHBGyrlxt8QmuVCka
	 9BTtwi3UNKIhqzec9nxxnJTdZoHlmyjVp3XCfw7NBEfiHWQEtwhmVQqm/EGVppwNTa
	 vIDVjiJGifLclB00jKqjnQF3r+Psbwcmm9giAek9GKKBPxj38fvKxljQMgs90QmNJF
	 Wfodl1PbT1JkA==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
In-Reply-To: <apCS3T63WUxHd1GH@tardis.local>
References: <20260824104704.GA4121339@noisy.programming.kicks-ass.net>
 <20260824105523.GA4121620@noisy.programming.kicks-ass.net>
 <aozw_7Txxaq2qE7c@tardis.local> <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local> <87v78wezid.ffs@fw13>
 <apA4M7Asz0mV9uaw@tardis.local> <87jypbfu1t.ffs@fw13>
 <apBrZuxU8bmCgG8h@tardis.local> <87bjanfmzz.ffs@fw13>
 <apCS3T63WUxHd1GH@tardis.local>
Date: Fri, 28 Aug 2026 00:52:26 +0200
Message-ID: <87wltbdvmd.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 27 2026 at 12:41, Boqun Feng wrote:
> On Thu, Aug 27, 2026 at 08:15:44PM +0200, Thomas Gleixner wrote:
>> > For now I will reverse the order and remove the additional checking in
>> > softirq to fix the softirq pending issue.
>> 
>> That "fixes" another nasty bug which was latent for weeks and people
>> could not get a handle on it because it was absolutely not
>> reproducible. Given all that I'm absolutely not convinced that there
>> isn't another pile of latent surprises lurking.
>> 
>> Aside of that I'm worried about having this new counter exposed in the
>> current state of affairs. Nothing prevents arbitrary code from using
>> hardirq_disable_count(), which is definitely faster than
>> irqs_disabled(), but returns a random value depending on context. That's
>
> Random how? Are you saying in the current (wrong) order? Because after
> reversing the order, hardirq_disable_count() != 0 means the interrupt
> has been disabled, no?
>
> But I checked, actually with the reverse order, we don't need
> hardirq_disable_count(), so we can remove it entirely. Will send a
> follow up patch on this.

The point is that the counter is only valid when used within the limits
of the current coverage. Other than that it is not:

        spin_lock_irq() // or any other non-covered mechanism
            // observes 0
            cnt = preempt_count() & HARDIRQ_DISABLE_MASK;

That's inconsistent and therefore it is a random number, no?

You have no way to prevent that this happens and if it does it becomes a
nightmare to debug for everyone. Guess who got the bug reports about
preemption counter issues and local softirq pending messages in his
inbox and dealt with them.

There is a world outside of your safe rust zone and that needs to be
safe too. This half finished attempt to make Rust work is absolutely
not and I have zero interrest to deal with the fallout.

It's not safe and no extra hacks will make it safe. Which means it is
not ready. So the only sensible thing is to revert everything which
touches that section of preempt_count() and provides interfaces.

As this annoyed me, I rumaged through my poison cabinet and found the
old patches again. They obviously don't apply anymore but I found the
hints which corners need some care. With the generic entry code that
also got way simpler.

So I sat down and reverted

  1b0866874833 ("locking: Switch to _irq_{disable,enable}() variants in cleanup guards")
  e901c1510e24 ("irq,spin_lock: Add counted interrupt disabling/enabling")

and then hacked it up just to see how far I get before vanishing to bed.

Three hours later it surprisingly booted right away into a full distro
kernel and survived kernel builds and a few test cases. :)

Obviously I did not do any serious testing on it, but I wanted to share
it as a starting point and food for thoughts.

Yes, it needs to be enabled per architecture as the preempt counter
initialization is architecture specific and it requires generic entry
code. But those are not uncommon prerequisites and an incentive for
architecture people to get their act together.

But it is fully consistent and the fully refcounted thing can be
built on top of it. If you look carefuly you'll notice that
__raw_local_irq_disable/enable() are just optimized versions of
__raw_local_irq_save/restore() as they don't have the conditionals, so
they can be unified completely at least for debug builds or in general
when it turns out that the overhead is neglible.

There is a wide range of optimizations possible with that especially by
combining preempt/interrupt modifications into one operation and
rescheduling without changing the preemption counter in the first
place. Which is what I hinted to in the mail you linked earlier. I'm so
tempted to hack that up tomorrow once my brain is less fried than now
and after I exposed it to some serious testing.

Thanks,

        tglx
---
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -318,6 +318,7 @@ config X86
 	select PCI_DOMAINS			if PCI
 	select PCI_LOCKLESS_CONFIG		if PCI
 	select PERF_EVENTS
+	select PREEMPT_COUNT_IRQFLAGS
 	select RTC_LIB
 	select RTC_MC146818_LIB
 	select SPARSE_IRQ
--- a/arch/x86/include/asm/preempt.h
+++ b/arch/x86/include/asm/preempt.h
@@ -61,8 +61,8 @@ static __always_inline void preempt_coun
  */
 #define init_task_preempt_count(p) do { } while (0)
 
-#define init_idle_preempt_count(p, cpu) do { \
-	per_cpu(__preempt_count, (cpu)) = PREEMPT_DISABLED; \
+#define init_idle_preempt_count(p, cpu) do {						\
+	per_cpu(__preempt_count, (cpu)) = PREEMPT_DISABLED | HARDIRQ_DISABLE_OFFSET;	\
 } while (0)
 
 /*
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -97,6 +97,7 @@ static __always_inline bool arch_in_rcu_
  */
 static __always_inline void enter_from_user_mode(struct pt_regs *regs)
 {
+	__preempt_count_inc_hardirqs_disable();
 	arch_enter_from_user_mode(regs);
 	lockdep_hardirqs_off(CALLER_ADDR0);
 
@@ -275,6 +276,7 @@ static __always_inline void exit_to_user
 	user_enter_irqoff();
 	arch_exit_to_user_mode();
 	lockdep_hardirqs_on(CALLER_ADDR0);
+	__preempt_count_dec_hardirqs_disable();
 }
 
 /**
@@ -385,6 +387,8 @@ static __always_inline irqentry_state_t
 		.exit_rcu = false,
 	};
 
+	__preempt_count_inc_hardirqs_disable();
+
 	/*
 	 * If this entry hit the idle task invoke ct_irq_enter() whether
 	 * RCU is watching or not.
@@ -498,6 +502,7 @@ irqentry_exit_to_kernel_mode_after_preem
 			instrumentation_end();
 			ct_irq_exit();
 			lockdep_hardirqs_on(CALLER_ADDR0);
+			__preempt_count_dec_hardirqs_disable();
 			return;
 		}
 
@@ -514,6 +519,7 @@ irqentry_exit_to_kernel_mode_after_preem
 		if (state.exit_rcu)
 			ct_irq_exit();
 	}
+	__preempt_count_dec_hardirqs_disable();
 }
 
 /**
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -13,6 +13,7 @@
 #define _LINUX_TRACE_IRQFLAGS_H
 
 #include <linux/irqflags_types.h>
+#include <linux/preempt.h>
 #include <linux/typecheck.h>
 #include <linux/cleanup.h>
 #include <asm/irqflags.h>
@@ -165,31 +166,124 @@ extern void warn_bogus_irq_restore(void)
 /*
  * Wrap the arch provided IRQ routines to provide appropriate checks.
  */
-#define raw_local_irq_disable()		arch_local_irq_disable()
-#define raw_local_irq_enable()		arch_local_irq_enable()
+#ifdef CONFIG_PREEMPT_COUNT_IRQFLAGS
+static __always_inline void raw_local_irq_disable(void)
+{
+	arch_local_irq_disable();
+	preempt_count_add(HARDIRQ_DISABLE_OFFSET);
+}
+
+static __always_inline void raw_local_irq_enable(void)
+{
+	preempt_count_sub(HARDIRQ_DISABLE_OFFSET);
+	arch_local_irq_enable();
+}
+
+static __always_inline unsigned long __raw_local_irq_save(void)
+{
+	unsigned long cnt = preempt_count();
+
+	if (!(cnt & HARDIRQ_DISABLE_MASK))
+		arch_local_irq_disable();
+	preempt_count_add(HARDIRQ_DISABLE_OFFSET);
+
+	// Probably not even needed unless something feeds 'flags' into
+	// irqs_disabled_flags()
+	return cnt;
+}
+
+static __always_inline void __raw_local_irq_restore(unsigned long cnt)
+{
+	if (!(__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET) & HARDIRQ_DISABLE_MASK))
+		arch_local_irq_enable();
+}
+
+static __always_inline unsigned long __raw_local_save_flags(void)
+{
+	return preempt_count() & HARDIRQ_DISABLE_MASK;
+}
+
+static __always_inline bool __raw_irqs_disabled_flags(unsigned long cnt)
+{
+	return !!cnt;
+}
+
+static __always_inline bool raw_irqs_disabled(void)
+{
+	return preempt_count() & HARDIRQ_DISABLE_MASK;
+}
+
+static __always_inline void raw_safe_halt(void)
+{
+	preempt_count_sub(HARDIRQ_DISABLE_OFFSET);
+	arch_safe_halt();
+}
+
+#else
+
+static __always_inline void raw_local_irq_disable(void)
+{
+	arch_local_irq_disable();
+}
+
+static __always_inline void raw_local_irq_enable(void)
+{
+	arch_local_irq_enable();
+}
+
+static __always_inline unsigned long __raw_local_irq_save(void)
+{
+	return arch_local_irq_save();
+}
+
+static __always_inline void __raw_local_irq_restore(unsigned long flags)
+{
+	arch_local_irq_restore(flags);
+}
+
+static __always_inline unsigned long __raw_local_save_flags(void)
+{
+	return arch_local_save_flags();
+}
+
+static __always_inline bool __raw_irqs_disabled_flags(unsigned long flags)
+{
+	return arch_irqs_disabled_flags(flags);
+}
+
+static __always_inline bool raw_irqs_disabled(void)
+{
+	return arch_irqs_disabled();
+}
+
+static __always_inline void raw_safe_halt(void)
+{
+	arch_safe_halt();
+}
+
+#endif
+
 #define raw_local_irq_save(flags)			\
 	do {						\
 		typecheck(unsigned long, flags);	\
-		flags = arch_local_irq_save();		\
+		flags = __raw_local_irq_save();		\
 	} while (0)
 #define raw_local_irq_restore(flags)			\
 	do {						\
 		typecheck(unsigned long, flags);	\
 		raw_check_bogus_irq_restore();		\
-		arch_local_irq_restore(flags);		\
+		__raw_local_irq_restore(flags);	\
 	} while (0)
 #define raw_local_save_flags(flags)			\
 	do {						\
 		typecheck(unsigned long, flags);	\
-		flags = arch_local_save_flags();	\
+		flags = __raw_local_save_flags();	\
 	} while (0)
 #define raw_irqs_disabled_flags(flags)			\
 	({						\
 		typecheck(unsigned long, flags);	\
-		arch_irqs_disabled_flags(flags);	\
+		__raw_irqs_disabled_flags(flags);	\
 	})
-#define raw_irqs_disabled()		(arch_irqs_disabled())
-#define raw_safe_halt()			arch_safe_halt()
 
 /*
  * The local_irq_*() APIs are equal to the raw_local_irq*()
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -54,31 +54,31 @@
  *             NMI_MASK:	0xf0000000
  * (PREEMPT_NEED_RESCHED is in a different word)
  */
-#define PREEMPT_BITS	8
-#define SOFTIRQ_BITS	8
+#define PREEMPT_BITS		8
+#define SOFTIRQ_BITS		8
 #define HARDIRQ_DISABLE_BITS	8
-#define HARDIRQ_BITS	4
-#define NMI_BITS	(1 + 3*IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS))
+#define HARDIRQ_BITS		4
+#define NMI_BITS		(1 + 3*IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS))
 
-#define PREEMPT_SHIFT	0
-#define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
+#define PREEMPT_SHIFT		0
+#define SOFTIRQ_SHIFT		(PREEMPT_SHIFT + PREEMPT_BITS)
 #define HARDIRQ_DISABLE_SHIFT	(SOFTIRQ_SHIFT + SOFTIRQ_BITS)
-#define HARDIRQ_SHIFT	(HARDIRQ_DISABLE_SHIFT + HARDIRQ_DISABLE_BITS)
-#define NMI_SHIFT	(HARDIRQ_SHIFT + HARDIRQ_BITS)
+#define HARDIRQ_SHIFT		(HARDIRQ_DISABLE_SHIFT + HARDIRQ_DISABLE_BITS)
+#define NMI_SHIFT		(HARDIRQ_SHIFT + HARDIRQ_BITS)
 
-#define __IRQ_MASK(x)	((1UL << (x))-1)
+#define __IRQ_MASK(x)		((1UL << (x))-1)
 
-#define PREEMPT_MASK	(__IRQ_MASK(PREEMPT_BITS) << PREEMPT_SHIFT)
-#define SOFTIRQ_MASK	(__IRQ_MASK(SOFTIRQ_BITS) << SOFTIRQ_SHIFT)
+#define PREEMPT_MASK		(__IRQ_MASK(PREEMPT_BITS) << PREEMPT_SHIFT)
+#define SOFTIRQ_MASK		(__IRQ_MASK(SOFTIRQ_BITS) << SOFTIRQ_SHIFT)
 #define HARDIRQ_DISABLE_MASK	(__IRQ_MASK(HARDIRQ_DISABLE_BITS) << HARDIRQ_DISABLE_SHIFT)
-#define HARDIRQ_MASK	(__IRQ_MASK(HARDIRQ_BITS) << HARDIRQ_SHIFT)
-#define NMI_MASK	(__IRQ_MASK(NMI_BITS)     << NMI_SHIFT)
+#define HARDIRQ_MASK		(__IRQ_MASK(HARDIRQ_BITS) << HARDIRQ_SHIFT)
+#define NMI_MASK		(__IRQ_MASK(NMI_BITS)     << NMI_SHIFT)
 
-#define PREEMPT_OFFSET	(1UL << PREEMPT_SHIFT)
-#define SOFTIRQ_OFFSET	(1UL << SOFTIRQ_SHIFT)
+#define PREEMPT_OFFSET		(1UL << PREEMPT_SHIFT)
+#define SOFTIRQ_OFFSET		(1UL << SOFTIRQ_SHIFT)
 #define HARDIRQ_DISABLE_OFFSET	(1UL << HARDIRQ_DISABLE_SHIFT)
-#define HARDIRQ_OFFSET	(1UL << HARDIRQ_SHIFT)
-#define NMI_OFFSET	(1UL << NMI_SHIFT)
+#define HARDIRQ_OFFSET		(1UL << HARDIRQ_SHIFT)
+#define NMI_OFFSET		(1UL << NMI_SHIFT)
 
 #define SOFTIRQ_DISABLE_OFFSET	(2 * SOFTIRQ_OFFSET)
 
@@ -90,7 +90,11 @@
  *
  * Reset by start_kernel()->sched_init()->init_idle()->init_idle_preempt_count().
  */
+#ifdef CONFIG_PREEMPT_COUNT_IRQFLAGS
+#define INIT_PREEMPT_COUNT	(PREEMPT_OFFSET + HARDIRQ_DISABLE_OFFSET)
+#else
 #define INIT_PREEMPT_COUNT	PREEMPT_OFFSET
+#endif
 
 /*
  * Initial preempt_count value; reflects the preempt_count schedule invariant
@@ -322,6 +326,21 @@ do { \
 
 #endif /* CONFIG_PREEMPT_COUNT */
 
+#ifdef CONFIG_PREEMPT_COUNT_IRQFLAGS
+static __always_inline void __preempt_count_inc_hardirqs_disable(void)
+{
+	__preempt_count_add(HARDIRQ_DISABLE_OFFSET);
+}
+
+static __always_inline void __preempt_count_dec_hardirqs_disable(void)
+{
+	__preempt_count_sub(HARDIRQ_DISABLE_OFFSET);
+}
+#else
+static __always_inline void __preempt_count_inc_hardirqs_disable(void) { }
+static __always_inline void __preempt_count_dec_hardirqs_disable(void) { }
+#endif
+
 #ifdef MODULE
 /*
  * Modules have no business playing preemption tricks.
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -152,6 +152,9 @@ config PREEMPT_DYNAMIC
 	  Interesting if you want the same pre-built kernel should be used for
 	  both Server and Desktop workloads.
 
+config PREEMPT_COUNT_IRQFLAGS
+	bool
+
 config SCHED_CORE
 	bool "Core Scheduling for SMT"
 	depends on SCHED_SMT
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -171,6 +171,7 @@ irqentry_state_t noinstr irqentry_nmi_en
 {
 	irqentry_state_t irq_state;
 
+	__preempt_count_inc_hardirqs_disable();
 	irq_state.lockdep = lockdep_hardirqs_enabled();
 
 	__nmi_enter();
@@ -202,4 +203,5 @@ void noinstr irqentry_nmi_exit(struct pt
 	if (irq_state.lockdep)
 		lockdep_hardirqs_on(CALLER_ADDR0);
 	__nmi_exit();
+	__preempt_count_dec_hardirqs_disable();
 }
