Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963732;
	b=nf+GfaataAQGOZ1vkxR1bXt+VAD0dYP2VCWUNLAvK7TqdSKL4Hgpl4CdomEG3o+LXdBE
	 MhumF2CnkoJV2zT2zWwoOmi1niAJT8nDJEPCeB6QNp7gdpziaFE8K79zoLJUPHEPsYqch
	 DiUi5rS/iBNsmogBOVOqasO6M9tu8eniJpl0p22XbIl2NxZYbUpvAwWS1i0QznDjHXGqV
	 nifBZ94jwj4GC/0Gx73y2pxdDw1gDf9O0up6aQZ+pPCnaPoo2vJGNnsyaHTBm0y/Rclc3
	 mdfV2YazJSVrC6zeEqIOy4YgHGtQTGvjkpZcymgeV8DFXM/H1B4M2rF/GIzLA9G2bDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963732;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M+pnnGcv2orTjveXNhR7L4lavMK4j0o0zvOh1N/TvuQ=;
	b=EBNOnkF5bjrOxap4ocVaBF5/IFnWt2tmAYSEY+UNnL9yLjpWWqKa9pNk48gnKbo2sEK3
	 uoBZyElyivj1QtXJf9X6gFNugDjLMkZqh2JKDChjx9gHG80fqLAjhsfjQd47x0ARE/J2m
	 C4xpT/zNIHOZDyVaV/7zJEOKa4S75IDZHAuSx87jGxH5R/YzKsSXAGU6D5Z154gtXl3hW
	 Ryvi+6pL/CP7jcsvqPZuqUxiAD/yk5UQCHypljGEiyXD82HUUy7sSZIZ/sPGTJr/ja1LM
	 HSexoN9waW9T9gmdRqSmIgpH/+ZNQ0YvIDMPvw962T+kP+BQwN/vMyzk4A1GtlnRayg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=t3vUtper;
	arc=none smtp.remote-ip=115.124.30.119
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1DD60705E0
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD1DD60705E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=t3vUtper
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793963722; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=M+pnnGcv2orTjveXNhR7L4lavMK4j0o0zvOh1N/TvuQ=;
	b=t3vUtperHi0aEh7+OtzBKgXhK1LWwCsWyD3nfPypUUpMcxjgVuV4yNaB6Nlp6keO3EUQ1CWgYqPiWvFQJEKNlUusKx3AMJxpe24RTVGmhnamq5xS+MkreI2ZReHMksUeaqDxBH4lYdRU9IYBEWuaZqrrTLoHTDEavahOhlkjeko=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R941e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEBVv.-_1793963721;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEBVv.-_1793963721 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:15:21 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v2 24/31] ocfs2: check dinode suballoc slot in online filecheck
Date: Fri,  6 Nov 2026 19:14:51 +0800
Message-Id: <20261106111458.1467464-25-joseph.qi@linux.alibaba.com>
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

Wire both suballoc slot predicates into the filecheck validator.  An
OCFS2_INVALID_SLOT on a non-system inode and an out-of-range slot keep
their separate messages, so the log still distinguishes the two.

The range predicate excludes OCFS2_INVALID_SLOT, so system inodes
created by mkfs.ocfs2 from the global allocator are still accepted.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index d32be79151a8..a70415f31aa4 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2029,6 +2029,24 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
+	if (ocfs2_dinode_has_invalid_suballoc_slot(di)) {
+		mlog(ML_ERROR,
+		     "Filecheck: invalid dinode #%llu: suballoc slot %u for non-system inode\n",
+		     (unsigned long long)bh->b_blocknr,
+		     le16_to_cpu(di->i_suballoc_slot));
+		rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+		goto bail;
+	}
+
+	if (ocfs2_dinode_has_out_of_range_suballoc_slot(sb, di)) {
+		mlog(ML_ERROR,
+		     "Filecheck: invalid dinode #%llu: suballoc slot %u\n",
+		     (unsigned long long)bh->b_blocknr,
+		     le16_to_cpu(di->i_suballoc_slot));
+		rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+		goto bail;
+	}
+
 	if (!ocfs2_valid_inode_mode(le16_to_cpu(di->i_mode))) {
 		mlog(ML_ERROR,
 		     "Filecheck: invalid dinode #%llu: mode 0%o has unknown file type\n",
-- 
2.39.3

