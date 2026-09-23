Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2975499F2D;
	Wed, 23 Sep 2026 13:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169936; cv=none; b=KZOQBcXsf/Gl/2Khm7YoRwxOv15jpSIXQtoV/Q3seQ6/3lq0zAtC7XK00nEMyh/bGoVaomK0ENSxr4xhmw5ANVBGaMJnaN9eyS/sKSGdha2VdaGGcY2w4y9BvFyrXRG1eHYB2NPeGgZpJU0ciLJRS8hR7pM7OHqSw76xSq1veBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169936; c=relaxed/simple;
	bh=mdmAsS8PALWST2ntkZoFjf+aAYH7xMMROfxLQvwNM40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bRy7YQkc+B6qpqdZJAhNLnWRaYgjHBgbm+7wD+1Flh5J3L+ZzBLSqOpWEOH8VwLr6kDfXYaQ/lX0T6DYPbxp8W4CQcfcuqmYsMSn008WdV9/CPFHvhvDIrZ/pX+IRRE5Dt6DKcFtrXMbhIck6gmF3fbaylWtQ0xKEP/vklsdVVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNu8TY9+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNu8TY9+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E131F000FF;
	Wed, 23 Sep 2026 13:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790169934;
	bh=CtuoWN76+hdV19g7Fxv/UQzMV2QfHsUiHrdaF+Y93nA=;
	h=Date:From:To:Cc:Subject;
	b=QNu8TY9+M3COrRfUvZ+IArqZoNJPzBkpRNdWcStglZjh9xIeicsiWtDE1BtmU71nA
	 jicBSLpKb+Gpw9rE6sD2ZBgE4SOVpSLE8BdxvPbnyXtbP2jmsRe33rgtmP30Qx+wpc
	 pOIKf19vUe4pzsoaKDvIXqkyQaVfkclfi8i64X1hzpDgN4gTWQlJcNmhUQ6yGKDfOC
	 G0bdyKteP/iMFiMP77X1rVvdZG0yi08+qtF+WiIB9glvV/9oCCY1G/pV593Nts5zM9
	 YSajITk9O0i+f2rba7ilT5oi6RzpqKAV83NW8Qa/n7Fdu/WVFxny9BUYFtCOiymSRv
	 E6w7SFPcas1XQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2EC361AC573B; Wed, 23 Sep 2026 14:25:31 +0100 (BST)
Date: Wed, 23 Sep 2026 15:25:31 +0200
From: Mark Brown <broonie@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Daan De Meyer <daan@amutable.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the security tree with the vfs-brauner
 tree
Message-ID: <arPTSwCBIDM9uhRd@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9ckounK4nrbk2hlR"
Content-Disposition: inline


--9ckounK4nrbk2hlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the security tree got conflicts in:

  include/linux/security.h
  include/linux/lsm_hook_defs.h

between commit:

  ad664d41535a5 ("fs: port ->tmpfile() to pass const mnt_idmap")

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
@@@ -121,29 -120,30 +121,35 @@@ LSM_HOOK(int, -EOPNOTSUPP, inode_init_s
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
++<<<<<<< HEAD
 +LSM_HOOK(int, 0, inode_permission, struct inode *inode, int mask)
 +LSM_HOOK(int, 0, inode_setattr, const struct mnt_idmap *idmap, struct den=
try *dentry,
++=3D=3D=3D=3D=3D=3D=3D
+ LSM_HOOK(int, 0, inode_permission, struct mnt_idmap *idmap,
+ 	 struct inode *inode, int mask)
+ LSM_HOOK(int, 0, inode_setattr, struct mnt_idmap *idmap, struct dentry *d=
entry,
++>>>>>>> security/next
  	 struct iattr *attr)
 -LSM_HOOK(void, LSM_RET_VOID, inode_post_setattr, struct mnt_idmap *idmap,
 +LSM_HOOK(void, LSM_RET_VOID, inode_post_setattr, const struct mnt_idmap *=
idmap,
  	 struct dentry *dentry, int ia_valid)
  LSM_HOOK(int, 0, inode_getattr, const struct path *path)
  LSM_HOOK(int, 0, inode_xattr_skipcap, const char *name)
diff --cc include/linux/ns/ns_common_types.h
index 6ed6b497831c7,5cfe0ce3c8818..0000000000000
--- a/include/linux/ns/ns_common_types.h
+++ b/include/linux/ns/ns_common_types.h
@@@ -116,8 -116,13 +116,11 @@@ struct ns_common=20
  	struct dentry *stashed;
  	const struct proc_ns_operations *ops;
  	unsigned int inum;
 +	struct ns_tree;
 +	struct rcu_head ns_rcu;
+ #ifdef CONFIG_SECURITY
+ 	void *ns_security;
+ #endif
 -	union {
 -		struct ns_tree;
 -		struct rcu_head ns_rcu;
 -	};
  };
 =20
  #define to_ns_common(__ns)                                    \
diff --cc include/linux/security.h
index f7ff72ff956b7,7bb073f734f60..0000000000000
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@@ -405,33 -406,37 +407,37 @@@ int security_inode_init_security(struc
  int security_inode_init_security_anon(struct inode *inode,
  				      const struct qstr *name,
  				      const struct inode *context_inode);
- int security_inode_create(struct inode *dir, struct dentry *dentry, umode=
_t mode);
 -int security_inode_create(struct mnt_idmap *idmap, struct inode *dir,
++int security_inode_create(const struct mnt_idmap *idmap, struct inode *di=
r,
+ 			  struct dentry *dentry, umode_t mode);
 -void security_inode_post_create_tmpfile(struct mnt_idmap *idmap,
 +void security_inode_post_create_tmpfile(const struct mnt_idmap *idmap,
  					struct inode *inode);
- int security_inode_link(struct dentry *old_dentry, struct inode *dir,
- 			 struct dentry *new_dentry);
+ int security_inode_link(struct mnt_idmap *idmap, struct dentry *old_dentr=
y,
+ 			struct inode *dir, struct dentry *new_dentry);
  int security_inode_unlink(struct inode *dir, struct dentry *dentry);
- int security_inode_symlink(struct inode *dir, struct dentry *dentry,
- 			   const char *old_name);
- int security_inode_mkdir(struct inode *dir, struct dentry *dentry, umode_=
t mode);
+ int security_inode_symlink(struct mnt_idmap *idmap, struct inode *dir,
+ 			   struct dentry *dentry, const char *old_name);
+ int security_inode_mkdir(struct mnt_idmap *idmap, struct inode *dir,
+ 			 struct dentry *dentry, umode_t mode);
  int security_inode_rmdir(struct inode *dir, struct dentry *dentry);
- int security_inode_mknod(struct inode *dir, struct dentry *dentry, umode_=
t mode, dev_t dev);
+ int security_inode_mknod(struct mnt_idmap *idmap, struct inode *dir,
+ 			 struct dentry *dentry, umode_t mode, dev_t dev);
  int security_inode_rename(struct inode *old_dir, struct dentry *old_dentr=
y,
  			  struct inode *new_dir, struct dentry *new_dentry,
  			  unsigned int flags);
  int security_inode_readlink(struct dentry *dentry);
  int security_inode_follow_link(struct dentry *dentry, struct inode *inode,
  			       bool rcu);
- int security_inode_permission(struct inode *inode, int mask);
 -int security_inode_permission(struct mnt_idmap *idmap, struct inode *inod=
e,
++int security_inode_permission(const struct mnt_idmap *idmap, struct inode=
 *inode,
+ 			      int mask);
 -int security_inode_setattr(struct mnt_idmap *idmap,
 +int security_inode_setattr(const struct mnt_idmap *idmap,
  			   struct dentry *dentry, struct iattr *attr);
 -void security_inode_post_setattr(struct mnt_idmap *idmap, struct dentry *=
dentry,
 +void security_inode_post_setattr(const struct mnt_idmap *idmap, struct de=
ntry *dentry,
  				 int ia_valid);
  int security_inode_getattr(const struct path *path);
 -int security_inode_setxattr(struct mnt_idmap *idmap,
 +int security_inode_setxattr(const struct mnt_idmap *idmap,
  			    struct dentry *dentry, const char *name,
  			    const void *value, size_t size, int flags);
 -int security_inode_set_acl(struct mnt_idmap *idmap,
 +int security_inode_set_acl(const struct mnt_idmap *idmap,
  			   struct dentry *dentry, const char *acl_name,
  			   struct posix_acl *kacl);
  void security_inode_post_set_acl(struct dentry *dentry, const char *acl_n=
ame,
@@@ -917,12 -920,13 +927,13 @@@ static inline int security_inode_create
  }
 =20
  static inline void
 -security_inode_post_create_tmpfile(struct mnt_idmap *idmap, struct inode =
*inode)
 +security_inode_post_create_tmpfile(const struct mnt_idmap *idmap, struct =
inode *inode)
  { }
 =20
- static inline int security_inode_link(struct dentry *old_dentry,
- 				       struct inode *dir,
- 				       struct dentry *new_dentry)
+ static inline int security_inode_link(struct mnt_idmap *idmap,
+ 				      struct dentry *old_dentry,
+ 				      struct inode *dir,
+ 				      struct dentry *new_dentry)
  {
  	return 0;
  }
diff --git a/security/security.c b/security/security.c
index 5e5c73bfdd93a..09b0af1c0d656 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1662,7 +1662,7 @@ int security_path_chroot(const struct path *path)
  *
  * Return: Returns 0 if permission is granted.
  */
-int security_inode_create(struct mnt_idmap *idmap, struct inode *dir,
+int security_inode_create(const struct mnt_idmap *idmap, struct inode *dir,
 			  struct dentry *dentry, umode_t mode)
 {
 	if (unlikely(IS_PRIVATE(dir)))

--9ckounK4nrbk2hlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqz00oACgkQJNaLcl1U
h9DFeQf/YV+3BWS2n8rYZu+LUemhyKoK6D/ue7oiRDjho/kRD3IXmiE6brsqR8qk
guacsAkX/Vnp09X1lNdsd4OF1/76e2X7HLGisO+arQ4hk/lIBdX622uVSjxGLNG4
wVpY3SaN1HineMjV7WOs52UP25Gl1pgbk3KEEL4VR8bF5pgHY4Zh4kXMZ8/q7TzY
U75tOHCIO178FO5Mo4qqNG5+moyYHDK5zB/z3uBU/pQ+cNV4mgSxMr6ECtRoMTh3
6cfFBv5SjzxZlQ8/Ja7lEDGQgsnmhGOnphcY6RiTj4xeN0hSxGH5RHy2DMwY63J9
x26UVZPOxNRn9V2Z94NwCWUZWMj61w==
=HID2
-----END PGP SIGNATURE-----

--9ckounK4nrbk2hlR--
