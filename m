Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890714;
	b=gPXiCDBCfM2OxcWXpba1mTc14Y68Vd0UjfoRyAm0DCUbuqiadBpSpOI6aIF/E39AXViG
	 +vkvmIS5Fjz0O0SHOjaubyXowdmxPESqP4eUhsrjEYhgPnUQ1HE8z3zhNHYNK1UILyGl/
	 0z9dhiQDRh+oe/nHD1FsxnP+Drxn9MvRXbiASmssf5EyPVH2yDGbFhZsr/91WrFLH1CoL
	 y4OAW3UNvdOphevBATOuGy3eD+l8A9AXpFwwQ7T8W81V+MLkQVOl2Ih2Cf+mKM/TYHrfW
	 sIpSNTLcCl9LOFLUVe+IRC9LIi3VFWUNne4NOwML2GdvpaCl71XPjQ9iycOOFCTvx8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/cxIS+0TjhQekbScORmESFfFDRlQHjw1jo+Odz4xTOo=;
	b=5bITKh/fOqr2TAcvHtwS3CafvVIROZgNqeVHC0yK1G4+yK8JZxwLt4y4BstsQjnEwH12
	 LaTich1PPk9y2wvqYai/dHSupH7y+sakshu3ymK1eUXkTkc7D8likYC0baJ5a6kMy+SaV
	 BUno3wcOG63b7lrMUZ3tX6aHZ30HSxrcLZVZGmQgA4R8Eo2QZi5H2Bz7LL66brUx4Dq3f
	 Ot+6GnZFIKlu/O0/e1KRI1DcSXpAirTsUSW/J2yWzqq/PHfVZJmoxoQU8PLcLwiYksCfe
	 HlRNtCb2g+qzd6PUudsv3cXu7yug6GqTQupkb1D57WaRPo+rcRBBmNfhYpmqEkQ1FQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=F3BSuaad;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A3B60A2634
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A3B60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=F3BSuaad
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53cd0c8614eso14350391cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890713; x=1794495513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/cxIS+0TjhQekbScORmESFfFDRlQHjw1jo+Odz4xTOo=;
        b=F3BSuaadjS6lt/CSkK04z/h6NoQjy/bL7WsBEPCz1tkE2n6xqt6M0B6iWxEq21VjeR
         iINNxQGWtB/W4wSucckcWSz+2IMLd9YZNrz6LYDqDHBUEt9Vx9TjYF/FjNlY2VCrlh9k
         rl31rwuM/DUFA4j8uxt2gp/t9ss8j+TzvH/ulFAdujOrR4hMiJJEnzCz3fR0FsDnN1yx
         hB3MdIaVilqZhxpyp37/p7StDsYnBwhfMHNergaDyKiGyoPpQZNBNXrieS/gMYEevCZa
         BEOi+gNyzEtZo1oKnSgnRtJgOb6PmeLYHaLwVicgv1muLmuxSZ6vykntwEU/RAcXm03E
         VT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890713; x=1794495513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cxIS+0TjhQekbScORmESFfFDRlQHjw1jo+Odz4xTOo=;
        b=T2aMBEFnVwoAKs7cpuP1zi7FhMOEaGdAenb4A+hjUED47s8wXMplkCF21UKreFIc7h
         2XnUHNRmwY1/ySJU5kM4WSIPIbHQmGACkztxLlWId8C0+BekDbu1MgEuDVhd75LUxSDK
         ox2G2XrUGMtIbKWqOiiesghc9B/KLdev1wF6A2LmmLeLVuBSiVjaGtdv12CrpnjMlN5u
         iVr8PuGL/G6sZ0KxxzMtl7t28S1gJn5ZdyNEKq0frQorNaxi96byqaWlKHeuMh7btkwh
         FytPnlq7EAupf6f3otNTtllweG8XyyTUWGQGXL84zA6i1DmQlPHrJgcVd9c/bUF7D2kz
         QDhQ==
X-Forwarded-Encrypted: i=1; AKwUvByucVrZhyZI6ip6BReqAblubN+ice8FsKyo2F+vacWVQbbkR7hkxqHMhqHz9ANiRO0SgFfRkMaxodaYknM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tKI+2SBTtANLSx3QaQEvuqoh+RHzZr0aPMCHC7A2csdk5ECoE
	2jSf7tI3ML6R/eeuoqGT9amLIY54drn8G/n6Eku0HHVg/CEjOeDjO309vJn1IqokMS8=
X-Gm-Gg: AYBFou3qewjQTG17xf0puThRm7qqsing45RhVf0jBL+3v4mLnMeEwRCyloY886QjVec
	yhrvZb6Qtb2whDuiYFkW7UKWPl3jqXUvfMlab9IBMoRqz3p4IKtc3NxqQY/c3cdIebgr4JNwnDo
	39ugukiG6BKeMO5iIZfkUCtoCl+GjaNum6DjOoBqyubwIwrB4tifH1wW5F0Cz2l7+yJFwVQi/7/
	dp3fEwJuFm20SSqD2Pm2mfF7fkf63DBcuKbE/um1yAHAx0HWfw2CbjUDuz1f1IgyObk6R4D6fHe
	3LdtIvkPwJcSz5WoWvzvSkf4UJadeG+DTIN9F3rIiZCJD8+/VH1Q4khzotz/ySh2fbneUntwe+h
	/eky9c5NaOPdO5Z3Wjc4MCFj5g/OdNNtRAm9xkNNm5jkKuQR5Nl1OzRAVVf+EMHbg5QyLmFMBT/
	w4fdFLhDgqguonn7hTKza6mzqk1NWUV7gK6SZJv2YANcBIlCbhbS/jnAvmFqUjPJWtBY8gWSEc+
	2ScKTtnpnXNGM0gi9nSMR5sVx6Sf4zG51C3LQkBEJXjSv+MCxvAt1qkJKMMMCBUWrbYILXVQiNk
	UuTHni0gj48YLuMLK/gaKjrVXxlXwM2Y8mP6XAoue1LOFQ==
X-Received: by 2002:a05:622a:1a88:b0:536:3eef:56f3 with SMTP id d75a77b69052e-542b781c334mr328264281cf.58.1793890713127;
        Thu, 05 Nov 2026 06:58:33 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10cd8ea0sm52237241cf.27.2026.11.05.06.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:32 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:57:12 +0000
Subject: [PATCH RFC v3 21/90] fs: seal a mount namespace for a cell
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-21-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890670; l=10779;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=jPWaRnbz69nd0auhfAh97DTdCrejUYkEkAX3z7hAUAA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QA4klI18SITUdYtFZdqB1AlF6uB2dOmL6G+yTcr25G0K1opK6/BlFAFMcpiccKjIfsMXD6F7piZ
 nRca+45jOPwk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The mount tree of a container is usually a copy of a tree of the host,
with mounts placed on top of whatever the container must not see.
MNT_LOCKED exists to keep those mounts in place. A bug that allows one of
them to be removed, or the tree to be copied without it, reveals what was
underneath.

The tree of a cell is built from scratch instead. The builder assembles it
one mount at a time, in a mount namespace that nobody has entered. The
cell may see everything in that tree, including what lies under each mount
point. No mount is ever used to hide something from a cell.

Add mnt_ns_seal_for_cell(). It turns such a namespace into the namespace
of a cell, or fails without changing anything. It requires and does the
following:

 - No mount may be MNT_LOCKED, with one exception that hides nothing: the
   tree itself, mounted on the root of the namespace, which is an empty
   nullfs. create_new_namespace() locks that mount if the root of the
   caller is locked, which is the case for a caller that created a user
   namespace to do the mount work in. Without the exception only root
   could build a cell.
 - Nobody is in the namespace or about to enter it. mntns_install() takes
   its reference under namespace_sem, so either it sees that the
   namespace is sealed, or the seal sees the reference.
 - Every mount is made private, so nothing propagates into a cell.
 - For a cell with a block of ids, a writable mount of a filesystem that
   supports idmapping must be idmapped for the cell, or its superblock
   must be owned by the cell. Otherwise every create and chown would fail
   later. This check only reports the problem early and clearly.

"Idmapped for the cell" is decided by identity: the idmapping holds a
reference on the user namespace that it was created from.

A sealed namespace cannot be entered. It is still owned by the user
namespace of the builder, which is what prevents a task of the cell from
mounting anything.

Also add mnt_ns_may_claim() and mnt_ns_get_from_common(), for the code
outside of fs/ that gets the namespace from a file descriptor.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/internal.h                 |   2 +
 fs/mnt_idmapping.c            |  21 +++++++
 fs/mount.h                    |   3 +
 fs/namespace.c                | 141 +++++++++++++++++++++++++++++++++++++++++-
 include/linux/mnt_namespace.h |   6 ++
 5 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/fs/internal.h b/fs/internal.h
index 967c8556c17f..2ce49dff6ee1 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -341,6 +341,8 @@ int path_from_stashed(struct dentry **stashed, struct vfsmount *mnt, void *data,
 void stashed_dentry_prune(struct dentry *dentry);
 struct dentry *stash_dentry(struct dentry **stashed, struct dentry *dentry);
 struct dentry *stashed_dentry_get(struct dentry **stashed);
+bool mnt_idmap_is_for_cell(const struct mnt_idmap *idmap,
+			   const struct user_namespace *cell_ns);
 /**
  * path_mounted - check whether path is mounted
  * @path: path to check
diff --git a/fs/mnt_idmapping.c b/fs/mnt_idmapping.c
index 93a34bc93efd..5a813c8d86fe 100644
--- a/fs/mnt_idmapping.c
+++ b/fs/mnt_idmapping.c
@@ -407,3 +407,24 @@ int statmount_mnt_idmap(const struct mnt_idmap *idmap, struct seq_file *seq, boo
 
 	return nr_mappings;
 }
+
+#ifdef CONFIG_CELLS
+/**
+ * mnt_idmap_is_for_cell - was an idmapping made for this cell?
+ * @idmap:   idmapping of a mount
+ * @cell_ns: user namespace of a cell
+ *
+ * By identity and not by the value of the ids: nothing else can name an id of
+ * the window, and an idmapping that was made for an earlier holder of the same
+ * block keeps that block from being handed out again.
+ *
+ * Return: true if @idmap was made from @cell_ns.
+ */
+bool mnt_idmap_is_for_cell(const struct mnt_idmap *idmap,
+			   const struct user_namespace *cell_ns)
+{
+	if (idmap == &nop_mnt_idmap || idmap == &invalid_mnt_idmap)
+		return false;
+	return idmap->cell_ns == cell_ns;
+}
+#endif
diff --git a/fs/mount.h b/fs/mount.h
index 4d23cade9f6c..3e6b30a5dee0 100644
--- a/fs/mount.h
+++ b/fs/mount.h
@@ -32,6 +32,9 @@ struct mnt_namespace {
 	unsigned int		pending_mounts;
 	refcount_t		passive; /* number references not pinning @mounts */
 	bool			is_anon;
+#ifdef CONFIG_CELLS
+	bool			cell_sealed; /* a cell's: nobody enters. namespace_sem */
+#endif
 } __randomize_layout;
 
 struct mnt_pcp {
diff --git a/fs/namespace.c b/fs/namespace.c
index 25e196c05126..7298b589e10e 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/syscalls.h>
+#include <linux/cell.h>
 #include <linux/export.h>
 #include <linux/capability.h>
 #include <linux/mnt_namespace.h>
@@ -6710,6 +6711,136 @@ static void mntns_put(struct ns_common *ns)
 	put_mnt_ns(to_mnt_ns(ns));
 }
 
+#ifdef CONFIG_CELLS
+static inline bool mnt_ns_cell_sealed(const struct mnt_namespace *ns)
+{
+	return ns->cell_sealed;
+}
+
+/**
+ * mnt_ns_get_from_common - take a reference on a mount namespace
+ * @ns: the ns_common of a mount namespace
+ *
+ * For callers outside of fs/, which cannot see into struct mnt_namespace.
+ *
+ * Return: the mount namespace, with a reference for put_mnt_ns().
+ */
+struct mnt_namespace *mnt_ns_get_from_common(struct ns_common *ns)
+{
+	struct mnt_namespace *mnt_ns = to_mnt_ns(ns);
+
+	get_mnt_ns(mnt_ns);
+	return mnt_ns;
+}
+
+/**
+ * mnt_ns_may_claim - may the caller make a mount namespace a cell's?
+ * @ns: the ns_common of a mount namespace
+ *
+ * Return: true if the caller has CAP_SYS_ADMIN over the owner of @ns, which is
+ * what mounting in it takes.
+ */
+bool mnt_ns_may_claim(struct ns_common *ns)
+{
+	return ns_capable(to_mnt_ns(ns)->user_ns, CAP_SYS_ADMIN);
+}
+
+/**
+ * mnt_ns_seal_for_cell - make a mount namespace a cell's
+ * @ns:      the namespace. The caller holds @nr_refs references on it
+ * @nr_refs: see above
+ * @cell_ns: the cell's user namespace
+ * @ranged:  the cell has a block of ids of its own
+ * @root:    where to return the root of the tree
+ *
+ * The tree was built from scratch by whoever builds the cell, one mount at a
+ * time. Whatever is in it the cell may see all of, including what lies under
+ * every mount point: a mount is never what keeps something from a cell. So no
+ * mount may be locked, other than the tree itself on the empty root of @ns.
+ * Nothing propagates into a cell either, so the tree is cut loose from every
+ * peer and master.
+ *
+ * Nothing is changed unless everything checks out.
+ *
+ * Return: 0, -EBUSY if somebody is in @ns, on the way in, or it is a cell's
+ * already, -EINVAL if a mount is locked or @ns will not do, -EOVERFLOW if a
+ * writable mount is not for the ids of the cell.
+ */
+int mnt_ns_seal_for_cell(struct mnt_namespace *ns, unsigned int nr_refs,
+			 struct user_namespace *cell_ns, bool ranged,
+			 struct path *root)
+{
+	struct mount *m, *top = ns->root;
+	int err;
+
+	if (is_anon_ns(ns) || ns == current->nsproxy->mnt_ns)
+		return -EINVAL;
+
+	scoped_guard(namespace_excl) {
+		err = -EBUSY;
+		if (ns->cell_sealed)
+			goto out;
+		/*
+		 * Nobody is in it and nobody is on the way in: besides the
+		 * caller only an nsfs inode may hold on to it.
+		 */
+		if (ns_ref_read(ns) != nr_refs + !!READ_ONCE(ns->ns.stashed))
+			goto out;
+
+		for (m = ns->root; m; m = next_mnt(m, ns->root)) {
+			struct super_block *sb = m->mnt.mnt_sb;
+
+			/*
+			 * A locked mount hides what it covers. The exception
+			 * covers nothing: create_new_namespace() locks the tree
+			 * it puts on top of the root of the namespace if the
+			 * caller's own is locked, which it is for whoever made
+			 * a user namespace to do the mount work in. That root is
+			 * an empty nullfs.
+			 */
+			err = -EINVAL;
+			if ((m->mnt.mnt_flags & MNT_LOCKED) &&
+			    !(m->mnt_parent == ns->root &&
+			      ns->root->mnt.mnt_sb->s_type == &nullfs_fs_type))
+				goto out;
+
+			/*
+			 * Only the early and readable form of an error that
+			 * kuid_storable() would make of every create and chown.
+			 */
+			err = -EOVERFLOW;
+			if (!ranged || __mnt_is_readonly(&m->mnt) ||
+			    !(sb->s_type->fs_flags & FS_ALLOW_IDMAP) ||
+			    sb->s_user_ns == cell_ns)
+				continue;
+			if (!mnt_idmap_is_for_cell(mnt_idmap(&m->mnt), cell_ns))
+				goto out;
+		}
+
+		for (m = ns->root; m; m = next_mnt(m, ns->root))
+			change_mnt_propagation(m, MS_PRIVATE);
+		ns->cell_sealed = true;
+		scoped_guard(mount_locked_reader) {
+			touch_mnt_namespace(ns);
+			/* Whatever is on top, now that it can no longer change. */
+			while ((m = __lookup_mnt(&top->mnt, top->mnt.mnt_root)))
+				top = m;
+		}
+		root->mnt = &top->mnt;
+		root->dentry = top->mnt.mnt_root;
+		path_get(root);
+		err = 0;
+	}
+out:
+	return err;
+}
+#else
+static inline bool mnt_ns_cell_sealed(const struct mnt_namespace *ns)
+{
+	return false;
+}
+#endif
+
 static int mntns_install(struct nsset *nsset, struct ns_common *ns)
 {
 	struct nsproxy *nsproxy = nsset->nsproxy;
@@ -6730,7 +6861,15 @@ static int mntns_install(struct nsset *nsset, struct ns_common *ns)
 	if (current->fs->users != 1)
 		return -EINVAL;
 
-	get_mnt_ns(mnt_ns);
+	/*
+	 * Either this sees that the namespace has become a cell's, or the
+	 * sealing of the cell sees the reference.
+	 */
+	scoped_guard(namespace_shared) {
+		if (mnt_ns_cell_sealed(mnt_ns))
+			return -EPERM;
+		get_mnt_ns(mnt_ns);
+	}
 	old_mnt_ns = nsproxy->mnt_ns;
 	nsproxy->mnt_ns = mnt_ns;
 
diff --git a/include/linux/mnt_namespace.h b/include/linux/mnt_namespace.h
index 0acd1089d149..ed7e227f9e3d 100644
--- a/include/linux/mnt_namespace.h
+++ b/include/linux/mnt_namespace.h
@@ -10,6 +10,7 @@ struct mnt_namespace;
 struct fs_struct;
 struct user_namespace;
 struct ns_common;
+struct path;
 
 extern struct mnt_namespace init_mnt_ns;
 
@@ -18,6 +19,11 @@ extern struct mnt_namespace *copy_mnt_ns(u64, struct mnt_namespace *,
 extern void put_mnt_ns(struct mnt_namespace *ns);
 DEFINE_FREE(put_mnt_ns, struct mnt_namespace *, if (!IS_ERR_OR_NULL(_T)) put_mnt_ns(_T))
 extern struct ns_common *from_mnt_ns(struct mnt_namespace *);
+struct mnt_namespace *mnt_ns_get_from_common(struct ns_common *ns);
+bool mnt_ns_may_claim(struct ns_common *ns);
+int mnt_ns_seal_for_cell(struct mnt_namespace *ns, unsigned int nr_refs,
+			 struct user_namespace *cell_ns, bool ranged,
+			 struct path *root);
 
 extern const struct file_operations proc_mounts_operations;
 extern const struct file_operations proc_mountinfo_operations;

-- 
2.55.0

