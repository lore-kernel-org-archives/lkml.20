Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198595;
	b=yb4cDgg1Fw7Yv8IYrlVqlFqrS1eTkiFlJjDdZvz+2bw/vbDd5sfQEgA8N80rtJSb0JH+
	 xUjFFI7CAPhdiHnm5ppexPsYJpgCySWV/PWG47D7VQXfprAPw//n+3uITsXso4SE8yRwg
	 vtQ6aqgd8n0HdJaELD8KtOa7XbzlW/ty+jjJf5CkbqhPGSVsroPNJ/mSAjzofqF5WKZ1g
	 c7qMOiNHViKxOFYOsdB3DXp/nMKgrFtOIHk8KaR4ckmEgPOUp2ypYY8kbXbWhaF2RpkQN
	 hayHwORLRnJj9qJXrBptiC7f5U1YQ7pdSsckO3DYlHogm8OZtqQU4H4Uh90Cspb08EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198595;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Iew3CyqRE2BB2lmlDEMJ24EaaybNUYl1ymLtS7Q4+P4=;
	b=nYG9WpXNGvnioa36R6rU7hm3vbiemyB/ztw1gKlOYvpWM5F1SVo9ztVUrDw7omm6BFUK
	 12P1a5rqt8TCzcT7I3q/9GSSkQ/igxguosMxWw3Xx+mkGeEaV6C+Gjv46dBe87B7x9jxg
	 FaOCVQPQxwuZVXeTaOuB3vGq7NVNyhVPQT0dOPwEBIOdZ+oP42+yp0LtjCrYPmUwrdpup
	 YpQRebr6QXeek2drlwrM1h8Mzg5dY0+rhJ8d6Q7+H1vNTt2qm9i9r0rqQjTCIyl1UqLae
	 3pDZoHzrA2FL5glho7vToEBdosaOzEccMLV4qoGl6cc9rk2xUvlK0ntqchID0/WZk9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oP9sRGHx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FC3606A31A;
	Wed, 28 Oct 2026 14:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oP9sRGHx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA1E1F01825;
	Wed, 28 Oct 2026 14:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198594;
	bh=Iew3CyqRE2BB2lmlDEMJ24EaaybNUYl1ymLtS7Q4+P4=;
	h=Date:From:To:Cc:Subject;
	b=oP9sRGHxLfkNLKO+4xtJ1HwpDR7R3YpaOHJysiTONwsv2WrX3qGrY2bYIGFzicrMP
	 AjwPiGNfGfBySLATVqQrkB2ipfUsLvQvWJdZ1hPG9aLPR8ih/avpQ9x7cv/WZzWVdR
	 4aayy3RpiSX+Qc7lwJQhP+JbvSayhp7A/LXWnacLLRYRlkAdGClKAAJ2nnjeNhqxGh
	 RoHPNCiavS33YWbw/md+rusIhkW7SFUG7tELS8qN978Dc+TE4OWDY2jKDUN6CZ2sge
	 Xc5RNO6fAfV/7DfdaznqUCQvCIixTCNhgGLcnW4kjIUqa0C3m18nmMfFXloS7diSx1
	 P9ifOLdRe6Uuw==
Date: Wed, 28 Oct 2026 14:43:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 28
Message-ID: <auIJ_zR_Ojt8avG7@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="70GZv1w6EOM4G7nH"
Content-Disposition: inline


--70GZv1w6EOM4G7nH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261027:

The ceph tree acquired a conflict with the origin tree.

The amdgpu tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 3219


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

--70GZv1w6EOM4G7nH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmriCf8ACgkQJNaLcl1U
h9ClzQf/aCzroPZ9lLrXc1dCAv4qBWCoMSXIUYtwg84R1GqOtlzFJY/p8XKVe1Ez
ofJ9/O/Rxvm8KiqAOIm/z581jwNz+bz17u4Glz3TQ3Xrq/g+jGeB4FiPMvidqErB
xWX/SwGBe6YDlIUIUP0Wg0io9faJgIYYf3UpkPnjCYnhDejqsaJjgMbCHvnGka/B
bvZCndT8xoN1Ch0I8Sd6buO1T1FCG4QsAi7F2EuStmaqtKxseYR2/mA2vVby5Z71
Ml8u2lI1pwqVRiU9zFuZTebrCkGgC3fQky4A5fKy0OtFY4CrQzMFt5bsBS7MD20A
U2senFgQv7NO4x0cTSq3zneUAMV2qg==
=20ck
-----END PGP SIGNATURE-----

--70GZv1w6EOM4G7nH--
