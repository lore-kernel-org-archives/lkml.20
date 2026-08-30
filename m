Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A586630C62D
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788124989; cv=none; b=HtFvBqpjvhCDQB3RzkRqHm51qaHgQd6Gl87lAawJ2v3Aybk8E7txebXiKgHnxkJGpBDjIFsmIaxM3tNIjwhiHTBQdKSXCjhaO0Tfk1FeUIidC4gTSwQv2RF5IHWYToySjpMxx+FPDfbuOrfxCVA6gX1AQCshyPn0f+mLTc2PNIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788124989; c=relaxed/simple;
	bh=28VtCgq71+c7mrKpRMPfDhWoUNIGGWeOVuoPzcXt56g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sI6xweS1F2DFA14zGS8VLM3TL/vVO3vtE1FWpL3iNVoILtizXLpKd1dIyqHanXbyyXMZcXjN6/mNlI9sfJPRZOrY9jMGM5sSTEJRpYQ1UpM1NEI8VILfiTq/LJtnSXGVP4S4JqJxqF1EzHlp3CKDVnkUnV/W4W1e6TLDEmKQ2/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a68jgZAr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a68jgZAr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32AB1F00A3D;
	Sun, 30 Aug 2026 21:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788124988;
	bh=hAHfxbcI5WYNxeZ7eReGH3Z2z8o9MxecCYQT6NTRHpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a68jgZAre3KMGtegFXz3I0cNc7/71VYrhLZMH9J68Ri+fGLJZOsacnottAEdqqMTw
	 dI6kfDG4z0Dz1yYLGeMzCavksnhKwbaPJeXrT0JS9CzVMounqdhj5DoREaVi2f5kM7
	 8+QNAvl1ouQtvbRun0Fw5Lj9gXf1Vr7V1J3dIVPXzARlaNZ9XLiJDjp5KqlUYW9lLt
	 AqfpmDMMo4/3MeFCPAbt7smbx90NT+ZHLsUQzycAkwIF1r3GVIFY6blvWcZ3fjDf1I
	 I4VasAl8iS505SiN3YSrbB8P5U1Uv691qGC8bhm9cRNfZhfFvIrhZagBpfrTiYYC7k
	 bHyQDABSIa6dg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id E06A5F40066;
	Sun, 30 Aug 2026 17:23:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 30 Aug 2026 17:23:06 -0400
X-ME-Sender: <xms:Op-Uao5z8cS3cf1IFJIcuWVH0evRi3dlh2j9URzohwIpYlujVQV1bw>
    <xme:Op-UajM3dVf-IYTgf76myy9DHvn6z3EzfAmFsC35HmXXBebWC2ZLXGYPa7yOnzPl8
    o0wCoDQ4AVXbaS6QZZ9d4dPFh3VisRVjPjhFIf-NZRv0zGQbEi93A>
X-ME-Received: <xmr:Op-Uaush-g_uHfh49dphH_jclolC1hsOPGPqR5hv_mb_T-lxnrCN3q5UFzM-DQb0D5CnWQnLM3dqvuIKb7xFlyEmr6Z6jUe_>
X-ME-Proxy-Cause: dmFkZTE69IWGdEcQ/TDXBT5Nq5+envGzPFlr8BbOihWf+2HmxkANtkIrbsU1ux4GKhj7H+
    QZSf0JlWG9cKhLsF63EQsnRYSVkQOeVtF85EVj4By8avITInyz0NPCL70ekfniqYQGOaxs
    i1XCyGgr4rDFzGQZAi96ubP8nxWgp2NnopUGy5P6YdxV3dCdf2J+NJO5irvw0MGBzYHXcu
    ylVf/zcSZbTxHGti1prjH4+8B7BO7OXaKPqUZaE6lO0QKGTEZl0RvwS1midcOZ/pb+/4LL
    ZVaGZgvcBrsgQp2uC6MC9wNJdQUegUuF7kxAvNzhVMty6wDk+hD/y/oGmd6F+0Ib4CGFt5
    seFuHs7zBKmnWntI2wLylaXicD8V2a3vDZYOyC/Dw8saD36egBMsH9rvggD011GWM+3Mzs
    190kPVB1Ghw/CjyzofVgjdFDu0hTQeGejgn9BzYD5QJVhh1rNoQEQvR2UymmloyhlGXad2
    g93ROVgWGw1CXmnOEiZwrxd4pLD1RHxY6GfiPL+EKtNa0JmrdOy5dF2Z9XJ5GY7booUX+4
    bBzgB2TDaQahXjJMo6F/hr2pcfp/mNElnT+6xj4xsKGP5rsyDrvi8qIclwjuKh4MH/yqFY
    OsuoZ1RvOg23v/EqNWZWQziqZfAR6EdULXgsjXCjs2C9VzcQH++LMsshoygQ
X-ME-Proxy: <xmx:Op-UauaxzSUxuNKAOlCJds6a-mi9uJpxBHVb6HnlM2aWf_SjeKAj1g>
    <xmx:Op-UaozZeWgSq85ndinTY5BE3CHNKzpn6zatLhESEg-SRRkp7yxfZg>
    <xmx:Op-UauhsM-k0mHo_Gk3eR5loTaHzNX66nfulwXnDFeIPmE6DGihx2g>
    <xmx:Op-Uasmq4f9QkyL0uIzxh69JGfUHN1cQ32L9PohEpZ2apD4kg1043Q>
    <xmx:Op-Uasi7gQBQC0Epj-0evbibqjQtLVWPb6UjuyNzvFULG-FU6zmFJczT>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Aug 2026 17:23:06 -0400 (EDT)
Date: Sun, 30 Aug 2026 14:23:05 -0700
From: Boqun Feng <boqun@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <apSfObo_6Ji5HA7E@tardis.local>
References: <apA4M7Asz0mV9uaw@tardis.local>
 <87jypbfu1t.ffs@fw13>
 <apBrZuxU8bmCgG8h@tardis.local>
 <87bjanfmzz.ffs@fw13>
 <apCS3T63WUxHd1GH@tardis.local>
 <87wltbdvmd.ffs@fw13>
 <87mru5et6r.ffs@fw13>
 <apNtQWqOgwF5_Ctq@tardis.local>
 <apRJzVbMl-hj-otX@tardis.local>
 <87v78rcrf9.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v78rcrf9.ffs@fw13>

On Sun, Aug 30, 2026 at 09:57:30PM +0200, Thomas Gleixner wrote:
> On Sun, Aug 30 2026 at 08:18, Boqun Feng wrote:
> > On Sat, Aug 29, 2026 at 04:37:37PM -0700, Boqun Feng wrote:
> >> And while we are at, we can just introduce a
> >> raw_local_irq_restore_auto() (definitely needs a better name), which
> >> doesn't need a cnt:
> >>
> >> static __always_inline void __raw_local_irq_restore_auto(void)
> >> {
> >> 	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK));
> >> 
> >> 	if (!(__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET) & HARDIRQ_DISABLE_MASK))
> >> 		arch_local_irq_enable();
> >> }
> 
> Can we just make the thing work in the first place?
>  

Yes, for sure.

> >> And we can slowly convert irq_restore() users to use it?
> 
> Somewhere down the road.
> 
> > I decided to use local_irq_resume(), not sure whether it's a good name
> > either...
> >
> > If we are OK to not fully revert on commit e901c1510e24 ("irq,spin_lock:
> > Add counted interrupt disabling/enabling"), I think the following will
> > resolve the 0day built errors on your irqflags branch (I rebased onto
> > tip/locking/urgent with rest of your series on irqflags branch). A few
> > things to notice:
> 
> The zero day failure is not due to that. It's because I reverted that
> refcounted muck as well in my git tree.
> 

Right, that's why I said "if we are OK to not fully revert commit
e901c1510e24 ...", but your movestuff.patch should works as well.

> I just rebased the series on top of tip locking/urgent, which only has
> the irq,spinlock revert and your patches on top.
> 
> > * I haven't found a way that we can do a local_irq_resume() when
> >   !CONFIG_PREEMPT_COUNT_IRQFLAGS, and if we cannot, it's going to make
> >   part of Rust code depends on CONFIG_PREEMPT_COUNT_IRQFLAGS=y
> 
> That's a good thing as it might make people actually get their act
> together. And you can work around that in interrupt_rc.h itself.
> 
> Can you please stop bouncing around like a rubber ball and take your
> time?
> 

Apologies. I was just trying to help (and explore myself) the
integration of PREEMPT_COUNT_IRQFLAGS with local_interrupt_disable(),
it's merely some food for thoughts...

> First of all I want to move interrupt_rc.h and the whole spinlock muck
> into rust/helpers/ now. Why?
> 
> Simply because it is Rust only and we don't want to expose any of this
> stuff to random driver writers. See attached patch.
> 

Sure. I will give the movestuff.patch some test.

> I've rebased my devel branch on top of tip/locking/urgent and applied
> that patch so the robots can have their field day.
> 
> The actual PREEMPT_COUNT_IRQFLAGS thing will be 7.4 material obviously
> and as this is confined to Rust then it's trivial enough to work around
> it locally without exposing more stuff. See tiny delta patch below.
> 
> So the only side effect of that is that the Rust implementation will not
> be fully integrated into the preempt count magic, but it should just
> work, no?
> 

Right, that works. It's similar to the "alternatively" approach I
mentioned here [1].

> And when an architecture supports the real thing then it gets all the
> benefits with bells and whistels.
> 
> I really want to get the PREEMPT_COUNT_IRQFLAGS design right first and
> then we can think about simplifications and cleanups and remove the
> whole Rust magic once all architectures which support Rust play along.
> 

Yeah, that's a better plan. 

[1]: https://lore.kernel.org/lkml/apCS3T63WUxHd1GH@tardis.local/

Regards,
Boqun

> Thanks,
> 
>         tglx
> 
> ---
[...]
