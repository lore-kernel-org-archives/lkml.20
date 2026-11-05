Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870828;
	b=GKeHue3LLYZN6RcWUoiA2zPuH6SqkKtIM4+KqUXH4Ytci3AjB+NyH42+yvxdnIDZjP+e
	 3Hd+OrFH6G62w3bzOo6U94kdSYithjK52ot6yVZiHZtNlBmg5SdfiItP4BXgyx9AinPSa
	 4a7d24Tg+zIvWzM81uwr3yfrFUN8e88qDL6LwswxSzCMK617zTWalfVbCauPfFbfSWEYt
	 7Znpn8Sm8jBAFyxcXICEfDxmsTs77pHQXtL7omljQbq7iQ1vLLgy4Rh3IbpgfYnJmW8bg
	 iNe7aMzZliQoGj/fP6h406vjfbg/Ms/UIaEwoS/Qs5x0FbS1t4RormP2H2swTnL+40g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870828;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=9pg1eAqFe+iTfmNTfa/GRPtY3M6bs2CHPsTRd5ndQTA=;
	b=LOrT8d75eXmkuduqYXgBTUYnMOoPRVJfbhhvlahzZ2AIMPkzoAENqR2PhFohXwnDWLNQ
	 G5xGOhafl2ZRKck3f+nCREDITw8gC/g6ojmQMzCzUHRl+YezvBe9fArE1jcX/7b2ngo8l
	 C9RA3dc4Xjj4MawaG+jmCFdVmda3edasRghlkv6S6PMhgtWkZOSxCK29qIs/0WjqE7jVd
	 gQR4KAmehgWo+ghiXvQYglX/MU35adwMU0U3/jnK98WdiVkdam6tSeB8Pi2aC/CZkbFBe
	 uNw7WnUwabOfSpvx6W0GpKZJeSolfxNGrAt6gd2SD72ACKHKJJ+DWvGqa6b6PUaD37A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AD9606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3AD9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91ea16d8072so100356d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870827; x=1794475627;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9pg1eAqFe+iTfmNTfa/GRPtY3M6bs2CHPsTRd5ndQTA=;
        b=AbyMDOtTWRnd289n3vKKYOBJRY8KQ8z3l9zPwLmkgGeTGK6oVrBIj0J93qku3OSf0Q
         yjrOTciMPag8OaFluRPqVevLjfLwyOmTDiDxyxWVjCObnGXwNGJ8n6xutEBeZgRU6Fjg
         joo2RcVIqxXhmcmm7JpLpOabePyjTRPyRsdroVpttmOJt9PfNE4j0sG30Bfp1rJW9SQe
         RlRwUEzYMVEd/eEnJ7rTz4D++ol9qsqSBpDanb+GhhaTkkOc47IKuK5r8TNmeK7ha75g
         gfDF8RajWjI+sBI8YH88LCziTfhGtgBO3gNEL6J7ZEJklxfqbJzYqh6RMIo6RQ0LIyMd
         hNcw==
X-Forwarded-Encrypted: i=1; AKwUvBxSw4evzXr61nfzCaUd7l43//5DI1l0Z9MdioKe0YJxbDhPwAL+bghlIw2tpbobiES1be3LG4ATxoNSzb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PfUuwP8ohAKGmPU08d/caiWmQsD5HIqrE+wE/SJ75KiXvpBI5
	Bgbgj7m0fuphf+JLFuWTfj3NplBeKOknIFhFQFh4n8PVnE9CI8csva4Ft5lGrsI26GU=
X-Gm-Gg: AYBFou1JETkzW1mbZwDtXtyh3PmNV6Ua9CJgZR42qwf4aLQIsFmxFK4uBhYnE254QJP
	xLjmrI7LlOVH8piOlGn9l71m5fWMqhJx7Ibv1QR8Tuv9tuMCFqr4Uoq4ZdJikBQisBTzxiUhsi3
	R2y4It0iGuUk3ZfWsb0DFD8xwHNat13olOf0imjUodCyzNz2rLpxn2/1exo4DhdkTAV0W94dZOM
	4XdyR+y+SL9BhSLlKZbWZrlO/aoYsWWiE+cxBpCqE1UJ3qL/30dr2uQFYuMP2ABvf9uWuklhVHd
	wDdxTEMl110v96a+5mqClXVYSTR9iU3UsrrHBcFtsd7iY7tcAgduMMC5DM4lIOo40rPSfgAVbWh
	BfhVxbzI7t276DxH7vBg2BXS8gE3RimI0GRpMOiAo+PTV3/4D+PNdU7XrdP/6DKuBbTYv5TuKvy
	QmeLEvibkEL1VgKNhVoelBUxz82Z/YkpXvfnkJynQb+1uFCztc7E2RYgkYgOsxKoLq/MW05pIN/
	Qgrxs2frmJHkZ2u+4qDE74btgt8LVXrQDN+VMYSGsIbs6/+Y3HevqnekJ0/69wuADYw6aIiG09/
	h8lokwki/kXryk2YZ0tO7UW1ObErnxIcsr070p9cjXrvws7iCK2TFX+chDKwFDR5HxZJjw==
X-Received: by 2002:a05:6214:484:b0:91c:751f:5951 with SMTP id 6a1803df08f44-91ca4bfa993mr310465886d6.51.1793870826417;
        Thu, 05 Nov 2026 01:27:06 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e8e4b81b3sm26893586d6.24.2026.11.05.01.27.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:27:05 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-930c0f9c1b1so175410185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:27:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwxC5A7IUgcFZX0a4v5hets95mdGMQPBwV8YBrqK5LCrXd+7ivbw0Bb3zrwxsPMOfFgMYBajwuKxDurgYw=@vger.kernel.org
X-Received: by 2002:a05:6102:e0b:b0:7cc:1045:610 with SMTP id
 ada2fe7eead31-7d072cc4a42mr6604019137.27.1793870415083; Thu, 05 Nov 2026
 01:20:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:20:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
X-Gm-Features: AclHuK-9tAw2bAtaZucYUxK8rDds9GR808jJtyoj1R1Fxu-dNuDK-M2tP9yoLrk
Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:RENESAS RZ/V2H(P) RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

On Wed, 4 Nov 2026 at 16:30, <Frank.Li@oss.nxp.com> wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add missed set_callback in rspi_dma_transfer() (sashiko
> - collect review by tags
> - drop void *

You have lost the "# Renesas related drivers" part from Wolfram's
review?
https://lore.kernel.org/all/auoQiuIm9FxdOrYl@shikoro/



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
