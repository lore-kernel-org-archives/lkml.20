Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586050;
	b=RNHadItLwxy47hi5Upzc05nLUFAloyluxhkOTnAHftFTiYepSuD/QZSI+Ty+AkD/RRXo
	 axwadV1bSLp8xtkPcy8Vl5XUoJazdGVC7q7/NCzRbdyXJvx0PY/PnZPlrQ1KJ5UmzfkuI
	 gwghLESk/Fc8EfikHGZ/zv6Fgd+d5IHOs0O02Rz8ZZrxqfMlVHkL5f6tLjSSiz1aMJQJR
	 5iMXPf4kTjU/i7eJfYdnU3C2emjeQsJ2wuYQbvfoFVLugFklorHxKJxdOQS/JuzX0CCiV
	 bqlef3UlemO0/SejOCanEgbiMMf1uNhsII0715lXyJnf7djH4pDlax8HU9OGjT1q39g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586050;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=/iBZ3u+sNud50YlXfWvfxW62MEuwhiNCJBVGnC56KF4=;
	b=X6LVcmSj/wazrqTi1apjwhcDqXq190UYLdE872whCG2hQxXMprHeLjyOx+bXvGX4EVgH
	 Qwics8xjVRJonGPCkYE1/BGvPCBnUGJegsvPntrYFxdFHeKZZdKM9PyXEhBtaFmmvy+zx
	 Px/eYEyukoTC5bN4AwdkwnrYqD9MiB9y+jTR0Gd624wviq5lRqCq6OGUO/ugA0RWH7ZYv
	 u8QG/uE96IWutn7iqqInMZ/R4Y4allB0iWi0MZIcOkYkZzBqJyYuLjhEqFMUA5g6GZOB+
	 EeIl8mpmsaIjqwUVgPPRnVszL+Xxx56F0otdCmemKs8u3+5RlwrXZq4NHIjN0th6otg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RGcQR9dU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65796606B2E6;
	Fri, 13 Nov 2026 16:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RGcQR9dU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907C11F000C4;
	Fri, 13 Nov 2026 16:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794586050;
	bh=/iBZ3u+sNud50YlXfWvfxW62MEuwhiNCJBVGnC56KF4=;
	h=Date:From:To:Cc:Subject;
	b=RGcQR9dUVmiN8xHiKqCXSM6O0/04yS0laMKHgkPxY6To+sLl6f/CKxLidDdActjG9
	 66pI6lZBDzvfRYEpMPlDD+d1/JGOlsrPj4sm/JYP+Icv+e6dUNt5VIHdwMVqKYWrVP
	 8YlWBXvS7ZrxTztCpyGHovPkhtnBDE3lZwNyr2gB4boV8FIO5/z1XNvfBJ9G8OWgIB
	 1AnDxFkvxEP7Gz28lPr9Z1t9n+6XLENc6EaogmMLddUyDsUZDtmDaC6dibpy7RQgnt
	 Gqx0p7FPYG1CEcQ3reCqSXWuBlDHWsvmzy/sYiWqP1PYHtrt2fqY4zH1tnzj0Gxn9D
	 I5eazJ1P3RsoQ==
Date: Fri, 13 Nov 2026 16:07:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jia Wang <wangjia@ultrarisc.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: linux-next: manual merge of the drm tree with the riscv-dt tree
Message-ID: <avc1vpWDQ7V0vcRc@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p0NG34qYnRspDe7C"
Content-Disposition: inline


--p0NG34qYnRspDe7C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.yaml

between commit:

  f61b65abc9f41 ("dt-bindings: vendor-prefixes: Add shenrongda")

=66rom the riscv-dt tree and commit:

  b55dbe9011975 ("dt-bindings: vendor-prefixes: Add Shen Chao Optoelectroni=
cs")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/devicetree/bindings/vendor-prefixes.yaml
index bc1e6361c6941,7602034374d7f..0000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@@ -1529,8 -1527,8 +1531,10 @@@ patternProperties
      description: SGX Sensortech
    "^sharp,.*":
      description: Sharp Corporation
+   "^shenchao,.*":
+     description: Shen Chao Optoelectronics (Shenzhen) Co., Ltd.
 +  "^shenrongda,.*":
 +    description: Shenzhen Rongda Computer Co., Ltd.
    "^shift,.*":
      description: SHIFT GmbH
    "^shimafuji,.*":

--p0NG34qYnRspDe7C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr3Nb0ACgkQJNaLcl1U
h9DpCAf/Y4xT/0dtJqVo4aavEu2ovzUloscVMTC/Ca8dMaMH63hgW+5e4LKUSjjL
csc8BTOu1qwzelIVG9L+odvu36Wh4XjNK5cOKTExT15+HFkQdEVUazm0ROTqlr1P
N9W4sg2nj6XjvMYfW5WJnRpsNEEU0gnxMn9twIy+e6FdZq0xBbLioTmDKezN5mfn
4ouTgPv2WW2g/iaB/YP5nTBMBeiBQpIRzI28vh0tVqXizTwOgkZXQUajvYGVHxMN
xX92QbvU6oIcC4TbXbXzTVGvgdvvodHeAQhQbZjRG3dI8t9hYjMYlQ4sU3pZgLDU
AwhZMLFQFleeDMwdckFwuN+VfTSDGQ==
=/IPF
-----END PGP SIGNATURE-----

--p0NG34qYnRspDe7C--
