Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071462C0F6C
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788103124; cv=none; b=K6GVpmSHQXuGPaAUnKhovE6ic0p0LZEPhZuRo8JjvHZabAemjyysxeyGNrWEkmUBAO0f39vv/14T3Zh1cSl77yXbmsvQ56EeTfOF2Z79ZV2LNOyJCnkZhJ1aC7QNd2seuNMdbPFwDb9GXWOCQv2JbJYeC5kPFXowgA0gBIlqgC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788103124; c=relaxed/simple;
	bh=QBpJI9cohGBKxDdTk6WHPOqO4TJDtibbrJtd8njBhRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8NJOydZAH/aGTOt1Aqwz1PXpLQIdDQaQAqOqnFLI9rYBQbWHZc+cfkjxKowN8kygKwFl5bjZLgQPum4ZSbpkUsQK180m6QKFByHaqJUE08Y+F4jNrORK0NHv6Foq5fAY8YgGpisxt/WA9gRJWawRJPCuKIlCIb6eW0so7eDtIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlp2lDTJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlp2lDTJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844531F000E9;
	Sun, 30 Aug 2026 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788103122;
	bh=O/2bC3I06BiXvHpoUIVI++yJKhbFncADcC1IIVaokDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jlp2lDTJvMuPMSkM0FX3NQJ+Po/+Ylsf/f7xH8OL/G3CUkFBRXMtgD4RskS4oZ5Ml
	 vseARHgMN/BoszopA3HP3rgmCcsOc3xeLqjrJaLc3fIYRj8NIJtP5ib0kKb+vDtA0K
	 AgB9+O5J2M1fMcOpVTuXOk4L2J/H8ZQhMmEO3iBXwj8dcwFmtMI0r2tg2UdLrFA7KS
	 4xYjVkSE06X1awTY3wWbD8LCqx9FgZYKT0ROj0G/peUPMdJ50slHQL4RqQi/ihssYF
	 i9Q2HfO18HwEoV3ihhyNRNPy+vXLzhDdUCs8ruFetcPrGBRpLaVqAFecsu6QSN2ekJ
	 M0m015fjzcUkw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 940A3F40066;
	Sun, 30 Aug 2026 11:18:41 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 30 Aug 2026 11:18:41 -0400
X-ME-Sender: <xms:0UmUagRwULzF8RrYFtqgN51UInaTRV3FFqtBQOQKnm82XaT1IvIvDg>
    <xme:0UmUanG5gBJvqOv3CT9kUFcfjYvAp_28MjxlW5Fsp5H3hOvVEvtaqvEF7mibxUJvl
    VR0tLbj45pfSFuXcZdWV-E1S3bR9d-5n1gKE1R9QmGfQnae09Ww>
X-ME-Received: <xmr:0UmUalFKDODiSZ2UcyzCjiL1jBHaaTiK-rbjJyUZKdYtDnUmr7g91Sog0D7kA6eQTJpsXQzCzEiDIjjXWWXFZesydQPPUjyu>
X-ME-Proxy-Cause: dmFkZTEwRou8m1IkU2orscG+9O8r4ODEP9SOvfKjM8a+w4HO2rd3aEom4JzWDChHVNmQnV
    g2n6ZxonA6SYM9jKjWsrBKxwYz1qdJo11F+np5YJwuuIChbOkwTeYLoRzNqUDWEEcnFr0X
    +RxpwD7yLrh2Gacj02CJG5jI165W1HY8sIMqy8YnYUmrN1vxzHJp4zzhcVxzBq4AKRJxCT
    I9JL0qEKSMaGTiv3OcKF3e+fqFxNAUOY6DGf3XozAL/AxWqo3GD9ORP8iB305YHwTrNTIW
    oQM/0B3gxx8mMvm9PakI82pERzYSqfrG6MUFuhfGoCVLWbyRaAxUY912LIKk/gDycAVBni
    gFu/aWvXX2XgslJmUlhwhhXPLgjG6PdOVyg2lHqwr2gLAxGhUwBM8uOXxdt8yFsWXsAViT
    JI0sG77DdG5aQtvZJF8SRzEM2ALMQ8mtSLI/rNgh18w/XqAkaT5/CDgGXqJeHT4gS/h78j
    c0siY58j5I850phDuSji58N6iYGosUOuIgbOo2JrV9FFSqvpac4HiYWfKwriTXox8rVted
    SBkXKBrH1i/5tECO4qyYx0xCkb9jHYeD+6Arm6/NMICsyj5Xvw2eqC00680tb+4K96HtDL
    AGr/sw3NiaocQE3ECy7R7FZuhwAE9zcxxhFPDguizNvECYS8tiHurAMbDP8Q
X-ME-Proxy: <xmx:0UmUalSJ3L-ntqblPk8vmBdKRIGipHkGf9C9RdRpXZBJwB3sycRCsg>
    <xmx:0UmUamJnwFNuAougtD4qsdbVnCinYOK8LlQWKfTqc8zWyEzms_strA>
    <xmx:0UmUagYV9M5Hnh1bu8t9tE63r96pP99qVOCFyZ6YILfaqcSczuHwSw>
    <xmx:0UmUao8znOnfPiM5DqMLxdqCt-P-QT9oKkzcW_JxShlQjzp6iohiqw>
    <xmx:0UmUahbcV-Z9nvCRbH4CczRAznaKRKIFj6jPOrkPVFj2qnl3HLLAp2PF>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Aug 2026 11:18:39 -0400 (EDT)
Date: Sun, 30 Aug 2026 08:18:37 -0700
From: Boqun Feng <boqun@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <apRJzVbMl-hj-otX@tardis.local>
References: <ao4lO7U7L-7Zice1@tardis.local>
 <87v78wezid.ffs@fw13>
 <apA4M7Asz0mV9uaw@tardis.local>
 <87jypbfu1t.ffs@fw13>
 <apBrZuxU8bmCgG8h@tardis.local>
 <87bjanfmzz.ffs@fw13>
 <apCS3T63WUxHd1GH@tardis.local>
 <87wltbdvmd.ffs@fw13>
 <87mru5et6r.ffs@fw13>
 <apNtQWqOgwF5_Ctq@tardis.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apNtQWqOgwF5_Ctq@tardis.local>

On Sat, Aug 29, 2026 at 04:37:37PM -0700, Boqun Feng wrote:
> On Sat, Aug 29, 2026 at 01:11:56AM +0200, Thomas Gleixner wrote:
> [...]
> > +static __always_inline unsigned long __raw_local_irq_save(void)
> > +{
> > +	unsigned int cnt = preempt_count() & HARDIRQ_DISABLE_MASK;
> > +
> > +	debug_assert(cnt != HARDIRQ_DISABLE_MASK);
> > +
> > +	if (!cnt)
> > +		arch_local_irq_disable();
> > +	__preempt_count_add(HARDIRQ_DISABLE_OFFSET);
> > +
> > +	return cnt;
> > +}
> > +
> > +static __always_inline void __raw_local_irq_restore(unsigned long cnt)
> > +{
> > +	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK) == (cnt + HARDIRQ_DISABLE_OFFSET));
> > +
> > +	if (!(__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET) & HARDIRQ_DISABLE_MASK))
> > +		arch_local_irq_enable();
> > +}
> 
> And while we are at, we can just introduce a
> raw_local_irq_restore_auto() (definitely needs a better name), which
> doesn't need a cnt:
> 
> static __always_inline void __raw_local_irq_restore_auto(void)
> {
> 	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK));
> 
> 	if (!(__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET) & HARDIRQ_DISABLE_MASK))
> 		arch_local_irq_enable();
> }
> 
> And we can slowly convert irq_restore() users to use it?
> 


I decided to use local_irq_resume(), not sure whether it's a good name
either...

If we are OK to not fully revert on commit e901c1510e24 ("irq,spin_lock:
Add counted interrupt disabling/enabling"), I think the following will
resolve the 0day built errors on your irqflags branch (I rebased onto
tip/locking/urgent with rest of your series on irqflags branch). A few
things to notice:

* local_interrupt_*() can obviously be removed at all, this patch is
  just for the idea, so I didn't do that. Similarly I didn't introduce
  a spin_lock_irqresume().

* I haven't found a way that we can do a local_irq_resume() when
  !CONFIG_PREEMPT_COUNT_IRQFLAGS, and if we cannot, it's going to make
  part of Rust code depends on CONFIG_PREEMPT_COUNT_IRQFLAGS=y

* Further cleanups on hardirq_disable_*() are needed.

Thoughts?

Regards,
Boqun

------------------------------>8
Subject: [PATCH] interrupt: Add {raw_}local_irq_resume()

With the new PREEMPT_COUNT_IRQFLAGS design,
local_interrupt_{dis,en}able() can be implemented by the same machinery
in local_irq_{save,restore}(). Add a new API local_irq_resume() to skip
the need of passing a previous flags/count to local_irq_restore(). Map
local_interrupt_{dis,en}able() to local_irq{save,resume}().

Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 include/linux/interrupt_rc.h         | 79 ----------------------------
 include/linux/irqflags.h             | 39 ++++++++++++++
 include/linux/spinlock.h             |  1 -
 kernel/irq/refcount_interrupt_test.c |  2 +-
 kernel/softirq.c                     | 15 ------
 5 files changed, 40 insertions(+), 96 deletions(-)
 delete mode 100644 include/linux/interrupt_rc.h

diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
deleted file mode 100644
index e68e1bedba66..000000000000
--- a/include/linux/interrupt_rc.h
+++ /dev/null
@@ -1,79 +0,0 @@
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
-static __always_inline void __local_interrupt_save_state(unsigned long flags)
-{
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
-static __always_inline void _local_interrupt_save_state(unsigned long flags)
-{
-	__local_interrupt_save_state(flags);
-}
-
-static __always_inline void _local_interrupt_enable(void)
-{
-	__local_interrupt_enable();
-}
-#else
-extern void _local_interrupt_save_state(unsigned long flags);
-extern void _local_interrupt_enable(void);
-#endif
-
-#else /* !MODULE */
-extern void _local_interrupt_save_state(unsigned long flags);
-extern void _local_interrupt_enable(void);
-#endif /* !MODULE */
-
-static inline void local_interrupt_disable(void)
-{
-	int new_count;
-	unsigned long flags;
-
-	WARN_ON_ONCE(in_nmi());
-
-	local_irq_save(flags);
-	new_count = hardirq_disable_enter();
-
-	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
-		_local_interrupt_save_state(flags);
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
diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index dd55786768d1..6d4e5f1c73a8 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -215,6 +215,15 @@ static __always_inline void __raw_local_irq_restore(unsigned long cnt)
 		arch_local_irq_enable();
 }
 
+/* Same as raw_local_irq_restore() but don't need user to pass a count. */
+static __always_inline void raw_local_irq_resume(void)
+{
+	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK));
+
+	if (!(__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET) & HARDIRQ_DISABLE_MASK))
+		arch_local_irq_enable();
+}
+
 static __always_inline unsigned long __raw_local_save_flags(void)
 {
 	return preempt_count() & HARDIRQ_DISABLE_MASK;
@@ -264,6 +273,15 @@ static __always_inline void __raw_local_irq_restore(unsigned long flags)
 	arch_local_irq_restore(flags);
 }
 
+static __always_inline void raw_local_irq_resume(void)
+{
+	/*
+	 * local_irq_resume() is not supported when
+	 * CONFIG_PREEMPT_COUNT_IRQFLAGS = n
+	 */
+	BUG();
+}
+
 static __always_inline unsigned long __raw_local_save_flags(void)
 {
 	return arch_local_save_flags();
@@ -342,6 +360,14 @@ static __always_inline void raw_safe_halt(void)
 		raw_local_irq_restore(flags);		\
 	} while (0)
 
+#define local_irq_resume()						\
+	do {								\
+		if ((preempt_count() & HARDIRQ_DISABLE_MASK) ==		\
+				HARDIRQ_DISABLE_OFFSET)			\
+			trace_hardirqs_on();				\
+		raw_local_irq_resume();					\
+	} while (0)
+
 #define safe_halt()				\
 	do {					\
 		trace_hardirqs_on();		\
@@ -355,10 +381,23 @@ static __always_inline void raw_safe_halt(void)
 #define local_irq_disable()	do { raw_local_irq_disable(); } while (0)
 #define local_irq_save(flags)	do { raw_local_irq_save(flags); } while (0)
 #define local_irq_restore(flags) do { raw_local_irq_restore(flags); } while (0)
+#define local_irq_resume()	do { raw_local_irq_resume(); } while (0)
 #define safe_halt()		do { raw_safe_halt(); } while (0)
 
 #endif /* CONFIG_TRACE_IRQFLAGS */
 
+static __always_inline void local_interrupt_disable(void)
+{
+	unsigned long flags;
+
+	local_irq_save(flags);
+}
+
+static __always_inline void local_interrupt_enable(void)
+{
+	local_irq_resume();
+}
+
 #define local_save_flags(flags)	raw_local_save_flags(flags)
 
 /*
diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
index 3d405cc4c121..c619502501e2 100644
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
diff --git a/kernel/irq/refcount_interrupt_test.c b/kernel/irq/refcount_interrupt_test.c
index ca904dba24b9..cbd3b5b9cfa3 100644
--- a/kernel/irq/refcount_interrupt_test.c
+++ b/kernel/irq/refcount_interrupt_test.c
@@ -4,7 +4,7 @@
  */
 
 #include <kunit/test.h>
-#include <linux/interrupt_rc.h>
+#include <linux/irqflags.h>
 
 #define TEST_IRQ_ON() KUNIT_EXPECT_FALSE(test, irqs_disabled())
 #define TEST_IRQ_OFF() KUNIT_EXPECT_TRUE(test, irqs_disabled())
diff --git a/kernel/softirq.c b/kernel/softirq.c
index d124ae6fd1e4..47fb46f9d6f6 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -9,7 +9,6 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#define INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
 #include <linux/export.h>
 #include <linux/kernel_stat.h>
 #include <linux/interrupt.h>
@@ -89,20 +88,6 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabled);
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
-- 
2.50.1 (Apple Git-155)

