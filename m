Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F4F255E43
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115821; cv=none; b=ViiVWR11woKTnY8wq7LM32pLwe5TOPVxjoeNW6k/ka7NpWAdWf1pwnLDWH7CFXSYZnxapwqTaAOdbOEVamszEgrva43AxoaiMtoMQi+9DfabO3EwSyhg5jnEYQZdrnIiIXH+6js78PSF36KFTqFVQ8BYtxVv4l+AHvhyAOSWWyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115821; c=relaxed/simple;
	bh=DA+3gD/EgaudwnRDAmtqhGhActCurrrnWURk65lFTBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtOrYcAVLad2NTNVTb6eXdxZZtpKNCsfn8h/Pbcvx9NqGy/Y4FWjR/NTRIxzHjSCG3uON9+aBNgrrZ8BnmXHHsBZIi/zVjWc8YSgayL+s/NBnrIdlmw8tHg3i8piap6CfaA6fQiK8GcRPRYRV+stGZ5OMh54uvhB8YuIbrEEnoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UAYm+fhg; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UAYm+fhg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=G6anvPs5DOeIyZ7CNdZO5Ufd3bmBHlvjXjSwjIWucNE=; b=UAYm+fhgyMWb2QXtwlnjgFSd7E
	Len0QGGvutx+lcCKipZv4vB2cLVp+loB96UvuimfjWL2OVrzMr37cR2SpSOf6BuXahxuNxhGPGdlp
	9jcdscwsr3+S8F/UAtpMLXqeWsTyXA9646zrBG7pQ557JqNG98xPDoAPcxdsw+IJvUGsGzG1CIfrT
	Sma4Z7NuOp4DidkdQgcJf/ncKuumjoFRzGRZ1LMIMvV7TPt91YfK1c93hrbB1lNBLK2uvjn33gsL2
	A23QjALN7CfHe+vkjvZ1V645yrCB+Ihuq5ThHvMMoQhu5sTaKFjS7Tr5g+UvvzP7goEz/PSXwi0Qs
	8DQOkBsQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wkS-0000000A703-3wUA;
	Fri, 11 Sep 2026 08:36:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 70D0E30056B; Fri, 11 Sep 2026 10:36:39 +0200 (CEST)
Date: Fri, 11 Sep 2026 10:36:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jann Horn <jannh@google.com>
Cc: Hyunwoo Kim <imv4bel@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	kernel list <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] futex: scheduling-while-atomic because nested vfork can
 break guard(private_hash)
Message-ID: <20260911083639.GX776954@noisy.programming.kicks-ass.net>
References: <CAG48ez26PrUOb8er9TP1gWLsqVLU8TEDr+1Zs25fgH0++=zhUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG48ez26PrUOb8er9TP1gWLsqVLU8TEDr+1Zs25fgH0++=zhUQ@mail.gmail.com>

On Thu, Sep 10, 2026 at 05:27:54PM +0200, Jann Horn wrote:
> Introduction
> ============
> The futex private hash implementation was written with the assumption
> that any MM used by more than one running task either has a private
> hash or has irrevocably opted out of having a private hash; but this
> isn't actually the case.
> 
> Commit ee9dce44362b ("futex: Drop CLONE_THREAD requirement for private
> default hash alloc") tried to fix cases where processes can share an
> MM without triggering private hash allocation, but overlooked that
> nested vfork can also result in concurrently running processes sharing
> an MM. After that was discovered, commit bde023808364 ("futex: Fix
> race on the initial mm->futex.phash.ref allocation") instead changed
> futex_hash_allocate() to not rely on this assumption anymore; but
> other places in the futex code still make this assumption.
> 
> Issue description
> ============
> exit_pi_state_list() contains this code to handle waiters on PI
> futexes held by the current task, which is exiting or going through
> execve:
> ```

What's with the markdown tags? The email is text/plain, so plain it
should be.

>  /*
> * Ensure the hash remains stable (no resize) during the while loop
> * below. The hb pointer is acquired under the pi_lock so we can't block
> * on the mutex.
> */
> [...]
> guard(private_hash)(current->mm);
> [...]
> raw_spin_lock_irq(&curr->pi_lock);
> while (!list_empty(head)) {
>   [...]
>   if (1) {
>     CLASS(hbr, hbr)(&key);
> ```
> 
> CLASS(hbr, hbr)(&key) calls futex_hash(), which (if the MM is in the
> middle of switching between two futex_private_hash instances) can call
> futex_pivot_hash(), which can block on scoped_guard(mutex,
> &mm->futex.phash.lock). guard(private_hash) is supposed to have taken
> a reference on the futex_private_hash, which would prevent switching
> to another futex_private_hash instance; but guard(private_hash) will
> have been a no-op if the MM didn't have a futex_private_hash yet at
> that time.

*groan*.

> So it is possible to race as follows:
> 
> First, use nested vfork to create three processes P1, P2, and P3 that
> share one MM and can run concurrently. That can be done like this:
> 
>  - P1 vforks to create P2'
>  - P2' vforks to create P2
>  - P2 sends SIGKILL to P2' to unblock P1
>  - P1 vforks to create P3'
>  - P3' vforks to create P3
>  - P3 sends SIGKILL to P3' to unblock P1
> 
> Then race like this (view this in monospace):

What a crazy ass world we live in that this has to be stated :-( Of
course you should view text/plain in monospace, anything else would be
absolutely insane. (And yes, I know outlook exists, but people using
that deserve all the pain that piece of shit gets them.)

> Impact, related issues
> ==========
> futex_wait_multiple_setup() follows the same pattern of using
> guard(private_hash)(current->mm) to ensure that a later CLASS(hbr,
> hbr)(&q->key) won't sleep and is probably affected by the same issue.
> 
> __futex_unlock_pi() and requeue_pi_wake_futex() also use
> futex_private_hash(), but there the race seems benign.
> 
> This issue also means that different futex users could disagree about
> the hash bucket that a private futex belongs in (older futex_hash()
> calls returning a pointer into the global hash, newer futex_hash()
> calls returning a pointer into the private hash).

Right, that transition is not supposed to be possible. Notably a single
thread cannot have (private) futex waiters, and we allocate the private
hash on cloning the second thread.

> Sidenote
> ========
> Maybe we should block CLONE_VFORK when current->vfork_done!=NULL ? It
> is clearly bad to allow nested vfork() such that a SIGKILL can cause
> two threads to run concurrently on the same userspace stack.
> 
> But I'm not sure if that's a good fix for these futex issues - a fix
> that doesn't rely on such distant assumptions might be nicer...

So need_futex_hash_allocate_default() is explicitly excluding vfork from
causing a private hash to be allocated. Perhaps we should fix that.

I need more thinking (and wake-up juice) to see if that might perhaps
bring other problems with it.

> Reproducer
> ==========
> Tested at mainline commit 50d05c7c76c96b90462f24debacca971d2e86713,

Thanks, I'll go poke at this a bit.
