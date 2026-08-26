Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D9F1A9FA8;
	Wed, 26 Aug 2026 16:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760812; cv=none; b=TGru/GpmuC8IHVRi+BpJD20hSx8dvXWL7v+tLJIkUROc4FYWbcz7k4FtugT7XdbyEv9VOJQIdaBzUR/khnDB9D4BILL5/nunbOn2VMEZrEQ3fskulkFwn/chSPmsPvvMJKw2OfHuzHbgnZxZk6bwZV9j1iL4iWO8hxXOwZt9h1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760812; c=relaxed/simple;
	bh=Rt5AjpXjn8Oaeq5rNo81Ui8//83g/8MkVMEPaY95O0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWPWAF99QdpBqcEQDDZADnb6206DIpReImoOcoUdnvKphko9AcqcE4Yxrj1kqxZ/zFZamkNJJKtLDZ/wFhjYSZJ7r7xLMomvMNDcJht7mN2nMQMNkupKnuwQRIXW9PxM9P7erZoMq4QeOfoXQmBE3BQH4zcdk9KmgdGk5K6R7jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SINzj0Oa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SINzj0Oa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA0F1F000E9;
	Wed, 26 Aug 2026 16:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787760811;
	bh=9jPHgzZ/feJfTFPZntk7Cg2BcFsrZloAZmeFOqXv5HU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SINzj0Oae8vv3CXe2hG6cmeqxzIIxUr82SEpbsLNxPV2Tn9HoFlWlcR3ZDFcOR5FS
	 ft8uuHmFO6p02icrAIUX4Hp1TcV+367QQKGWmbyABYdk1lRoZ5TcihToqQLaQoVuWJ
	 sILhFX5MvEFewx+TKGyEAnxJZ0q/FMhFpyQlkhc3qBJJl1muhC+VMRcs8TbooyXmuF
	 BxI3EPCq8NKHm3Rd8ReQHLY4lRIRDkjfF07CnhhpGnysuk66dAb9+P1HHUDg2RkVUx
	 IQTY7TzIHnCUO3I1KGg8jXrX8vVPk4PuSoHBJ6cPgdbmFuTNcEyt5L4LXuvgo4RVRl
	 cQB3VVz/zmgEg==
Date: Wed, 26 Aug 2026 17:13:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Robert Bozik <robertbozik@gmail.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Message-ID: <20260826-copy-arise-bb7e9eb5e908@spud>
References: <20260826072002.14357-1-robertbozik@gmail.com>
 <20260826072002.14357-2-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kxXNyVDynmDP1OhS"
Content-Disposition: inline
In-Reply-To: <20260826072002.14357-2-robertbozik@gmail.com>

--kxXNyVDynmDP1OhS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 09:20:00AM +0200, Robert Bozik wrote:
> Add a binding for the OmniVision OV32C4, a 32 megapixel RGBC CMOS image
> sensor with on-chip 4-cell fusion, a 4-lane MIPI CSI-2 D-PHY transmitter
> and the standard SCCB command interface.
>=20
> The sensor ships in laptops as an under-display camera, where it is
> described by ACPI; the binding follows ovti,ov08x40.yaml, which covers
> the closest relative already in tree.
>=20
> Signed-off-by: Robert Bozik <robertbozik@gmail.com>
> Assisted-by: Claude:claude-opus-5 sparse
> Assisted-by: Claude:claude-fable-5 sparse
> ---
>  .../bindings/media/i2c/ovti,ov32c4.yaml       | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov32=
c4.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml=
 b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
> new file mode 100644
> index 000000000..be6067c75
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov32c4.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV32C4 Image Sensor
> +
> +maintainers:
> +  - Robert Bozik <robertbozik@gmail.com>
> +
> +description:
> +  The OmniVision OV32C4 is a 32 megapixel RGBC (red, green, blue and cle=
ar)
> +  CMOS image sensor in a 4-cell arrangement, with on-chip 4-cell fusion =
and
> +  binning. It has a 6528x4896 active pixel array, a 4-lane MIPI CSI-2 D-=
PHY
> +  transmitter and the standard SCCB command interface. The driver suppor=
ts
> +  3264x1840 at 30 fps, 10-bit Bayer, at a link frequency of 400 MHz.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ovti,ov32c4
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: Input clock (XVCLK), 19.2 MHz.

Where do this name and frequency come from? pin name I presume for the
former? Is 19.2 MHz a mandatory frequency?

> +
> +  avdd-supply:
> +    description: Analogue circuit voltage supply.
> +
> +  dovdd-supply:
> +    description: I/O circuit voltage supply.
> +
> +  dvdd-supply:
> +    description: Digital core voltage supply.

These 3 can just be :true, what they do should be obvious, provided they
match the pin names of the device.

Generally this looks fine to me though..

Cheers,
Conor.

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Active low GPIO connected to the XSHUTDOWN pad of the s=
ensor.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        additionalProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4
> +          link-frequencies: true
> +          remote-endpoint: true
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +          - remote-endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        camera@36 {
> +            compatible =3D "ovti,ov32c4";
> +            reg =3D <0x36>;
> +
> +            clocks =3D <&ov32c4_clk>;
> +            assigned-clocks =3D <&ov32c4_clk>;
> +            assigned-clock-rates =3D <19200000>;
> +
> +            avdd-supply =3D <&vreg_2p8>;
> +            dovdd-supply =3D <&vreg_1p8>;
> +            dvdd-supply =3D <&vreg_1p1>;
> +
> +            reset-gpios =3D <&tlmm 111 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                ov32c4_ep: endpoint {
> +                    remote-endpoint =3D <&csiphy0_ep>;
> +                    data-lanes =3D <1 2 3 4>;
> +                    link-frequencies =3D /bits/ 64 <400000000>;
> +                };
> +            };
> +        };
> +    };
> +...
> --=20
> 2.53.0
>=20

--kxXNyVDynmDP1OhS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao8QpwAKCRB4tDGHoIJi
0iWBAP0QpirlOm1Zi9Ck06wZX4Ny95SO2I8AYGzN13TH4lOVMQEAqGeXn4d8KZuR
jYFF0lTKy7fNc98bishEzRXGBIoOEQk=
=RiMD
-----END PGP SIGNATURE-----

--kxXNyVDynmDP1OhS--
