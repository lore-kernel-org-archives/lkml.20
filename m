Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6984964F;
	Fri,  4 Sep 2026 19:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788550223; cv=none; b=jW9CvYsVt+yBZOZHmpbHMdjdG01cSMB1YEUW/II/P/d+x39o3SIJHr2UGXoZbmarB2XBgVaPRKC4ZQzVGMgGlr11J25t5qoX6RN3HXSXAoL/HsmoQMEaqcLk9UJORKXhbSd9dOttlcCX9b35unqat8tPVLrvBSrdvhocOgZqOGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788550223; c=relaxed/simple;
	bh=RJ/L8gXSGYbWMGhT1/ILs/wAmxTXOB3xVC+Emaads4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pbSzCrbP04Bb+t49I2+C9L47YnRoeuOBSi/uv90L8EKs9+ZFg7iBxFJFdEV/K3eGJWRcZlMjRzZDIQWQaaxFrrxpGfONvDlW565S+qzOfAx4IsMlPy9T/GuBu+gTXtVrTN2dEw56HiQ/U7+m5oRTT274PeDZ4V7SPkcwa2myS5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVqJKymr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVqJKymr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EEA1F00A3D;
	Fri,  4 Sep 2026 19:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788550221;
	bh=8jmTYC/nWOck6B7UdEGwOZNBmL2BMSPUmvh+prUrtaw=;
	h=Date:From:To:Cc:Subject;
	b=KVqJKymrpfBSQvF9FzZZIk/2ughEj41XEqT4KBASnEnrTUfl0UCDlxMUxl0HvfHuK
	 BTduTEXukP4Hkk0ce+TzkT36m7OZBSPJBbJ6WGOjZKxBLjyz6LdXDZ8QVQ8sl8Osj6
	 BswL0whKwFx4qwqHL36mbSwhHqmQfEE93ubxXa7oWbW+5FcelPTvV63OTomDp9Wj2w
	 RpSZ1jPNWQMR3f0DVSghF7CR0Vzt6QKfcET6gRZmE6aicBlfnGDNYMTFBWioR+8gU0
	 B8n005kdFZ7bgardLrkZFMtTkXwjCiBYru4VJWeH88FboKqnfv9vh9N9TjF1HGiR+X
	 dC3ClOWY4+78Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id CEF391AC52F1; Fri, 04 Sep 2026 20:30:18 +0100 (BST)
Date: Fri, 4 Sep 2026 20:30:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 4
Message-ID: <apscSgtnBigG5gt0@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+mjLwCi/P6qTTdFp"
Content-Disposition: inline


--+mjLwCi/P6qTTdFp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260903:

The fs-next tree acquired a conflict with the origin tree.

The dmaengine tree acquired a build failure, I used the version from
next-20260903 instead.

Non-merge commits (relative to Linus' tree): 3506
 3748 files changed, 224261 insertions(+), 50393 deletions(-)

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

--+mjLwCi/P6qTTdFp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqbHEoACgkQJNaLcl1U
h9D/dAf/W9QxJLkDs2awnDJR8nAlc1/3NOQ65YLrQJ7TP99I4GhZ8trIm7PA3xLM
q19mIbUVaWJzSkxA1s+nwb2zMfFxg3z2G5yaQoX6ezPmC4DwgkFlYiuyYFVcmbw/
Gnb+aXn2hO+dDG+Bk8i2zuVl7DYe7SxwNIzAyrJESFd1m7F/CTcP8Ex41e8GmZ6B
l0FjvASYV1PmK4gh6VL+TeLPr99CwXmJDkv0i6vCEaRvusYoUeyKL6SPMFQjmPw9
/NGcVACq/F03Nd50dn9BxxBhXGUZUDOWhiOOjvERDiUCX412nwc/6HmoZg5UTKSs
eip1RgqIBBUq2fybuXXMTHsOPULQDQ==
=NNYl
-----END PGP SIGNATURE-----

--+mjLwCi/P6qTTdFp--
