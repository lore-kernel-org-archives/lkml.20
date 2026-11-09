Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235444;
	b=5ibBWGP1HHmGN498bjnt9tGIc95ln0SLvh/CkHYCQHeCC4f+uJ98XORWjQx9czW2Xifz
	 9EVeIdkMdjHG31D9jdvvLDzDVENGNHZwZmOY99p9k/TiwmxdCWXtYY1dfsdNQlx9Xwg0y
	 63PbblmNYXExHMgcuevmqFUIGTIRFTaCPChh05lINAXRpPa9tiWB8mDR3gTxXzv1R86Wr
	 3/LxYQrFEga85bcBtN7HfC+Kz0voOVeIwLWS59Yl2Jx6L2FviFJV/i08BELkawVY1UJ5n
	 uQ/PowOFe1FKk8goR+kxInUDv7s8BowdPcNp6Dhx5akU5arzbjqdMT5VTUkIaGmkR+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235444;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=4pMvd1l4T13uSfMYfT1jWLTbI72Rr7AzPKNwi+AYM5w=;
	b=WNTzAbhjGo8Ncgcxo1ZAanieBc7bl/Jd2NRPnW1KH2KB+rGU4L2+7LgpcLXgsuzLxKBv
	 EQF3irk75DHrXrfEzbKq56qf7KgKVoCMKZBAnnoEeTMXEPR6b48lSYj6GOhwAYnWBpi8f
	 BHGcQM3+Z52+w9+DOlcvzNSgKrqeRmkxzlUKw5/Ey07X105s+Kg3pX+mquGaswlR8aAFa
	 Rq7zKl7zvh4FFgZPjs2Fp011AybUe05BHEzj72CjN+6TabouM/NPZTgG5wwNUIfx7T3Gt
	 UuJi7CnCdgXcloa+Uj0rms1gAFSpvHG26fFG7WLPS4w5YuXqPV+2xKXH7qY7nUPMqlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pm5tDzYV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC568606D804;
	Mon,  9 Nov 2026 14:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pm5tDzYV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FBF41F0089F;
	Mon,  9 Nov 2026 14:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794235443;
	bh=4pMvd1l4T13uSfMYfT1jWLTbI72Rr7AzPKNwi+AYM5w=;
	h=Date:From:To:Cc:Subject;
	b=Pm5tDzYVWu3+Zuy3MeOG9GapBMLVFbCr+/tXW7Gqn2AP1Lbc5oL9vMkfwZQnkfleS
	 6FpukMbHQpSAEeg3HQAuHNRwasdRKX+v9qJJucFv3hStZ79Od0Y1PhF0fTj/WoKyjT
	 MQ6B13Tx6H3TemOUbAVPOTKQOK1y7g68xRZ+x2oi4vUOcfjdqgLVQxc3SxB/IiWcda
	 OJIfnCd/4DkgLsF3wNdNKqjL29O2FXzcKDWsx5qkm49wWUKnaSu7hMqqBt8F4EHjTB
	 NpOzgSdRjNxcnC4m5pAfOxjyPPi0DFecv/z7AEPC7gd8iXMWQqskgK/3Gjq0+UVsCR
	 WVykTCm0S8Oig==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C3A7E1AC5995; Mon, 09 Nov 2026 14:44:00 +0000 (GMT)
Date: Mon, 9 Nov 2026 14:44:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: linux-next: manual merge of the gpio-brgl tree with the origin tree
Message-ID: <avHcMEBaKg7ms_44@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="Nqj5qEduRwNrTKPJ"
Content-Disposition: inline


--Nqj5qEduRwNrTKPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  drivers/gpio/gpio-mxc.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  569d0a6f57fc1 ("gpio: mxc: use local dev variable")

=66rom the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpio/gpio-mxc.c
index 7dabe8073dc65,1fdbbc9617aa9..0000000000000
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@@ -425,7 -479,7 +479,7 @@@ static int mxc_gpio_probe(struct platfo
  	int irq_base;
  	int err;
 =20
- 	port =3D devm_kzalloc_obj(&pdev->dev, *port);
 -	port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
++	port =3D devm_kzalloc_obj(dev, *port);
  	if (!port)
  		return -ENOMEM;
 =20

--Nqj5qEduRwNrTKPJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavHcMAAKCRAv73Ows9A4
ibeCAQCKNi6klM7Ngx0PM4SjvC98l7M1wzCv5fYPbTL9+4uq1wEA1eS2T+bQUk6R
q987JsXesQKm4q9kp5gdZtKMZ9GAgAM=
=37YA
-----END PGP SIGNATURE-----

--Nqj5qEduRwNrTKPJ--
