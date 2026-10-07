Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6474915BC;
	Wed,  7 Oct 2026 14:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383600; cv=none; b=MrMS5cBNOXreo877hByxt0utHOEmZthBcz8H6bLqLWpfN/wnL7Fk/BUR/UyvgqB6PqU4FBEw23UzXVbxU5VSNRY3JOKtQi5FW8XwdSL9fmUyWwBFOW3iQWYZYL7JMiUty+/I+SQDUq0b3JjJ1XMzw8CnSAC9jzq/2+hYWZ5+QX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383600; c=relaxed/simple;
	bh=aLph5sUndoTN3nczdDoZA2kTMuvyEill4ZzdOLZrZ2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQ/Wn6Ybcg/DRI17+juXIXaT0n4IUoPE/6YgjL2qjtr2V6nxTMbNCSAqHSoCjIKvVpcvlL3WGSh6xxtX0YgnFj9liMopZzKFqPMexjacCtJPg/V9/AA5LeVSZOQLu7Y+Ucknv1WPeE6od87+JtplsesNIbocQ6DHKtCrnNUEczs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wp5yiz7F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wp5yiz7F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022DE1F0089B;
	Wed,  7 Oct 2026 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791383596;
	bh=MnVpOMa/A/9KOxtJhbCxt7dzW/Oxp49fSXL9sK+W888=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wp5yiz7FSnXP8YbANW2fUpYkIKtiRhCjxpqevHsX0ptzxDUNeLOv/aykt3RMVAuG3
	 sPoohRkX2WfRPLR4Omwn16wK9xzd+uYZj7al/rldsar6v9wmWINKiKx3v3amwYSGXP
	 +vtKj94f/lABqBmdsij0UaMPfcTVSJJHFbNoFnPGC4/j0PY4/WWgrl+yjxiZXUPb/C
	 o/4L0laXeNaQzLHS4+wFYM8FjE8UrtIabUkiNo8/p5frr7yR+cukrXD2d+mR40KdKE
	 dKMhWg+aIiNIdAyCXOncGsR38IuJkILritikd7fTdvKHte+oFKIzsB3SLG2S44jp5M
	 U/7sRmBMITIaA==
Date: Wed, 7 Oct 2026 15:33:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: rockchip: naneng-combphy: add
 rockchip,sgmii-mac-sel property
Message-ID: <20261007-9753b5de7344a15472337c6d@squawk>
References: <20261006162807.2843858-1-coiaprant@gmail.com>
 <20261006162807.2843858-2-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bYpco44aYbz7Qmdh"
Content-Disposition: inline
In-Reply-To: <20261006162807.2843858-2-coiaprant@gmail.com>

--bYpco44aYbz7Qmdh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2026 at 12:28:05AM +0800, Coia Prant wrote:
> On RK3568, the SGMII interface can be routed to either GMAC0 or
> GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.
>=20
> Add the optional "rockchip,sgmii-mac-sel" property to allow the
> device tree to select which GMAC controller is used for SGMII.
>=20
> The property takes a value of 0 (GMAC0) or 1 (GMAC1). The hardware
> reset value is 1 (GMAC1), but this can be overridden by setting the
> property to 0 for boards where SGMII is connected to GMAC0.
>=20
> If this property is absent, the driver leaves the routing unchanged.
>=20
> This is necessary for boards such as the Ariaboard Photonicat, where
> the SGMII interface is connected to GMAC0 and needs to be explicitly
> configured.

I've written about 3 responses to this and deleted them all.

This feels like something that should be set by some existing mechanism,
like the phys property, or by the mac driver when it realises it is in
sgmii mode - but I think neither actually fits here? The latter doesn't
work since you need to differentiate between instances there anyway,
which requires some info, and the former doesn't work with phy-cells
being 1, since that 1 cell is needed for the phy mode itself.
The other thing is pinctrl, while there's no "pin" here, it's
determining routing within the soc which is the realm of pinctrl,
probably pinctrl-single. But I think that's just really way
over-complicating everything... Plus, Rob didn't yell about this aspect
of things when he yelled about the other things you were doing, so
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Thanks,
Conor.

>=20
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-co=
mbphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-comb=
phy.yaml
> index 379b08bd9e97a..442a1df193ad2 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> @@ -80,6 +80,15 @@ properties:
>      description:
>        Some additional pipe settings are accessed through GRF regs.
> =20
> +  rockchip,sgmii-mac-sel:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    description:
> +      Select gmac0 or gmac1 to be used as SGMII controller.
> +      Set this to 0 to route SGMII to GMAC0.
> +      Set this to 1 to route SGMII to GMAC1.
> +      If this property is absent, the driver leaves the routing unchange=
d.
> +
>    "#phy-cells":
>      const: 1
> =20
> @@ -105,6 +114,10 @@ allOf:
>            maxItems: 1
>          reset-names:
>            maxItems: 1
> +        rockchip,sgmii-mac-sel: true
> +    else:
> +      properties:
> +        rockchip,sgmii-mac-sel: false
>    - if:
>        properties:
>          compatible:
> --=20
> 2.47.3
>=20

--bYpco44aYbz7Qmdh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasZYGgAKCRB4tDGHoIJi
0i7pAQCEHLUbeUseRijomPdK42ASMNkHPbzWqVbVEJD+RePnsAEAsqjwg12DjFm0
FP34Zhrf7NpGU/snBsueFHKAd/JzuwU=
=7ky/
-----END PGP SIGNATURE-----

--bYpco44aYbz7Qmdh--
