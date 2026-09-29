Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCECF511E69;
	Tue, 29 Sep 2026 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678241; cv=none; b=YbX+YFO84PNSK2Sh2Er75skJ5QJKBZZTb2wrX3vcR2LL1qOOMXnVjQTlktpPZTNMMolUHjoEu5ib6WSyaF2fLbMUTANACTjpCX401kRaqGtbLNLUxefuT9IklI1Dd0UlD6XpFDMxob6J1OSmEufNl+njA/U0gshaCBiAVu+COFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678241; c=relaxed/simple;
	bh=Jx2My6QgxWrCNaGVNxRidyoZVc2RbLQWB3KollVEGXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r8HfwNoiM1UVrqBsF3wvbhMY2NkQjvTqMIVskfrwiJIVQDXTfD1kEI6LaBVXhIDQK3zlbvhy0kgAKOPS5FQviJZcxSTQlsr/Ycu6oh+EYpvXaw3j6fgCICT1yeznbINWR/p5++5sKpIQBr/gCJxYPfZpky5JLrxKxGBvlTOOavM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HkhamXZz; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HkhamXZz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0E4004E410B7;
	Tue, 29 Sep 2026 10:37:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D5209601BD;
	Tue, 29 Sep 2026 10:37:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5A2E103297BD;
	Tue, 29 Sep 2026 12:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790678226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MclBdn8qJNnkVxx6agDK+453pDYr2WeUrlYel3GftU0=;
	b=HkhamXZzgsVwqQsF7Kmnz7704aC5HD1bfqTX3uzG6BqJoUGvqaSUI9zNcnKgIBSEbn+JpB
	9DJ8JEXRm/gt1JAQxriQDyv0LM4Xuf49tr3Bt1+BPC6M2+g0vYsjlXDFXSMh42vFmyjiK7
	HGFOKUFbsIZqM431WrmtlAdsht6DuqfcsU+ZQ/gqIBOc5QlE7V3MQ3S5BCCfQWzZPFPkf9
	cfNpZ5qWD3YhOpqCLCDiDxGz/YLurO+vR6RNkc/gGZNR63uPUSHA3jE9WJxUUPh8Ysq5JF
	KHQDoOo40uMZz+P+VkI1Db8JucLABcWmeR6xbP3G/wV+dYvheg21Dn4R0DYlsQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 29 Sep 2026 12:36:36 +0200
Subject: [PATCH 4/7] drm/bridge: dw-mipi-dsi2: stop using deprecated
 devm_drm_of_get_bridge()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v1-4-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

devm_drm_of_get_bridge() is deprecated, switch to
of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() returns
a refcounted bridge, ensure it is put by using bridge.next_bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Unlike other commits in this series, this is not a fix: this code can be
built only when CONFIG_OF=y. Do this change to keep dw-mipi-dsi
dw-mipi-dsi2 as similar as they are already.
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
index 7fd2f1e60654..a008450d83aa 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
@@ -192,7 +192,6 @@ struct cmd_header {
 struct dw_mipi_dsi2 {
 	struct drm_bridge bridge;
 	struct mipi_dsi_host dsi_host;
-	struct drm_bridge *panel_bridge;
 	struct device *dev;
 	struct regmap *regmap;
 	struct clk *pclk;
@@ -528,12 +527,12 @@ static int dw_mipi_dsi2_host_attach(struct mipi_dsi_host *host,
 	dsi2->format = device->format;
 	dsi2->mode_flags = device->mode_flags;
 
-	bridge = devm_drm_of_get_bridge(dsi2->dev, dsi2->dev->of_node, 1, 0);
+	bridge = of_drm_get_bridge_by_endpoint(dsi2->dev->of_node, 1, 0);
 	if (IS_ERR(bridge))
 		return PTR_ERR(bridge);
 
 	bridge->pre_enable_prev_first = true;
-	dsi2->panel_bridge = bridge;
+	dsi2->bridge.next_bridge = bridge;
 
 	drm_bridge_add(&dsi2->bridge);
 
@@ -565,8 +564,6 @@ static int dw_mipi_dsi2_host_detach(struct mipi_dsi_host *host,
 
 	drm_bridge_remove(&dsi2->bridge);
 
-	drm_of_panel_bridge_remove(host->dev->of_node, 1, 0);
-
 	return 0;
 }
 
@@ -884,7 +881,7 @@ static int dw_mipi_dsi2_bridge_attach(struct drm_bridge *bridge,
 	encoder->encoder_type = DRM_MODE_ENCODER_DSI;
 
 	/* Attach the panel-bridge to the dsi bridge */
-	return drm_bridge_attach(encoder, dsi2->panel_bridge, bridge,
+	return drm_bridge_attach(encoder, dsi2->bridge.next_bridge, bridge,
 				 flags);
 }
 

-- 
2.55.0

