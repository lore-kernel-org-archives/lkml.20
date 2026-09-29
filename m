Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D58A51AFFF;
	Tue, 29 Sep 2026 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689223; cv=none; b=MsuDr5NGa5gByKcmxDtzPDwpuLTuDwkMib0Hd0a8IAPXAMhPMN1z6TNd1jyXImySS7VB3pwkX/xqqTJzdBtonuRrH3q87g8Pq5d1jeaORLOVbaEUbce2CvHLWlhCINYGLv9uhny2sAjVAzY0ouffs9JfNihYhg2wiXrOvJBVOuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689223; c=relaxed/simple;
	bh=lca2GlXeHH2fTteA9czDlGLBedrx4Z4ZzbTXEYTw3vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mna+Fv/wx11TL6VSuQNTi8gldGSj/7uNNFut4sxIPPdmDVY0XdFHKJhMbWc6bF1M9qheqv8Jkz11PasKND870FHp5EZl1IPJiqGl5wF6LZzKm6lq1pdEOYAIrJ6g7Tu7+h8jHyAULQk/o9WgKIzT4lSHzggv/6Mc/L0Nrkr33+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Js0FzyoS; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Js0FzyoS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A69624E410B8;
	Tue, 29 Sep 2026 13:40:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 788ED601BD;
	Tue, 29 Sep 2026 13:40:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94035103297BA;
	Tue, 29 Sep 2026 15:40:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790689214; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bW9pNI+AiwMMcI1zrPdEintqStXlIBJs25H3umU0V60=;
	b=Js0FzyoScvWAIcxgqzXNwJAYfGk4V8S1j37AGkXKhbcl779lCKc9URhyST3mQmPM968Evx
	WSF0cVBRUXsgCfrwLD3zHnVpS1v8q17dlrIi6NU2269VGKoUPor3mVMnxYEf0EpYnK65I1
	bmw0aTGgJWcaZLPPPOzZTLK2p6WP/Rspejh9mucxAjpraW9Wk9EF2F/KS9riKCQY2PTGRa
	u2IJYbQ86aVkeCmhoeHWrs2Od0Isd7vL58JdroH9Fk4WWTB96sG279xVSdIFPwWqxKKlLN
	a7fI+ffuyhgzHL1mqL+7kYfWLFnYW8aWcd8pgqZlkefnP8PWqELnZ4wR0U7Eow==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 29 Sep 2026 15:39:50 +0200
Subject: [PATCH v2 1/7] drm/imx/lcdc: stop using deprecated
 devm_drm_of_get_bridge()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v2-1-6da431d8f180@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
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
Acked-by: Maxime Ripard <mripard@kernel.org>
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

