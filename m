Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029371;
	b=AV2E7aKyLL8oQswgHuHiu0umSk66l857hjSYWztHFh6czYE5Vu7ha8bQR3S+vMZVMUcQ
	 z8s/rrOAks6CbYe0mTdCQfNfXcP64b4Kr/mgoByLP0nYiXWJZy33BTcwj+oCS5cJP5F+b
	 9RphV0HSyR2SfAxPGYw2ohO9eLJzAXKkuXF7FjH5bieOazP8XbaNxu9VF++GDo2d1cGk+
	 5yCvUa1t0/j7ht3W7GTAVSy5LzmFcOKkLCIhY7l4/1jhSfBgBogX1rmF5tPXXC0Q3UTWi
	 DJ9HlQo1CGmFfTqtXk0WpbRfohJTb+iUuc3FqVafkjpw9HaZkULVKyVQroeVNSLCTRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029371;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=Nq5w7tqX+Crh0A207ydeLLwQB2c0ADg2faM9Ie5AIOM=;
	b=QJvt5Hk0FISTOZgVheg/5TwuLmT6YOS7ch5FqkXg6NjvQB/A/VMGCVeMiJMGVqJMRgHE
	 k1+3VU4iromG/ezwqS/qtRxNYFu88775MEgJUhXsDsMHSyiiLtYmvgxAWtM3HrfEJz2EH
	 l2/oFjmPLueSsLoZaohxqNYiNG6SEc7c4WI9TNdvWDWaoK26FjrMdN80OvIfbzkBdodgj
	 w9HF+5PnDTOKEN3FYy3BzaB+vIo00zFBB6tvnEd75m7i5L8XZ/MpohKQm1HnTwnZiKl5M
	 OVl/R3zdUtAVcEZ9Mb3jNlEsLP3uH3meW6Qo6aAlIcZn637RBeusNlaQMyHyRvhfpCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=U9WkOfsN;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b="Ocs5rCZ/";
	arc=none smtp.remote-ip=92.204.81.224
Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [92.204.81.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC0B606D804
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC0B606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=U9WkOfsN;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=Ocs5rCZ/
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id PYyzxFofBjLMrPYzLx4crV; Sat, 07 Nov 2026 05:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794029357;
	bh=Nq5w7tqX+Crh0A207ydeLLwQB2c0ADg2faM9Ie5AIOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U9WkOfsN7sCyan8MEEKEdu6JlX4fFh6QlmpiCyjhMx86HFPtpNgGgBbvOTTEqiJWd
	 292QTv96COc2XxRzMt3ydfPnTrRJueebEgPD24VoTqaMaxutl9xt0InwlKTE9aAt0Y
	 YOrinUGE4NlViAAOijsSEhKwQaBTpMm51GwEDbDcdz3SQayBNQsKbOJQgNUJdB+HDx
	 3VyW29C6OggsSy+DN0BGMzJmIw2ZSopVayB9lyV2HXjcdunkuyn/zPQuq97JrHK4Ev
	 tls0Rl5+iZJe26x2xMUDMAy2zwRoD/0l/C22GwpGnBn/n+z8614BSfGHh9Mju8CQBO
	 CF12+f6UfXyeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794029357;
	bh=Nq5w7tqX+Crh0A207ydeLLwQB2c0ADg2faM9Ie5AIOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ocs5rCZ/BKxbLLvb3Mqz05aQ0hxe3+41jvWvxYPXZM0XNnbzl8ip5tRwBMPoPgOOS
	 0nr4SLki/iF6iVA2kwX4TWif7Uqh9vVhf9mGTlStO4edFCGpDy6qGeWted8+dYSBn2
	 m1QSIfIRazP8m87yKE2w4cd9G7G4PZjB/chbIfrzEVCNXbsOBPcw1f+Wd5fzSfCgfS
	 ptMKkYIszpNqmTXexvJvt6MEY4ul+TddNrG9TYmxzz70hO45zZen6QjY26hN3JGMQF
	 SiwdPr4Ipl+WcTqGYE+kXNt/2gTMhJveEIF4yPHoAJnxaB0hygy9GFYAdmDMCTaaBb
	 OxDHOXo6ddJsQ==
X-CMAE-Analysis: v=2.4 cv=fZ84WEQF c=1 sm=1 tr=0 ts=6aeeb72d
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=dA03S5-tUKIFcmplmssA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 902e72f66683d716cb92feed616fdd09:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH 06/18] Squashfs: convert SQUASHFS_XATTR_* to inline functions
Date: Sat,  7 Nov 2026 05:28:31 +0000
Message-ID: <20261107052843.725239-7-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107052843.725239-1-phillip@squashfs.org.uk>
References: <20261107052843.725239-1-phillip@squashfs.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfK/6xQXLwiaULTGWBmnjsrkOVZiPTe5SVKqSt3/YuWTjHT2CHZHOKDgXtOKBzmu7pA9l8osxZ3RUreGo/EkpVZtI5KLS53Ac1wnQJd+KK4Y1tPIU7TiR
 CWIXMHIbyP3tGxwyFYEHwcBoVasLK+KzRkxdvQ6mrxBOLbiJXESQdIZ6oNQhBI26d9Emcnlu5bkV0ouY2L3dOOe/JJXZqIO7l3B0UMxPVtr6cmYxQTnBBLg9
 VHC7oiiTLvmkAaeezXzPYqt3uUvPCqAqdWMDKYbETjg8SCJQrU/kWx+fn9zWoQXk

Convert old fashioned #define macros into inline functions.  This has
the following improvements:

1. Inline functions are typed, which makes the width and sigedness of
   input and outputs explicit, which reduces errors.

2. The inline functions enable more sanity checking to be added in
   later commits.

3. Inline functions are easier to read than #define macros, which
   improves code comprehension.

Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/squashfs_fs.h      | 19 -----------------
 fs/squashfs/squashfs_helpers.h | 37 ++++++++++++++++++++++++++++++++++
 fs/squashfs/xattr.c            | 18 ++++++++---------
 fs/squashfs/xattr_id.c         |  9 +++++----
 4 files changed, 51 insertions(+), 32 deletions(-)

diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
index 25dd89a2c6ad..3e7d0730b2d9 100644
--- a/fs/squashfs/squashfs_fs.h
+++ b/fs/squashfs/squashfs_fs.h
@@ -107,25 +107,6 @@ static inline int squashfs_block_size(__le32 raw)
 	return (size >> 25) ? -EIO : size;
 }
 
-/* xattr id lookup table defines */
-#define SQUASHFS_XATTR_BYTES(A)		(((u64) (A)) * sizeof(struct squashfs_xattr_id))
-
-#define SQUASHFS_XATTR_BLOCK(A)		(SQUASHFS_XATTR_BYTES(A) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_XATTR_BLOCK_OFFSET(A)	(SQUASHFS_XATTR_BYTES(A) % \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_XATTR_BLOCKS(A)	((SQUASHFS_XATTR_BYTES(A) + \
-					SQUASHFS_METADATA_SIZE - 1) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_XATTR_BLOCK_BYTES(A)	(SQUASHFS_XATTR_BLOCKS(A) *\
-					sizeof(u64))
-#define SQUASHFS_XATTR_BLK(A)		((unsigned int) ((A) >> 16))
-
-#define SQUASHFS_XATTR_OFFSET(A)	((unsigned int) ((A) & 0xffff))
-
 /* cached data constants for filesystem */
 #define SQUASHFS_CACHED_BLKS		8
 
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index b9c517a50642..4088e598400f 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -132,4 +132,41 @@ static inline s16 squashfs_id_block_bytes(u16 ids)
 {
 	return squashfs_id_blocks(ids) * sizeof(long long);
 }
+
+/* xattr id lookup table defines */
+static inline s64 squashfs_xattr_bytes(u32 xattrs)
+{
+	return (s64) xattrs * sizeof(struct squashfs_xattr_id);
+}
+
+static inline s32 squashfs_xattr_block(u32 xattrs)
+{
+	return squashfs_xattr_bytes(xattrs) / SQUASHFS_METADATA_SIZE;
+}
+
+static inline s16 squashfs_xattr_block_offset(u32 xattrs)
+{
+	return squashfs_xattr_bytes(xattrs) % SQUASHFS_METADATA_SIZE;
+}
+
+static inline s32 squashfs_xattr_blocks(u32 xattrs)
+{
+	return (squashfs_xattr_bytes(xattrs) + SQUASHFS_METADATA_SIZE - 1) /
+		SQUASHFS_METADATA_SIZE;
+}
+
+static inline s32 squashfs_xattr_block_bytes(u32 xattrs)
+{
+	return squashfs_xattr_blocks(xattrs) * sizeof(long long);
+}
+
+static inline u32 squashfs_xattr_blk(s64 xattr)
+{
+	return xattr >> 16;
+}
+
+static inline s16 squashfs_xattr_offset(s64 xattr)
+{
+	return xattr & 0xffff;
+}
 #endif
diff --git a/fs/squashfs/xattr.c b/fs/squashfs/xattr.c
index ce6608cabd49..f9ef669544f8 100644
--- a/fs/squashfs/xattr.c
+++ b/fs/squashfs/xattr.c
@@ -19,6 +19,7 @@
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 
 static const struct xattr_handler *squashfs_xattr_handler(int);
@@ -29,9 +30,9 @@ ssize_t squashfs_listxattr(struct dentry *d, char *buffer,
 	struct inode *inode = d_inode(d);
 	struct super_block *sb = inode->i_sb;
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	u64 start = SQUASHFS_XATTR_BLK(squashfs_i(inode)->xattr)
-						 + msblk->xattr_table;
-	int offset = SQUASHFS_XATTR_OFFSET(squashfs_i(inode)->xattr);
+	u64 start = squashfs_xattr_blk(squashfs_i(inode)->xattr)
+						+ msblk->xattr_table;
+	int offset = squashfs_xattr_offset(squashfs_i(inode)->xattr);
 	int count = squashfs_i(inode)->xattr_count;
 	size_t rest = buffer_size;
 	int err;
@@ -107,14 +108,13 @@ static int squashfs_xattr_get(struct inode *inode, int name_index,
 {
 	struct super_block *sb = inode->i_sb;
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	u64 start = SQUASHFS_XATTR_BLK(squashfs_i(inode)->xattr)
-						 + msblk->xattr_table;
-	int offset = SQUASHFS_XATTR_OFFSET(squashfs_i(inode)->xattr);
+	u64 start = squashfs_xattr_blk(squashfs_i(inode)->xattr)
+						+ msblk->xattr_table;
+	int offset = squashfs_xattr_offset(squashfs_i(inode)->xattr);
 	int count = squashfs_i(inode)->xattr_count;
 	int name_len = strlen(name);
 	int err, vsize;
 	char *target = kmalloc(name_len, GFP_KERNEL);
-
 	if (target == NULL)
 		return  -ENOMEM;
 
@@ -158,9 +158,9 @@ static int squashfs_xattr_get(struct inode *inode, int name_index,
 				if (err < 0)
 					goto failed;
 				xattr = le64_to_cpu(xattr_val);
-				start = SQUASHFS_XATTR_BLK(xattr) +
+				start = squashfs_xattr_blk(xattr) +
 							msblk->xattr_table;
-				offset = SQUASHFS_XATTR_OFFSET(xattr);
+				offset = squashfs_xattr_offset(xattr);
 			}
 			/* read xattr value */
 			err = squashfs_read_metadata(sb, &val, &start, &offset,
diff --git a/fs/squashfs/xattr_id.c b/fs/squashfs/xattr_id.c
index c8469c656e0d..ff85247e2d80 100644
--- a/fs/squashfs/xattr_id.c
+++ b/fs/squashfs/xattr_id.c
@@ -19,6 +19,7 @@
 
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 #include "xattr.h"
 
@@ -29,8 +30,8 @@ int squashfs_xattr_lookup(struct super_block *sb, unsigned int index,
 		int *count, unsigned int *size, unsigned long long *xattr)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	int block = SQUASHFS_XATTR_BLOCK(index);
-	int offset = SQUASHFS_XATTR_BLOCK_OFFSET(index);
+	int block = squashfs_xattr_block(index);
+	int offset = squashfs_xattr_block_offset(index);
 	u64 start_block;
 	struct squashfs_xattr_id id;
 	int err;
@@ -79,8 +80,8 @@ __le64 *squashfs_read_xattr_id_table(struct super_block *sb, u64 table_start,
 	if (*xattr_ids == 0)
 		return ERR_PTR(-EINVAL);
 
-	len = SQUASHFS_XATTR_BLOCK_BYTES(*xattr_ids);
-	indexes = SQUASHFS_XATTR_BLOCKS(*xattr_ids);
+	len = squashfs_xattr_block_bytes(*xattr_ids);
+	indexes = squashfs_xattr_blocks(*xattr_ids);
 
 	/*
 	 * The computed size of the index table (len bytes) should exactly
-- 
2.47.3

