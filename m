Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8754C53FD30;
	Wed, 14 Oct 2026 15:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990112; cv=none; b=JP7Rt8cZXJGIZSSeiMEc7B1Eh0MlDk+LGNtUgEgoK1c1qw+nIrARSItbp602jxb9msL+mRTkc6Dpbdp5+W9zwHK8a+zd6cT7NxdJZQXy6ebb4+FCfyQwjcgbyzx9Zzm7UZifjIcUyT74/E/+BKTcpeVrMK+7fexoafIhGZiNtQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990112; c=relaxed/simple;
	bh=DGcQ8TSNbDxsT5XPplkLQ7qMe0fL5Q3cQNunKMU/rQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W99y4fBza011UvjnSK0lUBVX9fv7GHURe9si29OyLwwwMwMdliwgu4RumVSwBXxheVU26RF398yk1t9QpXJsYRxWoDuvxD0codK6aEaR41KVLrVFPp18qqWAAMP0PLD/D3n2BYwxT7kkZtluYQbMOxbnPJJSwy8BpSuc09TwhDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/alCz1g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/alCz1g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB941F000C4;
	Wed, 14 Oct 2026 15:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791990109;
	bh=CUCtsaQQBP11rKBSPMT7ujX/Th7EN1rIbVjnNuSrMdc=;
	h=Date:From:To:Cc:Subject;
	b=a/alCz1gLZDKI4HWuC4jZ4IphLxllVICM4H+ceUnt7vD9f6n/O4UZWD1kuYLg1vrK
	 9MePhvJRc0ppxtQQ01LT8WDooZ7hlOsy3ElPqreJ6olZ5qLGYnjWED3NG1VIMgVzfq
	 8s0c+K22tSTGr5xJZc8l+jnP5jnuffjGjoOFCB6LA7SdfucLN0amnG4AyGaNetPFBA
	 DhKlx8M9LFwe1RjAL4LmkWY1fws86uMsD4u6GfahB6JAMJbhue3q81psU7M/Qef+9A
	 biHL5nJsIZ7dgte2W2Dh87kklFUjusdhJCHNdzZSnSTg/tdRYDn3kIU6Gqz2yH2AjH
	 xavuEa5/hKa7A==
Date: Wed, 14 Oct 2026 16:01:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 14
Message-ID: <as-ZWriemHfo2ymq@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="siZ9KvO5tx+ITJXN"
Content-Disposition: inline


--siZ9KvO5tx+ITJXN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261013:

The s390 tree acquired a conflict with the mm-nonmm-stable tree.

The modules tree acquired a conflict with the drm tree.

The block tree lost it's build failure.

The thunderbolt tree acquired a conflict with the modules tree.

Non-merge commits (relative to Linus' tree): 15567


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

--siZ9KvO5tx+ITJXN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrPmVkACgkQJNaLcl1U
h9Aq2wf9GSfp+ZaC2GJwEePwWjdqtsZYxj4whHBDAZM5sSWbvVctyDu/MCF8PtPZ
0McsymcOHnNPo8lLGEZGlgspJCu7Us6gUOf8UZ3Xfe+2qix+oPD0iJG7/XC2oOO7
BQ/ssk/vI8T5qdPEiEYNT3Z2zwI/emSwg3Ursfx0YQ5h+zz2xcBHKWiOF4g8WGdb
MIAgNaoGeE32/SwD11mCbAOlOnR0iH1n2+WploNNp2GoNMPEaJ1oNhB5tH4rJwM4
6qmo1Z+AQXQw/2i44F7bvVrdHIb4cvVx1Y+kTMhBWxBeaZEcLSnB5QeA4o+5PDjo
/Dr3MBiZWwpezFEkPkH0T3enVxlcGQ==
=tgnm
-----END PGP SIGNATURE-----

--siZ9KvO5tx+ITJXN--
