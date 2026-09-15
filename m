Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339F34052A6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490854; cv=none; b=eu4UfxXISPdVMow4vriGZ5Fb7Scc3Rpa91kgiPpsggPbARyAGcIyeb3W/Fv+Gle6bh49laWHCwEuQP0ZOsodMPzwh0ahQL7rSRiJzJFRJcnsKldrwh7cIt/9sYbH9dSh0AuV1TjBFHCKEUAI72FH0KCEa4EzPB9vKxC9v2e6MZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490854; c=relaxed/simple;
	bh=63t79/wk2NmqMGUVtjcMqlA2Esvn1DCGQ9HtH0zvU70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zv3Sb338gR29qwkNUdy7aR9JjdCnHKf/MwgxWcQeEvO2EfrWj4ZZQHCBVhhxhox3mpxsg2G49KEqIATu0FvbetKzvOa2ztWHH3hpHhETgMpM5m4/wOb9/CQgoIC+U/xfhdYqQEdUt1i/w6VZWAt86dWwWi/v7NfEAYBJbCpg4po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hme8c/ZZ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hme8c/ZZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5DAA71A0815;
	Tue, 15 Sep 2026 16:47:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 312E0602B0;
	Tue, 15 Sep 2026 16:47:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3F1D11C7B005;
	Tue, 15 Sep 2026 18:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789490837; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=asHhcWK0Xqz3or0oLNmGpjADbooqi5HN3ZH3Pieglwc=;
	b=hme8c/ZZPHmsKAAS8YXw1tajbiCNNs97s4J3lTJs0tWwLrXp6YIx/1M2ISQPqHvDygLNY7
	ogYzCpgbOUoAsY7TNdQWujBHAOn3wZzO+cHxQ971PmB0tmihRxqboQmvgbvUOQekykEVbx
	s3WT/8h0Zl1F5wrp63HuWI9jL6F3QAU4zCbTeLGGiF0ZMvj+xVE3idbIeowrCfYyJVrRbG
	H/3XA5ASC3PVkA4+b94dUr81YbD7/xhQOPPYcEzpwsNR9cvhb1bRbsS8fjdmeBtWrC2TFI
	5JGMNdbkyBnB0aHEpAnUITdjNLaUBdR+ODPH2nNXlGQWrb3rnJ5asUActHzmQg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 15 Sep 2026 18:46:20 +0200
Subject: [PATCH v4 7/9] drm/bridge: tc358768: select DRM_PANEL_BRIDGE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-drm-bridge-drm_panel-cleanup-v4-7-30401d9406f3@bootlin.com>
References: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
In-Reply-To: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This driver uses drm_panel_bridge_add_typed() and
drm_panel_bridge_remove(), which are enabled by DRM_PANEL_BRIDGE.

Leave the 'select DRM_PANEL' because it is needed for drm_panel_put() which
the driver uses.

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a4bc1b5401c0..73e13ad59a93 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -410,6 +410,7 @@ config DRM_TOSHIBA_TC358768
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	select DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
 	help

-- 
2.55.0

