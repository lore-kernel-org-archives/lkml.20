Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FBC440657
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423158; cv=none; b=TiQNy8YGcw3xVOL3D0yMsW+5UptqRizML2WDZVFvhLJlp4zU5Y2Ob06CtKWHEx9B/JX7+59tcX57dSKtIpvPoRadftYYeOAcNw+pK0akAJE3K5K8JyqKl1CJvpJMHCrsfdabJY+ea9yLE376EEJHhdDwVmG46NvwGYsX8ixEGyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423158; c=relaxed/simple;
	bh=fF3iHgWXPvx6SC76CyGomOwbVg0zpEAmwQ1B/WDgxPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMzNaNiAl3CSeW6DHEqN6XkqzRzYGhSkyWfw7ESNL1sXCxUyxqmPOSFVnIhQS7gq+SzNl186TOe9CBJomyf6OCiusQbEKvwtz00/Yerqg53RIbnGvIePmiwTXIDG+aXA5RCoAwceYD2MvOKgNG6dmqWaChErH5m3ptT3/9dTpMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=a++VYWRo; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="a++VYWRo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DE4224E414F4;
	Thu,  3 Sep 2026 08:12:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA6BD602B8;
	Thu,  3 Sep 2026 08:12:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 342E311C791C9;
	Thu,  3 Sep 2026 10:12:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788423153; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E+i/7CDSkS0WtOD/C7Io90FrN1Ou/szitASTdt3wMjo=;
	b=a++VYWRoLEYVIGfoCrjrdEd/z+kpaDH6nDm0VOnVOfY7J+NWyd78gtwz/DrqIpd0VB0ZNk
	M/sNVcR1ATutuLKIJHXiK9mlrDF6yg3flvPaD++smcGb6LCcDsym30LnrRocTDEMc7sibn
	XEbiqz+o8y++99MoCjSttT/m+AdA1Rr3sE74kQzorklRBNZjg12ONlldtYpB4za0Dm+W5u
	ie+QHDR/ziiAHftjCRL00xc95Y+j3Zi+0fdDsdeQBGL3k539/kTdWZORYjv0vGAU/ITfSl
	8ID60w0b1LY5IbWhrPeekD7+D9dWx32TR2rlTL32x7Jtf1lwdD5fVAK6ONBv4g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 03 Sep 2026 10:11:14 +0200
Subject: [PATCH RFC v2 11/19] drm/bridge: fsl-ldb: don't create a
 panel_bridge
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-drm-bridge-every-panel-v2-11-2ab8ee24538e@bootlin.com>
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
code, looking only for a panel and unconditionally creating a panel_bridge
for it, would lead to creating a second bridge for the same panel.

Fix and simplify the code by just getting a reference to the
already-existing bridge from of_drm_find_and_get_bridge().

And since of_drm_find_and_get_bridge() returns a refcounted bridge, take
care of putting the bridge reference by using bridge->next_bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig   |  1 -
 drivers/gpu/drm/bridge/fsl-ldb.c | 19 +++++--------------
 2 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 30f71654eaeb..0a1e617b3007 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -87,7 +87,6 @@ config DRM_FSL_LDB
 	depends on OF
 	depends on ARCH_MXC || COMPILE_TEST
 	select DRM_KMS_HELPER
-	select DRM_PANEL_BRIDGE
 	help
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 26cc72948f31..7ec84c81cd78 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -15,7 +15,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 
 #define LDB_CTRL_CH0_ENABLE			BIT(0)
 #define LDB_CTRL_CH0_DI_SELECT			BIT(1)
@@ -86,7 +85,6 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 struct fsl_ldb {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_bridge *panel_bridge;
 	struct clk *clk;
 	struct regmap *regmap;
 	const struct fsl_ldb_devdata *devdata;
@@ -119,7 +117,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	return drm_bridge_attach(encoder, fsl_ldb->panel_bridge,
+	return drm_bridge_attach(encoder, fsl_ldb->bridge.next_bridge,
 				 bridge, flags);
 }
 
@@ -298,7 +296,6 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *panel_node;
 	struct device_node *remote1, *remote2;
-	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
 
@@ -339,19 +336,13 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
 		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
 
-	panel = of_drm_find_panel(panel_node);
-	of_node_put(panel_node);
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
-
 	if (of_property_present(dev->of_node, "nxp,enable-termination-resistor"))
 		fsl_ldb->use_termination_resistor = true;
 
-	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	drm_panel_put(panel);
-	if (IS_ERR(fsl_ldb->panel_bridge))
-		return PTR_ERR(fsl_ldb->panel_bridge);
-
+	fsl_ldb->bridge.next_bridge = of_drm_find_and_get_bridge(panel_node);
+	of_node_put(panel_node);
+	if (!fsl_ldb->bridge.next_bridge)
+		return -ENODEV;
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
 		struct device_node *port1, *port2;

-- 
2.55.0

