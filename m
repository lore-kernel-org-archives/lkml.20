Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA49C3B38AD
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788025777; cv=pass; b=ecMrp6tD0c+ORwOpQ+w9W2vtAjqG63LPWY9SVdvdtO2m5eES1FglRsv6it1TJk30ipX+wDpc3Yx+Z8p2+X8Ljkxz0KnC+pYDfQZ6OjvCw2xl4FJjLCv8GEPp/k8pIaswYLqOGf6TnFA4ZN4PV7lJxQGIVLAz0suIcdO2Zfpje5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788025777; c=relaxed/simple;
	bh=qNRF3YeXMitXYdKB4L8bxydNSGLW49/DDxaNEd4uNT8=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcBCywrB/oFxyc5YIgLDjPH/CmQCZq9jCeFgn515ilbJ/zGgsyCnMoj+rERxU5TKOVuaKvo9l3PebLE0zkTK5jXFDN/mGUn89XTckIoJGqGeye+nCIpIih5mPmzul7FktEL9pKmfYGpTL8BlIOUtd14IFg6EouDzBu6ZlptlAxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3JLoNb0; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3JLoNb0"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso2838914a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:49:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788025774; cv=none;
        d=google.com; s=arc-20260327;
        b=WFB+AAyFL0y5MHo277l35g6Jhsw5FKkdPfc1XZoL8CIOSJAetOxEZk0vV+NG+mhRIU
         /4LkHOdfTZarsFlpCaC9i1bdlYXYqNvRgE2VTXgYXakRHGAOFN9Ym4wqwCxtYO0CvI5e
         J5+3W0oKTivSgaUZ4YPZg+M3vGqX+gS2pm0cl2t95/y6EFjsmiyqnTwfn/fdmRD+sjaa
         yVyF1oS1ZvpWe2riaXFxIH2qbSDsDu5q51J/L7JffJEZkE9XUS4S1kfXYiCCBKemajD5
         JdmQ+xR683VuJ1nLMtzG1mTQ3L5HuljM5G+w9Na/1YC5CnlMHUCJ75ME5gqIQvtnpCaM
         nmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=Lxs6re5XMINX1YAgGCNMKMyhwD4CCm+XoEwKtl4IBc4=;
        fh=p7maRXQ6f0bP0uv3jabF119vZ1hCK+lLZhQ0goK47j4=;
        b=fQjbGNaCwCFM2Z/LLtb7u3HDiE3M6iGnaFM4pRy3RcTyfKJZl5ndD0qCDo/SHvdw+i
         5oOVQOK7YAREOdmaQ0V19+bV/2tsJnZIojA9NN0R8Dsc6B9qFjyrXbmb+ncGW0sUNS1D
         C9uReHvkh9Oeq+kbJxox6sakj1wflOiLaLV6hk9c4/ew+19N7RzOEflTrR2XxICxPbOt
         3gU99Yco+emzJ7WcBjDC5hMvRRBjql19Lop8xh7Pk/ph1ey0br4qFxLyLHK3HjkF8u9K
         ZqOOqjCDxoFdQ3NQAZVdvylYh2A6jYITDy3tmH40l7+RgtIApyip8xLdSskCURDfrQnN
         j4ZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788025774; x=1788630574; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lxs6re5XMINX1YAgGCNMKMyhwD4CCm+XoEwKtl4IBc4=;
        b=M3JLoNb0+4xFbRJ25magbEWzM9TLdsX2rrzW9KAdW+ZW1JsLI8KtnZJ9abZ0TFtg7j
         zFVy4cZEG8qyiPyQT4qyAi7T8960hqBaiepv0Q8LwZ4pi3TI/xz+PObMei0vPlltb76c
         zgqn8qYriAfU2bZFdp0TSy5UeyYG5T6FALzhBH9XHHvXJIyxgYooTQ0ehlQLoJi7S/5F
         7fps/7WyxcONnrhO/r7A/zZQAVJKQpl22pJhce2Cz0zEN0FXUNXb/ceQHRlJDwuAbEQx
         u0pZJu830JLmbtK+BZh+cfSfwTN6QW3sh0VIrxif8Gm00MwhMdk9DfpjA8ayX9ZbA7TC
         HSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788025774; x=1788630574;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lxs6re5XMINX1YAgGCNMKMyhwD4CCm+XoEwKtl4IBc4=;
        b=s9S/LV4IhMvu9XzNTh3/giGRePCuEX24A07VWI0KdPNsU187dVW4Nr3QFVGor4DJiE
         NgjoVinNE559pZKGMH+k4dMItBWCr/UDDNw2Eztt/ZpFe3buoOJOLFhRQgZnQ471c57g
         Amg4n2rD0VaGqnZ/43ezFG1VFsJUnjUxmXDKoOkXVhalEnw5jZ822+HH+OK4w2mXMTCx
         xBuS2Og4kc6xvgQLhu2pDVY670G2dfLktJKEWpuutcHE3LS10pCwpBMlV3iAaktg1jEd
         2Lnx8WqiQeYvJX1YGGyWtRyn1RcGruajg1pzMBcYlgMBzt/FxSsmLInn3f9pRr8PGDsN
         xaMg==
X-Forwarded-Encrypted: i=1; AKwUvBxNpbF0dxEHApLkluwPgXHFEYIx7oKX/WNHF6bdYHDpGlCN/2NcZpUiGDLq0YidXrMnCJ2dtfcZuZsR4ys=@vger.kernel.org
X-Gm-Message-State: AFuF++m2z9I7/+4Lj/3UEoD3XsYCGGks8rWG8XLgvR9GYgB/s9lyFTKr
	7Cn0WPSY1r36UE52AbxrmOWFYl2WC+Haw3DRoGIgrEz95QnCcqbeFpwybnBgLX6uJHSN6V2SjYm
	xN2A+3gEXn+KDf/mCjw81mP83UPrKjW/+GG70x0Q=
X-Gm-Gg: AYBFou3RWIySfKQ59GFNrUtg6y89WZLhzs3A3w6JlHBfsACS6Kxpb3QO2gQQ6mQ9s1C
	3iSHjCyf/ntm7PY1q0ZRb9OzwIIPXjm5Qzkg9Kyzd3scAzMWCq/2KuADepzv/ThvuLYJtgCD1Nb
	wEqzrNZONcAxG2Jr+EBiB+Azv3D4G8fi7GixFlAfjqwSnUdf6ObD7L/j4U0X241wXvdqJtRiahM
	K0PYHko7t4uihHJSs2T/VGEBlgElJwTwwLb4hkBAiT4bfo7ItHR8FDKoSYgWyI46lrSLyIEPkSY
	2qjI+q5sQSe6QFizJbGrOcCsOydGzdK7r3a8EqCqmnyZjvlpJ2XrEiBFr1vep5loXPHwB2W2IRm
	gkW72nrAUNvZpbg==
X-Received: by 2002:a05:6402:24d5:b0:697:f6b2:a94e with SMTP id
 4fb4d7f45d1cf-6a60d3a7b8cmr7959598a12.13.1788025773849; Sat, 29 Aug 2026
 10:49:33 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 10:49:32 -0700
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 10:49:32 -0700
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com>
References: <CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com>
Date: Sat, 29 Aug 2026 10:49:32 -0700
X-Gm-Features: AcwNN1WvMxuhExni0UWMXGddN8jm3UA89aH7som-upGcLpEU6TAEjTgje9k8tDQ
Message-ID: <CAH=xXfFy10WpCebZSsVhoe1gyktix60bWh2a6Y_OVX9ZcdFEYg@mail.gmail.com>
Subject: [PATCH v2 07/11] f2fs: describe xattr block layout dynamically
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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
@@ -337,12 +337,12 @@ static bool sanity_check_inode(struct inode
*inode, struct folio *node_folio)
 	}

 	if (f2fs_sb_has_flexible_inline_xattr(sbi) &&
-		(fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE ||
+		(fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE(inode) ||
 		(f2fs_has_inline_xattr(inode) &&
 		fi->i_inline_xattr_size < MIN_INLINE_XATTR_SIZE))) {
 		f2fs_warn(sbi, "%s: inode (ino=%llx) has corrupted
i_inline_xattr_size: %d, min: %zu, max: %lu",
 			  __func__, inode->i_ino, fi->i_inline_xattr_size,
-			  MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
+			  MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE(inode));
 		return false;
 	}

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e3f594f7bcce..7dabfada1b54 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2919,7 +2919,7 @@ int f2fs_recover_xattr_data(struct inode *inode,
struct folio *folio)
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
@@ -855,9 +855,11 @@ static int f2fs_parse_param(struct fs_context
*fc, struct fs_parameter *param)
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
@@ -1596,6 +1598,8 @@ static int f2fs_check_opt_consistency(struct
fs_context *fc,
 	}

 	if (ctx_test_opt(ctx, F2FS_MOUNT_INLINE_XATTR_SIZE)) {
+		int min_size, max_size;
+
 		if (!f2fs_sb_has_extra_attr(sbi) ||
 			!f2fs_sb_has_flexible_inline_xattr(sbi)) {
 			f2fs_err(sbi, "extra_attr or flexible_inline_xattr feature is off");
@@ -1605,6 +1609,15 @@ static int f2fs_check_opt_consistency(struct
fs_context *fc,
 			f2fs_err(sbi, "inline_xattr_size option should be set with
inline_xattr option");
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
@@ -310,7 +310,8 @@ static int read_xattr_block(struct inode *inode,
void *txattr_addr)
 		return PTR_ERR(xfolio);

 	xattr_addr = folio_address(xfolio);
-	memcpy(txattr_addr + inline_size, xattr_addr, VALID_XATTR_BLOCK_SIZE);
+	memcpy(txattr_addr + inline_size, xattr_addr,
+	       VALID_XATTR_BLOCK_SIZE(inode));
 	f2fs_folio_put(xfolio, true);

 	return 0;
@@ -393,7 +394,7 @@ static int read_all_xattrs(struct inode *inode,
struct folio *ifolio,
 {
 	struct f2fs_xattr_header *header;
 	nid_t xnid = F2FS_I(inode)->i_xattr_nid;
-	unsigned int size = VALID_XATTR_BLOCK_SIZE;
+	unsigned int size = VALID_XATTR_BLOCK_SIZE(inode);
 	unsigned int inline_size = inline_xattr_size(inode);
 	void *txattr_addr;
 	int err;
@@ -502,7 +503,8 @@ static inline int write_all_xattrs(struct inode
*inode, __u32 hsize,

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

 #define MIN_INLINE_XATTR_SIZE (sizeof(struct f2fs_xattr_header) /
sizeof(__le32))
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
index f339f83220f2..18a9abaa879a 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -15,6 +15,8 @@
 #define F2FS_MIN_LOG_SECTOR_SIZE	9	/* 9 bits for 512 bytes */
 #define F2FS_MAX_LOG_SECTOR_SIZE	PAGE_SHIFT	/* Max is Block Size */
 #define F2FS_LOG_SECTORS_PER_BLOCK	(PAGE_SHIFT - 9) /* log number for
sector/blk */
+#define F2FS_MIN_LOG_BLOCKSIZE		12
+#define F2FS_MIN_BLKSIZE		4096UL
 #define F2FS_BLKSIZE			PAGE_SIZE /* support only block == page */
 #define F2FS_MAX_BLKSIZE		PAGE_SIZE
 #define F2FS_BLKSIZE_BITS		PAGE_SHIFT /* bits for F2FS_BLKSIZE */
-- 
2.53.0
