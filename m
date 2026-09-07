Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A611B23F40D;
	Mon,  7 Sep 2026 22:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788821509; cv=none; b=qiAexWYazr0bL8i0YxSJELMnIlliSWSBDdaavkDtmmhkMnhQwxs3oHqjCnfvBJqcCuH1st6UGthJTDaoEwAq9kOtJnnsIXg7Vt1fwEKpakTPUMzOpyLfZWvsD/vWOLBqtfr4kORoa/rWvZEemGRxdtOZiAS44gnTY7VG5GSFMKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788821509; c=relaxed/simple;
	bh=IVRZqMoEIclgTEkzL5Pfd9oTvd3bcwk0NvqaC0kk6Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EJMtuCJaxdG2Iy+WyBN4vnFFShaSqUF/odbcDjyLWiXnyY3e76EsjeqEnBAXKndhTOJ56ju7Uflz+YIHeIv/IckpqVK0VlFBwotGDyNLo9EZ7m3od3xm2+Lv1q7s6b/VpWrVS15fVpUUZstFacg59gDVCGwzA3gfCa1rU6DiORo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwkbnjBJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwkbnjBJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49CB1F00A3A;
	Mon,  7 Sep 2026 22:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788821508;
	bh=CpNO5iJlR3FclFUcuhCzPbJFoQt5vouWRBDYqU3FGUo=;
	h=Date:From:To:Cc:Subject;
	b=ZwkbnjBJsk74O15sJwWczUfiTwFnjhAV3gyukTO9G6ekHeN0XMxFjztPfNO82v/cM
	 tOYLtcnYH/FsvpBK6XOa4rRFVbqAc81a9vj70butUZfk7rRoK1bc6v53rXCyKq8tG2
	 FW/OhE2EixzhPNYzPARR0IrWyXiYX1j//9R2ifkRNn4hQweW5fvzREbEpVFean+YkD
	 xy2VfqyWXNek82XDeNJ5QIrnR+yzRHSeAuhPicAwNVsGp6gHF2GCBU/1mjmJ1f9fTP
	 gnOwOT6O22XoSNReatTDR0sbzsWz4Z88fHDz5HitHF54LS2f5nCGfwo2Dad9KXoup1
	 pN6wpSdMxVR5g==
Date: Mon, 7 Sep 2026 23:51:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 7
Message-ID: <ap9AAUN_xqEIJOtS@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VJ8CWOSVpm+Kzi9c"
Content-Disposition: inline


--VJ8CWOSVpm+Kzi9c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260904:

The ksmbd tree acquired a conflict with the origin tree.

The drm-misc tree acquired a conflict with the origin tree.

The amdgpu tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 3715
 4019 files changed, 235867 insertions(+), 54978 deletions(-)

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

--VJ8CWOSVpm+Kzi9c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqfQAAACgkQJNaLcl1U
h9B8SQf+OHxGn/OO0GUpy7kA/VxUDrQJZCH6+GZOhI1INXjDQqPMVPfE70mRAprE
5zn9RKSGQSs4LZRT2R3a9KqmgGvJlrJGAK+hz90nB1eGNbYf22Od+e9pz58q+48N
JDN76BrbDZD4VdZLcC1SLo9KNu8iJD2trChakRrJJ8bnY7IKWgR22yK10L4KbavD
nvvGC9Fr413IjRTLka0NL+ng3ghVbdWZIj/HV6GvD/660MwiWZel7dpQQ0wujjdN
YgOqZGeiOKsvr0jkON4MphCd0lMH0GOUIwzsargSALEJqeonnIqeIf4d83j4/gjR
yJaKzj+KgmVJTYJwsPT5rgSR68CwiA==
=r640
-----END PGP SIGNATURE-----

--VJ8CWOSVpm+Kzi9c--
