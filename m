Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12AC332EAE
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789224805; cv=none; b=cJpFhSy/Z+oNX4l3r5G0taPZYsSIwv0KrQR0bgcZgy0HMA+nTp2yc+lLB/1QFY/bo6DiaV9OWWVL2Vb4UBQR31fZI2GyCKUo08pJbYMyn/tw/Vlncas72S81auCl5+AZbbDDgEMHs4bmvBnQnuHDps+bOXq8nRgPCWYMPJc6VbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789224805; c=relaxed/simple;
	bh=OO6eskRTwuBuWZE7eMe57H+rRYhb+rU2YCFwX0X3WEg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NpHem/+jAK1/wDuitaVO1M4yxvu64N/xjujCjuR1B/j4CMYx4VJbsj+umIDAzbv9uXk2mwSrLL7D7ZpuZ9kUeNEdZtrd+uzE29U4U4CZjFokOCD5FlwxxiM8XgQMafIYtnOLsvjGlPq4sJsR2TsSKXLkX5jLGi/NC6N6tzjnY+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aTk6HILc; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aTk6HILc"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6169B1692;
	Sat, 12 Sep 2026 07:53:18 -0700 (PDT)
Received: from e127648.arm.com (unknown [10.57.81.151])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3851D3F7B4;
	Sat, 12 Sep 2026 07:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789224802; bh=OO6eskRTwuBuWZE7eMe57H+rRYhb+rU2YCFwX0X3WEg=;
	h=From:To:Cc:Subject:Date:From;
	b=aTk6HILcukfCR/pIIQxpUixLV2GgxbDNBxxEkNVxnClYAkAPO1px+kuuNUq9KpDjY
	 3cwODDl/kZDajP+bG6SFIrvcQK8JNa6aoB8w9rhV1mOycIpxuxf8VmDpungBqk5KOW
	 kisegiS9/mHuQaQ8nK+KcgIvuNkJwOiOBcHNdonk=
From: Christian Loehle <christian.loehle@arm.com>
To: phillip@squashfs.org.uk
Cc: linux-kernel@vger.kernel.org,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH] squashfs: identify device in mount errors
Date: Sat, 12 Sep 2026 15:53:14 +0100
Message-Id: <20260912145314.788588-1-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Squashfs mount failures reported through fs_context do not identify the
backing device, fix this y printing the block device.

Repeated automount failures used to be ambiguous, for example:
  Filesystem uses "xz" compression. This is not supported

All of the affected errors occur after get_tree_bdev() has opened the
block device and setup_bdev_super() has assigned sb->s_bdev.
Use it to identify the failing Squashfs image even when the mount is
retried. For example, the error above now reads:
  Filesystem on loop0 uses "xz" compression. This is not supported

Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 fs/squashfs/super.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/fs/squashfs/super.c b/fs/squashfs/super.c
index 5dabc5770f1b..90b9d5b18153 100644
--- a/fs/squashfs/super.c
+++ b/fs/squashfs/super.c
@@ -150,26 +150,26 @@ static int squashfs_parse_param(struct fs_context *fc, struct fs_parameter *para
 }
 
 static const struct squashfs_decompressor *supported_squashfs_filesystem(
-	struct fs_context *fc,
+	struct super_block *sb, struct fs_context *fc,
 	short major, short minor, short id)
 {
 	const struct squashfs_decompressor *decompressor;
 
 	if (major < SQUASHFS_MAJOR) {
-		errorf(fc, "Major/Minor mismatch, older Squashfs %d.%d "
-		       "filesystems are unsupported", major, minor);
+		errorf(fc, "Unsupported older Squashfs %d.%d filesystem on %pg",
+		       major, minor, sb->s_bdev);
 		return NULL;
 	} else if (major > SQUASHFS_MAJOR || minor > SQUASHFS_MINOR) {
-		errorf(fc, "Major/Minor mismatch, trying to mount newer "
-		       "%d.%d filesystem", major, minor);
+		errorf(fc, "Major/Minor mismatch, trying to mount newer %d.%d filesystem on %pg",
+		       major, minor, sb->s_bdev);
 		errorf(fc, "Please update your kernel");
 		return NULL;
 	}
 
 	decompressor = squashfs_lookup_decompressor(id);
 	if (!decompressor->supported) {
-		errorf(fc, "Filesystem uses \"%s\" compression. This is not supported",
-		       decompressor->name);
+		errorf(fc, "Filesystem on %pg uses \"%s\" compression. This is not supported",
+		       sb->s_bdev, decompressor->name);
 		return NULL;
 	}
 
@@ -192,7 +192,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	TRACE("Entered squashfs_fill_superblock\n");
 
 	if (!devblksize) {
-		errorf(fc, "squashfs: unable to set blocksize\n");
+		errorf(fc, "squashfs: unable to set blocksize on %pg\n", sb->s_bdev);
 		return -EINVAL;
 	}
 
@@ -221,7 +221,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sblk = squashfs_read_table(sb, SQUASHFS_START, sizeof(*sblk));
 
 	if (IS_ERR(sblk)) {
-		errorf(fc, "unable to read squashfs_super_block");
+		errorf(fc, "unable to read squashfs_super_block on %pg", sb->s_bdev);
 		err = PTR_ERR(sblk);
 		sblk = NULL;
 		goto failed_mount;
@@ -246,7 +246,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	/* Check the MAJOR & MINOR versions and lookup compression type */
 	msblk->decompressor = supported_squashfs_filesystem(
-			fc,
+			sb, fc,
 			le16_to_cpu(sblk->s_major),
 			le16_to_cpu(sblk->s_minor),
 			le16_to_cpu(sblk->compression));
@@ -270,8 +270,8 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	 * block size (by default 128K).  This is currently not supported.
 	 */
 	if (PAGE_SIZE > msblk->block_size) {
-		errorf(fc, "Page size > filesystem block size (%d).  This is "
-		       "currently not supported!", msblk->block_size);
+		errorf(fc, "Page size > filesystem block size (%d) on %pg is not supported",
+		       msblk->block_size, sb->s_bdev);
 		goto failed_mount;
 	}
 
@@ -330,7 +330,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	msblk->read_page = squashfs_cache_init("data",
 		SQUASHFS_READ_PAGES, msblk->block_size);
 	if (IS_ERR(msblk->read_page)) {
-		errorf(fc, "Failed to allocate read_page block");
+		errorf(fc, "Failed to allocate read_page block for %pg", sb->s_bdev);
 		err = PTR_ERR(msblk->read_page);
 		goto failed_mount;
 	}
@@ -369,7 +369,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	msblk->xattr_id_table = squashfs_read_xattr_id_table(sb,
 		xattr_id_table_start, &msblk->xattr_table, &msblk->xattr_ids);
 	if (IS_ERR(msblk->xattr_id_table)) {
-		errorf(fc, "unable to read xattr id index table");
+		errorf(fc, "unable to read xattr id index table on %pg", sb->s_bdev);
 		err = PTR_ERR(msblk->xattr_id_table);
 		msblk->xattr_id_table = NULL;
 		if (err != -ENOTSUPP)
@@ -382,7 +382,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	msblk->id_table = squashfs_read_id_index_table(sb,
 		le64_to_cpu(sblk->id_table_start), next_table, msblk->ids);
 	if (IS_ERR(msblk->id_table)) {
-		errorf(fc, "unable to read id index table");
+		errorf(fc, "unable to read id index table on %pg", sb->s_bdev);
 		err = PTR_ERR(msblk->id_table);
 		msblk->id_table = NULL;
 		goto failed_mount;
@@ -398,7 +398,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	msblk->inode_lookup_table = squashfs_read_inode_lookup_table(sb,
 		lookup_table_start, next_table, msblk->inodes);
 	if (IS_ERR(msblk->inode_lookup_table)) {
-		errorf(fc, "unable to read inode lookup table");
+		errorf(fc, "unable to read inode lookup table on %pg", sb->s_bdev);
 		err = PTR_ERR(msblk->inode_lookup_table);
 		msblk->inode_lookup_table = NULL;
 		goto failed_mount;
@@ -423,7 +423,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	msblk->fragment_index = squashfs_read_fragment_index_table(sb,
 		le64_to_cpu(sblk->fragment_table_start), next_table, fragments);
 	if (IS_ERR(msblk->fragment_index)) {
-		errorf(fc, "unable to read fragment index table");
+		errorf(fc, "unable to read fragment index table on %pg", sb->s_bdev);
 		err = PTR_ERR(msblk->fragment_index);
 		msblk->fragment_index = NULL;
 		goto failed_mount;
@@ -470,7 +470,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	return 0;
 
 insanity:
-	errorf(fc, "squashfs image failed sanity check");
+	errorf(fc, "squashfs image on %pg failed sanity check", sb->s_bdev);
 failed_mount:
 	squashfs_cache_delete(msblk->block_cache);
 	squashfs_cache_delete(msblk->fragment_cache);
-- 
2.34.1

