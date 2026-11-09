Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226919;
	b=JEsyI6g6pMVxpntgsNz75Dvc3ZgbOpsEyfJ7kFpUlhqXRUVIWPMNH70mOHA0D8u3ERM0
	 9uQYARj31K61kJdNZsMTiMccMb64V2yGddCj60/FgWW10E/lr8NYjE5nc+4DtT2UKYQpw
	 pbTsnGmVlAAmektnV+DRbgSO9X1MEyM3pa6ckZKruaKrhTcB0WVovmG6jUtqiolDbi6qV
	 QXVa3l9WXcV1pDkNkfnA1ZyCo4IRLtFzAsq18+cg+vLslIDLBbMU9f2N764DluHfb5G+m
	 zJ5CZBPQxWS0tf+SMsiLwPJyb8faTfNssctrxqgxNdSfq27q4bEF3/aNRx82kVtlESg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226919;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RyTmqKAAkQSpBOmMf3RfK602p4rkc0GPWb4Y2ozi3eE=;
	b=g22ptEUY2AJqrvDY8EDd6oklNIdMMdJxANVJ1Hlf6Rq1YZgPT7l0dOrwH59UsMZouAaP
	 E4RXKsaM+Qrl4Diqeovc9CTmYQsxIvAzm9Ra2yCGwBc+JW0LkqWyAHeo9RWn3idkR1dlA
	 Ww2tM2F3PB3Zw41EEpIC/PtCcFgowtPh/81wB5L8LGMR89wJByUas6cC3zsCk+Q25KZfp
	 AvT/ouRwPvbutc7MWT3A/AmMIqH1ls8fZHIbgItKbO+UZAfLQ3s0XIj5rWq6ZpnSOR570
	 O0q+0vzfmmR8pSg2rc05KDQfcXqJhNaF7J/7RrW3PVn6N33y5qlvaGO1hStgcuBKDgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=cYljSBel;
	arc=none smtp.remote-ip=115.124.30.133
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB33606A336
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB33606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=cYljSBel
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794226915; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=RyTmqKAAkQSpBOmMf3RfK602p4rkc0GPWb4Y2ozi3eE=;
	b=cYljSBelTIjjk0fcWn9/iBo9Iqsji9qeUZ+0IiXq0b4bkU8HGjjAokKHlDOxWeIH6b52++0WlN9Rf5OF9p4whaWW+5TEX8uiKkx/i/4v0+fwy5MEMPk6yGHuLZmETIEIglR9SeW8px7nO6ZcXBQkWFgMch9ng62ZCBBoo0wQC3I=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEP8ar-_1794226914;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEP8ar-_1794226914 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 20:21:55 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v3 08/31] ocfs2: abstract the dinode orphaned slot check
Date: Mon,  9 Nov 2026 20:20:58 +0800
Message-Id: <20261109122121.21473-9-joseph.qi@linux.alibaba.com>
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

Fold the OCFS2_ORPHANED_FL guarded i_orphaned_slot range test into a
predicate.  The flag test stays inside it: i_orphaned_slot is only
meaningful when the inode is actually orphaned, so a bare range test
would reject valid inodes whose orphaned slot field is stale.

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 3be98328925d..fd9613a95802 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -117,6 +117,13 @@ static bool ocfs2_dinode_has_bad_suballoc_bit(struct super_block *sb,
 	return le16_to_cpu(di->i_suballoc_bit) >= ocfs2_suballoc_bits_per_block(sb);
 }
 
+static bool ocfs2_dinode_has_bad_orphaned_slot(struct super_block *sb,
+					       struct ocfs2_dinode *di)
+{
+	return (le32_to_cpu(di->i_flags) & OCFS2_ORPHANED_FL) &&
+		le16_to_cpu(di->i_orphaned_slot) >= OCFS2_SB(sb)->max_slots;
+}
+
 static bool ocfs2_valid_inode_mode(umode_t mode)
 {
 	return fs_umode_to_ftype(mode) != FT_UNKNOWN;
@@ -1614,8 +1621,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
-	if ((le32_to_cpu(di->i_flags) & OCFS2_ORPHANED_FL) &&
-	    le16_to_cpu(di->i_orphaned_slot) >= OCFS2_SB(sb)->max_slots) {
+	if (ocfs2_dinode_has_bad_orphaned_slot(sb, di)) {
 		rc = ocfs2_error(sb, "Invalid dinode %llu: orphaned slot %u\n",
 				 (unsigned long long)bh->b_blocknr,
 				 le16_to_cpu(di->i_orphaned_slot));
-- 
2.39.3

