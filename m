Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE77627727
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 00:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791505047; cv=none; b=aUjYInSmeIHOGRRRPmGutQHuwQoaVi/9PV5BFZRj6Dmuu1ftUimzZO8b86iP+ID92ByuWMg4n8urxg+IwmOZN7fvyLPuFqqs3OC+SVA0JeLpyqt3uGXawNq2YzjXmt9paH2YkR1daYhDyYEI824rD6+iHs5r7Ur9ZR4akWurpMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791505047; c=relaxed/simple;
	bh=7DF1lDjbWfrOee5S3DHe2H/kE7ebYAjuejxcDO7AIpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfcBq2dOGWaJ56seK6tQOOEzOJUiSjkhyDaLPz+ehtGvm1kQTd2RMZK1Kkvrqlcp+KGHBU17gjqPg3A7XGIwVWTslWYA8WNDPSpJ7KsPL2zyPBtnpu+djkBdpX1oy3pTihi5iYC/k5SPThp5XCQeNFBoC4eBmj78AKPZZsnpRrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebTesmEF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebTesmEF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB06C1F000FF;
	Fri,  9 Oct 2026 00:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791505046;
	bh=PsEz5Ly+9fZPdh+QsIdIvKEuqDf6IQ3nEj1oB5NL9kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ebTesmEFj7mS7V8iHqLshsLvOwrqfef//eKNGp4vBfFK6nWmZfIEJC0j5seAa/nk6
	 q5H0pbcag9+t7U8RDRX+GxwV2HSOi+4CKZhSwJMoE0yPvQ5SBUX13o9udbeN3Aa65L
	 KUKBP52TAsHVVQgiSsVn1AENH5wY6BAaLt6+noYBGtBV4ZWFiSAoLBK2Xw+XqdfYhV
	 KcQyHK6OLRt1aJQUjumUP8Q52A5M6pk5SHRdf3dCnswbD5M9hMH3V95nIZQ1pA5veF
	 nB2vekAGFHfQAfv2LSwtdcnch5oXXjZwb3chvdwZ16zPY73BkIbuARH+aZ+hLC3juX
	 8TMTYJxQblyng==
Date: Fri, 9 Oct 2026 07:57:26 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] clocksource/timer-riscv: use riscv_has_extension_likely
Message-ID: <asgt5ngVC6x-L0VO@xhacker>
References: <20260902040453.6258-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902040453.6258-1-jszhang@kernel.org>

On Wed, Sep 02, 2026 at 12:04:53PM +0800, Jisheng Zhang wrote:
> Instead of static branch, use riscv_has_extension_likely() to check
> whether SSTC is supported or not. For one thing, this is straight
> forward, no need to add and enable/disable a static branch during
> probe; For another, riscv_has_extension_likely() is based on
> alternative mechanism, it avoid some downsides of static branch, for
> example static branch's metadata in the __jump_table section, which is
> not discarded after ISA extensions are finalized, wastes some space.

Soft ping?

FWICT, this needs riscv arch maintainer review, then clocksource
maintainers can decide to merge it or not.

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/clocksource/timer-riscv.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index b310e6721fac..151f4f0cfd6c 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -29,12 +29,11 @@
>  #include <asm/sbi.h>
>  #include <asm/timex.h>
>  
> -static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
>  static bool riscv_timer_cannot_wake_cpu;
>  
>  static void riscv_clock_event_stop(void)
>  {
> -	if (static_branch_likely(&riscv_sstc_available)) {
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC)) {
>  		csr_write(CSR_STIMECMP, ULONG_MAX);
>  		if (IS_ENABLED(CONFIG_32BIT))
>  			csr_write(CSR_STIMECMPH, ULONG_MAX);
> @@ -48,7 +47,7 @@ static int riscv_clock_next_event(unsigned long delta,
>  {
>  	u64 next_tval = get_cycles64() + delta;
>  
> -	if (static_branch_likely(&riscv_sstc_available)) {
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC)) {
>  #if defined(CONFIG_32BIT)
>  		csr_write(CSR_STIMECMP, ULONG_MAX);
>  		csr_write(CSR_STIMECMPH, next_tval >> 32);
> @@ -112,7 +111,7 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
>  	ce->irq = riscv_clock_event_irq;
>  	if (riscv_timer_cannot_wake_cpu)
>  		ce->features |= CLOCK_EVT_FEAT_C3STOP;
> -	if (static_branch_likely(&riscv_sstc_available))
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC))
>  		ce->rating = 450;
>  	clockevents_config_and_register(ce, riscv_timebase, 100, ULONG_MAX);
>  
> @@ -186,10 +185,8 @@ static int __init riscv_timer_init_common(void)
>  		return error;
>  	}
>  
> -	if (riscv_isa_extension_available(NULL, SSTC)) {
> +	if (riscv_isa_extension_available(NULL, SSTC))
>  		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
> -		static_branch_enable(&riscv_sstc_available);
> -	}
>  
>  	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>  			 "clockevents/riscv/timer:starting",
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
