Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227538;
	b=msB3vH+m71VDnhnGRcqDm1ORlKUMGf+VVfpoHvniwqHDMw3r3Loxns97sfcWH9P9neyC
	 Ql2liWh6moz4WDJeLL+vtycQViB/FRixTdehjflZduR1Y5cnpePYq3f/3viSDYf5zNkg5
	 r37PJtCP0HeNr0bbi/42i8CLkMWIiu+iAYTqMLVsAMkV0olAs05pcJGh5ol5Bg9Y6ZdzB
	 rQEY2J0EadKWIvkSk3Au9ejBzAvHD5mGYIWwjZKdYpPppm3eGurNqIPmoKQu3BGoECcyc
	 M6jQpixQrKi2g7keM0zLdQkmWeGvMUg18EkvKe/TFCtuhFcImFJNrhd9LkjJqMNSCfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227538;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=rRahu7+ghGWvG/w1/MODNtWwwwbr25JxkuWHLv7mvl4=;
	b=pvyWJNhSAjdOPXix+y1ybJpjzYlzcUhcMVj57ML05eNZhM9ZtR2j4uThkKuE2gQx5hac
	 RWRyMJAYaZJHgXRk9k6n/s2w6/T+95vxCgjj7MACWmJR8QHKoBVCrVaI53jVv2meXTIDz
	 8K/Yq6MzI9y1M/9Llo54yulMEC+1AL7s4KOpCVrGUZ1FndkAbIZDSHZiAIyqKLaUWWS6o
	 zsw6vSFuklhJ3/SfW8YMWZqqEHFYAB9WD1t0yk8NtVDIZf/2Si0xzdGPQjORTnTRNqv1b
	 WzlwgVnriaogk0Pby1Gc+8nD1P4+xk5fiOcmoljEl6aHFeHPKxZNjWAfsJtfMwqaX/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TRAaarR7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F30606A331;
	Mon,  9 Nov 2026 12:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TRAaarR7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DEBE1F008A3;
	Mon,  9 Nov 2026 12:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227537;
	bh=rRahu7+ghGWvG/w1/MODNtWwwwbr25JxkuWHLv7mvl4=;
	h=Date:From:To:Cc:Subject;
	b=TRAaarR75p3tZFRKgt/Z5AKmOxaeZyEniyA1daYQVa8xnpmp26Nd0GOYWK8ub9ERA
	 V7kq8Wz7i3dNl8vwm/xubwEo1JP/Y+1igPo5V8RsZLuJaNxCLYvfVgI0uRtCh+oRct
	 FfxB9WtcFgvpJnpHGhR7c9dhSOzG8IafWaMCiudsgJo4HhNSNNmFzStKAeEqnFj9BU
	 cJTlNLydUOYC1jux6GCUOe4WSIicWeVNHdWNRk8M3QMI9gPNyCt6IdiinbttnGJJZa
	 BpowtOo3qmahMZrHGOqsEVg5GxrRsSLYyC5/FN5MWv2862y58tWTOaoj4PD+OIyvWy
	 /Sv92eImVuVaQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1B34B1AC5995; Mon, 09 Nov 2026 12:32:15 +0000 (GMT)
Date: Mon, 9 Nov 2026 12:32:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drivers-memory-fixes tree with the
 origin tree
Message-ID: <avG9T_NrXRjVDgjh@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="ujEC44Ov2VwRuRhw"
Content-Disposition: inline


--ujEC44Ov2VwRuRhw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-memory-fixes tree got a
conflict in:

  drivers/memory/fsl_ifc.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  a78ee2e05f7c7 ("memory: fsl_ifc: Clear fsl_ifc_ctrl_dev on probe failure =
and removal")

=66rom the drivers-memory-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/memory/fsl_ifc.c
index db2d239aeba89,83991c05a6a5c..0000000000000
--- a/drivers/memory/fsl_ifc.c
+++ b/drivers/memory/fsl_ifc.c
@@@ -207,15 -210,15 +210,15 @@@ static int fsl_ifc_ctrl_probe(struct pl
 =20
  	dev_info(&dev->dev, "Freescale Integrated Flash Controller\n");
 =20
- 	fsl_ifc_ctrl_dev =3D devm_kzalloc_obj(&dev->dev, *fsl_ifc_ctrl_dev);
- 	if (!fsl_ifc_ctrl_dev)
 -	ctrl =3D devm_kzalloc(&dev->dev, sizeof(*ctrl), GFP_KERNEL);
++	ctrl =3D devm_kzalloc_obj(&dev->dev, *fsl_ifc_ctrl_dev);
+ 	if (!ctrl)
  		return -ENOMEM;
 =20
- 	dev_set_drvdata(&dev->dev, fsl_ifc_ctrl_dev);
+ 	dev_set_drvdata(&dev->dev, ctrl);
 =20
  	/* IOMAP the entire IFC region */
- 	fsl_ifc_ctrl_dev->gregs =3D of_iomap(dev->dev.of_node, 0);
- 	if (!fsl_ifc_ctrl_dev->gregs) {
+ 	ctrl->gregs =3D of_iomap(dev->dev.of_node, 0);
+ 	if (!ctrl->gregs) {
  		dev_err(&dev->dev, "failed to get memory region\n");
  		return -ENODEV;
  	}

--ujEC44Ov2VwRuRhw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavG9TgAKCRAv73Ows9A4
iXrSAQC7lhzRjSUAy6EexCQyxrtvlgfatmNxcCvg/DJ7cxEsNQD/Rm49w5vdf1pg
XyFP2U49jvfQiWg3K2IFJlCoSp1WEQI=
=WFKt
-----END PGP SIGNATURE-----

--ujEC44Ov2VwRuRhw--
