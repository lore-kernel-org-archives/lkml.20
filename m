Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB07F4DA52E;
	Fri,  4 Sep 2026 15:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535160; cv=none; b=kHAdfKt/17Qn91goMypuuUBAwwqLCB68RDt9uv7eg3MG7zz67XztzaEefJYcyBeoec56X17HN+p6XLGnfJmpYjxbUL3e8nH6F0vVrxp5zfy68EBv6vYpnM8gyK/LW0+PR654bzpGMd5lAKavlYk+peaihFHwMy66f9PLt68D6sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535160; c=relaxed/simple;
	bh=KVmbLFULfd0hBVMoDnI6b9xsEyUdHWQqcjFR85DQ0Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMYC3MYy1792Xv5UNrSlmHySxf3RnViLZ2bLwjS0B9gI0mHN/sW1YEi7QHNZEsQ7xTWrPB3MXkjK8lufV34nnPS0p0CwAYsrt5vukys77jVjp50JLh7HleRXpQW01p7+gQGvYtMxU/CUvmIK/5L5fUbg35VHvxddNz6sArYDt9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9M83vpc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9M83vpc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DA31F00A3D;
	Fri,  4 Sep 2026 15:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788535158;
	bh=qnIA1YseJadTAbsQW92vNtl6pfU7UFSnova98oLfDXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j9M83vpcvNsdRE6i4VTKZ4Vhm4K98KUokQuIfHG9l1M+c8DM1QjwhqQGF9sWBLKlp
	 5rfuXtaU4s7IRwd5iexfvlHgV7Tl7v56BoNBSpd9+dvkcWLRRCwJM9wMzjN3WXwLYb
	 b6Vm0hicQmwbB279HGMjWw6FBfEa9Fs6TWghhiXoghGGp7Uv0/dn82ujnE1IaXgBu4
	 2Qf2511hUFJ+J5hNLm7cXjT4DBuG73I3abNJz4wUOAKSVZm49eIBz4u72TaJwBMRmC
	 37Ybxf0+QoYFk2WGCJnprrQoSNzTvjHaZuCewEAt7ByePW6Bu4KQ5AHrUk8JyPrciN
	 V7NVYxZNKNpRg==
Date: Fri, 4 Sep 2026 16:19:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: usb: add Altera Agilex5 DWC3
 controller
Message-ID: <20260904-survive-kindred-420cac7236f7@spud>
References: <cover.1788503540.git.adrian.ho.yin.ng@altera.com>
 <56c7cb879f6c1b8e835a34522a02f55b9178c3c2.1788503540.git.adrian.ho.yin.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IH65QDaYF4SeddC8"
Content-Disposition: inline
In-Reply-To: <56c7cb879f6c1b8e835a34522a02f55b9178c3c2.1788503540.git.adrian.ho.yin.ng@altera.com>

--IH65QDaYF4SeddC8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2026 at 04:46:10PM +0800, Adrian Ng Ho Yin wrote:
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
>  .../bindings/usb/altr,agilex5-dwc3.yaml       | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dw=
c3.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
> new file mode 100644
> index 000000000000..e172706474f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
> @@ -0,0 +1,100 @@
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
> +unevaluatedProperties: false

I'm never keen on unevaluatedProperties for dwc3 stuff, cos there are
lots of properties in there that I do not believe should be used in
general.
Could you instead use "additionalProperties: false" and add "foo: true"
for any properties (other than the ones you've already got) that you
need?

Otherwise, this looks good to me.
pw-bot: changes-requested

Thanks,
Conor.

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

--IH65QDaYF4SeddC8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaprhcgAKCRB4tDGHoIJi
0vcHAPsH4JiabDNv2WVPMA/gJZmH6Sfs3Uqg7ZUMicV4ArDxqAEAm9izZnneKh7B
KDBFWNlSMRkZPfCXRgyC9cssDTZARQ4=
=lncL
-----END PGP SIGNATURE-----

--IH65QDaYF4SeddC8--
