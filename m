Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A9D49B45C;
	Fri, 18 Sep 2026 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728392; cv=none; b=enUkJ9By7dFovJjpF3Zco8wtrRGR0UJDOCNNRHpPrOVrncIqwHGX/GeDMk8D5C4+OhQ3epm3D8x1IuXxLx2sHMuvDpsx90QXbiBNyw6A4+dJwoWDoGfZn231CKpShi6QeAxoPF8T2GJbVrVf5XE17qo8Z5hkHXTFfhdtcyanNH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728392; c=relaxed/simple;
	bh=HHAZ5lTeJWzU8Vui1L5vwiqUmBSAi20BCMs6POiaueI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nC1VVaK1nQoIBNdEi5mlL/K13zWgNm6UeH/jycpRDiIqPSBwyLHsk2LYCQsHQWYNBzCAw3wGcoEddMPR5iauTiQEwAJ3vjzOf3HB8Fhi3L4IMxIe31VuNeoVqvvEz23e9/A/cFzVyeD/kqe1NcozoghIBKfgBaj1itNH8Wg2Hrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7+Q7mxy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7+Q7mxy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DA31F00893;
	Fri, 18 Sep 2026 10:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789728390;
	bh=+5NSXgd4dmfF/rzNqDr6QDFjuYikUh14MTW3gOgwoAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F7+Q7mxyjJLv70AY6vBIQ+JsxPpRkFPm/2XsiRsJJ7/BJM2vBvVBvcyUvGf2FRJkc
	 QVf6MTKDqdXu9H0XU55NGNjh6sS5N9H67EzHHhDxcZALE3tJIvhjm/mCSbyKwPI9L7
	 KE0WBK5cVGiy2+0uBqInaPSfiEHSA/w7nkUni7saCgUEKS4cVTF5WO0eXQRXNh4JgT
	 ZcNkXtQpcyb8gDsHSb9pkMuNlPzlkf+dyhx+HhojFGPm24AY5yQ3AH7Lfe2IpStnPD
	 xg1drLFEyB0p81iOTfm0/2mWyz+QzeQndjafKHUpYzmPmmHktRik/+AdYHLTvsk2Ox
	 8HieoDsNChRHA==
Date: Fri, 18 Sep 2026 11:46:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Karl Asseily <karl@asseily.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M
 codec driver
Message-ID: <321e417b-55cf-4667-9c52-cbf3548561e6@sirena.org.uk>
References: <20260918031326.68542-1-karl@asseily.com>
 <20260918031326.68542-4-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wALooj7ViTBohjg6"
Content-Disposition: inline
In-Reply-To: <20260918031326.68542-4-karl@asseily.com>
X-Cookie: Dental health is next to mental health.


--wALooj7ViTBohjg6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 18, 2026 at 06:13:25AM +0300, Karl Asseily wrote:
> The ES9039Q2M is a 32-bit two-channel audio DAC with an asynchronous
> sample rate converter. It selects between two control personalities with
> its MODE pin: hardware mode, strapped by HW0/HW1/HW2 with no control bus
> at all, and software mode over I2C or SPI. This driver implements
> software mode over I2C, which MODE = GND selects.

> +static int es9039_fir_put(struct snd_kcontrol *kcontrol,
> +			  const unsigned int __user *bytes, unsigned int size)
> +{
> +	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
> +	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(c);
> +	struct soc_bytes_ext *be = (void *)kcontrol->private_value;
> +	struct es9039_fir_ctl *p = container_of(be, struct es9039_fir_ctl, be);
> +	u8 *buf;
> +	int ret, i;
> +
> +	if (size != p->taps * ES9039_COEFF_BYTES)
> +		return -EINVAL;
> +
> +	buf = memdup_user(bytes, size);
> +	if (IS_ERR(buf))
> +		return PTR_ERR(buf);
> +
> +	/*
> +	 * PROG_COEFF_WE is a per-coefficient strobe, not a gate held open
> +	 * across the upload. The datasheet's sequence is address, data, raise
> +	 * WE, lower WE, once per coefficient. Holding it high for the whole
> +	 * loop also appears to work on ES9039Q2M silicon, but "appears to
> +	 * work" is not a specification.
> +	 */
> +	for (i = 0; i < p->taps; i++) {
> +		ret = regmap_write(priv->regmap, ES9039_PROG_RAM_ADDR,
> +				   (p->stage_4x ? ES9039_PROG_STAGE_4X : 0) |
> +				   FIELD_PREP(ES9039_PROG_ADDR_MASK, i));
> +		if (ret)
> +			goto out;

...

> +out:
> +	regmap_update_bits(priv->regmap, ES9039_PROG_RAM_CTRL,
> +			   ES9039_PROG_COEFF_WE, 0);
> +	kfree(buf);
> +	if (ret)
> +		return ret;

How does this work with suspend and resume if the device is powered down
in suspend?  It looks like this is doing some windowing stuff and needs
a specific write sequence.

--wALooj7ViTBohjg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtFoAACgkQJNaLcl1U
h9AwSwf6AgqtCsZuhWCr32RHSRWAIjArx/ghEUPhLAH7hWwJjQDv94auZK7yV4Po
aE8XHqW358yHkReIHXBgJauskKyGAGruKVzN5uW5PbtTjkZed1iefh//0LfujnW4
ieJZpwnEvRl/3yOk1DCQt/rED6PG+bRwPjddFto17B21vBppT1G/O7mDULnNS5Ma
Z5EjWTnQ2cA2NHvo/G+YGvCB5u1zebR6K7U/xGK8v/JBHwH+P1ik9xl57kF5S3g3
r5FbAW3b0csIIGOhBuRcFYgAIFjO3JeRIeg69NhhNqqsIs+SLQYFFBkz5qAXNgeF
l1T71tBjDHRt5OpHbDhJfmIuzgVkbQ==
=p7If
-----END PGP SIGNATURE-----

--wALooj7ViTBohjg6--
