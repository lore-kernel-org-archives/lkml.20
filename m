Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029363;
	b=iSgZc+WDb+fjRbQtrrAr63oiECO9X9psSq9gaemwogmzCSfPuAx99p5YW7Oz84lPGP/S
	 sRROQYX0WPpdxbkqmpnaSJULyx/lUDy/pgTpE04vfy1YlhfB1hJoHmf05i2J99Bgu8sSB
	 BgyYcqowvj4X26wZOK1/vUv7Fu2ii+cv8S/nXySq6oUnxPCtE4SCP5u/fZ17R795ZJs/D
	 pAYS+aLl5PTgD+URjMG1WYYyeIDuVkbGEu4ucIYqmQnV/MN6isodEQ5kj/l9bmWsOhOH0
	 tcf0e9l66Oda08lznxkTAbuKNCaC4e/xVFyaEH9P3JosbR3DlvtPhpXDxIAM9pzZpnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029363;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=sNYnc3n/8WPWGMfkk+IBbZNZiTf8D9ASWX8DJwvBfpc=;
	b=JD85kgToEmtWKr1V27ONq9Spq56bCVz0G4cvvPinWM1nzP6jNRQVcXowms6bNGG0UduA
	 2m070F4zU9IKKrMtZETh/CXMt8BZqp3DTwns1UB6EF9kzXuZC5BF7GOjc+I1IECaKhEKv
	 TLdjsmSDtWj/ANS2gNUBkVDt5zHXTJ0X/rBLVu7mL0o5BVE84lzroejgGuaml1s+Ot1LD
	 dRVF7qZAcqfbK49W/X5AwSDtchDuHdpJssc3WCQgg004NFCT36LRvlW5Xs39k6ZIIC5j+
	 rygj4JpShxzIWbT2eIbIhBV5eTn1klMrFhLmJcOmcRDVLVUulUBuzijKT9ep2/v13wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=Z7Y2gV0s;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=rseoV3fy;
	arc=none smtp.remote-ip=188.121.53.108
Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [188.121.53.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5AB606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A5AB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=Z7Y2gV0s;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=rseoV3fy
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id PYyzxFofBjLMrPYzIx4cr8; Sat, 07 Nov 2026 05:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794029354;
	bh=sNYnc3n/8WPWGMfkk+IBbZNZiTf8D9ASWX8DJwvBfpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z7Y2gV0sdcR0jVKqf+fMl/jecpPApRLMxijZf9Yn78olAl3vMdEOLdpW7dHnN41Fv
	 J9FDl5P0Z2NHsf7Uh/ntp5ctqN9tqj2IG5OZud7nQo8QzOHEJoBSxK1Gwl+xyo2xVZ
	 gFqimy3kVUitnFyWxGm3QTQ3OmlbehEpCrxxrLNHpH1MArnnsdpHMlQMyLXzlu8vJ7
	 Sgmoo/2Md8gI9D4NbfkCK2iQ54ZvflgINnSr3F/VS7/tB83Tjt/T5YmjfEHOA+Z/bm
	 UMNdyn/D9bAIIxugOsKQhOnMRjG8ryLwKlgpeupeTf/EZk1dMly8DKCmi+NIXhZ3mo
	 8NfG2VrAFJn2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794029354;
	bh=sNYnc3n/8WPWGMfkk+IBbZNZiTf8D9ASWX8DJwvBfpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rseoV3fyRTRlQZUxtWZwX9fsH/k0piIx1B23kDfQ8FszqLweD8jnhkcO+86I0iBR9
	 87tjBcJcP/1R7Cw2VMsO71waQ79FlbhSt4b4puSUO/FzSjPq7tq4IWzodUOe9451eG
	 y+05xojscgNC/0jG2lduxPXdTqcDMcBuUFR1IEfPi4NwfhkNSpKqmTLXAUCcM+ZRfi
	 mJNr3fSFv/5QIK8U2t5/mni9ndN/bkuJ7lODucHV5zQhsFoib5HgFDp9WvbsFU3y89
	 BGAr+ZlZDXGmY1jtLXNOCAy93sT5uhmqsCits/DDm0fU9TgBZ489WArojTbmQe2eOd
	 zaBQ7vjYuV5Bg==
X-CMAE-Analysis: v=2.4 cv=fZ84WEQF c=1 sm=1 tr=0 ts=6aeeb729
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=_bInhHkTttLfAsG6xnIA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: b3f1dbd05727008a7a9e92bb44b3ff30:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH 04/18] Squashfs: convert SQUASHFS_LOOKUP_* to inline functions
Date: Sat,  7 Nov 2026 05:28:29 +0000
Message-ID: <20261107052843.725239-5-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfPM/KkY7Fmd2n6x1sIRUGQs6qWWmswIw6k8uaoZ0iz9S785P3ghUUVUBO9lZj61d4UCaZTaLBJRGRPulUo+LF8dqT9FbjGr0DeMV/Gc8WIxykcRSzd+L
 p4XkrC5vZqhqJyvjYKNaG2Vzbf45Y6SztCvdrqRhSYtSs0xbmXw9lbawKp+hM7LHNVUbpVTnPiaiIDqMbOgHofKIqTTEaGcRbMgQJ6uGKy/KoFoXAaQzGvQH
 f5w3EQhyO4mk0T5Di8WUyXhcmFcSaP9kTYCXQkLDlk/Jqx7Z+hSXpjJSvf3SVOhM

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

