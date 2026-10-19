Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426255;
	b=svA7uW0xldoxgBCDRfCO6kdWX5s6Odrt+/RhKRNuj0zC7CuDYzXdI/lcDR0QVDY9W7Gv
	 KwnZg2Pl2FHqOpB+bmHQlkvNikMaH59ij+rz29ooCKDgxA9s96PCCc9Hla8dd0BWt2Sta
	 A+4+/3DABTuP4ktuK2sBE5iw9dQD1ZLa/HPPoX8zEbRPV50Uom/xNbCEd+Uj1MB2+fVgK
	 Yx3PrDHRfWHsgIzXYO51dYBqnlXlGzPG5jg1P2bjYK+nVf6DsIsm8zrIZXd8gf1UBg5E4
	 Rm3LC+3U/kOM7yxjRF156gzObwAg6LCL7FS1b+Q1ytx4d9kxQdtlb7fgrjERd/qfqzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426255;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=FrVyBpKml7ICZK9pmoDCMc+mYjD9FqgZjUvQJO4bHoA=;
	b=JzSdqTyfYR22UchUEzl94orL9ll2IyytfTsLLc2AGTCjbEBDJ4Zg/rcmGqvjW42WDktU
	 0r0LcSm9+tMQk8JeEn/8G3LP+fwfJJeAy5LePRHMcIgIfVpp+uQ425O9O6W6Le3iQMKa/
	 hh4cm4qLOY+hesu3PE7UBwG6rKjma7Ts+znc0zpi5a18QtBkqUbvMN3cfBpF9wFkWwLj3
	 BhelCAmcFdzOM0uCB/zHsHg4HvS9fugHe/2q4gwUon/mg0vnSY9FdXFw9ab185GZ0q5sy
	 1q8hWTRc8mgJD/SaoGryeXkz0LMZG3UwR80cIUwehnvyuTz8wVm/RvaYvhZSUZbpSBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dCIdDEQC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DAB606C160;
	Mon, 19 Oct 2026 16:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dCIdDEQC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628BC1F000C4;
	Mon, 19 Oct 2026 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792426254;
	bh=FrVyBpKml7ICZK9pmoDCMc+mYjD9FqgZjUvQJO4bHoA=;
	h=Date:From:To:Cc:Subject;
	b=dCIdDEQCa/UNn5mSsszII5Z+jfntRwdZkJiZ/VG1/AIBNYabIt9p0zCeslei5Mcyr
	 Knjslxuwa6YdouB512f+TBhBaJbZVXRlcOyffqKWf26/VJ0aRwaNdMuUDkzbmFOn3x
	 us5u9Q5NeVvKGgzmdvQXPfkf22IUJsiuqcUa6HkdbN7VACzz/dMZUyjfYH4EG+R3Qz
	 0/iJBOg8iiRpfp4cnXJ64PJhZAD7/JIAhPBS1e6pkgvaiOhqLvYAWfFo6jsMwonR/u
	 lzEahWTdJ/PQrRuivLjW51eOg47YU3VKyNA/Ls2Z/nCu5zvC6xGxMpW+cHu5OFROkw
	 YhUJAZRgACbIw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 370D01AC57D0; Mon, 19 Oct 2026 17:10:52 +0100 (BST)
Date: Mon, 19 Oct 2026 17:10:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Michael Reeves <michael.reeves077@gmail.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: linux-next: manual merge of the regmap tree with the regmap-fixes
 tree
Message-ID: <atZBDGieqCrqeE2Y@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="xjfHqFNZ0TkMgBEY"
Content-Disposition: inline


--xjfHqFNZ0TkMgBEY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the regmap tree got conflicts in:

  drivers/base/regmap/regcache.c
  drivers/base/regmap/regmap-debugfs.c

between commits:

  834035934cef9 ("regmap: Remove debugfs before cache teardown")
  abff0a48b110f ("regmap: Drop map lock during cache init and exit")

=66rom the regmap-fixes tree and commits:

  81556a7aec225 ("regcache: extract locked helpers to replace open-coded lo=
ck/unlock pairs")
  a93de1d65c6b5 ("regmap: debugfs: Use guard to simplify code")

=66rom the regmap tree (I'll redo these before sending the pull to Linus).

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/base/regmap/regcache.c
index b137ded7fdd44,3b1c2f28d5852..0000000000000
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@@ -273,14 -291,10 +298,13 @@@ void regcache_exit(struct regmap *map
  	BUG_ON(!map->cache_ops);
 =20
  	regcache_hw_exit(map);
-=20
 -	regcache_locked_exit(map);
 +	if (map->cache_ops->exit) {
- 		dev_dbg(map->dev, "Destroying %s cache\n",
- 			map->cache_ops->name);
++		dev_dbg(map->dev, "Destroying %s cache\n", map->cache_ops->name);
 +		map->cache_ops->exit(map);
 +	}
 =20
  	kfree(map->reg_defaults);
+ 	map->reg_defaults =3D NULL;
  }
 =20
  /**
diff --cc drivers/base/regmap/regmap-debugfs.c
index 9a09df2ba8479,b62a5dce027b4..0000000000000
--- a/drivers/base/regmap/regmap-debugfs.c
+++ b/drivers/base/regmap/regmap-debugfs.c
@@@ -662,12 -641,12 +641,13 @@@ void regmap_debugfs_init(struct regmap=20
 =20
  void regmap_debugfs_exit(struct regmap *map)
  {
+ 	struct regmap_debugfs_node *node, *tmp;
+=20
  	if (map->debugfs) {
  		debugfs_remove_recursive(map->debugfs);
 +		map->debugfs =3D NULL;
- 		mutex_lock(&map->cache_lock);
- 		regmap_debugfs_free_dump_cache(map);
- 		mutex_unlock(&map->cache_lock);
+ 		scoped_guard(mutex, &map->cache_lock)
+ 			regmap_debugfs_free_dump_cache(map);
  		if (map->debugfs_dummy_id >=3D 0) {
  			ida_free(&dummy_ida, map->debugfs_dummy_id);
  			map->debugfs_dummy_id =3D -1;

--xjfHqFNZ0TkMgBEY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatZBDAAKCRAv73Ows9A4
iQ9BAP0cGccuKxnBt/JRr+NKfXfGXmkwB1X/jNDU5RUGWjWlDQD+K2BqIl09Oyxd
9/hFf1IBWuHH3wCHHYBIoYtndeGMfwM=
=vaxh
-----END PGP SIGNATURE-----

--xjfHqFNZ0TkMgBEY--
