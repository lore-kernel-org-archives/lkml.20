Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383318;
	b=3RFI7VtgjiqC927uoovflbdtDTUYGdhq0GMMy6TVaLpUPRUHs0qzqtwuQkLc7/rxlZrS
	 uF/AqbwxUMRLpL9yIbY0H7wSlIxvgWk8LpAg7aiDMa9CKANdTkLaer3M2UyFB3G4dCv+c
	 H8mE3cwLWc80FQEvYGO4dB8bYK731uT8eplawRcys5giveR7A+5NHM8sokYdjTNWPnc5g
	 FaR3oQBrv0HaAJrg6eGaFKltlTgJHPIzqlwpmkKj4W9QeT5mKsoN1k3n/aa924C0Q9zF+
	 +3p7XBRuD6j+QcgWFE1vj4s1E5IVoG5b1EfHR/3I5WsQIvk6gyHG9VbxB9Xe8ppqQ1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383318;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=9gfQkCnTfkug6p4HXHCVXaX3Q+suBlhnBegGYXjv1IY=;
	b=CKMFoayyXVPfvmvKSRieGFVcJu1NjdhhVIuGbgtK8hjyQGp5bye9cW5kNEblPM4bqESR
	 2+o1GTYyxh2+DlbbPthkPbNc3TdkIy2OSjEGllK9otSqDczisXHu9MrXkJYBUe62x7Yda
	 NP/BAeVS1ioMxxP3w7Ou9yqnRZez/mcR9aHzCIxR9ZJkjGUH5zrOjrt1MIpTbSWcipHeJ
	 7CmnYm9UjaDP1+v0zVHr0RycOLmVTiet4yz1mCEC1wKFQwKRuBVgksCGy4Vemyhm/Ul9c
	 RDK/1rLmqsO/y8P0RNPoUjv+yN/DOSlt4asH0EfBv2cOQYe+S88d+27QaqC/tDz0Isw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=jCwZPf+Y;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7728E606A31A;
	Fri, 30 Oct 2026 18:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7728E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=jCwZPf+Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9gfQkCnTfkug6p4HXHCVXaX3Q+suBlhnBegGYXjv1IY=; b=jCwZPf+YIAUctffkKF7pw1WOTQ
	CqyoI3bprXm02g6eVWMZAP2o9CQVig+ZDJuoNwBP1DxIkVbxMu2P/p4tXuxMKYc4Ct92k59PUjQcu
	p9M0fxe+NKOPyBTiu4qZ2BMXCD5QeYqAOL4k5RyLDO01SzgGowPpWRasZrVz0wa/3JwDJ69OQ5HjO
	4UM6+54lKVKYP6PTNYFyIhj0lDGZ7WeJFcJ+JWU2yRWfB/ufDvxDvH0vcmrgyj7hjhi7+KK0AishG
	9nt0DMnXu14dtZMGcnL5n4WhtagwmsKlCTgUsCSliSuChpiCIPJYQEQsCDmoc4yHiNsX+FkeeXrRO
	6c6ajRIw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dominique Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Yakir Yang <kuankuan.y@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Conor Dooley <conor@kernel.org>, William Qiu <william.qiu@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Sandy Huang <hjc@rock-chips.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maud Spierings <maud_spierings@murena.io>,
 Graham Markall <hello@big-grey.co.uk>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Joshua Peisach <jpeisach@ubuntu.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Byron Stanoszek <gandalf@winds.org>, OOHehir <oo.hehir@gmail.com>
Subject:
 Re: [PATCH v6 09/18] drm/bridge: inno-hdmi: Allow the register map to come
 from a parent
Date: Fri, 30 Oct 2026 19:01:08 +0100
Message-ID: <3194397.687JKscXgg@phil>
In-Reply-To: <20261029-jh7110-clean-send-v6-9-759594e43acf@samsung.com>
References:
 <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
 <CGME20261029075407eucas1p1c9b0d887cafa4c3c10bb34fa3ef3c4b7@eucas1p1.samsung.com>
 <20261029-jh7110-clean-send-v6-9-759594e43acf@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 29. Oktober 2026, 08:53:43 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Michal Wilczynski:
> On some SoCs the HDMI controller does not own its register window. The
> StarFive JH7110 documents one 64 KB block, u0_hdmitx, that holds both
> the controller and the PHY, so the parent device maps it and owns the
> regmap while the two children share it.
>=20
> Use a regmap supplied by the parent device when there is one, and keep
> mapping our own resource when there is not, so platforms that own their
> register window are unaffected.
>=20
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Tested-by: Byron Stanoszek <gandalf@winds.org>
> Tested-by: OOHehir <oo.hehir@gmail.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/gpu/drm/bridge/inno-hdmi.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/=
inno-hdmi.c
> index 222f6522844ee60ae9a07ab2dcca748dbf7403e4..a8905bf627a224d7e39185141=
95f1810164dc26f 100644
> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c
> @@ -397,6 +397,7 @@ struct inno_hdmi {
>  	struct clk *pclk;
>  	struct clk *refclk;
>  	void __iomem *regs;
> +	struct regmap *regmap;
>  	struct regmap *grf;
> =20
>  	struct inno_hdmi_i2c *i2c;
> @@ -470,11 +471,25 @@ static int inno_hdmi_find_phy_config(struct inno_hd=
mi *hdmi,
> =20
>  static inline u8 hdmi_readb(struct inno_hdmi *hdmi, u16 offset)
>  {
> +	u32 val;
> +
> +	if (hdmi->regmap) {
> +		if (regmap_read(hdmi->regmap, offset * 4, &val))
> +			return 0;
> +
> +		return val;
> +	}
> +
>  	return readl_relaxed(hdmi->regs + (offset) * 0x04);
>  }
> =20
>  static inline void hdmi_writeb(struct inno_hdmi *hdmi, u16 offset, u32 v=
al)
>  {
> +	if (hdmi->regmap) {
> +		regmap_write(hdmi->regmap, offset * 4, val);
> +		return;
> +	}
> +
>  	writel_relaxed(val, hdmi->regs + (offset) * 0x04);
>  }
> =20
> @@ -1101,9 +1116,19 @@ struct inno_hdmi *inno_hdmi_probe(struct platform_=
device *pdev,
>  	hdmi->dev =3D dev;
>  	hdmi->plat_data =3D plat_data;
> =20
> -	hdmi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(hdmi->regs))
> -		return ERR_CAST(hdmi->regs);
> +	/*
> +	 * On platforms where the controller shares a register space with
> +	 * other blocks, the parent owns the regmap. Fall back to mapping
> +	 * our own resource where it does not.
> +	 */
> +	if (dev->parent)
> +		hdmi->regmap =3D dev_get_regmap(dev->parent, NULL);
> +
> +	if (!hdmi->regmap) {
> +		hdmi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(hdmi->regs))
> +			return ERR_CAST(hdmi->regs);
> +	}

why can't you just also use a mmio regmap here? Because with this change
the driver now has 2 competing register interfaces and you need those
conditionals all the time.

Just convert the existing user to also use a regmap please.


Heiko



