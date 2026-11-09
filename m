Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226935;
	b=XKaPAg/UIw+KHrDXSLH+7viP06VgT88X+l2TMHWF6UxTcLTb2yUznSGLf10qF6J7hNZI
	 7no/E/5FBr5QF/vcYB02zp5ArnQwF9VB6Kt/kYJ3Zv8JYiqE01yGo3CIPHkxAD8h8CgRQ
	 cEZtqDFx0MQdJPxnwuTH1hdq5pyYxwza+D1vG38POQ+OaLxLlF3jnfwxA4m6NExu9pK1m
	 7b8Rwn/rZlXfSUF8d5mJ06idoZEiAc4b0XYkZEbIA3oPisFgyxB5zwWsIg4dbEuIkherD
	 3xMxNDQBQqry9dPpAJTdYIqN8XpZ0ZdIN7tCj4z2CvEA47rIb6V4QRr5gBhGJCAvTPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226935;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0R0Vd9vQDoX9KJCBZnKYhh0fWxiHyz2f5fvo97KphAc=;
	b=dq6lZWpQvJMI+LIAlGf20xZ0QvWDZH3YR5juvwDnJrO8I8R8wJYTouLGqeDDnZPz6eeh
	 KOaS45EdG+56oN+xZn20pgzwcGYUz8KemtxB+2ZZhtKWuqx51tzv0zIW4yJvy6S9zXbzr
	 gdrgu6g4e7PkMNkbRCKZtMaJPbDjEN7rqb0OKlU5gG+x8qcdDrx47mgw7pwv74CAcWXrT
	 +5R/WM1oeGfLi5mpX9ymH5drRz0vqpfPbE+GcL5FDt5vFKcpiV9zle8IkzSJGeGE3w9Xw
	 nRnkd+T2+7RV+gw735J0Y3McSSwpw5Groq0JAmblSK4Tcimo7SgRz5zs+EI9tRvL7xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=jRv8X8RC;
	arc=none smtp.remote-ip=115.124.30.110
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30876082BEA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D30876082BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=jRv8X8RC
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794226933; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=0R0Vd9vQDoX9KJCBZnKYhh0fWxiHyz2f5fvo97KphAc=;
	b=jRv8X8RCny1A3A2ZupjOCIzJuklJF/SeuWjXA3K7fTGA2tNUqT7e4qKO+TxSNLOj0ss0C+PvYboDBy8NQfuzVmzk1FCK+q8PGRSrOWdsJTAwb5jPCBefP1i3R8bfX81BgV7oVtRSepyXHrA6O07JWq6gYUgk4BgVNz3+boo0Lxg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEOjdty_1794226931;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEOjdty_1794226931 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 20:22:11 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v3 26/31] ocfs2: check dinode orphaned slots in online filecheck
Date: Mon,  9 Nov 2026 20:21:16 +0800
Message-Id: <20261109122121.21473-27-joseph.qi@linux.alibaba.com>
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

Wire both orphaned slot predicates into the filecheck validator.  Each
predicate keeps its flag guard, so a stale slot field on an inode that
is not orphaned is still accepted.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index bb87878200a3..1ae42ac245cb 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2056,6 +2056,24 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
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

