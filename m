Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874743;
	b=CXTd2fp9Iv3SypTRK/mdfyZRdrcuQaZIdXKMOAwKD3eFeg6pE95ea3gxWKGIeWTb1sjv
	 Iacd7OAMcrjJIF1AwDiZFDrTxub6FL0hf2RD2rGyPebPXS0+GL6w1j1GjxQT6IZPBcTKG
	 onSiHs8e9bjCWHW+gpAIdJ4AQHLNjDCyqF7VwPWr9il4tVAqYzwflammORVERSoL8dl6o
	 PkEPaMuPBW7HzEZ0Qt++hV39eoBU3Xh7fMmGn2r6a60K7+5u/xcWjlFLo7IFR5FSY3scc
	 o07Jq20GEA0A5MIcS8ZntDk37HYzwkSFXF9vrD5EplhnzbzZnAq+FaczvbifpUdQzvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874743;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=NHF/C0B6VR5CCEw0CB0/0Ffnk61+Mmzx7DVRfoty6b8=;
	b=hWRCaBKIJHKd7ZoodgYl61ayS3zSIjf1PnlypmmcFiLzqUlDSLX3l2V45s9IpjS3eAYG
	 Klq8fel9o5C92pELixKMpiQY7N2uMBAWm8I9MNVstQ0k++EQSdDGpBsK/Vro9kbbyLaMb
	 KedVYc/WtJh3i+fbU2oqJqMkwadaTetmM4POlBxWUrMxq4nRHKa2da7kYMKVS5ilnwk8P
	 twWNLdIy/ms7RHC1FLD5pZA4Gln0QakcOTH0ZMUFCE3UXf/B8oKpoSgcyqzR64jfkueBv
	 xFXfRUQu5Wya+hN0Dr2I+NsH1YYJK+hhetdOhI+0Ee6i8zl0ZpI4LxZHLhed0QvBbkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="hNPa0U/x";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEB4606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CEB4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hNPa0U/x
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C7B34E40774;
	Thu,  5 Nov 2026 10:32:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5C795FF85;
	Thu,  5 Nov 2026 10:32:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6A4810329267;
	Thu,  5 Nov 2026 11:32:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793874739; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NHF/C0B6VR5CCEw0CB0/0Ffnk61+Mmzx7DVRfoty6b8=;
	b=hNPa0U/xBGfTsJajA+2APdmifg0n1NzWF+8W1sJfyJepfpVZfvS1zcb6SriKr8XQgHXn8d
	3iOjXJWsp9plUamab3pgrT8Je7IWPJcWXrNpD3JYSwcYSJiZLbxYmSiq4uXwphtfGmL2xx
	QwVIOM2zt9q+s9rAG+CedAUE0SR81mOIKzMmLYosvDrgTGjkoZm3zXy3SoG8o9rKRPKPFv
	n4ovTC4CorsMAOfPgQ4vBUS98kaIrkqY27NqDemiibH8GT+UtGuADg+GWJ38Rue+cNEa+W
	uZUjKUqEB84Hi/L3fgiGseB3VT5g1lzZv4td0i2L68Zq5/GuWtxMQfUGBWYRug==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 05 Nov 2026 11:32:06 +0100
Subject: [PATCH v4 2/3] drm/vc4: dsi: stop using deprecated
 drmm_of_get_bridge()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-drm-fix-of_get_bridge-build-regression-v4-2-906ca343ac1b@bootlin.com>
References: <20261105-drm-fix-of_get_bridge-build-regression-v4-0-906ca343ac1b@bootlin.com>
In-Reply-To: <20261105-drm-fix-of_get_bridge-build-regression-v4-0-906ca343ac1b@bootlin.com>
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

Also remove an outdated comment: now panels are just bridges.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v4:
- Fix next_bridge leak on component rebind (sashiko)
- Remove outdated comment (Maíra)

Changes in v3:
- fix bridge reference leak in error path
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 5ed3c35ee9c7..581b54e04ce4 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -35,7 +35,6 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -554,7 +553,6 @@ struct vc4_dsi {
 
 	struct platform_device *pdev;
 
-	struct drm_bridge *out_bridge;
 	struct drm_bridge bridge;
 
 	void __iomem *regs;
@@ -1163,8 +1161,7 @@ static int vc4_dsi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 
-	/* Attach the panel or bridge to the dsi bridge */
-	return drm_bridge_attach(encoder, dsi->out_bridge,
+	return drm_bridge_attach(encoder, dsi->bridge.next_bridge,
 				 &dsi->bridge, flags);
 }
 
@@ -1748,9 +1745,10 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
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
@@ -1774,15 +1772,27 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
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
 
+static void vc4_dsi_unbind(struct device *dev, struct device *master, void *data)
+{
+	struct vc4_dsi *dsi = dev_get_drvdata(dev);
+
+	drm_bridge_clear_and_put(&dsi->bridge.next_bridge);
+}
+
 static const struct component_ops vc4_dsi_ops = {
 	.bind   = vc4_dsi_bind,
+	.unbind = vc4_dsi_unbind,
 };
 
 static int vc4_dsi_dev_probe(struct platform_device *pdev)

-- 
2.56.0

