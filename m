Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DF735E956;
	Sun, 11 Oct 2026 21:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791752654; cv=none; b=KN8hEvcuTAcEB/CH5y8TBdQNtcweeSuUYaz2pew1XQxpyL0iQ/vm9FFzJjPf4V5lK1w43UDBT9JWT1eK4HYa201LIMfKrdCT3yACr/bTvtH/T9yV9mfRhnwaYAHjQGtGcdLzBS/0ACIPqVPQ5U6Y7vqCDDbNdoUDCj1XM1IqiCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791752654; c=relaxed/simple;
	bh=qpbEGTvLxbygv5npD62Bzm3P04At/WO1oJDNOyef1Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLoarRn6scJSQQlO/2712YBHVXkIXmNgyxQtKG/lAZgKUVM17crRR40Ko9HLNUmaccffhNhNiwfJ3lcuUakI4XopGfuZspCmSJsCPgns1JN+UfN9DZCosf3r4QZKUsS8r1TdD+RIL+Xc6YnPJfom5f35XFQYDXxgLKPYYZaUzTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKd0gele; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKd0gele"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46E61F0089B;
	Sun, 11 Oct 2026 21:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791752652;
	bh=IT1YkemJVNo91PZ/vHFhpiJIZ6agvmdqx5nDY6WX42Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WKd0gele+RANjoxMl1pzsmiQOrSU26DsT9tqLqZVOfOBX1CIoRkg8+aqmnM8o9t4x
	 yuSKooiYrRqOngIy0u9rTyETk7Tn7B4YqlM4mlS64CuRIg4154IgItYT0n9Xm4rZg9
	 TaSGmpvaRImJvRtLZAV1Rr8d+/Xu4o2Vr48uBY9cSmyXW/VagA353MXVwiMelRe8wF
	 ArVt9Q86gyzq76m5pSbOPuhr+g//4ozLXAGbLlvJ8INo3KKFC8YvVXMNK99FLyKFd9
	 Q6Np+HG6L7E4XAnCptiKklAmZ2qvTTB3EAMIVhVkBdvqXU55haHbr/pru9uL0T9VjI
	 +lAPknUCWaO+w==
Date: Sun, 11 Oct 2026 22:04:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: connector: Add Toradex camera
 connector
Message-ID: <20261011-expulsion-frivolous-690de090cf9d@spud>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
 <20261002-prepaid-retired-3d2c9cbc035e@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q3EvCfSuoZ2pke+6"
Content-Disposition: inline
In-Reply-To: <20261002-prepaid-retired-3d2c9cbc035e@spud>

--q3EvCfSuoZ2pke+6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 06:05:24PM +0100, Conor Dooley wrote:
> On Thu, Oct 01, 2026 at 01:44:11PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >=20
> > Toradex boards route the sideband signals of their 24-pin camera
> > connectors to different GPIO controllers. Camera overlays which name
> > those controllers directly must therefore be duplicated for each host
> > board.
> >=20
> > Describe reset, power-down, detection and power-control as
> > connector-local GPIO functions. This lets an accessory overlay remain
> > independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> > remain described separately because the GPIO nexus does not abstract
> > them.
> >=20
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> >  .../connector/toradex,camera-connector.yaml        | 81 ++++++++++++++=
++++++++
> >  1 file changed, 81 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/connector/toradex,camera=
-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camer=
a-connector.yaml
> > new file mode 100644
> > index 000000000000..27fee3defde7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/connector/toradex,camera-connec=
tor.yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/connector/toradex,camera-connector.=
yaml#
> > +$schema: http://devicetree.org/meta-schemas/base.yaml#
> > +
> > +title: Toradex camera connector GPIO nexus
> > +
> > +maintainers:
> > +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> > +
> > +description: |
> > +  Toradex carrier boards share a common 24-pin, 0.5 mm pitch FFC/FPC c=
amera
> > +  connector carrying MIPI CSI-2, I2C, clock, power, and sideband GPIO =
signals.
> > +  This binding describes the sideband signals as a GPIO nexus. The oth=
er
> > +  connector resources remain described by the surrounding board device=
 tree.
> > +
> > +  The nexus exposes connector-local GPIO function numbers to camera ov=
erlays
> > +  and maps the functions wired by a carrier board to their GPIO contro=
llers.
> > +  GPIO specifiers contain a function number followed by standard GPIO =
flags.
> > +  A board may omit functions which it does not wire.
> > +
> > +  The function numbers are:
> > +    - 0: Camera reset, connector pin 11
> > +    - 1: Camera power-down, connector pin 22
> > +    - 2: Camera identification, connector pin 23
> > +    - 3: Camera power control, connector pin 24
> > +
> > +properties:
> > +  compatible:
> > +    const: toradex,camera-connector
>=20
> This seems overly generic, but I assume that's what it's actually called
> and if you make a new camera connector the name will be
> "camera connector 2" or something.

Since this came up during last weeks conference, figured I should
clarify that I was commenting on how the generic name, which typically is
something we try to avoid (because it is usually used when someone does
something like "sony,8-megapixel-camera"), was probably actually fine
here. I wasn't looking for a version to be embedded in the string. I
already mentioned this to Ernest after the talk, but mentioning it here
for everyone's benefit..

--q3EvCfSuoZ2pke+6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasv5xAAKCRB4tDGHoIJi
0rp3AQDG2KmW+uhF4maDEpqvD2fEbdFwuOzCqEbgz6CUKjVH/AEAgfi94bnz2cvI
lHwJ8q0M8cKP9yx53nXNKy8NNFOTSwQ=
=kIsF
-----END PGP SIGNATURE-----

--q3EvCfSuoZ2pke+6--
