Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A8A3EC691;
	Mon,  7 Sep 2026 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788802114; cv=none; b=l7xGvpB3NeGKTzLol6M74mGTJ3AgEyKw/SzyAbbE2eNgkkhQY8AgV3cSknPt+iAbA58BXfKe8XCjM6ENgBGTNonodWVEvO4CSZrGrskDi0Xs+crTWStbzRefLReUU4Ck3H7mVRFQTnd9VVxwOTq6eKVOavRX7aqJI1QE9VNQEZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788802114; c=relaxed/simple;
	bh=h8LdcGdcS/Em1q9FNi2GQNd9jGELMZssvnTHx23y9CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRnl3HeXIuF/67jRplMo1d8GAoZNlMjnqDg1aSO+AoqNFHj3YSYIpfmAo7kCwT9rmox2tyYdGap0Y9RYn1xv6CKG4ibiIuxX/iuwe/3VVTQtg59oOFZDpxwSH4VlAAvAkoGJGC0LOiNJIYlgTlbZr9zdpjHcXwnUpl0rIPku210=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HY1KTOtQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HY1KTOtQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B093A1F00A3A;
	Mon,  7 Sep 2026 17:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788802113;
	bh=lG8o7GXuxZX+JAJ5wwvlYurB2A3tztlS0yQP249B198=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HY1KTOtQVDzcfBMo/HUr7NbDpE0BpzWUgV/gqCrf9tApeH0B1cQlH2hoZ0rzfb4Wm
	 M8URKzs++iSeMg51nUBz5+1e4gNzRQDhx/a3igEIV++4TG2AlRfmLDbGHA7oQpM5Rg
	 0TgVuO4hXFzBrFoO7VAG64sYp8l0RvyiyeAhP37NUUdUDg0KMzKAnoGQdJwKGpJcKe
	 EoUSaUmtBqJ0ui/P+y5/iXHrqGG493/z0FNFxi3c6l3AAvEqE+vyl4WDd4GnoutZUx
	 uiDnKErAucLXMydRPhFe0AykUMS8/yz3kZmGMLeQftICfrc3XU1vT9BmDoppQzEsjx
	 ZzlPtnOPTlz3g==
Date: Mon, 7 Sep 2026 18:28:28 +0100
From: Conor Dooley <conor@kernel.org>
To: jcarlosgl96@proton.me
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Add SPC Glee 10.1 A64
Message-ID: <20260907-stock-eggplant-d03a9df18a22@spud>
References: <20260906-b4-spc-glee-a64-v1-v1-0-621df2155e31@proton.me>
 <20260906-b4-spc-glee-a64-v1-v1-1-621df2155e31@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TEVY/w6YcpsZjCWR"
Content-Disposition: inline
In-Reply-To: <20260906-b4-spc-glee-a64-v1-v1-1-621df2155e31@proton.me>

--TEVY/w6YcpsZjCWR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 06, 2026 at 04:05:49PM +0000, Juan Carlos Guti=E9rrez Lavado vi=
a B4 Relay wrote:
> From: Juan Carlos Guti=E9rrez Lavado <jcarlosgl96@proton.me>
>=20
> Add the Smart Products Connection vendor prefix and the board
> compatible for the SPC Glee 10.1 tablet based on the Allwinner A64.
>=20
> Signed-off-by: Juan Carlos Guti=E9rrez Lavado <jcarlosgl96@proton.me>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml       | 5 +++++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documenta=
tion/devicetree/bindings/arm/sunxi.yaml
> index f04db28c6..ce425938c 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -902,6 +902,11 @@ properties:
>            - const: allwinner,suniv-f1c200s
>            - const: allwinner,suniv-f1c100s
> =20
> +      - description: SPC Glee 10.1 A64 tablet
> +        items:
> +          - const: spc,glee-10-1-a64
> +          - const: allwinner,sun50i-a64
> +
>        - description: SL631 Action Camera with IMX179
>          items:
>            - const: allwinner,sl631-imx179
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index ba2002969..ff462d6f0 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1603,6 +1603,8 @@ patternProperties:
>      description: Spansion Inc.
>    "^sparkfun,.*":
>      description: SparkFun Electronics
> +  "^spc,.*":
> +    description: Smart Products Connection S.A.

Typically we look for these to match the vendor's website, which I think
in this case would be onspc?

>    "^spinalhdl,.*":
>      description: SpinalHDL
>    "^sprd,.*":
>=20
> --=20
> 2.55.0
>=20
>=20

--TEVY/w6YcpsZjCWR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap70PAAKCRB4tDGHoIJi
0vxzAQCi0QTrA0WKec0buuvAiV6kfKTDWQ3NX8CCtz11tIHWDQD7BQ8gEclMlvB2
r7x6V6ctZaTxbR6318OGYFCYYQr56AU=
=KFiq
-----END PGP SIGNATURE-----

--TEVY/w6YcpsZjCWR--
