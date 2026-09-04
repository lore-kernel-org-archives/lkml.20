Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B7832AAA3;
	Fri,  4 Sep 2026 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527667; cv=none; b=W2iqBjKJ5sCpN/61P0rPlNCM83bHdA/1YTC0X4M3wTGAoZJxT7qvdntGWF72uZEm2pctEEkJIzfhKnrgyK847f2lPVXg6hz8l0sri+3qeKwEcZ1l4KYt0CL5hyy2gzfZ88oxRe2fuxrS8Dky1GOi+UcbrKrMcu+hb2tW/WCEHDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527667; c=relaxed/simple;
	bh=fSyJQqvtd7MGw9wQjRPc4uB/Ro0qz3cd4cIyzaQbIaU=;
	h=From:To:Cc:Subject:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HdXQ52voaKPVk0WAmDja9FpKUoUgtDU2KTDhl2kr4nC7WnrvT+RxLQUCIyo5Urr4ej3lIY9R6Y3y0qfBi0Joi3QZ7fzFogE7ZambpAZ7DOhNPRXMjP6dYNjUv4MMMUPQxfaZALR0haegAartcRfG8wpMjuSuyIZlSGMw08PZsLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fchcqOVa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fchcqOVa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272021F00A3D;
	Fri,  4 Sep 2026 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788527664;
	bh=FkqLWsLA6DITUOa9hHDocIGTWs8MbQn1kHOzqNxyk10=;
	h=From:To:Cc:Subject:Subject:In-Reply-To:References:Date;
	b=fchcqOVafkWyETQ0PbKwaFQTHRFJgPjBHHcJWt6ObeqT4GxQPKb2bo94y7QMRcRZk
	 1baqDKuAAlHb46J6EdcujbAfSUiOoKGu+nIcMsXzAu87/ydf4vr5a8V41R+NNWIkQD
	 1mc01vSUP7MKnqze28R/xWFD3/jTdrmW4+BdvUm9OirsmTbB0KB3/lnbp0sPLDcfYD
	 5hv+bslPbMWrfgN+CNt/h6bpgynyrCkd3J8lAmlO4Z4NjNg7UOmxIPATxHUftK1EXk
	 2LjU3lxuefwklmKe4rQZv2Mcr2OYv7fdQjfs5CoaJ6b/9v0rhRD+lhdzucX1Jj2MwT
	 SgmEtbRB+NAcA==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: [PATCH] irq: Move local_irq_enable/disable() into Rust
Subject: 
In-Reply-To: <87tso9axyk.ffs@fw13>
References: <apBrZuxU8bmCgG8h@tardis.local> <87bjanfmzz.ffs@fw13>
 <apCS3T63WUxHd1GH@tardis.local> <87wltbdvmd.ffs@fw13>
 <87mru5et6r.ffs@fw13> <apNtQWqOgwF5_Ctq@tardis.local>
 <apRJzVbMl-hj-otX@tardis.local> <87v78rcrf9.ffs@fw13>
 <apSfObo_6Ji5HA7E@tardis.local> <87jyp6d2ut.ffs@fw13>
 <apV2iSFXlc3XY7Wk@tardis.local> <87tso9axyk.ffs@fw13>
Date: Fri, 04 Sep 2026 15:14:20 +0200
Message-ID: <87bjad88gj.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


After reverting the spinlock conversion and a lengthy discussion it's the
best to confine the reference counted interrupt disable/enable mechanism to
Rust which is the only user.

This should become the new norm, but that needs more thoughts and cleaning
up the confined usage in Rust at some point is way simpler than chasing
random places which adopt it in the meanwhile.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 include/linux/interrupt_rc.h         |   82 -------------------------
 include/linux/spinlock.h             |   23 -------
 include/linux/spinlock_api_smp.h     |   41 ------------
 include/linux/spinlock_api_up.h      |   15 ----
 include/linux/spinlock_rt.h          |   18 -----
 kernel/irq/refcount_interrupt_test.c |    2 
 kernel/locking/spinlock.c            |   31 ---------
 kernel/softirq.c                     |   15 ----
 rust/helpers/interrupt.c             |   21 ++++++
 rust/helpers/interrupt_rc.h          |   68 ++++++++++++++++++++
 rust/helpers/spinlock.c              |   39 +++++++++++
 rust/helpers/spinlock.h              |  114 +++++++++++++++++++++++++++++++++++
 12 files changed, 241 insertions(+), 228 deletions(-)

--- a/include/linux/interrupt_rc.h
+++ /dev/null
@@ -1,82 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __LINUX_INTERRUPT_RC_H
-#define __LINUX_INTERRUPT_RC_H
-
-/*
- * include/linux/interrupt_rc.h - refcounted local processor interrupt
- * management.
- *
- * Since the implementation of this API currently depends on
- * local_irq_save()/local_irq_restore(), we split this into its own header to
- * make it easier to include without hitting circular header dependencies.
- */
-
-#include <linux/irqflags.h>
-#include <linux/preempt.h>
-#include <linux/processor.h>
-#include <linux/smp.h>
-
-#ifndef MODULE
-/* Per-CPU interrupt disabling state for local_interrupt_{disable,enable}(). */
-DECLARE_PER_CPU(unsigned long, local_interrupt_disable_state);
-
-static __always_inline void __local_interrupt_disable(void)
-{
-	unsigned long flags;
-
-	local_irq_save(flags);
-	raw_cpu_write(local_interrupt_disable_state, flags);
-}
-
-static __always_inline void __local_interrupt_enable(void)
-{
-	unsigned long flags = raw_cpu_read(local_interrupt_disable_state);
-
-	local_irq_restore(flags);
-}
-
-#ifndef INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
-static __always_inline void _local_interrupt_disable(void)
-{
-	__local_interrupt_disable();
-}
-
-static __always_inline void _local_interrupt_enable(void)
-{
-	__local_interrupt_enable();
-}
-#else
-extern void _local_interrupt_disable(void);
-extern void _local_interrupt_enable(void);
-#endif
-
-#else /* !MODULE */
-extern void _local_interrupt_disable(void);
-extern void _local_interrupt_enable(void);
-#endif /* !MODULE */
-
-static inline void local_interrupt_disable(void)
-{
-	int new_count;
-
-	WARN_ON_ONCE(in_nmi());
-
-	new_count = hardirq_disable_enter();
-
-	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
-
-	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
-		_local_interrupt_disable();
-}
-
-static inline void local_interrupt_enable(void)
-{
-	int new_count;
-
-	new_count = hardirq_disable_exit();
-
-	if ((new_count & HARDIRQ_DISABLE_MASK) == 0)
-		_local_interrupt_enable();
-}
-
-#endif /* !__LINUX_INTERRUPT_RC_H */
--- a/include/linux/spinlock.h
+++ b/include/linux/spinlock.h
@@ -57,7 +57,6 @@
 #include <linux/linkage.h>
 #include <linux/compiler.h>
 #include <linux/irqflags.h>
-#include <linux/interrupt_rc.h>
 #include <linux/thread_info.h>
 #include <linux/stringify.h>
 #include <linux/bottom_half.h>
@@ -274,11 +273,9 @@ static inline void do_raw_spin_unlock(ra
 #endif
 
 #define raw_spin_lock_irq(lock)		_raw_spin_lock_irq(lock)
-#define raw_spin_lock_irq_disable(lock)	_raw_spin_lock_irq_disable(lock)
 #define raw_spin_lock_bh(lock)		_raw_spin_lock_bh(lock)
 #define raw_spin_unlock(lock)		_raw_spin_unlock(lock)
 #define raw_spin_unlock_irq(lock)	_raw_spin_unlock_irq(lock)
-#define raw_spin_unlock_irq_enable(lock)	_raw_spin_unlock_irq_enable(lock)
 
 #define raw_spin_unlock_irqrestore(lock, flags)		\
 	do {							\
@@ -293,8 +290,6 @@ static inline void do_raw_spin_unlock(ra
 
 #define raw_spin_trylock_irqsave(lock, flags) _raw_spin_trylock_irqsave(lock, &(flags))
 
-#define raw_spin_trylock_irq_disable(lock)	_raw_spin_trylock_irq_disable(lock)
-
 #ifndef CONFIG_PREEMPT_RT
 /* Include rwlock functions for !RT */
 #include <linux/rwlock.h>
@@ -377,12 +372,6 @@ static __always_inline void spin_lock_ir
 	raw_spin_lock_irq(&lock->rlock);
 }
 
-static __always_inline void spin_lock_irq_disable(spinlock_t *lock)
-	__acquires(lock) __no_context_analysis
-{
-	raw_spin_lock_irq_disable(&lock->rlock);
-}
-
 #define spin_lock_irqsave(lock, flags)				\
 do {								\
 	raw_spin_lock_irqsave(spinlock_check(lock), flags);	\
@@ -413,12 +402,6 @@ static __always_inline void spin_unlock_
 	raw_spin_unlock_irq(&lock->rlock);
 }
 
-static __always_inline void spin_unlock_irq_enable(spinlock_t *lock)
-	__releases(lock) __no_context_analysis
-{
-	raw_spin_unlock_irq_enable(&lock->rlock);
-}
-
 static __always_inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
 	__releases(lock) __no_context_analysis
 {
@@ -444,12 +427,6 @@ static __always_inline bool _spin_tryloc
 }
 #define spin_trylock_irqsave(lock, flags) _spin_trylock_irqsave(lock, &(flags))
 
-static __always_inline int spin_trylock_irq_disable(spinlock_t *lock)
-	__cond_acquires(true, lock) __no_context_analysis
-{
-	return raw_spin_trylock_irq_disable(&lock->rlock);
-}
-
 /**
  * spin_is_locked() - Check whether a spinlock is locked.
  * @lock: Pointer to the spinlock.
--- a/include/linux/spinlock_api_smp.h
+++ b/include/linux/spinlock_api_smp.h
@@ -28,8 +28,6 @@ void __lockfunc
 void __lockfunc _raw_spin_lock_bh(raw_spinlock_t *lock)		__acquires(lock);
 void __lockfunc _raw_spin_lock_irq(raw_spinlock_t *lock)
 								__acquires(lock);
-void __lockfunc _raw_spin_lock_irq_disable(raw_spinlock_t *lock)
-								__acquires(lock);
 
 unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
 								__acquires(lock);
@@ -41,7 +39,6 @@ int __lockfunc _raw_spin_trylock_bh(raw_
 void __lockfunc _raw_spin_unlock(raw_spinlock_t *lock)		__releases(lock);
 void __lockfunc _raw_spin_unlock_bh(raw_spinlock_t *lock)	__releases(lock);
 void __lockfunc _raw_spin_unlock_irq(raw_spinlock_t *lock)	__releases(lock);
-void __lockfunc _raw_spin_unlock_irq_enable(raw_spinlock_t *lock)	__releases(lock);
 void __lockfunc
 _raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
 								__releases(lock);
@@ -58,11 +55,6 @@ void __lockfunc
 #define _raw_spin_lock_irq(lock) __raw_spin_lock_irq(lock)
 #endif
 
-/* Use the same config as spin_lock_irq() temporarily. */
-#ifdef CONFIG_INLINE_SPIN_LOCK_IRQ
-#define _raw_spin_lock_irq_disable(lock) __raw_spin_lock_irq_disable(lock)
-#endif
-
 #ifdef CONFIG_INLINE_SPIN_LOCK_IRQSAVE
 #define _raw_spin_lock_irqsave(lock) __raw_spin_lock_irqsave(lock)
 #endif
@@ -87,11 +79,6 @@ void __lockfunc
 #define _raw_spin_unlock_irq(lock) __raw_spin_unlock_irq(lock)
 #endif
 
-/* Use the same config as spin_unlock_irq() temporarily. */
-#ifdef CONFIG_INLINE_SPIN_UNLOCK_IRQ
-#define _raw_spin_unlock_irq_enable(lock) __raw_spin_unlock_irq_enable(lock)
-#endif
-
 #ifdef CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE
 #define _raw_spin_unlock_irqrestore(lock, flags) __raw_spin_unlock_irqrestore(lock, flags)
 #endif
@@ -118,16 +105,6 @@ static __always_inline bool _raw_spin_tr
 	return false;
 }
 
-static __always_inline bool _raw_spin_trylock_irq_disable(raw_spinlock_t *lock)
-	__cond_acquires(true, lock)
-{
-	local_interrupt_disable();
-	if (_raw_spin_trylock(lock))
-		return true;
-	local_interrupt_enable();
-	return false;
-}
-
 static __always_inline bool _raw_spin_trylock_irqsave(raw_spinlock_t *lock, unsigned long *flags)
 	__cond_acquires(true, lock)
 {
@@ -166,15 +143,6 @@ static inline void __raw_spin_lock_irq(r
 	LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
 }
 
-static inline void __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
-	__acquires(lock) __no_context_analysis
-{
-	local_interrupt_disable();
-	preempt_disable();
-	spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
-	LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
-}
-
 static inline void __raw_spin_lock_bh(raw_spinlock_t *lock)
 	__acquires(lock) __no_context_analysis
 {
@@ -220,15 +188,6 @@ static inline void __raw_spin_unlock_irq
 	preempt_enable();
 }
 
-static inline void __raw_spin_unlock_irq_enable(raw_spinlock_t *lock)
-	__releases(lock)
-{
-	spin_release(&lock->dep_map, _RET_IP_);
-	do_raw_spin_unlock(lock);
-	local_interrupt_enable();
-	preempt_enable();
-}
-
 static inline void __raw_spin_unlock_bh(raw_spinlock_t *lock)
 	__releases(lock)
 {
--- a/include/linux/spinlock_api_up.h
+++ b/include/linux/spinlock_api_up.h
@@ -42,9 +42,6 @@
 #define __LOCK_IRQSAVE(lock, flags, ...) \
   do { local_irq_save(flags); __LOCK(lock, ##__VA_ARGS__); } while (0)
 
-#define __LOCK_IRQ_DISABLE(lock, ...) \
-  do { local_interrupt_disable(); __LOCK(lock, ##__VA_ARGS__); } while (0)
-
 #define ___UNLOCK_(lock) \
   do { __release(lock); (void)(lock); } while (0)
 
@@ -64,9 +61,6 @@
 #define __UNLOCK_IRQRESTORE(lock, flags, ...) \
   do { local_irq_restore(flags); __UNLOCK(lock, ##__VA_ARGS__); } while (0)
 
-#define __UNLOCK_IRQ_ENABLE(lock, ...) \
-  do { __UNLOCK(lock, ##__VA_ARGS__); local_interrupt_enable(); } while (0)
-
 #define _raw_spin_lock(lock)			__LOCK(lock)
 #define _raw_spin_lock_nested(lock, subclass)	__LOCK(lock)
 #define _raw_read_lock(lock)			__LOCK(lock, shared)
@@ -76,7 +70,6 @@
 #define _raw_read_lock_bh(lock)			__LOCK_BH(lock, shared)
 #define _raw_write_lock_bh(lock)		__LOCK_BH(lock)
 #define _raw_spin_lock_irq(lock)		__LOCK_IRQ(lock)
-#define _raw_spin_lock_irq_disable(lock)	__LOCK_IRQ_DISABLE(lock)
 #define _raw_read_lock_irq(lock)		__LOCK_IRQ(lock, shared)
 #define _raw_write_lock_irq(lock)		__LOCK_IRQ(lock)
 #define _raw_spin_lock_irqsave(lock, flags)	__LOCK_IRQSAVE(lock, flags)
@@ -104,13 +97,6 @@ static __always_inline int _raw_spin_try
 	return 1;
 }
 
-static __always_inline int _raw_spin_trylock_irq_disable(raw_spinlock_t *lock)
-	__cond_acquires(true, lock)
-{
-	__LOCK_IRQ_DISABLE(lock);
-	return 1;
-}
-
 static __always_inline int _raw_spin_trylock_irqsave(raw_spinlock_t *lock, unsigned long *flags)
 	__cond_acquires(true, lock)
 {
@@ -146,7 +132,6 @@ static __always_inline int _raw_write_tr
 #define _raw_write_unlock_bh(lock)		__UNLOCK_BH(lock)
 #define _raw_read_unlock_bh(lock)		__UNLOCK_BH(lock, shared)
 #define _raw_spin_unlock_irq(lock)		__UNLOCK_IRQ(lock)
-#define _raw_spin_unlock_irq_enable(lock)	__UNLOCK_IRQ_ENABLE(lock)
 #define _raw_read_unlock_irq(lock)		__UNLOCK_IRQ(lock, shared)
 #define _raw_write_unlock_irq(lock)		__UNLOCK_IRQ(lock)
 #define _raw_spin_unlock_irqrestore(lock, flags) \
--- a/include/linux/spinlock_rt.h
+++ b/include/linux/spinlock_rt.h
@@ -96,12 +96,6 @@ static __always_inline void spin_lock_ir
 	rt_spin_lock(lock);
 }
 
-static __always_inline void spin_lock_irq_disable(spinlock_t *lock)
-	__acquires(lock)
-{
-	rt_spin_lock(lock);
-}
-
 #define spin_lock_irqsave(lock, flags)			 \
 	do {						 \
 		typecheck(unsigned long, flags);	 \
@@ -128,12 +122,6 @@ static __always_inline void spin_unlock_
 	rt_spin_unlock(lock);
 }
 
-static __always_inline void spin_unlock_irq_enable(spinlock_t *lock)
-	__releases(lock)
-{
-	rt_spin_unlock(lock);
-}
-
 static __always_inline void spin_unlock_irqrestore(spinlock_t *lock,
 						   unsigned long flags)
 	__releases(lock)
@@ -143,12 +131,6 @@ static __always_inline void spin_unlock_
 
 #define spin_trylock(lock)	rt_spin_trylock(lock)
 
-static __always_inline int spin_trylock_irq_disable(spinlock_t *lock)
-	__cond_acquires(true, lock)
-{
-	return rt_spin_trylock(lock);
-}
-
 #define spin_trylock_bh(lock)	rt_spin_trylock_bh(lock)
 
 #define spin_trylock_irq(lock)	rt_spin_trylock(lock)
--- a/kernel/irq/refcount_interrupt_test.c
+++ b/kernel/irq/refcount_interrupt_test.c
@@ -4,7 +4,7 @@
  */
 
 #include <kunit/test.h>
-#include <linux/interrupt_rc.h>
+#include <../../rust/helpers/interrupt_rc.h>
 
 #define TEST_IRQ_ON() KUNIT_EXPECT_FALSE(test, irqs_disabled())
 #define TEST_IRQ_OFF() KUNIT_EXPECT_TRUE(test, irqs_disabled())
--- a/kernel/locking/spinlock.c
+++ b/kernel/locking/spinlock.c
@@ -129,21 +129,6 @@ static void __lockfunc __raw_##op##_lock
  */
 BUILD_LOCK_OPS(spin, raw_spinlock, __acquires);
 
-/* No rwlock_t variants for now, so just build this function by hand */
-static void __lockfunc __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
-{
-	for (;;) {
-		preempt_disable();
-		local_interrupt_disable();
-		if (likely(do_raw_spin_trylock(lock)))
-			break;
-		local_interrupt_enable();
-		preempt_enable();
-
-		arch_spin_relax(&lock->raw_lock);
-	}
-}
-
 #ifndef CONFIG_PREEMPT_RT
 BUILD_LOCK_OPS(read, rwlock, __acquires_shared);
 BUILD_LOCK_OPS(write, rwlock, __acquires);
@@ -191,14 +176,6 @@ noinline void __lockfunc _raw_spin_lock_
 EXPORT_SYMBOL(_raw_spin_lock_irq);
 #endif
 
-#ifndef CONFIG_INLINE_SPIN_LOCK_IRQ
-noinline void __lockfunc _raw_spin_lock_irq_disable(raw_spinlock_t *lock)
-{
-	__raw_spin_lock_irq_disable(lock);
-}
-EXPORT_SYMBOL_GPL(_raw_spin_lock_irq_disable);
-#endif
-
 #ifndef CONFIG_INLINE_SPIN_LOCK_BH
 noinline void __lockfunc _raw_spin_lock_bh(raw_spinlock_t *lock)
 {
@@ -231,14 +208,6 @@ noinline void __lockfunc _raw_spin_unloc
 EXPORT_SYMBOL(_raw_spin_unlock_irq);
 #endif
 
-#ifndef CONFIG_INLINE_SPIN_UNLOCK_IRQ
-noinline void __lockfunc _raw_spin_unlock_irq_enable(raw_spinlock_t *lock)
-{
-	__raw_spin_unlock_irq_enable(lock);
-}
-EXPORT_SYMBOL_GPL(_raw_spin_unlock_irq_enable);
-#endif
-
 #ifndef CONFIG_INLINE_SPIN_UNLOCK_BH
 noinline void __lockfunc _raw_spin_unlock_bh(raw_spinlock_t *lock)
 {
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -9,7 +9,6 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#define INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
 #include <linux/export.h>
 #include <linux/kernel_stat.h>
 #include <linux/interrupt.h>
@@ -89,20 +88,6 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabl
 EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
 #endif
 
-DEFINE_PER_CPU(unsigned long, local_interrupt_disable_state);
-
-void _local_interrupt_disable(void)
-{
-	__local_interrupt_disable();
-}
-EXPORT_SYMBOL(_local_interrupt_disable);
-
-void _local_interrupt_enable(void)
-{
-	__local_interrupt_enable();
-}
-EXPORT_SYMBOL(_local_interrupt_enable);
-
 #ifndef CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS
 /*
  * Any 32bit architecture that still cares about performance should
--- a/rust/helpers/interrupt.c
+++ b/rust/helpers/interrupt.c
@@ -1,6 +1,25 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <linux/spinlock.h>
+#include <linux/export.h>
+#include <linux/percpu.h>
+
+#define INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
+#include "interrupt_rc.h"
+#include "spinlock.h"
+
+DEFINE_PER_CPU(unsigned long, local_interrupt_disable_state);
+
+void _local_interrupt_save_state(unsigned long flags)
+{
+	__local_interrupt_save_state(flags);
+}
+EXPORT_SYMBOL(_local_interrupt_save_state);
+
+void _local_interrupt_enable(void)
+{
+	__local_interrupt_enable();
+}
+EXPORT_SYMBOL(_local_interrupt_enable);
 
 __rust_helper void rust_helper_local_interrupt_disable(void)
 {
--- /dev/null
+++ b/rust/helpers/interrupt_rc.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __RUST_HELPERS_INTERRUPT_RC_H
+#define __RUST_HELPERS_INTERRUPT_RC_H
+/*
+ * refcounted local processor interrupt management.
+ */
+#include <linux/irqflags.h>
+#include <linux/percpu.h>
+#include <linux/preempt.h>
+
+/* Per-CPU interrupt disabling state for local_interrupt_{disable,enable}(). */
+DECLARE_PER_CPU(unsigned long, local_interrupt_disable_state);
+
+static __always_inline void __local_interrupt_save_state(unsigned long flags)
+{
+	raw_cpu_write(local_interrupt_disable_state, flags);
+}
+
+static __always_inline void __local_interrupt_enable(void)
+{
+	unsigned long flags = raw_cpu_read(local_interrupt_disable_state);
+
+	local_irq_restore(flags);
+}
+
+#ifndef INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
+static __always_inline void _local_interrupt_save_state(unsigned long flags)
+{
+	__local_interrupt_save_state(flags);
+}
+
+static __always_inline void _local_interrupt_enable(void)
+{
+	__local_interrupt_enable();
+}
+#else
+extern void _local_interrupt_save_state(unsigned long flags);
+extern void _local_interrupt_enable(void);
+#endif
+
+#define hardirq_disable_enter()	__preempt_count_add_return(HARDIRQ_DISABLE_OFFSET)
+#define hardirq_disable_exit()	__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET)
+
+static inline void local_interrupt_disable(void)
+{
+	int new_count;
+	unsigned long flags;
+
+	WARN_ON_ONCE(in_nmi());
+
+	local_irq_save(flags);
+	new_count = hardirq_disable_enter();
+
+	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
+		_local_interrupt_save_state(flags);
+}
+
+static inline void local_interrupt_enable(void)
+{
+	int new_count;
+
+	new_count = hardirq_disable_exit();
+
+	if ((new_count & HARDIRQ_DISABLE_MASK) == 0)
+		_local_interrupt_enable();
+}
+
+#endif /* !__RUST_HELPERS_INTERRUPT_RC_H */
--- a/rust/helpers/spinlock.c
+++ b/rust/helpers/spinlock.c
@@ -1,6 +1,43 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <linux/spinlock.h>
+#include <linux/export.h>
+#include "spinlock.h"
+
+#if !defined(CONFIG_GENERIC_LOCKBREAK) || defined(CONFIG_DEBUG_LOCK_ALLOC)
+/* The __lock_function inlines are taken from "spinlock.h" */
+#else
+
+/* No rwlock_t variants for now, so just build this function by hand */
+static void __lockfunc __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
+{
+	for (;;) {
+		preempt_disable();
+		local_interrupt_disable();
+		if (likely(do_raw_spin_trylock(lock)))
+			break;
+		local_interrupt_enable();
+		preempt_enable();
+
+		arch_spin_relax(&lock->raw_lock);
+	}
+}
+#endif
+
+#ifndef CONFIG_INLINE_SPIN_LOCK_IRQ
+noinline void __lockfunc _raw_spin_lock_irq_disable(raw_spinlock_t *lock)
+{
+	__raw_spin_lock_irq_disable(lock);
+}
+EXPORT_SYMBOL_GPL(_raw_spin_lock_irq_disable);
+#endif
+
+#ifndef CONFIG_INLINE_SPIN_UNLOCK_IRQ
+noinline void __lockfunc _raw_spin_unlock_irq_enable(raw_spinlock_t *lock)
+{
+	__raw_spin_unlock_irq_enable(lock);
+}
+EXPORT_SYMBOL_GPL(_raw_spin_unlock_irq_enable);
+#endif
 
 __rust_helper void rust_helper___spin_lock_init(spinlock_t *lock,
 						const char *name,
--- /dev/null
+++ b/rust/helpers/spinlock.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __RUST_HELPERS_SPINLOCK_H
+#define __RUST_HELPERS_SPINLOCK_H
+
+#include <linux/spinlock.h>
+#include "interrupt_rc.h"
+
+#ifdef CONFIG_SMP
+void __lockfunc _raw_spin_lock_irq_disable(raw_spinlock_t *lock)	__acquires(lock);
+void __lockfunc _raw_spin_unlock_irq_enable(raw_spinlock_t *lock)	__releases(lock);
+
+/* Use the same config as spin_lock_irq() temporarily. */
+#ifdef CONFIG_INLINE_SPIN_LOCK_IRQ
+#define _raw_spin_lock_irq_disable(lock) __raw_spin_lock_irq_disable(lock)
+#endif
+
+/* Use the same config as spin_unlock_irq() temporarily. */
+#ifdef CONFIG_INLINE_SPIN_UNLOCK_IRQ
+#define _raw_spin_unlock_irq_enable(lock) __raw_spin_unlock_irq_enable(lock)
+#endif
+
+static __always_inline bool _raw_spin_trylock_irq_disable(raw_spinlock_t *lock)
+	__cond_acquires(true, lock)
+{
+	local_interrupt_disable();
+	if (_raw_spin_trylock(lock))
+		return true;
+	local_interrupt_enable();
+	return false;
+}
+
+static inline void __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
+	__acquires(lock) __no_context_analysis
+{
+	local_interrupt_disable();
+	preempt_disable();
+	spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
+	LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
+}
+
+static inline void __raw_spin_unlock_irq_enable(raw_spinlock_t *lock)
+	__releases(lock)
+{
+	spin_release(&lock->dep_map, _RET_IP_);
+	do_raw_spin_unlock(lock);
+	local_interrupt_enable();
+	preempt_enable();
+}
+
+#else  /* CONFIG_SMP */
+
+#define __LOCK_IRQ_DISABLE(lock, ...)						\
+	do { local_interrupt_disable(); __LOCK(lock, ##__VA_ARGS__); } while (0)
+#define __UNLOCK_IRQ_ENABLE(lock, ...)						\
+	do { __UNLOCK(lock, ##__VA_ARGS__); local_interrupt_enable(); } while (0)
+
+#define _raw_spin_lock_irq_disable(lock)	__LOCK_IRQ_DISABLE(lock)
+#define _raw_spin_unlock_irq_enable(lock)	__UNLOCK_IRQ_ENABLE(lock)
+
+static __always_inline int _raw_spin_trylock_irq_disable(raw_spinlock_t *lock)
+	__cond_acquires(true, lock)
+{
+	__LOCK_IRQ_DISABLE(lock);
+	return 1;
+}
+
+#endif /* CONFIG_SMP */
+
+#define raw_spin_lock_irq_disable(lock)		_raw_spin_lock_irq_disable(lock)
+#define raw_spin_unlock_irq_enable(lock)	_raw_spin_unlock_irq_enable(lock)
+#define raw_spin_trylock_irq_disable(lock)	_raw_spin_trylock_irq_disable(lock)
+
+#ifdef CONFIG_PREEMPT_RT
+static __always_inline void spin_lock_irq_disable(spinlock_t *lock)
+	__acquires(lock)
+{
+	rt_spin_lock(lock);
+}
+
+static __always_inline void spin_unlock_irq_enable(spinlock_t *lock)
+	__releases(lock)
+{
+	rt_spin_unlock(lock);
+}
+
+static __always_inline int spin_trylock_irq_disable(spinlock_t *lock)
+	__cond_acquires(true, lock)
+{
+	return rt_spin_trylock(lock);
+}
+
+#else  /* CONFIG_PREEMPT_RT */
+
+static __always_inline void spin_lock_irq_disable(spinlock_t *lock)
+	__acquires(lock) __no_context_analysis
+{
+	raw_spin_lock_irq_disable(&lock->rlock);
+}
+
+static __always_inline void spin_unlock_irq_enable(spinlock_t *lock)
+	__releases(lock) __no_context_analysis
+{
+	raw_spin_unlock_irq_enable(&lock->rlock);
+}
+
+static __always_inline int spin_trylock_irq_disable(spinlock_t *lock)
+	__cond_acquires(true, lock) __no_context_analysis
+{
+	return raw_spin_trylock_irq_disable(&lock->rlock);
+}
+
+#endif  /* !CONFIG_PREEMPT_RT */
+
+#endif /* __RUST_HELPERS_SPINLOCK_H */
