Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991430;
	b=tMdh/A7phTjNXNfRWzN0+pothi9TrkRdZL4nOGiY3MXUi3LMtDdFJvvh3LzPxaP9jtnk
	 xwjqui4WtaVTvW8NqoBeoJiorz3D9yW4x8OZmw6gZN8o/ptYS6Uw1lsKH6p4WWb9enmYB
	 AwKiSgxfD5Z/8izy32v4k5Gwh3XwoZUz4FxnLeiGPYL4RkGyG3VXweCzWn85y5H1nD0Q9
	 hoZwypY/XI2ihTVPTxDBHQ9oqkhT16WsdQ3x+jMWgx1m4a0tr8HEFC05sfLZitjyXMQrK
	 lSsNHS72JQRyY0ZHsqerJ151pvBMRiSKJcnEgPsEzwKNrYItQJawtoFxIoIB28s0Azg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991430;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9X5cmDvSvndpVWlAMMG2RJrYEa7fV2+mmO9l1RBVXRQ=;
	b=U23EO9zyfxdwLdib0RGCKWSHMV+IYEgAWwXztyCS3KPKKIdHJvC6FtHYGYACSLZDt1xy
	 RIQbTJEa+pkzCEJ+l7M1FG5wWg1bU18huEs+1ACVA6wh/Og75zOdPKxe1YAvYB0NW4De5
	 xp7QvEXGZAuqIs9qTeS6sMZxwdFDSQLcjayG1Sb0m+xjYxBCqsOebNY5XdEgph+7I6GX1
	 iVnkggz6az2D2xHWY9dXZ12fuytSaYB9SEbeqR6mb70IKe1yhZHmcE5cUVWdZK688GhXS
	 3L/dhFDQyNSNJB85E2liMGUREWKaDvnYYVnmMthdD6sUi4tXoxtYr4YdTyferNuA4sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BC9igApA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A85606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BC9igApA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C0C1F0089F;
	Fri,  6 Nov 2026 18:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793991429;
	bh=9X5cmDvSvndpVWlAMMG2RJrYEa7fV2+mmO9l1RBVXRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BC9igApAJ3+oyHsxdq+SDOgT6VdDnvjBSt5D9UQvL1/KhstaKCoQsfii2EIwATVOs
	 4vELkPWAEySLtBDwORpyDGZFWUHmu+VE/lpDThwJgu6X+/Jdyhta5gyIKbLjiN+xsr
	 75FOvEsKh3UWIsQEFANOKdAbaVWYFH8XgdzYH6QTaExqsGFMEzbMhyagzp9VBTptAQ
	 Y/tqoGsB6UD7EnPiHyfqkqaxt3bmoiu/7NRtobfJp7+7f3lIsv1Tat0CP15FkMTzAT
	 d/wVrspiNJ0goHMsuRUtmF2o2XiOBDnhS8dHu+PHkF2/6KaJSpeDit7aEA5IOHgIoY
	 qboWJk0I7c1Rg==
Date: Fri, 6 Nov 2026 18:57:05 +0000
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: dlemoal@kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: RISCV: canaan: Deprecated (oficially) the K210
Message-ID: <20261106-valley-frustrate-b7708435b786@spud>
References: <20261009-ee797bb64a30cf907f583aca@squawk>
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
	protocol="application/pgp-signature"; boundary="jbBY8uOWPqvIAK05"
Content-Disposition: inline
In-Reply-To: <20261009-ee797bb64a30cf907f583aca@squawk>

--jbBY8uOWPqvIAK05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2026 at 10:29:53AM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Two years ago, at LPC, the only known user of the k210, Damien, gave his
> okay to delete the platform from the kernel but this never actually took
> place. Deprecate the platform now, marking it as broken so that users
> will have to explicitly re-enable it on updating their kernels.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>=20
> Another patch written during a talk, but it's simple so suuuuurely it'll
> not be broken, right?

I've applied this for 7.5 with a modified commit message to note that
there are two users.

--jbBY8uOWPqvIAK05
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4jAQAKCRB4tDGHoIJi
0hluAP9t/Spm2kQMtxMqbyXXRHRGTQLtsI/cTnf2UGsXIGRF1AD/froMHarwdz0o
Pb1vRvJjDQoKPtcTvDL0lEZ8bl3K9wY=
=oIMy
-----END PGP SIGNATURE-----

--jbBY8uOWPqvIAK05--
