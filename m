Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215522;
	b=VyKUB9t4YMLCQdb9dQ3lg7DIzVK0GU8vcOLlrJ/Q3nWj+XfTNL0Z6aGsmZ79SwaGL8b4
	 Xkls0iSmzw1QEmm7fRPPNPmmSBbW/gMPXjn/UpKTytK9wwGlm+cKYdqGHndaGJsggkJVa
	 Ior2y8qrXjp/ErSKU6BIHmTqd6ENCWlQeXcSG+zlGadrJuQMGOfy/cc7a9xg5eoEfkghN
	 1JfCsA8XxS/pTlPSfHjXjIYfLEyZ7U6wHf8IYVQZ2B73lNEc411ww53Ohj3RQMhWDzioa
	 Muh5IkBnMbo0nRe3+WqIvMdI8sVppLYovoO/YbqRdLzn8q2QdnM/fuAReHkAvyxX7qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215522;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=SOwx+TrjiqZmjyW3x8UmgFsxHh+2bldbZmSGJ3/I7qc=;
	b=qQuzqrT8S+OsU28ey72HSsBYBCAKPr1vEiJbAJFuKSFk1D21e3qPBWG6osiYUifYltMC
	 80+8phlVoTfYK/GI53kG/DMT+q67ZMUFuk6ZefKjBNDyOs016hAk2h5vRtSGEdf5o1cby
	 JTl2HXeDUHNDKUmlzpDVhDGWIX0JH1xMeTiG/dZ9bmkZyof1nAI/3tL7YujZjkpECXb2c
	 l6D17FviZ7ljLlNd7ZDLWe8hcE0OlLywxsfJ8zzelvLEq+aYCDDvl5cn2XRax947DGBPg
	 P9uxiPYprw3p8594z7ggqN3dT/k3u840x46q0RXbnNJxs3L4l4kwCdRw2rPOMrIXkYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ns+Ryu63;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0386E606A31C;
	Mon,  9 Nov 2026 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ns+Ryu63
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA5B1F0089F;
	Mon,  9 Nov 2026 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794215521;
	bh=SOwx+TrjiqZmjyW3x8UmgFsxHh+2bldbZmSGJ3/I7qc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Ns+Ryu63yadoW2c4325ppqIQcD4NHuXGcXkZROKQolkkTc9AQM5NzGA/d5uBqYyqd
	 WSe7waQ8h1hfMsLo+BlpGZMlppsGYuhdGkgAhZ2C/uA6dIynJ/Lzb6cXH/+nQjrEoO
	 Tw2X/JhsDnHYwPgAQEMHScpD4B5vfguMtGlRtLxGjVUpuGyX2l/U+jKivZHs3Jjec7
	 12bT7NQl4foNngGfzpPZEGgIqxNWurzyQyTlLSP9r01jf/w+uGw6Xq/cyz23G+GbiR
	 scvq0iQL+EU9PLrf5s6BhGnqhtkA9YanZBuSBaiqQweDlUnWCwhyczNDi+HE/tVtac
	 //Qird/D+539g==
From: Thomas Gleixner <tglx@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, radu@rendec.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, afaerber@suse.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 mfd@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
 cy.huang@realtek.com, stanley_chang@realtek.com, eleanor.lin@realtek.com
Subject: Re: [PATCH v5 4/8] irqchip/realtek-intc-common: Add basic support
 for Realtek DHC SoCs
In-Reply-To: <20261018160653.3940371-5-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-5-eleanor.lin@realtek.com>
Date: Mon, 09 Nov 2026 10:11:58 +0100
Message-ID: <87y0b2v069.ffs@fw13>
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

On Mon, Oct 19 2026 at 00:06, Yu-Chun Lin wrote:
> +static bool realtek_intc_dispatch(struct realtek_intc_subset_data *subset_data)
> +{
> +	const struct realtek_intc_info *bank_info = subset_data->bank_info;
> +	struct realtek_intc_data *data = subset_data->common;
> +	u32 ints, inte, mask, val;
> +	irq_hw_number_t hwirq;
> +	bool handled = false;
> +	int irq;
> +
> +	if (regmap_read(data->base, bank_info->isr_offset, &val))
> +		return false;
> +
> +	ints = val & subset_data->subset_mask->ints_mask;
> +
> +	if (!ints)
> +		return false;
> +
> +	if (regmap_read(data->base, bank_info->scpu_int_en_offset, &inte))
> +		return false;
> +
> +	while (ints) {
> +		irq = __ffs(ints);
> +		ints &= ~BIT(irq);
> +
> +		mask = bank_info->isr_to_scpu_int_en_mask[irq];
> +		if (mask != IRQ_ALWAYS_ENABLED && !(inte & mask))
> +			continue;
> +
> +		hwirq = (subset_data->bank_idx * 32) + irq;
> +
> +		if (!generic_handle_domain_irq(data->domain, hwirq))

You might want to use generic_handle_demux_domain_irq() which allows you
to implement affinity setting for the individual demultiplexed interrupts/

> +static void realtek_intc_handler(struct irq_desc *desc)
> +{
> +	struct realtek_intc_subset_data *subset_data = irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +
> +	chained_irq_enter(chip, desc);

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=6cf0d999a18e799965cf2cf4a0157e257c805946

> +	realtek_intc_dispatch(subset_data);
> +
> +	chained_irq_exit(chip, desc);
> +}

> +int realtek_intc_probe(struct platform_device *pdev, const struct realtek_intc_desc *desc)
> +{
> +	struct realtek_intc_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
> +	unsigned int total_subset_num = 0;
> +	int ret, parent_irq = 0;
> +
> +	for (unsigned int i = 0; i < desc->bank_num; i++)
> +		total_subset_num += desc->banks[i].subset_num;
> +
> +	data = devm_kzalloc(dev, struct_size(data, subset_data, total_subset_num),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->saved_en = devm_kcalloc(dev, desc->bank_num, sizeof(*data->saved_en), GFP_KERNEL);
> +	if (!data->saved_en)
> +		return -ENOMEM;
> +
> +	data->base = syscon_node_to_regmap(node->parent);
> +	if (IS_ERR(data->base))
> +		return PTR_ERR(data->base);
> +
> +	data->desc = desc;
> +
> +	data->domain = irq_domain_create_linear(of_fwnode_handle(node),
> +						32 * desc->bank_num,
> +						&realtek_intc_domain_ops, data);

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=irq/drivers&id=51987720c2845807161f56f4714df4562f56f328

> +	if (!data->domain)
> +		return -ENOMEM;

Thanks,

        tglx
