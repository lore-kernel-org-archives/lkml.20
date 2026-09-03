Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326E037F723
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788479795; cv=none; b=QlSiuh28p2OBFKqOh6jun6pRF+L+YhFQjnXpdCwz+pZcuXir6oeH/LB5abDZfe9gXx70wO4jxctRf98/AeNhcWDuDKR12r3yzLerdWb84bUw/l+diES/AVrFnI3F32zMdwyDA+crUl9mz96uGYg6zP7Dabyp5xCFj7POKlbdBjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788479795; c=relaxed/simple;
	bh=t241G7/ZKHBSwA70NCpYAVhPiF8oDmtty8rYOMdBTQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iF+9MbrCVPpwGDH8Q258ceumSbrpifyToGQnITSfQdeIjm8sMJtrxe0rL6k3z9XXg0BDGYk95HNMbLJR9Jf9Od1DyqTr76gsP3mpcNTTgB3t6fg5r2EL4/n6pqBTX0HEy6JTi3yIEJJzbC6u7wYdQbfDjhIbXPseWFj7c8ALQ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K62H4Meh; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K62H4Meh"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caced6038eso4531465ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788479793; x=1789084593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1HQbrF7PkJ6PeWLX/CZqb0BIOhOO4tfnaywHDSdkZ0=;
        b=K62H4Mehyyu3XJj7Ssn23wCOcVtr2jexjDQl4z9lcErdPyBdpOHYf5KrBysng1N/x8
         Vzzlfe+DF5e7qHAS9NDHwwsCHJHoPkayCWkyfrKkvPSPPhKKOVCzACEYkUZeaxYv6jh9
         qdgTnDxcVpDlLoVZWkq56y3X63f66apluncmJskpYL9a85EXoStTHBF+/ogzlGtxnVdW
         8DnklinrTXNWoGF7Dzxcz71cKTVXwklnhVs8VnzJuRsqJ2oVKrQT8M2aHSJxnKbwE2vZ
         FtL/q+Q9gEHQMeY33VZurGn4ID5InwUhVsVozI4S7e0nr/bY00/Yo47+5oZFePNx8Od/
         bFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788479793; x=1789084593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j1HQbrF7PkJ6PeWLX/CZqb0BIOhOO4tfnaywHDSdkZ0=;
        b=DlkLoUhURMetpbT/6qNOkfMD8PvIKrRKtIzqiYOC2jap8dcU5PwMFlU1/R0IY1f/e4
         ay7164RvWjpHmLWpJC5WfFLQpt6wFySfpTVc9OjFE3Lf6YocCVElM1v9Fp9M0t4N5/2f
         2BNmjoTJwewp1Ur5wtiBTpFMvw17wKLCCKejZ7CQuJH8/gmFnSCLdFqBmQSlanuAvzpZ
         S/H4aTx1SYnyhkRvZ3oBJc1MuOw9Rnf2Pt1O3rL11uZiNRx8UhHo1n7z6oPGH6Fde7V+
         bnDgImq+uro9mXOSDNJphvpDwF7TiyrYtEA52UOlm0Medw+p7Pg2IfpZgzbvkyCmDH8M
         cNYg==
X-Forwarded-Encrypted: i=1; AKwUvBytPoHCUaNfWgDaUs9h9lAjqcmphtqFBCj/Fs0HNMCK/eIo0tg37yZYh4tbKvx0nIvY0qDtc8zLvO5Snio=@vger.kernel.org
X-Gm-Message-State: AFuF++nm0qkbbghsTFHK212LAJW3kWb49I7ugnFs02TF2U/T4BxySPsJ
	6SW3tMYriWdLrf/zXNy8bu1MbuqHt58rIBzMypl3+X0rJKpN1QtGk5jD
X-Gm-Gg: AYBFou1LmIDDxyHaeRKNd7K8j+EA/2LA7+6xpi7Hm48PDPM7PS8Pb3++f2l4cXxsOLG
	ryvNsnAwft6CZwVyDldsl/BLdd6Ph1S5wa0q5N2WG1SCx6XQiwK1wRlzvuf4jG9sPeK80HpAc2j
	vNc/nCOIhX9neGJGb3K3E47vQ9FdsTi/8CbRrKH0Z1V8Umi3bnMYd/JXsDtV7bRfEE8rUcAxDzd
	QjlnefkK0RMEJdINB6AOMFmEDjytsRzLbIToZ2N0TfkBLTfz672B8JUt8xphHQiCUQxbaEg5klU
	ErxYx9l+J95LFY0i9YWdPbXcyrOsXX2OICQ9S4WsLVGXXMAG+Yl+XW4OKnMzhkjKC+3PJftdOaW
	HIfS5p05PVVS65j2PYWkKenfVz5wSEM8RyJb/+KbdDcGFfJUp69HXLRMvw0tuI5zUb0Q42c1mNC
	CoJRE6Iogvm/pBNhhHMUEZTDf8ztw2Q0ciZGoKXVDiwY/lOGvBkQZmK6DFFTSzAQSbog==
X-Received: by 2002:a17:90a:e183:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-39b07f305admr9839298a91.5.1788479793441;
        Thu, 03 Sep 2026 16:56:33 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:29c4:4984:db20:3bb4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm3077063eec.15.2026.09.03.16.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 16:56:33 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 07/11] f2fs: describe xattr block layout dynamically
Date: Thu,  3 Sep 2026 16:56:19 -0700
Message-ID: <c7005ebefcad46d6a0bf3b0653fbd3692b86a360.1788479509.git.zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788479509.git.zhangxp1998@gmail.com>
References: <cover.1788479509.git.zhangxp1998@gmail.com>
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
 fs/f2fs/inode.c         |  7 ++++---
 fs/f2fs/node.c          |  2 +-
 fs/f2fs/super.c         | 17 +++++++++++++++--
 fs/f2fs/xattr.c         |  8 +++++---
 fs/f2fs/xattr.h         | 11 ++++++-----
 include/linux/f2fs_fs.h |  3 +++
 6 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index fda9ee3bfc61..79c0a1301996 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -337,12 +337,13 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
 	}
 
 	if (f2fs_sb_has_flexible_inline_xattr(sbi) &&
-		(fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE ||
+		(fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE(i_blocksize(inode)) ||
 		(f2fs_has_inline_xattr(inode) &&
 		fi->i_inline_xattr_size < MIN_INLINE_XATTR_SIZE))) {
-		f2fs_warn(sbi, "%s: inode (ino=%llx) has corrupted i_inline_xattr_size: %d, min: %zu, max: %lu",
+		f2fs_warn(sbi, "%s: inode (ino=%llx) has corrupted i_inline_xattr_size: %d, min: %zu, max: %zu",
 			  __func__, inode->i_ino, fi->i_inline_xattr_size,
-			  MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
+			  MIN_INLINE_XATTR_SIZE,
+			  (size_t)MAX_INLINE_XATTR_SIZE(i_blocksize(inode)));
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
index c1d76674ab7c..4c95229ac3f1 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -855,9 +855,11 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		break;
 	case Opt_inline_xattr_size:
 		if (result.int_32 < MIN_INLINE_XATTR_SIZE ||
-			result.int_32 > MAX_INLINE_XATTR_SIZE) {
+			result.int_32 >
+			MAX_INLINE_XATTR_SIZE(F2FS_MAX_BLKSIZE)) {
 			f2fs_err(NULL, "inline xattr size is out of range: %u ~ %u",
-				 (u32)MIN_INLINE_XATTR_SIZE, (u32)MAX_INLINE_XATTR_SIZE);
+				 (u32)MIN_INLINE_XATTR_SIZE,
+				 (u32)MAX_INLINE_XATTR_SIZE(F2FS_MAX_BLKSIZE));
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
+		max_size = MAX_INLINE_XATTR_SIZE(sbi->blocksize);
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
index 7cd7ce58334b..75beab2d1ee3 100644
--- a/fs/f2fs/xattr.h
+++ b/fs/f2fs/xattr.h
@@ -71,21 +71,22 @@ struct f2fs_xattr_entry {
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
-			(F2FS_DEF_ADDRS_PER_INODE(F2FS_BLKSIZE) -	\
+#define MAX_INLINE_XATTR_SIZE(blocksize)				\
+			(F2FS_DEF_ADDRS_PER_INODE(blocksize) -		\
 			F2FS_TOTAL_EXTRA_ATTR_SIZE / sizeof(__le32) -	\
 			DEF_INLINE_RESERVED_SIZE -			\
 			MIN_INLINE_DENTRY_SIZE / sizeof(__le32))
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index bec31591b398..e98bff846b23 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -15,7 +15,10 @@
 #define F2FS_MIN_LOG_SECTOR_SIZE	9	/* 9 bits for 512 bytes */
 #define F2FS_MAX_LOG_SECTOR_SIZE	PAGE_SHIFT	/* Max is Block Size */
 #define F2FS_LOG_SECTORS_PER_BLOCK	(PAGE_SHIFT - 9) /* log number for sector/blk */
+#define F2FS_MIN_LOG_BLOCKSIZE		12
+#define F2FS_MIN_BLKSIZE		4096UL
 #define F2FS_BLKSIZE			PAGE_SIZE /* support only block == page */
+#define F2FS_MAX_BLKSIZE		PAGE_SIZE
 #define F2FS_BLKSIZE_BITS		PAGE_SHIFT /* bits for F2FS_BLKSIZE */
 #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
 #define F2FS_EXTENSION_LEN		8	/* max size of extension */
-- 
2.53.0

