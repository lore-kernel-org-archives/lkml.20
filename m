Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90413434408;
	Mon, 31 Aug 2026 16:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192464; cv=none; b=ZKhN/7bV8ZTWzDvGdpstoodZG3e8j9ocppDNXA2/7tF222btdmWpD8E9SdQaMaYEMKozNMGW3t69idi0hExFGueRUEjJOpX4cKZtDAWqqqMdLfRnn62fjQf5xt+vP2+uiAwVmibSsjCQ4ijKWlB7jHn9LSj19RjzjFZPEnDoC8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192464; c=relaxed/simple;
	bh=CR2VbZpTjaKhZGy3jkD3y2LYdOey0UOOQhctDEvm/hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FlravRTb327ijuL/e1TA1PCLLuayxjgg5riyqtaQvWcrpYYY8lq6GJNfjasacwo6YfxLvAupveiQRMgv5TSGNQOi8V7lDECgqrnhmHkGuv2S40sWyna+1Zbznzf9eXau91LO69QCPkxfgnd/UG4mB6L4aF1+NutsMW0A9ROW9hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2vF/MSL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2vF/MSL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26541F000E9;
	Mon, 31 Aug 2026 16:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788192462;
	bh=z9Of6rOS2S30ofLpkaTBjumW08XusXzmos/rCF2QCuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H2vF/MSLKhKOgTCZApK0xU3As7FLpWMirsvvwCrnckbljiG5SWn1TSgywDeS3pcK/
	 Wq42NxtkRiT8VwY32GLbwbNSBx3GqpAQhxO5bEG9PQKdXfcytR0SbUiWgEXcD9+ejz
	 CdQP0Vhiw7flrZnnU8RCa2igb1T57g3o91sflK20Y/qsVTSorzezekrzrEQtrJFGz8
	 ZicESGO9oNCtuMw+NqFpZfjRoIwhNB6pmoTTkwNGG9eEfR1jkO3+blbsLSvMRsYjn0
	 6a7eNfjdDd3etq3uBxz59jhmji8frYBqry4j56Wk+9w1/6P6UyuLqNRbHhmfF1p9sf
	 XfD9Yx+Mlidtg==
Date: Mon, 31 Aug 2026 17:07:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: peter.chen@kernel.org, pawell@cadence.com, vkoul@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, rogerq@kernel.org,
	neil.armstrong@linaro.org, p.zabel@pengutronix.de,
	fugang.duan@cixtech.com, cix-kernel-upstream@cixtech.com,
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] dt-bindings: Add CIX Sky1 USB bindings
Message-ID: <20260831-deluxe-capacity-85bf1fb6691a@spud>
References: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
 <20260831082309.3854507-2-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2qEwXy5L5XBLIveE"
Content-Disposition: inline
In-Reply-To: <20260831082309.3854507-2-hongliang.yang@cixtech.com>

--2qEwXy5L5XBLIveE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 04:23:05PM +0800, Hongliang Yang wrote:
> Add device tree bindings for CIX Sky1 USB3 PHY and Cadence USBSSP
> controller glue layer.
>=20
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
> ---
>  .../bindings/phy/cix,sky1-usb3-phy.yaml       | 109 +++++++++++++
>  .../bindings/usb/cix,sky1-usbssp.yaml         | 153 ++++++++++++++++++

Two patches please.

>  MAINTAINERS                                   |   3 +
>  3 files changed, 265 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usb3-p=
hy.yaml
>  create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbssp=
=2Eyaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml=
 b/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
> new file mode 100644
> index 000000000000..76d020df72dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/cix,sky1-usb3-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 USB3 PHY
> +
> +maintainers:
> +  - Hongliang Yang <hongliang.yang@cixtech.com>
> +
> +description:
> +  The CIX Sky1 USB3 PHY is a multi-port SuperSpeedPlus PHY that
> +  supports up to two USB3 lanes. Each port is represented as a
> +  child node of the PHY controller.
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-usb3-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: APB register interface clock
> +      - description: PHY reference clock
> +
> +  clock-names:
> +    items:
> +      - const: apb_clk
> +      - const: ref_clk

drop "_clk", they're both clocks..
pw-bot: changes-requested

> +
> +  resets:
> +    items:
> +      - description: PHY reset
> +      - description: PHY APB preset
> +
> +  reset-names:
> +    items:
> +      - const: reset
> +      - const: preset

drop "reset" from here, they're both resets. Call them "core" and "apb"
or something instead.

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^usb-port@[0-9a-f]+$":

> +    type: object
> +    description:
> +      A single USB3 PHY port/lane.
> +
> +    properties:
> +      reg:
> +        maxItems: 1

> +
> +      "#phy-cells":
> +        const: 0
> +
> +    required:
> +      - reg
> +      - "#phy-cells"
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/cix,sky1.h>
> +    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
> +
> +    usb-phy@9210000 {
> +        compatible =3D "cix,sky1-usb3-phy";
> +        reg =3D <0x09210000 0x40000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        resets =3D <&s5_syscon SKY1_USBPHY_SS_RST_N>,
> +                 <&s5_syscon SKY1_USBPHY_SS_PST_N>;
> +        reset-names =3D "reset", "preset";
> +
> +        clocks =3D <&scmi_clk CLK_TREE_USB3A_PHY3_GATE>,
> +                 <&scmi_clk CLK_TREE_USB3A_PHY_x2_REF>;
> +        clock-names =3D "apb_clk", "ref_clk";
> +
> +        usb-port@0 {
> +            reg =3D <0>;
> +            #phy-cells =3D <0>;
> +        };
> +
> +        usb-port@1 {
> +            reg =3D <1>;
> +            #phy-cells =3D <0>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml b=
/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> new file mode 100644
> index 000000000000..47202ff5b9e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> @@ -0,0 +1,153 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/cix,sky1-usbssp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 Cadence USBSSP Controller
> +
> +maintainers:
> +  - Hongliang Yang <hongliang.yang@cixtech.com>
> +
> +description:
> +  The CIX Sky1 USBSSP controller is based on the Cadence USBSSP DRD
> +  controller. The integration adds glue registers and mode strap controls
> +  in the Sky1 S5 system controller. The CIX glue node wraps a Cadence
> +  USBSSP core as a child node.
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-usbssp
> +
> +  reg:
> +    items:
> +      - description: AXI property configuration register
> +      - description: Controller status register
> +
> +  reg-names:
> +    items:
> +      - const: axi_property
> +      - const: controller_status
> +
> +  clocks:
> +    items:
> +      - description: Start-of-frame clock
> +      - description: AXI bus clock
> +      - description: Low-power mode clock
> +      - description: APB register interface clock
> +
> +  clock-names:
> +    items:
> +      - const: sof_clk
> +      - const: usb_aclk
> +      - const: lpm_clk
> +      - const: usb_pclk

Same stuff here on naming

> +
> +  resets:
> +    items:
> +      - description: APB register reset
> +      - description: Controller reset
> +
> +  reset-names:
> +    items:
> +      - const: usb_preset
> +      - const: usb_reset

and here.

> +
> +  cix,usb_syscon:

No underscores in property names.

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the Sky1 S5 system controller used to program USB mode
> +      strap controls.
> +
> +  axi_bmax_value:

Missing vendor prefix.
No underscores in property names.

Why is this not a fixed value per SoC?

Cheers,
Conor.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x7
> +    description:
> +      AXI bus maximum burst length configuration value.
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^usb-controller@[0-9a-f]+$":
> +    $ref: cdns,usb3.yaml#
> +    description:
> +      The Cadence USBSSP core controller node. See cdns,usb3.yaml
> +      for properties such as dr_mode, maximum-speed, phys, and interrupt=
s.
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - cix,usb_syscon
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/cix,sky1.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        usb@91c0300 {
> +            compatible =3D "cix,sky1-usbssp";
> +            #address-cells =3D <2>;
> +            #size-cells =3D <2>;
> +            ranges;
> +
> +            reg =3D <0x00 0x091c0314 0x00 0x4>,
> +                  <0x00 0x091c0400 0x00 0x4>;
> +            reg-names =3D "axi_property", "controller_status";
> +
> +            resets =3D <&src SKY1_USBC_SS2_PRST_N>,
> +                     <&src SKY1_USBC_SS2_RST_N>;
> +            reset-names =3D "usb_preset", "usb_reset";
> +
> +            clocks =3D <&scmi_clk CLK_TREE_USB3A_H0_CLK_SOF>,
> +                     <&scmi_clk CLK_TREE_USB3A_0_AXI_GATE>,
> +                     <&scmi_clk CLK_TREE_USB3A_H0_CLK_LPM>,
> +                     <&scmi_clk CLK_TREE_USB3A_0_APB_GATE>;
> +            clock-names =3D "sof_clk", "usb_aclk", "lpm_clk", "usb_pclk";
> +
> +            cix,usb_syscon =3D <&src>;
> +            axi_bmax_value =3D <0x7>;
> +
> +            usb-controller@91d0000 {
> +                compatible =3D "cdns,usb3";
> +                reg =3D <0x00 0x91d0000 0x00 0x4000>,
> +                      <0x00 0x91d8000 0x00 0x8000>,
> +                      <0x00 0x91d4000 0x00 0x4000>;
> +                reg-names =3D "otg", "xhci", "dev";
> +
> +                interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
> +                             <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
> +                             <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +                             <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
> +                interrupt-names =3D "host", "peripheral", "otg", "wakeup=
";
> +
> +                /* Cadence USBSSP core properties - see cdns,usb3.yaml */
> +                maximum-speed =3D "super-speed-plus";
> +                dr_mode =3D "otg";
> +
> +                phys =3D <&usb3_phy4_0>, <&usb2_phy6>;
> +                phy-names =3D "cdns3,usb3-phy", "cdns3,usb2-phy";
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15011f5752a9..4c5f6cbe9124 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2775,8 +2775,11 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git
>  F:	Documentation/devicetree/bindings/arm/cix.yaml
>  F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
> +F:	Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
> +F:	Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
>  F:	arch/arm64/boot/dts/cix/
>  F:	drivers/mailbox/cix-mailbox.c
> +F:	drivers/phy/cix/
>  K:	\bcix\b
> =20
>  ARM/CLKDEV SUPPORT
> --=20
> 2.54.0
>=20

--2qEwXy5L5XBLIveE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapWmyAAKCRB4tDGHoIJi
0mQDAP0RTp5tYcKsISp4eVDJUi5yZ8J4YDN2ZXztp16aNt5aZQEA6NDwrLFUkCm1
qjuemHwa7AaHJO6OCYMqBC4Kk04sAg8=
=m4Cd
-----END PGP SIGNATURE-----

--2qEwXy5L5XBLIveE--
