Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09494F30E3;
	Tue, 13 Oct 2026 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892069; cv=none; b=ReWgVfbTNHAelWZbBfHMOi29lV59vOff4XXoCH/EBTVTPaAwLeBpb0ydFGSlnGLIueGJ7LGcTgSiSvl62TY0uNZVvyYnYtKOWCe6qH1yz4/FyRafmnoZMGcbV4TW527gXy+qjIWjX92uozkj9k9NrQOenezljsYai3PxsX53FmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892069; c=relaxed/simple;
	bh=t+mUPABD3WpHuQb59X2jDhOZS/Nf2ezee5muEqDZjvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CBXxQX4tIPO2q+u2Flx/JrrO6xnfaXI7/l1ns6sD1hN5VjWAiZUvYQ+DO89skJ/sE8dv5gsf3txV0CinEVCF/COGASXJROP7pIPHcg6rIp69u7UmUCPvSg6YZ9lCw8AgNMlAArQbxOyeuBgsLN0nx/4MGSs6VrrOl9i8eBwSvk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYFKKbH1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYFKKbH1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E041F000FF;
	Tue, 13 Oct 2026 11:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791892067;
	bh=lThkOVGrF4Xbcq6bgjArT46HNfz6icM3dmbIeKRQBbU=;
	h=Date:From:To:Cc:Subject;
	b=mYFKKbH1B0JN9AMqUNvtEUrSuUvOb4sZHyCZPMQUbCq2voPkpDZhlAhfk/BxJWrFU
	 2GucnZx2YpEFlpanvJ3hYZnrE53ufD5KX0z1k0hSWrNWUHcfZ22hl5AI95u7X+Ikv/
	 5UZFDnW3SQIHrx4rLKB8Hpd+jdrAfe+CCaoN19CyYVsS7LyAz5REDOxTxmD72diYzL
	 ynNgnguErbGR9YDXZ9yYPAyUg4hlLUKwiAn1hkymbBhKMYOrxGZpBpnPtmyF/qcQWn
	 y1g2PNZh3Kw8xn5fcsTYs8mVh9+Tb84/by2gf6EDvWmyUAsPmafzcFeSPPOwejxu7S
	 N4+ytKG4NNrJQ==
Date: Tue, 13 Oct 2026 12:47:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 12
Message-ID: <as4aYETdtAvLpDTC@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BU16VurHDm4oHQL3"
Content-Disposition: inline


--BU16VurHDm4oHQL3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261009:

The vfs-bruaner tree acquired semantic conflicts with the ntfs and cifs
trees for which I applied a fixup.

The risc-v tree acquired a conflict with the mm tree.

The drm tree acquired multiple conflicts with the qcom tree.

The drm tree acquired a conflict with the origin tree.

The drm-xe tree acquired a conflict with the origin tree.

The mailbox tree acquired a conflict with the devicetree tree.

The random tree lost it's build failure.

The landlock tree lost it's test failure.

The kspp tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 14973


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

--BU16VurHDm4oHQL3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOGl8ACgkQJNaLcl1U
h9BBVwf9GIL9zThKoGyyWOpfcxZ8Yy75an2Ti4qiiAYH9cmlWI4aZ61g4qjKPKIG
Q1Ljm2Pbl9TiusMIWNXrqguIgHNBBuQ64Dc9vleDU85kGnl+HcnKyaiEyf6pMO5K
Ta+lMv0CD8PHmiiVw9wQqGVRV6Vq+1fc91zRJwPGQAHze4g3O5quSCBG1xiHoE+g
hg0CfoBDVL0UafJpUcbP2BjoelL2EA0FBqkilTkXCz+0ScUqZB/dkOz7WjV4jhoE
LffMr98ooTURGALLLdTz0YsDi5uInnPZ8UlsDmPQe02VzpwwEx0CzdyPQj4NQUh1
Ais1soVYlA8InXo9n57GXkfDZVIv+A==
=Os/W
-----END PGP SIGNATURE-----

--BU16VurHDm4oHQL3--
