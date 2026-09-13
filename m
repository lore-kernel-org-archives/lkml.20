Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D9E39E18E;
	Sun, 13 Sep 2026 09:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789292475; cv=none; b=sKuhEfCP3LRW5v3bI/fUtY0ec183Oq8CLbSbgwD4o1QRmAj23Nh9rdMeEz7tm2qj0AhWrEp57Te/NdniDH+MQD7PgI/Dt4qBP+dCKrGFEYhdt3FtRXo1B15d3bHL/bvYk50KVwMEVTtz/2+ClaMYG7VsL1cOriyBnxyHw0uvyDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789292475; c=relaxed/simple;
	bh=mkLLa6rugF49G0zxSqnRyH+w70EHP8PbNp3i1XFE9BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kl+0FdQd/KUY3qM5QUvFFwHs3ofaEiBTynR4kBOdLBhCnod1PnQK8VPs6cThsAU7v3Q//3lOjs/sOt+0bVfzbXPKJc5kU8rOc6SGmci7TQPS6mqpti8asa3/Ut3Ooe9y8FYAbvizkW17NrmKgUmK13onfnA1R+UBrUQvG637DJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWu4++GL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWu4++GL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFBCB1F000FF;
	Sun, 13 Sep 2026 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789292473;
	bh=E/4ulU+au5vGq8JBMRy5RWGBS77P7SyvqTxZG8EhgOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kWu4++GLH3bLacfFgfps6MFpI2hTQmZT2OsEttxbo75PxOk7WIDnNI3X3Wh5VUhvl
	 fjJpr87FDrdu1xiBH6y9FLyvdA3REXvY17Wcz+W/gWCCDKMtMUCJT3PtVtkLAMBVeR
	 q/8DcD7ot08oU8CsATr7oxGwS2YLEoAppTB7dIaLFKtJxq5z++3wv7rRENsMuXKJg8
	 tO5imeqVc8vJFmdVfGdQzf37Up0/dKhX7gZmWrM72Nt+0SK+U2n+UC/TcyZoNirz0U
	 H7SN1t6pBBbXuSuxM2ntLciztGJG5DECMxWsa3K+Bz5hRY88fUF8SzGH/ci+O9qlsj
	 EA4pKjjOfWuRg==
Date: Sun, 13 Sep 2026 11:41:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] ASoC: meson: add audin main module and I2S formatter
Message-ID: <20260913-inventive-millipede-of-certainty-dd58ce@quoll>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
 <20260912-audin-v1-2-7fbefe928711@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260912-audin-v1-2-7fbefe928711@baylibre.com>

On Sat, Sep 12, 2026 at 12:14:32AM +0200, Valerio Setti wrote:
> +static int meson_gx_audin_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	void __iomem *mmio;
> +	struct regmap *regmap;
> +	struct clk *clk;
> +	int ret;
> +
> +	ret = device_reset(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to reset device\n");
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get memory resource\n");
> +
> +	/*
> +	 * Do not use devm_platform_ioremap_resource() here: it would claim the
> +	 * whole AUDIN window exclusively and the FIFO children would then fail
> +	 * to request their own sub-ranges.
> +	 */

And this should point you that child is not a separate device.

Please open your datasheet and read what is the address space of this
device. You claim here ENTIRE address space. If you insist that entire
address space is not owned by this device, then you misrepresented
hardware in the DT anyway.

> +	mmio = devm_ioremap(dev, res->start, resource_size(res));
> +	if (!mmio)
> +		return dev_err_probe(dev, -ENOMEM, "Failed to remap memory\n");
> +
> +	regmap = devm_regmap_init_mmio(dev, mmio, &audin_regmap_cfg);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to init regmap\n");
> +
> +	clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
> +
> +	ret = gx_formatter_create(dev, &audin_dapm_widgets[0], &audin_formatter_i2s_drv, regmap);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to allocate formatter\n");
> +
> +	ret = devm_snd_soc_register_component(dev, &audin_component, NULL, 0);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register component\n");
> +
> +	ret = devm_of_platform_populate(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to probe child nodes\n");
> +
> +	return 0;
> +}
> +
> +static void meson_gx_audin_remove(struct platform_device *pdev)
> +{
> +	gx_formatter_free(&audin_dapm_widgets[0]);
> +}
> +
> +static const struct of_device_id meson_gx_audin_of_match[] = {
> +	{ .compatible = "amlogic,meson-gxbb-audin" },
> +	{ .compatible = "amlogic,meson-gxl-audin" },

Why do you have two entries here and no fallbacks? This makes no sense,
really. I have no more doubts that your "gx" is a real SoC/

Best regards,
Krzysztof

