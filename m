Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565F048F034;
	Tue, 15 Sep 2026 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480206; cv=none; b=BBxlQux7CGVYr9JXLj0Oh6P2+EmzLWobb2XphKEDSguCicCITJvx349hvWFKRZ42oAruM9MrKqX8f4qYbyot78Grjnwui/0df5GRSv3u4+JaPJXe/4E55nzcf7v9T9rwNiIxuXJsrWzTcqB9woA9/mK9NUAm1kq94jZn3duVM94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480206; c=relaxed/simple;
	bh=eWg42BIRG6Bu7tMwowXXZNtB9BK94kzX8yPpptRQstw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIegeEJJcAhurx+xtmoBJSxDYtzy/0/dogvYuA5um+723pWzqNRlbuTQv4wEqBdaq9KePkC/r9zrGYOB8GHzdq1iGIwdlIwMl/oc6h3U+BAtU7pyhloI4PYC5D00qMTCvXUlE/xw7QShSUikvY9LshDxKOOeO6ZCyIUzqB8VJ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gb/dzNSb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gb/dzNSb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A9A1F0089B;
	Tue, 15 Sep 2026 13:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789480203;
	bh=l4w5RKVRlbPa+YGgJMeLimc0pLRtW9x8qCj8U7smlTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gb/dzNSbw/E7aSlvr1N/XFmhhZUb9oAxQQgMoR+zT7b3DRRXoqv6cA//+MLnocwRf
	 ZnFbEGmn58IHs+KhsGBzzuY7Cr8izd2ZDcprXop13uZ6hTdfUBu2orroHjM93tl7CH
	 w5dcNr/dWfcO5jlsOCwFeiIpHRPrPx4jQpsDlgXWNRgHPK+q363eEIP4E+3i4ukMMN
	 y96TKlEjVUwzfxGj0i6qottcpkQoVhBklbLfH1gHXRFV0CWTDa7k3PIbUgJjfs+N5K
	 b6VFZH/TRbFPDcWxiVgn+Qe646lSZLYSKxNP41E3i025Frcx9nsyyguATZBQqwnERl
	 Ih+v0nupTTdIg==
Date: Tue, 15 Sep 2026 14:49:59 +0100
From: Conor Dooley <conor@kernel.org>
To: rahul sharma <r-sharma3@ti.com>
Cc: peda@lysator.liu.se, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, vigneshr@ti.com
Subject: Re: Re: [PATCH 1/2] dt-bindings: mux-controller: ti: add binding for
 event mux router
Message-ID: <20260915-shredder-liver-219bbc18dd18@spud>
References: <20260828100615.1700223-1-r-sharma3@ti.com>
 <20260828100615.1700223-2-r-sharma3@ti.com>
 <20260828-goes-scrawny-a5cf40c9514d@spud>
 <bacf61ea-91b1-454c-97aa-8c6e4ca07b16@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q19jdnk1Fmhnoc0H"
Content-Disposition: inline
In-Reply-To: <bacf61ea-91b1-454c-97aa-8c6e4ca07b16@ti.com>

--Q19jdnk1Fmhnoc0H
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 06:10:45PM +0530, rahul sharma wrote:
> Hi Conor,
>=20
> Thanks for reviewing.
> Apologies for the delay in responding.
>=20
> On 28/08/26 21:57, Conor Dooley wrote:
> > On Fri, Aug 28, 2026 at 03:36:14PM +0530, Rahul Sharma wrote:
> > > Add binding for the event mux router of TI's K3 based SoC AM62L.
> > >=20
> > > The TI K3 mux routers which route the GPIO input events or Time-Sync
> > > events b/w peripherals instead of routing to a CPU.
> > >=20
> > > Refer Section 10.2 and 10.2.1 of https://www.ti.com/lit/pdf/sprujb4
> > >=20
> > > Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
> > > ---
> > >   .../mux/ti,am62l-event-mux-router.yaml        | 79 ++++++++++++++++=
+++
> > >   1 file changed, 79 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/mux/ti,am62l-e=
vent-mux-router.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/mux/ti,am62l-event-mux=
-router.yaml b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-rou=
ter.yaml
> > > new file mode 100644
> > > index 000000000000..a5ba7f78a156
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router=
=2Eyaml
> > > @@ -0,0 +1,79 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mux/ti,am62l-event-mux-router.yam=
l#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: TI Event Multiplexer on K3 SoCs
> > > +
> > > +maintainers:
> > > +  - Rahul Sharma <r-sharma3@ti.com>
> > > +
> > > +description:
> > > +  The TI K3 mux routers routes the GPIO input events or Time
> > > +  Sync events between peripherals instead of routing to a CPU.
> > > +
> > > +allOf:
> > > +  - $ref: mux-controller.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ti,am62l-event-mux-router
> > > +
> > > +  reg:
> > > +    description: Register base address and size.
> > > +    maxItems: 1
> > > +
> > > +  '#mux-control-cells':
> > > +    const: 1
> > > +    description:
> > > +      Number of cells in a mux control specifier. This should be 1.
> > > +      The cell specifies which mux control to use (0-based index).
> > > +
> > > +  ti,reg-mask-val:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > +    items:
> > > +      items:
> > > +        - description: Register offset (relative to reg base)
> > > +        - description: Bit mask for the mux control bits
> > > +        - description: Value to write when mux is active (state 1)
> > > +    minItems: 1
> > > +    description: |
> > > +      Array of triplets specifying register offset, mask, and value =
for each
> > > +      mux control. Each triplet contains:
> > > +      - register offset (relative to reg base)
> > > +      - bit mask for the mux control bits
> > > +      - value to write when mux is active (state 1)
> >=20
> > You have a device-specific compatible, why do you need this? If the
> > active setting depends on the device or w/e, why can that not come from
> > a mux-control-cell?
>=20
> This is a boot-time/board-fixed routing decision, not a runtime-selectable
> mux that any driver ever calls mux_control_select() on.

2/3 of this property appears to describe the register layout of the
device, that's not affected by the board or some boot time decision.

>=20
> Please refer below link for the IP block diagram:
> https://github.com/lucifer-9852/linux/commit/aed1746e411a9f0ad7824f4e4a71=
21e6f56a4ef2
>=20
> For detailed view of IP you can refer Section 10.2 and 10.2.1 of TRM
> https://www.ti.com/lit/pdf/sprujb4
>=20
> That's precisely why we added ti,reg-mask-val as a controller-side proper=
ty
> rather than sourcing the value from a consumer's mux-control-cell: there =
is
> no runtime consumer selecting between states, so the routing has to be fu=
lly
> described on the provider.

Why do you have #mux-control-cells if there are no consumers? I don't
understand why the GPIO controller or the device that the interrupt is
being routed to cannot have a mux-controls property that contains the
"value to write when the mux is active".

Confused,
Conor.

>=20
> BR,
> Rahul
>=20
> >=20
> > > +
> > > +  idle-states:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >=20
> > This is not needed, you get the type from mux-controller.yaml.
> >=20
> > pw-bot: changes-requested
> >=20
> > Thanks,
> > Conor.
> >=20
> > > +    description: |
> > > +      Idle state for each mux control. Each entry corresponds to a m=
ux control:
> > > +      - 0: clear masked bits when idle, also refers to inactive state
> > > +      - 1: set configured value when idle, also refers to active sta=
te
> > > +      - MUX_IDLE_AS_IS (-1): keep current state when idle
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - '#mux-control-cells'
> > > +  - ti,reg-mask-val
> > > +  - idle-states
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/mux/mux.h>
> > > +
> > > +    // Example 1: TI AM62L GPIO Mux Router
> > > +    mux-controller@a00000 {
> > > +        compatible =3D "ti,am62l-event-mux-router";
> > > +        reg =3D <0xa00000 0x400>;
> > > +        #mux-control-cells =3D <1>;
> > > +
> > > +        /* Mux Register addresses: 0xa00004 + (J =D7 4) */
> > > +        /* GPIO0_40 -> BCDMA trigger 15 */
> > > +        ti,reg-mask-val =3D <0x40 0x000ff 0x00028>;
> > > +        idle-states =3D <0>;
> > > +    };
> > > --=20
> > > 2.34.1
> > >=20
>=20

--Q19jdnk1Fmhnoc0H
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqlNAwAKCRB4tDGHoIJi
0sqdAQCdPExIfVDW/cFEP2wmmrdi9m2RKj2qgB83MhEbHbse0QD/cuL0pmFKyGuV
HFvdSf158Rjh2wi4tT7O3An/GlOzTQA=
=/tBq
-----END PGP SIGNATURE-----

--Q19jdnk1Fmhnoc0H--
