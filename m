Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F832BDC1C;
	Mon,  7 Sep 2026 23:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788822440; cv=none; b=RRfm/Byr6HPlLzkNENqw6irUGZuFdVvrW3wOyfysqh1mYWMSwTsBR3yqcUynZrW1Y8Pcy9DhBnVK8cITnBkCxv4UZaZnAHpnHTX39Dv1dYAcjm+I+Sz0Q2wDIit2+9zsCiblaRXJt8BDZr1RHFDglSgmKI/muGL7QuXCbc8gdl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788822440; c=relaxed/simple;
	bh=w4Vqjjo1rMQstAEC1sDPqoS7HV1R/huNQSVRRbxLXwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvoGmhc0qM0qWy7mJbNHveIRcZ9IEOn2TPg2E8kzt3X2X0dJwAthVEjZfYd3Sz6N4/dqyxn3HaCpwaUukRDIVImOHcqrHq/CXhCTrIfJyvb8m9VRJfMNHH+8LikeubLMBWS1C5FwlSNTxknqHjr1HrUYRIhBLozIdF5JUmA1LcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1oH5V13; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1oH5V13"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FF61F00A3D;
	Mon,  7 Sep 2026 23:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788822439;
	bh=f/4d4IN+qBFh1B1IknCrA4bGRsQt1D2A5ff7dwo1pxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n1oH5V13nX87wg00si/nN5+qe4slrPKexZ73JycGnrt6WAIe14fZlqurPhw6drcQ9
	 wmpuLh9UnQdYiJ4kjed4Dto0EA7a6xUQbCVppCKCfEwcDsPTFzD4O8KFrD/9vdbLAr
	 hPe87ZeSSFEdRfrlsuNw3q366uryNBdbwukH2Q0DBud7T5dVIDOhk5jbxQveqjLpjb
	 Y4/m7jYkPZW0vB6RQ/wgrwmQ/Pxk+MzgP1UmpKW0jjFUjP522FDwMnsF1Cc89FkCUs
	 cmIHFmsyXEqksNy9HbjY92FkD1g2Dtky8SU4lJGlcZNa1nn9vYpitk2Yc3puzu2PyH
	 qSV+03DjTxaJg==
Date: Tue, 8 Sep 2026 00:07:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the risc-v-fixes tree
Message-ID: <c9121ef5-77a0-4735-b02b-f63086d1449b@sirena.org.uk>
References: <apa3G5qHROwJl5PU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ejg5FKtbIPitSc8"
Content-Disposition: inline
In-Reply-To: <apa3G5qHROwJl5PU@sirena.org.uk>
X-Cookie: I am NOT a nut....


--7ejg5FKtbIPitSc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 12:29:31PM +0100, Mark Brown wrote:
> Commit
>=20
>   8718e5a3090bb ("riscv: patch: skip fixmap mapping when kernel text is a=
lready writable")
>=20
> is missing a Signed-off-by from its author

This issue is still present today.

--7ejg5FKtbIPitSc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqfQ6MACgkQJNaLcl1U
h9AsQwf+ILvV/xkMAsNXJ1rmIm9OcZwjna55MRJonl2DNxsCXBxMwOvD3BBL1IY3
RZVXfX3Fc5tzDawLoLj82i4WqbgS5tIFbbKNaEzGV+cV1XSFq9E32McNzt5fb+y0
vDUtyLF1MTf43xe67auweAn/KpMagE8t6DOeHVpCwgYbHQM9CfUqjh4pTcCzN50F
KnXM/sMT67rtdVDD/LzuEfVnTLL9/no1nTu5MWf81y3t6BtvB5sprQf5jV+rxxNM
iZ5qysm5zgSYta3NcCD9J0ULgfPoK4GjJ1v6oJohyZwRLs4yoLQ2IZbeiE7vleQN
xrU4r/3YkqVX2shiI4PUjAJk6jW0RA==
=0NRV
-----END PGP SIGNATURE-----

--7ejg5FKtbIPitSc8--
