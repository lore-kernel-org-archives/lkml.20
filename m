Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335487;
	b=p038x7ScKqRrh6l3CgmT3jyx+V5vuiVjxbO4Yw1cuDYLWvZ9wwCWLEGwLcK3GxVIFjs+
	 dngP2GYoQsd0wkWpv+ce4MtDagGJVLsxi8J3IlSyKlTJrEzS669WfXClr1roJ8J0W7SbB
	 1a2qJ7FgApGr2NaE7urWGOYavUJjsMEOPDYqSW3fN46iq/0KYxA7TRLldeRRwTj9GJkfF
	 DK3yAYIiL//JwaYgLcj6rTLO7VgLQOereJvflRwXAkSGkqxXU/6OZWgEm3g19YDWwjEQT
	 KLDz66DZDj2eVGS1lRPdKkNiDyo7bQMS3r+OKTwoGzDZ1FZ1+ih8YGily8SlO5Gyghg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335487;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5tzgnkYDrFrWTh2t0wgxoznuDfKN90IkFnN5vG87trg=;
	b=lZvHLM7FU9saUcVxICY/IwbdqJcS7ruUWBqGwuvBm+O6wJlhsGJBvjiffXYaHFNbTlqB
	 bS54EJvsfrgnZnElhw8T5W3y1pty1HathAGwivwbT2MxKR8Mpq7Wi54RbcMmZxNATKoQQ
	 XRVSFgomtZIEArQmk7F7OkbbBg2GaYXUMYPI3mADeXB6+RebkkY+8v3sU52KAhoYnnN9p
	 s7wy48AM95x66V0YSIh8eEMZOFnXX7i7n2MXBuw9siYsngORyk74tULUZbjvX6xtgT6Gq
	 ldSJ1uAEbvQrKEYFQWs5eQM3mpH8551V/NBM5oDEH5lS3MlyaglZark/D9/sDem7FDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cGXZz1n7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5705A606A330;
	Tue, 10 Nov 2026 18:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cGXZz1n7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216C61F0089F;
	Tue, 10 Nov 2026 18:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794335487;
	bh=5tzgnkYDrFrWTh2t0wgxoznuDfKN90IkFnN5vG87trg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cGXZz1n7LFMxfgny7dFVj7UoB7cKV6VJ5zktCgDl4uWqLI6y2W0PHCH0v4wseex5Z
	 eykKXyIzOPzTGbIhMWThO5zS5hGY1o2jJYVYLZQABjnQDSZX6XvkBgHUxjKRlFw7Bv
	 HyXN1IwXVeUaiTde0DVlkys0RhgyOV14MME0P6iBGyV+MbshtQCg2TcQNlcDpL3c+6
	 AgxNqSJ9Vmfk+8qxE7nWUOXUO0Pp3GLBO10dYPt/zyrRsCPhJQ6IBp8E3/fR2asoTq
	 XjnK/qVo2vuHSr3Mv9xjcqhBRNTKIoy1t/dAObfS4rg9IriHnnW2iPRaMovRvN029L
	 P/3TCPRWRpGyA==
Date: Tue, 10 Nov 2026 18:31:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Lukasz Majewski <lukma@nabladev.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: trivial-devices: Add National lm77
 temperature sensor
Message-ID: <20261110-cling-gap-10bc9abf3230@spud>
References: <20261110150243.1531953-1-lukma@nabladev.com>
 <20b8e15f-70fb-4844-abb6-d91d7d7e9849@roeck-us.net>
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
	protocol="application/pgp-signature"; boundary="N0cKppbkFEAKMJF6"
Content-Disposition: inline
In-Reply-To: <20b8e15f-70fb-4844-abb6-d91d7d7e9849@roeck-us.net>

--N0cKppbkFEAKMJF6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 07:15:30AM -0800, Guenter Roeck wrote:
> On 11/10/26 07:02, Lukasz Majewski wrote:
> > Add "national,lm77" as compatible for the National (now TI) LM77
> > digital I2C temperature sensor.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > ---
> >   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> >   1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/D=
ocumentation/devicetree/bindings/trivial-devices.yaml
> > index a8b2b9deade4..9413ee0626f5 100644
> > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > @@ -387,6 +387,8 @@ properties:
> >             - national,lm85c
> >               # I2C =B10.33=B0C Accurate, 12-Bit + Sign Temperature Sen=
sor and Thermal Window Comparator
> >             - national,lm92
> > +            # Temperature sensor
> > +          - national,lm77
>=20
> I'd suggest to retain alphabetic order.

pw-bot: changes-requested

> Having said that, is there any evidence that this chip is used
> on a system supporting devicetree ?

Seemingly yes, the author just submitted a "series" adding a board that
uses it. I say series, because it was two independent patches:
https://lore.kernel.org/all/20261110150546.1535950-1-lukma@nabladev.com/
https://lore.kernel.org/all/20261110150024.1530988-1-lukma@nabladev.com/

>=20
> Thanks,
> Guenter
>=20
> >               # Nuvoton Temperature Sensor
> >             - nuvoton,w83773g
> >               # NXP ISP1301 USB transceiver
>=20

--N0cKppbkFEAKMJF6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavNi+wAKCRB4tDGHoIJi
0rc/AP0bzp0OlQ/KWi6aBTtD7mBUuRkv2Egs6RXSFbXYkdGEKgEA9MZuk0CRMbzG
PFjAAgCAqVaBfMzpM1H78Mg+VqJJRAE=
=GYsw
-----END PGP SIGNATURE-----

--N0cKppbkFEAKMJF6--
