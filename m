Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B4551C342;
	Tue, 13 Oct 2026 16:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908810; cv=none; b=G8Go6yLVl6dnb+8+vW3v6L28jWvoiuphW5DnsBI1X8yS6D1YXkvkeCxt+NaI+tc+Oy8fG8ZVv3oOZ9Ccc6R03gUG8TikKveceChYBLmzsN+UQX4XbSo7VlvDirk42dBYO7s9yHBE+VJEVJuPZKExG4JHQaOHlmmeyrre/GCKwUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908810; c=relaxed/simple;
	bh=BWnAZjGBmc/3QRrip/3Tp3ARJU0S/eiP7mqEx4CdmXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JbkWdcRW2ubn5kBghUgu/dYLKJMaU1JAbNVEJgnkWHXlDAk2omcO51SGdkGWNbveVWrz0SzhNn+jdZg4CZS39U3jsdzuAEp+kjMws+kNtPoEqGKtnC8sIQZkOds4T0tqsO13JRPZfAvr7QadQWbAzf12ONIX6AjaLaNHWZQE1r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0Ft0sOk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0Ft0sOk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568751F000FF;
	Tue, 13 Oct 2026 16:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791908808;
	bh=w5ZeFBzeeHrpGDWLW6tw91Bx1moRTq17q5NJ5hYjjCM=;
	h=Date:From:To:Cc:Subject;
	b=U0Ft0sOk23TNSvbL1hV0NCnwuviG/S4zgflN1Y+HAplgAVeMXwWqWdu8ZT9n/YfYS
	 TPTnK6UEH0zFvveYkRGy/WJ+bXVG3/XejHxw+2z0s//xL0YwSskiLiM8ZeFsKJxD21
	 Ddvd2S8Lw2yFyZRF4YvykZhHLRBW6w0tdjNiTDm+Wu8NUFhNkuSk2sXBsXZcMYoPgg
	 AGWCVzOtXPti/FHbAZsiohha4hQf+j+1XX9ETui7QuKGzq2GUPO0YuX28Z56YRyTZC
	 d3pk6OxTfYzwYfLNiPiBTMi/Ckc6WPO1D39m9yZqaN62JZv/+ktDprJN2P5S2kw7zx
	 q0JKH+qYxqqUg==
Date: Tue, 13 Oct 2026 17:26:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: linux-next: manual merge of the fbdev tree with the mm tree
Message-ID: <as5bwyKpGQaBZ3CO@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8jHG3IIaNGIPxodO"
Content-Disposition: inline


--8jHG3IIaNGIPxodO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fbdev tree got a conflict in:

  drivers/video/fbdev/ssd1307fb.c

between commit:

  d4488917e79c7 ("fbdev: defio: assert FBINFO_VIRTFB, drop VM_IO, add VM_MI=
XEDMAP")

=66rom the mm tree and commit:

  81ae1f9a6c850 ("fbdev: ssd1307fb: check for fb_deferred_io_init() error")

=66rom the fbdev tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/video/fbdev/ssd1307fb.c
index db61d710fccb0,8fd96c37ee1ab..0000000000000
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@@ -767,9 -767,11 +767,13 @@@ static int ssd1307fb_probe(struct i2c_c
  	info->fix.smem_start =3D __pa(vmem);
  	info->fix.smem_len =3D vmem_size;
 =20
 +	info->flags =3D FBINFO_VIRTFB;
 +
- 	fb_deferred_io_init(info);
+ 	ret =3D fb_deferred_io_init(info);
+ 	if (ret) {
+ 		dev_err(dev, "failed to init fb deferred io: %d\n", ret);
+ 		goto fb_defio_error;
+ 	}
 =20
  	i2c_set_clientdata(client, info);
 =20

--8jHG3IIaNGIPxodO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOW8IACgkQJNaLcl1U
h9Crqwf9EfBq9M+h79zE3M8YllABJdGhO81wna/MBhOtWaQtjSLAp5bI2LojnSNy
S3jdKH2k3IxfVWhjCWCqm0+WMvp0arM+Vtz6lifx0X70N7XOVoBVK13t3xKcRMZS
gse0JK9EwFkaUcrPOHGHTYlP8IlaXDiYMZM6Mef4mm2hCkM/3Gd7AflQBWesXlYa
YNjFSLc0pA1OZeVIyD1EE3QO1dfLxTa1zWIhq3b72Leh10oEAN7AKGg8XiS/E8jN
QiR0cEtI7/An0P3cUu/EKXv4yxSqYh6ScpfY7MWm2baXhZzd/qFECRbkUcIerJiR
3vSWYOYUQX2HvGl1HpfyX2KxpJU7zg==
=eXfG
-----END PGP SIGNATURE-----

--8jHG3IIaNGIPxodO--
