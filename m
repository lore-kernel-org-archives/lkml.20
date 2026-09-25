Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C612470EB4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340459; cv=none; b=mUvqj6Sktymigkvf8ljQUMVsJBf73Ru+2aQk+0K737flzhnLU8BljTDnnbQCbtOTbbYQbw8oSeTixl/wnQeTteE6NDZNY+mLZdJAJseGsvTiGkyKqqEuUxDbeGsdKAH7pWYQr67l71CCBUJrQFMqLbv9cy15rTQn3O43luxcd3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340459; c=relaxed/simple;
	bh=X8SD06Xsb+QlpqJHnrtPeIbPCA/K3oHZVylpioAlIxc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A17dKHWI15r07SCS1Fq2EUSIRtPZWYgVaLq26LBzlpvKJk0lK/LVzVBE6QSXDk75gg4ZIHsyIiWkRr/otupsDbKdeCCs2kc5tVJuO698FIcjiLpAtlpG8pHbNaXLVQn+ll4ZsXDvWb9aXJ2oQ27pBrUkkW3znKPtiO6g1FJspF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JOki174R; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JOki174R"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so7127515e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790340455; x=1790945255; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVgejJErSi/df8/6avC+kCC2kZbgZL+1y5/eEh1fX5I=;
        b=JOki174RcaL6QezS2v04KMA++qfhwEcc/7Y/iyeeN4QUOg0KgoFHc2qvMwkjehyM0l
         /MM83apeVoE/ukdFju+vMP6ixPDUVXHVnLOFvhTIKPCZBuP38+Q8dhyJMPQrNkgMcqQG
         Ggi7Ob5w4RjXhnEvCT1mYkhj58D4a7SH9rtWnuWX9LymsFP915LlOzrfpxmV3IeFtY3k
         ZZglkPNYt1NUUBsYR4i6PB28CRkbcYKCgjLctVa3jNvyeie8iRyDH1ZV+3Hou4qrm+SZ
         RcP0rRhukcssFLnOFyba804gTusswmMH3XqHeiogcGlX7otPN4kCF5PQDPfw7nqL8aAu
         wRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340455; x=1790945255;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVgejJErSi/df8/6avC+kCC2kZbgZL+1y5/eEh1fX5I=;
        b=aq82SQj43RP5Gm8RiNJh9/hh1EQrLTVmZ3IHby6l88j5wsyvYM5br04VGnqltS1PhZ
         QZ/JR8hsJ66bNum2lMXRjUxrmGvDN55/CKMVPffmIbW/636ktzqrQbBYTkOXH7s8p+IS
         RAx0MfM08XFaesiyIEAWfzkYqhpeeOXyVJKAVS9OptvC0nHPE8jyvE4HGOm71lfj2tr9
         GvgSBgFGbOeIoqdPHb9RLCp9ZB2x2sbwKn3zS6TCI/6Xhzf9uUKLLxMG5BRDd6J7rvIb
         W/rRrACRcex4SeSNQJe31t+WHm107i/A9tXtpy0YRP4psFFXnGWMhGtgnA+6G/AmM/0+
         57qw==
X-Forwarded-Encrypted: i=1; AKwUvBw8nLdPYRfpeZxFJW0ZUqmbtsx3pOxF6Y7Gf22obyLgPQGSE8bfpya0PQ2epv3ilW4U+NqO8B5tkHWIw40=@vger.kernel.org
X-Gm-Message-State: AFuF++kRxauITYOyocp4OvK8kE57KlYu70ZR72ojqGI5wM+Ye93dUAa2
	RKAWo4QYxxC4ZM/LD3KHxepZTa0vuoQiwlU6bf+KyuL43jQA940iAghfDqMOvqKtFGs=
X-Gm-Gg: AYBFou0mKGBNOjz8E30mV3XzNAi0jp1NGkxh2wGE6GYF+BbjByvtOykEq0Ifgk5o1AW
	xDAFykDffT9d4fqEqPglJjqFmUQfxGkJf4YzJH75xCImr/p1a/J05c2B4KmIBibv3/Q8LAztUrD
	qnFNITWh+HTqPdF8l12WHaZX8LjvzfCss6hVPajgZDonhkCUNjMqvhP7o541LYcrcoxQVZDH5Lg
	zMTfR6UOGazoPqoRuBk8Y1vXQHALdMaEHyfvi5LruSTBKg8m6VLJBTY6W2wePl/SHAEKPEbOaVF
	rEVWn/NJpcZv2NJsxPr0OHtUICUkDQv0cF/bui6YjrTtx/utEKP9Tz7PCYLB84QC7I93HRpFruS
	MLhlPk3VhcxEPm22kbkhskdaTMyb9iS8xxOhOxbmK76YFnwucW+hPrbPdqs367n+EwdvTfyA7dy
	3Xpc7qfzErxxrVyrGFiIFCLt+Ck38Vy2K+QTwmvc3I8GgBIgjUN3M5J26+FbBGsxGPMS021dfWq
	N+QiwrBIGgnQy0fXg==
X-Received: by 2002:a05:600c:6090:b0:49e:6e94:7cae with SMTP id 5b1f17b1804b1-49fe670424cmr91000685e9.28.1790340455565;
        Fri, 25 Sep 2026 05:47:35 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff27eabc1sm58460335e9.15.2026.09.25.05.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:47:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Vinod Koul
 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona
	Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
 Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Heiko
	Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mfd@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
 <maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Michal Wilczynski
 <m.wilczynski@samsung.com>
Subject: Re: [PATCH v3 13/19] clk: starfive: jh7110-vout: Allow pixel clock
 rate propagation
In-Reply-To: <20260904-jh7110-clean-send-v3-13-484f9ae72715@samsung.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132733eucas1p1a6529cb2ea97bc75c9cd190d1ba901c0@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-13-484f9ae72715@samsung.com>
Date: Fri, 25 Sep 2026 14:47:30 +0200
Message-ID: <1j5wzt8plp.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 04 sept. 2026 at 15:27, Michal Wilczynski <m.wilczynski@samsung.com> wrote:

> The dc8200_pix0 and dc8200_pix1 MUXes feed the display controller, and
> the rate they carry is ultimately produced by the HDMI PHY, which
> registers hdmitx0_pixelclk as a clock provider.
>
> Add CLK_SET_RATE_PARENT to both MUXes so a rate requested on them
> reaches that parent, instead of being clamped to whatever rate the
> parent already happens to run at.
>
> Co-developed-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh7110-vout.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> index bad20d5d794a72f071b4d547b7304786a8ba9afa..aeba42cd3c44ba205ced52b1826d2d2de82ad78f 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> @@ -40,10 +40,12 @@ static const struct jh71x0_clk_data jh7110_voutclk_data[] = {
>  	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AXI, "dc8200_axi", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
>  	JH71X0_GATE(JH7110_VOUTCLK_DC8200_CORE, "dc8200_core", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
>  	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AHB, "dc8200_ahb", 0, JH7110_VOUTCLK_VOUT_TOP_AHB),
> -	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0", 0, 2,
> +	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0",
> +		    CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, 2,

I see that you've added CLK_SET_RATE_NO_REPARENT following a previous
sashiko advice.

Note that saying it will 'hijack' the parent without it is kind of
strong. It is fine to let a mux reparent while setting a rate, as long
as you understand the possible consequences for the rest of the tree.

Regardless

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

>  		    JH7110_VOUTCLK_DC8200_PIX,
>  		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
> -	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1", 0, 2,
> +	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1",
> +		    CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, 2,
>  		    JH7110_VOUTCLK_DC8200_PIX,
>  		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
>  	/* LCD */
>
> -- 
> 2.34.1
>

-- 
Jerome
