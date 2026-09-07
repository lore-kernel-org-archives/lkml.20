Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D26037C0F8;
	Mon,  7 Sep 2026 17:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801576; cv=none; b=eRKufq/i0yMqs6tfoB66MHAM9MyIXhkH4IVcz9ZtsRsEAtd1RfkAtYL173olOMUzZo8HDYhol+/PEoRvcRJSrOqGeq/XNKXZ9rLlTZWm5Kpgsfij0fVsMxgb90HtJHNfU2f8003QK8nncw3tN9ksbrPkfa1uMun3kjmRTKGSKRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801576; c=relaxed/simple;
	bh=Y73lIijvcuSBUGcNzBJHvaGH20aPg4bzo8/CYyV5PE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CkE1KrsQoXQKx4bJOZf+82+5sP47ed/LuHC5JythsDocYSM4NJtRQ0hGLQVgFEWQ9SD8Sq+Ywh3VfleDuSuDdPdJAh6yHfY/zKF4qLUStTXTRThJK3r3F3euAgR6/2xNgsplkcLn8G4pXkgQOx1W23tk9i+cK9+VnySa8PT39Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PdcpXP+b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdcpXP+b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4341F00A3A;
	Mon,  7 Sep 2026 17:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788801574;
	bh=56yH2hwXm8sg7FdNo7mHIbyUGuEHV1cDz92wT471HWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PdcpXP+bxy+2PxoT/M5h3I6DxPT5kT97x7/CbbBW3DaBpzBxOj+JTTEH5cEfBZYiC
	 5Hw0BjueZwNfz3huIJDu7c+tBLHOiGTKIhm43BTTEalENWypNdKLIU93mm/gnnveYx
	 8UiGfbx0MgAUN47wKGsvCDy6MYyrDmtED/22GPgsLwJZDT/BAzBhkllMtVfWTuUrRC
	 Vadl2bkftyecI9q6f7pQAzbJQfuaMN5PFYmOZjXPxPI0f5iEu++VYFrCEGGrThVIO3
	 As+IqngWhal/u6r9/jm6IQ48rxD+lGIJ5RPUhXAc5ksYmVDnymKuiXwr3r1QHaxvAj
	 nut9oRNPUGupQ==
Date: Mon, 7 Sep 2026 18:19:29 +0100
From: Conor Dooley <conor@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Lee Jones <lee@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: mfd: x-powers: Add AC200
Message-ID: <20260907-huddling-sprain-33272820a361@spud>
References: <20260906-submit-ac200-mfd-v10-0-f522e8dc2bd4@gmail.com>
 <20260906-submit-ac200-mfd-v10-1-f522e8dc2bd4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r/LbfgsBnCNRr1Lf"
Content-Disposition: inline
In-Reply-To: <20260906-submit-ac200-mfd-v10-1-f522e8dc2bd4@gmail.com>

--r/LbfgsBnCNRr1Lf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 06, 2026 at 04:30:46PM -0600, James Hilliard wrote:
> The AC200 is an I2C-controlled mixed-signal companion IC containing
> audio, video, RTC and Fast Ethernet PHY functions.
>=20
> Describe the parent device and its shared input clock together with the
> audio codec and TV encoder child nodes. Keep their analog supplies on the
> function consumers and describe the TV encoder display graph and optional
> bandgap calibration cell.
>=20
> Add the shared interrupt-controller properties and interrupt numbers used
> by the TV encoder. The Ethernet PHY is represented by a PHY package on its
> MDIO bus, with a phandle back to this device for access to the package
> control registers, so it does not require an MFD child node.
>=20
> Keep the INTB connection and TV encoder interrupt optional, including when
> the TV encoder is enabled. Cable detection status is readable over I2C
> without an interrupt. If a TV encoder interrupt is described, require the
> parent interrupt domain and its upstream connection. Include examples
> with and without INTB connected.
>=20
> The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
> matching the rates encoded by its documented clock selector.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

This should have been dropped when you merged the patches.
Not sure why you sent v10 without waiting for a reply from me on the v9.

Thanks,
Conor.

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 231 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   8 +
>  include/dt-bindings/mfd/x-powers,ac200.h           |  13 ++
>  3 files changed, 252 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/=
Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> new file mode 100644
> index 000000000000..0f2e6922fc4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> @@ -0,0 +1,231 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: X-Powers AC200 mixed-signal IC
> +
> +maintainers:
> +  - James Hilliard <james.hilliard1@gmail.com>
> +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> +
> +description:
> +  The AC200 is a mixed-signal companion IC containing audio, video, RTC =
and
> +  Fast Ethernet PHY functions. Its control registers are accessed over I=
2C.
> +
> +properties:
> +  compatible:
> +    const: x-powers,ac200
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      AC200 input clock. When using the Ethernet PHY, its configured rat=
e must
> +      be 24 or 27 MHz, matching the rates encoded by the documented EPHY=
 clock
> +      selector.
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The shared open-drain INTB output for the TV encoder, Ethernet PHY=
 and
> +      RTC interrupts. Omit when INTB is not connected.
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
> +        description:
> +          Cable detection interrupt routed through the AC200 interrupt
> +          controller. Omit when INTB is not connected. Cable detection s=
tatus
> +          can also be read over I2C without an interrupt.
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
> +      - tv-vcc-supply
> +      - ports
> +
> +    dependencies:
> +      nvmem-cells: [ nvmem-cell-names ]
> +      nvmem-cell-names: [ nvmem-cells ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +allOf:
> +  - if:
> +      properties:
> +        tv-encoder:
> +          anyOf:
> +            - required: [ interrupts ]
> +            - required: [ interrupts-extended ]
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
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mfd/x-powers,ac200.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        mixed-signal@10 {
> +            compatible =3D "x-powers,ac200";
> +            reg =3D <0x10>;
> +            clocks =3D <&pwm 5>;
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
> +        };
> +    };
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        mixed-signal@10 {
> +            compatible =3D "x-powers,ac200";
> +            reg =3D <0x10>;
> +            clocks =3D <&pwm 5>;
> +            /* INTB is not connected. */
> +
> +            tv-encoder {
> +                compatible =3D "x-powers,ac200-tve";
> +                tv-vcc-supply =3D <&reg_aldo2>;
> +
> +                ports {
> +                    #address-cells =3D <1>;
> +                    #size-cells =3D <0>;
> +
> +                    port@0 {
> +                        reg =3D <0>;
> +
> +                        endpoint {
> +                            remote-endpoint =3D <&tcon_out_tve>;
> +                        };
> +                    };
> +
> +                    port@1 {
> +                        reg =3D <1>;
> +
> +                        endpoint {
> +                            remote-endpoint =3D <&composite_in>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c..1b1dd57cc419 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29504,6 +29504,14 @@ F:	drivers/net/wwan/
>  F:	include/linux/wwan.h
>  F:	include/uapi/linux/wwan.h
> =20
> +X-POWERS AC200 DRIVERS
> +M:	Jernej Skrabec <jernej.skrabec@gmail.com>
> +M:	James Hilliard <james.hilliard1@gmail.com>
> +L:	linux-sunxi@lists.linux.dev
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> +F:	include/dt-bindings/mfd/x-powers,ac200.h
> +
>  X-POWERS AXP288 PMIC DRIVERS
>  M:	Hans de Goede <hansg@kernel.org>
>  S:	Maintained
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

--r/LbfgsBnCNRr1Lf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap7yIQAKCRB4tDGHoIJi
0tYsAP0aVNqD8wj/uzcQ1MNe6bgqGYESX0DYYvuinrWSF/GyzgEA6whkLmHjGLxn
TDr6nZ6Ln3hfyohiItzkgLGksh1I5Qw=
=7ay5
-----END PGP SIGNATURE-----

--r/LbfgsBnCNRr1Lf--
