Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595771;
	b=j1dJfqEun7mregHXNDvRlmbWegpSrYVpmd9uwtl4gJLCgGSBAdtSaP0U+wzU0QmLKUBm
	 Fqx1+FYsPW+9C7lT/eijI2Ns1cxtWcoW4ZaicPgMfxc3UCN+edzR/V5LWAJ0BJuQbj085
	 q7VvM++RlLVCRatMuItXPql6j/YW5WTz8NHeHqgBz5OZ2S6+Tpth1ARa2QjzxCNbtHSCg
	 7ufGZe1VIuVij9sqNmdRoJpAeb1gbQKYjfROy/Z2NfgE/VN+4FXdHd1/ApVSOZbM3FmIT
	 TLaLsWd4CF0m2B0/O68HnnB4+S+xoxv/Gd8/bIbgIsj6UuHLZga299jd/zij3VEGnhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595771;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Y3mCbXntUxHVWMUopNkQHekpskzAnaLE70q0LaI3e4g=;
	b=11lAwCjHLO51rmXMC6nXFvp7akl1XRg9L+T+TJStwwNNTSg5l1O90vfNgm9PlwisX+OG
	 DRXFUJJ0gcEgDfKN7p5/Q7gy9EBtmSLQyiRsre9yqlVMemOtfO/sEpo83ReMNtwkDLQMA
	 pxiXnpGuJgxy11R6p83nqmjNLOjNgZDEwMICin8+HRLj1ux4dOT44T3yNs++dlgjUM+k3
	 emhqtiTrJvxTKoSKcDfcHp4th5oxd4RS1YJaJANY964yQ+ey/4tnMqrTP9XfMQ6A5heOf
	 uATtzcPtya0cVO9x1qA3yAoW/VdcJAFIiLLceF1aI8PjYkzLwjRE6RelkLbHt6rRJMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KCeOmEtC;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08A3606A31B;
	Wed, 21 Oct 2026 15:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C08A3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KCeOmEtC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Y3
	mCbXntUxHVWMUopNkQHekpskzAnaLE70q0LaI3e4g=; b=KCeOmEtCxzp5NKMEB8
	osusnRuTfs6UAJSwexuMuyUxsSwT7sa0eX+p9uIs7TSNYu1GsNAEQ2wTv9OUQu3Z
	nFNFf4YEhhL8t7RktU1BqzPr4VQQ1qx6f0Fxb7/znxdYV0SVNaWA3SleeNiFRsNW
	YWWvtnLhGpYyKfE3YTUh6pM8w=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDn93cq19hqoFfvBQ--.50052S4;
	Wed, 21 Oct 2026 23:15:56 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] media: wave5: use m2m buffer completion helper
Date: Wed, 21 Oct 2026 23:15:49 +0800
Message-Id: <20261021151552.428590-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021151552.428590-1-yaojiale02@163.com>
References: <20261021151552.428590-1-yaojiale02@163.com>
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
X-CM-TRANSID:_____wDn93cq19hqoFfvBQ--.50052S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFyruF45ArWUJrWxCr45Wrg_yoWDZFc_Wr
	sYga17Xr4rGw1qyw45tF4fZ3sIg3yrur4SkF4avF4a9345Cr13WF9IkryDur15Ga12vasr
	Gr15WFyxGFnxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnF385UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wzRDGrY1yyr0QAA3N

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

