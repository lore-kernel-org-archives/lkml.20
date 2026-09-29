Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0108351122E;
	Tue, 29 Sep 2026 10:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678255; cv=none; b=FSkVJyIQTnfqwJJkgbOmvz24COUSWM3wB7UaE23kCfHAWLhRS5q7e0DOOpIqOCLcNgbUtZdNom4JuTaH2I+MN7b+Nk9BQII/5OiHC90x0s8/fcvFtLBdbfDKRHuiCXaxiKA7ZGpDakRrO+HFT5RPzJGxFabfIxCsZpjTz+ppO4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678255; c=relaxed/simple;
	bh=zk/sW/7dKyqBBddE4Q1iLVHl5U2i7wrfyuso679Wkys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oYzOZ1cwoBL8vqdFf1i/359LyKXC75zeihddeFo7vvBbJv4JPOKDR4sbCY1sRbkVkIkzicZAx9mqzxSHWy172dse0RwpGRE+pbaKQegP2LGPSdMbGszrw1CWKI15M1XVU+HvpN1phMe/2PHN9AS4e4M6JApDpxkvcNvHyBBxmKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=awY69VGz; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="awY69VGz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E38334E410B8;
	Tue, 29 Sep 2026 10:37:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD3D7601BD;
	Tue, 29 Sep 2026 10:37:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57982103297DC;
	Tue, 29 Sep 2026 12:37:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790678235; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iOxyCS599oVo+AZS8JSoUu6X3bzbx9qa/yjHz16Q5+8=;
	b=awY69VGzxHFCSZVboz5MVQUhK4Yr4tWBaJBBGV2WWHGpRF2fiN9X93UAm6z/xxKWWR703v
	PTnDrGxLz/JSdWFilMw0GAFq/bsoXyeLMIy8r1Qi18WJnmEn/NYsN7z8a0gnzCofpOxoYJ
	mej1BnLsULUJBvjTbXYPgNQwhf7aG+0kxntKvibiHYprvaL1AwH5UhwWobx3b7Zq5kqDgX
	Wg6hJskBRWE8K/y/ap3/HaFIuGdHBdJ1CJPHredDsXnkX2kperR4I1w1g4gNUv5C8UmvKp
	L0z2Sb24I7wSb9Lh9HFrM/Q5AkXxf2+T+40sTf50p3knnZqXg11V7qcoYsupMg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 29 Sep 2026 12:36:37 +0200
Subject: [PATCH 5/7] drm/vc4: dpi: stop using deprecated
 drmm_of_get_bridge()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v1-5-ccb7e602daad@bootlin.com>
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

drm_panel.h becomes unused, drop the include.

Also remove a comment that is now obvious: now panels are just bridges.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 53f36626a50d..5060eb463704 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -16,7 +16,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -279,16 +278,12 @@ static const struct of_device_id vc4_dpi_dt_match[] = {
 	{}
 };
 
-/* Sets up the next link in the display chain, whether it's a panel or
- * a bridge.
- */
 static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
 {
-	struct drm_device *drm = dpi->encoder.base.dev;
 	struct device *dev = &dpi->pdev->dev;
-	struct drm_bridge *bridge;
 
-	bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
+	struct drm_bridge *bridge __free(drm_bridge_put) =
+		of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
 	if (IS_ERR(bridge)) {
 		/* If nothing was connected in the DT, that's not an
 		 * error.

-- 
2.55.0

