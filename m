Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CE3476CD6;
	Mon,  5 Oct 2026 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198158; cv=none; b=uHXgMxheoSYYSvzNrFaT213/T/jFAKYzefQY+brr/ab03nVxeG0gNDDhddDEFg28dpOtrAweQdyP8/bwc+fniO23PclYDPq73W1gdPkSfabY3Uk/0kRGyQu1DURJft+aJksBaSmU46KuqktJlY7hx0ztd7Z4VpwtGCZ/LCB08iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198158; c=relaxed/simple;
	bh=6s3PlJX0scUdjoIu0MIG8SS24blzlGYMjEe100URy3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hmpy2GWlS/ieK+GFkN5pHOaR525dEBDH6S1TiDKCr+PkmxtFwZ+JLXpqbdgoNJGPtpr9FYifogcwo1ejmTaInEP2BA948d9E6102c6Edk8s7+bGesccqY58F1AazLbUGaeBPrU3QrtJKXZNQlcKc0Nf1iuWWOUFn5vhlKP1WJFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DlhWR25t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlhWR25t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9F41F000FF;
	Mon,  5 Oct 2026 11:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791198156;
	bh=z1HRttjqd+MTcjNPO1KwcbzLCdBsvX14rDa445nijOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DlhWR25tkEb5p+bdzqgfsoR+zKOQ+XOPzthwgdN+O2RRyb+sKOGaFEOh9LYzto0GQ
	 julGBeFWknZ104ZVLeFdA6P7sEcRULCBXVZ9tXhmZnybCTeUHrPirojhj9jUFLdw/w
	 pj4XDKR4wVVK9pZmEz10lYr6SvNWtbnTW5zA42Z5Rl92Jp+TrqFSu8RZX/hn8uOOzc
	 tbgTEw5Ftp4CVTIessrXIWIUy3k9Tp4GQRhKLInkK7HGhTL3+rsICeMo5+KFkC9plQ
	 afcHswuGlcpQBF9sO5KncdeifBoe+vd86OOTtMedY4U2p4j2Fkc+a7kIyjlUiTM+EL
	 8CQS/xCbTuDUw==
Date: Mon, 5 Oct 2026 12:02:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Robert Bozik <robertbozik@gmail.com>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Message-ID: <asODx3YQa4WlANen@squawk>
References: <20261005071010.7191-1-robertbozik@gmail.com>
 <20261005071010.7191-2-robertbozik@gmail.com>
 <asNbwhGCuxF6e6Ba@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IP+Ook+aPuW1fdmV"
Content-Disposition: inline
In-Reply-To: <asNbwhGCuxF6e6Ba@kekkonen.localdomain>

--IP+Ook+aPuW1fdmV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2026 at 11:11:46AM +0300, Sakari Ailus wrote:
> Hi Robert,
>=20
> On Mon, Oct 05, 2026 at 09:10:08AM +0200, Robert Bozik wrote:
> > Add a binding for the OmniVision OV32C4, a 32 megapixel RGBC CMOS image
> > sensor with on-chip 4-cell fusion, a 4-lane MIPI CSI-2 D-PHY transmitter
> > and the standard SCCB command interface.
> >=20
> > The sensor ships in laptops as an under-display camera, where it is
> > described by ACPI; the binding follows ovti,ov08x40.yaml, which covers
> > the closest relative already in tree.
> >=20
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Robert Bozik <robertbozik@gmail.com>
> > ---
> > Changes in v4:
> > - No changes to the binding.
> >=20
> >  .../bindings/media/i2c/ovti,ov32c4.yaml       | 105 ++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov=
32c4.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.ya=
ml b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
> > new file mode 100644
> > index 000000000..804307cd0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov32c4.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: OmniVision OV32C4 Image Sensor
> > +
> > +maintainers:
> > +  - Robert Bozik <robertbozik@gmail.com>
> > +
> > +description:
> > +  The OmniVision OV32C4 is a 32 megapixel RGBC (red, green, blue and c=
lear)
> > +  CMOS image sensor in a 4-cell arrangement, with on-chip 4-cell fusio=
n and
> > +  binning. It has a 6528x4896 active pixel array, a 4-lane MIPI CSI-2 =
D-PHY
> > +  transmitter and the standard SCCB command interface.
> > +
> > +allOf:
> > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: ovti,ov32c4
> > +
> > +  reg:
> > +    maxItems: 1
>=20
> minItems should be 2 here, for the always-on client.

Instead, make it an items list, so that what each item is is explained.

--IP+Ook+aPuW1fdmV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasODxwAKCRB4tDGHoIJi
0mbNAQCmTIsqIZytE1xDYgMmVBkoKtjrv6Lr7ihuKn2q2kN17AEArJvc7KBTx6rl
h3Pq1MXI+HEz2GycVhRIRT1hcgwZHAw=
=P2gY
-----END PGP SIGNATURE-----

--IP+Ook+aPuW1fdmV--
