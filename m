Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC4A51C328;
	Mon,  7 Sep 2026 17:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801043; cv=none; b=pFqmevwvYYuI8SI4BQTpW0S5i/G1GTRIea0HaHOgtbx8g+mkByhS4zilE0I0iumcIeoBpIK8iR34G8mAsouDOb+WnmmMy8HNnFaaXL+lD+3DL8TeTqMphgcbVzY+TJXiZ8f/mcUE3zs65JnmeQYb3lXj0IvQjjFp5m3eD8oBiEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801043; c=relaxed/simple;
	bh=5B992ZLodQEYFevQE++ORu7IaxxUU9BNWcYUbUkSYRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qp/cAEx0g7Kao5JN/GKbf5Q4bbLooFJkoCDy4L2ZaAD5ddB2ap/JHEY0R6fUPledJjkb49793O3C7QBAWAHDd8XSdfml/zayS6ZGpuXb5bSW3L+AX/tWfYqAGGdCA/Adj+UqQ5fecvZd/4HchsgaSLT0GxtBlqewrok+5S+E0hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPArTzTt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPArTzTt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17831F00A3A;
	Mon,  7 Sep 2026 17:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788801041;
	bh=ucLgd70em6PYrJ1O8hh/VS12De8eeEdBSNC0MnyAy3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TPArTzTt+O1Cm16+j0b2rCBLXzK4ZaP1ANY3ZQG7ifrVF5hs5BkPtnsq6q7mEbvia
	 VMAdo/cf4SUz2mtYVOtK2Ej98GygoOGD88nyZKVUeQxmhtIzTqVH+Whea+PTwQ+AbX
	 G2P3dX+6MYh/cViWRZER1OqvZlctLR1o2xPd4BncbdtOJxYazwCLZqLpp8CjPShqz2
	 EG4+cMaRFd5ClTUe0aB0yV2n6P+xGVJab46ecCkftaVlrsCaYdU+PdJsrvmnzChrti
	 GHCcUa2C65slKEQB7Nv9679dHOQH6leWh0whmokC3fVtUFPaB2LFwTRGmqSYl9Q4zD
	 5VeiS6WbLpG/Q==
Date: Mon, 7 Sep 2026 18:10:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	venkata.valluru@oss.qualcomm.com,
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: rpi-panel-v2: Add
 required vcc-supply property
Message-ID: <20260907-atlantic-modular-8f3c1582635e@spud>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-1-0c59aa60d31f@oss.qualcomm.com>
 <CAPY8ntCF6e3FZPx0BwZKJimACwdUKwNSP+SPjNUE+1DgQC1=Qg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="32OBddDMqQq6s58k"
Content-Disposition: inline
In-Reply-To: <CAPY8ntCF6e3FZPx0BwZKJimACwdUKwNSP+SPjNUE+1DgQC1=Qg@mail.gmail.com>

--32OBddDMqQq6s58k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 02:24:09PM +0100, Dave Stevenson wrote:
> Hi Shashank
>=20
> (Apologies for the earlier HTML version of this - I thought I had my
> mail client under control)
>=20
> On Mon, 7 Sept 2026 at 06:48, Shashank Maurya
> <shashank.maurya@oss.qualcomm.com> wrote:
> >
> > Add a vcc-supply property to the Raspberry Pi 7" touchscreen panel V2
> > regulator binding and mark it as required. The panel controller MCU
> > needs an external power rail to be supplied before any I2C communication
> > can take place.
> >
> > Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > ---
> >  .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml  |=
 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7i=
nch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings=
/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> > index 37b9ed371b67..a6195e53be16 100644
> > --- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-tou=
chscreen-panel-regulator-v2.yaml
> > +++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-tou=
chscreen-panel-regulator-v2.yaml
> > @@ -35,6 +35,9 @@ properties:
> >      const: 3
> >      description: See ../../pwm/pwm.yaml for description of the cell fo=
rmats.
> >
> > +  vcc-supply:
> > +    description: Regulator supplying power to the panel controller.
> > +
> >  additionalProperties: false
> >
> >  required:
> > @@ -43,6 +46,7 @@ required:
> >    - gpio-controller
> >    - "#gpio-cells"
> >    - "#pwm-cells"
> > +  - vcc-supply
>=20
> Adding a new property as "required" breaks all existing users. Adding
> it as optional would be reasonable.

It can be made required here, but never in the driver. If it's actually
required that something turn this on before the device can be used,
making it required is probably correct.

>=20
>   Dave
>=20
> >
> >  examples:
> >    - |
> > @@ -55,6 +59,7 @@ examples:
> >          gpio-controller;
> >          #gpio-cells =3D <2>;
> >          #pwm-cells =3D <3>;
> > +        vcc-supply =3D <&vcc_reg>;
> >        };
> >      };
> >
> >
> > --
> > 2.34.1
> >
> >

--32OBddDMqQq6s58k
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap7wDAAKCRB4tDGHoIJi
0vWhAQCGzfAZab1fHmr4LYkebicDshj4RhoEc9b664Sq7qFecQD7BUQp91g+DoJF
RmWqJEQKjHicetBNiCsgAjOA98EMhwc=
=BfaY
-----END PGP SIGNATURE-----

--32OBddDMqQq6s58k--
