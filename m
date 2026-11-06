Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963721;
	b=NJxfuOe6DQwtC6vAWqJYp/SVTcUQkds+b3HGVR3p1b6E0OFnBBFyjrwF05W5IhNFg5lo
	 zH/7xz1qgdLGJ35TtgZSqfZc7BRzUYU8aSylYAMwu/6ZT+zBB9fDSlQgZ/lSoyoo5QEnr
	 WNA9qDhIzZNCOkM7oOYqO3HL+SwriN924zlczIW3cJdZti8yFRrmLQxVuzLJDDPSgkGZ8
	 g4+fGyVwghKGJ2WVq8C5+VxMPfWpDDGJNH3TXcfgUDCT73+nqUiQHJin5w9a1wLSv5rcJ
	 Xum7jdr1TQCWTMP7iVHT5TM1Bmc9Nuve5t70pgj5ag7RnLGSs4OYqsh6tzZl91qFkUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963721;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S0ETzPYAK7L4Q6qh6RWf4Zk64gt5whgKepcRIZEMrfU=;
	b=WuQ+92aUfFUeja32sHYB04v2I1IHq4RzGsIX5jHQQDOF8mIq/rZSBM2J+cUwTzM7SAtD
	 5W07ZtFcZOnDg8BTUi0GuHH7ibkqdZpNr4+HRrf4a3SqEu6gDh8n3Vdp778MeWKJ9bpsB
	 9rQ/8vkjb29zDA1n98+oOaVNMAEgRJnmW0mH0QTEiUrggTnv42e1JrxAtk3Aq+DYmuI87
	 ycVRikQgP7L6Q8SpdjAsLi6qT2Hrjd1O2FDttrpwTEtg3BLNQVWj2J4f/UgvnLYsQtC8H
	 bdXhgBSUQaIAzBhNFz6Is5fS/evzP6WT8Fa929sffGAHQCjfP9kgswBeKv5ltTECmTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=mPcaiRIk;
	arc=none smtp.remote-ip=115.124.30.97
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7FA6083634
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D7FA6083634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=mPcaiRIk
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793963718; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=S0ETzPYAK7L4Q6qh6RWf4Zk64gt5whgKepcRIZEMrfU=;
	b=mPcaiRIk8PdIg/1CQfZphAQNwkpIUCDn8Gp6o3Bwpf88FQRTT3EI7Cx5kQDpxO3BNAmjhfXDFarIQSURVcpaRa5BqNVjyjay74GgvCvN/o5r3hkLnZxal4AOvEq22d8Rvr1L1OHNYcJO9WhGZNhCay7c/6jHrnF1KaeVI6+Rfik=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEBVv-C_1793963717;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEBVv-C_1793963717 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:15:17 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v2 20/31] ocfs2: abstract the oversized extent list count check
Date: Fri,  6 Nov 2026 19:14:47 +0800
Message-Id: <20261106111458.1467464-21-joseph.qi@linux.alibaba.com>
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

Fold the l_count against ocfs2_extent_recs_per_inode() test into a
predicate.

Move the rationale for using the no-xattr maximum into the predicate,
next to the bound it explains, rather than leaving it at the call site
where the bound is no longer computed.

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 551263f290bf..8c4ea3d048d1 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -265,6 +265,19 @@ static bool ocfs2_dinode_has_zero_extent_count(struct ocfs2_dinode *di)
 	return le16_to_cpu(di->id2.i_list.l_count) == 0;
 }
 
+static bool ocfs2_dinode_has_oversized_extent_count(struct super_block *sb,
+						    struct ocfs2_dinode *di)
+{
+	/*
+	 * The exact capacity depends on i_xattr_inline_size, another
+	 * unvalidated on-disk field. Inline xattrs only shrink the list, so
+	 * the no-xattr maximum is a safe upper bound that a valid l_count
+	 * never exceeds.
+	 */
+	return le16_to_cpu(di->id2.i_list.l_count) >
+		ocfs2_extent_recs_per_inode(sb);
+}
+
 void ocfs2_set_inode_flags(struct inode *inode)
 {
 	unsigned int flags = OCFS2_I(inode)->ip_attr;
@@ -1919,13 +1932,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 					 (unsigned long long)bh->b_blocknr);
 			goto bail;
 		}
-		/*
-		 * The exact capacity depends on i_xattr_inline_size, another
-		 * unvalidated on-disk field. Inline xattrs only shrink the
-		 * list, so the no-xattr maximum is a safe upper bound that a
-		 * valid l_count never exceeds.
-		 */
-		if (count > ocfs2_extent_recs_per_inode(sb)) {
+		if (ocfs2_dinode_has_oversized_extent_count(sb, di)) {
 			rc = ocfs2_error(sb,
 					 "Invalid dinode %llu: extent list l_count %u exceeds max %u\n",
 					 (unsigned long long)bh->b_blocknr, count,
-- 
2.39.3

