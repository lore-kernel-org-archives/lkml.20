Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226934;
	b=kjVSjfFlWP3v+ZA/0D9cx6Z6KEdm0ihwPRrYDQBaelPhtjBllL0mImV2UVnFjYcxlv95
	 X/hEDlXq6uWqXDYNoZ8pQ15o38RNqfbxcC7920fgjdi6sfg6EP4IPPindquabF/r3kxR3
	 pkjWmgZ+t76m3fSMG0m/C5IVq0zn5KG1WzP1ZcRl59sZPo0iLg/ByW5mvV2vdRTvitqn9
	 4dHq+C01pA+bPPZQbMiptGB5okkYzd6ea7f91pLnmI8MdwLrCTS5wUDe67DRuM2rxFzPd
	 rVkYyIUYIAPNggjrY1YdbGLpFkU0raLAWLeD9eHtr1pMKVAgTviVSDwGp+x1AUA2R4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226934;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jcYyted/Om2bjuPmlYbSOS9Ngns/QeVFKteavfbhUnM=;
	b=kHyLSgrrrn7/EQCwLe1iqjE2GKh4kg59nh7DPHCZuLnE3Y6mtnhoC5qdKv4WSgCpEVOY
	 axeWVhxLaKBSZqeD2Ynh75s4hVJ7oFlwV/1r8JE42c6eLkdXJb01fG2wIntVTgKn3uwjy
	 DVkKYVeVln9zJQyEDkBTenIeTYk5NabWrGtXVIQeQ7o/ZSSX53PI/UH3rmRjmfoCHAh0i
	 +6/IYX/11Cx1iF6ZOrRMKhqMHf9daNVNa06wzhakMbL6rPRkDKV2lGCr9QR9LF6HsdY+k
	 U5SVdSwTp7RrQAXnbdIr/b6l7UyKz94iH6Zenu8jDt+zWjViwntxfFq0xtgzJ++oKdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=sV0LTsFW;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314686082BE0
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 314686082BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=sV0LTsFW
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794226931; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=jcYyted/Om2bjuPmlYbSOS9Ngns/QeVFKteavfbhUnM=;
	b=sV0LTsFWHF04BDZnpxmpIYlT0A06P/ESZcVODETV4dbK6S0C/Lp/wNAAxsL0yikVo7F50aiL0vKvMWo8W24yHM9UGgULcndEJPw6W0P0WI6zAXraltyjzMcLspecYpjL9Nf8/wyETCYcr69Px1hr/nd58SCacQWS0rFIAjUkGk0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEOjdtl_1794226930;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEOjdtl_1794226930 cluster:ay36)
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
Subject: [PATCH v3 25/31] ocfs2: check dinode suballoc bit in online filecheck
Date: Mon,  9 Nov 2026 20:21:15 +0800
Message-Id: <20261109122121.21473-26-joseph.qi@linux.alibaba.com>
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
index 10eaa2c4445e..bb87878200a3 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2047,6 +2047,15 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
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

