Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA22C43C07C;
	Mon, 21 Sep 2026 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984163; cv=none; b=iQA9TjIk364TPMws+nTZetQCjUxk9NpK7oGnOv+u7de5mlr7hFu71btUDwcZjVsNJ88iltUpKiIXfjzh3dJjFi6bwXZs4aOmGMlAzODA6KwPzKwXw6B0pIGIT9E4VBDfkdiN9yHzhnPCPtDZxDUL2d5yCcUEeMa3+OTxVTc//TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984163; c=relaxed/simple;
	bh=YuquWLLy7ctXRHBGLt0GrQ1HhLNa9lBtjECYsjtypNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WkK/KctfAQ0L1hxX6fQCp7mUcOaYayUd4pLv5zx8ZKHB4lmD0jNvEkoRlu73VIqPYV0ki3Gp9zIG4rQRk6uQcg8jlHymlyaNBRVAuUd20dCSpXX+qeSiAklOtg2aBByJPN80vkZurVjd29R98tzA+MZZ78PudrMNpNzK9qzQdZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyj1et8b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyj1et8b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FD91F00893;
	Mon, 21 Sep 2026 09:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789984161;
	bh=U1TsfXxaPB7Qi+tcGNOlScGB4TXgSkS0+Nikk/MkO8Q=;
	h=Date:From:To:Cc:Subject;
	b=cyj1et8bASdW0ME6eucmDFKTZqxZ1DWQNI2hGmLiwCzbkM1VfVoNwQV4euOthoMyF
	 +SQ1I4Jm6MdzOlRRwx8yKaGz0qwkNfSzxW9gz1jGn/rQtUffXPHxGXpd+Z+EJtC6vP
	 p+KM655lZDmIb6bv2Rgc+ksRIh22gtVV3929oA1O5bgUhzNZUD5yED0W6t6ZRtvPXW
	 PRc0/St1gqcOetGAXL4jnpl16pJqDNc2rvxYz13SlZjcvZTVWhafApKyD7G9qEFW6D
	 YHbKz13Wa3EWF9PRYtmd713k9wVqIQhA5KHrF88jRZIrB5CDbqbgUXFd/BQ9tAtUV6
	 emUit1FBTqLhQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 07F191AC52F5; Mon, 21 Sep 2026 10:49:06 +0100 (BST)
Date: Mon, 21 Sep 2026 11:49:05 +0200
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the vfs-brauner-fixes tree
Message-ID: <arD9kYWk8VdOoJ3i@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SgKMmCILH1H94BaL"
Content-Disposition: inline


--SgKMmCILH1H94BaL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  c51e89c5b5db3 ("netfs, afs: Fix symlink reading")

is missing a Signed-off-by from its author

--SgKMmCILH1H94BaL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqw/ZEACgkQJNaLcl1U
h9BP2Qf/UFCq/VQiVyJQ+KP6rDUSlvUd0wovE8MSQoiIniqWJM1fRUWFJ6d25kd1
FkM0K9zSvD47Abd8CvB7pDBzc6pV5tzFbVRUdDPOlgL7+GAwYzqqkXPB55+arT9i
FaiL0lfKOcL8Mr3jBpn17TZ6xyk5hk6X2j8WgWhUNONA7pNADc3odCvNA2jlp67k
9OFuQPxkjZl/il3ivnMa8bJ+pWXeCrhGyw4YULWd59OgV9nYdRUEjEPY7WAQgVo4
ZO0gXsEcd3mdTgvgrsMj5yYy7zsLB+3rkVILS3iOqtc0LP5SRwaH2jHLMYLYYZBv
ubjXhBHFkpJmyJUF9mCfbtTq0VFmtw==
=z40E
-----END PGP SIGNATURE-----

--SgKMmCILH1H94BaL--
