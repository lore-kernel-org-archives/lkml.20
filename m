Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4349E3A6B65;
	Thu,  8 Oct 2026 07:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445425; cv=none; b=D7PrnvwfnBG+WLnjHqtc+xqfpNRi2YTcisVEKnFTZEGCHuDV94L3PuCZYS1S3W6lfMZk2ffOO/ZTktdGNFxW8otR09m7ssQF6T7Lr7VEX7KcCsgzAJy/5TUvKOmdb2xOoXL1EV+cvRRe0E+Sp2jo5dHCwWidF255QY3+yGxTCfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445425; c=relaxed/simple;
	bh=kTogJE52QvAqmCcudpxHEeCAAeOKLvX3BKyjDBAe4YE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mgM5EwTsQ2ofDyi/gbM38Y3h1BY9Fw6gsK2RIEd8z9FQm6cEsuZO6AEo+5y239gMluNY7WWQpG5+eka3fvjLAf2aTPqpea92vEduYPch++69OulN0EDyE+wTd6OHpapX/wqc3TvHw/Cfzhs/f14rQqu9fROG3SZGHXlSWzOE1fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5ZLBBBs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5ZLBBBs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B411F000FF;
	Thu,  8 Oct 2026 07:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791445423;
	bh=24T8qnBeKX+F31qNeUlmM5p6mrpN8b4CzO0ZL7ssTw0=;
	h=Date:From:To:Cc:Subject;
	b=B5ZLBBBsx4IkCv5ujUrgZKCkAUIAzOWLVehybM8YAXi4W5CU1k2q5yMhjMDI71JyL
	 2XFS0L42UAmV/tmncojXqpKDUqb/vOlKn3TelY4WEP7iWDjVGkWMHYnvfDyHy+4Zsc
	 LFj8BcRGmRbCMqNGrijG6JSfCKqQqS14wMEfW2t8rpT+lQjmZvvyqDfMEEUMmS8TQ7
	 xrYIT0IYLPz8QQkcEs/7JGj5Xop3izQijjc+s+RLxvF5NfbEgYg0yNAn7DtWVUvB2H
	 pjB9BMxLjp/bDAIJ3WI+bUJDcRfla20pN4i1Dpi68bBClXpyd4QANz+cCm+h11ylwM
	 S07HoHXOMXcIQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 52D241AC57CE; Thu, 08 Oct 2026 08:43:40 +0100 (BST)
Date: Thu, 8 Oct 2026 09:43:40 +0200
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: DaeMyung Kang <charsyam@gmail.com>, Gael Blivet <gael.blivet@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the ksmbd tree
Message-ID: <asdJrFvtgWPTS4zI@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l0EIQACIx0KCbLb8"
Content-Disposition: inline


--l0EIQACIx0KCbLb8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/smb/server/vfs.c

between commits:

  9a4c5d1700381 ("ksmbd: look up stream size by exact xattr name")
  26a14db500b82 ("ksmbd: copy stream content when renaming to a new stream =
name")
  5d2b1ab54e9a8 ("ksmbd: fix named stream write and EOF handling")

=66rom the ksmbd tree and commits:

  16d90b57d8439 ("fs: port xattr to const mnt_idmap")
  025756ee7b476 ("fs: port mnt_idmap() and file_mnt_idmap() to const mnt_id=
map")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/smb/server/vfs.c
index 3e06095463793,5cb161994e702..0000000000000
--- a/fs/smb/server/vfs.c
+++ b/fs/smb/server/vfs.c
@@@ -217,9 -216,9 +217,9 @@@ int ksmbd_vfs_mkdir(struct ksmbd_work *
  	return err;
  }
 =20
- ssize_t ksmbd_vfs_getcasexattr(struct mnt_idmap *idmap,
 -static ssize_t ksmbd_vfs_getcasexattr(const struct mnt_idmap *idmap,
 -				      struct dentry *dentry, char *attr_name,
 -				      int attr_name_len, char **attr_value)
++ssize_t ksmbd_vfs_getcasexattr(const struct mnt_idmap *idmap,
 +			       struct dentry *dentry, char *attr_name,
 +			       int attr_name_len, char **attr_value)
  {
  	char *name, *xattr_list =3D NULL;
  	ssize_t value_len =3D -ENOENT, xattr_list_len;
@@@ -387,8 -386,8 +387,8 @@@ static int ksmbd_vfs_stream_write(struc
  {
  	const struct cred *saved_cred;
  	char *stream_buf =3D NULL, *wbuf;
- 	struct mnt_idmap *idmap =3D file_mnt_idmap(fp->filp);
+ 	const struct mnt_idmap *idmap =3D file_mnt_idmap(fp->filp);
 -	size_t size;
 +	size_t size, write_end;
  	ssize_t v_len;
  	int err =3D 0;
 =20
@@@ -898,8 -841,8 +898,8 @@@ ssize_t ksmbd_vfs_listxattr(struct dent
  	return size;
  }
 =20
- ssize_t ksmbd_vfs_xattr_len(struct mnt_idmap *idmap,
 -static ssize_t ksmbd_vfs_xattr_len(const struct mnt_idmap *idmap,
 -				   struct dentry *dentry, char *xattr_name)
++ssize_t ksmbd_vfs_xattr_len(const struct mnt_idmap *idmap,
 +			    struct dentry *dentry, char *xattr_name)
  {
  	return vfs_getxattr(idmap, dentry, xattr_name, NULL, 0);
  }
@@@ -1728,10 -1671,9 +1728,10 @@@ out
  	kfree(def_smb_acl);
  	return rc;
  }
 +EXPORT_SYMBOL_IF_KUNIT(ksmbd_vfs_set_sd_xattr);
 =20
  int ksmbd_vfs_get_sd_xattr(struct ksmbd_conn *conn,
- 			   struct mnt_idmap *idmap,
+ 			   const struct mnt_idmap *idmap,
  			   struct dentry *dentry,
  			   struct smb_ntsd **pntsd)
  {

--l0EIQACIx0KCbLb8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasdJkgAKCRAv73Ows9A4
icpgAQDZrbxCZJbINeRBElbWjiq9QZ5rpj4ZaX210VkkxYkWngD/SCewtXRwLi+m
zdDqVTXCBIN2QnnTMk65e3nhYZYNMww=
=SEVK
-----END PGP SIGNATURE-----

--l0EIQACIx0KCbLb8--
