Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328B14756DE;
	Wed, 23 Sep 2026 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154577; cv=none; b=hySaUcdOCBMlxdiu0UXXPXpTu8QXf1y8j4vW51CYNyMy/5hZo/7f2yTUOoBWhh/irFtT8e7WlG+E/AtjH6dPEQb2mpsklKDjOhycmCbzz5NEMbib7ym8bdXvkuHsSHEAxoDBMSbDoqo89gAtrzv/4U79RVXYEna7rzSPqdN+uuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154577; c=relaxed/simple;
	bh=rjZgFnB2qaYlaxizo4zghPjV9UQTD5pI1jr0cMoFmNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lUKPKXlZz5NlZvzJXE5uBf5c+GI/W+LDsvO6PBMVorvMf3oGbzMUAzLWcera2OaI7yNDGNs5yFDLJeDDwo6LpOy/RThq5rOxsSbmF5skTdx1+wLpA/RJ/y+wIfPaRaXmsTWiovRZqO9NSHw2Vy0jIwbJpHJnNeSAMFjAWB6GiRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGIISKl0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGIISKl0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9591F000FF;
	Wed, 23 Sep 2026 09:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790154575;
	bh=YZRwz2oHAmJNbYCksPnYbQJpTYZJBRvQbS1n8BAyWfk=;
	h=Date:From:To:Cc:Subject;
	b=GGIISKl0pxVb3XODYoolz/EW9iZ6XRFfUvYrBX1+G+llWwsHwHbnjhTlB6d6LuHB0
	 kDZg3wxlFw8FSG+iK7J1OdZN+DkyrGy5LHJvG+R/w6bU9jNfr+jHBM2jUbeiEUpRIC
	 A1gGfCebCND5DdgiBhiAMk7f6jo74UfZj9YNne6nzYIw6yVJn1Nacp9IJOWpfQH6kd
	 LnheX53A1BhJpIb+c7iduUSYb65p5cWXsOkkGe9dFDaxf9QE3KxQlK91Zh8VZaytIC
	 cc2Z1HV/A4LXdzzfhLdMy9vAxDgR6gQXtsGaK6gviXjCfCRb/R8tLk8rMEA+0O86VK
	 j9xBca8ii6Aqw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0ABDC1AC5736; Wed, 23 Sep 2026 10:09:31 +0100 (BST)
Date: Wed, 23 Sep 2026 11:09:30 +0200
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Gael Blivet <gael.blivet@gmail.com>, Henry Hu <huhai@kylinos.cn>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the ksmbd tree
Message-ID: <arOXSoxHpzbrMfr-@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OrvEvYTS95KwbZmH"
Content-Disposition: inline


--OrvEvYTS95KwbZmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got conflicts in:

  fs/smb/server/smb2pdu.c
  fs/smb/server/vfs.c
  fs/smb/server/vfs.h

between commits:

  a0115a20ecc50 ("ksmbd: fix invalid pointer dereference when get_inode_acl=
() fails")
  1be59204ab530 ("ksmbd: copy stream content when renaming to a new stream =
name")
  a90dd07b4dfb3 ("ksmbd: look up stream size by exact xattr name")

=66rom the ksmbd tree and commits:

  16d90b57d8439 ("fs: port xattr to const mnt_idmap")
  0c18a70900eee ("fs: port i_{g,u}id_into_vfs{g,u}id() to const mnt_idmap")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/smb/server/smb2pdu.c
index 5221c6e944d55,262360e184fb3..0000000000000
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@@ -3667,11 -3634,10 +3667,11 @@@ static int smb2_create_sd_buffer(struc
  			    le32_to_cpu(sd_buf->ccontext.DataLength), true, false);
  }
 =20
 -static void ksmbd_acls_fattr(struct smb_fattr *fattr,
 -			     const struct mnt_idmap *idmap,
 -			     struct inode *inode)
 +static int ksmbd_acls_fattr(struct smb_fattr *fattr,
- 			    struct mnt_idmap *idmap,
++			    const struct mnt_idmap *idmap,
 +			    struct inode *inode)
  {
 +	struct posix_acl *acl;
  	vfsuid_t vfsuid =3D i_uid_into_vfsuid(idmap, inode);
  	vfsgid_t vfsgid =3D i_gid_into_vfsgid(idmap, inode);
 =20
diff --cc fs/smb/server/vfs.c
index db0f2de2bab3a,5cb161994e702..0000000000000
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
@@@ -842,8 -841,8 +842,8 @@@ ssize_t ksmbd_vfs_listxattr(struct dent
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
@@@ -1672,10 -1671,9 +1672,10 @@@ out
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
diff --cc fs/smb/server/vfs.h
index 566c670c90bed,67cc48e583c81..0000000000000
--- a/fs/smb/server/vfs.h
+++ b/fs/smb/server/vfs.h
@@@ -108,15 -108,10 +108,15 @@@ ssize_t ksmbd_vfs_getxattr(const struc
  			   struct dentry *dentry,
  			   char *xattr_name,
  			   char **xattr_buf);
- ssize_t ksmbd_vfs_xattr_len(struct mnt_idmap *idmap,
++ssize_t ksmbd_vfs_xattr_len(const struct mnt_idmap *idmap,
 +			    struct dentry *dentry, char *xattr_name);
- ssize_t ksmbd_vfs_getcasexattr(struct mnt_idmap *idmap,
++ssize_t ksmbd_vfs_getcasexattr(const struct mnt_idmap *idmap,
 +			       struct dentry *dentry, char *attr_name,
 +			       int attr_name_len, char **attr_value);
- ssize_t ksmbd_vfs_casexattr_len(struct mnt_idmap *idmap,
+ ssize_t ksmbd_vfs_casexattr_len(const struct mnt_idmap *idmap,
  				struct dentry *dentry, char *attr_name,
  				int attr_name_len);
- int ksmbd_vfs_setxattr(struct mnt_idmap *idmap,
+ int ksmbd_vfs_setxattr(const struct mnt_idmap *idmap,
  		       const struct path *path, const char *attr_name,
  		       void *attr_value, size_t attr_size, int flags,
  		       bool get_write);

--OrvEvYTS95KwbZmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqzl0oACgkQJNaLcl1U
h9DmBgf+PCZ8whGGodB5W6hWaCuawCXaEH1qR1ARFvXXADFYvnkQELezH9Xn1pWv
h7SUahjO3EwqTaqDnvYUrNB2JRH0CMs/KwAY5PxihCLU5YV0n7eu/xLvUx/hD03x
vwbaoR7bPRHz2Bkdm+CMRu8cr6bSK3DkEeWKRbC0iTQ0rava7pxfAgN2n1h7RsV4
nuHab9+xtmqgP2txQ0OVHffLMAMEIcBfvwFMzSPJI0vwMzGO6y7qyr9Tgeb6/vQr
6m/VRx5lUKUyJefqK+l/NHNZ1pYWHplGSMdf3DMVOp2ly//ezfgZtnm9CYuefqcz
rZ8mGaXo7Iv667x4Y72KnrjhU60qew==
=s8Q3
-----END PGP SIGNATURE-----

--OrvEvYTS95KwbZmH--
