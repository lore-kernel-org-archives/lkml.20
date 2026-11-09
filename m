Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233665;
	b=0OURvogIY3SDKzx9DqjBlv2m/FGehqh6FdOMflz3xHBjhbe0bggA8CqolckXdH9RnrL/
	 qD9/KSHi9hdETRy27u4WaIexbHZdJJCaaYNG0WKvXC+fjfduPfsGXAE5RLxccqz2g0+Pm
	 e3utvKRp2/ekQUPm5UBgeU5yuCFRl4lKCwuOwzm2kvaNCwd/erveJRo1W81N5ziwtuPo6
	 mW+2Li0qAW3+M6Qjq5Xn2Cmn91rhhf8zrtr98plf1+Wziv2blazbCsxT7xtGtTXibpmtV
	 mh4UXM9GI3trCg8rp5ueiJaWG2Y9nNw6Zuh+QlTPLHkY5UXBxyzPTMd+grfbIl54wsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233665;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=C96+dXNmms4Zhps4PH/y1q3yGKc3QpG2tEzWg+asa7o=;
	b=Ehm+uC+nWfjENBxahVm8Gyxf16EdxPakpZjg+FaKqcTgsAWMckYnLVrspR768fEoJwEP
	 H/o3NcLqskqU2Qa2KYsD+1izwuLHDs1MILo+QSvftSHfGU2/7Fjbq6W8kVSV6l1xeMKrm
	 Tc0WnTnZ8gk6PAoBDK6Ypz8WoTPg/jDqKFJ7jcG/rHrpKKaU4WPHQhA7lK32g5rSwb/Et
	 iZB4TouGgJPh0AAufT7rJZpUrL85q/G1EQSuZaHNkhlQAJbqgXpFgvf8sa84Jc/d+4dGS
	 jFT3asPzeXvgb9Ups7vp1mkmrREqrfHg0hdGGucHchuXdn1vFy8H+wU1buUNt4ePV3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D/dAGBWX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099FB606A322;
	Mon,  9 Nov 2026 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D/dAGBWX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B5D1F008A1;
	Mon,  9 Nov 2026 14:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794233664;
	bh=C96+dXNmms4Zhps4PH/y1q3yGKc3QpG2tEzWg+asa7o=;
	h=Date:From:To:Cc:Subject;
	b=D/dAGBWX/cSWMj64AVfO4EDAJNvLRGmEpKf95Rr+PGMlAndMxvW6+cXRYLJGcmC2v
	 0HvqYzC/+nsnEA4vp/i7yyyKQKihia4XyVCxhB+dycBGRyGzG19HPpiiTlNJgJ7i04
	 2JjK3D31TqyO+i53+7odCPpWWiWhts3cV48oZ5R3cfTWKAkNwkRLsHItQejbnSB3uU
	 qp5KrmxinF4NXcK0qxzCG/6+YlUt6q7uUlcFcIvx3jTkXddHOhagr8wFBjSkm/6doE
	 g7fN16+pREaRbG33USTx5c+awHYHoSI/ZoZ9cxPkDUT84sbzPdiBNROcI9PLNgfl74
	 EAcMhKGQSNwzQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 8BCF61AC5995; Mon, 09 Nov 2026 14:14:22 +0000 (GMT)
Date: Mon, 9 Nov 2026 14:14:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rosen Penev <rosenp@gmail.com>
Subject: linux-next: manual merge of the mfd tree with the origin tree
Message-ID: <avHVPtCKqd_R1GpV@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="ZFiArzJusJ7KE1z1"
Content-Disposition: inline


--ZFiArzJusJ7KE1z1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  drivers/mfd/twl-core.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  88f84144a35f8 ("mfd: twl-core: Embed the twl_client array in twl_private")

=66rom the mfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/mfd/twl-core.c
index 88296178f77e7,e5b79c9ffbba1..0000000000000
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@@ -153,13 -153,15 +153,15 @@@ struct twl_mapping=20
  	unsigned char base;	/* base address */
  };
 =20
+ #define TWL_MAX_SLAVES	4
+=20
  struct twl_private {
  	bool ready; /* The core driver is ready to be used */
  	u32 twl_idcode; /* TWL IDCODE Register value */
  	unsigned int twl_id;
 =20
  	struct twl_mapping *twl_map;
- 	struct twl_client *twl_modules;
+ 	struct twl_client twl_modules[TWL_MAX_SLAVES];
  };
 =20
  static struct twl_private *twl_priv;
@@@ -770,7 -772,8 +772,7 @@@ twl_probe(struct i2c_client *client
  		goto out;
  	}
 =20
 -	twl_priv =3D devm_kzalloc(&client->dev, sizeof(struct twl_private),
 -				GFP_KERNEL);
 +	twl_priv =3D devm_kzalloc_obj(&client->dev, struct twl_private);
  	if (!twl_priv) {
  		status =3D -ENOMEM;
  		goto out;
@@@ -787,13 -790,6 +789,6 @@@
  	}
 =20
  	num_slaves =3D twl_get_num_slaves();
- 	twl_priv->twl_modules =3D devm_kzalloc_objs(&client->dev,
- 						  struct twl_client, num_slaves);
- 	if (!twl_priv->twl_modules) {
- 		status =3D -ENOMEM;
- 		goto out;
- 	}
-=20
  	for (i =3D 0; i < num_slaves; i++) {
  		struct twl_client *twl =3D &twl_priv->twl_modules[i];
 =20

--ZFiArzJusJ7KE1z1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavHVPgAKCRAv73Ows9A4
iRPAAPwMvdZtafsZS4CY2sTkKHqkFBaUiBd35Rmm8q0H5tTBqgD/REl5ah3nMUyS
7RH8ElzDsxre/WYMk9SLM6YFx3ZraAQ=
=6TSF
-----END PGP SIGNATURE-----

--ZFiArzJusJ7KE1z1--
