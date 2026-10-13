Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688FC524B18
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905059; cv=none; b=aHu4OJtYshInVJLw53yQ8nCT7yZrvyZOcPmymdzmxFX9ClWpDYykLP39ngQWug198QiwHBLByT6eZrLJcq2OxSyfXMeXghPi66enKWaKr+LqGYEm+KSgwmUb2NggF67jMSXA29ND+r70KkoQxLqvMl5DN+wVzCMlfiwPkw9qSeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905059; c=relaxed/simple;
	bh=ux//fc7buqooukHnG7qbsyOcAR+vfD5wyKBvwoowU9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4ofPN+lo12leLmLQb+fMCEQzM5b2mbRy0ym2twZ6bqhi1hbZUomx2Vwhkt/NJwtMIYHpQ7YXr7ZClwSBm44rAVZB5Ne1cY38xVm+oAToNQvKi5JZrWb84mmTz2B6GsxS1etWQVTfLatMw6IKDEZeB+EmYnROuCPnZl81R3q/to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SLPMw03r; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SLPMw03r"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 22399C653F3;
	Tue, 13 Oct 2026 15:25:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A03060362;
	Tue, 13 Oct 2026 15:24:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C1CC11D71783;
	Tue, 13 Oct 2026 17:24:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791905054; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ATEZfoBfRkWXUApFpaJ6xPCmlzpvWGWWPheGBZOP4cs=;
	b=SLPMw03rPtHUgOg9J+lE/Nvg06Q2pB8dQ5e/POc2+n/A6caHH6PunTxY5YlgWwYwbF8VPa
	fSN2V8eqhXUJdoLVqjOjfiHmSXpM+OfFAy4Nz8fqeiBJnUJOigabDZx0abjAvkiDWRrq7m
	8kj6avhGkxUFH+1qFAkT0SW4JALvqUGAQ5Rv+l9Woo0jqe0Xgi/Um3ba1aI4WahYSm54tz
	J3GiQQDV37F3fPyftJRCD/OdaFfAWWRJ+b7SrC4y5iKajo+MAl3TdRKQdivMkz+vjrbRk6
	xCNKuu8dYo6Wj4zJhZt0E6QwfyKvjyCaHsukeCfuHGqB+XBxuPdr74II4dNTjg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 13 Oct 2026 17:23:55 +0200
Subject: [PATCH v3 2/3] drm/vc4: dsi: stop using deprecated
 drmm_of_get_bridge()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-drm-fix-of_get_bridge-build-regression-v3-2-0b4c0b65be82@bootlin.com>
References: <20261013-drm-fix-of_get_bridge-build-regression-v3-0-0b4c0b65be82@bootlin.com>
In-Reply-To: <20261013-drm-fix-of_get_bridge-build-regression-v3-0-0b4c0b65be82@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Paul Cercueil <paul.cercueil@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

drmm_of_get_bridge() is deprecated, switch to
of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() returns
a refcounted bridge, ensure it is put by using bridge.next_bridge.

drm_panel.h becomes unused, drop the include.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- fix bridge reference leak in error path
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 0148f2befed1..675bd0fc1391 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -35,7 +35,6 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -555,7 +554,6 @@ struct vc4_dsi {
 
 	struct platform_device *pdev;
 
-	struct drm_bridge *out_bridge;
 	struct drm_bridge bridge;
 
 	void __iomem *regs;
@@ -1165,7 +1163,7 @@ static int vc4_dsi_bridge_attach(struct drm_bridge *bridge,
 	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 
 	/* Attach the panel or bridge to the dsi bridge */
-	return drm_bridge_attach(encoder, dsi->out_bridge,
+	return drm_bridge_attach(encoder, dsi->bridge.next_bridge,
 				 &dsi->bridge, flags);
 }
 
@@ -1749,9 +1747,10 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	dsi->out_bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
-	if (IS_ERR(dsi->out_bridge))
-		return PTR_ERR(dsi->out_bridge);
+	struct drm_bridge *next_bridge __free(drm_bridge_put) =
+		of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
+	if (IS_ERR(next_bridge))
+		return PTR_ERR(next_bridge);
 
 	/* The esc clock rate is supposed to always be 100Mhz. */
 	ret = clk_set_rate(dsi->escape_clock, 100 * 1000000);
@@ -1775,9 +1774,13 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	dsi->bridge.next_bridge = drm_bridge_get(next_bridge);
+
 	ret = drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
-	if (ret)
+	if (ret) {
+		drm_bridge_clear_and_put(&dsi->bridge.next_bridge);
 		return ret;
+	}
 
 	return 0;
 }

-- 
2.56.0

