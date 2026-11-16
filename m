Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842377;
	b=hj+j+1qo7yJhlL4tH4UCwv57bGOVdWY+z8H3bAKaz1htZozA4YsVH9ogb+uNLGXlgEE0
	 xIXashk2TcVxRPGmb0Gk3SQDPpiqBMi+2MPGlROwhQAiO2P2IJG0i8BWbhoXoYxKCawGC
	 4MYRDsgpEVQ3MFgzN+YabrdRZFhdn0picNIris0aG8bv35+VVFvLcZKK0XMeiUoRLvYqx
	 yYq9z4zDScLXEp9SshskFoXUharf14DTEx/Xqc+9efQeknoKxXM6e5uuJvpsMlvREZIOx
	 NqjpOsW0Xd8TUPeeLmp1mIE8MkTQuP3laC7Jzt+PlcDVZgtwRjui6rqVKip4dSccaxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842377;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rd2zyJilYjFw4tOP2AzLIflkG29Q4wi4nRr7XMCt7/E=;
	b=NKRatW6pzz1TvHmRe9k1e6SQjmGkdV24d7T6XR6Bws23pwjMToIMIWnvErg/JQ8yEOow
	 OPSQoG/KQpOaibzjygjzeaAeqwUYdCCqen0kEUHPPxCgystDBq6vpSJ4mpJCRwQoiGbbp
	 e/gu/lMlfxGBvL/g02DhGiay+V2QPN/HOJRXG9WSaPpKeL4utb4YrCVvnYnMqRReNFd+B
	 UCmrwipMsMjqhvwKZwAL1tipGWckLo9hqHfT6m9Y1BvvDqNpMxejs++z0VMI4+YDHi/C3
	 xySDjuVrimXyRBKD+mWwYx8msL5n7HfqfST2lXben+8rQbgNTHXXD5FhIGrB2o7uFAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WN8q0EPz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C74606A88B;
	Mon, 16 Nov 2026 15:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C74606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WN8q0EPz
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5d79:c700:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3A689205A37;
	Mon, 16 Nov 2026 16:19:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rd2zyJilYjFw4tOP2AzLIflkG29Q4wi4nRr7XMCt7/E=;
	b=WN8q0EPzbQfONfuwu9pEdJPp7H3cv8YtEgtgd6s4US8+LjQQ6HdihGc+X7A88Zj5GYfVdb
	ZUcsVlu8KKBGM8f2pV+0lQiUcjeOcsxGAj8hKj/UWFB0F0dbcSlBPqxXCE59aRDYVimtnV
	skyHviDP1AbMuUtPgJVAvqsykN1eaL59z+LeSO7g017Kv5BM8aeZMjHyTZXgyN+3KzK8G5
	Jrnej5l3pcFG/7QM4nbDFp8dYAAoUeuIvozw+C116ZeN9okj29VLGjioVrT561UQoSjvIS
	uNAbafWA1GbrtNVwvKWzgZ/JwFa4k9EFBUDycxYz98rGCn92MIFgH6He0+cmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rd2zyJilYjFw4tOP2AzLIflkG29Q4wi4nRr7XMCt7/E=;
	b=HQZdLNVkRqrZ2sKx7Z5W+hbZP2RiL4LVYC4lyuLUrxWCHKZDCNu6zIDC1nnhtOb+9e93Dp
	vNirew2WR3Xqz0rVLSvaJ7l+9D6gW/o2R79SamKB3EVVxFPIwXGe6TlSb8EDfTtotbWg0W
	9wt2eXG0X2VwQCzzQdGRpWvv5C332gxVrsycx9aIBGN5lezp41tLqVZfw9U/9lz51ninX+
	uWkLdw7yl/U9EH1ChI9738/ZqgM4bdCKCdXEUXXHftPPxMMMz/j3uoTstjMtN0oNlchcfY
	KC+UThLHJ2Cn/ILohOh6D3L/ccHQ5jsxf4zzzE1UT1DR4xNrziTstrM1wkYyIw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794842371; a=rsa-sha256;
	cv=none;
	b=d6pFEoMgRO1wFchoPcYu3Xzt4o1Mw8R6qXtKkOEgtZzNnfzFM1je0DGdD7BHW6xgICHfM1
	VP8yEaGvi2MgGuUJ0xGAMaqblBQBAMslltZMA49+r/nf2A2T+71bQCVJFqPzPMyFM6A8r/
	KN1flo01ZA7s93l48snEdqUoEnEcAbz6U6Q7WjUrJqtbFhQAHtGPMyUWuPs9sMITOH/wz/
	1txgyZq03Bd6WVr1Qw54Rvf7+M2i6+i2YKXvtgxRE3dv1IX3NwJEV3uDI3v4hYh2kscYa/
	eY1CDp9GUL3ieaq3NDAgRs5SW6eIepFrNMug83PSBKZK+YGdRhIwgGKtFLyRNg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 16 Nov 2026 16:19:05 +0100
Subject: [PATCH v4 5/9] media: synopsys: hdmirx: give the signal lock wait
 a real timeout
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-hdmirx-media-v4-5-7aee4a0a273e@pengutronix.de>
References: <20261116-hdmirx-media-v4-0-7aee4a0a273e@pengutronix.de>
In-Reply-To: <20261116-hdmirx-media-v4-0-7aee4a0a273e@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dingxian Wen <shawn.wen@rock-chips.com>, 
 Shreeya Patel <shreeya.patel@collabora.com>
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842349; l=3994;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=UT49cdyNSBpVuS6m+1wGrxCpnQCMpdB2pfULsa/lI3I=;
 b=ztu+j3oDMZdudI50jq1CA4yd0a1nOpAvkYnATjC3ZvOadm0v4RwAk6PQGOKUwDKtheoqb2WwZ
 zwCRFTsK/lODwE4J7gIASsXLQJk/WwaGa8DE6Lb9ky79WI04/zfJ2vv
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

From: Gerald Loacker <gerald.loacker@wolfvision.net>

hdmirx_wait_signal_lock() bounded itself by a count of 300 iterations.
How long that came to depended on the debounce inside
tx_5v_power_present(), which the loop calls once per iteration and which
sleeps about 7ms of it, so the effective timeout was around two seconds
by accident rather than by design.

That accident is about to go away. A later patch in this series takes the
5V state from an upstream subdev where the board has no hpd-gpios, which
leaves tx_5v_power_present() a plain read of a flag costing microseconds.
The same 300 iterations would then be over in a few milliseconds and the
wait would give up almost immediately.

Poll on a fixed 10ms interval against an explicit three second deadline.
Check the deadline after the 5V test so a disconnect is still reported as
-ENOLINK rather than a timeout, and report the timeout as -ETIMEDOUT; the
sole caller only tests for non-zero, so neither is a change in behaviour.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 40 +++++++++++++++-------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 11efa08c48290..d8a22700003b0 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -2149,13 +2149,25 @@ static irqreturn_t hdmirx_dma_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/*
+ * Wait for the HDMI signal to lock: TMDS clock detection and ratio
+ * configuration, then PHY and CMU lock, then DMA lock.
+ *
+ * The wait used to be bounded by a count of 300 iterations. What that came
+ * to in wall clock time was decided by the debounce inside
+ * tx_5v_power_present(), which is called once per iteration and sleeps
+ * about 7ms of it, so the real timeout was an accident of how 5V happens to
+ * be sensed. Poll on a fixed interval against an explicit deadline instead.
+ */
 static int hdmirx_wait_signal_lock(struct snps_hdmirx_dev *hdmirx_dev)
 {
 	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
 	u32 mu_status, scdc_status, dma_st10, cmu_st;
-	u32 i;
+	unsigned long timeout;
+
+	timeout = jiffies + msecs_to_jiffies(3000);
 
-	for (i = 0; i < 300; i++) {
+	for (;;) {
 		mu_status = hdmirx_readl(hdmirx_dev, MAINUNIT_STATUS);
 		scdc_status = hdmirx_readl(hdmirx_dev, SCDC_REGBANK_STATUS3);
 		dma_st10 = hdmirx_readl(hdmirx_dev, DMA_STATUS10);
@@ -2169,21 +2181,25 @@ static int hdmirx_wait_signal_lock(struct snps_hdmirx_dev *hdmirx_dev)
 		if (!tx_5v_power_present(hdmirx_dev)) {
 			v4l2_dbg(1, debug, v4l2_dev,
 				 "%s: HDMI pull out, return\n", __func__);
-			return -1;
+			return -ENOLINK;
 		}
 
-		hdmirx_tmds_clk_ratio_config(hdmirx_dev);
-	}
+		if (time_after(jiffies, timeout)) {
+			v4l2_err(v4l2_dev,
+				 "%s: signal not lock, tmds_clk_ratio:%d\n",
+				 __func__, hdmirx_dev->tmds_clk_ratio);
+			v4l2_err(v4l2_dev,
+				 "%s: mu_st:%#x, scdc_st:%#x, dma_st10:%#x, cmu_st:%#x\n",
+				 __func__, mu_status, scdc_status, dma_st10,
+				 cmu_st);
+			return -ETIMEDOUT;
+		}
 
-	if (i == 300) {
-		v4l2_err(v4l2_dev, "%s: signal not lock, tmds_clk_ratio:%d\n",
-			 __func__, hdmirx_dev->tmds_clk_ratio);
-		v4l2_err(v4l2_dev, "%s: mu_st:%#x, scdc_st:%#x, dma_st10:%#x\n",
-			 __func__, mu_status, scdc_status, dma_st10);
-		return -1;
+		hdmirx_tmds_clk_ratio_config(hdmirx_dev);
+		usleep_range(10000, 11000);
 	}
 
-	v4l2_dbg(1, debug, v4l2_dev, "%s: signal lock ok, i:%d\n", __func__, i);
+	v4l2_dbg(1, debug, v4l2_dev, "%s: signal lock ok\n", __func__);
 	hdmirx_writel(hdmirx_dev, GLOBAL_SWRESET_REQUEST, DATAPATH_SWRESETREQ);
 
 	reinit_completion(&hdmirx_dev->avi_pkt_rcv);

-- 
2.47.3

