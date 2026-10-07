Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD3B38F929;
	Wed,  7 Oct 2026 08:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362362; cv=none; b=ix1+Twy6HHdeh2W8mLUuOQ1vFTFrQNBn2uN0ekT3glDydmyH+Kwpqqqeb+BXbprcO/9R/PhPp5hlPlhw7SRnwXFAND+daE3noShY5MRdyTEfSgtWFcuB7/DTuKJOpgcmEELEHO6gVOGHr6pXA+2JsIZ4RmMSTPCnZvG5h98eqZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362362; c=relaxed/simple;
	bh=IpCssoHMpu1iPzNWg7jTp2ur+01/KKBjGRoCGTF0D9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFCA7z21L8jTIZuctIyWLGBWODZKnaHEQUcOsOJHrMnbmcXVU5j6lGNPWSD4BNUHmJbLnkf9/uKOAHoQ+GaX4zTAz+hZO10xjkiyy4tnv/2z75yOu43TaxpC9K+fxmezEUGnBEh/FnAZe/WCwOWDhBmk9n7lnZV6RINNabWhHhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBd38k6L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBd38k6L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C061F0089B;
	Wed,  7 Oct 2026 08:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791362359;
	bh=xPda8xsUNzx/u2Pkr/in0fv5oTELlbzMsMFAfwAA8zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZBd38k6Lxo/ZmFSsGSR90OJm7DVA1qCvkw5bOgqPOiVqokSwn2RXfBnh5iUylqfgn
	 +Jnz9vvyvM5t4H4uwuBRsZUpXFE/pqjYbpopfhpfApNG9KNW46r8RmeaAihXpAvlR5
	 9AG07tXShF2jeaNsDA8xzXWkjc1UZ8zcI0KdcOwV7P4HYZYSYg2R9V+VoaQ7pmaPQU
	 lJxLpcVejvpSOfQsOY/mOU6mkMRMyAowmABeiisCH0CX/wrxCrndxvbGjfDeSyTzP0
	 FshIM/dfe9W6LoCxnlDQ5PRrh/rSzG8lli57gloBtPvLwwtCqpXiWaukq0HjfqkK7J
	 bmHN4ESDUpzQg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 89C661AC57CE; Wed, 07 Oct 2026 09:39:16 +0100 (BST)
Date: Wed, 7 Oct 2026 10:39:16 +0200
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 5/7] regulator: lp872x: Remove platform_data based
 probing
Message-ID: <asYFNNwVRAcX1V9o@sirena.co.uk>
References: <20261006154431.318936-1-clamor95@gmail.com>
 <20261006154431.318936-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iwGv+bOCoNxtLlyD"
Content-Disposition: inline
In-Reply-To: <20261006154431.318936-6-clamor95@gmail.com>
X-Cookie: You will forget that you ever knew me.


--iwGv+bOCoNxtLlyD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 06, 2026 at 06:44:29PM +0300, Svyatoslav Ryhel wrote:

> The platform_data-based probing is tightly integrated into the lp872x
> driver structure itself; removing just the platform data support is
> impossible without remodeling major parts of the probe sequence.

>  static int lp872x_init_dvs(struct lp872x *lp)
>  {
> -	struct lp872x_dvs *dvs = lp->pdata ? lp->pdata->dvs : NULL;
> -	enum gpiod_flags pinstate;
> +	struct device *dev = lp->dev;
>  	u32 mask[] = { LP8720_EXT_DVS_M, LP8725_DVS1_M | LP8725_DVS2_M };
>  	u32 default_dvs_mode[] = { LP8720_DEFAULT_DVS, LP8725_DEFAULT_DVS };
> +	u8 dvs_state;

> +	device_property_read_u8(dev, "ti,dvs-vsel", (u8 *)&lp->vsel);

Since you're updating this we should fix to read into a local u8 and
assign the value - the cast won't work on big endian.

> +	device_property_read_u8(dev, "ti,dvs-state", &dvs_state);

If these properties are absent then dvs_state won't be updated...

> +	lp->dvs_pin = dvs_state ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;

...so this will be random.

> +	lp->dvs_gpio = devm_gpiod_get_optional(dev, "dvs", lp->dvs_pin);
> +	if (IS_ERR(lp->dvs_gpio)) {
> +		dev_err(dev, "gpio request err: %ld\n", PTR_ERR(lp->dvs_gpio));
> +		return PTR_ERR(lp->dvs_gpio);
>  	}

dev_err_probe()

>  static int lp872x_probe(struct i2c_client *cl)
>  {
> -	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
> +	struct device *dev = &cl->dev;
>  	struct lp872x *lp;
> -	struct lp872x_platform_data *pdata;
> +	u8 general_config;

> +	device_property_read_u8(dev, "ti,general-config", &general_config);
> +	if (device_property_read_bool(dev, "ti,update-config")) {
> +		ret = regmap_write(lp->regmap, LP872X_GENERAL_CFG, general_config);

Same issue here with general_config being uninitialised if absent; this
is a buggy DT but we should still handle it better.

--iwGv+bOCoNxtLlyD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasYFJgAKCRAv73Ows9A4
iVz3AQDPZnCpIpmX0ZnRh3RVJ7n16gcNML23ADUn/tV7wZY58wD/QtUIdATX65sK
ywE4gtoaks8Pc/1EaHCRu8zrKZeF7AY=
=EZDJ
-----END PGP SIGNATURE-----

--iwGv+bOCoNxtLlyD--
