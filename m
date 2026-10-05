Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ED3486E5A;
	Mon,  5 Oct 2026 13:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206921; cv=pass; b=HiIId7di7cThUoxuvbP4blnNOOsm8aOiQ55VYW07J1maousxQrUC8cZT9pH5l+Ih1rGdzBdv3PrV03EYqB4qNLpOI7QTo9OQo/uZiUi1qq9zMGvGwWMZgE5S3E7excM7dZaFdPpB5cjd70k/nWQivi2fDJkvtQd/aI7m1Fu33yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206921; c=relaxed/simple;
	bh=ST0yT565DoLHspx1LKRi2YsAmCKXCYLwKV5kySgKz/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TrPLMlijBG+FaYIA9SlkUFrwH4HFCXRkXR6dHaR2tye2T1E03nUYSk+TQJogiwsoGIr+KHXFDa5FZv4AXvPy/SEqjaBfxGuu3377UA2p3Y3KVoj9ldb6efcLqD1uCAkSnt4K5E/FXMmskT8af1whI6aeJCgWFNeN9Lo+cNUlt7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=deUNHClg; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="deUNHClg"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B04C720234A;
	Mon, 05 Oct 2026 15:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791206902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cmM+lOd7Zb879j6Oyb3zQljYqWCMVtrkOcRUREsM4BA=;
	b=deUNHClgmvKL980dv60y8Y7tSG2Iuj6wZWGpLX55wGbhvZGt7in9g7/QBxGNrcLSeWC9Hg
	aBZKu0w+jYGHV6DhG9yz5Fls7e+nqu9dqD7CJYt+9yIuxl8gf/6fyVaOOm7exEgxtd6dTz
	OcJs6/+vrJqS5DkLd4IKeuMS/fX9lE+/UnqU8RGV1MrGvp9ZiD7HTqtX/8WVIqQB1CGHE2
	shE6UjjsVIS4ZmLFhIrb6sdGj/SbJCRCYY4jDJFSb6beaDLQtpp+l01iQCS3H0n5VVx3Gf
	q2ShEeDHHv2nHWPa0zGX/mmr2LN9iFq3FTCFpoX5HJzDutwJE7w6GuOtPAHU3A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791206902; a=rsa-sha256;
	cv=none;
	b=E0GOeokqVv17jW5bwJA+yESl2DNBnEZpLIVGgzEZQ9Pc3r+sOlv/UqlwY5UqyEGJ8f3UNI
	S+s8OFMYJQt0z0foHYwW9V/c2qzGk7Ik1To8UJUdvSgUGtVP20j/fJdylsJbX8P0QS2ngh
	kpAPqRJ5Hceug8tA/1tVkM/yOI2GGiGNpkLSJuJMcnE+woSc8pe9Vg7nSCaaNrtntOMBIx
	Tt4XOB9+R3K7sMwBDd7R+pl2q3BfvQx3mE3b4k3Eml9GOhbE4PZzlUApSOgqNryteSfIC2
	Y19oSzZUww8F+oEwiKb0yVFB/JKHoLLuQGO6EAZSIUihDQKIKhtG9LUigY3A3w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791206902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cmM+lOd7Zb879j6Oyb3zQljYqWCMVtrkOcRUREsM4BA=;
	b=CZk9enV698VEyEQxQ4cCaJ+0xojnOHcibufTkDYqymzOZFIsN9fO1/8R51LEINUto1QPKt
	r7MmGUNc6XjukyRk7hmvjx2IR5zs89JOQtV4bbYuxHM7G7hpRgNsrSvqTlDc4ZZuxqYDXW
	cGgcaBbPaLm9Go7b/apYoes4eVnKyWK6QaSdQyr19ocoQ+jhF+oceS32dJmx6wGE/qFt8p
	rV+j9Uwb0f961GPQ6iAwffdYhxLGBCEM2uDpUhyIXniXnJakrAUfztrrqs4P/svHSqkp+v
	ylQ/hBiWO2ifiW7W5G5JZpGrvGeX4VdA3Z1msJRlCW72VXfNEUh6em+YastReg==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 05 Oct 2026 15:28:25 +0200
Subject: [PATCH v3 06/10] media: synopsys: hdmirx: give the signal lock
 wait a real timeout
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-hdmirx-media-v3-6-71a11a2e3e76@pengutronix.de>
References: <20261005-hdmirx-media-v3-0-71a11a2e3e76@pengutronix.de>
In-Reply-To: <20261005-hdmirx-media-v3-0-71a11a2e3e76@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791206902; l=3953;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=+wnhkTfrIqSXdn8BOyKibs4Gz86qbZhWOO9zUeR7O2U=;
 b=w2m/Kes1y8f1eHA76OW/JLnu1LmRdPQLkdApLld9cmyUQdkzB6DC+bHoQjoSPupBPepZhu2GY
 cFKg6BfzGzaAJS3I5NvMkqDcM13fmCbFP/PrkmspdTTTsEdJoAhq/Yk
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

Assisted-by: LLM
Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 40 +++++++++++++++-------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 6231bb28616c1..a28eb86e0b83c 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -2129,13 +2129,25 @@ static irqreturn_t hdmirx_dma_irq_handler(int irq, void *dev_id)
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
@@ -2149,21 +2161,25 @@ static int hdmirx_wait_signal_lock(struct snps_hdmirx_dev *hdmirx_dev)
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

