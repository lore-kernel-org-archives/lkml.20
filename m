Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639607;
	b=RqRsmLpDJylq6dYqSVfF4DLHs30x7lvH98LKTj4R7CuR6cIzlQalyag/WBc7ip/W4W5x
	 qffMFmXSJUuBPyaH88HY/eliWEnYtC5vS8Sn8lLkzm5Hj3MA5U9ODwY3PveFl1Aa4utPx
	 IAJUYtXu48UU4+9zfv3A203k4+BRxyNvG1v23btFWqiW0Z3P/W8f4/m6NU2ODbiAERWl6
	 /W92W2HJZHpZsK1MTluPhYsazhoW3rsB0B2zRKVfYYy6SHRJbq5SNaXSj+X8QPjiScRAR
	 /U2S1JoK71TTRCQxPld4Pw9NmOGAqBWApMiX4WeyPj6Nit0Wj+fYUX9HDDNKmKzkwSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639607;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=KJT9fyG/SzvgQ470QBdEmeTGHLcloiA8ra5GuK/54FY=;
	b=L7HSiU7EVUq0KjqP+k/edqWt6V4BT8VxifLEftw7FK9yxWFABlIG8nvtJmzh3eiZMJ32
	 hqwJzU3OEvbpfcuUB+Ps7ooa02Qu8GRFCeneAWb6ko2ep3ZKA5TAGyXBGHCL6tPUz47R8
	 rXPHhUXA8NATl5sxIYkCIXySDHuwZdl1hYdQsZECe6HKHNQ0OOfouxN7sbaKuapQfQ97S
	 /ob9V2uUBfCyXxymB4v5unoGaQ8Pg53nPmCQ81b+QhNcIyJCCoijZc+tYjfZIMnjbvyig
	 CiF75d67Rr2Q/7lHb/xGYUZCZsn8euw8g5vM6z7WX1ww1xFVvQbMSKxtGXoMsT8rnWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PbN/5aQ4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19032606A91E;
	Mon,  2 Nov 2026 17:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PbN/5aQ4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8401F00A17;
	Mon,  2 Nov 2026 17:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793639606;
	bh=KJT9fyG/SzvgQ470QBdEmeTGHLcloiA8ra5GuK/54FY=;
	h=Date:From:To:Cc:Subject;
	b=PbN/5aQ4qkOtHnnnb1vajyfoWXmsSSPYK9Sc0hjCdo7gmUc3Xxcr4tRQKIaeONapI
	 mGROUq8Bt7B710XUY9h3AIl7JHTbDzdOCy6S/IKQTUA3WHhfs+F8kM0Pvm2jR/HIyh
	 0aSRd5/ZykhhkJwIG2TgP0nuh/hZEGkuPbLQ/7jAD7dFzebONZ0bjrx5o5vyjNdnuc
	 n5RMTLv/42E1rC1Yy3tKyYRoI8zJa4R7xovcYn5zq7llGh8qMGbIVI6wFrj++tq7If
	 cJ6raylSlHUY0Dns1KbUapwPvWB/Ba7SB9zq/YBGm25hx5pEiYWq5+tcga395g7G/n
	 U+s3Ts8UDkj/w==
Date: Mon, 2 Nov 2026 17:13:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 2
Message-ID: <aujEs6JVOY-8LIbv@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="DI3hDjmhmF84cWpP"
Content-Disposition: inline


--DI3hDjmhmF84cWpP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261030:

The staging tree acquired a conflict with the mm-fixes tree.

The drm-intel tree acquired multiple conflicts with the drm-intel-fixes tree.

The turbostat tree acquired a conflict with the origin tree, I did not
merge the tree due to the extensive conflicts.

Non-merge commits (relative to Linus' tree): 1906


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

I am currently merging 435 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--DI3hDjmhmF84cWpP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmroxLIACgkQJNaLcl1U
h9AQ5gf/d7KMBbGzYD3iViK6rEcH+c+TqQyo1LKPhJ6cLjGoMqPDiHmr9o8a2k30
0eSIetjDyymPo4ecr/cjp1ehMSz10Nc3vvDep2wNQStIxQeq6p6ova1a8Hw+El1C
BEbUv+35z5V3PvL9626TEKUpRLu7r8entLbXqYND9z0NPGQSzWD2CXfBGpsdAH2I
8HovecN13YErxbiWXNa+bqJNCmvQV+UEfELT+ciA+6H+QEE7yE8ft3Txp4flzrCe
YUtLvCOiwprHwMS3Fuo69JeobWljaDYAxP34KEV0QqI2tZPTbtfjSiaxGUkr+CHc
nQtNSFDkYBxzuCUf1fZEeqTYs3e9FQ==
=3Hcd
-----END PGP SIGNATURE-----

--DI3hDjmhmF84cWpP--
