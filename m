Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60453582B9C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964127; cv=none; b=hFSBy+xLY152bFWMfNBxfHEoyuaNjUSUrhJAQjx6ytDeWF0nEpnofhqSVYoljDlyJu7bISqlAzsFg/qwPYVUBSmDzhsGNWTc0cIbyjYkcrgy/R3mTc0u50td2w3e1CcZ6/8FRxPbg1wey9QDTiXwdoU4TtkfLx6JDHHxKm86AYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964127; c=relaxed/simple;
	bh=oj01JFfB6AavahYppTc9T4EaPEzdF+98Q38ewNDpUTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fesLdwIG7s+LZZMSajIt7N+W8i6h+xHbr1i/Wrm1/wg5V1KYQisziv8X5zF6o9M0LrbaUTxxJT1AohPCNGeGJTaQn/PoFsEa5kDZIwU4+ae1jO/8OXW/BzsmiDI1f15ZcQ1Zok+wtLjgs7k+v/YbUxTd8AIpqFV0cZ1kH5oO1OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7QMs4Ri; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7QMs4Ri"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FED01F00A3A;
	Wed,  9 Sep 2026 14:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788964126;
	bh=oj01JFfB6AavahYppTc9T4EaPEzdF+98Q38ewNDpUTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z7QMs4RiqWS030pqfJQFKcD4kpDjcDp9BD5a+akwoYLqcUihHv+wSZ6QhT0us4Ivx
	 na8itMh1dn35cgoDZE7Z6YvcVVOtBzcXk9tDFNZs6aaQFijXwVCnTmpplCq3jQrp69
	 Zm0FQd/eFwcb2/eXBhnoPHXpIEtOl58BkbyXyLiZLpzsqLzBcyLOu8bF69rvZIZcU7
	 HoeL79Z/qDBO3qBe/fQnhB5yOR1wgneYTr9XlTk/T5lqf4IBT5Xpyg5aQSMY3IkQ11
	 tstkpmU9RfUkygK+f1e+l4DfhNj4l46RU299qS29x4XBWbzJ1ZhHeTlajAMluRH4Gl
	 /KdgW/jOcGFxw==
Date: Wed, 9 Sep 2026 16:28:42 +0200
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
Message-ID: <aqFsTzyf1YbQkh6W@houat>
References: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com>
 <20260903-drm-bridge-every-panel-v2-5-2ab8ee24538e@bootlin.com>
 <678ddef7e56703d9adffff5c490d4857af515343@intel.com>
 <aqEqx0zBQgmUgwqL@houat>
 <3efb06a30baae6ba1bfcf2be449bf207a30f674d@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xvg2t2buvlbvtces"
Content-Disposition: inline
In-Reply-To: <3efb06a30baae6ba1bfcf2be449bf207a30f674d@intel.com>


--xvg2t2buvlbvtces
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC v2 05/19] drm/panel: embed a drm_bridge into every
 drm_panel
MIME-Version: 1.0

On Wed, Sep 09, 2026 at 05:02:58PM +0300, Jani Nikula wrote:
> On Wed, 09 Sep 2026, Maxime Ripard <mripard@kernel.org> wrote:
> > I really wish i915 was at least *trying* to fit within the larger model
> > basically everybody else uses. I understand that it's a large
> > undertaking and regression prone and everything, but I'm also concerned
> > about having the "we can't because of i915" or "supported by everybody
> > else but i915" on a regular basis now.
>=20
> Okay, let's hear it, please name a few things where i915 is alone in
> doing something bonkers that amd, radeon, nouveau also don't do, and
> what would be the changes that would bring i915 closer to everybody
> else?

Where did I say "bonkers"?

But since you're asking, because it doesn't implement .reset, we had that
conversation this week for

https://lore.kernel.org/r/20260908-drm-reset-state-flag-v3-0-905570f387a4@k=
ernel.org

Maxime

--xvg2t2buvlbvtces
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaqFtDwAKCRAnX84Zoj2+
doBSAX46K8ejTapIIYk/SeycKWdQwI0tlzsXrMG+ZW7UOhK2h/7KaVEyj4ZDsGjK
dz9VoPgBfAiC3uX8Vw2zw6OMzOZKaidwZ1GSyeGkNSFBaiRnGT6VYthRJkFjw6Kp
CxhOEjtOwg==
=l7Kh
-----END PGP SIGNATURE-----

--xvg2t2buvlbvtces--
