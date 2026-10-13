Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB27952F299;
	Tue, 13 Oct 2026 17:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914059; cv=none; b=IukolzEjay5gXtduEqEX/ETExqO/KHJNSVuFaiwhfSdkuGctjquDHDzUABu16ApwCUqM39BmiZYPyBq/+0z1jsnxsbPXip7iQlv+erVdY87BIdyA37kOYJlF+2c6zvIGgfDIEd8aDFtWmx1euJrikdZT2Cm0aXa/OZ2Gf6AhYBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914059; c=relaxed/simple;
	bh=eQOYa2blZFrbzsNIyojkc8nBl/4ke45XHniunalu22Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iH5xN/F0SUJBS6SB3HutGghNk6hLnKQ3VUD0OToCDghj9e5vJIgwdRlFuO/9E+v3T3jxDguIKZUpu59O+2Zm6CeQ1ge/DO54GHeOuSW3DV81IwP8YO2OQKHVfn3tPFuFlINTE5JhR4R/Z8vPPA6UUE7ZlUr8RHWeA0zeXz0JUGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSkCYiIY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSkCYiIY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959C31F00899;
	Tue, 13 Oct 2026 17:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791914056;
	bh=d46hvuLrcz2FQgTWFsuvIjC/NxsYRt1osxT9oAcU9KU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mSkCYiIY9tz6TwwFwpbZPMeTAe8446xrrZ1rh3HiOeXxMErz7adyXM3ZYhAxoMDyT
	 sxtl5LzDzM4bczO/Bqp0vTP7rJ/iMhx1kDLfRlQye3a3hUl/+sSR3mvkgsBVgIXCsy
	 QeoB4w6tAjlokKo5IUu6HtkK9E3Nw+POgc5iao3mFascQitajwZnqSIuCe6On1lMxk
	 vGOe6Suy1v+RJ0X08yMirbpHBlEofk88VA+fFgFEDsvd+2B5XYMx1WgafkkXaZ3S+Y
	 GfhlII0ye+bDY20nRjwkjD/4H56WazIBljI7AKPXbaV5Wmtb95fRQOBQRw0CgvE48H
	 mVrjEPsQjdEIg==
Date: Tue, 13 Oct 2026 18:54:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: tglx@kernel.org, radu@rendec.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de,
	mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: introduce
 toshiba,tc9564-msigen.yaml
Message-ID: <20261013-coexist-sixtyfold-cc6614086d3a@spud>
References: <20261012190245.3988619-1-elder@riscstar.com>
 <20261012190245.3988619-2-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3I3Rp++l/jcJ+LVC"
Content-Disposition: inline
In-Reply-To: <20261012190245.3988619-2-elder@riscstar.com>

--3I3Rp++l/jcJ+LVC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 02:02:43PM -0500, Alex Elder wrote:
> Define the binding for the MSIGEN interrupt controller present in the
> Toshiba TC9564 SoC.
>=20
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../toshiba,tc9564-msigen.yaml                | 70 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/toshiba,tc9564-msigen.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/toshi=
ba,tc9564-msigen.yaml b/Documentation/devicetree/bindings/interrupt-control=
ler/toshiba,tc9564-msigen.yaml
> new file mode 100644
> index 0000000000000..39dc63964bd52
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc95=
64-msigen.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/toshiba,tc9564-m=
sigen.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC9564 MSIGEN Interrupt Controller
> +
> +maintainers:
> +  - Daniel Thompson <daniel@riscstar.com>
> +  - Alex Elder <elder@riscstar.com>
> +
> +description: |
> +  The Toshiba TC9564 is an SoC accessed by a host system through the
> +  upstream PCIe port on the PCIe switch it implements.  The switch
> +  includes an embedded PCIe endpoint that provides access to various
> +  SoC peripherals (including an interrupt controller) via its BARs.
> +
> +  The TC9564 MSIGEN (MSI Generator) provides an interrupt controller
> +  with 25 hardware interrupt lines.  It aggregates internal interrupts
> +  and generates a single PCIe MSI to the host.  Each PCIe function
> +  implements an MSIGEN instance.
> +
> +  Each MSIGEN uses a gated clock and reset line.  These are provided
> +  by the clock and reset controllers internal to the TC9564.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: toshiba,tc9564-msigen
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: Gate clock from the TC9564 clock controller

I'm surprised that the clock is not mandatory.. Realistically the reset
is also mandatory, there's probably one instance of this on the device,
where both clock and reset are connected. I'd add both to the required
list.

Otherwise this looks
fine to me. I know you mentioned this device in the other series that
we were discussing but I don't see how it is related and is perfectly
fine to implement as a standalone device as you have done here.

Thanks,
Conor.

> +
> +  resets:
> +    maxItems: 1
> +    description: Reset signal from the TC9564 reset controller
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/toshiba,tc9564.h>
> +    #include <dt-bindings/reset/toshiba,tc9564.h>
> +
> +    interrupt-controller@f000 {
> +        compatible =3D "toshiba,tc9564-msigen";
> +        reg =3D <0xf000 0x100>;
> +        interrupt-controller;
> +        #interrupt-cells =3D <1>;
> +        clocks =3D <&tc9564_clock0 CLOCK_MSIGEN>;
> +        resets =3D <&tc9564_reset0 RESET_MSIGEN>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 252b6d7ee1638..9e73a912f0c0f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28173,6 +28173,12 @@ F:	Documentation/devicetree/bindings/media/i2c/t=
oshiba,tc358743.yaml
>  F:	drivers/media/i2c/tc358743*
>  F:	include/media/i2c/tc358743.h
> =20
> +TOSHIBA TC9564 MSIGEN DRIVER
> +M:	Alex Elder <elder@kernel.org>
> +M:	Daniel Thompson <danielt@kernel.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564=
-msigen.yaml
> +
>  TOSHIBA TC9564 PCI DRIVER
>  M:	Alex Elder <elder@kernel.org>
>  M:	Daniel Thompson <danielt@kernel.org>
> --=20
> 2.53.0
>=20

--3I3Rp++l/jcJ+LVC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5wQwAKCRB4tDGHoIJi
0kRRAP404z1GNo0XPhYPUyViwUnod8PExp3H0HJAWQkizBM7XgEAu0iS7xXASJBZ
6VUrR1k2qJngl370Dm7O7fVDLnO63wY=
=6DQv
-----END PGP SIGNATURE-----

--3I3Rp++l/jcJ+LVC--
