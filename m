Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89153E3170;
	Fri,  4 Sep 2026 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538059; cv=none; b=PueVMboI0tvvKQRdyT1XVJ802zIJV+cBHjxjTpAt5NrLBbJWyj/wX5EX1Cg0lFhkyX0FQqJ22mE+EKLa+h8WYbQ/0DoKTDm/JR0cbNI1BXVBrP6sYkahpIzXxQ/E6kJCyDalfn/u61BQc1OQrBxFFIw3rCn2NuyTPXaGtjNVvmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538059; c=relaxed/simple;
	bh=wjPZY6ckIvZ2WzodDNYKJX5bu5HEv+gussdncSZ6IuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yr6KQpo7smRddaf8F4LY+gOnBBuSWD10YBH/RCW8xvBlNye5sfcSyokPHKLHIkKHpF7rVCWqY0m8F/3xWXIXCkXHyqJrQT4Ga78Gleukb/ZG43CJsyoStDG98uusfde33xesP55PDpsGo2isWtcZOCmQkRCo1VVRbr7rjhSoijI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duUBJulo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duUBJulo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2154A1F00A3D;
	Fri,  4 Sep 2026 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788538055;
	bh=BgGrxQDzAPqL42IEi5FAkzfkYxq9ejqZyZH8JPDngFc=;
	h=Date:From:To:Cc:Subject;
	b=duUBJulobsEWzS0zHLjKDC9J+02zU/VY72rhb9i4lvqVL2xECqdXIbADeHFhMbgHe
	 vlFeFrYUlsxnHYav5Y6oHkPXf1dtHYR7xaFLJoOubrMlZY4I0opcfa+uNJwBpYEuMD
	 n2a45m9lDRn0n3KlvfGdhYYGPFoBZAc4syMyLYB/o4g/NH4dh2Dr5gL3OO0XKdN5ZB
	 HIJs5QG3X1ffEJucp8G6dtAcj11i0ffic7qfB41ySlB1SDQWquR9eJTpecNOfOiuMw
	 QAT82wDn8xg27veRC2OLwruYbI28lXpws4iA7FotKycyfPxpaOUMqEf9C5X5jCeJWA
	 lUDuTcPHQlSnA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C0A551AC528C; Fri, 04 Sep 2026 17:07:32 +0100 (BST)
Date: Fri, 4 Sep 2026 17:07:32 +0100
From: Mark Brown <broonie@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the vhost tree
Message-ID: <aprsxOlLSMtwY1bo@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I7eMpO9/g4QcSg22"
Content-Disposition: inline
rom: Mark Brown <broonie@kernel.org>


--I7eMpO9/g4QcSg22
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  e95e76481c61f ("virtio_console: Fix alloc_buf(.gfp) usage")

Fixes tag

  Fixes: fc220d6be3c7 ("virtio_console: refactor __send_to_port() buffer

has these problem(s):

  - Subject has leading but no trailing quotes

--I7eMpO9/g4QcSg22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqa7MQACgkQJNaLcl1U
h9CcPAf9GUiNrFeuiFUBmJaMlfliQvFkM8a6I2Za2uiVpNZkEW8Hweb+HdSOrnDM
u2z/oaij/60666DLoieaNj+3HmEhftfVDHbbY2P8kNEGN2ig2uoFgd83DjLrDRKh
VRDuovUU9MRz6bTn+LD7WmmLMNkd9raQ+wlXBGu1qQ2a9t62IkwDMgVQtD6HXcsY
UvllmcHiA3uk+pZLiMQzFjtRZuZLK1d3OjVXgRA8u6XTf8HKzccSPq3eqmE3ChNJ
xeKm47RTq5j97byUiX3yMHf+vGO/VHdcZeRJR//l5c5l4FEfZRtnhlILBy1QGYzl
kllzme2CU9h9b8QoCNoMquKx/nHSvg==
=HVzz
-----END PGP SIGNATURE-----

--I7eMpO9/g4QcSg22--
