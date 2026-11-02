Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627436;
	b=mRbLbdR5bnZlFdWvq2Ky3XEOGdJToshWYipK6usEM472zNzVOEhkYd8tOA62lU0mpH1d
	 jPCF0tY9iwfe6+GuWvkkhX3e2MHcFO5SjIs3FpbMSH2snmOKaubQbolhp8Zhz+qCBLJOE
	 wtp6PRpa8FV2VjRy4cTNJp+FuFiiDf2VC5D5m/Xko93cJwpzwHjbiqP8QCYNFC+uSEa32
	 xcRbVGvyaqrGi27qCuibHDo7m/nUVcOyLzq4AOqf/u+Znx1AlMPVoQHevJ7gR8RKdup/7
	 u+Famec2LN+8PMo12lRqPj0YJ4m5WSvgwkupQxjghB0GJ2URRYtl9GJ9yMEFBIrZcKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627436;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=c9786btBzdrmTnErj/Du/8VE2oO+29Q2S5v+Vg3Lpl0=;
	b=W8GTFsOOeEfmscRwqJ89xxHOzsgVjCMWRakU8PymrP2boT7pIfDz8P1X8YzWmLMY6PlX
	 hfRcXQutX85OYVKImTRTqiy7wx1K2KcW/xCcgQpNdyZK6zMa5Xra4/+9R50JnOhvIAwYt
	 bcp+H+olhhpfim8D3aydoFTsJcRjzc4mKkRYwpC1QvJOJvIBXVPlIePj8+gPKynr6iNaj
	 pVi73NNIQWm0ZEmEL6wrhfVYX/QrorkEzxTjTSGFx7p660QsLSXjvdMVdaseGWCYXizI4
	 3kZrE1jrQhdK9U1NmCwTruXQmDgh27IQeE3h7rpzh6139eQ+gkiCMq+pKpxY40O9VeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gu7I7OIQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB81B606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gu7I7OIQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B788C1F00A1B;
	Mon,  2 Nov 2026 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627435;
	bh=c9786btBzdrmTnErj/Du/8VE2oO+29Q2S5v+Vg3Lpl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gu7I7OIQLpg+cGvYJ+iHVS+rww5vJ8IJQ8JQZO8qPzloEfBBQSQpo8DQxihBJBVUX
	 NgF5F0RQ/frHgEgJISTniw0MrWcjz7jemL09rQgFsb2lcPyJ5wt3AJKffI5c52AHbp
	 wuslNCSk2AKkcENbYf4/i4g4AIx0O2H3K52EVWidOvbh4oOCafTwX8MAwjnkd50/6b
	 hWnv/VQAPGjv0wzDQdFCF/i6eM/tlyhMw1IKYWLUPW+HdzZtbTfqpxyFGst4wT3AbG
	 LoUNCryUVX+xhNaR+xmKHtdnwMBBuE8bdzIMN5ObtrMoGan08KmblZaFXLRTwzGweu
	 SGujMGEA8T5rA==
Date: Mon, 2 Nov 2026 14:50:30 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] irqchip/gic-v5: Reject SPIs not backed by an IRS
Message-ID: <auiVJuDPZr-ietKa@red-moon>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-1-743b61626fc5@arm.com>
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
In-Reply-To: <20261102-host_gicv5_fixes-v1-1-743b61626fc5@arm.com>

On Mon, Nov 02, 2026 at 01:32:54PM +0000, Sascha Bischoff wrote:
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
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

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
