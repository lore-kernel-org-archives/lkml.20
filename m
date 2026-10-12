Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4573A42589C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787426; cv=none; b=pdxBY/62YFrhuclcbtKPJPvcA1el92im6Zss4HpJ+ug5+gVndvFs/kTmjPA475T6LKQsGNhyZh+G8Xahth9Bkx6fGj5drnrKaPDM2G62Y/PCPxzh7OQ16JM8Ri6Pwvw3qoK/yYdZidi11DDbrtnuGrmPeYoNhJ7xoE7BhTJzJJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787426; c=relaxed/simple;
	bh=gthD2jNRAcLCFigiQZ0D63Ly4Qro9n04aeGnx3dhipI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=DDQ3R7giEh9K79Bu5l8svp7zmbI+7kg/lddVhh/+eALEBy5dAAP7/frHsl+prDqRX0ipM8OEoeVKHwUk0V/uxBLlvTr4+gzSH2MIXpchTZ9UPcSUeapohNQXNot2W5nNTc15ZzdpGfwoUnbDzTKaMNTPAS/YLio2SNtBZ2BbJlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=mhYXHXcT; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="mhYXHXcT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1791787413;
	bh=DRxjqLDEmMh5cf2qYuNehBDy4qMfJMmRUtWLJ4kRBpw=;
	h=From:To:Cc:Subject:Date;
	b=mhYXHXcT2Qqz4n+p2iEcjbVjBfjEcZMEN5uWRC1UKIcSu2mFIEaseC5tmvsuSV/FF
	 klGK3GhhEuLKo4IsG+zUG1yY+TaN84fMSRc8i00USULH19dJQP30K8Tw4FY2jUIeLK
	 Q54VOoVC5CgEp7zHINOotYyMv3FpX70EQYNBrBTo=
Received: from RE0700.barrietech.com ([122.233.58.214])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id ADF8F041; Mon, 12 Oct 2026 14:43:31 +0800
X-QQ-mid: xmsmtpt1791787411tj5b502q3
Message-ID: <tencent_355C095BCB939C08BA6886D59393B20E7B05@qq.com>
X-QQ-XMAILINFO: MMn1CiIZZGMPtqbSIBVwXQhto7/5l2E2fCgxjmyg39YiYNqYGivwAF9DXY2/uU
	 zjEM9KJzj0b63kgmIB+xGu6if436XsHqiQ9f3yjb3QJbEAvJgARnR5mig+2VkvBvVxc/l4Tx0Yfs
	 Ut7JF5sqmICNGZVtEFMYs1Eh/k1CKNiO41JcYU/jEmHPELUPJpPDS2/xBesAgLcf3ekxcey2LnN2
	 CV6dxFXY7q+yL105QaWDQoYsrKNwTMObHcqnC+zLCnmZ5Ka5/YKBHe/9WVI2BJZxWhhUOOBpE+Z6
	 7FxA/bNoYVR7TDLPEVjCllNVUwmz/ZGMYyCkhiVwItna0DTdRAVcVCM1ILwvokrnSSQLu7PqeNIG
	 hj+phizOiEOFw9yEVsG719TC0mtuPUZBfEM3Xz3hLIIqrgkX3S8qw3lPfzc5tgLnU4DUHWwZkN7V
	 uXNcQm38IqYyOowzlrpvP06Mtba1kwqBSEHSJswcsNj14qhpVLwfu7E3IXwtBGRRYS5IRpeC9WRK
	 0ISTP858mbHe2fz/Mhp/N1iRrsySfu02k8QoecMLoJVAboVR6e+aGN7E9lw+TKNhls+jkQFMt8rr
	 wAAYvHkLeHFbOIffFZ0zUbbwCyWRBMe7xh+0E8tF84GnQl5lh6fF6CPQ+251ur0wAf2jQbQFQMIK
	 pEEk8SyiJWe1acyDqPtL2LGequI5dQh/usGAVtbZZpcNLVWbFUq/begZp1RZO6VNlBNWjfpf897L
	 +x501Y4yFdb3wrZFfnBFugMgiEp+vTYp2477WgQMML3CpoF6uMdum+hq9Jb19YakZJj1syRLSIec
	 7ZexAsXLJ9tlFJfj/A7Yau4zfztyW3IX1CeSZLtvdc7AlMfz14mtYsWpwjYQcQtzoqUvxGPpgTMF
	 Se7St4VVPh8VcwVnHw6NXiEMApmXTJxNKriRee5QhEkgpGbg+w29T4bczewY3w/HSWJhHW2FrVvt
	 EQVgva9H/o0R7kQ4KnoCrKCrQcaRbzARkcxM+oRH3tcoC6cINJKXTpg1lUvxjKA75MPYijvHneKc
	 pNTkIxoF/2CRn5JehRIrOhoxAbF0d2uwrmVpwFA07uqoAC0X+zpr2ZSPrEHdL+MuenlAgtSvUNBn
	 4vqpGMqmkxNEYs/1NNK6+BEu30CuUj18SgfeUOmYxfbgf806/GblaS2kUfJg==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: zhoumin <teczm@foxmail.com>
To: hirofumi@mail.parknet.co.jp
Cc: linux-kernel@vger.kernel.org,
	teczm@foxmail.com
Subject: [PATCH] fat: roll back the new entry when create/mkdir fails to build the inode
Date: Mon, 12 Oct 2026 14:43:29 +0800
X-OQ-MSGID: <20261012064329.658149-1-teczm@foxmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vfat_create(), vfat_mkdir(), msdos_create() and msdos_mkdir() add the
on-disk entry before calling fat_build_inode() to set up the VFS
inode.  If fat_build_inode() fails, the error is returned but the
entry stays on disk and the file or directory shows up after remount.

Remove the entry in that case.  For mkdir, also free the directory
cluster and decrement the parent's link count.

Signed-off-by: zhoumin <teczm@foxmail.com>
---
 fs/fat/namei_msdos.c | 19 ++++++++++++++-----
 fs/fat/namei_vfat.c  | 19 ++++++++++++++-----
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/fs/fat/namei_msdos.c b/fs/fat/namei_msdos.c
index d46d1a3851f2..a0d1af5b8a5b 100644
--- a/fs/fat/namei_msdos.c
+++ b/fs/fat/namei_msdos.c
@@ -271,7 +271,7 @@ static int msdos_create(struct mnt_idmap *idmap, struct inode *dir,
 	struct fat_slot_info sinfo;
 	struct timespec64 ts;
 	unsigned char msdos_name[MSDOS_NAME];
-	int err, is_hid;
+	int err, err2, is_hid;
 
 	mutex_lock(&MSDOS_SB(sb)->s_lock);
 
@@ -292,11 +292,15 @@ static int msdos_create(struct mnt_idmap *idmap, struct inode *dir,
 	if (err)
 		goto out;
 	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
-	brelse(sinfo.bh);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
+		err2 = fat_remove_entries(dir, &sinfo);
+		if (err2)
+			fat_msg(sb, KERN_WARNING,
+				"failed to roll back new entry (%d)", err2);
 		goto out;
 	}
+	brelse(sinfo.bh);
 	fat_truncate_time(inode, &ts, FAT_UPDATE_ATIME | FAT_UPDATE_CMTIME);
 	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
 
@@ -353,7 +357,7 @@ static struct dentry *msdos_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	struct inode *inode;
 	unsigned char msdos_name[MSDOS_NAME];
 	struct timespec64 ts;
-	int err, is_hid, cluster;
+	int err, err2, is_hid, cluster;
 
 	mutex_lock(&MSDOS_SB(sb)->s_lock);
 
@@ -381,12 +385,17 @@ static struct dentry *msdos_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	inc_nlink(dir);
 
 	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
-	brelse(sinfo.bh);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
-		/* the directory was completed, just return a error */
+		err2 = fat_remove_entries(dir, &sinfo);
+		if (err2)
+			fat_msg(sb, KERN_WARNING,
+				"failed to roll back new entry (%d)", err2);
+		drop_nlink(dir);
+		fat_free_clusters(dir, cluster);
 		goto out;
 	}
+	brelse(sinfo.bh);
 	set_nlink(inode, 2);
 	fat_truncate_time(inode, &ts, FAT_UPDATE_ATIME | FAT_UPDATE_CMTIME);
 	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
diff --git a/fs/fat/namei_vfat.c b/fs/fat/namei_vfat.c
index da3e89c0b16a..31d83de5beaa 100644
--- a/fs/fat/namei_vfat.c
+++ b/fs/fat/namei_vfat.c
@@ -760,7 +760,7 @@ static int vfat_create(struct mnt_idmap *idmap, struct inode *dir,
 	struct inode *inode;
 	struct fat_slot_info sinfo;
 	struct timespec64 ts;
-	int err;
+	int err, err2;
 
 	mutex_lock(&MSDOS_SB(sb)->s_lock);
 
@@ -771,11 +771,15 @@ static int vfat_create(struct mnt_idmap *idmap, struct inode *dir,
 	inode_inc_iversion(dir);
 
 	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
-	brelse(sinfo.bh);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
+		err2 = fat_remove_entries(dir, &sinfo);
+		if (err2)
+			fat_msg(sb, KERN_WARNING,
+				"failed to roll back new entry (%d)", err2);
 		goto out;
 	}
+	brelse(sinfo.bh);
 	inode_inc_iversion(inode);
 
 	d_instantiate(dentry, inode);
@@ -853,7 +857,7 @@ static struct dentry *vfat_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	struct inode *inode;
 	struct fat_slot_info sinfo;
 	struct timespec64 ts;
-	int err, cluster;
+	int err, err2, cluster;
 
 	mutex_lock(&MSDOS_SB(sb)->s_lock);
 
@@ -870,12 +874,17 @@ static struct dentry *vfat_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	inc_nlink(dir);
 
 	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
-	brelse(sinfo.bh);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
-		/* the directory was completed, just return a error */
+		err2 = fat_remove_entries(dir, &sinfo);
+		if (err2)
+			fat_msg(sb, KERN_WARNING,
+				"failed to roll back new entry (%d)", err2);
+		drop_nlink(dir);
+		fat_free_clusters(dir, cluster);
 		goto out;
 	}
+	brelse(sinfo.bh);
 	inode_inc_iversion(inode);
 	set_nlink(inode, 2);
 
-- 
2.53.0

