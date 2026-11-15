Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757401;
	b=Ftfn1T6cVLrWPnB/L5zlF/O1AIFwPVhzn7tkUlKy04Z5j8omzFkGg2e2KEFabZ8ch6Nk
	 7t992rs59gcYuC6Nozaa2j6d3i7qqvhohvCq2iBXiV0p5TwU5ex2BGWWSyMxUUfFgcWLp
	 J3jBR3Ps67fQJLV/k3K32kmARnCnF0noa6r1kgz0KwPq1HiG2SSJos16OhWr5LYjsshlU
	 MuQaqnMWvV+UZO2TNsXYfg0yb+J9cRojJHEAYkouXNginLBrEd/yUBpfOqRMmlKdnRm9Z
	 GaZt5o9XHCupLgCfLMeS1ZDXXMPE0L1IeJweyAPBm9ObUOYTzBtFqWCwRgR/iAwrqeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
	b=YXEGaZuJCmpaE1Vh8D8aByAYKzv9hiLPYsrACZHaE/FTWVmszD6mQeTxozwoSpL9aXyD
	 G2Zl8GnXj/I7n9R0I0LbrTWScS1t3kypDSYykQTXIkz8FZlYpLTL3BZoh5EtZzuMKtgNG
	 xCTW1k0B4nHxcuj6rsvfD3GJoYDeSWweRIpncqanRjjiRHGo1aYelzUJfV/MhmND8XD32
	 nCIbrgTVwcEXMC5zajzYdOh1XRSL7Y7gDS6JpOT4yC4xzGGNcJuKjvNC+K5SMvzi0xF3L
	 xBMO8cOpCijiEBvm1hKZ3raP9Qwvf9CksArUf4Sntlv6WsZjmdoXmG4j06ZBElB9Uvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBYr2ghe;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886DF606A338
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 886DF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBYr2ghe
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a210470b49so20585715e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794757399; x=1795362199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=HBYr2gheQUl7c26Y3yfqksOaTOYrIFYUyEUzlZUZhWSZy+HAESqRcXZrP+TZZhM8z9
         75y4g55klpFlA/Qulr9Yg7kYDWq1+w93Piu62izk5f8edZNdPTqmw53yQIcVZJ8POpjR
         FCFDGpFCG+XXUQSOtyP6WZHieYuBpqKKanKZ3wnDH3I4OGAaLXxf7XH2XvGb65akJdzr
         QUEsYnB0UF1WTP5FCzRnWQED5TK5P0HAm0HJ7Hpeq/wgtIM84HN+PLhoAeYrZah9RjSs
         zqZK2w+ADZMGUpKyIfEL5w7Zfqyz1Z40uP2rSoJOgyF58OsUuKjbbaFJV/9eOLQrvgqB
         Q1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757399; x=1795362199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=PrDqV4OUUBPVaOQEEXT/ntdiNvc6ydKMWRq4oqx4WeS372IUh+iXXJzasRAvS7N79g
         6Ks3SmiiM7ebnGsRpptWvMHC2EpUTenDRfbbNY65VxDJ1as7ddzjeSfR7/rI+WzNF2cU
         1eCzQr+cLAVTdxom+DCEH1eFMluDTDfLPMvuSzvIiA6yBW1iGFKT00RQsgCrHnOzL6RW
         7ibPAenFfD27grGqF7RTQ/BWVUVi8bhEQOEWWJfs/zu1E27N5fVw+jPR3cA7GvXOS3R9
         ZyczJys0fNM1NiTHPk5uilIr7iZsgs5X+ysUVC0H9BeYhsTw2/yO2RT9tvxlxGIaNllB
         7Z5w==
X-Forwarded-Encrypted: i=1; AL+hErE6AMvllrzlaNQ9CuSsxki/Ai0dLbp7rypeq4HTFDVJ0RpaVXTQWsIsH9TyxMbzp6mIKoTrMWdonQrKs6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lhZpczbMmDADmIAPdE8EMR+5xtRaTGj0IItK25i7sdmwX/Ztz
	h5cDfhrfYobT6eLG5wuvY68dXKfZoPg6N/HXlyS3k8M8ukR/z4kIx1MuPy7I5zoXikE=
X-Gm-Gg: AYBFou1AS7Um96QSstcnW2A6kONqjOdD4KerT5SPzsUHMBaVE7PePLTwcaNwq2XEJ5C
	wPUEY9u9zWCSVOl0dEq9YvCSUvbW/UyUsZ+W38u+xMbndRqI8Vha+MnpdQSCbKeR+lPHGM14BfT
	j8LuhHdQzi8pRuAQVxAn6b2IYfHPlIBIDzTPqo5EXIJ+L1PNKA0CDVWzP4awO5pNru2nIrYr6bb
	fUATRqYXgwgtOWhAajuUqlVRY2jNjFg77p14UO5E9PqkaZUEJHAuauOmEXE5wKlQD2yQaX1bVKt
	/cknvGOYMd/Pd3Zs1Cj4za1D4Uy4wQZEx6QvrvEacUWNYxA58LSpboNOLVZDotgJEuEHsEAdcz4
	Sw9+kbyhhnr8JHY19aL1GUMJ6Q7IDpBctUMiifXcyZC27cURwSfrN9J+8FIkn4tQwwhC2hIta/Q
	EpwaxGCAYEIyiYQiodIUgtyfse7oOt0x1c6HUCW5peIMdpUARrVc4EEUU8IqjrMH4cvH/0ZZofN
	/ZecRuOWQ388Y+gycl0g4MpJ/F08a9FN7Zoj9DdbUmTd2nHUaTVlYQ8zt4mmfXnHzzYXz1qts6f
	aW016lQnD9lJZ3+fVlX42//8RcIO4/nF7Utli8b96bX2vMjQ7y/kEiKa
X-Received: by 2002:a05:600c:608c:b0:4bb:680f:9a3 with SMTP id 5b1f17b1804b1-4bb680f0a64mr77590835e9.2.1794757398894;
        Sun, 15 Nov 2026 07:43:18 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb68c00b10sm52646085e9.0.2026.11.15.07.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:43:17 -0800 (PST)
Date: Sun, 15 Nov 2026 16:43:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
Message-ID: <avnSl53KHJWGrBcE@monoceros>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="nd4yu7xpyaelhc7q"
Content-Disposition: inline
In-Reply-To: <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>


--nd4yu7xpyaelhc7q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
MIME-Version: 1.0

Same feedback as for patch #14: Don't include <linux/mod_devicetable.h>
and please fix the spacing in the of_device_id array.

Best regards
Uwe

--nd4yu7xpyaelhc7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr50xEACgkQj4D7WH0S
/k7FQQf9GMWHvRPfVzE3vnOHAT8nN1+INki1D4kL4uwlHr3JU4yutcwFkaHKLsQU
b4DbnyStL4d7i466zTUN7GaSuTfs5LByLE0hKNibeGI5Wa+bHdhPXZw6poTITVON
f2BwjcuK+Zq5YQKqimrjo/4tbchvvRaJ2tX4FrpWxIYNSEVPVDu3Ku1FTeQTjQiW
q3iSJsE9FH4VZAUg2tViVg4jIzTIj6ncm2+HvaOFr/vv8gwncEBYp0IlMVPyqH3A
a+UAaIoEVNFvPPDDjTGrnHlPAjkkKoP4p3OAxBnC1l6qyEx0qCChV2gqtkPof0ba
XuoM97TKUIIJOGjYertizBLa8GJ32A==
=5u67
-----END PGP SIGNATURE-----

--nd4yu7xpyaelhc7q--
