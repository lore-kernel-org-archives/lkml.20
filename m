Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598788;
	b=AGUxLCbxADyFXh8XNlT65ICBwXYZ/IO3G8SFPjFXNsReOncRvFx9tQUZ5y0BQT3QLjhH
	 0900lldY2MpjrN7iKlBw2HmuTEfwmdLwMIv9URRiAWMK/PIjoTSwK8VSFNtAkxed+FW/s
	 cXoEvOSKh0XC8FzLOERULEtiLddivBta4yHYLziRqbE+pH0rT2z2iM8AC+uyS3kv0L5GE
	 Wpfzz5TSxWxIumlyd9JNpzcU4OLdY+VXri81RRrf43MApnlSyHWjm167aTY5JeLm3Wrc5
	 YC+cvXFNobTFlhp0B3CXawSuydEdkhOXWmnZgGJyX3ZVtpIaQv94vDu0brpll31+4ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598788;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ss9+xgmqEFsNenyeczQqzZzI5zTV7SYF6kFMSc6ECM0=;
	b=DBRub/X18dvh2VUObOzFxKmu6psMKJ+pwjQdPSEqGMeGWjSK2pIVYvEitKG2r9OTpkLT
	 0NgRI4H/DkpaoYJO7B1MKVq2s19KUc/Wgs8xlPTU6npEW+pWBbKyT7uHyKyScr7pPYFIx
	 ik3Qo5ufyT0uO80tLgH8nzpfMHFMlqFI3xVrwk/gFelnU2Eu3/pZ556ziIkR+LZqbw+7k
	 quusayRtwlr+mrN7PlbuTUDWmNpwAy99jIVRQbusN+NZvGkn0JhLZLmOlmkZe1ykAK3eB
	 MxSFQ5SOrhiXJ/bbT1ayoZGPEk8ULABQi1wFQEZa1BnFxUYyfGNiw6Cwju3Lw5lKDcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJY4eQXA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F4B606A320;
	Wed, 21 Oct 2026 16:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJY4eQXA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5151F000C1;
	Wed, 21 Oct 2026 16:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792598787;
	bh=Ss9+xgmqEFsNenyeczQqzZzI5zTV7SYF6kFMSc6ECM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BJY4eQXA4jwWnRnpNpNaVp3nRcgWyZui9VH23ubqT8fcYth5ZPk4f65s1+kY+bGjU
	 6FjgeDOJMm7lrYrkJgHksF7feOMRw863hLJCYxXJTJ94sfkul5938cx3fkzN1fqKIW
	 1+NNPDxldSFVGty/uRBvfZqpI1XYlIeFGMUIjKUmF/tWrXHOycCZNrbBxD5i+Pd0Nt
	 7DoEWLlBpxUZZ3+V6hrOe4zzRO/Qg8+2Bcdipq5LxeQNvhbMRL3RoyAveoucvOYDBk
	 gUrUyXn803gyhHqGkB5v5SJfnK5iu93uOrsfCkyXobuBC9hKKV3ohsKuUsfavnN4ge
	 Fex1LYOmCt5Pg==
Date: Wed, 21 Oct 2026 17:06:22 +0100
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
Message-ID: <20261021-huddling-fabulous-75f0298c2fad@spud>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
 <20261002-prepaid-retired-3d2c9cbc035e@spud>
 <6uiccieqybi7rmdpf2bjgfppjdgpzt6sollr2y7ygex4ofssbh@anwfmi6qbyxp>
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
	protocol="application/pgp-signature"; boundary="vNj27yPJoswN/uUL"
Content-Disposition: inline
In-Reply-To: <6uiccieqybi7rmdpf2bjgfppjdgpzt6sollr2y7ygex4ofssbh@anwfmi6qbyxp>

--vNj27yPJoswN/uUL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 05:30:11PM +0200, Ernest Van Hoecke wrote:
> On Fri, Oct 02, 2026 at 06:05:24PM +0100, Conor Dooley wrote:
> > On Thu, Oct 01, 2026 at 01:44:11PM +0200, Ernest Van Hoecke wrote:
> > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > [...]
> > > +  "#gpio-cells":
> > > +    const: 2
> > > +
> > > +  gpio-map:
> > > +    minItems: 1
> > > +    maxItems: 4
> > > +
> > > +  gpio-map-mask:
> > > +    items:
> > > +      - const: 0xffffffff
> > > +      - const: 0
> > > +
> > > +  gpio-map-pass-thru:
> > > +    items:
> > > +      - const: 0
> > > +      - const: 0xffffffff
> >=20
> > These seem incredibly wide for something with only 4 gpios?
> >=20
> > Thanks,
> > Conor.
> >=20
>=20
> Hi Conor,
>=20
> Thanks for the chat at ELC and clarifying what was said here on the
> list.
>=20
> Regarding these masks and their width, they are indeed wide but they
> determine what to match against, and we have no reason to match anything
> except the exact number.
>=20
> This was previously shortly discussed here, and clarified by Rob:
> https://lore.kernel.org/all/20260918192012.GA1465432-robh@kernel.org/
>=20
> I'll be sending a v3 of this with only the camera patches soon.

Ah, in that case I actually misunderstood the purpose of masks in next
nodes entirely!

--vNj27yPJoswN/uUL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatji/gAKCRB4tDGHoIJi
0gk5AP9sxjRlNjRUSh/6dQ4BD47xtrUFBlTOxV+oO53kFSNxVQD8Cwha6XPXEsBi
zZUmL6R2o0kyEqfwJlJTyz/W24/N/As=
=OKoW
-----END PGP SIGNATURE-----

--vNj27yPJoswN/uUL--
