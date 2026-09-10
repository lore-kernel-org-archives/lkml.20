Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B04471CF9;
	Thu, 10 Sep 2026 11:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040213; cv=none; b=hUvkmLRi2FFIkPIfJY77nI42Unn+0mcvm3kcuYcYWwnT7Oau1ziswKmfPB0cKGRJDggibg8KcHAN9/DYFpbALjoNTf+EPrHMnVM+oKYuX1mIQB8kRdwLgcU/KfA/0shFb6n3+lXM4FftykQsiLtYCPZCopAie95gZqGzx0uwKzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040213; c=relaxed/simple;
	bh=hzA+PKRN3l+0eV9u08hF04ntXIlnZzwgSTvjaGi2g28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZl9KADmZIs5FDiM1KbgAlWTqiPnDVaEb/R3uTksCG+8qZPEcr9cpUybTfmGbg2KpwauSUr5bUaAsxaTN3sTLg0AfHz7QznHOq82AZcck+dWj/MvCnxWfVbI3T4eSWOBfPxU+Rsjw4x0VwtdCFm71lByKtYMelhIXRQQIsOJmJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1uZvkej; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1uZvkej"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009761F000FF;
	Thu, 10 Sep 2026 11:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789040211;
	bh=ThJ5CqwafEWn7XoTc54OwhK6KqK1K1MTq5Aj8JGokpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K1uZvkej+yYDPQfTsV+J/nVuEtDGZdVwjfbQyfu8myQADImAAivzhjpslJAL+FIfA
	 W45dppLv8e1OYMmLHZfhyHtYnce4cCpq6D6XegQtCfxRJkID7/03s+gjVgAWbfjwvF
	 eL8QNIe9dPU5edSzRcYiRbgqNJtuxbG7JDpeFcwPpY6k5YJnzX7B/BDTe7IWWq/yGN
	 2XsXMXcARR9dvHzAbGuRzVk/sDILjxVtfLzOQSwPJ2BWfl8Pw8o94sPPt+gAevqfVf
	 H92fervzHtQSbVUbot/jNt70T758gQHy8MEqotEJ4Ki9urRA+mBF4XMLoRk31exKPZ
	 IpR7LOL8hlvwA==
Date: Thu, 10 Sep 2026 12:36:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Shubham Patil <shubhamsanjay.patil@amd.com>,
	alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <aqKWTT47S_zPzvbN@squawk>
References: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
 <20260908094257.3196120-2-shubhamsanjay.patil@amd.com>
 <20260908-groin-undivided-0af701135404@spud>
 <aqGHlWpQjpHEft3j@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u9z4G+LSlEVaHeGX"
Content-Disposition: inline
In-Reply-To: <aqGHlWpQjpHEft3j@SMW015318>

--u9z4G+LSlEVaHeGX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 11:21:41AM -0500, Frank Li wrote:
> On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Dooley wrote:
> > On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil wrote:
> > > In-Band Interrupt and Hot-Join are synthesis-time options of the AXI =
I3C
> > > IP. Describe them with two boolean properties.
> > >
> > > A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> > > capable design is always IBI capable as well. Both events are reported
> > > through the controller interrupt, which is therefore required whenever
> > > the capability is present.
> > >
> > > Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> > > ---
> > > Changes in V3:
> > > - Move in-band-interrupt-capable and hot-join-capable into the common
> > >   i3c.yaml schema and drop the xlnx, prefix.
> > > - Keep dependencies in the AMD binding.
> > > - Update the commit description accordingly.
> > > - Conor Dooley acked v2 with the xlnx,-prefixed properties in the AMD
> > >   binding [1].
> > >   That Acked-by is not carried here: the names lost the vendor prefix
> > >   and the definitions moved to i3c.yaml after Frank Li's comment.
> > >   [1]:https://lore.kernel.org/all/20260824-tightwad-impose-4954765990=
87@spud/
> >
> > I disagree with Frank. These properties make sense for Xilinx because it
> > is an FPGA IP and synthesis options impact this. For other devices, this
> > should be determined from the compatible.
> > Please revert to how things were done in v2, especially as no rationale
> > was provided for why these should be common.
>=20
> It is common problems, when IP intergrate by SOC, which may defeature some
> part, It is not appeared now just because IBI and HJ have not enabled
> widely.
>=20
> IBI and HJ is optional features of I3C. Ideally it should be indicated by
> some registers. But not all vendor implement provide this CAP registers.
>=20
> IBI and HJ depend on some slow clocks, which monitor SDA line change.
> Some instances of IP may not have such slow clocks. Some IP's IBI and HJ
> use seperate IRQ line, but these irq line may not connect of difference
> instances.

All of this should be able to be dealt with by appropriate use of
specific compatibles.

> like previous SPI vendor customized property, we takes efforts to convert
> to common one and also meet back compatiblity problem at convert. I don't
> want to do it again. This kind property is most likely as below.

What SPI controller specific properties are you talking about here?
There are relatively few properties in spi-controller.yaml, and none of
them deal with these kinds of capabilities.

>=20
> default: 	decide by comaptible string or hardware cap
> force-disabled: force disable for some reason, like, miss connect irq line
> or missed some clock, or IP bugs, or board desgin's some level shift chip
> broken IBI/HJ timing requirements.

Of these, only the last would be a valid reason for having a property
for it. Missing interrupts, clocks or IP bugs should all be dealt with
using device specific compatibles.
If board wiring causes the breakage, the property may be more
appropriate at the i3c device level rather than the controller given
that wiring to some devices on the bus may not have the problems?
That said, I think that problem should be dealt with when it arises,
rather than starting a trend of adding capabilities properties at the
controller level when I am not convinced that there's going to be other
users in the same vein.

Thanks,
Conor.


>=20
> Frank
>=20
> >
> > pw-bot: changes-requested
> >
> > Thanks,
> > Conor.
> >
> > >
> > > Changes in V2:
> > > - Rename the properties to "xlnx,in-band-interrupt-capable" and
> > >   "xlnx,hot-join-capable", and expand their descriptions.
> > > - Express the interrupt requirement with dependencies: instead of an
> > >   allOf/if-then clause.
> > > ---
> > >  Documentation/devicetree/bindings/i3c/i3c.yaml    | 15 +++++++++++++=
++
> > >  .../devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml |  6 ++++++
> > >  2 files changed, 21 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documen=
tation/devicetree/bindings/i3c/i3c.yaml
> > > index e25fa72fd7857..7430394cc6b9b 100644
> > > --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> > > +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > > @@ -61,6 +61,21 @@ properties:
> > >        Indicates that the system is accessible via this bus as an end=
point for
> > >        MCTP over I3C transport.
> > >
> > > +  in-band-interrupt-capable:
> > > +    type: boolean
> > > +    description:
> > > +      The controller supports In-Band Interrupts. A target can reque=
st
> > > +      attention on SDA/SCL by driving its dynamic address during bus
> > > +      arbitration, instead of using a dedicated side-band interrupt =
line.
> > > +
> > > +  hot-join-capable:
> > > +    type: boolean
> > > +    description:
> > > +      The controller supports Hot-Join. A target attached or powered=
 up
> > > +      after the bus is already running can announce itself using the
> > > +      reserved Hot-Join address so the controller can assign it a dy=
namic
> > > +      address.
> > > +
> > >  required:
> > >    - "#address-cells"
> > >    - "#size-cells"
> > > diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.y=
aml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> > > index 2caa245a86568..9480de3fe8e1d 100644
> > > --- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> > > +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> > > @@ -37,6 +37,10 @@ required:
> > >    - reg
> > >    - clocks
> > >
> > > +dependentRequired:
> > > +  hot-join-capable: [ in-band-interrupt-capable ]
> > > +  in-band-interrupt-capable: [ interrupts ]
> > > +
> > >  allOf:
> > >    - $ref: i3c.yaml#
> > >
> > > @@ -54,5 +58,7 @@ examples:
> > >          interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > >          #address-cells =3D <3>;
> > >          #size-cells =3D <0>;
> > > +        hot-join-capable;
> > > +        in-band-interrupt-capable;
> > >      };
> > >  ...
> > > --
> > > 2.34.1
> > >
>=20
>=20

--u9z4G+LSlEVaHeGX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqKWTQAKCRB4tDGHoIJi
0iJOAQC8eOJkK82i1/wTArxsBsu7JrEGjDFKq8k0XZV3od2KzAD/dVNEgZgMrJH7
BUgqpRKcb56INesvFsFPgUJ8KnjY6wM=
=fjec
-----END PGP SIGNATURE-----

--u9z4G+LSlEVaHeGX--
