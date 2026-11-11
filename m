Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391306;
	b=DHnS/7u4TttQyiHO2lJB57C/mNbHIhmA5HUQmY+5O/RF7yzPKwf740DofH8Rvq9ngdtP
	 jO2lCHet2uamsI0Wxe+9qBdZSeZ6yaGmSDff99weAvYpSknYqZNtKFoi692RJ8yMh8e2D
	 FNcB5nWbXCspJF5HfwIfjCHTtcln84wfa2qced/NIH7ozOIfnCUkpA13nKXFdmHxRHOmZ
	 OTH46JaK5xXc3vdJpSeTLcJfF5KedtpZO7q4STY54MHAZp42Q2+4PSWZlxrJJQQiU6daN
	 jpuiYaagcTHfUpgQwdQUsF0F/YxmRTsKoQKTyC9kmfpVLeICPAv4Xni9ftIH85Zjb1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391306;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9wY75Oc5XbeR6DiKMFgRwxqRRRSUa+hCgjs5NUnDR1I=;
	b=lP67Nm3ZsawyfA+axtiZAl79SmUSMV6Cy8EWh09Rk8qkFnP8P/gvzngNFckLqhi+onpy
	 rDHeOzp/bn6Zk51RiK1PKCUkbotHNtXznMAqQ6NOd685fawVH39KRtCdUXzWuBnzL0IFg
	 J3emzDZEipxliur1ay+4VJFpH68bw5kgSHiWhGtEgVu45Bu3WjCnHo4wvb7axDSxRyTYd
	 5+sGdCuBw9SKPaU8Q5I0VQHq4nJ0iz7iN+4f06kt2WOtMmtnpnazaUfJn15tlNJYePdzO
	 I+Il6T9HU5Bwt5/tRriDA/HhYi3jfSDc0KT0Og2hV+SK7sKUeHx3FyiyXxM+uUxQUnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="G5yT/8Ip";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE41606A31C;
	Wed, 11 Nov 2026 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G5yT/8Ip
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0591F00A05;
	Wed, 11 Nov 2026 10:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391306;
	bh=9wY75Oc5XbeR6DiKMFgRwxqRRRSUa+hCgjs5NUnDR1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G5yT/8IpmexBC4a6ZeCP8iFuSEnAegRPglJylD2ZuNq+WQ4ttUX5Owmvck3me/4Ux
	 /53O+tAA/jkOfFaWhA3gJDNKjHsG6lfPj7drficGxFiou/BP/Il2tMleOxP5M7cp3/
	 rcsjAKlOuIteoaqBkPKiMvCA/gLcPfh96AYjS5+ccn3ed+KdZTAvzjXwuRrq6jw1sQ
	 OEXBXb/y+p4jf5M1fgpfnuWOY/fx1QiBcMSUVA7URnkyqrS3oyQ68fqbTyGcQux0Dr
	 WCFvd06RIPEFZfWzS600pd+cMkirOjfxYfBih3d1Pz1T6LP4UG2dGr4ET3LqMD+IB5
	 FhHe9hbc8Fbjg==
Date: Wed, 11 Nov 2026 10:01:39 +0000
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
Message-ID: <20261111-underage-distant-87bff35745b9@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.com>
 <20261103-charm-ending-efe2b7081ca7@spud>
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
	protocol="application/pgp-signature"; boundary="RLV/GgZW92MgkbBk"
Content-Disposition: inline
In-Reply-To: <20261103-charm-ending-efe2b7081ca7@spud>

--RLV/GgZW92MgkbBk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 09:49:22PM +0000, Conor Dooley wrote:
> On Tue, Nov 03, 2026 at 04:11:30PM +0100, Aleksa Paunovic via B4 Relay wr=
ote:
> > From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >=20
> > Document the MIPS P8700 ACLINT MTIMER.
> > Extend support for both mtimecmp and mtime registers
> > within the ACLINT MTIMER, identified via reg-names.
> >=20
> > Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Same comments here too.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

On second thoughts, we probably need to be careful about the reg
ordering here. This binding has always required that mtimecmp be "first"
because it was the only let me rescind my ack for now and think about
what the correct thing to do is...

Cheers,
Conor.

>=20
> > ---
> >  .../bindings/timer/thead,c900-aclint-mtimer.yaml   | 35 ++++++++++++++=
++++++++
> >  1 file changed, 35 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-=
mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mti=
mer.yaml
> > index cf7c82e980f674afcf59fc726742dc4f49c1a820..40acb651c27b7eaa8a20caa=
8bbc225b350088810 100644
> > --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.=
yaml
> > +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.=
yaml
> > @@ -21,14 +21,19 @@ properties:
> >            - enum:
> >                - anlogic,dr1v90-aclint-mtimer
> >            - const: nuclei,ux900-aclint-mtimer
> > +      - const: gf,mips-p8700-aclint-mtimer
> > =20
> >    reg:
> > +    minItems: 1
> >      items:
> >        - description: MTIMECMP Registers
> > +      - description: MTIME Registers
> > =20
> >    reg-names:
> > +    minItems: 1
> >      items:
> >        - const: mtimecmp
> > +      - const: mtime
> > =20
> >    interrupts-extended:
> >      minItems: 1
> > @@ -42,6 +47,25 @@ required:
> >    - reg-names
> >    - interrupts-extended
> > =20
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: gf,mips-p8700-aclint-mtimer
> > +    then:
> > +      properties:
> > +        reg:
> > +          minItems: 2
> > +        reg-names:
> > +          minItems: 2
> > +    else:
> > +      properties:
> > +        reg:
> > +          maxItems: 1
> > +        reg-names:
> > +          maxItems: 1
> > +
> >  examples:
> >    - |
> >      timer@ac000000 {
> > @@ -53,4 +77,15 @@ examples:
> >        reg =3D <0xac000000 0x00010000>;
> >        reg-names =3D "mtimecmp";
> >      };
> > +
> > +  - |
> > +    timer@16154000 {
> > +        compatible =3D "gf,mips-p8700-aclint-mtimer";
> > +        reg =3D <0x16154000 0x7ff8>, <0x16108050 0x8>;
> > +        reg-names =3D "mtimecmp", "mtime";
> > +        interrupts-extended =3D <&cpu1intc 7>,
> > +                              <&cpu2intc 7>,
> > +                              <&cpu3intc 7>,
> > +                              <&cpu4intc 7>;
> > +    };
> >  ...
> >=20
> > --=20
> > 2.43.0
> >=20
> >=20



--RLV/GgZW92MgkbBk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavQ9AwAKCRB4tDGHoIJi
0jb4AP0WjuVNWtVw7MnmG1rHlM3rJmBgGeKnCIAo1DZytJr2HgEAia3oReDA58wC
DWF/Y2M0nU4hg4g67ukM8mfRsKffTgw=
=GaSR
-----END PGP SIGNATURE-----

--RLV/GgZW92MgkbBk--
