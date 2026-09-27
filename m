Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4A53E4110
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518486; cv=none; b=FBDxpxu2dztSLjLAqMCd6Nsjc+qmYwtkYECEG+SUYZFtC3HbVpmVJaGNli3PAUFiZGVA/JaBHmZFpogZO1ntXpXj8ZnGrgtsCxL5vrkSYyWGACjpXxCqLjFJrBg2ZwCkhp4as0rEk7e6kwmUvNLE5jYLMNVjpIb58zD9WTh2WbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518486; c=relaxed/simple;
	bh=Z+SEHONyKzf7QSKR2bDqyzY6QrVFbHEv2dF0nsrChSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E18KuETLS64J3+z8UJwpyUwmH9kJHqGMACQK1S7NGLrIRqI7Tbg2lgrmm5q8egNB/Qu1FXcsSNIFRVP5iwyeIN966yjS3kQ4/1wCqpGGCerVgWRnwvLfEcsttswb3YP4WbtYZ6QkQqtwurXAP6tIDG68t1WCpJbyyreHjUgGBRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=har.mn; spf=pass smtp.mailfrom=har.mn; dkim=pass (2048-bit key) header.d=har.mn header.i=@har.mn header.b=KtSBOouC; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=har.mn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=har.mn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=har.mn header.i=@har.mn header.b="KtSBOouC"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-346c612c7a8so244403eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=har.mn; s=google; t=1790518483; x=1791123283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GS9WOj/RVU8zBzvXcmobX6CV4Z2UEf7cLEf0B3pE5X4=;
        b=KtSBOouCWs74BrbUcFvCWQXKM5MV+M9g2Fmrm1+TntYmj3Cz7rrB8rMrQ5i4AsK0Ez
         HmEA+8CBKs36VTqjD4pv/SebgxyXlgNSQw3GL5XPdXgaGni2maYEqAJbBShxDdDtsSf+
         DQJlv84jgott968GPRUaaai2zfGa7FqJBiOlpwH7fZ9tTJ9Ut3mkthN6OZdQCLlq1ykQ
         VnlzHRYdcXJ6eTp3a2Pfz8nOExjqSIDgohWaml19EGXX0LrnPJjjqNyKdCUUEwJAEr9y
         pMl6CShsenBL1u924L1tyC63NSdfoxDM5hUwH2ZAsWQD+PneaToef8FkUB06XFX920Dq
         lWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790518483; x=1791123283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GS9WOj/RVU8zBzvXcmobX6CV4Z2UEf7cLEf0B3pE5X4=;
        b=UpiC9ESBAR6b83KW5fnsIaBkRyT0K1t5BwAjs/d+RenPK+MgzeP6aywhueGgHy1vNB
         0jQENChqcK4D4b9zK92rcfv0oBDI2UPjOsgWocqU9L0L3JFcxtyJer/CEoIf7phlfLx3
         ZBbBi6CsqjZfIwWQd5jEIO0E7gT7nu3C6NrrJ5WKb4uELmofUqvMGJPp1rBhVQp0Uy7z
         UTYF7uHdc8oDnqKKkQcDXIInA4UZBduwtqtH4iZQs4oFvtR8PzEjwTNszrOwW3mKWk7/
         i3ZkQUjZhGMw3ShqESqRf+zeX1oH3yNtA9nbq5+c8WgykJ4Djm51GUhIAlUd9cCXRkxF
         Nxbg==
X-Forwarded-Encrypted: i=1; AKwUvBz3bw07JPn0FNqoGx2LPC2IEyKDqeA33Eyzdq5xhyEmzhc7aCxFyK9pj0oKmFj4nPH81Nqv8iMfUuhauvQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kHlo/tHPaBV/J3dnUbaTCjxDjqE448KLSh2uLasI42Em8+TZsC
	CdeX+h54STXcH53chX0gq6sHzDD4qwDnusHWt2JpfKRFmZPfUxbkM7BV/6xP0iG8CA==
X-Gm-Gg: AYBFou1ZRDQgvohFIAvBemKMf+rhCYpqa7iYuyufju3tszVrmfwQKgTXdXyF2pfpnv1
	MxRgsgf99mgylcMnAP7l+5f8rWrVS+D/rMzsg/vfhqB7yQY5twkm93n5uSUDXZfjIP0vmjnwUFK
	0gf0hjxG0XQl9SKI6dMXmE7G6EoSd4G8XV5tNogm52eoml+EWEMp7KuxoRabfFEFSuG0pAfzwNB
	3Iohj3Msg2KRnixuOC4vHNwwdNX569NBecBrT9WJNE31rX+8FFJF0vzuHj28s+FM5/PEXq47TVk
	TOkaPFCCOdt/t3CkQVdWVWaMvwWV5Gikf5X9DhMLyUlaUrUIkfmAIIUrLBE3TkrvFL9TD6hS7OM
	u4LzJJbB81ySDQ1iBMDZyqWC6GbcuyTRXzIr1HPDb+hUjfizQWcAE6f7pQalgTgc3jG8eR3OBq1
	UEaGfsky5UWl3KqDZoPEw03zdXKVC5Mmfa0bEocaF4u/vNvFd6SApmJW0d+h3wjc3aa4XVEZEtT
	lSkK+IqjTYJTEpb+rVoKEDX8p2brG6ii52G
X-Received: by 2002:a05:7022:7f13:b0:148:dfc9:425d with SMTP id a92af1059eb24-148dfc947fbmr1978785c88.46.1790518482669;
        Sun, 27 Sep 2026 07:14:42 -0700 (PDT)
Received: from zeniba.local (c-76-132-108-20.hsd1.ca.comcast.net. [76.132.108.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm21623982eec.0.2026.09.27.07.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:14:42 -0700 (PDT)
From: Russell Harmon <russ@har.mn>
To: miklos@szeredi.hu
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	fuse-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Russell Harmon <russ@har.mn>
Subject: [PATCH] fuse: add inode generation number support
Date: Sun, 27 Sep 2026 07:14:37 -0700
Message-ID: <20260927141437.1432584-1-russ@har.mn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for propagating the inode generation number from
the FUSE server to the kernel. This is useful for exporting FUSE
filesystems over NFS, where the generation number is used to detect
stale file handles (ESTALE) when inodes are recycled.

Key changes:
- Bump FUSE protocol version to 7.47.
- Repurpose the unused `dummy` field in `struct fuse_attr_out` as
  `generation`.
- Add a `FUSE_ATTR_GENERATION` INIT flag with which the filesystem opts
  into the kernel consuming that field. Gating on the protocol minor
  version alone would break existing filesystems: the minor version only
  reflects the library, not whether the individual filesystem fills the
  field, and a zero there would look like a generation change for any
  filesystem that reports nonzero generations in LOOKUP.
- Update `fuse_change_attributes` and related functions to accept and set
  `inode->i_generation`.
- Populate `i_generation` from `LOOKUP`, `GETATTR`, and `READDIRPLUS`
  responses.
- Detect nodeid recycling on `GETATTR` and `SETATTR` responses via
  `fuse_stale_inode()`, the same check already used by the `LOOKUP` and
  `READDIRPLUS` paths, and mark the inode bad (EIO) instead of merging
  the recycled file's attributes into the existing, possibly still-open,
  inode.
- Update `fuse_get_dentry` to validate the generation number against the
  file handle, returning ESTALE on mismatch.
- Maintain backward compatibility: without `FUSE_ATTR_GENERATION` the
  generation field in attr replies is ignored.

Verification:
Tested with a QEMU harness in fuse-generation-qemu against a patched
libfuse (FUSE_CAP_ATTR_GENERATION, fuse_reply_attr_with_generation) and
its passthrough_ll example reporting real backing-filesystem generation
numbers. The suite verifies that:
1.  The generation from `LOOKUP` reaches `name_to_handle_at()` file
    handles and matches the backing filesystem's FS_IOC_GETVERSION.
2.  `open_by_handle_at()` succeeds for a valid handle and fails with
    ESTALE for a handle whose generation does not match, both while the
    inode is cached and after cache eviction.
3.  When a `GETATTR` reply reports a new generation for a cached inode
    (inode recycling), the kernel marks the inode bad: fstat() on an
    open fd fails with EIO, while a fresh path lookup recovers and
    pre-recycling file handles fail with ESTALE.

Signed-off-by: Russell Harmon <russ@har.mn>
Assisted-by: Gemini:gemini-3.1
---
 Documentation/filesystems/fuse/fuse.rst | 32 +++++++++++++++++++++++++
 fs/fuse/dir.c                           | 21 +++++++++++-----
 fs/fuse/fuse_i.h                        | 10 ++++++--
 fs/fuse/inode.c                         | 23 ++++++++++++------
 fs/fuse/readdir.c                       |  2 +-
 include/uapi/linux/fuse.h               |  9 ++++++-
 6 files changed, 80 insertions(+), 17 deletions(-)

diff --git a/Documentation/filesystems/fuse/fuse.rst b/Documentation/filesystems/fuse/fuse.rst
index 0fbd5a03fdc9..f67bc9fc6316 100644
--- a/Documentation/filesystems/fuse/fuse.rst
+++ b/Documentation/filesystems/fuse/fuse.rst
@@ -49,6 +49,38 @@ using the sftp protocol.
 The userspace library and utilities are available from the
 `FUSE homepage: <https://github.com/libfuse/>`_
 
+NFS export support
+==================
+
+FUSE filesystems can be exported via NFS if the filesystem daemon supports it.
+For reliable NFS export, the filesystem should provide a unique inode
+generation number for each inode. This generation number is used by the
+NFS server to distinguish between different file instances that may
+share the same inode number (e.g. after an inode number is reused).
+
+The inode generation number is provided by the filesystem daemon in the
+following messages:
+
+- `FUSE_LOOKUP`
+- `FUSE_GETATTR` (see below)
+- `FUSE_SETATTR` (see below)
+- `FUSE_READDIRPLUS`
+- `FUSE_CREATE` / `FUSE_TMPFILE` / `FUSE_MKNOD` / `FUSE_MKDIR` / `FUSE_SYMLINK` / `FUSE_LINK`
+
+A daemon that keeps the generation number in its `FUSE_GETATTR` and
+`FUSE_SETATTR` replies (the `generation` field of `fuse_attr_out`,
+protocol 7.46) must announce this by setting `FUSE_ATTR_GENERATION` in
+its `FUSE_INIT` reply flags. When the flag is negotiated, the kernel
+compares the generation in every getattr/setattr reply against the
+cached inode: a mismatch means the daemon has reused the node ID for a
+different file, and the cached inode is marked bad (subsequent
+operations on it fail with EIO). Without the flag, the field is ignored
+and the generation is only taken from lookup-type replies, preserving
+the behavior of existing filesystems.
+
+If the filesystem daemon does not provide a generation number, the kernel
+will use a default value of 0.
+
 Filesystem type
 ===============
 
diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index e49b4e874b15..8f0822847337 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -456,7 +456,7 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 		forget_all_cached_acls(inode);
 		fuse_change_attributes(inode, &outarg.attr, NULL,
 				       ATTR_TIMEOUT(&outarg),
-				       attr_version);
+				       attr_version, outarg.generation);
 		fuse_change_entry_timeout(entry, &outarg);
 	} else if (inode) {
 		fi = get_fuse_inode(inode);
@@ -1476,7 +1476,8 @@ static int fuse_do_statx(struct mnt_idmap *idmap, struct inode *inode,
 	fuse_statx_to_attr(&outarg.stat, &attr);
 	if ((sx->mask & STATX_BASIC_STATS) == STATX_BASIC_STATS) {
 		fuse_change_attributes(inode, &attr, &outarg.stat,
-				       ATTR_TIMEOUT(&outarg), attr_version);
+				       ATTR_TIMEOUT(&outarg), attr_version,
+				       inode->i_generation);
 	}
 
 	if (stat) {
@@ -1521,14 +1522,17 @@ static int fuse_do_getattr(struct mnt_idmap *idmap, struct inode *inode,
 	args.out_args[0].value = &outarg;
 	err = fuse_simple_request(fm, &args);
 	if (!err) {
+		u64 generation = fm->fc->attr_generation ?
+				  outarg.generation : inode->i_generation;
+
 		if (fuse_invalid_attr(&outarg.attr) ||
-		    inode_wrong_type(inode, outarg.attr.mode)) {
+		    fuse_stale_inode(inode, generation, &outarg.attr)) {
 			fuse_make_bad(inode);
 			err = -EIO;
 		} else {
 			fuse_change_attributes(inode, &outarg.attr, NULL,
 					       ATTR_TIMEOUT(&outarg),
-					       attr_version);
+					       attr_version, generation);
 			if (stat)
 				fuse_fillattr(idmap, inode, &outarg.attr, stat);
 		}
@@ -2160,6 +2164,7 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	bool trust_local_cmtime = is_wb;
 	bool fault_blocked = false;
 	u64 attr_version;
+	u64 generation;
 
 	if (!fc->default_permissions)
 		attr->ia_valid |= ATTR_FORCE;
@@ -2252,8 +2257,11 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		goto error;
 	}
 
+	generation = fc->attr_generation ? outarg.generation :
+					   inode->i_generation;
+
 	if (fuse_invalid_attr(&outarg.attr) ||
-	    inode_wrong_type(inode, outarg.attr.mode)) {
+	    fuse_stale_inode(inode, generation, &outarg.attr)) {
 		fuse_make_bad(inode);
 		err = -EIO;
 		goto error;
@@ -2279,7 +2287,8 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 
 	fuse_change_attributes_common(inode, &outarg.attr, NULL,
 				      ATTR_TIMEOUT(&outarg),
-				      fuse_get_cache_mask(inode), 0);
+				      fuse_get_cache_mask(inode), 0,
+				      generation);
 	oldsize = inode->i_size;
 	/* see the comment in fuse_change_attributes() */
 	if (!is_wb || is_truncate)
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index c8d4c5f3af7e..cfeb98c217a2 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -514,6 +514,12 @@ struct fuse_conn {
 	 */
 	unsigned export_support:1;
 
+	/**
+	 * @attr_generation: Filesystem fills the generation field of
+	 * fuse_attr_out in GETATTR and SETATTR replies. Only set in INIT
+	 */
+	unsigned attr_generation:1;
+
 	/** @writeback_cache: write-back cache policy (default is write-through) */
 	unsigned writeback_cache:1;
 
@@ -988,12 +994,12 @@ void fuse_init_symlink(struct inode *inode);
  */
 void fuse_change_attributes(struct inode *inode, struct fuse_attr *attr,
 			    struct fuse_statx *sx,
-			    u64 attr_valid, u64 attr_version);
+			    u64 attr_valid, u64 attr_version, u64 generation);
 
 void fuse_change_attributes_common(struct inode *inode, struct fuse_attr *attr,
 				   struct fuse_statx *sx,
 				   u64 attr_valid, u32 cache_mask,
-				   u64 evict_ctr);
+				   u64 evict_ctr, u64 generation);
 
 u32 fuse_get_cache_mask(struct inode *inode);
 
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index e9552be3637b..584dce2b21fd 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -210,7 +210,7 @@ static ino_t fuse_squash_ino(u64 ino64)
 void fuse_change_attributes_common(struct inode *inode, struct fuse_attr *attr,
 				   struct fuse_statx *sx,
 				   u64 attr_valid, u32 cache_mask,
-				   u64 evict_ctr)
+				   u64 evict_ctr, u64 generation)
 {
 	struct fuse_conn *fc = get_fuse_conn(inode);
 	struct fuse_inode *fi = get_fuse_inode(inode);
@@ -240,6 +240,7 @@ void fuse_change_attributes_common(struct inode *inode, struct fuse_attr *attr,
 	inode->i_uid     = make_kuid(fc->user_ns, attr->uid);
 	inode->i_gid     = make_kgid(fc->user_ns, attr->gid);
 	inode->i_blocks  = attr->blocks;
+	inode->i_generation = generation;
 
 	/* Sanitize nsecs */
 	attr->atimensec = min_t(u32, attr->atimensec, NSEC_PER_SEC - 1);
@@ -313,7 +314,8 @@ u32 fuse_get_cache_mask(struct inode *inode)
 
 static void fuse_change_attributes_i(struct inode *inode, struct fuse_attr *attr,
 				     struct fuse_statx *sx, u64 attr_valid,
-				     u64 attr_version, u64 evict_ctr)
+				     u64 attr_version, u64 evict_ctr,
+				     u64 generation)
 {
 	struct fuse_conn *fc = get_fuse_conn(inode);
 	struct fuse_inode *fi = get_fuse_inode(inode);
@@ -348,7 +350,7 @@ static void fuse_change_attributes_i(struct inode *inode, struct fuse_attr *attr
 
 	old_mtime = inode_get_mtime(inode);
 	fuse_change_attributes_common(inode, attr, sx, attr_valid, cache_mask,
-				      evict_ctr);
+				      evict_ctr, generation);
 
 	oldsize = inode->i_size;
 	/*
@@ -391,9 +393,10 @@ static void fuse_change_attributes_i(struct inode *inode, struct fuse_attr *attr
 
 void fuse_change_attributes(struct inode *inode, struct fuse_attr *attr,
 			    struct fuse_statx *sx, u64 attr_valid,
-			    u64 attr_version)
+			    u64 attr_version, u64 generation)
 {
-	fuse_change_attributes_i(inode, attr, sx, attr_valid, attr_version, 0);
+	fuse_change_attributes_i(inode, attr, sx, attr_valid, attr_version, 0,
+				 generation);
 }
 
 static void fuse_init_submount_lookup(struct fuse_submount_lookup *sl,
@@ -514,7 +517,7 @@ struct inode *fuse_iget(struct super_block *sb, u64 nodeid,
 	spin_unlock(&fi->lock);
 done:
 	fuse_change_attributes_i(inode, attr, NULL, attr_valid, attr_version,
-				 evict_ctr);
+				 evict_ctr, generation);
 	if (is_new_inode)
 		unlock_new_inode(inode);
 	return inode;
@@ -1063,6 +1066,10 @@ static struct dentry *fuse_get_dentry(struct super_block *sb,
 		goto out_err;
 
 	inode = ilookup5(sb, handle->nodeid, fuse_inode_eq, &handle->nodeid);
+	if (inode && inode->i_generation != handle->generation) {
+		iput(inode);
+		inode = NULL;
+	}
 	if (!inode) {
 		struct fuse_entry_out outarg;
 
@@ -1399,6 +1406,8 @@ static void process_init_reply(struct fuse_args *args, int error)
 			}
 			if (flags & FUSE_NO_EXPORT_SUPPORT)
 				fm->sb->s_export_op = &fuse_export_fid_operations;
+			if (flags & FUSE_ATTR_GENERATION)
+				fc->attr_generation = 1;
 			if (flags & FUSE_ALLOW_IDMAP) {
 				if (fc->default_permissions)
 					fm->sb->s_iflags &= ~SB_I_NOIDMAP;
@@ -1468,7 +1477,7 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 		FUSE_SECURITY_CTX | FUSE_CREATE_SUPP_GROUP |
 		FUSE_HAS_EXPIRE_ONLY | FUSE_DIRECT_IO_ALLOW_MMAP |
 		FUSE_NO_EXPORT_SUPPORT | FUSE_HAS_RESEND | FUSE_ALLOW_IDMAP |
-		FUSE_REQUEST_TIMEOUT;
+		FUSE_REQUEST_TIMEOUT | FUSE_ATTR_GENERATION;
 #ifdef CONFIG_FUSE_DAX
 	if (fm->fc->dax)
 		flags |= FUSE_MAP_ALIGNMENT;
diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index d2599043f7ec..40781f365fc5 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -229,7 +229,7 @@ static int fuse_direntplus_link(struct file *file,
 		forget_all_cached_acls(inode);
 		fuse_change_attributes(inode, &o->attr, NULL,
 				       ATTR_TIMEOUT(o),
-				       attr_version);
+				       attr_version, o->generation);
 		/*
 		 * The other branch comes via fuse_iget()
 		 * which bumps nlookup inside
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 7435e09c87fe..143560dc029f 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -248,6 +248,10 @@
  *  - add bufpool offset field to fuse_uring_ent_in_out struct
  *  - add FUSE_URING_ZERO_COPY, FUSE_URING_ENT_ZERO_COPY, and
  *    FOPEN_IO_URING_ZERO_COPY flag
+ *
+ *  7.47
+ *  - add generation to fuse_attr_out
+ *  - add FUSE_ATTR_GENERATION
  */
 
 #ifndef _LINUX_FUSE_H
@@ -464,6 +468,8 @@ struct fuse_file_lock {
  * FUSE_REQUEST_TIMEOUT: kernel supports timing out requests.
  *			 init_out.request_timeout contains the timeout (in secs)
  * FUSE_HAS_IO_URING_BUFPOOL: kernel supports io-uring buffer pools
+ * FUSE_ATTR_GENERATION: filesystem fills the generation field of
+ *			 fuse_attr_out in GETATTR and SETATTR replies
  */
 #define FUSE_ASYNC_READ		(1 << 0)
 #define FUSE_POSIX_LOCKS	(1 << 1)
@@ -512,6 +518,7 @@ struct fuse_file_lock {
 #define FUSE_OVER_IO_URING	(1ULL << 41)
 #define FUSE_REQUEST_TIMEOUT	(1ULL << 42)
 #define FUSE_HAS_IO_URING_BUFPOOL (1ULL << 43)
+#define FUSE_ATTR_GENERATION	(1ULL << 44)
 
 /**
  * CUSE INIT request/reply flags
@@ -742,7 +749,7 @@ struct fuse_getattr_in {
 struct fuse_attr_out {
 	uint64_t	attr_valid;	/* Cache timeout for the attributes */
 	uint32_t	attr_valid_nsec;
-	uint32_t	dummy;
+	uint32_t	generation;
 	struct fuse_attr attr;
 };
 
-- 
2.43.0

