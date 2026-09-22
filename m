Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795054F4D13;
	Tue, 22 Sep 2026 10:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072165; cv=none; b=FvMfLKJAq7tXP+/xGDw7EAz63LWgLiam8fMJ8teYZ3TD/T6Y6Ba7Z0uEeqezDTUZjJoZhZZ7Rap4t84v1YvijSa3zoLumtt7ldydM7WXpqgk6SbPH+Dz6+3gHt+ID2siFVsqO7BvKlmI1Gxe8czbxDOSHbT84K5Tq8/eahiBt0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072165; c=relaxed/simple;
	bh=3Zz5vdUwlRmEw1SpaMkw7RvyanZ7+PYsmxfj5Wvf6dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/rTqSKa2ym+M6KqWKWQmQc2Sa8cj7ihxIlszoalXuKUPpJWxURgDouknCfvRrRb2WWbADgN6liZaSTOdpohiR/YCOAxEyR9BVNVepxGJpRUw3vbbKpZRZIOMyEEmvnllj6jZbhh61ESl934RIkOnWaawuxt+nJVOMnolOepfmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFoYP+4w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFoYP+4w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCB41F000FF;
	Tue, 22 Sep 2026 10:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790072156;
	bh=RIYi2p8vmFv/xYihUANKk6S+FDUFfc3Ergx1l2zSeD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TFoYP+4wQrKRDZYY5uBI3kCDkIz/i1BEQedpVpd+pR9otjdqKA9Nm9cXZ60jXoX5E
	 aGUKDrfv5e06Hk2HvWl4i8/mvXCl0YCPeIm2M6crGk788EBpPzU5siu7ntHo3yKavu
	 mYaj7RXVzuXU8OpwOeRyL5z1x5sybuXNgu1tCN29VkCyiekpLKcFPAXRI4kxA2g12q
	 ZWkFztuW6mnuZURgL1DgRUa+w5TCnk1FETyip0S8vm9t7y/D2a8gu2vzDcs8fy/jRB
	 4Bw7pa0Wgx7f67TmfWhb51hvMVUmPaeCNqsZKCIQWd4RgSBB9GZSR1olN5BkuwZ0/N
	 apPSRDMeWA16w==
Date: Tue, 22 Sep 2026 11:15:49 +0100
From: Lee Jones <lee@kernel.org>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, Suresh Vankadara <svankada@qti.qualcomm.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/6] mfd: qcom-pm8008: Add support for PM8010 PMIC
Message-ID: <20260922101549.GC2730113@google.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <20260907-glymur_camss-v2-5-75f7982dc983@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-glymur_camss-v2-5-75f7982dc983@oss.qualcomm.com>

On Mon, 07 Sep 2026, Nihal Kumar Gupta wrote:

> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> The PM8010 is a variant of the PM8008 PMIC with a slightly different
> IRQ layout and MFD cells. Introduce per-variant match data (IRQ chip
> descriptor and MFD cells) selected via the new "qcom,pm8010-i2c"
> compatible string, and support probing without an interrupt line by
> falling back to a reduced set of MFD cells when the client has no IRQ
> assigned.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

I think you two need to chat:

https://lore.kernel.org/r/20260908130745.2545-3-okerixx@gmail.com

> ---
>  drivers/mfd/qcom-pm8008.c | 140 ++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 112 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index 60204cc9a2dc60cc1fe1b64030f5d803100e7874..28532cef7908ef3409a3dfc0779aae3b1a3885b9 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -34,6 +34,7 @@ enum {
>  	PM8008_GPIO1,
>  	PM8008_GPIO2,
>  	PM8008_NUM_PERIPHS,
> +	PM8010_NUM_PERIPHS = 2,
>  };
>  
>  #define PM8008_PERIPH_0_BASE	0x900
> @@ -55,6 +56,10 @@ enum {
>  #define PM8008_IRQ_GPIO1	6
>  #define PM8008_IRQ_GPIO2	7
>  
> +#define PM8010_IRQ_MISC_MBG_FAULT	0
> +/* 1-3 are unused */
> +#define PM8010_IRQ_MISC_LDO_OCP	4
> +
>  enum {
>  	SET_TYPE_INDEX,
>  	POLARITY_HI_INDEX,
> @@ -88,6 +93,12 @@ static const struct regmap_irq pm8008_irqs[] = {
>  	_IRQ(PM8008_IRQ_GPIO2,	      PM8008_GPIO2,	BIT(0), IRQ_TYPE_SENSE_MASK),
>  };
>  
> +static const struct regmap_irq pm8010_irqs[] = {
> +	_IRQ(PM8010_IRQ_MISC_MBG_FAULT, PM8008_MISC, BIT(0), IRQ_TYPE_EDGE_RISING),
> +	_IRQ(PM8010_IRQ_MISC_LDO_OCP, PM8008_MISC, BIT(4), IRQ_TYPE_EDGE_RISING),
> +	_IRQ(PM8008_IRQ_TEMP_ALARM, PM8008_TEMP_ALARM, BIT(0), IRQ_TYPE_SENSE_MASK),
> +};
> +
>  static const unsigned int pm8008_periph_base[] = {
>  	PM8008_PERIPH_0_BASE,
>  	PM8008_PERIPH_1_BASE,
> @@ -158,6 +169,25 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
>  	.get_irq_reg		= pm8008_get_irq_reg,
>  };
>  
> +static const struct regmap_irq_chip pm8010_irq_chip = {
> +	.name			= "pm8010",
> +	.main_status		= I2C_INTR_STATUS_BASE,
> +	.num_main_regs		= 1,
> +	.irqs			= pm8010_irqs,
> +	.num_irqs		= ARRAY_SIZE(pm8010_irqs),
> +	.num_regs		= PM8010_NUM_PERIPHS,
> +	.status_base		= INT_LATCHED_STS_OFFSET,
> +	.mask_base		= INT_EN_CLR_OFFSET,
> +	.unmask_base		= INT_EN_SET_OFFSET,
> +	.mask_unmask_non_inverted = true,
> +	.ack_base		= INT_LATCHED_CLR_OFFSET,
> +	.config_base		= pm8008_config_regs,
> +	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
> +	.num_config_regs	= PM8010_NUM_PERIPHS,
> +	.set_type_config	= pm8008_set_type_config,
> +	.get_irq_reg		= pm8008_get_irq_reg,
> +};
> +
>  static const struct regmap_config qcom_mfd_regmap_cfg = {
>  	.name		= "primary",
>  	.reg_bits	= 16,
> @@ -179,10 +209,32 @@ static const struct resource pm8008_temp_res[] = {
>  
>  static const struct mfd_cell pm8008_cells[] = {
>  	MFD_CELL_NAME("pm8008-regulator"),
> -	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
> +	MFD_CELL_RES("spmi-temp-alarm", pm8008_temp_res),
>  	MFD_CELL_NAME("pm8008-gpio"),
>  };
>  
> +static const struct mfd_cell pm8010_cells[] = {
> +	MFD_CELL_NAME("pm8010-regulator"),
> +	MFD_CELL_RES("spmi-temp-alarm", pm8008_temp_res),
> +	MFD_CELL_NAME("pm8008-gpio"),
> +};
> +
> +static const struct mfd_cell pm8008_no_irq_cells[] = {
> +	MFD_CELL_NAME("pm8008-regulator"),
> +};
> +
> +static const struct mfd_cell pm8010_no_irq_cells[] = {
> +	MFD_CELL_NAME("pm8010-regulator"),
> +};
> +
> +struct pm8008_match_data {
> +	const struct regmap_irq_chip *irq_chip_desc;
> +	const struct mfd_cell *mfd_cells;
> +	const struct mfd_cell *no_irq_mfd_cells;
> +	int num_mfd_cells;
> +	int no_irq_num_mfd_cells;
> +};
> +
>  static void devm_irq_domain_fwnode_release(void *data)
>  {
>  	struct fwnode_handle *fwnode = data;
> @@ -192,15 +244,22 @@ static void devm_irq_domain_fwnode_release(void *data)
>  
>  static int pm8008_probe(struct i2c_client *client)
>  {
> -	struct regmap_irq_chip_data *irq_data;
> +	struct regmap_irq_chip_data *irq_data = NULL;
> +	const struct pm8008_match_data *data;
>  	struct device *dev = &client->dev;
>  	struct regmap *regmap, *regmap2;
>  	struct fwnode_handle *fwnode;
> +	const struct mfd_cell *cells;
>  	struct i2c_client *dummy;
>  	struct gpio_desc *reset;
> +	int num_cells;
>  	char *name;
>  	int ret;
>  
> +	data = device_get_match_data(dev);
> +	if (!data)
> +		return dev_err_probe(dev, -ENODATA, "Missing driver match data\n");
> +
>  	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
>  	if (IS_ERR(dummy)) {
>  		ret = PTR_ERR(dummy);
> @@ -231,37 +290,62 @@ static int pm8008_probe(struct i2c_client *client)
>  	 */
>  	usleep_range(1000, 2000);
>  
> -	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
> -	if (!name)
> -		return -ENOMEM;
> -
> -	name = strreplace(name, '/', ':');
> -
> -	fwnode = irq_domain_alloc_named_fwnode(name);
> -	if (!fwnode)
> -		return -ENOMEM;
> -
> -	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
> -	if (ret)
> -		return ret;
> -
> -	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
> -				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
> -	if (ret) {
> -		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
> -		return ret;
> +	if (client->irq) {
> +		name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
> +		if (!name)
> +			return -ENOMEM;
> +
> +		name = strreplace(name, '/', ':');
> +
> +		fwnode = irq_domain_alloc_named_fwnode(name);
> +		if (!fwnode)
> +			return -ENOMEM;
> +
> +		ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
> +		if (ret)
> +			return ret;
> +
> +		ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
> +						       IRQF_SHARED, 0, data->irq_chip_desc,
> +						       &irq_data);
> +		if (ret) {
> +			dev_err(dev, "failed to add IRQ chip: %d\n", ret);
> +			return ret;
> +		}
> +
> +		/* Needed by GPIO driver. */
> +		dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
> +		cells = data->mfd_cells;
> +		num_cells = data->num_mfd_cells;
> +	} else {
> +		cells = data->no_irq_mfd_cells;
> +		num_cells = data->no_irq_num_mfd_cells;
>  	}
>  
> -	/* Needed by GPIO driver. */
> -	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
> -
> -	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
> -				ARRAY_SIZE(pm8008_cells), NULL, 0,
> -				regmap_irq_get_domain(irq_data));
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells,
> +				    num_cells, NULL, 0,
> +				    regmap_irq_get_domain(irq_data));
>  }
>  
> +static const struct pm8008_match_data pm8008_data = {
> +	.irq_chip_desc = &pm8008_irq_chip,
> +	.mfd_cells = pm8008_cells,
> +	.no_irq_mfd_cells = pm8008_no_irq_cells,
> +	.num_mfd_cells = ARRAY_SIZE(pm8008_cells),
> +	.no_irq_num_mfd_cells = ARRAY_SIZE(pm8008_no_irq_cells),
> +};
> +
> +static const struct pm8008_match_data pm8010_data = {
> +	.irq_chip_desc = &pm8010_irq_chip,
> +	.mfd_cells = pm8010_cells,
> +	.no_irq_mfd_cells = pm8010_no_irq_cells,
> +	.num_mfd_cells = ARRAY_SIZE(pm8010_cells),
> +	.no_irq_num_mfd_cells = ARRAY_SIZE(pm8010_no_irq_cells),
> +};
> +
>  static const struct of_device_id pm8008_match[] = {
> -	{ .compatible = "qcom,pm8008", },
> +	{ .compatible = "qcom,pm8008", .data = &pm8008_data },
> +	{ .compatible = "qcom,pm8010-i2c", .data = &pm8010_data },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, pm8008_match);
> 
> -- 
> 2.34.1
> 

-- 
Lee Jones
