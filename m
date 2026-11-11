Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415026;
	b=MuifImf+JFXpI7zZmEE9kMO0gK4EQp+Ji0iiamZeuoCZpp4/xK1DSg69v4JPUaMZY2Ri
	 Pqdp4NbnTt8k4lkZ4AbGuDCcb4UQ/RUYNv//iRlQ7ummOE0NWDhyCc/cZ9N2lWt3Uedng
	 0u+n+w6otm2IGrJvPL5k4pJ2pqYqHOJ1MEDaschEeLGnz69n50CNb1Z07Mfd5fjkmuyBd
	 qUtS34fsFG+Oa9ZwG8B0+tYNOW1UMQfca/ORr3OvDvCsIZhxzz42UkcL/B8EgTyJ6x3d9
	 UZ9zfeVpXrmacSVhxgKXaW+RZzkuc7x7x9YOpMZhzT60UsEbT/CcUF4futuX+bhktjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415026;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Y20ZWKCXgzI2kFAt/bUEqnguWu+uQVtsXAJhI8Dz0to=;
	b=L3OMNt5yBUxedMkV/uc72GgPaL96BskrROt4Yzh2mK3appoqejhMsME4rBaPhGCvu+lz
	 EAM+PxJHjDbLtSWHe10GsbQzfkJIHvJR+ehAvPqutiN/fQqJpbKE9frghMyhE5F3n7/Ky
	 8xPH9Po+SB/BF9dqWfPdhN9YE1bT1ayCIkG+AuSXo9C3CVQkadg8yEQBgUUNPDkWmrSen
	 nOFmo7ae4dnZHgeyoTI5VQxIukjyUrB1biebyLo6dVXyrwfFbIKHqJXXq4ZLA1sNghD+3
	 Z6SSVIXlmuoY9ERV2U3r7DS7ThfiJ27U+/0TBCP909dMTU88klSu40qm0ORfmkn+UXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jxL3jr+J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CA0606A31C;
	Wed, 11 Nov 2026 16:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jxL3jr+J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93921F00A07;
	Wed, 11 Nov 2026 16:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794415026;
	bh=Y20ZWKCXgzI2kFAt/bUEqnguWu+uQVtsXAJhI8Dz0to=;
	h=Date:From:To:Cc:Subject;
	b=jxL3jr+JeevATQbb85ZrkMFGjviDlA5a46BtRgSkL2x2o2Cze9/RDGn2KcgVY9LNC
	 H9uA2yxojVY6vpHHd9yo6pb4sNnS6EpovhMR+Nd3or3eRMgBwXAVuQdiq5ZV9MshzK
	 piUrkgv+UqnlRtEnfO0b9h8mHis2Wjpuf+p28b3MDNMj9WJZgtFBvPTWcWryVXtJoA
	 jsWsF67McWC0q6421NPba1kzYFCTRu8Eeg4S2qPUoYngL8HaWdnoQCqZIqRURaZYqn
	 FEiD6R5HC3DQD7etPvQnrmS0Dps0QzaM7VOknKJ7SJCYTpDUJxtkMcOaBeSKwUzZXx
	 WC60lWi+BWL2g==
Date: Wed, 11 Nov 2026 16:37:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: linux-next: manual merge of the mmc tree with the origin tree
Message-ID: <avSZrk4D91iuNwLa@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="bZJm7x7StAHJw2CZ"
Content-Disposition: inline


--bZJm7x7StAHJw2CZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mmc tree got a conflict in:

  drivers/mmc/host/sdhci-cadence-core.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  9def07d97097b ("mmc: sdhci-cadence: enable probing from ACPI")

=66rom the mmc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/mmc/host/sdhci-cadence-core.c
index 16dc64a21dbb0,c5a4fa8e2fc6a..0000000000000
--- a/drivers/mmc/host/sdhci-cadence-core.c
+++ b/drivers/mmc/host/sdhci-cadence-core.c
@@@ -649,8 -650,8 +650,8 @@@ static int sdhci_cdns4_phy_probe(struc
  	struct sdhci_cdns4_phy *phy;
  	unsigned int nr_phy_params;
 =20
- 	nr_phy_params =3D sdhci_cdns4_phy_param_count(dev->of_node);
+ 	nr_phy_params =3D sdhci_cdns4_phy_param_count(dev);
 -	phy =3D devm_kzalloc(dev, struct_size(phy, phy_params, nr_phy_params), G=
FP_KERNEL);
 +	phy =3D devm_kzalloc_flex(dev, *phy, phy_params, nr_phy_params);
  	if (!phy)
  		return -ENOMEM;
 =20

--bZJm7x7StAHJw2CZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr0ma0ACgkQJNaLcl1U
h9BLBAf7BB/rBZT7yluJXRdBgK5NC9wIwTxlUZSkRf6Z5i4ytCZF9wisqGYlTle4
uZVL4MAMhhto/k7fN5YT5hR7HhDGCzV337G7nUCLkTj2Ktlkymq0u3np/pgTWR+4
y00+uYsRFlzKR5Op+4h0hK9HQfhllyiQAogWKkKDMXGRQRYU1MrYfppvscG1dDWI
0A9NXaAZ2564y+RlKFfUcHyVwdzJOFlUfdo0MSOnMx0ocHKWC0fiGV0i1qxCp0uy
u62OcyFxCvRI9BdbOeldrDlZRa3UpeDk8adTljWxsyOpKkooRK7ZrcK9JzQnbVAf
vGyVgFZswN3UZ5fLUZtEJxdqU4CumQ==
=auV7
-----END PGP SIGNATURE-----

--bZJm7x7StAHJw2CZ--
