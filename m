Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588041;
	b=om1LcIdwtC6pDhHdnJv6FhkxA9MnHpGRmyJx/GiuSLDdTnBvehwTvaK1GIfMfE2+G2wJ
	 O8ulndvQUVoZkO7a7PUKEdSR7dvKZrNae0vAcTRyJMYs38bwG/P2n26PGjVVu309WnNhC
	 vNpvXdtE/CIo/1+jippsm6gzT+kGBam70CXR+wChakvOamM82Kv/fP67Mti2geBmvcXZN
	 IfePQNyES4QrhS6XFJAfcaisVToZMjuNZbTiWBYntjs5Rig7IdAMqn8bXMMMFq4X210xh
	 Fy/cVQBDKJI3eUwf5CBAo0oV+P9yp4F5Gf9zmA8ac1DYX37WaCreBeYWKz7sRcdBcXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588041;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=85964OVloL+1j6FH7vvajKsfPug+kiq7TaGh13chvfE=;
	b=RypMXg4iJmaT3MPZiwgsw8JRsgP0Xannf28k3KuB0DWyHjbnJPINg3a8bAsT1HRizgsd
	 pDjdwXtf0GJspljUvUl3t0JkwLi6NyXhpbMxpgde84G80a9PR4kjzpcJguBV8IXrWztUr
	 wUVJV8XhsiJJEnWx7PG1xe/Bg7ri2hhcpzMyA2ab7hu9WzRSUT6B2NL0B5dXj77i+HU4h
	 FGNVm2824zrNymZBsLmTiIJb+eVrul489IU5v+3Ij2oGVCb7zUf2rs8pl3CC9uG4mZyFl
	 G8T6UhHp2h1VpoiQBpFJpK6xl/rU0ukJ5bxXwpXfLbSmBqEmFXOGiklg9DcvTc9VhPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTIpiyQ4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868786070236;
	Fri, 13 Nov 2026 16:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTIpiyQ4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B347E1F000C9;
	Fri, 13 Nov 2026 16:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588041;
	bh=85964OVloL+1j6FH7vvajKsfPug+kiq7TaGh13chvfE=;
	h=Date:From:To:Cc:Subject;
	b=UTIpiyQ4lZDjNnyT2JviYdtwrDzpHR4YRwjqsorhb6a0HIz1r9ZLTaXjktgHE82zK
	 4o+EzBUBPLhC9QLMh/4ZYqCQo45ngmW2poPs+ZsRgQ10UCfEv7+8jZTvk1myDRODKd
	 XVweza2bOAANDeR6Tn0MjY+q3BxUXfn50QoxkBXBgtLe/7JQulD9aDVbtsK6G33h8U
	 byYP8jw5hJfpxAL1aXE1EBR3bJnrRORnBENhiIfq8qmxYpMnZ49XW0A6NiV+D6JZDy
	 vhb7KKmo/ehPkG7uM4ZxqQldDMOPtYI2ibWqdJoiHDGtkdESfMruU8JH41dxOeA1wa
	 UMCF7KI3kqN7w==
Date: Fri, 13 Nov 2026 16:40:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Chang Yu <marcus.yu.56@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: linux-next: manual merge of the iio tree with the v4l-dvb tree
Message-ID: <avc9hVyv0ldmYFmK@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="ZBjj7nrf1+GAUFsB"
Content-Disposition: inline


--ZBjj7nrf1+GAUFsB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  MAINTAINERS

between commit:

  644428ae65c1a ("dt-bindings: media: i2c: Add Mira016 image sensor")

=66rom the v4l-dvb tree and commit:

  bdb0e2d5271b5 ("dt-bindings: iio: light: add as7343")

=66rom the iio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc MAINTAINERS
index 8b93281252d75,0017755f593bc..0000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -1511,22 -1490,13 +1511,29 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/iio/light/ams,as73211.yaml
  F:	drivers/iio/light/as73211.c
 =20
+ AMS AS7343 DRIVER
+ M:	Chang Yu <marcus.yu.56@gmail.com>
+ L:	linux-iio@vger.kernel.org
+ S:	Maintained
+ F:	Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
+ F:	drivers/iio/light/as7343.c
+=20
 +AMS MIRA016 DRIVER
 +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 +M:	Philippe Baetens <philippebaetens@gmail.com>
 +L:	linux-media@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
 +F:	drivers/media/i2c/mira016.c
 +
 +AMS MIRA220 DRIVER
 +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 +M:	Philippe Baetens <philippebaetens@gmail.com>
 +L:	linux-media@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
 +F:	drivers/media/i2c/mira220.c
 +
  AMT (Automatic Multicast Tunneling)
  M:	Taehee Yoo <ap420073@gmail.com>
  L:	netdev@vger.kernel.org

--ZBjj7nrf1+GAUFsB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr3PYQACgkQJNaLcl1U
h9BbiQf+PoFSZmJ+GdVKV1DSAeoJhRH1Qp9Isv4TOp2qNBfIeALQ1X3t5WFA8fe5
GB5dR3V3X/4AK2CXzPLHajur0FuqN0zNiIo/kgU0GNv5azK9AM6BXtk2ZVjZZ+Bq
IgCRoQujNUw2mipBf0a3Hv+bm+CQYw2o+/wCmXmJzGmCCFVOl4cEvypAdtxVqQ7s
QErmy6ZJYxKHu1x1BSlXsmToHY0DE1P/LifIrtPLWQmRn+dXUNcC6moKjYwcS6Kh
A9wQfdMMFmXJRJMpIdqPqC3frkreCgtE3PJ8jxo+q8/7RRS90U9fdvvL9uPyhGfP
as6S6TnV/bBc3Dym/3nTgBeqInMSEw==
=rBfe
-----END PGP SIGNATURE-----

--ZBjj7nrf1+GAUFsB--
