Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226944;
	b=qjbvpXr8qDJM/l7Kip7kyUCmUE3QcZkXfrYFZNLZ+iwLYkPi4Gh6XcjGdFf47SDACjQR
	 AfKenwDdETWb/pWd0GSdePyg4De03xBnOqzinA4TQ0R11YmULO52RppvXY1/dDbEVyW1/
	 hG6Zl245K0a0P3qJAKjot/w02eu1T6C9gCfRUzDsNCJV3NZgZ3OprICkXgDxzSYvVTR2+
	 wvSWZHE9afHnHtn1ODV4fFP8wASRWskQ2m+7TU6utLfiDMLkmXRTwAi8Osuzbra77B0Vb
	 wDVkKgjnQy2CcGsFIKLDBlTH/zK/vxNsX1uZfpBI173L/yyMVls69BH/IRTm5wpRW4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226944;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UFpQwiXOBYDZTKfuhC4f7xhc7V7ByrsPsGNV0IJYJD4=;
	b=hACEuoFPQYUPDzFwQsBN9/nIcO5u7dQ7XeIAm+wgzi4lGXmhdTWJLoi/6zYi8F02+8jt
	 TlV3zzzQEE92MHe2Bl34sgm7WBNVFNyjAiyYpe+J9TOuTiqyftP1yvZXr7cwfRw8EnRrG
	 sACeSjmjhYC8waRxraqRUhaC7jJSPReI84APOJqArRaq6HZkhWsYF5lh36cLhZTE2vCRU
	 KKVjlnPHEK4/Mb6ee5eFuVtXdh7IqMUAK+unkaBqchb40cFlTNQnE1Uh5t51x+sTm2BVy
	 88V6eFZqUKJc/4EbpWbma8i2Y2JUEpRGnBzMIEukNkIi5uOYQI2i9iT2ESj1My0mPJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JPnZU87U;
	arc=none smtp.remote-ip=115.124.30.124
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB1A60A3824
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB1A60A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JPnZU87U
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794226936; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=UFpQwiXOBYDZTKfuhC4f7xhc7V7ByrsPsGNV0IJYJD4=;
	b=JPnZU87UTDECzicvypkkrshrZVWwbOZNQCucejncKx2rjovxYhUbZ12z9yx6npxtCSFi5ygoIihKs4uCaf0n3z/2RTRJJJTN9YPsZm0dMlinEtBoidUJuFg4OAb8N8kfivy47yj480U1rYbNXnavmjMP+vY6tKj4jbkrUPWQS/M=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEOjduc_1794226934;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEOjduc_1794226934 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 20:22:15 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v3 30/31] ocfs2: check dinode refcount location in online filecheck
Date: Mon,  9 Nov 2026 20:21:20 +0800
Message-Id: <20261109122121.21473-31-joseph.qi@linux.alibaba.com>
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

Wire the OCFS2_HAS_REFCOUNT_FL without i_refcount_loc predicate into the
filecheck validator.  A reflink-capable inode with no refcount tree
location cannot be reflinked or have its refcount tree removed cleanly.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 7e299b2dc8c0..6a7dff8a6a05 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2196,6 +2196,14 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 		}
 	}
 
+	if (ocfs2_dinode_has_refcount_without_loc(di)) {
+		mlog(ML_ERROR,
+		     "Filecheck: inode #%llu has refcount flag but no i_refcount_loc\n",
+		     (unsigned long long)bh->b_blocknr);
+		rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+		goto bail;
+	}
+
 bail:
 	return rc;
 }
-- 
2.39.3

