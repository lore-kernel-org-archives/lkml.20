Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632933BB134;
	Mon, 14 Sep 2026 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403140; cv=none; b=nqNz7fq5xG0KwtUYx/0zu28FkargirI4CY50WBN+IEOkjGRyXYZUsJW1GPSR8NW6k+McFKulILW+53vBkqIZe/V5u1wvdImyC1GcFsGVTEZBxklOtIxlTktTAN9itD6+QqFzY7jRWRu2RcDrepSxw3ZDqVTMLWdxpDWBIjb/fiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403140; c=relaxed/simple;
	bh=ppzjt11Agdtnj+fFbMkzaCpGwrMS0QeKPR2E4bmLCbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OfJjgrPfA6+NPMPpJ/D//cEvFdE3HEav6dSNbN6sBCUUOUttfx+xcktrE4GDVfwicxRssmEKV1pFYOd2E0OGBj3Cy27KTc/+m7ewVuy2+PI6EwgfxDxz3oj+Nt2Ac3V8h/DhQbsf6ROt1r9UR2G9Bsko0nfAQNaVvUdsy3hKBVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CH/9oHPs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CH/9oHPs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90131F000FF;
	Mon, 14 Sep 2026 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789403138;
	bh=hXZOiy5R98VHFLV/v0mI1RYYDOsppahbWducX6vC+rw=;
	h=Date:From:To:Cc:Subject;
	b=CH/9oHPsg+RC1tkB9DmKATp6dfI57QAZqXzLv7M49ZLTL0eFUo0pB3d0Z8u7sj6fw
	 fOz3qsjpIv5rN2XCG78rXtUhG/jkR1j04On2Kw1HuOMP20IuVobbbRvDrjr7HASMyT
	 v6IAaJRFsJlbOSWFgWfhPv2VioZvUc5RjS98hMHhsqYItGzC4XSUPJPIPqlxSpfQi6
	 Wao3V+UZU/vawBAwxjolIoDNIPWuPTxj7A3MDNTonTnyo78XvQ0ckY6I4SbIIMZWvz
	 LarsoFtzCOJsowUIVDUQHJoRj2mx+OnNXUY7QtTh1YQ3l2o6jaRhlOsl4IrrNjN2sz
	 uUJuvMDXpATDQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D54A51AC52F1; Mon, 14 Sep 2026 17:25:31 +0100 (BST)
Date: Mon, 14 Sep 2026 17:25:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.3-rc4
Message-ID: <aqgf-6P5reFfRbAt@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LZLcZNk3fIsmIIsy"
Content-Disposition: inline
X-Cookie: My vaseline is RUNNING...


--LZLcZNk3fIsmIIsy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Things are starting to get busy again, but not in a particulary unusual
fashion other than a big amdgpu conflict that I totally messed up, you
should ignore my resolutions around that in the unlikely event that the
drm people don't sort it before sending stuff to you.

Trees being held at old versions:

  phy-next       	next-20260911

Trees with signoff problems:

  arm-soc	(missing author)
  arm-soc	(missing committer)
  block		(missing committer, new and should be sorted today)
  bluetooth	(missing committer)

Some of the Bluetooth issues got sorted but they introduced further
issues afterwards, I *think* this all ends up getting sorted out with
whatever rebasing thing they do.

Non-merge commits relative to Linus' tree: 5814
 6145 files changed, 320550 insertions(+), 91662 deletions(-)

Top trees adding commits to -next:

  652	amdgpu
  412	drm
  407	mm
  314	net-next
  212	v4l-dvb
  165	qcom
  149	sound-asoc
  143	vfs-brauner
  138	bpf-next
  113	bluetooth

Trees adding duplicate commits to -next:

  46 bluetooth
  31 amdgpu
   9 clockevents
   4 i2c-rust
   4 drm
   3 mm-nonmm-unstable
   3 drm-xe
   2 configfs

Thanks,
Mark

--LZLcZNk3fIsmIIsy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqoH/sACgkQJNaLcl1U
h9AGewf9GUpquIzPaISLxrJTHwojqPVjt3+PPPnLWFkjxf48nVaO4z/MhGwJI10u
6MtzDDZJOV/zI0BkivaK4WqyG0G/iQ8HodKINn7K4+sSbTnCg/l3y43WGKAmi9W1
u+SrGqUzG0CeDYmqC+9H9hjNR5HlU/cDsCnIhaGTeT5rQe9ocfIALXbf9evjnpCV
Jwm69rPMJuH7dh+AC9GzDwSYWeJ20YIQ3otQsfq3n/dGnLQm+qeV/SrfeoCho3wL
A/CEPbHe4JKPJaGZ/XAr8FEEKCrUqHvFzLeAGIQxoVlZoEzhdajWG8ffpITOivuA
xM1GZeStd3avU38WRxp6RlU5EkxEgQ==
=w+sC
-----END PGP SIGNATURE-----

--LZLcZNk3fIsmIIsy--
