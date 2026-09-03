Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D110A440657
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423153; cv=none; b=lhUoXt1IxfB2/or9QhJtOtEMLKUDnHbzP2t/2ux7GAkEIuwggH39flpK/CfOv0q1lQrAs88LMo0WrlZXCqyA9vT+uhJE79fV81avGY1+qaGyfjDQdgCB/QxpBgHuPU+FcW3oDxPFsmmzBY9GP+ib1IGJW+KCUeMYOR1i1Ye1Wis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423153; c=relaxed/simple;
	bh=LKNJGS1kv5szPBqHtifirX/6ab047DGl5Zj8jATO1eI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=URznGJ1z/j/qDP/l8ySuqdX2gEsQugETxqhBAIMXUK0UJteyv2cgsqoPlmvxGhKuVVRlX5yIB2OPQAHXAqdrqeZKVxE/8Mv2wx/cxTRWebgUCuxNmLQv0fbMStAAGaNxekvFKO7i2I2gNVqv97t2gFh1xXPqW+2fAE6UmMEURoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Pd/1AiCb; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Pd/1AiCb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 450414E414F3;
	Thu,  3 Sep 2026 08:12:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17EFC602B8;
	Thu,  3 Sep 2026 08:12:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04D0811C79F4D;
	Thu,  3 Sep 2026 10:12:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788423148; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zRTS0SSS3PHuFBTy5A8RPzvsmc1PDq5h/+sxpBismTA=;
	b=Pd/1AiCb+JlNUxWnMbSZE9y+kz1ZibsJ7rzeukdpdq0G+fmit/pXA8HhDtW7idje1a5mFq
	hEbnt+/SMau1XorL++t2sR0RSBHaZnbL89bI9xR0wGXXHHwTB9S8zcgeFcNnNw6L6yR3EK
	MRWAjVEOMK5utxzKDD7UA3R3io6I/J682UtM7w0mGO6EdIOVPAzQ6ucNJ3yJlGt4+XVicb
	wq/5ZMbcc8bDJQA3suuI+AMRJ1Yk68R6UY+V11mVG+WPXVgUues6kTkONsZi1T4hv5/7zs
	Imb0Knsx3qn9w+fj135F9L74kqb2OKXdeGsonvz/wkb2zGrSTsmvbDUFtXtx9w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 03 Sep 2026 10:11:13 +0200
Subject: [PATCH RFC v2 10/19] drm/mcde: dsi: don't create a panel_bridge
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-drm-bridge-every-panel-v2-10-2ab8ee24538e@bootlin.com>
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
code (similar to an open-coded variant of drm_of_find_panel_or_bridge())
would lead to creating a second bridge for the same panel.

Update and simplify the code by just getting a reference to the
already-existing bridge.

Also keep the "connected to non-panel bridge (unsupported)\n" error logic
by using the drm_bridge_is_panel() function.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mcde/Kconfig    |  1 -
 drivers/gpu/drm/mcde/mcde_dsi.c | 41 +++++++++--------------------------------
 2 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/mcde/Kconfig b/drivers/gpu/drm/mcde/Kconfig
index 6ebfb930cbfa..81e7d3796c06 100644
--- a/drivers/gpu/drm/mcde/Kconfig
+++ b/drivers/gpu/drm/mcde/Kconfig
@@ -10,7 +10,6 @@ config DRM_MCDE
 	select DRM_MIPI_DSI
 	select DRM_BRIDGE
 	select DRM_PANEL
-	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	help
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 747886dfa17a..c36885f5f275 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -36,7 +36,6 @@ struct mcde_dsi {
 	struct device *dev;
 	struct mcde *mcde;
 	struct drm_bridge bridge;
-	struct drm_panel *panel;
 	struct mipi_dsi_host dsi_host;
 	struct mipi_dsi_device *mdsi;
 	const struct drm_display_mode *mode;
@@ -1073,7 +1072,6 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct mcde *mcde = to_mcde(drm);
 	struct mcde_dsi *d = dev_get_drvdata(dev);
-	struct drm_panel *panel = NULL;
 	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
 
 	if (!of_get_available_child_count(dev->of_node)) {
@@ -1101,40 +1099,21 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 
 	/* Look for a panel as a child to this node */
 	for_each_available_child_of_node_scoped(dev->of_node, child) {
-		panel = of_drm_find_panel(child);
-		if (IS_ERR(panel)) {
-			dev_err(dev, "failed to find panel try bridge (%ld)\n",
-				PTR_ERR(panel));
-			panel = NULL;
-
-			bridge = of_drm_find_and_get_bridge(child);
-			if (!bridge) {
-				dev_err(dev, "failed to find bridge\n");
-				return -EINVAL;
-			}
+		bridge = of_drm_find_and_get_bridge(child);
+		if (!bridge) {
+			dev_err(dev, "failed to find bridge\n");
+			return -EINVAL;
 		}
 
-		if (panel || bridge)
-			break;
+		break;
 	}
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_DSI);
-		drm_panel_put(panel);
-		if (IS_ERR(bridge)) {
-			dev_err(dev, "error adding panel bridge\n");
-			return PTR_ERR(bridge);
-		}
-		drm_bridge_get(bridge);
-		dev_info(dev, "connected to panel\n");
-		d->panel = panel;
-	} else if (bridge) {
+	if (!bridge) {
+		dev_err(dev, "no bridge\n");
+		return -ENODEV;
+	} else if (!drm_bridge_is_panel(bridge)) {
 		/* TODO: AV8100 HDMI encoder goes here for example */
 		dev_info(dev, "connected to non-panel bridge (unsupported)\n");
 		return -ENODEV;
-	} else {
-		dev_err(dev, "no panel or bridge\n");
-		return -ENODEV;
 	}
 
 	d->bridge.next_bridge = drm_bridge_get(bridge);
@@ -1156,8 +1135,6 @@ static void mcde_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct mcde_dsi *d = dev_get_drvdata(dev);
 
-	if (d->panel)
-		drm_panel_bridge_remove(d->bridge.next_bridge);
 	regmap_update_bits(d->prcmu, PRCM_DSI_SW_RESET,
 			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN, 0);
 }

-- 
2.55.0

