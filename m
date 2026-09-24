Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44ED47F3CE;
	Thu, 24 Sep 2026 12:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251573; cv=pass; b=n0UXZm/8TgELz2rufdKJKEmlUCyCyPQevcb4WnD6Y2ktLHyFDb58DoaW5nC0opDLSGnAM6UPijkPE+Ljca2cvFBWBPCrtzc7bhqWtQBIK40bcSntSFSWlHfyihKjyR9G1BJA9wZeGZJoWpdErjpS+6jucbdVw6o9a7GHKd7KIZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251573; c=relaxed/simple;
	bh=d8mkg5xHqBVJd/+OAcCCmrGfIWtwBQsBozU015Qzeis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XPC/lCALeBkvh9GJBLosbujHoPd5G+dYJ8EoZSvFBbTPbIK9CduVULOTTDKsvMrmY7ygUy7sRLhPL8TDktTTm/4o/PiM9S9Ch981BbR6FI/DIPv+GLGzhxa9sn/6DViwh6bp98pY2SfCEiOGwdPOfxszgNp3ECnOpBGhNoU00yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=KuofrP7P; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="KuofrP7P"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 493D8202146;
	Thu, 24 Sep 2026 14:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OEJ46ggGZWe0oK3mgVswoMNXQd3lYnmiKqKpdz18DF0=;
	b=KuofrP7P/LYm+qp2dHicW0mfuqSV9qtUFePorYaRn+gwTFtzvAgC2yMk5a+FxYmuE1gsEB
	2ZV+knn1nDg9VMV50HPW0ItQB338ompWtzfMXljNh4SLMyqTkWcuPKou1QNJNy5keqeZc/
	nUecSQdRDLpiGDpBbG7D9Csg5xYo0f9yL9enPSMXk82AUFpfuPWA1ndGgQhOeRuWhh7tFI
	pDIzEePl2iY/bU8sWitjdOuP2Sww9N9H/tBayCbBrFHKaTo7eT9+CWeFiP5mHcEz6vtnpk
	V6O0eQJ6O3R5UiqmMgBS3v8RExuA32JfIODZ7e8eKcB8vpUhFjwrcY4qlBDRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OEJ46ggGZWe0oK3mgVswoMNXQd3lYnmiKqKpdz18DF0=;
	b=D3n0ivvZ3B0J90AM2uVLT2EQQWKMt4ljPzRdfhMzmGqIXevZbo1OvyU3i/XRzcwteVAx7F
	3I4z7tp1aWeFyOFhzuTLSNMYnayy4Fz4h9PwZBCDSeB4s+b6jdZ6nxRwk27zX7SSDeuvCo
	rvZx5gsduaU6ivcoDdyCi0qlEyfXjbNVEuv6HnWW4ep6/TXpMORL7WnxVQkJxDLJDz2zSj
	AxfKs4jgHyvdQHLEcLmekqSmUTWMgQbBc9abdRYV6ev5LNqJe18/ACmQUe7adrPrgdZYsX
	7dBYKeOUdab7l8qp9ddxzGpfSqtWQFPpM8aZuvillWwsQsLGNRoQelGZLLlHug==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790251558; a=rsa-sha256;
	cv=none;
	b=Frtvpck3tfE6bOlQx8S6kDFarE/HTC0dNZXlfGTFsc8OIdNdw7QQ22uXjGq06JUeLp1+kF
	b1X5CWkz/EnB43ykizN4W289bacKQ8xMOPPGlSz0H3qarpik0EgSxpyrpBr0OSjP8rfjWl
	JB9K95H7OHVtDbePnfqPvIFKYoyCToU0Xsz1Dud1ON1LjSQaP6J3CvydXD6LJqiMnFYuQ8
	p4KetEKO/vqwuATfzg32VzUTjIpIkqaALs/0p2PHkweWlUBzD9Hgph8pMJ8ZH05lPTYQ2J
	d/1Ybk4ABrdiVoEgmdyA+PiJWPFD87SxbPihnvFpILNNOiufr8+IIRg1ovUsrQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 24 Sep 2026 14:05:59 +0200
Subject: [PATCH v2 5/9] media: synopsys: hdmirx: give the signal lock wait
 a real timeout
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-hdmirx-media-v2-5-c12f641d8b0f@pengutronix.de>
References: <20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de>
In-Reply-To: <20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790251557; l=3970;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=0hHdQ+VWpFV0ycvFYU3V1hB2DnTx7fiQV8RNjs7P0AA=;
 b=xjYzqQq5Dw1gWPZ7BY4AGLJSuJacJsq0DmrUIMiNV6ykipyrFE2bbnZgxCLJtIuBwPqh05aAa
 uO7mJxmOyGLA4I7+rkSIhBJzVOw50qdUSCw++Fnn1FUtVZbfhgkvkaQ
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

Assisted-by: Claude:claude-opus-5
Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 40 +++++++++++++++-------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index d80143347fe0c..9af1e71afb4e5 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -2133,13 +2133,25 @@ static irqreturn_t hdmirx_dma_irq_handler(int irq, void *dev_id)
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
@@ -2153,21 +2165,25 @@ static int hdmirx_wait_signal_lock(struct snps_hdmirx_dev *hdmirx_dev)
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

