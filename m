Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A14F3BCD15;
	Fri,  4 Sep 2026 15:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537016; cv=none; b=ql2pSpLxdUZ0ikAsiSIC2xDYjyFmGR6A5FG5sVj8Kuicht0R+UPzAMVpXDfrn2LGnG3EswnGJG3IpQa8vaKml6WKko+rkyYRFNMH9fxTFJBI89S1rwyea/l3chf0DHntxTDozqIXKvAXhxw1hX+3nc4tFTwoECEEdTuvFZZ8CNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537016; c=relaxed/simple;
	bh=uM8Fbvm7eaTlJ1GBVSclLNyvIjjfJUD0HwlQf4fb7m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iV+VV00pmoSGjIrsmXbCc2/N+hLYiUUu1DrEqrniR2a0QvedbvywDjggYFYJKvyggsFcc1BsLThrZnjFhhq+lzFKyIx6FFxugw66ZK9fb4wHPr0RJY8L5rNgG/6ASo9B2zTIsNyRCV0NJR/G/OiUFcDp+06gnwuquHHMJzVtOVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYg7ZUdv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYg7ZUdv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023261F00A3E;
	Fri,  4 Sep 2026 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537013;
	bh=z3vV++zSCl6oF/I+szgYxIVGE+NJx3aW5bilrxXPFa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BYg7ZUdv31yMhBMULy2wXRFjRbzR7vhBpcMS/k5Am0DSPh/XkZfnAsaQMEysmFN0V
	 EbhSTVz1xu1r9/5NgjonuGNFwi7REgkuWQH+ny9ZE7K67IytR4CPhAPpJP/Zz658yz
	 cMV67WSz/1aTs+NY8fzo2OreifIsKdrAjIC382HR4tXTpRl3B1F0WtNaHjJF4dYLS/
	 RRoFqhA25Lz4qkwTS+S1sBRZkS43xnUTlrey4kLbC0RoToBe7VkUREbbvZhC809df1
	 ehvYFTXiNFm1tjnZoAQ1dlVGPuuZk8NDDjJN9mPuedkLtuT9RvWjkkn0BhnNf8qqcb
	 2K5yxhehsZOhg==
Date: Fri, 4 Sep 2026 16:50:08 +0100
From: Conor Dooley <conor@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/4] dt-bindings: mfd: x-powers: Describe AC200
 functions
Message-ID: <20260904-overpass-clumsy-8ccdd5d4ca0e@spud>
References: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
 <20260903-submit-ac200-mfd-v9-3-6b7ed278989c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dbwq9g4id1YTl88B"
Content-Disposition: inline
In-Reply-To: <20260903-submit-ac200-mfd-v9-3-6b7ed278989c@gmail.com>

--Dbwq9g4id1YTl88B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 02:09:42PM -0600, James Hilliard wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Describe the AC200 audio codec and TV encoder as child nodes of the
> shared I2C register provider. Keep their analog supplies on the function
> consumers and describe the TV encoder display graph and optional bandgap
> calibration cell.
>=20
> Add the shared interrupt-controller properties and interrupt numbers need=
ed
> by the TV encoder. The Ethernet PHY remains represented on its primary MD=
IO
> bus and is therefore not an MFD child.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 136 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   1 +
>  include/dt-bindings/mfd/x-powers,ac200.h           |  13 ++
>  3 files changed, 150 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/=
Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> index ca7a910b2c73..935dc07138cb 100644
> --- a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> +++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> @@ -28,15 +28,114 @@ properties:
>        be 24 or 27 MHz, matching the rates encoded by the documented EPHY=
 clock
>        selector.
> =20
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The shared open-drain INTB output for the TV encoder, Ethernet PHY=
 and
> +      RTC interrupts.
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +    description:
> +      The interrupt number, as defined in
> +      include/dt-bindings/mfd/x-powers,ac200.h.
> +
> +  codec:
> +    type: object
> +    $ref: /schemas/sound/dai-common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      compatible:
> +        const: x-powers,ac200-codec
> +
> +      '#sound-dai-cells':
> +        const: 0
> +
> +      ac-ldoin-supply:
> +        description: The 3.3 V supply for the audio codec LDO input.
> +
> +    required:
> +      - compatible
> +      - '#sound-dai-cells'
> +      - ac-ldoin-supply
> +
> +  tv-encoder:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        const: x-powers,ac200-tve
> +
> +      interrupts:
> +        maxItems: 1
> +        description: Cable detection interrupt.

Given the example, this looks like a hack.
Is this mfd actually an interrupt controller, or is that just part of
this hack too?

Quite frankly, I am not really sure why either the tv-encoder or codec
have dedicated child nodes, they don't appear to have conflicting
properties.

Additionally, why is this not part of patch 1? Add the binding in a
complete state from the get-go. On that basis, at least,
pw-bot: changes-requested

Cheers,
Conor.

> +
> +      tv-vcc-supply:
> +        description: The 3.3 V supply for the composite-video DAC.
> +
> +      nvmem-cells:
> +        maxItems: 1
> +
> +      nvmem-cell-names:
> +        items:
> +          - const: bandgap
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: Input from the display pipeline, carrying CCIR6=
56.
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: Output to the composite-video connector.
> +
> +        required:
> +          - port@0
> +          - port@1
> +
> +    required:
> +      - compatible
> +      - interrupts
> +      - tv-vcc-supply
> +      - ports
> +
> +    dependencies:
> +      nvmem-cells: [ nvmem-cell-names ]
> +      nvmem-cell-names: [ nvmem-cells ]
> +
>  required:
>    - compatible
>    - reg
>    - clocks
> =20
> +allOf:
> +  - if:
> +      required:
> +        - tv-encoder
> +    then:
> +      required:
> +        - interrupts
> +        - interrupt-controller
> +        - '#interrupt-cells'
> +
> +dependencies:
> +  interrupt-controller: [ '#interrupt-cells', interrupts ]
> +  '#interrupt-cells': [ interrupt-controller ]
> +
>  additionalProperties: false
> =20
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mfd/x-powers,ac200.h>
> +
>      i2c {
>          #address-cells =3D <1>;
>          #size-cells =3D <0>;
> @@ -45,6 +144,43 @@ examples:
>              compatible =3D "x-powers,ac200";
>              reg =3D <0x10>;
>              clocks =3D <&pwm 5>;
> +            interrupt-parent =3D <&pio>;
> +            interrupts =3D <1 20 IRQ_TYPE_LEVEL_LOW>;
> +            interrupt-controller;
> +            #interrupt-cells =3D <1>;
> +
> +            codec {
> +                compatible =3D "x-powers,ac200-codec";
> +                #sound-dai-cells =3D <0>;
> +                ac-ldoin-supply =3D <&reg_aldo2>;
> +            };
> +
> +            tv-encoder {
> +                compatible =3D "x-powers,ac200-tve";
> +                interrupts =3D <AC200_IRQ_TVE>;
> +                tv-vcc-supply =3D <&reg_aldo2>;
> +
> +                ports {
> +                    #address-cells =3D <1>;
> +                    #size-cells =3D <0>;
> +
> +                    port@0 {
> +                        reg =3D <0>;
> +
> +                        tve_in: endpoint {
> +                            remote-endpoint =3D <&tcon_out_tve>;
> +                        };
> +                    };
> +
> +                    port@1 {
> +                        reg =3D <1>;
> +
> +                        tve_out: endpoint {
> +                            remote-endpoint =3D <&composite_in>;
> +                        };
> +                    };
> +                };
> +            };
>          };
>      };
>  ...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1d03b0060bda..8a48f6a1e593 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29511,6 +29511,7 @@ L:	linux-sunxi@lists.linux.dev
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
>  F:	drivers/mfd/ac200.c
> +F:	include/dt-bindings/mfd/x-powers,ac200.h
> =20
>  X-POWERS AXP288 PMIC DRIVERS
>  M:	Hans de Goede <hansg@kernel.org>
> diff --git a/include/dt-bindings/mfd/x-powers,ac200.h b/include/dt-bindin=
gs/mfd/x-powers,ac200.h
> new file mode 100644
> index 000000000000..cc59e2ab4912
> --- /dev/null
> +++ b/include/dt-bindings/mfd/x-powers,ac200.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Interrupt numbers of the X-Powers AC200 interrupt controller.
> + */
> +
> +#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
> +#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
> +
> +#define AC200_IRQ_TVE			0
> +#define AC200_IRQ_EPHY			1
> +#define AC200_IRQ_RTC			2
> +
> +#endif /* _DT_BINDINGS_MFD_X_POWERS_AC200_H */
>=20
> --=20
> 2.53.0
>=20

--Dbwq9g4id1YTl88B
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaprosAAKCRB4tDGHoIJi
0pqEAP47DeRk94mVMRrDivao30MsOg3fMxRu5g6HbFdd2qqq9QEA/Si8ajmEby/r
+2CZjpH11ZJFk0FCCziNP47GAaORNAs=
=Yg/p
-----END PGP SIGNATURE-----

--Dbwq9g4id1YTl88B--
