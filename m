Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C6039A076;
	Fri, 28 Aug 2026 23:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787958721; cv=none; b=p7ZXTEmFVi/EEHLUWPfwCTI9mNVdfuaIBnmhF0wHIeClsfEyK6xx4z0e0with00BLSINoqvsapT0A63TWEKDuzqKfVEOpE+ibyKz19A+/F9ItPYTsC4FtK4RpJAzvS9TuCkZ3KsxjkS5inMQ12tc0SXWiXHAJh5vSGUyT/ELK3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787958721; c=relaxed/simple;
	bh=IniAj8NiQXjpuHXvXmJyKgiSwi5yEqKsEZ6gkihFiBE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Jp5S9Zbderq46JLIfoNSPGa2hyawHe6356IeqZt6XJ3StwHN+zgihD+9yGgDgvsamMG0iD2YUgKNnD39pcKkkKfQhshzXKbuYLK3WNBtmvHgRgUiLxYUHmeg522P9adACGoJFuk8f2ZTVooqtBSKWMGb8i+daR3Jc8tFlxAvs4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KePE0gPU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KePE0gPU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C391F000E9;
	Fri, 28 Aug 2026 23:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787958719;
	bh=kX/M39VcC+AGqin/bvKuR++iv1Fak8KoWE/p5KDnDYw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=KePE0gPUaU5RsbbeS5ZbXMZctKnbmJFVS68EEwBz1nS8U3nK7Q0seA8c9WONK5Wx+
	 SkeB8Oa84GgsgW5OkH6+hk401Iyddat8CIBbsU6CyxbsSWB0kLK5F3VGL+Waq1bHVE
	 vT6wF6wyJGTtF6B9RzNlur5c5J41XVdrY+vrDV0AFPiX1XhUXr1b0LYpD/dnH0LbuR
	 aFc7Ej/VBzLd1oIvCdSOTip2h3QIXWezBKxnomcNRSiCGRPu1fmqB2gIBdMc4qMms6
	 zEyKOeTOe7UwywYr5BsVmQgpYzZB7t5MhzYiqKg7FhaTEpTh33CYKo6IzkGRlUihRf
	 TMeEAqTrJEoyg==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
In-Reply-To: <87wltbdvmd.ffs@fw13>
References: <20260824104704.GA4121339@noisy.programming.kicks-ass.net>
 <20260824105523.GA4121620@noisy.programming.kicks-ass.net>
 <aozw_7Txxaq2qE7c@tardis.local> <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local> <87v78wezid.ffs@fw13>
 <apA4M7Asz0mV9uaw@tardis.local> <87jypbfu1t.ffs@fw13>
 <apBrZuxU8bmCgG8h@tardis.local> <87bjanfmzz.ffs@fw13>
 <apCS3T63WUxHd1GH@tardis.local> <87wltbdvmd.ffs@fw13>
Date: Sat, 29 Aug 2026 01:11:56 +0200
Message-ID: <87mru5et6r.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Aug 28 2026 at 00:52, Thomas Gleixner wrote:
> On Thu, Aug 27 2026 at 12:41, Boqun Feng wrote:
> So I sat down and reverted
>
>   1b0866874833 ("locking: Switch to _irq_{disable,enable}() variants in cleanup guards")
>   e901c1510e24 ("irq,spin_lock: Add counted interrupt disabling/enabling")
>
> and then hacked it up just to see how far I get before vanishing to bed.
>
> Three hours later it surprisingly booted right away into a full distro
> kernel and survived kernel builds and a few test cases. :)

/FACMEPALM

Yesterday night I was really surprised but too tired to think about it.

When I came around today to look at it again I was more than embarrassed
to figure out that the KVM script rebuilt the wrong branch over and
over. So the build numbers kept increasing...

Brown paperbag time ...

Of course the real thing did _NOT_ boot at all, so I sat down and
figured out what's going wrong and added a pile of debug to it, which is
sadly non-existing in this magic local_interrupt_dis/enable() code.

The overall fallout is moderate. Some of it are actual (but harmless)
bugs and the rest are the oddball cases we talked about before.

It builds and boots now for real, but of course your mileage will vary
depending on hardware and .config. Combo patch on top of the reverts is
below.

The whole pile can be retrieved from git via:

  git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags

I have some thoughts about how to deal with the overall disaster, but
that has to wait until my brain is truly awake again...

Thanks,

        tglx
---
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecac..c7229a7cfa7c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -133,6 +133,7 @@ config X86
 	select ARCH_USES_CFI_TRAPS		if X86_64 && CFI
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
+	select ARCH_SUPPORTS_PREEMPT_COUNT_IRQFLAGS
 	select ARCH_SUPPORTS_RT
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
diff --git a/arch/x86/include/asm/hardirq.h b/arch/x86/include/asm/hardirq.h
index dea60d66d976..34bdf24b939b 100644
--- a/arch/x86/include/asm/hardirq.h
+++ b/arch/x86/include/asm/hardirq.h
@@ -113,4 +113,6 @@ static __always_inline bool kvm_get_cpu_l1tf_flush_l1d(void)
 static __always_inline void kvm_set_cpu_l1tf_flush_l1d(void) { }
 #endif /* IS_ENABLED(CONFIG_KVM_INTEL) */
 
+#define __ARCH_IRQ_EXIT_IRQS_DISABLED 1
+
 #endif /* _ASM_X86_HARDIRQ_H */
diff --git a/arch/x86/include/asm/preempt.h b/arch/x86/include/asm/preempt.h
index fafb6f8cdac3..8b4d4cbae52e 100644
--- a/arch/x86/include/asm/preempt.h
+++ b/arch/x86/include/asm/preempt.h
@@ -61,10 +61,20 @@ static __always_inline void preempt_count_set(unsigned long pc)
  */
 #define init_task_preempt_count(p) do { } while (0)
 
-#define init_idle_preempt_count(p, cpu) do { \
-	per_cpu(__preempt_count, (cpu)) = PREEMPT_DISABLED; \
+#ifdef CONFIG_PREEMPT_COUNT_IRQFLAGS
+
+#define init_idle_preempt_count(p, cpu) do {						\
+	per_cpu(__preempt_count, (cpu)) = PREEMPT_DISABLED | HARDIRQ_DISABLE_OFFSET;	\
 } while (0)
 
+#else
+
+#define init_idle_preempt_count(p, cpu) do {						\
+	per_cpu(__preempt_count, (cpu)) = PREEMPT_DISABLED;				\
+} while (0)
+
+#endif
+
 /*
  * We fold the NEED_RESCHED bit into the preempt count such that
  * preempt_enable() can decrement and test for needing to reschedule with a
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 6b0a5861ccb8..0b5a05cb543f 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -256,9 +256,9 @@ noinstr u32 kvm_read_and_reset_apf_flags(void)
 {
 	u32 flags = 0;
 
-	if (__this_cpu_read(async_pf_enabled)) {
-		flags = __this_cpu_read(apf_reason.flags);
-		__this_cpu_write(apf_reason.flags, 0);
+	if (raw_cpu_read(async_pf_enabled)) {
+		flags = raw_cpu_read(apf_reason.flags);
+		raw_cpu_write(apf_reason.flags, 0);
 	}
 
 	return flags;
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 346c438ac880..b0be24a386f3 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -824,7 +824,7 @@ void __noreturn stop_this_cpu(void *dummy)
 	struct cpuinfo_x86 *c = this_cpu_ptr(&cpu_info);
 	unsigned int cpu = smp_processor_id();
 
-	local_irq_disable();
+	raw_force_local_irq_disable();
 
 	/*
 	 * Remove this CPU from the online mask and disable it
diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index 0fed6d0d7e32..40104170be24 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -98,7 +98,7 @@ static int __init set_efi_reboot(const struct dmi_system_id *d)
 
 void __noreturn machine_real_restart(unsigned int type)
 {
-	local_irq_disable();
+	raw_force_local_irq_disable();
 
 	/*
 	 * Write zero to CMOS register number 0x0f, which the BIOS POST
@@ -535,7 +535,7 @@ static inline void nmi_shootdown_cpus_on_restart(void);
 #if IS_ENABLED(CONFIG_KVM_X86)
 static void emergency_reboot_disable_virtualization(void)
 {
-	local_irq_disable();
+	raw_force_local_irq_disable();
 
 	/*
 	 * Disable virtualization on all CPUs before rebooting to avoid hanging
@@ -699,7 +699,7 @@ void native_machine_shutdown(void)
 	 * not receive the per-cpu timer interrupt which may trigger
 	 * scheduler's load balance.
 	 */
-	local_irq_disable();
+	raw_force_local_irq_disable();
 	stop_other_cpus();
 #endif
 
@@ -823,7 +823,8 @@ static int crash_nmi_callback(unsigned int val, struct pt_regs *regs)
 	 */
 	if (cpu == crashing_cpu)
 		return NMI_HANDLED;
-	local_irq_disable();
+
+	raw_force_local_irq_disable();
 
 	if (shootdown_callback)
 		shootdown_callback(cpu, regs);
@@ -865,7 +866,7 @@ void nmi_shootdown_cpus(nmi_shootdown_cb callback)
 {
 	unsigned long msecs;
 
-	local_irq_disable();
+	raw_force_local_irq_disable();
 
 	/*
 	 * Avoid certain doom if a shootdown already occurred; re-registering
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index aa88370ce739..3164eab7cecd 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1486,7 +1486,8 @@ handle_page_fault(struct pt_regs *regs, unsigned long error_code,
 	 * page fault handling might have reenabled interrupts,
 	 * make sure to disable them again.
 	 */
-	local_irq_disable();
+	if (!irqs_disabled())
+		local_irq_disable();
 }
 
 DEFINE_IDTENTRY_RAW_ERRORCODE(exc_page_fault)
diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
index 132a9df98471..f13e88fb7a78 100644
--- a/drivers/acpi/sleep.c
+++ b/drivers/acpi/sleep.c
@@ -1095,7 +1095,7 @@ static int acpi_power_off(struct sys_off_data *data)
 {
 	/* acpi_sleep_prepare(ACPI_STATE_S5) should have already been called */
 	pr_debug("%s called\n", __func__);
-	local_irq_disable();
+	raw_force_local_irq_disable();
 	acpi_enter_sleep_state(ACPI_STATE_S5);
 	return NOTIFY_DONE;
 }
diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 3bf969ad8fe0..b54afbd6e073 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -594,13 +594,14 @@ struct softirq_action
 
 asmlinkage void do_softirq(void);
 asmlinkage void __do_softirq(void);
+void do_softirq_irqsoff(void);
 
 #ifdef CONFIG_PREEMPT_RT
 extern void do_softirq_post_smp_call_flush(unsigned int was_pending);
 #else
 static inline void do_softirq_post_smp_call_flush(unsigned int unused)
 {
-	do_softirq();
+	do_softirq_irqsoff();
 }
 #endif
 
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 0bb6c03481fa..ba5210fab31f 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -97,6 +97,7 @@ static __always_inline bool arch_in_rcu_eqs(void) { return false; }
  */
 static __always_inline void enter_from_user_mode(struct pt_regs *regs)
 {
+	__preempt_count_inc_hardirqs_disable();
 	arch_enter_from_user_mode(regs);
 	lockdep_hardirqs_off(CALLER_ADDR0);
 
@@ -275,6 +276,7 @@ static __always_inline void exit_to_user_mode(void)
 	user_enter_irqoff();
 	arch_exit_to_user_mode();
 	lockdep_hardirqs_on(CALLER_ADDR0);
+	__preempt_count_dec_hardirqs_disable();
 }
 
 /**
@@ -385,6 +387,8 @@ static __always_inline irqentry_state_t irqentry_enter_from_kernel_mode(struct p
 		.exit_rcu = false,
 	};
 
+	__preempt_count_inc_hardirqs_disable();
+
 	/*
 	 * If this entry hit the idle task invoke ct_irq_enter() whether
 	 * RCU is watching or not.
@@ -498,6 +502,7 @@ irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs *regs, irqentry_state_
 			instrumentation_end();
 			ct_irq_exit();
 			lockdep_hardirqs_on(CALLER_ADDR0);
+			__preempt_count_dec_hardirqs_disable();
 			return;
 		}
 
@@ -514,6 +519,7 @@ irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs *regs, irqentry_state_
 		if (state.exit_rcu)
 			ct_irq_exit();
 	}
+	__preempt_count_dec_hardirqs_disable();
 }
 
 /**
diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index 57b074e0cfbb..dd55786768d1 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -13,6 +13,7 @@
 #define _LINUX_TRACE_IRQFLAGS_H
 
 #include <linux/irqflags_types.h>
+#include <linux/preempt.h>
 #include <linux/typecheck.h>
 #include <linux/cleanup.h>
 #include <asm/irqflags.h>
@@ -163,33 +164,149 @@ extern void warn_bogus_irq_restore(void);
 #endif
 
 /*
- * Wrap the arch provided IRQ routines to provide appropriate checks.
+ * Wrap the architecture specific routines to provide appropriate checks.
  */
-#define raw_local_irq_disable()		arch_local_irq_disable()
-#define raw_local_irq_enable()		arch_local_irq_enable()
+#ifdef CONFIG_PREEMPT_COUNT_IRQFLAGS
+
+// FIXME: Convert this into a proper debug mechanism
+#define debug_assert(c)					\
+do {							\
+	WARN_ON(!(c));					\
+} while (0)
+
+static __always_inline void raw_local_irq_disable(void)
+{
+	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK) == 0);
+	arch_local_irq_disable();
+	__preempt_count_add(HARDIRQ_DISABLE_OFFSET);
+}
+
+static __always_inline void raw_force_local_irq_disable(void)
+{
+	arch_local_irq_disable();
+	__preempt_count_add(HARDIRQ_DISABLE_OFFSET);
+}
+
+static __always_inline void raw_local_irq_enable(void)
+{
+	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET);
+	__preempt_count_sub(HARDIRQ_DISABLE_OFFSET);
+	arch_local_irq_enable();
+}
+
+static __always_inline unsigned long __raw_local_irq_save(void)
+{
+	unsigned int cnt = preempt_count() & HARDIRQ_DISABLE_MASK;
+
+	debug_assert(cnt != HARDIRQ_DISABLE_MASK);
+
+	if (!cnt)
+		arch_local_irq_disable();
+	__preempt_count_add(HARDIRQ_DISABLE_OFFSET);
+
+	return cnt;
+}
+
+static __always_inline void __raw_local_irq_restore(unsigned long cnt)
+{
+	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK) == (cnt + HARDIRQ_DISABLE_OFFSET));
+
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
+	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET);
+	__preempt_count_sub(HARDIRQ_DISABLE_OFFSET);
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
+static __always_inline void raw_force_local_irq_disable(void)
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
+		__raw_local_irq_restore(flags);		\
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
diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 2e689de7b29a..c953cdfb3cc2 100644
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
+#define NMI_BITS		(1 + 3 * IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS))
 
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
 
@@ -90,18 +90,29 @@
  *
  * Reset by start_kernel()->sched_init()->init_idle()->init_idle_preempt_count().
  */
+
+#ifdef CONFIG_PREEMPT_COUNT_IRQFLAGS
+
+#define INIT_PREEMPT_COUNT	(PREEMPT_OFFSET + HARDIRQ_DISABLE_OFFSET)
+#define SCHED_PREEMPT_COUNT	(2 * PREEMPT_DISABLE_OFFSET + HARDIRQ_DISABLE_OFFSET)
+
+#else
+
 #define INIT_PREEMPT_COUNT	PREEMPT_OFFSET
+#define SCHED_PREEMPT_COUNT	(2 * PREEMPT_DISABLE_OFFSET)
+
+#endif
 
 /*
  * Initial preempt_count value; reflects the preempt_count schedule invariant
  * which states that during context switches:
  *
- *    preempt_count() == 2*PREEMPT_DISABLE_OFFSET
+ *    preempt_count() == SCHED_PREEMPT_COUNT
  *
- * Note: PREEMPT_DISABLE_OFFSET is 0 for !PREEMPT_COUNT kernels.
+ * Note: SCHED_PREEMPT_COUNT is 0 for !PREEMPT_COUNT kernels.
  * Note: See finish_task_switch().
  */
-#define FORK_PREEMPT_COUNT	(2*PREEMPT_DISABLE_OFFSET + PREEMPT_ENABLED)
+#define FORK_PREEMPT_COUNT	(SCHED_PREEMPT_COUNT + PREEMPT_ENABLED)
 
 /* preempt_count() and related functions, depends on PREEMPT_NEED_RESCHED */
 #include <asm/preempt.h>
@@ -168,6 +179,16 @@ static __always_inline unsigned char interrupt_context_level(void)
 #define in_softirq()		(softirq_count())
 #define in_interrupt()		(irq_count())
 
+/*
+ * Check whether a fault happened in an atomic context. Depending on
+ * CONFIG_PREEMPT_COUNT and CONFIG_PREEMPTION this check might be useless.
+ */
+#ifdef CONFIG_PREEMPT_COUNT_IRQFLAGS
+# define fault_in_atomic()	(preempt_count() != HARDIRQ_DISABLE_OFFSET)
+#else
+# define fault_in_atomic()	in_atomic()
+#endif
+
 /*
  * The preempt_count offset after preempt_disable();
  */
@@ -322,6 +343,21 @@ do { \
 
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
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index eddbbb65ccc4..086de4c18575 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -296,9 +296,9 @@ static inline bool pagefault_disabled(void)
  * stick to pagefault_disabled().
  * Please NEVER use preempt_disable() to disable the fault handler. With
  * !CONFIG_PREEMPT_COUNT, this is like a NOP. So the handler won't be disabled.
- * in_atomic() will report different values based on !CONFIG_PREEMPT_COUNT.
+ * fault_in_atomic() will report different values based on !CONFIG_PREEMPT_COUNT.
  */
-#define faulthandler_disabled() (pagefault_disabled() || in_atomic())
+#define faulthandler_disabled() (pagefault_disabled() || fault_in_atomic())
 
 DEFINE_LOCK_GUARD_0(pagefault, pagefault_disable(), pagefault_enable())
 
diff --git a/init/main.c b/init/main.c
index 2613d3f9b3ce..fa84ce260b04 100644
--- a/init/main.c
+++ b/init/main.c
@@ -991,7 +991,6 @@ void start_kernel(void)
 
 	cgroup_init_early();
 
-	local_irq_disable();
 	early_boot_irqs_disabled = true;
 
 	/*
diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index f294dad43bd7..c44607990219 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -152,6 +152,15 @@ config PREEMPT_DYNAMIC
 	  Interesting if you want the same pre-built kernel should be used for
 	  both Server and Desktop workloads.
 
+config ARCH_SUPPORTS_PREEMPT_COUNT_IRQFLAGS
+	bool
+
+config PREEMPT_COUNT_IRQFLAGS
+	bool "Enable reference counted interrupt disable/enable mechanisms"
+	depends on ARCH_SUPPORTS_PREEMPT_COUNT_IRQFLAGS
+	help
+	  FIXME: Add some useful blurb
+
 config SCHED_CORE
 	bool "Core Scheduling for SMT"
 	depends on SCHED_SMT
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e3d381fd3d25..3c93ce7f86f6 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -171,6 +171,7 @@ irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
 {
 	irqentry_state_t irq_state;
 
+	__preempt_count_inc_hardirqs_disable();
 	irq_state.lockdep = lockdep_hardirqs_enabled();
 
 	__nmi_enter();
@@ -202,4 +203,5 @@ void noinstr irqentry_nmi_exit(struct pt_regs *regs, irqentry_state_t irq_state)
 	if (irq_state.lockdep)
 		lockdep_hardirqs_on(CALLER_ADDR0);
 	__nmi_exit();
+	__preempt_count_dec_hardirqs_disable();
 }
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f78275192036..b6d14feaaf56 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5343,7 +5343,7 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	 *
 	 * Also, see FORK_PREEMPT_COUNT.
 	 */
-	if (WARN_ONCE(preempt_count() != 2*PREEMPT_DISABLE_OFFSET,
+	if (WARN_ONCE(preempt_count() != SCHED_PREEMPT_COUNT,
 		      "corrupted preempt_count: %s/%d/0x%x\n",
 		      current->comm, current->pid, preempt_count()))
 		preempt_count_set(FORK_PREEMPT_COUNT);
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index eb73b65ce6c4..7132320035eb 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -380,7 +380,8 @@ static void do_idle(void)
 	 * RCU relies on this call to be done outside of an RCU read-side
 	 * critical section.
 	 */
-	flush_smp_call_function_queue();
+	scoped_guard(irq)
+		flush_smp_call_function_queue();
 	schedule_idle();
 
 	if (unlikely(klp_patch_pending(current)))
diff --git a/kernel/smp.c b/kernel/smp.c
index b696bcc60c08..d51e4bc8da1b 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -665,19 +665,17 @@ static void __flush_smp_call_function_queue(bool warn_cpu_offline)
 void flush_smp_call_function_queue(void)
 {
 	unsigned int was_pending;
-	unsigned long flags;
 
 	if (llist_empty(this_cpu_ptr(&call_single_queue)))
 		return;
 
-	local_irq_save(flags);
+	lockdep_assert_irqs_disabled();
+
 	/* Get the already pending soft interrupts for RT enabled kernels */
 	was_pending = local_softirq_pending();
 	__flush_smp_call_function_queue(true);
 	if (local_softirq_pending())
 		do_softirq_post_smp_call_flush(was_pending);
-
-	local_irq_restore(flags);
 }
 
 static int __smp_call_function_single(int cpu, smp_call_func_t func,
diff --git a/kernel/softirq.c b/kernel/softirq.c
index e1a773e3eb4e..33f82d03ca2b 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -455,7 +455,10 @@ void __local_bh_enable_ip(unsigned long ip, unsigned int cnt)
 		 * Run softirq if any pending. And do it in its own stack
 		 * as we may be calling this deep in a task call stack already.
 		 */
-		do_softirq();
+		if (IS_ENABLED(CONFIG_TRACE_IRQFLAGS))
+			do_softirq_irqsoff();
+		else
+			do_softirq();
 	}
 
 	preempt_count_dec();
@@ -517,20 +520,21 @@ static inline void invoke_softirq(void)
 
 asmlinkage __visible void do_softirq(void)
 {
-	__u32 pending;
-	unsigned long flags;
-
 	if (in_interrupt())
 		return;
 
-	local_irq_save(flags);
+	guard(irqsave)();
+	if (local_softirq_pending())
+		do_softirq_own_stack();
+}
 
-	pending = local_softirq_pending();
+void do_softirq_irqsoff(void)
+{
+	if (in_interrupt())
+		return;
 
-	if (pending)
+	if (local_softirq_pending())
 		do_softirq_own_stack();
-
-	local_irq_restore(flags);
 }
 
 #endif /* !CONFIG_PREEMPT_RT */
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 530d61257b9a..977dd8928934 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -2068,7 +2068,7 @@ static void __run_hrtimer(struct hrtimer_cpu_base *cpu_base, struct hrtimer_cloc
 
 	lockdep_hrtimer_exit(expires_in_hardirq);
 	trace_hrtimer_expire_exit(timer);
-	raw_spin_lock_irq(&cpu_base->lock);
+	raw_spin_lock_irqsave(&cpu_base->lock, flags);
 
 	/*
 	 * Note: We clear the running state after enqueue_hrtimer and



