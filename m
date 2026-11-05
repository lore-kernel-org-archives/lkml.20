Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872193;
	b=wfFpe2tWA14LfjmkRlxmt1g7hIzcGaq9X6srrnJSGw4yoCjEY9xlkCNhvcnniIqqY3Nl
	 Wk8Pin7PzNCu2zQ2sjzh6eWVY5R/QVOIQXZuGXzZHyL8Sn7BSV9Kzww8yo2e2cDiohiMP
	 Uoj6pBy+2Td2usdEapBMMY2kbmaaO0Bj/0Iv3yTaKdDAM38iMtjOcolfgrnV/cni9tdLT
	 /FXPzCNBFBR2SggnSlLEvHVmOgpzIHTrSoYaVtIaL/RXk3rcXLiiKe8UVvtpHhTBCDprR
	 ckqHXUd3Ge1ttxo5XDZYU218GtJcdtIllkwatcMKd2evUhltsSMlNFEI9dSD7d8Jh2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872193;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j7EPhho6X4WeJbT4WBRO+f19XJgmFg2S1eGKVkdT/7U=;
	b=SMFdEW0vr3H9f157OjkR2qJvD1F7DEpxzTDOxEZnoIluzn053ir7y4IKYwlOxh1uxnsp
	 z/j0rRXCKrCjqf7thIEAgzzFwGBbUdz1+s4GfMcCn+0IMoJd5US/0Kk7TYiVtT36/hkTh
	 QVhTZckjaels8w5BhkH4EolooYcly/1PdYZBjxPFHv+3rrpHgJeWlx6YcQq549hv+lMSe
	 88uHxPS9N13GdhK/Xpcnnh+2gBSbF9RNuPZ5Mgxp5ZeGVck+NZyiotSXwtQ+R3ECVhubA
	 o8DdCgpgh3O/8A2VfChzej7htq5LWCL2v4PpGAQ0U0l9wQOcqq+V95jLWI+HuOQu+tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=dJ7DSxwT;
	arc=none smtp.remote-ip=115.124.30.112
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59CE606D83C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D59CE606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=dJ7DSxwT
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872190; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=j7EPhho6X4WeJbT4WBRO+f19XJgmFg2S1eGKVkdT/7U=;
	b=dJ7DSxwTN+MFT4g1X4otBFIURf3I2+g71mljJigY3fkt1XH2uiW4NZnK4cApTT4ugEb5HE4zuWYbPOUBUzH5oziqSSDRe7VaQDEAcKoi8J5BJkdPcw5fQOXiDvRIk96gE6tsr6KZi7AsulwrmU18tDaXB8L+xqmxk10u2saN1tE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R491e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8K77E_1793872189;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8K77E_1793872189 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:50 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 24/30] ocfs2: check dinode suballoc bit in online filecheck
Date: Thu,  5 Nov 2026 17:49:20 +0800
Message-Id: <20261105094926.3203416-25-joseph.qi@linux.alibaba.com>
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

Wire the suballoc bit range predicate into the filecheck validator.  A
suballocator group bitmap lives in a single block, so a bit at or beyond
ocfs2_suballoc_bits_per_block() can never be valid; accepting it would
later trip the BUG_ON() in _ocfs2_free_suballoc_bits() when the inode is
deleted.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 7cde33f0f616..0c515ba37ea0 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2036,6 +2036,15 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
+	if (ocfs2_dinode_has_bad_suballoc_bit(sb, di)) {
+		mlog(ML_ERROR,
+		     "Filecheck: invalid dinode #%llu: suballoc bit %u\n",
+		     (unsigned long long)bh->b_blocknr,
+		     le16_to_cpu(di->i_suballoc_bit));
+		rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+		goto bail;
+	}
+
 	if (!ocfs2_valid_inode_mode(le16_to_cpu(di->i_mode))) {
 		mlog(ML_ERROR,
 		     "Filecheck: invalid dinode #%llu: mode 0%o has unknown file type\n",
-- 
2.39.3

