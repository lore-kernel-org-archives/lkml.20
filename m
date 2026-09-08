Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7194F0538
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889110; cv=none; b=BfqVHxEF9ggVO66y46glt8cycYnoMUWLsKZSreYGL3DTIv93l+tYeVvDbBOHfyyJbuUHP02BH3QQjrdiFmHZyjueqC2+i18kMclUtJTfVJjvg5LgsL53gXh/8It/oGKyxI4jtdwEormqnXEeQ11JsKHaHQgva1ZnSwOAo5RqidM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889110; c=relaxed/simple;
	bh=BUWnxc7X+QFbyni2jvY35jfu5oP0WYjiLEF9ZbcNOes=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iGmce+KAqEnunaiMYYYlJemuAE9LH9Um0v7uSe9HNY2c3igJH5UL7Ja65qaJhHBBMmh4p0eD1cBH6he04tOxuxBMd2JtxE/26sIr30dK+wfxhjycdvz9Vmm/PBKC4Ca5m6eMNexxoYZsOdXvnXtwdSmmHcEU27besvgTPU6ud1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=ESVBf1gK; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="ESVBf1gK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1788889107;
	bh=MmZ5pBVWP9E0pmdcmX0037ifFkslmRTqczlX7LOQd8A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ESVBf1gKqBhVq3o6A0bn53MplBmzA3bzsdNXSUXEtXtUDQLnsjMHP6cYgKPDvB7CO
	 dZiR7oLV2b9tSb1lebU4BmRahTQ74jMxqLHaQZrVzU3VlkXIokxQq6tvWAO9/1nfSe
	 Vj6nU87f/nuyWmyW8LcI18yBd2V5O+s08aZRAYvCGFfNq18nfKFjevOBG15WkchCWs
	 xZLZYQbDHm/dje4whbbyqLT4ibw/bOklh45xfJcnY4JoS3QN+lQ+GKQXCmIPHSuBeo
	 rblk6FrBeVawn7fVXw1AhnrIShwU/4OXdXYUuhvJvqAPLDCliMFmH0yseIPBGAHl/k
	 NRi8VoNMWD/uw==
Received: from localhost (199-193-172-8.cpe.axion.ca [199.193.172.8])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hfWPb4D3kzZHD;
	Tue, 08 Sep 2026 13:38:27 -0400 (EDT)
From: Olivier Dion <odion@efficios.com>
To: Thomas Gleixner <tglx@kernel.org>, Mathieu Desnoyers
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
In-Reply-To: <87y0db1y22.ffs@fw13>
Organization: EfficiOS
References: <20260828153349.8061-1-odion@efficios.com> <87y0db1y22.ffs@fw13>
Date: Tue, 08 Sep 2026 13:38:27 -0400
Message-ID: <871pb3wsmk.fsf@laura>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 08 Sep 2026, Thomas Gleixner <tglx@kernel.org> wrote:
> Olivier!
>
> On Fri, Aug 28 2026 at 11:33, odion@efficios.com wrote:
>> This series introduces RSEQ operations: a per-thread list of operations the
>> kernel applies, on behalf of a ask, when returning to user space.
>>
>> The main motivation is to help TCMalloc migrate from RSEQ v1 to RSEQ v2 and use
>> the RSEQ area registered by glibc. TCMalloc currently relies on RSEQ v1
>> resetting the cpu_id field to invalidate a per-CPU pointer cached in TLS. This
>> requires applications to disable glibc's implicit RSEQ registration and prevents
>> sharing the glibc RSEQ area.
>>
>> RSEQ operations provide an opt-in replacement for that invalidation
>> mechanism. User space registers operation nodes with prctl; the kernel keeps the
>> nodes in a per-thread circular list and applies them on return to user
>> space. Only tasks with registered operations incur the additional RSEQ exit-path
>> work.
>
> TBH, to me this sounds like a horrible idea. It's yet another
> "interpreter" for a very limited use case and a lot of complexity.

I post this RFC before going on vacation.  I tend to very much agree
with you reply overall, after revisiting the problem and potential
issues this solution could introduce.

> I think this can be done in user space with some help of the kernel of
> course. If user space has registered an entry point for this
> functionality then the kernel can emulate a call to that on return to
> user space:
>
>       if (tsk->rseq.needs_fixup) {
>                 // modifies regs->sp
> 		create_callframe_on_user stack(regs);
>                 regs->ip = tsk->rseq.fixup_ip;
>       }
>       ret_to_user()
>
> The user space fixup does:
>
> fixup_ip()
>       ....
>       user_rseq.fixup_in_progress = false;
>       restore_and_return() // Returns to the original IP

Yes.  This is what I had in mind (see reply to Florian).

> A reasonable limitation for the fixup function should be a strict "no
> syscalls and no floating point within the fixup" rule. No floating point
> avoids the whole sigframe disaster.

I suppose that no floating point also mean no xsave performance
trashing, which is obviously something we want to avoid.  Is that what
you mean by sigframe disaster?  Also, I am not sure how we can enforce
this no syscall/floating point policies other than asking users to be
good citizen.

> Of course the above is way too simple to be true :) It works except when
> it nests. But that's solvable too:
>
>       if (tsk->rseq.needs_fixup) {
>                 // modifies regs->sp
> 		create_callframe_on_user stack(regs);
>                 regs->ip = tsk->rseq.fixup_ip;
>                 // Save the callframe SP
>                 tsk->rseq.fixup_sp = regs->sp;
>       }
>
> When return to user observes user_rseq.fixup_in_progress then it can
> mangle regs before doing anything else:
>
>         regs->ip = tsk->rseq.fixup_abort_ip;
>         regs->sp = tsk->rseq.fixup_sp;
>         user_rseq.fixup_in_progress = false;
>         tsk->rseq.needs_fixup = true;
>
> Which rewinds the stack to the callframe and makes the interrupted fixup
> continue at the fixup_abort_ip which just restores registers from the
> callframe and returns to the original IP.

So the fixup handler would have an abort label, akin to RSEQ region.
But then there will be no guarantee that the fixup operations succeed?
Or did I completely misunderstood?

[...]

> There are obviously a ton of details to take care of (/me mumbles shadow
> stacks and RSEQ CS interaction), but the general principle should just
> work. Emphasis on should and I'm so NOT going to hack that up. :)

I could certainly make a POC out of this for x86.  It could handle
red-zone and shadow-stack to start with.  I don't know if there are
other architecture-specific quirks that need to be aware of, given I am
not familiar enough with architectures outside of x86.

[...]

> Once the POC dust has settled the registration interface should change
> for the final implementation because otherwise this would create the
> very same problem of who owns it again.

Right we don't want to play in that movie again :-)

> The final solution should provide a trivial dispatch mechanism in the
> VDSO and the RSEQ user area should be expanded to provide storage for
> registration. The syscall registration would change to registering a lib
> specific callback/data pair and the kernel would reorganize the
> storage. Whether that's a linked list or a size limited array in the
> RSEQ user area does not matter. As this is thread local there is no
> concurrency and the syscall can rearange that storage completely
> undisturbed. Libraries can manage their own thread local marker which is
> checked in the lib specific callback to decide whether they want to run
> or not.
>
> Using a VDSO dispatcher and expanding the RSEQ storage for that should
> just work out of the box with any libc which supports RSEQ_V2 and would
> therefore not create any additional libc dependencies for other
> library developers.
>
> The dispatcher entry needs to be trivial ASM for the restore/return
>
> fixup_ip:
>         // setup_fixup() in the kernel stored the TLS user RSEQ address in
>         // RDI or whatever an architecture uses for the first argument
> 	CALL	fixup_c
> fixup_ip_abort:
> 	ASM_RESTORE_REGS
>         RET
>
> The C part should be trivial too:
>
> fixup_c(struct rseq *rseq) 
> {
>         for_each_fixup(fn, data, rseq)
>         	fn(data);
> }
>
> or something along these lines.

Thanks for the insight.  I think this will certainly help me in making
the POC.

One aspect that I have not think of for now is allowing fast
registration/unregistration.  This RFC uses a syscall for registration.
My original intent for this was to do a edge trigger detection of the
first/last registration/unregistration in the syscall and set/unset a
flag into the RSEQ state of the thread task.  That way, we don't need to
touch another cache line to know if the thread registered something.
This is obviously incompatible with short-live registrations.  However,
I did not come with a case for it yet, so perhaps I am over-thinking
this.

Thanks,
Olivier
-- 
Olivier Dion
EfficiOS Inc.
https://www.efficios.com
