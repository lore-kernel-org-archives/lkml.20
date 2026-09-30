Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1313BE630;
	Wed, 30 Sep 2026 13:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774833; cv=none; b=jJuaFK1AlDkHEneiH6NKtCAnvsfFJkAbvGGB/hvxjZBmhfBbyq5rxENPJ28e0gouciP/kEFVsc15y8GvSA60pzbTWiAe+LfMg2A8EnDohrgfuRHXliQNMggOdZYCIff5Rkt+jP495+OtxaqqTo4Bqa1UhJngjbjdIiPLMt+hgng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774833; c=relaxed/simple;
	bh=HhMBmLaDmBGARZbVWke/5DP/ICaRb+wBRnSdByK8DdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=krYKnqb2V9nhVrC7mQhDV+nmdz76z24gEPtqI3KzNZT8zcUtGuU7mCkSTvk6PhCEG/3HZrFIHvnbHa4tDOScBzlaRcBw8Ot5CzIdPQ9r77PHgahT3syGiBlgOL2hOEZmKEjthOBqrFfHBojcgEAXFE8SM5ehEox5/BIqfeMHd0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AV7qX0jU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AV7qX0jU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676491F000FF;
	Wed, 30 Sep 2026 13:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774813;
	bh=v7W+ZorZNj2o64DF3tcSLK18njPKa1ya3P8cPLmhYD0=;
	h=Date:From:To:Cc:Subject;
	b=AV7qX0jUwiEeru21AX9YwJEWx0MvCc7S0B++R1YjuhoqNeea/ZgFg3EMn6SLvxeYJ
	 l24gP6ZWobrQQ/huDnlWWJATYv5dnee+f2t+2A7Y+usmekWUT5K1bDF8d5D1vBlAuf
	 tUZX1568xwbrgSG7ImdTz//V/dU/ER+Y0ZzoD8dEau3tNy2Ci8FAhvchGNObv7HcvX
	 CNfcr2fHx6OaH4Yzzik3FjoMZtCPpvBjmIrTF7H3f3PTiqiMjRdxotwhSXhZS4ACAY
	 AMumXTt8R37HId1ih3xJPF7uuI30nVaKKVMzaZ2Y6e2xtLEIlHNLtYxXA7Ncs3NZeL
	 Lzly9iqoA/uYA==
Date: Wed, 30 Sep 2026 14:26:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in the final build
Message-ID: <ar0OGZGN0ftc20Zi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XbUO6Vv8oTGlPwUt"
Content-Disposition: inline


--XbUO6Vv8oTGlPwUt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

In the final build today's linux-next build (powerpc allnoconfig) failed
like this:

/tmp/next/build/lib/vdso/gettimeofday.c: In function '__cvdso_clock_gettime_common':
/tmp/next/build/lib/vdso/gettimeofday.c:288:31: error: implicit declaration of function 'BITS_PER_TYPE'; did you mean 'BITS_PER_LONG'? [-Wimplicit-function-declaration]
  288 |         BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
      |                               ^~~~~~~~~~~~~
/tmp/next/build/include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
  682 |                 if (!(condition))                                       \
      |                       ^~~~~~~~~
/tmp/next/build/include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
  702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
   40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |         ^~~~~~~~~~~~~~~~
/tmp/next/build/lib/vdso/gettimeofday.c:288:9: note: in expansion of macro 'BUILD_BUG_ON'
  288 |         BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
      |         ^~~~~~~~~~~~

Caused by commit

   ca46a07c4b682 (vdso/gettimeofday: Assert that the clockid fits into the u32 bitmask)

I reverted that commit for today.

--XbUO6Vv8oTGlPwUt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq9DhgACgkQJNaLcl1U
h9Ccrwf/YWDd39a5DH9+nIsWGA2adV+alo3Emtm2dOms0EowsCZlUMtU1t3xC8pG
8xW0zpdfpWLwEutKftDliBgspgnUtEb7JljJc2x3B9iDrrXcBQ9TqIObBQZ/Q0vi
HVRsYmePVyEv34fUM40jRsymu+sReSc3/S7dV7XVa0o8C8J3Wcb+d3OokGjibmhq
HqR3MhZOKCgF+tGbi+Cvj6DlcpQtSLcRTZq7jd1r73DROafI18a9vSuEwsNyhrdm
N8Hdnf4B5rYcvPaQUAdLj40UD2zVHPKdk8Fd+RVZszX40nKV9AL+zB5WC/xeDhAu
FPDaJAhIKkl4t3dWl9sUw0+H1/gsLg==
=fwri
-----END PGP SIGNATURE-----

--XbUO6Vv8oTGlPwUt--
