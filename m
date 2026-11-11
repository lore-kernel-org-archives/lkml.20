Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361141;
	b=p7aGTOxTl+90Asw/9AGk+SvxqdEv13KCACzUELtt4whIYyQihTtlZy02eCDNtw1Pxvng
	 dph4m3dc7DmTWi5VnFGMe62SXKGzeuMWYfz5TpvlTB+9qHob+iTDAjl8csVyWED/hO93Z
	 X5/uesLYQZbr+Owrqt4vI7ceD0S66hbF3F3CuD1es3z68kLDSDVRQ+MH/jwTOVpikd+mU
	 I64GC345X8c64BlNkOKlqcnfFVWnRpKjwSIZ01ljTdZ79EyJlHoLnYjxq6W3VAAx97LoN
	 m6u2fbjVf3lbfhPeIaG5Rc2zCZcN71G0Sx2Dz8VJ31RUenKErxACTxJnydNyGikIbFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361141;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=YN32uCiQtqq9aFcjtm+9jPqhd3Nau3hVhZJ0Lm2Cc7E=;
	b=CxA3pvtUiAaQ6FEy5+CLkBIuHVs1vdiU/FDRLPb4tOCgtDlQzJcF6wxY1zSYMpIBpo9H
	 e0lQjsIiMXgycQMycEvJP40QEq9vcYSavfni6mks3lMcwAUPqAFBhMtcLDWQW3G2x5/Xd
	 XJy3BJX0QJcetXqbTLl4MbFxsF/2I6tWTt0hUKpjS0JuHuEhzDMpuCRt+bDt2SLtNrBqB
	 eZ46Glbv6gNNLG5ufY5BZegzWlLLUOJFOIAqkJ7nRsMckLr6ECEiA3+NOf2XVhoN7ek34
	 3UDpwJqJXCPWHynKm8arypbD/yq5e1+xGapEat4NdPbt6hXZgSWEuqYgUYCjogLi4Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hGsQ7bJ2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B4C606A31C;
	Wed, 11 Nov 2026 01:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hGsQ7bJ2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB531F0093C;
	Wed, 11 Nov 2026 01:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794361141;
	bh=YN32uCiQtqq9aFcjtm+9jPqhd3Nau3hVhZJ0Lm2Cc7E=;
	h=Date:From:To:Cc:Subject;
	b=hGsQ7bJ2nEehftUdQDQiS1UAGwNwCCvWw4Q3+3OSV182sO4pvURYdwK7zmCdG68lv
	 zA2Z+qXr8j1zJhndFo5cLn2EATNkk+5+6TXf9y2wT0hPsj/Hc3KhcllnmxKGk28j0a
	 RANZSqrbLF7FA+2HTCNnTsqPCuCp5yGODauHAXbkwU1ivkKL0Wmp/FgyPIejxoTAvV
	 hh3olRG1/3JNb5LcOzqzSkhqqRS5MQkixttxM3dihjrFCQhSgAv2N/RyWtXIH9U3v6
	 T8xFj9sQNUJBtMHTeZMGxdx648/QjGey5xUQu3d3nqXMwVK4dKgHh6VkKkj+rflmS7
	 TCw9hgEB02rLA==
Date: Wed, 11 Nov 2026 01:38:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 10
Message-ID: <avPHMuq_SfegVdhe@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="m9R3FbLwzhyismd4"
Content-Disposition: inline


--m9R3FbLwzhyismd4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20261109:

The btrfs tree acquired a conflict with the btrfs-fixes tree.

The pmdomain-fixes tree acquired a build failure, I used the version
=66rom next-20261109 instead.

The tegra tree acquired multiple conflicts with the origin tree.

The clk tree acquired a conflict with the origin tree.

The net-next tree acquired a conflict with the origin tree.

The bpf-next tree acquired a conflict with the origin tree.

The wireless-next tree acquired multiple conflicts with the wireless tree.

The mm tree acquired a conflict with the mm-fixes tree.

The pmdomain tree acquired a build failure, I used the version from
next-20261109 instead.

The amdgpu tree acquired substantial conflicts with the origin and
amdgpu-fixes trees.

The rcu tree acquired a conflict with the origin tree.

The drivers-x86 tree acquired a build failure, I used the version from
next-20261109 instead.

Non-merge commits (relative to Linus' tree): 5254


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

--m9R3FbLwzhyismd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzxzEACgkQJNaLcl1U
h9AGrAgAgmsObGbn5DBk6iPv81T8n7NY69myCbzHMAr2lQ/XG1zYmtxr9LNU9eis
foxVLQEax4gc3sI3pvxdizW2oFU4DBoMaipw8XxgKsQiVfiMHjMVK4pE9+S5l1O2
T9+RbSVdhYrI+whwFAWQgMRpPQmexAlAx0+IqHYOIxGsVddY8jNZRV1cH+OREsMT
IdqmImxBxlwSlcTcnBz9JJTMvcm6UvZ1HgAnfop0Im3WpgLNWVZIXzKPjJjAU4jS
xaJnFkWRaBm4GlEQXwUd+/Fy15ueIQG8pNosyX29RQvDm3wnchyIB1ByyKFNXnL2
BpZQHm7E7w4mcv1hMGGg/Ay8NCYrtg==
=EbrE
-----END PGP SIGNATURE-----

--m9R3FbLwzhyismd4--
