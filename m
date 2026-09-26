Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E2B35839C;
	Sat, 26 Sep 2026 21:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790457689; cv=none; b=s/nIGoeF9g5I3p8ZzzItbnTOuFV2WghZKucXTeBow4zlSoHkF3SHIheYIEOgnq0v0lXnLKgwc3gj9jMKqEFPdtD5ifFKp7OHNX7NxcECdGzxOQWuPoxI8HBRIg4J4KUBCk8VVTsH3Z6RrRR1IWPDn5Xr9TK/tiuFF7Lp97JGiYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790457689; c=relaxed/simple;
	bh=WzgW/1r0ttSUIpIcdPEpit9PDEILiICkMQfeo421xGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXRzU0fRai7WktbbunbksRQQ/+BhJ7uxrXlGGVaqm5QgKQxMKMPjr0XA55O4Yt9Evbuc0nEEnPPSIHg76ODnGGdSMLnKS5UYKeA18yiHsWj7cGji82IZLpW5eRGWgBqlu+TNF+/QEPDGUm0ObQMn/br+iYWSKsr+Q8cfIIwW2BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXMDLunG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXMDLunG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EB31F000FF;
	Sat, 26 Sep 2026 21:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790457687;
	bh=5W3yNoOtZtnOfw68VsFN1xiJeAXIfHZB0zCCY/1MVDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JXMDLunGXAksKM021Y7G0vxqLl79Q/aukKhL624h/d0Qta0K/sSFLX9mD7sKaoFc7
	 WJFXW+z8KCexB6qe2hCVsnDNZwxkAgpRG35Q+1dd8v18r+EXKA0r8mS9fdM64jZCne
	 tHK4UMUlLeQvHIb45x+CnJ87Aga5Bg+aJbsQp6W3yi8awr8JfT/kzVhs5+BNPn9SFi
	 8Ckhl5MkyaE1DoohsXQx6qMvJxEzMo8BIimBFcPkp9o778f2O+5CsPFA+pZk7WCisH
	 X2tsqk6LSPpAiTmhjfszMAvtUfSyPj3zHvRKcE9YVRf8N4Ud3ju3wiAuL20giVx/c+
	 P0BMEuw76sRjQ==
Date: Sat, 26 Sep 2026 22:21:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Joshua Yeong <joshua.yeong@starfivetech.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"rahul@summations.net" <rahul@summations.net>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"lftan.linux@gmail.com" <lftan.linux@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Message-ID: <20260926-peddling-share-5e5e8dffaa63@spud>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
 <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
 <c2c57bf0-e610-4353-93a4-84edfd08e767@sirena.org.uk>
 <SH0PR01MB08411AA7F403A71D2D7470A6F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <0db3ed29-8bb8-4dc3-a4cb-cc5b9bf2e893@kernel.org>
 <SH0PR01MB0841C933DE1E00C4012BDF53F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <ed0c4c67-6933-455a-937d-f5888d124538@kernel.org>
 <a5d0d4df-7e8e-4f12-b011-e41b66efd8a7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="noJw7wHyYsY2Yo5K"
Content-Disposition: inline
In-Reply-To: <a5d0d4df-7e8e-4f12-b011-e41b66efd8a7@sirena.org.uk>

--noJw7wHyYsY2Yo5K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 06:15:35PM +0100, Mark Brown wrote:
> On Fri, Sep 25, 2026 at 05:18:08PM +0200, Krzysztof Kozlowski wrote:
> > On 25/09/2026 09:14, Joshua Yeong wrote:
>=20
> > > While the above method works but I'm trying to get the entire simplif=
y to the following.
>=20
> > > user-app-b {
> > > 	compatible =3D "...";
> > > 	voltage-domains =3D <&rpmi-voltage 0x01>;
>=20
> > I see. Why power domains do not fit here?
>=20
> The spec seems to map very clearly onto voltage regulators, it describes
> voltages in mV:
>=20
>   https://github.com/riscv-non-isa/riscv-rpmi/blob/main/src/srvgrp-voltag=
e.adoc
>=20
> I really don't see any problem describing this as regulators, it seems
> to fulfil exactly the same role as SCMI regulators, supporting things
> like SD slots where the OS genuinely needs to control voltages on a
> mostly system power controller system.

Unless I misunderstand your intent, me either. The binding permits
having regulator subnodes too, so culling this "voltage-domain" business
and going for the regulators alone shouldn't be much of a shift.



--noJw7wHyYsY2Yo5K
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarg3UgAKCRB4tDGHoIJi
0hdiAP4qRPL8bULjFmSy+m3ZF2jcF4n1odXK4QIHasn8v4D4KAD8C+OFuee60ZJj
k7fDaW1VQVmsHl3wZ1X62ngQ6Y9p+go=
=E7zU
-----END PGP SIGNATURE-----

--noJw7wHyYsY2Yo5K--
