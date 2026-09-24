Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0382C3F9F50;
	Thu, 24 Sep 2026 18:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275989; cv=none; b=JY+iv05CZDwWR3zY9pmvf30Lc+rDAp+LIBTKKLpUx7Zd9flJ5BYaDfgpJDlgCxooBEi82zZ81IekbIJyy5cZEOgrVZdXLkRsMVnNMJRXELCAzDyLC5zmYooqEeqnglVVUL0eT3qKm9c7ayhLTGjy43ZWkP7ghywKLCmUUTjIcXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275989; c=relaxed/simple;
	bh=K5DUxM1GKeSOhm/BHPyi9b09UBbditL9APSXEtfst7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TMMx2JCQiZ6Pl/FIKgU/ZKwau2A2FRymKe/qazrEe3f5PiVFq1FLOJqeJ0CnWyHHs6+BoeLoKXP7RJetrHUk21cHTtvZZqzEZkRfl87jIVAdgOFmTimwJb0+r9sO/9MT79OkUpT6jtIrJ6JBZui6Zhu9PFRhJjcRJG3OE660VwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Usw18Lrx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Usw18Lrx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23901F000FF;
	Thu, 24 Sep 2026 18:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790275976;
	bh=9b81s0MzFK/H9dQyvYxBZ8T45gU1npKCYvlOgOwV3D4=;
	h=Date:From:To:Cc:Subject;
	b=Usw18LrxRN8JEmJ4TRCWnUspH7JhwLa5fvYPckCMh+GUqkBuWYlVsmjW2/sBdF574
	 n+xNe7zNlCgw5+YwM32BnJ1bwijg3EC1D4sGViQN7gkU7kSJVX0NxNKtoMZ8eGTvQP
	 xGItkTUxtsvwzSJsCQ9O4g1v3n0bCQVSqftMBtXUVXLXi114eZzAr6Nur51VTGdjUz
	 9MwHw8ndW33sOYklksjJ2ErfoTsyjt84FxlLOcZI+Hu+rkpLOP9FudacfS9TGuJiOu
	 a9l4l+trG5qEgZFzb2f73ESpS2oZEtOmuCCuqKzWOxqcNvHa+k58725F4PQ+UjXJx+
	 6v6/2bqwqdfHg==
Date: Thu, 24 Sep 2026 19:52:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Daan De Meyer <daan@amutable.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the security tree with the vfs-brauner
 tree
Message-ID: <arVxhOCoeI129yMJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="olw9VQez6foyi/QR"
Content-Disposition: inline


--olw9VQez6foyi/QR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the security tree got a conflict in:

  include/linux/lsm_hook_defs.h

between commits:

  e2f0d6d4569d1 ("fs: port ->setattr() to pass const mnt_idmap")
  7d0db72041b74 ("fs: port ->mknod() to pass const mnt_idmap")
  ad664d41535a5 ("fs: port ->tmpfile() to pass const mnt_idmap")
  16d90b57d8439 ("fs: port xattr to const mnt_idmap")
  59ffddf0fbeb1 ("fs: port acl to const mnt_idmap")

=66rom the vfs-brauner tree and commit:

  16959c469f232 ("lsm: expose mount idmaps to inode hooks")

=66rom the security tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/lsm_hook_defs.h
index c9561564585e7,af9624c30f99d..0000000000000
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@@ -121,29 -120,30 +121,30 @@@ LSM_HOOK(int, -EOPNOTSUPP, inode_init_s
  	 int *xattr_count)
  LSM_HOOK(int, 0, inode_init_security_anon, struct inode *inode,
  	 const struct qstr *name, const struct inode *context_inode)
- LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentry,
- 	 umode_t mode)
 -LSM_HOOK(int, 0, inode_create, struct mnt_idmap *idmap, struct inode *dir,
++LSM_HOOK(int, 0, inode_create, const struct mnt_idmap *idmap, struct inod=
e *dir,
+ 	 struct dentry *dentry, umode_t mode)
 -LSM_HOOK(void, LSM_RET_VOID, inode_post_create_tmpfile, struct mnt_idmap =
*idmap,
 +LSM_HOOK(void, LSM_RET_VOID, inode_post_create_tmpfile, const struct mnt_=
idmap *idmap,
  	 struct inode *inode)
- LSM_HOOK(int, 0, inode_link, struct dentry *old_dentry, struct inode *dir,
- 	 struct dentry *new_dentry)
+ LSM_HOOK(int, 0, inode_link, struct mnt_idmap *idmap,
+ 	 struct dentry *old_dentry, struct inode *dir, struct dentry *new_dentry)
  LSM_HOOK(int, 0, inode_unlink, struct inode *dir, struct dentry *dentry)
- LSM_HOOK(int, 0, inode_symlink, struct inode *dir, struct dentry *dentry,
- 	 const char *old_name)
- LSM_HOOK(int, 0, inode_mkdir, struct inode *dir, struct dentry *dentry,
- 	 umode_t mode)
+ LSM_HOOK(int, 0, inode_symlink, struct mnt_idmap *idmap, struct inode *di=
r,
+ 	 struct dentry *dentry, const char *old_name)
+ LSM_HOOK(int, 0, inode_mkdir, struct mnt_idmap *idmap, struct inode *dir,
+ 	 struct dentry *dentry, umode_t mode)
  LSM_HOOK(int, 0, inode_rmdir, struct inode *dir, struct dentry *dentry)
- LSM_HOOK(int, 0, inode_mknod, struct inode *dir, struct dentry *dentry,
- 	 umode_t mode, dev_t dev)
+ LSM_HOOK(int, 0, inode_mknod, struct mnt_idmap *idmap, struct inode *dir,
+ 	 struct dentry *dentry, umode_t mode, dev_t dev)
  LSM_HOOK(int, 0, inode_rename, struct inode *old_dir, struct dentry *old_=
dentry,
  	 struct inode *new_dir, struct dentry *new_dentry)
  LSM_HOOK(int, 0, inode_readlink, struct dentry *dentry)
  LSM_HOOK(int, 0, inode_follow_link, struct dentry *dentry, struct inode *=
inode,
  	 bool rcu)
- LSM_HOOK(int, 0, inode_permission, struct inode *inode, int mask)
 -LSM_HOOK(int, 0, inode_permission, struct mnt_idmap *idmap,
++LSM_HOOK(int, 0, inode_permission, const struct mnt_idmap *idmap,
+ 	 struct inode *inode, int mask)
 -LSM_HOOK(int, 0, inode_setattr, struct mnt_idmap *idmap, struct dentry *d=
entry,
 +LSM_HOOK(int, 0, inode_setattr, const struct mnt_idmap *idmap, struct den=
try *dentry,
  	 struct iattr *attr)
 -LSM_HOOK(void, LSM_RET_VOID, inode_post_setattr, struct mnt_idmap *idmap,
 +LSM_HOOK(void, LSM_RET_VOID, inode_post_setattr, const struct mnt_idmap *=
idmap,
  	 struct dentry *dentry, int ia_valid)
  LSM_HOOK(int, 0, inode_getattr, const struct path *path)
  LSM_HOOK(int, 0, inode_xattr_skipcap, const char *name)

--olw9VQez6foyi/QR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1cYMACgkQJNaLcl1U
h9CDVAgAgPna414CXjG0vYiCdz3ZMWEHrjP1FuJg0PFwoWTnSxSupBZjAjVBsUH2
ujyXesIb+mHQIANemFQ0fcjSwR0XxCnVetQ0Ql4Qq1D2tx6IyxveB9hUjLAtXzG3
11Vcd7o9Qac+Yt/VbqEPqDbmAg46rI8qa+tEvY+8ouOTfVz8QP7tvGURo3Ucbhoo
DsWrycSomIMvNTSbFh9wJiDqJsBav7eZ2fbRys0AkZ6ejij+o31ZclFSbwsOc9EH
FARkZo5ibHHVXS+p8xcBBfbBLnu2i1zEI9GOyPLomLzDQ7vaJU6G1pErSMdbyzHf
rYQWUHynpKp7KSdtfx/2goKYTE3jZA==
=J1HD
-----END PGP SIGNATURE-----

--olw9VQez6foyi/QR--
