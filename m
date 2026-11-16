Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852050;
	b=kPp8B5KDD3DGpobmoxtd/XkBvyo6ZiA5cxsYVxfdOSdgA6R0Xr8wqEG/RRzu1eIShYTO
	 GHsArt7402wGZ+Qhk1+P+769I9HTuBw42tTKLZDbCz3xKAi5oU16oE1TPgZOTf27pVbpm
	 7fqqr2Lz8E1TVDuUjOuOBwwGP2Iu9E52kHABsPXbfjfUxvKvTGuYk2dkjnyVudYhqCbuN
	 Azh3BeXc9pPSUck+i/85XdEK43EPsM24FgHmEeCbDABxzaGfpbdSSCI5PwuQongvScFo2
	 Fruh7WqMmKy9S50N7ZO1ipsFej29PZd1elB368Oqia/Ycs7Kg5E1RsM8PeN5itC2gcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852050;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/zjGa4vftK22+4ZgrHy8l4SQJaqBEhraQH3lTrIqopY=;
	b=qHMZgUzQFygSC7ujAc++PD9dLQdPr0tYBw3yeV79e81NtK5qfwjkfgZ3Ksvk7YWsno6a
	 82dQZ/6d/babAv1hxY1tbCZCmxBJBpm+78gr1EtwmjMWrV7YrCIvbLBr4tZ/6PEv2QL+L
	 Z8ND2tkHD0Xeha8c8QSpFIp4rGdlsQUGVysgDMWiBKhsdY+E3emSN8NfAOo/fo+JwaKd9
	 NCl+2fv5EpNU+/+f6InF7UbKMans41FMahWv8zw4xeuHfrYtJmx+IzAmPCfBeYe4QxI8h
	 IbA9SyQElYb6tUMRlpnCp+DdfpVzCaeBmpVic32eVsNNetCZ/H/h6djgALoYgalMVHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQZXYBNC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39D1606A33E;
	Mon, 16 Nov 2026 18:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQZXYBNC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37751F000CC;
	Mon, 16 Nov 2026 18:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852049;
	bh=/zjGa4vftK22+4ZgrHy8l4SQJaqBEhraQH3lTrIqopY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VQZXYBNCgDxZbME4v+OnHbx25Z8RhlKG494y+pte8zX6Dm1SiTZEfzITRRljf0Ovo
	 3j3vqbw9ZhWSbSKQMg+2jTc0h94/5qeeXAq8B0Du4RqASjJoleorgylrO0YSRnXlQ1
	 aO61v804YcbLMM7uAQ1xDBdxJ2jTNxY0n1WAMNdHPfBy6Xd1O/Of2iaJ6p8LOiq3JG
	 0uUMDxsRVwjqkHgOS0XiQDUx1PoofEnD4gfSz+YobhcFLLqA7EsDNQhhdDbA0fs7lx
	 R5gA3LcnJRjO13+KidknV6u1qbgZTNrW4hAopnoPh/mKHuAJ53GS1cr5ZV0ZMVMcQj
	 lhqHXIRIU50Kg==
Date: Mon, 16 Nov 2026 18:00:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mina Hui-Min Chou <minachou@andestech.com>, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	randolph@andestech.com, cyyang772@andestech.com,
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 12/19] dt-bindings: cache: andestech: update schema
 for generic LLC support
Message-ID: <20261116-deduct-emphasize-b2482186cfcb@spud>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-13-minachou@andestech.com>
 <20261113-emporium-provolone-0e7b0e39c97a@spud>
 <20261116-crazy-adventurous-cockatrice-61c62b@quoll>
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
	protocol="application/pgp-signature"; boundary="ZgC/w/fRk9AwVDqJ"
Content-Disposition: inline
In-Reply-To: <20261116-crazy-adventurous-cockatrice-61c62b@quoll>

--ZgC/w/fRk9AwVDqJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 01:05:52PM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 13, 2026 at 02:05:29PM +0000, Conor Dooley wrote:
> > On Fri, Nov 13, 2026 at 03:11:36PM +0800, Mina Hui-Min Chou wrote:
> > > The last level cache controller of Andes cores is not specific to
> > > AX45MP. Other Andes cores, such as the A27L2, use the same controller
> > > with the same register interface, but the binding only accepts
> > > andestech,ax45mp-cache. Add andestech,llcache for them, and describe
> > > the binding as an Andes last level cache rather than an AX45MP L2
> > > cache.
> > >=20
> > > The cache-level, cache-sets and cache-size constraints describe the
> > > AX45MP L2 cache, so apply them to andestech,ax45mp-cache only. The LLC
> > > of other Andes cores can be level 3 and have other geometries, so
> > > allow cache-level 3 and require cache-sets only for AX45MP. Match
> > > renesas,r9a07g043f-ax45mp-cache explicitly instead of through the else
> > > branch, which would otherwise also apply to andestech,llcache.
> > >=20
> > > Also add an example for andestech,llcache, and add myself as a
> > > maintainer of the binding.
> > >=20
> > > Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
> > > ---
> > >  .../cache/andestech,ax45mp-cache.yaml         | 71 ++++++++++++++---=
--
> > >  1 file changed, 54 insertions(+), 17 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp=
-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cach=
e.yaml
> > > index b135ffa4ab6b..da9688cc95f7 100644
> > > --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.=
yaml
> > > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.=
yaml
> > > @@ -5,14 +5,15 @@
> > >  $id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
> > >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > > =20
> > > -title: Andestech AX45MP L2 Cache Controller
> > > +title: Andestech Last Level Cache Controller
> > > =20
> > >  maintainers:
> > >    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > +  - Mina Hui-Min Chou <minachou@andestech.com>
> > > =20
> > >  description:
> > > -  A level-2 cache (L2C) is used to improve the system performance by=
 providing
> > > -  a large amount of cache line entries and reasonable access delays.=
 The L2C
> > > +  A last level cache (LLC) is used to improve the system performance=
 by providing
> > > +  a large amount of cache line entries and reasonable access delays.=
 The LLC
> > >    is shared between cores, and a non-inclusive non-exclusive policy =
is used.
> > > =20
> > >  select:
> > > @@ -21,18 +22,23 @@ select:
> > >        contains:
> > >          enum:
> > >            - andestech,ax45mp-cache
> > > +          - andestech,llcache
> > > =20
> > >    required:
> > >      - compatible
> > > =20
> > >  properties:
> > >    compatible:
> > > -    items:
> > > -      - enum:
> > > -          - andestech,qilai-ax45mp-cache
> > > -          - renesas,r9a07g043f-ax45mp-cache
> > > -      - const: andestech,ax45mp-cache
> > > -      - const: cache
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - andestech,qilai-ax45mp-cache
> > > +              - renesas,r9a07g043f-ax45mp-cache
> > > +          - const: andestech,ax45mp-cache
> > > +          - const: cache
>=20
> Illogical split of patches. If this was to stay, then THIS commit is the
> reason to rename so rename would happen here, not in some time in the
> future. Same for everything you do.
>=20
> Organize your patches correctly, not doing things half-baked... but
> anyway do not rename files just because you added one compatible.
>=20
>=20
> > > +      - items:
> > > +          - const: andestech,llcache
> > > +          - const: cache
> >=20
> > Device specific compatibles are mandatory. I would accept this patch
> > with a
> >           - not: {}
> >             description: Need a SoC specific compatible
> > like the safexcel eip binding.
>=20
> But why all others cannot use ax45mp as fallback? Is this really a
> generic block among multiple generations of SoCs?

I think it's fairly likely that it is.
I do like having constraints that restrict cache-sets etc to what the
device can actually do, but using ax45mp as a fallback doesn't prevent
that, since the constraints are really set by the soc.
>=20
> What sort of arguments from contributors are to support that?
>=20
>=20
> >=20
> > pw-bot: changes-requested
> >=20
> > Thanks,
> > Conor.
> >=20
> >=20
> > > =20
> > >    reg:
> > >      maxItems: 1
> > > @@ -44,13 +50,11 @@ properties:
> > >      const: 64
> > > =20
> > >    cache-level:
> > > -    const: 2
> > > +    enum: [2, 3]
> > > =20
> > > -  cache-sets:
> > > -    enum: [1024, 2048]
> > > +  cache-sets: true
> > > =20
> > > -  cache-size:
> > > -    enum: [131072, 262144, 524288, 1048576, 2097152]
> > > +  cache-size: true
>=20
>=20
> See writing bindings. Widest constraints stay here.

I think how this should be done probably depends on just how much
variance there is intended to be. How many more configurations do you
envisage here Mina, and do they follow a similar scheme of being
multiples of 128 KiB?


>=20
> Best regards,
> Krzysztof
>=20

--ZgC/w/fRk9AwVDqJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtEywAKCRB4tDGHoIJi
0gsoAP9cJXD82VhaI9dfpcUpcm/x197IG+YoD5kkHOlZoagMmAEArDNq7L49yZ7v
jRBGmhrDCdVo05rVz+7tQnUfm4nQugk=
=GWzB
-----END PGP SIGNATURE-----

--ZgC/w/fRk9AwVDqJ--
