Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1024EDCB0;
	Fri,  2 Oct 2026 17:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960740; cv=none; b=ccXGw0iDcclnOoW6QadVgPq7S8Of4ldEPMtgCy3l+zP2uqxavyzgN7vkGj2oGRZ/jD8UJBWl8jR2Qtb3x9LhUnA2vljgMs1RZyYJHKM9chHIXxqFFGpyPQaZBY9VAMNoL8u8lSWfp3HKDnGNRu+4zInD4uhY6HbPIhTGVAEck7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960740; c=relaxed/simple;
	bh=w0mEjVzi5B9BYqkzmCZTWh8Mx1UMW66ngfYwJzSrxRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHKbXAzupmOpAr2o3OvLeB3IbExrbqnSl56AOQQpYYO7GBuC0lJaWLjpBLAvITj5rUbllwF8gFKZj9W115JxUeo9Jyoqdi/7ahqH4BYAhNTIynAy3frFkTHQIuE0CsZ7zXPqc/UejMoMPv/TqmGPzaixZFUV3DLs+fdWSuMfvJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8lkBLFn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8lkBLFn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6690C1F00898;
	Fri,  2 Oct 2026 17:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790960729;
	bh=2lcJF+guX3/RRpcKc4nkeyl1bIluwD5F4G3TuMV8WB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i8lkBLFn4jyIAaFjUD6e4CZbXMjQyE5mqT4sarCGlWYfDIosI49AjV0Y4eCc/CQWp
	 +0ws1Bb7lHvK/ldo+Eee9mRIAxVkhyNVfRUjbg8eJoqieHsmVDsKRZ5s7WWu28/GDe
	 468jpA4Ng8+LCp4dFZUQP4Xy73IQEQzLxk3W8tN2fMOPDCO8/F8QiQeg+uI4j/8WDS
	 mCQDApIAvZu5EIEX8/LFHom+9IX+3vjwk4y7qwbzs+s6M3rT6WfhqKFCk2N23ahWla
	 DKvuviPKYG2tR6qLmN1G7wMTG2JXE5y2t/F5y0OWzfQvrCeG7Pmk9ft9tfBFBkepD/
	 TbMDoatxNWq0Q==
Date: Fri, 2 Oct 2026 18:05:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: connector: Add Toradex camera
 connector
Message-ID: <20261002-prepaid-retired-3d2c9cbc035e@spud>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cciuDq3elMOy+sRp"
Content-Disposition: inline
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>

--cciuDq3elMOy+sRp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 01:44:11PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>=20
> Toradex boards route the sideband signals of their 24-pin camera
> connectors to different GPIO controllers. Camera overlays which name
> those controllers directly must therefore be duplicated for each host
> board.
>=20
> Describe reset, power-down, detection and power-control as
> connector-local GPIO functions. This lets an accessory overlay remain
> independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> remain described separately because the GPIO nexus does not abstract
> them.
>=20
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  .../connector/toradex,camera-connector.yaml        | 81 ++++++++++++++++=
++++++
>  1 file changed, 81 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-c=
onnector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-=
connector.yaml
> new file mode 100644
> index 000000000000..27fee3defde7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/toradex,camera-connecto=
r.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/toradex,camera-connector.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/base.yaml#
> +
> +title: Toradex camera connector GPIO nexus
> +
> +maintainers:
> +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> +
> +description: |
> +  Toradex carrier boards share a common 24-pin, 0.5 mm pitch FFC/FPC cam=
era
> +  connector carrying MIPI CSI-2, I2C, clock, power, and sideband GPIO si=
gnals.
> +  This binding describes the sideband signals as a GPIO nexus. The other
> +  connector resources remain described by the surrounding board device t=
ree.
> +
> +  The nexus exposes connector-local GPIO function numbers to camera over=
lays
> +  and maps the functions wired by a carrier board to their GPIO controll=
ers.
> +  GPIO specifiers contain a function number followed by standard GPIO fl=
ags.
> +  A board may omit functions which it does not wire.
> +
> +  The function numbers are:
> +    - 0: Camera reset, connector pin 11
> +    - 1: Camera power-down, connector pin 22
> +    - 2: Camera identification, connector pin 23
> +    - 3: Camera power control, connector pin 24
> +
> +properties:
> +  compatible:
> +    const: toradex,camera-connector

This seems overly generic, but I assume that's what it's actually called
and if you make a new camera connector the name will be
"camera connector 2" or something.

> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-map:
> +    minItems: 1
> +    maxItems: 4
> +
> +  gpio-map-mask:
> +    items:
> +      - const: 0xffffffff
> +      - const: 0
> +
> +  gpio-map-pass-thru:
> +    items:
> +      - const: 0
> +      - const: 0xffffffff

These seem incredibly wide for something with only 4 gpios?

Thanks,
Conor.

> +
> +required:
> +  - compatible
> +  - "#gpio-cells"
> +  - gpio-map
> +  - gpio-map-mask
> +  - gpio-map-pass-thru
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    camera-connector {
> +        compatible =3D "toradex,camera-connector";
> +        #gpio-cells =3D <2>;
> +        /*
> +         * 0: Camera reset, connector pin 11
> +         * 1: Camera power-down, connector pin 22
> +         * 2: Camera identification, connector pin 23
> +         * 3: Camera power control, connector pin 24
> +         */
> +        gpio-map =3D <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
> +                   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
> +                   <2 0 &gpio1 2 GPIO_ACTIVE_HIGH>,
> +                   <3 0 &gpio1 3 GPIO_ACTIVE_HIGH>;
> +        gpio-map-mask =3D <0xffffffff 0x0>;
> +        gpio-map-pass-thru =3D <0x0 0xffffffff>;
> +    };
> +
> +...
>=20
> --=20
> 2.43.0
>=20

--cciuDq3elMOy+sRp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar/kVAAKCRB4tDGHoIJi
0l1DAP9bDUA3Nv7it5RkeD4+LYzY1vUJBthcKaf0+Er4zJ5sTwD/aDRO34o3W2Wc
18ldXYC69SYV2KiUW0VdsZwoaVQIAQw=
=tx7U
-----END PGP SIGNATURE-----

--cciuDq3elMOy+sRp--
