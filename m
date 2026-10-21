Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590316;
	b=Z7sbFj+/6foAJobUlKM+wmnHbSW2IyB+ZVkdAiKXKjTPJ/nv9hj2huCU2KNqSIuKI+lo
	 nWuz0eepOxgn3BkaRuL9KLHzEDAQXXzubg8U5ZabiRPZ1hCqenC+pALnOxi2At78t8tKA
	 6szu5IyNtlbutVMNH3hZKOgabpLx/6ajZ0U8TPwtPUnZsETv0/upzTSrdl3b9MEbgIE24
	 p9iHVfI77cjYRwbdFU5nS7KszMKk5+irJGYRkQHZCXy1MRVEXAWHLX+Hi/uJxXu7ECkdh
	 OFN5CiXtxs4zuw5n8Pj564T1Eu3pL4bNm8sWCSac+UewM0g/HnKYGTKZZeqeh6Fd/pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590316;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=5pK3nSJ4wLpKfoQCQKqWUDREBlLUyktJJbQs5rz8ksE=;
	b=jBFvl2UtUh3ltgpMRD4ppFzaOc3OAdjjlPhwEa+h3nJF9ci4hjHCflc996jq5cqJnR8F
	 hJFrZ5AloiV2s8cz0DmHH181JIcXR2Aotxwa+F4hVgpTUxmClrvnyxSzNt2ly1Ug4TxIe
	 GPoinmffuNmQJY8ztJ32an74C7AvHQytBo9GnQVSYVZp1MlDJx3lNHNgW1mSRvOXJi05I
	 s19VJOgpEw78a2LE0HDVJ4A0Y8lGu/NUTg08N69NLnGhfDymQOzYKmODbuldm+c+OA35V
	 bOY3q9qXTkbc0rIxxFpIpptsm3o4qpoPXsl8xxAb9aHSkegGFj68dRtgyons+qcP7Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PaI9DRN/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD29606A31A;
	Wed, 21 Oct 2026 13:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PaI9DRN/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D891F000C5;
	Wed, 21 Oct 2026 13:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792590315;
	bh=5pK3nSJ4wLpKfoQCQKqWUDREBlLUyktJJbQs5rz8ksE=;
	h=Date:From:To:Cc:Subject;
	b=PaI9DRN/ig4skT8UNdqqxdYirbU2mI+PrsWHx7KkE1eBVLs8tiM1R0syaMfnV2Wpy
	 Mn4+iu/xFKhvpsaBZcY7m7UnR51KIgvNDbGxtsPK/zWkKDoziQyLfCN08pvNUmcvux
	 +6/XUHGrVGxrx+1P3HD+v1/7PZC7EUBsZsUy0k3BoCDItHAF00MZr11YFJZV5Zd3RL
	 NSgLRJ2JK9T4EXfSv4Hvyjj23Gz+t40PAR19GGziPKi1Vd+uBSpO8cyJKl1IUuAMri
	 oNp0g2WdVIQkczGQn5ZfqvV3CtbmGwFXV7d0E6ZVTL4CYymnyuf2Tx5/v6fFSap2O8
	 xZ+Z4Xu2W0Bsw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4A41D1AC5996; Wed, 21 Oct 2026 14:45:11 +0100 (BST)
Date: Wed, 21 Oct 2026 14:45:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 21
Message-ID: <atjB56qH6sl4yo3w@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="uFq43R0oQpOopVds"
Content-Disposition: inline


--uFq43R0oQpOopVds
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261020:

The kbuild-current tree acquired a conflict with the origin tree.

The bluetooth-fixes tree acquired a conflict with the net tree.

The rust tree acquired a conflict with the kbuild-fixes tree.

The mm tree acquired a conflict with the origin tree.

The gpio-brgl tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 16460


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

--uFq43R0oQpOopVds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatjB2QAKCRAv73Ows9A4
icomAP9IUMq5lQ/83TsaNtekPtT14SMNAaWcRMtcQ46lTuon2wEAgW/DueS4ZRCn
BbUemcnO0RUCIhxkPA+vUaBIG8FSLg0=
=5QZv
-----END PGP SIGNATURE-----

--uFq43R0oQpOopVds--
