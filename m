Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C9B3E63AA
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893136; cv=none; b=hJttY3K07wWE/7C6YSnR2nciydsESRTAQXGrwVGK0wWYKeUZxncAAfytC+q5V5H+ycPPnzui3hHT9CG4DOnxtOo0cvElHK9RTWMPoEIGMYxurD8t6l+4DwfcReHSOz/wZVEGtvG7I2976TYuFAxi0Eqhbq8s5DfavwhVb6Uvuyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893136; c=relaxed/simple;
	bh=kV5roBWER2l6GRbizv/KlQDqfe6bAiyeoAyzeAxNCUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ez48dBu+gGsivO7092F5bM42BDhZNt2WP24neBZyKJSdO1l2NV6RaXtqDW9T3AxkwU/XxH6utFJp/xuEskbNJQ6lk4op3UbAzthjKJnoGVyJZ63r0BldEIXLl/Z/dcox5P0AB5YQSli04t+AkayZogfqEdYg6oTQv2AxjSPU3PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DuIAbtME; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DuIAbtME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=QK
	XYQo1UlHyeLmzVKpt21zMJrcTLIeUIX3V2Q0gwJik=; b=DuIAbtMEddCdi5RAAf
	LNFPjrn+HCcyQBKpgSf73PM9D6vpR5vCnQnBg81IDgPLszN6smwrtNQjqTJzDOR/
	zNox3rxx2e/rnRB8j93TljEjTCktvkZ/dsImCNgcj20rA18X6vHU+z0p1Zvd3Z5R
	AsEwOubNpoGnDKGH7RWWIFHn0=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgB3m07lma9qs7GbAQ--.54162S9;
	Sun, 20 Sep 2026 16:31:49 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 07/10] ntfs: add fileattr query support
Date: Sun, 20 Sep 2026 16:31:28 +0800
Message-ID: <20260920083131.1880061-8-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260920083131.1880061-1-liubaolin12138@163.com>
References: <20260920083131.1880061-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgB3m07lma9qs7GbAQ--.54162S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxAry8Zr4xuFy8tryfGr1UGFg_yoWrZF47pF
	Z3AFyfKa1fXFy2g392kFWjvw1Y9ryxWr4UXryxX34IkFnrtr93KF1fK3WruFn5KrZ5A3yj
	qr1YqrWUGr45ZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcb1bUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhUq9GqvmfUkAgAA3G

From: Baolin Liu <liubaolin@kylinos.cn>

Add fileattr_get operations for files and directories, as well as the
existing symlink and special inode operation tables. Report compression,
encryption, immutable and append-only from cached inode state, and
FS_CASEFOLD_FL from the mount-wide case sensitivity policy.

This introduces querying only. It neither reads a private flag EA nor
allows userspace to change the reported flags.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 Documentation/filesystems/ntfs.rst |  8 ++++++++
 fs/ntfs/file.c                     | 33 ++++++++++++++++++++++++++++++
 fs/ntfs/namei.c                    |  1 +
 fs/ntfs/ntfs.h                     |  2 ++
 4 files changed, 44 insertions(+)

diff --git a/Documentation/filesystems/ntfs.rst b/Documentation/filesystems/ntfs.rst
index 4bfa392daec6..0a4c43d6c890 100644
--- a/Documentation/filesystems/ntfs.rst
+++ b/Documentation/filesystems/ntfs.rst
@@ -9,6 +9,7 @@ The Linux NTFS filesystem driver
 
    - Overview
    - Utilities support
+   - Linux file attributes
    - Supported mount options
 
 
@@ -34,6 +35,13 @@ The project is available at:
   https://github.com/ntfsprogs-plus/ntfsprogs-plus
 
 
+Linux file attributes
+=====================
+
+The driver supports querying compression, encryption, immutable, append-only
+and mount-wide case folding through lsattr(1). Case folding is reported
+according to the mount options.
+
 Supported mount options
 =======================
 
diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 99a2c7a5cf81..e5846bf498b0 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -15,6 +15,7 @@
 #include <linux/posix_acl_xattr.h>
 #include <linux/compat.h>
 #include <linux/falloc.h>
+#include <linux/fileattr.h>
 
 #include "lcnalloc.h"
 #include "ntfs.h"
@@ -136,6 +137,35 @@ static int ntfs_file_release(struct inode *vi, struct file *filp)
 	return 0;
 }
 
+/*
+ * ntfs_fileattr_get - inode_operations::fileattr_get
+ * @dentry:	dentry to report the flags of
+ * @fa:		filled in with the flags of @dentry
+ */
+int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
+{
+	struct inode *vi = d_inode(dentry);
+	struct ntfs_inode *ni = NTFS_I(vi);
+	u32 flags = 0;
+
+	if (NVolShutdown(ni->vol))
+		return -EIO;
+
+	if (NInoCompressed(ni) || NInoWofCompressed(ni))
+		flags |= FS_COMPR_FL;
+	if (NInoEncrypted(ni))
+		flags |= FS_ENCRYPT_FL;
+	if (vi->i_flags & S_IMMUTABLE)
+		flags |= FS_IMMUTABLE_FL;
+	if (vi->i_flags & S_APPEND)
+		flags |= FS_APPEND_FL;
+	if (!NVolCaseSensitive(ni->vol))
+		flags |= FS_CASEFOLD_FL;
+
+	fileattr_fill_flags(fa, flags);
+	return 0;
+}
+
 /*
  * ntfs_file_fsync - sync a file to disk
  * @filp:	file to be synced
@@ -1234,6 +1264,7 @@ const struct file_operations ntfs_file_ops = {
 };
 
 const struct inode_operations ntfs_file_inode_ops = {
+	.fileattr_get	= ntfs_fileattr_get,
 	.setattr	= ntfs_setattr,
 	.getattr	= ntfs_getattr,
 	.listxattr	= ntfs_listxattr,
@@ -1243,12 +1274,14 @@ const struct inode_operations ntfs_file_inode_ops = {
 };
 
 const struct inode_operations ntfs_symlink_inode_operations = {
+	.fileattr_get	= ntfs_fileattr_get,
 	.get_link	= ntfs_get_link,
 	.setattr	= ntfs_setattr,
 	.listxattr	= ntfs_listxattr,
 };
 
 const struct inode_operations ntfs_special_inode_operations = {
+	.fileattr_get	= ntfs_fileattr_get,
 	.setattr	= ntfs_setattr,
 	.getattr	= ntfs_getattr,
 	.listxattr	= ntfs_listxattr,
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 3e0adb9a0ea4..ee451700b766 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1548,6 +1548,7 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
  * Inode operations for directories.
  */
 const struct inode_operations ntfs_dir_inode_ops = {
+	.fileattr_get	= ntfs_fileattr_get,
 	.lookup		= ntfs_lookup,	/* VFS: Lookup directory. */
 	.create		= ntfs_create,
 	.unlink		= ntfs_unlink,
diff --git a/fs/ntfs/ntfs.h b/fs/ntfs/ntfs.h
index dd56894762a9..a5c5c18671d2 100644
--- a/fs/ntfs/ntfs.h
+++ b/fs/ntfs/ntfs.h
@@ -183,6 +183,8 @@ extern const struct inode_operations ntfs_dir_inode_ops;
 extern const struct  file_operations ntfs_empty_file_ops;
 extern const struct inode_operations ntfs_empty_inode_ops;
 
+int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
+
 extern const struct export_operations ntfs_export_ops;
 
 /*
-- 
2.51.0

