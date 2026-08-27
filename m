Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA07485CEF;
	Thu, 27 Aug 2026 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787845410; cv=none; b=DUG0pF74iemm7wwbzbXAjpnlsVAzJH3QcQOxUfIwlgJ80bajIq6hiuqdJMQMFxgTsXVluB+FwGdvvPow7UqCBOg9BmpJOWsiTDaVdSL+B0VJ2GCz6lMVzAXidFZw5EvvK4/4/e1McIa5ajn/mQ8R3B60r5uDOfhhPF1gni/H27w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787845410; c=relaxed/simple;
	bh=zq5h3cnywoelwGXUno6BGqmFYh9AgJvHb3HtZbl0J80=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WMafuhGN1K90k+JCsBuwfetLHHEv256Gjvboto6cTGuuI2R7Zkf5Lf+jJsCLc6GUJVp2DgWMH+wTcatZp6Mq84g6QUh4OqewISV+aDEI7yJFvO8+xdC6EcGDCYYnOyTAkTXx3zW3PZCNhB3SPxqp3Ghm6tycZJ6hCOuZy4a/gTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NmkCAMVp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NmkCAMVp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760431F000E9;
	Thu, 27 Aug 2026 15:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787845409;
	bh=hozitDb8o4QqNFIUiwM2iNnAnj0KCgq7vDUxVG5Uano=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=NmkCAMVp+rfVQZZgXwNwrQIDRRoGn2DrYljSgIZCKbyrH0/97lO5RMLBUme7F8YCW
	 4XDom6Bk022T388UqjUgJqja+dHTpVpkeaoRUmuQoWmU9x0uEB7m7zOZXba7Ew+3A0
	 QkOMHvdGx+oZAjolbjPnxEFRI8uEcP8lLZXA4DOmjYzqKEb+TRz+4ZVjZ9k/ksihwp
	 OMfQVxyFVt14pazZEBXwXRnBeoYXIzBb+wHlfz48lZwuM7DQrg4q31JaCNbs+xP5Yj
	 LBrq5Y033Bwi9AycerJ390hEd9dR80YAT/wY3JAc4zXOAJS/4N9v2iLARKX/1/Tz2Q
	 EBx69HRR0n2oA==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
In-Reply-To: <apA4M7Asz0mV9uaw@tardis.local>
References: <20260804161447.84806-8-boqun@kernel.org>
 <178635226387.442315.3868294476114711805.tip-bot2@tip-bot2>
 <20260824104704.GA4121339@noisy.programming.kicks-ass.net>
 <20260824105523.GA4121620@noisy.programming.kicks-ass.net>
 <aozw_7Txxaq2qE7c@tardis.local> <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local> <87v78wezid.ffs@fw13>
 <apA4M7Asz0mV9uaw@tardis.local>
Date: Thu, 27 Aug 2026 17:43:26 +0200
Message-ID: <87jypbfu1t.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 27 2026 at 06:14, Boqun Feng wrote:
> On Thu, Aug 27, 2026 at 10:30:50AM +0200, Thomas Gleixner wrote:
>> The main problem is that you cover only half of it and there are
>> completely correct cases where this simply blows up in your face:
>> 
>>   local_irq_disable();                          // does not affect CNT
>>   ....
>>   guard(raw_spinlock)(&l1);                     // does not affect CNT
>>      foo()
>>        guard(raw_spinlock_irqsave)(&l2);        // observes CNT = 0
>> 
>> so the unlocking of &l2 will enable interrupts prematurely.
>> 
>
> If we are talking the switch in this patch, then no, the unlocking
> of &l2 will NOT enable interrupts prematurely. The above code expands as
> the following (using pseudo code to describe how
> raw_spin_lock_irq_disable(), raw_spin_lock_irq_enable(),
> local_interrupt_disable(), and local_interrupt_enable() work)
>
>    local_irq_disable();                          // does not affect CNT
>    ....
>    guard(raw_spinlock)(&l1);                     // does not affect CNT
>       foo()
>         guard(raw_spinlock_irqsave)(&l2): 
>           raw_spin_lock_irq_disable():
>             local_interrupt_disable():
> 	      CNT++;
>               this_cpu(state) = local_irq_save(); // record the current state
>             raw_spin_lock(&l2);
> 	  ...
>           raw_spin_lock_irq_enable():
>             raw_spin_unlock(&l2);
>             local_interrupt_enable():
>               CNT--;
>               if (CNT == 0)
>                 local_irq_restore(this_cpu(state)); // recover the previous state
>
> So local_interrupt_disable() and local_interrupt_enable() only recover
> to the previous state, as a result it'll not enable interrupt
> prematurely here. In other words, the following code works:
>
>     local_irq_disable();
>     local_interrupt_disable();
>     local_interrupt_enable();  // interrupt is not re-enabled here
>                                // similar to how preempt_disable() does
> 			       // in a nested preemption disable
> 			       // critical section.
>     local_irq_enable();

Fair enough. I misread that part.

But my main observation that the counter is inconsistent still stands
and I think that's a fundamental flaw because there is no way that code
can rely on that counter until everything has been converted over and
the interrupt/exception/nmi/syscall entry/exit code has been fixed up.

Just let me look at local_interrupt_disable() and __irq_exit_rcu()
again.

local_interrupt_disable()
   new_count = hardirq_disable_enter();

   /* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */

   if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
      _local_interrupt_disable();

This is absolutely not ok. Why?

The counter is incremented _before_ interrupts are actually
disabled. Now in __irq_exit_rcu():

        if (!in_interrupt() && !hardirq_disable_count() &&
            local_softirq_pending()) {

which prevents soft interrupt handling in a completely legitimate
situation. As a consequence _nothing_ will handle the pending soft
interrupt until:

     - an interrupt coming in which observes consistent state

     - a local_bh_enable() processes them

That explains that recently quite a few more spurious 'local soft irq
pending' printk's have been observed by people as there is no guarantee
that either one of those events happens _before_ a CPU reaches
idle. Even in the non-idle case deferring this to the next 'by chance'
handling is fundamentally broken. This needs to be removed ASAP.

But coming back to the problem underneath. The ordering in
local_interrupt_disable() is simply wrong. You need to disable first and
then update the counter. Reverse order for enable() obviously update
counter and enable, which you got right.

And to make stuff work correctly you need the fixups I pointed out in my
previous reply to the various entry/exit functions. It's exactly the
same problem as we handle in interrupt/exception/nmi entry/exit code
vs. RCU, lockdep, tracing etc.

So if disable() does:

   if (!count)
   	arch_local_irq_disable();
   count++;

then an interrupt hitting before arch_local_irq_disable() will always
observe the correct state. After that it can't be delivered.

Now with exceptions that's a different story because they can hit after
local_irq_disable() and before the count is incremented.

I thought some more about the state handling there and I think we can
avoid irq_state_t completely:

  irqentry_enter_from_kernel_mode()
     count++;
     ...

  irqentry_exit_to_kernel_mode_after_preempt()
     ...
     count--;

For a regular interrupt which hit _before_ disable() managed to disable
it at the CPU level, this will go from 0 -> 1 and on return from 1 -> 0.

For an exception which hits between disabling and incrementing the
counter this will go from 0 -> 1 as well, but there is nothing which can
be done about that and exception handlers need to consult regs->eflags
to figure out the state of the context they interrupted. If the
exception hits afterwards then it will set the correct state.  But it
does not matter in that case because everything there needs to do
irqsave() so interrupts can't be enabled accidentaly. The only exception
to that rule is the conditional enable:

   if (regs->eflags & X86_EFLAGS_IF)
   	local_irq_enable();

And for that to work correctly you want overall consistent counter
state. Otherwise your counter is just a random number generator.

With that fixed the disable race becomes:

disable()
     if (!count)

-> Interrupt before interrupts are disabled in the CPU.

  irqentry_enter_from_kernel_mode()
     count++;   // Correct state because the CPU disabled interrupts

  ...
  __irq_exit_rcu()
     if (!in_interrupt() && local_softirq_pending()) {
        handle_softirqs()
          ...
          local_irq_enable();                -> Count goes to 0
          ...
          guard(spinlock_irq)(&lock)
            local_interrupt_disable()
              // Observes count == 0
              if (!count)
                 arch_local_irq_disable();
     ...
     
  irqentry_exit_to_kernel_mode_after_preempt()
     ...
     count--;

And yes, this only works correctly when _all_ state is consistent. You
can't get it to work properly with half of it without creating hard to
debug problems.

Thanks,

        tglx
