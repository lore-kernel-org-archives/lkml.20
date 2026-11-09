Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226935;
	b=t8/EewF1g7/rpiZdK4mIkmjUTTXlZ5XiI5EnxlagNOz8GGdQ6IjiLtCifyRtTxwMQqnW
	 rQ/H1qSxvxoltv03z+w9W/0I5F+4GRVmyENCdTTreqyqAqjUU4hpzorBFnQ1Q2HQV8K+i
	 hpG9qCNGCTbnRe2SCga4nrR/iJX5So19ASo7ost3ngb2Bl+lQHKB3NIcIDwNtw4EgaNu7
	 iK9ZWg6ICvJLKZ9GPttWN5MmIzPSXo3JmXGtp+Bw9fxcXE9WQpMvAp2FQpXTlGxvSqpTy
	 4YdmIlXM2FYl7MVYsbX5UGsfrfN1OG7T6cD79Na8n3/s7riIT3P9E7ZKf4w22Aimzhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226935;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YsBDLDdvhHgGE4hbSYAmMvLRsGcnCVXi8pM03OETaug=;
	b=SqeiHxc5MgDz6OsPJQ0qIBCJH5NN3zbBj1TegWNI1JeaySchQWQ5V1XENHQPxXrORWjq
	 kbED8aoTkBnF5JFWJ6/iknNGvmcofadZTbDE+zsQJRzjkhGwvTP63qHAVgZ73h5G8llWu
	 P+S+dCrFsX1bIZs+/2GVegEhfjrG9XO6/jTzn41melRnL03WsI5EpLka/M1fIljO0lvci
	 0uZJtp/Q1pIQu3bWOD7RRfWq48TnpkZlKU7w4+njmM/q2SdxKcxw8lgm7D9tGaqY5+Zzv
	 TqsZIqNFQ/wFg6I6munYehW1iTFV+rA5gwz2GDum6CKz52LwcmbiEAyxZh+67gbBbyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=WGNKcYiO;
	arc=none smtp.remote-ip=115.124.30.124
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5444C6082BDB
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5444C6082BDB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=WGNKcYiO
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794226930; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=YsBDLDdvhHgGE4hbSYAmMvLRsGcnCVXi8pM03OETaug=;
	b=WGNKcYiOgi27DQ2qKjuUVv4iozZHBvGBnbSIfw1T1Q9cv1r1+CHuiduVbfjWoc3EjUX3nGfj6uvflaZw1Py4FFbs9OilzoIas8g57RYHaRmZfBVaQHS4nQdf3ryUeSNmQVTnEraJlCZ/m6M0zKbMw40YwpwPilZ2gI7UPZF3Xa8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEP8avi_1794226929;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEP8avi_1794226929 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 20:22:10 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v3 24/31] ocfs2: check dinode suballoc slot in online filecheck
Date: Mon,  9 Nov 2026 20:21:14 +0800
Message-Id: <20261109122121.21473-25-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261109122121.21473-1-joseph.qi@linux.alibaba.com>
References: <20261109122121.21473-1-joseph.qi@linux.alibaba.com>
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
index 6d2fb46e6c38..10eaa2c4445e 100644
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

