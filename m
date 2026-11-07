Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029364;
	b=JRK2ENd9rCWF4VpP7vyggBc7njeEwjTmK0fezbM7xNNc7DC913DH9VwjrEwatzf1cS6P
	 B+p9dhvDxFHCGRMCBhfqJKU6MAYgyYWzJRbDG35Jx1wdt/6iIIdWKRb1ZORh6UglKmq/A
	 0ZhWM2Ke2+KMEzjc4H9edtyqEZv+/+ZE4KxvZ1dea/zv3UWubhAY6zLm/hy7c26c8JvGe
	 +78QBMDXjas6SlxLHcVw+VpVKjsVaKRP/zRXj+Gn8iLXO94tA5mxKH1PFtpt2egg7bOgn
	 +qh3HJ2oiZLiDVVZSPuuKh8ccB13gpype1/L8QdXbfgv6DMjbbX2vjS8B/JF45rBC2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029364;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=u5MCggxdErp4pCjJ7N6cx5UKOrsFP2GU3/ExQhKWu0k=;
	b=qpU/w92OUvRJ8rYjITCGMfvP9tVtYcxXTKG0DAopGsgokBtADMeF5/gEINvwk8II/xYD
	 5s6Ns8AP0JXCzicL25TVTFmeXf0sSgOYcdeCWl9joF6/HyXTy7yvNhMtNp8TuO6AwfYtV
	 yFmXzOxeFFXorVHkA64RFBDEct5RJ7NElxW+3VgLXZpGV7xuLubRvv3LOjWFesm23gO/z
	 SlGIVvR8xF0a072r7odEj0XsnBpgpwRC40d+kH31XcPPnez0GAo0ca9IRYKb654Y6JiG2
	 sKKEYZYin28vRLpxmst/WFQAzmcQ4MOMfKsrvVn2aTW049N4h/2TwAs6RgqRKyoN8pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=KqgRaqWS;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=glacpmA7;
	arc=none smtp.remote-ip=188.121.53.105
Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [188.121.53.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760BA606A33C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760BA606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=KqgRaqWS;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=glacpmA7
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id PYyzxFofBjLMrPYzEx4cqu; Sat, 07 Nov 2026 05:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794029350;
	bh=u5MCggxdErp4pCjJ7N6cx5UKOrsFP2GU3/ExQhKWu0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KqgRaqWSUjU3VAeXSE8MXODmVYX26iMbLsJaqLIERGykDpu6ircogKicK50LUyS8G
	 cH3Zs50Yx9HTUabv0vUVBa7oteBBbRrIRjyZtTsdA8dMFnvMs/G8P6L4jX9x80fbpS
	 Xm6UHPWfCGFAU+lzBn1TmH3eHqAaQnq3TO18z4p8KTrPmF81bCZchVtUakodeGdxU3
	 wlxLGXWvQ8Tkalr5GnSur6cWY49qq6IIdfFH4tBJtY61TP7n3Qwd8JSZFcVk94vR30
	 8vcJKsbkKQbVrHpu0j1TEx4snH/MZu+zqR4riDLM40yQkJsl5OJaqQBG8tXqOnfOxi
	 VdGsXsE314vTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794029350;
	bh=u5MCggxdErp4pCjJ7N6cx5UKOrsFP2GU3/ExQhKWu0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=glacpmA7t8zq/I/wbXm13NfOa0kM0kt3MJ5BxUgkpMffiFQd7+Nwh6CWizH5/2JLn
	 kpbfVgCkN4KCQFTByJDBJz3gOGEi2QdgvUaPZBNVyY7Ds93D1G8GiWGS0GRNfSYE9o
	 Jaku+PWNcRYxAaryZLsrZfW9aNlNp79vqA810AV04D71rXvAMXGTPF7zWwiMO/t7sP
	 UkNjSVEAue/Muik37XxZs0/HkUwpUdkh6cl+iQh/llaIomY2GzZv4+uZQKFtxZQic+
	 gu2tG2ExhAVlk8oP5rhIuQSF30W7G9QTFyrHevolK7fKoYmnf18SLR/12XQRFEEEfX
	 SKhZtLL2jMKYw==
X-CMAE-Analysis: v=2.4 cv=fZ84WEQF c=1 sm=1 tr=0 ts=6aeeb726
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=416_eDJGB0NHd-23YGEA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: ef3efa092ec550e486d8bec3eda632b5:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH 02/18] Squashfs: convert SQUASHFS_INODE_* and SQUASHFS_MKINODE to inline functions
Date: Sat,  7 Nov 2026 05:28:27 +0000
Message-ID: <20261107052843.725239-3-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfIX/72cKkeYWblR2UFywBSeIdoXrE3fMEQ13HvywFXedAJfjqNUJx5eTxRzuPT4LPprpPSy+tEqovMUaiGRTcINusaL+9o1ccLEGJDOTnHq5GqP/uJOK
 F36PJScI6gSUwH6I1MX9ihf2klE2PKAOkAeeudprYZSqVT64LbQqni0TUOvYwU2HyR8LQ25m1tbZoa9TrsP71k4TfYxRlCjQZYTu3bpgFPW4Cfh0y3Fn+Dkk
 CkUA9+VwfVkTQZzI/SkhWMaUk9VvoTvYC0MyegQ9aYKA2/JjoNUUUSELF2dNFxNj

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
 fs/squashfs/inode.c            | 34 ++++++++++++++++++++--------------
 fs/squashfs/namei.c            |  3 ++-
 fs/squashfs/squashfs_fs.h      | 11 -----------
 fs/squashfs/squashfs_helpers.h | 19 +++++++++++++++++++
 fs/squashfs/super.c            |  3 ++-
 5 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
index 82b687414e65..73232582aca2 100644
--- a/fs/squashfs/inode.c
+++ b/fs/squashfs/inode.c
@@ -33,6 +33,7 @@
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 #include "xattr.h"
 
@@ -108,8 +109,9 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 {
 	struct super_block *sb = inode->i_sb;
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	u64 block = SQUASHFS_INODE_BLK(ino) + msblk->inode_table;
-	int err, type, offset = SQUASHFS_INODE_OFFSET(ino);
+	u64 block = squashfs_inode_blk(ino) + msblk->inode_table;
+	int offset = squashfs_inode_offset(ino);
+	int err, type;
 	union squashfs_inode squashfs_ino;
 	struct squashfs_base_inode *sqshb_ino = &squashfs_ino.base;
 	int xattr_id = SQUASHFS_INVALID_XATTR;
@@ -128,8 +130,8 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 	if (err)
 		goto failed_read;
 
-	block = SQUASHFS_INODE_BLK(ino) + msblk->inode_table;
-	offset = SQUASHFS_INODE_OFFSET(ino);
+	block = squashfs_inode_blk(ino) + msblk->inode_table;
+	offset = squashfs_inode_offset(ino);
 
 	type = le16_to_cpu(sqshb_ino->inode_type);
 	switch (type) {
@@ -181,8 +183,9 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		inode->i_data.a_ops = &squashfs_aops;
 
 		TRACE("File inode %x:%x, start_block %llx, block_list_start "
-			"%llx, offset %x\n", SQUASHFS_INODE_BLK(ino),
-			offset, squashfs_i(inode)->start, block, offset);
+			"%llx, offset %x\n", squashfs_inode_blk(ino),
+			squashfs_inode_offset(ino), squashfs_i(inode)->start,
+			block, offset);
 		break;
 	}
 	case SQUASHFS_LREG_TYPE: {
@@ -241,8 +244,9 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		inode->i_data.a_ops = &squashfs_aops;
 
 		TRACE("File inode %x:%x, start_block %llx, block_list_start "
-			"%llx, offset %x\n", SQUASHFS_INODE_BLK(ino),
-			offset, squashfs_i(inode)->start, block, offset);
+			"%llx, offset %x\n", squashfs_inode_blk(ino),
+			squashfs_inode_offset(ino), squashfs_i(inode)->start,
+			block, offset);
 		break;
 	}
 	case SQUASHFS_DIR_TYPE: {
@@ -264,7 +268,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		squashfs_i(inode)->parent = le32_to_cpu(sqsh_ino->parent_inode);
 
 		TRACE("Directory inode %x:%x, start_block %llx, offset %x\n",
-				SQUASHFS_INODE_BLK(ino), offset,
+				squashfs_inode_blk(ino), squashfs_inode_offset(ino),
 				squashfs_i(inode)->start,
 				le16_to_cpu(sqsh_ino->offset));
 		break;
@@ -291,7 +295,8 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		squashfs_i(inode)->parent = le32_to_cpu(sqsh_ino->parent_inode);
 
 		TRACE("Long directory inode %x:%x, start_block %llx, offset "
-				"%x\n", SQUASHFS_INODE_BLK(ino), offset,
+				"%x\n", squashfs_inode_blk(ino),
+				squashfs_inode_offset(ino),
 				squashfs_i(inode)->start,
 				le16_to_cpu(sqsh_ino->offset));
 		break;
@@ -335,8 +340,8 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		}
 
 		TRACE("Symbolic link inode %x:%x, start_block %llx, offset "
-				"%x\n", SQUASHFS_INODE_BLK(ino), offset,
-				block, offset);
+				"%x\n", squashfs_inode_blk(ino),
+				squashfs_inode_offset(ino), block, offset);
 		break;
 	}
 	case SQUASHFS_BLKDEV_TYPE:
@@ -359,7 +364,8 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		squashfs_i(inode)->parent = 0;
 
 		TRACE("Device inode %x:%x, rdev %x\n",
-				SQUASHFS_INODE_BLK(ino), offset, rdev);
+				squashfs_inode_blk(ino),
+				squashfs_inode_offset(ino), rdev);
 		break;
 	}
 	case SQUASHFS_LBLKDEV_TYPE:
@@ -384,7 +390,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		squashfs_i(inode)->parent = 0;
 
 		TRACE("Device inode %x:%x, rdev %x\n",
-				SQUASHFS_INODE_BLK(ino), offset, rdev);
+				squashfs_inode_blk(ino), offset, rdev);
 		break;
 	}
 	case SQUASHFS_FIFO_TYPE:
diff --git a/fs/squashfs/namei.c b/fs/squashfs/namei.c
index 65aae7e2a859..2260a3f05fde 100644
--- a/fs/squashfs/namei.c
+++ b/fs/squashfs/namei.c
@@ -49,6 +49,7 @@
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 #include "xattr.h"
 
@@ -197,7 +198,7 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 				off = le16_to_cpu(dire->offset);
 				ino_num = le32_to_cpu(dirh.inode_number) +
 					(short) le16_to_cpu(dire->inode_number);
-				ino = SQUASHFS_MKINODE(blk, off);
+				ino = squashfs_mkinode(blk, off);
 
 				TRACE("calling squashfs_iget for directory "
 					"entry %s, inode  %x:%x, %d\n", name,
diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
index b406e52a83c2..6d993531a5df 100644
--- a/fs/squashfs/squashfs_fs.h
+++ b/fs/squashfs/squashfs_fs.h
@@ -107,17 +107,6 @@ static inline int squashfs_block_size(__le32 raw)
 	return (size >> 25) ? -EIO : size;
 }
 
-/*
- * Inode number ops.  Inodes consist of a compressed block number, and an
- * uncompressed offset within that block
- */
-#define SQUASHFS_INODE_BLK(A)		((unsigned int) ((A) >> 16))
-
-#define SQUASHFS_INODE_OFFSET(A)	((unsigned int) ((A) & 0xffff))
-
-#define SQUASHFS_MKINODE(A, B)		((long long)(((long long) (A)\
-					<< 16) + (B)))
-
 /* fragment and fragment table defines */
 #define SQUASHFS_FRAGMENT_BYTES(A)	\
 				((A) * sizeof(struct squashfs_fragment_entry))
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index 94edc7f46ae4..afef13cd6dc0 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -32,4 +32,23 @@ static inline bool squashfs_compressed_block(s32 size)
 {
 	return (size & SQUASHFS_COMPRESSED_BIT_BLOCK) == 0;
 }
+
+/*
+ * Inode number ops.  Inodes consist of a compressed block number, and an
+ * uncompressed  offset within that block
+ */
+static inline u32 squashfs_inode_blk(s64 inode)
+{
+	return inode >> 16;
+}
+
+static inline u16 squashfs_inode_offset(s64 inode)
+{
+	return inode & 0xffff;
+}
+
+static inline s64 squashfs_mkinode(u32 start, u16 offset)
+{
+	return ((s64)start << 16) | offset;
+}
 #endif
diff --git a/fs/squashfs/super.c b/fs/squashfs/super.c
index 5dabc5770f1b..0e511dd29d58 100644
--- a/fs/squashfs/super.c
+++ b/fs/squashfs/super.c
@@ -33,6 +33,7 @@
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 #include "decompressor.h"
 #include "xattr.h"
@@ -286,7 +287,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	/* Check the root inode for sanity */
 	root_inode = le64_to_cpu(sblk->root_inode);
-	if (SQUASHFS_INODE_OFFSET(root_inode) > SQUASHFS_METADATA_SIZE)
+	if (squashfs_inode_offset(root_inode) > SQUASHFS_METADATA_SIZE)
 		goto insanity;
 
 	msblk->inode_table = le64_to_cpu(sblk->inode_table_start);
-- 
2.47.3

