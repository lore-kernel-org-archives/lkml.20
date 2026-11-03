Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724563;
	b=1RKvL6WVexxuHnme1pm5UPVSqgc4K6eHBBQ+NK7yuIasgVzgWyq7ckRW9+zYmQWsMtUo
	 vYx7235WyGUHM6b/lnF3MAloXbvnpK2ULRQwOM8zjZe6SVfrvR3QBIEV425uETLFvmSu3
	 5DqHYJk9Tr6ObLMTOCp/S9Vgxc0BukhVkuG8udwDsxBh/Rgl64jIub5EiaKMpJFzu9qxG
	 Otkpj5jWm/D2rYap4RXXDUhFr5NNHckekGZ4tFpfLsYvc8jf9df9ZuuMEDNTK4Hf1+IHh
	 EECYL0feiNOvbkskIv7Wp6gRnqn22iLzU64WPrxqThcz6rHnJceot940sNrBtrtlosw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724563;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=R9Dy48Gg68z6JbCwXeGt+RTdvVH82Yt9FWqbgGzfrzY=;
	b=2XfOp1z+tY6CT7QU1jP6TJV1by2zG9KiRC7kNzxZQnw/ROb7l0cWexjEZhBRN3qvlO5n
	 ni0bpd37rZzMlqYPv767i7aApCYegXK4g/ba8sxYR2e2Mg3MKIieRvSH77oxwqhYRxj0a
	 r3Ee5+H+ytmYv7qM3fuXiq1DjYqlY13rCNwyfHcYdK5PmXYfjajEwdJ3MqgjI/lyKGf30
	 kTAjyBG1km20FSVAZRLR/LJt4AMOX4VEiU8jLOKk4Omp+3N6nGrZ/A6WtyoYrikeWun/w
	 jnVfsUDSRhd1xR/CUexXQSU3902zPxOrV2qHeWAEK0wAL0B1+GrD6HCuvtOUu2voXBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=BZKTqSfZ;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACAA606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ACAA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=BZKTqSfZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=R9Dy
	48Gg68z6JbCwXeGt+RTdvVH82Yt9FWqbgGzfrzY=; b=BZKTqSfZwdhpx8MSBYyZ
	Jo0+7Fl/Dx1uDGVAkHAD/aL4YecYKnQhkqybkL63HcTfBnn3ibTKAgC8Ql5eF5Xj
	fO0qycxsw4HlTUjN4UtljRtDvzRjWUpn/tfMpkPdVgPb/kjLqRU7Ia0cnmAvk6/s
	dQo9MXr4hUGWbA2mTi6yp60HqdkZrgPVJ5a5V6EF6WMxaaj5kwJro8DUMZy+AnNQ
	CnB5dOjITMTMbb/uY/Q22pbBFaGDkDhUsjbTS8i8+h08eGNj+GDf2r4Wj/9vlL1a
	v46nTWysCmgA9NVgarUwzYN9oPXQM1OtEQrfVxvSz43VgnKaEcOTk7cEEI3V3k/7
	7g==
Received: (qmail 359133 invoked from network); 3 Nov 2026 17:49:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2026 17:49:15 +0100
X-UD-Smtp-Session: l3s3148p1@DIfkCmJfcrTAwtcC
Date: Tue, 3 Nov 2026 18:49:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank.Li@oss.nxp.com
Cc: Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	CL Wang <cl634@andestech.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
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
	vkoul@kernel.org
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
Message-ID: <auoQiuIm9FxdOrYl@shikoro>
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>


>  drivers/spi/spi-cadence-quadspi.c | 3 +--
>  drivers/spi/spi-dw-dma.c          | 6 ++----
>  drivers/spi/spi-sh-msiof.c        | 6 ++----

For these:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # Renesas related drivers

