Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8921A0BF3;
	Thu, 15 Oct 2026 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060915; cv=none; b=h+vhTHynrZV1Y6gbPQv53FuSJmGyvPDz5VNgG/gQiuKKJjZKwuw/JtZt5palWLkj+WFBLdWhDYW3EgCAvQ2clECcg7kqtHp/8/O21dUkc7tI25oubIXIR2Eiu3xgJjfRYrjt53K5WrAlBdEdi+2VTP4ILzXFkeExUGxPujbOvm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060915; c=relaxed/simple;
	bh=2OIcbTscBkCCTi5T6Y912ZkUXFqwlFKZcVZmhl/y06g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5UsZJlGlwuI3JSguvLwUilNEBX2O/wCv4ZmiR6zDkC1k7L3Zqwezns7nFb84X6LBYwaROejg/MuGSuGimn30DlUfAtF42AEedz38c3ccCCcHuZHQ85soDuPqAf2BMexKL6LWslnepiJziGRSReTVhEk79oiTslT6MFBinyH3Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPRM8+Cv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPRM8+Cv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309811F000C4;
	Thu, 15 Oct 2026 10:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060913;
	bh=yYEnRTY5ZMoZaQRvKSmNZauRhBf1MEQZyubVmVWo5gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BPRM8+CvHNDDa8JQTZkakVHANOOpceF/nlqQ1618ZVqs94jf735tUbImCA/vf0seN
	 v4Keq9GT3WRcTVcySK8q06AsNvB1fgl1x0a7vJaWaxUWPBIQDg97+6wamDJoDP3Wf7
	 JzOOm4kVHSiDFUW/1RIDyGnBSDpqdhDspH/MEUw59hhsyw3a5nV6C6aX+0YkVNKa5A
	 wv9JEXXNaOlpiuNgpNECz9AuMsiPok3E1vbisWkzdbPGLZI7ogMck9rkH0zJfIV3lJ
	 cO/KdZMBd6lTAMnu2FV6XNZEk4AxsvnzI9vXVCHN5IL624HIvDDfLDijW6vxC5aInP
	 TrZSk1454JZuQ==
Date: Thu, 15 Oct 2026 12:41:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hyunuk Son <hyunuk.son@irondevice.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	kiseok.jo@irondevice.com, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: Add driver for Iron Device MA5311
Message-ID: <20261015-brainy-thick-toad-db0389@quoll>
References: <20261015060408.128711-1-hyunuk.son@irondevice.com>
 <20261015060408.128711-3-hyunuk.son@irondevice.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015060408.128711-3-hyunuk.son@irondevice.com>

On Thu, Oct 15, 2026 at 03:04:07PM +0900, Hyunuk Son wrote:
> Add an ASoC codec driver for the Iron Device MA5311.
> 
> The driver supports audio playback and capture through I2S
> and TDM interfaces. It provides ALSA mixer controls for audio
> configuration and uses regmap for register access.
> 
> Signed-off-by: Hyunuk Son <hyunuk.son@irondevice.com>

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

...

> +static void ma5311_unregister_ancillary_client(void *data)
> +{
> +	struct i2c_client *client = data;
> +
> +	i2c_unregister_device(client);
> +}
> +
> +static irqreturn_t ma5311_irq_thread(int irq, void *data)
> +{
> +	struct ma5311_priv *ma5311 = data;
> +	unsigned int dac_status;
> +	unsigned int dac_ocp_status;
> +	unsigned int dac_scp_status;
> +	int ret = 0;
> +
> +	ret |= regmap_read(ma5311->ctrl_regmap,
> +			   MA5311_DAC_EA_DAC_STATUS, &dac_status);
> +
> +	ret |= regmap_read(ma5311->ctrl_regmap,
> +			   MA5311_DAC_EB_DAC_OCP_STATUS, &dac_ocp_status);
> +
> +	ret |= regmap_read(ma5311->ctrl_regmap,
> +			   MA5311_DAC_EC_DAC_SCP_STATUS, &dac_scp_status);
> +
> +	if (ret) {
> +		dev_crit(ma5311->dev,
> +			 "Error Occurred During Interrupt Handling\n");
> +		return ret;
> +	}
> +	if (dac_status & MA5311_DAC_EA_FAULT_MASK)
> +		dev_crit(ma5311->dev, "FAULT asserted\n");
> +
> +	if (!(dac_ocp_status & MA5311_DAC_EB_OCP_1A_MASK))
> +		dev_crit(ma5311->dev, "CH1A OCP\n");
> +
> +	if (~dac_status & MA5311_DAC_EA_UVLON_CH1_MASK)
> +		dev_crit(ma5311->dev, "%s: CH1 UVLO\n", __func__);
> +
> +	if (~dac_status & MA5311_DAC_EA_UVLON_CH2_MASK)
> +		dev_crit(ma5311->dev, "%s: CH2 UVLO\n", __func__);
> +
> +	if (dac_status & MA5311_DAC_EA_TSDW_MASK)
> +		dev_crit(ma5311->dev, "%s: TSD Warning\n", __func__);
> +
> +	if (dac_status & MA5311_DAC_EA_TSD_MASK)
> +		dev_crit(ma5311->dev, "%s: TSD Fault\n", __func__);
> +
> +	if (~dac_ocp_status & MA5311_DAC_EB_IPSC_2U_MASK)
> +		dev_crit(ma5311->dev,
> +			 "%s: IPSC CH2 Highside Fault\n", __func__);

How many errors are you going to print during some failure?

> +
> +	if (~dac_ocp_status & MA5311_DAC_EB_IPSC_2L_MASK)
> +		dev_crit(ma5311->dev, "%s: IPSC CH2 Lowside Fault\n", __func__);
> +
> +	if (~dac_ocp_status & MA5311_DAC_EB_IPSC_1U_MASK)
> +		dev_crit(ma5311->dev,
> +			 "%s: IPSC CH1 Highside Fault\n", __func__);
> +
> +	if (~dac_ocp_status & MA5311_DAC_EB_IPSC_1L_MASK)
> +		dev_crit(ma5311->dev, "%s: IPSC CH1 Lowside Fault\n", __func__);
> +
> +	if (~dac_scp_status & MA5311_DAC_EC_SCP_2B_MASK)
> +		dev_crit(ma5311->dev, "%s: CH2B SCP\n", __func__);
> +
> +	if (~dac_scp_status & MA5311_DAC_EC_SCP_2A_MASK)
> +		dev_crit(ma5311->dev, "%s: CH2A SCP\n", __func__);
> +
> +	if (~dac_scp_status & MA5311_DAC_EC_SCP_1B_MASK)
> +		dev_crit(ma5311->dev, "%s: CH1B SCP\n", __func__);
> +
> +	if (~dac_scp_status & MA5311_DAC_EC_SCP_1A_MASK)
> +		dev_crit(ma5311->dev, "%s: CH1A SCP\n", __func__);
> +
> +	dev_crit(ma5311->dev, "MA5311 INTN fault detected: irq=%d\n", irq);

Not really critical. That's just a codec.

Also, this should be ratelimited.

> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ma5311_i2c_probe(struct i2c_client *client)
> +{
> +	struct ma5311_priv *ma5311;
> +	int ret;
> +
> +	ma5311 = devm_kzalloc(&client->dev, sizeof(*ma5311), GFP_KERNEL);
> +
> +	if (!ma5311)
> +		return -ENOMEM;
> +
> +	ma5311->ctrl_regmap =
> +	    devm_regmap_init_i2c(client, &ma5311_ctrl_regmap_config);

You use odd formatting. Was this clang? It's known for making it
non-kernel style (see Linux kernel coding style)

> +
> +	if (IS_ERR(ma5311->ctrl_regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(ma5311->ctrl_regmap),
> +				     "%s: Failed to allocate control regmap\n",
> +				     __func__);
> +
> +	ma5311->adc_client = i2c_new_ancillary_device(client, "adc", 0x3f);
> +

Drop such blank lines after assignment and before check.

> +	if (IS_ERR(ma5311->adc_client))
> +		return dev_err_probe(&client->dev, PTR_ERR(ma5311->adc_client),
> +				     "Failed to create ADC ancillary client\n");
> +
> +	ret = devm_add_action_or_reset(&client->dev,
> +				       ma5311_unregister_ancillary_client,
> +				       ma5311->adc_client);
> +	if (ret)
> +		return ret;
> +
> +	ma5311->adc_regmap = devm_regmap_init_i2c(ma5311->adc_client,
> +						  &ma5311_adc_regmap_config);
> +
> +	if (IS_ERR(ma5311->adc_regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(ma5311->adc_regmap),
> +				     "Failed to allocate ADC regmap\n");
> +
> +	/* Logical 1 asserts reset, using the polarity from reset-gpios. */

No need to explain basics of GPIO handling in Linux kernel.

> +	ma5311->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> +						     GPIOD_OUT_LOW);
> +	if (IS_ERR(ma5311->reset_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(ma5311->reset_gpio),
> +				     "Failed to acquire reset GPIO\n");
> +
> +	if (ma5311->reset_gpio)
> +		msleep(MA5311_RESET_RECOVERY_MS);
> +
> +	ma5311->amp_mode = MA5311_MONO_BOTH_MODE;
> +	ma5311->num_of_pll_matches = ARRAY_SIZE(ma5311_pll_matches);
> +	ma5311->pll_matches = ma5311_pll_matches;
> +	ma5311->format = SND_SOC_DAIFMT_I2S;
> +	ma5311->sys_clk_id = MA5311_PLL_CLKIN_BCLK;
> +	ma5311->dev = &client->dev;
> +
> +	i2c_set_clientdata(client, ma5311);
> +
> +	ret = devm_snd_soc_register_component(&client->dev, &ma5311_component,
> +					      ma5311_dai, 1);
> +
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to register component: %d\n",
> +			ret);
> +
> +		return ret;
> +	}
> +
> +	dev_dbg(&client->dev, "MA5311 client->irq = %d\n", client->irq);
> +
> +	if (client->irq > 0) {
> +		ret = devm_request_threaded_irq(&client->dev,
> +						client->irq,
> +						NULL,
> +						ma5311_irq_thread,
> +						IRQF_ONESHOT, "ma5311", ma5311);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					     "Failed to request IRQ %d\n",
> +					     client->irq);
> +
> +		dev_dbg(&client->dev, "MA5311 IRQ %d registered\n",
> +			client->irq);

How many debug messages for simple IRQ?

> +	} else {
> +		dev_warn(&client->dev, "No IRQ configured\n");
> +	}
> +
> +	dev_dbg(&client->dev, "Codec component registered\n");

Drop. debug for standard probe success is completely redundant.

> +
> +	return ret;
> +}
> +
> +static const struct i2c_device_id ma5311_i2c_id[] = { { "ma5311", 0 }, { } };

Odd formattting

> +
> +MODULE_DEVICE_TABLE(i2c, ma5311_i2c_id);
> +
> +static const struct of_device_id ma5311_of_match[] = {
> +	{
> +	 .compatible = "irondevice,ma5311",
> +	  },

Even odder... Please look at recent code how this is written.


Best regards,
Krzysztof

