Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5540EBA6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275643; cv=none; b=ZxK2TRV1vRqDwC7VohZB60i6/yL/LPoFAPDNEm60nKZtCze0J09MIrOrbb+WwtuZeMGGCo7UWyxipbK/qSy/dNq2jRjBz0fOheU8Y4O/TPrsGBJ6Ztv+92rnHoAxASPpc2D0f0+NAD9rI3qzy0y/1iHqTlrpnx/EiTc0aZYbkp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275643; c=relaxed/simple;
	bh=klylguWiDAYS++6Ge1TVbrn0iRzg1v1rmp6ofuGrK6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sx+Itt6L4PiNs8PbgIwS6gwtdMxNQ1Cq2WQXREzH5dAXi/tzak/GEzw+49/u1SZ3tk64uEd6EG3FvR+Qn4dCk4QEZCyvV7fe2UC3DaTurBrT/tYin+FhtDUd5Jly/geFeH3EZNYRKm4kcuu8f2yMcfXmj+MAxPJJo0HBiSNJj5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMSr1ixz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMSr1ixz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA471F00A3F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788275641;
	bh=DCaGBzz8yKGAyLwap9C7xssKsaeaK+mCRH5nLQGG8GU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KMSr1ixzURgzNgrcRGMXmXDPz/rPY3FWSJK9F4ssakpdDBNrn7dimLAJMCvplCCYE
	 Cy6LGc5hWkPQ0PAc+mjBH4N5E3MWtD0uDh1L3jqq3AeqmkgvldvVZBT9jo1Z4xoEmT
	 0afssCgfezPJ0tZiOuI2O/6oeQywIOJhLp6dZq/aQb9mJoP8FXnIIgVG28LlRFz/Lm
	 9ustizzP48dG5NtRioDMRgTpbu77ID8xpKUEiyaJSgFDSPsEccG1ZmCxhyFphfV3T8
	 voXOn2LqajgwoN4CAOGnyUxiZA6YUcbrUeuqo8mWM3jmXBT16pFxrPpGcrnGoHeHK8
	 kk866YV6NE7ng==
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 72F8BF40066;
	Tue,  1 Sep 2026 11:14:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 01 Sep 2026 11:14:00 -0400
X-ME-Sender: <xms:uOuWaput4yIDEz_hwqJQF01h7DVgVds9M1OK2Djh0F3MT8Nth4YaiA>
    <xme:uOuWarycu8HAOOvIFFht4B0YTCUNqAi1mTkYM5hlQN9HyKjUM_2KY9s9wSawpnUS0
    kERGSDCOrDWgEGajLzygYtwo_iBBqJadg3_1SMphzuLHe71AaZm5-A>
X-ME-Received: <xmr:uOuWakBzePdX5VD6T6v5-DWnsENu9CL-XDayviW_0q3nWANlD-hWkqStri1m9MaK8GUzTkhX8g822i21kzs0tfikjNYw9bFx>
X-ME-Proxy-Cause: dmFkZTEvV5tFfV3mV5YkOE0PDEw4FeLyfmsGJJXs9R3IS/2RUgBSlzWfA2TTinv6VnOC7W
    Qo5l2qNS4o2LNYP5d8r/Kuc33+KSatP5HeUhi9sYm8v+XfVZVZ8ftg9+O5czGsRkOO7ahi
    Jh2CjDLqens0vjRDqk780EE0D4w7FkcWw9SxdcpujhR57gnR2CXV6R1EqjIIAm0J4mCnGT
    rJpOvcxBXRCIroxthDr1x6qgG611+qpHnNgwALrWn/ZsWOsbM81942FBHQb2HX2Cf+TpVO
    6u/Bvp+KdWp8gd3yWbrfX3NraGGGpCpUjHWzEUHH8uh/yskuA+ssaZiVOsRgynoOJsjPLv
    tzGJcV6Vb8fqImHktSI5C64wkIVn5TyI14cZ8bNhF1rtCtNEtP6fmyW13+SF0vgsqEFrVF
    4/kG0viLp04k4XnT4jphxomWr+gjNykXKzHHw1jlFte+GgEYdasijpk0KZ82PWAvqDnZWl
    X3mHfNtuAZSMXsV2jXpljnjGBwS6XOiNUE2GiGCYZol8N8NwlRzPK7cf3sG5A+PbxMm+jP
    KSbQFkTGxiZR6nyfToE4NjmKn/48W9G5euZv59/9skJuaulkJQuca/OG6xkcNJCHYLcg0T
    tFqMlGOzkWzBfOexyKtL+BIWkJ/phNshzaZ7jx7uiyBWmdnFLBM39Q7Q+qog
X-ME-Proxy: <xmx:uOuWahexBORyoSwiFrA1DIJQYrhkxxeU5a8P_uxGLvtwx0ygq9T4lA>
    <xmx:uOuWammHVo5whKRzZKqgoI0GlaZq-xf__YGGi7upKiE7vvXL1SldYQ>
    <xmx:uOuWagECGjrgRzI73sUEBRSgSyUqu1AhMftbTKkRxhO_p-qQevgtTA>
    <xmx:uOuWam6cD71xw-FcwqoibtRLoea48E2cbaA24EOE362yqSrOTUy_tA>
    <xmx:uOuWagndR66FFhmVszy1QPQ7Fc-Q10p5yjgeG3DgGprZhmQJQgf9ktMS>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 11:13:59 -0400 (EDT)
Date: Tue, 1 Sep 2026 08:13:58 -0700
From: Boqun Feng <boqun@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <apbrtgkbxo69ZLJ2@tardis.local>
References: <apCS3T63WUxHd1GH@tardis.local>
 <87wltbdvmd.ffs@fw13>
 <87mru5et6r.ffs@fw13>
 <apNtQWqOgwF5_Ctq@tardis.local>
 <apRJzVbMl-hj-otX@tardis.local>
 <87v78rcrf9.ffs@fw13>
 <apSfObo_6Ji5HA7E@tardis.local>
 <87jyp6d2ut.ffs@fw13>
 <apV2iSFXlc3XY7Wk@tardis.local>
 <87tso9axyk.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tso9axyk.ffs@fw13>

On Tue, Sep 01, 2026 at 03:43:47PM +0200, Thomas Gleixner wrote:
> > On Mon, Aug 31, 2026 at 12:02:50PM +0200, Thomas Gleixner wrote:
> > Right, that's why I thought fully revert on commit e901c1510e24 might
> > not be needed.
> 
> It's gone already and as I told you before the reason is that the issues
> were not restricted to the ordering parts v.s. count/hardware and the
> fallout in the softirq code. The whole issue with nested unlock/lock
> inside a guard are not solved by reordering local_interrupt_disable().
> Not to talk about the lack of proper debug features for it.
> 
> > And if PREEMPT_COUNT_IRQFLAGS=y is the future (i.e. it'll be always y),
> > then we will likely have local_interrupt_{en,dis}able() (or a different
> > name) as a general API for everyone. So the API (and its semantics) is
> > not Rust-specific considering the future direction. Hence previously I
> > said that we can move them to Rust only but seems a bit unnecessary to
> > me.
> 
> No. We need a proper strategy to pull that off and not exposing the
> functionality and the name right now outside of Rust makes that way
> simpler. Changing Rust is one thing, chasing down a pile of random use
> cases which crept in _before_ the design and strategy is settled is a
> completely different story.
> 

Fair enough.

Not trying to keep interrupt_{en,dis}able() from moving, but after some
thoughts, I think I figured out a few debugs we can add for
PREEMPT_COUNT_IRQFLAGS=n case, things we want to avoid:

*	interrupt_disable(); irq_disable(); irq_enable(); interrupt_enable();

*	interrupt_disable(); irq_enable(); irq_disable(); interrupt_enable();

*	irq_save(flags); interrupt_disable(); irq_restore(flags); interrupt_enable();

on top of your current work, we can do the following when
PREEMPT_COUNT_IRQFLAGS=n. It'll help find a few random use cases that
break. (even when interrupt_disable() are Rust-only, Rust code can still
call a function which does irq_enable(); irq_disable(); while in a
interrupt_disable() critical section, so it makes sense to catch them).

Thoughts?

Regards,
Boqun

---------------------->8
diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index dd55786768d1..a41d188dceef 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -241,6 +241,14 @@ static __always_inline void raw_safe_halt(void)
 
 static __always_inline void raw_local_irq_disable(void)
 {
+	/*
+	 * Assuming local_irq_{en,dis}able() always paired, then
+	 * local_irq_disable() should not be used inside an
+	 * local_interrupt_disable() critical section. Because the paired
+	 * local_irq_enable() would enable the interrupt inside a
+	 * local_interrupt_disable() critical section.
+	 */
+	debug_assert(!(preempt_count() & HARDIRQ_DISABLE_MASK));
 	arch_local_irq_disable();
 }
 
@@ -251,6 +259,12 @@ static __always_inline void raw_force_local_irq_disable(void)
 
 static __always_inline void raw_local_irq_enable(void)
 {
+	/*
+	 * local_irq_enable() should not be called inside a
+	 * local_interrupt_disable() critical section, but it would enable the
+	 * interrupt unexpectedly.
+	 */
+	debug_assert(!(preempt_count() & HARDIRQ_DISABLE_MASK));
 	arch_local_irq_enable();
 }
 
@@ -261,6 +275,12 @@ static __always_inline unsigned long __raw_local_irq_save(void)
 
 static __always_inline void __raw_local_irq_restore(unsigned long flags)
 {
+	/*
+	 * local_irq_restore() should not enable interrupt unexpectedly inside
+	 * a local_interrupt_disable() critical section
+	 */
+	debug_assert(!(preempt_count() & HARDIRQ_DISABLE_MASK) ||
+		     arch_irqs_disabled_flags(flags));
 	arch_local_irq_restore(flags);
 }
