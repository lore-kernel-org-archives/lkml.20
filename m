Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435145;
	b=aJK5XhIyWhYgfi7eJBol6p8ZducluINu6Omxbke750n2U5wIp41T/dxKwWfMJZQxmar9
	 AABLJtMF9BEkWdFBlH70E3Yfc7m6d8ZtNzU/zKetFbfrZLSv1y3WLY5DrnPgDjlm0N/O7
	 2D2ZF5Ao/tDpIxSjIa35KDYdr7XSSZjmI47+XnikhQYPE8w2CdJ6Qj7HeIw4xS6uMhX5D
	 29hdyDXgwRLJQcLYWd+EEUiAE4Wa3x9tunmhg3MgPAqOPcas5JVxnvGGSXMcYUqP9Ps2c
	 wOUDjnR8z6Fw2u/XsqhzmLiJYwW5dJ41rL4g5CSfKFvS0tnjyh0nKNRpsxhSjhDOQ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435145;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Lz1d74LbmqlytTFMOsdWOIGjYLWrudeYA5nKRa4iYXs=;
	b=ma3H6BZjfCQVGu28NvenWH1mg15mfeSMxMPQlG7lsTMoRNppKHtOGp3OScXWrc4wYDeg
	 2ULTiV9kv1cKxbA7V2SA2R+RUC0n0LegJaWHJqJMgKUBHlu2vLtUta9mcp0SADeSaSk4B
	 7mktDnuMx0WJkA7Nx1DRhyCbOmywewp7rYD4cxazJ/lStXv1Vl0yGVvbMkVjCtyb2L0BI
	 uhrnQRdcFnDz0/9GdVMaqGezJArAfjXKsuoYl8bJePH321dmK7fC5uViGiEKvxq7lQ3c1
	 dQmZZ0nMJke5Jzpe/uYFfbq7e4nuu5R31O0EKmYXTwdDB1G8mtzPv4Fpy1MG5VCvzdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqAy+dKb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5138606A331;
	Mon, 19 Oct 2026 18:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqAy+dKb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98AC01F000C4;
	Mon, 19 Oct 2026 18:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792435144;
	bh=Lz1d74LbmqlytTFMOsdWOIGjYLWrudeYA5nKRa4iYXs=;
	h=Date:From:To:Cc:Subject;
	b=MqAy+dKb5GTeOIldfOAz8xbCfDA1xm2oVwFzOWckUisCYwL0ZLK0+JJKe9ztCOLFR
	 S6yrKQnnil4c0ZmFHofTMF82wVlyzLuoWD3KZQzjc+pi/mX+w51tt8hQKgHFTp0Vz6
	 gRVBqEvAXNf8aWfkjD+OKYzyRXjcYB5WGzHviZHp7qvmv3EOB6VqajzdOtIshpq37q
	 XysGUytRXUOumlsKK4si8Lt3tlDW3B0RtY4vUkFhdQlEUMhvb4B1T3g32H9qckFLA5
	 hXPOBZLMfBsAs5K06dcJO9R5xyVWiNqcWYFs/mpeOmb4nQE8ZW2PAaAm56D+UTCVTp
	 8n2igf8k92suw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 149F21AC57D0; Mon, 19 Oct 2026 19:38:44 +0100 (BST)
Date: Mon, 19 Oct 2026 19:38:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 19
Message-ID: <atZjtBkk6vf08rkV@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="ZZNluy6jAGL1/fUH"
Content-Disposition: inline


--ZZNluy6jAGL1/fUH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261016:

The gpio-intel-fixes tree acquired a conflict with the gpio-brgl-fixes tree.

The hid tree lost it's build failure.

The bpf-next tree acquired a conflict with the vfs-brauner tree.

The drm tree acquired a conflict with the drm-misc-fixes tree.

The regmap tree acquired a conflict with the regmap-fixes tree.

The firewire tree acquired a conflict with the origin tree.

The spi tree acquired a conflict with the origin tree.

The kvm-arm tree acquired a conflict with the kvm tree.

The kvm-arm tree acquired a conflict with the kvm-arm-fixes tree.

The sched-ext tree acquired multiple conflicts with the origin tree.

The landlock tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 16246


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

--ZZNluy6jAGL1/fUH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatZjogAKCRAv73Ows9A4
iRN9AQCX112NswCFh4cxvsQpwIwk1/qV/SF0fWzyolgw97rQLQD+LLodWloIe3In
mHTzJqgy99xPBacgl3wqtv6GPMRjfg0=
=RS5C
-----END PGP SIGNATURE-----

--ZZNluy6jAGL1/fUH--
