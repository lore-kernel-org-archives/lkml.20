Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8D051AECB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203469; cv=none; b=SDOk+afDPtB77sxATivyNiG1HmiMddKgi+7401lGZd5Ce4OeVjEJq9IVg1YV0CcmpFAJWvJ0F3F3EhjRr2tHW8JRc5IC9c7wavIi4xrsOqXrxeZFGQpccivfFw+8GdiHp1uHB49dOmyUkq+MFTvp6q7NUY0JXh5ucJwoBiFnALY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203469; c=relaxed/simple;
	bh=NJOevRPPbUqn+rLnkCjRvXNFVqlQ8S7uytUxRuvqzeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umQ7LH6ikejhPzTFgRFER94fmpUqDSve2qshQuu75EUA4FXCD90jl1v2yguBoxyckmPXYiUHZzfhkFCl+MkqkDl+robYZyhb8JS+pBYOdINNxZUyPyMIwKfiq5mi5XhwL1wngwISHai+rsIZnEdYgj+Q8lqPs2nJBONA7WV+xr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pa/cjCtO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pa/cjCtO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5BB1F00893;
	Wed, 23 Sep 2026 22:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790203467;
	bh=7qvuMFxeBj+B+G3C9EN8sSVcZBEZuVQAHrFO4Xty0ZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pa/cjCtODH8tQvSaIgT1T1D3gbx8C2FVjR5J83eGcAOvlSe2xloUgJBbPpAsjxZ7U
	 Ad5qy5KJDhE5OQLNeMDHo41xi0JyCwQ0AeUqJ+KkpKTkme/G4wt58b4+AOzFI0TTZ6
	 EIf1UQkvhx+MgN9o5eo+YOxdtusXX0Sc4xrCDYkHvKjnE+AJ1hd4UX8QoptrbXJcYF
	 QgAdlDAHeP6/PD8OmoJdxomH7kvsTd24Dmmxcz0Eku56bSPwHwK6VvraMiBeMOnavh
	 wge2I68bX0Nis0ZFQJl9JC1FpuPxVxJDheQkHVuwwVH/6N6WdEX8CKdF0ce+RCcK60
	 E1F0cm+jUc67A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Matlack <dmatlack@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 3/6] fs/namespace: Add vfs_open_detached_mount()
Date: Thu, 24 Sep 2026 00:44:02 +0200
Message-ID: <20260923224408.3745689-4-pratyush@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260923224408.3745689-1-pratyush@kernel.org>
References: <20260923224408.3745689-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

A mount created in the kernel by fc_mount() and friends has mnt_ns ==
NULL, and userspace cannot attach such a mount anywhere.

The missing step is the tail of fsmount(2): allocate an anonymous mount
namespace, insert the mount as its root, open an O_PATH file on it and
mark the file FMODE_NEED_UNMOUNT so the mount is torn down on the final
fput() if it is never attached. The anonymous namespace is what gives
the detached mount an owning user namespace for permission checks, a
place for child mounts, and a lifetime tied to the file.

None of the pieces are reachable from outside fs/namespace.c:
alloc_mnt_ns() and mnt_add_to_ns() are static, and the sequence is
already open-coded twice, in fsmount(2) and in open_detached_copy().

Factor it out so an in-kernel creator of a mount can hand it to
userspace. The Live Update Orchestrator needs this to return a tmpfs it
re-created from state preserved across a kexec; userspace attaches the
resulting fd with move_mount(), exactly as it would an fsmount(2) fd.

Only add the helper. Converting fsmount() and open_detached_copy() to it
is an obvious follow-up but is left out to keep this small. It is not
exported, as the only caller is built in.

Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>

---

This patch is entirely LLM generated. It works, but I am not competent
enough with VFS APIs to even guess if it is sensible. So please don't
take it too seriously. It makes the RFC testable, but for a proper
series I will do a lot more homework to make sure this doesn't
completely abuse VFS APIs.
---
 fs/namespace.c        | 59 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mount.h |  1 +
 2 files changed, 60 insertions(+)

diff --git a/fs/namespace.c b/fs/namespace.c
index 1ecd96c918b3..5e7ba2b61dd9 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -4435,6 +4435,65 @@ static unsigned int attr_flags_to_mnt_flags(u64 attr_flags)
 	return mnt_flags;
 }
 
+/**
+ * vfs_open_detached_mount - Publish a new mount as a detached mount file.
+ * @mnt: The mount to publish. Must not be attached to a mount namespace. The
+ *       caller's reference is consumed on success.
+ *
+ * Places @mnt into a new anonymous mount namespace and opens an O_PATH file on
+ * its root, marked FMODE_NEED_UNMOUNT. This is what fsmount(2) hands back, and
+ * the resulting file behaves the same way: it can be attached to the
+ * filesystem hierarchy with
+ *
+ *	move_mount(fd, "", dfd, path, MOVE_MOUNT_F_EMPTY_PATH)
+ *
+ * and the mount is torn down on the final fput() if it never was.
+ *
+ * A mount that is not the root of an anonymous mount namespace cannot be
+ * attached by userspace at all, so a mount freshly made by fc_mount() and
+ * friends has to go through here before it can be given away.
+ *
+ * Return: the new file, or an ERR_PTR. On failure the caller's reference to
+ *         @mnt is dropped, as the mount cannot be published.
+ */
+struct file *vfs_open_detached_mount(struct vfsmount *mnt)
+{
+	struct path path __free(path_put) = {};
+	struct mnt_namespace *ns;
+	struct file *file;
+
+	if (WARN_ON_ONCE(real_mount(mnt)->mnt_ns))
+		return ERR_PTR(-EINVAL);
+
+	ns = alloc_mnt_ns(current->nsproxy->mnt_ns->user_ns, true);
+	if (IS_ERR(ns)) {
+		mntput(mnt);
+		return ERR_CAST(ns);
+	}
+
+	/* The caller's reference becomes the namespace's reference. */
+	ns->root = real_mount(mnt);
+	ns->nr_mounts = 1;
+	mnt_add_to_ns(ns, real_mount(mnt));
+
+	path.mnt = mntget(mnt);
+	path.dentry = dget(mnt->mnt_root);
+
+	file = dentry_open(&path, O_PATH, current_cred());
+	if (IS_ERR(file)) {
+		dissolve_on_fput(mnt);
+		return file;
+	}
+
+	/*
+	 * An apparent O_PATH fd, with a note that the mount needs to be
+	 * unmounted on the final fput() rather than simply put.
+	 */
+	file->f_mode |= FMODE_NEED_UNMOUNT;
+
+	return file;
+}
+
 /*
  * Create a kernel mount representation for a new, prepared superblock
  * (specified by fs_fd) and attach to an open_tree-like file descriptor.
diff --git a/include/linux/mount.h b/include/linux/mount.h
index acfe7ef86a1b..44c1141bc574 100644
--- a/include/linux/mount.h
+++ b/include/linux/mount.h
@@ -89,6 +89,7 @@ extern struct vfsmount *vfs_create_mount(struct fs_context *fc);
 extern struct vfsmount *vfs_kern_mount(struct file_system_type *type,
 				      int flags, const char *name,
 				      void *data);
+struct file *vfs_open_detached_mount(struct vfsmount *mnt);
 
 extern void mnt_set_expiry(struct vfsmount *mnt, struct list_head *expiry_list);
 extern void mark_mounts_for_expiry(struct list_head *mounts);
-- 
2.56.0.rc1.310.g51773c2048-goog

