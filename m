Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6882651993C;
	Tue, 29 Sep 2026 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678854; cv=none; b=IGjQBPs3VZazFeqfJmJqZAowR0HFILOKaLN9PIn6GAoKEX3oEncOo1cvDKA8niKfYGniVANhmUydRY3BwhGXD2MAw8vAfiCZfbBgi8cpH9HxjROZLa9Qvq2tgBif6vAIlDhf7YHKTGyb/+m1nSjxSOnKH9FirQTvVmtBbUnO5nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678854; c=relaxed/simple;
	bh=lWUhtc2EI4P8iKvvKNVdvZzhVvDwI9XwvEg+J4EFQOk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JIUcymMX51IFkcCP4Cc1ZDJImbNPZBVEQbSbwj265Xqpk3W1jL2x4ymRf+PJcoCMMBWp16oG1UWqPFdzCT92fesbn7SCBTaUAVeM/OkEY+Zt8YW6AynwwIRBnPE1Mba5x5GEn4VVZicy088TBvqHrbGYhbq00Ad7gwmdCoQrsqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.244])
	by APP-05 (Coremail) with SMTP id zQCowAB34jwXl7tq7fmqCQ--.2307S2;
	Tue, 29 Sep 2026 18:46:48 +0800 (CST)
Message-ID: <c1b065c8bd926708500b7c42864279e055ed95d0.camel@iscas.ac.cn>
Subject: Re: [PATCH 0/7] drm: remove deprecated *_of_get_bridge() from
 non-OF drivers (fixes build regression)
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
Date: Tue, 29 Sep 2026 18:46:47 +0800
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
References: 
	<20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:zQCowAB34jwXl7tq7fmqCQ--.2307S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFWxWFWxCw18Kw13Cry3urg_yoW5Xw1xpF
	4xtryYyry8JrZaqwsrAF1kAry5A3WDJa4fJr1UtF1Fvr1rZF10qw4q9ryF9ryUAFW8ZFn8
	tr1DXr1S9F17AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU3byCDUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-09-29=E4=BA=8C=E7=9A=84 12:36 +0200=EF=BC=8CLuca Ceresoli=E5=
=86=99=E9=81=93=EF=BC=9A
> After commit Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code
> to
> drm_panel.c") some drivers fail building:
>=20
> =C2=A0 error: implicit declaration of function 'devm_drm_of_get_bridge'
>=20
> This is because devm_drm_of_get_bridge() (and drmm_of_get_bridge())
> have
> been moved to drm-panel.h.
>=20
> The affected drivers are those which:
>=20
> =C2=A0* can be built without CONFIG_OF, and
> =C2=A0* don't include drm_panel.h
>=20
> The affected drivers are 3, fix them (patches 1-3) by replacing the
> deprecated *_of_get_bridge() calls with
> of_drm_get_bridge_by_endpoint().

The comment of drm_of_find_panel_or_bridge() still suggests
devm_of_get_bridge(), and the documentation at the head of drm_bridge.c
also mentions it.

Should this get fixed?

BTW should drm_of_get_bridge_by_endpoint() has some drmm/devm variant?

Thanks,
Icenowy

>=20
> While there, do the same for all drivers which be built without
> CONFIG_OF,
> even if they don't fail (patches 4-7).
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Luca Ceresoli (7):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/imx/lcdc: stop using deprecated devm_d=
rm_of_get_bridge()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm: verisilicon: stop using deprecated
> devm_drm_of_get_bridge()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: dw-mipi-dsi: stop using deprec=
ated
> devm_drm_of_get_bridge()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: dw-mipi-dsi2: stop using depre=
cated
> devm_drm_of_get_bridge()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/vc4: dpi: stop using deprecated drmm_o=
f_get_bridge()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/vc4: dsi: stop using deprecated drmm_o=
f_get_bridge()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm: renesas: shmobile: stop using depreca=
ted
> devm_drm_of_get_bridge()
>=20
> =C2=A0drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 9 +++------
> =C2=A0drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 9 +++------
> =C2=A0drivers/gpu/drm/imx/lcdc/imx-lcdc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c |=C2=A0 5 ++---
> =C2=A0drivers/gpu/drm/vc4/vc4_dpi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 9 ++-------
> =C2=A0drivers/gpu/drm/vc4/vc4_dsi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 10 ++++------
> =C2=A0drivers/gpu/drm/verisilicon/vs_bridge.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++----
> =C2=A0drivers/gpu/drm/verisilicon/vs_bridge.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A08 files changed, 19 insertions(+), 35 deletions(-)
> ---
> base-commit: 91ceac83e599c9d48da4c4d2d91410c588a215f7
> change-id: 20260929-drm-fix-of_get_bridge-build-regression-
> 98f22f8a1dcc
>=20
> Best regards,
> --=C2=A0=20
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

