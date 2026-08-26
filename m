Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23FB3F88A6;
	Wed, 26 Aug 2026 13:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752547; cv=none; b=udUa9Uj8e3C9ozRq1lmN++MSVC/vi9XYncZo/KzqZncYHZdJer6+n4oK9ke1+HesVmhih4tDcyS8Ira3SE1MhoJGfr1G8h9GLpSI0EyjGmBTR3+jXxBtQsMRqj2Hu8Amf43ZXbfNgTNLYiR9PQSVKSXlW8b/5wrt77BBxYDiNV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752547; c=relaxed/simple;
	bh=RUVTKw/VG54r1eefxdJR7ylBNa84J4JvSA+VIPShnd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UZVwHrCPxe3Hm//q6C5yU1XiZKkiYe+xcXNxn3YmgYTYoyachqCIE0RQpHpIHZbAxABDye9R2U29D8jT4boFWWHZzY6vGEE0C0lwEyU2pYgx6ucfaq6CluzA/6eLdjQS4/9vfSZiCWVLru5fySrZLYzDfEuF8PPCbPtt6pa8x5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GO5XP2Cm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GO5XP2Cm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE4C1F000E9;
	Wed, 26 Aug 2026 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787752545;
	bh=Df8kS+YpI3r0tWz7CuHdfyakM1azwA4JtMxzFyOyBMU=;
	h=Date:From:To:Cc:Subject;
	b=GO5XP2Cm6i+Dsw0fQq/BrOSz2GthPcX4IZnyCI3s/TKF6EeZC3dgYSmbVHMzIjk1W
	 nLFV6JjkQdZPATXzoXs7xQLTNKVocz/Tu/AVj07PiKk0vQ4egV1T6mfVdO+xVeny4k
	 62U7IYql386nW3eM0v56z+PdwRC3WEXfPUqxXDOFBS1ENobxcbRdUp94+kg6HBlwuF
	 mSmjzumb9WyWF8NjdpUsAoVvILb014lN+eDTdWNNBsE8bbx+SGgy1icLuFBbXhaAxa
	 n37lrmeHRodh1kZSoVj7zoPcBqMWGLWjf9RwV4pbfEUqi20GJPXzUInAe2vt+yAm+b
	 IaYiNfJm+DotA==
Date: Wed, 26 Aug 2026 14:55:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 26
Message-ID: <ao7wXip7ilZWBzTM@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="znhwLp5C5vwWRAfi"
Content-Disposition: inline


--znhwLp5C5vwWRAfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

We are in the merge window, please do not add any non-fix patches to
-next.

Changes since 20260825:

The mm trees were reorganised, with the akpm, slab and memblock trees
replaced by new mm and mm-fixes trees.

The sound-current tree lost it's build failure.

The drm-misc tree acquired a conflict with the origin tree.

The sound tree lost it's build failure.

The pwrseq tree acquired a build failure, I used the version from
next-20260825.

The pagemap-headers tree was added and successfully built.

Non-merge commits (relative to Linus' tree): 1785
 1751 files changed, 63639 insertions(+), 20180 deletions(-)

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

I am currently merging 425 trees (counting Linus' and 131 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--znhwLp5C5vwWRAfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqO8F0ACgkQJNaLcl1U
h9ANcgf/W//roNCagAiHSf4G65BC8LyCa7CV6ijpxH0xUq8gcfFJS/pD5LBIAChP
/zbXtwKU2LSKl/B1Risa7yEviVMnQDuTv7QnerBu+PkWiOh+PwQDHtQQX4UP3gLY
MLmdnSTNyQOlzHtpfXa0ChP117YoGxyOoPCGcS9GjgXBpYnlWSayjQeGZb8ANOtu
R6G3Y9SmygcRpRhdxawLt89ZHQITJO8LqJJzD8JPkHhwJEddXohJB0e3y0zLtKfx
LFhdC2VHRsxP7NKpKebDaMAyWj5BGaX4h4+4SK/0HjPHPXCdKG1J8Dgwaq7vJ3Xo
B0GoFl53J6yEsi+GemOlnsRumBzjXw==
=GSSX
-----END PGP SIGNATURE-----

--znhwLp5C5vwWRAfi--
