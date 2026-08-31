Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267673C3F42
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195743; cv=pass; b=KhHHYlxCKMZvtQHoCthfCJKkpqvT8uczC5lO/WM7rSeXPN7SAorN+TdyYNeU/hEG8GamipBuoCizGNzZmE+8Rwkn8gzfAmBJU/qP+7OKtky7vvSWeKrNATAWjp0EWQc8WfAsMFmEugiEl+LrYDGwL8uA8GPTQUKJy0CkpND1uAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195743; c=relaxed/simple;
	bh=VR5ilbanWF7j2HtEfDuXVi4GqR6LFeBzg+b5xrKjh+c=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4VwoZrLZ6J9B5JaKdpYJGGshJBJhgcMFC9ffXd2c0DBkShKaXnjvA99GR3qSDr9C+Co3BwgdhGs/sKO3Q3z5A3z4IT8naDoU2YNlSv1+8s/SSsxT5qvhLxTYWzkfQK0pGF+7eiydO1SYXZFRK4Kt5JLuhnPIUWy+KwYvH/fNrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vx/0uQ45; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vx/0uQ45"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a5ebf75d62so131842a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195739; cv=none;
        d=google.com; s=arc-20260327;
        b=l3uwvERh5gWEiQrwYiPzkJ6A03wkjc8cQzfX8DDd1HZ04ucNusOHNTdC0rXh6I/46A
         ZWwjPBGPcWsT8b2V6oNQLVxTVscxBkmlEDrIOKFRQURrri7Nl1rQVMywynlHvYwISmce
         QjO31qPH1udUbvlPnSZvJXGkWVvYoPjjiDTWyKsoWQk4mAkyLI6/ASBlUAdWaFf3lqqc
         9ZogTmVXSEg0gBHv0JTKFDe06AzwOTQO50ZJK+AF9xv2PARKWqh2Uxw0KoUWNVWjsTD8
         4kJoTSPMfY/I2QaFTGtoxXnIKDCjv/pG3d8n7eUl8ZcWOfoijYG4qTYbBj6Xuy9A8wgS
         S6aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Jwk6B4YYUYIOqVo5qZvx9IbKKge2giW/CtwxPziGTg4=;
        fh=q7ZZ4mH2mSJ1b3+UuK6dPgowjXvxvuNsI7QmFH/apRM=;
        b=AlMYjv7mLG+3+nRdeqGxuVN1AZKPxrJO4SC9d+ffgZRgz8yCcpdDhEDLen85mUbiXD
         UC0oIS07VZW7ETaWjSXve20CyB88pgYp0Sdqmem4AMtdQ2KlM4TqnjN4VWOuOxET3Xqf
         VBCl2pVveoh298jtiEDnE9ZmBCP2EQuxegoZBgQSHUTik5PsRjC6vWLusQ7TboZC5Qdc
         n+XA7o+DR2uHamBVcXZeXsSBbKb1GENdw5nypTjTxN1h8OYohGQsK7TSFKQdbPsRad9h
         qFBemIvnzZfv7AC0LrofNoP5m4jZBA+NZL7BOChAo1XVSSDY/6duF6BiCNUNV6uXEmkA
         GD8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788195739; x=1788800539; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jwk6B4YYUYIOqVo5qZvx9IbKKge2giW/CtwxPziGTg4=;
        b=Vx/0uQ45J0iBr2MTzBQEYpJx/WL9V4imG7xw0VL89Adg901wGUyIr41uUbBtvzONAr
         71XFUlcvEwYa6uFjnevvviTlpxyP9wkGg1wFcpGezkSsD7bLCRwdHqOk6APrwkGtFHQm
         AqsE/k+vQ8K2tvXSE1BEyLyZzIgHisdgDYVbJXNb5SQ8kGOOlr4VzJQT9drogJRiqCiR
         bIXNqoe9jOXfT/eFqfsfRD2imej8UZNt0LDhM/umJ/RmIqyzd2jChTBu4PRi+5Zt7GJ2
         EbYbBW0Tp+oClSFFUA6jXTr13/EMyeTQrjBdRI8eoE4iXLZB+bq49O4gAt3ldnmmCn6j
         oxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195739; x=1788800539;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jwk6B4YYUYIOqVo5qZvx9IbKKge2giW/CtwxPziGTg4=;
        b=btRp1hK3Ysc68t3e95UmCHcq/yy9QN14YremNFFI6dAvb0y7skW58eKAK98xesKMEb
         yYM3JqOOBNHLDAAGwOzlN6AlxNCihfc5Uq+9DONDAYXsrbLk4ETzX8gLnidS10MA5lnf
         ebaqR7gujKiVtEo1Zfz/k0pF1y1ckzxYfwBdAv7xDS6VMB7uOmUZ+GhA4zsFkB0mfU7/
         KNKPezKh3NifxNUvGiTY8OoONbz4eVZRQrA9nuIpNMxP8rvaRf/MZBYmCuejKNqMh2jd
         VBkFw6EgBh8k92fxBHxb0Hw/Jcd0JelM5bjYe69jC0g70Ec6ROOqURBr33kfVO59OHeo
         NTGg==
X-Forwarded-Encrypted: i=1; AKwUvBz7vIgcSKr0pOzKHcX+tKjlUXQzKxfzZZG6EgarWdMGRioDDSXXafNKCiUw3oyBsbTxqFpTLyjXvgPg0B0=@vger.kernel.org
X-Gm-Message-State: AFuF++lSr9xf8eqcciH66hmdVvRTl1nkyluGnD49JLagcC4E2OsDC3lA
	Ei0ckhDxfn5Rt3wphX/aK3zuFJrjZyQixkiULV7rk/7VnxcXbbp8HukDq5jKVrRyyh6qFJbqKEN
	2XeB0fny/FxstjfMPXo/4P0HFHxttdzybrASaTc8=
X-Gm-Gg: AYBFou3xhchSTqAPYP447KnRFhF4MqJBo2d2eVpb/YTFciVI42ExpWAc0CLWYa9ePF8
	GNJEtZFwpTxvN5KjEfK7DeicngER30M5k2XDbdeTfljHauwfOxrcXo9lzxQQCUUotSjhmu/D4pG
	PKGjEWRrPF8EUnatWsRv+zqssvTXAV/i6tDVuy6rVzy+0GBnggllodQoNBhQJsRxuE6FeR2SJwn
	7tspKyFNcEOsIpfbntBXy3sbwqRz4ciYC+TixpCP8MH6Qfc5YBE9n+sw1k1QGQT0Xk1trL6LLyQ
	zq/sp9ICnFTKdBzXG3glFcjulEHxQYCsgEGH/mmy00ePINpI/NFbjcZDiIBBxYO8S930QS1Qmr3
	WMLEGnzV21hlj
X-Received: by 2002:a05:6402:208e:10b0:6a6:42af:e267 with SMTP id
 4fb4d7f45d1cf-6a6476c3d3fmr4229916a12.4.1788195738918; Mon, 31 Aug 2026
 10:02:18 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 17:02:18 +0000
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 17:02:18 +0000
From: Kelvin Zhang <zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAH=xXfHWPg6qRwW+N2ziH1cvG3OD3wJc1z_Tm04MtFCpqYmQFg@mail.gmail.com>
References: <CAH=xXfHWPg6qRwW+N2ziH1cvG3OD3wJc1z_Tm04MtFCpqYmQFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 17:02:18 +0000
X-Gm-Features: AcwNN1VXCt7JAycE5Eb09H9YWziWpb0Dqr0EyzswaSPSvbnqVD98OHRW-c4VFxY
Message-ID: <CAH=xXfFfGM6UrR9EOVGaMcFVrXNm7JSYHCBWidrXj7xkt21dPw@mail.gmail.com>
Subject: [PATCH v4 07/11] f2fs: describe xattr block layout dynamically
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
index 3d0fe2c78e12..d4151970ae86 100644
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
