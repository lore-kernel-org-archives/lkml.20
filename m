Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029363;
	b=iA/ftDhWIBer6QiHtunZYQYruNgDgmhsoUmzyf62KkUb5ijmFdDXc3qkPelVlVIT/S/U
	 yOiPzk7ta3kj0/04N2dLS8cXs4TTKNQOV5HkkDG4BZccIklFd5R5FlYXvjGNtJyPZO/fL
	 rv3M5VMEdvMfyWdE005xGAUckjBq54c/46quYC3rvrdMi+UggYF92VK6igs6VxE20qMAo
	 YTpYoZ93AfE+czC6BLCSWeKuQUUwSoZdzjXTQxsIwbqtw9QJDsEaN4B6P/8ypaUAIyHpz
	 pogEtcktmrbYQWVISv2PX/wmkZzAoI5CUGLBOZlq4DADym/UtNh5ryID8CfRzmfpIzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029363;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=kfZKb+a68PKJvsiWI18aCV6I4EXilYNnOuTBJByb1Mw=;
	b=q7Ek9Nd45L+VaExrmFlw5eCivD4lMsHsDAlDMA15mqQzJhTfn9rgKIflOg2PNtsMJnsF
	 20dWfQV7vlmdDZFO25jdqy4viXFOVO5wadq+CD/aJ41OkB9sEVtpd3+qKyiIL0E9LuoGx
	 iXNpVgFDV3+1n9XqgrTF9lVnHUv9MAzwZ/n4vEqJ5HhFhd5g54xRbn72JlWP653KrQewN
	 CLj8nas7ZqTRAtrjYLut5Ggbb8JKLMAu8Nbb/tr1ukmMmFij27hj7GkS3mQCD3g/gbmQM
	 VOqfoNYASv7LNEYrsjMQKNptcJhpzOds72uBrPE73wBTmBXLwZfShSDO8ybj58a0Cqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b="D/1d1Jau";
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=Rdw2Z1Lw;
	arc=none smtp.remote-ip=188.121.53.108
Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [188.121.53.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59071606A331
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59071606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=D/1d1Jau;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=Rdw2Z1Lw
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id PYyzxFofBjLMrPYzDx4cqY; Sat, 07 Nov 2026 05:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794029348;
	bh=kfZKb+a68PKJvsiWI18aCV6I4EXilYNnOuTBJByb1Mw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D/1d1JauWHK+R/MgC2ITvu79Uwi/FksiaIBCZToJkF2xN3l2T8IpT8c5ZCeTaBgPH
	 aM5WpV/RFBX/+mPBrLvjs6n//GRNiEJasOLSQEGn5olaDY+G9wwO2+xgigIAVBB9N+
	 lNmfkt1kiZpmDsK3KJOsgDa235sLMqJ4GGPX0vX1p+7hUhFMi4oLv97bfK/FrQgs+k
	 3mdLMnk0/E38SackZediUDcfYFfR8ihXqgVKyTLtCj48iusgCsLLtlh+8F9QpJdJtH
	 G/7/Zs6wHe4dqlD4HLw+cQVDB7ToyI71ADCnKdkb3zcEkFlo/vS/UXHRCJOWG+kJqf
	 7GOLjFLQLYHbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794029348;
	bh=kfZKb+a68PKJvsiWI18aCV6I4EXilYNnOuTBJByb1Mw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rdw2Z1Lwi3jcOJ4SYaflKeJKYl2KJC8w0udkFjwMb9xfUVq2HvwjBxiY8CmcG1Gmx
	 QkmSTXVGT4z2E8zklmPrqEsrMUgKLAMXW44/aOr9hXiuCnoIn24l/XXYlth5rwJKKA
	 catncFkb5f+h4HlIHJ6/UJEX8yOSXNcPO2BxaaJzJOzUDoYVrPJhFnECteLBWZvjjr
	 PgRfDL2qi+qseOTAqKGAlUffK2m79//kOvDRIz9uMB8yl/13/nUzxlSCVduHc09nii
	 vCTDzfUIfgOU46wedyCkVGYbI/TiojD7Hyn3r9d6i2oeE3mZIXGneXCtoR2r4BOc+w
	 Q0cj1MIHfWf3Q==
X-CMAE-Analysis: v=2.4 cv=fZ84WEQF c=1 sm=1 tr=0 ts=6aeeb724
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=sSupuuxbErciYv1SbbcA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 240eb4588fce212aef2b6989fa9a0701:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH 01/18] Squashfs: convert SQUASHFS_COMPRESSED_* to inline functions
Date: Sat,  7 Nov 2026 05:28:26 +0000
Message-ID: <20261107052843.725239-2-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfB0PLjnAG06UDY2Fln6fJBoDLBiIX4I37uoN36j1lk31e/P3RBGLQt6eBcdXWu0yhyF84yq6mvu8z/kIBuhMRfnm3RrY2ea2IkI1eR/810Q22KdlZYL1
 +amVGoWdwlxgVUmkyFCMLYR40BAEu9k926C1PGUYt/A483hrIy3StceardQTU9AzMfYjK9oHxjho4AXimZJvBLUCEikoqAhYd3iDrBgY73IwgWNQVlaes0La
 h/QulZdSWb15RCkSm396+AbMxK+QF4T3L2WingHyP9ovH0Ghut4XZQqP8pWpdYio

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
 fs/squashfs/block.c            | 11 ++++++-----
 fs/squashfs/cache.c            |  1 +
 fs/squashfs/file.c             |  3 ++-
 fs/squashfs/squashfs_fs.h      | 17 -----------------
 fs/squashfs/squashfs_helpers.h | 35 ++++++++++++++++++++++++++++++++++
 5 files changed, 44 insertions(+), 23 deletions(-)
 create mode 100644 fs/squashfs/squashfs_helpers.h

diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
index 2d5850168026..20c3030b4f96 100644
--- a/fs/squashfs/block.c
+++ b/fs/squashfs/block.c
@@ -23,6 +23,7 @@
 
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 #include "decompressor.h"
 #include "page_actor.h"
@@ -292,7 +293,7 @@ int squashfs_read_data(struct super_block *sb, u64 index, int length,
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
 	struct bio *bio = NULL;
-	int compressed;
+	bool compressed;
 	int res;
 	int offset;
 
@@ -300,8 +301,8 @@ int squashfs_read_data(struct super_block *sb, u64 index, int length,
 		/*
 		 * Datablock.
 		 */
-		compressed = SQUASHFS_COMPRESSED_BLOCK(length);
-		length = SQUASHFS_COMPRESSED_SIZE_BLOCK(length);
+		compressed = squashfs_compressed_block(length);
+		length = squashfs_compressed_size_block(length);
 		TRACE("Block @ 0x%llx, %scompressed size %d, src size %d\n",
 			index, compressed ? "" : "un", length, output->length);
 	} else {
@@ -341,8 +342,8 @@ int squashfs_read_data(struct super_block *sb, u64 index, int length,
 		bio_uninit(bio);
 		kfree(bio);
 
-		compressed = SQUASHFS_COMPRESSED(length);
-		length = SQUASHFS_COMPRESSED_SIZE(length);
+		compressed = squashfs_compressed(length);
+		length = squashfs_compressed_size(length);
 		index += 2;
 
 		TRACE("Block @ 0x%llx, %scompressed size %d\n", index - 2,
diff --git a/fs/squashfs/cache.c b/fs/squashfs/cache.c
index c1a83bb0e519..7cb16414cd23 100644
--- a/fs/squashfs/cache.c
+++ b/fs/squashfs/cache.c
@@ -42,6 +42,7 @@
 
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 #include "page_actor.h"
 
diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index d83594ce91d2..ad6382cd22d3 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -39,6 +39,7 @@
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 #include "page_actor.h"
 
@@ -188,7 +189,7 @@ static long long read_indexes(struct super_block *sb, int n,
 				err = size;
 				goto failure;
 			}
-			block += SQUASHFS_COMPRESSED_SIZE_BLOCK(size);
+			block += squashfs_compressed_size_block(size);
 		}
 		n -= blocks;
 	}
diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
index a955d9369749..b406e52a83c2 100644
--- a/fs/squashfs/squashfs_fs.h
+++ b/fs/squashfs/squashfs_fs.h
@@ -101,22 +101,6 @@
 #define SQUASHFS_XATTR_VALUE_OOL        256
 #define SQUASHFS_XATTR_PREFIX_MASK      0xff
 
-/* Flag whether block is compressed or uncompressed, bit is set if block is
- * uncompressed */
-#define SQUASHFS_COMPRESSED_BIT		(1 << 15)
-
-#define SQUASHFS_COMPRESSED_SIZE(B)	(((B) & ~SQUASHFS_COMPRESSED_BIT) ? \
-		(B) & ~SQUASHFS_COMPRESSED_BIT :  SQUASHFS_COMPRESSED_BIT)
-
-#define SQUASHFS_COMPRESSED(B)		(!((B) & SQUASHFS_COMPRESSED_BIT))
-
-#define SQUASHFS_COMPRESSED_BIT_BLOCK	(1 << 24)
-
-#define SQUASHFS_COMPRESSED_SIZE_BLOCK(B)	((B) & \
-						~SQUASHFS_COMPRESSED_BIT_BLOCK)
-
-#define SQUASHFS_COMPRESSED_BLOCK(B)	(!((B) & SQUASHFS_COMPRESSED_BIT_BLOCK))
-
 static inline int squashfs_block_size(__le32 raw)
 {
 	u32 size = le32_to_cpu(raw);
@@ -449,5 +433,4 @@ struct squashfs_xattr_id_table {
 	__le32			xattr_ids;
 	__le32			unused;
 };
-
 #endif
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
new file mode 100644
index 000000000000..94edc7f46ae4
--- /dev/null
+++ b/fs/squashfs/squashfs_helpers.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SQUASHFS_HELPERS_H
+#define SQUASHFS_HELPERS_H
+/*
+ * Copyright (c) 2026
+ * Phillip Lougher <phillip@squashfs.org.uk>
+ */
+
+/* Flag whether block is compressed or uncompressed, bit is set if block is
+ * uncompressed
+ */
+#define SQUASHFS_COMPRESSED_BIT		(1 << 15)
+
+static inline s16 squashfs_compressed_size(s16 size)
+{
+	return size & ~SQUASHFS_COMPRESSED_BIT;
+}
+
+static inline bool squashfs_compressed(s16 size)
+{
+	return (size & SQUASHFS_COMPRESSED_BIT) == 0;
+}
+
+#define SQUASHFS_COMPRESSED_BIT_BLOCK		(1 << 24)
+
+static inline s32 squashfs_compressed_size_block(s32 size)
+{
+	return size & ~SQUASHFS_COMPRESSED_BIT_BLOCK;
+}
+
+static inline bool squashfs_compressed_block(s32 size)
+{
+	return (size & SQUASHFS_COMPRESSED_BIT_BLOCK) == 0;
+}
+#endif
-- 
2.47.3

