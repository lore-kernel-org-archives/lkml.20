Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461BC376A1E;
	Mon, 12 Oct 2026 13:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812506; cv=none; b=rqaMYF/+jK/kz8z7jqaYhr8S0KGiZCSpvl/t2bvq7DM60lAI7/s1ulThGM+FQbKICG2MsEehPCuZ6Hkveujznm3Lk3HRUitlhXI2hzhc0JKApj6VT7xB+3BTNVMr0SH1ZtMkOjTcHULjbJQg6gJyn6CoQ0ub2miiOtkAXEp0kd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812506; c=relaxed/simple;
	bh=mqQa8BdJ1SGr+YJ+0Y2JrnPGgBv/3KIWY3809wD2FqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jZV1jcVgSL2TbP20ja8RDVUnTLVuSQJRo4vcm4tTV5FPQlpFOJ+XwXPqD4KmMtCZtHsNa07l+v3bTdjFfKtErFOeuOngzwdyrdM65inSBVlG/Qj6k9ep4BHwLh07uzXJQnjvD6RtF8zBBBB7bRURVdhvASTHg8RROGaqu/mGnPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HG8RoEyZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HG8RoEyZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7481F0089B;
	Mon, 12 Oct 2026 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791812505;
	bh=ke2haB9lWsKesQUc1OwBQoG8GD386fVKvOLtxH+Tsgs=;
	h=Date:From:To:Cc:Subject;
	b=HG8RoEyZq0y2kTynnLgkEfNpF6jY+zE4qqcfKK2M0xEdSCOUH3HbVRV0jBhQ0rc9X
	 YOAoV/1sjKdfjiN1V9/1jPwDGyqNX8iCJtyPuJjKo+89iq2roIfXt+kKesdXwy9r0Y
	 hIqPfBRB/EKzdg8PQ6tphfYOR/q6hBfYITZcr4M/7hA+N/gj6bHRcWM0yjHggyY5CD
	 V6+S1fF6SHwmPIP/kS7z+xXdvPaQ0cE5+6eiQgLLrauw9ltHB7cc/WzlAUYiDXT/YT
	 dLUFlkGflk2WE9lNLKdq8QTCnXVwpJtkEYWjxLqqKALSCp30uHwGZm1bTGTvtCl2le
	 sr0clRbul8m6g==
Date: Mon, 12 Oct 2026 14:41:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <aszjlbymDdSFe3mI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uFbWnMCvSVcBJ/lY"
Content-Disposition: inline


--uFbWnMCvSVcBJ/lY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build
(arm multi_v7_defconfig) failed like this:

/tmp/next/build/fs/ntfs/named_stream.c:1811:27: error: initialization of 'i=
nt (*)(const struct mnt_idmap *, struct inode *, int)' from incompatible po=
inter type 'int (*)(struct mnt_idmap *, struct inode *, int)' [-Wincompatib=
le-pointer-types]
 1811 |         .permission     =3D ntfs_stream_permission,
      |                           ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/fs/ntfs/named_stream.c:1811:27: note: (near initialization =
for 'ntfs_stream_inode_ops.permission')
/tmp/next/build/fs/ntfs/named_stream.c:1812:27: error: initialization of 'i=
nt (*)(const struct mnt_idmap *, struct dentry *, struct iattr *)' from inc=
ompatible pointer type 'int (*)(struct mnt_idmap *, struct dentry *, struct=
 iattr *)' [-Wincompatible-pointer-types]
 1812 |         .setattr        =3D ntfs_stream_setattr,
      |                           ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/fs/ntfs/named_stream.c:1812:27: note: (near initialization =
for 'ntfs_stream_inode_ops.setattr')
/tmp/next/build/fs/ntfs/named_stream.c:1813:27: error: initialization of 'i=
nt (*)(const struct mnt_idmap *, const struct path *, struct kstat *, u32, =
 unsigned int)' {aka 'int (*)(const struct mnt_idmap *, const struct path *=
, struct kstat *, unsigned int,  unsigned int)'} from incompatible pointer =
type 'int (*)(struct mnt_idmap *, const struct path *, struct kstat *, unsi=
gned int,  unsigned int)' [-Wincompatible-pointer-types]
 1813 |         .getattr        =3D ntfs_stream_getattr,
      |                           ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/fs/ntfs/named_stream.c:1813:27: note: (near initialization =
for 'ntfs_stream_inode_ops.getattr')

Caused by commits

   e2f0d6d4569d1 (fs: port ->setattr() to pass const mnt_idmap)
   c3150ded7bc0e (fs: port ->getattr() to pass const mnt_idmap)

interacting with

   2de2cdd9cc08f (ntfs: add pathname access for named streams)

=66rom the vfs-brauner tree.  I have applied the fixup below and can carry
as needed.


--uFbWnMCvSVcBJ/lY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrM45QACgkQJNaLcl1U
h9BQyAf/fFvYUjhl0o+KiFpuqIZD06LheqSzJPhuqbcVca3aXDcgThm1HfNHwjHn
GH/mZ7CXFzU/Mv+4W3CQRd3ZwiDZG2MgnXLnJ7HTv9Q3porac/vUiH+jtHlLiIK9
h1sQWxJZ0LP8/KMbwBjMeXhOu2vvfqmZcjP7uMA7sUaxAfwTRwoGEi6l7qh6qBI1
NbKUeE2L+WnQ0tquZjlBu8x/Jsz9pCcaNcz96yFibYpQ7wi+f0LVbnEALxW61CBW
dicxOnJvzoXV23+pynjTkFe6aoG5doAD2jU/SWTM/6aRBL5P2WrZzVj++mPdRB8r
XusUSRXQkZOWy6vVlbG7Sl1roPgJZQ==
=eSWU
-----END PGP SIGNATURE-----

--uFbWnMCvSVcBJ/lY--
