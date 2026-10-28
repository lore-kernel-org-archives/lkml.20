Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205981;
	b=YAhhGaHF+TgAkzFRKz2kzDunGiK5PSQsGb/TmPEPnh7QKQGsO0ffDLHkc+XQXPAox6Dl
	 tsS6XqMYrbgVM1S2H9X2R6SojtqrSLeuM+sCYzNDc1w31T+Da0b56zog108U2+8FTa9Ge
	 gZ+x0dvEz5ajIID9eOmg5vvh2tzZDtjkBl3CB1bLvB2cONR2zMqTxdVLAAX68t2glIDOD
	 FGEgjdOcNEYgc6n9slzugh+eWPkZWAsll7ZeqG90f4lZQG+w7WdvpZ2FbxlNn6ClRS1sd
	 TpW/Bw05AEX6XiRD+SGGRey8ourAa6OYwlxlRVj+cmPbjJ2MHI+Cf5tjv5B/xEuJD0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZvvTNxs/XacaQ2La3iLx1ZfStPcFYBL7y25+anBmgsc=;
	b=tUhQkEzik0AWJNnBS7EhT7CDXUOX62NDPkY2SJLphC3lqkSH8iYDPZQbaLJ1TuKsOzCi
	 rfhvF8qzSWaIsJOFp+SBDQQnuNCwd7y0ZeD0c3y2izwzpAeqiFHMxmb/QKiKfKTbDigir
	 hpceFFPwHEWgV5prn3VKZThDfQ7HHr0WiTp5ZoiuHP3MhxP9sR7/8s6dQGyfRpm/orKW6
	 2/aL0uoXmVoETLEae8aK60AMK58GVlwCORAGhuX+zIHoc8YiegQMKcRj1HjgLnIWCS+KN
	 Ky6EiH23rt9JBnFg3yVwYEsd1zid99Nh1P+8307i0FPmErCDVmjE7NBAoDpalMUTfVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0mnWVRl+;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B1D60A2602
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B1D60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0mnWVRl+
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35829219da8so2852011eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793205980; x=1793810780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvvTNxs/XacaQ2La3iLx1ZfStPcFYBL7y25+anBmgsc=;
        b=0mnWVRl+wjXPGpvQWg56PuynnxaZ0piovY5T3vN+X8Kbhh07hPN46CHJ2x0Wbq2rK4
         ANv3Wc+TnjlKanK0BZGIL74O6FWN6jZfMJHYSIfly8xLHOkbKFWuANG5YGSJwPlFnYdw
         w0FRRbJbn0frJv9/wGZDG5nLRFhR2IQ0X0+gl3pOooe5kvAd8mNgygBQ1aj22Eu5nlJs
         CTjxqzGjVPQOC6Lw8czNkhCfWGfiA/VtEu+uLeGEGZ6QSQdkKoZP4MqncFUVZSIhMC2k
         J81GOzUw8gOQ7e9W1s0Rqwacq54h76j2fhogRGvdbJGRkrTti6aUHM9Dn/LqQT2zfMK7
         z3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205980; x=1793810780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZvvTNxs/XacaQ2La3iLx1ZfStPcFYBL7y25+anBmgsc=;
        b=qFXEQAbWfdzomYDKxGSszlDjQyrjdb0hSNbxDQl7DaTYeTDGIecdC9lPHHJ0Tn/nR7
         e6THaZFJTB5vSjA0oLetRe3qxDTdcYmpuWXvExWUrG/IW0qzEZEO0/JySsb6HXUnW3A8
         TqvzDZY9JKl2AvEqGkWRRv495Gpi8uEuA1WC1XK9vwKeQblZfDbW2+SK71qibQLQ2dwD
         1nfW8iCPU6UNf6Tqwjq0dSU8h4TpejcaCTVKfkGoh02rUhybRCZI6HuEzMEaqrSRtPwE
         u/nSv8H5TFfAiPXVdt+k9sQo6Bc68WrPAHhInULAQpP/Beb2yuUG5Lfm2teibfliSwAN
         KK4A==
X-Forwarded-Encrypted: i=1; AKwUvBwWzFh2B1T1mKjmOANTv/Vj6q3Avl6XWbTPtA8ePQ6/O3GJboLj0RZK/ZvdTFItVmdtw0eLxIlJ9REoO6w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKauO7AofQk3Btj73yBJn+dWZ3NwOapUqUhAtNYB9LVRq1fYaXL
	TCcObKiSauLGm53RY+p6yCfv2JAkaAUXzBashqiI9ZxVBBLOtGlif989
X-Gm-Gg: AYBFou2aReM3MVWDwBsX/x8mN4eo2LtHFaUVcgVVwILGvTpypAdNCJknfaQt2AFk6W0
	3xD/tqX5g25BTnFJ6+J/WPjMOYF8A8+POtkT99OZv8WjUJ+HQANcMl8AWPZEbD1Dg+rI3Q1QbMs
	JRwH9vdNNknf2k8RbccWzTEc8OxwaYphykgbH68TmVESUjhhtoYKMLwyUe0XAzEOmK2f/JpfGgu
	ul9vy6mHuT0VopqRqI0ME6X+0/6Jin5anhlje0xh1CloDsp5SxR90QaXasRD3qpT7KbqlQ6Zs5d
	EBPMHTwxHFV36WJ4IpRKweD5ltpwdtEtbegkuA3uyX/xi2K118k9FccO8rNqsEMG4drTizaUhBQ
	DciNYDAO9O+483alekMhCBicPVle2A9gdOUeuR1SEWs/qwi8s3Mdx1YXaOA/uzJao/+rDSCCD8l
	kSA5dsV7vEEPXr6misNVpKuP4BVm+sUlZAXW44Sg8KDPB9Swr4A8mojSP/409F8U+bWPXsLEyr3
	RTgYK5XHGCKGdJq5beyxoTHs0UmglbsQ7NqQQga0Na/v3BR1+dx1rQilbSaW1eapcbKdBRihar0
	BnNp5ImrDctzcEs9pT0ygJZY25wLRQAWLv1WPyMTQLHjFCYQoNRjHi6ZalPBPYxj536rXY8=
X-Received: by 2002:a05:693c:6384:10b0:36a:60f:3e9c with SMTP id 5a478bee46e88-36a2fc08c95mr168097eec.0.1793205979475;
        Wed, 28 Oct 2026 09:46:19 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm7821964eec.11.2026.10.28.09.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:46:18 -0700 (PDT)
From: Henry Zhang <henryzhang62@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Henry Zhang <henryzhang62@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] drm/vc4: dsi: Recover from a timed-out transfer
Date: Wed, 28 Oct 2026 09:45:30 -0700
Message-ID: <20261028164539.3471833-6-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028164539.3471833-1-henryzhang62@gmail.com>
References: <20261028164539.3471833-1-henryzhang62@gmail.com>
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

When a transfer times out, vc4_dsi_host_transfer() disables the
command, resets the FIFOs and returns -ETIMEDOUT. That is not always
enough: after an LP receive timeout during a read (the peripheral did
not complete the bus turnaround), every following transfer times out
as well, with no interrupt and STAT reading back 0. Only a modeset,
which goes through post_disable/pre_enable, brings the block back.

Reset the DSI block and its analog front end after a timeout and restore
the configuration programmed in pre_enable, in the same order as
pre_enable: the block is ungated and the AFE released only after the
timings are programmed. Keep the interrupt handler out with
disable_irq() until the block is restored and INT_STAT is cleared, so
that neither a late completion interrupt of the timed-out transfer nor
an error interrupt raised during the reset can complete the next
transfer or run in the middle of the reset. Also mask the interrupts
until the AFE is out of reset: the error interrupts otherwise fire
continuously while it is held in reset. The timed-out message is not
resent, as it may already have been executed by the peripheral; the
error is returned and the caller decides whether to retry.

Only do this while the block is enabled. Between post_disable and
pre_enable the clocks are off and there is nothing to restore; a
transfer then times out as before. The transfer lock keeps the
recovery from running in the middle of pre_enable or post_disable.

This does not prevent the timeouts themselves. With video running,
vc4 does not keep commands within vertical blanking, and transfers can
still time out, sometimes several in a row after a reset. That is a
separate issue.

Signed-off-by: Henry Zhang <henryzhang62@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 136 ++++++++++++++++++++++++++++++++--
 1 file changed, 129 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 3ee6e8e86..6edda74e1 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -601,8 +601,11 @@ struct vc4_dsi {
 	 * bridge enable/disable paths, which reprogram the block.
 	 */
 	struct mutex transfer_lock;
+	/* The block is powered and configured. Protected by transfer_lock. */
+	bool enabled;
 	struct completion xfer_completion;
 	int xfer_result;
+	int irq;
 
 	struct debugfs_regset32 regset;
 };
@@ -826,6 +829,8 @@ static void vc4_dsi_bridge_post_disable(struct drm_bridge *bridge,
 
 	guard(mutex)(&dsi->transfer_lock);
 
+	dsi->enabled = false;
+
 	clk_disable_unprepare(dsi->pll_phy_clock);
 	clk_disable_unprepare(dsi->escape_clock);
 	clk_disable_unprepare(dsi->pixel_clock);
@@ -1151,6 +1156,8 @@ static void vc4_dsi_bridge_pre_enable(struct drm_bridge *bridge,
 		DSI_PORT_WRITE(DISP0_CTRL,
 			       DSI_DISP0_COMMAND_MODE);
 	}
+
+	dsi->enabled = true;
 }
 
 static void vc4_dsi_bridge_enable(struct drm_bridge *bridge,
@@ -1184,10 +1191,9 @@ static int vc4_dsi_bridge_attach(struct drm_bridge *bridge,
 				 &dsi->bridge, flags);
 }
 
-static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
-				     const struct mipi_dsi_msg *msg)
+static ssize_t vc4_dsi_transfer(struct vc4_dsi *dsi,
+				const struct mipi_dsi_msg *msg)
 {
-	struct vc4_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->bridge.dev;
 	struct mipi_dsi_packet packet;
 	u32 pkth = 0, pktc = 0;
@@ -1195,8 +1201,6 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
 	bool is_long = mipi_dsi_packet_format_is_long(msg->type);
 	u32 cmd_fifo_len = 0, pix_fifo_len = 0;
 
-	guard(mutex)(&dsi->transfer_lock);
-
 	mipi_dsi_create_packet(&packet, msg);
 
 	pkth |= VC4_SET_FIELD(packet.header[0], DSI_TXPKT1H_BC_DT);
@@ -1374,6 +1378,120 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
 	return ret;
 }
 
+/*
+ * Reset the DSI block and its analog front end, then restore the
+ * configuration done in pre_enable. Resetting the FIFOs alone does not
+ * clear the state the block can be left in after a transfer timed out
+ * (e.g. on an LP receive timeout): every following transfer then times
+ * out as well, until the next modeset.
+ */
+static void vc4_dsi_reset_and_restore(struct vc4_dsi *dsi)
+{
+	u32 en = dsi->variant->port ? DSI1_CTRL_EN : DSI0_CTRL_CTRL0;
+	u32 ctrl = DSI_PORT_READ(CTRL);
+	u32 afec0 = DSI_PORT_READ(PHY_AFEC0);
+	u32 afec1 = DSI_PORT_READ(PHY_AFEC1);
+	u32 disp0 = DSI_PORT_READ(DISP0_CTRL) & ~DSI_DISP0_ENABLE;
+	u32 disp1 = DSI_PORT_READ(DISP1_CTRL);
+	u32 hstx_to = DSI_PORT_READ(HSTX_TO_CNT);
+	u32 lprx_to = DSI_PORT_READ(LPRX_TO_CNT);
+	u32 ta_to = DSI_PORT_READ(TA_TO_CNT);
+	u32 pr_to = DSI_PORT_READ(PR_TO_CNT);
+	u32 phyc = DSI_PORT_READ(PHYC);
+	u32 clt0 = DSI_PORT_READ(HS_CLT0);
+	u32 clt1 = DSI_PORT_READ(HS_CLT1);
+	u32 clt2 = DSI_PORT_READ(HS_CLT2);
+	u32 dlt3 = DSI_PORT_READ(HS_DLT3);
+	u32 dlt4 = DSI_PORT_READ(HS_DLT4);
+	u32 dlt5 = DSI_PORT_READ(HS_DLT5);
+	u32 dlt6 = DSI_PORT_READ(HS_DLT6);
+	u32 dlt7 = DSI_PORT_READ(HS_DLT7);
+
+	/*
+	 * Mask the interrupts while the block and its AFE are in reset: the
+	 * error interrupts would otherwise fire continuously.
+	 */
+	DSI_PORT_WRITE(INT_EN, 0);
+	DSI_PORT_WRITE(DISP0_CTRL, disp0);
+	DSI_PORT_WRITE(TXPKT1C, 0);
+	DSI_PORT_WRITE(CTRL, DSI_CTRL_SOFT_RESET_CFG |
+		       DSI_PORT_BIT(CTRL_RESET_FIFOS));
+	DSI_PORT_WRITE(PHY_AFEC0, afec0 | DSI_PORT_BIT(PHY_AFEC0_RESET));
+	/* AFEC reset hold time */
+	mdelay(1);
+
+	/*
+	 * Same order as pre_enable: the block stays gated and the AFE in
+	 * reset until the timings are programmed.
+	 */
+	DSI_PORT_WRITE(CTRL, ctrl & ~(DSI_CTRL_CAL_BYTE | en));
+	DSI_PORT_WRITE(STAT, DSI_PORT_READ(STAT));
+	DSI_PORT_WRITE(PHY_AFEC1, afec1);
+	DSI_PORT_WRITE(HS_CLT0, clt0);
+	DSI_PORT_WRITE(HS_CLT1, clt1);
+	DSI_PORT_WRITE(HS_CLT2, clt2);
+	DSI_PORT_WRITE(HS_DLT3, dlt3);
+	DSI_PORT_WRITE(HS_DLT4, dlt4);
+	DSI_PORT_WRITE(HS_DLT5, dlt5);
+	DSI_PORT_WRITE(HS_DLT6, dlt6);
+	DSI_PORT_WRITE(HS_DLT7, dlt7);
+	DSI_PORT_WRITE(PHYC, phyc);
+	DSI_PORT_WRITE(CTRL, ctrl & ~en);
+	DSI_PORT_WRITE(HSTX_TO_CNT, hstx_to);
+	DSI_PORT_WRITE(LPRX_TO_CNT, lprx_to);
+	DSI_PORT_WRITE(TA_TO_CNT, ta_to);
+	DSI_PORT_WRITE(PR_TO_CNT, pr_to);
+	DSI_PORT_WRITE(DISP1_CTRL, disp1);
+	/* Ungate the block. */
+	DSI_PORT_WRITE(CTRL, ctrl);
+	/* Bring AFE out of reset. */
+	DSI_PORT_WRITE(PHY_AFEC0, afec0 & ~DSI_PORT_BIT(PHY_AFEC0_RESET));
+	DSI_PORT_WRITE(DISP0_CTRL, disp0);
+
+	DSI_PORT_WRITE(INT_STAT, DSI_PORT_READ(INT_STAT));
+	DSI_PORT_WRITE(INT_EN, DSI_PORT_BIT(INTERRUPTS_ALWAYS_ENABLED));
+}
+
+static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
+				     const struct mipi_dsi_msg *msg)
+{
+	struct vc4_dsi *dsi = host_to_dsi(host);
+	u32 disp0_ctrl;
+	ssize_t ret;
+
+	guard(mutex)(&dsi->transfer_lock);
+
+	ret = vc4_dsi_transfer(dsi, msg);
+	/* Only a running block can be reset and restored. */
+	if (ret != -ETIMEDOUT || !dsi->enabled)
+		return ret;
+
+	/*
+	 * Leave the block usable for the next transfer. The message is not
+	 * resent: it may already have reached the peripheral, and only the
+	 * caller knows whether it is safe to repeat.
+	 */
+	disp0_ctrl = DSI_PORT_READ(DISP0_CTRL);
+	dev_warn(&dsi->pdev->dev,
+		 "transfer timed out (stat 0x%08x), resetting DSI\n",
+		 DSI_PORT_READ(STAT));
+	/*
+	 * Keep the interrupt handler out until the block is restored and
+	 * INT_STAT is cleared. The error interrupts are still enabled, and
+	 * a handler running during the reset could complete the next
+	 * transfer, or race with the register writes on DSI1 of the
+	 * BCM2835, where both go through the DMA workaround. disable_irq()
+	 * also waits for a late completion interrupt of the timed-out
+	 * transfer.
+	 */
+	disable_irq(dsi->irq);
+	vc4_dsi_reset_and_restore(dsi);
+	DSI_PORT_WRITE(DISP0_CTRL, disp0_ctrl);
+	enable_irq(dsi->irq);
+
+	return ret;
+}
+
 static const struct component_ops vc4_dsi_ops;
 static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
 			       struct mipi_dsi_device *device)
@@ -1743,14 +1861,18 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	/* Clear any existing interrupt state. */
 	DSI_PORT_WRITE(INT_STAT, DSI_PORT_READ(INT_STAT));
 
+	dsi->irq = platform_get_irq(pdev, 0);
+	if (dsi->irq < 0)
+		return dsi->irq;
+
 	if (dsi->reg_dma_mem)
-		ret = devm_request_threaded_irq(dev, platform_get_irq(pdev, 0),
+		ret = devm_request_threaded_irq(dev, dsi->irq,
 						vc4_dsi_irq_defer_to_thread_handler,
 						vc4_dsi_irq_handler,
 						IRQF_ONESHOT,
 						"vc4 dsi", dsi);
 	else
-		ret = devm_request_irq(dev, platform_get_irq(pdev, 0),
+		ret = devm_request_irq(dev, dsi->irq,
 				       vc4_dsi_irq_handler, 0, "vc4 dsi", dsi);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
-- 
2.47.3

