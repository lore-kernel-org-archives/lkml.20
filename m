Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC9337F324;
	Sat,  5 Sep 2026 20:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788638525; cv=none; b=ucfc0IdXDNm1KCnzzqaZ84tagsgu9siDyyi0aXYxWNpCwzO+Vn967q63lQUk71e3ME4n5l0mF0ZCaebBjlL/FRUdM5kspvmo7J3ex2AAmcEJHRos2MzJ6+vQTsA3BFGJZkOeRE6CmMKNLED63IIAsikCrEKSqHVXTzQ/TZuBn7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788638525; c=relaxed/simple;
	bh=7UaLLUmfJ2PMcsFeExCk05PcH6XPcEc60FP8fuYhgAI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fnC/NE6h9iAAhN26prsNP+nvr4LVFMcMOwwsa5aIhmhNctW9C5MNMC49joi8+hJCuDKG1Jv6cF666qW/hdoLWAuqq9+YKFrHfYz8weK25Z9GQ6L8INO+5Vqts3ZDNT311v5/c9mU6LN5yX0NZNt/XIcZEg4AV76LJY3uyo1IRsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPwIeUqm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPwIeUqm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8E91F00A3A;
	Sat,  5 Sep 2026 20:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788638522;
	bh=xiKHap4jQzqzylGlDna2L3pY7j6xyabzXHyumtlUuBo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gPwIeUqm+MWjwQojYRh6AXH7IAdwy5UlYvlNVOS0k652XE79t4vjYAseqLIorfXU0
	 orZYPuwi3dZ8+HoB9UQJRbdNAQlxrg2Qy3aT3k75tOPAbqe4khJUroskvvDzYzsQN2
	 XJE605K8Mmz72vtMy7D/wfTneI20TpL+MUb7gFAl/xid83Ge6SlvQF2lITyDLxPXb8
	 vB0iW77xWpsrbq8j8CmQsMYutkAGzV7+CqC28mmCQ36L1Rc0qU9ZiJW9Rnoj9bT2fw
	 m7zk9AQbBMhTgNCLTCOVZEUKXwMblKl8FQClvpJ0erx+GwI1VlXh/imOjt1ahc2wPr
	 woepkeiDt3Tsw==
From: Thomas Gleixner <tglx@kernel.org>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rseq: defer time slice extension yield for sys_futex_wakey
In-Reply-To: <aprNcgTON1V7Tr1W@shell.ilvokhin.com>
References: <20260831-sys-futex-wake-time-slice-v1-1-814bb95cc339@google.com>
 <87ld9ha8wu.ffs@fw13> <aprNcgTON1V7Tr1W@shell.ilvokhin.com>
Date: Sat, 05 Sep 2026 22:01:59 +0200
Message-ID: <87cxur5ux4.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 04 2026 at 13:53, Dmitry Ilvokhin wrote:
> On Fri, Sep 04, 2026 at 07:21:37AM +0200, Thomas Gleixner wrote:
>> On Mon, Aug 31 2026 at 12:57, Alice Ryhl wrote:
>> > Thus, update rseq_syscall_enter_work() for sys_futex_wake() so that it
>> > does not reschedule during syscall entry. The thread will yield the CPU
>> > on the syscall exit path instead.
>> 
>> That's undermining the design and takes control away from the scheduler.
>> 
>> It granted a short extension with well defined semantics and then you
>> special case futex_wake() which can take arbitrary time to complete.
>
> Thomas, do you think the problem is worth solving, though?

Eventually :)

> Currently, it seems like the rseq time slice extension is a good fit for
> userspace spinlocks implementation, but userspace adaptive mutexes don't
> fit quite as well.

Correct. The main incentive for time slice extensions are user space
spinlocks. The DB folks wanted to have a way to disable preemption from
user space forever exactly for that problem and after twenty years of
horrible hacks we finally have something workable.

I'm not surprised that you want to exploit that for your use case, but
that's not a good fit.

> One can argue that adopting the rseq time slice extension for adaptive
> mutexes can never make things worse. The extension allows the lock to be
> released, so other threads are free to grab it. The only problem is a
> potentially delayed waiter, but this can happen now anyway, even without
> the time slice extension applied. That said, it doesn't mean we can't do
> better here.
>
> One option that I can think of is a best-effort
> rseq_slice_yield_wake(uaddr) that is allowed to fail with a userspace
> falling back to futex_wake() in case of a failure.
>
> rseq_slice_yield_wake(uaddr) could look like this:
>
> - Works only for private futexes with nr=1.
>
> - Bails out early on a contended hb->lock.
>
> - Limits the hb->chain walk time by the same time slice extension, that
>   is already set.

Once hb->lock is held preemption is disabled except for RT enabled
kernels. And no, we are not going to add a cond_resched() into that code
right at the point where we are trying to get rid of this ill defined
insanity alltogether.

> This way the scheduler is still very much in control and in case of the
> success, scheduler might pick a better task, since the waiter is now
> available to run.

That depends on your POV. The scheduler already granted some leeway and
now your special case wants some more which is pretty much guaranteed to
exceed the grant.

And special casing X is a slippery slope because everyone has an
argument why their Y and Z use cases are equally important and need an
exemption too. You can figure out where that ends up ...

The real question is whether you have exhausted all possibilities to
solve the underlying user space problem. Alice mumbled something vague
about double linked lists, but that's handwaving at best.

What is the actual problem you are trying to solve?

Thanks,

        tglx
