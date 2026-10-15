Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33D650390D;
	Thu, 15 Oct 2026 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078988; cv=none; b=KVoRr3oU6EcibTOHWXHgKcn+haMJvd6Pf2PlCZAzubT1chyj/ydOa6yrY5elpgB3LZNPR0sQvpNP4IQ5kdhd01EXzhnj6Ga7KRnmfswMVik2+e+Th6LzIJAMkdfbX75+/ud5R6t7y3RvcyjEBr+7ZYCZsaMX5etUeMMgsR/KX7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078988; c=relaxed/simple;
	bh=BHnpQ4xHrm6QJXyGWiiGIf2ueOdd/+jwPC+jYKzSun0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s+L47T0U5E3bIA+MjQbJM4iDB2j/p0KF7ieIsjBMSNgF2MvdiU2z3/2nuZ8t16smBrbEXh2Qog0Aie2kDVHZQs8wLO9j85kpZD3Gsp0uDZrJ7L5EbnQbULznXccbA+pDuWPa/KY3RtP8nx6+JLFdxmFU06HUg3dM8a+1OcC8jgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtzQeevF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtzQeevF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA571F000C4;
	Thu, 15 Oct 2026 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792078978;
	bh=5B5p+FZHuvqzKTx3y+BMcjuPx8RKHUVpxDoUZylJey0=;
	h=Date:From:To:Cc:Subject;
	b=FtzQeevF573Q6PYFqaWuOTm/AKCpvpEXsRHjtHvZM2WrW784uae6CY4MO7x9Ul76x
	 Vy1L7zB52yMBEDZLygFSqWT4FqCzQAQH7g/Iuy05TblbzBkidnL4A0KBYRIXy0JKRv
	 //hdCzBSGFJqJ3mCS2mCSeULIjRYZEYU3En87jF1a9Pxq3YPxE1bWWA4Q/w8MOZAJk
	 IXIY/GadjeakKWp7lgcTGxTdnZJmfGGfP0NtY5cnal0XGThw9UFfujB8u/ZSTJt6FW
	 Tf/LsI79VFB/opzywTvSQgdFbQm/4iNh4Xer5dZCloqSeJhXG7gplBKvsawVdPexis
	 le8CbT/CFDUsg==
Date: Thu, 15 Oct 2026 16:42:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 15
Message-ID: <atD0f6-oQBYyK_sV@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pOiq4RVRjfpQ0vj4"
Content-Disposition: inline


--pOiq4RVRjfpQ0vj4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261014:

The fuse tree acquired a conflict with the vfs-brauner-fixes tree.

The modules tree acquired a conflict with the drm-xe tree.

The char-misc tree acquired a conflict with the rust tree.

The scsi-mkp tree acquired a conflict with the scsi-fixes tree.

The s390 tree acquired a build failure in the final build for which I
applied a revert.

Non-merge commits (relative to Linus' tree): 16152


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

I am currently merging 434 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--pOiq4RVRjfpQ0vj4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQ9H4ACgkQJNaLcl1U
h9C+/Af/XPvRXvummwEfbOyZJb/w+tGsBuf1KjqTk2chciN96mIAylwnbf+g/rjd
tnKqJ+1objHMvZknqsreRWIfAzKypuSaBKZCM38/UA4ZDnVi9W4Oj/l29smzuRb6
wrs4jQcLlnfIqNccW3KoChcI4h3lHKXdcNaDDUdu+m44GrS1PuyxbKJOcuN6eoL4
OZHQWMbzPu1zpuT/N3mb5y5L30ov15S2x61IQOlDkQ68SgMjh/gzlWmfM1JkG8M3
pvaeTx1O1mT6vqAPkjfxFSFxJV9kPE5187S1hwI7fIvyeBuPgoKyZkMSUJPHpfgG
4hgk7eBozL7GWjGlmsx5OO1jIRLZ3A==
=ARGh
-----END PGP SIGNATURE-----

--pOiq4RVRjfpQ0vj4--
