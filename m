Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7778448382F;
	Mon, 19 Oct 2026 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398049; cv=none; b=jX9i1QGr/7drOLs6n218CmfG8U4Q6hImLdiiGNp7FjQy0opuTiKUNP9O8YolzdA6mV96BtIyTq2Ydh9lEjuP1CoIKp7KGEmE7iQEdNpjXSBbfqUJEm5qscs1HKMlM1GIU0Z2i/CFKw4T/TXKsHtsWmwDHYWlLZh6VJEE5i0VOHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398049; c=relaxed/simple;
	bh=6NLETwQFwCzGrUUcE/JYfqlj3Ea8wEVj8E+6UwtK1YE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lm/aLGHIh2w/ZZ+wNoDj2iQazIwSrFCiiFqAyFriU9DDRbK7p0Fg6QmyYsCGjEGkhmwPpaHxhVjwN0fUoqGqreMRFI1Mm17Rl2ppvWL1FWtasUp9Pq4I9fCNLIKA7AzfZWkbIYw/NTgWm1gubZwyxokrEPDzUCe806aF5GvGbzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jC3nQDH9; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jC3nQDH9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Y3
	mCbXntUxHVWMUopNkQHekpskzAnaLE70q0LaI3e4g=; b=jC3nQDH9BNqBFGgpZx
	S3gME59KRWeC1dXA/2LoIvCuLvFM9oI6401W0815JrCrQQagV3TmnyljT8trtvzU
	kjClci9MSwnzy0jt1Zhtojc6QgXUXqEHrK3riloo7aagcBiXcKqS0wSxYqkD0nPf
	n6rjavCDimb6FqZ+bV2y2y+X4=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v2DL0tVqxMGKAw--.34321S4;
	Mon, 19 Oct 2026 16:20:30 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2 2/4] media: wave5: use m2m buffer completion helper
Date: Mon, 19 Oct 2026 16:20:24 +0800
Message-Id: <20261019082026.1798945-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019082026.1798945-1-yaojiale02@163.com>
References: <20261019082026.1798945-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v2DL0tVqxMGKAw--.34321S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFyruF45ArWUJrWxCr45Wrg_yoWDZFc_Wr
	sYga17Xr4rGw1qyw45tF4fZ3sIg3yrur4SkF4avF4a9345Cr13WF9IkryDur15Ga12vasr
	Gr15WFyxGFnxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRMuWlDUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BP4M2rV0tM2OwAA3b

The decoder destination queue handles a runtime resume failure by
completing the queued buffer. The driver is a mem2mem driver, so use
v4l2_m2m_buf_done() to preserve mem2mem queue bookkeeping instead of
calling vb2_buffer_done() directly.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 320b40581b..467c68931e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1309,7 +1309,7 @@ static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
 
 	ret = pm_runtime_resume_and_get(inst->dev->dev);
 	if (ret < 0) {
-		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
 		return;
 	}
 
-- 
2.34.1

