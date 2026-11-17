Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911947;
	b=tzm5RzGSpycgNVX+ESgYGb7v4KJKC/i9R4YaGRoaqif4Fd7RIzwq6E+lBsqzmlDj9G/j
	 bVlB/9OyVQBmPD7Q4tyOHmFYaDl0rqRwg1qwwtf1YaX+P02nPPSIWep3iw/zhiEt9Zr/e
	 knJaX5cuBIrS1W+aKuA0aeCqPc5f0JeKjDjhlX44qDYTmSdR/g8Cx+ENZeFkyZHECsBgE
	 G5Pw0L6f+mQZ8SWVacK6Q8hdA1Sidu9HRJDf7M6eDEFuaI+wu8FmDB6eYII3Ub5kE/pd3
	 VmmsWpxkHB5c8QKMwYRiNwB2q2vurQAZv7FCIp/PLaorGBVjLrCcrACWhUUlL5AmxEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911947;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NuyW+LPkABdZOmh3sBu4i9JSnfftHozPE5xHuZU3CeI=;
	b=lImfwDyA2CJmzi+BSbfOV9URhuZCaMCVJF8tozxI4bQluuzkDbBGxa41GlgBJjzi8dJR
	 RvAREDu+i8ZcKXwOq8lFE4RK30EWH7plLFRAgol0vfAkbPBOqXxUhdQf5cizbKKfJ9crf
	 txN7y3kB/hq9HxHSndyON5IbUA40D/gGRMRqjAcf7X6jTDArAVgLwgcjLjRA4qzFl38Ao
	 VgBrgSGMn3de4bzmybg7+USuBvotol4+RZ77846AoTFYazoN87mZXbECNmQfiRm1f1c8x
	 vvGc/lOsuLF7Id6j9WH7r0w0r25pMvr7zUzZQg5COpjEzg/+3NoDKpxWYgKAtr9V9Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCMXh3Ru;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56D7606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCMXh3Ru
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582131F000CF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794911947;
	bh=NuyW+LPkABdZOmh3sBu4i9JSnfftHozPE5xHuZU3CeI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kCMXh3RuzFG0Ug/pEgPdThQxr6c4ceYwJwzJCgsccTaPx/IE81y5TbFtll09nr0Y4
	 aqTBrPQVPxGZj56gp2+Qkp9bYLjjgaXtDBCrUpkj1sBEcodwqDBgHzf6+u9wbHDXQS
	 N7KTYTmzj7EERVsE3wGws0Ur05cqGWBQ46VMs0oB+pEhhO0UY+IIa2WZDwH9bb9D7L
	 d1sP3YHz4HOa9L6VKpc+AUSz4a0pIfATu90CQd53LCHolba+sJnvw6omsnBLrV2uBs
	 7nJMUA22b4KI9eCp9bh5AMNk9KDDz4YDkngfaD1FPorh9JjZMzmAjxwqfFJJQYp7lv
	 41nTwTwaGbcWQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adf87fc0c6so36477631fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:39:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG58T8K0LxvCogMPnGU2ytNdVKDM5n5d6Jq5fXt+ypuowA+FCiKJg4QLv6Wf6Sw2N7+IFa1dt7ZAH8GaHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z92lOqPPcwHvvQJOQ67ZRXIi76cBr5V5YXdZ9Vs3mcyZLSXfW6N
	gEMO0zSsqAG8lz2deSo++V4vlKIFFYNcXypzJ3RXbmIpN0s6BPKd4bbgPWq2di60qgNAcvPJE+W
	FPPexNYHj9pB7gJYv+JJB5cWFPmQeCgs=
X-Received: by 2002:a05:6512:1317:b0:5c1:57ee:1887 with SMTP id
 2adb3069b0e04-5c1709991c9mr5809743e87.13.1794911946039; Tue, 17 Nov 2026
 02:39:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-sf19a2890-gpio-v2-0-b885fbd84c4c@telaak.dev> <20261109-sf19a2890-gpio-v2-2-b885fbd84c4c@telaak.dev>
In-Reply-To: <20261109-sf19a2890-gpio-v2-2-b885fbd84c4c@telaak.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 11:38:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLkGavE9jL_EbPB2iPH=Aa=4Vdwj4nvHgiauJtq-dbwKZQ@mail.gmail.com>
X-Gm-Features: Aa3M54ppfeS06feOaViTWRV8zuTIrQ_dO7MWlQDFZO4SKHToSwYpGEh5iS9tAzY
Message-ID: <CAD++jLkGavE9jL_EbPB2iPH=Aa=4Vdwj4nvHgiauJtq-dbwKZQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: Add Siflower GPIO controller driver
To: joseph@telaak.dev
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joseph,

On Mon, Nov 9, 2026 at 9:09=E2=80=AFPM Joseph Telaak via B4 Relay
<devnull+joseph.telaak.dev@kernel.org> wrote:

> From: Qingfang Deng <qingfang.deng@siflower.com.cn>
>
> Add a driver for the GPIO controller on Siflower SoCs.
> This controller is found on all current Siflower MIPS and RISC-V
> chips including SF19A2890, SF21A6826 and SF21H8898.
>
> Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [Joseph Telaak:
>   - take it from Chuanhong's siflower-7.1 branch
>   - depend on MACH_SIFLOWER_MIPS instead of OF_GPIO, longer Kconfig help
>   - get the reset with devm_reset_control_get_exclusive_deasserted(),
>     so it is asserted again only after the GPIO chip is removed, not in
>     a .remove that ran first
>   - drop .owner and the unused drvdata, and get priv with
>     gpiochip_get_data()
>   - drop the irq_set_affinity callback, which reached the parent
>     through irq_to_desc(), not exported with SPARSE_IRQ
>   - call gpiochip_disable_irq() and gpiochip_enable_irq() from mask
>     and unmask, as an immutable irqchip must
>   - find the group by its parent IRQ instead of assuming consecutive
>     numbers
>   - return 0 or 1 from .get
>   - use readl() and writel() directly, without wrapper functions
>   - take the number of lines from the match data, not from an
>     ngpios property
>   - include linux/math64.h, drop the unused linux/pinctrl/consumer.h,
>     sort the includes, spell it "Siflower"
>   - subject]
> Co-developed-by: Joseph Telaak <joseph@telaak.dev>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
(...)

> +static int sf_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct sf_gpio_priv *priv =3D gpiochip_get_data(gc);
> +
> +       return !!readl(priv->base + GPIO_IR(offset));
> +}
> +
> +static int sf_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
> +                            int value)
> +{
> +       struct sf_gpio_priv *priv =3D gpiochip_get_data(gc);
> +
> +       writel(value, priv->base + GPIO_OR(offset));
> +       return 0;
> +}
> +
> +static int sf_gpio_get_direction(struct gpio_chip *gc, unsigned int offs=
et)
> +{
> +       struct sf_gpio_priv *priv =3D gpiochip_get_data(gc);
> +
> +       if (readl(priv->base + GPIO_OEN(offset)))
> +               return GPIO_LINE_DIRECTION_IN;
> +
> +       return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int sf_gpio_direction_input(struct gpio_chip *gc, unsigned int of=
fset)
> +{
> +       struct sf_gpio_priv *priv =3D gpiochip_get_data(gc);
> +
> +       writel(1, priv->base + GPIO_OEN(offset));
> +       return 0;
> +}
> +
> +static int sf_gpio_direction_output(struct gpio_chip *gc, unsigned int o=
ffset,
> +                                   int value)
> +{
> +       struct sf_gpio_priv *priv =3D gpiochip_get_data(gc);
> +
> +       writel(value, priv->base + GPIO_OR(offset));
> +       writel(0, priv->base + GPIO_OEN(offset));
> +       return 0;
> +}

So this has one register per setting per GPIO line?

This is ideally handled with select GPIO_REGMAP
for gpio-regmap.c using regmap-mmio, see for example
see for example gpio-mvebu.c that does this elegantly.

Yours,
Linus Walleij
