Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67514F649A;
	Mon,  7 Sep 2026 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800350; cv=none; b=Co12afEbM0GBA68POpYPpFjgLb28yQdSqCgjEdXgnrClz+KdTa2dCeFTqcioDslYc7BPy80OlKxhA6qUm6Z+SJnHQdTnxECJYNq5oINvZ6UNCiYoz/J0NaKVAqWE61a0VJF7ZkrIr1EZYKLrVt1s7rIccSkTmBTs5rCeuIR7QHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800350; c=relaxed/simple;
	bh=dbaONDE7FIbHDiC7OvAJKLH3E1xGtavhc++6575pzDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqbouGJzwE2yR1WRThC2WflzoymFQ68nK82VazgWvWdNi4ra/pLSj1cZ66rQoXlIYaz9/8nymrgBZV/EwoFUhLco62N4DwVc1/ANuUVsg1stfi7kgTo/NL3FCsvunvfueAsAvoNDBQiF1RrgedCU2tPjQaWrQJ+cn7KbsM27inw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1MA6ZJQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1MA6ZJQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489F51F00A3A;
	Mon,  7 Sep 2026 16:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788800349;
	bh=4ssp9dAeG2ijSrS1YNKfnaevuumvaTE51hZoZn+cIUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N1MA6ZJQhmG9LG6/BBaIRZd+aZ3EbBJ084kQwNsy25BO278Kdb4LtNXokNmmDd3At
	 J1LhgHl3QWW5oZ/J6F/Pd7qQciVUsJ4ov4X97jDbHys027N9bAhRvaRQ1FgEpoZdI3
	 CM77rqU7QwTDYY9JSMXl5aoeMfiwpB1XmpsdWt9wMsOHzwuqD5adPT6GYy//UYzsww
	 GqEODkOzvA3UQTjP7Cs05BGCLm/JslDC+2PlHM8b8VEaIEb2ys3AnfQo8qIBy4RgQ4
	 Da+mBHMPKkht8DRnHdnKJVoJ/wMRujdHa2/pyLmRBo4N7LrgDz6e9a82PK3IUuKoLS
	 nuN2G+DcCIQNA==
Date: Mon, 7 Sep 2026 17:59:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: usb: add Altera Agilex5 DWC3
 controller
Message-ID: <20260907-overboard-frisbee-64c8b3c09c59@spud>
References: <cover.1788757821.git.adrian.ho.yin.ng@altera.com>
 <19d22389b795bd0883dc481f045a293b400f1ea3.1788757821.git.adrian.ho.yin.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/gKrLx49HP7IondB"
Content-Disposition: inline
In-Reply-To: <19d22389b795bd0883dc481f045a293b400f1ea3.1788757821.git.adrian.ho.yin.ng@altera.com>

--/gKrLx49HP7IondB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 04:21:38PM +0800, Adrian Ng Ho Yin wrote:
> Add a binding for the Altera Agilex5 SoC integration of the Synopsys DWC3
> USB controller (compatible "altr,agilex5-dwc3"), covering clocks, resets,
> PHYs, and optional IOMMU support.
>=20
> Clock names follow the snps,dwc3.yaml example order (bus_early, ref,
> suspend). Reset names use core/ecc. On this SoC ref and suspend are the
> same hardware source, so the example reuses AGILEX5_USB31_SUSPEND_CLK.
>=20
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>  .../bindings/usb/altr,agilex5-dwc3.yaml       | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dw=
c3.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
> new file mode 100644
> index 000000000000..9970d7c9d6fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/altr,agilex5-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Altera Agilex5 DWC3 USB SoC Controller
> +
> +maintainers:
> +  - Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> +
> +description:
> +  The Altera Agilex5 SoCFPGA integrates a Synopsys DesignWare USB3 (DWC3)
> +  controller that supports host, device and DRD modes.
> +
> +allOf:
> +  - $ref: snps,dwc3-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: altr,agilex5-dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Master/Core bus clock
> +      - description: Controller reference clock
> +      - description: Controller suspend clock
> +
> +  clock-names:
> +    items:
> +      - const: bus_early
> +      - const: ref
> +      - const: suspend
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phys:
> +    minItems: 2
> +    maxItems: 2
> +
> +  phy-names:
> +    items:
> +      - const: usb2-phy
> +      - const: usb3-phy
> +
> +  iommus:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: DWC3 core reset
> +      - description: DWC3 ECC reset
> +
> +  reset-names:
> +    items:
> +      - const: core
> +      - const: ecc
> +
> +  dr_mode: true
> +
> +  maximum-speed: true
> +
> +  snps,dis_u2_susphy_quirk: true
> +
> +  snps,dis_u3_susphy_quirk: true

You add these two as possible but not required properties. Why is that?
Does the agilex5 have some instances of the IP where these are needed
and not others?


Cheers,
Conor.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - phys
> +  - phy-names
> +  - resets
> +  - reset-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/altr,rst-mgr-s10.h>
> +    #include <dt-bindings/clock/intel,agilex5-clkmgr.h>
> +
> +    soc {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        usb@11000000 {
> +            compatible =3D "altr,agilex5-dwc3";
> +            reg =3D <0x11000000 0x100000>;
> +            interrupts =3D <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks =3D <&clkmgr AGILEX5_USB31_BUS_CLK_EARLY>,
> +                     <&clkmgr AGILEX5_USB31_SUSPEND_CLK>,
> +                     <&clkmgr AGILEX5_USB31_SUSPEND_CLK>;
> +            clock-names =3D "bus_early", "ref", "suspend";
> +            phys =3D <&usbphy0>, <&usbphy1>;
> +            phy-names =3D "usb2-phy", "usb3-phy";
> +            resets =3D <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
> +            reset-names =3D "core", "ecc";
> +            iommus =3D <&smmu 7>;
> +        };
> +    };
> --=20
> 2.49.GIT
>=20

--/gKrLx49HP7IondB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap7tWQAKCRB4tDGHoIJi
0jo9AP0arEbM895MhFYiLpKiSVrOvIkBjRKaOBNYkokVeppiIgD/blQ7aWnX33tc
dNonP3DxZNWOCKi2uE8PrDvb0xLRBw4=
=Dyer
-----END PGP SIGNATURE-----

--/gKrLx49HP7IondB--
