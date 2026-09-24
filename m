Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4063E49EC;
	Thu, 24 Sep 2026 16:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266687; cv=none; b=sTHiQDk4z7S6FStt60Idtx8hbcMz/vJmGrjJsiDXZmgVCInkRH0jxuDX4pTmm2XAz6Iu38Vz5cl5E+MoBHJ/PSv6K7aDarM2w2m+bF6QLGBpr+xUDP1XY1eWlmyCvfNjyQ/JMkE19nQxdZa3W+Wo6ZiJEX6O93XYOYbJs9eeO1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266687; c=relaxed/simple;
	bh=bmlnAqQYJFCf55OCow3V+frr5qdhr5NDBnj3U4GT0ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/S5BDtf9YRizIef6onh9hktja08w4vCA/z85uEhzAID0vXhKsHVXXTnCq2OsnUa4h56zdXPkxqhKKQ97gpDhTDwRQFHbM4wT43E5knAA015ww+BvtkKxt1YyOo5A1qSXd1la4c1jNmhDvxFCRCTBTf7WCOUFmQfB37bSEmwiEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckiTblRy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckiTblRy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2881F000FF;
	Thu, 24 Sep 2026 16:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790266686;
	bh=+uTiVZCZ9cAIkbNM+KWVTUXb8yAN3FcF4VutsvVwP3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ckiTblRy+cNeLL2dJbLQNUaMq/LaQRwIY8rk8PKnTRe6tbjtyhSwfxOwUcJT71Otl
	 of6Mm+W+2j6sokBJjsmKg171aNcQppnKS8aRAldP8SxyI8J07DnkJ2TTEWOrsr8Mf2
	 aJG0UN0qvixEj6EbVEZX7wpF0e6gKcBm3G7Ww7aT0zLLw66qTNIAZpv9c6lMt4qCmX
	 L36/M9j+RhzvQpPLc2dbiV0co38l5e2ch/pBh4lJ3ZByrhUllylYltZSzMjEozRf2U
	 2vtz4SH6e7cO7vi68s1GvzI+sRBEYhcaMNe6F67jt+/an6ywiozMo0X0QuXdvHGutq
	 DrZa4OzoDE/4A==
Date: Thu, 24 Sep 2026 17:18:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: usb: dwc3: Add JHB100 device
 controller PHY adapter
Message-ID: <20260924-taps-radiance-b52ebf9077e3@spud>
References: <20260918071103.24482-1-minda.chen@starfivetech.com>
 <20260918071103.24482-2-minda.chen@starfivetech.com>
 <20260922-colonize-uncaring-c604b3529275@spud>
 <SHXPR01MB0863BEE05D53154B1F61BFE6E6812@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NEddNWE8FJr7jx7+"
Content-Disposition: inline
In-Reply-To: <SHXPR01MB0863BEE05D53154B1F61BFE6E6812@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>

--NEddNWE8FJr7jx7+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 04:03:37AM +0000, Minda Chen wrote:
> >=20
> > On Fri, Sep 18, 2026 at 03:11:01PM +0800, Minda Chen wrote:
> > > Add dt-binding of JHB100 server host field USB device controller PHY
> > > adapter register IO region and its regs-name.
> >=20
> > I don't understand the rationale here or the other binding patch.
> > Why is it not always 2 regs? Either the device has 2 or it has 1, there=
 shouldn't
> > be variability unless there's more than one instance and the dfferent i=
nstances
> > have different numbers?
> >=20
> > Cheers,
> > Conor.
> >=20
> Thanks for reviewing. The virtual device controller do not contain PHY

I don't know what a "virtual device controller" is, or how it relates to
usb3. I'm a binding reviewer, not usb, so you'll need to explain this
more clearly.

> but need to add PHY adapter setting(self-develop by StarFive). So have 2 =
regs.=20
> Previous is BMC USB module do not contain it. But if PHY adapter be moved

Are you trying to say that the jhb100 has two different usb3 controllers
on it, one of which has extra logic implemented by StarFive?

> to PHY related driver can remove this . But Thinh still no review the pat=
ch3.
>=20
> > >
> > > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > > ---
> > >  .../devicetree/bindings/usb/starfive,jhb100-dwc3.yaml | 11
> > > ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
> > > b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
> > > index fbabe99e9d5c..b2fd98c06ba0 100644
> > > --- a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
> > > @@ -20,7 +20,16 @@ properties:
> > >      const: starfive,jhb100-dwc3
> > >
> > >    reg:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    items:
> > > +      - description: Core DWC3 region
> > > +      - description: DWC3 device controller adapter region
> > > +
> > > +  reg-names:
> > > +    minItems: 1
> > > +    items:
> > > +      - const: core
> > > +      - const: adapter
> > >
> > >    interrupts:
> > >      maxItems: 1
> > > --
> > > 2.17.1
> > >

--NEddNWE8FJr7jx7+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVNOgAKCRB4tDGHoIJi
0h5AAQCWEBnKJEW1opcLkFMrFa5xIWT4nGoJbS518dp4kbB4qAEAgHgelJ0cFynG
TIdreDGMJb8htngviPBVMLPiY0b1dgw=
=JPty
-----END PGP SIGNATURE-----

--NEddNWE8FJr7jx7+--
