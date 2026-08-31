Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579D0349B1C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788178916; cv=none; b=G19d3fJFEBFQ/oj4P/ncphxr4Wo+ZWRfVqvGmQQCqXKk/07BikebtydShLy0AT+dcF6WFdXv+4K0v8Ufrn5phVM762YC5Ue/XIzv2ZCUsYy5j5VooVGxVbB6T+QMErNpbDc1kOES+pJh/hAxBaba50kOXnFT5V3169VV7rRKy9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788178916; c=relaxed/simple;
	bh=riuvFlBJ34uwuG0g8BG6eW2XovO/sXh5l21IDdcUSD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rO6URQmsIFfgaiLGac977G+eiNgCU9m7Baz2T4ZJbuAFrilZwcbzNb/8OCxg/EalIa9xlQ2HsGODWt+NvtSK9Z+0W/5W3Xt/VLCiKJ7MtM/4LyUZ5UTFlW8dAHRJ3Ov8ltT99hBwl8N5ecoeLhbeSzQKGuhyOnnwEyjNOF86twE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=yRLXBy2E; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="yRLXBy2E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1788178906; x=1788438106;
	bh=WeFHlmiKxBHeot0vI4iTWVjsz4T6sENcTYNltgj3i4Y=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=yRLXBy2EB1l0XdV1FzVbAmlfp4FR+vyly95xTtr4yPr6CCziwb8OPBR9zRWSMEzN7
	 cyhz3iVSy19HZd7yGAP2iw2wletUToPNAAYEmRm7LL189APNPMUp4OGnNFipChVhJb
	 lD3t7J/m9YfUaeT0ri/K0siLP8OmKVm9xyCbOlSTHZ+vRD06EdzvHyZJwCtnJp+7X2
	 DUNBaL5tKIaAfmaKEyBOK0uu05B6iF6ymh3BTzXbwaoGq/6IvTrNauVQc6mHHcLaMf
	 ufEfrITd4rYiheAJOLk1KJKdrp3/PE5rW3o6PZaujyxcyzqMBdm8AYscFo3nCAqLzs
	 LfBNY9mT/Ej7w==
X-Pm-Submission-Id: 4hYSlr38Vwz2ScPH
From: Esben Haabendal <esben@geanix.com>
Date: Mon, 31 Aug 2026 14:21:33 +0200
Subject: [PATCH v5 2/2] drm/bridge: ti-sn65dsi83: Support LVDS Channel B on
 SN65DSI84
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ti-sn65dsi83-fixes-v5-2-e712765d6c4f@geanix.com>
References: <20260831-ti-sn65dsi83-fixes-v5-0-e712765d6c4f@geanix.com>
In-Reply-To: <20260831-ti-sn65dsi83-fixes-v5-0-e712765d6c4f@geanix.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linusw@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, Marek Vasut <marex@denx.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Esben Haabendal <esben@geanix.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788178899; l=3907;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=riuvFlBJ34uwuG0g8BG6eW2XovO/sXh5l21IDdcUSD4=;
 b=znrpJnDcwSl5Akbw/6yaWsOT4OJmg/GliUJu8dOtXPSqETMCeBDT1uqUWe+poKV8GftqZEAC5
 6Crhz1dxtOpASmLu5JHA+Zsf5iHg1M0VXsPGyOLH1x0wGxu4KiQVrn7
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

Add support for using SN65DSI84 in single-link mode with output to LVDS
Channel B.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 9f530cd05d2f..fcbc427947b6 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -11,6 +11,8 @@
  *   = 1x Single-link DSI ~ 2x Single-link or 1x Dual-link LVDS
  *   - Supported
  *   - Dual-link LVDS mode tested
+ *   - Single-link to LVDS Channel A tested
+ *   - Single-link to LVDS Channel B tested
  *   - 2x Single-link LVDS mode unsupported
  *     (should be easy to add by someone who has the HW)
  * - SN65DSI85
@@ -162,7 +164,7 @@ struct sn65dsi83 {
 	struct gpio_desc		*enable_gpio;
 	struct regulator		*vcc;
 	bool				lvds_dual_link;
-	bool				lvds_dual_link_even_odd_swap;
+	bool				lvds_channel_swap;
 	int				lvds_vod_swing_conf[2];
 	int				lvds_term_conf[2];
 	int				irq;
@@ -644,7 +646,7 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 			REG_LVDS_VCOM_CHA_LVDS_VOD_SWING(ctx->lvds_vod_swing_conf[CHANNEL_A]) |
 			REG_LVDS_VCOM_CHB_LVDS_VOD_SWING(ctx->lvds_vod_swing_conf[CHANNEL_B]));
 	regmap_write(ctx->regmap, REG_LVDS_LANE,
-		     (ctx->lvds_dual_link_even_odd_swap ?
+		     (ctx->lvds_channel_swap ?
 		      REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
 		     (ctx->lvds_term_conf[CHANNEL_A] ?
 			  REG_LVDS_LANE_CHA_LVDS_TERM : 0) |
@@ -895,6 +897,7 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 {
 	struct drm_bridge *panel_bridge;
 	struct device *dev = ctx->dev;
+	u32 output_port = 2;
 	int ret;
 
 	ret = sn65dsi83_parse_lvds_endpoint(ctx, CHANNEL_A);
@@ -906,29 +909,38 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 		return ret;
 
 	ctx->lvds_dual_link = false;
-	ctx->lvds_dual_link_even_odd_swap = false;
+	ctx->lvds_channel_swap = false;
 	if (model != MODEL_SN65DSI83) {
-		struct device_node *port2, *port3;
+		struct device_node *port0, *port1, *port2, *port3;
 		int dual_link;
 
+		port0 = of_graph_get_port_by_id(dev->of_node, 0);
+		port1 = of_graph_get_port_by_id(dev->of_node, 1);
 		port2 = of_graph_get_port_by_id(dev->of_node, 2);
 		port3 = of_graph_get_port_by_id(dev->of_node, 3);
 		dual_link = drm_of_lvds_get_dual_link_pixel_order(port2, port3);
-		of_node_put(port2);
-		of_node_put(port3);
 
 		if (dual_link == DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS) {
-			ctx->lvds_dual_link = true;
 			/* Odd pixels to LVDS Channel A, even pixels to B */
-			ctx->lvds_dual_link_even_odd_swap = false;
-		} else if (dual_link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
 			ctx->lvds_dual_link = true;
+		} else if (dual_link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
 			/* Even pixels to LVDS Channel A, odd pixels to B */
-			ctx->lvds_dual_link_even_odd_swap = true;
+			ctx->lvds_dual_link = true;
+			ctx->lvds_channel_swap = true;
+		} else if (port0 && !port1 && port2 && !port3) {
+			/* DSI Channel A to LVDS Channel A */
+		} else if (port0 && !port1 && !port2 && port3) {
+			/* DSI Channel A to LVDS Channel B */
+			ctx->lvds_channel_swap = true;
+			output_port = 3;
 		}
+		of_node_put(port0);
+		of_node_put(port1);
+		of_node_put(port2);
+		of_node_put(port3);
 	}
 
-	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
+	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, output_port, 0);
 	if (IS_ERR(panel_bridge))
 		return dev_err_probe(dev, PTR_ERR(panel_bridge), "Failed to get panel bridge\n");
 

-- 
2.55.0

