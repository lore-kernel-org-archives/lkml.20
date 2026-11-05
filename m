Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906081;
	b=l6QI+RLYuy7uytXI6rr8Reg2gpE8orjO0ikHZqDeI509ZSAmowS4V+2jQuqOz21msozU
	 Ef2qv147WQfwNknkNReDgFFkNxvHFOMAgsLIEXpUhFnah0mTaXeItZu3doOenTDGjWTaw
	 ZQXs37uP9yJnaZvBvjl91aRjJghr+UJFriSJgi+BBw1JjdDCcO1lPOZW2fKgAyIsUbZXt
	 IJUQWsDtlzIaOT8pRXudtXLd1WFvJN3WDVLOmCwIAjlNPwDx1TvnwPnMiZfLXZsfNdM3t
	 sWza8vo8i0yrQh4ClACkv2AdZB9NX4gt70ECSFTlKeW+HbBJZ1WLa4XF/YemI1LtpUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906081;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NAUY23P/8t0bmNcA3J0QS9bQ/pAXdYpwFgDeuwmYbKk=;
	b=nDbqL6nH1E/sa7r1/D0HYDEtU5tHAtB2x6XbOHyLs2PhdNbJtHz5/fTToyH1P6AmKNfx
	 /Oyegjf0xNzGMVyA0XQPsQjr4yVZRjFNRUrlG/xYiRoHyCnYZLq4+YyfD6r93Mutf/zGK
	 bcQcAgQDRihpCjHLqkXlIBDQ8GWfZ9aEk8uGhv7Ep01vK5c+HtZlyFrCWX+xb9/6B2orZ
	 womkBMON763iBXymbxRqgrsT/2/Lt6oNFA2e4hdmslz6kEFNCuJus1k66qFqmzwpFaAQc
	 2okqxvSEi+0UUcxp44lqBj384hL6Ac0WUl5L/ybt5R0bmRISwO2uplUGvScGCWRG1vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="M/o0NOAD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C23606A31B;
	Thu,  5 Nov 2026 19:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M/o0NOAD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDFF1F000C1;
	Thu,  5 Nov 2026 19:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906080;
	bh=NAUY23P/8t0bmNcA3J0QS9bQ/pAXdYpwFgDeuwmYbKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M/o0NOAD+2JcYZv8V+PJNEuXzZjfOOSY0bugLJGMeXYYx+nDnfn3RfBI0nD91BsI4
	 FBEImlxS29cy26PiqRYqxOkgFIHMK5xu0kFetm+uSuuVt+EK3HpvaysBucIZHWpJ9P
	 mERTZZidFVUYctgNcK7PDHr/JPu3lKk0hfY1auGeZUvi9koXO55P6HAhgzprxxCfzM
	 LeBTjnTkTyC5tPkYwCn6pbZb7TKYIIO7Wxe1CLbo7K6a0XVDsOlGDr6tbIF9ucESgs
	 AlWNJhxY20k+R1H9M+FuWe1q9H2QhbhD6fROu/+UTAiibapX350t7U8e054V7HUevV
	 YSCeUfj95nXrw==
Date: Thu, 5 Nov 2026 19:14:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Lachlan Michael <Lachlan.Michael@sony.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
	Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com,
	Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com,
	Yuji.John.Takahashi@sony.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
Message-ID: <20261105-disposal-robust-9556e8357778@spud>
References: <20261029050002.3880-1-lachlan.michael@sony.com>
 <20261029050002.3880-2-lachlan.michael@sony.com>
 <20261029-distress-stimulant-cd5bb18f5ae8@spud>
 <8d0a7e8a-f8f5-4896-b2e2-2f42f1e5897c@sony.com>
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
	protocol="application/pgp-signature"; boundary="x4lACau3DeBapw/v"
Content-Disposition: inline
In-Reply-To: <8d0a7e8a-f8f5-4896-b2e2-2f42f1e5897c@sony.com>

--x4lACau3DeBapw/v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2026 at 01:40:45PM +0900, Lachlan Michael wrote:
> On 10/30/2026 3:41 AM, Conor Dooley wrote:
> > On Thu, Oct 29, 2026 at 02:00:01PM +0900, Lachlan Michael wrote:
> > > The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
> > > with a MIPI CSI-2 output interface, supporting RAW10 and RAW12 output
> > > over 2 or 4 data lanes.
> > >=20
> > > Add device tree bindings for the sensor.
> > >=20
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Acked-by: Conor Dooley <conor@kernel.org>
> >=20
> > This is not the tag I provided, I never provide tags using this email
> > address. Tags must be used without modification.
> > https://lore.kernel.org/all/20260828-hedging-olive-eaea0b4027a0@spud/
> Conor, my bad. I honestly missed that the mail address was different.
> I understand that it is important that review work is attributed to the
> correct person and organization.

Just either copy-paste tags or use a tool to insert them (e.g. b4).
Don't type them yourself based on what you thought someone used, it's
probably slower and mistake prone..

>=20
> Sakari,do you have further comments on the current v6 IMX908 driver?
> If so, I will fix this issue in a v7.
> If not, can you attribute to Conor correctly when picking up the patches?
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Best Regards,
>=20
> Lachlan

--x4lACau3DeBapw/v
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauzVmgAKCRB4tDGHoIJi
0io7AQDEzJEH/ZPLPlERnC6DwqZLWKDEb/6D5JRaT6TQIT0MkAD+JQd6JrcdRvE9
TU60duI89Lg/6UyqWcAj7vKRW/2xngU=
=Ri3s
-----END PGP SIGNATURE-----

--x4lACau3DeBapw/v--
