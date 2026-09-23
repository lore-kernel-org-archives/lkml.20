Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917DD5326BE;
	Wed, 23 Sep 2026 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171120; cv=pass; b=btd6RN9OsxIQLgi6BlfI+CUrL2Rc0q/juUpt+tIcP71UFJhOt9PLI1dDZkQmBISJLm6kTjVeye/d6yK6Q0TRS5IGwhmrRo+kgGIG61Q0RaRJ/UV3uKUSc8h3910irD/JaddiMoBNO2CmPX0vf5X7zV0s4wykwXjpUujeVCJCbSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171120; c=relaxed/simple;
	bh=4kWiazAr75BVDRtz1SnxWmp8mUluqiTz7KuBffGL3OI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oMo24J4aSYKUR8ICaW9xXOoGc2td0KWCn6SacMgg6M66a2HKwPM6MRTLOb9IAqs8pa3qTxIAqKQrMCW2Kxp6W5ETy6j6qcCva7oMuMzUQK1hdj5YQbUc2wzLk2Qrg/ye2X+IJCSddF3Qdv2/quwmQiBL7t+n6mqptUzQDuKxA8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=SUPAd0Pu; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="SUPAd0Pu"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 87083201A8D;
	Wed, 23 Sep 2026 15:45:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wIDtAWSuo3acxuuYHq+f4Byw1UkvfAjrADlZkEtCpiU=;
	b=SUPAd0PuEPQ90/PdDCn7FOfqfEiZURbjEazLgwHBa4vAfLIZHtrP7t7BdkFDomeOo9zh5P
	Om2RP9bHYFuqM5WmZJz0aQuy+Mv5pCn2o5aqdUOTNdZ530rJWmqrgK5GqTR4gBHk0LTVrF
	r/mfnJSG5ujBqx5+5rEE+DmDiZlgqH4URfbNRQngFWUFMfpbK5i0Zn6WWimhmNflJaJ/gi
	xulcTVbYZ/CCOJGMbr+3JEDpFQ/JXug3LbFSKD1b1ARA1H0/VbS2tK/uQpQX5S3SU4Qqnw
	QrREZWlcqELoswpc9eRSkx96xlxi8XiLNO0JHf4DVe5Ic7Z/6nry0H25edXtSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wIDtAWSuo3acxuuYHq+f4Byw1UkvfAjrADlZkEtCpiU=;
	b=D9DWJemIv9SJJCArDUzGBUc6irYjj0huNqQF5ad72le920hYO17WDhf8YgKxSARvY5/e6z
	4LOQlT0TvY+j9f9Mk2NuIEiF3QPFL0Z7/SyQu0nFR7LR3pk9oYmWQejCFZE7knJ2nt05xQ
	2iG0IloPpuIEeqnWHjsAkYkNYEgIPnftp8WAj+g9eZOlbK6GD6njY0OtHhtzsNMEL06VmX
	1HxwGZuCd9qD64AUHyfei/xsoaVMPH7B1N/9snhVOy7vY0FA7ES5MLZ3HOyZFzWYfeIwxt
	BXIXV9aWZSiQ7vFgzuFAAXgfh3kBv2Kvb0Ir6ijiMQQvmLFclwGUVQO964W0zA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790171112; a=rsa-sha256;
	cv=none;
	b=G+8+3Y75/gktW4wAkfZBTIFPERsM7exbR9e5IqjnoDd8VQXvvSxeOKAHAWyfxgAgAgmV7m
	3aw2OHQyb4FmpmDMcAMBKNdA+tbY98yhT9exn3oHcG1lzUPq/8aFUqSm390IeV7ocyb1bZ
	kRQg/QJIDvBKF0TIcAlxZAv2Z2EmS2K0qqHFk7l+gE6O5WDgTSbM0r8vHIGu6iUVn5UGbJ
	YALdvB7Y6ITuhm0240f5tM9ee4trmNvw4jIyU15NgaCY1iF2zEvhBQ1v68qnu9V3aNR6T+
	0RNrJ64z/gvaqhjSIsFuqaJo1JItA6+H98dyR4EfAmA/+Si2TTh6NwGjA0r+Yw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 23 Sep 2026 15:44:44 +0200
Subject: [PATCH 5/9] media: synopsys: hdmirx: give the signal lock wait a
 real timeout
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hdmirx-media-v1-5-ea3d77d4a5f3@pengutronix.de>
References: <20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de>
In-Reply-To: <20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790171091; l=3970;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=EdQuUrFKGXdLgynOwcCftYo1HL2jXpjohXhNm96s0fE=;
 b=2D/gPne5B26EmBkSiOm9E9uZsev68no2NJycZqwExqoYU6wWmZcveUCZGnBmXKYGxuScoWN+Z
 fLM6JyfOMFYCH0aBEWeZGuX5A5zsMd140uXM7n2X+NTmidGUTzvMy8V
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
index 0c7cac25bf694..8c6b04425c8a9 100644
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

