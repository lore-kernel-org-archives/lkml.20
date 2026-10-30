Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382256;
	b=ZmK9muYaO7M7FseN62sVBjBO2ODDlUujUHxd3AZFk8I6ZzVr1pTRtxrEovPpZNQQrMBo
	 4tPdV/ufZuqNFNUvQsZIYYoRR9Qgkd8yzHmOmVDUYeB5e0VJrpeCCRpelr79ZeqE7woJa
	 6+a5RIg/j1WTGv7cDUXnc+K2AJEmLuZzM5lJV2p7a5YjDH5GXn6L7+ivQkTvI5JTo2QrL
	 a39rEI+QdRf0vGuKsqOATvxp1d8JGAdXg6Zf4Rfj+rF5hN35euAVad6Ke5J0sKMGCgX0k
	 stecKj2DRnsJeEsHfF75yr/qLPAZTKUwd69B2qzu1JrPhOgRBDs1sUhSjLM4d9OmqKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382256;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=usSQk3gmkVPvTdjKUU6vUCEb73RASrZuENLTQo/CskA=;
	b=EaayBxo6X67HuJEgYdcQQ4B0gx4kroKiMPMRr2fvoLlgtF6kYs5DHW0QVKgMO2dSSkIT
	 t1/V5369CAGufs43ZrrmpbFRmPBSaYA+KoPr0LxGRQLSCXyyE9e8Ds548/E5HB0eqSdbn
	 gqHM6lEdANgOzrKCAuneDwWbr5ynciGouBs005SvIbz7hbEUswx8ZpP0H5OLwFm89eAzv
	 V5J76FqhuQ++zdwt1upSAOmb2TiNaXrU+Cow4B0NEv7qX2VtX8a87Sb9VixcJd2XEGn6S
	 HFpXp34bSa6gtvY4aSGlhRz+biFs7qEgJDFDh9pRi6LzPrBtv7YQm0WFw4MHJmEx+NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=U9kWFnfC;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C50606A31A;
	Fri, 30 Oct 2026 17:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C50606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=U9kWFnfC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=usSQk3gmkVPvTdjKUU6vUCEb73RASrZuENLTQo/CskA=; b=U9kWFnfC3oQMbgDNWHcOQJ/NJT
	HfgLlU43wb+0bVziHK6qseWoW1WMNY9f8Yajz9bGzugJq2zGqk+5Zl/V7gMxjMMyR2ibJg2DM/cKq
	mFzfarqU1oKC/MKLL6HJdfJrlr9ls7aCcDDFy74PBnwrJJomtlNsDXUz13oWND07rvw4PsnCH04QP
	aYc/Td6PEoaEgs9zzYMyNlzWqaiAeywaleFvaOvv0NUvxO68TRI9g5PexamYMQFGhtIA9nmouBK2A
	hlhLO7I37xAuZou/gPdDekGMLTi100S6UetXWliTUUnG1AXLWeo3vVV6iXXbak+pKHorNBooaP+i1
	QmeOqqOg==;
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
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Subject:
 Re: [PATCH v6 02/18] drm/bridge: inno-hdmi: Don't dereference a NULL
 drm_device on hotplug
Date: Fri, 30 Oct 2026 18:43:47 +0100
Message-ID: <1844578.vCJZsxu672@phil>
In-Reply-To: <20261029-jh7110-clean-send-v6-2-759594e43acf@samsung.com>
References:
 <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
 <CGME20261029075355eucas1p190ad652b6408201a2e04bc53c2717783@eucas1p1.samsung.com>
 <20261029-jh7110-clean-send-v6-2-759594e43acf@samsung.com>
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

Am Donnerstag, 29. Oktober 2026, 08:53:36 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Michal Wilczynski:
> inno_hdmi_irq() passes hdmi->bridge.dev to drm_helper_hpd_irq_event(),
> which dereferences it in its first statement:
>=20
> 	if (!dev->mode_config.poll_enabled)
>=20
> bridge.dev is assigned only by drm_bridge_attach(), but inno_hdmi_bind()
> unmutes the hotplug interrupt in inno_hdmi_init_hw() and installs the
> handler well before it attaches the bridge:
>=20
> 	inno_hdmi_init_hw(hdmi);		/* unmutes hotplug */
> 	devm_request_threaded_irq(...);		/* handler goes live */
> 	...
> 	hdmi->bridge.ddc =3D inno_hdmi_i2c_adapter(hdmi);
> 	devm_drm_bridge_add(dev, &hdmi->bridge);
> 	drm_bridge_attach(...);			/* bridge.dev set here */
>=20
> The bridge is allocated by devm_drm_bridge_alloc(), which kzalloc()s it,
> so bridge.dev is NULL for all of that window, and a hotplug event
> arriving in it enters drm_helper_hpd_irq_event(NULL).
>=20
> Before the conversion to a bridge the ordering was safe:
> inno_hdmi_register() called drmm_connector_hdmi_init(), which set
> connector.dev, before the interrupt was requested.
>=20
> Drop hotplug events that arrive before the bridge is attached.
>=20
> Fixes: 969325a2597e ("drm/rockchip: inno-hdmi: Convert to drm bridge")
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/gpu/drm/bridge/inno-hdmi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/=
inno-hdmi.c
> index d7c33b92e2ddf4ced84d17304463f44be52270b8..d29832249b942dec84fb9d07a=
0b21ee751fc0486 100644
> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c
> @@ -929,7 +929,13 @@ static irqreturn_t inno_hdmi_irq(int irq, void *dev_=
id)
>  {
>  	struct inno_hdmi *hdmi =3D dev_id;
> =20
> -	drm_helper_hpd_irq_event(hdmi->bridge.dev);
> +	/*
> +	 * The interrupt is requested before the bridge is attached, and
> +	 * bridge.dev is only set by drm_bridge_attach(). Drop hotplug events
> +	 * that arrive before then rather than dereference a NULL drm_device.
> +	 */
> +	if (hdmi->bridge.dev)
> +		drm_helper_hpd_irq_event(hdmi->bridge.dev);

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Most other callers of drm_helper_hpd_irq_event() also do exactly this.


Heiko


