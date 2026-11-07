Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079193;
	b=oXhzoos/vIgIs/ASJ7ASRl3VV+xMbefdWnXKeb9Zmo2L4bt44ntP0yabcV2WjoIBNDGs
	 BsOxBuXn4mibMAeqZVMMSLk0E4/fGmOS6CdpajOcGUb0DywDMo6+IQlrNlyxyOoxHp79A
	 buY7wr1vuYJszeEVxLvMPk9rsr1gnFArGn3tN64t2mLzK8mEs4GsG5uU6XGpgI8cRwqsO
	 AfQ4buNz6p/35sWMz0NA0BwOwCThCIPa5U6P80QWumZd2yyqaHXptS/nEKAh0MskwdeSg
	 n0QyQdhvZZhX3kXMl5fQzilN9PE8TLHSkIbJpv0vZTZjGmOh4b6wRxR9zjSmokhCZNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=h8oA7FIyldZm29brP7Xm78pocmtf8op2nPzHO2pfJAE=;
	b=BGQ8tcoMuXrZwVXA45T1GZrY/7zhnBBWS2fUgXyrTVBSHn9FTUahMgWJYvC8kTJezLsA
	 3kS0SfFxOOm3tomzOrGWeZfIDd9r6ykZttWl1OnbwcOnTCRgCkwWTuQC/42DQGa68LTag
	 zEVrf7wyT24cAj0IUFVGooZa+8vQlFxw1BvWrrAR2TQ+J1cbSBtr2TfZWNsYEktA3tyGT
	 I9r7WP9CBOuLKwLtckRwFfHWgTHZVxpnOGlVrkq74umR4zD3JzQU8O2MPooK2Vi8LCF88
	 1+WYsyH4rO8y+8VsDlXORrenFCWA/uuMBsFQXdaYoL1UYNuqJJW6/Z00GzlW2AL6uew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=objz0APX;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822E606D805
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6822E606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=objz0APX
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f079a63b8so186083385a.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1794079192; x=1794683992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8oA7FIyldZm29brP7Xm78pocmtf8op2nPzHO2pfJAE=;
        b=objz0APX2h3BoSLYhunERXBrQOFXOLK7RmMMrZKH/9474F/fDTEcehsC+ZRCZGS9az
         CDFxzeyEa9tog9AQMqE9G3NaE4Ewy4OXS+egF/jazekDU0vmXJZ89l7dPFL3at2sO8mh
         lW+ADbqxLz9MEFqTK19Rs3Nsf88Ideq3zbofTBksQ9qIsvCxt/3qOHAZEEI/xheA+e6B
         0U73mtcDNw4//NdF3mPPLGWGo988bgfd1aYeHxAW6eC5QePx8+QfZfyyyFfurXi+crzv
         EcLtcmuwtIIMr6lgjUZv146NFkzDb+ioh8N2PseOEHosUYvtOUpIKtsL87Lelt0XRqPL
         RqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079192; x=1794683992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8oA7FIyldZm29brP7Xm78pocmtf8op2nPzHO2pfJAE=;
        b=nWfWJ69BNrFbl9L+UYPJiL4ZvIvRFPQu/6Ax/MlrkMGz3KjPS3Fvr6UNkKrU7PSPCv
         V+YHVV91KJA7pireSST7dVAtPs0ZDKkPvjhtftftUrqIFm2AzWXYv3EVGYAsaDKEsX2x
         i1ylSjqX2h/wKEq44ewLygO0o5DRHAe5WlU7Jts5aJnUzJrrM5jdnxtRXh+6k3RszbV0
         EGf4FB3sLgWjUc5ZZwC59/+EmfggK0CCDfIJi6ZtV+0rO5IXSRKmK4sDvtdMD2AQSJp7
         9pIrHpeY77YDQZNdP++WSvYPrljWwHVNaGf++JyZWYpXhJ++X4XbclMBxo0tbLJAeeZc
         dzUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJ+S6CwtMbo0uRzIVegPfwrZsr0M1nB3p7gtePabv8mBgfQy4PvVhvw63T2WItLGAeqy+PN6qEoMRSAVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C3C6PSLKPGkd/OU6OOerx8MQbvmMRWcwFlVbe/AHNN4FPCtM+
	HYMTIZBtF9WnnCdeqof5PFkwm8C50nnBdImbhltCdeX76lMwy/4GR5XB1/CG+V8xAdw=
X-Gm-Gg: AYBFou0M4iolKc3S2KIKHPRUCzkSBi2m1oO5guJVL49SG94LU3tVH+gJvpN1qvvxgPk
	XpmU/x0h4PMoFISX4MAJ/OBh+Gt9HKZ5lOEd5M9AaRBAwx/6GSOaLhAngDuSjRS8kTd5W+OkMlu
	kcdfI81SoeUzktLbf5yfE0F5hA5mQ7r8DZCSklucUcXepZ5pJ2cxKtPSj/O0djI0YZE8swZlhFp
	FrWpRFGbFxr5wqWXAfp5ELi/RFzrYXs5/JhI7CkgHvcNbdnxtuvHow1uVrwEg1pG/kSZpdYwWF0
	HhMmhJ+la59BnnUQ5qXceBy9kenNJerm17BhbvpOaIPjB+Kj0VQBGVhOHxO8mloM1E248Lrud6T
	ppQWTHepYaOdLkboay3HMwm4Svgt3aY/v+pPuKzk624/DFunLp3jbg/K5gCepiQukHvqXfwg+L9
	EhYGPpzS6tEYpHs/BYOpTbRGgP+bGjkqjRRvS3gU2TRGPpkr3TY3Dzz3ZgEH4ccJLtFwlnMj1KK
	uJLRFBW9QhNFJsNWuNbV19ejdqxLUwFZk8NZWBiByInnk9yxMpSraOYFEuzW/QASKaK5k+puSOz
	4HC81MyQMZl6jFfG0cI7PBIhRwKGMMnp26A49LXvfgpR5w==
X-Received: by 2002:a05:620a:27c3:b0:93f:2e08:6420 with SMTP id af79cd13be357-945f34eb751mr926907385a.38.1794079192432;
        Sat, 07 Nov 2026 11:19:52 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782d61c7bsm2805685a.12.2026.11.07.11.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:19:51 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Sat, 07 Nov 2026 19:19:33 +0000
Subject: [PATCH v5 4/8] ovl: mark the overlay inode dirty on modification
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
Message-Id: <20261107-b4-ovl-containerized-sync-v5-4-d34b4ae57fdf@toxicpanda.com>
References: <20261107-b4-ovl-containerized-sync-v5-0-d34b4ae57fdf@toxicpanda.com>
In-Reply-To: <20261107-b4-ovl-containerized-sync-v5-0-d34b4ae57fdf@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1794079181; l=7446;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=WXTL+ckgReh4+uaubXtNeXq5YWuQM1hueJbfbc52D8U=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHD/9we8snDOpXyTQJGAXNiPWEvcbRepdioDPhBB8aXL6T8rrqg40tty4DecwnxXI+EdKiW/RFb
 Q8ZTbGN21NAA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

To sync only what was written through an overlay, we have to know which
upper inodes were modified through it.  Mark the overlay inode dirty when
its upper inode is modified, which puts it on the dirty list of the
overlay's bdi.

Nearly every modification ends in ovl_copyattr(), so do it there.  These do
not, so they mark the inode themselves:

 - copy up, for the inode and for its parent
 - ovl_instantiate(), for a new inode and for a new hard link
 - atime updates
 - shared writable mappings
 - the removal of a stale "impure" xattr in readdir

Do not mark an unhashed inode.  __mark_inode_dirty() would set its dirty
flags without queueing it, and every later call would return early.  The
inode of a lower hardlink is unhashed until ovl_inode_update() hashes it.
The root inode is never hashed, a later patch takes care of it.

Based on work by Chengguang Xu.

Link: https://lore.kernel.org/r/20211122030038.1938875-1-cgxu519@mykernel.net
Suggested-by: Amir Goldstein <amir73il@gmail.com>
Suggested-by: Miklos Szeredi <miklos@szeredi.hu>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/overlayfs/copy_up.c   |  9 +++++++++
 fs/overlayfs/dir.c       |  3 +++
 fs/overlayfs/file.c      |  7 ++++++-
 fs/overlayfs/inode.c     |  4 +++-
 fs/overlayfs/overlayfs.h | 20 ++++++++++++++++++++
 fs/overlayfs/readdir.c   |  1 +
 fs/overlayfs/util.c      | 12 +++++++++++-
 7 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/fs/overlayfs/copy_up.c b/fs/overlayfs/copy_up.c
index e963701b4c87..44bc96aa3d5d 100644
--- a/fs/overlayfs/copy_up.c
+++ b/fs/overlayfs/copy_up.c
@@ -1199,6 +1199,15 @@ static int ovl_copy_up_one(struct dentry *parent, struct dentry *dentry,
 			err = ovl_link_up(&ctx);
 		if (!err && ovl_dentry_needs_data_copy_up_locked(dentry, flags))
 			err = ovl_copy_up_meta_inode_data(&ctx);
+		/*
+		 * All three write to the upper inode, and there may be no later
+		 * write that would mark the overlay inode dirty.  The first two
+		 * also add an entry to the upper inode of the parent, set its
+		 * "impure" xattr and restore its timestamps.
+		 */
+		ovl_mark_inode_dirty(d_inode(dentry));
+		if (parent)
+			ovl_mark_inode_dirty(d_inode(parent));
 		ovl_copy_up_end(dentry);
 	}
 	do_delayed_call(&done);
diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
index 1194ccf981c3..a24326446659 100644
--- a/fs/overlayfs/dir.c
+++ b/fs/overlayfs/dir.c
@@ -331,6 +331,9 @@ static int ovl_instantiate(struct dentry *dentry, struct inode *inode,
 		inc_nlink(inode);
 	}
 
+	/* The upper inode was just created, or has got a new link */
+	ovl_mark_inode_dirty(inode);
+
 	if (tmpfile)
 		d_mark_tmpfile(tmpfile, inode);
 
diff --git a/fs/overlayfs/file.c b/fs/overlayfs/file.c
index 7433220d4ad6..53c5131a0482 100644
--- a/fs/overlayfs/file.c
+++ b/fs/overlayfs/file.c
@@ -472,8 +472,13 @@ static int ovl_mmap(struct file *file, struct vm_area_struct *vma)
 		.cred = ovl_creds(file_inode(file)->i_sb),
 		.accessed = ovl_file_accessed,
 	};
+	int err;
 
-	return backing_file_mmap(of->realfile, vma, &ctx);
+	err = backing_file_mmap(of->realfile, vma, &ctx);
+	/* Stores through the mapping go straight to the upper inode */
+	if (!err && vma_is_shared_maywrite(vma))
+		ovl_mark_inode_dirty(file_inode(file));
+	return err;
 }
 
 static long ovl_fallocate(struct file *file, int mode, loff_t offset, loff_t len)
diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
index 63906b3dafcb..9a4bf7c2502b 100644
--- a/fs/overlayfs/inode.c
+++ b/fs/overlayfs/inode.c
@@ -587,6 +587,7 @@ int ovl_update_time(struct inode *inode, enum fs_update_time type,
 			touch_atime(&upperpath);
 			inode_set_atime_to_ts(inode,
 					      inode_get_atime(d_inode(upperpath.dentry)));
+			ovl_mark_inode_dirty(inode);
 		}
 	}
 	return 0;
@@ -898,7 +899,8 @@ void ovl_inode_init(struct inode *inode, struct ovl_inode_params *oip,
 	oi->lowerdata_redirect = oip->lowerdata_redirect;
 
 	realinode = ovl_inode_real(inode);
-	ovl_copyattr(inode);
+	/* Nothing was changed, the inode is only being looked up */
+	__ovl_copyattr(inode);
 	ovl_copyflags(realinode, inode);
 	ovl_map_ino(inode, ino, fsid);
 }
diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 5b1a097ce543..d82c4bed5af2 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -691,6 +691,25 @@ static inline bool ovl_should_sync_upper_fs(struct ovl_fs *ofs)
 	return ovl_should_sync(ofs) && !ovl_tracks_dirty(ofs);
 }
 
+/*
+ * The upper inode was modified through this overlay.  Put the overlay inode on
+ * the dirty list of the overlay, where syncfs() and unmount find it.
+ *
+ * Do not look at the dirty flags of the upper inode here.  They are cleared
+ * when the writeback of the upper inode starts, not when it completes.
+ *
+ * Do not mark an inode that is not hashed.  __mark_inode_dirty() would set its
+ * dirty flags without putting it on a dirty list, and once the flags are set,
+ * later calls return early.  The overlay inode of a lower hardlink is unhashed
+ * until ovl_inode_update() hashes it, and ovl_copy_up_one() marks it after
+ * that.  The root inode is never hashed, so it is not tracked.
+ */
+static inline void ovl_mark_inode_dirty(struct inode *inode)
+{
+	if (ovl_tracks_dirty(OVL_FS(inode->i_sb)) && !inode_unhashed(inode))
+		mark_inode_dirty(inode);
+}
+
 /*
  * To avoid regressions in existing setups with overlay lower offline changes,
  * we allow lower changes only if none of the new features are used.
@@ -878,6 +897,7 @@ bool ovl_lookup_trap_inode(struct super_block *sb, struct dentry *dir);
 struct inode *ovl_get_trap_inode(struct super_block *sb, struct dentry *dir);
 struct inode *ovl_get_inode(struct super_block *sb,
 			    struct ovl_inode_params *oip);
+void __ovl_copyattr(struct inode *to);
 void ovl_copyattr(struct inode *to);
 
 /* vfs fileattr flags read from overlay.protattr xattr to ovl inode */
diff --git a/fs/overlayfs/readdir.c b/fs/overlayfs/readdir.c
index 7d6f7f6022eb..f02c37600df6 100644
--- a/fs/overlayfs/readdir.c
+++ b/fs/overlayfs/readdir.c
@@ -724,6 +724,7 @@ static struct ovl_dir_cache *ovl_cache_get_impure(const struct path *path)
 		if (!ovl_want_write(dentry)) {
 			ovl_removexattr(ofs, ovl_dentry_upper(dentry),
 					OVL_XATTR_IMPURE);
+			ovl_mark_inode_dirty(inode);
 			ovl_drop_write(dentry);
 		}
 		ovl_clear_flag(OVL_IMPURE, inode);
diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
index 521717209b2e..a260c5a350e2 100644
--- a/fs/overlayfs/util.c
+++ b/fs/overlayfs/util.c
@@ -1492,7 +1492,7 @@ int ovl_sync_status(struct ovl_fs *ofs)
  * map any lower or upper inode owned by id 1001 to id 1000. These mapping
  * helpers are nops when the relevant layer isn't idmapped.
  */
-void ovl_copyattr(struct inode *inode)
+void __ovl_copyattr(struct inode *inode)
 {
 	struct path realpath;
 	struct inode *realinode;
@@ -1516,3 +1516,13 @@ void ovl_copyattr(struct inode *inode)
 	i_size_write(inode, i_size_read(realinode));
 	spin_unlock(&inode->i_lock);
 }
+
+/*
+ * The attributes are copied because the real inode was modified through the
+ * overlay, so this is also where the overlay inode is marked dirty.
+ */
+void ovl_copyattr(struct inode *inode)
+{
+	__ovl_copyattr(inode);
+	ovl_mark_inode_dirty(inode);
+}

-- 
2.55.0

