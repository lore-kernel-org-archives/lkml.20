Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172658;
	b=AusuVpkEZOw2PQzREacUBb3s99q8rdtOpKP80KF9pMbtwMwGokzWErMtvV7gVu4FIA0f
	 CfymH8DCR0vQ7KypKiMHv2ysLBkvI2OMq/eqXyz/mc3JEWWbrtYMBfRlFlAy+xxia7Czn
	 9WVEl5E6PGa5ndoKx9g38OYKeNWQIc3Y/m82EHFOPl6s9g6fabpur1cr/Bu8uveoW7r7m
	 WTRiSiTkGiP+oOGe8mxPkbaUq32YiXz9G9mXJvoU5m47VvL2wEDFLegNw5yY1YuCFp5qI
	 2u6Rt5ueu4nr/hxmxaoeiH7vVc0hBdQXy2/nUk4NYfiMBLNnvFd0kERdncMYJBmNkXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172658;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=6gO1pl1wSi/CmrOfFJOtMtdYZqyh6rJDv4/cfMzxrdY=;
	b=lrXiNlyP7NdGkLmwmtpBttynRjDX/XCh4MGA/wLP5AEwrK+UJFojr+5NEzL14655mNjT
	 CmwumUJtMbB824Jms5w8D8ZSckeYCRxxoFckOQK1n2wWfhO6faj6UKZsOJVXrts866bJQ
	 YWFGUymJ2UOUwxjXmS53D7TfvOmM8FQBmRzOlLd5hVqpPx8fnvRrMIqYxE/+SWh/zXd8t
	 nxg2gJl0vKk6LxYXlmefmmMuCRh0bteXjD7vCo9N0/HxicpOJSV4/gS+ObIkSwjx53XD1
	 trVIyzEsxk9B9MWLt00SX1yybuaWXBYgzPb0j82TZq5D00SPupLqlgTz8yJhymFmu7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H/WtAD6Y";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F75606A31C;
	Sun,  8 Nov 2026 21:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H/WtAD6Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9028E1F0089F;
	Sun,  8 Nov 2026 21:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794172658;
	bh=6gO1pl1wSi/CmrOfFJOtMtdYZqyh6rJDv4/cfMzxrdY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=H/WtAD6YbkJSr0XVa93K4LpCGXTJvumUwvgS9yCnzCnEoQL3+lwsEKrFPADTUrYnO
	 sup33dtntMNvEsTKbU/lanvKZdex9a3bScPa+hHpVXRK2gmI/R9nU1nreAgeebXnvc
	 hVF1Hv/fXjN9KmHVpC7kSzXFtPO0eFlBI/0B9//mnWeJe8rk6Dax6K2KjH6HdUnCce
	 nVvcb7yE4N8YRN9z5DoWlWriJzT2QqIX00sn8rA2uEFHTCzK3Nhtv606oiC6IjBDc/
	 J/wnQH7dT7l3pLMdnZ1zZdcCd2ZKRXW4GW62h/ub0ycImIgN+J3fruVsfCKZW6mdIq
	 FE7DjgVKbMJ6Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Alex Elder <elder@riscstar.com>, radu@rendec.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Daniel Thompson <daniel@riscstar.com>, p.zabel@pengutronix.de,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 danielt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] irqchip: introduce TC9564 SoC MSIGEN support
In-Reply-To: <20261012190245.3988619-3-elder@riscstar.com>
References: <20261012190245.3988619-1-elder@riscstar.com>
 <20261012190245.3988619-3-elder@riscstar.com>
Date: Sun, 08 Nov 2026 22:17:34 +0100
Message-ID: <871p8vvx8x.ffs@fw13>
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

On Mon, Oct 12 2026 at 14:02, Alex Elder wrote:
> +config TC9564_MSIGEN
> +	tristate "Toshiba TC9564 MSI distributor"
> +	depends on TC9564_PCI
> +	depends on GENERIC_IRQ_CHIP

  s/depends/select/

Otherwise this relies on some other driver to select GENERIC_IRQ_CHIP...

> +/**
> + * struct tc9564_msigen - Context for MSIGEN IRQ domain
> + * @ioaddr:	Pointer to mapped MSIGEN memory
> + * @irq:	IRQ number for MSIGEN
> + */
> +struct tc9564_msigen {
> +	void __iomem *ioaddr;
> +	unsigned int irq;

https://docs.kernel.org/process/maintainer-tip.html#struct-declarations-and-initializers

> +};
> +
> +#define HWIRQ_COUNT			25
> +
> +#define MSI_OUT_EN_OFFSET		0x0000
> +#define MSI_MASK_CLR_OFFSET		0x000c
> +#define MSI_MASK_VALUE			BIT(0)
> +#define MSI_INT_STS_OFFSET		0x0010
> +
> +static void tc9564_msigen_irq_handler(struct irq_desc *desc)
> +{
> +	struct irq_domain *irq_domain = irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	struct irq_chip_generic *gc;
> +	unsigned long status;
> +	unsigned long hwirq;
> +
> +	gc = irq_get_domain_generic_chip(irq_domain, 0);
> +
> +	chained_irq_enter(chip, desc);
> +
> +	status = irq_reg_readl(gc, MSI_INT_STS_OFFSET);
> +	for_each_set_bit(hwirq, &status, HWIRQ_COUNT)
> +		generic_handle_domain_irq(irq_domain, hwirq);

You want to use generic_handle_demux_domain_irq(), which allows you to
actually implement affinity settings for individual interrupts. 

> +	/*
> +	 * Clear the MSI flag. Most interrupts within TC9564 are level-high
> +	 * type. If any interrupts are still asserted then clearing this flag
> +	 * will cause the (edge-triggered) MSI to be regenerated.
> +	 */
> +	irq_reg_writel(gc, MSI_MASK_VALUE, MSI_MASK_CLR_OFFSET);
> +
> +	chained_irq_exit(chip, desc);
> +}
> +static int tc9564_msigen_irq_domain_init(struct irq_domain *irq_domain)
> +{
> +	struct tc9564_msigen *msigen = irq_domain->host_data;
> +
> +	irq_set_chained_handler_and_data(msigen->irq, tc9564_msigen_irq_handler,
> +					 irq_domain);

No line break required. You have 100 characters. All over the place.

> +/* Find the PCI device we're associated with (not necessarily the parent) */

What does that mean and why is this platform device driver dealing with
a PCI device in the first place?

This really wants proper comments explaining this in the source _and_
the change log of this patch. And no, your sloppy cover letter
explanation does not cut it at all.

> +static struct pci_dev *tc9564_msigen_find_pci_dev(struct device *dev)

> +static int tc9564_msigen_probe(struct platform_device *pdev)
> +{
> +	struct irq_domain_chip_generic_info dgc_info;

Struct is uninitialized. 

> +	struct device *dev = &pdev->dev;
> +	struct irq_domain *irq_domain;
> +	struct tc9564_msigen *msigen;
> +	struct irq_domain_info info;

Ditto. Look at other drivers how this is done correctly.

> +	struct reset_control *reset;
> +	struct pci_dev *pci_dev;
> +	struct clk *clk;
> +	int ret;
> +
> +	pci_dev = tc9564_msigen_find_pci_dev(dev);
> +	if (IS_ERR(pci_dev))
> +		return dev_err_probe(dev, PTR_ERR(pci_dev),
> +				     "failed to find PCI device\n");

See bracket rules in the documentation I linked to or simply get rid of
that line break. Same all over the place.

> +	dgc_info.name = "tc9564-msigen";
> +	dgc_info.handler = handle_level_irq;
> +	dgc_info.irqs_per_chip = HWIRQ_COUNT;
> +	dgc_info.num_ct = 1;
> +	dgc_info.init = tc9564_msigen_irq_chip_init;
> +	dgc_info.exit = tc9564_msigen_irq_chip_exit;
> +
> +	info.fwnode = of_fwnode_handle(dev->of_node);
> +	info.domain_flags = IRQ_DOMAIN_FLAG_DESTROY_GC;
> +	info.size = HWIRQ_COUNT;
> +	info.hwirq_max = HWIRQ_COUNT;
> +	info.ops = &irq_generic_chip_ops;
> +	info.host_data = msigen;
> +	info.dgc_info = &dgc_info;
> +	info.init = tc9564_msigen_irq_domain_init;
> +	info.exit = tc9564_msigen_irq_domain_exit;

Both initializations (except for info.host_data) can be done at the
declaration with a static initialization, which avoids that parts of the
structs contain random stack content. No?

Please look through the sashiko comments as well.

Thanks,

        tglx
