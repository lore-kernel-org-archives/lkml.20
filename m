Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848300;
	b=zO2/o1k9/BBY77Umvsp/r6SqY3hOZreWrsUK/OfjpnjTo8ZOwQygtRCwuuE+XBsXN+ur
	 AVdHjSealihH5zXQ7DUKoJnbYQXTyQjQY/dHMmEerm6ZrVX5nU5bxlr+ll16gebPfaGdP
	 /9xzKDbXnFviaMHW3SjvbEf+QGQodDY/KT8XX4xm6YinSMPwBx3mlT1beue+zk7B59fWx
	 v2SCQ7wmj1J1JyS05+v1cWJJmohsS5DJdW/WXbgKPqwlIi7AeUlWsAh5OdzVvknkHAwvZ
	 cZ0vZ4JMtEnFAMICxyAkg9p3uY1Bf/sP2qHJyfknpJ3BRLnG7d/gADgsB/jUTzrwDHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848300;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=28901cIX8LutJN7iZwzr6+fi6Xac3bfXQpXleCz5pdM=;
	b=DNfQOSmox2Mzq4fU60EdABwj6C40Y0ZAU5q7FGA/ofTGTGhr3UUeFb8dU02SJTwrBMru
	 RsQZNbDnsdLKUD3RBc9341BImtyq2f+lo3V8p0VAx+gpiZMhx7kznITKiLUm+OeLja36I
	 Z4maGTrOCgy5Hx4bZZ9c9H3dugwbX9CqY2/lZvX4KqajFZSOeqPfwsTnM4pVEWEkWheeM
	 cBHuDTzjFCYSzp4TmCHqpB+pbWRlMZVDWrbSZq2rmbtUNfRYOpGXKEdgYbmVDS+rLp2D0
	 Zd1+tMpvv3F/8X6vqLM+az2i8ufeGBfdIxX84jCcWEberNni7AiwyjbkybCx/xY3B/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfUOhyLS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E64B606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfUOhyLS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0191F000C9;
	Mon, 16 Nov 2026 16:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794848299;
	bh=28901cIX8LutJN7iZwzr6+fi6Xac3bfXQpXleCz5pdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cfUOhyLSHRjMvjLHeSt15CliGgMSiECm6zJkQDimqe383k/1idg2mmt69qKn35HaQ
	 kMoqpSLNffIMFE1l65I6kTxKkV9IFa6fttBYIRk0EzZBRlpU5JDqdHuHRdX8SMREU6
	 gAhLf/P6dTN6oa4ItRWka+OLSJ0gW6nNywdgFhCOCH10QdCPymIVgJPaa5IL11+0HN
	 454nIqqhIaXDkXuf8YEP986jVpSdRYgEbAB3Ba7zVDG6mNjD8Y2DmN95Mox/fYiY8a
	 Cqthn3L2bNBt1zcUpMR1Cfw6Ea2leS0CI2gV/q1yqsQ6jKd5WdmYF3z8twxeyBu3o/
	 SiWDsi1Q4cWXg==
Date: Mon, 16 Nov 2026 17:58:17 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TcOgeGlt?= Pedraza Padilla <maximpedraza@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/4] drm/bridge: Add atomic_sro_install_state hook
Message-ID: <avs0ZoVZz2GomddQ@houat>
References: <20261116142707.1299360-1-maximpedraza@gmail.com>
 <20261116142707.1299360-2-maximpedraza@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="lmzupt35sow6obci"
Content-Disposition: inline
In-Reply-To: <20261116142707.1299360-2-maximpedraza@gmail.com>


--lmzupt35sow6obci
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/4] drm/bridge: Add atomic_sro_install_state hook
MIME-Version: 1.0

On Mon, Nov 16, 2026 at 03:27:04PM +0100, M=E0xim Pedraza Padilla wrote:
> The state readout core lets private objects take the resources needed to
> keep the hardware running when the state read out becomes current, but
> bridges have no way to use it. A panel left on by the firmware, for one,
> would stay marked as disabled.
>=20
> Add a bridge hook and call it from the bridge private object.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: M=E0xim Pedraza Padilla <maximpedraza@gmail.com>

It's something that was pointed out by sashiko here:
https://lore.kernel.org/all/sashiko-outbox-201494@kernel.org/

I've fixed it locally and I'm also passing the connector and CRTC state
to have the same prototype than readout_state and remove some boiler
plate.

It should be equivalent though.

Maxime

--lmzupt35sow6obci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCavs2KAAKCRAnX84Zoj2+
dmS7AX45DAEpHflpF7ISMe5Yuwcx9t/yXPjRSnjPLNwKxJOg1NdMNz50taAEU1nE
Ap6ZvM0BfR9bEhZjkDg6IrfjHAfxOG28DibKKQzO4rhkTxOznzzIZ3f2NRVoC5pH
ustIijD/Bg==
=BjAo
-----END PGP SIGNATURE-----

--lmzupt35sow6obci--
