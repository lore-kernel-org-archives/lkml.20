Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914288;
	b=hyp+v0kd9KqLg5FZZYOq8oT6wx8QgUTsAfIq5yTHdw6YcsoJG7lD6oeEuJWntkn34Nt0
	 0Jf9Yb2Ed5t5ZhcMa/cQKcjw+TwoGnBNZfqkcpEEVs3onb3eifYpu9KMsKeFs4BmPtP60
	 jvcJW8+Cfw93bGBQyJL5uckQWZaRpaBS8s8wZEJmbom1aKNAkQJLas5TlPdLyE0gghJ/c
	 N+SolNx6HGWkF4Ren5yN5aqokZni4fipCqmjeOBeK6GvH1s2SQHl+iX//LyOvIhlPsT/q
	 7TWhJjOdno7hOv4d6CzSVTg/sJImHN7VwxP3o+7+T9hTe0wZE1YmaVb2VRUZjaGYAvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914288;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=wqzhxj6zdIE6ZSDYmdmNXrrSgmV8Eqf4DtT3fpZtyoo=;
	b=AngltIo4ZCyXo203yZRUf7xUY8gSteoKGayd156lfNnVgfm+WuKBtl11x3rTDuD31URP
	 uiXe8fjsjtLIyw7kSuqwoCkLbJL/OymMatD/ABW92SpwKWMz9HB0jLBzCl6FV0FhPnuyE
	 3IyCsWlWvx0y+F+XZl8hRw2y2/htwp4vgyNpjV1iNgZoxdDVV4CGOCKAoYA4DR5Io8JA/
	 blI08kkJKXLNla4vhMXD9u0ehjKdKOIMlMI7L9qYRZIs8LtCd5xcRjsgbZqIMqH+OefqO
	 3hNN1tIA9c2tmveZvFuFUVdUdkgn6ttBVT5gIL/HAFNyxasNZhR1q08V1xEwGmSHrQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WfOgorYP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE708606A330;
	Tue, 17 Nov 2026 11:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WfOgorYP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02501F000C4;
	Tue, 17 Nov 2026 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794914287;
	bh=wqzhxj6zdIE6ZSDYmdmNXrrSgmV8Eqf4DtT3fpZtyoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WfOgorYPM4Tph0fJ6ofMTnepVS8pl7wm5q8SxdPOmOAoI5pQY4kMfoMxmoa1GJkb1
	 NzmtsYARC5qoWawjFMT/MzTNJGsyFxZ5f/UoF5GKJdYzuKsFjbAyKLovZPJiDvGU6R
	 xW7H5Hb0OU8cOr3J8Z1c0V6+Dw8pheYSdiD9LWrC3ZT83nATWp6EHP1ip/TL8On+pb
	 vIfDn2cp8NzUxVKDH8yUHA9yCgc7CXpV6ww9CpYwuF2ylQBkN6tlvIHtlEI2Na5clD
	 ip5bIB4X++wsu7ICGjAFvK+h3vHArNev2qywhyWjjwr0LTizBcAlgv4XtcUhgLF3rV
	 udlVHgSZo+O/A==
Date: Tue, 17 Nov 2026 11:18:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the mfd tree with the origin tree
Message-ID: <56691895-b885-4c63-a929-c4cfdd7a2dde@sirena.org.uk>
References: <avtYstt11GO7g85R@sirena.org.uk>
 <20261117104722.GB64850@joneslee-macbookpro.roam.internal>
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
	protocol="application/pgp-signature"; boundary="oe0GD9DA8ufxr79a"
Content-Disposition: inline
In-Reply-To: <20261117104722.GB64850@joneslee-macbookpro.roam.internal>
X-Cookie: Marriage, n.:


--oe0GD9DA8ufxr79a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:47:22AM +0000, Lee Jones wrote:
> Kees, et al.,
>=20
> > Today's linux-next merge of the mfd tree got a conflict in:
> >=20
> >   drivers/mfd/nct6694.c
> >=20
> > between commit:
> >=20
> >   4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_k=
malloc_obj() family")
>=20
> Is there a branch / tag that I can pull this in from?

It's been in mainline since -rc2.

--oe0GD9DA8ufxr79a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr8N+oACgkQJNaLcl1U
h9DcLgf/Y6/a+5eikX9AvsbmHS5SS5oamU+U5wJHM0ZmePcaLIqZE102QVanfRoi
THIxPZOUvYinBuDQZenzgLg3SrBaiCpPW0AGrDOfNfGeh6kPH2TlOtaqMhqPP3s7
9M8Jdn0C6SeMrKVZxH7fu4MReiQ4unbcCXpGKPQB72y99hHrx28AZztdHb/n89ul
bUM6s0KuY6fxn4ne5twav6wgvO1maiVy+Ynv060MUIljYqPlboYj7j9TIH0cw8bg
uNH9B6iRxhSItgz6tDgtsSCp1w5+H47lNI0PQEt1qm4ZIICunR+WQuHWK8hnx+Bu
tO1Y853kVvw8K0ReKAaey2+CFU3VWg==
=QWTv
-----END PGP SIGNATURE-----

--oe0GD9DA8ufxr79a--
