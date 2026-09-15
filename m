Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22C1480979
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470384; cv=none; b=VouMsmdKgZO7Jp2xL7znoMqOK2vaYw990SpujQHennruSD8raUa9/D5ySl5sEwRiXb9hSqh+qpMvPH4Mrhabyii2ulwDEcdCNLtzp4fGLof+lQvRsO4XPY7lW5HJHq/fS79LDkA9W6fdVHgIClXt92Zb0Brs5cDLCZNTcMF50t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470384; c=relaxed/simple;
	bh=SwGT1ue3NrclFz32IMmz/0KP1N54e49zdf/kxMLrg14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i75ha6e4kZZyf6tBWF3nSj+bTWwM0v9VIKZQhG0sh6/q8CRqM3yvNI5KxMS1SwU9ZnLLpXAw3G/CLgRdhJEDwazLbc/PwOQKgyz8PAbCf40CX0h2p95zZrjDcYCehoGh1ya/XSBkJf8wVAxGA7N/kje9xzps2tMUMmUnKhAcm0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=b842Xixv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Osh64gYf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="b842Xixv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Osh64gYf"
Date: Tue, 15 Sep 2026 13:06:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789470380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GgvYPDERGUDDD187+s+8fLXpvXru4u0gVBJ4Z7ZGolg=;
	b=b842XixvxZd98TFOLVfl+ZDH4+riR5CQcPMdYTYd9QBbPA4xxEh6NLGQzG8bTKnVh9wi/w
	VO2EKMH9VipabiGkG3bdpYuOlgLhszac49b0R+K2s0CsCfiFbYPPbDdidbT4TbWT6O0aEt
	M/My6v+DVqd6yoPsoI/C4vVuBbIy0MwniK690amNXBZ38ilyBrTP+EKUWyWEsoD23FgfII
	lY8wTQ/h2HO/EkSXxPd4nioXafxVQ7FpEVTMJDke2Th4+GfKQFCnuP4A3t2Bu8YVtPlH+x
	qzEk4se3wFSKb65jwzljMK2K7DHCAi5hyeGjLuA+j7rDbfx6ypGVm8M11YnvZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789470380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GgvYPDERGUDDD187+s+8fLXpvXru4u0gVBJ4Z7ZGolg=;
	b=Osh64gYfnu897wmyg8UiQnTNKrjRJt/FlB863OrDSC/7XosqS+XQu3Y+j0thYOXMOpkIm4
	feu9fV1d9Jn2GeCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jann Horn <jannh@google.com>, Hyunwoo Kim <imv4bel@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	kernel list <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] futex: scheduling-while-atomic because nested vfork can
 break guard(private_hash)
Message-ID: <20260915110619.Zp_jM61a@linutronix.de>
References: <CAG48ez26PrUOb8er9TP1gWLsqVLU8TEDr+1Zs25fgH0++=zhUQ@mail.gmail.com>
 <20260911083639.GX776954@noisy.programming.kicks-ass.net>
 <20260911090447.GT788244@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911090447.GT788244@noisy.programming.kicks-ass.net>

On 2026-09-11 11:04:47 [+0200], Peter Zijlstra wrote:
> So I can confirm that the below does in fact cure your testcase.
> 
> Per commit: ee9dce44362b ("futex: Drop CLONE_THREAD requirement for private default hash alloc")
> the reason for excluding vfork() was performance and thinking this
> would/could not matter, which you've proven to be clearly false.
> 
> Thomas?

in v2 I moved everything struct signal because the private hash should
live there as per review. This explains the original check in
need_futex_hash_allocate_default(). In v3 I moved to mm while the check
remained unchanged.

The mm is cloned on CLONE_VM. Kernel threads don't get a private hash
due to mm == NULL check in futex_hash_allocate_default() which was added
in v4 with auto-resize.

To get the whole magic to work, we need to create the private hash once
the first "parallel" user is created, the first thread.
Skipping it for CLONE_VFORK violates this. I don't see why we shouldn't
do what you just suggested.

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

Sebastian
