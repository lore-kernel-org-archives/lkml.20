Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F804EA36D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787859681; cv=none; b=u2FL+gzWh26j2L0MqMajjnjheVywphqR1RLbaWgHSHhgKWHFaLFod/ooUB2r+g99HCS0TlOy5fSPIu4g1B/iz1C5gUJrcshjUOyx98XfSWvLSQ/EVsPS6/6of+0dI5ue3hnp40WdDXxhFt8C9u1p3EW6JOtnW9XC5JjBig9hjBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787859681; c=relaxed/simple;
	bh=qKCsmepUcQICvrLUIk6ptefmteYpSRMHUGfiMPKiTzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxMLFy/ELgRV22UzVeoeoy+LzU/aHrvG8125jFVGJos84bIRZssVjUD/I118XwIL9PM7zs6fpB3NswaKGVvJ4vjsylG2IJMCr2f8gd3BqUZDTsa00LnOISj54u1vU27lo5RtMPUiHh5rTcNPNfqH9LtfXzu5pCJkRQqJL8R3YU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwBkR1iC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwBkR1iC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48ED1F00A3D;
	Thu, 27 Aug 2026 19:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787859680;
	bh=FvB4I6mF+RyD7hzkGYmZ0Fb1YVA46ddcFvzuc5hYbIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JwBkR1iCt9cvYL5slyVzpwyoKTMWYZoFLOm1K4Vyf4rLQjJa2vxRUdytglnKns3VG
	 cvzM44X3tWbxVPZNImmqsui6mm1M1V17tOb1vGhPjsKYYlhxFg/tNk2hGhU4A2VN5m
	 CKY8pKw6HctfzDL9X7kh9v+6u7iP+dM3rGxoevxCHHC6BNQZ0oXu90jvt3AgdnWRlr
	 LAwr/rJoFeldL2mQHFJYnJsGO6ch45uTkFjBXsDPgWBSe3voodpLPkixaFuWl0G1fj
	 FRydyhx4r8YRuAKymI8VbyJYXBq9/Q2cX15r83snATpIgbTBGhCtdP0OZTkl33E7ZG
	 TjZ/DaIK3e05A==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id D89D7F40066;
	Thu, 27 Aug 2026 15:41:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 27 Aug 2026 15:41:18 -0400
X-ME-Sender: <xms:3pKQavlcfghh7kaeGr5AK4bKwH9ssRxMNfSQrc6tTeWUs0wzNWOf8w>
    <xme:3pKQasK7zqyUXNufjLEwJf5noBQ5FsTIeWj7YXwgCgzItz8dHp4gN5mM9ySGPGA4H
    qND23JoHVNM0gFpxHHGCEzXVdzvrhHswefJ0TW9aVRLPgNcbkdAlaE>
X-ME-Received: <xmr:3pKQas4MBApBX3xakgehqMUv19gicjQWisFrFKSYNYEXHtkSUPuZUxTBiwxXIB50uvxu97M4Ov6TM_FE3q2EwPrlG9auN0n5>
X-ME-Proxy-Cause: dmFkZTFDgKr+s3MKuIJQqBtdMvJq3URDof8jHZTwJNGlLCGVmPkNqvytchBohmI0qYXBUL
    WCeHdI6QaRcIgORE4gW0peN2iipCA1f4i8lmSozOWA7uMQhbMwiNyANVKtvKDLQRiLxcWx
    N4vqigYqqdUOnpvJwO0MaXIFY5h4CHJUV7r0nLxMpOEfxMSAsIUPJ2uHtEoi+dRwTf9PzD
    oFpqhKauMRCo2I1oN86f3QXKVT4lwXVAf9M+uT9hwt9Vc1g60RNK/KeoQzwyfXj+j6o7/y
    m5K/pRtjcpCl/I063L6aHbRd2lh5v6PpuKrAui+uYdUCvBHqpgAy7v5TIrm0fPhb7zGuAc
    GuBQKmdI8WOvuo9pX6m3hb+oJQAKceEqu5K9fcikZf5b1+ydHqBLhB8yeXh5w6nFebbOOQ
    ZddTbaTr5HIRBByZJos6jyQ8NSh8rx3uSKu9ehs+Cv/b5zkti0C9V77LDft2GPypW3+EDt
    SW7VtJHj2MLzcCB/ZKbAblRePobq7Ue+EAe6NwQE+GlSEtaDHYM86Li805ladV511Yi32M
    EPWDTiiOyC3tx7heu1+Tp982/rR0g+mWfZUMFIdz/DEOgWcarrVVRH13X0NunWCvU/jmL0
    2Fuh171o7KxndXBptPLch/GTZkb81DyFMuD2i/IWoox1uZOTIj1bmpg73oNw
X-ME-Proxy: <xmx:3pKQao2mUugPl0l8plkY2BmkpDO9Inxz6JDf3E1YRhnFv-8lT6LdyQ>
    <xmx:3pKQaqcO2ApsJwMsBe-Wa0WIrA6qHiQkZiUpcmWMOAv_OZiM6aIbgA>
    <xmx:3pKQamdL6g0bZbTUCtsTVeM4MUEPbMF_26ROITfyeQUc1eZS5d_bOg>
    <xmx:3pKQatyAuCz4lURn9FgmVEAKTwWcQZPhDvc9gAndLWaxz_CoOY7TXw>
    <xmx:3pKQat_z0--to9Sk6GcNKoQSXzPhGcfEcozWY9bszd2XL066bUwbWNv4>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 15:41:18 -0400 (EDT)
Date: Thu, 27 Aug 2026 12:41:17 -0700
From: Boqun Feng <boqun@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <apCS3T63WUxHd1GH@tardis.local>
References: <20260824104704.GA4121339@noisy.programming.kicks-ass.net>
 <20260824105523.GA4121620@noisy.programming.kicks-ass.net>
 <aozw_7Txxaq2qE7c@tardis.local>
 <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local>
 <87v78wezid.ffs@fw13>
 <apA4M7Asz0mV9uaw@tardis.local>
 <87jypbfu1t.ffs@fw13>
 <apBrZuxU8bmCgG8h@tardis.local>
 <87bjanfmzz.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjanfmzz.ffs@fw13>

On Thu, Aug 27, 2026 at 08:15:44PM +0200, Thomas Gleixner wrote:
> On Thu, Aug 27 2026 at 09:52, Boqun Feng wrote:
> > On Thu, Aug 27, 2026 at 05:43:26PM +0200, Thomas Gleixner wrote:
> >> But coming back to the problem underneath. The ordering in
> >> local_interrupt_disable() is simply wrong. You need to disable first and
> >> then update the counter. Reverse order for enable() obviously update
> >> counter and enable, which you got right.
> >> 
> >
> > Noted, the reason that I used the current order is to optimize
> > local_interrupt_disable() from re-disabling interrupt every time:
> >
> > 	https://lore.kernel.org/rust-for-linux/87a5eu7gvw.ffs@tglx/
> 
> Yes. I gave you the wrong order, but I expected you to actually think it
> through and not blindly copy it. :)
> 

No, not blaming you :) I was just providing a bit more context.

I did think through a few parts to make it work, but TBH I lack of the
sensitivity for the impact that no interrupt happen on one CPU for a
while, so I didn't think this part very seriously. And I just liked the
idea we could skip disabling IRQ if possible.

> > but looks like we cannot do it without the fixups you mention below.
> 
> But that does not mean it can't be done. Checking for 0 first and
> incrementing after the actual disable is still achieving the same result
> of touching the CPU only once, no?
> 

Yeah, that should work. But I need to think a bit hard on this.

> > For now I will reverse the order and remove the additional checking in
> > softirq to fix the softirq pending issue.
> 
> That "fixes" another nasty bug which was latent for weeks and people
> could not get a handle on it because it was absolutely not
> reproducible. Given all that I'm absolutely not convinced that there
> isn't another pile of latent surprises lurking.
> 
> Aside of that I'm worried about having this new counter exposed in the
> current state of affairs. Nothing prevents arbitrary code from using
> hardirq_disable_count(), which is definitely faster than
> irqs_disabled(), but returns a random value depending on context. That's

Random how? Are you saying in the current (wrong) order? Because after
reversing the order, hardirq_disable_count() != 0 means the interrupt
has been disabled, no?

But I checked, actually with the reverse order, we don't need
hardirq_disable_count(), so we can remove it entirely. Will send a
follow up patch on this.

> just another recipe for latent and hard to debug disasters to happen as
> you already demonstrated in __irq_exit_rcu().
> 
> It's not the end of the world to bite the bullet and undo the whole
> pile, except for the then unused expansion of preempt count, go back to
> the drawing board and come up with a consistent and better overall
> solution.
> 
> I know that hurts, I've been there myself more than once. But at the end
> I was always happy that we decided to rip it out instead of trying to
> debug and duct tape it to death.
> 
> A inconsistent and fragile facility is worse than having none.
> 

To be honest, it doesn't hurt myself if we have to redo the work, I
would always like to do it correct. So I don't mind doing that. But it
might hurt others who want to develop real drivers with Rust because no
SpinLockIrq for them until the redo finishes. That's the major reason
that I would like to keep local_interrupt_disable() and
spin_lock_irq_disable().

(I also feel like with the order fix and hardirq_disable_count() remove,
the design is robust enough to exist and evolve, but I may miss
something subtle?)

Alternatively, we can move the current API to be Rust use only (we can
make the implementation in Rust even, if we maintain the state and
counter in Rust) in this way, there is only a limit set interactions
from the new things with the existing kernel, and Rust can always make
the guard work properly.

But honestly, it'll be just duplicating what we already have here to the
Rust side. So it's not my own desire that I want to keep the current
things in tree, it's more that I also look at this from a different
angle, and it make some sense engineer-wise: the semantics of
local_interrupt_disable() is so easy and straightforward that I feel
it's unfair to block the potential user especially when the users can
guarantee the correct usages with the type system. 

Anyway, that's just my two cents.

Regards,
Boqun

> Thanks,
> 
>         tglx
> 
> 
> 
> 
> 
> 
> 
