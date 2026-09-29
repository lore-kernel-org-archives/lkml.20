Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93EA52BE32
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689232; cv=none; b=b3zpTEGYzvG+HViXPqnqFr9BZNlNwk9UXaBs0N2NkHH2y1kbk7+0b6o3A0ICvJB1EwtxgYxjW5O3GNwl+YAOX9ORpJQ/x//2kPgfHXcB9pFfODZ3QcVaz5rV/JrFSng6aXpPpnlfHeiIK56mezm/m0yU5SYybp4gQXEFAnKG4Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689232; c=relaxed/simple;
	bh=0iWNLhld3lFsPxN5E4UeLlpeEDRyynqJnPVD9cTTcUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R7SB2ed77Jy0RSpVZLNueh04aQWkcavTjLqOxyo+llG12rf//92Oez6vvzRs1bvM7KtsvURR/IWpytPtxa2FWPb5e3/Cmm98fHtuUr8PXKgsx5YLgpydsuftoJCe9nz6n7UO9M9coC+TTmBT+rRWS6PAKmSqCpgs3LG7K7JBaIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O/xDzm0e; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O/xDzm0e"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4E4654E410B5;
	Tue, 29 Sep 2026 13:40:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CD57601BD;
	Tue, 29 Sep 2026 13:40:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0126E10328265;
	Tue, 29 Sep 2026 15:40:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790689223; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/u2IVc7tSJf7NbmOW9WzJ1BHxJ9bpJ55rD9CrGLTZTs=;
	b=O/xDzm0e2Ld0N89eYmFRCY5RGC0hoWfe0SNaq4egy+h7cGscBQ+ntv9fhm2CvSHmoh97xZ
	Wnv5qdUOW68kfLcSc0zszyYe6CZBPyYYBWYwLiAAbjAXQzpth66rBwD/ytvqYrK1JEeQoY
	bsaWSPHO4t8JqYqx8ZebBejS+9eGTC9hbS8+E/DKbC7/fEaJySf1MEnJM6YgmpB3ROiQBT
	ImL4wzBx46e2wXSnb0QwIzIpy4rc6S5a1zvaV/GxkoTJesKIj3GuXR2lAN0Rr3/y2X67bt
	Hl6GoIKzWgFEpD4KeNL8hA0bSa0d1TmnBVPPkhZyoZDg70f3n9nu7XYy3DqsiA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 29 Sep 2026 15:39:51 +0200
Subject: [PATCH v2 2/7] drm: verisilicon: stop using deprecated
 devm_drm_of_get_bridge()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v2-2-6da431d8f180@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

devm_drm_of_get_bridge() is deprecated, switch to
of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() returns
a refcounted bridge, ensure it is put by using bridge.next_bridge.

Fixes build failure when CONFIG_OF is disabled.

Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to drm_panel.c")
Reported-by: Arnd Bergmann <arnd@kernel.org>
Closes: https://lore.kernel.org/r/20260928161605.2271412-1-arnd@kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609291109.OIsGTysr-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202609290408.BOs7sk55-lkp@intel.com/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- fix bridge reference leak on attach error path
- mention lkp report
---
 drivers/gpu/drm/verisilicon/vs_bridge.c | 11 ++++++-----
 drivers/gpu/drm/verisilicon/vs_bridge.h |  1 -
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c b/drivers/gpu/drm/verisilicon/vs_bridge.c
index dc7c85b07fe3..3a5091c0ac2c 100644
--- a/drivers/gpu/drm/verisilicon/vs_bridge.c
+++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
@@ -29,7 +29,7 @@ static int vs_bridge_attach(struct drm_bridge *bridge,
 {
 	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
 
-	return drm_bridge_attach(encoder, vbridge->next_bridge,
+	return drm_bridge_attach(encoder, vbridge->base.next_bridge,
 				 bridge, flags);
 }
 
@@ -303,8 +303,7 @@ struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
 		return NULL;
 	}
 
-	next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
-				      output, intf);
+	next = of_drm_get_bridge_by_endpoint(drm_dev->dev->of_node, output, intf);
 	if (IS_ERR(next)) {
 		ret = PTR_ERR(next);
 		if (ret != -EPROBE_DEFER)
@@ -321,12 +320,14 @@ struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
 
 	bridge = devm_drm_bridge_alloc(drm_dev->dev, struct vs_bridge, base,
 				       bridge_funcs);
-	if (IS_ERR(bridge))
+	if (IS_ERR(bridge)) {
+		drm_bridge_put(next);
 		return ERR_PTR(PTR_ERR(bridge));
+	}
 
 	bridge->crtc = crtc;
 	bridge->intf = intf;
-	bridge->next_bridge = next;
+	bridge->base.next_bridge = next;
 
 	if (intf == VSDC_OUTPUT_INTERFACE_DPI)
 		enctype = DRM_MODE_ENCODER_DPI;
diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.h b/drivers/gpu/drm/verisilicon/vs_bridge.h
index 70fee1749699..2b0ed94e4520 100644
--- a/drivers/gpu/drm/verisilicon/vs_bridge.h
+++ b/drivers/gpu/drm/verisilicon/vs_bridge.h
@@ -25,7 +25,6 @@ struct vs_bridge {
 	struct drm_connector *conn;
 
 	struct vs_crtc *crtc;
-	struct drm_bridge *next_bridge;
 	enum vs_bridge_output_interface intf;
 };
 

-- 
2.55.0

