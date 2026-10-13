Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A703B7B8C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880814; cv=none; b=mBwzhUjNolIDeuH2S7uX811tjncdjbOYtIW0N8MRU191cyq7QFb6qWA+eA7SSOWRTDG82LIETVcuaqjy9N4utes+Yy+goX8ahMrj9o4LjfNahZcN3VFWQxfCoIxf5M80ZmRyUqE0Bm/TPgBR8hg7S8F8ne7Duvhdiz7Av1+ujNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880814; c=relaxed/simple;
	bh=lDJkJr3suM4nXJ1YRnbcVvVaBxlferRrR2QUyikmFU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXtC7Mgv0a2fKQnPChYluSw1UnSy+OZRSSZqf2U06WF8ckhzJr3FOFZmANGpXhSLbtlJnZcoigGoln+HrqocigfVNlwyJRRGjmdnldGUxoSbPPJ1JfyVcvPNPKDMFpI/TjiRgGzIqdOXvn5l9cyz6EsJNbG0y122xW7oY9vJgZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNGCJZNG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNGCJZNG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DC51F00898;
	Tue, 13 Oct 2026 08:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791880813;
	bh=jksNAfkj66G8uTzQhpaIxURH3ZnRfV6R4KKSwX1NIdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MNGCJZNGBuZaTfXKswL+0nnSMxXiccZAyApfOadkMoUVjO2mcKdAUmaEbzA10Ytk8
	 c3gZiU7CC8iQ9/bU8Y3jL14jSLA1rOseaF1fO53zO2wpKrl69Y9FlZerPD2otlmSaL
	 VTpZJlDldwGtp7jlNQSL6YaAkPdwohqJ4TkOA+mnedgeLCpDHdWQoYCdvSFDakgl5o
	 r2JCh6g6NWU0TjOQQm7JZvSB4J+X/BB5NmCOJ1t8g5Svg0UnOcqZE/PZrVFKoIrEut
	 1d4xr1GHK4bkOJph/ltjs4+KjKTpJyT0xSJYGBX4ZQS3qVc1kLkkAUZVe//SD0ZwmE
	 puvXqT11W0urA==
Date: Tue, 13 Oct 2026 10:40:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jan =?utf-8?Q?Clau=C3=9Fen?= <jan.claussen10@web.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2] drm/bridge: connector: Support the colorspace
 property for HDMI
Message-ID: <as3t4OTbGHIOuXlG@houat>
References: <20261011142733.7806-1-jan.claussen10@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="pdizbv3e7st53xgu"
Content-Disposition: inline
In-Reply-To: <20261011142733.7806-1-jan.claussen10@web.de>


--pdizbv3e7st53xgu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC v2] drm/bridge: connector: Support the colorspace
 property for HDMI
MIME-Version: 1.0

On Sun, Oct 11, 2026 at 02:27:32PM +0000, Jan Clau=DFen wrote:
> Bridge connectors for HDMI do not expose the colorspace property,
> so userspace cannot signal the colorimetry (e.g. BT.2020 for HDR).
> KWin requires the property before it offers the HDR toggle.
>=20
> Attach the property for HDMI bridge connectors, next to the other HDMI
> properties set up by drmm_connector_hdmi_init().
>=20
> Force a modeset when the property changes so the new colorimetry
> reaches the sink, as vc4 does in its connector atomic_check.
>=20
> After toggling HDR on, modetest shows that the correct BT.2020 color
> space is loaded. After toggling it off, it loads the default color space
> again.
>=20
> Tested in KDE Plasma 6.7.5 on a Radxa Rock 5B (RK3588) with an LG
> OLED55B87LC.
>=20
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Jan Clau=DFen <jan.claussen10@web.de>
> ---
>  .../gpu/drm/display/drm_bridge_connector.c    | 25 ++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index 81f3e26f6fdf..885094cc6ddf 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -414,11 +414,24 @@ static int drm_bridge_connector_atomic_check(struct=
 drm_connector *connector,
>  {
>  	struct drm_bridge_connector *bridge_connector =3D
>  		to_drm_bridge_connector(connector);
> +	struct drm_connector_state *old_state =3D
> +		drm_atomic_get_old_connector_state(state, connector);
> +	struct drm_connector_state *new_state =3D
> +		drm_atomic_get_new_connector_state(state, connector);
> +	struct drm_crtc_state *crtc_state;
> =20
> -	if (bridge_connector->bridge_hdmi)
> -		return drm_atomic_helper_connector_hdmi_check(connector, state);
> +	if (!bridge_connector->bridge_hdmi)
> +		return 0;
> =20
> -	return 0;
> +	if (new_state->crtc && old_state->colorspace !=3D new_state->colorspace=
) {
> +		crtc_state =3D drm_atomic_get_crtc_state(state, new_state->crtc);
> +		if (IS_ERR(crtc_state))
> +			return PTR_ERR(crtc_state);
> +
> +		crtc_state->mode_changed =3D true;
> +	}
> +
> +	return drm_atomic_helper_connector_hdmi_check(connector, state);
>  }
> =20
>  static const struct drm_connector_helper_funcs drm_bridge_connector_help=
er_funcs =3D {
> @@ -1079,6 +1092,12 @@ struct drm_connector *drm_bridge_connector_init(st=
ruct drm_device *drm,
>  					       connector_type, ddc);
>  		if (ret)
>  			return ERR_PTR(ret);
> +
> +		ret =3D drm_mode_create_hdmi_colorspace_property(connector, 0);

This should come from drivers, you can't expect every driver to support
every HDMI colorspace.

> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		drm_connector_attach_colorspace_property(connector);

Most importantly, all that work should be in the HDMI helpers, it's an
HDMI feature just like, say, max bpc

Maxime

--pdizbv3e7st53xgu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCas3uaAAKCRAnX84Zoj2+
duVEAYCwklsV52pgF6178CvEZ29ybCYPzm25PF7EY7lWXmd/jTOeak1baLJlRQaE
Z4rJc9kBf3y2hkiOpP0ge1L8D++kK2IhyO7/2d+GHiuZ3v7o/Uz4mp99Jm0tHbYZ
02J6s2KCbg==
=HM6a
-----END PGP SIGNATURE-----

--pdizbv3e7st53xgu--
