Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7675431F985
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882217; cv=none; b=QihZyuy2KvcgViWq45odbyTO0Sjc/TTWAZSHYt0atUHobYNtpNk5Wg/DiqohemmVvt3Im2t0bqTTbXaKdhh4RhqcScHF6qPyXYz+W1DOu/7JC1HP5UMgaH59QgeuqMKeyCmHHPIHGckyMRYqkamb6+r5jViXRLu6BGHo/7bC+ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882217; c=relaxed/simple;
	bh=Pf7ZGRBxMy0O53LNSd/h5m0HHy6kH+ncDX/USXkSEA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ub+y63VDrjTbIV934m2JvfwQWYKPnqIBdWF0Z/8OXTuz5Xzp37rEraLcshaZV5ZyVpNpzfOhCMPqmmvu8YP7M5c3sgJUYXTfKf618QEUGI9pqJ6+49YxZga72BI4VkfSRoSqECeNaw7vtQIRs9VYpxUbB3yEcPhaAKRRbuNobZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htbkKSK8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htbkKSK8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCFB21F000E9;
	Fri, 28 Aug 2026 01:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787882213;
	bh=RAXYSYMF4Q931UrfHeFaiGTm3FcP4/PBARiKaS/H2uQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=htbkKSK8clVT/7u3LipdWTGYwHuJMtIHU+rHNXZCfzcQwOWqlj+eQ2SQn3ldIUE8S
	 92CqbgOzTNXmVy4c/6VaVxIiZKtK0an9shuZ3p6HwtombtdCelHXRKRN2QnxB3Eqp6
	 NlGPueCBj/n+iMKG0GQS5lzWCR4j3VO4U4gPY1hhGd0+uuyQOQ/vujluB4OhoRZ3hB
	 8oT2pKppWq4jEvz28pOHaZ/8Nxmjik+cYsSBWFASD+P2XJU1l2mKW8fmEsdV5RmxNE
	 E+eykPtVyu1STxp5gVv+a+2bVEdb/QZ8m8jqJzTTQTKVw8G7pXUc23oQVFi0VDeaKD
	 r+fbCzbUnoFxA==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id DF990F40066;
	Thu, 27 Aug 2026 21:56:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 27 Aug 2026 21:56:51 -0400
X-ME-Sender: <xms:4-qQarCGf7PjbIz5oj3ms1XHhN-eoJz8Fd17GHE8khVeNM7QzhHnTg>
    <xme:4-qQaq3oe66KtswTeGODAelue4eubGhrfz87aVIWUa6V37AguqGi5-JuIw1ADQluP
    AEA5M2t_v1odOFw-E8odCF6q-8cCWAtBWBnUAXvW7Qc_uYspQqt3nA>
X-ME-Received: <xmr:4-qQat1Ov4nP1w727U_QtCr6DQ3-b7GXD-gXOLiZ-u8F3YeBklsGqyvqAvd6ov5pu8RNxjPHlk_FCFNARpPWJOL7NprFMsKJ>
X-ME-Proxy-Cause: dmFkZTE6Wyd0bI4o/Oxfzyc90YxyrDIV1N+7e5IpgB2/MHVPY6KmKGjjNgDAOPHTKdJogk
    PXzYWRPKx3I3RaARQuuhbTxofajUB5IYH0uwEdijxySZmOmwjIAKbx3NpZGsCPwAPHOuEz
    BXS6fpXcCrpfap4W7Zh2ugZq08q0v6DxaSk399JuBt7mthmZ1nzLABW/rRCWOSU9eQ0yfO
    nB3XogMigs1gMigcFmkO/ITMk7LifB6bTcsuQve+YvcaVgHsPWTRsptJWS/VFBp6NBlOsx
    G2ygX+PX3vyqApt7AED6CgK3867d3pLW+J35QlwlzqtmTG6UBY7UWJefQKdUu9tlit2ueq
    z/fgNUbmzpP+cVaf0E5cGFawJfhhRwYaMP4UiL8e/tD/v1ELUcuZYEJIwkHgc0B/rqTZJq
    q1L1tJugTIVFr8mISHt0vHFVvp0MaabOrBWLG8CPuZJWf2uMdA+VaohmWp5OQLtTx6g0C6
    SvmH6zF9Az+TnXgQL0z+ApVIp7UK1DaKNAfCRGHyOePuHWdQARLAyeYBG+XDUUpGzpA9AY
    1R6gJ2/rlZYxwSbjXL/DQgBqZqRbpHFtXoCXmqcVjh78e0SXVEz/+jhaN6/AAc54kydQBO
    gCNNCOrDMrMWeZikTPLC6Z0bYrZ2BKb0f2jt9+xrx30m8Axr/OzlWA7Eja4A
X-ME-Proxy: <xmx:4-qQavBAO3C_xa-AIWdRMhoK3alC3bM7001ALviQ7iEziVGlZWR-bg>
    <xmx:4-qQas682hA2_s2RbRc1pdNVryAZYbEP9mfSm-gcMvDzHQx7udreBQ>
    <xmx:4-qQagJ8eWN9XabU2haGXAYspK92pZnmIKS8xoziG0soPEQroTmTVA>
    <xmx:4-qQatt0P3kpH-9aItXb0xTSfDe4mKXpEGzssC6apuP05tA62TMVZg>
    <xmx:4-qQanLxlNVRZMrdmXhxxxob9rTg9eGEDgoTm34IvHvD3qC-145i_caw>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 21:56:51 -0400 (EDT)
Date: Thu, 27 Aug 2026 18:56:50 -0700
From: Boqun Feng <boqun@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <apDq4hUbjNtQQn1f@tardis.local>
References: <aozw_7Txxaq2qE7c@tardis.local>
 <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local>
 <87v78wezid.ffs@fw13>
 <apA4M7Asz0mV9uaw@tardis.local>
 <87jypbfu1t.ffs@fw13>
 <apBrZuxU8bmCgG8h@tardis.local>
 <87bjanfmzz.ffs@fw13>
 <apCS3T63WUxHd1GH@tardis.local>
 <87wltbdvmd.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wltbdvmd.ffs@fw13>

On Fri, Aug 28, 2026 at 12:52:26AM +0200, Thomas Gleixner wrote:
> On Thu, Aug 27 2026 at 12:41, Boqun Feng wrote:
> > On Thu, Aug 27, 2026 at 08:15:44PM +0200, Thomas Gleixner wrote:
> >> > For now I will reverse the order and remove the additional checking in
> >> > softirq to fix the softirq pending issue.
> >> 
> >> That "fixes" another nasty bug which was latent for weeks and people
> >> could not get a handle on it because it was absolutely not
> >> reproducible. Given all that I'm absolutely not convinced that there
> >> isn't another pile of latent surprises lurking.
> >> 
> >> Aside of that I'm worried about having this new counter exposed in the
> >> current state of affairs. Nothing prevents arbitrary code from using
> >> hardirq_disable_count(), which is definitely faster than
> >> irqs_disabled(), but returns a random value depending on context. That's
> >
> > Random how? Are you saying in the current (wrong) order? Because after
> > reversing the order, hardirq_disable_count() != 0 means the interrupt
> > has been disabled, no?
> >
> > But I checked, actually with the reverse order, we don't need
> > hardirq_disable_count(), so we can remove it entirely. Will send a
> > follow up patch on this.
> 
> The point is that the counter is only valid when used within the limits
> of the current coverage. Other than that it is not:
> 
>         spin_lock_irq() // or any other non-covered mechanism
>             // observes 0
>             cnt = preempt_count() & HARDIRQ_DISABLE_MASK;
> 
> That's inconsistent and therefore it is a random number, no?
> 
> You have no way to prevent that this happens and if it does it becomes a
> nightmare to debug for everyone. Guess who got the bug reports about
> preemption counter issues and local softirq pending messages in his
> inbox and dealt with them.
> 
> There is a world outside of your safe rust zone and that needs to be
> safe too. This half finished attempt to make Rust work is absolutely
> not and I have zero interrest to deal with the fallout.
> 
> It's not safe and no extra hacks will make it safe. Which means it is
> not ready. So the only sensible thing is to revert everything which
> touches that section of preempt_count() and provides interfaces.
> 
> As this annoyed me, I rumaged through my poison cabinet and found the
> old patches again. They obviously don't apply anymore but I found the
> hints which corners need some care. With the generic entry code that
> also got way simpler.
> 
> So I sat down and reverted
> 
>   1b0866874833 ("locking: Switch to _irq_{disable,enable}() variants in cleanup guards")
>   e901c1510e24 ("irq,spin_lock: Add counted interrupt disabling/enabling")
> 
> and then hacked it up just to see how far I get before vanishing to bed.
> 
> Three hours later it surprisingly booted right away into a full distro
> kernel and survived kernel builds and a few test cases. :)
> 
> Obviously I did not do any serious testing on it, but I wanted to share
> it as a starting point and food for thoughts.
> 

My biggest concern is how you are going to handle the oddballs I
mentioned in another thread, especially when you need to fix the users.
Because this would lead to a all-or-nothing solution: unless we resolve
all the oddballs, we cannot enable this.

> Yes, it needs to be enabled per architecture as the preempt counter
> initialization is architecture specific and it requires generic entry
> code. But those are not uncommon prerequisites and an incentive for
> architecture people to get their act together.
> 
> But it is fully consistent and the fully refcounted thing can be
> built on top of it. If you look carefuly you'll notice that
> __raw_local_irq_disable/enable() are just optimized versions of
> __raw_local_irq_save/restore() as they don't have the conditionals, so
> they can be unified completely at least for debug builds or in general
> when it turns out that the overhead is neglible.
> 
> There is a wide range of optimizations possible with that especially by
> combining preempt/interrupt modifications into one operation and
> rescheduling without changing the preemption counter in the first
> place. Which is what I hinted to in the mail you linked earlier. I'm so
> tempted to hack that up tomorrow once my brain is less fried than now
> and after I exposed it to some serious testing.
> 

If you did, looking forwards to it, I can help enable that for other
architectures if needed.

Regards,
Boqun

> Thanks,
> 
>         tglx
> ---
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -318,6 +318,7 @@ config X86
>  	select PCI_DOMAINS			if PCI
>  	select PCI_LOCKLESS_CONFIG		if PCI
>  	select PERF_EVENTS
> +	select PREEMPT_COUNT_IRQFLAGS
>  	select RTC_LIB
>  	select RTC_MC146818_LIB
>  	select SPARSE_IRQ
> --- a/arch/x86/include/asm/preempt.h
> +++ b/arch/x86/include/asm/preempt.h
> @@ -61,8 +61,8 @@ static __always_inline void preempt_coun
>   */
>  #define init_task_preempt_count(p) do { } while (0)
>  
> -#define init_idle_preempt_count(p, cpu) do { \
> -	per_cpu(__preempt_count, (cpu)) = PREEMPT_DISABLED; \
> +#define init_idle_preempt_count(p, cpu) do {						\
> +	per_cpu(__preempt_count, (cpu)) = PREEMPT_DISABLED | HARDIRQ_DISABLE_OFFSET;	\
>  } while (0)
>  
>  /*
> --- a/include/linux/irq-entry-common.h
> +++ b/include/linux/irq-entry-common.h
> @@ -97,6 +97,7 @@ static __always_inline bool arch_in_rcu_
>   */
>  static __always_inline void enter_from_user_mode(struct pt_regs *regs)
>  {
> +	__preempt_count_inc_hardirqs_disable();
>  	arch_enter_from_user_mode(regs);
>  	lockdep_hardirqs_off(CALLER_ADDR0);
>  
> @@ -275,6 +276,7 @@ static __always_inline void exit_to_user
>  	user_enter_irqoff();
>  	arch_exit_to_user_mode();
>  	lockdep_hardirqs_on(CALLER_ADDR0);
> +	__preempt_count_dec_hardirqs_disable();
>  }
>  
>  /**
> @@ -385,6 +387,8 @@ static __always_inline irqentry_state_t
>  		.exit_rcu = false,
>  	};
>  
> +	__preempt_count_inc_hardirqs_disable();
> +
>  	/*
>  	 * If this entry hit the idle task invoke ct_irq_enter() whether
>  	 * RCU is watching or not.
> @@ -498,6 +502,7 @@ irqentry_exit_to_kernel_mode_after_preem
>  			instrumentation_end();
>  			ct_irq_exit();
>  			lockdep_hardirqs_on(CALLER_ADDR0);
> +			__preempt_count_dec_hardirqs_disable();
>  			return;
>  		}
>  
> @@ -514,6 +519,7 @@ irqentry_exit_to_kernel_mode_after_preem
>  		if (state.exit_rcu)
>  			ct_irq_exit();
>  	}
> +	__preempt_count_dec_hardirqs_disable();
>  }
>  
>  /**
> --- a/include/linux/irqflags.h
> +++ b/include/linux/irqflags.h
> @@ -13,6 +13,7 @@
>  #define _LINUX_TRACE_IRQFLAGS_H
>  
>  #include <linux/irqflags_types.h>
> +#include <linux/preempt.h>
>  #include <linux/typecheck.h>
>  #include <linux/cleanup.h>
>  #include <asm/irqflags.h>
> @@ -165,31 +166,124 @@ extern void warn_bogus_irq_restore(void)
>  /*
>   * Wrap the arch provided IRQ routines to provide appropriate checks.
>   */
> -#define raw_local_irq_disable()		arch_local_irq_disable()
> -#define raw_local_irq_enable()		arch_local_irq_enable()
> +#ifdef CONFIG_PREEMPT_COUNT_IRQFLAGS
> +static __always_inline void raw_local_irq_disable(void)
> +{
> +	arch_local_irq_disable();
> +	preempt_count_add(HARDIRQ_DISABLE_OFFSET);
> +}
> +
> +static __always_inline void raw_local_irq_enable(void)
> +{
> +	preempt_count_sub(HARDIRQ_DISABLE_OFFSET);
> +	arch_local_irq_enable();
> +}
> +
> +static __always_inline unsigned long __raw_local_irq_save(void)
> +{
> +	unsigned long cnt = preempt_count();
> +
> +	if (!(cnt & HARDIRQ_DISABLE_MASK))
> +		arch_local_irq_disable();
> +	preempt_count_add(HARDIRQ_DISABLE_OFFSET);
> +
> +	// Probably not even needed unless something feeds 'flags' into
> +	// irqs_disabled_flags()
> +	return cnt;
> +}
> +
> +static __always_inline void __raw_local_irq_restore(unsigned long cnt)
> +{
> +	if (!(__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET) & HARDIRQ_DISABLE_MASK))
> +		arch_local_irq_enable();
> +}
> +
> +static __always_inline unsigned long __raw_local_save_flags(void)
> +{
> +	return preempt_count() & HARDIRQ_DISABLE_MASK;
> +}
> +
> +static __always_inline bool __raw_irqs_disabled_flags(unsigned long cnt)
> +{
> +	return !!cnt;
> +}
> +
> +static __always_inline bool raw_irqs_disabled(void)
> +{
> +	return preempt_count() & HARDIRQ_DISABLE_MASK;
> +}
> +
> +static __always_inline void raw_safe_halt(void)
> +{
> +	preempt_count_sub(HARDIRQ_DISABLE_OFFSET);
> +	arch_safe_halt();
> +}
> +
> +#else
> +
> +static __always_inline void raw_local_irq_disable(void)
> +{
> +	arch_local_irq_disable();
> +}
> +
> +static __always_inline void raw_local_irq_enable(void)
> +{
> +	arch_local_irq_enable();
> +}
> +
> +static __always_inline unsigned long __raw_local_irq_save(void)
> +{
> +	return arch_local_irq_save();
> +}
> +
> +static __always_inline void __raw_local_irq_restore(unsigned long flags)
> +{
> +	arch_local_irq_restore(flags);
> +}
> +
> +static __always_inline unsigned long __raw_local_save_flags(void)
> +{
> +	return arch_local_save_flags();
> +}
> +
> +static __always_inline bool __raw_irqs_disabled_flags(unsigned long flags)
> +{
> +	return arch_irqs_disabled_flags(flags);
> +}
> +
> +static __always_inline bool raw_irqs_disabled(void)
> +{
> +	return arch_irqs_disabled();
> +}
> +
> +static __always_inline void raw_safe_halt(void)
> +{
> +	arch_safe_halt();
> +}
> +
> +#endif
> +
>  #define raw_local_irq_save(flags)			\
>  	do {						\
>  		typecheck(unsigned long, flags);	\
> -		flags = arch_local_irq_save();		\
> +		flags = __raw_local_irq_save();		\
>  	} while (0)
>  #define raw_local_irq_restore(flags)			\
>  	do {						\
>  		typecheck(unsigned long, flags);	\
>  		raw_check_bogus_irq_restore();		\
> -		arch_local_irq_restore(flags);		\
> +		__raw_local_irq_restore(flags);	\
>  	} while (0)
>  #define raw_local_save_flags(flags)			\
>  	do {						\
>  		typecheck(unsigned long, flags);	\
> -		flags = arch_local_save_flags();	\
> +		flags = __raw_local_save_flags();	\
>  	} while (0)
>  #define raw_irqs_disabled_flags(flags)			\
>  	({						\
>  		typecheck(unsigned long, flags);	\
> -		arch_irqs_disabled_flags(flags);	\
> +		__raw_irqs_disabled_flags(flags);	\
>  	})
> -#define raw_irqs_disabled()		(arch_irqs_disabled())
> -#define raw_safe_halt()			arch_safe_halt()
>  
>  /*
>   * The local_irq_*() APIs are equal to the raw_local_irq*()
> --- a/include/linux/preempt.h
> +++ b/include/linux/preempt.h
> @@ -54,31 +54,31 @@
>   *             NMI_MASK:	0xf0000000
>   * (PREEMPT_NEED_RESCHED is in a different word)
>   */
> -#define PREEMPT_BITS	8
> -#define SOFTIRQ_BITS	8
> +#define PREEMPT_BITS		8
> +#define SOFTIRQ_BITS		8
>  #define HARDIRQ_DISABLE_BITS	8
> -#define HARDIRQ_BITS	4
> -#define NMI_BITS	(1 + 3*IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS))
> +#define HARDIRQ_BITS		4
> +#define NMI_BITS		(1 + 3*IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS))
>  
> -#define PREEMPT_SHIFT	0
> -#define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
> +#define PREEMPT_SHIFT		0
> +#define SOFTIRQ_SHIFT		(PREEMPT_SHIFT + PREEMPT_BITS)
>  #define HARDIRQ_DISABLE_SHIFT	(SOFTIRQ_SHIFT + SOFTIRQ_BITS)
> -#define HARDIRQ_SHIFT	(HARDIRQ_DISABLE_SHIFT + HARDIRQ_DISABLE_BITS)
> -#define NMI_SHIFT	(HARDIRQ_SHIFT + HARDIRQ_BITS)
> +#define HARDIRQ_SHIFT		(HARDIRQ_DISABLE_SHIFT + HARDIRQ_DISABLE_BITS)
> +#define NMI_SHIFT		(HARDIRQ_SHIFT + HARDIRQ_BITS)
>  
> -#define __IRQ_MASK(x)	((1UL << (x))-1)
> +#define __IRQ_MASK(x)		((1UL << (x))-1)
>  
> -#define PREEMPT_MASK	(__IRQ_MASK(PREEMPT_BITS) << PREEMPT_SHIFT)
> -#define SOFTIRQ_MASK	(__IRQ_MASK(SOFTIRQ_BITS) << SOFTIRQ_SHIFT)
> +#define PREEMPT_MASK		(__IRQ_MASK(PREEMPT_BITS) << PREEMPT_SHIFT)
> +#define SOFTIRQ_MASK		(__IRQ_MASK(SOFTIRQ_BITS) << SOFTIRQ_SHIFT)
>  #define HARDIRQ_DISABLE_MASK	(__IRQ_MASK(HARDIRQ_DISABLE_BITS) << HARDIRQ_DISABLE_SHIFT)
> -#define HARDIRQ_MASK	(__IRQ_MASK(HARDIRQ_BITS) << HARDIRQ_SHIFT)
> -#define NMI_MASK	(__IRQ_MASK(NMI_BITS)     << NMI_SHIFT)
> +#define HARDIRQ_MASK		(__IRQ_MASK(HARDIRQ_BITS) << HARDIRQ_SHIFT)
> +#define NMI_MASK		(__IRQ_MASK(NMI_BITS)     << NMI_SHIFT)
>  
> -#define PREEMPT_OFFSET	(1UL << PREEMPT_SHIFT)
> -#define SOFTIRQ_OFFSET	(1UL << SOFTIRQ_SHIFT)
> +#define PREEMPT_OFFSET		(1UL << PREEMPT_SHIFT)
> +#define SOFTIRQ_OFFSET		(1UL << SOFTIRQ_SHIFT)
>  #define HARDIRQ_DISABLE_OFFSET	(1UL << HARDIRQ_DISABLE_SHIFT)
> -#define HARDIRQ_OFFSET	(1UL << HARDIRQ_SHIFT)
> -#define NMI_OFFSET	(1UL << NMI_SHIFT)
> +#define HARDIRQ_OFFSET		(1UL << HARDIRQ_SHIFT)
> +#define NMI_OFFSET		(1UL << NMI_SHIFT)
>  
>  #define SOFTIRQ_DISABLE_OFFSET	(2 * SOFTIRQ_OFFSET)
>  
> @@ -90,7 +90,11 @@
>   *
>   * Reset by start_kernel()->sched_init()->init_idle()->init_idle_preempt_count().
>   */
> +#ifdef CONFIG_PREEMPT_COUNT_IRQFLAGS
> +#define INIT_PREEMPT_COUNT	(PREEMPT_OFFSET + HARDIRQ_DISABLE_OFFSET)
> +#else
>  #define INIT_PREEMPT_COUNT	PREEMPT_OFFSET
> +#endif
>  
>  /*
>   * Initial preempt_count value; reflects the preempt_count schedule invariant
> @@ -322,6 +326,21 @@ do { \
>  
>  #endif /* CONFIG_PREEMPT_COUNT */
>  
> +#ifdef CONFIG_PREEMPT_COUNT_IRQFLAGS
> +static __always_inline void __preempt_count_inc_hardirqs_disable(void)
> +{
> +	__preempt_count_add(HARDIRQ_DISABLE_OFFSET);
> +}
> +
> +static __always_inline void __preempt_count_dec_hardirqs_disable(void)
> +{
> +	__preempt_count_sub(HARDIRQ_DISABLE_OFFSET);
> +}
> +#else
> +static __always_inline void __preempt_count_inc_hardirqs_disable(void) { }
> +static __always_inline void __preempt_count_dec_hardirqs_disable(void) { }
> +#endif
> +
>  #ifdef MODULE
>  /*
>   * Modules have no business playing preemption tricks.
> --- a/kernel/Kconfig.preempt
> +++ b/kernel/Kconfig.preempt
> @@ -152,6 +152,9 @@ config PREEMPT_DYNAMIC
>  	  Interesting if you want the same pre-built kernel should be used for
>  	  both Server and Desktop workloads.
>  
> +config PREEMPT_COUNT_IRQFLAGS
> +	bool
> +
>  config SCHED_CORE
>  	bool "Core Scheduling for SMT"
>  	depends on SCHED_SMT
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -171,6 +171,7 @@ irqentry_state_t noinstr irqentry_nmi_en
>  {
>  	irqentry_state_t irq_state;
>  
> +	__preempt_count_inc_hardirqs_disable();
>  	irq_state.lockdep = lockdep_hardirqs_enabled();
>  
>  	__nmi_enter();
> @@ -202,4 +203,5 @@ void noinstr irqentry_nmi_exit(struct pt
>  	if (irq_state.lockdep)
>  		lockdep_hardirqs_on(CALLER_ADDR0);
>  	__nmi_exit();
> +	__preempt_count_dec_hardirqs_disable();
>  }
