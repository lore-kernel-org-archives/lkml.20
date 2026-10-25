Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792971394;
	b=l7NgwzQELgRGbF1T0cYlRIBogc3G0xIj9buIgsTqRm8Y+uRCuWwWPlEWP0Zz6YMXT9Nt
	 1r7FFt9MHIJpXTerlPvnIW/sdwOquq9O5cekYOnHTvBxplDW5FL8jYmV/kQkBBsOZ3YSZ
	 DS5F0TQitNRxFGWhYa4tzXuqun/eGFC3dxCZgzDp/vEr4tutalqZIp/5ITfto/hWn15hu
	 m95fKRPjt5amI4SC4G0odSIU21vB8juodwQHa/3qhwnGfD87nR47AvQ5haNYnWlZn7IBD
	 NNgVuG3RgGvrLRnX8aVOKGZkk5tvZsp9lLjAmp15NMcDQ7SPogxUmW9Z0cbR5DZWGXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792971394;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=IPpVpSqXD+4vUhtZDPnBffAXQ+CzZliJrkfjjD2fTEA=;
	b=A48FuOj1TRuj31RxkwSUUNIhy1YOEB3GofCk6IfSjwpFnwvvChPrp+xSJoO9LbbwRPuf
	 zkIKxE0sbCnqU0yk4Jr53R2NTvjJ4w5FiVZdCu/H51XenDBru7dJp9199htg2fl9mFj+X
	 d1OloTygPICW0rGPsRE8ihuqhIr70thdia8JlkpJrLiZ1Wx3HTBfC5pS4WIvOLHC5rsp4
	 bnxBXg3jj8Q7Oe9u2caRoGbnRngtfu6/c9iDodlqJeHTrlxioD8lsQ/0qLDXR/L+hIwaA
	 rm5IozEmUbSxjL0OU5bD7j63hWkQ2Fx5fzBf+Orfk65VtoWc5XIYGviva9FkntgJc7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oyi5nRro;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E6C606A31A;
	Sun, 25 Oct 2026 23:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oyi5nRro
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C91E1F01825;
	Sun, 25 Oct 2026 23:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792971393;
	bh=IPpVpSqXD+4vUhtZDPnBffAXQ+CzZliJrkfjjD2fTEA=;
	h=Date:From:To:Cc:Subject;
	b=Oyi5nRroMGoggtTBxemkDqJWkEXMuV3CzCjyHuzZnPhYKmTYzg8UBxqwydC8nMlVm
	 g/eVX9A0GyN4gQbI39SzY7UyOiWVVYXc3oY9gQXb4okTnsnQ/1sOdDaH+wiyRzZNB7
	 IekFSq1nvYXzi49Q86bo5Q4IRBoirRFxWGY3D2tnNRgDyDVy87NBzkEic8U7ECfQ2Q
	 jO4aodCOlgVNG0vG0NWNMu/aTAbZ434fgga9b5e+n/PXPV2TvJJCMK6AtvraLDmWpK
	 tFSpF3f79xnWqmUetOLIyZSNBSq+25sNJUYjPfP+5sCKcmgcvsrpdAiHVKgpJefNAW
	 fjtpLixjvK7mw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 865081AC5994; Sun, 25 Oct 2026 23:36:30 +0000 (GMT)
Date: Sun, 25 Oct 2026 23:36:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the perf tree
Message-ID: <at6Sfv6lR0OivudT@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="UK0BZ2dIJtqU25r1"
Content-Disposition: inline


--UK0BZ2dIJtqU25r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  dc953bd97bb34 ("perf annotate-arm64: Support 'mrs' instruction to track 'current' pointer")
  1def3501db416 ("perf annotate-arm64: Support per-cpu variable access tracking")
  57758d7a45a91 ("perf annotate-arm64: Support 'adrp' instruction to track global variables")
  3de720ecddd77 ("perf annotate-arm64: Support 'add' instruction tracking")
  2a4d31c97bc48 ("perf annotate-arm64: Support 'mov' instruction tracking")
  5e5337b32bedb ("perf annotate-arm64: Support stack variable tracking")
  afd3a56ecd8f5 ("perf annotate-x86: Delete stale stack state on store of untracked register")
  7987f78199231 ("perf annotate-data: Track imm_value for stack variables")
  c5aec1fbc2e04 ("perf annotate-data: Expand type_state_reg imm_value to u64")
  2e1cc4301709a ("perf annotate-arm64: Support store instruction tracking")
  5494c4435efc3 ("perf annotate-arm64: Support load instruction tracking")
  0bceda338113b ("perf annotate-arm64: Track return type after call instructions")
  de5c01e94fca8 ("perf annotate-data: Add arch_get_reg_offset helper")
  84c86dc5b867b ("perf annotate-arm64: Enable instruction tracking support")
  a21442643267d ("perf annotate-data: Extract invalidate_reg_state() as a common helper")
  9b435ebe2ddd6 ("perf cs-etm: Respect --no-itrace option")
  6cbb0a8996ef7 ("perf cs-etm: Synthesize missing HW_ID mappings for raw trace")
  934d015b78e04 ("perf cs-etm: Free partially created queues")
  a965f5ed75bfb ("perf cs-etm: Don't add global v0 HW_IDs to unformatted queues")
  895ec1c47eac8 ("perf c2c: Fix memory leaks on output fields")

are missing a Signed-off-by from their committers

--UK0BZ2dIJtqU25r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCat6SewAKCRAv73Ows9A4
iY6bAP0Tg70Te5GTEbcHvIpgub0bmJlB5BNsjGSSbOO1hGUzoQEA82xipp6JB35D
7JZMLlJCTUHHwxwWj6lxHhN3bAO89Ac=
=EOYO
-----END PGP SIGNATURE-----

--UK0BZ2dIJtqU25r1--
