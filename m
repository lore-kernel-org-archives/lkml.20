Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1944D41F7D8;
	Mon, 14 Sep 2026 09:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378989; cv=none; b=MbtiPXUAs9zTf6WektSdXYqB++S5JFL5u3iRH0DxqJYUyE7bR/VJUVo2krcPThw7GLra3ccP+MeoPDtKvU1owJv2OXrh58kpoaXAEHJ0Tt6AaCqrfEIKwdoTlHtF5l5IhXMMSaz2Oys4VvuI74OxpWvQqwAeQQ4GctftI12t9GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378989; c=relaxed/simple;
	bh=dqhFnKX6BsMaayE2MBXBLykok5HiAZKWO0APo11bD9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J6yl/zXun545vpmV6MWpOHDiZg4KwIwlYo6sJR+a6ydo89mFP58L45ZmGueq9qHNpFL2fRoGKig1BQ6eEelxVHlbSVNQMlBsfIbKHik6z8om43U4Dv5jteukWnE/pqrqpYjsP3miDfIiQ7we1MjGzLmEKsP0rSlTg9seRKJqyYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHaHDOJh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHaHDOJh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F0F1F000FF;
	Mon, 14 Sep 2026 09:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789378987;
	bh=iy4HHtQz2rjEvd/sMpGFcBBf+dMUyMlSPFM6TXX9nJQ=;
	h=Date:From:To:Cc:Subject;
	b=gHaHDOJh6inq6wCjUqskweiyi9dHjeTdCVqk1QZJWX6jNbK3Pv5L9WAb7/RK3L8lP
	 V7I8RlL/ppp6IZNf6IWM/3iz8C69ktRHfZBp3CBgb5ORVpq41LMnj1RlUSOjd5N05m
	 1hvopm0AOynFnVf/9GMnVGnzBMW2fXEBKjl55FJifKOyQt8U1X+FRPBoqw2hx8Xipn
	 bDbVCITCd44P+UqnybSFLZVR1gFu+cUoUQdAeeNT9bZAYb/5hHwtGiK9EuTgDuIAHw
	 KgOhfAqM49w0NYGNgpQKfqdQz0nPPHxwc4+DNzuZwFvIg7PrizB7wiMtRm+ljrziaW
	 yvEZLcdFJEGYQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5F2BA1AC52F1; Mon, 14 Sep 2026 10:43:02 +0100 (BST)
Date: Mon, 14 Sep 2026 10:43:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the block tree
Message-ID: <aqfBpkMSF1rFicSh@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3oWl0ehB4EbiMqJS"
Content-Disposition: inline


--3oWl0ehB4EbiMqJS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  0d337c5d5a6ae ("block: warn on too larger integrity allocations")
  080f146f067f7 ("block: pass a maxlen argument to bio_iov_iter_get_pages")

are missing a Signed-off-by from their committers

--3oWl0ehB4EbiMqJS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqnwaMACgkQJNaLcl1U
h9B1TQf/WtBnhxKJ2KlY58jzRM5yB9G38rCW1XkFBF5aDt7byYwdp+Ju8Q3Brtka
ZGWJMplQ2D39I7d4NeI2Q/GOGOoYzg3O3P/tQOktcOSlu/oMo3p4C0JTxFBhLmkU
Q3fkLqcwt9IVkKFDr2rcvFZ/6++3ZfYyROPQVelFqZYoly3lYk7RrY3iLev+BcvA
V4bumLUJW7jUoUfd0yxR/7pRVuReOyoFwM4rpx1MkFej6GdU9XaB+7CuxkZdRjrF
lXwi0iriJk7kJ8eI9trXsfdMG4rFCfQJFlgovkOaAJHtDLRAqEDBxvNUyVPLrQxv
MmTGWYloCJeo11Ghp3itX/zFSdtH9Q==
=emPo
-----END PGP SIGNATURE-----

--3oWl0ehB4EbiMqJS--
