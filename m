Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAF949DB9D;
	Tue, 13 Oct 2026 18:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916369; cv=none; b=lRuKdMLw6iKeiyXKihZseXSz9iAlLYjNBzbm1Rov5U6vib1PblZ+483JyzXImK7Whd6qG7blAK+B40MgEuOb1ES9JKw13s4F6MWlO/piYOgGlxuE4+0nMoPW9aC5CCAnifQiruGDBqnRrlwEu1QGnMd/NBtfP9rdFsZE4xYCzsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916369; c=relaxed/simple;
	bh=2YSf9LZcmvbcFXmvhXPvXa/MTYzp3Vwvjt/4vQfhPwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nGQJp+Xl54EU9Il39mHwJXl2A4gpT4gNR6Huqk2kLABqD+/xDnYRklH+dSotUMNVLRjBUE/K2P0U5uXGJzWnMSTpRyGRM/0FoTki4fmkLfzYz8Q28/BF1OetAhE0HlBlScEEC5rX/8EELLLEb2NyVPosn2+bUHyz7YQtQT0y85I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NE3Jst8J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NE3Jst8J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9F21F000FF;
	Tue, 13 Oct 2026 18:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791916367;
	bh=IcxzB9p5kDRce5fyme5NN1yPHKzKCUqn9a0DWqSctl4=;
	h=Date:From:To:Cc:Subject;
	b=NE3Jst8JdyYXWKzqVyFJIhOz8ymULm/uxSInNCsomqIxCx5u4IlOe8U5DLiN1MgAX
	 h+XTECT+hmmBRy7aAo9XFC1CD0kq+eTtxwWiIieHTBnCOXRQq+CfxWOO+BzrimMdJW
	 Mkarnm+lU0yr9Prf3ePsf9t1v1dwyfc/bDj56S3TtO3QUMzHNga9lMmqvfYvlFPvo0
	 sqfb8izmNQP1JG1kGKb4d4YTgSo3oAcQl6whpOEHQc/i+EUSqs9TLwKOIWIAb6ONgm
	 9/Y12ddn2BweMNcogSET15W+XgROmOYf3lM0jXKbgN280TVxElpun3h1uwVBr/xmRi
	 pB2BVhp8YNNbg==
Date: Tue, 13 Oct 2026 19:32:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 13
Message-ID: <as55TDf1odOtYeIX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R9uVURAeFCSjISRG"
Content-Disposition: inline


--R9uVURAeFCSjISRG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261012:

The nfs-anna tree acquired a conflict with the nfs tree.

The vfs-brauner tree acquired multiple conflicts with the exfat tree.

The vfs-brauner tree acquired a conflict with the ext4 tree.

The vfs-brauner tree acquired a conflict with the f2fs tree.

The vfs-brauner tree acquired a conflict with the ntfs tree.

Due to semantic conflicts resulting from the above taking too long to
resolve the vfs-brauner tree has been held at next-20261012.

The fbdev tree acquired a conflict with the mm tree.

The sound-asoc tree acquired a conflict with the pm tree.

The block tree acquired multiple conflicts with the vfs-brauner tree.

The block tree cauired a build failure, I used the version from
next-20261012 instead.

Non-merge commits (relative to Linus' tree): 15163


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

--R9uVURAeFCSjISRG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOeUsACgkQJNaLcl1U
h9CWxAf8DwLKqZz/HL4QguKhhCKyYtnwJhwGE0zvXv/I/85C6fyNQYqwsoLZnnhq
YfEp+Jx1dqEG9mXBTY/AoojEB/GejI7rew2ZXZq0lAA4HKlZKTcfBapalcUxR6lx
G+TPFEghNrsUBXHZOu/Hsg0vtuNcr/lLsrb2Dmm5HX2NHe4zXJKcmMMqlymYKxFo
r9RQHFazR5ZRxD3fUrK3irv8KcQuC+istzP6m67Kp2oTYjj7htyojpq6emJbTHuQ
lU4Dt/XJhwz2tk8I4KYuqI6F5oxcTqscq7W38deiUbS2EyQc9udZlBVsp7Psi94Z
wsehzcGo0pPIlWoC/M3ujHP+pPIf9w==
=0tnw
-----END PGP SIGNATURE-----

--R9uVURAeFCSjISRG--
