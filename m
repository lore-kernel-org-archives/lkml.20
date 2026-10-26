Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030719;
	b=inD6xAG5wyowGL28p97YC2mps6Z9wov9VzYZCVbF6NdnhGJzexC8z81Oj+GCl17ecoPe
	 dNNW4SOj8sCBB8HSSibHlRWFequZ+lcBJM5PlwAKMf+RiWcDHTIwijIU2wdDyrSB03DSR
	 Lu/KDuNPHqeeQmselZIAFlp/Vxyaw97ZtOmjkVdkm/IJiBVSQIPARJrloGffaH6AQoZXy
	 22IWOQvUwdfqyW9lY2yQhgdDiGcoOTXTMEXpN/i+ueFzfHAY764cdje8C6XrVqve8KdPX
	 5wvgXZ6vUej/XuhL2gWBwzN57vMkItY+QKWJMBvuqTMAIe0mhGURQyOgoQgLZRjcRDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030719;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=X4P9doNSSZHi7xDs27qdq6a7tMm8EvHZftTfeAFfVDA=;
	b=XWd/JLMiFoY04cl8p0JD30W4flH67MYPFUsHk5FkS75SkfIkj4XtIJ0sXV2V5WtAXuqC
	 nTHRYavPycUMMq/VhqRzAlWT1YwHBUaZQnFdPZ8dj9+dQHwKbh3cTbEVmaG62Nwh6cnKy
	 ce1zGnSpQ7UjO6o0D14Rx3wtYhOMI7xzE/NgXK6S2CPc1+WYR+3cY3YOI+1EjlH7Tqol3
	 BODF9JfA8nn73gNmnTrR8hoopYkKSYguJl808lE7fhBKuXcAj3WqUvAWIUYgIq6UGgzy5
	 pofYdpwkpiD9BpCGRryKuqkamQMRmynmle4WJezgSc5Y5mpnsV0G/vaiB6YnOlCOuWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hSPdICTS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4E3606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hSPdICTS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4AD51F01828;
	Mon, 26 Oct 2026 16:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793030719;
	bh=X4P9doNSSZHi7xDs27qdq6a7tMm8EvHZftTfeAFfVDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hSPdICTSQHVA6woacBjH3rS9q9RZFs3lEswVKkoXLSu8osSW/FrZaiEZuJeyqxyqk
	 CsEw0JhKSqar7mioxkx77h9BJE7hubn+kBt0MD8Y1FGSpVFdu/S3S/n9EdNCrmU90+
	 j49j+UJkMwwEJgWejpndXqVSdemwjEGNEj3apbyHKrb/2dVUHpXFlq3F8q+QzyKt35
	 GVylu4ErOYjaz6dEo+UqLxi1Umt/LPre+gvAh7L0yn7ZhCLckloIN5t0+vzvGHfQBu
	 RDhjZv/aKo3dpZUzrMKivWUrZAgDSi7jy8tyNI+aotuu9omuPrfQk190KW4RwXGWxE
	 1fiENVWLVHqUQ==
Date: Mon, 26 Oct 2026 17:05:15 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/bridge: sii902x: Read "sil,i2s-data-lanes" as u32
Message-ID: <at96EnXnYQrZmsA7@houat>
References: <20260831203137.1331960-1-robh@kernel.org>
 <CAL_Jsq+FErjac-iqe+okjjqw9ZwR57w2zrVSt--8aTuegdsstQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="p3z64vdjulzwtl2r"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+FErjac-iqe+okjjqw9ZwR57w2zrVSt--8aTuegdsstQ@mail.gmail.com>


--p3z64vdjulzwtl2r
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] drm/bridge: sii902x: Read "sil,i2s-data-lanes" as u32
MIME-Version: 1.0

On Mon, Oct 26, 2026 at 10:25:13AM -0500, Rob Herring wrote:
> On Mon, Aug 31, 2026 at 3:32=E2=80=AFPM Rob Herring (Arm) <robh@kernel.or=
g> wrote:
> >
> > The "sil,i2s-data-lanes" binding and in-tree DTS files use normal
> > uint32 cells. Reading the array as u8 only works because the values are
> > small, but it does not match the documented DT element size.
> >
> > Use the u32 array helper so the driver follows the binding. Changing to
> > u32 increases a potential OOB access range due to using unchecked
> > values, so add a check on the read values.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > v3:
> >  - Drop the WARN_ON.
> >  - Combine checking the values with any other error parsing the DT
> >    property. The exact DT error isn't important.
> >
> > v2:
> >  - Add bounds check for property values as reported by sashiko
> > ---
> >  drivers/gpu/drm/bridge/sii902x.c | 20 ++++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
>=20
> Ping. Can I get an ack on this to apply it.

Acked-by: Maxime Ripard <mripard@kernel.org>

Alternatively, I can apply it to the drm-misc tree

Maxime

--p3z64vdjulzwtl2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCat96MgAKCRAnX84Zoj2+
dqYwAYDXonET/fuL7fXP2GUp8qHQ+utLWPUgECflw8z149gOxBaYH7tmxn2GeSSW
e6WxSTQBf0vEZS51BMvfLNUgIMgkB8Ll6XHv9aRrH8wZDzkoPa15+2abYm3X01UU
CFjgMezpEQ==
=BTnA
-----END PGP SIGNATURE-----

--p3z64vdjulzwtl2r--
