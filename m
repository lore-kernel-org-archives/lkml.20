Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4418D463B9B;
	Wed,  7 Oct 2026 13:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380475; cv=none; b=hYbSr7EfZnb1rIhoek0vEvG8dLVR864r4+G40XVOooSOsVlaBWxkA+UwKAGGpCnpgWawXpM4bhJjBv4d1kJz6zB3fiyLX8sqBL8aNi624DSkcxN/4MqgUJ5btgBXW6ZzyxDv0g/Qpo67NZkW8tstEoVBE67LsnFuLwSHgLHgd4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380475; c=relaxed/simple;
	bh=BUqUh+TSjqi3lr2oKIjuD9C2QcL3LFYi8omr/A+Nxl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MhLQCPGh0UpQuR2xt9AueqUAlVcXdoO53h3PyfSLsoZZ+sEcA7b+mV7PJddBfEGJc/Gy8VdI9YbMIYLLQJglGCrVFYJTqnxCW98524iCgnH0xh+lgEad74v9RaPOcBdA2z/ckyu6L2j5inAh4g/6ImCYZ2Dtk6fLT4MIcS7P3tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVIVt0q2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVIVt0q2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C1E1F0089B;
	Wed,  7 Oct 2026 13:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791380468;
	bh=RyASYuhxjfFSOVQtcq+r7Q5AN7KWKeSTjUW76wvNNMY=;
	h=Date:From:To:Cc:Subject;
	b=EVIVt0q2zmLhH0FTWtDZFUumbSIvthv+YZ19SyBudavJBah9d63Ywq1P5MUbR0AGy
	 N44IPUpy6f+4NvMmBBZUD5GqXa8tBBF50R9jwnsGNSzL+qRs+/OlxEEmQuBaOuBUsR
	 wvusljKnIjABh23oOEjdnwOyTA0xpE7ByTX6S6UjIOnKWwHIPalNkIofub+Hy5unWO
	 Ojfr95u8So3PCgabo2pDXf+Tf3iAapXPLDiSKx8XhzDeFW/bIkdFj2djpr3PiXskpv
	 3LerwthmjhdGTvUHBYSzxs44NCytXmO2hRHexc9nGyd14lGBpcKZOh3Gt4rxgck8qC
	 k52+SThEs26Xg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0C6B51AC57CE; Wed, 07 Oct 2026 14:41:05 +0100 (BST)
Date: Wed, 7 Oct 2026 15:41:04 +0200
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 7
Message-ID: <asZL8ElkW3Dx1ZgF@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3VnL4GkRJIpDPpJg"
Content-Disposition: inline


--3VnL4GkRJIpDPpJg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Note that I will be travelling to LPC from 2nd-9th October, as a
result -next releases will be at best spotty during that time.

Changes since 20261006:

The net-next tree acquired a conflict with the net tree.

Non-merge commits (relative to Linus' tree): 13708
 13813 files changed, 896719 insertions(+), 335384 deletions(-)

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

I am currently merging 433 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--3VnL4GkRJIpDPpJg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasZL8AAKCRAv73Ows9A4
ia7HAP9zUx8yYQSbDd1HKC5Y+NzNbmQhr5SJLd+6Rj+SxpfCFgEAvuOB4S1TXQeQ
CdgSX31OWTiC2YYy0BzyP/i58BGAgQI=
=igtL
-----END PGP SIGNATURE-----

--3VnL4GkRJIpDPpJg--
