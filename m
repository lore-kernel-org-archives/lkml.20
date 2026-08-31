Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061833B7772
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788214103; cv=none; b=UYrv3o5BHeZo01eEfVYm7fE3mSsKD5D5lWf58RQoK2Bb/xySuyFqSIjb1wcDzLfHF+PvxyXifPQz7arOB5bpPvqcOm69RUvGgjFk+HzjbSP2cA4tJTsh//ffO/U7Jy7++O/C8Poy797G2Ndw2sMz3Bq+GnwqYXb/ZMJMUogpmCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788214103; c=relaxed/simple;
	bh=jTmvmjXg1/0UaREBco3p+0viQC0YYu7/puGz2WO4k8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uv9m+CZTTbR36/SDIK1WRS4I+IiILAGTBgfgGrpRCkYnYdZFm8+nFOq7GC+dNjoUO1Z5zCRo4VvA2m6U6t+hpRjaiKMcA7vMur1nhUMhdd3KemZdmNG6fvLA+wzoeRv1DNw/nA7MQmC61ufSO+QBD55xNYjvO99a9v9Y5R6mjzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqMmRah5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqMmRah5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d8fd3b729dso20311615ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788214100; x=1788818900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCI0OV/FT2Wv0ZVg/++5r9fvRHaFYSFdep74WCObUkQ=;
        b=kqMmRah5pujNofle6BEounIQOaV136PG3+Lk+bLtMvJ64AWAN65UjCYZenJYdQm6vL
         GZRfUQpBnUA4k7rK33zZETlBMnVD+Hxjcq6PPhphGlGm3SAVtSJD74Cx+gkzYwIjpRqs
         W5XUFTfk/w0AzbAr1J/qLL2HXBPtiH1/0dnVGOcblO84+XnDZfBKJOP4R6uLN+cL7RtX
         sGkRiGqSVGEI6tgipnDuFSzzHEYbhDS1DHKd9idBJoD+ESlb/bi1g1I92g5CMdM4tGbZ
         WtSB6bIAo2VB+NtWtZls5gt6/JSLIJbU7Kq7Xio5m44GEWb55q2wLvmcLQdnvswRhWeY
         I9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788214100; x=1788818900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NCI0OV/FT2Wv0ZVg/++5r9fvRHaFYSFdep74WCObUkQ=;
        b=q1/+hmddfOiZ4F+iw9T87ThlDfv+Zq1dtNGvtRo6wK3X2pWB60AHkZaufZAH+c7h5x
         b2fDS9OzBCcjFRNaNgy76Ip9BoWrSihrLQt18kWib3cVTE/67251mmJfztYAo2W1Z+k7
         u7XFnjFp9cjiYWzs++vSWTtBJ5TmuhsJHaqBLx5+Erj2JIL/3x932behllggwy5XtI64
         pDfLOj5NfdSRI6vE8RySlmk9Xl3+qWeGlVoOKTusQROqUKnyPd5My+pnVNum1oqCQEDe
         Cd1Fen0tr8Y62Tl+/R9Z5RYJ2IEkn4bVzCOKfNmh2oRkH9PxHBupDHXj51ZJ+/ae4hsB
         0wag==
X-Forwarded-Encrypted: i=1; AKwUvByC7BtxdrEZ/QixLjbUytj83MOcmTRq7yDQ7ri8OLHgl6dQG8qW6RZwv+cwlCl5lv5XR8cx65il2ihQFHs=@vger.kernel.org
X-Gm-Message-State: AFuF++nq8u7x65TTSZv7LVhqeJ2WLQWkGZSM/HCGO8Ib6o6cOCzG9+OK
	ZOe3Ub6aHmNmBYjGeC2QTBIxqZEpjd6LkqlOFPV5kijjwp3FemkoqK3c
X-Gm-Gg: AYBFou1wobQGkJ3A/kB3POb1XrFFj3FE57m9fBexEJCipddxZ+lrtht8OSQEU1gyXcO
	NFrsepVctqZMNqO2Bj6wQu59LMdX0gmO4Hcrt5dbLWC+x0x5+f/uxM8pzwRkXsCEgxIiMtW7qoK
	JIBXG+c+RdzGDWNgdkYhdN6p4/bPds653jnHh25Aj7FPSjQH5xuVmuuJ8YvshQv0n8f8HSc0Dbo
	M3/BG9/kX99YPO+rhQ7dmSfkoMYQaRcRGZRUUHFpelNzBNC4KNAlFmqT3EOdzk4hJ3Q/SC2mVBM
	pvVQLiZn3PsSO55q0/B20umBt7giKYEuUr3Is8/K3drCu+/Wa5/bWZvYn83HjxLZROH+wDuId3x
	1SK7TgovzOmyF2rNEOIbHb46t3fiJc0wqoaNWCsCwNIqvSM1k2HrYuCZ5Oi0WmxKO4jLIoMESHo
	4FEGic07yIaF8HbLFGoja2T2B0xH/sVLfSef0F03koCOL6vjaM77Zm7Chl9HkjMXXfCg==
X-Received: by 2002:a17:902:d48b:b0:2d6:e401:9676 with SMTP id d9443c01a7336-2d94a713d37mr44957745ad.1.1788214100179;
        Mon, 31 Aug 2026 15:08:20 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:91a4:c2d8:1d54:21ad])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75952f3d9sm41516375ad.25.2026.08.31.15.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:08:19 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 07/11] f2fs: describe xattr block layout dynamically
Date: Mon, 31 Aug 2026 15:08:08 -0700
Message-ID: <65b4a84c4504019ea6b208f424917f9df4eed2dd.1788213716.git.zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788213716.git.zhangxp1998@gmail.com>
References: <cover.1788213716.git.zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usable capacity of dedicated on-disk extended attribute blocks and
inline xattr regions scales with the filesystem block size.

Parameterize VALID_XATTR_BLOCK_SIZE and MAX_INLINE_XATTR_SIZE to
calculate usable xattr limits dynamically from sbi->blocksize rather than
hardcoding PAGE_SIZE or DEF_ADDRS_PER_INODE.

Update mount option consistency validation for inline_xattr_size to
evaluate allowed boundaries dynamically against the runtime block size.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/inode.c         |  4 ++--
 fs/f2fs/node.c          |  2 +-
 fs/f2fs/super.c         | 17 +++++++++++++++--
 fs/f2fs/xattr.c         |  8 +++++---
 fs/f2fs/xattr.h         | 15 ++++++++++-----
 include/linux/f2fs_fs.h |  2 ++
 6 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index fda9ee3bfc61..20b0561fe35d 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -337,12 +337,12 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
 	}
 
 	if (f2fs_sb_has_flexible_inline_xattr(sbi) &&
-		(fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE ||
+		(fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE(inode) ||
 		(f2fs_has_inline_xattr(inode) &&
 		fi->i_inline_xattr_size < MIN_INLINE_XATTR_SIZE))) {
 		f2fs_warn(sbi, "%s: inode (ino=%llx) has corrupted i_inline_xattr_size: %d, min: %zu, max: %lu",
 			  __func__, inode->i_ino, fi->i_inline_xattr_size,
-			  MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
+			  MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE(inode));
 		return false;
 	}
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e3f594f7bcce..7dabfada1b54 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2919,7 +2919,7 @@ int f2fs_recover_xattr_data(struct inode *inode, struct folio *folio)
 	/* 3: update and set xattr node page dirty */
 	if (folio) {
 		memcpy(F2FS_NODE(xfolio), F2FS_NODE(folio),
-				VALID_XATTR_BLOCK_SIZE);
+				VALID_XATTR_BLOCK_SIZE(inode));
 		folio_mark_dirty(xfolio);
 	}
 	f2fs_folio_put(xfolio, true);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fcaeaacaab33..3ba4df757213 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -855,9 +855,11 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_inline_xattr_size:
 		if (result.int_32 < MIN_INLINE_XATTR_SIZE ||
-			result.int_32 > MAX_INLINE_XATTR_SIZE) {
+			result.int_32 >
+			MAX_INLINE_XATTR_SIZE_FOR_BLOCKSIZE(F2FS_MAX_BLKSIZE)) {
 			f2fs_err(NULL, "inline xattr size is out of range: %u ~ %u",
-				 (u32)MIN_INLINE_XATTR_SIZE, (u32)MAX_INLINE_XATTR_SIZE);
+				 (u32)MIN_INLINE_XATTR_SIZE,
+				 (u32)MAX_INLINE_XATTR_SIZE_FOR_BLOCKSIZE(F2FS_MAX_BLKSIZE));
 			return -EINVAL;
 		}
 		ctx_set_opt(ctx, F2FS_MOUNT_INLINE_XATTR_SIZE);
@@ -1596,6 +1598,8 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 	}
 
 	if (ctx_test_opt(ctx, F2FS_MOUNT_INLINE_XATTR_SIZE)) {
+		int min_size, max_size;
+
 		if (!f2fs_sb_has_extra_attr(sbi) ||
 			!f2fs_sb_has_flexible_inline_xattr(sbi)) {
 			f2fs_err(sbi, "extra_attr or flexible_inline_xattr feature is off");
@@ -1605,6 +1609,15 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 			f2fs_err(sbi, "inline_xattr_size option should be set with inline_xattr option");
 			return -EINVAL;
 		}
+		min_size = MIN_INLINE_XATTR_SIZE;
+		max_size = MAX_INLINE_XATTR_SIZE_FOR_BLOCKSIZE(F2FS_BLKSIZE);
+
+		if (F2FS_OPTION(sbi).inline_xattr_size < min_size ||
+				F2FS_OPTION(sbi).inline_xattr_size > max_size) {
+			f2fs_err(sbi, "inline xattr size is out of range: %d ~ %d",
+				 min_size, max_size);
+			return -EINVAL;
+		}
 	}
 
 	if (ctx_test_opt(ctx, F2FS_MOUNT_ATGC) &&
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 6728d1488cad..99c863513725 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -310,7 +310,8 @@ static int read_xattr_block(struct inode *inode, void *txattr_addr)
 		return PTR_ERR(xfolio);
 
 	xattr_addr = folio_address(xfolio);
-	memcpy(txattr_addr + inline_size, xattr_addr, VALID_XATTR_BLOCK_SIZE);
+	memcpy(txattr_addr + inline_size, xattr_addr,
+	       VALID_XATTR_BLOCK_SIZE(inode));
 	f2fs_folio_put(xfolio, true);
 
 	return 0;
@@ -393,7 +394,7 @@ static int read_all_xattrs(struct inode *inode, struct folio *ifolio,
 {
 	struct f2fs_xattr_header *header;
 	nid_t xnid = F2FS_I(inode)->i_xattr_nid;
-	unsigned int size = VALID_XATTR_BLOCK_SIZE;
+	unsigned int size = VALID_XATTR_BLOCK_SIZE(inode);
 	unsigned int inline_size = inline_xattr_size(inode);
 	void *txattr_addr;
 	int err;
@@ -502,7 +503,8 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
 
 	if (inline_size)
 		memcpy(inline_addr, txattr_addr, inline_size);
-	memcpy(xattr_addr, txattr_addr + inline_size, VALID_XATTR_BLOCK_SIZE);
+	memcpy(xattr_addr, txattr_addr + inline_size,
+	       VALID_XATTR_BLOCK_SIZE(inode));
 
 	if (inline_size)
 		folio_mark_dirty(ifolio ? ifolio : in_folio);
diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
index bce3d93e4755..d9e2c65a1fc7 100644
--- a/fs/f2fs/xattr.h
+++ b/fs/f2fs/xattr.h
@@ -71,24 +71,29 @@ struct f2fs_xattr_entry {
 		for (entry = XATTR_FIRST_ENTRY(addr);\
 				!IS_XATTR_LAST_ENTRY(entry);\
 				entry = XATTR_NEXT_ENTRY(entry))
-#define VALID_XATTR_BLOCK_SIZE	(PAGE_SIZE - sizeof(struct node_footer))
+#define VALID_XATTR_BLOCK_SIZE(i)	(i_blocksize(i) - \
+					sizeof(struct node_footer))
 #define XATTR_PADDING_SIZE	(sizeof(__u32))
 #define XATTR_SIZE(i)		((F2FS_I(i)->i_xattr_nid ?		\
-					VALID_XATTR_BLOCK_SIZE : 0) +	\
+					VALID_XATTR_BLOCK_SIZE(i) : 0) +	\
 						(inline_xattr_size(i)))
 #define MIN_OFFSET(i)		XATTR_ALIGN(inline_xattr_size(i) +	\
-						VALID_XATTR_BLOCK_SIZE)
+						VALID_XATTR_BLOCK_SIZE(i))
 
 #define MAX_VALUE_LEN(i)	(MIN_OFFSET(i) -			\
 				sizeof(struct f2fs_xattr_header) -	\
 				sizeof(struct f2fs_xattr_entry))
 
 #define MIN_INLINE_XATTR_SIZE (sizeof(struct f2fs_xattr_header) / sizeof(__le32))
-#define MAX_INLINE_XATTR_SIZE						\
-			(DEF_ADDRS_PER_INODE -				\
+#define MAX_INLINE_XATTR_SIZE_FOR_BLOCKSIZE(blocksize)			\
+			(((blocksize) - OFFSET_OF_END_OF_I_EXT -	\
+			SIZE_OF_I_NID - sizeof(struct node_footer)) /	\
+			sizeof(__le32) -				\
 			F2FS_TOTAL_EXTRA_ATTR_SIZE / sizeof(__le32) -	\
 			DEF_INLINE_RESERVED_SIZE -			\
 			MIN_INLINE_DENTRY_SIZE / sizeof(__le32))
+#define MAX_INLINE_XATTR_SIZE(inode)					\
+			MAX_INLINE_XATTR_SIZE_FOR_BLOCKSIZE(i_blocksize(inode))
 #define DEFAULT_XATTR_SLAB_SIZE	(DEFAULT_INLINE_XATTR_ADDRS *		\
 				sizeof(__le32) + XATTR_PADDING_SIZE)
 
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 3d0fe2c78e12..d4151970ae86 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -15,6 +15,8 @@
 #define F2FS_MIN_LOG_SECTOR_SIZE	9	/* 9 bits for 512 bytes */
 #define F2FS_MAX_LOG_SECTOR_SIZE	PAGE_SHIFT	/* Max is Block Size */
 #define F2FS_LOG_SECTORS_PER_BLOCK	(PAGE_SHIFT - 9) /* log number for sector/blk */
+#define F2FS_MIN_LOG_BLOCKSIZE		12
+#define F2FS_MIN_BLKSIZE		4096UL
 #define F2FS_BLKSIZE			PAGE_SIZE /* support only block == page */
 #define F2FS_MAX_BLKSIZE		PAGE_SIZE
 #define F2FS_BLKSIZE_BITS		PAGE_SHIFT /* bits for F2FS_BLKSIZE */
-- 
2.53.0

