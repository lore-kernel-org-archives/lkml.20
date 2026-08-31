Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A3C3AC0E6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788154394; cv=pass; b=deoFM/7PSKty9kEKZpbXSRp0elUvVJQ3s1Z2qKXAUcL+6N95qIXyOVNO4Jbl5CBVpPe9jZVbo5hoilTN8hnL8YtuD8be0g6xuwPv1NA6u25+xjiYhGHXSWZWU9lnle9Vl4CYBLNBniCFdib2ptZOuuIgyS5F1xLMbtKfsoeVkCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788154394; c=relaxed/simple;
	bh=VR5ilbanWF7j2HtEfDuXVi4GqR6LFeBzg+b5xrKjh+c=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oeqNl0kLXJlPceXxmU+hlTk/OG9vep0NQjDX2bgJ7x6ox6hSJlpjgh9YcYwQUEZHmanisrt64veYuQACgopNEUsuJils7HdYwtWBZHDLmaQ0BlvLC2r8zZQMaV0Kc5GMjZ+QOgrfQsut5JkLH+Pw+gF7Q7b3ZX/otC9Xlh4KGCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIH+zKlS; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIH+zKlS"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a63667b78aso2091000a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788154391; cv=none;
        d=google.com; s=arc-20260327;
        b=BB1HUgefh7C24ONzetDVCEpNsI376OB/oTaTdmZQQvnMPiMQdk2H31YSxyxT54rC3Y
         l738e8K6Nm2IpwqIbmV+/uFw0H8CDIqYCqtQq/ffipMJjMNIlYwSiSZYJSnGdyaBTlzI
         rvXPL6Ni1VguGH0Y71Tob99EYB8ntT+k5LJd3IKewcjZpU5ZbkLJUirBw/z0qcsHTIT9
         yg5WG/YX9rc5ix0RlYUgDSCKZdSHAEfhdBPNQUgqhqzWqCGmdEBk6NetzNvv4TMsxh7F
         RAytMAcleQuTAuGD7UgYA3iPnm/Ob2ujkczOkRulqz9WlDjJv28fEe5+wFh3Lm+Sa9pM
         dUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=Jwk6B4YYUYIOqVo5qZvx9IbKKge2giW/CtwxPziGTg4=;
        fh=+0ykIzFwygZnW9oCWb4p+LZh7InSk70ALvtHH2hVJck=;
        b=MqQyeFuH0Few+l2xbOkdvGIcPOaStkWf3uVO750zZkh0a6jEd+Lgu9e64f0mLB28c1
         Pe0Gm0n2ISQgv41ytJ4Tv720+d/7WLkfdH+3PYi8As/5g4CKH0F2hOX+DSnU2sq4GVUB
         jQGehA/kgoqc/gYjNw9jepFqjauh5qceEss13GbZ/IGGLrzHuikOYGgw4/GBkLMsaHWH
         cj/GltvvXEWpTCUbosmd3NlPgvtYgAu8MweIqOm3mBCYmOdmY7PFDVon7Wo+AlL92saX
         Am8iyFQ0M5GexpKWjUnUGfuuLMPgiHYLQ+EZs5eakwuE7649XRCw5TRJw2Ju64Ct6daq
         wW2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788154391; x=1788759191; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jwk6B4YYUYIOqVo5qZvx9IbKKge2giW/CtwxPziGTg4=;
        b=VIH+zKlS20fJ/3AD1JCbpdtE1ZqTR9lv56Zl5mjvzsPSAyuIfFkFRBm+BLrLOQZIbW
         IF1dfWTYBXAFtaoonOORy0ReS3Qb5Fz9O3Hw/gxJscnQHPtnPU+n7m9Wnf4TPSQnI+ol
         uETIyqM4brcADYJ43n7tlL9cFQWCy9ibHT9Ho6M2XCc4e4GRWsxV9IqqTXs/Pu2Asfdd
         LIo0oSCLtHPGMS2HmUw7Ooe8GkBgpXjT0Il0GLX/tSzreptV7PdXHndUigMwYAT5tsl8
         4sdKEVq6a9zrowHq9iuSMs+hFccAnlyd3ullugYhZWhAh4hJRntD1wseOURouHJ/DteO
         S9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788154391; x=1788759191;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jwk6B4YYUYIOqVo5qZvx9IbKKge2giW/CtwxPziGTg4=;
        b=Jy2blkYKW8GtS83FJnrCTZMF/b9MrRx8mM6JsbiGYVlC1Fbi4lBRgwf4UvgiYlQyoW
         WaEbstR5BZaBGYwwK+n8T4QZ0/ecp4ZMxKhO/A2mLWayKm7rLncoevHmHZ0eCVau+Ixl
         lOjXKyYMkZQ9uLcmAuTYKJ9qOahNB3VDCd+ojvXxFCRgiy8qTf7Tge2QZuI0VJukrl7E
         81+ylQ4kzaZ7JnlAdHY7RBW0zTtHMbtDsE4vzuasBXPAbAWfvW9w/D4fYE6ofmRj5t0z
         9b7o/09aGsoTxsN7xq1g/fZ2PLYl3GV0AfSL4nxhpozJVI+GGAck9G3n8E9JrNRtcJlL
         nmWg==
X-Forwarded-Encrypted: i=1; AKwUvByty8Fme5SC+invqgyEmyJGEkBwb02GnLM1YGO7gEQjncT7c8UMYDNrNQ8FfhpN5E4qpGIM6B9vJ/QzGdc=@vger.kernel.org
X-Gm-Message-State: AFuF++keWezcHH/mO4hpoQsFlU725OIujG5YJ8GSa+Hf51zXtNy3POif
	bMuhJSoqmXMGRqOlju91tdgs9Oh7JCRzjRcvjc3JF5esyWbboijWYqTiq3LG3c1zGwfhxqrnd5p
	5AtuMQLB6A5GA+O6d6o4/nV6VhOD//GA=
X-Gm-Gg: AYBFou2QMTe2w8SfnkdzMj9gPdCu2PM93D4wS1kis3ALfhjelRdhrIDsee2EZ1IPFFk
	bsWFG/WJyJoSEMnIND0gfkN5ANOfmd+5B+R6/dCDHtIHR3n7zdEV47XkolKiwrDcprlzblb3tZg
	ApYnKR1SpWnHwvocMcwd0HeVfqJAakfuOWr7v7RjnpIbiGYfLdTgYbb7vPAbVd4ixHK1iTqPoQL
	sV5c1pjCK1QBqD759y8NtWmTA6NAZHClegsSAjqUlzltiGuKTxcYSyYi7NJYpAzxtbk/7SNs+EL
	UjxtS/e2s6LdVPHKeCkyEPa5vi8gjRlFb3lYJyWEO5B1WAojI2UscMB9KhDJPPXgfubEExILyT2
	2uw==
X-Received: by 2002:a05:6402:4516:b0:6a5:f815:b15c with SMTP id
 4fb4d7f45d1cf-6a60d35b3a7mr13632777a12.8.1788154390963; Sun, 30 Aug 2026
 22:33:10 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 07:33:10 +0200
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 07:33:10 +0200
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH=xXfEFL7w7nsU3xjNubKJ1soYMqT-DbJBuyzfEX4Rv3rdFEA@mail.gmail.com>
References: <CAH=xXfEFL7w7nsU3xjNubKJ1soYMqT-DbJBuyzfEX4Rv3rdFEA@mail.gmail.com>
Date: Mon, 31 Aug 2026 07:33:10 +0200
X-Gm-Features: AcwNN1Uo2oI1NwLHCU4M6vU3nL9b7_WJhuDJVf5BIQ9FwbURqYY8LcyVVocFuGE
Message-ID: <CAH=xXfGz3raKSq2WPcDO-qN=pPXbxT7KhGG7=DDB-Qo=n+aK7g@mail.gmail.com>
Subject: [PATCH v3 07/11] f2fs: describe xattr block layout dynamically
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
