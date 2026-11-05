Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872190;
	b=nAv9AJKaajnkvAf6dUmN/xJgLAtCCdGuX3anAtmIr3yIfGvf32js5yGlgSv6Q6TIrZ3z
	 ZcFGYQoG93SONqn1RuD2HGK4peiFPPtwc7P+/4LbFf8fase1LMf2WFeJRnMWt9aalpHeu
	 KgAmv77ktNdutw6XMKYKWqJVlGTMx2Tzu9qwzB8ctuwd96/gNiEFmnAreOdXLehGsynsr
	 nYGHsAeSbWriAlxmUBD4nMQCX6W4LL9aSEiLG7WKkCJEIfaSALqZLueRL2+/tRjCQbaTq
	 MtwgFac4ixMnHxAKYXqedJl3rqN0sJ4w/Hmw4eEU4xcVLqFhLwFJ4EL6yUzYULb5Wvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872190;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DQ1+acxGA/cVA3xPDg8bZPRUvTTb0uWDFMTwgPkJtB4=;
	b=gpfoHsF/bvHFZnvsX0jfGcGmuB3Do6oqEcjGP1Rh5pwW23XjiEWD2aSlCDaltAN0jSmq
	 zOPWR3jKVukZMtKaHuP9Dt7EbBJGUEscT419yw8EwabuQ+00acUNTQVUt9wJUSdnxBKPU
	 lq9YhJ9k/mYyjnsbGOLf5ebw9lPjCVbS/J8+G9lvwKJhX+GNzzd8pvTOsgweMxs3bveEW
	 vcyscXKP5i0XZOoq1xVsFLOfM0/PVkfqpf+GlDuWXuBuojkrlsZrKRzC20dectmvhgR++
	 rTBxw98FyIqyDRbmpS6zkzGjCzRUaNEDbPDKsExnbOmdYIoG2zOHAVD2vWysp+O9aCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=adO5YKwf;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5657606D801
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5657606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=adO5YKwf
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872187; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=DQ1+acxGA/cVA3xPDg8bZPRUvTTb0uWDFMTwgPkJtB4=;
	b=adO5YKwfe/tAonmLtelSur8/0o3HPDdFTvIhAKPjj7pRPoyc7Wz0eQ/M625TaaZVAW2cqJ7o2A6UhiZt8IpY2tLoC85sSkvpmF6rvqEFU/+bf3NEIX+uUXNuu43Q+asGO2TVLvR144c9XG4Zp2e0ex/o0K+Fh1i2ebDKMvcj914=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R951e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8RZde_1793872185;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8RZde_1793872185 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:45 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 19/30] ocfs2: abstract the oversized extent list count check
Date: Thu,  5 Nov 2026 17:49:15 +0800
Message-Id: <20261105094926.3203416-20-joseph.qi@linux.alibaba.com>
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
index 70fb032ce891..f68f8a26e6ab 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -255,6 +255,19 @@ static bool ocfs2_dinode_has_zero_extent_count(struct ocfs2_dinode *di)
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
@@ -1908,13 +1921,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
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

