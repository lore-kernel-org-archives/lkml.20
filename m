Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425AE472534
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836485; cv=none; b=EYMzn40nAW3ORZGQva0wfbvRgKQFfWzZ9LUznZMtGOMEOi76vWbXqSeObIedMN6yumRk7xqwyk+WPGYIuGHRlR37uryHuiDPdaEnIygUrR3TfhayxNSZVWX1pKpBL5KVR/u+zQqgkWutxTmfxE6kmgcIun/lFKxuW4Kmbgb2gUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836485; c=relaxed/simple;
	bh=yYnR2GRicwqJ0hb75OCOjfRGm7MPylGkIDePemk1L0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIalNSSaXpTl0dJ053wI5SvnU0/je1D2fQePEiOT9rKyUVDVefykKYVmEpzyyocO3BlmhG9wb655OIGq4XIgW/WXRUK9dOaIOGCyX6UDkIXthb0e1cNClfzfG77lDafUO1660tmuRUr8xqSkC9pRZEMLFXd3slqNNgEiPWIjscU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCZL6Cm8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCZL6Cm8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB32E1F00A3A;
	Thu, 27 Aug 2026 13:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787836470;
	bh=c7nONeAuFyNK+HNdK4Hve/v/urwDPgtYo2tf8c0d/P8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KCZL6Cm8zQvKvU3++0jmhoNnAK+372oZZSjAKrldVOkG5WoFxUw5hRX6KN3Qtwo9B
	 kFkkSwBptSWKcNfHjduI72ETHUKpPt85XInJGggQHVUMyBs4GhwhsMclwNs75h8HeL
	 hN3DZIWYhqFknDy5ADqTcT3yTiYGL2Sc76xUSUvysmsUaf9wMLc45MjtN1zH3TOiUm
	 mO386zF9h4142iUL4Eb4fStYgb6aYZztvwRppa1bKqLQMiGkSVNf1A6ZRdcrZmtl+w
	 lL/mUbiN0Z1NR1OqG699ZSDCcwIx/Chqte30Ed4gI13hnDexJ0knVIaoN+oRUsMXjb
	 0QLFdbXJMZfhw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 115F1F40066;
	Thu, 27 Aug 2026 09:14:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 27 Aug 2026 09:14:29 -0400
X-ME-Sender: <xms:NTiQasA-j7s7T_nyXf_79w_2WdCfRxK3e8FmUuWsM_huQJeh8g6YOQ>
    <xme:NTiQan2nS8uQdfScPABmgVGyNoWcknZIO9skEsjQdm46QHGo-ZUlhebAjVppvRGAO
    EfaXX7qoDUD8KKUtlHZYPjBNIHC9O-pUraPeZF3nkRZnZllPaYldn0>
X-ME-Received: <xmr:NTiQam1tYruAeN30_SBSjf-n3Kw7MEhoVTk0Oq1lt6PKHVdvG_yu8ZmIOTlQy1nQB-IbrjMue8iCeLroLa4x3ONadUGCXldK>
X-ME-Proxy-Cause: dmFkZTGzADUYSxyZs9YWJWg2uGSwXhn+Vvu9MVfbUmCkMnsNT8TUCfGyqF4Ja/71kU0fbY
    neLo2iV0RvDlpOs92211dORSEh7wLuBUcMT7Zuk1Pv0GsOTBjgxLiMNTneS1ZI+xcybHLN
    9Y9IKudhczA2b8xi/5PlKpXuZHDWm7I/kpOoNHNsbuIblxpI4XhP+Y/kiKCOJcTnBtuaqc
    6nRKUK17KGk2mJZOhN2pqddVDTyCsAvlyO1ERC+jgsk3VZiBHFvnvF/Hmh9XnN0CKCOiRZ
    aQW7zU/d8K2ixp1zE0TtL3AsVBKszc73xUtKu1hUFix4oCEvhCk4Sto6IufU60gTfSBCBP
    KDY00ecjECUrgNUCdbqMCYSXbKhhLxM2Q/meR0X307S8bjxm0Ik4MrS1kxu2MBRfIIxVRS
    AamuIlx2LyxrIVdBOKfJSEBNwkdVEsYhtQKx4zGyXywCvDt1BfUpA500HDAHFI5RWkYVXp
    z9QS8g2hqpwZvOC7I3AI4eMI+tlmOGT+kdL84L1ed1rMJq3ebhbTGCQdbe9zFYLrDTDr3+
    8iJUizkahnPOMm7DIEqI9ram8U45T1vUjspZ8pOLLYXAuK6SpLoA32NLuymiVG5mI1TVYi
    I3qzMtU8GwePkRn0E9qPMKAjAu6nDLT9SNlovtEOBlLtp8nbAvo1U1/wSaEA
X-ME-Proxy: <xmx:NTiQakCk5CyXUD8n2OKHfpxD0b_hwG70xvUHyavzkjcUow0aWc4-Ew>
    <xmx:NTiQat7l84F-1LonWr_3SGWafrFfQE1LseVTta0o-3Jy56N65r-NmQ>
    <xmx:NTiQatJX1OCFoV9tadPFmnKhMW6jsbafDW-j-KO68cjqYtR6kbujMw>
    <xmx:NTiQamvsK37lb1LclTkqJLgpPgDkzv6m0X_vaiySVYiX4k1fWDgMtA>
    <xmx:NTiQasI5b3q4zECK5v4zFF_jIQ5MWD2kX3h1b1fDR5MRmZ7LXitZWkuE>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 09:14:28 -0400 (EDT)
Date: Thu, 27 Aug 2026 06:14:27 -0700
From: Boqun Feng <boqun@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <apA4M7Asz0mV9uaw@tardis.local>
References: <20260804161447.84806-8-boqun@kernel.org>
 <178635226387.442315.3868294476114711805.tip-bot2@tip-bot2>
 <20260824104704.GA4121339@noisy.programming.kicks-ass.net>
 <20260824105523.GA4121620@noisy.programming.kicks-ass.net>
 <aozw_7Txxaq2qE7c@tardis.local>
 <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local>
 <87v78wezid.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v78wezid.ffs@fw13>

On Thu, Aug 27, 2026 at 10:30:50AM +0200, Thomas Gleixner wrote:
[...]
> >> > Mainly hand-waving, but if we make _irq(), irqsave(), _disable()
> >> > __acquires() different contexts, we may be able to catch these issues at
> >> > compile time. I will explore a bit on this.
> >> 
> >> No.
> >> 
> >> Just do a wholesale conversion of all functions which affect the CPU
> >> interrupt disabled state directly (local_irq_*) and indirectly (locking
> >> functions etc.)
> >> 
> >> Anything else is just a whack a mole game.
> >> 
> >
> > Alright. But I'm afraid that's just another type of whack-a-mole
> > games.
> 
> I don't think so.
> 
> > As I mentioned here [1], we are a few unpaired local_irq_disable() +
> > local_irq_enable(), we can spend time to clean them up, but no guarantee
> > people will not introduce more, plus we have code that does
> > spin_lock_irqsave(); spin_unlock_irq(); spin_lock_irq();
> > spin_unlock_irqrestore(); and expect it works.
> 
> It actually works and there are reasons why this needs to work in
> certain cases. It needs some support with a different set of helper
> functions for sure.
> 
> I played around with changing local_irq_disab/enable/save/restore almost
> two decades ago when cli/sti was expensive, so we could do a lazy
> disable approach. It went nowhere because it turned out to be too
> complex to handle the interrupts which hit a lazy disabled region later,
> but the principle itself worked.
> 
> I dealt with the above example by doing:
> 
>   oldcnt = irq_save()   	return cnt++;
>   irq_restore(oldcnt)		cnt = oldcnt;
>   irq_disable()  		cnt=1;
>   irq_enable()  		cnt=0;
> 
> See below.
> 
> > A more reasonable approach to me is introducing the new API and fixing
> > the problematic usage one-by-one and then when we are certain about
> > only a few cases left, we do a flag day change.
> 
> You already did a flag day change which causes problems, no?
> 

(I will reply a few things here, and will read through your suggestions
below, and reply them latter.)


Right, but that was an attempt to see if we could switch to
scoped_guard() implementation to the new infrastructure (see below) in
this stage. Clearly we cannot because I overlooked cases like
posix_timer_delete(), but itself is not trying to introduce the new API.

> The main problem is that you cover only half of it and there are
> completely correct cases where this simply blows up in your face:
> 
>   local_irq_disable();                          // does not affect CNT
>   ....
>   guard(raw_spinlock)(&l1);                     // does not affect CNT
>      foo()
>        guard(raw_spinlock_irqsave)(&l2);        // observes CNT = 0
> 
> so the unlocking of &l2 will enable interrupts prematurely.
> 

If we are talking the switch in this patch, then no, the unlocking
of &l2 will NOT enable interrupts prematurely. The above code expands as
the following (using pseudo code to describe how
raw_spin_lock_irq_disable(), raw_spin_lock_irq_enable(),
local_interrupt_disable(), and local_interrupt_enable() work)

   local_irq_disable();                          // does not affect CNT
   ....
   guard(raw_spinlock)(&l1);                     // does not affect CNT
      foo()
        guard(raw_spinlock_irqsave)(&l2): 
          raw_spin_lock_irq_disable():
            local_interrupt_disable():
	      CNT++;
              this_cpu(state) = local_irq_save(); // record the current state
            raw_spin_lock(&l2);
	  ...
          raw_spin_lock_irq_enable():
            raw_spin_unlock(&l2);
            local_interrupt_enable():
              CNT--;
              if (CNT == 0)
                local_irq_restore(this_cpu(state)); // recover the previous state

So local_interrupt_disable() and local_interrupt_enable() only recover
to the previous state, as a result it'll not enable interrupt
prematurely here. In other words, the following code works:

    local_irq_disable();
    local_interrupt_disable();
    local_interrupt_enable();  // interrupt is not re-enabled here
                               // similar to how preempt_disable() does
			       // in a nested preemption disable
			       // critical section.
    local_irq_enable();

These functions are the infrastructure thing you talk about below:

(they are introduced in commit e901c1510e24 ("irq,spin_lock: Add counted
interrupt disabling/enabling"))

* local_interrupt_disable()
* local_interrupt_enable()
* raw_spin_lock_irq_disable()
* raw_spin_lock_irq_enable()

They currently work when nested in local_irq_disable() or
local_irq_save() because of the per-CPU irq state tracking when CNT
reaches 0->1 or 1->0.

> That's a very common scheme in interrupt handling. Functions which know
> they are always invoked with interrupts disabled use raw_spinlock()
> while others which can be invoked from different contexts use the
> irqsave() variant.
> 
> Also the lack of rwlock support is a red flag. Again completely valid

We could use local_interrupt_disable() and local_interrupt_enable() to
implement a new API for rwlock when the support is needed in the future.

> code:
> 
>      read_lock_irq()
>      ...
>      guard(spinlock_irqsave)();
> 
> Same issue as above.
> 

Similar as above, no issue in this case.

> There are more subtle problems lurking around the corner.
> 
> > Trying to do it (new API and whole conversion) in one go is easier
> > said than done. Of course I might miss something subtle here, looking
> > forwards to your suggestion.
> 
> I did not say it's easy and I did not say that you have to do both in
> one go, which is impossible.
> 
> You have to do it in stages, which means you put the infrastructure in
> place first and then once that is settled you build the new API on top
> if required at all. Building a new API first and hoping that it works
> out without actually addressing the underlying issues first is just a
> recipe for disaster.
> 

I agree and that is actually what I did here: adding the infrastructure
local_interrupt_disable() and local_interrupt_enable() and gradually
using that infrastructure to support building new API (or existing API).
`
The part that went wrong for this particular patch was I was missing the
usage similar to posix_timer_delete() cases where users want to drop the
lock under scoped_guard context, I have a proposal in another reply,
and I think that might be better way, but of course the infrastructure
can support without it, we just need to postpone the implementation
switch of scoped_guard() until it's ready.

All I'm trying to say here is I'm doing this slow and steady :)

[I will take a deep look for the following later, I feel I need to reply
above in case I or the patch confused you somehow]

Regards,
Boqun

> interrupt flags of the CPU and that's definitely not locking.  That's
> only a couple of functions plus a few related helpers:
> 
>    raw_local_irq_disable()
>    raw_local_irq_enable()
>    raw_local_irq_save()
>    raw_local_irq_restore()
> 
> If you actually look at the usage of the 'flags' argument of
> raw_local_irq_save() and raw_local_irq_restore() then you'll notice that
> it's a completely opaque cookie. Validating that there is no user which
> is actually interested in seeing the real flags should be trivial
> enough. A quick skim of x86 revealed exactly zero places, but I might
> have missed one of course.
> 
> So you can get away with:
> 
> raw_local_irq_save(flags)
> {
> 	flags = count;
> 	if (!count)
>         	arch_local_irq_disable();
>         count++;
> }
> 
> raw_local_irq_restore(flags)
> {
> 	if (!(count = flags))
>         	arch_local_irq_enable();
> }
> 
> raw_local_irq_disable()
> {
>         arch_local_irq_disable();
>         count = 1;
> }
> 
> raw_local_irq_enable()
> {
>         count = 0;
>         arch_local_irq_enable();
> }
> 
> To make this work you need to deal with the obvious race conditions
> between modifying the counter and modifying the CPU flag, which is
> relevant for all hardware initiated context changes (syscalls,
> interrupts, exceptions, NMI).
> 
> In enter_from_user_mode() is trivial. All you need to add is an
> unconditional
> 
>         count = 1;
> 
> because interrupts are enabled when a task runs in user space. On entry
> to the kernel (syscall, interrupt, exception, NMI) the CPU disables
> interrupts so you have to reflect that in the software counter.
> 
> exit_to_user_mode() requires then obviously:
> 
>         count = 0;
> 
> irqentry_enter_from_kernel_mode() is a bit more tricky because count and
> the actual interrupt flags state in the CPU can be out of sync as you
> can see in all four related functions above. But that's easy enough to
> cure:
> 
>         irqentry_state_t ret = {
>                 .exit_rcu = false,
>         };
> 
>         ret.irqdisable_cnt = count;
> 	count = 1;
> 
> Setting it to 1 is the correct thing to do as this is fresh context and
> it's safe for exception handlers which conditionally enable interrupts
> because they explicitly rely on checking regs->eflags to figure out
> whether the interrupted context had interrupts enabled.
> 
> That also makes this horrible hack in __irq_exit_rcu() go away because
> the state is fully consistent.
> 
> In irqentry_exit_to_kernel_mode_after_preempt()
> 
>        count = state.irqdisable_cnt;
> 
> In irqentry_nmi_enter() and irqentry_nmi_exit() you need exactly the
> same.
> 
> With that you have a fully consistent and working system. Not what you
> are aiming for in the very end, but a first step to cover the existing
> code base fully without nasty to debug surprises.
> 
> Now you need to handle the oddball cases which nest an interrupt
> enable/disable pair into a irqsave/restore region like the one in the
> scheduler and the other in posix timers.
> 
> First of all, most of these places can be found by code analysis. When I
> saw the one in the scheduler I whipped up a trivial coccinelle script
> which found the one in posix timers immediately.
> 
> Then you can obviously add debug variants of those functions which are
> conditional by an explicit config switch and emit warnings which are
> easy enough to distinguish so that automated testing failures do not
> result in a "paper over the problem" frenzy.
> 
> For dealing with those cases you want something like this:
> 
> raw_local_irq_enable_nested()
> {
> 	cur = count;
>         count = 0;
>         arch_local_irq_enable();
>         return cur;        
> }
> 
> raw_local_irq_disable_nested(oldcnt)
> {
>         arch_local_irq_disable();
>         count = oldcnt; 
> }
> 
> Once all this headache is gone, you can modify the underlying machinery
> without touching any other code at all and make the debug code a real
> (lockdep) warning which has to be treated like any other splat.
> 
> See?
> 
> Thanks,
> 
>         tglx
