Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792854628;
	b=xBT16WuQOB3RcCuvayEFiNiCHhJjW75yS/OpYZ5a3E+pEOG3nQstSSnwzUHsXtdI5HMn
	 EL6QJRJlAKxr5DrF1qCfGnd7pb4S7mm0O7agvbPpn7QHpg0gfuS5FPkc7BTZak2FVKwZU
	 nCCpEVzFC9Ljf/hHDAVftIGq1DQPzVo35YHkBXoemozCPz01UPq2Luik377h0fCJ6pmoL
	 r3qZFcyzB3vsQLFONL66sPE5UFdXDcd2MHIOsxwTDzoSw/DVWED4PGXDX7qoAYDZs06gt
	 eXHVsdElY3LirAHOeDTCda0vySPAgeqS2KBNDWDa+hoCyVGb/poK4G6F1QCTFQrNpsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792854628;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qIKsgOUlVwhhXezR/PfcS0ooHs2x7bjxf209eVeB6v8=;
	b=po00OaDhLm05B5JgyjcHsCc+sB9Dc1gFxUQbQ2mMrtSm0JOxEIT1XyUXvhgCbo+ClPvR
	 Y7BEQgZJ6n4K3fRaKsJpFf4+spN5B/KXTHVd5wIqSsVUw6HSbU47d3t16O0iin+ViFLB8
	 e2KTn08OvOlifTbynsAFEIZRjfXfv5+AdXZrh/IVQ5gr+x1dy8ZFbE7v1AYFHX4xmXqhJ
	 i8i0EvWFJAUvw3fbkAdITjrPoMZwnJLKBja+jKKuoGSgpDW+C4YkL+hGc+V/8vURMRwtR
	 Gc1iastmXhs5nhYXDX/84f9FsFDJQWNXbkYLK9pzN9I62z2r0duDBnAIsP5OcUPYXFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=N1Uo7W+l;
	arc=none smtp.remote-ip=115.124.30.112
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C1D606A323
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C1D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=N1Uo7W+l
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792854617; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=qIKsgOUlVwhhXezR/PfcS0ooHs2x7bjxf209eVeB6v8=;
	b=N1Uo7W+lYVLV4GPOIEhAqyXv2sSZV/6ABtHu3x7R76uqyLFOje1T+lEiro7NK/FlnaslPFH2NzOjgJVzG0/HJYLE6VbMLZggHUCshbLlsSwO/CHkIr2RXNd6vb3QcCTQEk9tHflcuUxWDtoGJwmnZAuU3Vj5ZSO/zQRS/O4V5s0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XDORGhT_1792854616;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XDORGhT_1792854616 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 24 Oct 2026 23:10:17 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] ocfs2: do not index before the entry array when dividing an empty bucket
Date: Sat, 24 Oct 2026 23:10:11 +0800
Message-Id: <20261024151012.1059683-6-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261024151012.1059683-1-joseph.qi@linux.alibaba.com>
References: <20261024151012.1059683-1-joseph.qi@linux.alibaba.com>
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

ocfs2_divide_xattr_bucket() appends an empty bucket carrying a sentinel
hash when the source bucket has no divide position, taking that hash
from xh_entries[start - 1].  ocfs2_xattr_find_divide_pos() returns count
when every entry shares one hash, and its loop does not run at all for
count < 2, so an empty bucket comes back with start == count == 0 and
the read is xh_entries[-1].

That is outside the __counted_by_le(xh_count) bounds of xh_entries[] and
lands on the header, so the value picked up is
xh_count | xh_free_start << 16.  One above it is written into the new
bucket's xh_entries[0] and committed, which leaves a bucket whose first
hash does not follow the bucket before it.  ocfs2_xattr_bucket_find()
binary searches on xh_entries[0], so the broken key hides the range the
sentinel was meant to cover: getxattr() answers -ENODATA for an
attribute that is stored, and an insert can go to the wrong bucket and
leave two copies of a name.  The cross cluster divide hands the same
value back as a tree record's e_cpos, which then claims a hash range it
does not cover.

Read xh_entries[0] instead.  The branch is only reached when every entry
shares one hash, so for a non-empty bucket it holds the same value, and
for an empty one it is the slot that carries the bucket key.

An empty bucket reaches the divide from
ocfs2_check_xattr_bucket_collision(), which reports no collision for
one, through ocfs2_add_new_xattr_bucket() and
ocfs2_extend_xattr_bucket().  It does not take a failed set to get
there: a divide that finds no position is itself what leaves an empty
sentinel bucket behind, and a later extend can pick it as the target.

Fixes: 80bcaf3469b8 ("ocfs2/xattr: Proper hash collision handle in bucket division")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/xattr.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
index 3a16b4a36d9a..822b1e9c3ba2 100644
--- a/fs/ocfs2/xattr.c
+++ b/fs/ocfs2/xattr.c
@@ -5228,7 +5228,15 @@ static int ocfs2_divide_xattr_bucket(struct inode *inode,
 	start = ocfs2_xattr_find_divide_pos(xh);
 
 	if (start == count) {
-		xe = &xh->xh_entries[start-1];
+		/*
+		 * start == count means every entry shares one hash, so the
+		 * first of them carries it too.  An empty bucket has no
+		 * entries[start - 1], but its entries[0] still carries the
+		 * bucket key: either the hash ocfs2_xa_remove_entry()
+		 * deliberately leaves behind, or the sentinel a previous
+		 * divide wrote.
+		 */
+		xe = &xh->xh_entries[0];
 
 		/*
 		 * initialized a new empty bucket here.
-- 
2.39.3

