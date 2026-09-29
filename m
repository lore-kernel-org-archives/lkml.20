Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A6751AEC7;
	Tue, 29 Sep 2026 12:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685381; cv=none; b=oWHAmSEiDVQnn4vvVN0GOYT3/DjZcm2nvWU/g0JqavFfseVsN6B97tQiRzJ2nS3YGufskRL7NW19cJC1niWMl6tfpB6uxcbQ7ENXAq2yVu5BaJhV2yD/PdhXf1BHJ+JWcIRsnXnty//spyUgCVT/CzlOAHLTNVfJBe5VQ6lA+3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685381; c=relaxed/simple;
	bh=9w0aozm5qgJf30Vwj4KT6E+5pKgTpxivdQWFVHn3Ht8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meeYh89LfhY4Ev5TZm0Qc6qSy4BjSp06KFUxrxaAiPKeA0G4M6jxU8XjHwcDv85HF0BdMF+EsGQtzsdRSCc6ddfqTjzvp4T9ywd1jUcRnbJsqQdRHaRi+RMv2qiv+jTqDj9XdF3xIBmh4rvADx3UAiykYSBCqd4/3urRGpsBxZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cd3O9qHJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cd3O9qHJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2218A1F000FF;
	Tue, 29 Sep 2026 12:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790685379;
	bh=9w0aozm5qgJf30Vwj4KT6E+5pKgTpxivdQWFVHn3Ht8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cd3O9qHJmxwUhi4i+7IR55ITy66r8GNziuOt0YGVH+g0ZSRY9QdNSGBvAG8dh64MV
	 RzsRA+51SPSdlGW9t5ISeeNEcoERS2oyZEf39T/Bo7v/Kj9qHIwAHeOTEO1h5ajYUU
	 1zDxeoIkTfvjUKVI3rzkzhHcM6TsR3EskifPlnMi/32tVuRABqpSFKlx/yC68M688k
	 BzvHELFMDg2SNcCvlK8Ihk9THHsiZM3FGNNs4maZCEovZ3nwwFVKdbCAc9Dg21VgEe
	 0jf6ka1Ka71GnYoZ8zgRT6wVUE4vPeH8p4w8z9+Rl8Y/hDdFYYIwHCV+Dp3cxO6VXq
	 99/Im2stE6WgA==
Date: Tue, 29 Sep 2026 14:36:16 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 6/7] drm/vc4: dsi: stop using deprecated
 drmm_of_get_bridge()
Message-ID: <aruwsj4TFCUaLDjJ@houat>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
 <20260929-drm-fix-of_get_bridge-build-regression-v1-6-ccb7e602daad@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="366bc25sjkfcvxjo"
Content-Disposition: inline
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-6-ccb7e602daad@bootlin.com>


--366bc25sjkfcvxjo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 6/7] drm/vc4: dsi: stop using deprecated
 drmm_of_get_bridge()
MIME-Version: 1.0

On Tue, Sep 29, 2026 at 12:36:38PM +0200, Luca Ceresoli wrote:
> devm_drm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() retur=
ns
> a refcounted bridge, ensure it is put by using bridge.next_bridge.
>=20
> drm_panel.h becomes unused, drop the include.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Same comment than on patch 5

Maxime

--366bc25sjkfcvxjo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaruwwAAKCRAnX84Zoj2+
doCqAXwNORdzZPIAJhdGeMgzrt1jcoq6TB7Jj3M8ttuR805L87IJPshdr7ufUQDv
IwKfw/kBgNC2oDbRHWOcpJS92jCEDiGBBVlZSAuiKbn409qXb4YYDU6BxQ3XDhMo
+dWCOdA5mw==
=9j5F
-----END PGP SIGNATURE-----

--366bc25sjkfcvxjo--
