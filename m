Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233774;
	b=oUTIDNSUvBiwR0Zk4qoxK+0Jv5tUWGAoWlVgL+oGZVvNMb3IiyIbetG2pVxTqOd+gw6B
	 9aGbqDge1YQzOiXWs7hrEOUxIGtz9uoWfKq29MwszXScuka3EZTpi1D+D/LDWwnN684Rh
	 DFSq7t9Odj+tJoDX5VmFs9I39uFnd6Hy254q7bebG5bg5Cj4kg7I3EvC+VJTQ4sHsK4tm
	 nKy8ziSurKVUIWhe7UvPrxC2X6S22/rk7a0K/KNttnjQAbSUJ9f/FrhVwKtjnROAXU7K0
	 DNyo1sXjBfuenS8suXgCqpSynphEpnsqAbcq9VgvFdRhq+iqKLxGUGHpfoTemIo+7Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233774;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=XVNIwEQ8pLTzkElkDwQw58fDWsDxI4n5recMRom1ZgE=;
	b=BB1Ni7x2ca7Ba9ckzNf7pbDLvV9gbJRvUHryHAAsAh6goPAdOu5hlslaNY+lFeL/5cNK
	 K8dupZy04pxhXhPW94IIX7Nrm/WD9GgYPJIDg6H4FPcCCIOPA94zeJDivCa1kQx9BFxm/
	 sS86+AbLk7DSGKusAJ8hxG1bfO9gW9EPmzA1CzVlyX44i5RJ6qSfjYPnlOR5LYI4QW1rM
	 0rFIeN1Vc3ZKrj4I1wYJUbiCwDt3p3uDF+B6Amdzw8GPKo5BYJfghHSU4Lfk0P5A3IDbW
	 Cz13GhNkZtB1jFlI5AViFyBcOAlRINXQ2iPjbfSI36muO4liD1y5hlJP7wgqp1gADIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="V0fZX/Y8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C20606A31C;
	Mon,  9 Nov 2026 14:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V0fZX/Y8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95A31F0089F;
	Mon,  9 Nov 2026 14:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794233774;
	bh=XVNIwEQ8pLTzkElkDwQw58fDWsDxI4n5recMRom1ZgE=;
	h=Date:From:To:Cc:Subject;
	b=V0fZX/Y8v4M7O5nGdrT19Mm2wOIFqFV8yN9HeIVAsoc6n8nI15oeKmmjivyXsiSma
	 pbrj08wdDkWLBEQHH43Qg1pyjPrm199C87UXBnll5iZuOVSvBTe76vUCN0kw/vzro4
	 /G9CAF23h8ZyxN5Uw1X1X69e80+1myOp3ZXMnVR0TnS/oB77LlnAZRNUa2cmTfVFXF
	 xGvEYxaL/GD15BRh3Qc8NrUwWpmlMmQuVl1qNBiYrJjUZNt7cZq72j5iHHO4dh4KoX
	 oqmWMXND+ZsEoYvW9MvNONr98RNowRvj7O5sDq9CACOQD/3+8mNLzz9yXHUs5JmQDf
	 d4TAIhmrJKAeQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B69331AC5995; Mon, 09 Nov 2026 14:16:11 +0000 (GMT)
Date: Mon, 9 Nov 2026 14:16:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Ijae Kim <ae878000@gmail.com>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Myeonghun Pak <mhun512@gmail.com>
Subject: linux-next: manual merge of the spi tree with the origin tree
Message-ID: <avHVqxBSnJH3CtrE@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="ktM/vQR4f+IuPp+s"
Content-Disposition: inline


--ktM/vQR4f+IuPp+s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the spi tree got a conflict in:

  drivers/spi/spi-amlogic-spisg.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  67e3d31893ab5 ("spi: amlogic-spisg: Balance runtime PM and clock cleanup")

=66rom the spi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/spi/spi-amlogic-spisg.c
index c59df9b115eed,33c5cbf57cb87..0000000000000
--- a/drivers/spi/spi-amlogic-spisg.c
+++ b/drivers/spi/spi-amlogic-spisg.c
@@@ -706,9 -707,7 +707,7 @@@ static int aml_spisg_clk_init(struct sp
 =20
  	clk_set_min_rate(spisg->pclk, SPISG_PCLK_RATE_MIN);
 =20
- 	clk_disable_unprepare(spisg->pclk);
-=20
 -	tbl =3D devm_kcalloc(dev, (DIV_NUM + 1), sizeof(*tbl), GFP_KERNEL);
 +	tbl =3D devm_kzalloc_objs(dev, *tbl, (DIV_NUM + 1));
  	if (!tbl)
  		return -ENOMEM;
 =20

--ktM/vQR4f+IuPp+s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavHVqwAKCRAv73Ows9A4
iX40AP9It3uTjHeLF44xAE0DxTbneRTJx2+dXJY+pVL3fkf4awD+Jqbe+6JlFOWi
TsetuipjZTodwztHBZJoNr8c07nQAwI=
=D9Fs
-----END PGP SIGNATURE-----

--ktM/vQR4f+IuPp+s--
