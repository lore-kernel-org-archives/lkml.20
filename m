Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C278B3D79FD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902986; cv=none; b=IFVupbAT/2F3SOMyglVj0/bmOiJdKqSxnL4tcJ8Xakdfq4YoqRUXHOY+5UU3w1CxFPyfu+pt6342K2jFYR8tQNMjCKh6u0wWsVz/dRYWaskrJdOk9nuvaLmbYFtfEUSyxZqq8+Bf/ZW8axryVtrYoHqsvsLt8pfhhEu4IRlkQQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902986; c=relaxed/simple;
	bh=1bbkJGRuCYNgYQcE3PpG6Gv5p4UgTH3jP5ijeOUqU1I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aQaOV9YWZkT6jWFwKv4hcopXX0A0GZ7JvADKr/htZCP4mlJnV6yPVoVgHWcJQKzrNqqy/cahTJvaRjMhCbeMnAxkN/S5rddZl+BEtQqF2EPdsmlC95AnrdCkK60uME7LF7tK/iTGjTqSp6faQI0QgfYorTYepjYBke1B5ryil6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjAgKjdn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjAgKjdn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56C61F00A3A;
	Tue,  8 Sep 2026 21:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788902984;
	bh=4LPhynS6ZpJR2mwhfmwf3kOy6+dOmQAWPxTF8ZDrW1I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=cjAgKjdnnKUhNnmNu59zrHPXvsf6RzktuvQKtDfH673ni8hWTnh4pwv757LHr92QY
	 xerS8rPol8zCXx6sIYYJHuYaUCTvosuK1X2rD6ALoQ/11LAWw2LreYB0sGKkBMMVmU
	 hEB5ohjZSNlnBslFijdQdpgnML7dsqBqvrD591+7EQYw4DV32aTCMkwI89/fRWqtQB
	 VJzEA4+8S6anTgfHvkSA/U3fCL/otooPTQFC94fceqPvsnZTp6OF99+vsA3TNfP/jO
	 cK0sQV3w/C96J8F5vXKFKTbc1wTMXgzxkAIl6eMTFpwk5JHEzQ8PziJ4u/QBvtBP09
	 r0ommOizN/NHQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Olivier Dion <odion@efficios.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>, David
 Matlack <dmatlack@google.com>, Marco Elver <elver@google.com>, Sean
 Christopherson <seanjc@google.com>, Wei Liu <wei.liu@kernel.org>, Florian
 Weimer <fweimer@redhat.com>, Mathias Stearn <mathias@mongodb.com>, Chris
 Kennelly <ckennelly@google.com>, Blake Oler <blake.oler@mongodb.com>, Rich
 Felker <dalias@libc.org>, Matthew Wilcox <willy@infradead.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos O'Donell
 <codonell@redhat.com>
Subject: Re: [RFC PATCH 0/5] rseq: add support for RSEQ operations
In-Reply-To: <871pb3wsmk.fsf@laura>
References: <20260828153349.8061-1-odion@efficios.com> <87y0db1y22.ffs@fw13>
 <871pb3wsmk.fsf@laura>
Date: Tue, 08 Sep 2026 23:29:41 +0200
Message-ID: <87jyov1lfe.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 08 2026 at 13:38, Olivier Dion wrote:
> On Tue, 08 Sep 2026, Thomas Gleixner <tglx@kernel.org> wrote:
>> fixup_ip()
>>       ....
>>       user_rseq.fixup_in_progress = false;
>>       restore_and_return() // Returns to the original IP
>
> Yes.  This is what I had in mind (see reply to Florian).
>
>> A reasonable limitation for the fixup function should be a strict "no
>> syscalls and no floating point within the fixup" rule. No floating point
>> avoids the whole sigframe disaster.
>
> I suppose that no floating point also mean no xsave performance
> trashing, which is obviously something we want to avoid.  Is that what
> you mean by sigframe disaster?  Also, I am not sure how we can enforce
> this no syscall/floating point policies other than asking users to be
> good citizen.

The sigframe disaster is that sigaltstack has been insufficient for the
ever growing XSTATE to save (its even uncompressed XSTATE). Also these
fixups really should do a few selective stores and not huge computations
or wipe out a GB of memory. So avoiding the XSAVE/XRSTOR overhead
completely is certainly a benefit.

>> When return to user observes user_rseq.fixup_in_progress then it can
>> mangle regs before doing anything else:
>>
>>         regs->ip = tsk->rseq.fixup_abort_ip;
>>         regs->sp = tsk->rseq.fixup_sp;
>>         user_rseq.fixup_in_progress = false;
>>         tsk->rseq.needs_fixup = true;
>>
>> Which rewinds the stack to the callframe and makes the interrupted fixup
>> continue at the fixup_abort_ip which just restores registers from the
>> callframe and returns to the original IP.
>
> So the fixup handler would have an abort label, akin to RSEQ region.
> But then there will be no guarantee that the fixup operations succeed?
> Or did I completely misunderstood?

They are only aborted when there is nesting, so the nesting context
starts over and redoes them. Once the nesting context returns to the
first fixup (abort IP) the state is correct and then the first fixup
returns to the original return IP.

That abort on nesting avoids the following issue:

user_function()
  ...
  interrupt(#1)
     schedule()
       MMCID changes
       fixup requested
   ...
   setup_callframe(....)
   return to user

 fixup_ip:
    fixup_c(data)
    ...
     interrupt(#2)
       schedule()
         MMCID changes
         fixup requested

     fixup_ip:
        fixup_c(data)
         data::mmcid = user_rseq::mmcid
        restore_and_return()

    data::mmcid = user_rseq::mmcid
    restore_and_return()

If the interrupt #2 hits between the load of user_rseq::mmcid and the
store to data::mmcid of the first fixup, then the return to the first
fixup context would obviously write the wrong ID back.

And you can't skip the fixup on return from interrupt #2 and just return
to the already running one in that case either.

That would be possible if the fixups are truly idempotent, e.g. can only
zero out memory.

The trivial nest case would be:

user_function()
  ...
  interrupt(#1)
     schedule()
       MMCID changes
       fixup requested
   ...
   setup_callframe(....)
   return to user

 fixup_ip:
    fixup_c(data)
    start zeroing

    interrupt(#2)
      schedule()
         MMCID changes
         fixup requested

     observes fixup running
     return to user

    continue zeroing
    restore_and_return()

But that does not work with signals because the signal delivery does not
return to the interrupted IP. It creates the sigframe and returns to the
signal handler, which then goes back with sys_rt_sigreturn(). Then the
kernel restores the interrupted context. So in that case you'd need:

user_function()
  ...
  interrupt(#1)
     schedule()
       MMCID changes
       fixup requested
   ...
   setup_callframe(....)
   // Must be a counter
   user_rseq->fixup_running++;
   return to user

 fixup_ip:
    fixup_c(data)
    start zeroing

    interrupt(#2)
      signal_delivery()
      setup_sigframe()
      observes fixup running
      setup_callframe(....)
      user_rseq->fixup_running++;
      return to user

 fixup_ip:
    fixup_c(data)
    zero everything
    user_rseq->fixup_running--;
      restore_and_return()

   signal_handler()
      sys_rt_sigreturn()
      restore_regs()
      observes fixup running
      return to user
    
 continue zeroing
 user_rseq->fixup_running--;
 restore_and_return()

Idempotent fixup functions restrict obviously what can be done
there. But if that restriction is fine, then this approach works too.

I have no strong opinion either way.

>> There are obviously a ton of details to take care of (/me mumbles shadow
>> stacks and RSEQ CS interaction), but the general principle should just
>> work. Emphasis on should and I'm so NOT going to hack that up. :)
>
> I could certainly make a POC out of this for x86.  It could handle
> red-zone and shadow-stack to start with.  I don't know if there are

I wouldn't even bother with shadow-stacks for a POC. The red-zone skip
when setting up the callframe, i.e. SP - 128 is unavoidable, but that's
it.

> other architecture-specific quirks that need to be aware of, given I am
> not familiar enough with architectures outside of x86.

Well every architecture has some quirks but I'm not aware of one which
would fundamentally stand in the way. The main difference is going to be
how the callframe is set up and how the fixup function needs to
look. That's always architecture specific and there are wizards for each
architecture to help with that :)

> One aspect that I have not think of for now is allowing fast
> registration/unregistration.  This RFC uses a syscall for registration.
> My original intent for this was to do a edge trigger detection of the
> first/last registration/unregistration in the syscall and set/unset a
> flag into the RSEQ state of the thread task.  That way, we don't need to
> touch another cache line to know if the thread registered something.
> This is obviously incompatible with short-live registrations.  However,
> I did not come with a case for it yet, so perhaps I am over-thinking
> this.

TCMalloc wont have a short-lived registration, neither wont a tracer or
something like that. Once a library is initialized it won't go away just
because. So if the facility needs to pause the callback intermittently
then this can simply be:

cb(data)
        if (!data->run)
        	return;

That won't be the end of the world if those pauses are not taking
forever. If they do then the syscall is justified.

Let's get the basic principles working first on a KISS basis and then
think about how to keep it as simple as possible.

So for the POC you neither need multi-lib support nor the VDSO
bits. Just hack up the ASM fixup and a trivial C demonstrator in user
space and register fixup and abort address with a hacked up sys_rseq().

Once that works, the extra bells and whistels are not hard to add. They
are hard to get right, but without the prove of concept wasting time
on them is pretty pointless. :)

Thanks,

        tglx

---
Everything should be made as simple as possible, but not simpler.

                                  - attributed to Albert Einstein


