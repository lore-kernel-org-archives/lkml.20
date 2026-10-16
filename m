Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567423DC4C9;
	Fri, 16 Oct 2026 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158719; cv=none; b=g7hLPDFA40rXlWpICyZLn6SwGOBR2Wt6vF4zAHEe4Imua6gGG9d3tPqQHBpjfXqnBEToWJnLHpivXfsxstiHwiCIM/caUtEqPctaAAzmCKTBEs1B6a0O2J1nEpumwiZssMVbbnZsgwXcqIpxwovnY4MdoBlNUvzeaWQLE4saCP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158719; c=relaxed/simple;
	bh=1GBQIss1w1cZwVKFBde7LT+fEq/OW4/OFE8BpgemS6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nNPoOQoHQM8mKri15M5cOmDJg/2QfFeWSswXIK+2ib9m2Xq30Fo3fXIPQJPsRTAl26T9aWLKrGfIsBya6cNclloKCfag2dqDE+a273ZJwjXJ6u8kYzwRhTHBRGeEMFpjv7EAMNkjnCYqa6Y1eH+g4GEyZcXOnFgsBb2tG2NYMJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uiianoi+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uiianoi+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B261F000C4;
	Fri, 16 Oct 2026 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792158717;
	bh=BKjijHe8s6sXlVLqWZ8gd5NMJcTOXK94SLgfMKCgOtI=;
	h=Date:From:To:Cc:Subject;
	b=Uiianoi+iawD4QiJ10Xg4o2LZsWIuITOt/1v2obWXa6WCO2ZsiwOYDESMljIh+Ep5
	 KHhwpOABIlLgeehgB5cx3EP5xi5zUj+zVU6Gbwawj3wAiCf3SuvudHfbdZsBOMj8CH
	 vUP8dixEPKeriMFo9VqPr9ImWMtmDue1fvyCxWqRJlroU+irYM0+06rEtH4L/oiWB5
	 tz8GiiH3rEayOtiRDHFlClZdjbqJSZnkZJGr7QVgAEWxEhrYBJ6eDazHO4V4F7O2ck
	 HPZjeVfTkZxJnPx3k4nDI2rxnVBXq2f2As54ZPz3U5zdqV4Aj6TpYmJeBFT5przUJD
	 xQJ3X7Q2lLvyQ==
Date: Fri, 16 Oct 2026 14:51:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 16
Message-ID: <atIr-p1GV89Kzso-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mRUfyznW+Y5CqNxt"
Content-Disposition: inline


--mRUfyznW+Y5CqNxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261015:

The hid tree acquired a build failure, I used the version from
next-20261015 instead.

The block tree acquired a conflict with the dma-mapping tree.

The audit tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 16712


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

--mRUfyznW+Y5CqNxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrSK/kACgkQJNaLcl1U
h9A0eAf+LgRYpAIxuxw+fgpZJNZ5vuBmPASH2/9mUvAPHkeJB4Admqn2BvwxqO//
LVSqQJdKbeQCntVw7umgu0z4Z9MQ1DABVzSjywrLG9NuiF2msLGTliAdHK1sx1oa
/OxipoEUBWdX3Poag36NcYpyMREf43WKsVZJZK3Hrhdz/u69Nv2A5u7wS6EtTQ04
cqHw7hIk1oqnLkfgDqUa3L7CZMW2RjzRvDoFtUm2P0s+Dw6st0GGdISWNXSISUsc
Loe1GMEy6rplizC6YExiwRfKxC3XRqSorAnRhHA+B4Ki7KupopOHhWPuIbLhmF4b
+WV1yIkHZG/jrzt1/w7laUq97W/mhw==
=Jo6Q
-----END PGP SIGNATURE-----

--mRUfyznW+Y5CqNxt--
