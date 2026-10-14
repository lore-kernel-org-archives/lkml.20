Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F24C2EA754;
	Wed, 14 Oct 2026 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981376; cv=none; b=hIZivTgTFBOidkqkQf2neXKWZoPgfTxI4pDvLtdx5QTdlOxGUTBL6AQFuMlXljziQDQsHvJ+Ncs9kiz3eq5V1O5DCRhkqibaVqEtlU1rKoFWDDXvKpHqQZSpBWOU7owcVgxYSFYt0kEMmU7bPF9e9Un36U7KRQcAmYggJQrCQPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981376; c=relaxed/simple;
	bh=tLBbVG8tPKMx1efy/FWSezxUBLoVGD10O0t1VCIBmgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IARCWF98W/ns7GuwckxyU0khrZbCQ9Fk0C8HlCirt+mYfX/SVgLuTxazNoEPn6hthBf3sNK1XzOUjZmZSoMS3w7kBvjKepfVACgUI/lcLKA88HDR7O5EWzZLvBWIwmkYbsBC7//SYQASWBXbAv40x/3SDfP2qkvLJWtTsrR7154=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XB38ENFY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XB38ENFY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5271F000FF;
	Wed, 14 Oct 2026 12:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981375;
	bh=RCN3Io6FgEDEOk7f/2RVLU8py9d+Zq2aRafzAk6CImU=;
	h=Date:From:To:Cc:Subject;
	b=XB38ENFY3WLeslb1aJS300YcY4/5Z0lqWYYokMGuZ+aL4MbQdt4oTVTEUEsBxtkst
	 OvH416XJpHs1yBjlQqJpxxOLecYQkUNMS5dTVZgjIWglqXHtZrnOxUq7SfJZDaaLFp
	 Eve9XXej/rHWRPb/x+xAbGwZZLaLydmBdRRzhaphlRkNX9kU0nPtocOuBOxsbmf4Fj
	 fZRWrQlnUfz2YK1suiuWD1lY7WjNCYf1+jVumtuP0KfHoU0VuTo6ETn473qbjqvR1E
	 tEkBiiMigNegHggCgoB3W8kgx0RQ97EIhlDmUckLUqOEDRPTurmQMOQDWF8Du1cQFj
	 gj8qzQpordKtQ==
Date: Wed, 14 Oct 2026 13:36:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the dma-mapping tree
Message-ID: <as93O8_zSVY6_OP8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+ZLOZ1yG4x+jelDR"
Content-Disposition: inline


--+ZLOZ1yG4x+jelDR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  3faa52b77c912 ("dma-debug: Skip cacheline tracking for MMIO mappings")

Fixes tag

  Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather  mapping routine")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--+ZLOZ1yG4x+jelDR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrPdzsACgkQJNaLcl1U
h9D5TQf+O6XDe0i+RnFUwdxV9m/VgSjsp9V4tNKbYV0wMzUXd8BxUaU9PAe0au5v
pgu78mTq8E3S7HgC6yNN9KfkImNI2IML9igzgDXCb1yuNgCnMdBxy+iF/PCHgYWQ
/6S1NJvmJJ2Ls1ZcZfEquSQY6h0doSy1tGgLdkkUhtxmRW+moGcUGVNRH7wlOgiA
57rsr1ED83/u8ovvG4X5jpWJMSsw3PkNhasdXp9VrfzYZu7OluXG2v4ATWfF046q
h0kt7fiZKUYK2Iu3af0HyisayqxNv9A/liABMj7ozR/LyZ6soMSgSrIqI3bJeTVy
C0cdLY5QjqiQYuBULyeiQ6IWvzj3bw==
=EDmV
-----END PGP SIGNATURE-----

--+ZLOZ1yG4x+jelDR--
