Received: from mail.lysator.liu.se (mail.lysator.liu.se [130.236.254.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA0942C4F0;
	Tue,  1 Sep 2026 07:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.236.254.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246701; cv=none; b=N3CyWoL3y9MLPGN1ZZm0164lO5fty3ZUrFPU5U4jtjRiw0JJ7YwV9n9J/eV5O/wxT4jwXPiqnWK7IP6t+wm5kzlHEW47UEdC0bwirXGL43rKPjsJsOhAxLYDsDQhgrbQUdf50wEOO26UkP4vd1tEGvNOsCuqF157JDIH8TmYE4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246701; c=relaxed/simple;
	bh=dW0qF+TCQeqlzOW1eBAtmZO3e+NnkioqB8pb1wWmhu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fx+Yq9v2GoQpkx6TzKNbtyeKPaJFYEYAPtH3VJLZGvZHUe+K3Ew4BOg5Sl7JnYdvIZHjv7v2rdW9VwIxXEE1ZvDA07za1aFjD70aoiIUxBw8aXS6lp6A5jJuNVq8PdV+FLj1/Adt3uz84A9nI9WWqOwvWJXqZ0u/CPp3UvKsGHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se; spf=pass smtp.mailfrom=lysator.liu.se; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=XNQL8Hwa; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=XNQL8Hwa; arc=none smtp.client-ip=130.236.254.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="XNQL8Hwa";
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="XNQL8Hwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1788246688;
	bh=dW0qF+TCQeqlzOW1eBAtmZO3e+NnkioqB8pb1wWmhu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNQL8HwaSbaMvf8SCzE4H8zh24EwyQmOlEaWtpmK18+A2m2/iZWoMdX5eZIYvq4aY
	 LjaCHlO/Lfidpbr7UkTVlIpySpYkVrYhkOcKiGRrHJpafQ3Qlvh184B0hCCKoeBqsk
	 W55HVRKrzEYKG4jFfkpksRP0VqYL3F0xjA6K3fT+5W9wVBxxuUN6KOF4fBKdjxPlDm
	 mg6RyRI2M0ZDtsr2u0WKMh3g61xj4dxuLFCjpDpEv26Z2/+GhMyqie23JI/J9axRd2
	 GSE66CRS+woaTSr6HgX57CJbF4ESOAgiBMUb87hd0R9i6tEA/GDWZ015z/iQ1FoLNz
	 sO1DT4MrAw79Q==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id 5F9CD1299B;
	Tue,  1 Sep 2026 09:11:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1788246688;
	bh=dW0qF+TCQeqlzOW1eBAtmZO3e+NnkioqB8pb1wWmhu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNQL8HwaSbaMvf8SCzE4H8zh24EwyQmOlEaWtpmK18+A2m2/iZWoMdX5eZIYvq4aY
	 LjaCHlO/Lfidpbr7UkTVlIpySpYkVrYhkOcKiGRrHJpafQ3Qlvh184B0hCCKoeBqsk
	 W55HVRKrzEYKG4jFfkpksRP0VqYL3F0xjA6K3fT+5W9wVBxxuUN6KOF4fBKdjxPlDm
	 mg6RyRI2M0ZDtsr2u0WKMh3g61xj4dxuLFCjpDpEv26Z2/+GhMyqie23JI/J9axRd2
	 GSE66CRS+woaTSr6HgX57CJbF4ESOAgiBMUb87hd0R9i6tEA/GDWZ015z/iQ1FoLNz
	 sO1DT4MrAw79Q==
Received: from gryt (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id 114071299A;
	Tue,  1 Sep 2026 09:11:27 +0200 (CEST)
Date: Tue, 1 Sep 2026 09:11:26 +0200
From: Peter Rosin <peda@lysator.liu.se>
To: Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mux: gpio: Add optional enable gpio
Message-ID: <apZ6nvq1x0zEKjr9@gryt>
References: <20260831-add-external-mux-enable-gpio-v2-0-f6027a4afe61@vaisala.com>
 <20260831-add-external-mux-enable-gpio-v2-2-f6027a4afe61@vaisala.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-add-external-mux-enable-gpio-v2-2-f6027a4afe61@vaisala.com>
X-Virus-Scanned: ClamAV using ClamSMTP

Hi,

Thanks for the patches! This all looks nice, but I do have a
few cosmetic nits...

Den Mon, Aug 31, 2026 at 10:28:25AM +0000, skrev Tapio Reijonen:
> Analog multiplexers have an enable input that disconnects all channels

Some analog multiplexers ...
or perhaps just
Some multiplexers ...

> when deasserted, independent of the address inputs; on a 74HC4051 it is
> the E input. Add it as an optional gpio.
> 
> The mux gpios are not updated atomically. gpiod_multi_set_value_cansleep()

The mux gpios are not guaranteed to be updated atomically.

> groups them per gpio controller, and only controllers implementing
> set_multiple() update theirs in a single write, so a mux with its address

... set_multiple() can possibly update theirs ...

> inputs spread over two controllers passes through the intermediate
> addresses on every change. Deassert the enable gpio for the duration of
> the update and assert it once the address is settled.
> 
> The enable gpio is also what makes an idle state of MUX_IDLE_DISCONNECT
> possible, which the mux core applies when the chip is registered and after
> every deselect: it leaves the enable gpio deasserted and the address
> inputs alone. Refuse that idle state without an enable gpio, because the
> address inputs cannot disconnect anything on their own and mux_gpio_set()
> would instead drive them to the bit pattern of MUX_IDLE_DISCONNECT.
> 
> Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
> ---
>  drivers/mux/gpio.c | 34 ++++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
> index f9c7863e51b82fb76ed03cf17308fae74716cf6d..df5d24214bd5fa8c3c1d733b25d32ca88c06c8c0 100644
> --- a/drivers/mux/gpio.c
> +++ b/drivers/mux/gpio.c
> @@ -18,6 +18,7 @@
>  
>  struct mux_gpio {
>  	struct gpio_descs *gpios;
> +	struct gpio_desc *enable_gpio;

Please drop the _gpio suffix from the name.

>  };
>  
>  static int mux_gpio_set(struct mux_control *mux, int state)
> @@ -26,10 +27,18 @@ static int mux_gpio_set(struct mux_control *mux, int state)
>  	DECLARE_BITMAP(values, BITS_PER_TYPE(state));
>  	u32 value = state;
>  
> +	/* The gpios are not updated atomically, disable the mux meanwhile. */

	/*
	 * The gpios might not be updated atomically, disable the mux
	 * meanwhile.
	 */

> +	gpiod_set_value_cansleep(mux_gpio->enable_gpio, 0);
> +
> +	if (state == MUX_IDLE_DISCONNECT)
> +		return 0;
> +
>  	bitmap_from_arr32(values, &value, BITS_PER_TYPE(value));
>  
>  	gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);
>  
> +	gpiod_set_value_cansleep(mux_gpio->enable_gpio, 1);
> +
>  	return 0;
>  }
>  
> @@ -70,14 +79,27 @@ static int mux_gpio_probe(struct platform_device *pdev)
>  	WARN_ON(pins != mux_gpio->gpios->ndescs);
>  	mux_chip->mux->states = BIT(pins);
>  
> +	mux_gpio->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(mux_gpio->enable_gpio))
> +		return dev_err_probe(dev, PTR_ERR(mux_gpio->enable_gpio),
> +				     "failed to get optional enable gpio\n");
> +
>  	ret = device_property_read_u32(dev, "idle-state", (u32 *)&idle_state);
> -	if (ret >= 0 && idle_state != MUX_IDLE_AS_IS) {
> -		if (idle_state < 0 || idle_state >= mux_chip->mux->states) {
> -			dev_err(dev, "invalid idle-state %u\n", idle_state);
> -			return -EINVAL;
> +	if (ret >= 0) {
> +		if (idle_state == MUX_IDLE_DISCONNECT) {
> +			if (!mux_gpio->enable_gpio)
> +				return dev_err_probe(dev, -EINVAL,
> +						     "idle-state disconnect requires enable-gpios\n");
> +
> +			mux_chip->mux->idle_state = MUX_IDLE_DISCONNECT;
> +		} else if (idle_state != MUX_IDLE_AS_IS) {
> +			if (idle_state < 0 || idle_state >= mux_chip->mux->states) {
> +				return dev_err_probe(dev, -EINVAL,
> +						     "invalid idle-state %d\n",
> +						     idle_state);
> +			}
> +			mux_chip->mux->idle_state = idle_state;

The new code is a bit convoluted and too deeply indented, methinks. I'd
prefer:

	ret = device_property_read_u32(dev, "idle-state", (u32 *)&idle_state);
	if (ret < 0)
		idle_state = mux_chip->mux->idle_state;

	if (idle_state == MUX_IDLE_AS_IS) {
	} else if (idle_state == MUX_IDLE_DISCONNECT && !mux_gpio->enable) {
		dev_err(dev, "idle-state disconnect requires enable-gpios\n");
		return -EINVAL;
	} else if (idle_state == MUX_IDLE_DISCONNECT) {
	} else if (idle_state < 0 || idle_state >= mux_chip->mux->states)
		dev_err(dev, "invalid idle-state %d\n", idle_state);
		return -EINVAL;
	}

	mux_chip->mux->idle_state = idle_state;

Using the "return dev_err_probe(dev, -EINVAL, ...)" pattern only buys
you an "error EINVAL" prefix but costs over-long lines. So, not worth
it to me.

Beware, the above snippet was written directly in the MUA and has never
seen a compiler. It probably has some silly bug, but something like
that...

Cheers,
Peter

>  		}
> -
> -		mux_chip->mux->idle_state = idle_state;
>  	}
>  
>  	ret = devm_regulator_get_enable_optional(dev, "mux");
> 
> -- 
> 2.47.3
> 
