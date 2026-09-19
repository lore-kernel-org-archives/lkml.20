Received: from mail-pj2-f36.google.com (mail-pj2-f36.google.com [74.125.227.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58346390985
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856768; cv=none; b=h82QMJYEg1bGGKd83cWCgq7wXxFbk/PVywRWSJIhyYEwz2PiNCko1+xW82JrsWkPlewrb4+KcPu50UfnAdLiIhervdBAIOU/RxwN/1XecOwLu3uggJLhvwqTXv3u+SoBwgFP7sO0eg2eZ7cMzR15rFzK69n2bPICq6O8x5V+u8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856768; c=relaxed/simple;
	bh=adBUT2nmNglPUkKlvmjnKrXglU3lwnGtt0jix4H4r1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ALEFrGmfncDmM2WH/AnetoY9Kkc0MSQFVHFeydBLIecwkFdXfJgYqUCZgULoudhDcB6TESohKEqfzS4NzAZyk+8hxaVu9dKPBLSztIm07MsKzswLCuoRf2PrWZuuhRk4VWv0DxBAigYRUUmLhg4zaEPYqwD+erUffky2QQ5pf8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qO7rc5lX; arc=none smtp.client-ip=74.125.227.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qO7rc5lX"
Received: by mail-pj2-f36.google.com with SMTP id d9443c01a7336-2d8fdc579daso21160975ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856765; x=1790461565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWyXbkuQ0HZAmotwmU2zrx1ovfV3t19guYefN28Ku4Y=;
        b=qO7rc5lXinGNm8f8Ty+ScZL91SeSAeWzVc5ACCK46C2L4htOVZw0fimUV3GU1PViHY
         vl2jMChQ0vEhgquJVnLofVr/6/zs4QtsOTwvKNT1SmbNLKVgVOkiC7SS4bT5+I/7XMGr
         0QTlJczQqWPAN2ATXRtYVmeFj+1Sc1ZqFhFqlXijs8hZq8J0UoQjlEdVlywCS5JsIkE8
         dDNq8sNMDA0CQX9y/Nve+GNr08wUdWIBmFPAxd+azoqTQAmq4QPgYxCjGdF1pEeGbIfM
         dBLQqkggqxJliSFX7EiMOBNlrzqg0ga8264b6UT7vlc+gl+qxsKaCufrwOl6plxIX1FT
         yrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856765; x=1790461565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWyXbkuQ0HZAmotwmU2zrx1ovfV3t19guYefN28Ku4Y=;
        b=P3nKzvKMunEQzA688hjwm27g802rv4TO2zlWvkgtsq3Kx2WSZRjxZkXtmgn5rWAlXz
         Vjby5at5lb/RfKWwsh4M4W/Obo9lr8xEcNq0ea5xWyg7wjbHYDLfNpIbZZtNIKnA4MCD
         sQH3Doqn079ucThrFJ41GoCjki4paSQik1Ba809ZU5VplfxWkALoUdUQJ4SDLUD4KKPT
         SwlkO4NAZPd9/D7HJvVSU0AxljhWP5KYpYibBhx37l5OvSKDOhBrul1Lo1bYpDJL80xe
         7h5pGlM/T6jHK1ktAwD3WLzSWO+yZaQ9o+MJotcJudf3Yzv0jm2QyNgjykHhKXcr3rDV
         5gKw==
X-Forwarded-Encrypted: i=1; AKwUvBwfp4qQfZp2j5ez9jjQkI0cX6dfkOQKg7A4nhzOvZ2sPmTKCtltcPkqeLjaNEdviQF+4RNfFyPvpR+bivQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kACr7wajSW7GZgKgXPRYdPt+5DSPv0wBCaf20TTn2ka2gmpnn3
	m9Xh0fSqJ6Xydtc24zUPbAtWhxR5zO/K9zTYplZSUBn2ORa+PRn2XJaj
X-Gm-Gg: AYBFou3pzTH3J5uSPptVla1dIcf0/cy4wslw2Tzjnqn7br/M72V4N6+JDx1dR487ZTC
	nrlhDBzvyuAo3LB+djojlNfXXVW7A3vmLDM5O6SN6urCb8UBUp2DQBIKUbzRKah5d/imsDoukIY
	m2nR81egrjfn7BUWdm6N89xxd0nvF7yJkKGmQ6K6xi8eV3qmcIgTL3Kj///uNWtKWVEKnt7rNir
	Fg2t7eZne1vnbcB2tAAjoZ2yADNFjsjFTP83r+tis7NMyBZ3lCfJFxTrJ81mtktfWywHi01XrSC
	oYsvh7X/vartOrun3979kMc379c6b+SGs2biZY20kuc9OtU763HCcDb16BvAlzF410fP7dR+Zr2
	vqDuOsDkNnoc53UFlfzzHEQ/d1mYBe6sPHnvhZLu9TAYtkVGPFzpBDjN0AXHACrEL59jxcL4Hdg
	BOuyWpxZTqgOs6Sc1jSKl7Uri7EAviYLeVDMZlC1ypaHTKsz+a8LguO4ht0cz6ODv2PndBjUNH5
	WxKiyHf+XRotIA4+DzBT0a1s9P5X/lfkyxR1/rRj7tDFlIxddnmPXJXEhFLmUSQLIThN0IIahk6
	sdUkPEzdiw==
X-Received: by 2002:a17:903:4590:b0:2dd:c100:3138 with SMTP id d9443c01a7336-2ddc10031b0mr49015705ad.52.1789856765405;
        Sat, 19 Sep 2026 15:26:05 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18032d5sm13115335ad.83.2026.09.19.15.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:26:04 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	brauner@kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hfsplus: fix xattr entrylength OOB read and NULL hidden_dir on R/W remount
Date: Sat, 19 Sep 2026 22:26:03 +0000
Message-ID: <20260919222603.3794265-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix three issues in fs/hfsplus/:

1. In __hfsplus_getxattr() (fs/hfsplus/xattr.c), verify that
   record_length and attr_size fit within fd.entrylength before copying
   from the catalog or attributes btree entry so a malformed attribute
   length cannot trigger a slab-out-of-bounds read or leak uninitialized
   slab memory.
2. In hfsplus_delete_all_attrs() (fs/hfsplus/attributes.c), return early
   if HFSPLUS_SB(sb)->attr_tree is NULL.
3. In hfsplus_reconfigure() and hfsplus_unlink() (fs/hfsplus/super.c,
   fs/hfsplus/dir.c), allocate hidden_dir when remounting from read-only
   to read-write and guard against NULL hidden_dir when unlinking open
   files.

Fixes: 127e5f5ae51e ("hfsplus: rework functionality of getting, setting and deleting of extended attributes")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/fs/hfsplus/attributes.c b/fs/hfsplus/attributes.c
index 7c2e589d4553..a08a9d83ccda 100644
--- a/fs/hfsplus/attributes.c
+++ b/fs/hfsplus/attributes.c
@@ -83,7 +83,7 @@ int hfsplus_attr_build_key(struct super_block *sb, hfsplus_btree_key *key,
 
 hfsplus_attr_entry *hfsplus_alloc_attr_entry(void)
 {
-	return kmem_cache_alloc(hfsplus_attr_tree_cachep, GFP_KERNEL);
+	return kmem_cache_zalloc(hfsplus_attr_tree_cachep, GFP_KERNEL);
 }
 
 void hfsplus_destroy_attr_entry(hfsplus_attr_entry *entry)
diff --git a/fs/hfsplus/dir.c b/fs/hfsplus/dir.c
index 51fcba2e6d40..2967a93433b9 100644
--- a/fs/hfsplus/dir.c
+++ b/fs/hfsplus/dir.c
@@ -386,6 +386,10 @@ static int hfsplus_unlink(struct inode *dir, struct dentry *dentry)
 	cnid = (u32)(unsigned long)dentry->d_fsdata;
 	if (inode->i_ino == cnid &&
 	    atomic_read(&HFSPLUS_I(inode)->opencnt)) {
+		if (!sbi->hidden_dir) {
+			res = -EIO;
+			goto out;
+		}
 		str.name = name;
 		str.len = sprintf(name, "temp%llu", inode->i_ino);
 		res = hfsplus_rename_cat(inode->i_ino,
@@ -409,6 +413,10 @@ static int hfsplus_unlink(struct inode *dir, struct dentry *dentry)
 		if (inode->i_ino != cnid) {
 			sbi->file_count--;
 			if (!atomic_read(&HFSPLUS_I(inode)->opencnt)) {
+				if (!sbi->hidden_dir) {
+					res = -EIO;
+					goto out;
+				}
 				res = hfsplus_delete_cat(inode->i_ino,
 							 sbi->hidden_dir,
 							 NULL);
@@ -425,11 +433,10 @@ static int hfsplus_unlink(struct inode *dir, struct dentry *dentry)
 out:
 	if (!res) {
 		res = hfsplus_cat_write_inode(dir);
-		if (!res) {
+		if (!res && sbi->hidden_dir)
 			res = hfsplus_cat_write_inode(sbi->hidden_dir);
-			if (!res)
-				res = hfsplus_cat_write_inode(inode);
-		}
+		if (!res)
+			res = hfsplus_cat_write_inode(inode);
 	}
 
 	mutex_unlock(&sbi->vh_mutex);
diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
index ff7d6b3336a6..3e5adfe1b4cf 100644
--- a/fs/hfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -401,6 +401,31 @@ static int hfsplus_reconfigure(struct fs_context *fc)
 			sb->s_flags |= SB_RDONLY;
 			fc->sb_flags |= SB_RDONLY;
 		}
+
+		if (!(fc->sb_flags & SB_RDONLY) && !sbi->hidden_dir) {
+			struct inode *root = d_inode(sb->s_root);
+			struct qstr str = QSTR_INIT(HFSP_HIDDENDIR_NAME,
+						    sizeof(HFSP_HIDDENDIR_NAME) - 1);
+			int err;
+
+			mutex_lock(&sbi->vh_mutex);
+			sbi->hidden_dir = hfsplus_new_inode(sb, root, S_IFDIR);
+			if (!sbi->hidden_dir) {
+				mutex_unlock(&sbi->vh_mutex);
+				return -ENOMEM;
+			}
+			err = hfsplus_create_cat(sbi->hidden_dir->i_ino, root,
+						 &str, sbi->hidden_dir);
+			if (err) {
+				iput(sbi->hidden_dir);
+				sbi->hidden_dir = NULL;
+				mutex_unlock(&sbi->vh_mutex);
+				return err;
+			}
+			hfsplus_cat_write_inode(sbi->hidden_dir);
+			hfsplus_cat_write_inode(root);
+			mutex_unlock(&sbi->vh_mutex);
+		}
 	}
 	return 0;
 }
diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
index 21a1c196c71f..7f9215387cbd 100644
--- a/fs/hfsplus/xattr.c
+++ b/fs/hfsplus/xattr.c
@@ -657,7 +657,9 @@ ssize_t __hfsplus_getxattr(struct inode *inode, const char *name,
 				fd.entryoffset +
 				offsetof(struct hfsplus_attr_inline_data,
 				length));
-		if (record_length > HFSPLUS_MAX_INLINE_DATA_SIZE) {
+		if (record_length > HFSPLUS_MAX_INLINE_DATA_SIZE ||
+		    offsetof(struct hfsplus_attr_inline_data, raw_bytes) +
+			    record_length > fd.entrylength) {
 			pr_err("invalid xattr record size\n");
 			res = -EIO;
 			goto out;
