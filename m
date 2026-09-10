Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C5D33D4E4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789023792; cv=none; b=ubWIrdsTmLqKBcobbecUb1dHKgm0ahxaO868pdBRYK7fBV1saBQ9w49ouvUfqa59zSMkxKyJPu2tJxmWmYad2eM+/Kzp8EfKQrZQFuWA6NyAjC3cQu1dgL/hs7Yeg27QGdc7SpnJRe/jpWIp71YUcimEBfkI6zvSI0EOW6Hh5P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789023792; c=relaxed/simple;
	bh=BjE66fIi8oVDtAizFysavmr+bZc7c8n/oo08K88m1K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTKYNUYYJrsLEcfH/r8u7RGV5v2E6sno5cu4pgFGnXrv18Y2GHze2+jxW01iPMZJNQ6WCm0lGlRdoZE13p49vXC15X3BOiSiDifrkSvNXfO2SkbJZ5iwDeiMsY/QhJt1xDdyGk7hGg73D1PJKsQMkfbiPzHzoQZLfX23snZhZCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDVKmDLC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDVKmDLC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4DD71F000FF;
	Thu, 10 Sep 2026 07:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789023787;
	bh=BjE66fIi8oVDtAizFysavmr+bZc7c8n/oo08K88m1K4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BDVKmDLCWRChAy1YqVvSCzYWbnXSEU+F3ynlxYJVzn86jSmg1e77StTfwHIM9Uifl
	 FKHQBtPhAY3cksXljoLCf3gFCfpKc4ItkE5FXvtndZMNIpifOKaK5TiIp2S7AnlwHl
	 zlrZQfE1o7llj7Kk+v/RtT09k6LGLqdVQVOPnPFnWWiu6P825T59EJArtA1Ievg6E/
	 Hakcz7Qz14r2siSaspysIiVGGHHzPqW8vDKFsu0rkWsDZAdeybyPRD8lbDram2bgVi
	 tyDWsYnGIUM3lqKZ8SYZ0zl71O394Xda6iUz1lU2u0HYbCaBcrK33HkNU9VkQd0KdJ
	 /JHz7k2Dhm4+Q==
Date: Thu, 10 Sep 2026 09:03:03 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Albert Esteve <aesteve@redhat.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH RFC v2 05/19] drm/panel: embed a drm_bridge into every
 drm_panel
Message-ID: <aqJWErwY_fjmlbuj@houat>
References: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com>
 <20260903-drm-bridge-every-panel-v2-5-2ab8ee24538e@bootlin.com>
 <678ddef7e56703d9adffff5c490d4857af515343@intel.com>
 <aqEqx0zBQgmUgwqL@houat>
 <3efb06a30baae6ba1bfcf2be449bf207a30f674d@intel.com>
 <aqFsTzyf1YbQkh6W@houat>
 <f098a1ca30e3ca400b08c909d476a5752c70a6cb@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="wafkbiiq5f6wznzp"
Content-Disposition: inline
In-Reply-To: <f098a1ca30e3ca400b08c909d476a5752c70a6cb@intel.com>


--wafkbiiq5f6wznzp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC v2 05/19] drm/panel: embed a drm_bridge into every
 drm_panel
MIME-Version: 1.0

On Wed, Sep 09, 2026 at 06:57:44PM +0300, Jani Nikula wrote:
> On Wed, 09 Sep 2026, Maxime Ripard <mripard@kernel.org> wrote:
> > On Wed, Sep 09, 2026 at 05:02:58PM +0300, Jani Nikula wrote:
> >> On Wed, 09 Sep 2026, Maxime Ripard <mripard@kernel.org> wrote:
> >> > I really wish i915 was at least *trying* to fit within the larger mo=
del
> >> > basically everybody else uses. I understand that it's a large
> >> > undertaking and regression prone and everything, but I'm also concer=
ned
> >> > about having the "we can't because of i915" or "supported by everybo=
dy
> >> > else but i915" on a regular basis now.
> >>=20
> >> Okay, let's hear it, please name a few things where i915 is alone in
> >> doing something bonkers that amd, radeon, nouveau also don't do, and
> >> what would be the changes that would bring i915 closer to everybody
> >> else?
> >
> > Where did I say "bonkers"?
> >
> > But since you're asking, because it doesn't implement .reset, we had th=
at
> > conversation this week for
> >
> > https://lore.kernel.org/r/20260908-drm-reset-state-flag-v3-0-905570f387=
a4@kernel.org
>=20
> You mean struct drm_crtc_funcs .reset?

I mean plane, crtc, and connector reset

--wafkbiiq5f6wznzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaqJWIwAKCRAnX84Zoj2+
dlkTAYDVOHUF/N9L+RFbNoev1fEP7OCnQrVi6ZTc6m/uPoVZcfy217psBAVtpY28
DuG53wUBfj8azW2PtL8IVoQFustkgTcns9ffqCfvvamzGt3FZay1o4hPp+PdliFZ
JmWCqrhsIw==
=1ICA
-----END PGP SIGNATURE-----

--wafkbiiq5f6wznzp--
