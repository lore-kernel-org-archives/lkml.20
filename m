Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492481;
	b=D05Kl0LC7DknBdA3wkSGmZP4uSkd6igO5a6AmX2DOcfFVY+lHs+RwQTgH6QUV36LCLnD
	 pJWITSHz5ZzA875g2nq81RjDdHb+AggVyeNH1iYlWAxCwiKRS0JQvCHKgvaMQHMuF5SiV
	 /wPE4qxQO9s7FsGDf2aiL9oeQ1R4WFMb0tFDis7AGINzfY7H/ntByNKFSM7lCKEe/Wj0+
	 7SqZv0vDZy5ZB1ILO9DKMlekvNgPbjMnwUxYciaLzgFbdmpE8VEz1YVwlvZMSe3OXRA0t
	 U9XLPc9BknCJg9KmwDWw6B20ol70ChLKpGP16XYeoOLlkZnAE+DbkiOezHTgPO6ee5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492481;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=d3psejV0neY7zpsBCr8pNT+uDB3thMsLD7tFNi/jvFE=;
	b=s+qy3VrQ2wyaG8aE9M4EsiwS9bjj+IzB4np1S38OUav87qWt9qkJ17BcD1HKMtmu2IaH
	 kxLUROegylfy/gn9O7/fX/IVs7/hRdRwueXikKKJ2H5VVj0SsjrBZvPNAWQYplBhVC+QB
	 p9a7rMmlrT5/TzrMbuhto8iyfnR6Q9HK5sQ9uILw9z9zYDFrFzL91zwGvhSY9ukBEnKaO
	 x7kin6lni8ZTXMA/CDcxEPWskR731Tx6SbwqYKs2h2QDvFJzgE7z1tOpnVs4f3cc/0U0w
	 Vrzy96HCWI0sDUTGwAZ7ugva36xZkBgC3aCF5i45VUkphHc2E/BppiTqogpSTEELv6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oe86xfhm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF7E606A31A;
	Tue, 20 Oct 2026 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oe86xfhm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05291F000C4;
	Tue, 20 Oct 2026 10:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792492481;
	bh=d3psejV0neY7zpsBCr8pNT+uDB3thMsLD7tFNi/jvFE=;
	h=Date:From:To:Cc:Subject;
	b=Oe86xfhmhXEcWI+ewiLLyOIf2mHP5GdpwWObHDJUK5ZzmbwupLMr/+1TzkSKUyIAS
	 UpeFWeYQRZBHj/P0Q9yUTPa5BH2VE3z/1JzNHXd/JVtiFTqZLODjYTDDqv0A3FlBEb
	 GZTj3CDMHt43Or5Z0WzwGExTL7JKfHgRQ2CIo+iGOsTU+hhEPt7OvopvBBOZlh3tds
	 /KLSgsaeY94JtWxsLBWwalNoPqbW2FUjj+YjKIDAmFdM0bKuBRACb72fPBwb4m06wO
	 GTx/G7vFNmoNcqY2RXLku/a91WmQygfZ8q9HlS5TLEZDJ7s3BGUsxOVVQBj4l/nVg2
	 1+5qrZQcZSteg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1F4711AC57D0; Tue, 20 Oct 2026 11:34:39 +0100 (BST)
Date: Tue, 20 Oct 2026 11:34:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the origin tree
Message-ID: <atdDv6_Hp4t0ZDED@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="dwAh0ARiEFL2AwvB"
Content-Disposition: inline


--dwAh0ARiEFL2AwvB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/nullfs.c

between commit:

  00b04f4495c35 ("Merge tag 'vfs-7.4-rc1.idmap' of git://git.kernel.org/pub=
/scm/linux/kernel/git/vfs/vfs")

=66rom the origin tree and commit:

  69cbe809248be ("nullfs: pass const mnt_idmap to ->setattr()")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/nullfs.c
index 319c2f5c5a671,f79cc03214dd2..0000000000000
--- a/fs/nullfs.c
+++ b/fs/nullfs.c
@@@ -75,8 -75,7 +75,8 @@@ static ssize_t nullfs_file_splice_write
  }
 =20
  static int nullfs_file_setattr(const struct mnt_idmap *idmap,
 -			       struct dentry *dentry, struct iattr *attr)
 +			       struct dentry *dentry,
 +			       struct iattr *attr)
  {
  	if (attr->ia_valid & (ATTR_MODE | ATTR_UID | ATTR_GID))
  		return -EPERM;

--dwAh0ARiEFL2AwvB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatdDvgAKCRAv73Ows9A4
ialhAQDMJtJBgwQZUjEqpLMTTSlwwV+UdpTfBva0C5c0WfFp5wD/d4aPWBFic+ou
vFS0nxTBzuahlMAfsbkcbbDbQhgX0Q4=
=l62E
-----END PGP SIGNATURE-----

--dwAh0ARiEFL2AwvB--
