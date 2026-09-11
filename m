Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B96373C00;
	Fri, 11 Sep 2026 16:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142591; cv=none; b=tiIqBCgjYXuyOqY8QOaZHsgoVW1KTVGIVwBkvewJFEgGzQQNXySCq9e66hZwGbmHtl7IiZtwv0DKsXKM4wji7wT1cwMZ8rIokPwDK7IH3Ku2cVwTu1SWAXxWnvSWhvSFES4EjUoLxaSoxnTxsoU8kBRTEnxAjcGzqd/zLcBdlac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142591; c=relaxed/simple;
	bh=9cmHKCShSs7onPXDV0ZP9jEOZt1qD7ycClQRsC0pwP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ctjWP/FQUVgswe0UT/AvEKSSTTYpXJ1+mSxvGvrQuQH+RahRWNtUCNTWDKjKgXP3PBz0bLwCYvjUVHJZLAEnWAR2Ut7s32SliZEYo0AhikzsYiuIdQ8AR/k0/BxH4CcVYIvv9Oe/suvO0cwYmFyth0sdDgkpRvEIHB0uJUttFEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcaPDQWR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcaPDQWR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF611F000FF;
	Fri, 11 Sep 2026 16:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789142589;
	bh=2TX0tmqAhwBVLbhXgXPpRYuiFTGe4oFXIWqVhqt8FAA=;
	h=Date:From:To:Cc:Subject;
	b=NcaPDQWRAAXwDOlucqEk1ItPbZnY9Y/4ACsVKRxUA+0HZeOUNHvJJeMludnUnUW3y
	 dqE+FMuCzeIMMJcyJvsrS2YYWx4hAkn9VltSDYsLGmFAq1e6V8mONlKYy4oS/RTVFb
	 IWBqYNuMtFtNSiqWCu8AzjD+Nn063mHFSJxGb9eG6fnytGML/mHUB2a9/moMJxZcPS
	 KMW+PYQ/Uc+sXLqsKLjCT56ad+yjhkAEmxVRoSqgUosllZqLXXXumTtGsXtUGJQqsH
	 dWCLjvvpO8Qz3Ye6WOmEg2zJN3UCyU4F18BNgTFi8LTetRDnoVWTHHsTP0fKFVSKh0
	 mGNVy+5DErw8A==
Date: Fri, 11 Sep 2026 17:03:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 11
Message-ID: <aqQmOinJ6fmNjQR6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cwvAfuWfb01HRVk2"
Content-Disposition: inline


--cwvAfuWfb01HRVk2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260910:

The drm tree acquired a conflict with the drm-fixes tree.

The drm tree lost it's build failure.

The amdgpu tree acquired a conflict with the drm-misc,drm-fixes tree.

Non-merge commits (relative to Linus' tree): 5339
 5513 files changed, 295025 insertions(+), 77962 deletions(-)

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

--cwvAfuWfb01HRVk2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqkJjkACgkQJNaLcl1U
h9AFwgf7BsbAM9D+TSPdYBQbOiPoMkxeVClFbxmRGJKdC7MfFsbD+lywVa05VJft
4yuqebxyHse9bM3WsIdKO5jMZ25QOLOyeJRtFHXDj+lSd2PIcIQG5UaUA9LmcqrI
uUUSybW1WXNhABJCu8wM8RTYR+woTFWI20/CGXXbAV68IRDqGUWgQTwZ8PBvl+tm
6wZrhce7VcbWhpVTE+KzZjpFXBDbb/s1clC/9px4ZD/f6q5ukWl1bBbn2sYoXDwa
G+LIPE3aDkEXkb1LK/wEnkYqA5AKDvdkhVargyxkIVPzOjURS/1SCPDKmE2Vz1F6
pPHkv6VhpM/OCA2flvhKs/heGipP5g==
=m/jv
-----END PGP SIGNATURE-----

--cwvAfuWfb01HRVk2--
