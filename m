Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49E14AF9EF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490840; cv=none; b=ThrQW3M5h06c97Q894d3d0phDYl9VCbUDhcXy3S4v+nh0rIaI68XNtoBnGN78kxrWfUpnXVInGmIU6Q9nL59shlw7IFd/2lzPxKY1pdeucxYMNgGrTuZD9i0tm4v0vM+qWa33Gj+FCQbWXAwXGAT0HkVQe/Mv3VboaFpONSndpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490840; c=relaxed/simple;
	bh=0AYPs2Wqdz4DsyAs3jOV8HfcLS/wzwQS23ZSUiANIAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CWGs8BJmUbLfgv9SUoDiV8c+pPtDNlzx3gFN3Jeq/h0mXrffr5EwdrCOU6xXWJvMHhm5EImttNtPb9ler4MG/dfhrxHIzzogdxJpnRqkaQX1w0LB/hlR5ssHGP3qQ/75+6K0A7SUd27z+IlJNb3cLwRth6fuaRGSkXJzSK8wtHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2OdrkAYb; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2OdrkAYb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BCACC1A0827;
	Tue, 15 Sep 2026 16:47:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FDC5602B0;
	Tue, 15 Sep 2026 16:47:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 331BF11C7AFDA;
	Tue, 15 Sep 2026 18:47:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789490825; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g8oxrJgI4DlQCKYb+mTgrYUPdm2is++2ExLzzDokFSQ=;
	b=2OdrkAYbByzuEX8pxvEC7fssdfI480zw8qGLV71m5d+RRl1Iyr8Tn2M4Xw585Lqm3YiaM9
	ktInnXZZX2sYq+Lv5ij9DejURg8UKH+t3XnG6Uxy3px/HIb1QRaPULHasPOcDibgxbmpN6
	hQ+iGX61w2RKvyesAz5StmKdjm/Y+lsLsTKBIIP9pL8SxGabsY7PzC1frgKiF2YBmu+wyI
	qtATH+qzcHyWGr4/VI9qJCdqi9YaAhGBVJad8cPeTACZvIB5+/Rx8PzYUBJQMm0sRBDxLk
	zH8zQy/4SWSeVgbiVbCJ4tsCBs1PtVLLzvXkApti4e5RqcJl61d5YlU/y8vByA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 15 Sep 2026 18:46:17 +0200
Subject: [PATCH v4 4/9] drm/bridge: parade-ps8622: select DRM_PANEL_BRIDGE,
 not DRM_PANEL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-drm-bridge-drm_panel-cleanup-v4-4-30401d9406f3@bootlin.com>
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
 Vincent Palatin <vpalatin@chromium.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This driver does not use the drm_panel APIs at all, so no need to select
DRM_PANEL.

But it uses devm_drm_of_get_bridge(), which is enabled by DRM_PANEL_BRIDGE.

Cc: Vincent Palatin <vpalatin@chromium.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 1d4db73bd760..65f4d9d9b67d 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -276,7 +276,7 @@ config DRM_OF_DISPLAY_MODE_BRIDGE
 config DRM_PARADE_PS8622
 	tristate "Parade eDP/LVDS bridge"
 	depends on OF
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
 	select BACKLIGHT_CLASS_DEVICE
 	help

-- 
2.55.0

