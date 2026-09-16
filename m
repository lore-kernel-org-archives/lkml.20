Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E454EE848
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561694; cv=none; b=mnJhHr4OoHQiaxzs6fvZOPbVQCcWb8QxoWQ3MSgB2hw7fzclYt7Z+meidCTqnPYcURpWyowK1aJ3iuOYbCY8XDTLbeLkuD6xJrNdsWEJo9F/xGjyrsSSgSYGiOzLjUWPGkjmPiIuo65JBBHO4KEHI3OvbKbIDz1xPwf87GyNIzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561694; c=relaxed/simple;
	bh=Ag8OOt4g58qZfAkr65vyEbldEryl9kUs97VL2D42LQg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=pdXwUl/5hZJZZ+idVNd9R4E0aTzEFEDyuOsISEJj9OMEn4/kqUJv1CJqwAQG92CIKEV6hJz22krBPPvHryfNYUvip2aB1Hy9KyIbnQ9YHC3X4PsyiLk22PUBgYldtFSDyqFloSO5oFrG3ROT7FU8/xhAGxcluTB9oJk9sVpcmaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKLzkGYc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKLzkGYc"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id AF5CE1F000FF;
	Wed, 16 Sep 2026 12:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789561683;
	bh=Ag8OOt4g58qZfAkr65vyEbldEryl9kUs97VL2D42LQg=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=dKLzkGYc0/3mpgfaS6gzmi91vcin3yP+BR4cW1bM77XZJq/S7Y0ulSwqpW1Y8u/rZ
	 GI+93U0KsAF1rpfCxt2CF+41KA0C+cUqP7h5/FhRRzuG29lc7Mp2bWTQ3oLPxFX1vT
	 Ksh11ouCV1LMgyhgMm7BBnfqQVVN/RCSk0RzhHmn4X8hA+TrU6FR7C6jXE/KN7viVq
	 WQ16Bve+OeEJuBOqLhWZ4r/MU7JwKgc4A9GkiWVrW9mt1Xr7FVeOsKcrKUWMx160dX
	 4aQHqDo49lTficzC+8nIY0jeoVS5DpGzRfJxQfXgfgcEY2LARAjakvN41tJmFhsF+b
	 y0ISnRT4+9lAA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=6e1436efd4e05dee87d06ebca7f175f89de8d715b4b2efc88759afa5eb2d;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 16 Sep 2026 14:27:58 +0200
Message-Id: <DLGQO5S9MPAW.2XR8ZUJNGW2CO@kernel.org>
Subject: Re: [PATCH v4 5/9] drm/bridge: tc358775: select DRM_PANEL_BRIDGE,
 not DRM_PANEL
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, "Tony Lindgren" <tony@atomide.com>,
 "Vinay Simha BN" <simhavcs@gmail.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>
X-Mailer: aerc 0.20.0
References: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com> <20260915-drm-bridge-drm_panel-cleanup-v4-5-30401d9406f3@bootlin.com>
In-Reply-To: <20260915-drm-bridge-drm_panel-cleanup-v4-5-30401d9406f3@bootlin.com>

--6e1436efd4e05dee87d06ebca7f175f89de8d715b4b2efc88759afa5eb2d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 15, 2026 at 6:46 PM CEST, Luca Ceresoli wrote:
> This driver does not use the drm_panel APIs at all, so no need to select
> DRM_PANEL.
>
> But it uses devm_drm_of_get_bridge(), which is enabled by DRM_PANEL_BRIDG=
E.
>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Vinay Simha BN <simhavcs@gmail.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--6e1436efd4e05dee87d06ebca7f175f89de8d715b4b2efc88759afa5eb2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqqLThIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hhCQF+KJt256zQHwKdDeDGqk58DkDT3hws7NWr
4pvvHCAl7/YzJz7sH1vM1qUgSpywm7rkAYCXJifap04158THPGOk6FmbuHDTWUzy
fGfd0BTzbmgoMyZt1Umk9kcnKaDFJUwk8xE=
=3pvO
-----END PGP SIGNATURE-----

--6e1436efd4e05dee87d06ebca7f175f89de8d715b4b2efc88759afa5eb2d--
