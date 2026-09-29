Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E05752ED52;
	Tue, 29 Sep 2026 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790693833; cv=none; b=peiuuILLjsLaZN7Jr0E6K1DxSMQE1vHhQ2T7b9vfrV7preObQW6IBFzLB3bTlhd3JG+oPTO0EsCiZNtvJ/eGd07oBFTI1zBXYz8tb46NF+JMtrq7JUnliTqs9JB0RN+83hhPusuPcyoTJxIKvGnoYxltHbXpvxKDtA8/YuTDT+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790693833; c=relaxed/simple;
	bh=tvU1xjBhvV8/XxNpEQbMFM8AoW/NZ6ECf2JMNhULMyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YU4DCOJfEoeTzK7wHtwQYj2wychVgFsKNZBVpm1cGfc83tshJMex8FkHfIm7mbdp/jmvToKAMEX1qpKsRVitv0ECYOOW8Qnr5B/iZG4gSDPPL/BZWHEoRm7WC4usxEtLtMLy0PVf1pE4meg8QoCc3g+/uM+Vs3c2KxHPWYk2WDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJkax/Mf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJkax/Mf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1771F000FF;
	Tue, 29 Sep 2026 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790693805;
	bh=YLHQOkQJ+bfGfOb0ek05tU4aGkIFHeMeGb8pp/X5qiY=;
	h=Date:From:To:Cc:Subject;
	b=AJkax/Mfebr0TLawLB4Rpr78oJCU2zaX9jJNl4ATWR//ozM3meUK3EvlBrNTcXnbT
	 7z09EUcEoVCE7mBnodKyKE2o+K5wH5/KczjAanUPLTY2XtWTgGFLRgzOPKkDnwcWwU
	 80UjqKf6bQX4UL429wX2f0GLmi2o9mjTKqCwa75zNE6LI5yei2D6x3zwR5lbgCSKUK
	 R4tQCIDmPSq4GkLpxha3l50XltqVkq9FZWe79CyjXMwvgFinpHC9nyrgwanKtlCot+
	 EUd9jgtJYiEc2Iu4Qd02TF3m735h7nG3SF0GCjpHuorsNGBGzGmBD1zIUwiNUFGsgv
	 Gm69R9q8Z28kw==
Date: Tue, 29 Sep 2026 15:56:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Roper <matthew.d.roper@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the origin tree
Message-ID: <arvRqS8-Jivj4Rim@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EM5IYsxxoGxu3xlg"
Content-Disposition: inline


--EM5IYsxxoGxu3xlg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_wa_oob.rules

between commit:

  cc319238e3f66 ("drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms=
")

=66rom the origin tree and commits:

  d1b210c045f70 ("drm/xe/xe3p_lpg: Add support for Wa_16030224309")
  9453c528fc909 ("drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms=
")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_wa_oob.rules
index 3001155f8d09e,f35181fc4e49b..0000000000000
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@@ -14,6 -14,7 +14,7 @@@
  16017236439	PLATFORM(PVC)
  14019821291	MEDIA_VERSION_RANGE(1300, 2000)
  14015076503	MEDIA_VERSION(1300)
+ 22016122933	MEDIA_VERSION(1300)
  14018913170	GRAPHICS_VERSION_RANGE(1270, 1274)
  		MEDIA_VERSION(1300)
  		PLATFORM(DG2)
@@@ -74,3 -75,4 +75,4 @@@
  14027054324	GRAPHICS_VERSION(3511)
  14025941587	GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sri=
ov_vf)
  		MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
+ 16030224309	GRAPHICS_VERSION(3510)

--EM5IYsxxoGxu3xlg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq70agACgkQJNaLcl1U
h9DKKQf+Iex0L+XMWa/tS9hDOOTcSz7mYINZa8BJBc1uwtU+hlQAFticRAGIzUt4
qxwLVLpNaSnE5eArj/CpymIY4hwPvTaM5WcekAfRWDOXyWr+wQ0tMwtX9B1yEySe
vHuvKjciYmbe6qr75KoKzi4niBlwr+RJ56PkhlOuWq0e9mv3FLfwFluv6yzNCmZ6
sG1bD5uSRiTpGF2UU3wXu0kyfZdwsYF/c3U9dZjnFcoQEijAH8M8zUv6qOAf8bAJ
PTUTo/PAPEDBtc6NpxK+Na3m7KN0QhUWXmznpVdal+jZJU35BO2nj7UM2ADo1f6i
Byu5oBkSSTq8CUYWnCF2OiYRd46Rdw==
=v9Tb
-----END PGP SIGNATURE-----

--EM5IYsxxoGxu3xlg--
