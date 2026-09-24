Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1832438484;
	Thu, 24 Sep 2026 08:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238432; cv=none; b=jmxLk5Q8knCc8V98KLIgM25b1ByXYzTy+X54twhoE72RhVUinALlQWbumOI/6uo/KteQuZYj9yM374/fihFXJ34HoogN5L4OvvQuHtcROTvj+PLxgsswFbONOv6ZDMg2Il6j7SlrJvvgY4R9/Ni0ik5kyou3IEGzK9HXIFlTj7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238432; c=relaxed/simple;
	bh=/ZJPM/j3VoX/brreRRGCIoNNpvJ58Zubgs3wsdoVSp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdFCz96JEthRkNXyj1mj4XGc3ZquVnPxKTwcix2+5WJHpNFLrSV6C8l7y7B5pvVibJ0JaKg0ogB24EyFVdJFZCWU9s0BmafoWnx65CurATtzLBLlDgcav7wBliigjuFshWZynfeQX53obuKZxaxMJAEtxBeCSaYoGOFfRpun2Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCFteEh2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCFteEh2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109141F000FF;
	Thu, 24 Sep 2026 08:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238430;
	bh=HnH+9D3+g9xSe5BhyiIPrM68xeq0CDckO2idDyxHKJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oCFteEh2pew1BUXTkT/8DALQO1Q3pccGzeSjlRD+0RHTW5Ki0nlF1c5zUadWbhc8s
	 4GDuE/nVq/rXW6X6vBFNDRiReaRJE90tg8FTd/y9RBoDcQ3LkeZBXzFO0wC7zDUsI9
	 LYbZhUTdMz+pc8YKhC6bCmeRVxNpzKl7huq5CkJwWuOBOI1/I0NLHF0RqMKQEdckSN
	 50+YfsKUbjZWJX4YV4WfN00WExPdQuTT6LfU/FG/KZEby+M6ztc0RKv/atWX0moXWf
	 pLoOYZgSA2jSLlabvL+6yVwPlWGzREr374VOnRZSY5sw1kTeiHWRqU56xfN2Q7gsh6
	 nxC9bptrHrJ7w==
Date: Thu, 24 Sep 2026 09:27:05 +0100
From: Lee Jones <lee@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Hans de Goede <hansg@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v8 2/5] mfd: axp20x-i2c: Fix i2c instantiation
Message-ID: <20260924082705.GO3864833@google.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20260910-axp318-regulator-v8-2-e906a61a7f3d@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-axp318-regulator-v8-2-e906a61a7f3d@baylibre.com>

On Thu, 10 Sep 2026, Jerome Brunet wrote:

> Apparently this device never really supported i2c instantiation via
> sysfs, because the driver does not even look at the i2c device data,
> which are not set. It would only probe if the device matched through DT.
> 
> Fix that for correctness, even-though it is probably useless.
> Add the missing AXP323 while at it.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
> Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
> Acked-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
>  drivers/mfd/axp20x-rsb.c   |  1 +
>  drivers/mfd/axp20x.c       |  1 -
>  include/linux/mfd/axp20x.h |  3 +--
>  4 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
> index 5c93136f977e..a76bec5604c4 100644
> --- a/drivers/mfd/axp20x-i2c.c
> +++ b/drivers/mfd/axp20x-i2c.c
> @@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
>  	axp20x->irq = i2c->irq;
>  	dev_set_drvdata(axp20x->dev, axp20x);
>  
> +	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);

device_get_match_data() is bus agnostic and should still work from the
core driver.  What's the purpose of splitting it out and adding
additional call-sites?

>  	ret = axp20x_match_device(axp20x);
>  	if (ret)
>  		return ret;
> @@ -76,17 +77,18 @@ MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
>  #endif
>  
>  static const struct i2c_device_id axp20x_i2c_id[] = {
> -	{ "axp152" },
> -	{ "axp192" },
> -	{ "axp202" },
> -	{ "axp209" },
> -	{ "axp221" },
> -	{ "axp223" },
> -	{ "axp313a" },
> -	{ "axp717" },
> -	{ "axp803" },
> -	{ "axp806" },
> -	{ "axp15060" },
> +	{ .name = "axp152",	.driver_data = AXP152_ID },
> +	{ .name = "axp192",	.driver_data = AXP192_ID },
> +	{ .name = "axp202",	.driver_data = AXP202_ID },
> +	{ .name = "axp209",	.driver_data = AXP209_ID },
> +	{ .name = "axp221",	.driver_data = AXP221_ID },
> +	{ .name = "axp223",	.driver_data = AXP223_ID },
> +	{ .name = "axp313a",	.driver_data = AXP313A_ID },
> +	{ .name = "axp323",	.driver_data = AXP323_ID },
> +	{ .name = "axp717",	.driver_data = AXP717_ID },
> +	{ .name = "axp803",	.driver_data = AXP803_ID },
> +	{ .name = "axp806",	.driver_data = AXP806_ID },
> +	{ .name = "axp15060",	.driver_data = AXP15060_ID },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
> diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
> index 059656f2a1bd..8fdc870c1fe4 100644
> --- a/drivers/mfd/axp20x-rsb.c
> +++ b/drivers/mfd/axp20x-rsb.c
> @@ -35,6 +35,7 @@ static int axp20x_rsb_probe(struct sunxi_rsb_device *rdev)
>  	axp20x->irq = rdev->irq;
>  	dev_set_drvdata(&rdev->dev, axp20x);
>  
> +	axp20x->variant = (kernel_ulong_t)device_get_match_data(axp20x->dev);
>  	ret = axp20x_match_device(axp20x);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 4d770e718716..de6946d4bb13 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -1267,7 +1267,6 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  	const struct mfd_cell *cells_no_irq = NULL;
>  	int nr_cells_no_irq = 0;
>  
> -	axp20x->variant = (long)device_get_match_data(dev);
>  	switch (axp20x->variant) {
>  	case AXP152_ID:
>  		axp20x->nr_cells = ARRAY_SIZE(axp152_cells);
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index b352661d99a1..1badb4868d17 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -997,8 +997,7 @@ static inline int axp20x_read_variable_width(struct regmap *regmap,
>  /**
>   * axp20x_match_device(): Setup axp20x variant related fields
>   *
> - * @axp20x: axp20x device to setup (.dev field must be set)
> - * @dev: device associated with this axp20x device
> + * @axp20x: axp20x device to setup (.dev and variant fields must be set)
>   *
>   * This lets the axp20x core configure the mfd cells and register maps
>   * for later use.
> 
> -- 
> 2.53.0
> 

-- 
Lee Jones
