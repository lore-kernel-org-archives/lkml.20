Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC514C9DFF;
	Fri, 18 Sep 2026 11:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729579; cv=none; b=g/bFSLT0mkQoEdtVFzvNsqZB+aKPRXCO6Wn8q5rUd+8tiTH7QLpisK0LYaxWZ6oEeQ0DsKfK+kHXAoL1F+Rrl4A4hGA6j4ZMJsnNC+LtNjHUIgXbCrPKb/d/0DVl+Y2rUkgBk7JCI0BcY17jEU4uZgWgqVEuRulgUQbdg4FdfDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729579; c=relaxed/simple;
	bh=Q/NkMR0JfpXAtVggi4BMT2x0QCaTKQ99aj3a7g/hPgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NcJnYwgbZOOC/yNA3t4C5IHNlUuObsnq9QYhktS6nQvlxv9VvWhLVgSv0v8aiieWiCHIWJBFj8mCvwpNTiLaN8hNPtwinOJ+nI+NCvlbz74IfNF5b506ROVE1fkc0drAMe3z4tMcfGYT/FE3icgWQJ3gzztOVCfpFa4x5HlO6KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wc/uPQqQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wc/uPQqQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE051F00893;
	Fri, 18 Sep 2026 11:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789729562;
	bh=bxPu/pUYXxFN2Xl6lmo/65fhLXXaLVG+Ny7mloWiPUM=;
	h=Date:From:To:Cc:Subject;
	b=Wc/uPQqQAciieV0LmN+0dMX8Ite0FGHiBLC5WWVDJa4u4gjewZWUk1Zw3SbLkn8WA
	 u8D4fo22KyxvVRc+Hp9Oag94PJjgZ54C/8ycvz9JJ0gjbZmq/SlX/WJ7tHluYzwpUh
	 6ddwLVfJM4q3vRfHMj0pJ7R1ED0UCaBJfia+6dsGcYRo6dePz9rK7F5q/8ehao36R1
	 qqtI7HJlabdhCnUC4cTpeVyhpLCLepcjAE2Tmtta7tZVF3Pqz5HuoFah3VFq3hukcX
	 /8QiG36hPiJjAtuc78HHwAzp7RhLwv0JhaySs+iWVRHqabUvBvlp1MTwiwT1Pc20WX
	 mh8AB0CNkE1cg==
Date: Fri, 18 Sep 2026 12:05:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 17
Message-ID: <aq0bF5KTRB_BgiAX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tYQd+hr/UrCkVcwf"
Content-Disposition: inline


--tYQd+hr/UrCkVcwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260916:

The blueooth-fixes tree was added.

The vfs-brauner tree lost it's build failure.

The f2fs tree acquired a conflict with the mm tree.

The vfs-brauner tree acquired a conflict with the mm tree.

The fs-next tree acquired a conflict with the mm tree.

The block tree acquired a conflict with the scsi-fixes tree.

The scsi-mkp tree acquired multiple conflicts with the origin tree.

Non-merge commits (relative to Linus' tree): 7187
 7428 files changed, 393063 insertions(+), 121022 deletions(-)

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

--tYQd+hr/UrCkVcwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtGxYACgkQJNaLcl1U
h9BS2Qf/ViaekxtCT8zwvdnDlIhuwYyqlRFfL5Mw+rjPHLGEJBalf2Xp4hgHT27Z
R7zpWGBJwon3hqmauCckCi2KwPehU7QCFqaQ1VJ9OmLpcKxzfx/+IXDm8ju0wzyW
BuwT3Fz8qPq3Taw4L6VBr1IJKXiuddgae66HGJ4UGRph1zJ+yPLAx42gbZtfAY2/
6anQzyJgH1CtaOb2sboqRn2MiLfZqtFy6rBwbyr3/diGjUEPiJKtrxr3duuFggDt
DKib8He75yXJ5nJx5CMOLsxZCnFWn8FBSp8K76Mw2IBzTl+CiYJQJxcx8ER3JXIZ
f8pBzNwbi/cruJrtCLuZmNjCvwiHfQ==
=tsRf
-----END PGP SIGNATURE-----

--tYQd+hr/UrCkVcwf--
