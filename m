Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36D53812C2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849579; cv=none; b=YZvu7RLMAAU4xerYzhPt08qUXAL6NjdS5cA14B2giJARZAJ36rFyYysJa3ySNd/q/2C5yI756DAuDBc5wb14J5SNUNERk4BIwurRjQpdn90Em7nFuQe2njWtRCk9vmqkrkDw0rWR7ant9eiuPEixSWdN5CtSL8rZjejVDfkKHtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849579; c=relaxed/simple;
	bh=Hlom3LElFC/Talrh/JZKuOX6hUzFwHVaX+9vowq0D2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1YB7Lgn5jv0EL1mvIWp0EqFke7M7Li2o0wAYXETaympAvS17r/vPpaA9fn603JC4BsBkQL5WDPFe3q+nRM3y0ydZFR9YXY9EUh42mzgFFFGoLqW7JYp3uyz2wt74Y5k0BX0XLZzBjCE+wQsFezbVQaCWkrmY+toY/uqn9TjJ/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSUBmPY/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSUBmPY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6C51F00ADB
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787849577;
	bh=/qMXLpKC/d7lTeX+trlbuLj331lUxLwBQTzncxUeZI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kSUBmPY/YKqGAZNjanM/wBa5U+qYF5QfXkW7mJRQh5q+UoqHKXBKRBwafw8zovXi6
	 ta7ZuhHOgc5MpVI+NcwKUTJO1j+5K9DeE66zWOpfU4ipb8sRUYd02Axg2MR8GnUrIX
	 ZK9IsFh35daJ2tfVvuBq3pST12S0ZnZOtGNL3r1BKUafOGYz3X+xS8tSa1Dljca5qC
	 4fl1zsQK+U0J8vqvDz8+UXXZOVvo4W9+9eRHttHdiHhrUwHY4DScJ8rwL1CLpLxN1G
	 vDwlG97v4x3ewpwa0aehCcKnA+Lw7ELlidXYBvg0uXvhffVwSkSf+F/MMPDn5Eh5Md
	 shAmiEcH586OQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 31723F40066;
	Thu, 27 Aug 2026 12:52:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 27 Aug 2026 12:52:56 -0400
X-ME-Sender: <xms:aGuQaoAvjFGgMMo6UJKEqe84lFXmvf3nrLAA1Z3QWEL-zfMiEvBGxg>
    <xme:aGuQaj2pSlnZ059h5mlPdFR2jDYHowP0O1NiNsZPShvOdU6LvPLJBBr5fxr7aYnec
    pV6cv7PZ4gcGGbPLNvOfpEpg7GYSP-6OQaN6ryf6ShCqCM5RsH2v0I>
X-ME-Received: <xmr:aGuQai2siGkVFyJGA9_6cYOu1JYqYLQnAdlhw5UVf2PQ7FBDA1CJdKM1orYOBtnYGukWWHH8jSAdO1Zauy1O66EDnRb1dqRE>
X-ME-Proxy-Cause: dmFkZTGpAyVvSq+aFlI65LbBWK+d/UCiGOWcM+YRnyFMolEirGHgGfNXiHB2+xKPDReVYf
    xsjqiXnQAWOnzHTp71awv7tIN9MBCJMDbhE/tchqhDd32uPOXm8WuiUKjey4W7aCNk2n0l
    /HeghFbjVSfQ/b30CPwa3R9aAALl//WK2xVeFIAOR0ZF+F0QQwRYON1YaINRK0gqMmxqAf
    3hcsSacjeNMv5wga1nxWrNWh9gFR08jQQQsXzRDwrStg+7dUY6xtDRRvekJbGzRxxcNS+R
    964dVn7oi9FUSI3deIvJefh8IcM9m8NWXpws4aE/4KUgCh4Hwhd84uGBxW/EHb6CWJ2Ffy
    Rk0zqLttQGYKDzSZ2EGhZCJ2FygpVU3KWSuTMb2Nw6H38nERNfOKum48+UPOmuXoH5A7b6
    rLtqJLQJsrh7kgEa4wNg42hXlNycEx8hFIDHrtIz6H4M5hnN7cwJ0o4TAd3D81veGpFtGr
    Zjx5KC4AWT6CBFvGSB/juPLculRok5600pVOnedpCN448ih4R04pSdtoykGTipD3Fyc6Rj
    LzEgr+ioH8qqJPtezaHwHyF4lyOkbcxTNUmpM9X3WR3DfwXlOp+8pHZA91mCpgEugL+exY
    np0AU/9cIlqvq3t1hyu8+uN3jmewltpnaikm5WiR7ecqp9VW6PpiGyvknyOg
X-ME-Proxy: <xmx:aGuQagDcjQjEDTj_objHcH-CQEAk5sbnxGxoOaoYXV7LAJyzgbwd9A>
    <xmx:aGuQap4iF_bhB9AUHD47zoGsxGgOAVaR6tCVAGthEodhtOABblJTYw>
    <xmx:aGuQapK1aX2PxjBxabhzrmoZfXScKzr54tJur6cdk5vvT5IzA6cUKg>
    <xmx:aGuQaitX_0hF3W3TOViSGHto5RIFdwVCWhHytOzJnRGLx3Dpo883uw>
    <xmx:aGuQaoItXLGO4nn4A1AvFS-mb2v4Pm-eEOn9wIZRPHT75HvCUMiBWSh2>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 12:52:55 -0400 (EDT)
Date: Thu, 27 Aug 2026 09:52:54 -0700
From: Boqun Feng <boqun@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <apBrZuxU8bmCgG8h@tardis.local>
References: <20260804161447.84806-8-boqun@kernel.org>
 <178635226387.442315.3868294476114711805.tip-bot2@tip-bot2>
 <20260824104704.GA4121339@noisy.programming.kicks-ass.net>
 <20260824105523.GA4121620@noisy.programming.kicks-ass.net>
 <aozw_7Txxaq2qE7c@tardis.local>
 <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local>
 <87v78wezid.ffs@fw13>
 <apA4M7Asz0mV9uaw@tardis.local>
 <87jypbfu1t.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jypbfu1t.ffs@fw13>

On Thu, Aug 27, 2026 at 05:43:26PM +0200, Thomas Gleixner wrote:
> On Thu, Aug 27 2026 at 06:14, Boqun Feng wrote:
> > On Thu, Aug 27, 2026 at 10:30:50AM +0200, Thomas Gleixner wrote:
> >> The main problem is that you cover only half of it and there are
> >> completely correct cases where this simply blows up in your face:
> >> 
> >>   local_irq_disable();                          // does not affect CNT
> >>   ....
> >>   guard(raw_spinlock)(&l1);                     // does not affect CNT
> >>      foo()
> >>        guard(raw_spinlock_irqsave)(&l2);        // observes CNT = 0
> >> 
> >> so the unlocking of &l2 will enable interrupts prematurely.
> >> 
> >
> > If we are talking the switch in this patch, then no, the unlocking
> > of &l2 will NOT enable interrupts prematurely. The above code expands as
> > the following (using pseudo code to describe how
> > raw_spin_lock_irq_disable(), raw_spin_lock_irq_enable(),
> > local_interrupt_disable(), and local_interrupt_enable() work)
> >
> >    local_irq_disable();                          // does not affect CNT
> >    ....
> >    guard(raw_spinlock)(&l1);                     // does not affect CNT
> >       foo()
> >         guard(raw_spinlock_irqsave)(&l2): 
> >           raw_spin_lock_irq_disable():
> >             local_interrupt_disable():
> > 	      CNT++;
> >               this_cpu(state) = local_irq_save(); // record the current state
> >             raw_spin_lock(&l2);
> > 	  ...
> >           raw_spin_lock_irq_enable():
> >             raw_spin_unlock(&l2);
> >             local_interrupt_enable():
> >               CNT--;
> >               if (CNT == 0)
> >                 local_irq_restore(this_cpu(state)); // recover the previous state
> >
> > So local_interrupt_disable() and local_interrupt_enable() only recover
> > to the previous state, as a result it'll not enable interrupt
> > prematurely here. In other words, the following code works:
> >
> >     local_irq_disable();
> >     local_interrupt_disable();
> >     local_interrupt_enable();  // interrupt is not re-enabled here
> >                                // similar to how preempt_disable() does
> > 			       // in a nested preemption disable
> > 			       // critical section.
> >     local_irq_enable();
> 
> Fair enough. I misread that part.
> 
> But my main observation that the counter is inconsistent still stands
> and I think that's a fundamental flaw because there is no way that code
> can rely on that counter until everything has been converted over and
> the interrupt/exception/nmi/syscall entry/exit code has been fixed up.
> 
> Just let me look at local_interrupt_disable() and __irq_exit_rcu()
> again.
> 
> local_interrupt_disable()
>    new_count = hardirq_disable_enter();
> 
>    /* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
> 
>    if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
>       _local_interrupt_disable();
> 
> This is absolutely not ok. Why?
> 
> The counter is incremented _before_ interrupts are actually
> disabled. Now in __irq_exit_rcu():
> 
>         if (!in_interrupt() && !hardirq_disable_count() &&
>             local_softirq_pending()) {
> 
> which prevents soft interrupt handling in a completely legitimate
> situation. As a consequence _nothing_ will handle the pending soft
> interrupt until:
> 
>      - an interrupt coming in which observes consistent state
> 
>      - a local_bh_enable() processes them
> 
> That explains that recently quite a few more spurious 'local soft irq
> pending' printk's have been observed by people as there is no guarantee
> that either one of those events happens _before_ a CPU reaches
> idle. Even in the non-idle case deferring this to the next 'by chance'
> handling is fundamentally broken. This needs to be removed ASAP.
> 
> But coming back to the problem underneath. The ordering in
> local_interrupt_disable() is simply wrong. You need to disable first and
> then update the counter. Reverse order for enable() obviously update
> counter and enable, which you got right.
> 

Noted, the reason that I used the current order is to optimize
local_interrupt_disable() from re-disabling interrupt every time:

	https://lore.kernel.org/rust-for-linux/87a5eu7gvw.ffs@tglx/

but looks like we cannot do it without the fixups you mention below.
For now I will reverse the order and remove the additional checking in
softirq to fix the softirq pending issue.

Regards,
Boqun

> And to make stuff work correctly you need the fixups I pointed out in my
> previous reply to the various entry/exit functions. It's exactly the
> same problem as we handle in interrupt/exception/nmi entry/exit code
> vs. RCU, lockdep, tracing etc.
> 
> So if disable() does:
> 
>    if (!count)
>    	arch_local_irq_disable();
>    count++;
> 
> then an interrupt hitting before arch_local_irq_disable() will always
> observe the correct state. After that it can't be delivered.
> 
[...]
