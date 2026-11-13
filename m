Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592388;
	b=FygvT4k5HLNPX9tXQf8cD4tmioBp5egRdsTbL7Ws3+uY3KTgtTzpMWlVayQAt0SqlSmC
	 aMAe0qsQunfj50wxA9X0Bg9lL4V0U/GpBLuhzBVU0spbFBwE+fHWgv0k9EgT9q+8A0q0y
	 YM28i6a1PNRjAyW9S2JPhaSJpcMbHt6Gq80Ma3izLUZwYpj4PsqG4tpNnee7zec4QrdFO
	 5xwKmmi6cWKmxFQVpoaQeXhdv+vzJk0+tC6XR0sYC+HvN1NgDJU/RUyAK0Nk7sJbdsZ88
	 5R1cMHFZl45g+4eelXH63XnCYTssB8bc0KTKs9+6PQxh2CzffXN9MunkUfVhx5ntcZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592388;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=mkop3rNd8ipKCUS88Gl2+z9hJebRyc+Xc7ELZ0zw3hc=;
	b=O4keWkxJZslVp6m4lAnBdQnHTR2mDElJ3k5UUTxF+P7mWs8rNtjdt5g1F26XvnqOtAet
	 FLP1pOjvoHQ9CtpOPMpV4Q8uhJ4K+Ciar19kTp8xf10UDb5h1SS//KIJFxQaS7Ab6f0wJ
	 EQy8SWo27y4/al+loVqheGDxt0rIByNmdZTwDMov+6PIFdy+qsGTRKwhuEVgoN90zsFRa
	 lF0MZKf78FByuLRgZXl/GjhxobWGv334BrE0GFwdan9Wsvadl6tyqMdLvXMO3XINnVrEY
	 YYyxUEHhXCNsxr3LunKgOkxFdhyLEQQTjdwJ8055yB4MBZKS+vSFWbb7yqAgWXBxsbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2zbNCC+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23AB606A883;
	Fri, 13 Nov 2026 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2zbNCC+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF49C1F000C4;
	Fri, 13 Nov 2026 17:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592388;
	bh=mkop3rNd8ipKCUS88Gl2+z9hJebRyc+Xc7ELZ0zw3hc=;
	h=Date:From:To:Cc:Subject;
	b=G2zbNCC+lAUQ+yyqki/MLp0zEh3NokPrJHRNgCU5kpFntkQCcEwomUrZrP6v3le1G
	 W/dNKydA75ZIPMr81qBoyzWX6b3g5d2Df9RsNUQckfbsLWky06h6TdQyRz8dFHHll5
	 J4z4Enn1yQNURY7x1vvISY0ATuXTNddQGXEK3szj2SRY14KhYQeQymzsshS/C6Rcq+
	 rYcBvEKMowpdaOscZjC+6Yq0tUc/tCnoQ34my1B+XOejV+z19i6zQREQegXBjvEfMi
	 nj4tEiAB9v9JKNCRwmXQRQ0sUfXtHG6vva2PlevGBfQ6kyKWlhK/gQBBaFp537HquS
	 bgx633JWNcj/g==
Date: Fri, 13 Nov 2026 17:53:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 13
Message-ID: <avdOgYI0LjP2WH-N@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="ZxL9G7tV3DfEZZQy"
Content-Disposition: inline


--ZxL9G7tV3DfEZZQy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261112:

The clk tree acquired multiple conflicts with the origin tree.

The asm-generic tree acquired a build failure, I used the version from
next-20261112 instead.

The drm tree acquired a conflict with the riscv-dt tree.

The drm tree acquired extensive conflicts with the drm-fixes tree.

The amdgpu tree acquired a conflict with the drm-fixes tree.

The drm-xe tree acquired a conflict with the drm-fixes tree.

The iio tree acquired a conflict with the v4l-dvb tree.

The pinctrl tree acquired a build failure, I used the version from
next-20261112 instead.

Non-merge commits (relative to Linus' tree): 6094


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

--ZxL9G7tV3DfEZZQy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr3ToAACgkQJNaLcl1U
h9B4CAf+JS2s56x+9YZs30Fy0WH/AhTXI5PBhmoozyuSC2xznjhSHkgwPKfUX6fI
T+7cPh25mKqNdphGN2Jf8bT1gAQMObp4dHVb+buMx08spYRiGMH/SIPkZ1H+X/3X
vNHtQVtAkUtFAKsGLv/4oydM2HAjeo+ZvcYb6IzkWNJFlBnpXtZKYsWepzGZzVru
AXHWhrnDf33MsDBZ8HA8Z/jujgWhnTFrsqBKLPlYmW4peKJOdrGu2f7EFJ51zBXj
5FOWVAR8FFM6HBRLwtL2Q/mrOgd2682/Q5sv3UrpRrfPuXHesc1/o5zNhSbore+T
EYWoiFyECN3jSTOQjfpikl01t+D0Og==
=kOd/
-----END PGP SIGNATURE-----

--ZxL9G7tV3DfEZZQy--
