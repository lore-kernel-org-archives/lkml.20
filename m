Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573BE44C50E;
	Tue,  8 Sep 2026 22:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788904978; cv=none; b=KK7Th04GxkOXszyGhwU3W9RyUsXfRKP2tj6u2KRJ2QoBsEJ/1BzN1subtN4TzWv1zEnPiD7Ai/sWYjB+k/TnZNd4rp7Yvnto4gEhGfMDMqa6yvm95p3GqKX6riW6wLEk88ZHMZ5e3XXg6rgBMiYpi1Luc/6/SyPSWjvHdmAjTz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788904978; c=relaxed/simple;
	bh=R60+4qcR0P/pktXBLNj8Al/G1qbUe/NUP//7QfAIrQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4/wgxDu0cyb1n29FtAxLZhlZK+bjYlb+hVk9jSu+oKuFyZ/vNtEoDjjbeyqPbQCsg4mMLu5FSijlYihl8kOY3FgBIDJhl6R4gftXM1GiVVF7OhQXSvYkwIqf07P2ZllUjMz08jnrJoZI79CI2i51JZvIamYBW4UN3KFLG+Z1CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UT/RDuGY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UT/RDuGY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CED1F00A3A;
	Tue,  8 Sep 2026 22:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788904976;
	bh=R60+4qcR0P/pktXBLNj8Al/G1qbUe/NUP//7QfAIrQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UT/RDuGY5co/m6vnmsXNnFeBZ7pNoE7vhc+tG+vJiUhc3uc3YjMZAI9IvEWxfPKu6
	 Mxro0UGl0eIaARRH+xG/34ojFuoHndezxpqv1m7WkjVNzdNA0GZvjME0JlQaFwLXIc
	 jwD+uEhQ48MISJ36mBb0je6uS2tQLX57Z7TunRBpZa2byBtWCOoJEtLUrYoJKldBB6
	 z/etYFrQ9agJJJvHm7nK1jI3vUtEVFEafFtnuGXQ9Sc10TYlWBdZb4F7o2xgQ0iI+m
	 peWSAyckMQTFdVD5Gqz8GuKsGMuzWHhmGJnDpu7Y2n8c9Davvkbtaxe5pItEqkoKMf
	 E7i5MV8xo9j0Q==
Date: Tue, 8 Sep 2026 23:02:51 +0100
From: Conor Dooley <conor@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Lee Jones <lee@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/2] dt-bindings: mfd: x-powers: Add AC200
Message-ID: <aqCGC9rRgjdi5E92@squawk>
References: <20260907-submit-ac200-mfd-v11-0-58dd9dc7f69a@gmail.com>
 <20260907-submit-ac200-mfd-v11-1-58dd9dc7f69a@gmail.com>
 <20260908-semisoft-appendage-ecbeb9b2d88e@spud>
 <CADvTj4rZnsSWe2NOKxpmTE9inyUFU2Cz4AS-zwuBEXkM4hjkLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pFie8xmZ++pOmoyS"
Content-Disposition: inline
In-Reply-To: <CADvTj4rZnsSWe2NOKxpmTE9inyUFU2Cz4AS-zwuBEXkM4hjkLQ@mail.gmail.com>


--pFie8xmZ++pOmoyS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 03:38:00PM -0600, James Hilliard wrote:
> On Tue, Sep 8, 2026 at 12:05=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Sep 07, 2026 at 03:03:14PM -0600, James Hilliard wrote:
> > > The AC200 is an I2C-controlled mixed-signal companion IC containing
> > > audio, video, RTC and Fast Ethernet PHY functions.
> > >
> > > Describe the shared input clock, audio DAI, TV encoder display graph =
and
> > > optional bandgap calibration in one parent node. The codec and TV enc=
oder
> > > do not need separate firmware nodes.
> > >
> > > AC_LDOIN and TV_VCC are distinct 3.3 V supply inputs. Describe them
> > > separately without requiring different external regulators. Require t=
he
> > > audio supply when the DAI is described and the video supply when the
> > > display graph is present, while allowing PHY-only configurations.
> > >
> > > Describe the optional shared INTB connection without an internal
> > > interrupt domain. Cable detection status remains readable over I2C wh=
en
> > > INTB is not connected. Include wired and unwired examples.
> > >
> > > The Ethernet PHY is represented by a PHY package on its MDIO bus, wit=
h a
> > > phandle back to this device for access to the package control registe=
rs.
> > > It therefore does not require an MFD child node. The input clock must=
 run
> > > at 24 or 27 MHz when the Ethernet PHY is used, matching the rates enc=
oded
> > > by its documented clock selector.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >
> > btw, this is kinda odd. Jernej has a signoff, but no other attribution.
> > Are they a coauthor missing a Co-developed-by
>=20
> I had just retained the existing Signed-off-by from some of his patches
> that got incorporated into this one, is using Co-developed-by better
> practice for attribution? Should I use both a Co-developed-by and
> the Signed-off-by for this sort of thing?

Yes, both. Co-developed-by is how you signify that Jernej wrote some of
this. Right now, the code is attributed solely to you as the one in the
author field of the patch.

--pFie8xmZ++pOmoyS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqCGBwAKCRB4tDGHoIJi
0s4uAQDMsUKvaPAYVjWf0Mybx/iJ3FiNEUqmABl6mCPoNcHKsAD9HrCVDTMb0onT
kMHeK+tZViLYO1dbv2bAYzMfCWRCJww=
=20Rw
-----END PGP SIGNATURE-----

--pFie8xmZ++pOmoyS--
