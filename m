Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800159;
	b=zxD2Idb0NR2CHoZutDFhwqL4qISzbKgL8/4e1nM4z+M+yyx5I6yQzYF7oz6zAYVX/SBs
	 PW2YavkpGY3+ch7/VRCJJalAqgbgSA3ul7zeXcuJArEqlsHVDb8dJeJI6C4+j7uWim3IY
	 psq4IzaxLqq0ajbDp2p+lpLEdybU0cmZWfhkFi5Z0XjAjLv7oXfqxg0ngEW+2DCe9o35f
	 NEI3X/5qQnpuKZ6flnqHM9MGQYevHLjpWTxyOfC1l1FRrkbc19jt09/HmTVmArZf1AdFp
	 WXwgRMjYaiOpHiXmKhy5y6aK5eT8KsV96OWF0dkdCgFIKzU2+Q3ds4ttjZMzNj85jTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800159;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=VnP+ywtmwpsUeB+1YP0ciFWt3att8mKkpSXyQncrKEY=;
	b=O2NhJowFdoj7ZpaA5w7NjGBMl/QDfppQnkz5/6Wnhnum1d8f9kYXSr5GJ6GFoVmQLlyt
	 hWfwF2DqtjxXc1AtRGvtHI+p1Q9j+l51+EBCKpPglrqVgufHvtq3rLvXn4iikbbPaiZFE
	 RmALPu+LycNdCbOQ5I7xs7lTJoZfeK98sTlIvXPfbGsk7WLn34yDdlBQuiyaQciLNWOAg
	 31rYWEDgmH0N+unsnN9I/c4LdL1Z1dgS5NCshHpZrDmlavNBXi/K6FcjJrgTzCwbsvAOT
	 qszNmRQ35jgJ6o5Gwae4CTM/u5Ar1PGdGyy0Z5Z3F44rZi/gvyXCauGKP/rnxpZnYpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iukcgD2B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC00606A31B;
	Wed,  4 Nov 2026 13:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iukcgD2B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3091F000C1;
	Wed,  4 Nov 2026 13:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793800158;
	bh=VnP+ywtmwpsUeB+1YP0ciFWt3att8mKkpSXyQncrKEY=;
	h=Date:From:To:Cc:Subject;
	b=iukcgD2BUGZMwOOj8MZxZl4L+vKOsZeydY3a2qyKBoctZQj4EL1dRuSNx12ppQ4/M
	 eeqxKy6SMNNvBlYoJyOl6Tx1cWRFoqCvSNEjd985U0M094W9PUDIhBSfXvfD0NtDpH
	 RYQh0fGVwfhBhy2F9wKsbM32xVfimmI2nGdvzU17LhqgDJJl2l11QHMREAyp4Demtb
	 YzB6OZ1JG06vMSUb1MLHW9ZZtBBkA8Ayn50LLgkC3nzwoJMHAbfhmrC8mUNI3Hw59T
	 6oaFeoyF3spPwfB2oc4YHfi6bkuWlT+8xAxlNzDrkHTosEAewJG+botkTaojqZ0Dn0
	 2wI2CyM2EOJ6w==
Date: Wed, 4 Nov 2026 13:49:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 4
Message-ID: <aus32xrsahXYfc6l@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y1ElHorL0q6hilAn"
Content-Disposition: inline


--Y1ElHorL0q6hilAn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The releases for Friday and Monday (6th and 9th) might not happen due to
the magnificence of the rail system in the UK.

Changes since 20261103:

None.

Non-merge commits (relative to Linus' tree): 2922


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

I am currently merging 436 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--Y1ElHorL0q6hilAn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrrN9oACgkQJNaLcl1U
h9Bs3gf/QotQ6oI9krepRzHGwUUZfjx8qpjrrftpg3SmvSDQlj9d8orbEzEyk8HJ
lOuQOj+KrqxJeSRS7gy+2tEcz81w4xsqsyhuC+3GL1OzJzLNWf09qPxm80/YwpEt
MCJVHam729oNDUDzR5azM8jNJwolgYpD63vSNJv8N5DvtrhFS3wx/y5oXmkn3vIt
rBK2vT0vOyjeltI7R8FYClqAYOx4/k+8zq7QEDqhDVeLKc0W9ENHdeKC7MmAWmNH
dtgq7kKplkPCgKg6gO4OE9zjGUmLFubHs+//EE3wkH6WZoDFAKUXLmZydUWxYqli
n87ZgSbV+6VUE7rADqual0M9Hv2tQg==
=Goda
-----END PGP SIGNATURE-----

--Y1ElHorL0q6hilAn--
