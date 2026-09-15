Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F044B26F9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490856; cv=none; b=G6ZAXNGsrNkQLxVI1dnahqwHQJsb1Lp9yhJxa5u3ZMIiuJHNZDqhPcn32VzNtYzSSBSjVKjd5KoatuRYl2bzKPxqIfrhRyQ0K2x6s24ybtBGUOYu7bxhFYR6WqQQV3RGKXh7OPHhb+U8R3qhM+79iMQupjusf0oE+BlUJS7rIpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490856; c=relaxed/simple;
	bh=KmCqmJsjgZYpAzFo3lIeupCMcbsbFyerNOu8Szj8jek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=axZx3SF8uexoSlZsmI/rgOzOVOgSJ07L7VDgHkIsFpTIy2l62IylfQ1SbYjpB5W42z9RTZzDf08XkOy4yv1UXIz4FLjt0AOGx5aHeedcPQTUyIBH0/4Qm+IpCz5ZHCOaRtJpqrR6EWu+71TE4TUtJR1f6ZVTWYr97epQk9Skybw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oil6Fp4l; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oil6Fp4l"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2B38BC5CD54;
	Tue, 15 Sep 2026 16:48:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F18F602B0;
	Tue, 15 Sep 2026 16:47:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6515211C7AFFA;
	Tue, 15 Sep 2026 18:47:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789490841; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7QcBWaaEQKdZzuohrRvD5zKSPSt1kcAuIgFhNTdGC4k=;
	b=oil6Fp4lUxFKvGF10XW5JpqcsG58AY9KQQmQYrw9kT1dD+Wf6n4uAnFOoJXABT+e+jY9eL
	T9ifn3sSQWcsJPYYvdRfGPRw5FFn4JeML0+DPX4Kaoh9/CYdqjDgV/oK1O+sXNBZ04UIUE
	XpVOo7c4q/dg1kADI40U4CxgKOeFAF45pUfz6Up6FLboewdCZ+52BnwQurHEUWZ3lZ5gRJ
	apWRGB1xBQ1U+0n17aDT5qWo39wWzDQQQP5S6oEPsuikJHXMNayqEQDxQduSG37yloF2pd
	cwEvX+5vPjMoSi1+ATLo+ZitsN/CJjOfY0zlklzF7Wh2HPxOUYpi9CfJJafXvg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 15 Sep 2026 18:46:21 +0200
Subject: [PATCH v4 8/9] drm/bridge: ssd2825: select DRM_PANEL_BRIDGE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-drm-bridge-drm_panel-cleanup-v4-8-30401d9406f3@bootlin.com>
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

