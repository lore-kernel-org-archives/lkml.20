Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770394FB9AC;
	Fri, 18 Sep 2026 13:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739044; cv=none; b=PYkChg4/uhbjZU+m4Zzzuhim0DQz4CARuaZzWciLU+DdpSN1mJhLxT+Y+lIOYJq82sJh/PV0T9GmFg9vPscESETKGkoK4OQtWN1cP5Fqg753AucSYfNM3uwJcUm0Jtio3J0A0LHPNpwJ8CsmQYm2iKDkWHCwKBxTyZ+9WU8lU2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739044; c=relaxed/simple;
	bh=yGMtRd61rRS94U/00A/0H+Rce5rS/B5Qs5GeuBD+vmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JOWATluvT0AhmLFHS88TeYHSi4g67Nf6r1dyDkm459s7/zoy0FGUxuf2SLs1GHoAz/A1AHmkwqE3Pf7ASLo78WnWwYu7lR/zclfLS2EPyXxmsacKqpKqYd6WvgGWQhvJUIUzvJA1ShdOwpP5IU+BNQTP6DwZaYFKoqxU1Nef58k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nszbkpiK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nszbkpiK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5EA1F00899;
	Fri, 18 Sep 2026 13:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789739042;
	bh=jkAm1g0TDipHkkW/+0ajE5dEmwaCcQEDVisudq9c+fk=;
	h=Date:From:To:Cc:Subject;
	b=nszbkpiKW7Etg0/i6J2c8WZrrgkUs2dcwZ/t0cP6yPUwIuhw5rppgsNEQ5F9p4RX5
	 r7+NxI3b6tWnrbDeEDZXZt8vZT4gHK7gt1scz35aqmF92maYA1UACDxxF85utx2dF0
	 jy+sm1wQYsN1ii3SBHWtuWq6gZ7R/DOjnkZPKcEGZRIDIdbAN2VEC/fH2u5uuF05/p
	 8JogiAxOSMa2pWYwVQlVRMq8CHFDKr9WhK5twkX1dW7aAbsDpRFnYZ8xh2ZfPuzYJY
	 4aW38On6XOTzQu6+mrZoDXc8Jf0iMlwrXfuqSs78x0fvxSEZJy7yAbth5+QkwyQMDG
	 Q3lwaQed9Mn3Q==
Date: Fri, 18 Sep 2026 14:43:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 18
Message-ID: <aq1AH0YRkElOLKT_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gd3pXMNhe/mgyk4J"
Content-Disposition: inline


--Gd3pXMNhe/mgyk4J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260917:

The bpf-next tree acquired a conflict with the bpf tree.

The drm tree acquired a conflict with the drm-fixes tree.

The drm tree acquired multiple conflicts with the drm-misc-fixes tree.

The amdgpu tree acquired a conflict with the drm-fixes tree.

The amdgpu tree acquired a conflict with the drm-misc tree.

The amdgpu tree acquired a build failure, I used the version from
next-20260917 instead.

The drm-xe tree acquired a conflict with the drm-fixes tree.

The char-misc tree acquired a conflict with the char-misc.current tree.

Non-merge commits (relative to Linus' tree): 7328
 7818 files changed, 399202 insertions(+), 125673 deletions(-)

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

I am currently merging 428 trees (counting Linus' and 133 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--Gd3pXMNhe/mgyk4J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtQB4ACgkQJNaLcl1U
h9BXzgf+Ih7cJiqk7gXb/FDnsOWriTemYsMWqiHExPPrNDwOrhPohIn3DqyxO2Jr
24WI0jafX6MN2IZXSBJ251heVquZp+2AwiRYEGyplqlnR2Wg8iP8w/3/m6vDqtLl
sVbLMuzCrAg5ET/fPI74cDfq3hypcrbjwSPMcfYjI44e+DV6vO810D4IUkcZlkOP
9aJzF0fuXR623oG7EzZYr1whOQNveQA0gQJxgT+ya/6HWbnwapMWs4Gcv8jfOYPi
BQa6aYP8NwKAbaZeWif4W8nPQ5yMXkUXRynJKuBGjjgD7I75WG2zo77i/T1iwRgs
3GtyCc8oNowRV2rT27h7nG/zkMTHbQ==
=abmj
-----END PGP SIGNATURE-----

--Gd3pXMNhe/mgyk4J--
