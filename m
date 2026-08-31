Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037BE48C40B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192907; cv=none; b=uDJO3S3so01rHSchu0r5Eyy4oj9LtR7YtzT0E7kO+X9wlOqUGBd1Ii3cD0v+zBo7m+16yOZOw5dP8hLqgtgaIyqZ4aeVSbBMKNUYfAunwfHPpG2nKgQ8ByreXlrZqI5TmOlgcGyhGsxa77TUqTTFgb+P3MFvhYtNsoqcRrOwW6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192907; c=relaxed/simple;
	bh=KmCqmJsjgZYpAzFo3lIeupCMcbsbFyerNOu8Szj8jek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j/In0MMIrVXpRq/kp56LgSaEoKQwbx+Bxu/y2OQ6meM0YbWZDcX7KnPI0ISFHWMyRdlRXrAm3M1cXftyw9wOIwU7EhsvQMajcu6PTQrqsPBhGvSgQtTDF3UlUfD1t3CNtiUdO6ekHPxNALzS5r4xvn9ZfSMeHpTvPdD9yNmxOCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZCjmWfKz; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZCjmWfKz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AEE2A1A1903;
	Mon, 31 Aug 2026 16:15:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8321F60231;
	Mon, 31 Aug 2026 16:15:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E700211C7922A;
	Mon, 31 Aug 2026 18:14:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788192899; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7QcBWaaEQKdZzuohrRvD5zKSPSt1kcAuIgFhNTdGC4k=;
	b=ZCjmWfKzLnRzpCdJ/mJs1ymsbnwN6n4x1GxEt4jX6mw7bn0muFOF9TshCdtxe5fOCVUWLY
	3vy8bDnX1Km4g2at1QGkuVHfj8otKneROHukhWzZGJ5Vo71xMeTx9nqW+eB5UR5IKochAS
	iIksApnZ0Fibs+Mj4qrf1YuFlLMDlEYmTWP/HntIp31uiULAlJ8dhMhKqqvWnYNmtQWXQH
	DUeZL6IBvoASQbX/Y52mWxoAX5E1hYhfm6F7oI9Qf31m9tlGrer2Zc8s9DUc0Bwc/h/8Dr
	w8c+RaRTC5JRHyr5dk503HvdSlrbJyA4BsBJ8MF4DxpaIQGmQfqKP6hnvESKsA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 31 Aug 2026 18:13:38 +0200
Subject: [PATCH v3 12/13] drm/bridge: ssd2825: select DRM_PANEL_BRIDGE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-bridge-drm_panel-cleanup-v3-12-50efd8168b3e@bootlin.com>
References: <20260831-drm-bridge-drm_panel-cleanup-v3-0-50efd8168b3e@bootlin.com>
In-Reply-To: <20260831-drm-bridge-drm_panel-cleanup-v3-0-50efd8168b3e@bootlin.com>
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
 Svyatoslav Ryhel <clamor95@gmail.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This driver uses drm_panel_bridge_add_typed() and
drm_panel_bridge_remove(), which are enabled by DRM_PANEL_BRIDGE.

Leave the 'select DRM_PANEL' because it is needed for drm_panel_put() and
drm_panel_enable() which the driver uses.

Cc: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 73e13ad59a93..92938df3b747 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -351,6 +351,7 @@ config DRM_SOLOMON_SSD2825
 	select DRM_MIPI_DSI
 	select DRM_KMS_HELPER
 	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  Say Y here if you want support for the Solomon SSD2825 RGB/DSI
 	  SPI bridge driver.

-- 
2.55.0

