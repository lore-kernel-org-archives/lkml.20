Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9623B37D11A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845365; cv=none; b=XjFyTC0271pqeV5BRHdpTj40WH14kCtErkS4yNoEZP1TQy67XBqJRVYaviwg4T2Btkk4+drxJ7mF3SRPct8M2jmLy6xVWWp1JGgvGD8d03ufhlugI1UBkcEXDhb44F4t25SVpmgEe/Mz1Xu4JR4p+wkYEQB5dBJayTw3J/+xhYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845365; c=relaxed/simple;
	bh=5cmWKzSSAcuDnCz4P29b0L8VSxjUUzHLXDvEWuOR9K0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mu2KFC4JSpkXPc3OMhkL/p5RB9VsxW12JT014wOsDL3u8RPP2vBXFi1aet4XIRVApU6tfzC7gQjQLeEr8a9oFzroS7ujS18xG4upqmS+T+KlCQtBL6IqU+Bprm+Yy0U29M1XY2z5951GjwB73CYuC7xkvgtNQztJOMqvK0lw/mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=R9gQUOxB; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="R9gQUOxB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 10CAF4E410E6;
	Thu,  1 Oct 2026 09:02:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D726160341;
	Thu,  1 Oct 2026 09:02:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8218103297EB;
	Thu,  1 Oct 2026 11:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790845359; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fmmywyAPks95sZtEVx0Myfsm2V1g8WhOEOmkPzK/9+U=;
	b=R9gQUOxBkOy7kRVNS0EoQ+E5Ijc10tPbvnI2QIqJCXSDuoTz54EjalIwxsLBDjZNFhztSW
	eQarkZnPyN7Kq50VxJa3D8ueei4X0spovokV6GBbz+7NPapPEV6bhghXOt+bt5YgiB/P5C
	I0DKSgL70HVvoFzzl+fY+0gEqyhFoDLqLtaq4zac62a2boQ3pT/E+hnaEJPLHaj6hXON33
	+N5IsDjx2gqhO6kUxf/KEU3g/ol+rYxItIj5KFtczBLoBhHPurfeCAbp6FXCwv2ZdBJsEB
	E70KOmFt4fyDmPjQH+yBU7+wgkLOLGfyoP4+Zvfs/9CoTmIOS1B7DVHKC5J/mw==
Message-ID: <a2ae9e54b60a6f11572ed85d1d92c866e143a283.camel@bootlin.com>
Subject: Re: [PATCH v2 6/7] drm/vc4: dsi: stop using deprecated
 drmm_of_get_bridge()
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Frank Li	 <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Icenowy Zheng	
 <zhengxingda@iscas.ac.cn>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart	 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>,  =?ISO-8859-1?Q?Ma=EDra?= Canal
	 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance	
 <kernel-list@raspberrypi.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni	 <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 	imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Thu, 01 Oct 2026 11:02:27 +0200
In-Reply-To: <d247a15360eb3254ed1ae1f9bad859c3bb0b5c77.camel@bootlin.com>
References: 
	<20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
		 <20260929-drm-fix-of_get_bridge-build-regression-v2-6-6da431d8f180@bootlin.com>
	 <d247a15360eb3254ed1ae1f9bad859c3bb0b5c77.camel@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

Le jeudi 01 octobre 2026 =C3=A0 10:56 +0200, Paul Cercueil a =C3=A9crit=C2=
=A0:
> Hi Luca,
>=20
> Le mardi 29 septembre 2026 =C3=A0 15:39 +0200, Luca Ceresoli a =C3=A9crit=
=C2=A0:
> > drmm_of_get_bridge() is deprecated, switch to
> > of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() ret=
urns
> > a refcounted bridge, ensure it is put by using bridge.next_bridge.
> >=20
> > drm_panel.h becomes unused, drop the include.
> >=20
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> > =C2=A0drivers/gpu/drm/vc4/vc4_dsi.c | 10 ++++------
> > =C2=A01 file changed, 4 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_ds=
i.c
> > index 0148f2befed1..30598738cfcf 100644
> > --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> > @@ -35,7 +35,6 @@
> > =C2=A0#include <drm/drm_edid.h>
> > =C2=A0#include <drm/drm_mipi_dsi.h>
> > =C2=A0#include <drm/drm_of.h>
> > -#include <drm/drm_panel.h>
> > =C2=A0#include <drm/drm_print.h>
> > =C2=A0#include <drm/drm_probe_helper.h>
> > =C2=A0#include <drm/drm_simple_kms_helper.h>
> > @@ -555,7 +554,6 @@ struct vc4_dsi {
> > =C2=A0
> > =C2=A0	struct platform_device *pdev;
> > =C2=A0
> > -	struct drm_bridge *out_bridge;
> > =C2=A0	struct drm_bridge bridge;
> > =C2=A0
> > =C2=A0	void __iomem *regs;
> > @@ -1165,7 +1163,7 @@ static int vc4_dsi_bridge_attach(struct drm_bridg=
e
> > *bridge,
> > =C2=A0	struct vc4_dsi *dsi =3D bridge_to_vc4_dsi(bridge);
> > =C2=A0
> > =C2=A0	/* Attach the panel or bridge to the dsi bridge */
> > -	return drm_bridge_attach(encoder, dsi->out_bridge,
> > +	return drm_bridge_attach(encoder, dsi->bridge.next_bridge,
> > =C2=A0				 &dsi->bridge, flags);
> > =C2=A0}
> > =C2=A0
> > @@ -1749,9 +1747,9 @@ static int vc4_dsi_bind(struct device *dev, struc=
t
> > device *master, void *data)
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > -	dsi->out_bridge =3D drmm_of_get_bridge(drm, dev->of_node, 0, 0);
> > -	if (IS_ERR(dsi->out_bridge))
> > -		return PTR_ERR(dsi->out_bridge);
> > +	dsi->bridge.next_bridge =3D of_drm_get_bridge_by_endpoint(dev-
> > >of_node,
> > 0, 0);
> > +	if (IS_ERR(dsi->bridge.next_bridge))
> > +		return PTR_ERR(dsi->bridge.next_bridge);
>=20
> I had to double-check that it is fine to leave the .next_bridge field as =
a
> pointer-encoded error. It works because drm_bridge_put() handles this cas=
e.
>=20
> Reviewed-by: Paul Cercueil <paul.cercueil@bootlin.com>

Actually scrap that - I missed Sashiko's review which found an issue I had
totally missed.

-Paul
