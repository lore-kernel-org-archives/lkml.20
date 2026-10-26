Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042222;
	b=Oi1DdtOaVgodj4vNKKH4hKRqfa8yNWyCGF5JP6SU/FQTjHYZNjjvMNE4f76oW+JrfBDA
	 MkOnC9iV0JR15xdivXEQDSqGTyT0PCbCd0BFYRjzPbNpJqX46YjxXSNCMkjfJijBMezI/
	 Qo9A0c60CqlZAyOXrnDhnzpT2c9Z0LeMYlzBFeKX81vqiOcdO24Gk4zdi6DFQx4GHaY5+
	 JoGebNo9n9uhZ85SJA7BAks2GqvHlVd3vzAjVDrAgI+pvfI+fhU+/c1P6W4Fim5BfLqUQ
	 ytlABVbqN4eR3U6mbw3Lvn6bf3p+3o+qVs6BJdAlDn1G0SxQIFepsXyrfDzRx2A9Lyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WdThmBOVOa/w02fpgl/UlhgNCKZr6lsQOjRvfRo8f+I=;
	b=ojUX6z8hSA5c8SHgJLMMx4PRtr2XMELBzSALlq0iA7oGLi7SU5XL+CYBf7y3CzSyY+7S
	 U8oFo0Kw76e5SfbN8Dusd4W+JSIpbXqjpOi6+8D2O1T7/4uaULd8Y7YstJLCzAHOj+Q3V
	 2dcqzKSZrS8uIJumVPDZ2LQUZBHBKNf5DJ2rJpGdaH+QY9ks8vo/ZGZk6pBN471Xy0l8s
	 9b5/2rHN5WeQ2VoMTcUQwMDZTYk1+VHLzshu5/yTlZL/rCAzu/5tD2RFItvfXZmATJrBO
	 4XzOZU/71p9nrXOh6ZTJO7B4CNoPI4Rd6SUA92g3+0N5MK63mvKVyW0H1qsbZxsglLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Wn+ynz/z";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6CA60A2620
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C6CA60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wn+ynz/z
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-369f3e9e431so197482eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793042221; x=1793647021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WdThmBOVOa/w02fpgl/UlhgNCKZr6lsQOjRvfRo8f+I=;
        b=Wn+ynz/ze+tWMff50YHvXcriaTS+EOt5Gsnn8yTZ85tH/OdaIRYozu7NAl/ALMI/YL
         h8J7UnLbxEYJv/0z21qnqy7DhPizHXsjzBw1C7uISfKVskYXDkysOEXguwv61mVss126
         8+QqOv0OYhTTub+YvN7r7HLQ19W7TKjkYjsUUDtB3rH7K/3Jg7rRPTPvJSw1r+973fjg
         pFQym3P8PA5QSI6kVmA3B0XPy8lGDq8CSemtYM5xxYeiWG3w+P2EqA+y83RTAiPN5/NJ
         qXKygdizLU7eKhkxk+AtWIfzp71a6k7ops8/LQ0SVvl11qAnZY23mJvz9F9LsqBg/zAM
         pT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042221; x=1793647021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WdThmBOVOa/w02fpgl/UlhgNCKZr6lsQOjRvfRo8f+I=;
        b=fereGj3qFxaZz1E6jjuDgW/DW3Q0OVJC877iue7t85FuJZAugdkLJMEOiXR++Y83mA
         F5BI+37qVZD32ElyRjHXhSQC4tviIQ8UiCL9m13Xnok9XmtUkq4fKjGHGe5gXSWzoVWB
         RE0BiXCVhmqLVihgHk85PprFF657osNkT6H8G/qP8qukMSxx+O6ziPSpB6QpRE4bH+tH
         DyHKPm9YksDzoZgbkTauRtvXgjrG0gQeCjQ3sVV334c3S8GbxG51kA3UhD+eK3moRZVX
         5n8nzKD6kJG0ZaeG+B8g9TNSHV5MmDaztlrtfFjhSCIBGYhp2lTVL8FgIGGNseei0vvV
         IkBQ==
X-Forwarded-Encrypted: i=1; AKwUvBymXx42NXI4m05CCwvPhyqOvX7b3z84kmr5Y0yWzGzKAMVPQfY4hUoc8XIpsi/FfuDx3gDFvrutlPGcvtM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiPjBiWBPYyNYyI39fLqNds1pHWNKDpJAqmLN369wjYpNyG/zh
	TSdIfFEN/VDxj79wR0Iw9Ynxzw3KRIajnlnnsHZNzSu9hKxERHJ00oyg
X-Gm-Gg: AYBFou1Txl/me5fo40sgG05kqkdO40556oLG75huGM1w0+EmeGD35bGvjvoovhgn/Ee
	ZiYTHu3LhQINXx1h7wLxPubzerhhpvN3mziolQilu7EY8L96BzIkFxW18lNgolNGnYjezbkA9Z0
	0O3oNphS2yMGp/bn6T1rvxMm374FUHkSHwiBl3kLTRPSzlLl2MaODTjhbQlZGi+YWUQFiSyndqp
	gRfIpL1qubXjsQOC32H9bRlIiM2hi4nZYXrGgW2EazO2uX0CteeaYL6N4pOKy76Sra2DNCfkBWG
	h36y84VbvGskw+NziZvC591hwP+P+ExxsrvEX+VFw+/fAVBPhkkqyeD8SFSUMtyOBoGy5mNfevZ
	D/r/5e6BF/ARRX0QUUhVcgKWcu6u50b5iQB2Qal2IF9PbfWZMsH+XHp8x/LD5dCg2fc4s+OmsYX
	eiAIv/W6rAg7+56nGvbziJ59Y0cZ3sWf3L6iiXilATOuI+oe34OVzCk3xpxk8+7wcxvFa2raycO
	Vpl8PHBDIkN+2N32IMAe2oBke7XmZJj9AppSSGS6flhs+MP5WrmHkOFj+LVvHS5UDsCywu4z0xl
	J0c2Bxf7zQQI+8REycet+QqfuGVxW8uFImpiS7DgoC1Af0UxsvUs8qB9ZOImXkxeZ++NXw==
X-Received: by 2002:a05:7300:bf13:b0:369:fa21:ba12 with SMTP id 5a478bee46e88-36a0f7df5ecmr573256eec.7.1793042220482;
        Mon, 26 Oct 2026 12:17:00 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm25348449eec.21.2026.10.26.12.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:17:00 -0700 (PDT)
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
Subject: [PATCH v3 4/4] drm/vc4: dsi: Recover from a timed-out transfer
Date: Mon, 26 Oct 2026 12:14:58 -0700
Message-ID: <20261026191618.9430-5-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026191618.9430-1-henryzhang62@gmail.com>
References: <20261026191618.9430-1-henryzhang62@gmail.com>
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
timings are programmed. Before resetting, wait for the interrupt
handler, so that a late completion interrupt of the timed-out transfer
cannot complete the next one, and mask the interrupts until the AFE is
out of reset: the error interrupts otherwise fire continuously while it
is held in reset. The timed-out message is not resent, as it may already
have been executed by the peripheral; the error is returned and the
caller decides whether to retry.

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
 drivers/gpu/drm/vc4/vc4_dsi.c | 130 ++++++++++++++++++++++++++++++++--
 1 file changed, 123 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index ea3a6d06b..42f50d2ca 100644
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
@@ -1374,6 +1378,114 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
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
+	 * The completion interrupt of the timed-out transfer may still be
+	 * in flight; let it finish so that it cannot complete the next one.
+	 */
+	synchronize_irq(dsi->irq);
+	vc4_dsi_reset_and_restore(dsi);
+	DSI_PORT_WRITE(DISP0_CTRL, disp0_ctrl);
+
+	return ret;
+}
+
 static const struct component_ops vc4_dsi_ops;
 static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
 			       struct mipi_dsi_device *device)
@@ -1743,14 +1855,18 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
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

