Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256D436B93B;
	Tue,  8 Sep 2026 16:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886040; cv=none; b=uy6Xg3l0t3GdmvG9C540fFuWqlU2DF9l0ses3GAvVrPUBh16NVAc0tF7dWrS9qgDJ0qFnQQ7vbdBfFJ9a/vBkytcE7VSdpNV5z044scOm1wlJe1ViPX6wjPzVwpzumfxg9+gV9SmYaCp7BidtckheWAZUQ5yl8+63pQnByQNr78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886040; c=relaxed/simple;
	bh=5TF5YRMUbaqv1GZf1xwSO1YSJhKYL4Nsxv39fO98Uzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyysC2tQjRXiGK/Xn8PPO9gqDpav/WQFV1lQR/RwfRQERVx8udFAGgJJta7D0xo0T88hfnMaDKwfS4QpFNJOZaW0/rKYJyVNIzHpjY3C7sFujmJZR806CHblaPaWdgaSWvs8uIHWbVFUkww98XRgsNLhdf/7AHqj760Xo1tkVIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIXVSYtd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIXVSYtd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BA31F00A3A;
	Tue,  8 Sep 2026 16:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788886038;
	bh=VTs508HlxT2jHjXOhLwroh4+4dVlDyRTmQKbeolcbdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XIXVSYtdZwTv7QaKBfL3yyuTTaELnWeVH5dg1ww+2r0ASA0dTfu9+HhRjnRujZvdw
	 4LDPSKSarNNI4e3T+d1X17rGan4XpqqMv3sdbZaFtYuSxXSSNtOxBvLGc6KhplAJs6
	 f1QJz+49ir9r4veQfR84kQ/3Xt65ngc1VmixZCEK57a2Uv9oski0vHkOZRJWs1EEZa
	 2kECpL5/wzZ5GfN3wn16TIdkj5IX+m4G3hIRlHgM8NvdALMOaHmL1H8WjY82SsdTl+
	 JptDrRVWs+1fZDF1JjNKCMDLWAa5BLBeEfFpF3Q+w5k2v5ksS2kZoJSeKJtO2SkMLh
	 /4rBnSObw2uOw==
Date: Tue, 8 Sep 2026 17:47:14 +0100
From: Conor Dooley <conor@kernel.org>
To: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: usb: add Altera Agilex5 DWC3
 controller
Message-ID: <20260908-failing-harbor-bcdb0d560c66@spud>
References: <cover.1788757821.git.adrian.ho.yin.ng@altera.com>
 <19d22389b795bd0883dc481f045a293b400f1ea3.1788757821.git.adrian.ho.yin.ng@altera.com>
 <20260907-overboard-frisbee-64c8b3c09c59@spud>
 <8bf38b40-580e-4331-8e18-afccef6f2d59@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/5UvfjvX3MqcnQZ+"
Content-Disposition: inline
In-Reply-To: <8bf38b40-580e-4331-8e18-afccef6f2d59@altera.com>

--/5UvfjvX3MqcnQZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 02:01:58PM +0800, NG, ADRIAN HO YIN wrote:
>=20
> On 9/8/2026 12:59 AM, Conor Dooley wrote:
> > On Mon, Sep 07, 2026 at 04:21:38PM +0800, Adrian Ng Ho Yin wrote:
> > > Add a binding for the Altera Agilex5 SoC integration of the Synopsys =
DWC3
> > > USB controller (compatible "altr,agilex5-dwc3"), covering clocks, res=
ets,
> > > PHYs, and optional IOMMU support.
> > >=20
> > > Clock names follow the snps,dwc3.yaml example order (bus_early, ref,
> > > suspend). Reset names use core/ecc. On this SoC ref and suspend are t=
he
> > > same hardware source, so the example reuses AGILEX5_USB31_SUSPEND_CLK.
> > >=20
> > > Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> > > ---
> > >   .../bindings/usb/altr,agilex5-dwc3.yaml       | 108 +++++++++++++++=
+++
> > >   1 file changed, 108 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/usb/altr,agile=
x5-dwc3.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.=
yaml b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
> > > new file mode 100644
> > > index 000000000000..9970d7c9d6fa
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
> > > @@ -0,0 +1,108 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/usb/altr,agilex5-dwc3.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Altera Agilex5 DWC3 USB SoC Controller
> > > +
> > > +maintainers:
> > > +  - Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> > > +
> > > +description:
> > > +  The Altera Agilex5 SoCFPGA integrates a Synopsys DesignWare USB3 (=
DWC3)
> > > +  controller that supports host, device and DRD modes.
> > > +
> > > +allOf:
> > > +  - $ref: snps,dwc3-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: altr,agilex5-dwc3
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Master/Core bus clock
> > > +      - description: Controller reference clock
> > > +      - description: Controller suspend clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: bus_early
> > > +      - const: ref
> > > +      - const: suspend
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  phys:
> > > +    minItems: 2
> > > +    maxItems: 2
> > > +
> > > +  phy-names:
> > > +    items:
> > > +      - const: usb2-phy
> > > +      - const: usb3-phy
> > > +
> > > +  iommus:
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    items:
> > > +      - description: DWC3 core reset
> > > +      - description: DWC3 ECC reset
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: core
> > > +      - const: ecc
> > > +
> > > +  dr_mode: true
> > > +
> > > +  maximum-speed: true
> > > +
> > > +  snps,dis_u2_susphy_quirk: true
> > > +
> > > +  snps,dis_u3_susphy_quirk: true
> > You add these two as possible but not required properties. Why is that?
> > Does the agilex5 have some instances of the IP where these are needed
> > and not others?
>=20
> Hi Conor,
>=20
> There is only one DWC3 instance for Agilex 5, and these 2 quirks are used=
 on
> that node.

Then they should be mandatory.
pw-bot: changes-requested

> I left them as optional because i followed how snps,dwc3-common.yaml mode=
ls
> them:
> boolean flags, not required properties.

That file cannot make them mandatory since they might not apply to all
the various devices that use them.

Thanks,
Conor.

> I listed them as "foo: true" so
> additionalProperties:
> false would still accept the properties the SoC DT uses.
>=20
> Thank You
> Adrian
>=20
> >=20
> > Cheers,
> > Conor.
> >=20
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - interrupts
> > > +  - phys
> > > +  - phy-names
> > > +  - resets
> > > +  - reset-names
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/reset/altr,rst-mgr-s10.h>
> > > +    #include <dt-bindings/clock/intel,agilex5-clkmgr.h>
> > > +
> > > +    soc {
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <1>;
> > > +
> > > +        usb@11000000 {
> > > +            compatible =3D "altr,agilex5-dwc3";
> > > +            reg =3D <0x11000000 0x100000>;
> > > +            interrupts =3D <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> > > +            clocks =3D <&clkmgr AGILEX5_USB31_BUS_CLK_EARLY>,
> > > +                     <&clkmgr AGILEX5_USB31_SUSPEND_CLK>,
> > > +                     <&clkmgr AGILEX5_USB31_SUSPEND_CLK>;
> > > +            clock-names =3D "bus_early", "ref", "suspend";
> > > +            phys =3D <&usbphy0>, <&usbphy1>;
> > > +            phy-names =3D "usb2-phy", "usb3-phy";
> > > +            resets =3D <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
> > > +            reset-names =3D "core", "ecc";
> > > +            iommus =3D <&smmu 7>;
> > > +        };
> > > +    };
> > > --=20
> > > 2.49.GIT
> > >=20

--/5UvfjvX3MqcnQZ+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqA8EgAKCRB4tDGHoIJi
0kEoAQCxUVy0DLwkj/6ANmmDxTH4nLmATErwOHoJitclTf/WhwD/T7TXczQhfY7H
d2K/K3v6uuYpmUPvSt7Ylj5uqQQvrQM=
=Rztb
-----END PGP SIGNATURE-----

--/5UvfjvX3MqcnQZ+--
