Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794170512;
	b=qHs031KpvX9/TxSjNcSbivbcsXyQrIGUVGO/Qptp41AvMdaMHaQm0lju0Ka0w8rpzgej
	 lJUflKBx0bmRaKoFfmtV+5W12O8sYgwbvxLPsIAMCbsEL/2E5UvnFaQK1iVtut0arG/EK
	 7urFtuRhCmjxjxGVHKJfrDFGZmDye1bNVbu0+mwi/p2lbw5fHLyuhk2PBZg49yXhXMpNn
	 l4MS1YEM+oY2jgjAIWBVpca3srHtA8ksIf7cg/FECunWpdWubwu4ldeBthxsjhhHMPBfC
	 9OMhbG7IffHqCaEfePFYpL0zKfBh4sIXQ4wd8vvbJz4ElpX06ep7MYwJqT3qut4ShzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794170512;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=R26dJdkZH8TRIIct3eE1kDQoBO795NGFDunxp3krIBs=;
	b=e7Rs9FhoylLwUgRtIJ84FDzujxMB/2+4xV7IHa6ceaCU2Gq/4723iQf8IJcrGA6Gb7y5
	 QhQTCy073WSga311Mig3wa57axYMJQ4W+mlIoG1r+JMfQYOQs6qRQ67iSuwhDQxW9W+7J
	 ZXt7ZO+7ZpA87ETaD8HNS9lwwnrfm4FA/jsCA9c4oizxSmMlzMsp+kcYnQzZTFzxf1g4M
	 P1IOtLmBpM/H+1zKxRGvUoVHzGJAx451tbvakx2r0nDWeHYJjru4EdFDKvRHO3c7RntTa
	 IDtpjRKGRy2MAU86emW66p+DcG5kHiHBM+b4BaqU8eSh8PF1Uc0fUhxEoadWSY7Eidw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WajNyqCH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1650606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WajNyqCH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67BF1F0089F;
	Sun,  8 Nov 2026 20:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794170511;
	bh=R26dJdkZH8TRIIct3eE1kDQoBO795NGFDunxp3krIBs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WajNyqCHUgapwJqBmikLkfTuDn5xJWaP8H2ac9Nfj4A2HV9jJEtp4+yH1KGz9b1w6
	 0WtGFjSIMqlsbzKpioFisImukMI9hiON8l8wx0289DEAFOrrRoIPsWaZezMGU4moVT
	 B0hg2JkzPXgWie9fDrlKJOJ8tCJtGTwkHQHpRdPo6upWxGFlA6hBnc200oPPmGWDhi
	 0Z/qnTLcAuYfsvFMmd6pkQ9XI307IHCxxkXXmi2yASEg5ct1foLKaS5W29lIddEhpl
	 vOk1JCrpvArMv+4s6WO4yzUbT2uhzWe74uNQivzEd49sN1rUYIQE/nVX0zkLyqENCx
	 9iddjrZaHFcCA==
From: Thomas Gleixner <tglx@kernel.org>
To: Rosen Penev <rosenp@gmail.com>, linux-kernel@vger.kernel.org
Cc: Radu Rendec <radu@rendec.net>
Subject: Re: [PATCH] irqchip/ath79-cpu: Flush every write buffer of a shared
 interrupt
In-Reply-To: <20261106221201.15054-1-rosenp@gmail.com>
References: <20261106221201.15054-1-rosenp@gmail.com>
Date: Sun, 08 Nov 2026 21:41:47 +0100
Message-ID: <874idrvywk.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Nov 06 2026 at 14:12, Rosen Penev wrote:
>  
> -static unsigned irq_wb_chan[8] = {
> -	-1, -1, -1, -1, -1, -1, -1, -1,
> -};
> +static u32 irq_wb_chans[8];
>  
>  asmlinkage void plat_irq_dispatch(void)
>  {
> -	unsigned long pending;
> -	int irq;
> +	unsigned long pending, chans;
> +	int irq, chan;
>  
>  	pending = read_c0_status() & read_c0_cause() & ST0_IM;
>  
> @@ -46,8 +47,11 @@ asmlinkage void plat_irq_dispatch(void)
>  	pending >>= CAUSEB_IP;
>  	while (pending) {
>  		irq = fls(pending) - 1;
> -		if (irq < ARRAY_SIZE(irq_wb_chan) && irq_wb_chan[irq] != -1)
> -			ath79_ddr_wb_flush(irq_wb_chan[irq]);
> +		if (irq < ARRAY_SIZE(irq_wb_chans)) {
> +			chans = irq_wb_chans[irq];
> +			for_each_set_bit(chan, &chans, 32)
> +				ath79_ddr_wb_flush(chan);

So the CPU provides 8 interrupts and 32 sources, where each source has
its own specific flush register. There is some distribution mechanism
(firmware configured or fixed in hardware) which maps a interrupt source
to a CPU interrupt. When two sources are mapped to the same CPU
interrupt then they share the interrupt line, i.e. the handlers are
requested with IRQF_SHARED, _and_ both flush registers have to be
written to so that the interrupt handler can observe the data and figure
out whether it should handle it or not. Correct?

I kinda decoded this from your change log and tried to map it to the
code. It looks correct, but for heavens sake this needs a bit fat
comment explaining the magic behind all of this. Even for your own sake
as you will have forgotten the gory details three month down the road.

Btw, as this is the interrupt hotpath, this for_each_set_bit() loop is
pretty inefficient when there is more than one interrupt source
associated with a CPU interrupt.

What you want (as a patch on top) is:

ath79_ddr_wb_flush_many(unsigned long sources)
{
	__ath79_ddr_wb_flush_many(sources);
        // Document WHY this needs to be done twice
        // The existing comment is useless...
	__ath79_ddr_wb_flush_many(sources);
}

static __ath79_ddr_wb_flush_many(unsigned long sources)
{
	u32 __iomem *base = ath79_ddr_wb_flush_base;

	for_each_set_bit(idx, &sources, 32)
        	__raw_writel(0x1, base + idx)

	for_each_set_bit(idx, &sources, 32) {
        	while (__raw_readl(base + idx) & 0x1)
                	;
	}
}

or something like that. For a single interrupt it's exactly the same
outcome, but for multiple interrupts mapped to one CPU interrupt there
is an obvious speedup potential, no?

Thanks,

        tglx
