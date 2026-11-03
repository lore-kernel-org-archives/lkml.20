Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742381;
	b=MLGGC3+CoHBeKSEDwLpmIFS9ZDJvsuGRLIAobPC2dZBvHSVcPcQHTOSb3Y69tgMlD5Ae
	 sC+iqfm9tIv0nNCIL/9dVoP/9Qhhk0S2C7PRAiRhyTXIeMf3pL8c3IHvY6RBUxkx57mXm
	 cFGGCC+zNsBOKFztB+xC1jMnceFr4jS26zwqiWQ+eMM4cav80g7BwtIyDa/60EqoBlyX6
	 gZGurxuhvC7AUZf1XQ6EeBDGqAMQYxpkHFw+tyjECVnbGb4AZoz5W6VqN7Ih/upR5l8/l
	 B9fMMcohYDoF/aJscAK6P7Cuonh/+dVCgkrA1qL2MSJ6lh9ICvI8UHeG2bQ1uEYD3gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742381;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0DNLLjSttti2OQSih1kTXZgEXGm357f1EA6dDkr6z5I=;
	b=CFNFCevAJD1q4KMaRviMj8TI+uTg1RkJQSz+i/IqQySY8tpliacaLhoxY1SAO/dnK1sj
	 0GEzir7HpSNcfeS5/T3GfcopLiQBvBvU8QkFKbF2pf1G4Ir36t7VkEby+gWPRyEw6rCNW
	 jm9mWUcC2xzHgaUTrqpCIjbjXbozNhQm6Kc2JjkXi4CWb6mBMfSW4/HL+WX24hEO7WRHs
	 Fo2TI6qFCdjuQ120BOOVSU2icqwusI4RcBN7c/YBXrfl9/6n8We3Q2YhBvNVLKpyDhFpw
	 QTSDW+C0b11YOP2eG3OSXRpJVIU6YcWEZqcbtcXzT3VjfHCbUFuAXMXxt9PR8tWg6kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AYwtomkS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C632606A326;
	Tue,  3 Nov 2026 21:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AYwtomkS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1957A1F000C1;
	Tue,  3 Nov 2026 21:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742380;
	bh=0DNLLjSttti2OQSih1kTXZgEXGm357f1EA6dDkr6z5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AYwtomkS/1VYXxTOzT31d7QR4zUOKxpye6LygxNbHb+8Jj3nDdpgqbEOUrzn3Mx7p
	 uCb7U6IX1aY9LOsrE65b1ZFk9Qo44PjPInFKyoI4NDpU2HXu3kTsZh1QU5Xe4lC1PU
	 1rVw2GqHGlPPDvQJVeFVtTYGADyQFDhFJMY+r7u2f4XIABklH3AHpr0Mx90ur9Z37x
	 sCu4wbZJTXUkHOJwYZhn5dW/3UKPEwCWGA5ITqitIE0lBh2osKwwEhCJBr5eoF+lar
	 DciNd1tW33XQRgswy037GWTVgbpxIe+R2ASv/gbE5CPezX7x2OWhp02yTR8X6UQD2u
	 KRt4hltnhLHZA==
Date: Tue, 3 Nov 2026 21:46:15 +0000
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 4/8] dt-bindings: interrupt-controller: Add MIPS P8700
 APLIC
Message-ID: <20261103-palm-stand-5f54657140f7@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-4-3ac5d49f2c37@htecgroup.com>
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
	protocol="application/pgp-signature"; boundary="DoJrlLmBCVXxxwh0"
Content-Disposition: inline
In-Reply-To: <20261103-p8700-dts-v2-4-3ac5d49f2c37@htecgroup.com>

--DoJrlLmBCVXxxwh0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 04:11:28PM +0100, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Document the aplic compatible for the MIPS P8700.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml =
| 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv=
,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,=
aplic.yaml
> index 0718071444d29fbfa36283fc9666e8cecd6f77e7..9b986aa1a1c62316a1fd08fe5=
35075111601b80e 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.=
yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.=
yaml
> @@ -27,6 +27,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - gf,mips-p8700-aplic

tbh, I don't like this because other devices on this "soc" are using
mips,p8700-aplic and so I think this should be gf,p8700-aplic but I
don't really care that much.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>            - qemu,aplic
>            - spacemit,k3-aplic
>        - const: riscv,aplic
>=20
> --=20
> 2.43.0
>=20
>=20

--DoJrlLmBCVXxxwh0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupWJwAKCRB4tDGHoIJi
0ouyAQDJ+wUgUc04yCoAMVTPXDadsJZrrjNC74GrjwNAVDDwBgD9Fdx4gjR/QuhF
oaDNIvt0fRWflgAUJp7oXfdoMfO90w0=
=b4BH
-----END PGP SIGNATURE-----

--DoJrlLmBCVXxxwh0--
