Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793155507;
	b=5S+hjNlxfP+JX0yU+Jca9tufo+ut0VUXNmrYuCpOGF+mrTIWeGhF/NHR5jdOxFttIoJU
	 ENGTnM65D+dU1eSrR1J6D4mdLuvunTXeUXtkQ1K0fmlpmghtvgqG0scBGapA5a2FIek4j
	 vCnCeiHmOad+BEdnicJmDyVFwE4snxzG4e2ncFu3RbjMkcsVu32t8XcE0tWuWab/HX6VZ
	 IG8vyuvVIOdZJnvsL9/od5b9XzG0kNqmGQCskBnSzNvcHnDH3yojiQ/q65hd+3JLEV0MD
	 Mn0WqJ+uGWYSA+gWjFnCCgZHJaF/Z09rk8nuqY/BwRwqT29/pSJOhMJnRY8YhAc2Bqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155507;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=WOL4+D5dXDoziRa8ClTS8VQqRnnMXSqv697kaQ02AW0=;
	b=WHfxmwPr89Y0595/qZHHtGcEjdWEHCMHeoDX8jBsc7Jvs9ATHTMhqsODw/RdaPYdz45s
	 8zjiTPNY0+7G5wed5d2UZ4IRtTUnbBvQcQxG3TnyBP7n4aKyoXlF+hU6BJTmlO+scZ9gF
	 +cz/5HXxNUzlwji1NaKs7ZhJiEPKToyxWv1xJTs9Emc52SPUWEIe0KgoAZIz2ieuSiKX7
	 3TPsI8rP590+icstodXpMaUSel1BxMxLTy75fEknttb1NmI0crn/ZSc/Pdg/dbvxXeZGy
	 IIlXabXegTgpc2M0VVLXN0hHScJwsbajYt/J9YRj5uvL2udEvzs5iedtnfp4Pr8Fm3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=COJbszoA;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D87E606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D87E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=COJbszoA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=WO
	L4+D5dXDoziRa8ClTS8VQqRnnMXSqv697kaQ02AW0=; b=COJbszoAoNmXsaPh2v
	XtvSfcNLEw+xkIorW7T7YwHQzn1ybiSJ0mIeuhm4zk9k7nWDDwGNDTpWXzrfiCd3
	xonlTPyhCP2NQoUB3y7Xbyqgk2m5z0meB1z+++UM8Wi3aIcHtYqYnnK16IWByGfS
	LOw9ibiNFaC+DMmNSj9VldwgU=
Received: from WIN-TOG0NDEIICD.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3wCicYeFqV0gkCg--.55043S2;
	Wed, 28 Oct 2026 10:44:44 +0800 (CST)
From: Shirong Zhao <shxzhaosr@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: validate INDEX_ROOT size before reading its fields
Date: Wed, 28 Oct 2026 10:44:43 +0800
Message-ID: <20261028024443.25-1-shxzhaosr@163.com>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:PigvCgD3wCicYeFqV0gkCg--.55043S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1UWFWDXry7Wr18Cw48JFb_yoW8Ww4rpF
	n7AFZ7GrW8Gr129wsIyF4DX3y8Cw48Ww1UtFW8Zr4Iyr93twn7G3sFyryrAryDtrWDJr9x
	XFs0qrW7W34UGaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlJmUUUUUU=
X-CM-SenderInfo: hvk06xhdrv2qqrwthudrp/xtbC7R2S0GrhYZ026QAA3a

check_index_root() reads root->index_block_size and
root->index_block_clst before checking that the resident data is
large enough.  check_attr() accepts a resident attribute with
data_size == 0 and data_off == asize, and mi->mrec is exactly
record_size bytes, so a crafted $LogFile record can make the
first read go past the end of the allocation.

Use resident_data_ex() so the attribute is validated before the
fields are read.

Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
---
 fs/ntfs3/fslog.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 2460a4a..e208f4c 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -2721,15 +2721,21 @@ static inline bool check_index_root(const struct ATTRIB *attr,
 				    struct ntfs_sb_info *sbi)
 {
 	bool ret;
-	const struct INDEX_ROOT *root = resident_data(attr);
-	u8 index_bits = le32_to_cpu(root->index_block_size) >=
+	const struct INDEX_ROOT *root;
+	u8 index_bits;
+	u8 block_clst;
+
+	root = resident_data_ex(attr, sizeof(struct INDEX_ROOT));
+	if (!root)
+		return false;
+
+	index_bits = le32_to_cpu(root->index_block_size) >=
 					sbi->cluster_size ?
 				sbi->cluster_bits :
 				SECTOR_SHIFT;
-	u8 block_clst = root->index_block_clst;
+	block_clst = root->index_block_clst;
 
-	if (le32_to_cpu(attr->res.data_size) < sizeof(struct INDEX_ROOT) ||
-	    (root->type != ATTR_NAME && root->type != ATTR_ZERO) ||
+	if ((root->type != ATTR_NAME && root->type != ATTR_ZERO) ||
 	    (root->type == ATTR_NAME &&
 	     root->rule != NTFS_COLLATION_TYPE_FILENAME) ||
 	    (le32_to_cpu(root->index_block_size) !=
-- 
2.53.0

