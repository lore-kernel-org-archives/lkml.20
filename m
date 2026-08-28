Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D681EB19B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787901640; cv=none; b=Oc8tm+1NBE9ztbMdvak9I4Jr/Sd5ca0MYC7F3+RrVUepmXhdSEQzv8INyqx/AppAokPsWZFkxBhOe2ce/r9BHZ/GubNgI4zBG+xEcZiQrp1T5Ixr6QJElkSmuZeYBEhrAb7TyOe/LfDv6rC686D6iIGwKve3bYwiiAn61Qza15s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787901640; c=relaxed/simple;
	bh=VG+hXsLXq4BKugwwvzbh3RHjloZDs7ndG/ibMSNUMWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A0jfafVFYQzbEq0h5NvvTBDwb36MErIFN51Anuc6x+AKYH+Mov3nszha99/rcP4fV9lSPifY4fTc37uJubusqBFq/CSxflCRMacPOM9/XDVrz9G19nem9hbDrLrG3YpUphQ0GfDFkQE2BvkEWZBaQ61QNut/6QZuYif4ui9Q90k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hb/Zx2lv; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hb/Zx2lv"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d58efc7356so6351245ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787901638; x=1788506438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpJQdL71fncq3A1DKuUk0L7Wkeu7zNdyUOmsnNXN+mE=;
        b=hb/Zx2lvnNwNG/uDdGkdRSRwTjZRmb5SnVwcwoxxkbPG4JLwTSjk209jdkq6ivhcQX
         OZAtNgELQcEC4FBtH1JH9gBrdrbWgpdtPGBdv6LtESQfIruHs64r8Na2EFmVTh1JFfvG
         +isPfsuvj8wHAgWnoPVI347yrxIbgCqNLeHdrmCexE1op2nQlj2HmzsSB04mfLJiDdgB
         f3xtGeBDFjx3G2wZI8vGlRfyr2PUmHGw7IW3VA3W2H7N8ByqsKfmQagE2J/zDS9c4muw
         rx5awAS2Ls0eqb04M+BKjcHu+x9ku4GtBTlEf3WYMN2w9rKwd/ipTlPvtqFe0fOFpSyh
         8jFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787901638; x=1788506438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpJQdL71fncq3A1DKuUk0L7Wkeu7zNdyUOmsnNXN+mE=;
        b=iogcW5zdOGhVdmRah1GXgTTXpBfbjV+d21v+OreHtZF2dGzs7an24+TniIvRADVkPO
         BT3edZEoEnOqu1XTsgAKke5Xab0rgwWGa+8pQ6xV5y9FHOjEZ6GcJl05n35qg9Iq9yZf
         oRn73+ZT9FILUsZ30sNFWKWEoxh4vxPvhKKNiLvcZxMY/ZAtEY0sxYnyCySKzZH0JGLr
         5okMBKr6e7/l7EA3Db7lKtvLQMGNyt/tB6L0RIpZbzk+aYtjZDi6AAIFDA7dqTKAXYgP
         NzyOf2wB9hFWSw/rlpeHiCcXaEZ+aBExKF4/6D9Lki8ptz/WbrbjRbzpEymv+XdwTPgk
         Y4UQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQbYxBrcucKsk1c23vnsWITriwha6aRaDHtTg5616O0bzJIpAxWaBWfeK3UQ+c1ewDTREWxiC3kQOjuJw=@vger.kernel.org
X-Gm-Message-State: AFuF++nEU/3NNJKqsnBRFYZaK2OAiLz2OF/uLRVJrPFS1NITOvdT0emk
	vDFm6U81sKv0kqnfasZ6rXKLjULmFrdcmtVgW2MN++64PuJhSdQyQ4V3hRLDbg==
X-Gm-Gg: AR+sD13Amy/csrdGTaFTIkkrWCDGNHFTXJQAmo4MK/YcmibQmTBLR4XPi2aCYu/r5gM
	nkHcdSwMCBBD1a76yuvihhd3rlKSSXMBHpoq8wAw3x1HjMe7yBOIBPR4F/LQtBQERtoghB1q0iF
	P1XWrkqolGWb6tyBidbbPaSH9seNIaxMsaayDxoNP0OSN4JMRLBNYwm+Y8woIE8o1AdykGR65RA
	GiD/BLO04b9Enbqb8MSYAw9ZXMg4AMV8oigVmZJkWHguUcWyyHy/x3WOMZHDgzbIfJ1/TnbYoX3
	eZBjIazW1QMc23sBtx1wUfaXid4gHUp5BvMgJafDDl2qI0e5e6V4ct/xVB0lj8QZNl0Z3nR3rzj
	Mg/FlfTW3A7mDlfUjbHhLvl4wd+ESj7PrXlhiWV48KXz4Qx8K8OylEehkuB/4Iz1M94xmyI1ryX
	40OxTMAnaI/whPfoxsHOcjJU+cGeLlGq0hhaBJq34N5NWJ+j4PCkj7d/NMLMA2C+EfjvQqrzBX+
	XjIuQ==
X-Received: by 2002:a17:90b:380a:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-396d0daf810mr9330220a91.5.1787901638253;
        Fri, 28 Aug 2026 00:20:38 -0700 (PDT)
Received: from jeuk-MS-7D42.. ([211.226.54.223])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea7fa9sm6123731a91.4.2026.08.28.00.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:20:37 -0700 (PDT)
From: Jeuk Kim <jeuk20.kim@gmail.com>
X-Google-Original-From: Jeuk Kim <jeuk20.kim@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Yohan Joung <jyh429@gmail.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	j-young.choi@samsung.com,
	yunjae00.jo@samsung.com,
	keosung.park@samsung.com,
	Jeuk Kim <jeuk20.kim@samsung.com>
Subject: [PATCH 3/3] f2fs: add ioctl to force out-place-update per file
Date: Fri, 28 Aug 2026 16:20:17 +0900
Message-ID: <20260828072017.44569-4-jeuk20.kim@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828072017.44569-1-jeuk20.kim@samsung.com>
References: <20260828072017.44569-1-jeuk20.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Out-place-update can only be enabled for an entire filesystem, via the
"mode=lfs" mount option or the ipu_policy sysfs entry. There is no way
to force OPU on a single file. Add F2FS_OPU_FL and
F2FS_IOC_{SET,GET}_OPU_FILE to control OPU on a per-file basis.

Reject OPU for pinned, swap, and device-alias files because they require
stable block addresses. The flag forces OPU without enabling LFS mode,
so block allocation may still use SSR.

The flag is kept in the on-disk i_flags word, so it survives umount and
inode eviction. An older kernel preserves the bit but ignores it and
applies its normal update policy to the file.

Signed-off-by: Jeuk Kim <jeuk20.kim@samsung.com>
---
 fs/f2fs/data.c            | 25 ++++++++++----
 fs/f2fs/f2fs.h            |  9 ++++-
 fs/f2fs/file.c            | 69 +++++++++++++++++++++++++++++++++++++--
 include/uapi/linux/f2fs.h |  2 ++
 4 files changed, 95 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 618e6fc2da0c..2babfcf1dae5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1639,12 +1639,13 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	unsigned int start_pgofs;
 	int bidx = 0;
 	bool is_hole;
-	bool lfs_dio_write;
+	bool opu_dio_write;
 
 	if (!maxblocks)
 		return 0;
 
-	lfs_dio_write = (flag == F2FS_GET_BLOCK_DIO && f2fs_should_opu(inode) &&
+	opu_dio_write = (flag == F2FS_GET_BLOCK_DIO &&
+				f2fs_should_opu(inode) &&
 				map->m_may_create);
 
 	if (!map->m_may_create && f2fs_map_blocks_cached(inode, map, flag)) {
@@ -1685,7 +1686,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 
 next_dnode:
 	if (map->m_may_create) {
-		if (f2fs_lfs_mode(sbi))
+		if (f2fs_lfs_mode(sbi) || f2fs_is_opu_file(inode))
 			f2fs_balance_fs(sbi, true);
 		f2fs_map_lock(sbi, &lc, flag);
 	}
@@ -1715,9 +1716,10 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 		goto sync_out;
 	}
 
-	/* use out-place-update for direct IO under LFS mode */
+	/* use out-place-update for direct IO under LFS mode or on OPU files */
 	if (map->m_may_create && (is_hole ||
-		(flag == F2FS_GET_BLOCK_DIO && f2fs_should_opu(inode) &&
+		(flag == F2FS_GET_BLOCK_DIO &&
+		f2fs_should_opu(inode) &&
 		map->m_last_pblk != blkaddr))) {
 		if (unlikely(f2fs_cp_error(sbi))) {
 			err = -EIO;
@@ -1804,13 +1806,13 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 		if (map->m_multidev_dio)
 			map->m_bdev = FDEV(bidx).bdev;
 
-		if (lfs_dio_write)
+		if (opu_dio_write)
 			map->m_last_pblk = NULL_ADDR;
 	} else if (map_is_mergeable(sbi, map, blkaddr, flag, bidx, ofs)) {
 		ofs++;
 		map->m_len++;
 	} else {
-		if (lfs_dio_write)
+		if (opu_dio_write)
 			map->m_last_pblk = blkaddr;
 		goto sync_out;
 	}
@@ -2862,6 +2864,9 @@ bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio)
 	if (f2fs_is_pinned_file(inode))
 		return true;
 
+	if (f2fs_is_opu_file(inode))
+		return false;
+
 	/* if this is cold file, we should overwrite to avoid fragmentation */
 	if (file_is_cold(inode) && !is_inode_flag_set(inode, FI_OPU_WRITE))
 		return true;
@@ -2899,6 +2904,9 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 	if (is_inode_flag_set(inode, FI_OPU_WRITE))
 		return true;
 
+	if (f2fs_is_opu_file(inode))
+		return true;
+
 	if (fio) {
 		if (page_private_gcing(fio->page))
 			return true;
@@ -4357,6 +4365,9 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
 	if (f2fs_readonly(sbi->sb))
 		return -EROFS;
 
+	if (f2fs_is_opu_file(inode))
+		return -EINVAL;
+
 	if (f2fs_lfs_mode(sbi) && !f2fs_sb_has_blkzoned(sbi)) {
 		f2fs_err(sbi, "Swapfile not supported in LFS mode");
 		return -EINVAL;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e85d4db3a401..79f3f365432a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3322,6 +3322,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
 #define F2FS_NOCOMP_FL			0x00000400 /* Don't compress */
 #define F2FS_INDEX_FL			0x00001000 /* hash-indexed directory */
 #define F2FS_DIRSYNC_FL			0x00010000 /* dirsync behaviour (directories only) */
+#define F2FS_OPU_FL			0x01000000 /* File always uses out-place-update */
 #define F2FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
 #define F2FS_CASEFOLD_FL		0x40000000 /* Casefolded file */
 #define F2FS_DEVICE_ALIAS_FL		0x80000000 /* File for aliasing a device */
@@ -3598,6 +3599,11 @@ static inline bool f2fs_is_pinned_file(struct inode *inode)
 	return is_inode_flag_set(inode, FI_PIN_FILE);
 }
 
+static inline bool f2fs_is_opu_file(struct inode *inode)
+{
+	return F2FS_I(inode)->i_flags & F2FS_OPU_FL;
+}
+
 static inline bool f2fs_is_atomic_file(struct inode *inode)
 {
 	return is_inode_flag_set(inode, FI_ATOMIC_FILE);
@@ -4944,7 +4950,8 @@ static inline bool f2fs_should_opu(struct inode *inode)
 	if (f2fs_is_pinned_file(inode))
 		return false;
 
-	return f2fs_lfs_mode(F2FS_I_SB(inode));
+	return f2fs_lfs_mode(F2FS_I_SB(inode)) ||
+		f2fs_is_opu_file(inode);
 }
 
 static inline bool f2fs_is_sequential_zone_area(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 37d4e5c8dbcb..09731ad05d70 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3558,6 +3558,9 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 		goto done;
 	} else if (f2fs_is_pinned_file(inode)) {
 		goto done;
+	} else if (f2fs_is_opu_file(inode)) {
+		ret = -EINVAL;
+		goto out;
 	}
 
 	if (F2FS_HAS_BLOCKS(inode)) {
@@ -3606,6 +3609,62 @@ static int f2fs_ioc_get_pin_file(struct file *filp, unsigned long arg)
 	return put_user(pin, (u32 __user *)arg);
 }
 
+static int f2fs_ioc_set_opu_file(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	__u32 opu;
+	int ret;
+
+	if (get_user(opu, (__u32 __user *)arg))
+		return -EFAULT;
+
+	if (!S_ISREG(inode->i_mode))
+		return -EINVAL;
+
+	if (f2fs_readonly(sbi->sb))
+		return -EROFS;
+
+	ret = mnt_want_write_file(filp);
+	if (ret)
+		return ret;
+
+	inode_lock(inode);
+
+	if (!opu) {
+		/*
+		 * Direct writes issued while the flag was set may still be in
+		 * flight with their blocks unwritten, so drain them before
+		 * f2fs_file_read_iter() stops serializing against them.
+		 */
+		if (f2fs_is_opu_file(inode))
+			inode_dio_wait(inode);
+		fi->i_flags &= ~F2FS_OPU_FL;
+		goto done;
+	}
+
+	if (f2fs_is_pinned_file(inode) || IS_DEVICE_ALIASING(inode)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	fi->i_flags |= F2FS_OPU_FL;
+done:
+	f2fs_mark_inode_dirty_sync(inode, true);
+	f2fs_update_time(sbi, REQ_TIME);
+out:
+	inode_unlock(inode);
+	mnt_drop_write_file(filp);
+	return ret;
+}
+
+static int f2fs_ioc_get_opu_file(struct file *filp, unsigned long arg)
+{
+	return put_user(f2fs_is_opu_file(file_inode(filp)) ? 1 : 0,
+			(__u32 __user *)arg);
+}
+
 static int f2fs_ioc_get_dev_alias_file(struct file *filp, unsigned long arg)
 {
 	return put_user(IS_DEVICE_ALIASING(file_inode(filp)) ? 1 : 0,
@@ -4740,6 +4799,10 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_get_dev_alias_file(filp, arg);
 	case F2FS_IOC_IO_PRIO:
 		return f2fs_ioc_io_prio(filp, arg);
+	case F2FS_IOC_SET_OPU_FILE:
+		return f2fs_ioc_set_opu_file(filp, arg);
+	case F2FS_IOC_GET_OPU_FILE:
+		return f2fs_ioc_get_opu_file(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -4936,8 +4999,8 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 
 	dio = f2fs_should_use_dio(inode, iocb, to);
 
-	/* In LFS mode, if there is inflight dio, wait for its completion */
-	if (f2fs_lfs_mode(F2FS_I_SB(inode)) &&
+	/* For OPU direct writes, wait for any inflight dio to complete */
+	if ((f2fs_lfs_mode(F2FS_I_SB(inode)) || f2fs_is_opu_file(inode)) &&
 	    get_pages(F2FS_I_SB(inode), F2FS_DIO_WRITE) &&
 		(!f2fs_is_pinned_file(inode) || !dio))
 		inode_dio_wait(inode);
@@ -5522,6 +5585,8 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_COMPRESS_FILE:
 	case F2FS_IOC_GET_DEV_ALIAS_FILE:
 	case F2FS_IOC_IO_PRIO:
+	case F2FS_IOC_SET_OPU_FILE:
+	case F2FS_IOC_GET_OPU_FILE:
 		break;
 	default:
 		return -ENOIOCTLCMD;
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 795e26258355..ebfef7e88bcb 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -45,6 +45,8 @@
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
 #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
 #define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 27, __u32)
+#define F2FS_IOC_SET_OPU_FILE		_IOW(F2FS_IOCTL_MAGIC, 28, __u32)
+#define F2FS_IOC_GET_OPU_FILE		_IOR(F2FS_IOCTL_MAGIC, 29, __u32)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
-- 
2.43.0

