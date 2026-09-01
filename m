Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A8448D860;
	Tue,  1 Sep 2026 18:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286279; cv=none; b=F321kQxQ1dlH6fuwpEsvh1xCrq6NUW7b169AB+tnJJSKatcpI8ikjBouWhX9sxPB0SH8eE44cK9GE9T/5kq7xgpXAIo4Hn16x2naxOR8lxcZ/7XKCGXsRLkZpVPvkIk65og89pT4KdjHx4SmryMgdZRnhSLe1X6nQpNSQE2r7nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286279; c=relaxed/simple;
	bh=mULlVCHPjdzjNigkx5JxL8ypwPV/SoapPHR9GniAmQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nB3glkxQVv77ORzySA+XK7zA3m9AyiO7f2Z8PlTXRk0HH7SbU5N7ly79cERJtCiIa1u4Iz3qtdp3bm8cwfNHPojS8W9fUub4F5OpbbBivZ1P34I7iVcq3gdfws2oIx5ptonEnXnWzkt6HG52wELOCvvjxijZPccYmXRB5Geun7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUffxqNd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUffxqNd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB6B1F000E9;
	Tue,  1 Sep 2026 18:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286278;
	bh=7A3D77oYb9lO2ucgy7opOnh1NQarpM3lLRvGIFImSmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fUffxqNdnjN4dvqLa8HkRpjcz3WbnjAQJanhSO32KLlYCj2QlPM9hu9jXo8Hd6k14
	 kdwY/6QnQUSVBl4Jwel63zOhYrlQkmloBx+LCGZ8xgVU+HeBY6dHdt3x4csS4vmBUL
	 WeJ5c/Hu7KgMVu7uOfFlWhTZKRTtGZxV9UnDdQklwZ75cpyDa7XY+H39lHCXcwTFca
	 YrK4jXg8UPtUs16KlaYQHZnK2he5SH4ofcL3ejuTlEyD6gYqDzMdqH4bxu7uepVDZG
	 dVxKb7BISMNHYcMZGfMF/WNuBOC7ZadxXkYM4WNHgb+fX2uc0jy6DoHtnrzka6OrMM
	 2MC297KQHH+AQ==
Date: Tue, 1 Sep 2026 19:11:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	devicetree@vger.kernel.org, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
Message-ID: <20260901-smolder-debug-e37fdd2b3d20@spud>
References: <20260831231359.136475-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XitfqtQqCQMp0V+w"
Content-Disposition: inline
In-Reply-To: <20260831231359.136475-1-marex@nabladev.com>

--XitfqtQqCQMp0V+w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 01:13:24AM +0200, Marek Vasut wrote:
> The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
> represent the USB 2.0 FEMTO-PHY. Document subnodes pattern properties and
> address/size cells.
>=20
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marek Vasut <marex@nabladev.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> V2: New patch
> V3: Fix the bindings
> V4: - Undo simple-mfd in favor of dedicated SYSCFG SoC driver
>     - Update commit message to match, this used to be patch
>       dt-bindings: arm: stm32: Switch st,stm32mp23/25-syscfg into simple-=
mfd
>     - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB s=
upport
>       https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.=
com/
> V5: - Add missing contains: into conditional
>     - Add phy subnodes into required list for stm32mp23-syscfg/stm32mp25-=
syscfg
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml   | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.=
yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 95d2319afe235..2cce174004fe0 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -39,6 +39,17 @@ properties:
>    "#clock-cells":
>      const: 0
> =20
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/phy/st,stm32-usb2phy.yaml
> +
>  required:
>    - compatible
>    - reg
> @@ -57,10 +68,17 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          const: st,stm32mp25-syscfg
> +          contains:
> +            enum:
> +              - st,stm32mp23-syscfg
> +              - st,stm32mp25-syscfg
>      then:
>        required:
>          - "#clock-cells"
> +        - "#address-cells"
> +        - "#size-cells"
> +        - phy@2400
> +        - phy@2800

This looks good now, thanks.

I got hung up last time though and maybe didn't notice - in addition to
requiring these things here, should we also not forbid them on other
platforms that don't have them? IOW, adding "else: properties: foo: false".

With that, if appropriate,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> =20
>  additionalProperties: false
> =20
> --=20
> 2.53.0
>=20

--XitfqtQqCQMp0V+w
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapcVQQAKCRB4tDGHoIJi
0nfWAP0ZEF856WKBOfVU5KFg53DSHMTrpa6sx2s+k3F4RZWmdQEA3HajU/xt/Ow7
GKRdXPOLWgOMe1YO+YsbITvz8L85tgg=
=4NeS
-----END PGP SIGNATURE-----

--XitfqtQqCQMp0V+w--
