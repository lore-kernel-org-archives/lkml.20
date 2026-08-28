Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42735373BF8;
	Fri, 28 Aug 2026 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932684; cv=none; b=dzb9ZjaCmLRhHAk9A7NLfYFo3sw+6X4WkDcUuGFzN+WwzkcCr+QbGlqU5g40kXQzTl0PJOBGjfJqrHsTTcd+7XBufGT56Xg4WmrWfat+Pnm/p2S9tmYuXl4qPrBmzvpEplkdCvEELkztqJUzFHevBL0ilF0hcFCke3Bdw61qfmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932684; c=relaxed/simple;
	bh=+vIG8lUorVneYYip+b/54NQvwXZJDwfZnQu+9NVnC04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfGB5z/PYDNw/fi3mf5teH1FgEHKb+pGdei9kr/ncGawTsMjBWLM8zp0mhiMpSma8oRYHzLGLtNXeQiQzTWjma8zxAewk0EPd4I9c9xE/RYJXV8/BIkU+N3P4ZaXy79yIbwHH2p6EPmcXR/QaatUhSfINiMKK6wQKJjJ+2qmqzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LrckKejp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LrckKejp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD471F000E9;
	Fri, 28 Aug 2026 15:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787932682;
	bh=vNRuYNMMYQIuEnuu2o2Nr6GCoLL2edAk+oJ21dlQJKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LrckKejphv8pIR/LxNrFlXIqDCmnOkl5o7bTsL7TC+CcmOLzupeuhS4/d8OqB7zN+
	 oASHtrP2fAO0wfuZ1MHQ0ro8RkrS3mALxnhUe8GAOm/SE4SzDYOrKNxcm/3iWcIEM5
	 cWtCxwyFCv6pO7rpPwfDHpa2069mmnboxmrczbfpiOHd/NI5X1HbULCnYOW46FhSNT
	 o5K3IzIzG3UTJuN/fOrAqKxpOSoqAnPdbBTYc4QXMYgoORWsUtBNo5vKjq1lwDR4xt
	 14dm70438CW+TEVaUn/BkFpgPW72Xl1e8wqWFQ6I0Rh0kSF78gRMDPL5AnduVMRVeD
	 NGRNIL5XGpHhA==
Date: Fri, 28 Aug 2026 16:57:58 +0100
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
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
Message-ID: <20260828-target-operable-ebc87e0bf30a@spud>
References: <20260828151216.175020-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l71MiO8iJ3sqx4wd"
Content-Disposition: inline
In-Reply-To: <20260828151216.175020-1-marex@nabladev.com>

--l71MiO8iJ3sqx4wd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 05:11:14PM +0200, Marek Vasut wrote:
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
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml     | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.=
yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 95d2319afe235..d82afa39960b9 100644
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
> @@ -57,10 +68,14 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          const: st,stm32mp25-syscfg
> +          enum:
> +            - st,stm32mp23-syscfg
> +            - st,stm32mp25-syscfg

Sashiko comment here I believe is valid, the syntax here only works if
there's only the listed compatible present. It doesn't work with
fallbacks.

pw-bot: changes-requested

>      then:
>        required:
>          - "#clock-cells"
> +        - "#address-cells"
> +        - "#size-cells"

else, false? But I'm also not sure what the benefit is of requiring
addr/size cells when the child node is not?

Cheers,
Conor.

> =20
>  additionalProperties: false
> =20
> --=20
> 2.53.0
>=20

--l71MiO8iJ3sqx4wd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapGwBQAKCRB4tDGHoIJi
0ucHAQDgn40VE909HoU9lRj0S7+8LHXJkh16SZLWZNJDm6BXPQEAz13NUR1AIwgI
bmVXe8M9FQgOUteJySSW709JXg9IdQE=
=vNEp
-----END PGP SIGNATURE-----

--l71MiO8iJ3sqx4wd--
