Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872174;
	b=2AZPGASM4gpwn6B9vv0pPhwesa+ba/TgXlXjK39X1C5YzZhlG/kqGMWu1s/JsW8ZNep2
	 8RVydwoR27cQ0kxYaM6nrp/xK3kpbzfQVDQ1SDUBJGxKs3AmfNYJC8f6pRoE0Vh4IE+cX
	 3qVGD+f//mzQvnsvSvsT264eiI4EbLB3sPBscpNFDfGtyegCYJnHRuwacpVocnm5W6VDb
	 C861juFND5n3rlJSbKnI5gYRqwGglTNkg5v8CGXU/5aXy/nyWDba9I/ejMMAXEi8IuAeq
	 bc0BABNYhbzVOg9dfqTcxLDuqenSVwAAj6QRGbyqP5yRyO39dOQgT5s6kRbnVatWelw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872174;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DNXLYzkNpQi90bwIsZtSv0PxY8Z94ZN3nOuGmlKh0wI=;
	b=Pw+sG6nIKRUpjhuCxAewkM2KUV1lrQr3aGtJqlxg86dbxVnoGidCHZdvcMZOAmDuwq1E
	 Meu21bYGvbPJwUxiXe0vAjDAqG87/qFSrSVSOCTCUJI4rnc+vhhUeASwHU0ZlMRtdVdPO
	 GRTFaMWmrW0irzKX+KLpqL4zYT1jXXrOkFVDcnib89621/izBFJipiDLnGFiPCG1jD9i+
	 Gc1Anztv/KKb6cS7WDBtJaJ8lOK99bDYsPGSrhb82ot7v2WZQ7D/fGNGzjViaXhYsi3V2
	 0yVhPckzFPBnZLhmRbCIGt9okV8QVgeOTL8PKv8M4dTpt9CkDt9W3QCAQ4bq0pj6MHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=hdn5F7S3;
	arc=none smtp.remote-ip=115.124.30.131
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96546606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96546606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=hdn5F7S3
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872171; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=DNXLYzkNpQi90bwIsZtSv0PxY8Z94ZN3nOuGmlKh0wI=;
	b=hdn5F7S3xHAcT/dwmpRqEj5FXbvu4phDJoI9geEMMloej+8zIeCZYohPkMixlwzTQVEC9REUdjJGdZwdsCG1g+EgSE8C/268zrbcbakQvsUYLc117StkuO5UWzgTCeEi3bg/ifr+UNZg4d4b5cN7z537fJ6lu+L4KD8yy/KITqg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8RZXD_1793872169;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8RZXD_1793872169 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:30 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 03/30] ocfs2: abstract the dinode OCFS2_VALID_FL check
Date: Thu,  5 Nov 2026 17:48:59 +0800
Message-Id: <20261105094926.3203416-4-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261105094926.3203416-1-joseph.qi@linux.alibaba.com>
References: <20261105094926.3203416-1-joseph.qi@linux.alibaba.com>
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
index b13c7a9b54f3..9f6808cec22a 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -77,6 +77,11 @@ static bool ocfs2_dinode_has_wrong_blkno(struct ocfs2_dinode *di, u64 blkno)
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
@@ -1519,7 +1524,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
-	if (!(le32_to_cpu(di->i_flags) & OCFS2_VALID_FL)) {
+	if (ocfs2_dinode_has_no_valid_flag(di)) {
 		rc = ocfs2_error(sb,
 				 "Invalid dinode #%llu: OCFS2_VALID_FL not set\n",
 				 (unsigned long long)bh->b_blocknr);
@@ -1843,7 +1848,7 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
-	if (!(di->i_flags & cpu_to_le32(OCFS2_VALID_FL))) {
+	if (ocfs2_dinode_has_no_valid_flag(di)) {
 		mlog(ML_ERROR,
 		     "Filecheck: invalid dinode #%llu: OCFS2_VALID_FL "
 		     "not set\n",
@@ -1932,7 +1937,7 @@ static int ocfs2_filecheck_repair_inode_block(struct super_block *sb,
 		return -OCFS2_FILECHECK_ERR_INVALIDINO;
 	}
 
-	if (!(di->i_flags & cpu_to_le32(OCFS2_VALID_FL))) {
+	if (ocfs2_dinode_has_no_valid_flag(di)) {
 		/* Cannot just add VALID_FL flag back as a fix,
 		 * need more things to check here.
 		 */
-- 
2.39.3

