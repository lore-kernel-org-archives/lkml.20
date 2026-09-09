Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7492577E38
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965664; cv=pass; b=Un5nukQKSkuKYEH9kAt8l975QCIwrlNDC4JVhM+vSOJgc/oTu2RSiZlXxbU9p7JIqGgnNFNt10SiepZVlhVKKaPN3c+Cuj2W3Qoo6qGI6QsPNEReI6A2OWMDXIGLwhKrpJOwvRa+CpON27EWYzux4WJ9WnqPLa/80EOMXnms91A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965664; c=relaxed/simple;
	bh=hvZKX1/xbVwzUP2T0biVP9ONn5iPxryYRN+z9C7/gP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVoQyG2WRi66cJ5YNM6MQTdvYc3+YW2tL83wmFvhIBvuZE5Yk/2bRRf7mSreAS/N0aY9Vf2Uz3qK7rSwi0SE2g1WHCYYySURYDlAjKUq9ltX9aiKdYmz1xhg6Vufp+4TzAaxJDU2SUB9IdtUP/2B+lpvbvG78CYtdC9hBGkPn0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qB11DbuC; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qB11DbuC"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c28fde3bbd2so515422766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:54:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965661; cv=none;
        d=google.com; s=arc-20260327;
        b=fg3Fnb3hB4MZI3HoqWUYPGfZ58wsAw+IzFcXXaE2LpaaECaqaZ9a4R1iPx/Z3Vbd5T
         TVsvGzn3VheewGg59wd+0uXev0MK3w1iw/rny4P3yXnRLluhnpooDOAFBqGuzz/yHo79
         nSgk2b5AtQ8QOrLsnZ2OtFekY/Lq10uC56fp6OENTV/K160E1OY9H0TjRzcE0mp1MdRR
         pziT9Iisc1uRJAcr8o5uSwlumJN8C/lD1Xl8eP+fftEuHnpOXu8JliFuwiJE6X4bo3Tr
         GM3s/qEo+qvdoyiQUH/XgJq6Yqhzf6fpMxdpdg9U2gnCo90ZvPODzSsJTpUE1l/9+cZ2
         yynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fkalshBTqwS9h5FtFDU80nhlrbnzD3hDyun1Zdt7NgU=;
        fh=A/uyFXOqRPwfDIlRfEnm+Ka/C94txPg/GjAOaeWlRbo=;
        b=EBDNGp7sfEJJzHpOpUKtn0WZP2XVRZSwpRlKr32I4j6RZ5hqWQ3IrdOIqAoWbA652g
         VuiN1orFG7yGi6Qe31nr7T6+bB3BHr+MumwP92i/2yvT+LTr2mTmUN0hIVU9KutbV9nG
         hJzKsgScGywk/Q9ea9IJ0OkxpS2yhEIk7barJgzjH1PQI32PoZkK9nQkZyMzLEgPfwl8
         aYOZgBDgvy3pzcZvlVVMAeepFSVUsIghEGR8mBpPWVOvtUzbQCmziiupqNnI17OvmMnx
         0IIS0Xg/xTw6I+dW4GckYpPJukkQx6QnztQo5dih6M42lhTw9+GBKfLa5DtocuiMwW6t
         coNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788965661; x=1789570461; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkalshBTqwS9h5FtFDU80nhlrbnzD3hDyun1Zdt7NgU=;
        b=qB11DbuCxoUZ+u9UvgRrtJzaqVDVsEtpoHp4dbt2XYpc3/+mE30IH0j7Sv9rRZevvX
         E+4AvXlD7h4QnRcSJ/wl/l8Dnzo5AgouYqAXLpG4+fI1I2OHfvjdC5d5LU2p3fAM1R8S
         Uk1kB/vSkUqnV0XO+mvNpR6SkOBAD0T3GuT/gsYSuRUd6HZPJfNOu2dqjAaCx3iVzIvh
         rONedZdngOTd85jJWxoWxZorXyRp4proQEm4dN4OA+QGUJEw2OqXV+NVMVP2spEV7HEV
         5KTn3h3a/iIDBPJFZKbyJBRJFqfHIxMXcqtfqjsrmrO+sjDUwvc8nqoDbVyNdk/1QZXB
         a7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965661; x=1789570461;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fkalshBTqwS9h5FtFDU80nhlrbnzD3hDyun1Zdt7NgU=;
        b=IpyQjIbILbFQN4bzQKmD9qAi0Yvpqa9h/vjusl94hJ8BNlcSZEGgos7j+ZktBrbTIl
         C6i9g8j9YItZ/iiF+4HcU5QH86NQMNHb0vU/Qj8m0vfxIeUm+3gfTT5o5U2NCo9gEni7
         1Z2nRSnBGBqqtcL5K6KEAHcPyVuPRqWs7/53Z72vERNVPN/ighI02Vu198NpY6zhe3v5
         f+vU2jSES35sffL5brWG3AZB4IkR5j/HYLaPR+cDOPLul/bZq2oClgQpodwb41NLXxcH
         l3ra8ZCIaSfBdYbRGRjFyfBx134dFnhlSxbiknWa5cgF+llnm4US4o8zky5H84mrfVMc
         vvgw==
X-Forwarded-Encrypted: i=1; AKwUvByh4AHQg6+ZAvdphs54o40oNDTytuN+CwzXD/Q2IC3wklWt1Wl/HjBpm6nbcXDPQ5+18mK15vWovg472tU=@vger.kernel.org
X-Gm-Message-State: AFuF++lW8i2iDadtn2+4sn+LZJcAdipkE+M4iZyvcrlbG6u5omdvQzF+
	y9+zk8KWfUgUk8lm8CJDr4oaK/zN0WfNLB4ULkD5dv3QRdXXOV4iLdalHrrkQtKLG++wGFLZxNZ
	XOaSSJTM1aDrqKaWSxP+esXYHnDoK1WZJd8UoCfmq
X-Gm-Gg: AYBFou2oi0l91U1n2WNaVPSdUOcb7pA4O3KNHhB904sG0xKFwVxT/LIBuf4dgmnkwhL
	OJzWMD2MDR9Fo9VinLU/gpS7a9J3Mc2glJ0cxcYeZacjwfhYgymAzPZauQ6UW+pBoAq3YzaDLkn
	/mRyhOC614JL1rkm7tXbHaD8ByN9+8m6BEUfmM+0AF0DZ2iOQQtPh00Zql1SRzBwC4QaC4tZhqw
	X490P4bEuaaWUx60vvYNMHgrzxJOHICZU9wdzjXBK92I6X/iW0GCi55l94NnVY84eEc5Lu0EgV1
	uqvtWUcpP4MF+WIxp5t0rGFEtBUKt+i8/+945lCQt6bf9VvSwU3YCUwimWk4uQFnVqRdLQj/ipK
	vMYgsMVsg/X9+LYfknrAKytPoOqK9e/MoKc2Y2V4x2xCs
X-Received: by 2002:a17:906:4789:b0:c24:e0dc:8b66 with SMTP id
 a640c23a62f3a-c260c8dc700mr1565460366b.6.1788965660099; Wed, 09 Sep 2026
 07:54:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828153349.8061-1-odion@efficios.com> <87y0db1y22.ffs@fw13>
 <871pb3wsmk.fsf@laura> <87jyov1lfe.ffs@fw13>
In-Reply-To: <87jyov1lfe.ffs@fw13>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 9 Sep 2026 16:54:08 +0200
X-Gm-Features: AcwNN1WCsJd0ivGEM2IHL9-UXBv--SS52nNnw1A1WsNU8r_7T5Vp4UgGhdWKPQ8
Message-ID: <CACT4Y+aseR5x8u+J6q=hARoPRCrMGcxP75VmJw0hCSLUFD=oMQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] rseq: add support for RSEQ operations
To: Thomas Gleixner <tglx@kernel.org>
Cc: Olivier Dion <odion@efficios.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, David Matlack <dmatlack@google.com>, 
	Marco Elver <elver@google.com>, Sean Christopherson <seanjc@google.com>, Wei Liu <wei.liu@kernel.org>, 
	Florian Weimer <fweimer@redhat.com>, Mathias Stearn <mathias@mongodb.com>, 
	Chris Kennelly <ckennelly@google.com>, Blake Oler <blake.oler@mongodb.com>, 
	Rich Felker <dalias@libc.org>, Matthew Wilcox <willy@infradead.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Carlos O'Donell" <codonell@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 23:29, Thomas Gleixner <tglx@kernel.org> wrote:
>
> On Tue, Sep 08 2026 at 13:38, Olivier Dion wrote:
> > On Tue, 08 Sep 2026, Thomas Gleixner <tglx@kernel.org> wrote:
> >> fixup_ip()
> >>       ....
> >>       user_rseq.fixup_in_progress = false;
> >>       restore_and_return() // Returns to the original IP
> >
> > Yes.  This is what I had in mind (see reply to Florian).
> >
> >> A reasonable limitation for the fixup function should be a strict "no
> >> syscalls and no floating point within the fixup" rule. No floating point
> >> avoids the whole sigframe disaster.
> >
> > I suppose that no floating point also mean no xsave performance
> > trashing, which is obviously something we want to avoid.  Is that what
> > you mean by sigframe disaster?  Also, I am not sure how we can enforce
> > this no syscall/floating point policies other than asking users to be
> > good citizen.
>
> The sigframe disaster is that sigaltstack has been insufficient for the
> ever growing XSTATE to save (its even uncompressed XSTATE). Also these
> fixups really should do a few selective stores and not huge computations
> or wipe out a GB of memory. So avoiding the XSAVE/XRSTOR overhead
> completely is certainly a benefit.
>
> >> When return to user observes user_rseq.fixup_in_progress then it can
> >> mangle regs before doing anything else:
> >>
> >>         regs->ip = tsk->rseq.fixup_abort_ip;
> >>         regs->sp = tsk->rseq.fixup_sp;
> >>         user_rseq.fixup_in_progress = false;
> >>         tsk->rseq.needs_fixup = true;
> >>
> >> Which rewinds the stack to the callframe and makes the interrupted fixup
> >> continue at the fixup_abort_ip which just restores registers from the
> >> callframe and returns to the original IP.
> >
> > So the fixup handler would have an abort label, akin to RSEQ region.
> > But then there will be no guarantee that the fixup operations succeed?
> > Or did I completely misunderstood?
>
> They are only aborted when there is nesting, so the nesting context
> starts over and redoes them. Once the nesting context returns to the
> first fixup (abort IP) the state is correct and then the first fixup
> returns to the original return IP.
>
> That abort on nesting avoids the following issue:
>
> user_function()
>   ...
>   interrupt(#1)
>      schedule()
>        MMCID changes
>        fixup requested
>    ...
>    setup_callframe(....)
>    return to user
>
>  fixup_ip:
>     fixup_c(data)
>     ...
>      interrupt(#2)
>        schedule()
>          MMCID changes
>          fixup requested
>
>      fixup_ip:
>         fixup_c(data)
>          data::mmcid = user_rseq::mmcid
>         restore_and_return()
>
>     data::mmcid = user_rseq::mmcid
>     restore_and_return()
>
> If the interrupt #2 hits between the load of user_rseq::mmcid and the
> store to data::mmcid of the first fixup, then the return to the first
> fixup context would obviously write the wrong ID back.
>
> And you can't skip the fixup on return from interrupt #2 and just return
> to the already running one in that case either.
>
> That would be possible if the fixups are truly idempotent, e.g. can only
> zero out memory.
>
> The trivial nest case would be:
>
> user_function()
>   ...
>   interrupt(#1)
>      schedule()
>        MMCID changes
>        fixup requested
>    ...
>    setup_callframe(....)
>    return to user
>
>  fixup_ip:
>     fixup_c(data)
>     start zeroing
>
>     interrupt(#2)
>       schedule()
>          MMCID changes
>          fixup requested
>
>      observes fixup running
>      return to user
>
>     continue zeroing
>     restore_and_return()
>
> But that does not work with signals because the signal delivery does not
> return to the interrupted IP. It creates the sigframe and returns to the
> signal handler, which then goes back with sys_rt_sigreturn(). Then the
> kernel restores the interrupted context. So in that case you'd need:
>
> user_function()
>   ...
>   interrupt(#1)
>      schedule()
>        MMCID changes
>        fixup requested
>    ...
>    setup_callframe(....)
>    // Must be a counter
>    user_rseq->fixup_running++;
>    return to user
>
>  fixup_ip:
>     fixup_c(data)
>     start zeroing
>
>     interrupt(#2)
>       signal_delivery()
>       setup_sigframe()
>       observes fixup running
>       setup_callframe(....)
>       user_rseq->fixup_running++;
>       return to user
>
>  fixup_ip:
>     fixup_c(data)
>     zero everything
>     user_rseq->fixup_running--;
>       restore_and_return()
>
>    signal_handler()
>       sys_rt_sigreturn()
>       restore_regs()
>       observes fixup running
>       return to user
>
>  continue zeroing
>  user_rseq->fixup_running--;
>  restore_and_return()
>
> Idempotent fixup functions restrict obviously what can be done
> there. But if that restriction is fine, then this approach works too.
>
> I have no strong opinion either way.
>
> >> There are obviously a ton of details to take care of (/me mumbles shadow
> >> stacks and RSEQ CS interaction), but the general principle should just
> >> work. Emphasis on should and I'm so NOT going to hack that up. :)
> >
> > I could certainly make a POC out of this for x86.  It could handle
> > red-zone and shadow-stack to start with.  I don't know if there are
>
> I wouldn't even bother with shadow-stacks for a POC. The red-zone skip
> when setting up the callframe, i.e. SP - 128 is unavoidable, but that's
> it.
>
> > other architecture-specific quirks that need to be aware of, given I am
> > not familiar enough with architectures outside of x86.
>
> Well every architecture has some quirks but I'm not aware of one which
> would fundamentally stand in the way. The main difference is going to be
> how the callframe is set up and how the fixup function needs to
> look. That's always architecture specific and there are wizards for each
> architecture to help with that :)
>
> > One aspect that I have not think of for now is allowing fast
> > registration/unregistration.  This RFC uses a syscall for registration.
> > My original intent for this was to do a edge trigger detection of the
> > first/last registration/unregistration in the syscall and set/unset a
> > flag into the RSEQ state of the thread task.  That way, we don't need to
> > touch another cache line to know if the thread registered something.
> > This is obviously incompatible with short-live registrations.  However,
> > I did not come with a case for it yet, so perhaps I am over-thinking
> > this.
>
> TCMalloc wont have a short-lived registration, neither wont a tracer or
> something like that. Once a library is initialized it won't go away just
> because. So if the facility needs to pause the callback intermittently
> then this can simply be:
>
> cb(data)
>         if (!data->run)
>                 return;
>
> That won't be the end of the world if those pauses are not taking
> forever. If they do then the syscall is justified.
>
> Let's get the basic principles working first on a KISS basis and then
> think about how to keep it as simple as possible.
>
> So for the POC you neither need multi-lib support nor the VDSO
> bits. Just hack up the ASM fixup and a trivial C demonstrator in user
> space and register fixup and abort address with a hacked up sys_rseq().
>
> Once that works, the extra bells and whistels are not hard to add. They
> are hard to get right, but without the prove of concept wasting time
> on them is pretty pointless. :)

I totally agree with the "yet another general-purpose interpreter" argument.
I was thinking of some schemes where we would need to clear lots of
words, and doing this with an in-kernel interpreter may be too slow;
or clearing just 1 or 2 bytes; or even caching a pointer in the GS
register, and resetting it with wrgsbase.

I think we even brainstormed with Mathieu something similar to
resetting the PC to a custom user-space handler at Plumbers few years
ago, but we got stuck on signal handlers and re-entrancy problem.
