Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DA04A3859;
	Mon, 21 Sep 2026 14:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999233; cv=none; b=MG29BjBzoZLJoXtIFpR09Y/Q2Q8OYEdfVOVwDAovyn+/MROeX8o8qMnNfzXVAJcwxhQT/g/Zrm3BTWEYID5em/nef2OGG/2dvPQCoETmobPEcuxOXEUa19OlK0vwzOzwv8p8uKLm04FUXKPI8okfhWM6FPGmWL38K/RIzKoc0Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999233; c=relaxed/simple;
	bh=yTzPxPSNtjXiI8Bowsb0EfZGgwMuvaB3WBQI5TMT9yY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IwI9BmhHM7ocdZqct70flk2CXWE2EjetyKqufEUPIK0r0kQyM1U1BtKTMrYU2cj+8lovXw5sAg7qNB2MRC/yfjSsMaXwHgxdSpKORELz6YczzL3pHt2X/VCRl8Dio46m3k2Owl/TZhKQORJqmfkB2s0jiyYiTIPQF9uTGhFDAgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtJmf4qe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtJmf4qe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852CB1F000FF;
	Mon, 21 Sep 2026 14:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789999231;
	bh=y2gMPy2lUhK3ZXDQoGrQ/YQBEKSXGy637t+H9Aci18U=;
	h=Date:From:To:Cc:Subject;
	b=BtJmf4qeFF3MHVRjfKXRJvXzbnO98ouY5kNWuzD2p/NEDgB8LUwoL22tBr9SEfIeH
	 ZowHMYHJQZrfe1S8UnHXTjzzCGuNzzz2w8R83S8qSZsqcBU9428KJ1rtNC2dNsrsQJ
	 yWrpAsHEkSHWZpCdV6Ml2/W/DlsAK5r+hQvyH5nW265vQZAfFr41K9m/Q++ITMcPgg
	 bwYhjogbwE/lKU1K2KcaL3QD0BgdnKT8Yoxk7FC1/R+nNIaf+ib32eFVNS+BJvyQjd
	 39EAHRCUUqLnPWoE///L1jyjNruF9//ig68RjO+BdhkpAcmGzbeHRj83YSXNEpOFQb
	 C+Tu6jav1udrQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 651851AC55A7; Mon, 21 Sep 2026 15:00:27 +0100 (BST)
Date: Mon, 21 Sep 2026 16:00:27 +0200
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 21
Message-ID: <arE4e6B263xjQD1_@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rG5UCpIhpKQ5bvpL"
Content-Disposition: inline
rom: Mark Brown <broonie@kernel.org>


--rG5UCpIhpKQ5bvpL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260918:

The bpf-next tree acquired a conflict with the mm tree.

The bpf-next tree acquired a conflict with the bpf tree.

The drm-xe tree acquired a conflict with the drm-intel tree.

The char-misc tree acquired a conflict with the char-misc.current tree.

Non-merge commits (relative to Linus' tree): 7602
 8221 files changed, 431806 insertions(+), 139589 deletions(-)

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

--rG5UCpIhpKQ5bvpL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxOHoACgkQJNaLcl1U
h9AAyQf9HgPdqg5rnDPZ9NsA044QFRHCJxYUmL6qIl3gm694wp1FxLv3pnPxiYnl
COerwIi+47bXFJbUMariEpQbhVENR2hKeXgD/aVKZjbIfYnr6O4GMlON7U285P8v
te1I0I98v51JBwvOGQQuKJH/rMz72Sep/3tPnUhGXyTUGwHyG8I0ix/l7kIvoZl/
g3rH86Ud5ocPHLeFCvPxBrvHew+9nG8UnQsbDlP3d77/LddIrGjAWD9fdfzDm6wx
/vNjs/8cV20bEkOH3revGqPHzezgdJMYQjmhsE9Rj68ce8/BtfTFqCSz7zLUenoz
8Nc6oL/zeyfz1i27d1kD3YjySt8aXg==
=secF
-----END PGP SIGNATURE-----

--rG5UCpIhpKQ5bvpL--
