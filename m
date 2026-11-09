Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241805;
	b=QkgHJeE1yutMwpXG8EeGbNBz8EiWAvg9PkIJMk15wiZPTBtXjPH9BUp6AIMyNGLQqs8W
	 owqV5floMOuz5VnfklU8Cj040Tpt8TB6DwK/2vIkJLt99vZ7Se40+vB+v/b0oN2jQQ/gr
	 IOysp7q3LKSjRKqSVGt4JEXmqUvirLu8IcBnyMdo8FXIvtfnFUxXG7/Z0kLeM10IUul48
	 zQ7R+txERLEb5+w5PBY8hUV/gts9DOso8TwRfWvQPCji3pi7VeEDLNyz9IvYSQ03E+qgl
	 /6vPOyUpX8QxE8AQjGVrnHXBvEHGD7tSr2gpqQvsm6MsPBnbSeVh7oznzAxqq7LgWZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241805;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:X-Cookie;
	bh=PEQGXkq4vrcm+isWdcFyySYlhN70JAS8Bw379MdtbIM=;
	b=WKyLSX0zVtbhqtPrlV/l7VFttoL2G1d9w7bBsVoG4brb1SckB8OXzwymPyVh9ncaR99d
	 ggZAzsEfW5Ni+9kr95CQD1TucH7WYReg11rYoK4w3UzZr8oZP7DIFwatmicf3HB1kadXl
	 vNNwzIqXw0OhbxZgGYrnv5Lt6QsH5Uw42ysUvvpjiBaI2aFptn3QKYN9YCfhr9JADNpWY
	 rSYGfu5nzOl/BMS9DYVfVxYoQlA5eWQSTPNtObq+ALYJ5MDvuULmDiCbuBlnGS1mAcv1Z
	 FwdZv2ZKSY7lCk7J3wGkaHDq0vCKoKkxfXF4OwSxuoOnD+epQ5bigKfgccR2n4KSLsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O0mfURRD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5523D606EE88;
	Mon,  9 Nov 2026 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O0mfURRD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1C41F00922;
	Mon,  9 Nov 2026 16:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794241804;
	bh=PEQGXkq4vrcm+isWdcFyySYlhN70JAS8Bw379MdtbIM=;
	h=Date:From:To:Cc:Subject;
	b=O0mfURRDMA+UAXGtCA3g5tnMMR6UzZUmAy1ihoWnjbtckBF9LBTDIhyNfv6H7eclw
	 wExLD8TS8RQ0LvJZqjL0eRXDZKYiF3Q+3awEvslXLOfUKIUWQlmCEaQbjaJWDfCnUb
	 EMKhZfXqQWNGd+Zoa/JeU2RYPoUv/FIUlgjUx14CiG7z1NGlydPFo/pCwPjsp7O+Yt
	 DgsjhlAb9u5m6T95PzMi7FupbAy245EJZ3kqTrxo/rLYWWYCX7UiSuB+l+FNMQs/tU
	 RQFBh1oos9Wa2VEd6y55lhsWt+KRhOiVp8PNUAYwQ83XC99A56Wz9skssQu4j9ATOv
	 sCltbCCrmnp3w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id CE9DB1AC5995; Mon, 09 Nov 2026 16:29:59 +0000 (GMT)
Date: Mon, 9 Nov 2026 16:29:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.4-rc2
Message-ID: <avH1B9W0Hm3LJSvA@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="7tfTbDE1REvSmlaL"
Content-Disposition: inline
X-Cookie: Victory or defeat!


--7tfTbDE1REvSmlaL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The first week of the cycle has been fairly quiet, only the one build
failure below which will hopefully be addressed soon and a missing
release on Friday due to poor connectivity on the UK train network.  I
think there were more conflicts today resulting from Kees' kmalloc_obj()
treewide stuff than there were in the whole of last week but I didn't
actually count.  The number of commits going in feels relatively low
compared to this point in recent cycles, v7.2-rc2 had 3372, v7.3-rc2 had
3715 but this is only 2367.

Trees being held at old versions:

  leds-lj        	next-20261104

No trees have signoff problems

Non-merge commits relative to Linus' tree: 2367
 2580 files changed, 92721 insertions(+), 30436 deletions(-)

Top trees adding commits to -next:

  359	amdgpu
  195	mm
  189	iio
  169	drm-xe
  168	sound-asoc
  121	drm-intel
  94	mm-nonmm-unstable
  88	vfs-brauner
  70	gpio-brgl
  60	mm-fixes

Trees adding duplicate commits to -next:

 144 amdgpu
  11 drm-intel
   4 watchdog
   2 sysctl
   2 mm-nonmm-unstable
   1 vfs-fixes
   1 fs-next
   1 at91

Thanks,
Mark

--7tfTbDE1REvSmlaL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavH1BwAKCRAv73Ows9A4
iTXkAQCYNeFgLnArEspP1l6GCrOo1pzMabMz0xenx/q1V3zpOgD/VMQs7PYOziZy
nZ+Z0f9jbuYT1riB7g3tU+84543Ljgo=
=645n
-----END PGP SIGNATURE-----

--7tfTbDE1REvSmlaL--
