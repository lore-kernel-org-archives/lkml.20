Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033C74B04B3;
	Thu, 27 Aug 2026 18:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854549; cv=none; b=qT6sMCseM5ESxJ1PVvUvvWqmAW3Q9gQ6LVzq8WHi2jBHSggvt00mdGTvZyhTfoT8pcrXV1DrPwwRLy6dvIiHDC3gB+0gx5jR3USq/1pDybPwmPT/n/cwNu9qj1XI0lZSEVuvWECiGHjaxOTytcU7J/S++sKYfhg5zmbiZe4Amlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854549; c=relaxed/simple;
	bh=d8Nzyy2I97Der3EoFMZLxbko0ewXmOJjS+7fdvU06n0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U6brNnTIKObjJOLHyX6BYw1mDE6RcF4oektf/5lwCK7V7tzlAh5lQdmSZjzd/VkWguJbBZztX0n9zFdsRWN2HXf29o9twn9KYpW6A4OkqnGS3soiTG/oUy/VbK/tjnBRKB570CkYO6SJ+7hN7rksqfDIdLd70XgicVswH+RrzOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ot1PEofT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ot1PEofT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049DF1F000E9;
	Thu, 27 Aug 2026 18:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787854547;
	bh=TUBqD3KUS1xxeafm0nFuOmyQf7xCguy2c5ekRikFYNw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Ot1PEofTarR2zNlX7TNds/oHIwfqXbTeASTBNVYGmt79iG9Spm/u+6reAz7S1mD4z
	 QC5xTu9VCsYSf1d6VfsHkqRySLSVy94sDH7Pe/olFnZdowB56c5Ja0wB4FZHRawPMS
	 zLTK5YxZJsrH19iVJfx8hsyReAMZ/1mn/8uWqysSW+AOk5gDZrfjLg79scRDn1+R4u
	 yoe4w8FWhHmHmFkVJD/OvwGVFEXflgH26t56ggdOYPfhfWE3XartPEqgdhUMlcyEE1
	 e+EBe0mkaM9xCTt+brYczylbe5BZc6b30r0Qs+sjBnXMuYqhgmFGXVx0iswRZqBkjx
	 athhSHfwn2B5w==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
In-Reply-To: <apBrZuxU8bmCgG8h@tardis.local>
References: <20260804161447.84806-8-boqun@kernel.org>
 <178635226387.442315.3868294476114711805.tip-bot2@tip-bot2>
 <20260824104704.GA4121339@noisy.programming.kicks-ass.net>
 <20260824105523.GA4121620@noisy.programming.kicks-ass.net>
 <aozw_7Txxaq2qE7c@tardis.local> <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local> <87v78wezid.ffs@fw13>
 <apA4M7Asz0mV9uaw@tardis.local> <87jypbfu1t.ffs@fw13>
 <apBrZuxU8bmCgG8h@tardis.local>
Date: Thu, 27 Aug 2026 20:15:44 +0200
Message-ID: <87bjanfmzz.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 27 2026 at 09:52, Boqun Feng wrote:
> On Thu, Aug 27, 2026 at 05:43:26PM +0200, Thomas Gleixner wrote:
>> But coming back to the problem underneath. The ordering in
>> local_interrupt_disable() is simply wrong. You need to disable first and
>> then update the counter. Reverse order for enable() obviously update
>> counter and enable, which you got right.
>> 
>
> Noted, the reason that I used the current order is to optimize
> local_interrupt_disable() from re-disabling interrupt every time:
>
> 	https://lore.kernel.org/rust-for-linux/87a5eu7gvw.ffs@tglx/

Yes. I gave you the wrong order, but I expected you to actually think it
through and not blindly copy it. :)

> but looks like we cannot do it without the fixups you mention below.

But that does not mean it can't be done. Checking for 0 first and
incrementing after the actual disable is still achieving the same result
of touching the CPU only once, no?

> For now I will reverse the order and remove the additional checking in
> softirq to fix the softirq pending issue.

That "fixes" another nasty bug which was latent for weeks and people
could not get a handle on it because it was absolutely not
reproducible. Given all that I'm absolutely not convinced that there
isn't another pile of latent surprises lurking.

Aside of that I'm worried about having this new counter exposed in the
current state of affairs. Nothing prevents arbitrary code from using
hardirq_disable_count(), which is definitely faster than
irqs_disabled(), but returns a random value depending on context. That's
just another recipe for latent and hard to debug disasters to happen as
you already demonstrated in __irq_exit_rcu().

It's not the end of the world to bite the bullet and undo the whole
pile, except for the then unused expansion of preempt count, go back to
the drawing board and come up with a consistent and better overall
solution.

I know that hurts, I've been there myself more than once. But at the end
I was always happy that we decided to rip it out instead of trying to
debug and duct tape it to death.

A inconsistent and fragile facility is worse than having none.

Thanks,

        tglx







