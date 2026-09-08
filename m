Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763F724E016;
	Tue,  8 Sep 2026 18:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890752; cv=none; b=Gm141sMFtnQRGJTOjn3dsplM17zErHM8B/W7Ah06kLWh0WUxDCO0QQr4KzBJoDblx47HvfhhRV3BMS/awx/zc4DI5Dkc9FbHy8VVh3bUVhQgXJhcksPHQM0RGM8u5NETyNc/MOmTM5lElQN6bxcqK94TRgfEIXBxwzcvBmHbcos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890752; c=relaxed/simple;
	bh=JQzHor3hqLuiF8iayFyd1AQ09epOsGl5mSglWfkmXVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=seOM7KmHf9FSExwojoSU4QnvbPAdum6lkYdq4hbM12grfd/jFhEcQDJYWHf7c5d35ZFsR4MxxrBUpArRq8xGqfJT4zVkfReiTjs1Vie4hUPS+XDQIY9FH8QuXg1q13Lu+RdsitRV2Jjp2tisAkKV4TnfXojjRJ90JhQPVhKwem0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJ9JDdQp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJ9JDdQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8991F00A3A;
	Tue,  8 Sep 2026 18:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890749;
	bh=7f41jQAfHxsDeDObc+RQIVm6qZ/UjFmvvrb1I+FWYFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eJ9JDdQpAgCBXgoYH5R3Q6M9v1mQtW/BZYpiuBfZsKyr3LbLzmmLDQ1xP4t6/+FYQ
	 h/uQBYc0CUxx/90hhmp8n8aFRiXIzrEm/HeRbSB9dH2+RK+c0VoVzUYQYLeTne7VkM
	 9PtPh2eqILkzI2ZypWPRMdCI68HYkc8LhTpTdJSE/XJPr5JgJBPfnx1lks3IU/tY6/
	 ATS1HWH0sLUlPEoZOMmMRs0gEZi2HrJXA9TnGmaGUjFg8hjwDJZtrIbSgkllUK6TeP
	 Ak0g/dyt+VRUZWENyyN5QGy8nfqJhPW6cEXFhNYa3+pKQKM0RDBdftdAmVPwLdGqyI
	 Khh/rU0RGZWEQ==
Date: Tue, 8 Sep 2026 19:05:44 +0100
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/2] dt-bindings: mfd: x-powers: Add AC200
Message-ID: <20260908-semisoft-appendage-ecbeb9b2d88e@spud>
References: <20260907-submit-ac200-mfd-v11-0-58dd9dc7f69a@gmail.com>
 <20260907-submit-ac200-mfd-v11-1-58dd9dc7f69a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O3gs7ITcrQu7aIDc"
Content-Disposition: inline
In-Reply-To: <20260907-submit-ac200-mfd-v11-1-58dd9dc7f69a@gmail.com>

--O3gs7ITcrQu7aIDc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 03:03:14PM -0600, James Hilliard wrote:
> The AC200 is an I2C-controlled mixed-signal companion IC containing
> audio, video, RTC and Fast Ethernet PHY functions.
>=20
> Describe the shared input clock, audio DAI, TV encoder display graph and
> optional bandgap calibration in one parent node. The codec and TV encoder
> do not need separate firmware nodes.
>=20
> AC_LDOIN and TV_VCC are distinct 3.3 V supply inputs. Describe them
> separately without requiring different external regulators. Require the
> audio supply when the DAI is described and the video supply when the
> display graph is present, while allowing PHY-only configurations.
>=20
> Describe the optional shared INTB connection without an internal
> interrupt domain. Cable detection status remains readable over I2C when
> INTB is not connected. Include wired and unwired examples.
>=20
> The Ethernet PHY is represented by a PHY package on its MDIO bus, with a
> phandle back to this device for access to the package control registers.
> It therefore does not require an MFD child node. The input clock must run
> at 24 or 27 MHz when the Ethernet PHY is used, matching the rates encoded
> by its documented clock selector.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

btw, this is kinda odd. Jernej has a signoff, but no other attribution.
Are they a coauthor missing a Co-developed-by

> ---

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Thanks,
Conor.

>  .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 168 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 175 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/=
Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> new file mode 100644
> index 000000000000..75dafa7c1071
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> @@ -0,0 +1,168 @@
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
> +  The audio codec and TV encoder are described by properties of this nod=
e.
> +  The Ethernet PHY is described separately on its MDIO bus.
> +
> +allOf:
> +  - $ref: /schemas/sound/dai-common.yaml#
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
> +      The shared, level-triggered, open-drain INTB output for the TV enc=
oder,
> +      Ethernet PHY and RTC interrupts. Omit when INTB is not connected. =
TV
> +      encoder cable detection status can also be read over I2C without an
> +      interrupt.
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  ac-ldoin-supply:
> +    description:
> +      The 3.3 V supply connected to the AC_LDOIN pin for the audio codec=
 LDO
> +      input. This may be the same regulator as tv-vcc-supply.
> +
> +  tv-vcc-supply:
> +    description:
> +      The 3.3 V supply connected to the TV_VCC pin for the composite-vid=
eo
> +      DAC. This may be the same regulator as ac-ldoin-supply.
> +
> +  nvmem-cells:
> +    maxItems: 1
> +    description: TV encoder bandgap calibration.
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: bandgap
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input to the TV encoder, carrying CCIR656.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output to the composite-video connector.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +dependencies:
> +  '#sound-dai-cells': [ ac-ldoin-supply ]
> +  ports: [ tv-vcc-supply ]
> +  nvmem-cells: [ nvmem-cell-names ]
> +  nvmem-cell-names: [ nvmem-cells ]
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
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
> +            #sound-dai-cells =3D <0>;
> +            ac-ldoin-supply =3D <&reg_aldo2>;
> +            tv-vcc-supply =3D <&reg_aldo2>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    reg =3D <0>;
> +
> +                    tve_in: endpoint {
> +                        remote-endpoint =3D <&tcon_out_tve>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg =3D <1>;
> +
> +                    tve_out: endpoint {
> +                        remote-endpoint =3D <&composite_in>;
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
> +            tv-vcc-supply =3D <&reg_aldo2>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    reg =3D <0>;
> +
> +                    endpoint {
> +                        remote-endpoint =3D <&tcon_out_tve>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg =3D <1>;
> +
> +                    endpoint {
> +                        remote-endpoint =3D <&composite_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c..419340093c9b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29504,6 +29504,13 @@ F:	drivers/net/wwan/
>  F:	include/linux/wwan.h
>  F:	include/uapi/linux/wwan.h
> =20
> +X-POWERS AC200 DRIVERS
> +M:	Jernej Skrabec <jernej.skrabec@gmail.com>
> +M:	James Hilliard <james.hilliard1@gmail.com>
> +L:	linux-sunxi@lists.linux.dev
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> +
>  X-POWERS AXP288 PMIC DRIVERS
>  M:	Hans de Goede <hansg@kernel.org>
>  S:	Maintained
>=20
> --=20
> 2.53.0
>=20

--O3gs7ITcrQu7aIDc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBOeAAKCRB4tDGHoIJi
0m1EAQDQUFIrVqa3Qt3UvFTvHo/KvNhQLZLnh/2IKBh3Sm26MAD8Cq4xr2CRFZvi
cci5HgCN7FejM5iyIqSPGxr/KZpDHgA=
=vh/H
-----END PGP SIGNATURE-----

--O3gs7ITcrQu7aIDc--
