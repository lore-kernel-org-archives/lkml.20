Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6B948A8C8;
	Wed, 16 Sep 2026 12:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561699; cv=none; b=P8Pw8cg1feGnBjBAFzTNY/X9sf1Lh5zFNzniOAa6QcJDSeYC8WzMdyCd1TcuFtftScHO91F8f+mB6PrH4k4cadIK5bczfKc3qKd9Uh9fl8Erw863Um29je1nw0qzKJrOpozPyKoolveCp3587r6rkbINXEbQVVX/Oh+603b0TOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561699; c=relaxed/simple;
	bh=LDIf4OoqJtgPItdlevrLGELIbMV/tH2ju4nxMvyXvMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qyFh8nQdihP9m0+p4XKriPiEzj7qnvOGF++YcWcRGmIPqCCg9+VxEjSudeG+vG7APNO3R8tOp/eDQXsHxTxkmiChf3Kk0AJsXT75EOenyZy8GXXESZ/9G75DWOIhcB/gvQqbjSRfe3WvoFVvWnoTVaBDfIL62PwQTVTC4RaEtpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9hyjh35; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9hyjh35"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB5A1F0089B;
	Wed, 16 Sep 2026 12:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789561694;
	bh=/YJOSD0ShUKwBSdfgtY6Sy2Y1X03OAi4c0u6QT9IPSw=;
	h=Date:From:To:Cc:Subject;
	b=E9hyjh35loBqp0EmgELudkKNcgBGy/qmP60b+J8VSeTwpT0oxN63rOpMyEcaosp1O
	 P/42G1I97suifcWf2KoSLkBhItYbxARzmFBHPUz0fd/7Nh3dwOqx/SKt5zPKWYY0S7
	 I6cZGA74wywic3Yz5i+2QNHTk0f0RRAUrj8RD1W5D2MlWsy+z8EX9dlRfuNjE48EZA
	 AjuAN0ftPXZkkk/Ko/iXutmmsmbsRevfn2eHQNiE9BzIOJIuYCj8QpV16/h1xWovuU
	 wvaek9X4iPsN+GMhAbimIkFWU0MhLkuklxSU0+lcLG1iyB2s9Hz+UsViJ0nqOhaKf0
	 sid+S6nkxNaIw==
Date: Wed, 16 Sep 2026 13:28:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 15
Message-ID: <aqqLW7-1tbWU_Poy@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UwFQFusBJprkbXOe"
Content-Disposition: inline


--UwFQFusBJprkbXOe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260914:

The ntfs tree acquired a conflict with the origin tree.

The ntfs tree acquired a build failure, I used the version from
next-20260914 instead.

The vfs-brauner tree acquired a build failure, I used the version from
next-20260914 instead.

The mm-nonmm-unstable tree acquired multiple conflicts with the mm tree.

The bluetooth tree acquired a conflict with the origin tree.

The wireless-next tree acquired a conflict with the wireless tree.

The ath-next tree acquired a conflict with the wireless tree.

The amdgpu tree acquired yet another build failure, I marked the display
KUnit tests as BROKEN.

The phy-next tree lost it's build failure.


Non-merge commits (relative to Linus' tree): 6418
 6667 files changed, 364563 insertions(+), 106247 deletions(-)

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

I am currently merging 427 trees (counting Linus' and 132 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--UwFQFusBJprkbXOe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqqi1oACgkQJNaLcl1U
h9C3mQf8CeEIbAS0XUpD3LZxmoynCZpK+eCNjgp0C1ko1w1h3ayo6W74SPnR9g3G
x3In1z2OZSshoU8GUtdS2DKE1qLNt1FypmzYZXY0gpQvSaIAFzwBOP/H+BFSIDdq
Npzu4Ijvcx1bSAw5ndIR/B8JMqh1hNyUMDp8oo57DQ5VqiPmAD7Y2qnOxDCjwUrd
irmQ44PwBZUZYll/0krFHCZahZkFn8RjYSGcB9c3MK0K//Cq7Dw6AjgxpfB3134F
3+ngm5G3CG+bugYz1gBhBPoetuGhDBodzyCZpjY9yV3UrLSfQif7PNnO8K0dvB+x
CiC88+VsoOmJEXkfRxPB3fMxnlvzxQ==
=/MDL
-----END PGP SIGNATURE-----

--UwFQFusBJprkbXOe--
