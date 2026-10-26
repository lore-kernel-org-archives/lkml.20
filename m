Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024873;
	b=QHoc3pCpCatUlYzCqqZ1htSuunQYKTy0LBXWt5uthx9EklyI6o8f0e05V+Lhn4l5cY5f
	 SZdDAlJY60ArORUOw3Wltt3bigxSOvPTWEpClP3XgvJ34zaY5c4Xq+D9BI34AYVmGdU2y
	 Cmvq2vlEQfnYsiqvPokGYpIvFzpG3Ws9lmgYH0Yyn3P9IJRlzJw4h+aDgYpO5bR4jvEjT
	 bpFfz7vQuV0aPguL4B7juoV2plCPjsJ3TU/9fZrEJTQYu5b7tRWgZWRufQQxlM0TaUODS
	 aeF9IMsUKnhQJwpYBenvVY+QLeHfvmtyfH/N/eqiaoj712NzBTs26/WamgKcnR9rO/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024873;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:X-Cookie;
	bh=hmaTuI5rRdqy9iw6oiT0YKa/iu83PHSHXzu3DEDQfy8=;
	b=A/1s1oJFRki0BbXH5tYvf72ELc0QanQ5U482hbOf0aTZwY7Up7Fc8xZcgk5CJ6Noo1bG
	 UVZqDXW3KugVUo/Scbqds92EPQC3CHakDd5yKgzNkt35x7OIEP4lGK/ngwFekMEnUomH5
	 cu7EU13BgN8SVoyR/FWV3Dw+jbZCuos6ohg4OKHc5B5yyShyrQtNa7gxBS136blPLCgV3
	 K6c6V0/GFqEIY53zwwf7zLgMHqa2w5QiPmnx7Vo5hBLSgoEeVK3j1TXK+PuQPsJuxidJQ
	 AnJ/3HMrLkgoW8OjDOMBVjXLmzXaIVH3/egpdWj8Xa2ghFEN8lVmQ5X7VyM3RTqaj7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cv2QwCQV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2169606A31B;
	Mon, 26 Oct 2026 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cv2QwCQV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B61F1F01825;
	Mon, 26 Oct 2026 14:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793024872;
	bh=hmaTuI5rRdqy9iw6oiT0YKa/iu83PHSHXzu3DEDQfy8=;
	h=Date:From:To:Cc:Subject;
	b=cv2QwCQV+FYaOyNrrIA0JLV8Tmvb/DHftKVk4YLkJjnP4HYriYyOa5F9Ls5GgCczh
	 ZjADGraZ4P+Vj+431kaLq5x1WUpHiW2XqyH2m+nUm3KPLuAMwngCSXxhOqOBenJVse
	 cKmS7U0z6xqbKWv1E+denawv6RUfjWcouHTdt+KQT5oIqO9h+ZdGr9sr5MluPxy2Br
	 J66ZRx6ttwewNekM9Xp2yzQendyrcNEAqJdsAaYx3RpRksp9NEAwK6J2PIeJ092Uk8
	 LF2njW6v0aRBPPx1c8S0RCsJrlmcAxi5a6oA7Vhs3PboU/C2sj6lVYWNm8QeiCVHho
	 k8MYwimkRtvTg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9BB571AC5994; Mon, 26 Oct 2026 14:27:49 +0000 (GMT)
Date: Mon, 26 Oct 2026 14:27:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status half way through the v7.4 merge window
Message-ID: <at9jZX8dK4M82MdK@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="Fi4Wwn/97p2HUoqh"
Content-Disposition: inline
X-Cookie: Victory or defeat!


--Fi4Wwn/97p2HUoqh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

After the usual burst of fun on Monday from people adding things at the
last minute this has been a quiet week, much as expected, so nothing to
report really.

No trees are held at old versions

Trees with signoff problems:

  clk	(missing committer)	Hanging around for a month, looks like
				there is a new maintainer I didn't know
				about.
  perf	(missing committer)	New today, Arnaldo is fixing.

Non-merge commits relative to Linus' tree: 3618
 3630 files changed, 184715 insertions(+), 57649 deletions(-)

Top trees adding commits to -next:

  414	perf
  243	mm
  237	drivers-x86
  162	clk
  157	amdgpu
  149	dmaengine
  145	qcom
  134	mm-nonmm-stable
  120	drm-xe
  114	phy-next

Trees adding duplicate commits to -next:

   85 ieee1394
   19 btrfs
   13 nvmem
   12 amdgpu
    9 configfs
    8 drm-xe
    6 slimbus
    6 phy-next
    4 mm-nonmm-stable
    4 leds-lj
    4 fastrpc
    3 socfpga
    2 sysctl
    2 riscv-soc-fixes

Thanks,
Mark

--Fi4Wwn/97p2HUoqh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCat9jZQAKCRAv73Ows9A4
iYeRAQCmAsl2/qHvqxEzdZs/imo29I5J43Drm/7Ahdox9sxYCAD/dk+kLkYbRZmC
uCmn78QAZyw9tdvqyxkPdTQKCcWxGgU=
=pgJp
-----END PGP SIGNATURE-----

--Fi4Wwn/97p2HUoqh--
