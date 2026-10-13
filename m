Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB0352ED59;
	Tue, 13 Oct 2026 17:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913900; cv=none; b=luOPCXEH0q8lsFQHzADm3rEhuZjYyK2JkvyqFt0Z1r1ZHnHMnJSmKndV86Xmo+bLf/RCblOLYb+Rf4DC70OvEeE8RKUUcZesy9xGe3DWI3oicJ4jgKB8JeR9aPhC+ZbsiArCMC4TtF3/sc7Yik8tADQY2Tqo+QayhTtUsFUivdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913900; c=relaxed/simple;
	bh=ZpNkTDP80NKCCuBbPSlyEBqseZeyscZC/4AmKYtENJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DA6fFtJyfLrOEDFPG9K4kG6xD1WsAj3EIVTcxYb9WvdbZabI217wUgryZc7nKI8zhltRKWA578ZxXwCrq51C7axENxTO5IdfigDwNxMOYKcCGSDvrLIYjLYfqP5W/UrNJvk9yBXomspM+83cgbRJ6rIG2MDxAR7P4Nwvhsg2kOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDyoi3Ri; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDyoi3Ri"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DA11F000FF;
	Tue, 13 Oct 2026 17:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791913898;
	bh=jixoPoWJJbfu0OgrEvqwyxxKyjFAvWY7SUzWXMz0IqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HDyoi3RiXmovlLljJ4+/OAgfS2Kmk/tcl8eGevOu2+D0Zx/p/zGLdDdIr8nio5qkN
	 FaTZKAJ/KDbt9qWAoLAkeigQ1eGkrJz7NH8g54kXoXDEHL1rfALXVXabWwF8iPIoHe
	 ddFBO3stB9JowdaT0+DfJ0yCCkPKK0rHcWqBSzP1WKyKiJ1EP4JbV+qZK8FBtnpROS
	 7V4QK695sFmosxdUvV38tTBP7cza+euwGsrga3kASCzVVVYyypQyV0Z9lBZmESPVUX
	 KdAoUrmjd+452PFSJ4MA+6L1oVi7Cde3g3kPVNOMlFiV3WV4SFLfGYpYLAWbPoPx94
	 edOOks5dP/8yw==
Date: Tue, 13 Oct 2026 18:51:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: introduce
 toshiba,tc9564-reset.yaml
Message-ID: <20261013-stump-reactor-055d05dc5b3a@spud>
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-2-elder@riscstar.com>
 <20261012-shale-rosy-805c49f6c404@spud>
 <492396bc-a0f4-4274-9a7c-21fd5fd886b5@riscstar.com>
 <20261012-numerous-flatworm-9e4cfa659541@spud>
 <325b8836-61a2-4e1c-98e3-92f0a5177f9d@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aEoBfMVhWyayjLCR"
Content-Disposition: inline
In-Reply-To: <325b8836-61a2-4e1c-98e3-92f0a5177f9d@riscstar.com>

--aEoBfMVhWyayjLCR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 08:22:50AM -0500, Alex Elder wrote:
> On 10/12/26 4:22 PM, Conor Dooley wrote:
> > On Mon, Oct 12, 2026 at 02:10:01PM -0500, Alex Elder wrote:
> > > On 10/12/26 1:51 PM, Conor Dooley wrote:
> > > > On Mon, Oct 12, 2026 at 11:43:52AM -0500, Alex Elder wrote:
> > > > > Define the binding for the reset controller functionality present=
 in
> > > > > the Toshiba TC9564 SoC.
> > > > >=20
> > > > > Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> > > > > Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> > > > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > > > ---
> > > > >    .../bindings/reset/toshiba,tc9564-reset.yaml  | 56 +++++++++++=
++++++++
> > > > >    MAINTAINERS                                   |  7 +++
> > > > >    include/dt-bindings/reset/toshiba,tc9564.h    | 26 +++++++++
> > > > >    3 files changed, 89 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/reset/tos=
hiba,tc9564-reset.yaml
> > > > >    create mode 100644 include/dt-bindings/reset/toshiba,tc9564.h
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/reset/toshiba,tc95=
64-reset.yaml b/Documentation/devicetree/bindings/reset/toshiba,tc9564-rese=
t.yaml
> > > > > new file mode 100644
> > > > > index 0000000000000..1908e9539abac
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/reset/toshiba,tc9564-rese=
t.yaml
> > > > > @@ -0,0 +1,56 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/reset/toshiba,tc9564-reset.ya=
ml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Toshiba TC9564 Reset Controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Alex Elder <elder@riscstar.com>
> > > > > +  - Daniel Thompson <daniel@riscstar.com>
> > > > > +
> > > > > +description:
> > > > > +  The Toshiba TC9564 is an SoC accessed by a host system through=
 the
> > > > > +  upstream PCIe port on the PCIe switch it implements.  The swit=
ch
> > > > > +  includes an embedded PCIe endpoint that provides access to var=
ious
> > > > > +  SoC peripherals (including a reset controller) via its BARs.
> > > > > +
> > > > > +  A total of 13 resets are implemented, though two of these are =
not
> > > > > +  controllable.  Access to the reset controller relies on PCIe b=
eing
> > > > > +  functional, so the PCIe reset is assumed to be deasserted.  Si=
milarly,
> > > > > +  the PCIe controller relies on I2C, so the I2C reset is also as=
sumed
> > > > > +  to be deasserted.
> > > > > +
> > > > > +  Reset ids are defined in <dt-bindings/reset/toshiba,tc9564.h>.
> > > > > +
> > > > > +  The reset controller uses registers within the same page as a
> > > > > +  clock controller, so both devices are defined as children of a
> > > > > +  "config" syscon.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: toshiba,tc9564-reset
> > > >=20
> > > > Why does this need to exist as a standalone device, rather than be
> > > > rolled up into the parent syscon node? It doesn't have any resource=
s, so
> > > > it should be doable.
> > >=20
> > > This is along the lines of what Krzysztof has mentioned, and it
> > > seems clear I must be missing something.
> > >=20
> > > > This kind of thing for a syscon is always difficult to review when =
only
> > > > one element is present - where is the rest of the syscon's
> > > > functionality?
> > >=20
> > > The reason a syscon was used was simply for the benefit of
> > > having a shared regmap that the reset, clock, and DWMAC drivers
> > > can use.  All three of those drivers use registers that reside
> > > within a single page of addressible MMIO space.
> >=20
> > What does the dwmac use the region for? I assume it's for some misc
> > register and you don't mean that the dwmac lies within the region?
>=20
> That's right.  There is one register (per DWMAC--there are two)
> that contains one bit (bit 21) that is used to signal that initialization=
 of
> the PMA is done.  We assert reset, set up
> clocks, then deassert, and finally wait for this bit to be set.
> The DWMAC code uses a phandle property to refer to the syscon,
> like:
>     toshiba,config-syscon =3D <&tc9564_config_syscon0 0x1070>
>=20
> So again, the purpose of the syscon was to get the automatic
> regmap for managing the region, which contains registers used
> for distinct purposes.
>=20
> After making the syscon be the parent of both the reset and
> clock nodes, I *removed* the "reg" properties and just defined
> those offsets in the driver.  Maybe that was a mistake.

No, that's typically what happens in the setup I describe below, so
that's not abnormal.

> > There's nothing inherently wrong with the act of using of a syscon here,
> > what I am actually complaining about is how you are using it.
> > In cases where a syscon region contains clock and reset, the typical way
> > we want people to do this is via something like
> >=20
> > syscon@f00 {
> > 	compatible =3D "toshiba,tc9564-bla-syscon", "syscon", "simple-mfd";
> > 	reg =3D <0x0 0x2000>;
> > 	#reset-cells =3D <1>;
> > 	#clock-cells =3D <1>;
> > };
>=20
> In this case it seems I must create a syscon driver that provides
> combined reset and clock functionality.  Is that right?  (This
> series is the result of separating the reset code from the clock
> code in a combined driver.)

There's two ways to do it, depending on what sort of device you have.
If you have a clock controller that also does reset, the preferred thing
to do is something like

clock-controller@f00 {
	compatible =3D "toshiba,tc9564-clk";
	reg =3D <0x0 0x2000>;
	#reset-cells =3D <1>;
	#clock-cells =3D <1>;
};

and in the clock controller driver probe the reset controller driver as
a auxiliary bus device.

You have something else though, because there's assorted other functions
in here, including the dwmac and things you don't use yet. In that case,
I would make a node like

syscon@f00 {
	compatible =3D "toshiba,tc9564-bla-syscon", "syscon";
	reg =3D <0x0 0x2000>;
	#reset-cells =3D <1>;
	#clock-cells =3D <1>;
};

and in the syscon driver use MFD_CELL_NAME() to probe both clock and
reset drivers, and can use device_node_to_regmap(). Your dwmac stuff
(and any other future stuff that needs a syscon reference) can use the
automagic syscon regmap stuff that we've already talked about.

Note, there's no "simple-mfd" here, because you have no child nodes.
The point of "simple-mfd" is to probe those kinds of devices.

> To be honest I don't have a lot of experience with proper use of
> syscons.  I have no problem writing or restructuring the code,
> it just seems I need help knowing what the final structure should
> look like.
>=20
> > because the child node exists for no other reason than to access linux
> > driver probing in the most trivial way. If there's some features that
> > actually need a child node, that's fine, but those will end up being
> > things with significantly more properties or things with competing
> > property use (e.g. if there were devices with buses that need
> > address/size cells).
>=20
> I'm not sure I understand this statement (and that might be part
> of the problem).
>=20
> There are other devices (currently just two DWMACs, plus an
> interrupt controller that generates MSIs for each PCI function)
> that use the reset and clock signals.  I haven't yet
> posted the reworked DWMAC code but I just sent the first version
> of the interrupt driver yesterday.
>   https://lore.kernel.org/lkml/20261012190245.3988619-1-elder@riscstar.co=
m/

Here I am talking about why child nodes aren't correct in your case.
Neither clock nor reset needs anything other than the relevant #cells
property, so the only benefit of a child node over having these in the
syscon node itself are to use the compatible to probe the driver.
Child nodes should only be used when the functions provided by the
syscon have conflicting properties or are very complicated (I would
probably always use a child node for pinctrl for example). It'd also be
reasonable if the functions are reused across devices, but that's
rarely the case with clock or reset controllers (or really anything
that appears in these kinds of "random register regions" in SoCs).

Does that make more sense?

>=20
> > > And I don't know that I can guarantee their probe order.
> >=20
> > I am assuming this is moot, since I am not objecting to using a syscon?
> >=20
> > > There is otherwise no "system controller" that is treated as
> > > a logical entity within the SoC.
> > >=20
> > > What is the proper way for me to represent this?  It's fairly
> > > simple; and I mainly want to ensure all three of those drivers
> > > can safely access their addresses.
> >=20
> > What else does this region actually contain?
>=20
> At this point I've described everything we now use.  Two
> registers control a set of resets; two registers enable and
> disable a set of clocks; and two registers each contain a
> bit to signal readiness of a DWMAC device.
>=20
> There are other registers in this region, but at this time
> we don't use them.
>=20
> 					-Alex
>=20
> >=20
> > Cheers,
> > Conor.
> >=20
> > > > > +
> > > > > +  "#reset-cells":
> > > > > +    const: 1
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - "#reset-cells"
> > > > > +
> > > > > +unevaluatedProperties: false
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    #include <dt-bindings/reset/toshiba,tc9564.h>
> > > > > +
> > > > > +    syscon@0 {
> > > > > +        compatible =3D "syscon", "simple-mfd";
> > > > > +        reg =3D <0x0 0x2000>;
> > > > > +
> > > > > +        reset {
> > > > > +            compatible =3D "toshiba,tc9564-reset";
> > > > > +            #reset-cells =3D <1>;
> > > > > +        };
> > > > > +    };
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index 252b6d7ee1638..d0eb44079fe17 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -28180,6 +28180,13 @@ S:	Maintained
> > > > >    F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
> > > > >    F:	drivers/misc/tc9564-pci.c
> > > > > +TOSHIBA TC9564 RESET DRIVER
> > > > > +M:	Alex Elder <elder@kernel.org>
> > > > > +M:	Daniel Thompson <danielt@kernel.org>
> > > > > +S:	Maintained
> > > > > +F:	Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.=
yaml
> > > > > +F:	include/dt-bindings/reset/toshiba,tc9564.h
> > > > > +
> > > > >    TOSHIBA WMI HOTKEYS DRIVER
> > > > >    M:	Azael Avalos <coproscefalo@gmail.com>
> > > > >    L:	platform-driver-x86@vger.kernel.org
> > > > > diff --git a/include/dt-bindings/reset/toshiba,tc9564.h b/include=
/dt-bindings/reset/toshiba,tc9564.h
> > > > > new file mode 100644
> > > > > index 0000000000000..5fcc9a06d4ff6
> > > > > --- /dev/null
> > > > > +++ b/include/dt-bindings/reset/toshiba,tc9564.h
> > > > > @@ -0,0 +1,26 @@
> > > > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > > > +
> > > > > +/*
> > > > > + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All ri=
ghts reserved.
> > > > > + */
> > > > > +
> > > > > +#ifndef __RESET_TOSHIBA_TC9564_H__
> > > > > +#define __RESET_TOSHIBA_TC9564_H__
> > > > > +
> > > > > +/* Reset IDs */
> > > > > +
> > > > > +#define RESET_MCU		0
> > > > > +#define RESET_MCU1		1
> > > > > +#define RESET_MSIGEN		2
> > > > > +#define RESET_INTC		3
> > > > > +#define RESET_UART		4
> > > > > +
> > > > > +#define RESET_MAC0_MAC		5
> > > > > +#define RESET_MAC0_PMA		6
> > > > > +#define RESET_MAC0_XPCS		7
> > > > > +
> > > > > +#define RESET_MAC1_MAC		8
> > > > > +#define RESET_MAC1_PMA		9
> > > > > +#define RESET_MAC1_XPCS		10
> > > > > +
> > > > > +#endif /* __RESET_TOSHIBA_TC9564_H__*/
> > > > > --=20
> > > > > 2.53.0
> > > > >=20
> > >=20
>=20

--aEoBfMVhWyayjLCR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5vpgAKCRB4tDGHoIJi
0qDgAQCi1BkKfxvPHFsNhkLUYm8Hfxbx46QckZMWnsacoC5txAEA6ZAkBX2HRm07
DIfPZalZrf0mg/yyQwDwNfEGBwfFkQc=
=p1Wa
-----END PGP SIGNATURE-----

--aEoBfMVhWyayjLCR--
