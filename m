Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F334EBAD9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905057; cv=none; b=FCRHxWzKGUhHj8nPsSaY1B1OSSVajCRKyQZeia/wdUQXW1/Nu0lhNdd/9M3SKKeXmg1TkypzclNLHlGFAtq9McgrKlMyNQde0rV9be41G8rSRdcmwympAn9S3ERLz5l+ClSUyUqrTMTUDs5vvJyGOoFgCimv+75DbK3u6QhEsno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905057; c=relaxed/simple;
	bh=DOliu9sWvSRxH/haIckng8oqvfrouYtVhCwjib+gRJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hFRSML6R+2VUj17WRL5FcJ4ey3PQlirvJshiF89N3RXgIovPMiDNf0PIRO6JlCvDebvivo9V1/oThTDOywBaZJvcKru6bQiuiJN/cFYMkn56Hrg0jNKfmQAirlpmkge5Mr42xGNL5Ut5X1c3abZxH1dA6r9xLlv4FVnK2kBRVaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DDr4BJih; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DDr4BJih"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2EB211A1206;
	Tue, 13 Oct 2026 15:24:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0250860362;
	Tue, 13 Oct 2026 15:24:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AB3811D716CA;
	Tue, 13 Oct 2026 17:24:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791905051; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=B3fsmZl8vkEfky5YLwYCVAhKrRI48YT1fZwtM+Sy3BE=;
	b=DDr4BJihOrC/kLjKTlKIeZ+2TrdI3p9nvQ7AKsOC3vsFkp8JpMaYG5r63+sBEX20n6MiQn
	qJhD+DRXufVJNclvHnpOkVQF9+eEzI1TwFDnirgChX5zizkeUmM3559x5cp1OwYsvbBP7C
	mkazCvi8qSD3TB78jwqbYee0RQ32IWm63bR4/b/Oegn0SrxxrRVEvFkr24cWyZ6RAOfCT3
	USsKwm5RecN9WczaNRk5zDEo9Es6DdqTA9yxK+y04gjb8j5Yrdpnd9qzlAWlp3Fopne7f5
	OVpnJJlQxikYzDD9uipg2//svX6yrxEQyYLet9sdzn4KHTeKeaXuL7WT0coixw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 13 Oct 2026 17:23:54 +0200
Subject: [PATCH v3 1/3] drm/vc4: dpi: stop using deprecated
 drmm_of_get_bridge()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-drm-fix-of_get_bridge-build-regression-v3-1-0b4c0b65be82@bootlin.com>
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
a refcounted bridge, ensure it is put.

drm_panel.h becomes unused, drop the include.

Also remove a comment that is now obvious: now panels are just bridges.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- re-add and update comment
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 53f36626a50d..feefefcf3ad7 100644
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
@@ -279,16 +278,13 @@ static const struct of_device_id vc4_dpi_dt_match[] = {
 	{}
 };
 
-/* Sets up the next link in the display chain, whether it's a panel or
- * a bridge.
- */
+/* Sets up the next link in the display chain */
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
2.56.0

