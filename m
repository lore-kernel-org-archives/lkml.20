Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842557;
	b=HMVk1KSpto6v7zb/htANQuK7YPxEjHjMFYz2vX81SJBQbYNbn8vZAwAUd6qRGtr8PIhk
	 v+jFMTM68PgOAVgVtYIFqwYiaEGQsq/SEAoq8DGDqAJ0ycgw8ng/XiYSq6cV3YwOVTGVo
	 gxbiDkugKHgxxD2aR5PPBEcuJaFSFUUp4M3HspD/0zc0+nZ2z9+/Mj1zzILgn9T/CSXyq
	 XPK80rBxCeJ66JR/iFh/J7/xaMwX3kfpYfXUcBqkHckziNZcXXVigIUJKjWxEw3X3nUKJ
	 xwP9K4Z3Qr0cIweAvfbIRJLm56KJhfCbJtrdgpdCnHqaoFb3Yxy9VVvoStqfeOASpOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842557;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=K9jzSzTZhOt++ojfGh6YFPmz1wP1du5PldCX9j+JYjU=;
	b=ez+l98pZDTd9hgzeZsfAR6yNU/TFlZc72iouvPqPImWWZFMyLl0wt52+lp6mnZ+9yYrf
	 x4zLb29oj75VCnhLqnoZx73fB7Tph1g98RrUVDA05umv+nqyY1jkAsux+xMUAt4MiD+AB
	 cxjQdbFAe8LtE7Qng12Q+tfmq/mqMQgcuuw5moPn96vgqFLFu1CZuj7g9+OGQu8TBXRDl
	 pKpsvkb71AVVOWpQ6E/9J3TJDfU1YajjMzMcGMrvuxwoioQjfgbs++pZjJI9R/Nb6aNcw
	 f7eh/dCnwgVzNm82tl3kGn/P7iMtehwB6O6FKQ0kr8j4scswWr4yrnWoVFLj9iZa61g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z4jxhpHb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8807606A32F;
	Mon, 16 Nov 2026 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z4jxhpHb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727E91F000C4;
	Mon, 16 Nov 2026 15:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794842557;
	bh=K9jzSzTZhOt++ojfGh6YFPmz1wP1du5PldCX9j+JYjU=;
	h=Date:From:To:Cc:Subject;
	b=Z4jxhpHbZwAv/EzqjbPpOxxdkW4KjEKFnwndsoQiIcHznoo9cZ4agfM16oudue6aV
	 fNyaTmR8AVrb/9ptjq9en/hncq130qn9ui/1jrC+OgxaEq7ZlwTfBId7+/F65RnAdx
	 KjnerNVWfTkn/BH6nukFdMpe6y1ayi9zpjmGgzRqsZ696mQ5TKo4KWeytFZI/k9ys/
	 i6qW9I4nmGySKGqv3txJRNn6isWle8by7LSYicckkWpMt8FJtMx1CBKjoDaLkAGb1s
	 jUMvng7lEv60wPvVnWwZVvZaw5OplqGL5CgODMJ3IJchS/RTX12r6QVhzYXdqOoKhE
	 lojB7P1WmA5PQ==
Date: Mon, 16 Nov 2026 15:22:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the asm-generic tree
Message-ID: <avsfuW1MUYp0jI_I@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="nKvSEHVHX8mVXiWq"
Content-Disposition: inline


--nKvSEHVHX8mVXiWq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  5dfaff16e8b90 ("selftests: vDSO: Fix header search list for vgetrandom-chacha.S")

is missing a Signed-off-by from its committer

--nKvSEHVHX8mVXiWq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7H7kACgkQJNaLcl1U
h9B3Ygf+OAGjCYt0LNT+IAkDwcpioTc6L407Bo3pXyU6Ey3urCJbiNjAIsA4kpS6
1YkTNSqId/TrkXyRLFyK3rbFe2ByRugfk/yyNjMvZHWzrdC5I3e2DleKFXuIuTqK
sZrJY+Hxgd6sGMBbteHLlJs+HRTsn6nEP3g6NxjqSQBzMBkTPUhxs0An3e+kDvGQ
CITXv5TGk0+pRYEb2jKZPhNmnh4k27yNn3Of/YVzYIdlN+DnHmr4cobk/ZnAvgif
NISp/Mlt/w+mAijZRYpnf73FhCGT13YpidcKeAxCjZKu3IbtUGTsT5gIIGgLM/Ir
s+f07HOBABT4GxGUgM/xQYKR1930kQ==
=FbdP
-----END PGP SIGNATURE-----

--nKvSEHVHX8mVXiWq--
