Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984429;
	b=z519Uf6/vuQY0/29IlOIu4vUBwmPUU77HoKioVMgta5fx2NwVkw2n07jENvC5tyAgDw1
	 id/DEx3l+38Un7tVJ/3U3ZkRQ4YfC9fS/Z7Bs4qsEV7vgJJE/XpQu1o3lUU/s8MGwE6kH
	 g2qVy/OFbsnz/tc9nkp/z5Df/YXbimR9hV65e8eylq78p5V8J2Q6Ne+0ubBaRyjdsUCR/
	 VBOJiC33RnxuzgcoAuA0CGOjmnvhwlD4aE9KK84kjsxsoM2WsnbFCbnm3KWvft/pjVQ5L
	 hTiKn7Qz0i6fHkk5DZc4AiHMjrECneMfjQXRMTuJeZYJVsMuZVlu25mP8zQsD0y7UBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jFUBP+/4oDZDg3dkMLyOSSMyY5qeYxFYJPP06gApAfM=;
	b=iB2TaNZI4dPQpFRR4WJtguzVNjYo0G4AMBIGAdn7TgUIj6vyJPllAalzx9gk8wACtqTB
	 wP0CV4eewfJ42+VppwJgms/1eZdDdN68V5n9LlqTvgyCvsx1ZL9ioh1+l5sa8Rr+oqRk7
	 GloP3P4DdohGzdjIXh16b8Yye5tjetXsc64wp/9k4Q7eHqIcSNzU8vN4kYnx4gs5Lusy0
	 Ca3H8bVDHebsOkaHQD80ahtwtHSKLqdHMgfQTESs0XmSI9IW11Jq82QElQ1m3cPaXrYYC
	 c07e7gd4qFFNfv24Ague1K5SYyrWSkdVDKu5VxhUHQkaEJ2GnxBTWeR0EwEdFL8YLSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRPFEpLM;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7AA606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD7AA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MRPFEpLM
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e3b22e971so492471f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984427; x=1794589227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jFUBP+/4oDZDg3dkMLyOSSMyY5qeYxFYJPP06gApAfM=;
        b=MRPFEpLMHBiOhevWNNFBWNmChmSf9amwu9QOajBFX+0euSNnRYDCXlICEjk/SuLhs3
         NFK0ucD7IEzaiwwvD/bsceRIiiqnY2kquXNffVws1stKsQzqZ3CtCWQqiRg6VfazVwMH
         ZNe7sPwfjBakP8bL4YWXAoqj3lCYXv8+ZMeAXUkp9uLUyfCO8Akh8ZnLtaN0Ldj/lXkx
         AktNUSoS9425652OCNe6JlohitzRbL/4fjeLLtVREhFVQmMl4je7LqUdfd6QoMD/tkJt
         bHuQeK3c0DbcoU7MjsDywS6xGrfQzh2PVe/OlIWsbjmVaqUtOXi2v4/2NukMjJwKW6Ch
         EAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984427; x=1794589227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFUBP+/4oDZDg3dkMLyOSSMyY5qeYxFYJPP06gApAfM=;
        b=fiYVzOQ7gfL1YxCohIZk9bO+k5ZwPnuqoC+NC2SE6BepdqAQm2S1Vyg2RzMosGx30X
         G2a2jeQk8cr6YAH4KbNlOZ818r9ogN2rumbwvIo8FyuHAsH1iph8l3qQUuyWHd8iNt6G
         ipxa+DbMx0gZCYGvCR/okYJ/DsuG7wALQCyWBwgRGnZdOmzfgueK16xgY5ZvshbP+9Vb
         QZnazcx3zlbDxDVg7teJI4feNt1acwLZY3i2+3E1FfeJ7iO5crPKl0/uWkP2P4sMG8lJ
         z/r0NQJbBVKnAIUbsKcyTigo8UjkeuPfSw++DNd6ZAOiooydorHTxL+2K5xltlHB7uvP
         cfoQ==
X-Forwarded-Encrypted: i=1; AL+hErEVUJvkS7sE/OFVlyhIr+wtYoFUEK1zN2cCOwsq9qxwlpaK9qLba5fk/wSnPsoIbpE+6KPCfNfI9s1v7h4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+byJX8K+jT70Mnn7+MI3wL4AEaflC5Thv2mUMIJGCVQmpx/ZRu
	UPKL6xo543atmLEpxM2oiGhVfFxAvvvQ68y18xeBkozqp+3BmEV8+jRtOr3jpni+6Ys=
X-Gm-Gg: AYBFou3Q5ZywxOE+leMjrbhSUOkQtDXdepzVc7LcCrMTCi7wP+wwTLixDyFh9ty1fde
	+ikCtVS8TplIsBJi7klBbtgHotbYIQK+dBhzoOAamrTDAI25gHkM2Zf0BmVoBHXPVqLg2rMPK/A
	6AlXtmAXGayNNHnNvhVvKdcwhWd6D8m3Do2wX+O9JHnr+wyx7N+nBswrqd2pD7iTurXPZk8/wRE
	2xQhdLVl3zJg5zJ2mkzq+NI3yJcHloUYSojJ/Oreo6oHIUEdEfJB89gAmkM0q67ha3DzV/YmMLS
	9mcgd71QRGhnly3lHBH8VXaQ28R51L6wnUWOZjKZB5TOv+AqpPmXPE4q79cK3brML/B8tTYEcZT
	xlcaagQEU3MA9DIPgu1eOMlrRWQepdtEzawJlnKj+5vVYMfc296hPFrVnXxXWWD0PTBbaq/AQe6
	uTLTFvJxK3o32YZn8ng5qLzEC9KTDi+hcDCgppHIvk3E0hZsDXNk9NsmFtRf6cFYbcyGkRx8S0w
	gFJJlMkAJsb4febfSIR3x/3hbt3Uu/nZ1L4dsUoz5GvHKO+rFN9lavUuKf247FYH4t8rWnO7yG4
	y9CCGL/bNyf/k79aczeAN4eWGQl5IETADg==
X-Received: by 2002:a05:6000:41c2:b0:492:c53e:2ea8 with SMTP id ffacd0b85a97d-492c53e3120mr4511725f8f.49.1793984426953;
        Fri, 06 Nov 2026 09:00:26 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-492d8472969sm4866752f8f.58.2026.11.06.09.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:00:26 -0800 (PST)
Date: Fri, 6 Nov 2026 18:00:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
Message-ID: <au4Hc7LAXH-ujDPj@monoceros>
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>
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
	protocol="application/pgp-signature"; boundary="t4rhlzyxszxfhcxv"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>


--t4rhlzyxszxfhcxv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
MIME-Version: 1.0

On Wed, Nov 04, 2026 at 02:21:01AM -0500, Joseph Telaak wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

> +static const struct of_device_id sf19a2890_periphcrm_dt_ids[] = {
> +	{ .compatible = "siflower,sf19a2890-gmac-crm", .data = &sf19a2890_gmac_crm },
> +	{ .compatible = "siflower,sf19a2890-gpio-crm", .data = &sf19a2890_gpio_crm },
> +	{ .compatible = "siflower,sf19a2890-i2c-crm", .data = &sf19a2890_i2c0_crm },
> +	{ .compatible = "siflower,sf19a2890-pwm-crm", .data = &sf19a2890_pwm_crm },
> +	{ .compatible = "siflower,sf19a2890-rf-crm", .data = &sf19a2890_rf_crm },
> +	{ .compatible = "siflower,sf19a2890-spi-crm", .data = &sf19a2890_spi_crm },
> +	{ .compatible = "siflower,sf19a2890-timer-crm", .data = &sf19a2890_timer_crm },
> +	{ .compatible = "siflower,sf19a2890-uart-crm", .data = &sf19a2890_uart_crm },
> +	{ .compatible = "siflower,sf19a2890-usb-crm", .data = &sf19a2890_usb_crm },
> +	{ .compatible = "siflower,sf19a2890-wdt-crm", .data = &sf19a2890_wdt_crm },
> +	{ .compatible = "siflower,sf19a2890-wlan24-crm", .data = &sf19a2890_wlan24_crm },
> +	{ .compatible = "siflower,sf19a2890-wlan5-crm", .data = &sf19a2890_wlan5_crm },
> +	{ /* sentinel */ },

Please drop the trailing , after the list terminator.

> +};
> +
> +static struct platform_driver sf19a2890_periphcrm_driver = {
> +	.probe	= sf19a2890_periphcrm_probe,
> +	.driver = {
> +		.name		= "sf19a2890-periph-crm",
> +		.of_match_table	= sf19a2890_periphcrm_dt_ids,
> +	},
> +};
> +builtin_platform_driver(sf19a2890_periphcrm_driver);

--t4rhlzyxszxfhcxv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruB6YACgkQj4D7WH0S
/k7+kQf7Bfwba+pB8VQAImJsoI9nkvjYio2wmtjnDf+tDu84xWgQjB1NbQpNvz5V
3y7UDyK2deoH4CY8KBCBTRT7cDaxITXkF1a0HhwFJjQzDdqTdHEY4A8Y2+kwtaFE
XtG+i/38jjNC4FlZcl5XsIWsdXDJdmBVAQKyUIcufiTuxj7l++dfH+kC6Ex1M06H
ScbOsMnUQvQkOWUgbwbEI3sNWya0aIIYp10+UtnzXQTaMbZhUSviiwshdzpvF+We
ph8X0cK0eb1Xzob0dAIaL/GXyoeOmriWS7iJsLMed0+8cgUxySH9/PS2BUvFBWRt
gsqT7bKiL8d2E9MAbWotEFMpAA8JNw==
=PDSn
-----END PGP SIGNATURE-----

--t4rhlzyxszxfhcxv--
