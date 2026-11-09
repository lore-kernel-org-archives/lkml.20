Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234462;
	b=XSEpHRaynIsz4LOFzzRHikHaedbAjGox0zHpxUEC0okMiWG10rn4ErSAulRSN2hRIp9X
	 02Goz/XB9ETTH/JFhPatn9+W5UjK7KKZw+3PLx10Y0nEsK4ny0z3ignEfOVvUN5lg4h3x
	 5ip0AQWdFOBTk7DhOx8C6JJTG/qE3m4tthatFp5DfrynxdVFE6As7r6hnWjLViEyu4jua
	 Luo4GdsaAdBWomGMWd7T9ZaFgoSVgz3OmKXFYPTOmlAIop+96mMUFrY4gtEkV4UFw+bFA
	 IuyODspMbSXb1+Tt41l7EmmHHhm6U1HhLq4U1h18IWQU2WSNM3HncXIE6vPG3hroKnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234462;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=PzgDZXq8mAESvBTnLI3pkcJef2Jyc+p//dJfUjQ3P80=;
	b=syqmDd+QUi+5w2isU0fTJZqx5h38bwfEstl8p85oripace4r7lkvq1NKbspnbB4oECgh
	 LFszNTwVmCWeqb6agfuR8KnTx1tnAyVomlyYJkgCVFJLDsh9tRAmakHXJAStMbNWrEq5B
	 wIwPre7xym3771c7tOsCbvHCRp3OHt6wImxCz9Vtf68hwcYptRF9HCtaw02A1V7zhUfdT
	 nZWvs8af26NVqlS6annmh+StHuuo/l0+7c/fduaeoGvZW+JqbVIzG8CjRTYGDtVxhM8F3
	 SygX5i7Z2PWu8Xcvos0/9uGz2gxSh0HxUkd+A4dPNCaCRGgzwLio0Py7PBesulX3FgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NEO7l5Q/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0641B606A31C;
	Mon,  9 Nov 2026 14:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NEO7l5Q/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19451F0089F;
	Mon,  9 Nov 2026 14:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794234461;
	bh=PzgDZXq8mAESvBTnLI3pkcJef2Jyc+p//dJfUjQ3P80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NEO7l5Q/8gfWe7ST1NMNUvdrXUnOb46nH40Z0mJ7HO5U/x/zP0JShPJb0Gg1WXOp0
	 eAhhto0pjlPS7am1i/GFTSDAckK/DbFKxOC+plO7ZYwi1AfIZKvuZJhKsoqD4BqIMC
	 olpliISC0MDGA2WoM1a1RpnX64fKZ2F6x+a5wL55M91lzSQZ2X5ppSpti2BP9ZTPDr
	 RW/4IQNLx3jXd5a9mhemtpAJ8OfCeN2+GXI/mWkewyuN63Eh1Dk1OybN0RySirUW9O
	 HaxvY2TTL0KrueNhIh/4fYs+eEu8f8i9dN0o0E7fVs7rbwwV+8NsbXdRmteUY5m/w8
	 DgXpJhNWXG05Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7C00D1AC5995; Mon, 09 Nov 2026 14:27:39 +0000 (GMT)
Date: Mon, 9 Nov 2026 14:27:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds-lj tree
Message-ID: <avHYW2Xy7zS5pwRl@sirena.co.uk>
References: <auyHEHDcjYRWM5ip@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gdNVRn4qK34rS7Oy"
Content-Disposition: inline
In-Reply-To: <auyHEHDcjYRWM5ip@sirena.org.uk>
X-Cookie: Victory or defeat!


--gdNVRn4qK34rS7Oy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2026 at 01:39:28PM +0000, Mark Brown wrote:
> Hi all,
>=20
> After merging the leds-lj tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> /tmp/next/build/drivers/leds/leds-pca955x.c:544:37: error: use of undecla=
red identifier 'client'
>   544 |         device_for_each_child_node_scoped(&client->dev, child) {
>       |                                            ^
> /tmp/next/build/drivers/leds/leds-pca955x.c:544:37: error: use of undecla=
red identifier 'client'
> /tmp/next/build/drivers/leds/leds-pca955x.c:554:25: error: use of undecla=
red identifier 'client'
>   554 |                         devm_release_action(&client->dev, pca955x=
_fwnode_put,
>       |                                              ^
> /tmp/next/build/drivers/leds/leds-pca955x.c:559:35: error: use of undecla=
red identifier 'client'
>   559 |                 res =3D devm_add_action_or_reset(&client->dev,
>       |                                                 ^
> /tmp/next/build/drivers/leds/leds-pca955x.c:562:11: error: incompatible p=
ointer to integer conversion returning 'void *' from a function with result=
 type 'int' [-Wint-conversion]
>   562 |                         return ERR_PTR(res);
>       |                                ^~~~~~~~~~~~
> 5 errors generated.
>=20
>=20
> Caused by commit
>=20
>    abeb74220fefe (leds: pca955x: Take a reference on the child firmware n=
ode)
>=20
> I have used the tree from next-20261104 insted.

This issue is still present today.

--gdNVRn4qK34rS7Oy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavHYWwAKCRAv73Ows9A4
iePXAQDSbGE5N3BAvpq7us47E2YW+F62vw/yajeOx3L0FPRf5QD/S8Yh+E+abufg
BReLo69pdZSUtccHJs2KLqyrqhIphgQ=
=y0f6
-----END PGP SIGNATURE-----

--gdNVRn4qK34rS7Oy--
