Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19EC483824;
	Wed, 23 Sep 2026 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158696; cv=none; b=uOBUvft1e6+f5kjrVzkMvpS1X98/Zd1Khtlc3R/+zRhK4g3H3QEWCV/R1oGQ+Xl9mZue+zdk5KOrA70v6FDUh6PH3pPTIDsprCOvafl5WYnLndQ6dAZgCfqg6ZDqNpFbEirlK+TG+J8Da0865S2fqXrVXvj87zThettjPl1Qo70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158696; c=relaxed/simple;
	bh=NHNWUv5Rvlowl+RoVbHsX1NXi30b48qAp5s6yWSVI3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YfxgVXZ+4VgA0p5QDuc1pRuNJFZAGoD2NGZxGxFPyDi1s9GqQDEi1Vs75AWp7bqULEbXqk3VI39UOj4SGBXGaeKxHeTG8EW9BWMB5Uqub5cdzPudewhhNlKoXuR4N1QOkgG9d2/XuhbtE/40NItEmzH+zthZ+NzQLyZvI0izKNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWTJv/mO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWTJv/mO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37601F000FF;
	Wed, 23 Sep 2026 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790158683;
	bh=sSQf3GnGk95QGHC2vCDC4Wg0FWBQeiZTy1pxvzHNVF0=;
	h=Date:From:To:Cc:Subject;
	b=gWTJv/mOSTUCaRKBRzp44tqw1hWoSLeq2glGWwGNOoIesRQmXDxrfuzr61G2mhAH+
	 clUjrcC9GVWHdflMNz+i9mrk+JMP5Y85SzzBlpUpQz0e7KuHEU1nfTZwu2y2IzypH3
	 Jr/22zc8YDyJW4ZErjAHCuZ1J+lsCWgV8EVziimttpVinwFloVFu/rDMWvwEZsPiww
	 RMaYVsFgFbQOTdpij59otEeKoL2khbkPTG2wCSxGeQ4MED/hqTRZogi9OKywjzzEfQ
	 +tYW2cFBH6iwB6uHk8khgaOWT5GTrsBInp44rA4xQbFIDj8gnPlh3fV8QxAovR/QPR
	 FNyStnezABUAw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 819DC1AC5738; Wed, 23 Sep 2026 11:17:59 +0100 (BST)
Date: Wed, 23 Sep 2026 12:17:59 +0200
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the v4l-dvb tree
Message-ID: <arOnVzMCpARSubSY@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PEVZy9aXfV3ySifC"
Content-Disposition: inline


--PEVZy9aXfV3ySifC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the v4l-dvb tree, today's linux-next build
(arm64 defconfig) failed like this:

/tmp/next/build/drivers/media/rc/rc-main.c: In function 'rc_register_device':
/tmp/next/build/drivers/media/rc/rc-main.c:2021:38: error: 'struct rc_dev' has no member named 'lirc_dev'
 2021 |         if (device_is_registered(&dev->lirc_dev))
      |                                      ^~

Caused by commit

  37efd09ba2c62 (media: rc: Ensure registered is cleared in error path)

I have used the version from next-20260922 instead.

--PEVZy9aXfV3ySifC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqzp1YACgkQJNaLcl1U
h9AnQgf8DZ33hvZQxNcHjhpFh7LCykzmpPFoBhYLVtjs//xAyI3CtO7h1WT19J7E
igaZj0Wb0bo67D0GeS7/wJ+p6exkEVn9V55QiHhIo8ILd/T4W8HXvHKJPv6xG32H
AmX6HjHSpN5LIe2Q3YDgjMrmF52LxESLBSx5L9aQ3JVijcuMC1xLYYhEsYLF7uvI
W+WltOcjV4PLpQWDkWVuHBBHVsV3kzPrzcKWv3Mw2bG0239qKg+oLyoeSg++M9d1
Ej4/yqj9hX1IGCH/jb3z2NuF98RvUfprJuVPk5nUpTzrL8/4cMgZdNsnEh/rpYee
Ao0ebViTodCkSWMwSkOoRdTwO592pw==
=dG9X
-----END PGP SIGNATURE-----

--PEVZy9aXfV3ySifC--
