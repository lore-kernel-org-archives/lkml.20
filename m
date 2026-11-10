Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328448;
	b=utuK+GkQ0Bj6A9WynBWdGNZPuR9eUvxTFfAcv7e0mQiDhXt3bEiLHGI3pJkLYpuQQFKT
	 AqZi0uGLnxnMS/Hk+lK7vz7ByDjbFh5fyoLBBLIJEX9ycEQgcC/yip4wmLEZKpIbO8vQE
	 p0OZYaoKE8KCqK3AFAOAman60Mnx3aevhOFkV6s/ChILbUd+7WKselK8Cz7p4CZj2RnYH
	 9NdOzYhXJBDcd5U5g0KLxw+n+aKzA/kbeFmJakZqR8PEg+ewAf/eTCV1TDaOq3xdss1kl
	 z6zGvul8cEs63CU0E+mpKOtkm4h1MSBTQFnIUr3daZMwy+3aznAKo5mp/kZ8gJv/bDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328448;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=M33vhyDBGiOcIB2xoPVlHxjnNqC6zHcQ2JFWW2v83a4=;
	b=ThnCjgo0km9vRKIpaet1N/Yec0V8bJ/QqmXhattCv55PChX0fiw8VCRGUlWe6LT24k2R
	 gXw2cJGBRDNcXhPdI+J4JAFc1L/1HYKkYhINJcVc9TF1nXiizLoj4mOpb+VqYr1KghYKm
	 TL3UwXbl7GXwAofL6hbSn3An3h22Svf6VpjYOhycqmPwVPCHyYB8y25nOY/3pBNOIDhP4
	 Vh7zzt3t+7t5jUwXVOSodzMebqXnKu8EZ01uK+bxGy31VUOzFID/El+7UDm33XnRUgqig
	 mWYvitEwzLGMy/i8F1qXahPqlEyoqXt1HD581xS3k0zU9vGUx/4gHFpBu5QwFktJ8cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1QBxbzM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20521606A23A;
	Tue, 10 Nov 2026 16:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1QBxbzM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4008E1F0089F;
	Tue, 10 Nov 2026 16:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794328447;
	bh=M33vhyDBGiOcIB2xoPVlHxjnNqC6zHcQ2JFWW2v83a4=;
	h=Date:From:To:Cc:Subject;
	b=D1QBxbzMaVUVPFha3J7ZrKwzlpPhWKDVJBCNh/Xlf4VF2MpFxXMETZ2sqCXOhbPRv
	 9ay7ZNAjpzXKyBdIvCGJLZs1/qNfp1RT7cvZwo2zj3dKuo/aEKBbnDBj585M5WNJSM
	 fPY57x8mUAjSJTS/WKOGbK4pqj7wWmwXtQaEsYzQtisiHETxqsu6V2dPUGGKtBXeB5
	 ljgXge+unHNu1KvmQa3+/0asBe6CxVvITThm3SbV8jmKrSZNhRnxd2GlHQU8OcgM9w
	 Cif6AQAAut4XovDevWRnZK9B2oBOGObps3HxYnj0ymJGk3kjS7YPElHPA7VCIQRFxs
	 yeeR3+4W0C1Vg==
Date: Tue, 10 Nov 2026 16:34:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Colin Cross <ccross@android.com>, Thierry Reding <treding@nvidia.com>
Cc: Aniruddha Rao <anrao@nvidia.com>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tegra tree with the origin tree
Message-ID: <avNHe2_rbwlvbCds@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="ON75mGdSU8IR7WiQ"
Content-Disposition: inline


--ON75mGdSU8IR7WiQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tegra tree got a conflict in:

  drivers/firmware/tegra/bpmp-tegra186.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  ee98ea41ee3fb ("firmware: tegra: bpmp: Add ACPI support")

=66rom the tegra tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/firmware/tegra/bpmp-tegra186.c
index 5a97496600ac1,c34f6d2d275cd..0000000000000
--- a/drivers/firmware/tegra/bpmp-tegra186.c
+++ b/drivers/firmware/tegra/bpmp-tegra186.c
@@@ -324,7 -325,11 +324,11 @@@ static int tegra186_bpmp_init(struct te
  	struct tegra186_bpmp *priv;
  	int err;
 =20
+ 	err =3D tegra_bpmp_init_channels(bpmp);
+ 	if (err < 0)
+ 		return err;
+=20
 -	priv =3D devm_kzalloc(bpmp->dev, sizeof(*priv), GFP_KERNEL);
 +	priv =3D devm_kzalloc_obj(bpmp->dev, *priv);
  	if (!priv)
  		return -ENOMEM;
 =20

--ON75mGdSU8IR7WiQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzR3sACgkQJNaLcl1U
h9B2ZAf/VA6h6KVfv52nWyD75poFouwhJiTXK6ZDqimf/GLD7krbdAY2gYxsSQ/9
bZo66ZvjS1c7jjPRebsIDHyWZ2JYaPUYiFwzYN5aVPQSpyiFQ0dV58HOzwgLWXY4
HZZFNLoxCcoJvSAUq0YBopy5PK5PQHjuji7QOjQM/6TU/ciIkHRSSMzW/yMDSIFw
UlR/k9R5MZtUkqtD8Ph0X5eCYfaE0IyDWfDd83zRBixe+Fx4Fx5KVQ19raj5HDlD
Q/sDiF2AGjrraCNYoCFSjivJZ8jCtR7vLU3d41fLCKnSOoVdZq/pQ5XssdptSKWE
8INTWkCu8nPx34RNqty960pPjvICkg==
=yQll
-----END PGP SIGNATURE-----

--ON75mGdSU8IR7WiQ--
