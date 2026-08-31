Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E322431A44;
	Mon, 31 Aug 2026 16:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193048; cv=none; b=ndPFt72/xcYfv05KPmG5rePxthpzuz/rNkMLaA0PhdDEGpdUjX3M+DfsEm3FiAa5FT6Is02jEXHzYvHOC7Psp6rFEKkWOGadw/37hlDd1tWlc+9hnDbsvk1YbI+h/FTMHPdMvgOYjzLQm5Uo0BID0gXpkjZcOJOivgBY74dCWx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193048; c=relaxed/simple;
	bh=rQECf6Qk1JH2DZEX2vMFUpsJpTRAZnk06ZKcod7UTdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FhIuRxbtw1/bP7L36s6jPsWJqg7IG/ce1FTarDYZ/A+sZkXV8p7+y29d06AM3JAwW5z18LFN77DdtkVivNi8DK7fvkKgIuckX8ZZPAhhBqwUP5Z2nA4Ito0v1JTxUgQKYNjly3YUGPkmIGysYvMXhm96i0L43l22u2kBz4qhI/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgpA0bOw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgpA0bOw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2C61F000E9;
	Mon, 31 Aug 2026 16:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193047;
	bh=iCbdZ3CV7cu5OGRFaAlZvrRXg96SB6jTilyoyi+d8kE=;
	h=Date:From:To:Cc:Subject;
	b=JgpA0bOwMXn773M2rOzUY4HdKuYPW/GI39USUGyM2WBUydGot5tE/BlOATGIb0ezV
	 efG1gFSpP9vt7C1bcu6+gSdhysNVaYDKCGa2KHb7Lo8nT0C2TNOQZ1AjgMhTzLzoU+
	 59S6yUbfhqG1L2uRxVyV4na0HiDTV99bMpkuLfzLgajhLiahP65BcAqgxDGPMkjLOU
	 EbfM4YSD0CH0mnWUWXdviwQXjHEsjd3tfw3Jdqb6s16dxSq2AaZRo66nuHmiQMBGXy
	 thsK2VVbayB+ToHSz9+wa/6RmNM65lBMz2gcOPEwSEbc3jaQA5cBXBQ9pWj1Jan7Zl
	 xjvVpDQTrbpmw==
Date: Mon, 31 Aug 2026 17:17:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.3-rc1
Message-ID: <2b8505af-3a2b-4e43-9112-4f8e2ff70a18@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8nfkB+OBH0hbjYlz"
Content-Disposition: inline
X-Cookie: Sell by date stamped on bottom.


--8nfkB+OBH0hbjYlz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The merge window just closed so things are expectedly quiet, really
nothing much to remark on at all.  Most of the commits in -next are
things people had ready to go, though at least nfsd and vhost have old
stuff (but vhost has many duplicates so possibly some fun thing there,
didn't check).

Trees being held at old versions:

  hwmon-staging  	next-20260828	(looks like a mangled application)

Trees with signoff problems:

  arm-soc	(missing author)
  arm-soc	(missing committer)
  fs-next	(missing author)
  gfs2		(missing author)
  risc-v-fixes	(missing author)

The gfs2 thing is new today.

Non-merge commits relative to Linus' tree: 1222
 1254 files changed, 37062 insertions(+), 9470 deletions(-)

Top trees adding commits to -next:

  109	drm-xe
  85	vfs-brauner
  72	bpf-next
  62	drm-intel
  60	vhost
  49	nfsd
  45	bluetooth
  44	renesas
  36	drm-misc-fixes
  35	mm-nonmm-unstable

Trees adding duplicate commits to -next:

   54 vhost
   27 bluetooth
   24 drm-xe
   19 nfc-fixes
    9 clockevents
    8 hyperv-fixes
    8 drm-intel
    4 i2c-rust
    2 mediatek

Thanks,
Mark

--8nfkB+OBH0hbjYlz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqVqRIACgkQJNaLcl1U
h9C62Af9GNlVeW/hZ2/SgWtNKPgVWa76Oo0fLKrktk/q8UbkPjXOJVDMvTCRsnp/
xdqqSY3FE0nBZCYDZbfzLmIjLlOjtzs/5NGbr8GlciYKEeMtDH97GE7FN6rmc5zJ
XJpOrGQS2pI5zGl/Jy8+LdFRqKd/Xz0EO+aVTZ9C/RaY8ikbNt5f5jPBwYWahTMW
QHEvUu3R3UDIlg6dPRVAHYMFIGM4WlFZ5CnT8Si5sbfWW3nMdvq6pmK8b0QglVQc
iNe4L3GnMl++U8GXxe1obsaDvEAjPSM+tyZZSe0Mt004p+OKa7dVzu3udnOmD0y3
BFlbyMroPtZeAQnSbhCNzrP/k5q3rg==
=PmND
-----END PGP SIGNATURE-----

--8nfkB+OBH0hbjYlz--
