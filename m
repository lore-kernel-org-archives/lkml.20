Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D23C51C06B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858710; cv=none; b=Qq8BnkOxOLJjrepdptea8wJwKYVvX0KVAqM6UlijbgisB9n6En7li4Nl8Gf2O+k9W7KoJDr34jQRTtzwW/irBOB5ajeeQT8om/ejQGwvZ7f+qpOXznFAULTI+MTXJengIwOuRt2ZdefVMWLj9whMVLYPHLw/vOSuBQUj9/OOAes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858710; c=relaxed/simple;
	bh=SaD09KDdjV/mi9gBTxe1/GFvZYurLshWIMZ4B9uMLEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h/DhZhHy+mr3+O0rnAuK3uOLtOGXAsVyn9t9pO9ItefO421k9oJRDJXhgRSlMj2m8jmzWgZKgAbeFWBOTuaHmmTlUijFDnQEVjb3Kpj99WWaUdH+dGT6+lIY1FUzbZPcz6KOM50PddklFAZN6UvW1Ew0RcU9uLWLlVoE6y+oh58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=w3ipFw0T; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="w3ipFw0T"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 999494E416CC;
	Thu,  1 Oct 2026 12:45:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CCD560341;
	Thu,  1 Oct 2026 12:45:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2496F103280FE;
	Thu,  1 Oct 2026 14:45:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858705; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8u2BHTXAlXYVVX85Jjx04DDRc3tphi/zTnHg2fecFwA=;
	b=w3ipFw0TyzcONM/JO6/4us8QlhI/d1QOhz4bD7rl52l3tsmVpaYk3D8wBBC041uyWV6lP0
	T+/L0Z7Juyjl7tqoWEnnwAEB/2GgwAl1HRwb/NmrPqYLzb0kV+3l26U2Dtxw2azwjU+SNe
	50yrPtR/GQhRTCWmNZI2AP6hvESbglW7DbdaTcYa5MSQLvC/hWDdOuZUbH1U2ilXAaUPML
	WEH0fqN/3vjl90kMiujMnXUE+JJEfHN78i7nhjQYwYtbmcyUEnwgsp+jzFkzSD0qeJmpOH
	a9iGgLLyfN1OkKoP2kTT9JeNGBGMh/0Uc5MSQBlGSA5p2xM5dzKXpLXPnauPdw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:46 +0200
Subject: [PATCH RFC v2 24/24] drm/mxsfb/lcdif: enable bridge hotplug
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-24-8e34986dcb68@bootlin.com>
References: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
In-Reply-To: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Switch to the new drm_hotplug_helper() to handle bridge hotplugging.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mxsfb/Kconfig     |  2 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index 31db7a824a93..ada9a9334ea4 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -34,7 +34,7 @@ config DRM_IMX_LCDIF
 	select DRM_PANEL
 	select DRM_PANEL_BRIDGE
 	select DRM_DISPLAY_HELPER
-	select DRM_BRIDGE_CONNECTOR
+	select DRM_HOTPLUG_HELPER
 	help
 	  Choose this option if you have an LCDIFv3 LCD controller.
 	  Those devices are found in various i.MX SoC (i.MX8MP,
diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index e2173c4d6fc2..3d8904a48d9a 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -18,7 +18,7 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_bridge_connector.h>
+#include <drm/drm_hotplug_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fbdev_dma.h>
@@ -58,7 +58,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 		struct of_endpoint of_ep;
 		struct drm_bridge *bridge;
 		struct drm_encoder *encoder;
-		struct drm_connector *connector;
+		struct drm_hotplug_helper *hotplug_helper;
 		int ret;
 
 		if (!of_device_is_available(remote))
@@ -94,10 +94,10 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 					     "Failed to attach bridge for endpoint%u\n",
 					     of_ep.id);
 
-		connector = drm_bridge_connector_init(lcdif->drm, encoder);
-		if (IS_ERR(connector))
-			return dev_err_probe(dev, PTR_ERR(connector),
-					     "Failed to init bridge_connector for endpoint%u\n",
+		hotplug_helper = drmm_hotplug_helper_init(lcdif->drm, encoder);
+		if (IS_ERR(hotplug_helper))
+			return dev_err_probe(dev, PTR_ERR(hotplug_helper),
+					     "Failed to init hotplug_helper for endpoint%u\n",
 					     of_ep.id);
 	}
 

-- 
2.55.0

