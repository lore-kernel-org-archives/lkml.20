Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792671758;
	b=ufxXfaLopeVkMLFSlDEyvZt3CzPQgZOPEbH1a90a5PeRi8JNE9p1oD9mJG5PYKm3tsyj
	 0ovKTNQOvB2Br+pBvBiQ2xUzSU8N23JAtG6mJfb34pM6H7Hwdo8mcext46Pf0lEwUdyUT
	 cjPVVxSyHTnIQYdJvVAqRJ0SRPPoWStleLedBtqZ9AoJ9TXo7KCN8Tkbw9wSyYDpfU43g
	 XMlm46Dg3x1HekqbES3QwtIv9gy0jA9FMjLj3b3egL8ccPjGgFgM7Z08CAuRujjSAkhAB
	 ThhIAEtOcpdusd935ogruun1WJh5puSiw1PN/LEu5D0exH5q2t9ZM6JIGtOPw3dCUEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792671758;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=r4bapHc0d8zMkW91rbIKb96mc8vXGPvaOjCeerXZYmA=;
	b=3LQz1Jr29PeIYAbFwvoGTVDNLXxrWCP8Ssbg2ExBu+y/eKfSJAmzWjSNbdtJ6/kX6hxH
	 5s5c3dEQFNyp8XpQfzWZMZ4W36SVGeqIbF01NsMmvhn3dX2lLUzY2/KQeECJVyTYKItmJ
	 fuMFqOx+43FbK3bMzQkRoDNHgxfCxiJWOCLvZcKQ6GG4nwxS8sXuv353C8VEzldyvsw1S
	 oZVGswbpPyPHUSVf7iMLOsqNrAt2n21PfMW2oAcw1FBYzTSD2EdlxF1ji1DT5nNjkT6O2
	 Z+Xb4NMYbC+DLU0zkcmhDtlaPkGW735TMhdecGj7UJwdzLMu/64GtRPhFCmty1ekIqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxZvBxVT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8216D606A319;
	Thu, 22 Oct 2026 12:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxZvBxVT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6A81F000C1;
	Thu, 22 Oct 2026 12:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792671758;
	bh=r4bapHc0d8zMkW91rbIKb96mc8vXGPvaOjCeerXZYmA=;
	h=Date:From:To:Cc:Subject;
	b=SxZvBxVTpo3Vz0rSFUZMljTqwJMa6tOcKLSDPkeUwj1LaTsoMnmDz4sySxqzw3LE0
	 2PIVrCIZkwlbpZCyvyJcdIyetUamvRnbQJW7DYerAjQbm/ZRau/LVbqRxC4HYDounM
	 0QAw+khls0GTGjqTmALrYcDKLDZHF17yxABIDFxGB3n2YCv4SUt+dpNIFRINvNUshb
	 f6BKo5MKRbfBzpXOVTFJhILOWOGIvxp1QVMsMy2X+RtRaoCn/hydPQooMjZ5Xrpztt
	 gj2yHOTfUQM0QAMyijGUHn0rcJYRk9dL8CmEh/2OENG4NB2/oTBenRHeLYkmL96Pel
	 iSbEReYfWiHNQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E73861AC5994; Thu, 22 Oct 2026 13:22:35 +0100 (BST)
Date: Thu, 22 Oct 2026 13:22:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 22
Message-ID: <atoAC5Fty6TZWQ4X@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="xAeAmEag2OPFihPa"
Content-Disposition: inline


--xAeAmEag2OPFihPa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261020:

The kvm-riscv tree acquired a conflict with the kvm tree.

Non-merge commits (relative to Linus' tree): 15945


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

I am currently merging 434 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--xAeAmEag2OPFihPa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatoACwAKCRAv73Ows9A4
ibZ4AQCrOFtVoxLw2QgRps2K14514JNInDikP/7EHsvrukmnRAEAxECTfcQ2b8NH
HDcqvV8/kcT7i0Eprco8QMZ29AfLFAc=
=SZmb
-----END PGP SIGNATURE-----

--xAeAmEag2OPFihPa--
