Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0899542E43D;
	Tue,  1 Sep 2026 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277759; cv=none; b=eo4XWSAqr/Gb6IVZwYK4wqr5/J3LaZ252TgOApCKP8DqG7xfD0DEuZtkg9P006iaaHOCPA/t5nOSPWsAypMHVFDmtiDKDOuexNCTIG2o07d8IicLARCkLNRpHwmaE3Y2f3OhNB/DeyoFonBHlWwdXW6ABi+pmERPZ1YbyY2hA1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277759; c=relaxed/simple;
	bh=XhIjhamkijR2PD5jHvV3jKVT5r7XmUNMRRriO9sA0sA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Co16jqeJ707LrN2KXpB/+6OQ5ctXGZRbFFfHz+v1qapd3fFvIDQM6tQYMSvf8Vaw6t7pSAW+5rxHWAavvYP6GVsilQwZOr1CluDslUopmUNQEwpNquxGlMUX6osJFDrMpUM84DY5hkV7R/9FSoDusriTto0cMl/1dEKJxrkMdZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EItBevDv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EItBevDv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC16C1F000E9;
	Tue,  1 Sep 2026 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788277757;
	bh=cA7ztTHD3EQlSiqacQoMqHGvMZYXbpSIQv5ESYtREBk=;
	h=Date:From:To:Cc:Subject;
	b=EItBevDvOG07sDlEd4G64XbAazHVlchNyE8IJkW4yBgMjYb9j99/WGWpXjxZHe3Vv
	 pW+bluT3q/v0Lk2Xy4//6xVw2X1AS0wJTfFvY3isG91R81ZanCKpaEcILh+SMGcowp
	 LUijB1fScs6BuiW2SmNiJ1S1pweaSvDXX3CYhWuq82o8BQ0tLFLPY/i2r3p5J+s0Bx
	 qIBGzQ9rkWMoy49tpR4o1NGwEVEsVbBqQ6PZJ1BqDjpDCigSyJ8z39BwXYEDJnKHRF
	 SlSxvIh8a1TqymUnvqPJVFr6FpwrPDAgP4ggiNVJjVg43QRXzGx7v5aTCa2AY9pl2i
	 dnmbKIpjbssGA==
Date: Tue, 1 Sep 2026 16:49:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 1
Message-ID: <apbz-ho4cBMFmxBl@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zyJp2heo+GAwo6lA"
Content-Disposition: inline


--zyJp2heo+GAwo6lA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260831:

The hwmon-staging tree lost it's build failure.

The security tree acquired a conflict with the vfs-brauner-fixes tree.

The drm-misc tree acquired a build failure, I used the version from
next-20260831 instead.

Non-merge commits (relative to Linus' tree): 1776
 2023 files changed, 55964 insertions(+), 16527 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at https://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm,
an arm64 build of various kselftests, a KUnit build and run on arm64,
and a native build of tools/perf.  After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
arm64 allyesconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig and pseries_le_defconfig and i386, s390, sparc and
sparc64 defconfig and htmldocs.

Below is a summary of the state of the merge.

I am currently merging 426 trees (counting Linus' and 132 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--zyJp2heo+GAwo6lA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqW8/kACgkQJNaLcl1U
h9DxOwf/aM9AJNIGegdeoS89EQKP6z0x+G7+dFugiUng+hchwi2vbK0qTr54U6Xa
8DTtPhQbfFFfl4wQ/oNTqBqtgQoSFTCp2YYevXjBy/x1dt672VOAn9vTSyRDah52
rvc2Zsp9qRy8GR7RGyasiSDAQdNjqTxX5eSVzhUOZCKhF+SisG8OGiN9sNlvxhB3
9S4cZt3VeFomef+zQEDZU+ZJMGAPYiCV/26Lwq5biJlcw4JcRNa5LUwxQO1eBnq2
01qZ9uEXhmVLsUosRGugYqQAzyAGzTTm3bBlQiz13tcut/I91KYpq6Uh8+2Z+eaA
HiIo+dhNH280emfbLb9w2ICIOk9Jkw==
=hi0r
-----END PGP SIGNATURE-----

--zyJp2heo+GAwo6lA--
