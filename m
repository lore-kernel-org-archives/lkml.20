Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C15A419304
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423142; cv=none; b=AdDM9RgF58GXZWMbEm+Ni8ryXsJ36Ip0lSJca6HTkSKG+TT/humOum2uGLmqpW2Lrk8bVPxlfd3440BsWv+p8JzRSn8TsAj1fTUjCAhjM4BGVUE/lkbJh7JheDxfZKEiWzml3FCe5tG3muvhEgQfxRD++ioGt3lXLv2YrUzLfOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423142; c=relaxed/simple;
	bh=sbS7BPCMYyqCO+Qn7zpLxIOerE/Dp2fAYuLT+8QlNGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fc7wz52q7R6O5f20koUfhThbdGRlYvgKQLZyIIVHyUw+3Xrz28hyB3SutNTm8mm6TgW1E9NppaGSrWPZeN3J1oD5y5+q4b2ThhJsYBgMGCJ07/mPWgoQdPrVxf1VTLl/kBJKIh22NpszWeU6uMP6GwAfP5Oe54G/lTVXHv4Lx/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B0hdNk1h; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B0hdNk1h"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EFC4E1A198D;
	Thu,  3 Sep 2026 08:12:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2ACF602B8;
	Thu,  3 Sep 2026 08:12:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E96A311C79FFE;
	Thu,  3 Sep 2026 10:12:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788423137; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qrl7+kbklONvZ1AqswtkUlrd6of2RCwJAsuQPOn1hyY=;
	b=B0hdNk1htDpeVEYT429cabUl0ivfFt5yfh/qmVW5njp8XYf4R0GAbJoF/eNG8pmaaTr8p4
	pHqHjHwrTU4rgzOWcxywfyzYs+OsSkeLYy5KfDQZu1OtWv1KKJob2Wn1lRsKRLha6ucwyf
	wIy/Orv+WxGD9BgdsNac8Jr1yKxKAnAuv2x387yvfmt1bzcka/UN4zb6a4NOVpMfhoZjWG
	RKWsODspw+ceYb/h9EJrAd+H0DUWFOqbIScXQ86Vu69kiDjwqcoOhJi7WE3NnrGywrMydG
	DCXqbqAHHvpUY1XAKYzlotHjaqMIBTX/FZhWg42y5OqvJhnI/SGDsO6gt5cE3Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 03 Sep 2026 10:11:10 +0200
Subject: [PATCH RFC v2 07/19] drm/bridge: waveshare-dsi: don't create a
 panel_bridge
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-drm-bridge-every-panel-v2-7-2ab8ee24538e@bootlin.com>
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
call to devm_drm_panel_bridge_add() would lead to creating a second
panel_bridge for the same panel.

Update and simplify the code by just getting a reference to the
already-existing bridge using of_drm_get_bridge_by_endpoint().

As of_drm_get_bridge_by_endpoint() returns a refcounted bridge, take care
of putting the bridge reference by using bridge->next_bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/waveshare-dsi.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
index 420f3b870a74..2c40bfef2b45 100644
--- a/drivers/gpu/drm/bridge/waveshare-dsi.c
+++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
@@ -16,11 +16,9 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 
 struct ws_bridge {
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct backlight_device *backlight;
 	struct device *dev;
 	struct regmap *reg_map;
@@ -89,7 +87,7 @@ static int ws_bridge_bridge_attach(struct drm_bridge *bridge,
 {
 	struct ws_bridge *ws = bridge_to_ws_bridge(bridge);
 
-	return drm_bridge_attach(encoder, ws->next_bridge,
+	return drm_bridge_attach(encoder, ws->bridge.next_bridge,
 				 &ws->bridge, flags);
 }
 
@@ -150,7 +148,6 @@ static struct backlight_device *ws_bridge_create_backlight(struct ws_bridge *ws)
 static int ws_bridge_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
-	struct drm_panel *panel;
 	struct ws_bridge *ws;
 	int ret;
 
@@ -164,14 +161,10 @@ static int ws_bridge_probe(struct i2c_client *i2c)
 	if (IS_ERR(ws->reg_map))
 		return dev_err_probe(dev, PTR_ERR(ws->reg_map), "Failed to allocate regmap\n");
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, &panel, NULL);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to find remote panel\n");
-
-	ws->next_bridge = devm_drm_panel_bridge_add(dev, panel);
-	drm_panel_put(panel);
-	if (IS_ERR(ws->next_bridge))
-		return PTR_ERR(ws->next_bridge);
+	ws->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, -1);
+	if (IS_ERR(ws->bridge.next_bridge))
+		return dev_err_probe(dev, PTR_ERR(ws->bridge.next_bridge),
+				     "Failed to find remote bridge\n");
 
 	ws->backlight = ws_bridge_create_backlight(ws);
 	if (IS_ERR(ws->backlight)) {

-- 
2.55.0

