Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B322E717B;
	Mon, 12 Oct 2026 21:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840180; cv=none; b=TZNc7eDSTJ9x6YArCiFWJb/QqFuFkoONAqrfardwiCpPGHcsgLfsrTvnhMy2kHJW51YwgTU+Peii6do7kJsq5iTDK2WlhFTp10bX1DhpBvCODNzZo2yB4Ocz5NbrOyU+g2IeGBOUyuQTm8gj5TLQsexI4sHnNVTH/fqEnwT0Vhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840180; c=relaxed/simple;
	bh=LruxmSQJUGFYTdivKkQuQz+FLzNvia4QT4NeFePgYTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKQS//Px+fZBwOlvXRdnnK+w/vlAjjReZotZNX+mHvhAp08VsLxTOroahrOzHiPvF9lrKOE/XMIPEkSzgolX/s8QdQR6XFNIKOPHd7n2Sckfb6TJwGboxCG1n/jmDqS3DyCOeOclx9orUNbMkYE+IdKOWoPXfUCgCtF2XHwj2Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNGCNIWI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNGCNIWI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC311F0089B;
	Mon, 12 Oct 2026 21:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791840179;
	bh=ShWHhliPjutXJgrYxpO8QRYrSkXotLzharw91oNUC/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PNGCNIWIH6Y9jMC+ofSZmj5f8+8hcJlpbeeYe1zJ1vFnelYe5mBgdZkWDWVJVAFX3
	 AhjnmJl/H0xG56wXLZWNIEYZ2NXJw1Zhc9GQmKHc6SMexG3IDiNbPh6wah9RQW5/CL
	 OQ7gxI17Fn3wm0IGd6nZ/KPpBpDp+IGr8iFr+zSfQBgSHmNyQ5C7EiA2Yv3UqMC43f
	 3JZllwlfakULHV70KDT3YOvYC2J2p3KB/Ipdu8MRBD+FPmaeUc6YHHs6D9gU9hoqSh
	 HKmDRdIghUISQ7gsZPGVKKkXu240reONLk+QCgXIJZiVuHmwKxMellg6zlAdh+PdqJ
	 Bv5jSP7zlfupw==
Date: Mon, 12 Oct 2026 22:22:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: introduce
 toshiba,tc9564-reset.yaml
Message-ID: <20261012-numerous-flatworm-9e4cfa659541@spud>
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-2-elder@riscstar.com>
 <20261012-shale-rosy-805c49f6c404@spud>
 <492396bc-a0f4-4274-9a7c-21fd5fd886b5@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YzVxPACpizJDAvzU"
Content-Disposition: inline
In-Reply-To: <492396bc-a0f4-4274-9a7c-21fd5fd886b5@riscstar.com>

--YzVxPACpizJDAvzU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 02:10:01PM -0500, Alex Elder wrote:
> On 10/12/26 1:51 PM, Conor Dooley wrote:
> > On Mon, Oct 12, 2026 at 11:43:52AM -0500, Alex Elder wrote:
> > > Define the binding for the reset controller functionality present in
> > > the Toshiba TC9564 SoC.
> > >=20
> > > Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> > > Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > ---
> > >   .../bindings/reset/toshiba,tc9564-reset.yaml  | 56 ++++++++++++++++=
+++
> > >   MAINTAINERS                                   |  7 +++
> > >   include/dt-bindings/reset/toshiba,tc9564.h    | 26 +++++++++
> > >   3 files changed, 89 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/reset/toshiba,=
tc9564-reset.yaml
> > >   create mode 100644 include/dt-bindings/reset/toshiba,tc9564.h
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/reset/toshiba,tc9564-r=
eset.yaml b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.ya=
ml
> > > new file mode 100644
> > > index 0000000000000..1908e9539abac
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.ya=
ml
> > > @@ -0,0 +1,56 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/reset/toshiba,tc9564-reset.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Toshiba TC9564 Reset Controller
> > > +
> > > +maintainers:
> > > +  - Alex Elder <elder@riscstar.com>
> > > +  - Daniel Thompson <daniel@riscstar.com>
> > > +
> > > +description:
> > > +  The Toshiba TC9564 is an SoC accessed by a host system through the
> > > +  upstream PCIe port on the PCIe switch it implements.  The switch
> > > +  includes an embedded PCIe endpoint that provides access to various
> > > +  SoC peripherals (including a reset controller) via its BARs.
> > > +
> > > +  A total of 13 resets are implemented, though two of these are not
> > > +  controllable.  Access to the reset controller relies on PCIe being
> > > +  functional, so the PCIe reset is assumed to be deasserted.  Simila=
rly,
> > > +  the PCIe controller relies on I2C, so the I2C reset is also assumed
> > > +  to be deasserted.
> > > +
> > > +  Reset ids are defined in <dt-bindings/reset/toshiba,tc9564.h>.
> > > +
> > > +  The reset controller uses registers within the same page as a
> > > +  clock controller, so both devices are defined as children of a
> > > +  "config" syscon.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: toshiba,tc9564-reset
> >=20
> > Why does this need to exist as a standalone device, rather than be
> > rolled up into the parent syscon node? It doesn't have any resources, so
> > it should be doable.
>=20
> This is along the lines of what Krzysztof has mentioned, and it
> seems clear I must be missing something.
>=20
> > This kind of thing for a syscon is always difficult to review when only
> > one element is present - where is the rest of the syscon's
> > functionality?
>=20
> The reason a syscon was used was simply for the benefit of
> having a shared regmap that the reset, clock, and DWMAC drivers
> can use.  All three of those drivers use registers that reside
> within a single page of addressible MMIO space.

What does the dwmac use the region for? I assume it's for some misc
register and you don't mean that the dwmac lies within the region?

There's nothing inherently wrong with the act of using of a syscon here,
what I am actually complaining about is how you are using it.
In cases where a syscon region contains clock and reset, the typical way
we want people to do this is via something like

syscon@f00 {
	compatible =3D "toshiba,tc9564-bla-syscon", "syscon", "simple-mfd";
	reg =3D <0x0 0x2000>;
	#reset-cells =3D <1>;
	#clock-cells =3D <1>;
};

because the child node exists for no other reason than to access linux
driver probing in the most trivial way. If there's some features that
actually need a child node, that's fine, but those will end up being
things with significantly more properties or things with competing
property use (e.g. if there were devices with buses that need
address/size cells).

> And I don't know that I can guarantee their probe order.

I am assuming this is moot, since I am not objecting to using a syscon?

> There is otherwise no "system controller" that is treated as
> a logical entity within the SoC.
>=20
> What is the proper way for me to represent this?  It's fairly
> simple; and I mainly want to ensure all three of those drivers
> can safely access their addresses.

What else does this region actually contain?

Cheers,
Conor.

> > > +
> > > +  "#reset-cells":
> > > +    const: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - "#reset-cells"
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/reset/toshiba,tc9564.h>
> > > +
> > > +    syscon@0 {
> > > +        compatible =3D "syscon", "simple-mfd";
> > > +        reg =3D <0x0 0x2000>;
> > > +
> > > +        reset {
> > > +            compatible =3D "toshiba,tc9564-reset";
> > > +            #reset-cells =3D <1>;
> > > +        };
> > > +    };
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 252b6d7ee1638..d0eb44079fe17 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -28180,6 +28180,13 @@ S:	Maintained
> > >   F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
> > >   F:	drivers/misc/tc9564-pci.c
> > > +TOSHIBA TC9564 RESET DRIVER
> > > +M:	Alex Elder <elder@kernel.org>
> > > +M:	Daniel Thompson <danielt@kernel.org>
> > > +S:	Maintained
> > > +F:	Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
> > > +F:	include/dt-bindings/reset/toshiba,tc9564.h
> > > +
> > >   TOSHIBA WMI HOTKEYS DRIVER
> > >   M:	Azael Avalos <coproscefalo@gmail.com>
> > >   L:	platform-driver-x86@vger.kernel.org
> > > diff --git a/include/dt-bindings/reset/toshiba,tc9564.h b/include/dt-=
bindings/reset/toshiba,tc9564.h
> > > new file mode 100644
> > > index 0000000000000..5fcc9a06d4ff6
> > > --- /dev/null
> > > +++ b/include/dt-bindings/reset/toshiba,tc9564.h
> > > @@ -0,0 +1,26 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > +
> > > +/*
> > > + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights=
 reserved.
> > > + */
> > > +
> > > +#ifndef __RESET_TOSHIBA_TC9564_H__
> > > +#define __RESET_TOSHIBA_TC9564_H__
> > > +
> > > +/* Reset IDs */
> > > +
> > > +#define RESET_MCU		0
> > > +#define RESET_MCU1		1
> > > +#define RESET_MSIGEN		2
> > > +#define RESET_INTC		3
> > > +#define RESET_UART		4
> > > +
> > > +#define RESET_MAC0_MAC		5
> > > +#define RESET_MAC0_PMA		6
> > > +#define RESET_MAC0_XPCS		7
> > > +
> > > +#define RESET_MAC1_MAC		8
> > > +#define RESET_MAC1_PMA		9
> > > +#define RESET_MAC1_XPCS		10
> > > +
> > > +#endif /* __RESET_TOSHIBA_TC9564_H__*/
> > > --=20
> > > 2.53.0
> > >=20
>=20

--YzVxPACpizJDAvzU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas1PrgAKCRB4tDGHoIJi
0nkmAP9v7bODUF8P29/idYnXULHr6aVTWyMvFD54nMkNK7JYIwEA5+CJlGeKRvUf
gMRQzc2F+Ml8zzzEL60Hg+3+RslDVgo=
=HQ4f
-----END PGP SIGNATURE-----

--YzVxPACpizJDAvzU--
