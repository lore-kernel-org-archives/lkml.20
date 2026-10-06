Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBA03B5850;
	Tue,  6 Oct 2026 12:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791289752; cv=none; b=Ba8sXfKV4i8JE+Csn4ycuOAZDW4I8wfof38Bcc16papvTk5UhPHY1RiRTPxpEUGRdyw0kIzhiiv+Hj6JyZZwMfqvQtRF/0JcGg1mFh+qEax+LwfLg8X2xGLMTOQBOR4lGVjog32X/hHMI+BcbrKV/pxHiFRXt2IS1kG9kj9oxPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791289752; c=relaxed/simple;
	bh=gj3NxmZHjDwiRBo1gCBkegd9299QtKG/nffQXaTG/zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z0VhInDrvjjBN4yVa3ISHgH7q9UGJJ/1VLKbYGkXxJbdlNdjPcc1/nmOOvMTRiLF5Pq8uQXe2gPmPoBl3+dTVaT4q+lcOzNRxwpYSjspnIzN/laV0vPZh+At0tBLrmftf12McvZHMX7WoJsvOPUj2mUk7r5DbzI5RxOR7znoN5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKv5vXpR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKv5vXpR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E961F000FF;
	Tue,  6 Oct 2026 12:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791289751;
	bh=cABm+NKr39RIMHuTzOyXzmITRSTpNt+vqDt2bbKzFXc=;
	h=Date:From:To:Cc:Subject;
	b=bKv5vXpRKUzmKdemxS9yNAEgsingVsWpqIn2wTe+ouHlPeSKV9FSXNVzJYnO13gPB
	 KU5hcSM1l7nSCwf4DNBS9OYq35Z67DSrciIts5IzuVLJsbioWycQBu0LC2KyG9SR4s
	 VgBtuS9uHsa+i91xMbzD7fF4gvaMDkulre75pxqRO4CBJA+nw45hhV4L4Z7kx9silf
	 sBgH6IYMLRjRjplybYvGk52SmRuY4mmWYUH8dlOwgczo8hu+ldKzD1gjaC5FdTAdgp
	 zyHf1C24Nm3PJUZ9rMeExHrGatXhHusEGilCS6Y2ynkEM8pedca1UYtAJjfn09uTHf
	 UlI7RsmE0CewA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 450291AC57CE; Tue, 06 Oct 2026 13:29:09 +0100 (BST)
Date: Tue, 6 Oct 2026 14:29:09 +0200
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 6
Message-ID: <asTplUW9_SlDG3LY@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+cgGpk8sXZxTUs62"
Content-Disposition: inline


--+cgGpk8sXZxTUs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Note that I will be travelling to LPC from 2nd-9th October, as a
result -next releases will be at best spotty during that time.

Changes since 20261005:

The vfs-brauner tree lost it's build failure.

The sound tree acquired a conflict with the mm-nonmm-unstable tree.

Non-merge commits (relative to Linus' tree): 13446
 13616 files changed, 891788 insertions(+), 332231 deletions(-)

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

I am currently merging 433 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--+cgGpk8sXZxTUs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasTphwAKCRAv73Ows9A4
iVLDAQC9Fg8uLX8KDQMAY12ZN1QzmurxqAk1BpKgIZAO2krKcQD9FJepZrHMqIXb
fZl46+Hl8ngQylanVLLjgEzmqSvU2wI=
=jQw1
-----END PGP SIGNATURE-----

--+cgGpk8sXZxTUs62--
