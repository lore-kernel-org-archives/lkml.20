Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872194;
	b=LlK4MlDNH0a+bM0JFmfmHWgTjnMIXT7qZSO7eeRK8HJZkM6iYORG9PpHa4ThsO3+DzJK
	 zYTwZL6Dvarubtu2+BGM/tjBouCtIjgB8vX2eB8NrqbTQkbx6iWlhYD99kfZIp14auw0D
	 bMiu2P/xVoTzup64Xr37nmFoC93psJL79tZ4nvUBedA8bEejjzZLGwd1y68bifDrkwh7H
	 E+Iu7xCvBlibZkB+4aJA4N6pBamanVnxPXh0FugIYzy+VqG7am9srWgWRf60JLdGVtNDC
	 eKKa8SFmuz4CbC0yF13zROMyBfz5aK7eK7oYo8ZXehnq0wQa5r/3WnVtWu3LgM6LE+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872194;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jJI4f0Df9QirktikvS42P/+FiXAktxHwsYl/ayhir8Y=;
	b=00FNiRvqpIP/FE1R6xe0gtdQsg08H8c9L7gw2/adOu4yZFMGAzF90cOrPBhTax8D5azJ
	 Zbn3jbLDsVloxedyUgkAajqcF5i5FkCjSueKQ/9dKkfIp2bJ2PDWdM3GiEDlerlHp1n+9
	 HdmjtmDxufAG2tK4EOFpFPOsVc8k0zkvEbCDOF/lmeTOGvhfJ0oxrcMwNltyTr7hIyokp
	 gu/oPg0PDFAsQdyWobnuRbL+PT/SF0CwBQO/CtgIGQ6ueTp0Hn9BDsRUXaXik2bG2JAA1
	 6Ybrzm7ZrhyO/8sG0E51jYUoWQFJRHFvfj6D0v+XQHincQE4vux6hzsk14Ivjgtqvyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ICd7jpTo;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E682B606EE80
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E682B606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ICd7jpTo
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872191; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=jJI4f0Df9QirktikvS42P/+FiXAktxHwsYl/ayhir8Y=;
	b=ICd7jpToPonBF//GvAVWXoqKy7oLezzNnpVb7Us+bjuN6htVQ2ZlORSugGkKQw3i9g5c6x/8NR0B2osZxZXhXyWKAehM+Q6a5apC1BPjsqYOyBFSUl5Y7rGbqyEz8DxYaBR19wIiQvdMg2CDbfz2ogHmANtcO0jIwvWYQ0O9z/s=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R791e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8RZfg_1793872190;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8RZfg_1793872190 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:51 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 25/30] ocfs2: check dinode orphaned slots in online filecheck
Date: Thu,  5 Nov 2026 17:49:21 +0800
Message-Id: <20261105094926.3203416-26-joseph.qi@linux.alibaba.com>
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

Wire both orphaned slot predicates into the filecheck validator.  Each
predicate keeps its flag guard, so a stale slot field on an inode that
is not orphaned is still accepted.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 0c515ba37ea0..db8cdf4d8627 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2045,6 +2045,24 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
+	if (ocfs2_dinode_has_bad_orphaned_slot(sb, di)) {
+		mlog(ML_ERROR,
+		     "Filecheck: invalid dinode #%llu: orphaned slot %u\n",
+		     (unsigned long long)bh->b_blocknr,
+		     le16_to_cpu(di->i_orphaned_slot));
+		rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+		goto bail;
+	}
+
+	if (ocfs2_dinode_has_bad_dio_orphaned_slot(sb, di)) {
+		mlog(ML_ERROR,
+		     "Filecheck: invalid dinode #%llu: DIO orphaned slot %u\n",
+		     (unsigned long long)bh->b_blocknr,
+		     le16_to_cpu(di->i_dio_orphaned_slot));
+		rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+		goto bail;
+	}
+
 	if (!ocfs2_valid_inode_mode(le16_to_cpu(di->i_mode))) {
 		mlog(ML_ERROR,
 		     "Filecheck: invalid dinode #%llu: mode 0%o has unknown file type\n",
-- 
2.39.3

