Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419076;
	b=gPDExN6F5vdjYaJ1uEbPHqBJrvhgr37p0PccleJs7igXR4LDO3CTJRGnjNkIUTMFaGOb
	 YqroNv8LTyA7Sn6h6Ieof+q/ukmVVf0DWcRegRlQKmk8FBQ+yQ+tGHm+8FvsdPNruJ1Dh
	 z+1zZIcacOP4iRVd5srgcqlwgtoBXKb4BgUz+cAttC/a7uO33QufbxjxEeTwHwiF9U66r
	 T3WE34KEE5AgKXRHH+FMz41b+xRVAVEoDcimcUQKyW6DhRe5qCrwVHcGFhJYSUcF2oYEl
	 O301WtCyU51XJnQ9TVJN51YiMtcXSNfxz3jWfvRCMwno4sMc5qsdv9/cTZYWFSX66VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419076;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=ybRw0ZlrRJAFpdQu9B5v/NsFAfk4/b1SORGlH2Ul+2U=;
	b=FgIk3OXRWKiU2TOL5a5soZatw7CiK8h2/9FZnjsp9YKpeGVSjnZfdUDeQoNKzQm/HwrU
	 Aq7JQEZgGYoqeMb6ktmC6JJouq4Xxd1edRPVpOgOO9TTx6zEVgjNyFAe2WDScmxNkVRQG
	 Xfuf2u/+gP/oBV4U1ICh1IEncB+fQO7VxmdZqYlTukrgr/8YUuLgFEF8wYpb3OdOg42Ou
	 39F77+Oa7cp7w40LQTsKTerADK1epPSRxoBRKSsCJs9VWCpALWof6jenAveskVFW2BfSu
	 ZznzgUnYpzQtR6G0cfT7QECJiWl9UDdlpOV5ACG1RQputnR051wGDxtq9q1Gz3ZdAiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HBv4WPrd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA28606A331;
	Wed, 11 Nov 2026 17:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HBv4WPrd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C305B1F00A09;
	Wed, 11 Nov 2026 17:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794419076;
	bh=ybRw0ZlrRJAFpdQu9B5v/NsFAfk4/b1SORGlH2Ul+2U=;
	h=Date:From:To:Cc:Subject;
	b=HBv4WPrdbTYSvNSBfPPoE8sADTP77cdHU69z9ZggME9+uMBkGo0LSvF6PWbuOb9TE
	 /VcC8wQxdQveSTNsDvUiO84NUthSBILMoDkbPPBrZuune4zd6XVoj2hv78gtvt4LU0
	 ubsz2uql/BNvDNmGx9RRxcqt7NpdIXAgF4/ZT1/p88NFpSk4H7QNpsXW8221BW4gp4
	 p4GBX8MCBjfGzIT9BWYlJZXBdpu0n7wAgPrb1VH19PZRMyDOjsaKRSFAh/se3a++yL
	 94J/i16eohLPEc40dhJLTTkyQLjzqt512RfWajgLXrkSt6rZu0z/qziFdXq/OEM+dz
	 qj5cu0tFDYPFg==
Date: Wed, 11 Nov 2026 17:44:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 11
Message-ID: <avSpgZm3mocwprs1@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="szWOCY1/YMUR5XtT"
Content-Disposition: inline


--szWOCY1/YMUR5XtT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261110:

The fuse tree acquired a conflict with the vfs-brauner-fixes tree.

The rust-fixes tree acquired a conflict with the kbuild-current tree.

The pmdomain-fixes tree lost it's build failure.

The pmdomain tree lost it's build failure.

The wireless-next tree acquired a conflict with the wireless tree.

The drm-intel tree acquired a conflict with the drm-intel-fixes tree.

The mmc tree acquired a conflict with the origin tree.

The drivers-x86 tree lost it's build failure.

The leds-lj tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 5729


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

I am currently merging 436 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--szWOCY1/YMUR5XtT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr0qYAACgkQJNaLcl1U
h9AH4Qf/cz5HNtfQ8uVKxmLhUue1FBs7Uh2EY91f6R5gFSoxObMglG8mtdQ5b81k
4PXSaAFSr9jyJdLFLZ3pGpKXXcL6At1WRVhwuf6kJ6MG9iBTuL37f8VyMaToK7dg
9wjmyC4fJk3L97CmgDpt/e3lpV74Ph2/2RrO0YOOtSXn5De3ybQkZS3grbKAAGQ/
6uqU/wuO2g0zk8Reun3Ds6mv3AJLRooVzgqhpJBZPsBNV8q7q/5MGlONqPvsH615
hyIzCmSTx4Axrtpq98Cp0KNEXRGeT8XCyz9km7JtX3u5v/rwABTT1WvOfTxaiEKc
L0LJ8rt3jOea1G2s14aZp5t8CY7pOQ==
=INJl
-----END PGP SIGNATURE-----

--szWOCY1/YMUR5XtT--
