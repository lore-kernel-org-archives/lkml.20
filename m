Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ADA37CD21;
	Wed,  2 Sep 2026 11:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347787; cv=none; b=oVCILRZjJG02HjiW4IbIcN25Hr4zwU2B5xvLVu34L9HfrRwnUXlrOYcoP8B/hQqskRFE4YOYBf8j2HC5S1Dc17N8/s4ykXbP9UcaA4irh7PkwTJs23ChzhxOJgI5NHFCYcPJjjtddVHbdu5b9mPDvHoznZldrSUqATGiEbbAoPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347787; c=relaxed/simple;
	bh=uz4a1XlFr6YtyWjAWGrpDlapNhfBrEFg5irUJEHhbRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RB1veuXrCqXEToPxRZiEfC2K2+XDTP2JCHxmx2STI0y7xKyWGiGJTWE7wuru8kqu6fEpDKgU9I3PUn0/8RT4aiCpx+8TX2RTbGIOysaXdwmB8QmsUsj3RgDV2YCnLvFgetE0J3Z0xeX6TI/HYHVHfJG4jm60RL+DWyM3ySBKECo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFX3xoI4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFX3xoI4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B64D1F000E9;
	Wed,  2 Sep 2026 11:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788347785;
	bh=j2JWA1nLDjQaf0ILpHslffpqGu+Eaj4TDI9x5+QAWmI=;
	h=Date:From:To:Cc:Subject;
	b=CFX3xoI4iwAPxxuz1n7YT5yl2q7N3URbGXO4yeXs7qw0ikyBhIHg13avWdaKmdqWN
	 g7hDN80rmW4cGc2V8jz7HGrTIi2kpXbEuYn4I0OQO++5/X8PYqErUjL118mKuZsfPF
	 ZueqXCYKPOQC2CNRWMcvD2TWosaqi4E12iQMSWJMkzWAnVI/IUUQtfS/RNmP/r3DxW
	 ZaJKhRGZJJwNzbHVC1hfiPR+dAC3BGyONREdLH+DExoIiZAOmlKNvKq1SufZR8J+yr
	 bsD8uYoYP9O55VWsjD7OB8Q6J5bvixHXYpCG+s8uClGIxHYCgYJ95kymu8p228ZIl1
	 Bk5lY0e+Rx3Ig==
Date: Wed, 2 Sep 2026 12:16:22 +0100
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the btrfs tree
Message-ID: <apgFhjoOnW57AQQ2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zUK8U7sXzdKeK1cm"
Content-Disposition: inline


--zUK8U7sXzdKeK1cm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  d2371a77a9927 ("btrfs: scrub: report the failing sector's address, not the stripe base")

Fixes tag

  Fixes: 0096580713ff ("btrfs: scrub: introduce error reporting  functionality for scrub_stripe")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--zUK8U7sXzdKeK1cm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqYBYUACgkQJNaLcl1U
h9BJtgf9Hv1Vud+lvAXWsHC61uIgbQLHRk72Kq2jn+7ZAJXtd1q9wvnbF2SyYh0j
D1FZ6CPvGXqDHuk0vSkNyCnvKDs2XGAKIsu+R4tfUS/Yj5v77AZ66XqniwW3MjgC
OVpsQmkUkhwc9knmiVTkKq3J1a3iZ4W9+qo/BB+JalCKpRn8Lf1sgc79DCD4Hyjw
oN2c0MZKVdgHcnvLZLMx5BG38DoIJ0IikCitxDhHH8o8pYTHtmwHyogMnMTMnvvk
TQZFrlKOxToKvg/9In21dTh0j9VNNmOYeEcQFF4llgQb5ybr6TtI/MjamDsIJSy5
a+Yg+embU0K/kjdZzrOVV4JkCe3TNg==
=2fsR
-----END PGP SIGNATURE-----

--zUK8U7sXzdKeK1cm--
