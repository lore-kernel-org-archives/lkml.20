Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97233A0E8D;
	Fri,  4 Sep 2026 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535961; cv=none; b=mUedIV8Ni3BKIMD+nAsp7o4ta7GLkDbFRisFWdt3Up6OoLvtQ04oIn1mQDmX/1laadvyYhTqwEjjT6k81aiqWgvXHLyZqU2YbBUvLVOdlwv1sIPjhElhdQ1QYkpk1JK9Roho5QEj+3VCvXzOHPHstVa9/S1g01MsflxZzSUtKuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535961; c=relaxed/simple;
	bh=6BuLmPMVLgT6e1T/96UyVpF5wgE7oRFL9Sv8pBeJvzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KADfp9LR4F1aVmPzRGz2glsr/LZaMqxmrrRnMKu5MzE5/fVn4kIKKnbzbwLG8OTxCb9hoOyniEmkrRK9iSrLsdKbSHmiD+uGJlHIfOCUS3TiBWyOWjWtgb0Pu/9CxFEqgDq139BOXk7mf0yjvBFi5VrLZLcVaLmgyzPDm5gabGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kINxNatp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kINxNatp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE1F1F00A3D;
	Fri,  4 Sep 2026 15:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788535959;
	bh=rNSpuSGCHKNrIM1d6NDkX9yuk7wiUm0L/vrIm6qntqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kINxNatpTECOnR+yU1/x76FDR+rF5EE+bdCUOlFeLyhWnlNoVhetLOzFoKIn9X95/
	 1Wm34ecnilTaOIT4qUuUhsB5/G2johofGQ+lJKl16ke6CRCriPZg3N7SZQCGaDuU0Q
	 gUr6qeaVOOYWfrbTUS75W5kk3DZ9Bgqf8npljX76F00PU2brUoojL6VHmpul4tFPPw
	 +iQQiOQcpLc0Uyz59X54xIrnJ+Ea3Nr0KMjLxiM7TwfklPqFgT93U3kuKOpVXZFhfA
	 V8JyTvsDu1vx8B6pGCLymtxhTp5+119z1L/XzoSvaz2Z2lLtgBLquVDyjetraix8OI
	 S17twxG9SogCQ==
Date: Fri, 4 Sep 2026 16:32:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-usb@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
Message-ID: <20260904-colonial-wimp-b37c27657664@spud>
References: <20260903213031.314473-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jhkT80vSSlUwMh4i"
Content-Disposition: inline
In-Reply-To: <20260903213031.314473-1-marek.vasut+renesas@mailbox.org>

--jhkT80vSSlUwMh4i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 11:30:12PM +0200, Marek Vasut wrote:
> The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
> controller with glue logic wrapper around them. Document the glue
> logic and DWC3 controller.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> ---
> V2: Rework to use flat bindings for generic plat driver
> V3: - Support one or two PHYs to correctly describe the hardware
>     - Make maximum-speed optional
> V4: - Use ref: snps,dwc3-common.yaml and drop generic dr_mode/maximum-spe=
ed/phys/phy-names
>     - Switch to unevaluatedProperties: false
> V5: - Limit maximum PHY count to 2
> V6: No change
> V7: No change
> ---
>  .../bindings/usb/renesas,rcar-gen5-dwc3.yaml  | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,rcar-ge=
n5-dwc3.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3=
=2Eyaml b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
> new file mode 100644
> index 0000000000000..c8a770d7e0241
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,rcar-gen5-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Gen5 DWC3 xHCI USB controller
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +
> +allOf:
> +  - $ref: snps,dwc3-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r8a78000-dwc3
> +      - const: renesas,rcar-gen5-dwc3
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: dwc3
> +      - const: glue
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phys:
> +    minItems: 1
> +    maxItems: 2
> +
> +  phy-names:
> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - interrupts
> +  - phys
> +  - phy-names
> +  - power-domains
> +  - resets
> +
> +unevaluatedProperties: false

I said this elsewhere today, but this binding has lots of "distasteful"
properties for things that should be determined from the compatible, so I
would appreciate it if you could use additionalProperties: false here
cite the ones you need to use explicitly. Sounds like dr_mode: true and
maximum-speed: true are all you'd need?

Cheers,
Conor.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@c8800000 {
> +        compatible =3D "renesas,r8a78000-dwc3", "renesas,rcar-gen5-dwc3";
> +        reg =3D <0xc8800000 0x100000>, <0xc9c54000 0x2000>;
> +        reg-names =3D "dwc3", "glue";
> +        clocks =3D <&scmi_clk 336>;
> +        interrupts =3D <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>;
> +        phys =3D <&usb30_phy>, <&mp_phy 2>;
> +        phy-names =3D "usb2-phy", "usb3-phy";
> +        power-domains =3D <&scmi_devpd 16>;
> +        resets =3D <&scmi_reset 336>;
> +    };
> --=20
> 2.53.0
>=20

--jhkT80vSSlUwMh4i
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaprkkwAKCRB4tDGHoIJi
0toQAQDSbUS1gdNvnI9Uh80kFpnGGub1TxxO6lk+75U09tz3IwEAsJ06sROOwyvJ
MBm/IxGrwb1M6XmIkCQ5nH/+OkQuQQc=
=/BsN
-----END PGP SIGNATURE-----

--jhkT80vSSlUwMh4i--
