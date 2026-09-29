Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEF351DB0B;
	Tue, 29 Sep 2026 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678881; cv=none; b=gXxW7utP1jV/XiHOSZUzjzdaCRPbb1jr5AClGoCBGvMTOCp5w+JaiS+s7Y/4VX1rSxT24gNlmctich4twnHRO1TxkI3OudBCVut6P1azVL+RI1HNCTkB2DDtYLRWiPaNs/iKntOgjwIVIpHnEQIFs43ahlX7BZuqogrKNgI6rBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678881; c=relaxed/simple;
	bh=/9ec7V2K6sM0GPhU8tib+Kjkd3p+z19v0EHjq13NeMg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i6jLUvTLjvvNPjV5tXz2mQqLq3FW8vmQt7drtzYvZ5nBdQcWtoc37lPEGthhkkRSXoBNvkcsF7zdj0YPbWVANtYIre3MMP23q00TPudvgB8kFn08WNHDv9Jr+gKTilxFBB6MCpitt5hjXCfLdCKpOHZE684fE+gnUWibM4s1h0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.244])
	by APP-05 (Coremail) with SMTP id zQCowADnUDs4l7tqMf2qCQ--.2178S2;
	Tue, 29 Sep 2026 18:47:21 +0800 (CST)
Message-ID: <e11d8db56fc0633598d191c49b96d286046c506f.camel@iscas.ac.cn>
Subject: Re: [PATCH 2/7] drm: verisilicon: stop using deprecated
 devm_drm_of_get_bridge()
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Frank Li	 <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda	
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman	 <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Dave Stevenson	
 <dave.stevenson@raspberrypi.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal	
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance	
 <kernel-list@raspberrypi.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni	 <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 	imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Tue, 29 Sep 2026 18:47:20 +0800
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-2-ccb7e602daad@bootlin.com>
References: 
	<20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
	 <20260929-drm-fix-of_get_bridge-build-regression-v1-2-ccb7e602daad@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:zQCowADnUDs4l7tqMf2qCQ--.2178S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFy8CFyfWw1xWr47Xw13Jwb_yoW5GFyxpF
	4jqa98trWUXrWxXa1jkF4jkFy5AasrK3yrGFWUtw1FvF1FqF1DGF1kAry5AFW5CF17GF1r
	tr4DArWS9F18AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07jTc_-UUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-09-29=E4=BA=8C=E7=9A=84 12:36 +0200=EF=BC=8CLuca Ceresoli=E5=
=86=99=E9=81=93=EF=BC=9A
> devm_drm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint()
> returns
> a refcounted bridge, ensure it is put by using bridge.next_bridge.
>=20
> Fixes build failure when CONFIG_OF is disabled.
>=20
> Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to
> drm_panel.c")
> Reported-by: Arnd Bergmann <arnd@kernel.org>
> Link:
> https://lore.kernel.org/r/20260928161605.2271412-1-arnd@kernel.org
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Thanks,
Icenowy

> ---
> =C2=A0drivers/gpu/drm/verisilicon/vs_bridge.c | 7 +++----
> =C2=A0drivers/gpu/drm/verisilicon/vs_bridge.h | 1 -
> =C2=A02 files changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
> b/drivers/gpu/drm/verisilicon/vs_bridge.c
> index dc7c85b07fe3..f1e8112f0ed2 100644
> --- a/drivers/gpu/drm/verisilicon/vs_bridge.c
> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
> @@ -29,7 +29,7 @@ static int vs_bridge_attach(struct drm_bridge
> *bridge,
> =C2=A0{
> =C2=A0	struct vs_bridge *vbridge =3D drm_bridge_to_vs_bridge(bridge);
> =C2=A0
> -	return drm_bridge_attach(encoder, vbridge->next_bridge,
> +	return drm_bridge_attach(encoder, vbridge->base.next_bridge,
> =C2=A0				 bridge, flags);
> =C2=A0}
> =C2=A0
> @@ -303,8 +303,7 @@ struct vs_bridge *vs_bridge_init(struct
> drm_device *drm_dev,
> =C2=A0		return NULL;
> =C2=A0	}
> =C2=A0
> -	next =3D devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev-
> >of_node,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 output, intf);
> +	next =3D of_drm_get_bridge_by_endpoint(drm_dev->dev->of_node,
> output, intf);
> =C2=A0	if (IS_ERR(next)) {
> =C2=A0		ret =3D PTR_ERR(next);
> =C2=A0		if (ret !=3D -EPROBE_DEFER)
> @@ -326,7 +325,7 @@ struct vs_bridge *vs_bridge_init(struct
> drm_device *drm_dev,
> =C2=A0
> =C2=A0	bridge->crtc =3D crtc;
> =C2=A0	bridge->intf =3D intf;
> -	bridge->next_bridge =3D next;
> +	bridge->base.next_bridge =3D next;
> =C2=A0
> =C2=A0	if (intf =3D=3D VSDC_OUTPUT_INTERFACE_DPI)
> =C2=A0		enctype =3D DRM_MODE_ENCODER_DPI;
> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.h
> b/drivers/gpu/drm/verisilicon/vs_bridge.h
> index 70fee1749699..2b0ed94e4520 100644
> --- a/drivers/gpu/drm/verisilicon/vs_bridge.h
> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.h
> @@ -25,7 +25,6 @@ struct vs_bridge {
> =C2=A0	struct drm_connector *conn;
> =C2=A0
> =C2=A0	struct vs_crtc *crtc;
> -	struct drm_bridge *next_bridge;
> =C2=A0	enum vs_bridge_output_interface intf;
> =C2=A0};
> =C2=A0

