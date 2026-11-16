Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865891;
	b=jX+NDI28BiU2/URUOjYedKRCDxP/J0feJ+FbEa2284a08rGTJHI3TB3sQjUnBT4abdhp
	 TI0vaXSWAazGoB8SWd6ZoUIlCPaIrr9ePDQIrQExjXnXHDhVWX8OzwDe78RZuT4ueeoDb
	 wOnJbRjPqi3uXsxdet6EmzrTP6K/NGOZV7FxIIdiGcSOHV7IB4xxb5hdM5BA+HbiqBryI
	 lXOl39ncbQnunANS5EH1mMyAbNKuw8ghIoroWuqGOL3rZ5HuBXBIWvI8ohWI4qsmpjAbk
	 FM3pKEXNv4i7qWE/oz6xA8SFTQKW6XEH4wTR+Qk3R7/qfDjMrYTjZfZM733L/Sf2kfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865891;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=UM2V+OGhGZv2cKwnuZRMeN4nDl0FU/7LHyfuPTeNZoQ=;
	b=oDrLTJE/TRI5v384GIblZqxZibNWZKGF4FXWWDVT7xmqXw5XffQIksbK4Fj2rjB0rhqu
	 7f7+YPOUwUta5Gpjyc2KPKOSgMPA8JXiOOU+WLjyeqLxnb8vLMDgKDjJ92xnNWK48zgkS
	 95Wl3BssbaIIGc18N56YZu5X6HHnp36C3UHoFkB6C6X78sx40Mq1hIE7X12MnhfveHXNq
	 8hD45MI+S91k0DrTtuJ2MEAXypiMpLY0lO+3pvS06qEUsCDRY2K06oTsKtsE+DeQi1HmE
	 EwaNKM2vZozlxBbtaUcVUP5a4aDFQ3gPdOeV0Xx+mwRj+2UdLhl4hzadr9nk/5ayGTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NAQ0/w12";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F87606A31C;
	Mon, 16 Nov 2026 21:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NAQ0/w12
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78051F000C4;
	Mon, 16 Nov 2026 21:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794865890;
	bh=UM2V+OGhGZv2cKwnuZRMeN4nDl0FU/7LHyfuPTeNZoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NAQ0/w124SLJCzJOY85CnmtN/PeWA0QmiInN1swqEUSKbo9pPN13aBB+UmCqBdZZ/
	 lJJdUQVDZ113aTtzmxXcxbwVjgtEvNu8NaWiPddI+PJGY9OHFgAIhpDST1BHIyFnMW
	 8nmR+1vVgFq+8Uh3naXSzRcuAibyVjQj5oAl7SYPp8pTprwFSt00p74938WLV+p99k
	 p0o9/Z3Jg/z7muWl8PqFjWKHeThhpJim3NzuR4kDl4TXMeNeZNk55jgCHuIBmTworx
	 8ezCjZtCoY1mIVpP7QHWeo/8WKwMFRSgeNETecAKxjV5dWrknFy64IGLITLM6TwY/Y
	 qbcMDZtcKXFeA==
Date: Mon, 16 Nov 2026 21:51:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the thermal tree
Message-ID: <56328964-8d06-452a-adf5-ea37fede069e@sirena.org.uk>
References: <au4SKRePRjYBItxx@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="khrs3IThEh+m/65T"
Content-Disposition: inline
In-Reply-To: <au4SKRePRjYBItxx@sirena.co.uk>
X-Cookie: Serenity through viciousness.


--khrs3IThEh+m/65T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 05:45:13PM +0000, Mark Brown wrote:
> Commit
>=20
>   115b4ff52cd35 ("dt-bindings: timer: renesas,tmu: Add SH7305 support")
>=20
> is missing a Signed-off-by from its committer

This issue is still present today.

--khrs3IThEh+m/65T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7et4ACgkQJNaLcl1U
h9Amhwf/UjYt4OJXH8pHQXNXbOQ/55/dTD8L0/A+EEB+6dEAGjke+aEXqezBcNB9
iWOywYjWi8MG8OYPbsDxwuP2eiKe1JZzHgHfbfSsE/AFBQBTXiHYeeBaVWgwZDEh
lngfwVyG03uUEa3iA1AGCZBAXBvuQ/nd7+XaSgnCoOzb0nxM87Nj+ncmImQ6kFOT
YYpObr0F2mbsnyX4Hm9EHjv3Y8maQuQK5k/zkm5jgfo9HTtxw5cqIcLcYwIibZNd
IccxrxN6aEyR3f7vt9/uX2B2FkIIYhgCNC98KDHG11dPtZCMV3jJsNOGfyQZvxsJ
eY7H2FHmX2XeB+RvUPF0o5aPwplG9w==
=szXw
-----END PGP SIGNATURE-----

--khrs3IThEh+m/65T--
