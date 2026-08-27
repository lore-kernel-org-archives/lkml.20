Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEAF480354;
	Thu, 27 Aug 2026 14:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842248; cv=none; b=Y84pvObXfCVr6lw0rTy4DOKBu1ageQYs7poJxDE+kvnNk6jkML7qdriIFqQXh2flUsfFtVhpgxXySdlhs+y3idYtH+DN0wFoiNVaJDtngVNC51yKoOzYl1CYrHLeeC4QBDgzB/cIczK+n2fxpecnsW+oEpG6/0Ct1+rOfPQSyTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842248; c=relaxed/simple;
	bh=QCMp60rPejMmtLUO74Ys+Vd6q6kUHrvuIrFHwS8YNd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aEvVrvKAcAiALrqIcxaK4Tnk8I9Mde9v53haoptDgxZOJubqxjYNOi7Trqr8QUVRpMVhYGngmnumKTDWI5lMzfrn1Do9gKJpeb/iyl43b+IqjRlOTB+nOp9zYCED2rn0fYj2tvAMc3VDwFqfE3vZ3KB3ONzhvn5dCuEQYRM+eO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwkLqxC/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwkLqxC/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B503A1F000E9;
	Thu, 27 Aug 2026 14:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787842236;
	bh=Rz1MXuTYqGT0qOcMQteSTxUVF3c4hY2xoKIxAzfmWk0=;
	h=Date:From:To:Cc:Subject;
	b=GwkLqxC/ePiPt2G69jpvnCDbBzoghBn+RZLFB6Pan4NlsiH9mg2qDcpLO9trOiILO
	 AP7XKN8btzYjRPCyLJwNeJRvBSbI5SHpXokPMzihXEs7Ujfl7qpnCFujRAKlfPmJG4
	 13BcGJnU8MyiIh+Gg8LIrScKf9YDOMcw741eogrPzlE8zAhSsVuUX2qu8OTb3WnWtu
	 LKpATmF7EFPq7wVH2uXazyFXUAjsOGTJTLmVd58yUDEf4iuuq9zTPlqlSHniKiiIrk
	 NEybHFExhziLzjBIaSF5Zu/C7aDjgh4p4qW2ErRrbrzBdgSv+EnOM1VZS/Ub4PO1Cn
	 HpQenmR4cJuOQ==
Date: Thu, 27 Aug 2026 15:50:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 27
Message-ID: <apBOuaY8-2BfCNLS@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CT6IssbDeS3D+xZA"
Content-Disposition: inline


--CT6IssbDeS3D+xZA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260826:

The ceph tree acquired a build failure, I used the version from
next-20260826 instead.

The pwrseq tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 1507
 1468 files changed, 38297 insertions(+), 13728 deletions(-)

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

I am currently merging 425 trees (counting Linus' and 131 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--CT6IssbDeS3D+xZA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqQTrgACgkQJNaLcl1U
h9CZbwf8C9UBwxx0sh1HHXXqkTKuRkX4PNnHoiWBcAex/98C48X1NV+8zAaK7MoC
+tF1PXJIP/oZYBIllj/zSFAPJXNcBzyv3X05dW+6gsjUxH8i54dBJJocNEqFSzzO
ALIdvO2XoSSeuCCF7PoSid3hecq3bUo7yWwESry9Os0xT2vHwvn2AmtYMVQbv7mY
ZPTDk4bISw6PalKVbSbNSnNL/y4o6NRvv0zvnGuzsz4DxELU8lvv+yrIagxe9mQk
Csje9Xsh0yaokLwEPdZ2IW710KdyK7GsNgkLQ7iZknLEeB5kNpOrtD4PpLGGaR5e
I1LSo0VmVONHwQVQlXqnhxW99F8/RA==
=ulhU
-----END PGP SIGNATURE-----

--CT6IssbDeS3D+xZA--
