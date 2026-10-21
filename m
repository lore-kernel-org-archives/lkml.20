Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602083;
	b=pegkE+GCjFLkFZeTN/5ZE82+pDnB3c+IB/N/YNRTQvWLRm+M1Ihke2nfVqvjp9o+ysn4
	 Sk6bK5DDbNeBYWi/p7b3NnDy08Nr/P1Mq3AyrzhOGuXz6lVXgwYoLOGboSHGIHXn0jRdC
	 76rx2DFEX2hA16Q3oJCirZu/24TBZURkSiOGjboAk12bqvL6jIm2xXsD7zEy7ehqJJq+f
	 Hj75xk263LHT77eWOJBr7PDPB+bwu61rA27nx8wwAr5FZT/w6F4EPd4+xhJ3U40PTK5j+
	 YJQZivNWHvR2EQEo5EAJonLHWIVtaNeeoh6bK4Hm/TcIQ5iDdKkkH2LVELiZ+17cpAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602083;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cFfUUxDHxpkOld3n52gWPJ2Iw6UD2gBOUzrE3m1Iksg=;
	b=n4dzxqoFL+8B60QW/Wa0mVHN0uKFlk/9zIzV7TWh48d6VmOA9eRvz5VvzQ5xnmNoCp/Z
	 pBuyt1WU0+moxqMk70WeCptgjR/UA3xHNs11t8DHkvh3c2TmntQHemkQbP4Jta6DvpsVP
	 Cpxsvv3UE5vRX+MpqCXUD6xRazlsiBbfyJOHIQCOo8xt8aSSzZZLdAayG9svfNgZnrJw3
	 jFqorlOLqPKp76oRskm2ehlR5LB2MGUDk+aXAbfNUFBTPSUEflw8dcYUJnujrQQkBwDgV
	 zg0C4jtsNa1Op1Klcu5+AhQ1nNe1dhsuTOgHI2yFPL7eusUwygxBgWQr/BvUMkSEniA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Wt/Uh1tJ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A56606A322;
	Wed, 21 Oct 2026 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wt/Uh1tJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6E81F000C1;
	Wed, 21 Oct 2026 17:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792602082;
	bh=cFfUUxDHxpkOld3n52gWPJ2Iw6UD2gBOUzrE3m1Iksg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wt/Uh1tJhO4jyTKqtj7hVmwSFhbV+tzY2GUETLVrOAp5u5PDh2WzGLNiZ8dY3w1zk
	 j047T0x1oxKZIbfhDMHoasBl1tArQm1Yd7D33RnLQas5FFDMwvbqEiuwHyk6UoIExB
	 ye52yq7NT7sIMbNRd3LOWv672F9C951Zl9pgJwCQM+Qq7W3Py1vB5oswBVp3UPPyja
	 XcsG8DhQL/hee2pveUfNQjmeupSJ8AmG4Wy8GVqM4QQ+nAjDxsY5Xtit1s+f39IMeg
	 RfAj+Jk6sF+gBQEcWl+PNZjMzmtSmP0AvM8N76+e+hGiFeXWv3egW1jmmOqvikDX3p
	 Y2eLWk+swJ4Yg==
Date: Wed, 21 Oct 2026 18:01:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/5] regulator: dt-bindings: Add regulator-boot-force-off
 property
Message-ID: <20261021-wind-reopen-490475bc470d@spud>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-1-25f0ffbffa8d@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="W6R3E/++oicwYK05"
Content-Disposition: inline
In-Reply-To: <20261021-paul-lm51772-v1-1-25f0ffbffa8d@bootlin.com>

--W6R3E/++oicwYK05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 12:27:42PM +0200, Paul Louvel wrote:
> Introduce a new property to immediately disable the regulator at boot
> time.
> This property is useful when a consumer device may query the state of
> the regulator at boot time, and want to disable it right away, without a
> prior regulator_enable().
>=20
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>  Documentation/devicetree/bindings/regulator/regulator.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b=
/Documentation/devicetree/bindings/regulator/regulator.yaml
> index 019aeb664cae..2da8f70d7e7a 100644
> --- a/Documentation/devicetree/bindings/regulator/regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
> @@ -41,6 +41,14 @@ properties:
>      description: boolean, regulator should never be disabled
>      type: boolean
> =20
> +  regulator-boot-force-off:
> +    description: a regulator may be enabled by default when the system p=
owers up.
> +      A consumer may query the regulator's state during boot and disable=
 it if
> +      it is already enabled, potentially resulting in an unbalanced disa=
ble
> +      operation. This property ensures that the regulator is disabled at=
 boot,
> +      regardless of its previous state.

To be honest, I'm not sure how the commentary about querying the state
or being unbalanced is relevant to the description - that sounds like
something specific to the linux regulator framework?

In fact, I'm not sure why this is needed at all? Can't you just change
the software so that it is okay to disable a regulator that has an
explicit enable count of zero?

> +    type: boolean
> +
>    regulator-boot-on:
>      description: bootloader/firmware enabled regulator.
>        It's expected that this regulator was left on by the bootloader.
>=20
> --=20
> 2.56.0
>=20

--W6R3E/++oicwYK05
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatjv3gAKCRB4tDGHoIJi
0tDOAP9lQU0EZt/M39eiCT/Z/ePUzPIlYse/mAM53khCiIfDzQEAvAiyhRZ3wdeA
mGwHiIe2zbdBJrsEbUyKe7vmVqN6hAU=
=p70v
-----END PGP SIGNATURE-----

--W6R3E/++oicwYK05--
