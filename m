Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963709;
	b=hHREOTweFEg4Vsx51BXRUBGcJSUWgDDuDGgiL4QNkvTIDGuKkawQKgbyMbkqy1zBkAuI
	 yaV5p66rD0wDz6oHN8G93EdtRWoQbNh+RohyObDtymNC9Yju842Zb2XQeknhaRFblFSpR
	 dPXdO4TacTzrZNWsXoNbXearx5F+85iQQzl8Eu5xYaWsUhG6N7gFSqDwJYqcphON6uy8s
	 ZInjWsulN6DQr8xPRAT5nBLxL7UisMk+IK0yxvPfRG2U83+Mfu2NShJ/d/GkUPpDDxgKt
	 Nk80O7RPaslPHpehHrDcrKxcoUP073d3BYZiYgbG6Uuel/t5uH/fKRIq26+WvLyIQuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963709;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m5MTk+iMSF8IJK5g5CfhcVnBo8V+eg0v1q4zXApCeQM=;
	b=0de9PX199MXSNcwK5fKRvyJsjIG5aK2gIq7oRbUjdrSksVD1aFSJQikZ+oFN1VPloVQo
	 SMeTTbVAbqcm8m6mkiHhwfJ6dMMEsBGJv7Vp+WXm9PDbgoB6SKAzhutlbpj34radA92YA
	 bUkrAEUHYOZoCfi9DK/D9VwK47++6XX6Y3yjrjVLfBkJHYPNS2ZwrXDWCptC2WAo2mqa1
	 smapmt3WnQ66SbtF3vzRBnuLbk0K1d8+9pQ1T8GrhgOrsdWeBrM5kNdaZZLNQBL8peOKk
	 EAw8L5M0DolgGx89A0Nz6TlExuckkdW6aTi84CzqUlT93njuWviOu9XX/lssVv8v79g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=yivdFmH2;
	arc=none smtp.remote-ip=115.124.30.133
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F5B606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F5B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=yivdFmH2
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793963704; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=m5MTk+iMSF8IJK5g5CfhcVnBo8V+eg0v1q4zXApCeQM=;
	b=yivdFmH2066+MEl5Z81MqW2bW/Z5FPU3wThDFKO3DlcVHTYNEGUge3dmOpL7y8S04kynIIYn3SQeUOMqnBhRUpKDGSVXQxmsmDfEloVyoRFFp1GPSQfh0O/L8/+8s73kC0AeL/Q7wf/dHbGgfY2Qi8i7qNR9N9djxBFGhjEa4nU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEBSvNK_1793963703;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEBSvNK_1793963703 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:15:03 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v2 05/31] ocfs2: abstract the dinode fs_generation mismatch check
Date: Fri,  6 Nov 2026 19:14:32 +0800
Message-Id: <20261106111458.1467464-6-joseph.qi@linux.alibaba.com>
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

The comparison against OCFS2_SB(sb)->fs_generation is open-coded in the
normal validator, the filecheck validator and the repair path.  Fold it
into a shared predicate.

Each call site keeps its own log message and return code: the normal
validator escalates through ocfs2_error(), filecheck reports
OCFS2_FILECHECK_ERR_GENERATION, and repair rewrites the field.

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 8b4652002ae2..6b78b3f3c5fa 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -92,6 +92,12 @@ static bool ocfs2_dinode_has_no_valid_flag(struct ocfs2_dinode *di)
 	return !(le32_to_cpu(di->i_flags) & OCFS2_VALID_FL);
 }
 
+static bool ocfs2_dinode_has_wrong_fs_generation(struct super_block *sb,
+						 struct ocfs2_dinode *di)
+{
+	return le32_to_cpu(di->i_fs_generation) != OCFS2_SB(sb)->fs_generation;
+}
+
 static bool ocfs2_valid_inode_mode(umode_t mode)
 {
 	return fs_umode_to_ftype(mode) != FT_UNKNOWN;
@@ -1542,8 +1548,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
-	if (le32_to_cpu(di->i_fs_generation) !=
-	    OCFS2_SB(sb)->fs_generation) {
+	if (ocfs2_dinode_has_wrong_fs_generation(sb, di)) {
 		rc = ocfs2_error(sb,
 				 "Invalid dinode #%llu: fs_generation is %u\n",
 				 (unsigned long long)bh->b_blocknr,
@@ -1868,8 +1873,7 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
-	if (le32_to_cpu(di->i_fs_generation) !=
-	    OCFS2_SB(sb)->fs_generation) {
+	if (ocfs2_dinode_has_wrong_fs_generation(sb, di)) {
 		mlog(ML_ERROR,
 		     "Filecheck: invalid dinode #%llu: fs_generation is %u\n",
 		     (unsigned long long)bh->b_blocknr,
@@ -1964,8 +1968,7 @@ static int ocfs2_filecheck_repair_inode_block(struct super_block *sb,
 		     (unsigned long long)le64_to_cpu(di->i_blkno));
 	}
 
-	if (le32_to_cpu(di->i_fs_generation) !=
-	    OCFS2_SB(sb)->fs_generation) {
+	if (ocfs2_dinode_has_wrong_fs_generation(sb, di)) {
 		di->i_fs_generation = cpu_to_le32(OCFS2_SB(sb)->fs_generation);
 		changed = 1;
 		mlog(ML_ERROR,
-- 
2.39.3

