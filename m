Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70472F12AB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423195; cv=none; b=iCDalv9b9AO7UcI+44++gdmHmOPmXa/nN3QHPucC7U1BRGm7jnqNJoVhT1QdJbB7jVvE0vFGD3bqb78HNZBqJul6q32XQVlc52fnAvlhO+Q2my3qS4HwbAo8vORYerj1mM+xWeQT52wzkfxJXhRrlFpL5EDVTXnr2UEJcLKdou4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423195; c=relaxed/simple;
	bh=e3NOUGpJRgMU4g8QFCewMxGVZrbk2apppWHc5dnPbyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nfYDKmsIdctTrrsroWiIrfODmh36Pe/A99SOL+JGItjGBLKsg9dQRrz+0T6aAlF9weI7odJfKm74chT1XTvCJO8AF5gEHpJh/WGJEBtEUo2JW6L18VbfJcH/P/MAnazDO6Gj4cEfyzMCY4m4PPc/mGy5xoQ/5nzE8WtlhK46+PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GsnxoZKX; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GsnxoZKX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 474B84E414F5;
	Thu,  3 Sep 2026 08:13:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13D90602B8;
	Thu,  3 Sep 2026 08:13:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0473C11C79F4D;
	Thu,  3 Sep 2026 10:12:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788423175; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HYCMT8VtWEaiVcbE2PWOYsld3eu/5IQr0fQ+hFOrJzY=;
	b=GsnxoZKX3h/IZ38IzfqXC8ijor0y6YgNu9uq1uedTvyWtvbftXBk3QmR8IM6Pwr4qGPRNr
	09aP7CbL6uymsYMbMbnkC7NOZFHMfZusggRa8f/uuSI3fjgd7plQHx+8RJhT+ifWcJ4ZiT
	YYd01Le5rSBFZtvqi6rtjNJPJWjq+uXdBRQRrEkAoyF8r4fGLbKkP3yeMbOAKH0MJbhpof
	S5C2vmxiDFHXIZ2dHdrKNnSUQZ2r7dtqRPttq1qGgV0G4niK9oGJZU82mhMAc5CgiSGp0e
	iWh+GohehSGy4pgu5rweVKSZF74LFRx1lCn4wqPa0/TWr/uv717sVMr5W12Vxw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 03 Sep 2026 10:11:16 +0200
Subject: [PATCH RFC v2 13/19] drm/bridge: tc358768: don't create a
 panel_bridge
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-drm-bridge-every-panel-v2-13-2ab8ee24538e@bootlin.com>
References: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com>
In-Reply-To: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Albert Esteve <aesteve@redhat.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Now a panel_bridge is automatically created for every drm_panel, so this
call to drm_panel_bridge_add_typed() would lead to creating a second
bridge for the same panel.

Update and simplify the code by just getting a reference to the
already-existing bridge.

As of_drm_get_bridge_by_endpoint() returns a refcounted bridge, take care
of putting the bridge reference by using bridge->next_bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig    |  2 --
 drivers/gpu/drm/bridge/tc358768.c | 25 ++++++-------------------
 2 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index eb16f858459d..f897058462c8 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -408,8 +408,6 @@ config DRM_TOSHIBA_TC358768
 	depends on OF
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
-	select DRM_PANEL
-	select DRM_PANEL_BRIDGE
 	select DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
 	help
diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index d1fc6af37cc5..cc989ab5cf25 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -22,7 +22,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <video/mipi_display.h>
 #include <video/videomode.h>
 
@@ -137,7 +136,6 @@ static const char * const tc358768_supplies[] = {
 
 struct tc358768_dsi_output {
 	struct mipi_dsi_device *dev;
-	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 };
 
@@ -443,7 +441,6 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
 {
 	struct tc358768_priv *priv = dsi_host_to_tc358768(host);
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
 	struct device_node *ep;
 	int ret;
 
@@ -471,24 +468,15 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
 		return -ENOTSUPP;
 	}
 
-	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0, &panel,
-					  &bridge);
-	if (ret)
-		return ret;
+	bridge = of_drm_get_bridge_by_endpoint(host->dev->of_node, 1, 0);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_DSI);
-		drm_panel_put(panel);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-
-		bridge->pre_enable_prev_first = true;
-	}
+	bridge->type = DRM_MODE_CONNECTOR_DSI;
+	bridge->pre_enable_prev_first = true;
 
 	priv->output.dev = dev;
 	priv->output.bridge = bridge;
-	priv->output.panel = panel;
 
 	priv->dsi_lanes = dev->lanes;
 	priv->dsi_bpp = mipi_dsi_pixel_format_to_bpp(dev->format);
@@ -518,8 +506,7 @@ static int tc358768_dsi_host_detach(struct mipi_dsi_host *host,
 	struct tc358768_priv *priv = dsi_host_to_tc358768(host);
 
 	drm_bridge_remove(&priv->bridge);
-	if (priv->output.panel)
-		drm_panel_bridge_remove(priv->output.bridge);
+	drm_bridge_put(priv->output.bridge);
 
 	return 0;
 }

-- 
2.55.0

