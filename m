Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A72311C32;
	Fri,  4 Sep 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527971; cv=none; b=QSn/uEo1+94mg5k2bPDgB5RPtpx+rjnsm0735TNedXuGw6Qxcd8OfLEmdjhX0PG/Pf1fMilflWT+txXcw5QYBYj+0JsArc8sVgxBWL2kUdDkOioa32GuAsADeA9DNnYIzjrRPIu1IVew/Pm/9Eqp7+yPb5lemkqn7t6WBbttkHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527971; c=relaxed/simple;
	bh=ERtmlFfNldWKDCHcpqUAmzZhNUkascFyBVhq2MqcVGg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jU5cbLIDGPUlpfyXl3dkIlEXLU04d1iEDEszWJDXQokz7e4swXe5qeabacrFbJ0Z3zjPoX/lOdwE3sDYIscsz+uzUTIR3Vyz9jQTE9jHE+94R/gpL5rFgZq1uGmCTN67Ver5WMMygYPClIXKaI+/wWyVuAFMqt7WlvISRmoD6rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DaEhvxNM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DaEhvxNM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5351F00A3D;
	Fri,  4 Sep 2026 13:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788527967;
	bh=mHyf71aPrCScRi7F4DAtDczfyunqmlA5FcCLILeqfJA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=DaEhvxNM/PPKNWZfUgOfCLP+R9KChSExj0Uk2eki56E13IzY7IzymNGIFXOXwlBiZ
	 gFybEiO4bRmbcvi8LHtSkI+TmgBKmCTsyy4RvzwmBScLpXFuSZ8UVR6l6ygMSMwBaA
	 3V4fBcHiHD7k6dj7EwEEJBAsIwvDeaORTRJAeDSp7zmDXiDOale+GQbw3TP/QjudCR
	 Uc9IV8y4LJXbVXkEUnwY2l8/aXZl08oTK4kmxBWYLIyU33M9pk5aNchhpsoqubUr0e
	 mpgg62tDNaJGd7QPuNg65khGosm3vzbISsVgJcVlOLFK4q0oVISKh3DATmP79TDLvR
	 Ghxuu1rnAR64Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
In-Reply-To: <apbrtgkbxo69ZLJ2@tardis.local>
References: <apCS3T63WUxHd1GH@tardis.local> <87wltbdvmd.ffs@fw13>
 <87mru5et6r.ffs@fw13> <apNtQWqOgwF5_Ctq@tardis.local>
 <apRJzVbMl-hj-otX@tardis.local> <87v78rcrf9.ffs@fw13>
 <apSfObo_6Ji5HA7E@tardis.local> <87jyp6d2ut.ffs@fw13>
 <apV2iSFXlc3XY7Wk@tardis.local> <87tso9axyk.ffs@fw13>
 <apbrtgkbxo69ZLJ2@tardis.local>
Date: Fri, 04 Sep 2026 15:19:24 +0200
Message-ID: <878q5h8883.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 01 2026 at 08:13, Boqun Feng wrote:
> On Tue, Sep 01, 2026 at 03:43:47PM +0200, Thomas Gleixner wrote:
>  static __always_inline void raw_local_irq_disable(void)
>  {
> +	/*
> +	 * Assuming local_irq_{en,dis}able() always paired, then
> +	 * local_irq_disable() should not be used inside an
> +	 * local_interrupt_disable() critical section. Because the paired
> +	 * local_irq_enable() would enable the interrupt inside a
> +	 * local_interrupt_disable() critical section.
> +	 */
> +	debug_assert(!(preempt_count() & HARDIRQ_DISABLE_MASK));
>  	arch_local_irq_disable();

The problem with pure debug_assert()s is that the damage is already
done. I learned that the hard way when I was chasing the last issue in
the #UD handler of x86 that this starts to recurse up to the point where
the system falls apart.

The modified version of this debug stuff in my devel branch does actual
fixups to prevent the subsequent damage. It's a hack and I did not come
around yet to make it actually less horrible.



