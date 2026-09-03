Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D78142E420
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423137; cv=none; b=OD8tGmuNzRjLNWh3EfFmOv0bW6etZDTFLxe96fOmHpqW6eWOrHccCuA/XN7ej1OVXNIR2eH/Suwkave7rzC1m9779C2z0OrEpXFZaqXr6iOxYUU4htZvDEd6vmNyeEyS4k9XobT14htKlbVLvKa77TW9ev1CF8wFHEqwDF4u4nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423137; c=relaxed/simple;
	bh=XKvq1RoCgb1S9HBF+1bJlKK6xQBLPMDN+3TWwxvZn68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lPzMqqyXnbUimXlbhvazBB1DEaRxvlt3ccocLpNMfniUejIGVWwTQRw2HF1tILlBOoHr0UXZfz7+bRKJddGTIcXUYzHaplBDrKXkoGjbh7+JHK+HUHZHvKxvG1Giv4fS0SLdq0IP4vjn1KKIi51+uibOUBqJXhyvvXelhG5v4es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cfHL4z7r; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cfHL4z7r"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 11C4E1A198C;
	Thu,  3 Sep 2026 08:12:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8FEB602B8;
	Thu,  3 Sep 2026 08:12:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8877711C791C9;
	Thu,  3 Sep 2026 10:12:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788423133; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=izOHNCuOScQ6mZ5l83A+QNH+LuTo1/OO5QFZoLW7y14=;
	b=cfHL4z7rNtUmxH+wP37bXSIIkyHFZz0eFPpMChIDqtCjooIe4eZWy7U4YqGZl5mCYTYvt1
	kqe9Q9zgpZXolopQ5U05gBj+8u3Ti4Sz8+GaRdxzh6hxlUj921M9IhzNcEm/cyZN+N98Gy
	d9J9Hl+Oj6NBCrsUWabvFGsLt9b9GrHtoIUIsOd8QeikQZlHRloIgDy9bb0ucWXwD+/kA2
	ADpXp/BW30PO1fN4eQf/Q5FF32zZzt2bK7yZ2iErlTstwfX5ki+XikQKnzNffE14vqzL6t
	Eia9xaoKt58Yn1dMICXr+vqxRLS4o4QILuv9fsuEYjoOOkVAs+/TIDIF04s5pQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 03 Sep 2026 10:11:09 +0200
Subject: [PATCH RFC v2 06/19] drm/bridge: tc358767: don't create a
 panel_bridge
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-drm-bridge-every-panel-v2-6-2ab8ee24538e@bootlin.com>
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

Now a panel_bridge is automatically created for every drm_panel, so calls
to devm_drm_panel_bridge_add() would lead to creating a second panel_bridge
for the same panel.

Update and simplify the code by just getting a reference to the
already-existing bridge using of_drm_get_bridge_by_endpoint().

As of_drm_get_bridge_by_endpoint() returns a refcounted bridge, take care
of putting the bridge reference by using bridge->next_bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig    |  2 --
 drivers/gpu/drm/bridge/tc358767.c | 64 ++++++++++++---------------------------
 2 files changed, 20 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 0a1689f8209d..30f71654eaeb 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -402,8 +402,6 @@ config DRM_TOSHIBA_TC358767
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_MIPI_DSI
-	select DRM_PANEL
-	select DRM_PANEL_BRIDGE
 	help
 	  Toshiba TC358767 eDP bridge chip driver.
 
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index ac83af7902cd..51f4baa62a53 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -35,7 +35,6 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -370,7 +369,6 @@ struct tc_data {
 	struct drm_dp_aux	aux;
 
 	struct drm_bridge	bridge;
-	struct drm_bridge	*panel_bridge;
 	struct drm_connector	connector;
 
 	struct mipi_dsi_device	*dsi;
@@ -1742,8 +1740,8 @@ static int tc_connector_get_modes(struct drm_connector *connector)
 		return 0;
 	}
 
-	if (tc->panel_bridge) {
-		num_modes = drm_bridge_get_modes(tc->panel_bridge, connector);
+	if (tc->bridge.next_bridge) {
+		num_modes = drm_bridge_get_modes(tc->bridge.next_bridge, connector);
 		if (num_modes > 0)
 			return num_modes;
 	}
@@ -1788,7 +1786,7 @@ tc_connector_detect(struct drm_connector *connector, bool force)
 	if (tc->hpd_pin >= 0)
 		return tc_bridge_detect(&tc->bridge, connector);
 
-	if (tc->panel_bridge)
+	if (tc->bridge.next_bridge)
 		return connector_status_connected;
 	else
 		return connector_status_unknown;
@@ -1809,10 +1807,10 @@ static int tc_dpi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 
-	if (!tc->panel_bridge)
+	if (!tc->bridge.next_bridge)
 		return 0;
 
-	return drm_bridge_attach(tc->bridge.encoder, tc->panel_bridge,
+	return drm_bridge_attach(tc->bridge.encoder, tc->bridge.next_bridge,
 				 &tc->bridge, flags);
 }
 
@@ -1825,9 +1823,9 @@ static int tc_edp_bridge_attach(struct drm_bridge *bridge,
 	struct drm_device *drm = bridge->dev;
 	int ret;
 
-	if (tc->panel_bridge) {
+	if (tc->bridge.next_bridge) {
 		/* If a connector is required then this driver shall create it */
-		ret = drm_bridge_attach(tc->bridge.encoder, tc->panel_bridge,
+		ret = drm_bridge_attach(tc->bridge.encoder, tc->bridge.next_bridge,
 					&tc->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret)
 			return ret;
@@ -2318,53 +2316,31 @@ static int tc_probe_dpi_bridge_endpoint(struct tc_data *tc)
 {
 	struct device *dev = tc->dev;
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
-	int ret;
 
 	/* port@1 is the DPI input/output port */
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, &bridge);
-	if (ret && ret != -ENODEV)
-		return dev_err_probe(dev, ret,
-				     "Could not find DPI panel or bridge\n");
-
-	if (panel) {
-		bridge = devm_drm_panel_bridge_add(dev, panel);
-		drm_panel_put(panel);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
-
-	if (bridge) {
-		tc->panel_bridge = bridge;
-		tc->bridge.type = DRM_MODE_CONNECTOR_DPI;
+	bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, 0);
+	if (IS_ERR(bridge))
+		return dev_err_probe(dev, PTR_ERR(bridge),
+				     "Could not find DPI bridge\n");
 
-		return 0;
-	}
+	tc->bridge.next_bridge = bridge;
+	tc->bridge.type = DRM_MODE_CONNECTOR_DPI;
 
-	return ret;
+	return 0;
 }
 
 static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
 {
 	struct device *dev = tc->dev;
-	struct drm_panel *panel;
-	int ret;
+	struct drm_bridge *bridge;
 
 	/* port@2 is the output port */
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, NULL);
-	if (ret && ret != -ENODEV)
-		return dev_err_probe(dev, ret,
-				     "Could not find DSI panel or bridge\n");
-
-	if (panel) {
-		struct drm_bridge *panel_bridge;
-
-		panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-		drm_panel_put(panel);
-		if (IS_ERR(panel_bridge))
-			return PTR_ERR(panel_bridge);
+	bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 2, 0);
+	if (IS_ERR(bridge) && PTR_ERR(bridge) != -ENODEV)
+		return dev_err_probe(dev, PTR_ERR(bridge), "Could not find DSI bridge\n");
 
-		tc->panel_bridge = panel_bridge;
+	if (!IS_ERR(bridge)) {
+		tc->bridge.next_bridge = bridge;
 		tc->bridge.type = DRM_MODE_CONNECTOR_eDP;
 	} else {
 		tc->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;

-- 
2.55.0

