Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B532139060B;
	Tue,  8 Sep 2026 20:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901071; cv=none; b=gchaYC5i78tUUgc/vjXtpC0qhhpdPFttf1b5tnDZgN83Dq+nJ5OfbIEvG6BOTny1ATxkSFf+/sZasi+GxznDFFm021f8Oc7VhkqJqlD3gh9nw6Bfn4kwr63ABnbYOak9frF8QxH4DLEujR6GY1ZydKGmPEaw8fnWBmlAXmiBUes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901071; c=relaxed/simple;
	bh=/yNqYZHZvu1O1tBmr6q0Jip12DA2RlGvHEVmV56Bvms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GPhY58sC33jI480h66h7e1SVp0Kpkp7/9fNU+sdKvpNcdbdX5VyMs0IzmMH8tNcmc5to4mGY0Pn4NwBzXCTlJqU1WAfqtFACTiKYgqPgtzkMmz3UzEVYGvCKlT3EATP821GOQQaFfNKNSonf7di3sLW3SD4iTeS/0nU93FRAQe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqiJL70G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqiJL70G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D199B1F00A3E;
	Tue,  8 Sep 2026 20:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788901069;
	bh=GahDqe6Bs6GKfkBXZXBAkR1vzxhav0Uhfmkq8EQ6pI8=;
	h=Date:From:To:Cc:Subject;
	b=SqiJL70G1U4FokVBYwy9pCMPaLDS02MIz9qjLrx3GrRWMT1O+gtML55QiVUX05CPT
	 zJ9QY0OWkyL6rYGT7T91DRmdz8ZSIEBsUkgtihH00Sh4PY6n4ccYDMidcsC43MofaI
	 eIqaRO2F7ND0b6Tsu3ptaFJ/Idkd0nMqeaAYQBtzXaMS0ZsZ5/AG/BgBvtyfx7hS0y
	 nKskNbe2RPp8t2G6d9Qt35Pd6ZzRfFDQlY2UKLR0Mkr//0jZUVrBS39NfBhUACXlQf
	 GFKNo3i9ufKUantppJ61MQMG+RqN7ZeRM0R2cf/ntwhth2YrxQ4ExSyUjw/CCicC7W
	 lfz4R3EsPhNpA==
Date: Tue, 8 Sep 2026 21:57:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 8
Message-ID: <aqB2yt4vycjyNYTb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CagdJTwiTlLV3Mvn"
Content-Disposition: inline


--CagdJTwiTlLV3Mvn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260907:

The drm tree acquired a build failure from the drm-misc tree, I used the
version from next-20260907 instead.

The drm-misc tree lost it's build failure.

The amdgpu tree acquired a conflict with the drm-misc tree.

The dmaengine tree lost it's build failure.

The pagemap-headers tree acquired a build failure due to a change in
some other tree for which I applied a fixup.

Non-merge commits (relative to Linus' tree): 4329
 4631 files changed, 257303 insertions(+), 62737 deletions(-)

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

--CagdJTwiTlLV3Mvn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgdskACgkQJNaLcl1U
h9BCfQf9G4vRXoWh+Wfy1mE53W+dzwN8MOvNJ/i1hvz7dMHyoCrf7FaHHkGMQt/z
Iz4i8LSlEYiWEwOhB9CRRAvVxGcPfyWGnDDLvgW2fNZx+XBXISN/mM3KdupnwfHH
ZNFeUxFc33kq97f2g6y9ejpg9T9C0JG2jHKXxMLuVgYVBlPzQqpEdjV/iORqdaLp
YEcgCtNmDa7F78sWB9lyFV34puQt65KHxZ5UbShYNcITUFa7Kb9E/oatnTYdKLyG
II3GMwlVmU8bwNqizPXj3rcxgURMoetl61rUW1+ywxYT9Eqm8lnIKLpTc2/W7fS+
zqgHo2CEPRa1w6jp9DztahJsZGThtA==
=4HaK
-----END PGP SIGNATURE-----

--CagdJTwiTlLV3Mvn--
