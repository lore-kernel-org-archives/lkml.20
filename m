Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470604DD3D3;
	Mon, 28 Sep 2026 15:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607739; cv=none; b=lT4pVRHnPGG/Um5NxlDhGIIQwJLgWMlx5MJ5WbIxnRZgyCz2rX2+tXDxXE3oItZXSlUGuh1jW6GD0+2s0xwfbo1dZlBU71ePNkjWt6AiO/697YGWYzjeYO/H7psTBXE5TtBzvC/dxBQF0c/Ig2EiCOHOK8gEYZwVTjjgGcdhXZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607739; c=relaxed/simple;
	bh=Z/04pWrVi1fGzqP50zDaLCbCVoa9T8lbBQKGRe01BAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EHzkPaoF2w2szwtQOKbvcmjv6LQbc+GZeqo4TX0uN87l8iYFBI/9EC8Ij5mFIZPFvx+06AdhbAEEPgEiIvYqG9/vYlsEPgjlLtmS4nAGgKho89CzdWcjtkiV1xCi/4iUZfYEJVo8nDBDLwj/bctleZZk68EFCOQP9xQsFEx4v8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsJZPrQ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsJZPrQ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048C21F00893;
	Mon, 28 Sep 2026 15:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790607737;
	bh=o+RYx0LwUxB4xu5X6ZfI4RnbHaC/KSxRN9OcpFCW0oQ=;
	h=Date:From:To:Cc:Subject;
	b=fsJZPrQ0FEdm475h9ZXBFHaNGNv5mOpxp/UEntZ9kH89MdKWHl6ulry9vtAMDZE7B
	 QuBUMXFh9gllX55GzprCSvtUmAOv1KR1YOD6+lWXWpoLC/puZ4juY8jQNFsHztZsuV
	 PZh3etZZJ0N5b3Cgg/TZevsCpxK7SOrK6Ny2YT4+r0Ir61WcqH1+7CpluppfS9BiBh
	 qw8UQIAKdJGDtuS2PXpqvRhBg+gySy+0Saw9960NKw/lCTdi8lcvFo2sKeAK21s4SC
	 hZ1rvvyBKKJDaQKxDfsorJYmrDihHT9UmDJUFJqZuBVsq04MNqRuNG0i6hn5S/hLN5
	 YZHqWTOV+VVBw==
Date: Mon, 28 Sep 2026 16:02:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.3-rc5
Message-ID: <d21da1e4-f6ff-4a78-85ce-146c6bb4a9bd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/EuMvxLxrwjcNwVF"
Content-Disposition: inline
X-Cookie: All is fear in love and war.


--/EuMvxLxrwjcNwVF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Things are getting pretty busy as might be expected for this point in
the cycle.  There's currently a not especially complex but large
semantic conflict between vfs-brauner and security, vfs-brauner added
some constness while security added a whole lot of places which needed
updating.  To make matters worse half of them are wrapped in macros
which mean neither clang nor GCC do an especially good job of reporting
what's happening clearly and it all looks like a disaster zone when you
try to build before doing the sematic resolution.

No trees are held at old versions

Trees with signoff problems:

  bluetooth	(missing committer)
  drivers-x86	(missing author)

Non-merge commits relative to Linus' tree: 10427
 10844 files changed, 587151 insertions(+), 201979 deletions(-)

Top trees adding commits to -next:

  1546	drm
  674	net-next
  663	mm
  448	qcom
  337	v4l-dvb
  337	sound-asoc
  334	bpf-next
  263	vfs-brauner
  235	iio
  228	tip

Trees adding duplicate commits to -next:
  16 drm-xe
  16 drm
  13 drm-intel
   9 clockevents
   4 i2c-rust
   2 vfs-brauner
   2 socfpga
   2 pinctrl-qcom-fixes

Thanks,
Mark

--/EuMvxLxrwjcNwVF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6gXUACgkQJNaLcl1U
h9DMsQf+OqglCt3Zyt24XIFZJKMBhRQ7i1zCg5/L9Gs+b9WMrtpc9xkqzUjD1llr
gnMgLL2xnayNfrSogo4AqKS6yPx/IeBSLOzzY6rTNCoBQgVv6RbIsn92PJN41KfO
zOD0nERni3b4FWHyCs5dKubqMk7pLlUVvIHQX2i6UMuI1l8EmssIvEjvnUvo3DdJ
LCFXAnxHpdOwOEKyZ7twBXGLC40Ye0qiiCEAFzVcomJZ1/sRcZGyL0w8kXmNyf8K
L3n6IaLNOmkzJLolOY2yYFpvVt/rDUHx139cPCXjIZtGSwT2f8KxcW8NgWJdvXCI
6O7/WRhGcatTZ5aX+qk+RBt1gkOSdQ==
=lz+I
-----END PGP SIGNATURE-----

--/EuMvxLxrwjcNwVF--
