Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8655A39B943;
	Sat, 29 Aug 2026 23:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788046661; cv=none; b=fZEjpHfpa3pszjC0XpshnFOyJ9V2FrmDCikgAIzEI2eAI5ysEp/zuaMeJMwBLTIJUr8CgkxPi2Er8ykbqVUFZNIarr/FYx7m4TSe5+/jw2Su32mY1159knzFGAPrCHgrvHJCJ+tL0/GUfgGw1/r9FNodcSv2cPcB5EDybghpxAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788046661; c=relaxed/simple;
	bh=VMSxte28iAvHBxM8F9ng91v6gvPyKIamh8C1wUgvCZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHO8gsVa4YIfBdTy/cxglL2HOAlObWGML+U147LmrcGtH7M/2iyQbftfuqsqiwzwawv5M6FhUon0xAV7M+3CMr6KeyDdwUtXvq8YNPVwFyFauHLLM0VIoEwXzMrnZAXl6h5xquYBCOnl10ly/W02e4dpgJRCRc5QJ8SwJiAAA+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBb2tkyz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBb2tkyz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59161F000E9;
	Sat, 29 Aug 2026 23:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788046660;
	bh=lzybIFVXRAqG7XyNLOsS6s9K+1VvG37HGQX8SDTaTcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hBb2tkyz1RyJSjWHGEMK2+Gvij9Ipe1dZBY+6ZPOU7ji7BmpxXma4RWE7i6XCgtCA
	 ToCeNBi20xlIrKAF8FE4PmERwby7yqjcxGkeRu2h9F8CgjhUBs6SD+5Y0pP1Ef1W6I
	 CbFUH5Nzubj6HA/MoG+tHTCm1pFFoNt5ECbPbwRMG3sW8qwVaiWCTb6Yne3FG03R/H
	 gBnKlL/DdcoNuoCEwpqZGhlJ5F9NxrI4oQkyjEB35RPpUC5BS5UoHeHatsI/nKFsaR
	 cS9/3H2JS9rfGStiX8/CuH5CZveZ+ya5boUzL/vkOnA3zVcQJxSdmHZp+TWdTBX4lK
	 pA1SHorLtKBoA==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id C5634F40066;
	Sat, 29 Aug 2026 19:37:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 29 Aug 2026 19:37:38 -0400
X-ME-Sender: <xms:Qm2TauISPSLc9AkhqVjoqC955tRsOek7YQnEmfN-YJjFEfJrIqA47A>
    <xme:Qm2TaveFPbs8CJ7lKeihSE-f_FpbldFkXbwJBwdZEBIBLeXpZGoln1-8wT5Kxc0vF
    zleeEXXUbtWffqmGZEuYmZ3d5S3erkPYvTM6RMjbQCaaZR0cL9p3mM>
X-ME-Received: <xmr:Qm2Tal_DtxeyW2sv0k0nT8c8jlNkCNX7_DW8nwVZoaeha9JapHZXhrC_W9jPqOk7nXMloLtv4nZlUZG2q8of3aG7nLuKxuW4>
X-ME-Proxy-Cause: dmFkZTEFKX7Lt373C93GaKymx8gF4f3ScG8SOQGlm8LaR3ZhAjC1lbJWsV80kd4Tov2euo
    kv253IJx3yMZENzu0En4x6Dx3clHuO8qOFrvTKKO59k7aAoScqhVg6L4uGfUlNG+rdQq4L
    mAlAY74JiYsIOoSeIjG4A7piq297W/tKLi3IsWucvKOJ4fs7hKzrui3iWg4G+b96XXQwW9
    nFpBF8Q6ENz9N+5NYnnwr4QgzEzqs1KeIjMNF5hXLRNxn3lLV//dg+b4P/6tXg20TkZoiA
    joTLIJvVZ1dxtOscNcc1vzNw52HaK1iF4FUiQCVwRB6LB/6rxMSeDfKhWgLEuFh+ScbuQb
    bgUF9hGcbxYKh6idkhJcMR/FbNZtmXZVT6j8o3e99uqns63eft94xhcw3j8Ssz+Pt2Dtcc
    iXSII6g59LHFSWQuZ4Zn0wLlHbCHXoDhgmRRbDOl0k0mJhdaHTSMDKUOaf5HxzBHcHPLp5
    /ylpnyBG0As5bMuRonZldgPBfqbF1BGc4ar2pqOMXLXrbBwF6AgDoJmtDhWyZ9VRjWAp7p
    Cw82h0zaOb30F8IgyQHvmcJAdHFzuGlNkER5Jp6bIkPcotduBJK2UkUYO4A+pvOHnxjZoA
    pcCLr/iSsWc1dTBygowFldIMqOAo8qKxMu+bRZ+FxgS9e1ugUp4cd/UrvXEw
X-ME-Proxy: <xmx:Qm2TakqoiT8YgTTEkpBf29g8b7sVWl_rkof_cHMVWywUBkwGm-Ioug>
    <xmx:Qm2TaiCaDxncgfxk-XjeTtbGAjFEdJwcr1AMk-28Sd2kqLO9Jy6o8A>
    <xmx:Qm2Tauxja4T1dsz2tbo73dh240TzbIUhWhZSF1IjDqcbfBSGzZuC_A>
    <xmx:Qm2Tan1vU46B5pzlYja1pJpLmCAF2HC4m24VZxo4OWNM8D4fjv2p5A>
    <xmx:Qm2Tamw0nEshm0QefqC3xqc6E_n0WWQtlvzDkW3oWseEoDbQI3OhP6SM>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Aug 2026 19:37:38 -0400 (EDT)
Date: Sat, 29 Aug 2026 16:37:37 -0700
From: Boqun Feng <boqun@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <apNtQWqOgwF5_Ctq@tardis.local>
References: <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local>
 <87v78wezid.ffs@fw13>
 <apA4M7Asz0mV9uaw@tardis.local>
 <87jypbfu1t.ffs@fw13>
 <apBrZuxU8bmCgG8h@tardis.local>
 <87bjanfmzz.ffs@fw13>
 <apCS3T63WUxHd1GH@tardis.local>
 <87wltbdvmd.ffs@fw13>
 <87mru5et6r.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mru5et6r.ffs@fw13>

On Sat, Aug 29, 2026 at 01:11:56AM +0200, Thomas Gleixner wrote:
[...]
> +static __always_inline unsigned long __raw_local_irq_save(void)
> +{
> +	unsigned int cnt = preempt_count() & HARDIRQ_DISABLE_MASK;
> +
> +	debug_assert(cnt != HARDIRQ_DISABLE_MASK);
> +
> +	if (!cnt)
> +		arch_local_irq_disable();
> +	__preempt_count_add(HARDIRQ_DISABLE_OFFSET);
> +
> +	return cnt;
> +}
> +
> +static __always_inline void __raw_local_irq_restore(unsigned long cnt)
> +{
> +	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK) == (cnt + HARDIRQ_DISABLE_OFFSET));
> +
> +	if (!(__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET) & HARDIRQ_DISABLE_MASK))
> +		arch_local_irq_enable();
> +}

And while we are at, we can just introduce a
raw_local_irq_restore_auto() (definitely needs a better name), which
doesn't need a cnt:

static __always_inline void __raw_local_irq_restore_auto(void)
{
	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK));

	if (!(__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET) & HARDIRQ_DISABLE_MASK))
		arch_local_irq_enable();
}

And we can slowly convert irq_restore() users to use it?

Regards,
Boqun

> +
> +static __always_inline unsigned long __raw_local_save_flags(void)
> +{
> +	return preempt_count() & HARDIRQ_DISABLE_MASK;
> +}
> +
> +static __always_inline bool __raw_irqs_disabled_flags(unsigned long cnt)
> +{
> +	return !!cnt;
> +}
> +
> +static __always_inline bool raw_irqs_disabled(void)
> +{
> +	return preempt_count() & HARDIRQ_DISABLE_MASK;
> +}
> +
> +static __always_inline void raw_safe_halt(void)
> +{
> +	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET);
> +	__preempt_count_sub(HARDIRQ_DISABLE_OFFSET);
> +	arch_safe_halt();
> +}
> +
> +#else
[..]
