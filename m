Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706634483A9;
	Thu,  1 Oct 2026 11:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790853686; cv=none; b=h3fiGhaH4LR2eL6pa4wR5oN8DhuSAkndKLfYXPw/e6F1Zz0s9rlkWYIwRtyJ5nkVbnB4merhdNlRI/HO5S68MEqsSScG2tMYYqmm7qncBV2MYBtGjg73BSgzGdTkKER8U9qrX1ymrUVO2KJFh4WkJLmo6yH2BahrsRUjDm5MRCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790853686; c=relaxed/simple;
	bh=8LLUcC8BUb9pLxBb9RQJ6w5+oDXrMPm+Y5cE8pydAjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uzKQQe8C1UkHgmZHhqOyi0wXOCjfR0ikhs6oJmKkBtm5v4Dqwuy9HByrIfGfArklL+Ll4MAIfRoY+6ea3fcT8UWcAYhqwhOrG0MvvnxPQ7fcEUn5/jPtjlSsjPLm85E7FESKbM4GKC1O3agkbGfUyxi1/C9NKyG4CoKIkkpyGjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbAcdmTb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbAcdmTb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CA21F000FF;
	Thu,  1 Oct 2026 11:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790853685;
	bh=t6Rl+zDidg5vPG6ohq4YSrKnodMLOnSbKxk0J55QyDU=;
	h=Date:From:To:Cc:Subject;
	b=RbAcdmTbZn4/6Raoayh+H1JtSwH/0LmUvL0stJP4LnUu0TWvXzWnxifN1QKqs3KQ+
	 CIH2exg2UnIDwzTlpOk2yrpdLsd7iqIgNnjRCDYt/k+0HjxfVu+NjJhvmTIYeTz57z
	 loMypRVuO/fdas/vm+gFFWHfM6tP6xEFQ/bsmBJkNiqW7SE1Gd3KCwd3SFEACRuKpK
	 LG1px77Cl2cPkzT31wLZfcKpYXOm+XJS2LZq7LXGeo5R1LmTT/JEg5UbDDlgG7XR9D
	 8kWOf4JiLPV8qAZ9tnrvZTTgVX1WuQ+f93g3xww+S6EEcUSlH92HEZIhjVxAEZz6vc
	 Q2Potpr2mCUuA==
Date: Thu, 1 Oct 2026 12:21:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 30
Message-ID: <ar5CMQqWGUCVevPL@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+htrSuQECKnwBLSl"
Content-Disposition: inline


--+htrSuQECKnwBLSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Note that I will be travelling to LPC from 2nd-9th October, as a
result -next releases will be at best spotty during that time.

Changes since 20260929:

The kbuild tree acquired a conflict with the mm-nonmm-unstable tree.

The rdma tree acquired a conflict with the origin tree.

The kvm-x86 tree acquired a conflict with the kvm-fixes tree.

The tip tree acquired a build failure in the final build for which I
applied a revert.

Non-merge commits (relative to Linus' tree): 11399
 11678 files changed, 645230 insertions(+), 223574 deletions(-)

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

I am currently merging 431 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--+htrSuQECKnwBLSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+QjAACgkQJNaLcl1U
h9Drugf/VDb1PQNH4EKND9zOygxCRclRpOwepdowFMS6O8u6fltRD5gbPRFnAuzW
1t5LckkTTKbStYURBYhCxwJKqYnF+2i4gQtqtNlSGC/N2G+Lk9ei65w5GUIUesxF
Kq90JhFpvhhlYfIhL6XVSGx3Vpo+PyBYRs7Fauwk9SRoQWpsm2sKnhmFzQLoV2Ch
XrKIcDRguaIuTZRTq3IkfrQxJ/yBxrT846+nTo1aHbmdK+sgIv/tHJ2zauWnLmmw
lSsgWN/9bt1pIP71JfUZOjd9NXBtwNJoZUGklS2FdhMvIVsj0DGkFS+ZiE4lCp55
dsTmCGmprlqSkXqMEdYPvTTucXXkAQ==
=eF7P
-----END PGP SIGNATURE-----

--+htrSuQECKnwBLSl--
