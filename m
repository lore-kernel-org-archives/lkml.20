Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E78053B5FA;
	Wed, 23 Sep 2026 15:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177973; cv=none; b=KRtzAYLneSu4u2mAe4nMabU6eLHrmfofbypzJ/YtGFlyIMgtkihl2IgMM0Nw8Ovvua9R0zmz9Eafln8kZLGaJTffcGztYK60Yk1luMREEqEpHUD7SRIVDV1k3hi9zStmgIMOUanGHQqJj2uOZ9woBjWdDy5MtO+4+2GjkO5CNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177973; c=relaxed/simple;
	bh=mvx+sCE2WpyPZMECl1wFptzgur9wWctufpEQMGd2820=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzgag6W8Zs+VtuV93hDUABQEf997USKwqjIN4xLnmfCzRl1rfYbXBuiVjv3njruNvtNZDXB5G9MmIAAE6Auz7vn3C2mVAxUZC8gfyGjJzeLrsPCgFpFYLu3AraMTpERfbCfxcNuaGsa1fmHheGqYDjtYz94me4Y2RzkuZuqTvb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvgfDB6n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvgfDB6n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D621F000FF;
	Wed, 23 Sep 2026 15:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790177970;
	bh=krAFHfYOyPR6Il3XZX/CslkG//VH3MmqEc2SRBbC1GM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bvgfDB6nKvMSbUuSNvYx5FWsC4UR5PUQhVUc+ZnuLbhKb96EHZlJD7VctbYSg1YL2
	 +5lvlU/7qQuXNkxazRc+yMEwH2ww6eE2O/oKb9Z0WQlGPB1YGabAOxJBi6NhTK5V+g
	 SgGgpFtPzQ4dhT3rRE7kBcYYddeUA+E7noV2b3wa22TJVhO9fL3+83rIIrhxRWsH1c
	 Cgczbg7tXBqreHDnfoAsu4HLbJK/ikgAjwfweGttqBinrAnqf4BlTlCtQo7gcLctlU
	 cjfTq0cx/3LOkGHfYscgc+P0ia1PeQ0Yz4dmbSRs8cux2MdN/BpTDwhpwO1dNHuscu
	 CNx/qtVsDeWvA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 18F7F1AC573C; Wed, 23 Sep 2026 16:39:26 +0100 (BST)
Date: Wed, 23 Sep 2026 17:39:26 +0200
From: Mark Brown <broonie@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Daan De Meyer <daan@amutable.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the security tree with the
 vfs-brauner tree
Message-ID: <arPyrhpeEe8A3W3M@sirena.co.uk>
References: <arPTSwCBIDM9uhRd@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y+2h74HgZ/urxqtT"
Content-Disposition: inline
In-Reply-To: <arPTSwCBIDM9uhRd@sirena.co.uk>
X-Cookie: I've been there.


--y+2h74HgZ/urxqtT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 03:25:31PM +0200, Mark Brown wrote:
> Hi all,
>=20
> Today's linux-next merge of the security tree got conflicts in:
>=20
>   include/linux/security.h
>   include/linux/lsm_hook_defs.h
>=20
> between commit:
>=20
>   ad664d41535a5 ("fs: port ->tmpfile() to pass const mnt_idmap")
>=20
> from the vfs-brauner tree and commit:
>=20
>   16959c469f232 ("lsm: expose mount idmaps to inode hooks")
>=20
> from the security tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This resolution was not good, there were additional semantic conflicts
plus a bit of a mismerge.  This is all rather messy, I've applied the
quickly hacked together fixup below but it's all concerningly large and
this probably needs some collaboration between the two trees.

=46rom 3f3dca4e8d3b9acf6652dd0cc91122773568120e Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Wed, 23 Sep 2026 15:48:54 +0200
Subject: [PATCH] security: Fix up mismerge and additional semantic issues w=
ith
 vfs-brauner

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/linux/lsm_hook_defs.h       | 19 +++++++------------
 include/linux/security.h            | 24 ++++++++++++------------
 security/apparmor/af_unix.c         |  2 +-
 security/apparmor/file.c            | 10 +++++-----
 security/apparmor/include/af_unix.h |  2 +-
 security/apparmor/include/file.h    |  4 ++--
 security/apparmor/include/net.h     |  2 +-
 security/apparmor/lsm.c             |  4 ++--
 security/apparmor/net.c             |  2 +-
 security/security.c                 | 12 ++++++------
 security/selinux/hooks.c            | 16 ++++++++--------
 security/smack/smack_lsm.c          |  4 ++--
 12 files changed, 48 insertions(+), 53 deletions(-)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 597e965fd5d9e..ef16e5343e099 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -125,29 +125,24 @@ LSM_HOOK(int, 0, inode_create, const struct mnt_idmap=
 *idmap, struct inode *dir,
 	 struct dentry *dentry, umode_t mode)
 LSM_HOOK(void, LSM_RET_VOID, inode_post_create_tmpfile, const struct mnt_i=
dmap *idmap,
 	 struct inode *inode)
-LSM_HOOK(int, 0, inode_link, struct mnt_idmap *idmap,
+LSM_HOOK(int, 0, inode_link, const struct mnt_idmap *idmap,
 	 struct dentry *old_dentry, struct inode *dir, struct dentry *new_dentry)
 LSM_HOOK(int, 0, inode_unlink, struct inode *dir, struct dentry *dentry)
-LSM_HOOK(int, 0, inode_symlink, struct mnt_idmap *idmap, struct inode *dir,
+LSM_HOOK(int, 0, inode_symlink, const struct mnt_idmap *idmap, struct inod=
e *dir,
 	 struct dentry *dentry, const char *old_name)
-LSM_HOOK(int, 0, inode_mkdir, struct mnt_idmap *idmap, struct inode *dir,
+LSM_HOOK(int, 0, inode_mkdir, const struct mnt_idmap *idmap, struct inode =
*dir,
 	 struct dentry *dentry, umode_t mode)
 LSM_HOOK(int, 0, inode_rmdir, struct inode *dir, struct dentry *dentry)
-LSM_HOOK(int, 0, inode_mknod, struct mnt_idmap *idmap, struct inode *dir,
+LSM_HOOK(int, 0, inode_mknod, const struct mnt_idmap *idmap, struct inode =
*dir,
 	 struct dentry *dentry, umode_t mode, dev_t dev)
 LSM_HOOK(int, 0, inode_rename, struct inode *old_dir, struct dentry *old_d=
entry,
 	 struct inode *new_dir, struct dentry *new_dentry)
 LSM_HOOK(int, 0, inode_readlink, struct dentry *dentry)
 LSM_HOOK(int, 0, inode_follow_link, struct dentry *dentry, struct inode *i=
node,
 	 bool rcu)
-<<<<<<< HEAD
-LSM_HOOK(int, 0, inode_permission, struct inode *inode, int mask)
-LSM_HOOK(int, 0, inode_setattr, const struct mnt_idmap *idmap, struct dent=
ry *dentry,
-=3D=3D=3D=3D=3D=3D=3D
-LSM_HOOK(int, 0, inode_permission, struct mnt_idmap *idmap,
+LSM_HOOK(int, 0, inode_permission, const struct mnt_idmap *idmap,
 	 struct inode *inode, int mask)
-LSM_HOOK(int, 0, inode_setattr, struct mnt_idmap *idmap, struct dentry *de=
ntry,
->>>>>>> security/next
+LSM_HOOK(int, 0, inode_setattr, const struct mnt_idmap *idmap, struct dent=
ry *dentry,
 	 struct iattr *attr)
 LSM_HOOK(void, LSM_RET_VOID, inode_post_setattr, const struct mnt_idmap *i=
dmap,
 	 struct dentry *dentry, int ia_valid)
@@ -194,7 +189,7 @@ LSM_HOOK(int, 0, inode_setintegrity, const struct inode=
 *inode,
 	 enum lsm_integrity_type type, const void *value, size_t size)
 LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
 	 struct kernfs_node *kn)
-LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
+LSM_HOOK(int, 0, file_permission, const struct file *file, int mask)
 LSM_HOOK(int, 0, file_alloc_security, struct file *file)
 LSM_HOOK(void, LSM_RET_VOID, file_release, struct file *file)
 LSM_HOOK(void, LSM_RET_VOID, file_free_security, struct file *file)
diff --git a/include/linux/security.h b/include/linux/security.h
index d0d27b4260827..8b8d6b8b802f1 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -411,15 +411,15 @@ int security_inode_create(const struct mnt_idmap *idm=
ap, struct inode *dir,
 			  struct dentry *dentry, umode_t mode);
 void security_inode_post_create_tmpfile(const struct mnt_idmap *idmap,
 					struct inode *inode);
-int security_inode_link(struct mnt_idmap *idmap, struct dentry *old_dentry,
+int security_inode_link(const struct mnt_idmap *idmap, struct dentry *old_=
dentry,
 			struct inode *dir, struct dentry *new_dentry);
 int security_inode_unlink(struct inode *dir, struct dentry *dentry);
-int security_inode_symlink(struct mnt_idmap *idmap, struct inode *dir,
+int security_inode_symlink(const struct mnt_idmap *idmap, struct inode *di=
r,
 			   struct dentry *dentry, const char *old_name);
-int security_inode_mkdir(struct mnt_idmap *idmap, struct inode *dir,
+int security_inode_mkdir(const struct mnt_idmap *idmap, struct inode *dir,
 			 struct dentry *dentry, umode_t mode);
 int security_inode_rmdir(struct inode *dir, struct dentry *dentry);
-int security_inode_mknod(struct mnt_idmap *idmap, struct inode *dir,
+int security_inode_mknod(const struct mnt_idmap *idmap, struct inode *dir,
 			 struct dentry *dentry, umode_t mode, dev_t dev);
 int security_inode_rename(struct inode *old_dir, struct dentry *old_dentry,
 			  struct inode *new_dir, struct dentry *new_dentry,
@@ -475,7 +475,7 @@ int security_inode_setintegrity(const struct inode *ino=
de,
 				size_t size);
 int security_kernfs_init_security(struct kernfs_node *kn_dir,
 				  struct kernfs_node *kn);
-int security_file_permission(struct file *file, int mask);
+int security_file_permission(const struct file *file, int mask);
 int security_file_alloc(struct file *file);
 void security_file_release(struct file *file);
 void security_file_free(struct file *file);
@@ -918,7 +918,7 @@ static inline int security_inode_init_security_anon(str=
uct inode *inode,
 	return 0;
 }
=20
-static inline int security_inode_create(struct mnt_idmap *idmap,
+static inline int security_inode_create(const struct mnt_idmap *idmap,
 					struct inode *dir,
 					struct dentry *dentry,
 					umode_t mode)
@@ -930,7 +930,7 @@ static inline void
 security_inode_post_create_tmpfile(const struct mnt_idmap *idmap, struct i=
node *inode)
 { }
=20
-static inline int security_inode_link(struct mnt_idmap *idmap,
+static inline int security_inode_link(const struct mnt_idmap *idmap,
 				      struct dentry *old_dentry,
 				      struct inode *dir,
 				      struct dentry *new_dentry)
@@ -944,7 +944,7 @@ static inline int security_inode_unlink(struct inode *d=
ir,
 	return 0;
 }
=20
-static inline int security_inode_symlink(struct mnt_idmap *idmap,
+static inline int security_inode_symlink(const struct mnt_idmap *idmap,
 					 struct inode *dir,
 					 struct dentry *dentry,
 					 const char *old_name)
@@ -952,7 +952,7 @@ static inline int security_inode_symlink(struct mnt_idm=
ap *idmap,
 	return 0;
 }
=20
-static inline int security_inode_mkdir(struct mnt_idmap *idmap,
+static inline int security_inode_mkdir(const struct mnt_idmap *idmap,
 				       struct inode *dir,
 				       struct dentry *dentry,
 				       int mode)
@@ -966,7 +966,7 @@ static inline int security_inode_rmdir(struct inode *di=
r,
 	return 0;
 }
=20
-static inline int security_inode_mknod(struct mnt_idmap *idmap,
+static inline int security_inode_mknod(const struct mnt_idmap *idmap,
 				       struct inode *dir,
 				       struct dentry *dentry,
 				       int mode, dev_t dev)
@@ -995,7 +995,7 @@ static inline int security_inode_follow_link(struct den=
try *dentry,
 	return 0;
 }
=20
-static inline int security_inode_permission(struct mnt_idmap *idmap,
+static inline int security_inode_permission(const struct mnt_idmap *idmap,
 					    struct inode *inode, int mask)
 {
 	return 0;
@@ -1154,7 +1154,7 @@ static inline int security_inode_copy_up_xattr(struct=
 dentry *src, const char *n
 	return -EOPNOTSUPP;
 }
=20
-static inline int security_file_permission(struct file *file, int mask)
+static inline int security_file_permission(const struct file *file, int ma=
sk)
 {
 	return 0;
 }
diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
index b908e744818c9..de80561348fc4 100644
--- a/security/apparmor/af_unix.c
+++ b/security/apparmor/af_unix.c
@@ -715,7 +715,7 @@ static void update_peer_ctx(struct sock *sk, struct aa_=
sk_ctx *ctx,
  * boundaries. Otherwise cached info off file is sufficient
  */
 int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
-		      const char *op, u32 request, struct file *file)
+		      const char *op, u32 request, const struct file *file)
 {
 	struct socket *sock =3D (struct socket *) file->private_data;
 	struct sockaddr_un *addr, *peer_addr;
diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index 3e74b613db325..305fdb341ddbb 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -489,7 +489,7 @@ static void update_file_ctx(struct aa_file_ctx *fctx, s=
truct aa_label *label,
=20
 static int __file_path_perm(const char *op, const struct cred *subj_cred,
 			    struct aa_label *label,
-			    struct aa_label *flabel, struct file *file,
+			    struct aa_label *flabel, const struct file *file,
 			    u32 request, u32 denied, bool in_atomic)
 {
 	struct aa_profile *profile;
@@ -550,7 +550,7 @@ static int __file_path_perm(const char *op, const struc=
t cred *subj_cred,
=20
 static int __file_sock_perm(const char *op, const struct cred *subj_cred,
 			    struct aa_label *label,
-			    struct aa_label *flabel, struct file *file,
+			    struct aa_label *flabel, const struct file *file,
 			    u32 request, u32 denied)
 {
 	int error;
@@ -579,7 +579,7 @@ static bool __file_is_delegated(struct aa_label *obj_la=
bel)
 	return unconfined(obj_label);
 }
=20
-static bool __is_unix_file(struct file *file)
+static bool __is_unix_file(const struct file *file)
 {
 	struct socket *sock =3D (struct socket *) file->private_data;
=20
@@ -595,7 +595,7 @@ static bool __is_unix_file(struct file *file)
 	return false;
 }
=20
-static bool __unix_needs_revalidation(struct file *file, struct aa_label *=
label,
+static bool __unix_needs_revalidation(const struct file *file, struct aa_l=
abel *label,
 				      u32 request)
 {
 	struct socket *sock =3D (struct socket *) file->private_data;
@@ -624,7 +624,7 @@ static bool __unix_needs_revalidation(struct file *file=
, struct aa_label *label,
  * Returns: %0 if access allowed else error
  */
 int aa_file_perm(const char *op, const struct cred *subj_cred,
-		 struct aa_label *label, struct file *file,
+		 struct aa_label *label, const struct file *file,
 		 u32 request, bool in_atomic)
 {
 	struct aa_file_ctx *fctx;
diff --git a/security/apparmor/include/af_unix.h b/security/apparmor/includ=
e/af_unix.h
index 4a62e600d82b0..62e3269273eb7 100644
--- a/security/apparmor/include/af_unix.h
+++ b/security/apparmor/include/af_unix.h
@@ -50,6 +50,6 @@ int aa_unix_msg_perm(const char *op, u32 request, struct =
socket *sock,
 int aa_unix_opt_perm(const char *op, u32 request, struct socket *sock, int=
 level,
 		     int optname);
 int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
-		      const char *op, u32 request, struct file *file);
+		      const char *op, u32 request, const struct file *file);
=20
 #endif /* __AA_AF_UNIX_H */
diff --git a/security/apparmor/include/file.h b/security/apparmor/include/f=
ile.h
index 1614c07fc53ee..d69a0611a981e 100644
--- a/security/apparmor/include/file.h
+++ b/security/apparmor/include/file.h
@@ -29,7 +29,7 @@ struct path;
 				 AA_MAY_CHMOD | AA_MAY_CHOWN | AA_MAY_LOCK | \
 				 AA_EXEC_MMAP | AA_MAY_LINK)
=20
-static inline struct aa_file_ctx *file_ctx(struct file *file)
+static inline struct aa_file_ctx *file_ctx(const struct file *file)
 {
 	return file->f_security + apparmor_blob_sizes.lbs_file;
 }
@@ -97,7 +97,7 @@ int aa_path_link(const struct cred *subj_cred, struct aa_=
label *label,
 		 struct dentry *new_dentry);
=20
 int aa_file_perm(const char *op, const struct cred *subj_cred,
-		 struct aa_label *label, struct file *file,
+		 struct aa_label *label, const struct file *file,
 		 u32 request, bool in_atomic);
=20
 void aa_inherit_files(const struct cred *cred, struct files_struct *files);
diff --git a/security/apparmor/include/net.h b/security/apparmor/include/ne=
t.h
index 375341929cb65..e387b50920b3b 100644
--- a/security/apparmor/include/net.h
+++ b/security/apparmor/include/net.h
@@ -112,7 +112,7 @@ int aa_label_sk_perm(const struct cred *subj_cred, stru=
ct aa_label *label,
 		     const char *op, u32 request, const struct sock *sk);
 int aa_sock_file_perm(const struct cred *subj_cred, struct aa_label *label,
 		      const char *op, u32 request,
-		      struct file *file);
+		      const struct file *file);
=20
 int apparmor_secmark_check(struct aa_label *label, char *op, u32 request,
 			   u32 secid, const struct sock *sk);
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index c73681d820a06..9d572cf8486b2 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -525,7 +525,7 @@ static void apparmor_file_free_security(struct file *fi=
le)
 		aa_put_label(rcu_access_pointer(ctx->label));
 }
=20
-static int common_file_perm(const char *op, struct file *file, u32 mask)
+static int common_file_perm(const char *op, const struct file *file, u32 m=
ask)
 {
 	struct aa_label *label;
 	bool needput;
@@ -543,7 +543,7 @@ static int apparmor_file_receive(struct file *file)
 	return common_file_perm(OP_FRECEIVE, file, aa_map_file_to_perms(file));
 }
=20
-static int apparmor_file_permission(struct file *file, int mask)
+static int apparmor_file_permission(const struct file *file, int mask)
 {
 	return common_file_perm(OP_FPERM, file, mask);
 }
diff --git a/security/apparmor/net.c b/security/apparmor/net.c
index a333e6aff9262..6048e3c5533d7 100644
--- a/security/apparmor/net.c
+++ b/security/apparmor/net.c
@@ -325,7 +325,7 @@ int aa_sk_perm(const char *op, u32 request, const struc=
t sock *sk)
=20
=20
 int aa_sock_file_perm(const struct cred *subj_cred, struct aa_label *label,
-		      const char *op, u32 request, struct file *file)
+		      const char *op, u32 request, const struct file *file)
 {
 	struct socket *sock =3D (struct socket *) file->private_data;
=20
diff --git a/security/security.c b/security/security.c
index 09b0af1c0d656..da8d48cd0a2a4 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1697,7 +1697,7 @@ void security_inode_post_create_tmpfile(const struct =
mnt_idmap *idmap,
  *
  * Return: Returns 0 if permission is granted.
  */
-int security_inode_link(struct mnt_idmap *idmap, struct dentry *old_dentry,
+int security_inode_link(const struct mnt_idmap *idmap, struct dentry *old_=
dentry,
 			struct inode *dir, struct dentry *new_dentry)
 {
 	if (unlikely(IS_PRIVATE(d_backing_inode(old_dentry))))
@@ -1732,7 +1732,7 @@ int security_inode_unlink(struct inode *dir, struct d=
entry *dentry)
  *
  * Return: Returns 0 if permission is granted.
  */
-int security_inode_symlink(struct mnt_idmap *idmap, struct inode *dir,
+int security_inode_symlink(const struct mnt_idmap *idmap, struct inode *di=
r,
 			   struct dentry *dentry, const char *old_name)
 {
 	if (unlikely(IS_PRIVATE(dir)))
@@ -1752,7 +1752,7 @@ int security_inode_symlink(struct mnt_idmap *idmap, s=
truct inode *dir,
  *
  * Return: Returns 0 if permission is granted.
  */
-int security_inode_mkdir(struct mnt_idmap *idmap, struct inode *dir,
+int security_inode_mkdir(const struct mnt_idmap *idmap, struct inode *dir,
 			 struct dentry *dentry, umode_t mode)
 {
 	if (unlikely(IS_PRIVATE(dir)))
@@ -1792,7 +1792,7 @@ int security_inode_rmdir(struct inode *dir, struct de=
ntry *dentry)
  *
  * Return: Returns 0 if permission is granted.
  */
-int security_inode_mknod(struct mnt_idmap *idmap, struct inode *dir,
+int security_inode_mknod(const struct mnt_idmap *idmap, struct inode *dir,
 			 struct dentry *dentry, umode_t mode, dev_t dev)
 {
 	if (unlikely(IS_PRIVATE(dir)))
@@ -1881,7 +1881,7 @@ int security_inode_follow_link(struct dentry *dentry,=
 struct inode *inode,
  *
  * Return: Returns 0 if permission is granted.
  */
-int security_inode_permission(struct mnt_idmap *idmap, struct inode *inode,
+int security_inode_permission(const struct mnt_idmap *idmap, struct inode =
*inode,
 			      int mask)
 {
 	if (unlikely(IS_PRIVATE(inode)))
@@ -2434,7 +2434,7 @@ int security_kernfs_init_security(struct kernfs_node =
*kn_dir,
  *
  * Return: Returns 0 if permission is granted.
  */
-int security_file_permission(struct file *file, int mask)
+int security_file_permission(const struct file *file, int mask)
 {
 	return call_int_hook(file_permission, file, mask);
 }
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index eb31241047abf..88f3a5858c2a5 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3110,13 +3110,13 @@ static int selinux_inode_init_security_anon(struct =
inode *inode,
 			    &ad);
 }
=20
-static int selinux_inode_create(struct mnt_idmap *idmap, struct inode *dir,
+static int selinux_inode_create(const struct mnt_idmap *idmap, struct inod=
e *dir,
 				struct dentry *dentry, umode_t mode)
 {
 	return may_create(dir, dentry, SECCLASS_FILE);
 }
=20
-static int selinux_inode_link(struct mnt_idmap *idmap, struct dentry *old_=
dentry,
+static int selinux_inode_link(const struct mnt_idmap *idmap, struct dentry=
 *old_dentry,
 			      struct inode *dir, struct dentry *new_dentry)
 {
 	return may_link(dir, old_dentry, MAY_LINK);
@@ -3127,13 +3127,13 @@ static int selinux_inode_unlink(struct inode *dir, =
struct dentry *dentry)
 	return may_link(dir, dentry, MAY_UNLINK);
 }
=20
-static int selinux_inode_symlink(struct mnt_idmap *idmap, struct inode *di=
r,
+static int selinux_inode_symlink(const struct mnt_idmap *idmap, struct ino=
de *dir,
 				 struct dentry *dentry, const char *name)
 {
 	return may_create(dir, dentry, SECCLASS_LNK_FILE);
 }
=20
-static int selinux_inode_mkdir(struct mnt_idmap *idmap, struct inode *dir,
+static int selinux_inode_mkdir(const struct mnt_idmap *idmap, struct inode=
 *dir,
 			       struct dentry *dentry, umode_t mask)
 {
 	return may_create(dir, dentry, SECCLASS_DIR);
@@ -3144,7 +3144,7 @@ static int selinux_inode_rmdir(struct inode *dir, str=
uct dentry *dentry)
 	return may_link(dir, dentry, MAY_RMDIR);
 }
=20
-static int selinux_inode_mknod(struct mnt_idmap *idmap, struct inode *dir,
+static int selinux_inode_mknod(const struct mnt_idmap *idmap, struct inode=
 *dir,
 			       struct dentry *dentry, umode_t mode, dev_t dev)
 {
 	return may_create(dir, dentry, inode_mode_to_security_class(mode));
@@ -3284,7 +3284,7 @@ static inline void task_avdcache_update(struct task_s=
ecurity_struct *tsec,
  * Check if the current task is allowed to access @inode according to
  * @requested.  Returns 0 if allowed, negative values otherwise.
  */
-static int selinux_inode_permission(struct mnt_idmap *idmap,
+static int selinux_inode_permission(const struct mnt_idmap *idmap,
 				    struct inode *inode, int requested)
 {
 	int mask;
@@ -3842,7 +3842,7 @@ static int selinux_kernfs_init_security(struct kernfs=
_node *kn_dir,
=20
 /* file security operations */
=20
-static int selinux_revalidate_file_permission(struct file *file, int mask)
+static int selinux_revalidate_file_permission(const struct file *file, int=
 mask)
 {
 	const struct cred *cred =3D current_cred();
 	struct inode *inode =3D file_inode(file);
@@ -3855,7 +3855,7 @@ static int selinux_revalidate_file_permission(struct =
file *file, int mask)
 			     file_mask_to_av(inode->i_mode, mask));
 }
=20
-static int selinux_file_permission(struct file *file, int mask)
+static int selinux_file_permission(const struct file *file, int mask)
 {
 	struct inode *inode =3D file_inode(file);
 	struct file_security_struct *fsec =3D selinux_file(file);
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 07183e4606fc0..28a8e12603cec 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -1096,7 +1096,7 @@ static int smack_inode_init_security(struct inode *in=
ode, struct inode *dir,
  *
  * Returns 0 if access is permitted, an error code otherwise
  */
-static int smack_inode_link(struct mnt_idmap *idmap, struct dentry *old_de=
ntry,
+static int smack_inode_link(const struct mnt_idmap *idmap, struct dentry *=
old_dentry,
 			    struct inode *dir, struct dentry *new_dentry)
 {
 	struct smack_known *isp;
@@ -1235,7 +1235,7 @@ static int smack_inode_rename(struct inode *old_inode,
  *
  * Returns 0 if access is permitted, an error code otherwise
  */
-static int smack_inode_permission(struct mnt_idmap *idmap, struct inode *i=
node,
+static int smack_inode_permission(const struct mnt_idmap *idmap, struct in=
ode *inode,
 				  int mask)
 {
 	struct superblock_smack *sbsp =3D smack_superblock(inode->i_sb);
--=20
2.47.3


--y+2h74HgZ/urxqtT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqz8qoACgkQJNaLcl1U
h9Cx2Af9GYtJ1Ddb2MMlXTD9afDcI70ceCY5JS52rZ2uFZdrb0oRf6nD64o2ZgB/
Ycww1G1li6oxxj4WScrL5tCn6lebU8M2Ht+ORWi6dXBdFDqNjU7Jj1M8+QNKyEIY
r/6BjpswCZEepbslrFe030dLLV/v+2ZXZsgnNmXKz9jzgbx6ftpFWPVceMqmx7A0
teBrzpOh82DKd6FoPiOcLG4GSYnQqjJQfei2zenLtgYLZ10y+YfadlOF900N3aTW
RF7iKxUS/2e4M/KfiS5ojxVW6ajNDB2jK54Ew3fdjqoIDJT5SFqrMgZJdSmylGfJ
Iu9ObMGFugXRvOC5AUpOHaLVDeqJLA==
=C/N0
-----END PGP SIGNATURE-----

--y+2h74HgZ/urxqtT--
