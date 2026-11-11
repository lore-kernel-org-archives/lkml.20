Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794440688;
	b=zw52rczr4dbUkB2cVJwyvA2CXbVaK057TDVvP78GIwUlSrBaE729FJEOwg/8bxWCEtU5
	 9Btry/dw4KXj9cydyOlOuZgXxkSywyUu7N7WLs3CL2+w3sO7SgpONrN9BF1FeuzKiEGQX
	 p8k9MO+ImohdJBIOHkSrzhsgXrnmmU6qILGAELzbr06dGycA51tmlsDVTDL2ECWmrkQ4Q
	 FbrXF4s7pJP6wSsvwgvfENddkjf5HKgfyGpyziKA2AgtXuOo8+GBITEmv2yXBtKkxvWh1
	 vI8u64ILP+T7zFm+yi2yHJgDs0lWFEE6fkmghoKves5TQvNaCI9gRq1L05EE979tlzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440688;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=DKkHvRtFrUD/8NWVD8srrqY0A3szkx+uLtHvmtzuyWg=;
	b=pg2nQzavvcRU3MVvojBrOvoMNCjiNKVTB7b5m+oovYV79nsYQ4FDKyIKipABwNAfVx/8
	 eKI/FDqLVIYrDWFC1i3fu5UFNge/pOyw5jPE+H2WbNJk814x6uVDhXPr99y6CzwJa8XJ3
	 4Xo21FWNb1e3wajljeXmiVPAClMu/gbOklpcGlqXvlW9N0/45LoGvmPhEx3vMCYWyV910
	 EjugtAqp5Df4P7njiEG7yCYc0oWriBNuQXTnzDW5Je0ZbGnkCbAKjel58OvYT15XnXcmr
	 MmbB76pzs8lO/eVEImpcwHvZauyhPPPqQMc8BlMIiD4KZ+gZiwckMsPLZkZYKM+8GmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=nlusQ5F1;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=Hex+gjrJ;
	arc=none smtp.remote-ip=92.204.81.39
Received: from sxplsmtpa04-03.prod.sxb1.secureserver.net (sxplsmtpa04-03.prod.sxb1.secureserver.net [92.204.81.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B62760A2626
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B62760A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=nlusQ5F1;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=Hex+gjrJ
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id RHz6xtxIpLwCURHzUxAFY2; Wed, 11 Nov 2026 23:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794440674;
	bh=DKkHvRtFrUD/8NWVD8srrqY0A3szkx+uLtHvmtzuyWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nlusQ5F1bZaPVu6PGiJpCix4C5eKD0tKDJpALx4cXBOyiKaydjdm+ZEDcOpK59VGy
	 qSWak+mPZn/ICjS/8emnweAxkgJ+EdzDXnd5P7YhYhE93WIErRnpfc6P0iNLeYrHnb
	 CjMcmxoxt8/zQxZO5GXo4GbhjATijvLQyqhiakINZ42y8zsUoaPYhjqjS5+d+50xln
	 PFKaoDVq6wdch4Zmi5uHsV6Waq6ZsDrqAsO6Z6TipvJnqrN+Yz+zIbAuCed0vj6W12
	 qixUjFwFgmNg+Q74Nh441p5o/+3fBQRFKAuVYP5V8j3WNh9eW6lScvOI9w1humg/Zr
	 WDInRP33zAZjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794440674;
	bh=DKkHvRtFrUD/8NWVD8srrqY0A3szkx+uLtHvmtzuyWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hex+gjrJPUSMrjaiIBg9FzfrKHUdbVm3zkScZOpIQ6KXucHU81zp12GWix1/tSsJz
	 ogvL5okyUwaeHsSng2665bODYxjr6L3WTGLIB+zi9XRpVqsYBgBKU5Eqvuk44ShfX0
	 2H1K3dR2BHLdHwd7OQJV5/49PxQHS0AN7N9923Zk9qBvugCzNd3f0558Gc8uOjlejj
	 09AYt2M4HZ24Ti1QHW6XVbYz41pqI5palUJlNcfujVKXxX6NumUnAYqaJq145BD6gb
	 UGtjThXTt8p8qL3P/YET/XFMrRtwqBwiLCopl/cWX+Ha92JQYmaCbtu1TfYZwF3XFC
	 S2nZ8WicEs0qg==
X-CMAE-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6af4fde2
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=_bInhHkTttLfAsG6xnIA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 319e8f1b99027f0fac7f92f7973dc564:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	akpm@linux-foundation.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v2 05/22] Squashfs: convert SQUASHFS_ID_* to inline functions
Date: Wed, 11 Nov 2026 23:43:45 +0000
Message-ID: <20261111234402.252354-6-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfKqbM/XTfCamV1R6AmVVTKV/sHDuLN9OGaAKG6MwJ4v5fiLk5X/rK7sh8DuhUrOVUT63Km/Qd58FhAKKHcqGUaADJh4Kq/QAkRDhdcwDGFKj6GG8nlkR
 sHGuV5sTSa9mCA68jApe4BeOm1lCIFp3C1Oar57UkF9Ij+RoYGW7WDO/3NtEqqihomVV+0eNgDJ8EybmbmIQye90HsJyNDszn+ssYYubNHDN8yf0dXqxVzjc
 sdjPVgQO0yXIEf9CXiIQGvPALnhDjsRL1gOTpPd+C7qUu6G48yi7OQ/mrWKw45ajTI2/FvfJJcgTW4+ek7yBqQysjrQq573Sh14/qi7liGI=

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
 fs/squashfs/id.c               |  9 +++++----
 fs/squashfs/squashfs_fs.h      | 15 ---------------
 fs/squashfs/squashfs_helpers.h | 27 +++++++++++++++++++++++++++
 3 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/fs/squashfs/id.c b/fs/squashfs/id.c
index ea5387679723..5630f5ec159a 100644
--- a/fs/squashfs/id.c
+++ b/fs/squashfs/id.c
@@ -24,6 +24,7 @@
 
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 
 /*
@@ -33,8 +34,8 @@ int squashfs_get_id(struct super_block *sb, unsigned int index,
 					unsigned int *id)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	int block = SQUASHFS_ID_BLOCK(index);
-	int offset = SQUASHFS_ID_BLOCK_OFFSET(index);
+	int block = squashfs_id_block(index);
+	int offset = squashfs_id_block_offset(index);
 	u64 start_block;
 	__le32 disk_id;
 	int err;
@@ -60,8 +61,8 @@ int squashfs_get_id(struct super_block *sb, unsigned int index,
 __le64 *squashfs_read_id_index_table(struct super_block *sb,
 		u64 id_table_start, u64 next_table, unsigned short no_ids)
 {
-	unsigned int length = SQUASHFS_ID_BLOCK_BYTES(no_ids);
-	unsigned int indexes = SQUASHFS_ID_BLOCKS(no_ids);
+	unsigned int length = squashfs_id_block_bytes(no_ids);
+	unsigned int indexes = squashfs_id_blocks(no_ids);
 	int n;
 	__le64 *table;
 	u64 start, end;
diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
index 89b998f57a2b..25dd89a2c6ad 100644
--- a/fs/squashfs/squashfs_fs.h
+++ b/fs/squashfs/squashfs_fs.h
@@ -107,21 +107,6 @@ static inline int squashfs_block_size(__le32 raw)
 	return (size >> 25) ? -EIO : size;
 }
 
-/* uid/gid lookup table defines */
-#define SQUASHFS_ID_BYTES(A)		((A) * sizeof(unsigned int))
-
-#define SQUASHFS_ID_BLOCK(A)		(SQUASHFS_ID_BYTES(A) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_ID_BLOCK_OFFSET(A)	(SQUASHFS_ID_BYTES(A) % \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_ID_BLOCKS(A)		((SQUASHFS_ID_BYTES(A) + \
-					SQUASHFS_METADATA_SIZE - 1) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_ID_BLOCK_BYTES(A)	(SQUASHFS_ID_BLOCKS(A) *\
-					sizeof(u64))
 /* xattr id lookup table defines */
 #define SQUASHFS_XATTR_BYTES(A)		(((u64) (A)) * sizeof(struct squashfs_xattr_id))
 
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index aafc75a3a435..b9c517a50642 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -105,4 +105,31 @@ static inline s32 squashfs_lookup_block_bytes(u32 inodes)
 {
 	return squashfs_lookup_blocks(inodes) * sizeof(long long);
 }
+
+/* uid lookup table defines */
+static inline s32 squashfs_id_bytes(u16 ids)
+{
+	return (s32) ids * sizeof(unsigned int);
+}
+
+static inline s32 squashfs_id_block(u16 ids)
+{
+	return squashfs_id_bytes(ids) / SQUASHFS_METADATA_SIZE;
+}
+
+static inline s16 squashfs_id_block_offset(u16 ids)
+{
+	return squashfs_id_bytes(ids) % SQUASHFS_METADATA_SIZE;
+}
+
+static inline s8 squashfs_id_blocks(u16 ids)
+{
+	return (squashfs_id_bytes(ids) + (SQUASHFS_METADATA_SIZE - 1)) /
+		SQUASHFS_METADATA_SIZE;
+}
+
+static inline s16 squashfs_id_block_bytes(u16 ids)
+{
+	return squashfs_id_blocks(ids) * sizeof(long long);
+}
 #endif
-- 
2.47.3

