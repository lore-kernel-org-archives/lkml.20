Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20524C14E5;
	Thu, 24 Sep 2026 18:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276022; cv=none; b=TU0pQfvn6fcJ1Og69mFIGv8Dea8IBUOWqrjQHfwBVLjoou2iMLYMCwnDs1ST2kwmngZ87+SYP1YywK4u7DU4Te77QFiZ+eKDl/CGLBoxw+E4cATT6jzfI74uwvp+3QoG013wLVC417aRDeJd2sNyTd3gHFTrfKPK8Ba5iv1sWgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276022; c=relaxed/simple;
	bh=cJIVJg7y/ThiaIW9IOSkYWuYatWcKBglheJ5PvvdUd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fu7IMCJflmYZ/eh8eFwpbnPSOdVjf/ZLjeos3o6WYNtsWA9Ni9rjS2XICsslOn2xAEz/bbFnXZvUl5sVc6qMfeP9j/qC9sskLFXQ2UM4dvw3/CLt11n1zoY1Tgwlbce5xcv87BZv2Fi5pMfmAZq5DvEZyLlOoG/GfHDWYvunewo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XbYqLVVF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbYqLVVF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A508C1F00893;
	Thu, 24 Sep 2026 18:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790276013;
	bh=EAJc/MvMahTOErXSBCuF4+z1u6X4KuNVS10aPK8Idvk=;
	h=Date:From:To:Cc:Subject;
	b=XbYqLVVFU9DayVMde45BtxTRVLCmDkKDb7bLtX5ozDAyOiq5b9dyhqh2VeGRWkrtD
	 dxI/7TnwbYKx6w6aRnG09cDviIKYTIOxzP5BamN68sC2UVRTW/5vOf7WOcUG7YJTIz
	 xMV5IoHneGEg2iWADXbzfX/LEVR9dv/+C681RiFhfMqXcTc5ZVuptfwHFLihEg0Ftn
	 TpilJJAPquLEdgx5TDAdspachlmxoqM2dzn/LaVxwpO7V3fu/YZA0NFZMgvoEvMFsz
	 zw1ybepgemLbboyoyEoJTqyhDTpgi+H+pzZT9FXC3mMr2bvISKtLAVC8vJlPAfLoUD
	 gi+5ToYCcKIkw==
Date: Thu, 24 Sep 2026 19:53:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Meijing Zhao <zhaomeijing@lixiang.com>,
	Wandun Chen <chenwandun@lixiang.com>
Subject: linux-next: manual merge of the liveupdate tree with the mm tree
Message-ID: <arVxqTLflDLv8XbZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CjJNE/DrbCfKbldi"
Content-Disposition: inline


--CjJNE/DrbCfKbldi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the liveupdate tree got a conflict in:

  mm/memblock.c

between commit:

  ba13f1f32d96d ("mm: memblock: add missing HugeTLB flag name")

=66rom the mm tree and commit:

  05a84ceadf702 ("memblock: rename KHO_SCRATCH to KHO_NOPRSRV")

=66rom the liveupdate tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc mm/memblock.c
index ea0de4b5f3568,f5aaa38cfa313..0000000000000
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@@ -2878,8 -2885,7 +2878,8 @@@ static const char * const flagname[] =3D=20
  	[ilog2(MEMBLOCK_DRIVER_MANAGED)] =3D "DRV_MNG",
  	[ilog2(MEMBLOCK_RSRV_NOINIT)] =3D "RSV_NIT",
  	[ilog2(MEMBLOCK_RSRV_KERN)] =3D "RSV_KERN",
- 	[ilog2(MEMBLOCK_KHO_SCRATCH)] =3D "KHO_SCRATCH",
+ 	[ilog2(MEMBLOCK_KHO_NOPRSRV)] =3D "KHO_NOPRSRV",
 +	[ilog2(MEMBLOCK_RSRV_HUGETLB)] =3D "RSV_HUGETLB",
  };
 =20
  static int memblock_debug_show(struct seq_file *m, void *private)

--CjJNE/DrbCfKbldi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1cagACgkQJNaLcl1U
h9D9ngf8DcpAMCr6Bpk5rKW4E1cnqGhn5z/Q6CNfwd/0mNiPePWELC4aqZg7frxA
+DTY6UYNW+AUEZvv0m6qbhFH89haxC1PamNh4QBD+n6lhwnkrAf73U6gV/g29Zoz
nIXLNTXhAgPlavclfPlrLvDYETL2sCCVXg2XUhabajgA4DLdSBScOw0RYFs6ryT3
lPJXILSu1Hk8sdKD/gpFcuBnLxvUtCVTTzBTg+ncP0khL5HS/6urRxQLiLtfQHo8
f6mKI+fNgqTmw03ieeC34mq67tlrv+CiqmeNBPlG8IL1UWWlymXwBpG8QxOMBqGH
nudSld7ob0fij4s6b0eeUzVXXE4PBg==
=f+e8
-----END PGP SIGNATURE-----

--CjJNE/DrbCfKbldi--
