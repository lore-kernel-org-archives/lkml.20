Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31D150E5B4;
	Tue, 29 Sep 2026 10:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678229; cv=none; b=trb8Qq54AzL1HYw9G4Rs045QGPfdORROK3HzKcFxHMCN+AE5hdk+zr7SHn958fKSybsCu/LUX4EQlCRdh+Ks1MeXB7uQ14wf+kS1V2udf+V/5tKCxS1PUay9JKirT3pnlsatrqMVdl4k0TNYbV+mVzc/2x0HnLkXPvaJIPEO8Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678229; c=relaxed/simple;
	bh=fAJCR/ZroPy+oJUNxMd85Nr72/31bKeldozY5NBeAX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oUqHt+j2t9vl242aB/xp3khQy4aA49E7laqf29Fxvq/API4Kasbwl3s+vg6c2qFBaK07oe8+zW5skW6PhILjmZkjcfMjx5kgMDoQ894VSq+bxmpcnWtUVL+zPGG9m0IMG2XYyjvmesg4Vj2eZRyvrzoUCswjO4a6xvPIM6VXRg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MqTojPzP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MqTojPzP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7844A4E410B7;
	Tue, 29 Sep 2026 10:36:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B7CF601BD;
	Tue, 29 Sep 2026 10:36:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BB42103297D9;
	Tue, 29 Sep 2026 12:36:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790678211; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=032h6Th8l7IfQBTnPLHPYTAaN8pOyDuaC0Ayd1z2gxI=;
	b=MqTojPzPfPXSqJtTFCsEBbmgmp2/5X3w9gioa23m3HV0/eMECBU2ebNCtd9XTNUzkQdqIs
	VWYwkl/6StrQcAEB4FA1iXQVJu6wYSJgcPSH4mlngku+IWWWS7rSv2lRe7TOPW7GbXKZKx
	Iyqaq0TsNIR/XQJrCLkf4ZgW9aW/UbXhgX4bsR0UnupObu7Tx3lyyNMXEj9pDzyq7EK7Hn
	3jyGYyYML3DrDj6k3EdlDMBEzXKuyn5dTTHbE6wUI1Mn7272M3LnO4NLB5Dm/mURWCHjTN
	07Y3JY2pIwLlRRCvaMaqfb08+MhUu98xTpXbKd8JmW1MHGLSkDQB+6Qamoeu4g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 29 Sep 2026 12:36:33 +0200
Subject: [PATCH 1/7] drm/imx/lcdc: stop using deprecated
 devm_drm_of_get_bridge()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v1-1-ccb7e602daad@bootlin.com>
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
a refcounted bridge, ensure it is put.

Fixes build failure when CONFIG_OF is disabled.

Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to drm_panel.c")
Reported-by: Arnd Bergmann <arnd@kernel.org>
Link: https://lore.kernel.org/r/20260928161605.2271412-1-arnd@kernel.org
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index c67fe80b8115..805a659e3f85 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -385,7 +385,6 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 {
 	struct imx_lcdc *lcdc;
 	struct drm_device *drm;
-	struct drm_bridge *bridge;
 	int irq;
 	int ret;
 	struct device *dev = &pdev->dev;
@@ -401,7 +400,8 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 	if (IS_ERR(lcdc->base))
 		return dev_err_probe(dev, PTR_ERR(lcdc->base), "Cannot get IO memory\n");
 
-	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	struct drm_bridge *bridge __free(drm_bridge_put) =
+		of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
 	if (IS_ERR(bridge))
 		return dev_err_probe(dev, PTR_ERR(bridge), "Failed to find bridge\n");
 

-- 
2.55.0

