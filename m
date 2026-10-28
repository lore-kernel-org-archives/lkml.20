Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186732;
	b=t9G/fZJq9Idy/ddEn5Zg+ONBGIOHtxsvUo/ab87UIThbxtbFs3e3YE+RjVJJHrkTOVaO
	 SgGRiCgWckYgMInIEb9k2yYjLUlMUVCOqbhiCB/E6hPz7CG9C/YloxvNDHSlc149B4Wtd
	 gkv+DhFh9H/q7/v0os3pp8880AyrjqqT2WKs+6VA+mJ9IxUacJM//xoDbC3+RyN9m/HEP
	 28L8smra6I9SfkyQ1hJcrHOBx4WLygoOB2YVi0OHAQnrQv3/1K+UHMgnfr4PHEQF8N8aZ
	 BL3sTJWDePCPCM0Z7pgpPkCg48aqiNwY8Se8mDC7qzQ8NJfKX7KpySx2ZFI/xIm694w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186732;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=sIP4HizADUQp5dZZfZ/mDh2cOwoaCQuZ6cGfVUzEBfM=;
	b=Nor71Jtp+0+Ew591YtpeVxP1KfnjeCYgmVxsjW7IsghdRk4c3NRrMYj0LKwBBZKB+9WY
	 VyLRma9zsGxpM9pwhLNOSn2xStjGdYA6MtQ/FzyEuz7o46nIPggvnQsZVh4E+yGBFxeeA
	 NeKjaEhKrzX3es0H3IrJ9sTxKOPMbT06UgzRcg2KhmxzGWb4Zl91xL32NVudgf/oylb00
	 DB13WvTw+MueAJ8GpR/31AWcwZjyjGBoYAJh3+us8bgpoy9ILT6VWTSV+hYOBshmfUQ/W
	 e2Q+wkdYgYkVzos0z7NnhgBCquRJ6r1jQYanzTqZp8Op9+u7ohc+O+rb5kZciRt0xNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=csBdua7Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F52F606A31C;
	Wed, 28 Oct 2026 11:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=csBdua7Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622691F01825;
	Wed, 28 Oct 2026 11:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793186731;
	bh=sIP4HizADUQp5dZZfZ/mDh2cOwoaCQuZ6cGfVUzEBfM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=csBdua7QDh0f5708Sb34ryrwkeoiVvb7GxsUPhRkcikoK1qr1G9lxaF/qRCS4u3yA
	 nra/viznw7db+LzgqZ0mjXbsAsl0zO5HaSl74nEYwLHHb0JHIcLuzS2agR0mCuGKX7
	 ZWXL2vPD1zbAnd3nJp11zyWvNqrkf8Xf+86r2EmgbwLXXu9+im0MciSaP7wVIc6amW
	 fk0IgdZPTHxJ4BdL66JfMahN7VbrZRxoclIxvurqrvfaevytppmgslDCLK5DYfLPSa
	 KWwYZdPidABo5GToBskNfRkRXO5ztysCoCij6rIJKrAypoiZ2B5mt0WICmE/14Qsp2
	 QAkkSCIUODreQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E178C1FF1F31;
	Wed, 28 Oct 2026 11:25:27 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] ASoC: codecs: Add driver for Iron Device MA5311
From: Mark Brown <broonie@kernel.org>
To: Hyunuk Son <hyunuk.son@irondevice.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Kiseok Jo <kiseok.jo@irondevice.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261027093232.859755-3-hyunuk.son@irondevice.com>
References: <20261027093232.859755-1-hyunuk.son@irondevice.com>
 <20261027093232.859755-3-hyunuk.son@irondevice.com>
Date: Wed, 28 Oct 2026 11:25:20 +0000
Message-Id: <179318672062.199157.7461931531075403104.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=12547; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zG96ojq6OG7jpjRT4PXfMCqDeNyy7o/ntfsc/B43qNc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIe3l64yru33PmMVUvGUr8znpv3NfMvbhXvnnna5Ulls
 jVfJ8+bjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzkaTQjQ/8yhYalW+b+PZuw
 6sitr3suTZV4tnbbnXMHrXu/yd5QSpFk+J90X32xF8PPFOPvJp/W+uWdfnn+0azFTFWnhKWPl3w
 OmMcEAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Add an ASoC codec driver for the Iron Device MA5311.
> 
> The driver supports audio playback and capture through I2S
> and TDM interfaces. It provides ALSA mixer controls for audio
> configuration and uses regmap for register access.

> +static const struct reg_default ma5311_ctrl_reg_def[] = {
> +	{ 0x00, 0x88 },
> +	{ 0x01, 0x00 },
> +	{ 0x02, 0x00 },
> +	{ 0x03, 0x01 },
> +	{ 0x04, 0x17 },
> +	{ 0x05, 0x01 },
> +	{ 0x09, 0x00 },
> +	{ 0x0A, 0x30 },
> +	{ 0x0B, 0x30 },
> +	{ 0x0E, 0xAF },
> +	{ 0x0F, 0x0F },
> +	{ 0x10, 0x0C },
> +	{ 0x11, 0x00 },
> +	{ 0x12, 0x01 },
> +	{ 0x14, 0x5B },
> +	{ 0x15, 0x01 },
> +	{ 0x16, 0x0F },
> +	{ 0x17, 0x0F },
> +	{ 0x18, 0x0F },
> +	{ 0x19, 0x00 },
> +	{ 0x1A, 0x00 },
> +	{ 0x1B, 0x00 },
> +	{ 0x23, 0x01 },
> +	{ 0x24, 0x00 },
> +	{ 0x25, 0x00 },
> +	{ 0x26, 0x00 },
> +	{ 0x2B, 0x07 },
> +	{ 0x2C, 0x0C },
> +	{ 0x2D, 0x0C },
> +	{ 0x2E, 0x0C },
> +	{ 0x2F, 0x0C },
> +	{ 0x30, 0x0C },
> +	{ 0x33, 0x00 },
> +	{ 0x34, 0x00 },
> +	{ 0x35, 0x00 },
> +	{ 0x36, 0x92 },
> +	{ 0x37, 0x40 },
> +	{ 0x38, 0xFF },
> +	{ 0x39, 0x00 },
> +	{ 0x3A, 0x00 },
> +	{ 0x3B, 0x00 },
> +	{ 0x3C, 0x00 },
> +	{ 0x3D, 0x00 },
> +	{ 0x40, 0x00 },
> +	{ 0x41, 0x00 },
> +	{ 0x42, 0x00 },
> +	{ 0x43, 0x00 },
> +	{ 0x44, 0x00 },
> +	{ 0x45, 0x00 },
> +	{ 0x46, 0x20 },
> +	{ 0x47, 0x00 },
> +	{ 0x48, 0x00 },
> +	{ 0x49, 0x00 },
> +	{ 0x4A, 0x00 },
> +	{ 0x4B, 0x00 },
> +	{ 0x4C, 0x00 },
> +	{ 0x4D, 0x00 },
> +	{ 0x4E, 0x00 },
> +	{ 0x4F, 0x00 },
> +	{ 0x50, 0x00 },
> +	{ 0x51, 0x00 },
> +	{ 0x52, 0x00 },
> +	{ 0x53, 0x00 },
> +	{ 0x54, 0x00 },
> +	{ 0x55, 0x20 },
> +	{ 0x56, 0x00 },
> +	{ 0x57, 0x00 },
> +	{ 0x58, 0x00 },
> +	{ 0x59, 0x00 },
> +	{ 0x5A, 0x00 },
> +	{ 0x5B, 0x00 },
> +	{ 0x5C, 0x00 },
> +	{ 0x5D, 0x00 },
> +	{ 0x5E, 0x00 },
> +	{ 0x5F, 0x00 },
> +	{ 0x60, 0x00 },
> +	{ 0x61, 0x00 },
> +	{ 0x62, 0x00 },
> +	{ 0x63, 0x00 },
> +	{ 0x64, 0x20 },
> +	{ 0x65, 0x00 },
> +	{ 0x66, 0x00 },
> +	{ 0x67, 0x00 },
> +	{ 0x68, 0x00 },
> +	{ 0x69, 0x00 },
> +	{ 0x6A, 0x00 },
> +	{ 0x6B, 0x00 },
> +	{ 0x6C, 0x00 },
> +	{ 0x6D, 0x00 },
> +	{ 0x6E, 0x00 },
> +	{ 0x6F, 0x00 },
> +	{ 0x70, 0x00 },
> +	{ 0x71, 0x00 },
> +	{ 0x72, 0x00 },
> +	{ 0x73, 0x20 },
> +	{ 0x74, 0x00 },
> +	{ 0x75, 0x00 },
> +	{ 0x76, 0x00 },
> +	{ 0x77, 0x00 },
> +	{ 0x78, 0x00 },
> +	{ 0x79, 0x00 },
> +	{ 0x7A, 0x00 },
> +	{ 0x7B, 0x00 },
> +	{ 0x7C, 0x00 },
> +	{ 0x7D, 0x00 },
> +	{ 0x7E, 0x00 },
> +	{ 0x7F, 0x00 },
> +	{ 0x80, 0x00 },
> +	{ 0x81, 0x00 },
> +	{ 0x82, 0x20 },
> +	{ 0x83, 0x00 },
> +	{ 0x84, 0x00 },
> +	{ 0x85, 0x00 },
> +	{ 0x86, 0x00 },
> +	{ 0x87, 0x00 },
> +	{ 0x88, 0x00 },
> +	{ 0x89, 0x00 },
> +	{ 0x91, 0x00 },
> +	{ 0x8A, 0x00 },
> +	{ 0x8B, 0x07 },
> +	{ 0x8C, 0x70 },
> +	{ 0x8D, 0x00 },
> +	{ 0x8E, 0x00 },
> +	{ 0x8F, 0x02 },
> +	{ 0xA1, 0x40 },
> +	{ 0xA2, 0x08 },
> +	{ 0xA3, 0x20 },
> +	{ 0xA4, 0x00 },
> +	{ 0xA5, 0x1A },
> +	{ 0xA6, 0x52 },
> +	{ 0xA7, 0x00 },
> +	{ 0xA8, 0x28 },
> +	{ 0xA9, 0x25 },
> +	{ 0xAA, 0x44 },
> +	{ 0xAB, 0x62 },
> +	{ 0xAC, 0x04 },
> +	{ 0xAD, 0x00 },
> +	{ 0xAE, 0x00 },
> +	{ 0xAF, 0x00 },
> +	{ 0xB0, 0x00 },
> +	{ 0xB1, 0x00 },
> +	{ 0xB2, 0x00 },
> +	{ 0xB3, 0x04 },
> +	{ 0xB4, 0x00 },
> +	{ 0xB5, 0x00 },
> +	{ 0xB7, 0x20 },
> +	{ 0xB8, 0x7C },
> +	{ 0xB9, 0x0B },
> +	{ 0xBB, 0x42 },
> +	{ 0xBC, 0x42 },
> +	{ 0xBD, 0x61 },
> +	{ 0xBE, 0x67 },
> +	{ 0xBF, 0x02 },
> +};
> +
> +static const struct reg_default ma5311_adc_reg_def[] = {
> +	{ 0x00, 0xA5 },
> +	{ 0x01, 0x6C },
> +	{ 0x02, 0x07 },
> +	{ 0x03, 0x00 },
> +	{ 0x04, 0xFF },
> +	{ 0x05, 0xFF },
> +	{ 0x06, 0x00 },
> +	{ 0x07, 0xC0 },
> +	{ 0x08, 0xC0 },
> +	{ 0x09, 0x10 },
> +	{ 0x0A, 0x10 },
> +	{ 0x0B, 0xFF },
> +	{ 0x0C, 0x6C },
> +	{ 0x0D, 0x6C },
> +	{ 0x0E, 0x00 },
> +	{ 0x0F, 0x02 },
> +	{ 0x10, 0xA5 },
> +	{ 0x11, 0x6C },
> +	{ 0x12, 0x07 },
> +	{ 0x13, 0x00 },
> +	{ 0x14, 0xFF },
> +	{ 0x15, 0xFF },
> +	{ 0x16, 0x00 },
> +	{ 0x17, 0xC0 },
> +	{ 0x18, 0xC0 },
> +	{ 0x19, 0x10 },
> +	{ 0x1A, 0x10 },
> +	{ 0x1B, 0xFF },
> +	{ 0x1C, 0x6C },
> +	{ 0x1D, 0x6C },
> +	{ 0x1E, 0x00 },
> +	{ 0x1F, 0x02 },
> +	{ 0x20, 0xA5 },
> +	{ 0x21, 0x6C },
> +	{ 0x22, 0x07 },
> +	{ 0x23, 0x00 },
> +	{ 0x24, 0xFF },
> +	{ 0x25, 0xFF },
> +	{ 0x26, 0x00 },
> +	{ 0x27, 0xC0 },
> +	{ 0x28, 0xC0 },
> +	{ 0x29, 0x10 },
> +	{ 0x2A, 0x10 },
> +	{ 0x2B, 0xFF },
> +	{ 0x2C, 0x6C },
> +	{ 0x2D, 0x6C },
> +	{ 0x2E, 0x00 },
> +	{ 0x2F, 0x02 },
> +	{ 0x30, 0xA5 },
> +	{ 0x31, 0x6C },
> +	{ 0x32, 0x07 },
> +	{ 0x33, 0x00 },
> +	{ 0x34, 0xFF },
> +	{ 0x35, 0xFF },
> +	{ 0x36, 0x00 },
> +	{ 0x37, 0xC0 },
> +	{ 0x38, 0xC0 },
> +	{ 0x39, 0x10 },
> +	{ 0x3A, 0x10 },
> +	{ 0x3B, 0xFF },
> +	{ 0x3C, 0x6C },
> +	{ 0x3D, 0x6C },
> +	{ 0x3E, 0x00 },
> +	{ 0x3F, 0x02 },
> +};

> +static bool ma5311_adc_volatile_register(struct device *dev, unsigned int reg)
> +{
> +	return false;
> +}

Like I said on v1 this is the default so the function can be dropped.

> +static int ma5311_reset(struct snd_soc_component *component)
> +{

> +	ma5311->adc1_vol_left = 0xc0;
> +	ma5311->adc1_vol_right = 0xc0;
> +	ma5311->adc2_vol_left = 0xc0;
> +	ma5311->adc2_vol_right = 0xc0;
> +	ma5311->adc3_vol_left = 0xc0;
> +	ma5311->adc3_vol_right = 0xc0;
> +	ma5311->adc4_vol_left = 0xc0;
> +	ma5311->adc4_vol_right = 0xc0;
> +	ma5311->adc1_pga_left = 0x10;
> +	ma5311->adc1_pga_right = 0x10;
> +	ma5311->adc2_pga_left = 0x10;
> +	ma5311->adc2_pga_right = 0x10;
> +	ma5311->adc3_pga_left = 0x10;
> +	ma5311->adc3_pga_right = 0x10;
> +	ma5311->adc4_pga_left = 0x10;
> +	ma5311->adc4_pga_right = 0x10;

Like I said on v1 we usually leave the device with the hardware defaults
to avoid having to decide on a specific use case in the kernel -
presumably the defaults in the hardware were chosen for a reason.

> +	ma5311->capture_mode = I2S_ADC1;

What about playback_mode and dapm_aif_in?

> +static int ma5311_adc_volume_control_get(struct snd_kcontrol *kcontrol,
> +					 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
> +	const struct soc_mixer_control *mc =
> +		(const struct soc_mixer_control *)kcontrol->private_value;
> +	unsigned int *cache = ma5311_adc_volume_control_cache(ma5311, mc->reg);
> +	unsigned int val;
> +	int ret;
> +
> +	if (!cache)
> +		return -EINVAL;
> +
> +	ret = regmap_read(ma5311->adc_regmap, mc->reg, &val);
> +	if (ret)
> +		return ret;
> +
> +	ucontrol->value.integer.value[0] = val & MA5311_ADC_VOL_CTRL_MASK;
> +	*cache = ucontrol->value.integer.value[0];
> +
> +	return 0;
> +}

I still don't understand why we have these open coded caches rather than
just using a regmap cache and the standard helpers, it'd be a lot less
code.

> +static int ma5311_playback_mode_put(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
> +	unsigned int val = ucontrol->value.enumerated.item[0];
> +
> +	if (val >= ARRAY_SIZE(ma5311_playback_mode_text)) {
> +		dev_err(ma5311->dev, "%s: Out of range\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if (ma5311->playback_mode == val)
> +		return 0;
> +
> +	switch (val) {
> +	case TDM01:
> +	case TDM23:
> +	case TDM45:
> +	case TDM67:
> +	}
> +
> +	ma5311->playback_mode = val;

This doesn't handle the I2S option so we won't reset if the user flips
back to that.  More generally this feels like it ought to just be a
set_tdm_slot() operation?

> +static int ma5311_reset_control_get(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
> +
> +	if (!ma5311->reset_gpio)
> +		return -ENODEV;

As I said on v1 it'd be better to just not register this control if we
don't have the GPIO.

> +static int ma5311_reset_control_put(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{

> +	ret = ma5311_reset(component);

This might break the machine driver if it's relying on setting the DAI
up during probe()...

> +static int ma5311_dapm_aif_in_put(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_dapm_kcontrol_to_dapm(kcontrol);
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
> +	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
> +	unsigned int val = ucontrol->value.enumerated.item[0];
> +	unsigned int old_val = ma5311->dapm_aif_in;
> +	int ret;
> +
> +	if (val >= ARRAY_SIZE(ma5311_aif_in_source_text)) {
> +		dev_err(ma5311->dev, "%s: Out of range\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if (ma5311->dapm_aif_in == val)
> +		return 0;
> +
> +	ma5311->dapm_aif_in = val;

DAPM is already storing the value - you could just read it with
dapm_kcontrol_get_value().

> +static int ma5311_adc_event(struct snd_soc_dapm_widget *w,
> +			    struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
> +	unsigned int mux = ma5311->capture_mode;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		regmap_update_bits(ma5311->ctrl_regmap, MA5311_DAC_A2_TOP_MAN2,
> +				   MA5311_PLL_MASK, MA5311_PLL_ON);
> +
> +		regmap_update_bits(ma5311->ctrl_regmap,
> +				   MA5311_DAC_00_SYSTEM_CTRL1,
> +				   MA5311_POWER_MASK, MA5311_POWER_ON);
> +
> +		switch (mux) {
> +		case I2S_ADC1:
> +			regmap_update_bits(ma5311->adc_regmap,
> +					   MA5311_ADC_CH1_00_GENERAL_SETTING,
> +					   MA5311_ADC_POWER_MASK,
> +					   MA5311_ADC_POWER_ON);
> +			regmap_update_bits(ma5311->adc_regmap,
> +					   MA5311_ADC_CH1_0E_MUTE_DATA_FLOW,
> +					   MA5311_ADC_MUTE_BOTH_MASK,
> +					   MA5311_ADC_BOTH_DEMUTE);
> +			break;
> +		case I2S_ADC2:
> +			regmap_update_bits(ma5311->adc_regmap,
> +					   MA5311_ADC_CH1_00_GENERAL_SETTING,
> +					   MA5311_ADC_POWER_MASK,
> +					   MA5311_ADC_POWER_ON);
> +			regmap_update_bits(ma5311->adc_regmap,
> +					   MA5311_ADC_CH1_0E_MUTE_DATA_FLOW,
> +					   MA5311_ADC_MUTE_BOTH_MASK,
> +					   MA5311_ADC_BOTH_DEMUTE);

Could use a comment about ADC2 enabling ADC1 as well (similarly for ADC4
and ADC3).

> +	SND_SOC_DAPM_OUT_DRV_E("AMP Power", SND_SOC_NOPM, 0, 0, NULL, 0,
> +			       ma5311_power_event,
> +			       SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD |
> +			       SND_SOC_DAPM_POST_PMU),

The function doesn't need all the events?

> +static const struct regmap_config ma5311_ctrl_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +
> +	.max_register = MA5311_DAC_FF_VERSION,
> +	.readable_reg = ma5311_ctrl_readable_register,
> +	.writeable_reg = ma5311_ctrl_writeable_register,
> +	.volatile_reg = ma5311_ctrl_volatile_register,
> +
> +	.cache_type = REGCACHE_NONE,

As I said above and on v1 you should probably enable caches here, it'd
simplify the rest of the code.

> +		dev_dbg(component->dev, "Estimated TDM BCLK: %u Hz\n", bclk);
> +	} else if (ma5311->format == SND_SOC_DAIFMT_I2S) {
> +		bclk = params_rate(params) * params_physical_width(params) *
> +		       params_channels(params);

Note that I2S always needs to clock two channels even for mono streams.

> +static int ma5311_dai_set_tdm_slot(struct snd_soc_dai *dai,
> +				   unsigned int tx_mask, unsigned int rx_mask,
> +				   int slots, int slot_width)
> +{

rx_mask should be what the playback mode is doing I think.

> +static int ma5311_dai_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct ma5311_priv *ma5311 = snd_soc_component_get_drvdata(component);
> +	unsigned int val;
> +
> +	if (stream == SNDRV_PCM_STREAM_CAPTURE)
> +		return 0;
> +
> +	if (mute || ma5311->force_mute_status) {

Does anything set force_mute_status?

-- 
Mark Brown <broonie@kernel.org>
