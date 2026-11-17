Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913981;
	b=VJHXaoOzMxNPPTJ0QSNdQbTjenDRG5FVxGPQpVEP3TdTbw08i63lmNAPqYEsZclwnci2
	 3F5OhY6HdJD0bC6wHrgCSSoRxa9LS6TvRlnzyyonpmxF6LwvhN2Q4l9SdNV+26AUkNnaF
	 T5T1ugBMUEZ6M+HWVMUgS/GIeyKyfGqaEBeOfY+aHlOW5amDlc+DezqTdoBaKQl+7j5B+
	 7Seu7X1/K+v9ZsYCJ1nys+M8RQfSQ3X+wb4Y/cN6HznJZudoUwzRBhDaQGVnXkewT/exk
	 kgg3+1XLgNwL4bgpEsB2/bEiaQCZo/kAZY8kMHw+GYR9czpgd03ImpeD4tMBw31DuZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913981;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=eWt+U3bOol/6ze2kO8eME6d8eHhq2RawjExMTho077A=;
	b=L+faAwK6ASW8KaQ4/60WDShuUGiOso7AUGDk+jUESmaM7IyHDw8DXvt34EDCT/YKicHr
	 mcJhyprw1BJ+oW6UogxL8Pyi99YVkZ8C3zCybXfWi/hlBvGkXrsO+oifPfOc1awd6i77s
	 iKxs8Dka9xLqEs5LBYNd4st2iz4ylHvg1fa9bGyMj1ZpBnGFT5uyjudCUrj3p4XHWI/T9
	 dwTzmm9HSCyqdZnEGa6o2K/UXME33rpOoaqICtaFx537gQ0d2mgR9d8pB4/MQOQepvWmY
	 S7PaMwI1Wn+5ZCooiphltrVxpSbSLmTTLrn9UU20AZ4a1FBpsqkBF3u+1Esij2O4M5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wsrzuh4q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F920606A329;
	Tue, 17 Nov 2026 11:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wsrzuh4q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835BD1F000C4;
	Tue, 17 Nov 2026 11:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794913980;
	bh=eWt+U3bOol/6ze2kO8eME6d8eHhq2RawjExMTho077A=;
	h=Date:From:To:Cc:Subject;
	b=Wsrzuh4qGYC/kbO9x4ykF06ww1BA0+D5iRr+j4aoxg8yWfOio39+AE5Nir9YomGeH
	 jyE2/1XtlgYOlyHBcIf10aFkX4rYFjt6W6lzngjw4R7RiVt1dbUF1s4+zNarLI9ljF
	 8tdJJ93r68Q9arO6KEvfO8v0xfKEpu3jfhbITEEqYIzvyCgyGFMJz3EertUnyGXjQc
	 Sxd7TboZEYfwaFac20bULtzHMkD5H7/tvhazj5X2JOztdwE3pEflfbGtC3EGp6pzjf
	 SaEViOftYA9DfW5H680tU+cPDPYpfFCUePxSCm+pZnK2Bdw/95vzoVPB+KnCKXf45x
	 ag077S/sPhQ2A==
Date: Tue, 17 Nov 2026 11:12:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>,
	Steven Whitehouse <swhiteho@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the gfs2 tree
Message-ID: <avw2twIL0G1OlaYD@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="UoQZWeBcllLWLjpF"
Content-Disposition: inline


--UoQZWeBcllLWLjpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  e3280ea8b7396 ("gfs2: Fix NULL pointer dereference in gfs2_seek_data/gfs2_seek_hole")

is missing a Signed-off-by from its committer

--UoQZWeBcllLWLjpF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr8NrcACgkQJNaLcl1U
h9A7ZQf/ah8oSH6Qn1Pg8nFDZyCNp4H8RgnJDCpb5NqYKpaM0klgRwisWSMPwWZB
CNZAlIohNndyc1+f2NI9vXMGuiBgBi4anOGeguTlQMKKToR8WyuMOl9nY5U2yfFV
mEP0HfpNN6S8A717nICUvwVXIyDRrXuvGhENJ6ThXJRcF+xTbN+nAIL4s7SNtWTC
K5s6DZt9pCn7OVKkpqdm0c3EjTap4aZSGL4K+k+eW3f0UwAgjF5QpaIw6kdWTbAo
EF3gdDUfZvG6XCyK7nPHIkYjYWTRAtEXEZg1Q50Kh898oixDjUCiDtNBgOgUBgRc
TpXS4UwFqFQQEeH+XvmteX86QwUJzw==
=wm/e
-----END PGP SIGNATURE-----

--UoQZWeBcllLWLjpF--
