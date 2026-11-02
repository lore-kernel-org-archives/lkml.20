Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624519;
	b=a31Q1umcGhQ/z5cKAL12JoaXhj52YRMX2OjYY5mBNSHCy6ffjEb9WGZj1aEJyoBhCp42
	 UgUZ30oszDO4Ayg1FpVzZo8xz3g1IEDG5exxJl9OzwlCiSjLT7s8jCg/OPtlQpysPjt0z
	 wGznKEZTyFn6S1CPThPZEoeBA3Tq8W+rZ5Lkdt50PRDcZk6yO3PtByFgDlZxgoWc61pGX
	 Dbd48aT1EVoKSkewcioK/Tp/lDnGMi9kgv+J1ehUECt7iQsW3IxVUK6IX5qGEUlteUKgG
	 qT1e61lPKzmi75B+FoinyKfzGQLtvwieCf+DTHRNatgn2jldQkPw6VBNBY3lA7hlrMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624519;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=35D2q7Rd8fKFuQRTLtlL9GjK8wutX5sZZn9I65ROTok=;
	b=b+3aRCWuhBezHwF2qeYLEsbVg++DYA6cEMQOj70mmNt5JiWwfy9qY2XATo2EGq1MkScn
	 0bv/2pP15M0kg+GSVdObblLNFNtsixWJhIj8TAHKCVOLZuTv7Rx2IMHorBFneA8nf+lez
	 1U6vSe1PG3mRbN9mNXmHg98cDVc/ew2qeKuOnSFXdlRs89fZXTr3ydfYnvMGKKGKNo1a9
	 eFKHCpagubyJZ2DN7HBHgdPwJftwghJ4diADP1WQH/RjpfGvp+Aj+zRE7HdEsUIzKNkmX
	 xfneKrHKa90SwzVUpp33uSu8nGJx8wVjX1mWvMXHuL7iUjgHa7rNhHG/0KauBATI7EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWzgYI09;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB38606A334;
	Mon,  2 Nov 2026 13:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWzgYI09
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9C61F00A22;
	Mon,  2 Nov 2026 13:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793624518;
	bh=35D2q7Rd8fKFuQRTLtlL9GjK8wutX5sZZn9I65ROTok=;
	h=Date:From:To:Cc:Subject;
	b=KWzgYI09ev5N7xNCHzGD86aUrFA3cTTUKNIkcGwKXdL9nXl0Nqfw/yoBiJmS9yBZ+
	 vaHfg7UWVKCiZr3xCY5Fhfu4RWlGbovxXe/nB17PxEZeaHIehfcpbvitfBgsDVfHt6
	 y8cNaMx6ZQdvhNTywaKC/iqKSAhxOYTB5XuA2aVEJXfZKuJuWn52MITpkbMqWGc/NZ
	 BHwxshLljL0xOMumPsgo6ydgXlCa0ZWMEAA0Khg0R1kqUW+X77uYjfRgwrQXZwerbh
	 9gp3HyGjo329fnsPRLhd4f/pVJAj3OeqdPuKCv3QaFvVtZfNiHvflhC+sHVvAhgURO
	 KXM3T0s8+Pa2Q==
Date: Mon, 2 Nov 2026 13:01:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the mm-fixes tree
Message-ID: <auiJwrOugBsv0Ixa@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="0ttBrTmZZ0d/xYC7"
Content-Disposition: inline


--0ttBrTmZZ0d/xYC7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  cd240bd6c820c ("xarray: clear the new head's parent before freeing the old head")

is missing a Signed-off-by from its author

--0ttBrTmZZ0d/xYC7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmroicIACgkQJNaLcl1U
h9CBBwf+PsNEcIzvvnJc63x2CkhMlhMMie6xChKdb6Ypihx4mfewjFP6PbnapctL
YSvQsxVkwm+LfpdefIND+AGiLOd5xRASXoI1WKeX2/a2GHh9H3gIlrWG2REz1LY5
RohZYZkzlqZIW1xdM+jLOTCgwhm9t5faf2ulW24dZurcjvIliNRSxY04h7XyehXz
gA+uDhUGW9s1a7AK9M7q+NwH05Fl9RCBflwZK7ARXIdEs2048gfWbN7QbP1vME4A
6FzyZH+huKHS1puDSRazHevgTDUor6oL/nhvVQVoyHBzV+P3gX4VZWW/UmqOKvfU
y2hzj6n/neT1HY4jzQFHuDtkobCeEQ==
=MTXt
-----END PGP SIGNATURE-----

--0ttBrTmZZ0d/xYC7--
