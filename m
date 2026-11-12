Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500682;
	b=abl4Vxl9AnusKfo0Kw7hAnhmBUgatHfk7Uzt4VtveA42bPAvvTi09cKf9vHsuhaxUIDA
	 Rvg+Gll9rxXjnW07bhJRGmhpob/ZdssjbvcrgLt5mSJsav8ZTXZKsEaLJyqAn2T2dOWkO
	 1yMFP4Ml8BKYof1wsOlFT+BPgLJg+ZbtMgVP05Dzkonwh03GuPCW6tSgNl7FOdNGa7mKx
	 Te+sdO54QrIcZQvbtt1aQlI5xvzLrqa59jcrOUJ6xsTJA2FxfgQRfjYQlMM5WrMnZLbjN
	 x+Otonu8uo+r9vHyy9W8a/yXnu6RrCbMK5PqpGkDhDP00+W55TbaktuLDPhnK2U6p+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500682;
	h=Received:DKIM-Signature:Resent-From:Resent-Date:Resent-Message-ID:
	 Resent-To:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=DT+h+JcnJMC5K+aI0iJBzII0VFDN5E+Q8ZUaJ7gUHxA=;
	b=zHDPj8Pemm6lXOUFtF8Ft0LNrAjKaA+89a2Xr/Ek2IqbQAkhaxu//S45pHyjEL90xFPx
	 M1jRgOHdbA/Nh/WyER9eRRX79PMJhO3jgMi/F+R8YDAsNF8RpnWFiKm54Hcruo0bDhpvq
	 jIkeqJ8wOaVT/tB3TU6kSYPjRCU3imRR4eBkOH3dWuYDcQJTzgzz28W9TEm5m2TYDwDgL
	 wq5W2lRdMuufefZTakpPT/RwBbXFanidfJesGo+pGSJC3tDoOufuVPznaNKgxKu1ADeno
	 W9dRwyIHStMKg+V82JqM/2fAFDVPGggJzEyTFTXCSCbLR7yWhdwbZ7xNt1RYjq1iKqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EdAFWECW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4AF606A330;
	Thu, 12 Nov 2026 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EdAFWECW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3168E1F000C5;
	Thu, 12 Nov 2026 16:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794500681;
	bh=DT+h+JcnJMC5K+aI0iJBzII0VFDN5E+Q8ZUaJ7gUHxA=;
	h=Resent-From:Resent-Date:Resent-To:Date:From:To:Cc:Subject;
	b=EdAFWECWyqtLyZwic21C1yZWLvg1hBrfhz9KEGhOkwdUd7QETLXkasA45VWe0Hllu
	 q4kKVJwohlB9ZnHhzvWK9GU2ijaCO7MfES5BBukCOfvOT9G/CEU3f3DulRtzyfSURl
	 wgh1cHhrn4Aw9b8CZ2joCwYz+WrpiZBfQ3Zipn5/VcMMkXt46u1smEAT6KiL2v52p+
	 HV/2+bSS2Css7PiwiuyPrfU+4O7CkhcGHbqg16d2++IGmACQWxg8Kb78yqNHfQ5BfN
	 Z/zt9kIZZCa75fAF+MymeWoD1ii2yJEQ7mS+5hi0jvvM6pGGIwAXYVvlDBXbW+iGvO
	 8xdsIX+aL264g==
Resent-From: Mark Brown <broonie@kernel.org>
Resent-Date: Thu, 12 Nov 2026 16:24:38 +0000
Resent-Message-ID: <avXoRl7VVy6qcgBe@sirena.org.uk>
Resent-To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Date: Thu, 12 Nov 2026 16:00:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rosen Penev <rosenp@gmail.com>
Subject: linux-next: manual merge of the phy-next tree with the origin tree
Message-ID: <avXijqnyZv1ALU1j@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="r8eKzl++w86RryZb"
Content-Disposition: inline


--r8eKzl++w86RryZb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  drivers/phy/mediatek/phy-mtk-tphy.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  6d4333dfb6057 ("phy: mediatek: tphy: simplify main allocation")

=66rom the phy-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


diff --combined drivers/phy/mediatek/phy-mtk-tphy.c
index 22273a4df9b25,e9b9e667b3195..0000000000000
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@@ -340,10 -340,10 +340,10 @@@ struct mtk_tphy=20
  	struct device *dev;
  	void __iomem *sif_base;	/* only shared sif */
  	const struct mtk_phy_pdata *pdata;
- 	struct mtk_phy_instance **phys;
- 	int nphys;
  	int src_ref_clk; /* MHZ, reference clock for slew rate calibrate */
  	int src_coef; /* coefficient for slew rate calibrate */
+ 	int nphys;
+ 	struct mtk_phy_instance *phys[] __counted_by(nphys);
  };
 =20
  #if IS_ENABLED(CONFIG_DEBUG_FS)
@@@ -1572,21 -1572,19 +1572,19 @@@ static int mtk_tphy_probe(struct platfo
  	struct mtk_tphy *tphy;
  	struct resource res;
  	int port, ret;
+ 	size_t nphys;
 =20
- 	tphy =3D devm_kzalloc_obj(dev, *tphy);
+ 	nphys =3D of_get_child_count(np);
+ 	tphy =3D devm_kzalloc(dev, struct_size(tphy, phys, nphys), GFP_KERNEL);
  	if (!tphy)
  		return -ENOMEM;
 =20
+ 	tphy->nphys =3D nphys;
+ 	tphy->dev =3D dev;
  	tphy->pdata =3D of_device_get_match_data(dev);
  	if (!tphy->pdata)
  		return -EINVAL;
 =20
- 	tphy->nphys =3D of_get_child_count(np);
- 	tphy->phys =3D devm_kzalloc_objs(dev, *tphy->phys, tphy->nphys);
- 	if (!tphy->phys)
- 		return -ENOMEM;
-=20
- 	tphy->dev =3D dev;
  	platform_set_drvdata(pdev, tphy);
 =20
  	sif_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@@ -1617,7 -1615,7 +1615,7 @@@
  		struct phy *phy;
  		int retval;
 =20
 -		instance =3D devm_kzalloc(dev, sizeof(*instance), GFP_KERNEL);
 +		instance =3D devm_kzalloc_obj(dev, *instance);
  		if (!instance)
  			return -ENOMEM;
 =20

--r8eKzl++w86RryZb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr14o0ACgkQJNaLcl1U
h9CGXQf8CTt4OAZJp+5t1FiG+e+pC9RbDx6okWHBGEs+5tlz/74wyt3MKX8obB0d
42Xu2sao6+wgnisHHJYeyPfoi/+vBCcwWh7COhI454isQq3e6romLohiU0B/yqh1
fy8TiPiyQjj5SCw5t4pfFe+U3y7h+ycRUCaM1psf9vCSgLdL6cnLK7eGIRxz7Mqm
yXISVJMlW28QSPTjTfRp8/kCGLNrj40drvlInSJGuDNCMqAhi64xiMP8tMpk0Yay
WHeFivjNk959FU4D0M/0RXPL7JB8fTVBWMOuvgibzpEen1i/2ycNf9dMcbkmmxZd
E7Aa0dRXDZYCkjGUC8JHeo3Zv9OftQ==
=S41h
-----END PGP SIGNATURE-----

--r8eKzl++w86RryZb--
