Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2815343DEB3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789127497; cv=none; b=nU/C0PDr1FNvcHn9RNhrephGPzAXhp6D/+b9vfBmfoJjUnAAs1d/zwWnGcBUozCv5ef6P0BohOQWkUCGJ8BGUWW/CUFqiBCOJcF4AYNVKHTfLqoGD5ZBfdZfJ071MKngEnDGEjcP+n578XZWC4nB8todXjDheBlNN/CTFpFuiMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789127497; c=relaxed/simple;
	bh=9IqRT60jBVXLPdZrqYgjVH864UWChssqNmCeM5UsLUc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TykU3YAnszTY9aLKAjuy5Fm3JDLecPplICxjvw6hNqhCv7TDCHPR5CYPoA00C5OC52VBVlt2QVpLdvngNVNi5sRLGlY9zX3/4bvi6Ggp5IoteDOiXDYs0AlRXs30eXvo8vLwTeXoBittjR5sDYir3LsnU7nT4tClFD01bhnTuzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KK0ilf4P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KK0ilf4P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21441F000FF;
	Fri, 11 Sep 2026 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789127495;
	bh=4BxdVzCK83ImwMfYLdfkCj73ahgWXEkngKzclUXueHU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=KK0ilf4P1qJBHnt3rHM9WDWmDHC7E1KJ5IIXdRwCgUpOINK0Q0utHDHk/t7GvNvIv
	 JXAkdC9V8B6IBrXijNSuaxDxWtbJ1x8RSffsFS8lpMAUfIQ8ubEmwydn7wEMcjU6rA
	 opJaXKUJ0l6NFl8byrXqFGbUaoX+raajkbehT2xGUTcmgTWt5Vs1lX6Q8YLkRrjFvp
	 +8iWiJYluLuMg13zf+gQakuF3EZ10wIj+szyx6YYQ9zMTJdmiwlre29dcmA2h+1dSg
	 o0llrFVgewr0tNANCTbxrDyVAP51o10Uo1ZaoMxS1YRCeSmULLAnwRvlB8YQ6jM9ma
	 aDdi+UkBdHI1A==
From: Thomas Gleixner <tglx@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>
Cc: Hyunwoo Kim <imv4bel@gmail.com>, Ingo Molnar <mingo@redhat.com>, Darren
 Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?utf-8?Q?Andr=C3=A9?=
 Almeida <andrealmeid@igalia.com>, kernel list
 <linux-kernel@vger.kernel.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: [BUG] futex: scheduling-while-atomic because nested vfork can
 break guard(private_hash)
In-Reply-To: <20260911090447.GT788244@noisy.programming.kicks-ass.net>
References: <CAG48ez26PrUOb8er9TP1gWLsqVLU8TEDr+1Zs25fgH0++=zhUQ@mail.gmail.com>
 <20260911083639.GX776954@noisy.programming.kicks-ass.net>
 <20260911090447.GT788244@noisy.programming.kicks-ass.net>
Date: Fri, 11 Sep 2026 13:51:32 +0200
Message-ID: <87cxukypiz.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 11 2026 at 11:04, Peter Zijlstra wrote:

CC: +bigeasy

> On Fri, Sep 11, 2026 at 10:36:39AM +0200, Peter Zijlstra wrote:
>> On Thu, Sep 10, 2026 at 05:27:54PM +0200, Jann Horn wrote:
>
>> > Impact, related issues
>> > ==========
>> > futex_wait_multiple_setup() follows the same pattern of using
>> > guard(private_hash)(current->mm) to ensure that a later CLASS(hbr,
>> > hbr)(&q->key) won't sleep and is probably affected by the same issue.
>> > 
>> > __futex_unlock_pi() and requeue_pi_wake_futex() also use
>> > futex_private_hash(), but there the race seems benign.
>> > 
>> > This issue also means that different futex users could disagree about
>> > the hash bucket that a private futex belongs in (older futex_hash()
>> > calls returning a pointer into the global hash, newer futex_hash()
>> > calls returning a pointer into the private hash).
>> 
>> Right, that transition is not supposed to be possible. Notably a single
>> thread cannot have (private) futex waiters, and we allocate the private
>> hash on cloning the second thread.
>> 
>> > Sidenote
>> > ========
>> > Maybe we should block CLONE_VFORK when current->vfork_done!=NULL ? It
>> > is clearly bad to allow nested vfork() such that a SIGKILL can cause
>> > two threads to run concurrently on the same userspace stack.
>> > 
>> > But I'm not sure if that's a good fix for these futex issues - a fix
>> > that doesn't rely on such distant assumptions might be nicer...
>> 
>> So need_futex_hash_allocate_default() is explicitly excluding vfork from
>> causing a private hash to be allocated. Perhaps we should fix that.
>> 
>> I need more thinking (and wake-up juice) to see if that might perhaps
>> bring other problems with it.
>
> So I can confirm that the below does in fact cure your testcase.
>
> Per commit: ee9dce44362b ("futex: Drop CLONE_THREAD requirement for private default hash alloc")
> the reason for excluding vfork() was performance and thinking this
> would/could not matter, which you've proven to be clearly false.
>
> Thomas?

I don't remember why we excluded VFORK in the first place. Sebastian?

> ---
>  kernel/fork.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 416758c8a3d4..bc32ea19099e 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1996,9 +1996,9 @@ static bool need_futex_hash_allocate_default(u64 clone_flags)
>  {
>  	/*
>  	 * Allocate a default futex hash for any sibling that will
> -	 * share the parent's mm, except vfork.
> +	 * share the parent's mm.
>  	 */
> -	return (clone_flags & (CLONE_VM | CLONE_VFORK)) == CLONE_VM;
> +	return clone_flags & CLONE_VM;
>  }
>  
>  /*
