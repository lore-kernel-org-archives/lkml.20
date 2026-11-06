Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963727;
	b=c1nbh5nUoY2KmvIjq6eKWdCZb6dUf4kC+GebinuDriknCN3ojsJywJztlzflWENNjveq
	 8x2dtP+M27olNWXskxs8cwKsuEnn4QuC8teitbimUJUipGpYlm6Pw6CuR7yb3LymJNDzz
	 FdIUcPCYAoUAheW68ACVuJyCAt4FwiYLO8mCLRsLSvnDk6fWXQUpFHijA8xFEEMpy7OET
	 Yzj8d8JlH++ZI9ITvKPGwulbjS5sCN+9FN+uB8JQNOdKfPdHo+ElLpOd7XHmoXHHyWFcK
	 6+WnQ4B1xdFl/rbGj4MGA/p1WxuGHsdM+9bkdxR/9CEHfvtR4On+XFNB1cxOw+zKj8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963727;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qYUtRwjFhxbDo5AAWLzFq3YTRB4PpwTZaDOJcUggkH4=;
	b=mrBPdEH8WTWAT7gXtfWl9Cxf+JBnB0JvBQLN/7QaaC3EQevgU/NAXF22KyaIs2kKjp/A
	 1F9p9VZWuMslm7TQ+jf1NgYvISorwQglZBwMdG2cCnt/ohM+dJ1GCkTx5NIHV+Zg75vsS
	 UFDTUqQu30z4kkL2QQ7+4qziKX4cHLPfbggy56znqCAXvyqPKGUCUXAn/aPnGK9TUSMLz
	 a/LT3WSu/PP+Fmfe874AA7ZtZeh1w1RuBqnj79FmSOb2jju8K1gXpIWbtozLJdgX9Y1Aa
	 qcAe4nkodgas66DZs4mB84bKYQciqiY9xJsgVDBfb7LU7OsgBrD7lULpY2BYEq0UN9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=gYvM0MoQ;
	arc=none smtp.remote-ip=115.124.30.130
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFF060A5BD7
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABFF060A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=gYvM0MoQ
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793963724; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=qYUtRwjFhxbDo5AAWLzFq3YTRB4PpwTZaDOJcUggkH4=;
	b=gYvM0MoQ6tQWdnQo/m5GdBkBNui7Q7cwB7bazAB4cXmEVpCqWtOWS+yzM/qiWX3hpCB3EWk9Gj0L4uygbgI9fSSYqBKHd1hRmSHH8pJm4LXEgqVmjl+2MjagYoxaL+mRahwtK2CGkOFvFQQytJXrfxsEwM/lplP7bIvrJ4sFEes=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEBf74e_1793963723;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEBf74e_1793963723 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:15:24 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v2 27/31] ocfs2: check inline data dinodes in online filecheck
Date: Fri,  6 Nov 2026 19:14:54 +0800
Message-Id: <20261106111458.1467464-28-joseph.qi@linux.alibaba.com>
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

Wire the inline-data guard and its three sub-checks into the filecheck
validator: allocated clusters on an inline inode, an id_count beyond the
space available in the inode block, and an i_size beyond id_count.

The size-without-clusters check now needs an explicit goto bail.  It
previously fell through to the bail label because it was the last check;
with checks following it, a later failure would overwrite its INVALIDINO
code and report the wrong reason.

The id_count maximum stays a signed int in the message.
ocfs2_max_inline_data_with_xattr() subtracts the unvalidated
i_xattr_inline_size and can go negative on small block sizes.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 89c6570d5f9d..2ded2ee9d32c 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2105,6 +2105,40 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 			     (unsigned long long)bh->b_blocknr,
 			     (unsigned long long)le64_to_cpu(di->i_size));
 		rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+		goto bail;
+	}
+
+	if (ocfs2_dinode_has_inline_data(di)) {
+		struct ocfs2_inline_data *data = &di->id2.i_data;
+
+		if (ocfs2_dinode_has_inline_clusters(di)) {
+			mlog(ML_ERROR,
+			     "Filecheck: invalid dinode #%llu: %u clusters\n",
+			     (unsigned long long)bh->b_blocknr,
+			     le32_to_cpu(di->i_clusters));
+			rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+			goto bail;
+		}
+
+		if (ocfs2_dinode_has_oversized_inline_data(sb, di)) {
+			mlog(ML_ERROR,
+			     "Filecheck: invalid dinode #%llu: inline data id_count %u exceeds max %d\n",
+			     (unsigned long long)bh->b_blocknr,
+			     le16_to_cpu(data->id_count),
+			     ocfs2_max_inline_data_with_xattr(sb, di));
+			rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+			goto bail;
+		}
+
+		if (ocfs2_dinode_has_inline_size_over_count(di)) {
+			mlog(ML_ERROR,
+			     "Filecheck: invalid dinode #%llu: inline data i_size %llu exceeds id_count %u\n",
+			     (unsigned long long)bh->b_blocknr,
+			     (unsigned long long)le64_to_cpu(di->i_size),
+			     le16_to_cpu(data->id_count));
+			rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+			goto bail;
+		}
 	}
 
 bail:
-- 
2.39.3

