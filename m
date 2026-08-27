Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1094631E820;
	Thu, 27 Aug 2026 08:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819455; cv=none; b=HDz7sqqIf6J7VchzlyOJ8t2SfkovGHLHtcaesAi0liKoAl/7fm6Mp78EdbcmMV6BRyi/tGjULen78xeJNdInUDvhX4NnQbwtgpeKCorC/oYeuxLlPLysZ1Q6IrtZyVmir+FTzA6+yGyIWjmdMwhBymkSpNqJ3Z6Pseap08XrD8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819455; c=relaxed/simple;
	bh=ZafbnWahG8EBUNhFXkX6+QAtnGNdPcF2FD/EfufGgys=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H+rjbpwI3o7DfqdYEt0kmz0e3sYXnCKgFepOOozqy5oQreqGL6WiHnmloaAmN10DE6JOkP1nraBiYKFpdkZ2YmoJ393GfrZurz9jt0Sy8oDTL5vmfvnrFHjH+3PbuwU3ycIozmJzhKIndMoHcuYuLCr/N7PItybaK4WI1lL4fjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ciGT05i7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ciGT05i7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6261F000E9;
	Thu, 27 Aug 2026 08:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787819453;
	bh=LLBteAjTFIXU1gE3cMHk8xEdLGIzNCmoXwbWuScIOyg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ciGT05i7+rSRlGihT97le05gisbDUnMHN4/kj5JfA6w3JEpm6L7B6tguf7KekfnmS
	 QftdU2lB1dfOoYNRE6cZCOibfdtQbDpYKsLLmuriaskzrSo4/gVCUmoBUgBN767WCe
	 SYSLTvPGSwGu3vVk3oc5S2YJhlUU8y26kliTSDPxCFxBEVS6yhlWMt47NUV210VqeV
	 GijBCA30pMTWCxmHOZV18O5kFOkApJI/b0fWflXyKDAo9pXZvkedNC2bB+oz1RJKLL
	 hk/Kteg4SUGunfUgUZ91ZMPFbcXUBnwyaF6jy64FF28HdkwL3HHQ5JO3beZDM54X8Q
	 9OZ3ealVzvYpg==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
In-Reply-To: <ao4lO7U7L-7Zice1@tardis.local>
References: <20260804161447.84806-8-boqun@kernel.org>
 <178635226387.442315.3868294476114711805.tip-bot2@tip-bot2>
 <20260824104704.GA4121339@noisy.programming.kicks-ass.net>
 <20260824105523.GA4121620@noisy.programming.kicks-ass.net>
 <aozw_7Txxaq2qE7c@tardis.local> <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local>
Date: Thu, 27 Aug 2026 10:30:50 +0200
Message-ID: <87v78wezid.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Aug 25 2026 at 16:28, Boqun Feng wrote:
> On Wed, Aug 26, 2026 at 12:59:25AM +0200, Thomas Gleixner wrote:
>> On Mon, Aug 24 2026 at 18:33, Boqun Feng wrote:
>> > On Mon, Aug 24, 2026 at 12:55:23PM +0200, Peter Zijlstra wrote:
>> >> 
>> >> While the guards are properly nested, not all wrapped code is nice, as already
>> >> highlighted by that fair.c hunk.
>> >> 
>> >> Syzbot found another instance of this pattern in posix_timer_delete(), which
>> >> does spin_unlock_irq()+spin_lock_irq() inside scoped_guard(spinlock_irq).
>> >> Combined with this patch, that goes sideways most spectacular.
>> >> 
>> >> Undo this change, until we've developed stronger tools / debug for such issues.
>> >> 
>> >
>> > Mainly hand-waving, but if we make _irq(), irqsave(), _disable()
>> > __acquires() different contexts, we may be able to catch these issues at
>> > compile time. I will explore a bit on this.
>> 
>> No.
>> 
>> Just do a wholesale conversion of all functions which affect the CPU
>> interrupt disabled state directly (local_irq_*) and indirectly (locking
>> functions etc.)
>> 
>> Anything else is just a whack a mole game.
>> 
>
> Alright. But I'm afraid that's just another type of whack-a-mole
> games.

I don't think so.

> As I mentioned here [1], we are a few unpaired local_irq_disable() +
> local_irq_enable(), we can spend time to clean them up, but no guarantee
> people will not introduce more, plus we have code that does
> spin_lock_irqsave(); spin_unlock_irq(); spin_lock_irq();
> spin_unlock_irqrestore(); and expect it works.

It actually works and there are reasons why this needs to work in
certain cases. It needs some support with a different set of helper
functions for sure.

I played around with changing local_irq_disab/enable/save/restore almost
two decades ago when cli/sti was expensive, so we could do a lazy
disable approach. It went nowhere because it turned out to be too
complex to handle the interrupts which hit a lazy disabled region later,
but the principle itself worked.

I dealt with the above example by doing:

  oldcnt = irq_save()   	return cnt++;
  irq_restore(oldcnt)		cnt = oldcnt;
  irq_disable()  		cnt=1;
  irq_enable()  		cnt=0;

See below.

> A more reasonable approach to me is introducing the new API and fixing
> the problematic usage one-by-one and then when we are certain about
> only a few cases left, we do a flag day change.

You already did a flag day change which causes problems, no?

The main problem is that you cover only half of it and there are
completely correct cases where this simply blows up in your face:

  local_irq_disable();                          // does not affect CNT
  ....
  guard(raw_spinlock)(&l1);                     // does not affect CNT
     foo()
       guard(raw_spinlock_irqsave)(&l2);        // observes CNT = 0

so the unlocking of &l2 will enable interrupts prematurely.

That's a very common scheme in interrupt handling. Functions which know
they are always invoked with interrupts disabled use raw_spinlock()
while others which can be invoked from different contexts use the
irqsave() variant.

Also the lack of rwlock support is a red flag. Again completely valid
code:

     read_lock_irq()
     ...
     guard(spinlock_irqsave)();

Same issue as above.

There are more subtle problems lurking around the corner.

> Trying to do it (new API and whole conversion) in one go is easier
> said than done. Of course I might miss something subtle here, looking
> forwards to your suggestion.

I did not say it's easy and I did not say that you have to do both in
one go, which is impossible.

You have to do it in stages, which means you put the infrastructure in
place first and then once that is settled you build the new API on top
if required at all. Building a new API first and hoping that it works
out without actually addressing the underlying issues first is just a
recipe for disaster.

You really want to start at the places which deal with the actual
interrupt flags of the CPU and that's definitely not locking.  That's
only a couple of functions plus a few related helpers:

   raw_local_irq_disable()
   raw_local_irq_enable()
   raw_local_irq_save()
   raw_local_irq_restore()

If you actually look at the usage of the 'flags' argument of
raw_local_irq_save() and raw_local_irq_restore() then you'll notice that
it's a completely opaque cookie. Validating that there is no user which
is actually interested in seeing the real flags should be trivial
enough. A quick skim of x86 revealed exactly zero places, but I might
have missed one of course.

So you can get away with:

raw_local_irq_save(flags)
{
	flags = count;
	if (!count)
        	arch_local_irq_disable();
        count++;
}

raw_local_irq_restore(flags)
{
	if (!(count = flags))
        	arch_local_irq_enable();
}

raw_local_irq_disable()
{
        arch_local_irq_disable();
        count = 1;
}

raw_local_irq_enable()
{
        count = 0;
        arch_local_irq_enable();
}

To make this work you need to deal with the obvious race conditions
between modifying the counter and modifying the CPU flag, which is
relevant for all hardware initiated context changes (syscalls,
interrupts, exceptions, NMI).

In enter_from_user_mode() is trivial. All you need to add is an
unconditional

        count = 1;

because interrupts are enabled when a task runs in user space. On entry
to the kernel (syscall, interrupt, exception, NMI) the CPU disables
interrupts so you have to reflect that in the software counter.

exit_to_user_mode() requires then obviously:

        count = 0;

irqentry_enter_from_kernel_mode() is a bit more tricky because count and
the actual interrupt flags state in the CPU can be out of sync as you
can see in all four related functions above. But that's easy enough to
cure:

        irqentry_state_t ret = {
                .exit_rcu = false,
        };

        ret.irqdisable_cnt = count;
	count = 1;

Setting it to 1 is the correct thing to do as this is fresh context and
it's safe for exception handlers which conditionally enable interrupts
because they explicitly rely on checking regs->eflags to figure out
whether the interrupted context had interrupts enabled.

That also makes this horrible hack in __irq_exit_rcu() go away because
the state is fully consistent.

In irqentry_exit_to_kernel_mode_after_preempt()

       count = state.irqdisable_cnt;

In irqentry_nmi_enter() and irqentry_nmi_exit() you need exactly the
same.

With that you have a fully consistent and working system. Not what you
are aiming for in the very end, but a first step to cover the existing
code base fully without nasty to debug surprises.

Now you need to handle the oddball cases which nest an interrupt
enable/disable pair into a irqsave/restore region like the one in the
scheduler and the other in posix timers.

First of all, most of these places can be found by code analysis. When I
saw the one in the scheduler I whipped up a trivial coccinelle script
which found the one in posix timers immediately.

Then you can obviously add debug variants of those functions which are
conditional by an explicit config switch and emit warnings which are
easy enough to distinguish so that automated testing failures do not
result in a "paper over the problem" frenzy.

For dealing with those cases you want something like this:

raw_local_irq_enable_nested()
{
	cur = count;
        count = 0;
        arch_local_irq_enable();
        return cur;        
}

raw_local_irq_disable_nested(oldcnt)
{
        arch_local_irq_disable();
        count = oldcnt; 
}

Once all this headache is gone, you can modify the underlying machinery
without touching any other code at all and make the debug code a real
(lockdep) warning which has to be treated like any other splat.

See?

Thanks,

        tglx
