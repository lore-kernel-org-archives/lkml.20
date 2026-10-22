Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690446;
	b=xirk50kK9W9IfB5sf0rM0hOvMlR4k3ti744Z0Ra6UP++Vto25ELiAuiAMRjZZ/U4/s/S
	 bbLWWGtfbSx/UlUuyVJbv4wj0yXhl/uTV8siPsVt7fJnfZm2iAsW8TtJcDvuVnOM3rNj1
	 xSLgK3u5yirEgme3f+TJXnHvA30BtG5r/UB6Tt8BNzJJe5RzVYXbESK6y+jglORZHTpH0
	 48GTNEGQH52Cq5AsI0H+2Y1EPUuOFiHO3AO+Zz3eaT+Dza+B6jPleNpk4gZD6746HeEdE
	 Zb4FE+z6iPJFIdAEM0EoA3q8KVipygxKMCMyMQe0FS7A3TVAyvSNzqcApGO7uvfnNFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690446;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=0XvFlqUXbgjXd8QoeyXHGf/RZE4LuYZTEQdwsJH8YTw=;
	b=f163MFEoFxxRLw7XrWc1v/+R0xSHsLFSXCKTAckG8DfnF5PsNikS/xO4Fg7FHwAPyyEQ
	 mGwmg6DsgcHDkm4Jhd0z7L8fQHMbw4PztOOx28UO6quklaxYPGm7yoGU2Fy+1UjT59aFG
	 VpaP4I3cU140fJASBaKqMSg9Ej7wS55R2eA322XB5EXkRkpkkZUgUDPVO3nXJzz5q4Mfy
	 WCCjGg4hfafKM7vu/o3tafztV3CADGfYs/0C/aODJnMhEfeiDZGbV4RIlLCa89ntIzlXD
	 au8LHFZbm2T4DV1JhrGfu4tYkSY3SX/pMjVVoS+xWADmYZn3nM2TMOJ8M/q+TMyNslQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+Jx1h8t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86C2606A319;
	Thu, 22 Oct 2026 17:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+Jx1h8t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3E01F01825;
	Thu, 22 Oct 2026 17:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792690445;
	bh=0XvFlqUXbgjXd8QoeyXHGf/RZE4LuYZTEQdwsJH8YTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L+Jx1h8tXHgW1BkDEl55zloUFF9fhuc6VcuHIga8kJ9at5/dQZKZiMCpt0war6LaL
	 lORDyXqcJkn0hYeQfuAN3MDYlp+EUXNjZrLPerGZh9ZvMASCHjf8QY/1Zs4q3iPUiu
	 cXKWgTq0xsdSih3J7YE8A+xiSk31c91IFfemp75Erhcf2C6te+FTBuaNBUgIvYKfWf
	 5SMSOPqzZy2s5G8B5tB3rptLbiJaLiC2bJPWi0MO+754IQNkvCSFTQrg34lfePByed
	 RkyRKZc0aylJQVSe4PJPxU+MoMc16BTmSJMULmGrZ/OH5oIp7SymU3ld5yaGExgT6Q
	 dDg+AgRmTAUmg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 2BD6D1D52C5E; Thu, 22 Oct 2026 18:34:03 +0100 (BST)
Date: Thu, 22 Oct 2026 18:34:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 5/5] regulator: Add TI LM51772 support
Message-ID: <atpJCnOMOlLSNvqL@sirena.org.uk>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-5-25f0ffbffa8d@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QcESR9xqzCtLrcVG"
Content-Disposition: inline
In-Reply-To: <20261021-paul-lm51772-v1-5-25f0ffbffa8d@bootlin.com>
X-Cookie: Whoever dies with the most toys wins.


--QcESR9xqzCtLrcVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2026 at 12:27:46PM +0200, Paul Louvel wrote:

> +static int lm51772_regulator_set_voltage_sel(struct regulator_dev *rdev, unsigned int selector)
> +{
> +	const struct lm51772_priv *priv = rdev_get_drvdata(rdev);
> +	int ret;

> +	/*
> +	 * The LM51772 uses hardcoded OVP thresholds. Update the OVP threshold
> +	 * to match the new voltage.
> +	 */
> +	if (priv->ovp_thres) {
> +		ret = regulator_list_voltage_pickable_linear_range(rdev, selector);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = lm51772_set_ov(rdev, ret + priv->ovp_thres);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return regulator_set_voltage_sel_pickable_regmap(rdev, selector);

If the voltage is being lowered this will lower the threashold prior to
lowering the voltage which could cause the protection to flag.  I guess
we need to look to see if the voltage is being raised or lowered and do
the change before or after as appropriate.

> +static int lm51772_regulator_set_current_limit(struct regulator_dev *rdev, int min_uA, int max_uA)
> +{
> +	struct lm51772_priv *priv = rdev_get_drvdata(rdev);
> +	u64 voltage_uV = ((u64)priv->sense_res_milliohms * max_uA) / 1000;

Does this build on arm32 or similar things that need a libgcc division
implmentation?  div_u64().

> +	if (status_reg & LM51772_STAT_INPUT)
> +		errors |= REGULATOR_ERROR_UNDER_VOLTAGE;

That sounds like an error with the input so I'm not sure under voltage
is the right error to report.

> +static int lm51772_irq_map_event(int irq, struct regulator_irq_data *rid,
> +			     unsigned long *dev_mask)
> +{
> +	struct regmap *regmap = rid->data;
> +	unsigned int reg, errors;
> +	int ret;
> +
> +	ret = regmap_read(regmap, LM51772_REG_STATUS_BYTE, &reg);
> +	if (ret)
> +		return REGULATOR_FAILED_RETRY;
> +
> +	errors = lm51772_status2err(reg);

Does this do the right thing if multiple errors are flagged?

> +static int lm51772_irq_renable(struct regulator_irq_data *rid)
> +{
> +	struct regmap *regmap = rid->data;
> +	unsigned int reg;
> +	int ret;
> +
> +	ret = regmap_read(regmap, LM51772_REG_STATUS_BYTE, &reg);
> +	if (ret)
> +		return REGULATOR_FAILED_RETRY;
> +
> +	if (rid->opaque && rid->opaque == reg) {
> +		ret = regmap_read(regmap, LM51772_REG_CLEAR_FAULTS, &reg);
> +		if (ret)
> +			return REGULATOR_FAILED_RETRY;

Shoud _CLEAR_FAULTS be volatile?

> +static const struct reg_default lm51772_reg_defaults[] = {
> +	{ LM51772_REG_CLEAR_FAULTS, 0x00 },	{ LM51772_REG_ILIM_THRESHOLD, 0x64 },
> +	{ LM51772_REG_VOUT_TARGET1_LSB, 0x58 }, { LM51772_REG_VOUT_TARGET1_MSB, 0x02 },
> +	{ LM51772_REG_STATUS_BYTE, 0x00 },	{ LM51772_REG_USB_PD_CONTROL_0, 0x01 },

STATUS_BYTE is volatile so a default isn't terribly sensible (but
harmless).

--QcESR9xqzCtLrcVG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatpJCgAKCRAv73Ows9A4
iYfbAP4qFe1CIB3GbB1uv46hvpg0gJXXou2qslV8ZrYY9upP9gEAwvrkBVZHkprn
EjULYUIfnYfVliSNdmH8w8wW9Ae8Sgw=
=B2k2
-----END PGP SIGNATURE-----

--QcESR9xqzCtLrcVG--
