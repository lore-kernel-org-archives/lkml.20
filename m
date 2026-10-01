Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410343DD849
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848368; cv=none; b=C32aaaY8l45C5QiCUNnLDVfrLdepf4QLqK5xM8Svop2oxAxPD6JfBK8t9s8lqOgARtAGqX4v4Rn4qJi0nEFbMSTq1l3+6i7KgV8wOfeqAZPUtVimYBBmboNkYveQddxMyfJFtsQFhVBnAgYQD8TxLmVUyAJWGirBZsqWnUZe5AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848368; c=relaxed/simple;
	bh=id/oiviml1q3ef8E+x2djTOzF72K2pibhwhLVZap97c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8RET2zusGxKivlbbAUy0TA5iZkCsg64AEDPc+FzdqFDf86d/unWjXrfUFLKQAsezeNm8sdj3+6voNcbSgn1M7YgjRCn98JsGhCkvrWcB2NNE3oYjt7iQ1UVk96i/lbWbG9c+ly1CmC5YViYrsRfj7ME7f620e3ogfLlSymZx64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=noroxi.com; spf=pass smtp.mailfrom=noroxi.com; dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b=Y/YChoft; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=noroxi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noroxi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b="Y/YChoft"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba44044ff8so702229e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noroxi.com; s=google; t=1790848363; x=1791453163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUljElJ412kYe/nOeh5zaMdSOg0zj48HO1jKhr5xZY8=;
        b=Y/YChoftZukX2EipVlKmKgolPgkqH6lHXu1itombxqQI7HUkpCVOwQk6WStuYqabKU
         uhiHXWT3AXLo9QZsGeiVFfWHl0EUOpAQ7KeVv5/r9YF/f6Sru/HM53UITBT/lwtZkwQf
         UaYO8n9i1xHTBXfvwZj5PPdw+TADFlIZAc2Fu+d7cLO3kykZBNAyjPHqYclqo6XaPF/d
         IlsnJhwNpzNQmTTHCWvJfl8CWMVRtOxpLW4VHMRHl0l6Cqb0dk4Vodu4Tn+xel2lYosk
         4w+zt59xBltRKWEQXabBDEppIXHkCE0x3iELX8ZEGFsdSRTp+jOEZfS1YXMof0LuTchb
         Z52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848363; x=1791453163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xUljElJ412kYe/nOeh5zaMdSOg0zj48HO1jKhr5xZY8=;
        b=JV08dA0YDYejqmodmpxKEWfWyB4SEC30Mw8qPkEKvxwHjeFAQpsotDZyy+JnBMhoHs
         FtpS4FeE1DhzZXgxLcPP5h2urVwR/zxkFcbEgGrc48NwNRxTJ8Q6RMo2zWnX7qKsVw03
         bWkcqQHf96XmZNCLJfseL0cUhCuUBsRF0nqXa71+eQzIiODiA1s0pICrnhnBnsS7sxHU
         DtNR7UXRzUDNkXWoJpnKy3VC4MifvByImBpcrz4lf8swTyZNaIg4c/3NT/qC0LQt2Xkn
         gED7LZVAzYZ339IWMl6YGIGWX/Iwo2c+Bu4nZvMF/IWn0IiEkbuwmZfbeSv2CJ5eQP/N
         xL8A==
X-Forwarded-Encrypted: i=1; AKwUvBxvCexxQEAaGO6vMXQbpHQfj8kaZnlNQ/PVK4swH+LC3NHwWhI2nJyGoWP8463IVERuzuO7s+0Bbb+HqRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLc3Inq9+It2TAsmsuMjD3w+WONTes3iETAdhxi7dm8wC1Iu/9L
	MAiu+SdNbZuRQ++3rqbdcP8Y3Y/tDyUqTJElpmXkQpbqwlG0tF0bZLGuWD2ISLYBXkwL
X-Gm-Gg: AYBFou3Nnq5huK6u9lbFu1pg1D27oVQKAl8kKzyC/QrwKMXPBrgzJ5RBcIwREOiMTe2
	63ulw2A0rb3z90VgAwLznFKUZHj88E9vZM2VXaY/SqjSv6KNbYhaxQLfBl9+SC4+zy8AH7z7cgA
	5Ex/DiFclz0xyGT7pobsG8Po0juffJOngN0BD4rVjY37KYEpnqaydNyHZa8kKFtUVHNmC72oOgq
	ZIi3cA2givuWYF2Dodky7AEX+dXUPJVHYJa0UtHOuGM57+SLJWEE42Goew6t30PKmXUBMSwm6Zt
	ArhDkyEJc8N/8V+BsfKyGRZ6YfMnWI4RO3VxpvaEuEpsfi2W3+tpHuHpcGVEU1W/RGF1+rlaMTr
	LbSZJQlShjhGWhbVdTo5pdKBRnIF8Vkb3K7RqMjo4NPU7EiSewJQMOW6DRAObcIszVRK8AhYg7y
	luYN6aibq2Yy3E9GTMu+eXdtwLt99Wrk4Iiq2cPENCaLkZkartoDKDZvOeSGB9ML3aa4aPJ2BB
X-Received: by 2002:a05:6512:14f:b0:5b8:bc5e:b58b with SMTP id 2adb3069b0e04-5ba406212fbmr1259804e87.67.1790848362400;
        Thu, 01 Oct 2026 02:52:42 -0700 (PDT)
Received: from lab01.. ([2a01:4f9:1a:a462::2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fc529dsm600485e87.80.2026.10.01.02.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:52:42 -0700 (PDT)
From: Mahmut Emin Kurhan <guvenlik@noroxi.com>
To: linux-fsdevel@vger.kernel.org
Cc: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-kernel@vger.kernel.org,
	Mahmut Emin Kurhan <guvenlik@noroxi.com>
Subject: [PATCH] hfsplus: annotate extents_lock nesting to silence lockdep false positive
Date: Thu,  1 Oct 2026 11:52:08 +0200
Message-ID: <20261001095208.1469344-1-guvenlik@noroxi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8dfb90a2751df30f76ab5130960591a57c51be4d.camel@dubeyko.com>
References: <8dfb90a2751df30f76ab5130960591a57c51be4d.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lockdep reports possible recursive locking on HFSPLUS_I(inode)->extents_lock
when unlinking a file on a crafted image:

  hfsplus_file_truncate()  holds inode A ->extents_lock
   hfsplus_free_extents()
    hfsplus_block_free()   reads the allocation bitmap file
     block_read_full_folio()
      hfsplus_get_block()  takes inode B ->extents_lock

inode A is the regular file being truncated and inode B is the allocation
file (sbi->alloc_file, i_ino == HFSPLUS_ALLOC_CNID). They are two different
inodes of the same lock class, taken in a fixed order (regular file first,
then the allocation/attributes/catalog file), so this is not a real
deadlock, only a missing lock-nesting annotation.

Mirror the existing hfsplus_btree_lock_class() approach: give the special
inodes distinct extents_lock subclasses and take the lock with
mutex_lock_nested(). Regular files keep the default subclass, so a genuine
regular-vs-regular recursion would still be detected.

Found via coverage-guided fuzzing (syzkaller + lockdep) by Noroxi.

Signed-off-by: Mahmut Emin Kurhan <guvenlik@noroxi.com>
---
 fs/hfsplus/extents.c    | 12 ++++++++----
 fs/hfsplus/hfsplus_fs.h | 28 ++++++++++++++++++++++++++++
 fs/hfsplus/xattr.c      |  3 ++-
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
index eb7c11524..54a05eaa8 100644
--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -150,7 +150,8 @@ int hfsplus_ext_write_extent(struct inode *inode)
 {
 	int res;
 
-	mutex_lock(&HFSPLUS_I(inode)->extents_lock);
+	mutex_lock_nested(&HFSPLUS_I(inode)->extents_lock,
+			  hfsplus_extents_lock_class(inode));
 	res = hfsplus_ext_write_extent_locked(inode);
 	mutex_unlock(&HFSPLUS_I(inode)->extents_lock);
 
@@ -261,7 +262,8 @@ int hfsplus_get_block(struct inode *inode, sector_t iblock,
 	if (inode->i_ino == HFSPLUS_EXT_CNID)
 		return -EIO;
 
-	mutex_lock(&hip->extents_lock);
+	mutex_lock_nested(&hip->extents_lock,
+			  hfsplus_extents_lock_class(inode));
 
 	/*
 	 * hfsplus_ext_read_extent will write out a cached extent into
@@ -454,7 +456,8 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
 		return -ENOSPC;
 	}
 
-	mutex_lock(&hip->extents_lock);
+	mutex_lock_nested(&hip->extents_lock,
+			  hfsplus_extents_lock_class(inode));
 	if (hip->alloc_blocks == hip->first_blocks)
 		goal = hfsplus_ext_lastblock(hip->first_extents);
 	else {
@@ -576,7 +579,8 @@ void hfsplus_file_truncate(struct inode *inode)
 	blk_cnt = (inode->i_size + HFSPLUS_SB(sb)->alloc_blksz - 1) >>
 			HFSPLUS_SB(sb)->alloc_blksz_shift;
 
-	mutex_lock(&hip->extents_lock);
+	mutex_lock_nested(&hip->extents_lock,
+			  hfsplus_extents_lock_class(inode));
 
 	alloc_cnt = hip->alloc_blocks;
 	if (blk_cnt == alloc_cnt)
diff --git a/fs/hfsplus/hfsplus_fs.h b/fs/hfsplus/hfsplus_fs.h
index 1e5b58e6a..2cbd8074c 100644
--- a/fs/hfsplus/hfsplus_fs.h
+++ b/fs/hfsplus/hfsplus_fs.h
@@ -36,6 +36,20 @@ enum hfsplus_btree_mutex_classes {
 	ATTR_BTREE_MUTEX,
 };
 
+/*
+ * extents_lock nested subclasses. Special inodes (allocation, attributes,
+ * catalog) use the same lock class as regular files but their extents_lock is
+ * taken while a regular file extents_lock is already held -- e.g. the
+ * allocation file is read from hfsplus_block_free() during truncate. Give them
+ * distinct subclasses so lockdep does not report a false recursive locking.
+ */
+enum hfsplus_extents_mutex_classes {
+	HFSPLUS_EXTENTS_LOCK_NORMAL,
+	HFSPLUS_EXTENTS_LOCK_ALLOC,
+	HFSPLUS_EXTENTS_LOCK_ATTR,
+	HFSPLUS_EXTENTS_LOCK_CATALOG,
+};
+
 /* An HFS+ BTree held in memory */
 struct hfs_btree {
 	struct super_block *sb;
@@ -572,6 +586,20 @@ hfsplus_btree_lock_class(struct hfs_btree *tree)
 	return class;
 }
 
+static inline unsigned int hfsplus_extents_lock_class(struct inode *inode)
+{
+	switch (inode->i_ino) {
+	case HFSPLUS_ALLOC_CNID:
+		return HFSPLUS_EXTENTS_LOCK_ALLOC;
+	case HFSPLUS_ATTR_CNID:
+		return HFSPLUS_EXTENTS_LOCK_ATTR;
+	case HFSPLUS_CAT_CNID:
+		return HFSPLUS_EXTENTS_LOCK_CATALOG;
+	default:
+		return HFSPLUS_EXTENTS_LOCK_NORMAL;
+	}
+}
+
 static inline
 bool is_bnode_offset_valid(struct hfs_bnode *node, u32 off)
 {
diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
index 21a1c196c..7bf4ba8f1 100644
--- a/fs/hfsplus/xattr.c
+++ b/fs/hfsplus/xattr.c
@@ -264,7 +264,8 @@ static int hfsplus_create_attributes_file(struct super_block *sb)
 						    sbi->sect_count,
 						    HFSPLUS_ATTR_CNID);
 
-	mutex_lock(&hip->extents_lock);
+	mutex_lock_nested(&hip->extents_lock,
+			  hfsplus_extents_lock_class(attr_file));
 	hip->clump_blocks = clump_size >> sbi->alloc_blksz_shift;
 	mutex_unlock(&hip->extents_lock);
 
-- 
2.43.0

