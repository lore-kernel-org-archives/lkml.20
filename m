Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328921;
	b=uXzpOD7c+mjkdMVgwgAuSnTBaTwLGavgq+zVnemZtkPFEDsSM60FPUT2BYHRE2eW8n1C
	 MaKouCnMSoIjuTHI8AQhLY4/8iZc6hWwzIu8A4fzpweMbJBInQKMZk6YIJJ6VcA63Zvu7
	 EUT36pF3cMnSJ/Mr2vtYWRtfP0/wiB3L/De7UsGJD2gEiFGM/fJA9A0xZhygnbg/Vvux8
	 NafiQHkaP/seN2MFPwkzv7YkrwVjDxpFrzJbphv76LwzuSBs28J+rZqQcq7shvkwpNvCy
	 cub/Z4RFJUujKl+ca7qmtqHgMcROk6mTluFqrDYkq6VJEd/wZJ2Zw3fQH8hUKF98qkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328921;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=UPv8V/xrjWAZHw4u5a/y1qB3kFPHXgtDXw6QmaGaE5g=;
	b=tWiiRtqLBlXm+QZz4Yujel6+T/973udEbkVeSp1HjSlMwMd3Ww1QQNJ/5h+Oa+1uLUsU
	 Y2PjUXcHMMexZPobZzGd8UrsSiS1vdVvE4NWsbZ5wp5I+2555XW6bXHdSRf66UlXN6xRS
	 7B6RWyk404R94XO7/Bu81+uUub8ktfUQN5ApEXg0wxhmmReijSxvp8pLg9YyTz9/ebFIg
	 Wx9xCJhqLGsU6vVDp3mNXtXqSVXEMMWs3cpvMsNeXYe7MxfIbKGB1aT4XzfXZMlzJTWws
	 wHVErQhW9FONlqEPdVxVxm6iqqS7z1A2fVSKHOzUhebyPcM82Spg6t7igKDuHhxFrzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hd5S2ZiO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C45606A227;
	Tue, 10 Nov 2026 16:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hd5S2ZiO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1949D1F0089F;
	Tue, 10 Nov 2026 16:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794328920;
	bh=UPv8V/xrjWAZHw4u5a/y1qB3kFPHXgtDXw6QmaGaE5g=;
	h=Date:From:To:Cc:Subject;
	b=hd5S2ZiO0KQa7Ha5cGe3EZIqx3kADb0lOBttZ9PVQBKwDbM8Y6/Hg3XvyYTSPTqVN
	 M/Xg5b2FHThneEUqs7S0mkydeo0bk03nnMdISgzdTElbTs7s6T6JB3mpx+OUqPcxVy
	 ImczSGRPxlxRtiDzKsvJ1hrzwgL49UM0/defOmjHlM4RvTDkhajVuVPKv3rWM3o4dR
	 u2iW+uOr4lRXtdmH0W402fLs2WNBpLI0LDIHQztzuKLy+ZZiPu0ep15cvwZ8PI1OGE
	 wy5k17UKluA/+ne9uw3vJGB5xTKN7+oc6bD2gG16+CpspihalJCIch/Ho26NkOi6p6
	 3KupL4dmbWc3A==
Date: Tue, 10 Nov 2026 16:41:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Colin Cross <ccross@android.com>, Thierry Reding <treding@nvidia.com>
Cc: Aniruddha Rao <anrao@nvidia.com>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tegra tree with the origin tree
Message-ID: <avNJVJwZOOZ96FD9@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="XPJW4CVauCn/QGwu"
Content-Disposition: inline


--XPJW4CVauCn/QGwu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tegra tree got a conflict in:

  drivers/firmware/tegra/bpmp.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commits:

  ee98ea41ee3fb ("firmware: tegra: bpmp: Add ACPI support")
  7432bd82f69e5 ("firmware: tegra: bpmp: Add MBWT BPMP helpers")
  fc92a01962b16 ("firmware: tegra: bpmp: Move channel initialization to hel=
per")

=66rom the tegra tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/firmware/tegra/bpmp.c
index 5fbd6a3e69e09,d3508e98e3382..0000000000000
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@@ -764,20 -975,96 +975,94 @@@ int tegra_bpmp_init_channels(struct teg
  		return -ENOMEM;
 =20
  	spin_lock_init(&bpmp->atomic_tx_lock);
- 	bpmp->tx_channel =3D devm_kzalloc_obj(&pdev->dev, *bpmp->tx_channel);
 -	bpmp->tx_channel =3D devm_kzalloc(bpmp->dev, sizeof(*bpmp->tx_channel),
 -					GFP_KERNEL);
++	bpmp->tx_channel =3D devm_kzalloc_obj(bpmp->dev, *bpmp->tx_channel);
  	if (!bpmp->tx_channel)
  		return -ENOMEM;
 =20
- 	bpmp->rx_channel =3D devm_kzalloc_obj(&pdev->dev, *bpmp->rx_channel);
 -	bpmp->rx_channel =3D devm_kzalloc(bpmp->dev, sizeof(*bpmp->rx_channel),
 -					GFP_KERNEL);
++	bpmp->rx_channel =3D devm_kzalloc_obj(bpmp->dev, *bpmp->rx_channel);
  	if (!bpmp->rx_channel)
  		return -ENOMEM;
 =20
- 	bpmp->threaded_channels =3D devm_kzalloc_objs(&pdev->dev,
 -	bpmp->threaded_channels =3D devm_kcalloc(bpmp->dev, bpmp->threaded.count,
 -					       sizeof(*bpmp->threaded_channels),
 -					       GFP_KERNEL);
++	bpmp->threaded_channels =3D devm_kzalloc_objs(bpmp->dev,
 +						    *bpmp->threaded_channels,
 +						    bpmp->threaded.count);
  	if (!bpmp->threaded_channels)
  		return -ENOMEM;
 =20
+ 	return 0;
+ }
+=20
+ int tegra_bpmp_init_ping(struct tegra_bpmp *bpmp)
+ {
+ 	int err;
+=20
+ 	err =3D tegra_bpmp_request_mrq(bpmp, MRQ_PING,
+ 				     tegra_bpmp_mrq_handle_ping, bpmp);
+ 	if (err < 0)
+ 		return err;
+=20
+ 	err =3D tegra_bpmp_ping(bpmp);
+ 	if (err < 0) {
+ 		dev_err(bpmp->dev, "failed to ping BPMP: %d\n", err);
+ 		goto free_mrq;
+ 	}
+=20
+ 	return 0;
+=20
+ free_mrq:
+ 	tegra_bpmp_free_mrq(bpmp, MRQ_PING, bpmp);
+=20
+ 	return err;
+ }
+=20
+ void tegra_bpmp_deinit_ping(struct tegra_bpmp *bpmp)
+ {
+ 	tegra_bpmp_free_mrq(bpmp, MRQ_PING, bpmp);
+ }
+=20
+ int tegra_bpmp_init_dt_providers(struct tegra_bpmp *bpmp)
+ {
+ 	struct device *dev =3D bpmp->dev;
+ 	int err;
+=20
+ 	err =3D of_platform_default_populate(dev->of_node, NULL, dev);
+ 	if (err < 0)
+ 		return err;
+=20
+ 	if (of_property_present(dev->of_node, "#clock-cells")) {
+ 		err =3D tegra_bpmp_init_clocks(bpmp);
+ 		if (err < 0)
+ 			return err;
+ 	}
+=20
+ 	if (of_property_present(dev->of_node, "#reset-cells")) {
+ 		err =3D tegra_bpmp_init_resets(bpmp);
+ 		if (err < 0)
+ 			return err;
+ 	}
+=20
+ 	if (of_property_present(dev->of_node, "#power-domain-cells")) {
+ 		err =3D tegra_bpmp_init_powergates(bpmp);
+ 		if (err < 0)
+ 			return err;
+ 	}
+=20
+ 	return 0;
+ }
+=20
+ static int tegra_bpmp_probe(struct platform_device *pdev)
+ {
+ 	struct tegra_bpmp *bpmp;
+ 	char tag[TAG_SZ];
+ 	int err;
+=20
 -	bpmp =3D devm_kzalloc(&pdev->dev, sizeof(*bpmp), GFP_KERNEL);
++	bpmp =3D devm_kzalloc_obj(&pdev->dev, *bpmp);
+ 	if (!bpmp)
+ 		return -ENOMEM;
+=20
+ 	bpmp->soc =3D device_get_match_data(&pdev->dev);
+ 	bpmp->dev =3D &pdev->dev;
+=20
  	platform_set_drvdata(pdev, bpmp);
 =20
  	err =3D bpmp->soc->ops->init(bpmp);


--XPJW4CVauCn/QGwu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzSVMACgkQJNaLcl1U
h9B4qggAg3hthW+9jrSBo9cBu4HDdIAe9Lh162OZX2lLme1qKsNdKn8Q/gHfu/xY
gbz/06RHqhhniPozdzr6BFiuRL/YX5oOWpjrtEzYdFs7rIE5xnEpn2mBVIjZrBFr
Uo1Qo+1pJ4LNmt4sImQSHPtbqJQLk4iZDl5bqEFL4H9qSdgJoTSDmwwLF2gv7By/
Iq1yPYmHILzhROXLDc7NUgNZo8OcPj+mjlp1wDHv6XcXVAD5sjJahnRZ4xj5uj+O
M69nfwBPQrggR6w6MOptw6yWy4qDwiaTqs5H593UVl47yMU6wz1Xyp/XiGZX1Dei
MKrGbGbDq9HTg3mcKZMi0VkEhS1/hQ==
=1wH6
-----END PGP SIGNATURE-----

--XPJW4CVauCn/QGwu--
