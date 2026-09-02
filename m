Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A594746A5;
	Wed,  2 Sep 2026 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347762; cv=none; b=ZO6DLXDw9Ar8lTs1r9hURT2F5aiTqfE/WeaO98TAv9PjNDNZ0MEGT0GWi1XK51RipcOQRMjtH/HDHlW8dYCZY3Po0JGTT2QX0RUKKWeAfodZA3olndqmUN/RqJrdV+3HrIFEvIXSVtqd7YaTmZWC4c+eVJavdOS2YebN1fK+GzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347762; c=relaxed/simple;
	bh=qO0JSqEnaw3NQ0HT/ifHcSIk/PbQ7/5NdCjYIM1+5Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lbFKnXSTGNuk4h9OWu7uzBZ683RmBoXKXIB+oq5tHXgr674ADghn57Vaku87za3OoVVv1kwAIFJNvmTHKcWESuYEMfu/fodVXq4cu3Y3/U6+wOrMUBnjiTRh7Im3uEir5nWU3AnpYE2PEdga8NQnU/pgt+01V5Po50gR1I4gmBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORAALdh/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORAALdh/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6106F1F000E9;
	Wed,  2 Sep 2026 11:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788347760;
	bh=aeRD3ywJUECUlXVCLyuC7bwBUr6JawehwETQqIDzBfk=;
	h=Date:From:To:Cc:Subject;
	b=ORAALdh/9s9IP3bPlLRuxF/rEqsPa1nTTMuuIffYJ3qOyncgcLSqAU31jTApC8FOK
	 Pn9jtOFMsS2O8wXjNtFDO4aXGB+vm8PJZg/f7wI0FaUu4h/HgBsgf2oCms0F0q3uQx
	 gz6XmlFdSQJ54oAHbKPbAnZg74It/tMEpw0HPz1NTSEttIcwlkxVUSc0pzDBy0SDIr
	 CYHwWfzGZbPi3VsPeRIeNARiEGyZ3aWNFlCuIf2IyGFzNtRA6WEDVaHjd1XtCyIHh8
	 DgMjVQxE5mMCL/P7TIDrgQNHLWhL/khg7FhMp3qRztWuCpKPzLGKdBA9Iorh2CdWed
	 OT6kp7dFLAkgg==
Date: Wed, 2 Sep 2026 12:15:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iio tree with the iio-fixes tree
Message-ID: <apgFbCBHGx5yIr8G@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mIoDeAbW4T+ph3Ma"
Content-Disposition: inline


--mIoDeAbW4T+ph3Ma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  drivers/iio/adc/ade9000.c

between commit:

  88fda1ed51a57 ("iio: adc: ade9000: request interrupts after powering the =
device")

=66rom the iio-fixes tree and commit:

  b8104703a1a84 ("iio: adc: ade9000: introduce chip_info structure")

=66rom the iio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/iio/adc/ade9000.c
index da6caabfe2a41,fd1362a980523..0000000000000
--- a/drivers/iio/adc/ade9000.c
+++ b/drivers/iio/adc/ade9000.c
@@@ -1724,21 -1808,8 +1796,21 @@@ static int ade9000_probe(struct spi_dev
  		return dev_err_probe(&spi->dev, ret,
  				     "Failed to get and enable vdd regulator\n");
 =20
 +	/* Request IRQs only after powering the chip; the handlers do SPI access=
=2E */
 +	ret =3D ade9000_request_irq(dev, "irq0", ade9000_irq0_thread, indio_dev);
 +	if (ret)
 +		return ret;
 +
 +	ret =3D ade9000_request_irq(dev, "irq1", ade9000_irq1_thread, indio_dev);
 +	if (ret)
 +		return ret;
 +
 +	ret =3D ade9000_request_irq(dev, "dready", ade9000_dready_thread, indio_=
dev);
 +	if (ret)
 +		return ret;
 +
- 	indio_dev->channels =3D ade9000_channels;
- 	indio_dev->num_channels =3D ARRAY_SIZE(ade9000_channels);
+ 	indio_dev->channels =3D st->info->channels;
+ 	indio_dev->num_channels =3D st->info->num_channels;
 =20
  	ret =3D devm_iio_kfifo_buffer_setup(dev, indio_dev,
  					  &ade9000_buffer_ops);

--mIoDeAbW4T+ph3Ma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqYBWwACgkQJNaLcl1U
h9DZTAf/WwUXN09/j4n/VVFKZjkS9qwZygMnFYYij2coJ4TzE/mxXOPfc5Tq0o/K
NsU+gSrOrO+H9DhwebUW7BfutYapxjItmkrgytJDlQp2aCZ3TX93EtyJslWukMdl
LTPhQFBF/oNwfrdPjoK8H/zauzAM7Csky1K5M+CnRXTLGpyWQoNiAUjUkuuX0e2V
Gxd98lHy1nsG/MVpSQOFeDgAExuEWrxRQWAZnK/V6+0fMKe7KnWQJD3H1/8nt7PW
HUKkJsQGhyd2bxp4RJFuEYOWgYsOQmD48lEpWRfjDIcjp31tlHDA8dMP5RQ+CljP
1RVsb3GH472iAhdTz/3I8zZT5mE/xw==
=Dqo/
-----END PGP SIGNATURE-----

--mIoDeAbW4T+ph3Ma--
