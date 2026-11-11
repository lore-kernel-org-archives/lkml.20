Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794440686;
	b=SFhqvA9cMoE3RD9OYPSPwxRnN4V0+FpDUQ6HEpFrDExH1e/89lFqyieg/SH93fEJ224D
	 GZXiHfs/iNenJ0hdtz5hgOaabiPwdNWj30zbRvCBSIagyTsG8EJbp+Jq9jaCOE2keNaae
	 hT4/ofV5YP3tg5e4RM2jNuanLZMdPOyPz2YkVUEVuPLc2c5T96Izd4ml40GwRlOcgoFPP
	 kwPCVxBKwtHxHX3L2jM1zJHgk6PVcQDbmdpYm6clzcaY6qXtaYZkzn07giAN4VQNLfkWU
	 Mq2+u3WVNQWBCIAOQeOqpGQvNZCzXmhIpgNlYfYILKb6venOAzG1lbhiOjrQVtn4E1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440686;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=sNYnc3n/8WPWGMfkk+IBbZNZiTf8D9ASWX8DJwvBfpc=;
	b=X67AmFoBbfib9mA1GyxgZHKBo8FjCNg6AeQXpQEOMJ6Y/deVnaXEAJ1391Qj3nTaEb+z
	 Op4Yr3ozUUu8tKMB8n5nvgnoe6n7jn5t8v6IYW8vwmuIG66aqMQOhuRRSUVyCsfkg9ane
	 IShJF1xWNbWaretzZMOzwJYnCXmZMj5XxgCJx38vYoz77QMOjtV5URo+/2v69mGXDq22q
	 BkFrm35QnaZZWOOj0tWOwChxfibmEYxvcKRqImyxn5rYa2v/ncp9HldYoLWblZ3yTx2x0
	 aQUeusWXbIkq2GysPpe/nfSlwSRj9w4OyYWneq/FFE32TJU/m+30wVBSS+ce15VMZRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=gluUnrJr;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=COSwab0B;
	arc=none smtp.remote-ip=188.121.53.26
Received: from sxplsmtpa04-03.prod.sxb1.secureserver.net (sxplsmtpa04-03.prod.sxb1.secureserver.net [188.121.53.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582DE60A2601
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 582DE60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=gluUnrJr;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=COSwab0B
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id RHz6xtxIpLwCURHzSxAFXy; Wed, 11 Nov 2026 23:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794440672;
	bh=sNYnc3n/8WPWGMfkk+IBbZNZiTf8D9ASWX8DJwvBfpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gluUnrJrvj/jfEy1OEdkUBopGnb3Gue/rBKLQc96hHVFPNL1pOzyVS/Stfa2PNE17
	 avmBr9AwQZnm6GLuYnGKbQg/bPEufC0B3EoLmd/VcrFRQxRbbqiV87u9M8pxBkGxOS
	 WQW9AyC7E8eDaPEcxFps8q2f+EcCQ5o1MGeT6CyJS+EIw1BXj2aUwaj1waKGX4qyFi
	 if7cQHE07VPKU+Yn0dhYWeUsnLqC/JAQqXx6w41SM9KAabzfq/guffnEk7pvag9rt4
	 xTkkP2m+akpMcpqhJ2fBSFe5tPmEUocNhBkXaXu+dyv1uXm2v/LpmJ4jpAfBWr/HcU
	 XCBPj3M/VXZTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794440672;
	bh=sNYnc3n/8WPWGMfkk+IBbZNZiTf8D9ASWX8DJwvBfpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=COSwab0B3l0vl78SU33FXLIYwAPlOz0f5UPECAOtd43lt6b+mQyc+oRJzIYf/Q9eg
	 Gd4xE6R6HSBCskFSz4jlkcNsykL9VOBML4LQEiVE3G81uCddnGh7RqBix95kw7o587
	 OdX2eA7ZAHAPlBTSmdxWhtiohf5wMq7WvZ3wBnqFQInqJZySTmgTHrHOqNF7g4IFMY
	 NnN+I1GXbrZHgrdi/U5JE3Voxt+kWy5vWV9JX2UI5E7Jp8O2Oi4KFP7xJ8QRlVvtpG
	 rnW3D5BAXiWhc/0J80v6hiuIbhbDwMjA/KJzPmobPjdbqnvwFkc0ySE0VMm/O6nvZU
	 TPXctSgjbudeQ==
X-CMAE-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6af4fde0
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=_bInhHkTttLfAsG6xnIA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 3d4f69c5d41686a57e26a8b9fc71964f:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	akpm@linux-foundation.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v2 04/22] Squashfs: convert SQUASHFS_LOOKUP_* to inline functions
Date: Wed, 11 Nov 2026 23:43:44 +0000
Message-ID: <20261111234402.252354-5-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111234402.252354-1-phillip@squashfs.org.uk>
References: <20261111234402.252354-1-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfDjlPEPBiMo5nvA83M06Cpy0Axm+KB+ZTqVpfDhOCEFJrh5v3/kDLMi2O/Imv+yACm7Nm1yjK/MB/2+fw0dIicW05es5/9NBtWW/YEq31mkP6anNof4F
 EOZt7JJbN8IHZfNApEb1HC8aiXlKqsd/bx7WZyL5gAymje5vnKDY1dd12xi/Ib71ND+Q5kh9WMz49DpBbWXYPxjRihGoTd2LLQSIgAvhjtdFxOXEZAbYS3To
 szoO+czX6XB1VXDyPSWMLwVhVwebCyjJKAAilYQeAcwGafycgTOCE4W4E+DjYKM4/0JCkCYuAuOMaI86yxHOcre491vTYL25cGUL4TXvSu4=

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
 fs/squashfs/export.c           |  9 +++++----
 fs/squashfs/squashfs_fs.h      | 16 ----------------
 fs/squashfs/squashfs_helpers.h | 27 +++++++++++++++++++++++++++
 3 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/fs/squashfs/export.c b/fs/squashfs/export.c
index 62972f0ff868..ad7cc882d789 100644
--- a/fs/squashfs/export.c
+++ b/fs/squashfs/export.c
@@ -31,6 +31,7 @@
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 
 /*
@@ -39,8 +40,8 @@
 static long long squashfs_inode_lookup(struct super_block *sb, int ino_num)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	int blk = SQUASHFS_LOOKUP_BLOCK(ino_num - 1);
-	int offset = SQUASHFS_LOOKUP_BLOCK_OFFSET(ino_num - 1);
+	int blk = squashfs_lookup_block(ino_num - 1);
+	int offset = squashfs_lookup_block_offset(ino_num - 1);
 	u64 start;
 	__le64 ino;
 	int err;
@@ -115,8 +116,8 @@ static struct dentry *squashfs_get_parent(struct dentry *child)
 __le64 *squashfs_read_inode_lookup_table(struct super_block *sb,
 		u64 lookup_table_start, u64 next_table, unsigned int inodes)
 {
-	unsigned int length = SQUASHFS_LOOKUP_BLOCK_BYTES(inodes);
-	unsigned int indexes = SQUASHFS_LOOKUP_BLOCKS(inodes);
+	unsigned int length = squashfs_lookup_block_bytes(inodes);
+	unsigned int indexes = squashfs_lookup_blocks(inodes);
 	int n;
 	__le64 *table;
 	u64 start, end;
diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
index 3dbd174b5f21..89b998f57a2b 100644
--- a/fs/squashfs/squashfs_fs.h
+++ b/fs/squashfs/squashfs_fs.h
@@ -107,22 +107,6 @@ static inline int squashfs_block_size(__le32 raw)
 	return (size >> 25) ? -EIO : size;
 }
 
-/* inode lookup table defines */
-#define SQUASHFS_LOOKUP_BYTES(A)	((A) * sizeof(u64))
-
-#define SQUASHFS_LOOKUP_BLOCK(A)	(SQUASHFS_LOOKUP_BYTES(A) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_LOOKUP_BLOCK_OFFSET(A)	(SQUASHFS_LOOKUP_BYTES(A) % \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_LOOKUP_BLOCKS(A)	((SQUASHFS_LOOKUP_BYTES(A) + \
-					SQUASHFS_METADATA_SIZE - 1) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_LOOKUP_BLOCK_BYTES(A)	(SQUASHFS_LOOKUP_BLOCKS(A) *\
-					sizeof(u64))
-
 /* uid/gid lookup table defines */
 #define SQUASHFS_ID_BYTES(A)		((A) * sizeof(unsigned int))
 
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index b99ca67c729a..aafc75a3a435 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -78,4 +78,31 @@ static inline s32 squashfs_fragment_index_bytes(u32 fragments)
 {
 	return squashfs_fragment_indexes(fragments) * sizeof(long long);
 }
+
+/* inode lookup table defines */
+static inline s64 squashfs_lookup_bytes(u32 inodes)
+{
+	return (s64) inodes * sizeof(s64);
+}
+
+static inline s32 squashfs_lookup_block(u32 inodes)
+{
+	return squashfs_lookup_bytes(inodes) / SQUASHFS_METADATA_SIZE;
+}
+
+static inline s16 squashfs_lookup_block_offset(u32 inodes)
+{
+	return squashfs_lookup_bytes(inodes) % SQUASHFS_METADATA_SIZE;
+}
+
+static inline s32 squashfs_lookup_blocks(u32 inodes)
+{
+	return (squashfs_lookup_bytes(inodes) + (SQUASHFS_METADATA_SIZE - 1)) /
+		SQUASHFS_METADATA_SIZE;
+}
+
+static inline s32 squashfs_lookup_block_bytes(u32 inodes)
+{
+	return squashfs_lookup_blocks(inodes) * sizeof(long long);
+}
 #endif
-- 
2.47.3

