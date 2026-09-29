Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F7D51DE01;
	Tue, 29 Sep 2026 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790693854; cv=none; b=JqIjvH0D+yP/1xMSq+aj48eZuv+4IQt/4q+ZSPfwgDJICuYN2RVSDlEk44uQPtXjTRMxoXNoq29e4dffgSm9kgOK9Gmu1pY7eTQF45JZNA/Naa5hr544Q71wMxgmz4EBbRkEDN/nIbb8lBRmedqPEmCYTwwWkYoZjjjFuWj3jD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790693854; c=relaxed/simple;
	bh=oGxVQoFHRztxIteZvcXsim6691bzBKxm2/431KDfBV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XamDDLtmaHLTsgSAniGJ1gdqhGOnBovu1PSpm/KWW0BHF095xTyW+Hd0MHVn4hadz9CRbQohjyEu+CNKUL5VcrOpEynbmCwm8K8Bah8dCM4Vrar5aKxrTV3ubYNWEIgyYKB9NGGT8AxI1wluL7kd5Z9i0ICLZhb9XBp2hP3YYp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XoWzZjTP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoWzZjTP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33351F00898;
	Tue, 29 Sep 2026 14:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790693826;
	bh=0tVQrgQ+88nslv9N8wiRLc5XBM+MlEB0DNZcY68advo=;
	h=Date:From:To:Cc:Subject;
	b=XoWzZjTPp43B20D1S3UsBjh+F+CjxBTuJE0Xs0Ja1dekyqWFhmXswBHmuKDPemJ3u
	 gxLQhxXhOaakFxNsDQAVVXYbI2JxQRJ2xTNwdcffYjz4S1V9q+qbYgROaYYzBj6cu4
	 CzsPrV4hGM8Wj1xAbyeSpQer5l+2Urosll8xEyim1Zh6TYUeiP81y9kbPxLpWcJi48
	 ds+TLLgDngIJZiEYzBPScKmXRnJqkHhZOJvtlFuLpVB4VQzgL9SoEatP8YK7WBq3bA
	 XnQeoDxB2ZyrNnWLPDxQUuC78K0icZZxqSenDe+ZXwXs1bcjEc9JLpvu/GGcSqVbPq
	 hLKF/7+VUMIwg==
Date: Tue, 29 Sep 2026 15:57:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>
Subject: linux-next: manual merge of the gpio-brgl tree with the iio tree
Message-ID: <arvRvrekUA3zEhYv@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eVBgTxCms6nxkWSz"
Content-Disposition: inline


--eVBgTxCms6nxkWSz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  MAINTAINERS

between commits:

  02f4bd272bf7b ("iio: adc: add Axiado SARADC driver")
  a84f9870c16ba ("dt-bindings: iio: adc: add Axiado AX3000/AX3005 SARADC")

=66rom the iio tree and commits:

  a7787b818204d ("dt-bindings: gpio: add Axiado AX3005 SGPIO controller")
  dd36a4b7f391e ("gpio: axiado: add AX3005 SGPIO controller support")

=66rom the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc MAINTAINERS
index b6400ebe7d2dd,9aea4c3fd3aee..0000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -4487,15 -4439,15 +4487,24 @@@ S:	Orpha
  F:	Documentation/devicetree/bindings/sound/axentia,*
  F:	sound/soc/atmel/tse850-pcm5142.c
 =20
 +AXIADO SARADC DRIVER
 +M:	Petar Stepanovic <pstepanovic@axiado.com>
 +M:	Akhila Kavi <akavi@axiado.com>
 +M:	Prasad Bolisetty <pbolisetty@axiado.com>
 +L:	linux-iio@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml
 +F:	drivers/iio/adc/axiado_saradc.c
 +
+ AXIADO SGPIO DRIVER
+ M:	Petar Stepanovic <pstepanovic@axiado.com>
+ M:	SriNavmani A <srinavmani@axiado.com>
+ M:	Prasad Bolisetty <pbolisetty@axiado.com>
+ L:	linux-gpio@vger.kernel.org
+ S:	Supported
+ F:	Documentation/devicetree/bindings/gpio/axiado,ax3005-sgpio.yaml
+ F:	drivers/gpio/gpio-axiado-sgpio.c
+=20
  AXIS ARTPEC ARM64 SoC SUPPORT
  M:	Jesper Nilsson <jesper.nilsson@axis.com>
  M:	Lars Persson <lars.persson@axis.com>

--eVBgTxCms6nxkWSz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq70b0ACgkQJNaLcl1U
h9D6ugf/eC41nXR1VqL0uJygwpGp48jk+/TT6w9T8NLm5Py54SY9Ry8LEpSGy+b5
GrkJAlTwjjqVGBS4LmrHKySpOA8OTJzj/Eo/bTcw449cuFF27xu1/54UB8Ca0K6m
G2S/Tp7OSr5VKSAH2nEabAh+eg+Vyv2CVMcgk2XvRARiQWKTqe6DGK2S4qBE4UkM
xWGuzpAUSE/yD1EepAulPhwxP93cclgljl4nlMwzh3kpUGQX/KfSW8xYjilZ+5Yp
r+PdKYhH40IgyUw9eoT+fKOZuYzZQmvZsJIo/xxD6cYyZIUlMMNY/w5QIFfILU7g
VbNa3InCK1aUIXtDkS4iX9mENmgmjg==
=CeRl
-----END PGP SIGNATURE-----

--eVBgTxCms6nxkWSz--
