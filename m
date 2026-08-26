Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA3E368D7B
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751705; cv=none; b=hiGnVvITepOW2MzUtdrWgqViCHpm+Miyii0OgvltslMqH9VXEr242sKlvmU+kJS65Z3Np6OqSUcKQSOMVVsp2V8ud86G9dtX07VLi387UmwGB1S4L0py4redeZKlzK6LVWhOJjj+zjRLvJP2XTKI1+faXzN49KX6pGJWNlQcx4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751705; c=relaxed/simple;
	bh=QZd0NILJX8au3PgC2K06h3ujSUZBBV8dcasg/nYJ3r0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CI9u4/G5HjD1XgDInKGsOkiFaJYWGui1UiZJzxB5jJXRrRZMbBG6ecU/Q4LxIZLtx18fwU3RUWt7Qvs6SuN4BsApJzKnDpjkGVSjnKUBw/uge6Yl2bWwqZY7ylOG7rnRRd9mcITU1ODGIhmC5DhvA37kE+0JmF7h135yUhtByxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/ICyiEN; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/ICyiEN"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d032846c95so13952755ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787751697; x=1788356497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFQ51HJ7fyE1u0r/xRDp9ewL6yDSIMejUbH85HRUqXg=;
        b=X/ICyiENktPMRq7dfLgdQ+mUpTRYwhYn3s8aoVFPF/DdUwkGl9sJzFrHouEtn5rVcs
         MzB9BULgu/JuKbEYMQRWQGrip+denDP/Fwzn78ipgas7QQn844wOAoboBvzC6LLuCeN8
         ezSWGGDs2QgUViq9r+FniKyAnpfnZSlcMK9WGgy/KpF7JVmaBKoNwXdd1XPMmu8Ep8wI
         6L1uwEa2DqLxA174YO/K0etk+tNI1d9yFjlUFYySzca+cjAHDg5nQbBZiqedgatW/DP8
         gxKg86SeKDbN2cXBq8WMKlM0Er3N4Z7RQgosXawEcVmabxrnUl0iXSrYHpBIQPHlRHpj
         awvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751697; x=1788356497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NFQ51HJ7fyE1u0r/xRDp9ewL6yDSIMejUbH85HRUqXg=;
        b=BxpzJrxanYsxSMquXJ4uIPSmdM6YMT6w+Qx3yPWGGtX5QNCtZwW1G5NCh1FpY0X/k5
         ARVvMsvgcy0BbaxEGYlV+lZLO6fgWYyVDsbGyQBkGM1SDJk+udnsUEPng0VtOwWofSgS
         Xi6xMSaIXre1ULbXgU+sdonBMq5oPf1MdjPmUfIO/5ivkeOfaY1kN3bvVZ9TpbZX6qhL
         zm9uDIL45akri8z8IAD+1tRHzvi5OzNFtbrWHRxoko7Dh3oHbNnHK3EANro3s5MqbTsT
         fPukYI6S4mhTZbdnOtp9AwAPxTp+9YOT71fVQyR8TygwU3arg0RhNd3D4+LmJc6oaiBj
         akfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDZXHsv4QZU9QpXbsr7TMRWq5Ju2j3DZA2O7yX4uZc/cTQsJRJL0s9/8soowPpItxrWX5J4xJRV7nnJJU=@vger.kernel.org
X-Gm-Message-State: AFuF++kVDJsvP0ijUQ1x3eM10LUlUTXpfQMX3lbTQ8/oNk3BqOXGC0w1
	vlnmrf94uR+ekZ2+/rXGp7WwFzYjFOFAFw59EAXTW+ecGCxKTPeH3M7K99HZ5xsy
X-Gm-Gg: AR+sD12PmSTVf6EMaY1VG7rhShdSJRSfpnpOUO+1q5TCCg/TxGb8jV7Oja/dS7gSZ8U
	yyeU8WpdH2uvFRw+0YL3sQFmdYcZx/ILjI+J3i+Cf+le3qhElA1v+KQgbjbaXYBUO8QAh/m3oKb
	9z1UUAnjivYQU0cja8gio45Ijnhdu2f8Xnp6PDF1RuLNuHPhMUXID3s+WkQECouvgEHtKApDZFi
	xiezqBSxx97j2bW0424RCfhjqmzmiuZqe0Dil0yPH8XiPPO9DI6vK50771CbbNXz5o1OznMPpts
	gqYDH7IAdMhbBkl7OpOrV45H0ZMaOt/udfI5g+tlxZ3W98rhfru9DNQI19w7s2wP/LXrQhuY3qI
	f/ftff3Rmlj2K/YyLypwmuMfx06V4AvNJGYzHlcuwADN0WGkDhtuxnEKOkJqaecQexC5eI+rd0h
	gMDUVw1vMrdWn+j1VeaWQ+06vpxJSQngo5+RbROD85QJntuxu2wZwAlHdO2rB8KzEOXAKHATd72
	VPH24slzZQAY709mMUX6O3l
X-Received: by 2002:a17:90a:d2ce:b0:393:1d92:db5 with SMTP id 98e67ed59e1d1-3966d3dc5ecmr15674934a91.10.1787751697387;
        Wed, 26 Aug 2026 06:41:37 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d69065sm8906472a91.13.2026.08.26.06.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:41:36 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com,
	daehojeong@google.com
Subject: [PATCH 1/2] f2fs: persist device alias inode across remount
Date: Wed, 26 Aug 2026 21:41:25 +0800
Message-ID: <20260826134126.3729507-2-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826134126.3729507-1-qiwenjie@xiaomi.com>
References: <20260826134126.3729507-1-qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A released device alias loses its extent. Reserve then identifies the
target device by matching the alias filename against the device basename,
which fails when mkfs used a custom alias name.

Store each alias inode number at its device index in the superblock
reserved area. Record the mapping before releasing blocks and use it to
identify the device during reserve. Reject conflicting mappings and keep
the basename lookup for images without a recorded mapping.

Leave released alias inodes without an extent so existing fsck does not
account the freed device range as live blocks.

Fixes: eae3faf210bd ("f2fs: support dynamic reserve/release for device aliasing")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/file.c          | 96 +++++++++++++++++++++++++++++++++++------
 include/linux/f2fs_fs.h |  3 +-
 2 files changed, 84 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d440231b8cb9..7f1dc00031ba 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3725,25 +3725,44 @@ static int f2fs_ioc_get_dev_alias_file(struct file *filp, unsigned long arg)
 			(u32 __user *)arg);
 }
 
-static bool f2fs_get_dev_alias_extent(struct f2fs_sb_info *sbi,
-				       struct dentry *dentry,
-				       struct extent_info *ei)
+static int f2fs_get_dev_alias_index(struct f2fs_sb_info *sbi,
+				    struct inode *inode,
+				    struct dentry *dentry)
 {
+	int devi = -ENOENT;
 	int i;
 
+	f2fs_down_read(&sbi->sb_lock);
+	for (i = 0; i < MAX_DEVICES; i++) {
+		if (le32_to_cpu(sbi->raw_super->dev_alias_ino[i]) !=
+							inode->i_ino)
+			continue;
+		if (!i || i >= sbi->s_ndevs) {
+			devi = -EFSCORRUPTED;
+			goto out;
+		}
+		if (devi >= 0) {
+			devi = -EFSCORRUPTED;
+			goto out;
+		}
+		devi = i;
+	}
+	if (devi >= 0)
+		goto out;
+
 	for (i = 1; i < sbi->s_ndevs; i++) {
 		char *name = strrchr(FDEV(i).path, '/');
 
 		name = name ? name + 1 : FDEV(i).path;
 		if (strcmp(name, dentry->d_name.name))
 			continue;
-
-		ei->blk = FDEV(i).start_blk;
-		ei->len = FDEV(i).total_segments << sbi->log_blocks_per_seg;
-		ei->fofs = 0;
-		return true;
+		devi = sbi->raw_super->dev_alias_ino[i] ?
+						-EFSCORRUPTED : i;
+		break;
 	}
-	return false;
+out:
+	f2fs_up_read(&sbi->sb_lock);
+	return devi;
 }
 
 static int f2fs_ioc_reserve_dev_alias(struct file *filp)
@@ -3756,7 +3775,7 @@ static int f2fs_ioc_reserve_dev_alias(struct file *filp)
 	struct f2fs_lock_context lc, glc;
 	blkcnt_t count;
 	unsigned int start, end;
-	int type, err;
+	int devi, type, err;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
@@ -3780,7 +3799,8 @@ static int f2fs_ioc_reserve_dev_alias(struct file *filp)
 		goto out_inode_unlock;
 	}
 
-	if (!f2fs_get_dev_alias_extent(sbi, filp->f_path.dentry, &ei)) {
+	devi = f2fs_get_dev_alias_index(sbi, inode, filp->f_path.dentry);
+	if (devi < 0) {
 		f2fs_warn(sbi, "device alias file (%s, ino=%llu) has no matching device",
 			  filp->f_path.dentry->d_name.name,
 			  (unsigned long long)inode->i_ino);
@@ -3790,6 +3810,10 @@ static int f2fs_ioc_reserve_dev_alias(struct file *filp)
 		goto out_inode_unlock;
 	}
 
+	ei.blk = FDEV(devi).start_blk;
+	ei.len = FDEV(devi).total_segments << sbi->log_blocks_per_seg;
+	ei.fofs = 0;
+
 	spin_lock(&sbi->stat_lock);
 	if (sbi->total_valid_block_count + ei.len >
 			get_available_block_count(sbi, inode, true)) {
@@ -3801,7 +3825,7 @@ static int f2fs_ioc_reserve_dev_alias(struct file *filp)
 	spin_unlock(&sbi->stat_lock);
 
 	spin_lock(&FREE_I(sbi)->segmap_lock);
-	FDEV(f2fs_target_device_index(sbi, ei.blk)).is_reserving = true;
+	FDEV(devi).is_reserving = true;
 	spin_unlock(&FREE_I(sbi)->segmap_lock);
 
 	start = GET_SEGNO(sbi, ei.blk);
@@ -3853,7 +3877,7 @@ static int f2fs_ioc_reserve_dev_alias(struct file *filp)
 	f2fs_update_inode_page(inode);
 
 	spin_lock(&FREE_I(sbi)->segmap_lock);
-	FDEV(f2fs_target_device_index(sbi, ei.blk)).is_reserving = false;
+	FDEV(devi).is_reserving = false;
 	spin_unlock(&FREE_I(sbi)->segmap_lock);
 
 	f2fs_unlock_op(sbi, &lc);
@@ -3870,7 +3894,7 @@ static int f2fs_ioc_reserve_dev_alias(struct file *filp)
 	spin_unlock(&sbi->stat_lock);
 
 	spin_lock(&FREE_I(sbi)->segmap_lock);
-	FDEV(f2fs_target_device_index(sbi, ei.blk)).is_reserving = false;
+	FDEV(devi).is_reserving = false;
 	spin_unlock(&FREE_I(sbi)->segmap_lock);
 	f2fs_up_write_trace(&sbi->gc_lock, &glc);
 
@@ -3880,6 +3904,44 @@ static int f2fs_ioc_reserve_dev_alias(struct file *filp)
 	return err;
 }
 
+static int f2fs_record_dev_alias_inode(struct f2fs_sb_info *sbi,
+				       struct inode *inode, int devi)
+{
+	__le32 old_ino;
+	int err = 0;
+	int i;
+
+	f2fs_down_write(&sbi->sb_lock);
+	old_ino = sbi->raw_super->dev_alias_ino[devi];
+	if (old_ino && le32_to_cpu(old_ino) != inode->i_ino)
+		goto conflict;
+
+	for (i = 0; i < MAX_DEVICES; i++) {
+		if (i != devi &&
+		    le32_to_cpu(sbi->raw_super->dev_alias_ino[i]) ==
+							inode->i_ino)
+			goto conflict;
+	}
+
+	if (!old_ino) {
+		sbi->raw_super->dev_alias_ino[devi] =
+						cpu_to_le32(inode->i_ino);
+		err = f2fs_commit_super(sbi, false);
+		if (err)
+			sbi->raw_super->dev_alias_ino[devi] = old_ino;
+	}
+	goto out;
+
+conflict:
+	f2fs_warn(sbi, "conflicting device alias inode mapping for device %d",
+		  devi);
+	set_sbi_flag(sbi, SBI_NEED_FSCK);
+	err = -EFSCORRUPTED;
+out:
+	f2fs_up_write(&sbi->sb_lock);
+	return err;
+}
+
 static int f2fs_ioc_release_dev_alias(struct file *filp)
 {
 	struct inode *inode = file_inode(filp);
@@ -3888,6 +3950,7 @@ static int f2fs_ioc_release_dev_alias(struct file *filp)
 	struct extent_info ei = {0, };
 	struct cp_control cpc = { CP_SYNC, 0, 0, 0 };
 	struct f2fs_lock_context lc, glc;
+	int devi;
 	int err;
 
 	if (!capable(CAP_SYS_ADMIN))
@@ -3920,6 +3983,11 @@ static int f2fs_ioc_release_dev_alias(struct file *filp)
 	ei = et->largest;
 	read_unlock(&et->lock);
 
+	devi = f2fs_target_device_index(sbi, ei.blk);
+	err = f2fs_record_dev_alias_inode(sbi, inode, devi);
+	if (err)
+		goto out_inode_unlock;
+
 	f2fs_down_write_trace(&sbi->gc_lock, &glc);
 	f2fs_lock_op(sbi, &lc);
 
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index bb2b6cd5d507..2130bacdbe93 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -158,7 +158,8 @@ struct f2fs_super_block {
 	__le16  s_encoding_flags;	/* Filename charset encoding flags */
 	__u8 s_stop_reason[MAX_STOP_REASON];	/* stop checkpoint reason */
 	__u8 s_errors[MAX_F2FS_ERRORS];		/* reason of image corrupts */
-	__u8 reserved[258];		/* valid reserved region */
+	__le32 dev_alias_ino[MAX_DEVICES]; /* device alias inode numbers */
+	__u8 reserved[226];		/* valid reserved region */
 	__le32 crc;			/* checksum of superblock */
 } __packed;
 
-- 
2.43.0

