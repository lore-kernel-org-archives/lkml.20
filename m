Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218F83A9018;
	Fri, 18 Sep 2026 12:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734761; cv=none; b=UBA8soG8/ZLjU+ugSPnaLtuZnSu4tRoaVXqEmkjUfzqzdm08BD0i5IzQkicysepgpMkvYWPsAWf9HZMIa3tRe8QrA3ehYuFbT6gc9VjOMNdfCSQ6mP4SJAWHz6GfQZs3W7vuUX1k9fsbiqCLgu67VzYMCR01u4rcGbZG35lbIn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734761; c=relaxed/simple;
	bh=HUIJldC1s/B6sZJemVhJKLNHFeIiJ65p1mO123UEFds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iKlg/FFk7SXjeTA8y2Q5U9/psbAhH6cwvJEtSZWfhObJThutFEP9SWM69iq5Ej2SB9UW6H6LI0whaA2zOloiG64DJAw8youawSaKyV27W8Q7bTCS+nPcQ/KTrs4gYEaD4LygSrT6PMpXBEzGCqUIp/yhHSkgxb2Rsc5atQqwlKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gq9YnKT7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gq9YnKT7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FA91F000FF;
	Fri, 18 Sep 2026 12:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789734757;
	bh=TLqWruDjBIPGrL3/klNVugI9whrADCbcBIn7Tw/QjWc=;
	h=Date:From:To:Cc:Subject;
	b=Gq9YnKT7QcteBEKLcbYVCJH/1aBGhysFjrtp+C6NjhxrzSXz56eGQ89g8l0kgd1VG
	 aY+xngLD386gHZEMbDfkL+w0wZU/enHAjuqdYUBAsYTingujQm8yYfSThGFceHNKD8
	 HubNVfp+KwYfU8OZ5mWI15N8sBWoTqYDXrzxbOH8rzrHeVheC55nVmhnxV5jy25J8i
	 rfizfSSJrZ8XJjr7t/xS+pe/wruTXTHJxNr4BqgUn3JW+UhkbXstkRFl4RXjq1Mada
	 lAOsY5PyzEuJC1w9oIQq1FQI2L0i2fdtuLu4b9feP1TU9URWZUDgBypXYvguAE43m5
	 bWcLlPQUvdX1Q==
Date: Fri, 18 Sep 2026 13:32:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <aq0vYhZXtMqA41wZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zGdOPVzrSrrJ7Kw1"
Content-Disposition: inline


--zGdOPVzrSrrJ7Kw1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c:8=
7:37: error: stack frame size (8264) exceeds limit (2048) in 'dc_memory_poo=
l_create' [-Werror,-Wframe-larger-than]
   87 | __must_check struct dc_memory_pool *dc_memory_pool_create(size_t si=
ze,
      |                             =20

I didn't investigate which commit triggered this, I have used the tree
=66rom next-20260917 instead.

--zGdOPVzrSrrJ7Kw1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtL2EACgkQJNaLcl1U
h9DhHwf9GrDS3NNUvQK4/UYA3dq0Yhgt9uGuefF4/WJhPZcoZNZ8cqvlmiwuU2fJ
gAQngRGbLsSfCfQIbDnaTnGpGNHti65CT39NufepA3ZLR0F3fWUZzunUQbekUPEp
S14DQQ+cVQM7uEW39JTvTtQM0j713mjjXU35kpJejCkVB2wQM0i9v0Ev7+ZZugKb
Ht0JrqEqWLNQijz1BRDKRdRNgeCgUX9A7HzARK416Z3IYbxusBSHJKt7UAFQ9ChQ
adbDA8wGtRHR6b0Lp8UQTsjF58vLuG7mic5rmpvLt2Z3d9EuyfvS6MAVmBdQ+5Cw
I9ajibZOkBLspGJqJ/ooRTZOpI9U7Q==
=e1cd
-----END PGP SIGNATURE-----

--zGdOPVzrSrrJ7Kw1--
