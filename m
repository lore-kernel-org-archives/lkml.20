Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D033822B1
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749805; cv=none; b=Qe1r4HKiYKSNzPrqW8kz4w5HKK2DuG+oKpgGxMAdVp6hKyTfX9dLd6OxWgZTM3NGWeP68Aaed1qiUg5u7QnHhCyZne3dLpefcXJy0pB7gal1B1gKjmmaZshDqLrXzDXH8Riqtzr0//sDBh5/LzY/qarjY+IiFjcX4/KUdBvRiWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749805; c=relaxed/simple;
	bh=UVKr1GB3R6vP+7Rlv6Fyg7g9JqBgpeXH27thzrWTT1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USJIWJfvD5tIlMXmt5MzacKZdjLT0X2afQ6Z5dLWGRYKnckM5hkeBAqa5/cN4hs28ZgYmRZmlKlFFo3zei0HNY1sXuHnMtXW/hwzK/Kd0ro2iq6M9bKgasbmqoRLqsB3tRgRNb9xEVotMMFMb4FJmZm/JRZmJ++yA743zbbBxl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=OwAEA4po; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="OwAEA4po"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=sT
	xI5UdO0rtdKSksJfWZZPHZ6Bbg4ffM5X8VWwPtsHg=; b=OwAEA4poKDftAzbuCg
	Y6KGhngaRK9IbIsoTobhlpRLw/XTUQ3NsXogeORNEXMyDKOl59J500cSzc4hctnh
	VBI0GOmXhfmSEkOWA3hsHr1hkhNSOH/wxq38E1ZOJoLSmQcsaA2n6U/eEIc2K1zp
	B3xz1UAyM3ipRN0KKCp3bo1vk=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wB3P5N85Y5qx4G3Gg--.15517S4;
	Wed, 26 Aug 2026 21:09:18 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <nzzhao@126.com>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	Pengfei Li <lipengfei28@xiaomi.com>
Subject: [PATCH 13/14] f2fs: allow large folio support to writeable files
Date: Wed, 26 Aug 2026 21:09:14 +0800
Message-ID: <20260826130916.2231342-3-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3P5N85Y5qx4G3Gg--.15517S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr1fXr43CF48JF1UtF4fZrb_yoWrKFykpF
	Z8Gr1rGr4DuFyYgr1ktFs0vr1Yva4xW3yUAa97Aws5A3WDX34SgF1Ika45uF45trW8Jw4I
	qF40kryUWr15GaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5Ma8UUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsR-WpmqO5X9YmAAA3g

Now we make all write path support large folios,
so we open permission to let writeable file set
large folio mapping.

Keep fs-layer encrypted files excluded unless inline encryption is
enabled, since f2fs_encrypt_one_page() still encrypts one PAGE_SIZE
page and cannot handle large folios.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c  |  9 ++++++++-
 fs/f2fs/f2fs.h  | 13 +++++++++++++
 fs/f2fs/file.c  | 16 ----------------
 fs/f2fs/inode.c |  4 +---
 fs/f2fs/namei.c |  1 +
 5 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0b167b14a9a5..2e20833c6417 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2955,7 +2955,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	int ret = 0;
 	bool folio_in_bio = false;
 
-	if (!IS_IMMUTABLE(inode) || f2fs_compressed_file(inode)) {
+	if (f2fs_compressed_file(inode)) {
 		if (folio)
 			folio_unlock(folio);
 		return -EOPNOTSUPP;
@@ -3321,6 +3321,13 @@ int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
 	if (fscrypt_inode_uses_inline_crypto(inode))
 		return 0;
 
+	if (folio_test_large(page_folio(page))) {
+		f2fs_warn_ratelimited(F2FS_I_SB(inode),
+			"large folio does not support fs-layer encryption, ino=%llu",
+			(unsigned long long)inode->i_ino);
+		return -EOPNOTSUPP;
+	}
+
 	fio->encrypted_page = fscrypt_encrypt_pagecache_blocks(page_folio(page),
 					PAGE_SIZE, 0, GFP_NOFS);
 	if (IS_ERR(fio->encrypted_page))
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6ae249bf9aa1..04ed0ea92b26 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -5201,6 +5201,19 @@ static inline bool f2fs_quota_file(struct f2fs_sb_info *sbi, nid_t ino)
 	return false;
 }
 
+static inline void f2fs_mapping_set_large_folio(struct inode *inode)
+{
+	if (!S_ISREG(inode->i_mode) ||
+	    f2fs_has_inline_data(inode) ||
+	    f2fs_compressed_file(inode) ||
+	    f2fs_quota_file(F2FS_I_SB(inode), inode->i_ino) ||
+	    (f2fs_encrypted_file(inode) &&
+	     !(inode->i_sb->s_flags & SB_INLINECRYPT)))
+		return;
+
+	mapping_set_folio_min_order(inode->i_mapping, 0);
+}
+
 static inline bool f2fs_block_unit_discard(struct f2fs_sb_info *sbi)
 {
 	return F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_BLOCK;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index b82acbc3240f..c8426821e701 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -134,17 +134,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	int err = 0;
 	vm_fault_t ret;
 
-	/*
-	 * We only support large folio on the read case.
-	 * Don't make any dirty pages.
-	 */
-	if (unlikely(IS_IMMUTABLE(inode)) ||
-	    mapping_large_folio_support(inode->i_mapping)) {
-		f2fs_err(sbi, "Not expected: immutable: %d large_folio: %d",
-				IS_IMMUTABLE(inode),
-				mapping_large_folio_support(inode->i_mapping));
-		return VM_FAULT_SIGBUS;
-	}
 
 	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
 		err = -EIO;
@@ -698,9 +687,6 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 	if (!f2fs_is_compress_backend_ready(inode))
 		return -EOPNOTSUPP;
 
-	if (mapping_large_folio_support(inode->i_mapping) &&
-	    filp->f_mode & FMODE_WRITE)
-		return -EOPNOTSUPP;
 
 	err = fsverity_file_open(inode, filp);
 	if (err)
@@ -1177,8 +1163,6 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		return -EPERM;
 
 	if ((attr->ia_valid & ATTR_SIZE)) {
-		if (mapping_large_folio_support(inode->i_mapping))
-			return -EOPNOTSUPP;
 		if (IS_DEVICE_ALIASING(inode))
 			return -EPERM;
 		if (!f2fs_is_compress_backend_ready(inode))
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 96cc0e777567..7c4b5cdfe276 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -642,9 +642,7 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 		inode->i_op = &f2fs_file_inode_operations;
 		inode->i_fop = &f2fs_file_operations;
 		inode->i_mapping->a_ops = &f2fs_dblock_aops;
-		if (IS_IMMUTABLE(inode) && !f2fs_compressed_file(inode) &&
-		    !f2fs_quota_file(sbi, inode->i_ino))
-			mapping_set_folio_min_order(inode->i_mapping, 0);
+		f2fs_mapping_set_large_folio(inode);
 	} else if (S_ISDIR(inode->i_mode)) {
 		inode->i_op = &f2fs_dir_inode_operations;
 		inode->i_fop = &f2fs_dir_operations;
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index afaab7739283..bdf4e586bfcf 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -341,6 +341,7 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 	f2fs_set_inode_flags(inode);
 
 	f2fs_init_extent_tree(inode);
+	f2fs_mapping_set_large_folio(inode);
 
 	trace_f2fs_new_inode(inode, 0);
 	return inode;
-- 
2.43.0

