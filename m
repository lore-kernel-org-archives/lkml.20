Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694070;
	b=qwMY03GYHUziOapQQbD7kN/KyzfdojCfChPG7AwOIvJ88QPbSbzSVDviAlVEpVxNsILy
	 UCaOnTM5uTbEj+DpNy2xFyYmtjgnkrhnIsiDsPfIuM7wxg9wlaSWMb37OstqVU1pthm9M
	 MqUClbs5XkhckdvnsqVnD3MJclVUzqdcC/aTCBQhmaBjLDTFRVT0qEEnXelWCqBzMXlfp
	 Wg9NFjyZx8hWky0k45iTQ93by2Qyh4Y7UlRcynF+qZpnyUrsmW/JmUK2FZ7vbgPn/nSfR
	 v1sWyJk+uQxZKOeofGXRNfXTtEXS1ne4kAXbDxu425IFl8jgO3iIOFDsF0QhGo3sDpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694070;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PdkRaccD1btVOH0LBu6sQ5YBHpxN2f5z22x9TBYOydk=;
	b=N5seR3daF54LEJuJ/wP9KHytHBaCm0PLqvfpJO4yhpnyzzxuE8Ei7zpuPu7OG8PGPNn6
	 ywqjFrH69MuJnZ0feIsOkx0JLNOEcAQg2zmzjHFK5FB29Qvdb0GzAGXgHcRqHVSoPfLJM
	 giSZYqnoq+GZLiwTHaGqLrkV/qHzGjUwOV6faccY0oSphtlbJzLZb+tlzsy+Xu33a78sf
	 5eOgnPAViwQz4fdfhKCtY/Y//87a9KTnVHZCrvcK0PRvYqxlLJj6ALbde/e2QtWaH3z4e
	 E/jmdB5lRpjhV3LhdL8ykDEHaxBufuvSWLb6oN/eN8e0IRUK2UEingW+pH4yZKg1yag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQzstwxQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A1160A2635;
	Thu, 22 Oct 2026 18:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQzstwxQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846921F01829;
	Thu, 22 Oct 2026 18:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792694069;
	bh=PdkRaccD1btVOH0LBu6sQ5YBHpxN2f5z22x9TBYOydk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VQzstwxQauE/bWiwmh+0QiBkB9soaW5z0ayO9tLQCNDZ0gvkIf5yapSuHnUyLGhAx
	 mUfKib5lQvx2ivSwWcXsGfHPQ8Q2JeCIKS6YvndjemkH2KKFvdaLjSPJaGyzGodFlS
	 PXAVz1Et9DnS5A3EQXJe9OpKkg2GHmoOJnIiih2fU6ZPG4ituaOHvWOZpVyt/tlG3D
	 0xtcga462Gg59c90mTPksjQUPejxATcca12Z6zaCOoN2Qz4pnbYPpxPHTz5dFkFQfr
	 V7lZVvNNGo37fN/2TyfvIWZ2BIezEw51hK6yd4a5S00zouOOt0xVn3W5oDmeD+xQV8
	 wnCbQCW7gEKwQ==
Date: Thu, 22 Oct 2026 19:34:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: introduce
 toshiba,tc9564-reset.yaml
Message-ID: <20261022-clench-drum-5907c17cb8d2@spud>
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-2-elder@riscstar.com>
 <20261012-shale-rosy-805c49f6c404@spud>
 <492396bc-a0f4-4274-9a7c-21fd5fd886b5@riscstar.com>
 <20261012-numerous-flatworm-9e4cfa659541@spud>
 <325b8836-61a2-4e1c-98e3-92f0a5177f9d@riscstar.com>
 <20261013-stump-reactor-055d05dc5b3a@spud>
 <b904f4ea-e198-488e-a6dd-476d744593da@riscstar.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xzm8Ckc8K3fo8G/l"
Content-Disposition: inline
In-Reply-To: <b904f4ea-e198-488e-a6dd-476d744593da@riscstar.com>

--xzm8Ckc8K3fo8G/l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 02:50:41PM -0500, Alex Elder wrote:
> On 10/13/26 12:51 PM, Conor Dooley wrote:
> > On Tue, Oct 13, 2026 at 08:22:50AM -0500, Alex Elder wrote:
> > > On 10/12/26 4:22 PM, Conor Dooley wrote:
> > > > On Mon, Oct 12, 2026 at 02:10:01PM -0500, Alex Elder wrote:
> > > > > On 10/12/26 1:51 PM, Conor Dooley wrote:
> > > > > > On Mon, Oct 12, 2026 at 11:43:52AM -0500, Alex Elder wrote:
> > > > > > > Define the binding for the reset controller functionality pre=
sent in
> > > > > > > the Toshiba TC9564 SoC.
> > > > > > >=20
> > > > > > > Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> > > > > > > Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> > > > > > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > > > > > ---
>=20
> Finally back to looking at this again.  Sorry for the delay.
>=20
> > > > > > >     .../bindings/reset/toshiba,tc9564-reset.yaml  | 56 ++++++=
+++++++++++++
> > > > > > >     MAINTAINERS                                   |  7 +++
> > > > > > >     include/dt-bindings/reset/toshiba,tc9564.h    | 26 ++++++=
+++
> > > > > > >     3 files changed, 89 insertions(+)
> > > > > > >     create mode 100644 Documentation/devicetree/bindings/rese=
t/toshiba,tc9564-reset.yaml
> > > > > > >     create mode 100644 include/dt-bindings/reset/toshiba,tc95=
64.h
> > > > > > >=20
> > > > > > > diff --git a/Documentation/devicetree/bindings/reset/toshiba,=
tc9564-reset.yaml b/Documentation/devicetree/bindings/reset/toshiba,tc9564-=
reset.yaml
> > > > > > > new file mode 100644
> > > > > > > index 0000000000000..1908e9539abac
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/reset/toshiba,tc9564-=
reset.yaml
> > > > > > > @@ -0,0 +1,56 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/reset/toshiba,tc9564-rese=
t.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: Toshiba TC9564 Reset Controller
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Alex Elder <elder@riscstar.com>
> > > > > > > +  - Daniel Thompson <daniel@riscstar.com>
> > > > > > > +
> > > > > > > +description:
> > > > > > > +  The Toshiba TC9564 is an SoC accessed by a host system thr=
ough the
> > > > > > > +  upstream PCIe port on the PCIe switch it implements.  The =
switch
> > > > > > > +  includes an embedded PCIe endpoint that provides access to=
 various
> > > > > > > +  SoC peripherals (including a reset controller) via its BAR=
s.
> > > > > > > +
> > > > > > > +  A total of 13 resets are implemented, though two of these =
are not
> > > > > > > +  controllable.  Access to the reset controller relies on PC=
Ie being
> > > > > > > +  functional, so the PCIe reset is assumed to be deasserted.=
  Similarly,
> > > > > > > +  the PCIe controller relies on I2C, so the I2C reset is als=
o assumed
> > > > > > > +  to be deasserted.
> > > > > > > +
> > > > > > > +  Reset ids are defined in <dt-bindings/reset/toshiba,tc9564=
=2Eh>.
> > > > > > > +
> > > > > > > +  The reset controller uses registers within the same page a=
s a
> > > > > > > +  clock controller, so both devices are defined as children =
of a
> > > > > > > +  "config" syscon.
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    const: toshiba,tc9564-reset
> > > > > >=20
> > > > > > Why does this need to exist as a standalone device, rather than=
 be
> > > > > > rolled up into the parent syscon node? It doesn't have any reso=
urces, so
> > > > > > it should be doable.
> > > > >=20
> > > > > This is along the lines of what Krzysztof has mentioned, and it
> > > > > seems clear I must be missing something.
> > > > >=20
> > > > > > This kind of thing for a syscon is always difficult to review w=
hen only
> > > > > > one element is present - where is the rest of the syscon's
> > > > > > functionality?
> > > > >=20
> > > > > The reason a syscon was used was simply for the benefit of
> > > > > having a shared regmap that the reset, clock, and DWMAC drivers
> > > > > can use.  All three of those drivers use registers that reside
> > > > > within a single page of addressible MMIO space.
> > > >=20
> > > > What does the dwmac use the region for? I assume it's for some misc
> > > > register and you don't mean that the dwmac lies within the region?
> > >=20
> > > That's right.  There is one register (per DWMAC--there are two)
> > > that contains one bit (bit 21) that is used to signal that initializa=
tion of
> > > the PMA is done.  We assert reset, set up
> > > clocks, then deassert, and finally wait for this bit to be set.
> > > The DWMAC code uses a phandle property to refer to the syscon,
> > > like:
> > >      toshiba,config-syscon =3D <&tc9564_config_syscon0 0x1070>
> > >=20
> > > So again, the purpose of the syscon was to get the automatic
> > > regmap for managing the region, which contains registers used
> > > for distinct purposes.
> > >=20
> > > After making the syscon be the parent of both the reset and
> > > clock nodes, I *removed* the "reg" properties and just defined
> > > those offsets in the driver.  Maybe that was a mistake.
> >=20
> > No, that's typically what happens in the setup I describe below, so
> > that's not abnormal.
>=20
> Thank you for confirming this.
>=20
> > > > There's nothing inherently wrong with the act of using of a syscon =
here,
> > > > what I am actually complaining about is how you are using it.
> > > > In cases where a syscon region contains clock and reset, the typica=
l way
> > > > we want people to do this is via something like
> > > >=20
> > > > syscon@f00 {
> > > > 	compatible =3D "toshiba,tc9564-bla-syscon", "syscon", "simple-mfd";
> > > > 	reg =3D <0x0 0x2000>;
> > > > 	#reset-cells =3D <1>;
> > > > 	#clock-cells =3D <1>;
> > > > };
> > >=20
> > > In this case it seems I must create a syscon driver that provides
> > > combined reset and clock functionality.  Is that right?  (This
> > > series is the result of separating the reset code from the clock
> > > code in a combined driver.)
> >=20
> > There's two ways to do it, depending on what sort of device you have.
> > If you have a clock controller that also does reset, the preferred thing
> > to do is something like
> >=20
> > clock-controller@f00 {
> > 	compatible =3D "toshiba,tc9564-clk";
> > 	reg =3D <0x0 0x2000>;
> > 	#reset-cells =3D <1>;
> > 	#clock-cells =3D <1>;
> > };
> >=20
> > and in the clock controller driver probe the reset controller driver as
> > a auxiliary bus device.
>=20
> My last version combined these two but did not make the
> reset an auxiliary device.
>=20
> > You have something else though, because there's assorted other functions
> > in here, including the dwmac and things you don't use yet. In that case,
> > I would make a node like
> >=20
> > syscon@f00 {
> > 	compatible =3D "toshiba,tc9564-bla-syscon", "syscon";
> > 	reg =3D <0x0 0x2000>;
> > 	#reset-cells =3D <1>;
> > 	#clock-cells =3D <1>;
> > };
> >=20
> > and in the syscon driver use MFD_CELL_NAME() to probe both clock and
> > reset drivers, and can use device_node_to_regmap(). Your dwmac stuff
> > (and any other future stuff that needs a syscon reference) can use the
> > automagic syscon regmap stuff that we've already talked about.
>=20
> This sounds like the way to go.
>=20
> > Note, there's no "simple-mfd" here, because you have no child nodes.
> > The point of "simple-mfd" is to probe those kinds of devices.
>=20
> OK.  Let's see if I understand what you're saying.
>=20
> This approach uses:
> - A single top-level syscon driver (under drivers/mfd?) which
>   probes based on a devicetree node compatible string ("toshiba,...")

I'm not sure if it needs to be under mfd (there's some in soc/foo too)
but I guess so.

> - That compatible string will require a (fairly simple) devicetree
>   binding
> - That driver initializes a regmap which will cover the space
>   defined in its devicetree node (<0x0 0x2000>)

I don't think the driver has to even do this at all, e.g.
sg2044-topsys.c doesn't. Whenever someone requests the regmap it will
get created automatically since you're a syscon.

> - That driver has an array that uses MFD_CELL_NAME() to define
>   cells for clock and reset
> - That driver will call some form of mfd_add_devices() using the
>   MFD cell array
> - The stmmac driver can refer to this device node with a phandle
>   property to specify the syscon that provides the regmap it needs
>=20
> And then, for the clock and reset devices:
> - A clock platform driver (under drivers/clk) will match based
>   on the driver name (matching what's supplied by MFD_CELL_NAME())
> - A reset driver will be similar (under drivers/reset)
> - As you mentioned, these drivers get at the regmap they need using
>   device_node_to_regmap() (or dev_get_regmap() or something)

I think "regmap =3D device_node_to_regmap(pdev->dev.parent->of_node);" is
the correct way to do it.

> - And despite these being separate drivers (from the syscon driver)
>   they don't have devicetree nodes, and the syscon node itself
>   defines the clock-controller and reset-controller properties.
>=20
> Does that sound right?  Am I missing anything?

Sounds about right.

>=20
>=20
> > > To be honest I don't have a lot of experience with proper use of
> > > syscons.  I have no problem writing or restructuring the code,
> > > it just seems I need help knowing what the final structure should
> > > look like.
> > >=20
> > > > because the child node exists for no other reason than to access li=
nux
> > > > driver probing in the most trivial way. If there's some features th=
at
> > > > actually need a child node, that's fine, but those will end up being
> > > > things with significantly more properties or things with competing
> > > > property use (e.g. if there were devices with buses that need
> > > > address/size cells).
> > >=20
> > > I'm not sure I understand this statement (and that might be part
> > > of the problem).
> > >=20
> > > There are other devices (currently just two DWMACs, plus an
> > > interrupt controller that generates MSIs for each PCI function)
> > > that use the reset and clock signals.  I haven't yet
> > > posted the reworked DWMAC code but I just sent the first version
> > > of the interrupt driver yesterday.
> > >    https://lore.kernel.org/lkml/20261012190245.3988619-1-elder@riscst=
ar.com/
> >=20
> > Here I am talking about why child nodes aren't correct in your case.
> > Neither clock nor reset needs anything other than the relevant #cells
> > property, so the only benefit of a child node over having these in the
> > syscon node itself are to use the compatible to probe the driver.
>=20
> Yes I now see what you mean.  By using a MFD model the child device
> is just a function provided by the top-level syscon device.  The
> driver code still benefits from the device model, but the subordinate
> devices match based on the device name and not a devicetree compatible
> string.  And no nodes exposed in devicetree are needed for the clock
> and reset.
>=20
> > Child nodes should only be used when the functions provided by the
> > syscon have conflicting properties or are very complicated (I would
> > probably always use a child node for pinctrl for example). It'd also be
> > reasonable if the functions are reused across devices, but that's
> > rarely the case with clock or reset controllers (or really anything
> > that appears in these kinds of "random register regions" in SoCs).
> >=20
> > Does that make more sense?
>=20
> Yes, it definitely helps a lot.  I realize I might not have every
> detail right, but I feel much better about how to organize this
> (and presumably this also addresses what Krzysztof was asking for).

Yeah presumably!

Cheers,
Conor.

--xzm8Ckc8K3fo8G/l
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatpXMQAKCRB4tDGHoIJi
0tDZAQDNoz1ST1W6mKcr6UWcD+2kUJGWeafT0Fy12j/m38MKzgD8D631WfDzyKD/
4D4ACb7geIEXoFyGqAX36FWdXods1gY=
=9MND
-----END PGP SIGNATURE-----

--xzm8Ckc8K3fo8G/l--
