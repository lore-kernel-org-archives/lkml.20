Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829733BE652;
	Wed, 23 Sep 2026 23:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207383; cv=none; b=Axh3CzbQ4QRZ1rAm5lhYESqGAR/A07AZZIcVUDvo/T4PokSN6++YdeImVBIhzmwfNDeY6QY/w/obp7gsOfe6cSjUz7YJVSAILuf/fJtcE5yo0cbUb9p19kufJsUYQLh9lHyf8vZJdcnJJx8a56gBt2SC198ezPRCMczHvwMCsFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207383; c=relaxed/simple;
	bh=3uJRhCmRf9TZqNHbk1Lck7Ez2IIoOIVenwDt4RQ4zoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fQWvke1BhH1TJQup1FUc45KIhylONy8PfL+oudltJsjsP02zAK2O1dxgbkVZD/r6xgLQOlL6ET9SbBVO+SUFEyMd8lvtRftzVRpBPyjYUBHSWarH5DKZwlCQfU+7UIedF1uv1XkrosdklfwVkTgq0pNJRI2Q8iBOUiB8bOj6zqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFCBWeg/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFCBWeg/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DD51F000FF;
	Wed, 23 Sep 2026 23:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790207382;
	bh=zsUXdHEO17CAVecZMWe0/oL/2w5uWrT/pyQM07ZO4Zc=;
	h=Date:From:To:Cc:Subject;
	b=fFCBWeg/wuhh1w+d7YWYmhIoIwugFI/A+uhfAv/v++2wIaIGLyJRJJz5NVEAaRwcm
	 ZB+NUn2i8j1DFV+Mn86tQGmpnqZ+wf5NvEFC2NHj1XFsWwQhw5b8d5tsrMR4IvbzzE
	 Qr23qCZhUos6y+TUz2V3eMNfp7m3DjmuI+6KtY0/EEidUSvcj/tmphGtWjYoWadW5V
	 oJP1oioDt1udqshr022StzDeYNj170Y7tCCfcv49x3xdu8MgfQBLsfcNH9MiRL5Jkv
	 4O+/Btzas4+dGOrEKZbxjl+GUzcxHQOhanNiuFolGXJgl/pbwnR7HRRKysmTfPzanH
	 UNqi8u/2l43zQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 37FB11AC57C3; Thu, 24 Sep 2026 00:49:40 +0100 (BST)
Date: Thu, 24 Sep 2026 00:49:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 23
Message-ID: <arRllEFKd0N1unr-@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VOu8k32yvxaWKkSq"
Content-Disposition: inline


--VOu8k32yvxaWKkSq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260922:

The vfs-brauner tree acquired a conflict with the ksmbd tree.

The mm-nonmm-unstable tree acquired a conflict with the vfs-brauner-fixes tree.

The vfs-brauner tree acquired a conflict with the mm tree.

The v4l-dvb tree acquired a build failure, I used the version from
next-20260922 instead.

The drm-misc tree merged the amdgpu build failure from the drm tree
so it too is now held at an old version, next-20260922 in it's case.

The security tree acquired a conflict with the vfs-brauner tree.

The tip tree acquired a conflict with the ti tree.

The bitmap tree acquired a sematic conflict with the iio tree for which
I applied a fix.

Non-merge commits (relative to Linus' tree): 8521
 9234 files changed, 477955 insertions(+), 156105 deletions(-)

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

I am currently merging 430 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--VOu8k32yvxaWKkSq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq0ZZMACgkQJNaLcl1U
h9BvmQf/fu6VnvJzyUMRUV5jYatOmyNqf5dlKJLIVzJqzPg0FsJdNa9CyXZ2QOCH
wF+tA8+5erLkJPNgXa74bcrzMv7+m5t3G2rvJ8cKaO4hRVugImOu+RNzqZZB/wwj
qlRXYXzo4CQMeO7/6PXjXMhrAlGHpOJzCyqMATVosK9BM8PlvxNXRN31yg8vC99X
S6kfY/2DCu9nz5dPWNseD7lqCtM4BF3pAz/9q2hOwEJF3KHCBx5JVTIcXZbrgvdq
uukQT2vQ8aIjJoVbTH48Po234FRgAT/wcx4mskf/a0vsm6VFpZR85fndAV2y3Oz2
lNwEpO66I+BrZKEWWHUAsRmtSADYpA==
=X3LB
-----END PGP SIGNATURE-----

--VOu8k32yvxaWKkSq--
