Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963711;
	b=KstkIdHyzoMgttmKJJmtB9Kn2kIvMepUmAIMl/kMCxcsS6aTDbF4en1U6f9g5LoDAS63
	 LJL4cojeLfKNGSSlvWvXnzHa2vegSpYXxw4eMPjEsdTKGH9LJZr1noXdJyiX7HgY5mV8B
	 ocu+uEQKl2mya02OaXsKjA4UiLBfFiN06gulcNicFbfu/HXh/btUjrTYsH7PLwFIT77Cp
	 iOulS7/ZwmnthEKGT2N+Zff+nf3BwUCYzeCKDK+bzMhzfNOheR19YKPegS8z5OfxxDMVy
	 bQxTBmz2W/MLwr+OaMCg8Khis/vyunEFlQp3Mgyisa/wV8XuXpAjEimK0eflCm5Q7mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963711;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q1LX/Zzu5lJJ68i8CdUH/dCh4TP/qblPJOfMfJ1EhqU=;
	b=N3Q0D4H+s7K2SjIAQYczqNdeCLt6fEZyyn3cQVRZ2CC6NjwINr6w+ieMxb1o3xvh9+ij
	 gU/CwfQwlifHGVMczgtfJIuC86BoIoU67yuLfQWaMum711El/xHmxGCuELArtoUX8O/WY
	 G2UGErRlG4Uk1gh93O6Pd4G+OpwMZABZi3tAC+LnFZZesbiEzo5BJpPJYBYhyF6EtpN+y
	 4/v94thMdY1QTotziJAhaVV79WodP0MECty13Ki3P6cWQKe88O0rv0YdM0s/9yoG+7JIU
	 dX/k3bS4YvPdqqPxrzK9YA4dKbBaqHiJgfALm5XHwxPLueBAMJuz0iyjfxjfRurt59Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=R5q71JzO;
	arc=none smtp.remote-ip=115.124.30.112
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2504606D802
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2504606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=R5q71JzO
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793963703; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=q1LX/Zzu5lJJ68i8CdUH/dCh4TP/qblPJOfMfJ1EhqU=;
	b=R5q71JzOvrGFXo4FsCW10NkJ1ktlYwoeIY3xx+QtvP+DNotERowT8QenTcZeuC+pGwJyccOz6GmKB1sjLgxSRqMNMrDiIwGRFTbtGXMe+rvg1k5aXgOlKldcRD8HxtbSo7/h4OVEG7VoQPIqpHU9bXhu5PqmHtebOavMb+kvht4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R251e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEBSvN8_1793963702;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEBSvN8_1793963702 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:15:02 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v2 04/31] ocfs2: abstract the dinode OCFS2_VALID_FL check
Date: Fri,  6 Nov 2026 19:14:31 +0800
Message-Id: <20261106111458.1467464-5-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261106111458.1467464-1-joseph.qi@linux.alibaba.com>
References: <20261106111458.1467464-1-joseph.qi@linux.alibaba.com>
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

The test for a dinode without OCFS2_VALID_FL is open-coded three times,
and the two spellings have already drifted apart: the normal validator
uses le32_to_cpu(di->i_flags) & OCFS2_VALID_FL while filecheck and repair
use di->i_flags & cpu_to_le32(OCFS2_VALID_FL).  Fold them into one
predicate using the le32_to_cpu() form.

Byteswapping is a bit permutation, so both spellings test the same
on-disk bit on either endianness.  The BUG_ON() in ocfs2_populate_inode()
is left alone; it asserts an invariant the validator has already
established rather than validating on-disk state.

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 587fcea59f5a..8b4652002ae2 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -87,6 +87,11 @@ static bool ocfs2_dinode_has_wrong_blkno(struct ocfs2_dinode *di, u64 blkno)
 	return le64_to_cpu(di->i_blkno) != blkno;
 }
 
+static bool ocfs2_dinode_has_no_valid_flag(struct ocfs2_dinode *di)
+{
+	return !(le32_to_cpu(di->i_flags) & OCFS2_VALID_FL);
+}
+
 static bool ocfs2_valid_inode_mode(umode_t mode)
 {
 	return fs_umode_to_ftype(mode) != FT_UNKNOWN;
@@ -1530,7 +1535,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
-	if (!(le32_to_cpu(di->i_flags) & OCFS2_VALID_FL)) {
+	if (ocfs2_dinode_has_no_valid_flag(di)) {
 		rc = ocfs2_error(sb,
 				 "Invalid dinode #%llu: OCFS2_VALID_FL not set\n",
 				 (unsigned long long)bh->b_blocknr);
@@ -1854,7 +1859,7 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
-	if (!(di->i_flags & cpu_to_le32(OCFS2_VALID_FL))) {
+	if (ocfs2_dinode_has_no_valid_flag(di)) {
 		mlog(ML_ERROR,
 		     "Filecheck: invalid dinode #%llu: OCFS2_VALID_FL "
 		     "not set\n",
@@ -1943,7 +1948,7 @@ static int ocfs2_filecheck_repair_inode_block(struct super_block *sb,
 		return -OCFS2_FILECHECK_ERR_INVALIDINO;
 	}
 
-	if (!(di->i_flags & cpu_to_le32(OCFS2_VALID_FL))) {
+	if (ocfs2_dinode_has_no_valid_flag(di)) {
 		/* Cannot just add VALID_FL flag back as a fix,
 		 * need more things to check here.
 		 */
-- 
2.39.3

