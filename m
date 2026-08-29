Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E76F3932CE
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 20:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788036816; cv=none; b=D6X1tNSqGYe0aEsGi81q0Hh/t3ezTv/sEi9ZBinWF2r6JE1JF8DukTSuLFI+73tDJuMj2n4ytEXbvEnbF8xMGnP3XaDiUzbHuk3cc6QtoVBTZhn0gAzaCHc58JkoZ0vokMucy8U1OQuWz5vQs3rOeqwjhkeJAsWUnxehPQfCM0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788036816; c=relaxed/simple;
	bh=A9D+8n2wSvZWkdgdIzqmxJ5mVtzv48dgO2crqCEMWXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCGD9+Bupt/7s/duku0h25hM5xEpdTmUlPR9tHkIctJVh3DlzqCbJVKcRaqsHCL9oDPxLS2ktbkPUejddQyIlO/C9l8czwWKN+/vgubt4nDXBHhppr1r6MFCRAEAetlh2aE1IeFB0DEdSp//WsPKgozbBavothFeLzc8BC0MNsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cyw2NlPh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cyw2NlPh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80AB41F000E9;
	Sat, 29 Aug 2026 20:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788036814;
	bh=i6jukObQnimbJhbeMBWRgtlsB1KjlPFJDAuqFd8FDi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cyw2NlPhr46NtsW50ZN4TK/+pOS8EG+/z08tUGG/NQfaj87ptXIdVVGa//c+rqZRY
	 f4Y/198e/buAfPGZLN+dU95FNzlYv+LQT1ZwCnsnmQGUn914meRBZqHkvmlj4x4nl5
	 cIOlxztn7h5frWDDNI/M6F6NEkwJDJg2DQB/FjQ3KwQFYEZ6j4FeLFOKuRkdMuQXUk
	 eswXHUVWYKDrqGV/kDAOq+DnQyLKKpkxqG6kUo3wNAqqT1jm0/z6i0vFS8/JqMCYbw
	 bM9pMykCowbn6edK82fYXbjAg5wSxw6d81sz6e+jOgyJ9P5asigbJEUnC4KiQPcZJq
	 l3j/ehWGgjdVg==
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8871BF40066;
	Sat, 29 Aug 2026 16:53:33 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sat, 29 Aug 2026 16:53:33 -0400
X-ME-Sender: <xms:zUaTak7urD-95HqGmHWrsSYfLbGhoKEHdrgbx2x4hEmubl15GdXFvA>
    <xme:zUaTampaGTXyluaxXKIZ23Knec4wWcGxevbf6IlHEj2h-P9OffBWU1Pcu8vbSvnJ9
    lPlmNwpl2zrJWc5xigY8wss4cpTuMXFLnxIt586kVhq2h7dAt3UNyA>
X-ME-Received: <xmr:zUaTavnZ7jdmnj2fKSWSoW84KXqhFvlLvrWdhQp3Otbmsy-6gbt7opvXzGwxF6ZtvC5IcWnbmLpSVZyS4q2EUVJMznQf36rx>
X-ME-Proxy-Cause: dmFkZTENsWyzDONZZ4HqyTKJhM5ddpCciJWaV4KIL57+KXHWcVeWtUdwvphg7OFLVcREcR
    kmsJpTmGa0G43bpN0UMhPrd85oA2vWz9R94BtLLv8mCaY5GzMW9EIWAdQZX19W1SkTwLV0
    R5H0IsWn5R3j10nMteezL6KvSgIwHjUaLgcSuHmtXyGh12NPu2BOKlhN31kOG/+Y2Ks0jr
    dV5IjzKN7VrWm/dHV3lBQN7YuY9ZEHZDLnsroB46EQbOFOOzTLpAAINRnpB8oBtev0Bgt7
    hH+NCFZhFqtmmH+AwKEs8bc+2+F/+SfkhuH70s+U/N4ucELyfyb0gBO0xhxtwEWAFDY0P2
    ATiNpxok4n2XRaJE14TE6dzh/5JL21cVQnb1mapK442/KBgNGsQ0KhY8RCHYtK8YkHZ3/j
    EucNR4OPOsJhCduu+B9apJCm5pChko0NjnQQ47YlbaeunWkoh4YUFLSGlCE8EwKD3buVNT
    diYRQ5fFDaPmYTA+4LVWLimH5CaUYi0fQMVoF0DZIy9qc1IscV6Vey+ZGrkf6nZ7u+ML8h
    fiithBFxLA+6hL2f6jpxk1Gi4PWBZ82CnP88FZo/B6ggZLJn5J5H+IchqwnYZHO7FONhf9
    8szTyfFhpVNg8n9u3E8BnNi+1ITIMqTHOs3wSE9NwfutI72WA/3eebiUtPgA
X-ME-Proxy: <xmx:zUaTaqP7HFaONclwAvrxru0W3_c-APFmC7MIhk_09Ip6CTTe_AcQJQ>
    <xmx:zUaTarOafQcu-M0Ir6Vk9_en5Unv5gU2Badl02JRlkRYi6UJZivjnw>
    <xmx:zUaTajiMv8tZxdiXQO_ithZcuZ74RLL9SgJwNPGsHP7bZBItKk7hZw>
    <xmx:zUaTagty2Dr8V_-5WboQQlWmoQC6sZecBprpI6DfJ9ojYQqs_8upOw>
    <xmx:zUaTahRFd3j2s-hx_r_rPi636fATFtfFv2m6wuk-gnWa3z8wYDhY3iK4>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Aug 2026 16:53:33 -0400 (EDT)
Date: Sat, 29 Aug 2026 13:53:32 -0700
From: Boqun Feng <boqun@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <apNGzN20zR2mhG3M@tardis.local>
References: <87v78wezid.ffs@fw13>
 <apA4M7Asz0mV9uaw@tardis.local>
 <87jypbfu1t.ffs@fw13>
 <apBrZuxU8bmCgG8h@tardis.local>
 <87bjanfmzz.ffs@fw13>
 <apCS3T63WUxHd1GH@tardis.local>
 <87wltbdvmd.ffs@fw13>
 <87mru5et6r.ffs@fw13>
 <apIrwRYJbPpmjrNo@tardis.local>
 <87h5kcejwz.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5kcejwz.ffs@fw13>

On Sat, Aug 29, 2026 at 10:44:28PM +0200, Thomas Gleixner wrote:
> On Fri, Aug 28 2026 at 17:45, Boqun Feng wrote:
> > On Sat, Aug 29, 2026 at 01:11:56AM +0200, Thomas Gleixner wrote:
> >> +static __always_inline void __raw_local_irq_restore(unsigned long cnt)
> >> +{
> >> +	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK) == (cnt + HARDIRQ_DISABLE_OFFSET));
> >> +
> >> +	if (!(__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET) & HARDIRQ_DISABLE_MASK))
> >> +		arch_local_irq_enable();
> >> +}
> >> +
> >
> > So we can change the semantics of local_irq_disable(),
> > local_irq_enable(), local_irq_save()  and local_irq_restore()? Nice!
> > local_irq_{en,dis}able() are no longer idempotent, and
> > local_irq_{save,restore}() have to pair with each other or a
> > local_irq_{en,dis}able(). This would make things much easier. And TBH, I
> > never think this is an option because there could be so much code not
> > obeying this (at least not on day 1). Now I see your point on getting
> > the design correct at the first place :D
> 
> Compared to the insanities I had to handle almost 20 years ago when I
> tried that this has become much easier because lockdep and RT made quite
> some of the nastier lock/local_irq games go away.
> 
> There are probably a few other places in cpu idle drivers or in dark
> half maintained driver implementations which might need some care, but I
> expect the overall fallout to be managable. The debug mechanisms should
> help to identify them quickly.
> 

Yeah, that's something I was missing, I was too afraid to change API
semantics, but with reasonable debug mechanisms, at least users would
have a pointer to resolve the use case issues. Lesson learned.

I will fix the Rust's side compile error.

Regards,
Boqun
