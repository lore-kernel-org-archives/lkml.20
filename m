Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029369;
	b=f4J3jrt+Tx/JkiNyMG4AP0oyiNZ9oMK/xs2x3uWc3+jJ+F6i/h4F4XhwSGPaB5nG+Thu
	 OnaKexFatCUsmpSMhjZ9TE2JDqlH8KfFp37zlSm6v4LlGM1MtPGLY4LKf8F9J7Jn0FpGE
	 c0bi41D6dvkwlGhVTmWYVjJWmiX6Z3wHK8XmRiE2QhLespntibPRmJMHEc5n/ZwuNcwCD
	 V4SQHV5sYehDzN6r0rtRwq/lcil191p1MFr8mMKxt7XVfsIKWoWWZP5Jlt3SSyOKKNIfh
	 qtnIRsdFHznyLeKHPsIiM9IxRzYn8OeFeoOlGhix7HaEJ9Z+AgycPXVMAWdD869Otaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029369;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=GspbDm5NoLrz9Mne0Jk72B4t/T1rheI2hKcz0wOe15g=;
	b=XH1Z7HaSyJ7WjZN7u0CXgsyNy/QJ1PU1ByBc7zL/INrTz7ZRui8Joxz9wSWOx3nWDNef
	 rA7nz4DZroLbMxrvavrqWF2DJQ3Vl12JlJqyrIG3OKwMXZPTTofQubnSlccRzqlFIq3Zo
	 XOht8xFJV1gr70yEPOmMay4gnaZao1LpyYeEUHwXi6Xv9zADY+yiFnWjMqIzBHpIkVsiT
	 /P5kZKlVdWn4flFoWeLKWPsdpVv9Iyu/r/rfkMq6+Yo9HC8RJQ1s3LlCmEB36tCORA7zG
	 cvLFlVkOtVRBlpT41YxjwXWde75d37S921JAc5LJhIA6cv6Luz9afVBJjiXrtMqxZSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=rgKogUlt;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b="hD3rJk/9";
	arc=none smtp.remote-ip=188.121.53.107
Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [188.121.53.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC822606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC822606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=rgKogUlt;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=hD3rJk/9
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id PYyzxFofBjLMrPYzKx4crE; Sat, 07 Nov 2026 05:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794029355;
	bh=GspbDm5NoLrz9Mne0Jk72B4t/T1rheI2hKcz0wOe15g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rgKogUltmpXySdpPz+TllFf5NfW1D+eXyqHCkTqHwkKgy7T3qM+BBVyf1DOAIx5JF
	 S4BemDURotH4i7XI7OeFhSgLTygSaIAAIRoy3QNIlADKia9cOEGFsjUl2G1Fm2Tk90
	 fn+UOmjiaX3n+iodx3lF07auHqq7lMa8FRoXfDaTPB+ZkVSYGRiS5QNCnIoqDa/j2I
	 uqgLjyR8Qqx+1rbnu7tFYDyKdwiqC/UuJy0DiW/+cQxEJ77LhGUD24a2g4iq7yEkta
	 yd4sm6VEjivGFd8PK3urpm3fql4d037SiZkyma+eEpY9pwX7IA5BynmpRGdfPHRjcG
	 X9bBHXbFanlHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794029355;
	bh=GspbDm5NoLrz9Mne0Jk72B4t/T1rheI2hKcz0wOe15g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hD3rJk/99PqPjLDVgFhTCBVNy+SGdK0Nu0yIqIOXibFzEf7NnwK4WcW9mgObVQip3
	 3Q7CLKvWMJ8Xe6HautW1fFCdV/HBBLEfKogbzfgOaaie9Owmt5jyUV8mqx6DnqV4F0
	 ETiAS4NyR2LhfebxyawVg7Hzw+KAjsZmNFCglO+uOUmhnM2nkHwUXL4TxAE5V43y+V
	 vpgJJYdMOsEeoe9+JF7Qx0HHA4TWPzwYcsTNVDAkZ3ltBTZGvq6j2MjZOZXhZD/oCf
	 taKp8riMfq0zcJ1bMbZbPjFRJGZbyzRFyK2E+KRAv9HH+N0uL6vT4jaQhs98OyHCpW
	 jLtpCmM9jpEaw==
X-CMAE-Analysis: v=2.4 cv=fZ84WEQF c=1 sm=1 tr=0 ts=6aeeb72b
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=_bInhHkTttLfAsG6xnIA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 7bebb6374502e72f43c99a7212548f6b:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH 05/18] Squashfs: convert SQUASHFS_ID_* to inline functions
Date: Sat,  7 Nov 2026 05:28:30 +0000
Message-ID: <20261107052843.725239-6-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfMqAlytwdifM7BuqdGUSaC1/GNhXGMVy48Pn3cHk/Auuf0RrUmQSMtyNSXwHStgQfuLYBNHU8eBHG0/0SSewZX1o1QVldc7rTtEtrtXpgS59fyAEQ9GE
 7/hQ5W1J7iKoHzz1Lh1C12FFTgx9i8aPYu8mucIIERGdc+YpAlsmiKPDKmguwBmX8/tOWfpT+X9MSN4irwuBUxtLgRURlQ8sqPFoC06HFgyEN/aTEYt3qH1n
 5dKz7oTjV7ZBEUgGTMe/owY1tTc1aQ0culjl5CJnxqL7j8v4PmQYWKnkkxWnX38l

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

