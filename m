Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCEC31F9BD;
	Mon,  7 Sep 2026 18:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788805723; cv=none; b=KidRAyWXZpSrcWv5MK29UN/HZJWzuMnJCz4cwm5PBq9z6xL0ey/bs0FTPdejlPnJgeinsXyQ+/ptmR9qn9cSrnW8TzO0O6fnvFSvwu8InR2WhpVspK+H+TfpSYEv0WuBx0guYqbm8b9L76WoT8RKr6m9nbuwv6t2DThpLWEOXvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788805723; c=relaxed/simple;
	bh=gxWGl/O5kttUn+rG/C+J7XKGOWSzlvIVHE18WuZBmh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAr8R5WO4s8zlA2avAcAj2OjS+QhMEqh+dRm02N55mHiIhNnhu+14gfrJ3ZS7tWnLGFuhq5TpjJUVIix/sKQx7vFG5pqU48PdkQM4w/eEssluYEMewQw9OevNnhxZ+dlSViNG3LZwkegLowv8rJDo5046WvcWqwSkboNNTFgmhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7yd/yx9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7yd/yx9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC5F1F00A3A;
	Mon,  7 Sep 2026 18:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788805721;
	bh=f6w4YnHjEwn+2r9Z8eS6wqM5ZP8JasarSuAn2qAGbOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b7yd/yx9s6T70eYgSsz1oMnD+JgNfjcMTwfqHUKwf0Mx2JTU+FY/vZYalBtYNxIP6
	 FHsoP2Ff2SYosOgeG78c80/gV6opZmn1OJPAE2kpiMGthAoadukYWE1KbNruQHFn/j
	 +isS/VSh5a1GV4EhCmG1QM9ReAVpwErzTH9XL4KWZCQzI96G4rZ92mqfQ9+mDM1B9Q
	 +itzW9sch2LRcUy6qXifPYI+4BZkgukKky97QQoKxN6qF+oU5l1hvWALY4YgXxQxVe
	 4TYkubCWsAjy2tOfrZCfPakiKS/7017xvzJpRK6NiAZdUBDXQoz/v1PALyQY+mGShs
	 6ffNzxoxnx0kg==
Date: Mon, 7 Sep 2026 19:28:36 +0100
From: Conor Dooley <conor@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/4] dt-bindings: mfd: x-powers: Describe AC200
 functions
Message-ID: <20260907-tipping-clique-47e2a3385336@spud>
References: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
 <20260903-submit-ac200-mfd-v9-3-6b7ed278989c@gmail.com>
 <20260904-overpass-clumsy-8ccdd5d4ca0e@spud>
 <CADvTj4qKxyPZMLBZgpNMMxkFn09MUCNEc9nLva-j=24C_Zg-nw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+rVKRCa3gPca8MxN"
Content-Disposition: inline
In-Reply-To: <CADvTj4qKxyPZMLBZgpNMMxkFn09MUCNEc9nLva-j=24C_Zg-nw@mail.gmail.com>

--+rVKRCa3gPca8MxN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2026 at 01:06:08PM -0400, James Hilliard wrote:
> On Fri, Sep 4, 2026 at 9:50=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Thu, Sep 03, 2026 at 02:09:42PM -0600, James Hilliard wrote:
> > > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> > >
> > > Describe the AC200 audio codec and TV encoder as child nodes of the
> > > shared I2C register provider. Keep their analog supplies on the funct=
ion
> > > consumers and describe the TV encoder display graph and optional band=
gap
> > > calibration cell.
> > >
> > > Add the shared interrupt-controller properties and interrupt numbers =
needed
> > > by the TV encoder. The Ethernet PHY remains represented on its primar=
y MDIO
> > > bus and is therefore not an MFD child.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >  .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 136 +++++++++++=
++++++++++
> > >  MAINTAINERS                                        |   1 +
> > >  include/dt-bindings/mfd/x-powers,ac200.h           |  13 ++
> > >  3 files changed, 150 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yam=
l b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > > index ca7a910b2c73..935dc07138cb 100644
> > > --- a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > > +++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > > @@ -28,15 +28,114 @@ properties:
> > >        be 24 or 27 MHz, matching the rates encoded by the documented =
EPHY clock
> > >        selector.
> > >
> > > +  interrupts:
> > > +    maxItems: 1
> > > +    description:
> > > +      The shared open-drain INTB output for the TV encoder, Ethernet=
 PHY and
> > > +      RTC interrupts.
> > > +
> > > +  interrupt-controller: true
> > > +
> > > +  '#interrupt-cells':
> > > +    const: 1
> > > +    description:
> > > +      The interrupt number, as defined in
> > > +      include/dt-bindings/mfd/x-powers,ac200.h.
> > > +
> > > +  codec:
> > > +    type: object
> > > +    $ref: /schemas/sound/dai-common.yaml#
> > > +    unevaluatedProperties: false
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        const: x-powers,ac200-codec
> > > +
> > > +      '#sound-dai-cells':
> > > +        const: 0
> > > +
> > > +      ac-ldoin-supply:
> > > +        description: The 3.3 V supply for the audio codec LDO input.
> > > +
> > > +    required:
> > > +      - compatible
> > > +      - '#sound-dai-cells'
> > > +      - ac-ldoin-supply
> > > +
> > > +  tv-encoder:
> > > +    type: object
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        const: x-powers,ac200-tve
> > > +
> > > +      interrupts:
> > > +        maxItems: 1
> > > +        description: Cable detection interrupt.
> >
> > Given the example, this looks like a hack.
> > Is this mfd actually an interrupt controller, or is that just part of
> > this hack too?
>=20
> The AC200 has separate TV encoder, Ethernet PHY and RTC status and
> enable bits which are multiplexed onto its shared INTB output, so the
> intent was to represent that demultiplexer as an interrupt controller.
>=20
> I notice that the example's tv-encoder interrupts property inherits
> interrupt-parent =3D <&pio> rather than explicitly referencing the AC200
> interrupt domain. Is that incorrect interrupt relationship what looks
> like a hack here, or do you also object to representing the AC200

No, I noticed the lack of an explicit parent but attributed it to a
mistake. The define used in the child node, and the interrupt properties
in the parent are why I considered it a hack - the device looked like it
was pointing to itself as it's own interrupt parent. How would this work
for the rtc, since that is implemented without a child node?

Personally I would just implement these devices using IRQF_SHARED.

> interrupt demultiplexer as an interrupt controller?
>=20
> > Quite frankly, I am not really sure why either the tv-encoder or codec
> > have dedicated child nodes, they don't appear to have conflicting
> > properties.
>=20
> Do you mean that the DT properties for both functions should be folded
> into the AC200 parent node, while the MFD driver still creates separate
> codec and TV encoder platform devices?
>=20
> Lee requested at least two MFD children in this series, so I want to
> distinguish the Linux MFD cells from whether those cells need dedicated
> firmware child nodes.

I don't see Lee requesting that they be in the devicetree though, just
that there are two mfd children. mfd_cell would (IMO) qualify for that.

I don't see anything here that'd be problematic in terms of folding the
codec and encodering into the parent mfd device and using mfd_cell, given
the phy is not represented here.

>=20
> > Additionally, why is this not part of patch 1? Add the binding in a
> > complete state from the get-go. On that basis, at least,
> > pw-bot: changes-requested
>=20
> Do you want patches 1 and 3 combined into one complete binding patch,
> while retaining separate implementation commits for the base provider
> and the MFD cells?

Correct.

> > > +
> > > +      tv-vcc-supply:
> > > +        description: The 3.3 V supply for the composite-video DAC.

Are these genuinely different 3.3 V supplies btw? Or are you just
representing them as two different ones because of different device
nodes using them?

Cheers,
Conor.

> > > +
> > > +      nvmem-cells:
> > > +        maxItems: 1
> > > +
> > > +      nvmem-cell-names:
> > > +        items:
> > > +          - const: bandgap
> > > +
> > > +      ports:
> > > +        $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +        properties:
> > > +          port@0:
> > > +            $ref: /schemas/graph.yaml#/properties/port
> > > +            description: Input from the display pipeline, carrying C=
CIR656.
> > > +
> > > +          port@1:
> > > +            $ref: /schemas/graph.yaml#/properties/port
> > > +            description: Output to the composite-video connector.
> > > +
> > > +        required:
> > > +          - port@0
> > > +          - port@1
> > > +
> > > +    required:
> > > +      - compatible
> > > +      - interrupts
> > > +      - tv-vcc-supply
> > > +      - ports
> > > +
> > > +    dependencies:
> > > +      nvmem-cells: [ nvmem-cell-names ]
> > > +      nvmem-cell-names: [ nvmem-cells ]
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > >    - clocks
> > >
> > > +allOf:
> > > +  - if:
> > > +      required:
> > > +        - tv-encoder
> > > +    then:
> > > +      required:
> > > +        - interrupts
> > > +        - interrupt-controller
> > > +        - '#interrupt-cells'
> > > +
> > > +dependencies:
> > > +  interrupt-controller: [ '#interrupt-cells', interrupts ]
> > > +  '#interrupt-cells': [ interrupt-controller ]
> > > +
> > >  additionalProperties: false
> > >
> > >  examples:
> > >    - |
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +    #include <dt-bindings/mfd/x-powers,ac200.h>
> > > +
> > >      i2c {
> > >          #address-cells =3D <1>;
> > >          #size-cells =3D <0>;
> > > @@ -45,6 +144,43 @@ examples:
> > >              compatible =3D "x-powers,ac200";
> > >              reg =3D <0x10>;
> > >              clocks =3D <&pwm 5>;
> > > +            interrupt-parent =3D <&pio>;
> > > +            interrupts =3D <1 20 IRQ_TYPE_LEVEL_LOW>;
> > > +            interrupt-controller;
> > > +            #interrupt-cells =3D <1>;
> > > +
> > > +            codec {
> > > +                compatible =3D "x-powers,ac200-codec";
> > > +                #sound-dai-cells =3D <0>;
> > > +                ac-ldoin-supply =3D <&reg_aldo2>;
> > > +            };
> > > +
> > > +            tv-encoder {
> > > +                compatible =3D "x-powers,ac200-tve";
> > > +                interrupts =3D <AC200_IRQ_TVE>;
> > > +                tv-vcc-supply =3D <&reg_aldo2>;
> > > +
> > > +                ports {
> > > +                    #address-cells =3D <1>;
> > > +                    #size-cells =3D <0>;
> > > +
> > > +                    port@0 {
> > > +                        reg =3D <0>;
> > > +
> > > +                        tve_in: endpoint {
> > > +                            remote-endpoint =3D <&tcon_out_tve>;
> > > +                        };
> > > +                    };
> > > +
> > > +                    port@1 {
> > > +                        reg =3D <1>;
> > > +
> > > +                        tve_out: endpoint {
> > > +                            remote-endpoint =3D <&composite_in>;
> > > +                        };
> > > +                    };
> > > +                };
> > > +            };
> > >          };
> > >      };
> > >  ...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 1d03b0060bda..8a48f6a1e593 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -29511,6 +29511,7 @@ L:    linux-sunxi@lists.linux.dev
> > >  S:   Maintained
> > >  F:   Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > >  F:   drivers/mfd/ac200.c
> > > +F:   include/dt-bindings/mfd/x-powers,ac200.h
> > >
> > >  X-POWERS AXP288 PMIC DRIVERS
> > >  M:   Hans de Goede <hansg@kernel.org>
> > > diff --git a/include/dt-bindings/mfd/x-powers,ac200.h b/include/dt-bi=
ndings/mfd/x-powers,ac200.h
> > > new file mode 100644
> > > index 000000000000..cc59e2ab4912
> > > --- /dev/null
> > > +++ b/include/dt-bindings/mfd/x-powers,ac200.h
> > > @@ -0,0 +1,13 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > +/*
> > > + * Interrupt numbers of the X-Powers AC200 interrupt controller.
> > > + */
> > > +
> > > +#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > > +#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > > +
> > > +#define AC200_IRQ_TVE                        0
> > > +#define AC200_IRQ_EPHY                       1
> > > +#define AC200_IRQ_RTC                        2
> > > +
> > > +#endif /* _DT_BINDINGS_MFD_X_POWERS_AC200_H */
> > >
> > > --
> > > 2.53.0
> > >

--+rVKRCa3gPca8MxN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap8CVAAKCRB4tDGHoIJi
0l+3AQCizxXz1TVf1sGmTl1zVkET15gQ9NxHZ9Sp1e40iN6W4AEAsvsW6JBUS8gf
gF+FSKpnJpMkvvWElhEKyTqXYGxQfQ8=
=bQlx
-----END PGP SIGNATURE-----

--+rVKRCa3gPca8MxN--
