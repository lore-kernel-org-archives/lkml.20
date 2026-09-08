Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37CB58FD3C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886618; cv=none; b=egCAlS/4YsT1251TsAHHfBRozCbSBnhlb2AXkwzH/e9kZPaU3BM3dGdxhNj2hRsMuBuXWUD85H6vVwaodGS9PmmSxxPNKm97EtZXNj896CpsM2QEwRg3baVbofvJRoDCugJhcY1OPrYCb312Zb2N+G9GYX9vhkDL2pEEbFDaELE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886618; c=relaxed/simple;
	bh=aiblcT70iPLS6AwFgQZ6IIgU1Z01vt6c72Vl+8baMnA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=agSZyEmC5zTslLKK47sQChfcRRHglhXCU9AUReqV6NRJ6QxpdILycrMLihpVqEkTNvjLbL9mbFjd/rWlamOMCQsNQ0IXw+RooCfFOR7c9s164V5N2WJIEicKQi+Pw+QSbWwSYbe1ulLuRWCYYAo/VrBotc2TrwCmQskAQ50R8dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hg01vXGN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hg01vXGN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3F21F00A3A;
	Tue,  8 Sep 2026 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788886616;
	bh=0Ic12iremlM9TZMc8ylF1YfBdaVrNcMaSkGcRUsqIFc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=hg01vXGNxKuUYufSyV3SjE4XK2+pFq3CBzSP1DciPs2yS+JqbkGD4OtoPqzFPum4j
	 Hl6trwjeg1ybQgqTGMq4+TVspPkd9anVlCvq1V5ai5uiAv5kYq0Kz4sCeO9WJf7tGV
	 6XqbYYjWhqFgCikHv9p9MmORikp62StIglKFz7tW80ELYH6nkPeOdThAhk1v3NAabb
	 gEDLAv7eR+JMSYXBTHeTnDJlsyQ2VvX6lGWwp7bcKvxgYNo/i4Y0HP4yaLOgM4qAL7
	 yj3hjk7s77ORyJ35BDpDuKNsEHyP5yMq8oGKiBdYm8r0q6MIP5ioKdkVvsFKM55dNn
	 iyGqSClQ0dKow==
From: Thomas Gleixner <tglx@kernel.org>
To: odion@efficios.com, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>, David
 Matlack <dmatlack@google.com>, Marco Elver <elver@google.com>, Sean
 Christopherson <seanjc@google.com>, Wei Liu <wei.liu@kernel.org>, Florian
 Weimer <fweimer@redhat.com>, Mathias Stearn <mathias@mongodb.com>, Chris
 Kennelly <ckennelly@google.com>, Blake Oler <blake.oler@mongodb.com>, Rich
 Felker <dalias@libc.org>, Matthew Wilcox <willy@infradead.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos O'Donell
 <codonell@redhat.com>, Olivier Dion <odion@efficios.com>
Subject: Re: [RFC PATCH 0/5] rseq: add support for RSEQ operations
In-Reply-To: <20260828153349.8061-1-odion@efficios.com>
References: <20260828153349.8061-1-odion@efficios.com>
Date: Tue, 08 Sep 2026 18:56:53 +0200
Message-ID: <87y0db1y22.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Olivier!

On Fri, Aug 28 2026 at 11:33, odion@efficios.com wrote:
> This series introduces RSEQ operations: a per-thread list of operations the
> kernel applies, on behalf of a ask, when returning to user space.
>
> The main motivation is to help TCMalloc migrate from RSEQ v1 to RSEQ v2 and use
> the RSEQ area registered by glibc. TCMalloc currently relies on RSEQ v1
> resetting the cpu_id field to invalidate a per-CPU pointer cached in TLS. This
> requires applications to disable glibc's implicit RSEQ registration and prevents
> sharing the glibc RSEQ area.
>
> RSEQ operations provide an opt-in replacement for that invalidation
> mechanism. User space registers operation nodes with prctl; the kernel keeps the
> nodes in a per-thread circular list and applies them on return to user
> space. Only tasks with registered operations incur the additional RSEQ exit-path
> work.

TBH, to me this sounds like a horrible idea. It's yet another
"interpreter" for a very limited use case and a lot of complexity.

I think this can be done in user space with some help of the kernel of
course. If user space has registered an entry point for this
functionality then the kernel can emulate a call to that on return to
user space:

      if (tsk->rseq.needs_fixup) {
                // modifies regs->sp
		create_callframe_on_user stack(regs);
                regs->ip = tsk->rseq.fixup_ip;
      }
      ret_to_user()

The user space fixup does:

fixup_ip()
      ....
      user_rseq.fixup_in_progress = false;
      restore_and_return() // Returns to the original IP

A reasonable limitation for the fixup function should be a strict "no
syscalls and no floating point within the fixup" rule. No floating point
avoids the whole sigframe disaster.

Of course the above is way too simple to be true :) It works except when
it nests. But that's solvable too:

      if (tsk->rseq.needs_fixup) {
                // modifies regs->sp
		create_callframe_on_user stack(regs);
                regs->ip = tsk->rseq.fixup_ip;
                // Save the callframe SP
                tsk->rseq.fixup_sp = regs->sp;
      }

When return to user observes user_rseq.fixup_in_progress then it can
mangle regs before doing anything else:

        regs->ip = tsk->rseq.fixup_abort_ip;
        regs->sp = tsk->rseq.fixup_sp;
        user_rseq.fixup_in_progress = false;
        tsk->rseq.needs_fixup = true;
    
Which rewinds the stack to the callframe and makes the interrupted fixup
continue at the fixup_abort_ip which just restores registers from the
callframe and returns to the original IP.

Then the flow becomes in case of a trivial interrupt which just returns:

    fixup_ip()
      -> interrupt
                                ...
                                if (user_rseq.fixup_in_progress)
                                   rewind_fixup(regs);
                                 ...
                                if (needs_fixup)
                                   setup_fixup(regs);
                                return to user;
       fixup_ip()
          ...
          user_rseq.fixup_in_progress = false
          restore_and_return()
   fixup_abort_ip:
      restore_and_return()      // Returns to orig_ip

In case of a signal delivery:

    fixup_ip()
      -> interrupt
                                ...
                                if (user_rseq.fixup_in_progress)
                                   rewind_fixup(regs);

                                   deliver_signal()
                                     setup_sigframe()
                                  ...
                                if (needs_fixup)
                                   setup_fixup(regs);
                                return to user;
       fixup_ip()
          ...
          user_rseq.fixup_in_progress = false
          restore_and_return()
       signal_handler()
          sys_sigreturn()
                                restore(regs)
                                return to user;

   fixup_abort_ip:
      restore_and_return()      // Returns to orig_ip

There are obviously a ton of details to take care of (/me mumbles shadow
stacks and RSEQ CS interaction), but the general principle should just
work. Emphasis on should and I'm so NOT going to hack that up. :)

I've played around with something similar pre RSEQ, but all I could
still find are the notes I took back then, which I duly transcribed into
todays RSEQ world. The patches themself would be utterly useless anyway
as all parts which need to be touched have been through the mincer at
least once.

The fixup address and the fixup abort address should probably not be
stored in user rseq memory. For an initial POC they just can be
registered through sys_rseq() which also enables the fixup mechanics,
i.e. the unconditional set of tsk->rseq.needs_fixup in schedule(), which
should be completely independent of the rseq.sched_switch and
rseq.ids_changed bits and not change the existing functionality and
semantics like the current POC does. Keep it separate.

Once the POC dust has settled the registration interface should change
for the final implementation because otherwise this would create the
very same problem of who owns it again.

The final solution should provide a trivial dispatch mechanism in the
VDSO and the RSEQ user area should be expanded to provide storage for
registration. The syscall registration would change to registering a lib
specific callback/data pair and the kernel would reorganize the
storage. Whether that's a linked list or a size limited array in the
RSEQ user area does not matter. As this is thread local there is no
concurrency and the syscall can rearange that storage completely
undisturbed. Libraries can manage their own thread local marker which is
checked in the lib specific callback to decide whether they want to run
or not.

Using a VDSO dispatcher and expanding the RSEQ storage for that should
just work out of the box with any libc which supports RSEQ_V2 and would
therefore not create any additional libc dependencies for other
library developers.

The dispatcher entry needs to be trivial ASM for the restore/return

fixup_ip:
        // setup_fixup() in the kernel stored the TLS user RSEQ address in
        // RDI or whatever an architecture uses for the first argument
	CALL	fixup_c
fixup_ip_abort:
	ASM_RESTORE_REGS
        RET

The C part should be trivial too:

fixup_c(struct rseq *rseq) 
{
        for_each_fixup(fn, data, rseq)
        	fn(data);
}

or something along these lines.

Thoughts?

Thanks,

        tglx
