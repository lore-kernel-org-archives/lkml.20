Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65A03CF21F;
	Tue, 29 Sep 2026 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689237; cv=none; b=HaZWc8GJVqiuKSHbzN/4EzHafmBqeleWVsa8fLIbV7p9F7PMdgzl59182F9LtcRoIJh9i3k021h5Wn8QQKxVEuYGY6Gr6RKguxsSbMAzy0f81UwQ43qT+2uSwgtG2eioeRorSs4GdEAqzuXYMYfcV0fJfCNT1v3kMQvVVp7jT7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689237; c=relaxed/simple;
	bh=dSNhb5/jJsXA7P8MnUVLoH3p63u04AvLNTtba5VUbbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rvDAKnww6YfZ6U0ZPpWLUpq0RTv79NUVYCU8y3AxKCEUNAVdqwuZbeyogn0PdYHaYnHOKF+T9OCuSzxSM5ch5ITg9f21NOx7HXL4crLgHI72kCNbi+H4okyoPm2upex7QPVh4jlQXfkE9d3qS/mYLcxjvDAIHzgWvOjH8bo98F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SFueFONf; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SFueFONf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 489804E410B8;
	Tue, 29 Sep 2026 13:40:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 16DBE601BD;
	Tue, 29 Sep 2026 13:40:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0591103282F2;
	Tue, 29 Sep 2026 15:40:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790689231; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qzQY9dsQ8HXSO1qHO9vK4wagcfimdXnRjdMwL2sl/wo=;
	b=SFueFONfugayF2JQ4uFdRR4CjXg6t3G6on7fazctX6udQYnedB/kv7jlUFTG4B2d2Dj032
	e91GjzSn3GYPYdPeOjZ1p05LfX8pORJRJeHKPsTIWdz1yBeJkncZ9Nf6OjUgrTam69iu6c
	M91R8WOJBM+W6YynZVtCJSpOu0dfms4yS/hQyCM8P9y1gnDC9ET666f+NyYfMDn3wrz7FM
	27pwcjI57DLrK+aeau0WPz5ctzMoUWwLpuWQ8Fqb05/UsbtuCmliw/bDywgarA5O6lLbBA
	t4BlwqL1W8UPLzsucFQsmasz4W6G0dYMr5kxUpv7DzJMQorAfifIEUtQ69yhWA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 29 Sep 2026 15:39:52 +0200
Subject: [PATCH v2 3/7] drm/bridge: dw-mipi-dsi: stop using deprecated
 devm_drm_of_get_bridge()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v2-3-6da431d8f180@bootlin.com>
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
Closes: https://lore.kernel.org/oe-kbuild-all/202609291109.9RGna4XZ-lkp@intel.com/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- fix bridge reference leak on attach error and detach paths
- mention lkp report
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 5dd475fcaacf..22d1b8cbe1d5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -244,7 +244,6 @@ struct debugfs_entries {
 struct dw_mipi_dsi {
 	struct drm_bridge bridge;
 	struct mipi_dsi_host dsi_host;
-	struct drm_bridge *panel_bridge;
 	struct device *dev;
 	void __iomem *base;
 
@@ -333,12 +332,12 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
 
-	bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
+	bridge = of_drm_get_bridge_by_endpoint(dsi->dev->of_node, 1, 0);
 	if (IS_ERR(bridge))
 		return PTR_ERR(bridge);
 
 	bridge->pre_enable_prev_first = true;
-	dsi->panel_bridge = bridge;
+	dsi->bridge.next_bridge = bridge;
 
 	drm_bridge_add(&dsi->bridge);
 
@@ -352,6 +351,7 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 err_remove_bridge:
 	drm_bridge_remove(&dsi->bridge);
+	drm_bridge_clear_and_put(&dsi->bridge.next_bridge);
 	return ret;
 }
 
@@ -368,9 +368,8 @@ static int dw_mipi_dsi_host_detach(struct mipi_dsi_host *host,
 			return ret;
 	}
 
-	drm_of_panel_bridge_remove(host->dev->of_node, 1, 0);
-
 	drm_bridge_remove(&dsi->bridge);
+	drm_bridge_clear_and_put(&dsi->bridge.next_bridge);
 
 	return 0;
 }
@@ -1086,7 +1085,7 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
 	encoder->encoder_type = DRM_MODE_ENCODER_DSI;
 
 	/* Attach the panel-bridge to the dsi bridge */
-	return drm_bridge_attach(encoder, dsi->panel_bridge, bridge,
+	return drm_bridge_attach(encoder, dsi->bridge.next_bridge, bridge,
 				 flags);
 }
 

-- 
2.55.0

