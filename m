Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E70D43F4B7;
	Thu, 24 Sep 2026 22:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289428; cv=none; b=Wr33vMR3w739EY63nSst7Zor6JsPCyxat9xf4lfe6wkIpCTCElUJgb9ZPMUoL+INDimfTRK1Mh5/w2Ed12WiaP94JdvMINwevmt2XHnoolyoKNaQBffM8E0OGOHuRh/bXSqDLanazuSGMxPtYwBsn9D97bcGe+CM0UkME84jMK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289428; c=relaxed/simple;
	bh=CHis7chu88U5RyZJbFYgIoHNu0ktnicgKehoY3lR5i0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SlyoR1cAUa3ITAqDZntEnS5qNaRtEMaNNk7tR9t9C7Y3/Gm5IMsGVxDePG9/vEFZLGTD5L9CPWbmzUg6S05A7dXpdwOhAdJX2CwkAGNSDMZdNu2dMtjczF9hmEKnSUF8DBCcLnnNTUbqbC3/pVW/jy+9ioH/65wRTnub1H+9JjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDqKsDJi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDqKsDJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CF41F000FF;
	Thu, 24 Sep 2026 22:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790289426;
	bh=Mmeq2nIatjjyNibdqwO71dEtOFXNw44GOutzgMnRb2s=;
	h=Date:From:To:Cc:Subject;
	b=fDqKsDJi/l8MGCnyy77g8vPrwAxd7jrnkze1kWDvXmhDB+0aMTzeEFxtyBchdhyoe
	 /S98qTX3fJ5q/fSmaOOF0q5jlZOcO9IiCDc44Mj8mOpIhNQm/Ob3wLAedxwicDqXsp
	 4cwrHypd+QCxGkZJ+KbkPfQZNZLrGpNmBjSzcbHCizcZxFewYVz8E0zSSFhgdtqNZJ
	 QxPxYMudlTuv72GMKLLNJF4L06aXNg4Q0D+uvGJsYghjFMKgCi4YJbON6cYfRG3PCk
	 TYtT9qRY7o4NhAmmGQ3DZ0HvlDNXSl4AwLhIeamqiCpspm1kLSBVz2D+D0p1o4u7Ee
	 iw6A9ZO3cyA0Q==
Date: Thu, 24 Sep 2026 23:37:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 24
Message-ID: <arWmD5B_Nt3qcBXZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1U4HDpMFiBm432tJ"
Content-Disposition: inline


--1U4HDpMFiBm432tJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260923:

The fs-next/xfs tree acquired a conflict with the mm tree.

The v4l-dvb tree lost it's build failure.

The net-next tree acquired a conflict with the net tree.

The bpf-next tree acquired a conflict with the bpf tree.

The amdgpu tree acquired a conflict with the drm,drm-misc tree.

The security tree acquired a conflict with the vfs-brauner tree.

The liveupdate tree acquired multiple conflicts with the mm tree.

The acpi tree gained a build failure in the final build and many
warnings earlier on for which I reverted a commit.

One of he mm-nonmm trees gained a build failure in the final build for
which I reverted a commit.

Non-merge commits (relative to Linus' tree): 9099
 9664 files changed, 506998 insertions(+), 161450 deletions(-)

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

I am currently merging 430 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--1U4HDpMFiBm432tJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1pg4ACgkQJNaLcl1U
h9BLfAf+KC4Dwim7J5KnNCpQlg+cyM4PfIByJARuddDN5Ue/Gc0QXQry9fd2v2oK
R67MwzW0J9Vnc3fhW3PsADFYntCjW9fWd+x9SBC6XQEjlxNzVBCjGfm4MwgcInC0
5jE2gMFvXZQj1kPlVwetJ6cYmO3q28dENVnJoo58Tfos1yZzBAnBGO+QkfWsX/2y
rj/R0EjCHg2kW6GuqtsyOoIbLhQUT2JbK/OscqKjtHLKZRCL2r9UMX6LTsxiGn2y
E6Bq7O9W3nrCoRhycxdTi1hbHRi2uLhPyw3F0ZIgB6uIbLF0x9Y+vH3ceV99unj8
xzhq1lkCeQmqf4mG3W05BWfcozt5Iw==
=OicX
-----END PGP SIGNATURE-----

--1U4HDpMFiBm432tJ--
