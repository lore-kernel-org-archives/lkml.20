Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD69414A27
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423214; cv=none; b=ZirKQ+5lBv73wdzvIPEkjOT2j/T535aXLdKKR8OZ4uQdGEBhf6zVGgpDFRa6z7mmwqoK0rl/XhTRId6vs8Jmi4AS0aHc92vFuSCtN2/VlHjHRDyYSNy4Q5potX5QdR7I5WINu2Ge+G8A+RFLBaSMkISH/mP9lL3cPhxnntSUUIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423214; c=relaxed/simple;
	bh=URDIfqKj3Oe9j3cNqkG8Cql5ENZP2CjRnVmv06xFdg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E0Gnd1B/HpZjvRFlGx4/b9484sXyKrVpESbAJ2JcoCeA3k9YDNzaU3J/DYAaN5vA8zkZBPjK2JrVfdKf4e9HH6VhL0aY5+RvaVpw5ubRoD59wcwE32npS7UCrqYFgsJVbaiXRVE/fLN4wbJ5ngGLf3c6olH6k5ufQrqbDaybbQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0Xy4ugZG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0Xy4ugZG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EBAE24E414F5;
	Thu,  3 Sep 2026 08:13:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDD71602B8;
	Thu,  3 Sep 2026 08:13:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F3D811C79B6F;
	Thu,  3 Sep 2026 10:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788423194; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FsEQJhhfqfgS9xLyU7kCDj+w/oaxXwQBR7Fe3h3U6+8=;
	b=0Xy4ugZGVlaaaQ6ZlcLgG/l7Bv3qGcoaTGEHQuE+TUPNHg2km5DyyTWt6w6kKglVm4Wc+U
	15z4UPrVizIM0kcG9q16urM9aN/Ap3M3S7oD5ZCvM482YJs5F+dZ4yeVN2V30jc3wPcGw8
	1OLd915ZOiuK2lqHIspAcrnYKsJhfgLWKi2gcrjFh0NX3N4ItVIdK/fsFQn7pCSwMUSYsw
	pyivCeKR3ET+8JQ6ZB+Q9W7lSaPaNFGHrpHGv8M1t/kiId2ybrMhIDTjfiLlHNPguqy5aC
	W8UY9lOsD6OU174cURt1APgbdmk/cVJ1N5TIgei7FmDTOTdDjFZncKaNsXNK2A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 03 Sep 2026 10:11:17 +0200
Subject: [PATCH RFC v2 14/19] drm/bridge: ssd2825: don't create a
 panel_bridge
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-drm-bridge-every-panel-v2-14-2ab8ee24538e@bootlin.com>
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
call to drm_panel_bridge_add_typed() would lead to creating a second bridge
for the same panel.

Update and simplify the code by just getting a reference to the
already-existing bridge.

As of_drm_get_bridge_by_endpoint() returns a refcounted bridge, take care
of putting the bridge reference.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig   |  2 --
 drivers/gpu/drm/bridge/ssd2825.c | 23 +++++------------------
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index f897058462c8..7de5abc47b54 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -349,8 +349,6 @@ config DRM_SOLOMON_SSD2825
 	depends on SPI_MASTER && OF
 	select DRM_MIPI_DSI
 	select DRM_KMS_HELPER
-	select DRM_PANEL
-	select DRM_PANEL_BRIDGE
 	help
 	  Say Y here if you want support for the Solomon SSD2825 RGB/DSI
 	  SPI bridge driver.
diff --git a/drivers/gpu/drm/bridge/ssd2825.c b/drivers/gpu/drm/bridge/ssd2825.c
index b0142d6d40dc..71877699dfab 100644
--- a/drivers/gpu/drm/bridge/ssd2825.c
+++ b/drivers/gpu/drm/bridge/ssd2825.c
@@ -17,7 +17,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <video/mipi_display.h>
 
 #define SSD2825_DEVICE_ID_REG			0xb0
@@ -114,7 +113,6 @@ static const struct regulator_bulk_data ssd2825_supplies[] = {
 
 struct ssd2825_dsi_output {
 	struct mipi_dsi_device *dev;
-	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 };
 
@@ -277,7 +275,6 @@ static int ssd2825_dsi_host_attach(struct mipi_dsi_host *host, struct mipi_dsi_d
 {
 	struct ssd2825_priv *priv = dsi_host_to_ssd2825(host);
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
 	struct device_node *ep;
 	int ret;
 
@@ -295,20 +292,14 @@ static int ssd2825_dsi_host_attach(struct mipi_dsi_host *host, struct mipi_dsi_d
 		return -EOPNOTSUPP;
 	}
 
-	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0, &panel, &bridge);
-	if (ret)
-		return ret;
+	bridge = of_drm_get_bridge_by_endpoint(host->dev->of_node, 1, 0);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel, DRM_MODE_CONNECTOR_DSI);
-		drm_panel_put(panel);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
+	bridge->type = DRM_MODE_CONNECTOR_DSI;
 
 	priv->output.dev = dev;
 	priv->output.bridge = bridge;
-	priv->output.panel = panel;
 
 	priv->dsi_lanes = dev->lanes;
 
@@ -333,8 +324,7 @@ static int ssd2825_dsi_host_detach(struct mipi_dsi_host *host, struct mipi_dsi_d
 	struct ssd2825_priv *priv = dsi_host_to_ssd2825(host);
 
 	drm_bridge_remove(&priv->bridge);
-	if (priv->output.panel)
-		drm_panel_bridge_remove(priv->output.bridge);
+	drm_bridge_put(priv->output.bridge);
 
 	return 0;
 }
@@ -579,9 +569,6 @@ static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	/* Initial DSI configuration register set */
 	ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
 	ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
-
-	if (priv->output.panel)
-		drm_panel_enable(priv->output.panel);
 }
 
 static void ssd2825_bridge_atomic_enable(struct drm_bridge *bridge,

-- 
2.55.0

