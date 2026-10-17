Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D5137701A;
	Sat, 17 Oct 2026 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259864; cv=none; b=mHNKFWtng3GaLmX8HV4LLhfSuEQ0KBxLhUoPJQJIcuVdUnXgf++yQ7JToJa1zkBKpG38dnhDdB8OZol5KQ+s1z9ChJPbXlYm1HyNa+eJna0dAVsfaPBjXIT+psLqiiQqZhROJQBR+Un2aCpptWPG6jE+LXdy47mpeD0FQDLNS+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259864; c=relaxed/simple;
	bh=bkZ2fXiclhyi9RuvydxYkWYuJ6hqFe0UoOl0JDo3PFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cklx+X000pd414jkvdkTyt8GCto/lr0HFghfD6tawIBaNbYmjPttYW5xzp+RzT3/c34svenuOQpd+HLhI8udL6EFMoz3+9Zoq//MF9ryccEG31bQLf6VdBhvjjRBfVIu4HtHT4JuW8jp1FURQmrihhcQ09qHF6dDmJoDQRbCLmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLPO7c74; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLPO7c74"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738911F000C4;
	Sat, 17 Oct 2026 17:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792259863;
	bh=BkjlY/beaZgsUWOJV3FqYfYFw4hgkZcyLd/jvUyEvrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iLPO7c74p99vVCGpVKY6iH8+IY8+3HTe1fDzw2F/f5sbjOi4lSoFsYNUyDYKMh77C
	 pjtQ5Qs5jLlrsXBtGHtkR+56TlmYM+l4f8N9di1swhh7KILpiQCSWyDRggyEn5nk+f
	 w/JXFv+Wo1Y8ZD3+1t/VHDTiAuz15uZ6/uMsG7t4tFLA3jwbbS5708poHtpotyRCNu
	 9IQiShE+/C/+mNemcsHoBSonfCUTsOFHhIweoSHDDk2PhSuP9UVcBo0MEufN3XoyKk
	 tnYRIEBl9aq58LuOrgmoqSsFVskYaUxRGuAwaQDktGMxT1U+8ikoJImcxIHT04XT8C
	 3XBME4mk0+rpw==
Date: Sat, 17 Oct 2026 19:57:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Simeon Marijon <simeon.marijon@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH v3 3/3] nvmem: stm32: add TAMP nvmem driver
Message-ID: <20261017-positive-curassow-from-sirius-c283c0@quoll>
References: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
 <20261016-upstream_nvram_reworked-v3-3-f65908490cf7@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016-upstream_nvram_reworked-v3-3-f65908490cf7@foss.st.com>

On Fri, Oct 16, 2026 at 05:26:05PM +0200, Patrice Chotard wrote:
> +static int stm32_tamp_nvram_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct stm32_tamp_nvram_priv *priv;
> +	struct resource *res;
> +	struct device_node *of_node;
> +	const struct of_device_id *of_id;
> +	void __iomem *base_addr;
> +	int *zones_end;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = &pdev->dev;
> +
> +	of_node = dev_of_node(dev);
> +	if (!of_node) {
> +		dev_err(dev, "Can't get of node of the device\n");
> +		return -ENODEV;

Entire dev_of_node and if() look not necessary.

> +	}
> +
> +	of_id = of_match_node(stm32_tamp_nvram_of_match, of_node);
> +	if (!of_id) {
> +		dev_err(dev, "Can't get of_id of the device\n");
> +		return -ENODEV;
> +	}
> +
> +	priv->data = (struct stm32_tamp_nvram_plat *)of_id->data;

Use wrapper - device_get_match_data or something similar (don't remember
exactly).

> +	if (!priv->data) {
> +		dev_err(dev, "Can't get platform data of the node\n");
> +		return -ENODEV;
> +	}
> +
> +	priv->config_regmap = syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(priv->config_regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->config_regmap),
> +				     "Can't get TAMP syscon regmap\n");
> +
> +	priv->idx_bkpreg_zones_end = stm32_tamp_nvram_get_backup_zones(priv);
> +	if (IS_ERR(priv->idx_bkpreg_zones_end))
> +		return dev_err_probe(dev, PTR_ERR(priv->idx_bkpreg_zones_end),
> +				     "Can't determine protection zone\n");
> +
> +	zones_end = priv->idx_bkpreg_zones_end;
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +

Drop blank line

> +	if (!res) {
> +		dev_err(dev, "Can't get resource\n");
> +		return -ENODEV;
> +	}
> +
> +	base_addr = devm_ioremap_resource(dev, res);

You cannot use wrapper over these two? And I am a bit confused - device
takes syscon from the parent, so how does it map also another memory?

> +	if (IS_ERR(base_addr)) {
> +		dev_err(dev, "Can't remap resource\n");
> +		return PTR_ERR(base_addr);
> +	}
> +
> +	priv->cfg.name = "stm32-tamp-nvram";
> +	priv->cfg.word_size = 1;
> +	priv->cfg.stride = 1;
> +	priv->cfg.dev = dev;
> +	priv->cfg.priv = priv;
> +	priv->cfg.owner = THIS_MODULE;
> +	priv->cfg.type = NVMEM_TYPE_BATTERY_BACKED;
> +	priv->cfg.size = resource_size(res);
> +	priv->cfg.reg_read = stm32_tamp_nvram_read;
> +	priv->cfg.reg_write = stm32_tamp_nvram_write;
> +
> +	if (priv->data->nb_zones == NB_ZONES_STM32MP2) {
> +		priv->bkpreg_access = stm32_tamp_get_access_rights_mp2x(priv);
> +
> +		if (IS_ERR(priv->bkpreg_access))
> +			return PTR_ERR(priv->bkpreg_access);
> +
> +		dev_dbg(dev, "\n"
> +			"Zone 1-RIF1 %3d - %3d %c%c\n"
> +			"Zone 1-RIF2 %3d - %3d %c%c\n"
> +			"Zone 2-RIF1 %3d - %3d %c%c\n"
> +			"Zone 2-RIF2 %3d - %3d %c%c\n"
> +			"Zone 3-RIF1 %3d - %3d %c%c\n"
> +			"Zone 3-RIF0 %3d - %3d %c%c\n"
> +			"Zone 3-RIF2 %3d - %3d %c%c\n",
> +			0,
> +			zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_1_RIF1] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_1_RIF2] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_2_RIF1] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_2_RIF2] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF1] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF0] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
> +						false) ? 'W' : '-'
> +				);
> +	} else if (priv->data->nb_zones == NB_ZONES_STM32MP1) {
> +		priv->bkpreg_access = stm32mp1_tamp_bkpreg_access;
> +
> +		dev_dbg(dev, "\n"
> +			"Zone 1 %3d - %3d %c%c\n"
> +			"Zone 2 %3d - %3d %c%c\n"
> +			"Zone 3 %3d - %3d %c%c\n",
> +			0,
> +			zones_end[BKPREG_PROTECTION_ZONE_1],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_1],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_1],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_1] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_2],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_2],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_2],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_2] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_3],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3],
> +						false) ? 'W' : '-');
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->bkpregs_regmap = devm_regmap_init_mmio(dev, base_addr,
> +						     priv->data->bkpregs_regmap_cfg);
> +	if (IS_ERR(priv->bkpregs_regmap)) {
> +		dev_err(dev, "failed to init regmap: %ld\n", PTR_ERR(priv->bkpregs_regmap));
> +		return PTR_ERR(priv->bkpregs_regmap);

return dev_err_probe


Best regards,
Krzysztof

