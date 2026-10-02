Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB891367B97;
	Fri,  2 Oct 2026 11:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940787; cv=none; b=YCA2/QFGGntA5frVc89J5oSQjbaERSWsQKySJ3N1/lfrhqg9J02Z/xYohFqKb4/xEkPZGjUUeN9lVjbzU1ZV6T2NMeFM1oTG02+aHYGIB9En4itqVVXu+GiXhIU5q3VWQcLsTeOKr1QZkAMyrKMpthkQVAxuMLDrcXatS3TpWFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940787; c=relaxed/simple;
	bh=pIcYlsvQmEq7KeZ/gw+58DqJp6KamayhkSbMgrgl3eA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jPgsOA9FQpznnr34MHz/eu9oAAwVpsUhdNk6wt0YUY0XIis6d5fuyHvHpVsuwwOUKSr7LovSS+W4MSkkQ2dNjTHWKs9kLP+zeaBQo6f9RhV+MgfCnk6yP8+bZhkuLy6Wka9xhN2mUR4j9i/GLFIaOp+NJXStrvcGM5Uqba7dtCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKTpej3p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKTpej3p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1FA1F000FF;
	Fri,  2 Oct 2026 11:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790940785;
	bh=WuLZgAEQlvv+6ZHPofN3YcuV+BNyw7QsL2tfsGA2ROY=;
	h=Date:From:To:Cc:Subject;
	b=ZKTpej3po3Bcu2tW85IUv1HYeHBx5XEXM7RUSPUJAi1pRNMnsbG+QcGLChmQ8hVI1
	 2iwFBhC3jIuSP0Ch4JqS+xe6jjRbz5U5uM/BpQu3S6Mib2NT7sb39jodNuZgSZAaXs
	 Z87Ku7z/pz/KmVKyrDkiDLlZcLcrwAuQDDwFEZXMtJryG5AQXAxGjpii4os0CGwBhN
	 AO230wGJeNt9hAlPSeih7T0YyMW+elCMH6LyG+Fpp7DzYDtrjHSvwC/PQuilWhyQKw
	 VJ0QSSvPhRSEpHPM6yaBsOPVMqFpNUytqBXhOXFUtBnbY80QBg2AMAZ92zUNiZj2mO
	 1d90cxQkyFkUw==
Date: Fri, 2 Oct 2026 12:33:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 1
Message-ID: <ar-WbnTc3mEdbz9C@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9jBlIE0PWi0Xrm/d"
Content-Disposition: inline


--9jBlIE0PWi0Xrm/d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Note that I will be travelling to LPC from 2nd-9th October, as a
result -next releases will be at best spotty during that time.

Changes since 20260930:

The mm tree acquired a conflict with the kvm-arm-fixes tree.

The net-next tree acquired a conflict with the net tree.

The iwlwifi-next tree acquired a conflict with the iwlwifi tree.

The kvm-arm tree acquired a conflict with the arm64 tree.

The phy-next tree acquired a conflict with the v4l-dvb tree.

The random tree acquired a conflict with the kbuild tree.

The random tree acquired a build failure, I used the version from
next-20260930 instead.

Non-merge commits (relative to Linus' tree): 12041
 12243 files changed, 686052 insertions(+), 250965 deletions(-)

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

--9jBlIE0PWi0Xrm/d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq/lm0ACgkQJNaLcl1U
h9Ce2Af/asPXGxJzqjFRL4Nu0MrRzneIohdkujAH3sIX8mb9TGt11fuF/Ls7QrsV
Wk9zGBxxlUdq1h6eyakXOrctM3n/6cxhO+PikS7lxG5iSLA5tY15QLwdN5o80oEk
pF9Jaqjh8I5VscE9lMt5fJ06uBs7AKOVHJbr/OJzqET/UEdDEeFRj3djtIMLciWP
ZtbKbE0P4DYufIZMZPwK8QG/WDN61X8j3BKbEUpuE7JOUNDaeYu6W12HHhdc6AR/
ECRjBplKYVT0aWoo5ZzSHjcivhmasLFDqIv4GJIrZLzBOgdqpOsMXkG4NbIk/POa
OMx/WqP6eT0i9PMsLQcso2Xi+MsyKw==
=Ozn2
-----END PGP SIGNATURE-----

--9jBlIE0PWi0Xrm/d--
