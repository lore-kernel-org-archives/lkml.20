Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF60483BF4;
	Wed,  2 Sep 2026 12:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352125; cv=none; b=lMe676ngC32aO7RD+sEkW2sVCRf228waYJANJtDoxTvOTLiZyF9jek1Wgu/M/LYjkHd2SAHB3Pg0nuZqaBSXFze6Lo0R3REjKIPztWJkRPBSp+7GeF9uB0SkG6axL9rvy8cII2TYEOUW6oZROQU4EIxCs2+NwDLmCn6F+paJsek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352125; c=relaxed/simple;
	bh=N7m+wWf0Q9Y2kqGKdmWCKlZlP+MbTCjlTRwZjbRz5Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B+iU4ZyYyUcwRgwBLeq5fpz8t7jxSLREqeMTAQVwatcICnBelRjStw5j72iC1IjbOhKR9rCkrdGRiBZdAAH9wPT0TrZ3S/hIR029x4xOUtDG6ADqvripnI5c18El9ldC2OIcu0uLSEdXYJqqQGf1Uuj71c50sf7RmBKjooQy62Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdFFO7Q3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdFFO7Q3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD7D1F000E9;
	Wed,  2 Sep 2026 12:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788352124;
	bh=utQjPpj8FM1uqJwF14GGRswgo6ul2luFDaEAxY2Jm30=;
	h=Date:From:To:Cc:Subject;
	b=fdFFO7Q3moqXjNM6f+V8g9F9sd6LTnUbvU281/S5yR0i2Qfuah6N1HGs2cHGE8GIW
	 zNMleD9AvmvgGoSshI1NPL6nf8fLTGqnHzHfeIO0tt6Ij+lcASVRpYRHtQcYLzu8gK
	 93+QAbsuRkeKxC/R7TTYr2NTT/6Q+S5QWWkW/ThG48Coko412DQT9BztvrRedJ9RMa
	 gavJYjFizIJwjMumiv3EoVkCIs8SBF6Yu3ImJctDGxwXBXPJmphDOLUEW6bB8UKxJy
	 V3Cnx79kHL1IuVrQFHIIJbpLaFgTnDDiEKjWcx3oiwrQi1VF+tXhgOaBcPVRuh6zur
	 T2wXOggMF2WRQ==
Date: Wed, 2 Sep 2026 13:28:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 2
Message-ID: <apgWeHvdb5Ta9IE4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1XoHWedcBw+qpSk0"
Content-Disposition: inline


--1XoHWedcBw+qpSk0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260901:

The mm-nonmm-unstable tree acquired a conflict with the mm tree.

The mm-nonmm-unstable tree acquired a conflict with the mm,mm-fixes tree.

The iio tree acquired a conflict with the iio-fixes tree.

The gpio-brgl tree acquired a build failure, I used the version from
next-20260901 instead.

Non-merge commits (relative to Linus' tree): 2510
 2745 files changed, 167264 insertions(+), 27011 deletions(-)

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

I am currently merging 426 trees (counting Linus' and 132 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--1XoHWedcBw+qpSk0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqYFncACgkQJNaLcl1U
h9B9ugf+OSYljyxbsu6jnh0/ELnIxY1VFZnTtBKH9cIZDUpW3GeK3Zf6/xHNRS/Q
hmDCosY0dXYsnWEny3R9zAVvSqmnMxmTc+BTaX03pMcrCSkYwIqR1ihARn2UWfZa
k9oPdG7kUKWojbJtTq/VTJosh5t9X62Uq5VcvfFbJ5RefmzrU83ImVByVbdsq66c
gyRgFAQG3klYAQ0/H45lFoO77uBvswLKmh+jbCjONV2ZIE0SPhoSKHHmPxD8YLNQ
9XCskMAXsPaiZaeSJ0mtfUnJpJ84oKklXC0gPEiEWSEj06ildUov8ahpe3lSeD61
Dyc75he+sw9lv6WnKGcOqG6lZRGSoA==
=FG4Q
-----END PGP SIGNATURE-----

--1XoHWedcBw+qpSk0--
