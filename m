Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC3850EC0F;
	Fri,  4 Sep 2026 18:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547341; cv=none; b=DjCDrCgj8OS2F9bEGuu2a4yBgNHzhf/8+FGpsweKVOlakjvtxbRsrb33nacKmGJgAlL+kJR3QZe/na406SXVrRKQ6Odm0vXbXRglfM2sz4+z4V0gmmYhOUx4MnFEr0a9+3MSQUSX48IZhePlR0IpbZm/zzgppdGxiUT7df8NYrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547341; c=relaxed/simple;
	bh=mPlFGeTY4x9EKiX6pwVE/FrZNO8GA/VdoNDTODj711s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJVkBotdKU8MKQmGNJYCQho8qcTCEU6nSFxevxQqC19YsXE+c6Qg+k1dbfJ1eIL21+dbxRO1Ccs+8v26bgquHcxzap+C1WKCszcrmpP4O1WmPv6kj5t8dBVohD9eTVZqaxVUdikEbwi9QGciRtpHS/W1M0/2F7AGXTrhopwkz0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFAbFE/p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFAbFE/p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884C71F00A3E;
	Fri,  4 Sep 2026 18:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788547339;
	bh=ebecXcIwR+7D1W4wG/5+A/T7uMD1rlcubhgoQrAcvuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IFAbFE/pAp2cWPYG5E9yvGGE2Lt4sxOUEP1XOvMpQY5Lv9yCz7sBBSw1FyTO7cyEE
	 ZuEak75A6HiZAlr5NMqT3LSRkysR0nS6WREtyHoHH+oWAJy1x1D2A9xBV1uHUe8TjJ
	 R7QwT8zu73fONh0uXxbgU8Ri7hJHPNc4H2fXoGuVBDJi22vsi3SFeZzA4YbUdrnJLx
	 7UVMui6QVeU7f7mjYQGkbm4qX/0tdxDcA0I5i2evfi25MOPBJnor+K4uY1SsT/WJqb
	 vO9tE0sx4PRLJ7imycNUSefDcO6KsUGd06TlmVT9zZ+NSF9+4hQ2yy4k+TyBPgwz6p
	 sN5OFM09iJ4hA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 723991AC52F1; Fri, 04 Sep 2026 19:42:17 +0100 (BST)
Date: Fri, 4 Sep 2026 19:42:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Disha Goel <disgoel@linux.ibm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the origin tree
Message-ID: <apsRCXAwhTMK9Fis@sirena.co.uk>
References: <apsJzO0mzuBJhH8l@sirena.co.uk>
 <20260904113558.b8e68cf4ada8ee538ffafd76@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z2I0IbAwTujbFhO8"
Content-Disposition: inline
In-Reply-To: <20260904113558.b8e68cf4ada8ee538ffafd76@linux-foundation.org>
X-Cookie: My vaseline is RUNNING...


--Z2I0IbAwTujbFhO8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 11:35:58AM -0700, Andrew Morton wrote:
> On Fri, 4 Sep 2026 19:11:24 +0100 Mark Brown <broonie@kernel.org> wrote:

> > Today's linux-next merge of the fs-next tree got a conflict in:

> >   tools/testing/selftests/Makefile

> > between commit:

> >   4ff32f084c158 ("selftests/filesystems: fix missing and stale TARGETS entries")

> > from the origin tree and commit:

> "origin tree"?  I assume mm.git's mm-nonmm-unstable was intended.

gitk wasn't picking that up for some reason.

--Z2I0IbAwTujbFhO8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqbEQgACgkQJNaLcl1U
h9AsAwf/cH+aLlBL2u0lQGfuVdkDakKl2M/CJuk6hTHkaRyIVB8/HViMe9MQUi7C
1JuIw6Wkwu9X5YB9Gyj0inLs3hp1kwCsNTP6poKdB/WPX+1X/GqpePoRPInQbePQ
zJ236dAsZoAiMVaBfADlkBxbDlmmy3JjUP82uNzS5xFnTiZEMLF+6jLBWExNJ7O0
01IeBnwD5uzZGO2BP0DU6+jcXMtSFaZDIPzKhVW3Z3s0mk4xMUmDYymI7dCTn2/A
9In060zptvK9N0AEg6Mbldm25PvzI3nkT/CrJ/UcMIrqKtymXiAXxPFE1GL8YRYW
/k98u85L+zIQ9hdbiBoI0qPmV9LRLA==
=IY7K
-----END PGP SIGNATURE-----

--Z2I0IbAwTujbFhO8--
