Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236593;
	b=BsmCbP/cNmKQQsCXPiTkocbwFCwuvkOBiAQ6fo4Dg/7EuHPPLIsb4drhrBkbBCcsATR0
	 YsCenTdOETsKXXDm3rbQXlSWVJbDCsDi/g8Hqqwz1sNBFZfyN5KxPw2Y4nx25b+elDdJq
	 xXpz3ua68bwm7wexJee5SRS1p1ZQkF06b6asSKfldSr6nCeQwoz3/6q3gQUXBI9dxYx4r
	 JbNdn4UX9vKKA74Vm1COQpd07dJ5iw/EPdT9vmloaCwc1rtZjxADQk7x3MIsR0YHiiI0c
	 VR0AdqAk9bkq0QlVfxei2gJ2WI0og3njoYlkvLVs/3V4ieo0dTyK0W/ICHyBxpF3zzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236593;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=mwQ0ee1q+iZvh5Rntjd/1G1YDVWrfgAZilzpFpehAlA=;
	b=Q1iJLdzx79GAdDQdzBbhTbYzPMlHD+Gfg2Yz7T2OJYxuAAaMGvAlg4/JudgoiqKZJBXg
	 4coqr4Myz/JXl4Yv4eTThR7HN5VuM9Tuuqmed+oKYXdr/gzEwS1fn0f3OTbdwvi+ah3+1
	 TeMfqzQ9meK66MWBdw6cap98QMArF48hi65p5xELi8sLnlIivdSq4yv2rNhwbR256hPwG
	 kewjr/SNFsKqtDDO/z7FaGrxu1XfjBE3LnXY8NP7AYTqqJ19J1dWtN4s3Z9PdoBRYoaRu
	 sQFTOcmKopefLX5McPJUaRyKFum51tdvDAeW5q0fMWsanyV1oLgNvsTjAV9ehDkNIcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ptrh3ycL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4EB606A323;
	Mon,  9 Nov 2026 15:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ptrh3ycL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CBA1F0089F;
	Mon,  9 Nov 2026 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794236592;
	bh=mwQ0ee1q+iZvh5Rntjd/1G1YDVWrfgAZilzpFpehAlA=;
	h=Date:From:To:Cc:Subject;
	b=Ptrh3ycLIX5GRa3KgZRDC8HC9R94uhaPpqK4Sytnl7tNEXcmrU5h13mzSEPl+qx3v
	 JAcu1N4h1fQlEyoyg/A8Iptig4/tsD23LQijOMo+/Pa583cGEOBdgxiQP08spnHfTX
	 bgR/VutWspsscjlX5rsfIzXwuyXWxDtLjDKg6eVxUOS3Kz8aOaT+2B72U5Qwfj81Qh
	 LlDQLd+oqPN7CNMA+9XDIfDDyPZ9vIM6gUkUjnTcKqGrK5Rzzdf3IvOxrHpZiEr78d
	 fB3ZZBTXUhuHN8y3GspMCl6qZLkV/5r/JxusAutzq9ZPEVTUGDsNepmW/m6kq4Fksm
	 SGz1rNLc96Nbg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4B4F71AC5995; Mon, 09 Nov 2026 15:03:10 +0000 (GMT)
Date: Mon, 9 Nov 2026 15:03:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 9
Message-ID: <avHgrm2PmkCsLyDT@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="8p4fD4KnLa1vMHJc"
Content-Disposition: inline


--8p4fD4KnLa1vMHJc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261105:

The exfat tree acquired a conflict with the origin tree.

The drivers-memory-fixes tree acquired a conflict with the origin tree.

The imx-mxs tree acquired a conflict with the origin tree.

The sound-asoc tree acquired multiple conflicts with the origin tree.

The mfd tree acquired multiple conflicts with the origin tree.

The spi tree acquired a conflict with the origin tree.

The gpio-brgl tree acquired multiple conflicts with the origin tree.

Non-merge commits (relative to Linus' tree): 2367


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

--8p4fD4KnLa1vMHJc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavHgpQAKCRAv73Ows9A4
iVKeAQD+BWls6MBA4fKhuC6HSnpKCPKSsIFNa7ToTiDkg/n4WgD/YYDsFzOFqpEW
3P6lBR9hfD/P4uNd9AqLm+SDvSBTYA8=
=zyRV
-----END PGP SIGNATURE-----

--8p4fD4KnLa1vMHJc--
