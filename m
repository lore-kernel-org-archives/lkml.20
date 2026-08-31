Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1160433E60;
	Mon, 31 Aug 2026 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192341; cv=none; b=RVIv76QLa2VeG3qf5dFQObTcaaOMLXzQgiJwrlUaPaDOJE40e5rA0ARwCuwoZ8y4UvoOT6Mz8ia/dgTGnpxVvysoBn4doBc+y4u7DCcEN3N6/2bTlVeraM+Be3kF/qZtUx5VhByOMEJGkj/WtPPPqrmgi9eRka23BZvlzh/QA4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192341; c=relaxed/simple;
	bh=yd5Zjbf77lFiu27qGLetH8t6WXRRuUBUmrfM9GJXrSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rf734tSOqq5t1Ns8Sh32C7oVRtLpeP2c3suIEZFJS1sUBmks7mbrKyNS04vW1ozUh3D8DFASIffeXQgaVZfyhXvpIDirgzwoVCCNIf+pKRcgIWoKukkgRUqUU+LgdJuexwZ8lJokRE3HEV8q48eM1YoGNbq4IcoB7vOhjS2HpjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qqb0HqLL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qqb0HqLL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859FE1F000E9;
	Mon, 31 Aug 2026 16:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788192340;
	bh=vgR5M+6ZYz/VrjJr/mfmgzQ0+WMBSquUg5LaMjaKZcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qqb0HqLLLJbm1wUu3bd1T8JmUn8HAzoMsYCNxuLkTMLjFV7f42YTxoPz5LU73+f9i
	 J2hvr/VLjRcdrGGC/lGMO4Pgp/BP/Vyo0Rbcb2O8gTgSPPtJBr6a2D1OUzy3Ql2UsJ
	 zBdqM2rTtjIMywooILCieSX88UcCPuKaq+SYMACZijKVxd1R8JmFZ9jv0cZLzab/6l
	 mLNuENI8c7bTHrRzLCAUcyf7rOt1GQNxkyuJNEb0aR7tyb3uPxQCr0Lgk1StzNIxZi
	 ICYWpDfSLObz8PBfsj4k5i5iNjtvB7KBffnwOWJUuE+UdXcI0TBJrM/3RQ4nFznkHN
	 3hZyL8PTuEHjA==
Date: Mon, 31 Aug 2026 17:05:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the risc-v-fixes tree
Message-ID: <06a13fc5-7efd-4a77-ab0e-5f1caf35ba5d@sirena.org.uk>
References: <aog9BzBzb-2Yfgyz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gpBO5MQEQ/7hYkF0"
Content-Disposition: inline
In-Reply-To: <aog9BzBzb-2Yfgyz@sirena.org.uk>
X-Cookie: E = MC ** 2 +- 3db


--gpBO5MQEQ/7hYkF0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 12:56:55PM +0100, Mark Brown wrote:
> Commit
>=20
>   3c98c44748385 ("riscv: patch: skip fixmap mapping when kernel text is a=
lready writable")
>=20
> is missing a Signed-off-by from its author

This issue is still present today.

--gpBO5MQEQ/7hYkF0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqVplAACgkQJNaLcl1U
h9AbUQf7B+UnXcuP9U9Ym8RKDADtYl68KLf+NgVXjW+ThXHkGkoTY0hEx/SPlvfT
50+IgmMZE509Qdgs2q0gMiPJ6HA0xH1oNoqChBi83+O4xPt9OxVGJN7+yx5hWuG0
rchwEJ9G6f1Vok6nu3AFIRtZQ4S0c4JRzWd5OUmjiuZ3XmgLK8FUUwUmo8mXum0j
UgJElKqCUaj3YkV/4MPCkZWLNPDJE/WufTDcagI2sV14Z9PjtWdxvGcgeVJBe4F/
2PiQTCWIlrbS6qPxjLX2B2uyQmEpETcbmP39GVVeX1xbqVnenT9moO3QSSlNOAzl
snz9Q+DCu6tRVJ5iXacDwzjp8z+XSQ==
=TnJE
-----END PGP SIGNATURE-----

--gpBO5MQEQ/7hYkF0--
