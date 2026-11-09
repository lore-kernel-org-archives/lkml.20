Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233659;
	b=SlK5uzpZ5qY1M7PtUK+YL5+9AdZQfz5bJ6MSiZZuZMa55oUJZ+4dwXqf2liKLU3135dS
	 NOsByl79cOXjGjQq4CAemiMxPwDQXbeu5gcJZPWg3YYuITlzi2VO5JnlXsblYWnT7WIt5
	 MPrwhC200R5vjn//qy8ItCuJPFvcnjPcNhMVByUmPRFKqbk45aQEVVC6yBiCVK7Fm0gVS
	 DRAVSjJ4W9Ip3tF6JDQEgk3WcAocmoTJnNKbyy5LZyeteMQbIDrGhA7efi9xMqtPCEr7r
	 G7XFRLS7bnVKgSOJKLvXW4nTc8uyfLF+6uUgbgoR3Jt4sCN5oIzU+Bfn/1tRh5cApnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233659;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=GSnPkr/rL24SbEjAXMIorIPla/nW3FYOSJPsATx3I5k=;
	b=o4UDmSv6MwMA2vOJ28tcOqSBMNF3VYBQBGPwqowj8oXIfG3g/zUOhYOWC/ck9lWn7Crz
	 Sc76FmDxN6+/JzymDMjwPQvhkIIQxHzK2ElsDoNJGd0SxQvXf55jRevQdSSm5hN4ROH7n
	 qENtvdyQaZk2XI/GB9LnNeHb8sgLvSMQR8GgQ/ACxibndtBPGjcqLSAdXB95D0bJAemMp
	 JpfcHKVT+l8yIfk3iFTntY8HLT7sZrsyVQ1F42KvpYr/IKZq8Eg1iLc/eia/UzMweoN2Q
	 dG5LEhZqSXqIUI9045jaBpdVAyd1ONwFqXsCiUWop9SgUSUah9Xzcqfy98mW7G6VcKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kj8V6vhs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97568606A33A;
	Mon,  9 Nov 2026 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kj8V6vhs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03A31F0089F;
	Mon,  9 Nov 2026 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794233659;
	bh=GSnPkr/rL24SbEjAXMIorIPla/nW3FYOSJPsATx3I5k=;
	h=Date:From:To:Cc:Subject;
	b=kj8V6vhsSQZUPG5XoKQMgPoEvAmsSwSZoinQk78dfHYAMdsKmxOG8b4fGW3qkojTf
	 QpqsCJhfAV6HyoRysZ9H9NcUV1HegafaK3HriujOFkiJlntwEUxy+NLZF7tvln8deB
	 B8VV7V1oaS6ufKU3elLgaFt5OPrvBfB5rl/MwjC3zgfMN+rQna8ne7gvG3w2CXIjVI
	 hfVP4haf1yLRNLBmq7LP5r8fk2UNwu2Bi+x9HvK+WdODVr63VXL9IOGdMaYokNYLvh
	 409EBYCSLS0oB3n5Tkzd5rqbY9sHnCd1FDXc/2wt1n1nyq8GQxjHPndItb+hl9PXVy
	 aLtylzOH0C4SQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C77BA1AC5995; Mon, 09 Nov 2026 14:14:16 +0000 (GMT)
Date: Mon, 9 Nov 2026 14:14:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mfd tree with the origin tree
Message-ID: <avHVODjuTlxhuwkW@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="57jt3IwzCWLIYfiG"
Content-Disposition: inline


--57jt3IwzCWLIYfiG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  drivers/mfd/rz-mtu3.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  9aac1f80c8784 ("mfd: rz-mtu3: Do not use struct rz_mtu3_channel::dev")

=66rom the mfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


diff --cc drivers/mfd/rz-mtu3.c
index 7e1313a57abc0,558ed3fbe5207..0000000000000
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@@ -315,17 -291,16 +291,16 @@@ static int rz_mtu3_probe(struct platfor
  	struct rz_mtu3 *ddata;
  	struct reset_control *rstc;
  	unsigned int i;
+ 	int ret;
 =20
 -	ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
 +	ddata =3D devm_kzalloc_obj(dev, *ddata);
  	if (!ddata)
  		return -ENOMEM;
 =20
- 	ddata->priv_data =3D devm_kzalloc_obj(dev, *priv);
- 	if (!ddata->priv_data)
 -	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
++	priv =3D devm_kzalloc_obj(dev, *priv);
+ 	if (!priv)
  		return -ENOMEM;
 =20
- 	priv =3D ddata->priv_data;
-=20
  	priv->mmio =3D devm_platform_ioremap_resource(pdev, 0);
  	if (IS_ERR(priv->mmio))
  		return PTR_ERR(priv->mmio);

--57jt3IwzCWLIYfiG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavHVOAAKCRAv73Ows9A4
iUs9AQCZLrhWQVJ/gK7jdM3fc9nXKnk3gwcTSCzsqB6j4s0JTwEA2CkF9UDIae+M
33zXmU6XxvnPTLwyFy5RqPWsPttxuQM=
=2XI3
-----END PGP SIGNATURE-----

--57jt3IwzCWLIYfiG--
