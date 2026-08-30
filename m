Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D202EB856;
	Sun, 30 Aug 2026 19:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788119856; cv=none; b=OcPY9yQDL8FqtnJ9+N48qdS+ArAN5KzeiLB9F20zi3EY7aykWKFl3fWR1XnNi7cNVhQ+3pV7avRJKGISczsRYwp1Z0/AThZ3ZQjKUXtbt5SqWCGwwt5QShiOKCjqmxQ10xQSeM7Flho0WaQ8FJhfc1JN08nPH/iZZ8I6LU7dGAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788119856; c=relaxed/simple;
	bh=hsIWf8O1eVFN6p32hx/KT9CgNTl0pSDVUJ+P4AMXPpU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=auAxZrhBCTcXeeL+CkAbRIpMPdpVSWesUckoLbKauxkpXmILcLX8/I6Dfnrbs1sRPdr1ki4pnxiGEST8ZyBDk2aMzdZE4oCIYiHGryVMCwqU0rd/OfEdqmiHk6Cm4M1ToYU+p375/6ArXE7DTSfr2X9SiYOoLO9guN7Zg5tzGz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYG+NzYE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYG+NzYE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1641F000E9;
	Sun, 30 Aug 2026 19:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788119852;
	bh=vZelFRFcs8rRluFo1uF+WVZqLG01bnjJ+mmzjK5xbAI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=NYG+NzYEQh4jtyM2WXAXCP2wyR4obFV5CWhX6FAATDGa7LfmWXNo/uLyRAd7K2X0+
	 77jmkGf80h4UAeAMi71pTQyP+HVlmJpjkfFV+D6VBz1Vr0iQeVHBcncabW6obH+yCA
	 duZRrwhi4d0WP8znIha2utjFYc8Ah7HrsaGxgHGceGm/nAP/agied1FlTWdaUhK/Lo
	 cbRS9b5Z/Tp/ZbQtrU4/PNYENnLB8NDE0art7544jXd0GQg/vpOcOfNYuNZKrgyDmV
	 UVktkhs9WuMazZPC1gLf4FP/toaQWQgiBSRzG6pngJQxb4OZFonKbbvoyVaDfJZwTU
	 sWVYuAIdodg0w==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
In-Reply-To: <apRJzVbMl-hj-otX@tardis.local>
References: <ao4lO7U7L-7Zice1@tardis.local> <87v78wezid.ffs@fw13>
 <apA4M7Asz0mV9uaw@tardis.local> <87jypbfu1t.ffs@fw13>
 <apBrZuxU8bmCgG8h@tardis.local> <87bjanfmzz.ffs@fw13>
 <apCS3T63WUxHd1GH@tardis.local> <87wltbdvmd.ffs@fw13>
 <87mru5et6r.ffs@fw13> <apNtQWqOgwF5_Ctq@tardis.local>
 <apRJzVbMl-hj-otX@tardis.local>
Date: Sun, 30 Aug 2026 21:57:30 +0200
Message-ID: <87v78rcrf9.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain

On Sun, Aug 30 2026 at 08:18, Boqun Feng wrote:
> On Sat, Aug 29, 2026 at 04:37:37PM -0700, Boqun Feng wrote:
>> And while we are at, we can just introduce a
>> raw_local_irq_restore_auto() (definitely needs a better name), which
>> doesn't need a cnt:
>>
>> static __always_inline void __raw_local_irq_restore_auto(void)
>> {
>> 	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK));
>> 
>> 	if (!(__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET) & HARDIRQ_DISABLE_MASK))
>> 		arch_local_irq_enable();
>> }

Can we just make the thing work in the first place?
 
>> And we can slowly convert irq_restore() users to use it?

Somewhere down the road.

> I decided to use local_irq_resume(), not sure whether it's a good name
> either...
>
> If we are OK to not fully revert on commit e901c1510e24 ("irq,spin_lock:
> Add counted interrupt disabling/enabling"), I think the following will
> resolve the 0day built errors on your irqflags branch (I rebased onto
> tip/locking/urgent with rest of your series on irqflags branch). A few
> things to notice:

The zero day failure is not due to that. It's because I reverted that
refcounted muck as well in my git tree.

I just rebased the series on top of tip locking/urgent, which only has
the irq,spinlock revert and your patches on top.

> * I haven't found a way that we can do a local_irq_resume() when
>   !CONFIG_PREEMPT_COUNT_IRQFLAGS, and if we cannot, it's going to make
>   part of Rust code depends on CONFIG_PREEMPT_COUNT_IRQFLAGS=y

That's a good thing as it might make people actually get their act
together. And you can work around that in interrupt_rc.h itself.

Can you please stop bouncing around like a rubber ball and take your
time?

First of all I want to move interrupt_rc.h and the whole spinlock muck
into rust/helpers/ now. Why?

Simply because it is Rust only and we don't want to expose any of this
stuff to random driver writers. See attached patch.

I've rebased my devel branch on top of tip/locking/urgent and applied
that patch so the robots can have their field day.

The actual PREEMPT_COUNT_IRQFLAGS thing will be 7.4 material obviously
and as this is confined to Rust then it's trivial enough to work around
it locally without exposing more stuff. See tiny delta patch below.

So the only side effect of that is that the Rust implementation will not
be fully integrated into the preempt count magic, but it should just
work, no?

And when an architecture supports the real thing then it gets all the
benefits with bells and whistels.

I really want to get the PREEMPT_COUNT_IRQFLAGS design right first and
then we can think about simplifications and cleanups and remove the
whole Rust magic once all architectures which support Rust play along.

Thanks,

        tglx

---
 rust/helpers/interrupt_rc.h |    6 ++++++
 1 file changed, 6 insertions(+)

--- a/rust/helpers/interrupt_rc.h
+++ b/rust/helpers/interrupt_rc.h
@@ -38,8 +38,14 @@ extern void _local_interrupt_save_state(
 extern void _local_interrupt_enable(void);
 #endif
 
+#ifdef CONFIG_PREEMPT_COUNT_IRQFLAGS
 #define hardirq_disable_enter()	__preempt_count_add_return(HARDIRQ_DISABLE_OFFSET)
 #define hardirq_disable_exit()	__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET)
+#else
+DECLARE_PER_CPU(unsigned int, local_interrupt_cnt);
+#define hardirq_disable_enter()	__this_cpu_add_return(local_interrupt_count, HARDIRQ_DISABLE_OFFSET)
+#define hardirq_disable_exit()	__this_cpu_sub_return(local_interrupt_count, HARDIRQ_DISABLE_OFFSET)
+#endif
 
 static inline void local_interrupt_disable(void)
 {



--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline; filename=movestuff.patch

Subject: movestuff
From: Thomas Gleixner <tglx@kernel.org>
Date: Sun, 30 Aug 2026 20:45:30 +0200

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 include/linux/spinlock.h         |   23 -------
 include/linux/spinlock_api_smp.h |   41 --------------
 include/linux/spinlock_api_up.h  |   15 -----
 include/linux/spinlock_rt.h      |   18 ------
 kernel/locking/spinlock.c        |   31 ----------
 kernel/softirq.c                 |   15 -----
 rust/helpers/interrupt.c         |   21 ++++++-
 rust/helpers/interrupt_rc.h      |   68 +++++++++++++++++++++++
 rust/helpers/spinlock.c          |   39 +++++++++++++
 rust/helpers/spinlock.h          |  114 +++++++++++++++++++++++++++++++++++++++
 10 files changed, 240 insertions(+), 145 deletions(-)

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
-void _local_interrupt_save_state(unsigned long flags)
-{
-	__local_interrupt_save_state(flags);
-}
-EXPORT_SYMBOL(_local_interrupt_save_state);
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
+#ifdef CONFIG_RT
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
+#else  /* CONFIG_RT */
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
+#endif  /* !CONFIG_RT */
+
+#endif /* __RUST_HELPERS_SPINLOCK_H */

--=-=-=--
