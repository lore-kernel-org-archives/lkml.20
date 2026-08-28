Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634EF46EF79;
	Fri, 28 Aug 2026 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925935; cv=none; b=gZxYsMdviXuYByLsdy46jjuVbWRZ8zqh5rFCp1e48Ol/4+SMGuuDuLbNvuXlSNGHRPcj2kKqZY23IOxCWXsQlV2UpP5QFN7U5n+8w2Fc9dd0LwPOguzihKcAl+fTxSjNesxF1Kkpjor5tMl4yl8ERJK++wOQ3/XxaOJ6VaK0n8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925935; c=relaxed/simple;
	bh=6nKhwIqZy3w9LD0pMgMnkeExoWgJexHvAva96rVs+ow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CYRTIVgapmgCFDmpUm7A2MvEIzCJgjqFGAgnu2stZ4AH8L5jfSfYnjKWWcXlFz4i6l8TE35ETxX921KPmnpJweSSwWyWEnu+LFt46y+yn4jmvlZD1yJj/KyLSrCjxUrwjbXR5jJIbukO9dsXyg6A2iUUH0SDs2oDHLKNJK2IEiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWrxGj5I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWrxGj5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DCA1F000E9;
	Fri, 28 Aug 2026 14:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787925934;
	bh=BHiGboxubOC84G8c8VQmLTb+0dbw0aVa/SXOlcfyv5w=;
	h=Date:From:To:Cc:Subject;
	b=JWrxGj5ItJxHcnT0aITZ4U0SGwHhVKGhGKibCu/3xuN72wxF4EeHXBu6FaRmHGccm
	 X39q4rM0+x0j5JJk4E5pZLPVYUHU1UDoaa7vfCH0Iix2XDOiSXdBP5DyAbcWQqIv4L
	 a/eQwyV0ECNRSxCm8ZMaGN+AU7odtboLN61yKQfe6kNwNzLDcgILsEBV8iDCdYJXsq
	 bPeVCAe6aPdmQ5yHYB/sgnxkZl1rnYKt6rtc4N7brK6KS5EU3ThWeYrvxZ/ytO4keg
	 Xxvy0eCLGAGBU/92A5eotYtoCaHEdcQAcwX8mNWZn3YGM1aPxLFzvwccPXbEu4fmUB
	 3zbn0DXX4NO1Q==
Date: Fri, 28 Aug 2026 15:05:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 28
Message-ID: <apGVqz8K6RCH5Vpj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FGENMSCaK+JKG/CZ"
Content-Disposition: inline


--FGENMSCaK+JKG/CZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260827:

The ceph tree lost it's build failure.

The drm-xe tree acquired a conflict with the origin tree.

The pagemap-headers tree acquired a conflict with the ceph tree.

Non-merge commits (relative to Linus' tree): 1159
 1079 files changed, 29562 insertions(+), 9371 deletions(-)

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

--FGENMSCaK+JKG/CZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqRlaoACgkQJNaLcl1U
h9CvTQf/VYY7KxQw9GpJKgTMlU6iFEqF4hf71hzsBbDOaFKcoKdiltgLCQfSueRP
RPZ3SaF4rF8CALwZ4XUEw8WmjnTmUK1q6EI+95XnM8K5Ns9kp14KDNGR6texI4rj
gCMYSrmVJ+mDx4ftoil5vdV5rVAil8oUTrNmLIJ/Wfgtf3w6DG5ivjycT659sTOJ
PQEDslqcPn+S97d9fAqpSnPh3umbIspapq53OlxmWuDFz2Z8K5qyfba2Y1cTAdmC
Q87++ZVAL7d90F+cPQ2DMoVkTsUZMyphIiCLzA+JU9CkhhsM7z0GujiGvFbyvRJx
HF6qQZ92YfmUZXJ0hrnqwjZBVDeqOA==
=58vA
-----END PGP SIGNATURE-----

--FGENMSCaK+JKG/CZ--
