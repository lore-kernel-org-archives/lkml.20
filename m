Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632459;
	b=wha2kXSQHoXTvAQ/DNUY2xI0TvM/uzjqHk4MfEdvbFjLh45op5KmMpSZ08TOCzq2w3zJ
	 ryz1oBhweJkYyAgkj/l3lVwXyiUj1JUm7KuFcIXm2Y4NdN+nYS/msFtm+QJPpVY8q7dED
	 S9sqJbtYBzNy7ZfLqbb1AW9isI1aqIlRBzIL7f3xrYDCVHBl++pNS+JM60a6H9vp7sZu9
	 PGi73oMyPiUZ+Quzwpj61e9iSONAsJfiaY4Mt2Sjlgj4ARgAls6kU/7cCeFB+A+mW7ukE
	 GR6h5m8Mheq/7dxnfpZelTcMq3JXmgGOXZzIVdaegH5/NS8lKMkqh9Dm/jRAxzBlq+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632459;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=HyNwDi5CTXxwYxNFwbyErmDw3SEfl3ggFPX1IGjiANA=;
	b=Wa+JxTLnGFW003U9DLQRb+ZtHxZsHsq1Vw6GDKun2xRZ6J9MKKorOhK1fzHR8dGNNina
	 yfoEbkjJGWtyKOJnEPw8LIeJ8vvmzNd4bfnzJDc/dBq1A/DK+z6Dy67NAONJiSul0Kdl4
	 o4EJZ1a1qdoioMsq+3ZvbYPe768+Z7FY0kWRtlGrGoirDHg61nEgc/2Qtj3SRjDDjpu5G
	 fSHfNaq7j2MzXhhEEancMiYcSHCPR9/cDDBfqun20RBurxV3b1rGAoWbT8LNA5xGtDdwx
	 zT2P+q4yjwJLy6trxdP3VQ53FbX5Y+LNIDPbaDgG7kLkegdQS2fj8014Ss9qdL/q4ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=cUfLeETH;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760DB606A323;
	Sat, 14 Nov 2026 05:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760DB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=cUfLeETH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794632456;
	bh=yaWyBkkUSviHgGXnlcK/Iz0wPjQRpwiemqwYA0xpKNo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cUfLeETHI+uImA1rhg6tpZiVd4+VOX+EngJeueEU8pQw8DbrCUbq/nqD+P/Zge3RG
	 vhF+N9brgaN718YoEi97rr9OW2ggAbXbaR7vFOA0FZpEsUZHLla9HbIlt9KVrsBB/D
	 OuFZyri4DS07XgLl78JNZsvYcfweeA/hejprLUKZADlGgq/wxhEuTJj37/RUPVYKI6
	 rs5BsPl1cyonUHRS2ZM6wKoHwIzr8eYJer6iVDppSXN8j7B3k6NrgUNfkkkja2CISh
	 O7EE/ds5I2RqE1GZogWGNNObsPpjFN7/5O43M72ju2MR/JwVGdylnDfKQ0ptH+mojH
	 QTMm4H3a2FiTw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 54EFA17E0F7F;
	Sat, 14 Nov 2026 06:00:56 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0DCE0480030; Sat, 14 Nov 2026 06:00:56 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 06:00:35 +0100
Subject: [PATCH v12 02/23] drm/bridge: synopsys: dw-dp: Fix incorrect
 resource lifetimes in bind callback
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
Message-Id: <20261114-synopsys-dw-dp-improvements-v12-2-d42d3dc5bdd4@collabora.com>
References: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>, 
 Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9434;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=yaWyBkkUSviHgGXnlcK/Iz0wPjQRpwiemqwYA0xpKNo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr36wd9owm4zgIEpKZqqUTHopiD5syW0T2ba
 Oim0TTaDE20U4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9+sHAAoJENju1/PI
 O/qa+FoQAKm9QJ0IZEkM8oLh4cMwh5wN4ez7mZPoLQ1P6MYciDmPabQA4oXq1UJ6PEGm6dV/U18
 QxCBGohtZ5m6T6wyQyjpFW1P7ho3Ndq0vqQVz1E1nsuGJWvqL5FY8hRhnZmLN3+HHXctJboAYYq
 Np9X6155VN7RgUEf9uSzL4hw3IZl7B85YT0OLQpHm8PkZPBJtgMRO41RNv9uNZCSMptlo6QUahs
 T05uHikYtF8v9TxeFAYj+RqI4j16SxIA1dXUjSc6TD4X+lmSBIXN3mpZV9YqC6oxCPq5pcrnlFF
 niLEDP2RyEH5rn9Q9yoXUN/RZ8FKwHZLgglHwIE2emUn9JDpfIbScEcfJOgVzitjqobZVVUjgJW
 MyW8rw7MFZpQuFLYjhhRXFiIXO1e45nfsX0UacDBKOERuEZ9hm1JOxsRl5ydNqz1wElAgbO2VmQ
 CInaaJAeG992LqX8ntByE/73TWObV1R1gkWZIXUUTOqa+kpNso9ps/QDl9doLPqt3TXi3/NCzCo
 bDZaDS+u3lHVbdGCGvZ1tHE8pctwaCiPVfAABnhYS9id19x4Dcx7GV6DGVP0cSIIOxOS0JZ143Y
 G1VMeENGrXqh0QXiHtIC/HrbKdl7jppCDXWDmfWegDnzP7/aLUUkz0QCWPvUuv3a2l5CqCqDykc
 8+W2GiFACbfNvIbUFHzUrWA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Currently the Synopsys DesignWare DP controller driver's bind function
requests lots of resources using device managed functions. These are
free'd on driver removal instead of at unbind time. Fix this discrepancy
by introducing a new probe helper function and moving over the whole
bind function. This results in a fully functional DRM bridge once probe
succeeded. The only thing still happening when the component is bound
is the bridge attachment, which requires the encoder.

The interrupt is kept disabled while the bridge is detached to ensure no
spurious interrupts can arrive as the interrupt handler triggers a
worker, which accesses the DRM device.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Acked-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5+
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c   | 69 ++++++++++++++++---------------
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 53 ++++++++++++++----------
 include/drm/bridge/dw_dp.h                |  5 ++-
 3 files changed, 70 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 0a34d6a6ace4..ac16d290d49b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1827,16 +1827,22 @@ static int dw_dp_bridge_attach(struct drm_bridge *bridge,
 	dp->aux.transfer = dw_dp_aux_transfer;
 
 	ret = drm_dp_aux_register(&dp->aux);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "Aux register failed: %d\n", ret);
+		return ret;
+	}
 
-	return ret;
+	enable_irq(dp->irq);
+
+	return 0;
 }
 
 static void dw_dp_bridge_detach(struct drm_bridge *bridge)
 {
 	struct dw_dp *dp = bridge_to_dp(bridge);
 
+	disable_irq(dp->irq);
+	cancel_work_sync(&dp->hpd_work);
 	drm_dp_aux_unregister(&dp->aux);
 }
 
@@ -1982,6 +1988,18 @@ static const struct regmap_config dw_dp_regmap_config = {
 	.rd_table = &dw_dp_readable_table,
 };
 
+int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
+{
+	return drm_bridge_attach(encoder, &dp->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+EXPORT_SYMBOL_GPL(dw_dp_bind);
+
+void dw_dp_unbind(struct dw_dp *dp)
+{
+	/* nothing to do as bridge is detached automatically */
+}
+EXPORT_SYMBOL_GPL(dw_dp_unbind);
+
 static void dw_dp_phy_exit(void *data)
 {
 	struct dw_dp *dp = data;
@@ -1989,13 +2007,12 @@ static void dw_dp_phy_exit(void *data)
 	phy_exit(dp->phy);
 }
 
-struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
-			 const struct dw_dp_plat_data *plat_data)
+struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_data *plat_data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct dw_dp *dp;
+	struct device *dev = &pdev->dev;
 	struct drm_bridge *bridge;
 	void __iomem *res;
+	struct dw_dp *dp;
 	int ret;
 
 	dp = devm_drm_bridge_alloc(dev, struct dw_dp, bridge, &dw_dp_bridge_funcs);
@@ -2004,9 +2021,8 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 
 	dp->dev = dev;
 	dp->pixel_mode = plat_data->pixel_mode;
-
 	dp->plat_data.max_link_rate = plat_data->max_link_rate;
-	bridge = &dp->bridge;
+
 	mutex_init(&dp->irq_lock);
 	INIT_WORK(&dp->hpd_work, dw_dp_hpd_work);
 	init_completion(&dp->complete);
@@ -2063,21 +2079,15 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 		return ERR_CAST(dp->rstc);
 	}
 
-	bridge->of_node = dev->of_node;
-	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
-	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
-	bridge->ycbcr_420_allowed = true;
+	dp->irq = platform_get_irq(pdev, 0);
+	if (dp->irq < 0)
+		return ERR_PTR(dp->irq);
 
-	ret = devm_drm_bridge_add(dev, bridge);
+	ret = devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN, dev_name(dev), dp);
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to attach bridge\n");
-		return ERR_PTR(ret);
-	}
-
 	dw_dp_init_hw(dp);
 
 	ret = phy_init(dp->phy);
@@ -2090,26 +2100,19 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 	if (ret)
 		return ERR_PTR(ret);
 
-	dp->irq = platform_get_irq(pdev, 0);
-	if (dp->irq < 0) {
-		ret = dp->irq;
-		return ERR_PTR(ret);
-	}
+	bridge = &dp->bridge;
+	bridge->of_node = dev->of_node;
+	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
+	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
+	bridge->ycbcr_420_allowed = true;
 
-	ret = devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
-					IRQF_ONESHOT, dev_name(dev), dp);
+	ret = devm_drm_bridge_add(dev, bridge);
 	if (ret)
 		return ERR_PTR(ret);
 
 	return dp;
 }
-EXPORT_SYMBOL_GPL(dw_dp_bind);
-
-void dw_dp_unbind(struct dw_dp *dp)
-{
-	/* nothing to do */
-}
-EXPORT_SYMBOL_GPL(dw_dp_unbind);
+EXPORT_SYMBOL_GPL(dw_dp_probe);
 
 MODULE_AUTHOR("Andy Yan <andyshrk@163.com>");
 MODULE_DESCRIPTION("DW DP Core Library");
diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index b23efb153c9e..38e8fe75718e 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -26,7 +26,7 @@
 struct rockchip_dw_dp {
 	struct dw_dp *base;
 	struct device *dev;
-	struct rockchip_encoder encoder;
+	struct rockchip_encoder *encoder;
 };
 
 static int dw_dp_encoder_atomic_check(struct drm_encoder *encoder,
@@ -73,37 +73,28 @@ static const struct drm_encoder_helper_funcs dw_dp_encoder_helper_funcs = {
 
 static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	const struct dw_dp_plat_data *plat_data;
+	struct rockchip_dw_dp *dp = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
-	struct rockchip_dw_dp *dp;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
 	int ret;
 
-	dp = drmm_kzalloc(drm_dev, sizeof(*dp), GFP_KERNEL);
-	if (!dp)
+	dp->encoder = drmm_kzalloc(drm_dev, sizeof(*dp->encoder), GFP_KERNEL);
+	if (!dp->encoder)
 		return -ENOMEM;
 
-	dp->dev = dev;
-	platform_set_drvdata(pdev, dp);
-
-	plat_data = of_device_get_match_data(dev);
-	if (!plat_data)
-		return -ENODEV;
-
-	encoder = &dp->encoder.encoder;
+	encoder = &dp->encoder->encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev, dev->of_node);
-	rockchip_drm_encoder_set_crtc_endpoint_id(&dp->encoder, dev->of_node, 0, 0);
+	rockchip_drm_encoder_set_crtc_endpoint_id(dp->encoder, dev->of_node, 0, 0);
 
 	ret = drmm_encoder_init(drm_dev, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
 		return ret;
 	drm_encoder_helper_add(encoder, &dw_dp_encoder_helper_funcs);
 
-	dp->base = dw_dp_bind(dev, encoder, plat_data);
-	if (IS_ERR(dp->base))
-		return PTR_ERR(dp->base);
+	ret = dw_dp_bind(dp->base, encoder);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to bind DW-DP bridge\n");
 
 	connector = drm_bridge_connector_init(drm_dev, encoder);
 	if (IS_ERR(connector)) {
@@ -128,12 +119,30 @@ static const struct component_ops dw_dp_rockchip_component_ops = {
 	.unbind = dw_dp_rockchip_unbind,
 };
 
-static int dw_dp_probe(struct platform_device *pdev)
+static int dw_dp_rockchip_probe(struct platform_device *pdev)
 {
+	const struct dw_dp_plat_data *plat_data;
+	struct device *dev = &pdev->dev;
+	struct rockchip_dw_dp *dp;
+
+	plat_data = of_device_get_match_data(dev);
+	if (!plat_data)
+		return -ENODEV;
+
+	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
+	if (!dp)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, dp);
+	dp->dev = dev;
+
+	dp->base = dw_dp_probe(pdev, plat_data);
+	if (IS_ERR(dp->base))
+		return PTR_ERR(dp->base);
+
 	return component_add(&pdev->dev, &dw_dp_rockchip_component_ops);
 }
 
-static void dw_dp_remove(struct platform_device *pdev)
+static void dw_dp_rockchip_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &dw_dp_rockchip_component_ops);
 }
@@ -161,8 +170,8 @@ static const struct of_device_id dw_dp_of_match[] = {
 MODULE_DEVICE_TABLE(of, dw_dp_of_match);
 
 struct platform_driver dw_dp_driver = {
-	.probe	= dw_dp_probe,
-	.remove = dw_dp_remove,
+	.probe	= dw_dp_rockchip_probe,
+	.remove = dw_dp_rockchip_remove,
 	.driver = {
 		.name = "dw-dp",
 		.of_match_table = dw_dp_of_match,
diff --git a/include/drm/bridge/dw_dp.h b/include/drm/bridge/dw_dp.h
index 22105c3e8e4d..a82412a9e769 100644
--- a/include/drm/bridge/dw_dp.h
+++ b/include/drm/bridge/dw_dp.h
@@ -22,7 +22,8 @@ struct dw_dp_plat_data {
 	u8 pixel_mode;
 };
 
-struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
-			 const struct dw_dp_plat_data *plat_data);
+int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder);
 void dw_dp_unbind(struct dw_dp *dp);
+
+struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_data *plat_data);
 #endif /* __DW_DP__ */

-- 
2.53.0

