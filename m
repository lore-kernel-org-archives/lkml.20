Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231034;
	b=t12pAUmQGIJ6j+ztWm8sB1E7cizzU3FAqUnspFqo7mofP6BYRRv8CfyGpk4Xw0/ENaAT
	 5+0I4c5imt+hxUCg7peOKtin8BT0JagtJ0MD+u2S6GiMVq/NRhenHJUMrxHRwWJnNNLSB
	 pAU+zCJqe0tSv3wF3eqdQnoPONvx/F7SapMO03MEhqYPZcTx1YehVp6uCpEjjK24GHjHC
	 GH3jV6neMhJOFUIsXFGUD+X14O8A86lGi2fSVxO5DCqjwGOfzRb1Q9Ik3vDlR6UpnJesz
	 eUoasZ3NXN/lm2odo77QLO3SGatWfbe0YbfM+YLo0QPKCArzPyiEYli345rpAz1A8+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231034;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=U8GP8qeIGmDVOAF79UdnUwOveOV1uQuqDk3hF33gnNE=;
	b=QI9qnmPC660PhiuBL9N9t8vhI8PZYBmSv6qZJpK6JLJhSVIsclZKeBWpDQ8q7ntpsg/o
	 sA60IhUMktmVBsMnxPYOURU7y8ymSZeSU1PUlXYGpaXZ18UFwg+OVk8bSg40WOjWO9tJ8
	 xxz8ZbBv6Nx7nKp26CfH3C8m3v5zZSoFY5UynKgHgDpGe1XI9SuG1+GZmGxP+bt+vT8v4
	 olG7/3UB6bdPsaGhrd1doXc5nxfAJoIN9xJnuJ3WFwoJR8vrfGY5ayr8mP4XsaR1V8Jj/
	 9fU2vPLZKbYes97KQ5ysktKaRUfndmDwI8NKomJXUYIYXtXuc1wanOd4r3+MdlYRFuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PV7+l0Ds;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A436B606A322;
	Mon,  9 Nov 2026 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PV7+l0Ds
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4581F0089F;
	Mon,  9 Nov 2026 13:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794231034;
	bh=U8GP8qeIGmDVOAF79UdnUwOveOV1uQuqDk3hF33gnNE=;
	h=Date:From:To:Cc:Subject;
	b=PV7+l0DsnKXEF8qXzYgySh+PgDhCJEsmE9/XjwWtAc3cJuSgU3+qM73hpA4n7Ss+3
	 j0x5PAhPhM6K0gpwTGiM3sJKyJQPehmENq3CKi9oPFyals6i4Ag35crstVnwA19p8/
	 uLYRQ6kSO3vvbN0oPH2XzIgNVwHV7OKizDL0Rogwp3q+vNpTgH1dydRJIgeKWCkV7V
	 QB17dJCP/zLq6dQmTzbFFn2o3hXCKUSmaCBFTKZd50/J6ZZFzDqjIqvo6Wyv+VIetj
	 oJ5iVphaDmTYPOdkKK3eDXuiG7olQycPInCFSUI1KF30k3G0Z5e8nl3lOorftOkWgW
	 L53owBXthpgSQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id CEA561AC5995; Mon, 09 Nov 2026 13:30:31 +0000 (GMT)
Date: Mon, 9 Nov 2026 13:30:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Jaidev Shastri <jaidevshastri@vt.edu>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the imx-mxs tree with the origin tree
Message-ID: <avHK9yttDdx1O5P8@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="Jc8v7mgOUfPS4Y+W"
Content-Disposition: inline


--Jc8v7mgOUfPS4Y+W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the imx-mxs tree got a conflict in:

  drivers/firmware/imx/imx-scu-irq.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  f144d9f031b01 ("firmware: imx: scu: publish the SCU IPC handles with rele=
ase semantics")

=66rom the imx-mxs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/firmware/imx/imx-scu-irq.c
index bc22b10ddb20f,4f24e3c08a652..0000000000000
--- a/drivers/firmware/imx/imx-scu-irq.c
+++ b/drivers/firmware/imx/imx-scu-irq.c
@@@ -219,7 -223,15 +223,15 @@@ int imx_scu_enable_general_irq_channel(
  	if (ret)
  		return ret;
 =20
+ 	/*
+ 	 * imx_scu_irq_group_enable() tests imx_sc_irq_ipc_handle from other
+ 	 * drivers' probe paths and then passes it to imx_scu_call_rpc().
+ 	 * Publish it with release semantics so that the SCU state it points
+ 	 * to is visible to them.
+ 	 */
+ 	smp_store_release(&imx_sc_irq_ipc_handle, ipc);
+=20
 -	cl =3D devm_kzalloc(dev, sizeof(*cl), GFP_KERNEL);
 +	cl =3D devm_kzalloc_obj(dev, *cl);
  	if (!cl)
  		return -ENOMEM;
 =20

--Jc8v7mgOUfPS4Y+W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavHK9wAKCRAv73Ows9A4
ieqAAP0dDqZXsZ9lQ4XwukRDx4cW+B0zXYJj6DrP3O1K4YJskQEA2Aa9hs038lbL
Yuz0ygfmkoOydQ1HYijQDdBjYgoStAo=
=35Lq
-----END PGP SIGNATURE-----

--Jc8v7mgOUfPS4Y+W--
