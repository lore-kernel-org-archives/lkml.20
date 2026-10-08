Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35FB411F99;
	Thu,  8 Oct 2026 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454383; cv=none; b=SdXQvawaNazeIk1WHEOHEv2xVo+53y/1TIoEW0qpv+hYqDOUCc+KlB6Lhcl/Bmle6ln0WiB1GRpdlDPiHV53XNPBzCdvGnUzL/9tS8VDQOwsHpip+6ycJiMWvuqLxNs8ZvpOHuD8ko+PMMGzaFgK8sYmcBLVFi9bawDOThiN22g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454383; c=relaxed/simple;
	bh=3YnzHtO6b1nA+hdTHgzVWT2vx+MV05XgGTtVoD7deDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p09muvNTloNv0b7EfJXylZPavcMn3MPKvrdQNv9Pv/8vLnC1QGJnEWMiY1VF/hvspC3UgwZPDIK1MVcgDRilQdB1gldW02twuOwwtOFjmeXurfSPaR8U2dwxlliNPXpamJWUZjobWj2I/HrvalCApZy5eudkQ7aVftOJFr11Tvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lT8Ov10T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lT8Ov10T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD071F000FF;
	Thu,  8 Oct 2026 10:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791454382;
	bh=045J9IZtwqwqLGfqucaHt/UM0jwaXG/xxf6LriyVbCE=;
	h=Date:From:To:Cc:Subject;
	b=lT8Ov10T0sa1Th07JAivBKoIFshRmQ9yi5f+gEDwxACNQ+JcfWrdO2inv7xGd4Nwx
	 ek1/eSwMrjY+jX95n9Iy1hMA/qXayPiUPV0fn1XEfFjIb3nPf/+mesfUAQe3esh4Ab
	 iXBbylWJ1KwxwS6ruvcs2p4twsMRoMWHPWj4NYUPJebSsJAp8DSMddO8vAFtXSQ196
	 +XCD9b+guetltTgG655MD1NQjB4+JzukO25RdPgK8EbaY9gcdSklm32qqVWBOcfbpI
	 wv+uGeiOoTQ31QMnyTPT+JNdU3gajkzJLnIUMwe5qalL2o4JH3f133HHwICTfVSWng
	 lHM/9uz0aBKmw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 35D371AC57CE; Thu, 08 Oct 2026 11:12:59 +0100 (BST)
Date: Thu, 8 Oct 2026 12:12:59 +0200
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 8
Message-ID: <asdsq9H167Jomy6w@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BOTDpqbGgZvpAy9o"
Content-Disposition: inline


--BOTDpqbGgZvpAy9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Note that I will be travelling to LPC from 2nd-9th October, as a
result -next releases will be at best spotty during that time.

Changes since 20261007:

The ksmbd tree acquired a conflict with the ksmbd tree.

The amdgpu tree acquired a conflict with the drm-misc tree.

The landlock tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 13973


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

--BOTDpqbGgZvpAy9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasdsnAAKCRAv73Ows9A4
iSz0AQD9SLHtcm1hOa1iS9ui4nIMxs/f7pcNi5wa8BWAvmU6ugD9GCNdjQ2wvTeC
ksr949S5Cg2xZzKC2J8O7AGmpHMXyAQ=
=ZdS7
-----END PGP SIGNATURE-----

--BOTDpqbGgZvpAy9o--
