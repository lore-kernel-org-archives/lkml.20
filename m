Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FED248125C;
	Fri, 11 Sep 2026 13:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132865; cv=none; b=Z8ZUvhbNCVunsZrrBmcCjA2mX8CFpOICkt8/QjRHBvuM96NbEB7MeP2mRVCk3IgsGs2ZeQ6Xe/HsV2XdvFqQeRE7/I8WEEklmtyzP6qCki3fvQqcuysnh5T7BRLevwL5XLg1Yo9of2lzflDsCh9/aw42StigG0QyBq8EcKcFrLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132865; c=relaxed/simple;
	bh=iUI7KyToskJADMgAFiBP2NBVeEzcmJst2iExDiQkLKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dw3UhFaXlV5UkoivDV43roIu8BdbrNmdACPv+sF/GS1a63JKb6mXpDibq1+2uO7dJ3+7hKYqa2CyOIq6IglyujhQ3LSpev5HJJKSbX64SSGZpQ1xUzw7JufUAiCEZRn3Xs1fCj2pwhjz3EGzt1BOVu/0REcO1ukk42nCTIQTot4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zkr0DSqP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zkr0DSqP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108971F00898;
	Fri, 11 Sep 2026 13:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789132863;
	bh=hqy1+d9rRvLQHBuVpUCeDFGO0tz0LEOkI7PTfZe5m0U=;
	h=Date:From:To:Cc:Subject;
	b=Zkr0DSqPg8cLHpTwaLDeXcvGP9E4KTzvmcu0BKxmLZaCvyO0Bb/K3PC3pJyTcLYuU
	 JRRHRSmRMgoZp1CF/NYha6YWNq7jKOnlyhg0b2nBZv1nIP6Zm2D18OCifprY4FIiEg
	 1o/lKfZi1Gf2RY/t0hvWLjo/bXYliLeGGXsIhU0MEx+kPL2cd2/cweWg7gLJiKOr3w
	 3/vV6XdyYdF5wHeHIHY14XFFDAgmwC7FgcuXtuoFAeqe7mDqDl4sAgLqdpf2PvzvCd
	 wnl6vYB8PHreBxZDYafWgDs/I9eQxRwf9D1pyM3ZVQGQrN+DY46pgbwzvSc7EiH2WL
	 yY1mSz/Akvtjg==
Date: Fri, 11 Sep 2026 14:21:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 10
Message-ID: <aqQAPHoYTH-TjpcO@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3p5u1W2h/uAupvNi"
Content-Disposition: inline


--3p5u1W2h/uAupvNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260909:

The i2c-rust tree acquired a conflict with the origin tree.

The bluetooth tree acquired a conflict with the net tree.

Non-merge commits (relative to Linus' tree): 5134
 5245 files changed, 284012 insertions(+), 72514 deletions(-)

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

--3p5u1W2h/uAupvNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqkADsACgkQJNaLcl1U
h9CUtQf/VDRuLYaUcA43SL8dZTc4blN79eH4MxvzXlPSYranKVKf02S6+vjpSgb0
RBSt/nODyJnGO6/XMJNzmCobP4gZlwTYpwJvEBKtTAeWLA4t+D1s9MmJJZpNS8DQ
fUsWWSt4QumgwyqAhQbWaqi9CX4ljql40/YkaZXKzWKNAY59RxCN7LkIu80FMi4I
52bbo5E5zecIEWEWaQ+6z72ltrsaT5CdcosAnNO3Ljlh+I+CiRhkWevoIFYT9KLF
GW5VzA97wpnfgRInnV/AtaBoa9ee10eD+xOqo6TpRClWMuxNRgYQFzDhm7Fp/ppP
tw4NB3U0GLlPXUBZQxqDkRcy1K/ahg==
=QmE8
-----END PGP SIGNATURE-----

--3p5u1W2h/uAupvNi--
