Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792766307;
	b=IS60J3hxhwfvLLXmDJ06ZLSVxXMwituQqaeNDfuGA8aadKZeWeSpXkJEOO/yUz8Kq+RC
	 lMmFk6gMWFeIk4jQ2j3oPCoCzTB15YFFUMy4hlRogWM8pBSfWy9fKBIaAj8GO5+xffeTF
	 MKRpfLX+aInpr+x7Y85IwyHstZXkw/lKqo2a9WgYIemcxJkbJx6cMwPD4ytLMdaZ6Jc0g
	 0rIKZ8X3r2nL6ro4quTMwovHhm5DVMvFrjS5bvGINbmN6WI1VC1ZpDst7qbsW/6Y3rvfX
	 meVhOufVg4QnT53PbL1uf7TUCLHzIZQBS6UURwxEvUqEaBhXEOrfHvlma1f4rsT7lYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766307;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=qU64bvFlp+ENXuE1rz63JwkjH8Ea2VGbEf6cWbzCF90=;
	b=zD/WRi7CYBfyzdCcD4r0NIq1b6S2QQBwiQW0JTpFa+s4qgayBD1NgwgUpN+IQZ3ochLd
	 N8pEt054hahmEpkbqmSsFxeOiWMITAALNRpvyb0OhM1kiQX0Dw2EnlUR1m3UMsS0HVvLY
	 qhBWt/ct/gYOmLveRMz73kcLwQSBi8s+yGmyUmIncTEg47Dn5i4Oq4WK9QBKKU2VGb3lG
	 DT+gRkXuswBo2rf4ifs8fUa4f/fySPJESRFcigC7XeJR7RWh5zY7o5XgEo0Tv010ztsf7
	 VJxG0otwFwEkNsxAukeN1ryxEFQXdGt1ftco/Lcu7SEUW/XQRd3wVVbbru+01UcgyIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aZpkLS9Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5C3606A31A;
	Fri, 23 Oct 2026 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aZpkLS9Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7A81F01825;
	Fri, 23 Oct 2026 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792766306;
	bh=qU64bvFlp+ENXuE1rz63JwkjH8Ea2VGbEf6cWbzCF90=;
	h=Date:From:To:Cc:Subject;
	b=aZpkLS9QVI5IJoQph156wZqPepNqXWy6x1TiNFPkS8xyRf/VGTEdWL4jvCWJ5pWU8
	 BiV0RIusu1IfY6thjQbq930BGVnFImLrtti0vaN/QQXJWsZINSq1gpt0sq2el6Sz8/
	 nW0ysqP4J7ZczDJNZkqalcXkX6DYL39lTo2KfEQo3FYFQqd68u/XRXL26K5EukPeLa
	 iisdvsyc62wUcuomvr2sX44WkxFVivp83fPbdL5rOxRZbqbokYrNUMJ0Cdyj6+riHo
	 avRgHOPmllf6fgUqHINCuRpdadmLC/KaNrzZs9VkvIXH1YDSG8l6QEzYr2JdVAuoGw
	 /2UaLQhKltlCQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 948DF1AC5994; Fri, 23 Oct 2026 15:38:24 +0100 (BST)
Date: Fri, 23 Oct 2026 15:38:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Halaney <andrew@amutable.com>,
	Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: linux-next: manual merge of the jc_docs tree with the origin tree
Message-ID: <attxYMtvBc5AMf9U@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="GSHtRsGao/p5OMjN"
Content-Disposition: inline


--GSHtRsGao/p5OMjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  tools/lib/python/kdoc/xforms_lists.py

between commit:

  fd0349aadbb99 ("pid: add helpers to operate on a struct pid array")

=66rom the origin tree and commit:

  4180abdb5d938 ("docs: xforms_lists: Handle DECLARE_KHOSER_PTR() struct me=
mbers")

=66rom the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/lib/python/kdoc/xforms_lists.py
index 320f977c5bac2,161acac90ea3b..0000000000000
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@@ -45,7 -45,7 +45,8 @@@ class CTransforms
          (CMatch("DECLARE_HASHTABLE"), r"unsigned long \1[1 << ((\2) - 1)]=
"),
          (CMatch("DECLARE_KFIFO"), r"\2 *\1"),
          (CMatch("DECLARE_KFIFO_PTR"), r"\2 *\1"),
+         (CMatch("DECLARE_KHOSER_PTR"), r"\2 \1"),
 +        (CMatch("DECLARE_PIDS"), r"struct pid *\1[(\2) + 1]"),
          (CMatch("(?:__)?DECLARE_FLEX_ARRAY"), r"\1 \2[]"),
          (CMatch("DEFINE_DMA_UNMAP_ADDR"), r"dma_addr_t \1"),
          (CMatch("DEFINE_DMA_UNMAP_LEN"), r"__u32 \1"),

--GSHtRsGao/p5OMjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCattxYAAKCRAv73Ows9A4
iYWrAP9ENFGvZO8IdLltCrwzGlUDn6LBIVBTS6cxXrgrTimbPgD6Av6j4nWRS6Ow
OZLuNsmq2+3DQiYOdrVfXgtZOiHG0Ag=
=T2v5
-----END PGP SIGNATURE-----

--GSHtRsGao/p5OMjN--
