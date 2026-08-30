Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFF230D413;
	Sun, 30 Aug 2026 21:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788126180; cv=none; b=qcxknd7VsK0KpqgZwh2FPfc9R7Cq5eM46jNpBdYsbG+lKJoijAdmfwJaiNzERzTR98fphfSyMloSbY5cvh31bQzwOZQskQJDVdOHyG70qFJhqOjcnoUR0jd6wnqu2wpzOc7RptwSRAk2e8FAWou4GWv8WdwfKVvGcFhNa5t/bcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788126180; c=relaxed/simple;
	bh=hRaS26i16WruZeTyJBkperl3nnm7i04AtZE14un5/RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6KKozQ5wgBQKP9PH2WKPFyMxNu2cu4rBtv2e3BTjC3mPkFHG+DsQeuw655ACOXAECq9mRNp354qaDAvkZS9DDq0SdrJBoq4iZg86kfcRV6nhGHtLSXnVxX2K4Dls0Wfmc1kyEoP6LSbpckPuxwDY4hXX7SV5XXTZ8rV7NIMhKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTa1GpUw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTa1GpUw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7341F000E9;
	Sun, 30 Aug 2026 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788126179;
	bh=dl8bFNwxfrnmLey0gdbMgY5Jc1s9X0PzKRdnrT0qdig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FTa1GpUwnPkdlUoxtpcQLBHpDYGwR85eJvVImC8Yo7nvVPQykFj1ues2UzfZAcTU9
	 wRWkcP4VezsqNRJO/I7Zpkar83+5ulhyMspf1Rtm/QbSQVnOY9qmtJ25fUHsvcbj63
	 aBAhlEN9wh/M4bew6asPZmimjVhJK+YgAa2F+W1Sk6whAd7rI/cAXqC5YYuLt1XHqz
	 kkbDF/UacqqskIGqQ0ZgdPXSEeF7o+SNx+Wk5ajilpFo/MxpergOoH5pnNMy5OZyzh
	 pY6sYuqHHod06zAZwXzglaCcqJAkY4QRbaiEJnAF+yXD74hRfr5C4F0DYrEhytxs87
	 L2KoBjsvrJxlQ==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 87B8DF40066;
	Sun, 30 Aug 2026 17:42:57 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 30 Aug 2026 17:42:57 -0400
X-ME-Sender: <xms:4aOUatjFaCs4aQTW68l5h3m9RevMtaxnErixRuqyTOJs7W0IpdXxPQ>
    <xme:4aOUarW8aTRDDmeKneVLVyYqaBoj1PYr8KIQDsWUs8kEOWa7RPt5Ly_AB6CP7CqMW
    r8IIeWU3OsEvZ3KmEDsFOAYyhrrLgR6ZIhJgixaO3xsLdm4_1ILEg>
X-ME-Received: <xmr:4aOUakXG4aP-KBnTbSzbln5nWXSfIKv5VgZi4fq71BP5rZnoghuMBf7rSQ33w0_eONSbEbPXY8FXpAUxtZ8qJvdYGH1TXVtz>
X-ME-Proxy-Cause: dmFkZTFilbYHy/sRaYQ3CxEXgbUJJ2IXxQLgnN127OkkmG9Fo2vXGxPTVWwsO0RQAgtEYR
    v4U0VHTz2hk++d9EKxqAY7xMaQN292py3k/SVA7ygG7bj4zgKQ/+OMl97LNwaG3FiYh5RM
    SZr7pjN5dqYwc4z5C5bMGSMOv4K1ydcDk8Y58q4S6TKIjbts2dv4uTpKqzw9YUIBkJYX9D
    ZXakwACnG92Qlg/vshMP18ZfewH5iNHvfPEPSJwa9FGe1SoUbbae5Z1rNYXCKngB+gKE18
    +9znkPYhM5bGcFtl0e354kim9OWEpBip8MuUHhW2eE5j7IeoRLv1t9Ei9QwPSc4TsX7lYJ
    O23difZe769PuSRPquKSmu+3a4d/pg5OMJwMhCQ8H46OoSiz9PqeS4CEcg2fcsqbWXdd8G
    F9gSx6nQFoNdc+/rICJI7mdrHUNhbEdv3OZb78Nbs5Bsmgl4KxC7cpdmruVZp3D4QaNSOT
    HhErO0TW0DVql6HCHNEtgALIqva3STiX9O4QoGlGmtQH1rlL4SGZ8OTdZ0k0UexlISjcBl
    lzEipxrb0b0ZKa6kTUASb0soksxBWK+EsCBFAaGf99PxeUwd6ORhO3iJP26ao+BqCDuapt
    HtiKTn8JoNoKvM5ObveObq3iUkRZq8Y1PrmbDtrSaXteli34KcLFjT9mrXBg
X-ME-Proxy: <xmx:4aOUajiID8yBTv83xpp8x0N2WPy47MNKoKKyyRlEuP1QF9-4_Ym-Bw>
    <xmx:4aOUanbGpwijOonQ6kUZeAfVTpW4tHa6bkMtSMTeVTPwGqCSTsOuKQ>
    <xmx:4aOUaoqIU7POb873oDIfV3e66IbIA_j2Vc5qvAPyAF8cECPNmHw9bg>
    <xmx:4aOUasP6uN2K07Or-ILxzgBqNrrkuBSlI0G6TXUaPzWb6G_LRsENCg>
    <xmx:4aOUajplgW3-h2HgGO9plVZgwCYEH2cOTMIGbJY_4-deP8kYTkVWsEhn>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Aug 2026 17:42:57 -0400 (EDT)
Date: Sun, 30 Aug 2026 14:42:56 -0700
From: Boqun Feng <boqun@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <apSj4HWWyUxJ1btY@tardis.local>
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
[...]
> +
> +#ifdef CONFIG_RT

0 day probably will find it, but FWIW this one should be
CONFIG_PREEMPT_RT.

Regards,
Boqun

> +static __always_inline void spin_lock_irq_disable(spinlock_t *lock)
> +	__acquires(lock)
> +{
> +	rt_spin_lock(lock);
> +}
> +
> +static __always_inline void spin_unlock_irq_enable(spinlock_t *lock)
> +	__releases(lock)
> +{
> +	rt_spin_unlock(lock);
> +}
> +
> +static __always_inline int spin_trylock_irq_disable(spinlock_t *lock)
> +	__cond_acquires(true, lock)
> +{
> +	return rt_spin_trylock(lock);
> +}
> +
> +#else  /* CONFIG_RT */
> +
[...]
