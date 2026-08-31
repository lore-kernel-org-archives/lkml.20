Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A29637F730;
	Mon, 31 Aug 2026 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788206218; cv=none; b=EjacpzAj8RyE+Udz1AMyMuheag+zkvY/iUNdRLHXCH4vlIWCZ/ElrfXWD3QprXgv8BE8qow0i9iqteAiewEGPqG9Y137ckLXNW043DGnxcFeKUK/R/4s7vMaPL9gPPn58UDHlqNy4mj6eUhavh8FlZOP2CN0PRUp4zlRKQYtjM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788206218; c=relaxed/simple;
	bh=DzeNz0AnGNTMSV8b3WCS7ZY7CUL4tl7W6UTWT05FEW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRdhXx3xyq3w0Cu6PXgyANTwMzyjP/nmUNKT89tAv18VJIpvnTLyGFGLY4s5YPZyJBor62eqBzQmW3a5d6u6/K7YKo2uvCrkKKPc/VTe0Q/GVCRVBBbMgjw3B+XQ/adaMWib20evYabDgjr6k/Y0c3tHpUqqF7VOLM3urBsGUo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIiP524k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIiP524k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D681F000E9;
	Mon, 31 Aug 2026 19:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788206217;
	bh=r0F8BYIBain3XCPaojazpffPXrFOGPfPC0Ap4Fxv6PM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZIiP524kYCP6XiC0VDMBmoGlGe5gNKdplctnttXuNoPusl5IyLBj4oEnp5f4Y29Ng
	 Xq8q7mr8Khq1i4MQLVGIARJ39WvK83Ac33jkn3q+XdRpHZ8z8B2Ewqtu0vPZhmBBYo
	 I8uuk/z4QW93rJBefySi40Gf18EnnhPvBMxJfVaMismlpbZZ+aZyYfe9zierY19hay
	 Q7GEmltMn7ibtWDJNsI3nq1KoQ5jmW+CF2yp9IvmGQywrtLLqn/7WkxONItYoK+Z8n
	 c5vo7+I4SCQP3UxDoha4qNah6uf893mJjIIPa0BRxpKh0187rwUAk0wN+s1hY4kGAS
	 Eu10Lw9Lt0xdA==
Date: Mon, 31 Aug 2026 20:56:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	devicetree@vger.kernel.org, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
Message-ID: <20260831-attentive-headpiece-c14d7d4086cb@spud>
References: <20260828151216.175020-1-marex@nabladev.com>
 <20260828-target-operable-ebc87e0bf30a@spud>
 <0f959651-34d9-4fb2-9e07-238f731c5342@nabladev.com>
 <20260831-clustered-margarine-80bf19005aad@spud>
 <2b09012a-3cae-4589-b42d-f61d33f2f876@nabladev.com>
 <20260831-craftily-operative-ac855bdbe897@spud>
 <2b11d8a8-9f4e-4032-bb41-279e16c69424@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mJZgOBe/0R5PdO65"
Content-Disposition: inline
In-Reply-To: <2b11d8a8-9f4e-4032-bb41-279e16c69424@nabladev.com>

--mJZgOBe/0R5PdO65
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 07:38:21PM +0200, Marek Vasut wrote:
> On 8/31/26 7:13 PM, Conor Dooley wrote:
>=20
> Hello Conor,
>=20
> > > > > > >         then:
> > > > > > >           required:
> > > > > > >             - "#clock-cells"
> > > > > > > +        - "#address-cells"
> > > > > > > +        - "#size-cells"
> > > > > >=20
> > > > > > else, false? But I'm also not sure what the benefit is of requi=
ring
> > > > > > addr/size cells when the child node is not?
> > > > > The subnodes of this syscfg node have reg property , see [PATCH v=
4 0/4]
> > > > > arm64: dts: st: Add STM32MP2 USB support .
> > > >=20
> > > > Right, but I was questioning why the properties describing the reg
> > > > property in children is required when the children (and thus the reg
> > > > property in them) were not made required.
> > >=20
> > > Do you mean this patternProperties should be made required in here ?
> > >=20
> > > "
> > > +patternProperties:
> > > +  "^phy@[0-9a-f]+$":
> > > "
> > >=20
> > > Could you please give me a hint how to do that ? git grep gives me no=
thing.
> >=20
> > I mean, if the phys aren't going to be required I would not make the
> > cells properties required. I seem to recall a warning that dtbs_check
> > can emit when there are size/addr cells properties in a node where there
> > are no children, which is why I questioned this in the first place.
> >=20
> > Otherwise, if the phys are to be made required (no idea if they should
> > be), I can only recall this being done with the non-pattern variant. IOW
> > required:
> >    - phy@0
> >    - phy@1
> The PHYs are part of the hardware and are (going to be) described in the =
SoC
> DT, so I would argue they should be described as required ?

Yeah, and there's almost certainly no chance of them being required
being problematic is there, since they don't impact existing code, but
have a new (or at least a previously unused on this platform) driver.

--mJZgOBe/0R5PdO65
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapXchAAKCRB4tDGHoIJi
0ucHAQC5DqttP9INbtx8CZiW4Hs/d/3Eu6d98axXNumJR8kr+wEAqBi1bgb+G2U7
cC1ePu6jgS0swqZBiJvQkvLAH3t1vQI=
=7YiT
-----END PGP SIGNATURE-----

--mJZgOBe/0R5PdO65--
