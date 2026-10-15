Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF453383993;
	Thu, 15 Oct 2026 17:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083811; cv=none; b=CAHOpp//blTYBp+8zDYqxacR7DwCWR0z8AMs44QnFoOxkB6w8G2OwLwSON5mEm4CJJvjDAy+iAJIpZ5K3MTX0ItpoyXq6xShLMKJ2sivEHs7e+ZbepHR2nnSy/iG/tr9r1Y3qBILPVEaAICWdFj3nGu7gIW8p/HWwLZ0GREi6vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083811; c=relaxed/simple;
	bh=mTsCIQlQlZ+s0i8gJLekPM5yddZtsSJVjZ/7RlKj1PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J65hchKzPnOzYBKY7KsIZQ2FykfVd9gL78OvH9EsAANhIJOb0yYaqaf26VevvJdxYkMtglHQAbdMIj4bOkXMjbNSmCk+kBNJy0HpRvsbxunZBeEd9qgk/DZiyUalEAyZxhJB+mM0U5vwDd2Fw27vNbK/kclqdgCye18MllvMLB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eY8xqAJH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eY8xqAJH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E6A1F000C4;
	Thu, 15 Oct 2026 17:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792083798;
	bh=LhnZdj1n9jEiu2uk0jULpLtCBawhN6CksHAm8WDiTmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eY8xqAJHNT/9VMHehk3h2r3VKHap4XWBTDvU7FdwAAf+UlSmFV4C5jkxi2JeEykLw
	 LHxigb6YdlVT8Pr9mWAJgho5u+XoUrwNM0fRE11tdJ2i7ht0QpcTO2nda19ZMj8YCf
	 +n24IFub1OqkPZaO8ETUOPSurRq5RhPsenhvFQBLhhpFgtj1jSCrlEmj0jggK94vif
	 8f5kSTVu68UOYWZ330x2sNRmfKDHr+29OhQL58TMoWNUwmULvpOdArsoGO4O3oucQl
	 TSPaeJc0R3pwjoIFVQrMrtpMe6xQhxuXsM/+q+gu3axH4RcWvg+9qZiEtydAB1Ld7Y
	 ineBcQWsTGRpg==
Date: Thu, 15 Oct 2026 18:03:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Hyunuk Son <hyunuk.son@irondevice.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	kiseok.jo@irondevice.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: Add driver for Iron Device MA5311
Message-ID: <9ec997b1-8443-466b-bafb-a25f9b5c47ff@sirena.org.uk>
References: <20261015060408.128711-1-hyunuk.son@irondevice.com>
 <20261015060408.128711-3-hyunuk.son@irondevice.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cYFLMnh1SSjLn+6V"
Content-Disposition: inline
In-Reply-To: <20261015060408.128711-3-hyunuk.son@irondevice.com>
X-Cookie: Tax and title extra.


--cYFLMnh1SSjLn+6V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 03:04:07PM +0900, Hyunuk Son wrote:
> Add an ASoC codec driver for the Iron Device MA5311.
>=20
> The driver supports audio playback and capture through I2S
> and TDM interfaces. It provides ALSA mixer controls for audio
> configuration and uses regmap for register access.

There's some issues below, but nothing too major I think.

> +static bool ma5311_adc_volatile_register(struct device *dev, unsigned in=
t reg)
> +{
> +	return false;
> +}

You can just not provide a volatile function, the default is nothing
volatile.  Since the driver isn't enabling a register cache volatile
makes no difference anyway.

> +static int ma5311_reset(struct snd_soc_component *component)
> +{

> +	ma5311->adc1_vol_left =3D 0xc0;
> +	ma5311->adc1_vol_right =3D 0xc0;
> +	ma5311->adc2_vol_left =3D 0xc0;
> +	ma5311->adc2_vol_right =3D 0xc0;
> +	ma5311->adc3_vol_left =3D 0xc0;
> +	ma5311->adc3_vol_right =3D 0xc0;
> +	ma5311->adc4_vol_left =3D 0xc0;
> +	ma5311->adc4_vol_right =3D 0xc0;
> +	ma5311->adc1_pga_left =3D 0x10;
> +	ma5311->adc1_pga_right =3D 0x10;
> +	ma5311->adc2_pga_left =3D 0x10;
> +	ma5311->adc2_pga_right =3D 0x10;
> +	ma5311->adc3_pga_left =3D 0x10;
> +	ma5311->adc3_pga_right =3D 0x10;
> +	ma5311->adc4_pga_left =3D 0x10;
> +	ma5311->adc4_pga_right =3D 0x10;
> +	ma5311->capture_mode =3D I2S_ADC1;

Normally we just go with the hardware defaults for everything and let
userspace set what it needs, this is mainly because different use cases
often need different defaults.  Why are we setting all these volumes
here?

> +static int ma5311_adc_pga_control_put(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	const struct soc_mixer_control *mc =3D
> +	    (const struct soc_mixer_control *)kcontrol->private_value;
> +	unsigned int *cache;
> +	unsigned int val =3D ucontrol->value.integer.value[0];
> +
> +	if (val < 0 || val > MA5311_ADC_PGA_CTRL_MASK)
> +		return -EINVAL;
> +
> +	cache =3D ma5311_adc_pga_control_cache(ma5311, mc->reg);

It's not clear to me why we have this cache code - I didn't spot where
do anything with it outside of these get/put operations, it looks like
exactly the sort of cache that you'd get from the regmap cache code.
AFAICT could get it for free and just use the standard control
implementations by enabling a register cache in regmap, if you don't
want a cache for other registers for some reason you can mark them as
volatile.

> +static int ma5311_capture_mode_put(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +	unsigned int val =3D ucontrol->value.enumerated.item[0];
> +
> +	if (val >=3D ARRAY_SIZE(ma5311_capture_mode_text)) {
> +		dev_err(ma5311->dev, "%s: Out of range\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if (ma5311->capture_mode =3D=3D val)
> +		return 0;
> +
> +	if (ma5311->adc_power_status) {
> +		dev_err(ma5311->dev, "Try after capture is complete.\n");
> +		return -EBUSY;
> +	}

There's no locking between this and DAPM so we could race with power up
here.  Taking the DAPM mutex ought to do enough.

> +static int ma5311_reset_control_get(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct ma5311_priv *ma5311 =3D snd_soc_component_get_drvdata(component);
> +
> +	if (!ma5311->reset_gpio)
> +		return -ENODEV;

It'd be better to only register this control if the GPIO is present,
that way we don't have a broken control that reports errors to userspace
if the system can't support it.  It's a bit of a dodgy control to have
in the first place, it's rather disruptive if used at the wrong time,
but I'm not totally against it for devices that are likely to only be
used with highly controlled userspaces.

> +	switch (params_width(params)) {
> +	case 16:
> +	case 24:
> +	case 32:
> +		break;
> +	default:
> +		dev_err(component->dev, "%s: unsupported PCM format: %d\n",
> +			__func__, params_format(params));
> +		return -EINVAL;
> +	}

Don't we need to configure anything in the hardware for clock provider
mode here?

> +#define MA5311_RATES_PLAYBACK SNDRV_PCM_RATE_8000_96000
> +#define MA5311_RATES_CAPTURE SNDRV_PCM_RATE_8000_96000
> +#define MA5311_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_L=
E)

These don't seem to match what hw_params() accepts.

> +static struct snd_soc_dai_driver ma5311_dai[] =3D {
> +	{
> +	 .name =3D "ma5311-amplifier",
> +	 .id =3D 0,
> +	 .playback =3D {
> +		      .stream_name =3D "Playback",
> +		      .channels_min =3D 1,
> +		      .channels_max =3D 2,
> +		      .rates =3D MA5311_RATES_PLAYBACK,
> +		      .formats =3D MA5311_FORMATS,
> +		      },
> +	 .capture =3D {
> +		     .stream_name =3D "Capture",
> +		     .channels_min =3D 1,
> +		     .channels_max =3D 8,
> +		     .rates =3D MA5311_RATES_CAPTURE,
> +		     .formats =3D MA5311_FORMATS,
> +		     },
> +	 .ops =3D &ma5311_dai_ops_amp,
> +	  },
> +};

I think the device needs symmetric rate and widths too?

> +static irqreturn_t ma5311_irq_thread(int irq, void *data)
> +{
> +	struct ma5311_priv *ma5311 =3D data;
> +	unsigned int dac_status;
> +	unsigned int dac_ocp_status;
> +	unsigned int dac_scp_status;
> +	int ret =3D 0;
> +
> +	ret |=3D regmap_read(ma5311->ctrl_regmap,
> +			   MA5311_DAC_EA_DAC_STATUS, &dac_status);
> +
> +	ret |=3D regmap_read(ma5311->ctrl_regmap,
> +			   MA5311_DAC_EB_DAC_OCP_STATUS, &dac_ocp_status);
> +
> +	ret |=3D regmap_read(ma5311->ctrl_regmap,
> +			   MA5311_DAC_EC_DAC_SCP_STATUS, &dac_scp_status);
> +
> +	if (ret) {
> +		dev_crit(ma5311->dev,
> +			 "Error Occurred During Interrupt Handling\n");
> +		return ret;

This should be IRQ_NONE, we're returning irqreturn_t not an error code.

--cYFLMnh1SSjLn+6V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrRB1AACgkQJNaLcl1U
h9AhtQf/e2jLD9fxuDBrHk8pkz2hcUBlKE8hxvgOZzvrDeSwKFZUhwjUvxo2iGkb
+4AVJj0GUNEFsn9aAa0O31xZJY5yyiIpOT7cr5fWBWxN3D6pYZo0wcvLLbiy9PFc
fKPN4TaHZgsqLF12MLEEL3lqhuy2GUuW/eaEsmd2UCdJArmY9/hG0iOQU87Jxb9F
zUJKtQTTIJjgkb5oKOyqjfldHUD++kIiOCkSiTgl2NaqrPo+nuhpAJX0XUd71Xei
eXwcEBUu+4T990pkL7O6+/eAnALTXzkNPlyYsWiFVjINinnj2zzXhEBBq3ukr/wn
UzRbkjJ9+9vbAazZUiQZXX/ZJG9xWA==
=gSmu
-----END PGP SIGNATURE-----

--cYFLMnh1SSjLn+6V--
