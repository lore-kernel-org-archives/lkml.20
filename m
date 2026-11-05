Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864122;
	b=awFUrUeJNhcvjmEzHjHrcVWwIRiWB53kEgyHQray3otfkx0Vc0IiGD78U/NjNtZvHmTD
	 EZao3lE/LcFypWQWM5pOBKYIb8dMVYXzmvAHN13Aty1fsGfchu6UBvKdK8fHaefHiDm0s
	 /dcNA5Zh56U5ktYk+2TGkxXHSeEb8vIUCX4XAHQHGHveUVT6qdK+VknpTMV33Xnk4CNli
	 KVu/ao5e2yKlxuoU9vScgQm6buInhPYfmrNlYFpjzkvQND1lvoyDKzymOqemwf2bJW1O3
	 052sBzCfBP1jvCNfiRSwcoas92pUDd4zzhDtQDU9yW2xyrs07JWMIC6B0Llh9C5OYRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864122;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zrvvUaVfaZs4vDYlI6rznRYoDcQzDwIPJyL+WelT6AU=;
	b=u7vKJytQ2tQEGRqCV/E+KLduABR5W3NdpzCOFFIhbk66wtc9PmIHJfK46y2cSu/jMnyB
	 SuIuL2MRTonttWuVJGV3Xy2SgGfqEtfHC4cRnj5BpYdxji1Uw8mlLn6fJszsDIJuRmMdL
	 L9cRN3sI1YcXzm84gQjWzSJXwjl84jfArTLHaRqug6CTR8T7puUuP5TlxgrA3jEseLTdR
	 jYpBBEp6PG016ZG+9MZeVV7JfxURDnBbvCJS3u7KylEtO1FEzod+WmFAo/4wbDhl/ZWuK
	 /7gMkhcERGdlxdRVPgss9I7NN1fm9AsqJNQjkocTyn8WvGauWSQgeNnkhDSitxeK16w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TX8/hlrZ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AA1606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TX8/hlrZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C818B1F00A17;
	Thu,  5 Nov 2026 07:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793864122;
	bh=zrvvUaVfaZs4vDYlI6rznRYoDcQzDwIPJyL+WelT6AU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TX8/hlrZnmQT8FsWt5Y+gLHUMA+kFofqylnXc/dIK7wGgmMzD+42ZAdjIXSw+G2ZF
	 yVQK5Bzv+T+XNntoBIQLAYD+gH4oU24IYm0kFKwn+JujgJctaFxjFxvNqEjUHpajPP
	 NS3q3DP/lDqf2waCTm3Bp4eVvpZj5zc4q6uMdaE9vDOlIYqLgg836Y4e8HolcQA7Lh
	 WfkVV6s5bI/XBq5HgtxK0qdGjTrvOTxSJn/eBFNeZ4RtJbS+Py6G1Y3xA5Ee8X5hbr
	 cYDKnzao5ceNGDTEbR9m8fVERzuHJm1QoY9PV52W6cPadbflFp3PZI6zAO/dZBv3pq
	 aZ8fVmbDum/MA==
Date: Thu, 5 Nov 2026 08:35:17 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] irqchip/gic-v5: Reject SPIs not backed by an IRS
Message-ID: <auwxtSfBOeKXC6w_@red-moon>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261104-host_gicv5_fixes-v2-1-e47ad20ea3c8@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-host_gicv5_fixes-v2-1-e47ad20ea3c8@arm.com>

On Wed, Nov 04, 2026 at 05:47:55PM +0000, Sascha Bischoff wrote:
> It is possible to build a multi-IRS GICv5 system where there are gaps
> in the global SPI range that are not backed by any IRS. In the current
> incarnation, this results in dereferencing a null pointer.
> 
> Reject cases where the firmware attempts to use those SPIs during IRQ
> allocation by catching the case where there is no chip_data associated
> with the irq (meaning that there is no IRS to back it). Spit out a
> warning about broken firmware when this is encountered as it shouldn't
> be using non-existent SPIs in the first place.
> 
> Fixes: 5cb1b6dab2def ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

https://docs.kernel.org/process/maintainer-tip.html

"Ordering of commit tags", if there is a v3.

Lorenzo

> ---
>  drivers/irqchip/irq-gic-v5.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index 8c0303af71e7d..f3cce2bd28cc3 100644
> --- a/drivers/irqchip/irq-gic-v5.c
> +++ b/drivers/irqchip/irq-gic-v5.c
> @@ -727,6 +727,15 @@ static int gicv5_irq_spi_domain_alloc(struct irq_domain *domain, unsigned int vi
>  
>  	irqd = irq_desc_get_irq_data(irq_to_desc(virq));
>  	chip_data = gicv5_irs_lookup_by_spi_id(hwirq);
> +	/*
> +	 * The global SPI range may contain IDs not covered by any IRS, i.e., it
> +	 * may have gaps, in which case there is no IRS to back the SPI. Catch
> +	 * broken firmware trying to use any of those SPIs.
> +	 */
> +	if (!chip_data) {
> +		pr_warn("Firmware bug! Unimplemented SPI (0x%lx)!\n", hwirq);
> +		return -EINVAL;
> +	}
>  
>  	irq_domain_set_info(domain, virq, hwirq, &gicv5_spi_irq_chip, chip_data,
>  			    handle_fasteoi_irq, NULL, NULL);
> 
> -- 
> 2.34.1
> 
