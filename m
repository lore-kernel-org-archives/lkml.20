Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029371;
	b=MgB9br0+muCxGP9EBCd3MLjdSE1PqXhVdw4c4zIfMJR/Dbd4jrGmzPBU9WSgjUsjAzbo
	 I6K3M9rXgfgC1tMjjSebEuh9QqG4yx7UZOmJFp3gDqfQgPYDMfNyiHfRch4I5pfYzCYR5
	 LDnPKMvkKj5NfyUPLGbI4dIUTFC0vQiW7wa2xlSU+LBKl/5oV9baflEtTlACMBv1kr7rw
	 TeVtp3Qf10sffVbpmP6ZWd4iv9vSdfpdYLltH5qDI9dn/Dsj76jM4bIjee1N5oQ+fc/Xp
	 q0a4PL8EZIDqkci1p2ds/yRlO2qkOQwJzKcAt+B1CZVnufgajG5pDGolMZBSuak4TDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029371;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=JSepGz5DKI1NJiNr575qI8bfT6lUZtjmSCack+O4Wdg=;
	b=g2BWRiYd+Ers6XTsrFdG4CRIiVA5HOqG9MKKXt0qbW3e9Y7O2lDSzgi6inn0K7F+sPTH
	 do038IrQRp0XEomoClFr8G3w0CfajzG/GB+D7Ybj3+9iLFr6qHyVq79fGnArvxgyQOZQu
	 /t5bybhnoGLmHzH8OD1ducNaHWew2VYrIJSPix+vkQkmP/Oh+bY3cCNTwFXeLo3UV6Zrx
	 GcS30PNyEl0QgqjphC2C2GpmbnqJNiFpw0ltTnYXurXeMgZbA+JHcQajXJlmGuIFd9kot
	 Z6a0ChMzEzqqvGTA9oxuakcS8+tMKiSLA+Qib/KHmUEf+N/YlpVEWwNNhNPktrbbxUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=QrgsSK1E;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=XQVa6trj;
	arc=none smtp.remote-ip=188.121.53.108
Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [188.121.53.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C4606A33F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E6C4606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=QrgsSK1E;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=XQVa6trj
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id PYyzxFofBjLMrPYzGx4cr2; Sat, 07 Nov 2026 05:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794029352;
	bh=JSepGz5DKI1NJiNr575qI8bfT6lUZtjmSCack+O4Wdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QrgsSK1E70Tixg5+CSoQ7UUtY2RpGLoK3kS9ocoD2vuo0SLlhzDo+6JH/mFzhr/VO
	 HfHlG9/89gD5ajDI6nSSt0pbNU/6BZTMfeAt0l3zPv6GMtw+4ckRGScgzT8U+rFlfH
	 j0TryTgn+qeLfNEV6QzOB4Sox3kEGUyCKmPo24ZAj9qrx6CVEnEu/3ogE56MJIgo4S
	 QEey875zRoGlk0UXFbokTDs0ffwTVWg8YDet9GQSxn9cKhZ6Hy/BJBGKKSlFqFztOu
	 AhPc00iI7y6DkBOhfxLJidSNqDQUPkSPMLcLIEy4nQhH7+nNGXLQ+DSKdX+usodn49
	 YrW1ELpHNeNvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794029352;
	bh=JSepGz5DKI1NJiNr575qI8bfT6lUZtjmSCack+O4Wdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XQVa6trjlDSz0+zZp7FKLcLanrEgOv/URzDcrpRiXV5qkzoZmHNJZ9XVn8l/0Z0De
	 9/HOG/98/YuRixlZ61it8gjgSuxGm0GLS2Jmf/+2WOxIdckIGFe0SMLCDEgajk3p2z
	 Uu7b8Kjhw4QaYmmmmcEriZ79eGkaWOv7dj94oFW2NWtShjo1roB56nn1OTWgPx/0CN
	 HM99bWZgf5+BZYFr++M6+4qK7yB1oadKXXc4P25K3xa8A67laVh5lZQv5e0fxgpVaU
	 l1Us4zAyB9UQ+97gwAEPZNKezJZfosUfqOqyf9ysvYUAw7ykYGrV1Gd6t7zDnYZvXv
	 aPNLrtU1HHgMg==
X-CMAE-Analysis: v=2.4 cv=fZ84WEQF c=1 sm=1 tr=0 ts=6aeeb727
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=1h8doul4msz9IIiYaa0A:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 8b707bf1917cb25b79af4433c30cd7e1:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH 03/18] Squashfs: convert SQUASHFS_FRAGMENT_* to inline functions
Date: Sat,  7 Nov 2026 05:28:28 +0000
Message-ID: <20261107052843.725239-4-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfFXb2OGGyXplQzQCUrMCnoVzVavHHQHFJLrGVCc+Ey210dWMgs+x2/rwOKNLazMLqWjzOekf/m84OBD5vjvjKx2cUr0yIqaM/jgacVtPb/SMJbl51Ff9
 /c9MXd3Pi8o54QHkefMNnCQNwM9E0sAhdG7QaNV5AzmWnud14955DAEJjuI0ZxuDG9qoBb/uqedkyDWTrHHgxbAYPfwv2FwIYrM1sK7ZXS17djavqyvEjSHd
 kTARkXHLaNc9inuiLK4t8AD3jLJJpmrd1TusrvyEP4F2Dn2RcA3+BPP/qAQNl5Dm

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
 fs/squashfs/fragment.c         |  7 ++++---
 fs/squashfs/squashfs_fs.h      | 17 -----------------
 fs/squashfs/squashfs_helpers.h | 27 +++++++++++++++++++++++++++
 3 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/fs/squashfs/fragment.c b/fs/squashfs/fragment.c
index 49602b9a42e1..e945d045d55e 100644
--- a/fs/squashfs/fragment.c
+++ b/fs/squashfs/fragment.c
@@ -26,6 +26,7 @@
 
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 
 /*
@@ -42,8 +43,8 @@ int squashfs_frag_lookup(struct super_block *sb, unsigned int fragment,
 
 	if (fragment >= msblk->fragments)
 		return -EIO;
-	block = SQUASHFS_FRAGMENT_INDEX(fragment);
-	offset = SQUASHFS_FRAGMENT_INDEX_OFFSET(fragment);
+	block = squashfs_fragment_index(fragment);
+	offset = squashfs_fragment_index_offset(fragment);
 
 	start_block = le64_to_cpu(msblk->fragment_index[block]);
 
@@ -63,7 +64,7 @@ int squashfs_frag_lookup(struct super_block *sb, unsigned int fragment,
 __le64 *squashfs_read_fragment_index_table(struct super_block *sb,
 	u64 fragment_table_start, u64 next_table, unsigned int fragments)
 {
-	unsigned int length = SQUASHFS_FRAGMENT_INDEX_BYTES(fragments);
+	unsigned int length = squashfs_fragment_index_bytes(fragments);
 	__le64 *table;
 
 	/*
diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
index 6d993531a5df..3dbd174b5f21 100644
--- a/fs/squashfs/squashfs_fs.h
+++ b/fs/squashfs/squashfs_fs.h
@@ -107,23 +107,6 @@ static inline int squashfs_block_size(__le32 raw)
 	return (size >> 25) ? -EIO : size;
 }
 
-/* fragment and fragment table defines */
-#define SQUASHFS_FRAGMENT_BYTES(A)	\
-				((A) * sizeof(struct squashfs_fragment_entry))
-
-#define SQUASHFS_FRAGMENT_INDEX(A)	(SQUASHFS_FRAGMENT_BYTES(A) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_FRAGMENT_INDEX_OFFSET(A)	(SQUASHFS_FRAGMENT_BYTES(A) % \
-						SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_FRAGMENT_INDEXES(A)	((SQUASHFS_FRAGMENT_BYTES(A) + \
-					SQUASHFS_METADATA_SIZE - 1) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_FRAGMENT_INDEX_BYTES(A)	(SQUASHFS_FRAGMENT_INDEXES(A) *\
-						sizeof(u64))
-
 /* inode lookup table defines */
 #define SQUASHFS_LOOKUP_BYTES(A)	((A) * sizeof(u64))
 
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index afef13cd6dc0..b99ca67c729a 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -51,4 +51,31 @@ static inline s64 squashfs_mkinode(u32 start, u16 offset)
 {
 	return ((s64)start << 16) | offset;
 }
+
+/* fragment and fragment table defines */
+static inline s64 squashfs_fragment_bytes(u32 fragments)
+{
+	return fragments * sizeof(struct squashfs_fragment_entry);
+}
+
+static inline s32 squashfs_fragment_index(u32 fragments)
+{
+	return squashfs_fragment_bytes(fragments) / SQUASHFS_METADATA_SIZE;
+}
+
+static inline s16 squashfs_fragment_index_offset(u32 fragments)
+{
+	return squashfs_fragment_bytes(fragments) % SQUASHFS_METADATA_SIZE;
+}
+
+static inline s32 squashfs_fragment_indexes(u32 fragments)
+{
+	return (squashfs_fragment_bytes(fragments) + (SQUASHFS_METADATA_SIZE - 1)) /
+		SQUASHFS_METADATA_SIZE;
+}
+
+static inline s32 squashfs_fragment_index_bytes(u32 fragments)
+{
+	return squashfs_fragment_indexes(fragments) * sizeof(long long);
+}
 #endif
-- 
2.47.3

