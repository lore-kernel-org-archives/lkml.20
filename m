Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A0A477E23
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787840231; cv=none; b=Y33oF1vk3dzOlKAhWbGQYq8odprBYjBQQFz6yequOQOTTS+RP67pcM9kmFAT5qRrE3FfKkYqHmlMsrxxuKDdjHuWuib69mZTLe4qSNyhm/ZCgWLBSUpCPDGWYEZz+jGT37j7T1+DZD/f62hx+K2oFjAkyVMCiXJ7Zeo6g5yMoKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787840231; c=relaxed/simple;
	bh=mEf9ndDDkP/zBpQScU8+/HYJVwPjKOZHk3JeFq95lAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPoCLM2+1EzivGXuFd9Z/qvFSvEEOky6qQ0W3qx4sxZAesoAG/npqnL4aCWCrWbHyMltN3AQyfBGBa7Tg8VoHYxOXiTF8dOw26sSJNGIjme/MlgL523QknJaUoewLlm1ibjTBsPY/h7bi7cn+ermbyKUtbaPg0CpX1wE6PQXqjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOOuDyD1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOOuDyD1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A01B1F000E9;
	Thu, 27 Aug 2026 14:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787840228;
	bh=SRS6X6TXw6Tr+PFBiZcsPHGo5nRK4IWPTb7UQu+FNwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LOOuDyD1bld19rGBu8oHAHMiweAT/Te66dh5B+NbY34f+CmejOjHIq9nTHRXW/uEZ
	 D4b1L46WgQJnV0e4gnFWE7mszOSJ/PMQPzId1vHY6PWFj+S5/66sKQJpEN/jglF65J
	 E2BzvdctpNl7LKh331P3vgzpvAPozUc3FFQlMZpuSXtl/MV0bqXubI8MnyqKVqGEYg
	 yiIqoMnZXTWiabr4DFJiBexZKXlgWCXIPXfZ6ThRad0UYimgqlgiDCTcd9y5v2PVvP
	 Ov+jNbQTZ3lKRizZWwuezlN+mFrChWxAZEq0C4AjOW+Kw2GewlJu4iO+7yVd6VKENg
	 DHrK4LzA99R0g==
Date: Thu, 27 Aug 2026 16:17:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] drm/panel: merge the drm_kms_helper module into
 the drm module
Message-ID: <apBGjqt9GI5egQW6@houat>
References: <DKR7VTBLRBQW.2LLJMDO74KXNO@bootlin.com>
 <20260824-cuddly-aardwark-of-reward-0d93d4@houat>
 <DKX8KDDOTPM7.3OS616IO3E4UA@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3h6vkmrdieos4f6d"
Content-Disposition: inline
In-Reply-To: <DKX8KDDOTPM7.3OS616IO3E4UA@bootlin.com>


--3h6vkmrdieos4f6d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 04/11] drm/panel: merge the drm_kms_helper module into
 the drm module
MIME-Version: 1.0

On Mon, Aug 24, 2026 at 04:16:02PM +0200, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> On Mon Aug 24, 2026 at 9:48 AM CEST, Maxime Ripard wrote:
> > On Mon, Aug 17, 2026 at 02:27:58PM +0200, Luca Ceresoli wrote:
> >> On Mon Aug 17, 2026 at 10:31 AM CEST, Maxime Ripard wrote:
> >> > On Fri, Aug 14, 2026 at 04:05:52PM +0200, Luca Ceresoli wrote:
> >> >> Work is in progress to make every drm_panel automatically create a
> >> >> panel_bridge [0][1].
> >> >>
> >> >> This requires the panel code to call the drm_panel_bridge APIs. How=
ever
> >> >> this would create a circular dependency loop on modular builds:
> >> >>
> >> >> __devm_drm_panel_alloc() [drm]
> >> >>    -> drm_panel_bridge_add() [drm_kms_helper]
> >> >>       -> drm_bridge.c APIs [drm]
> >> >>
> >> >> Moving just the panel_brige.o file from [drm_kms_helper] to [drm] d=
oes not
> >> >> work because the panel bridge code uses the drm_atomic_helper and
> >> >> drm_probe_helper which add further dependencies on symbols in the
> >> >> [drm_kms_helper] module.
> >> >>
> >> >> So take a simple approach, and move the entire drm_kms_helper into =
the
> >> >> [drm] module.
> >> >>
> >> >> Link: https://lore.kernel.org/all/emuj2innmp6zmzd7pyakqzjqpdzhly6qf=
hakya3ydwmd63pl26@5jwxaidpikjw/ [0]
> >> >> Link: https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-8=
-9d6f2c9c3058@bootlin.com/ [1]
> >> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >> >
> >> > So, that's not an option. However, why do we need drm_panel_bridge_a=
dd()
> >> > after this work is done? If we want to create a bridge for every pan=
el,
> >> > then the bridge implementation can live in drm_panel.c, which is par=
t of
> >> > the drm module.
> >> >
> >> > And we'd essentially move drm_panel_bridge into drm_panel.c, and mak=
e it
> >> > private.
> >>
> >> Yes in theory, but the panel_bridge code uses other parts of the
> >> drm_kms_helper module: drm_atomic_helper and drm_probe_helper, maybe m=
ore,
> >> so we'd have to move them into the drm module too.
> >
> > Ah, right. What would happen if we were doing it the other way around
> > then? Move drm_panel out of the main drm module?
>=20
> Into the drm_kms_helper module?
>=20
> I had a look and did some experiments and I found at least one user in th=
e drm
> module calling a drm_panel API, and guess who:
>=20
>  drm_of_find_panel_or_bridge() (in drm_of.c, drm module)
>     -> calls of_drm_find_panel (in drm_panel.c, drm_kms_helper module)
>=20
> Based on our discussion after patch 3, I'm not sure
> drm_of_find_panel_or_bridge() will disappear soon. If it doesn't, I guess
> we can try to move drm_of_find_panel_or_bridge() into bridge/panel.c which
> is in the drm_kms_helper module (and from drm_of.h info
> drm_bridge.h?). That however might trigger build failures for drivers whi=
ch
> currently don't select DRM_KMS_HELPER and which would have to select it.
>=20
> I'll give it a try, and if I see major drawbacks I will get back to moving
> all the drm_kms_helper code into the main drm module.

No, I meant into its own module. Do we have any dependency from the main
drm module into drm_panel?

Maxime

--3h6vkmrdieos4f6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCapBG3AAKCRAnX84Zoj2+
dncAAX9e0Le80mECcRvZjSFwfKDsJn14yX3qpt61zpnr4XCT7oYutU6uDr1R3/aq
BtDoNW8BgKN0pJx0d4WvMJowi4FKM9HLeXIVZOanNJQlHbCV551rvrJJHQkcpP9u
wtO4YWM9TA==
=RS0G
-----END PGP SIGNATURE-----

--3h6vkmrdieos4f6d--
