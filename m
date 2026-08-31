Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1496486659
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192867; cv=none; b=hxQ9HdtnZiEwEW1pX8UllCB0/O7R+1UZ+b+dHcyt43eQMSeCPJ6wpK0OmLKAYExASHDy5yavn+dLFai7Mkbmi9l8/pXF4UtCTMMZv1DOUQa/dkwQp8+Yjt7dY63Q5Sfkv2T49KqW+fE3P+3e2KeRnTaJkYnOKRGBzJLAbuiTdJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192867; c=relaxed/simple;
	bh=QIGwEnAYWAW3UmmefhMr3rhgYQh/o+FJrJAxYCdnI6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dT2Z/00EKJddN3VC6a2teU4LA5Si1nJjxVgedQYonlAY9nQLk1l3CG07kAgkU7r8P7wct8iAqMpkufQn1ksFGjdOptjwDv0rPPqTTXWwvvkG8AILjiwlRV1xTnP8ldH18xBUExzbJY8PN5+1SZgUbh6F9GDutfDrl37yaZf5i3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J2tBdgbV; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J2tBdgbV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 34E221A1907;
	Mon, 31 Aug 2026 16:14:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0084060231;
	Mon, 31 Aug 2026 16:14:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86C8911C78B96;
	Mon, 31 Aug 2026 18:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788192862; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1xFnzyvbY+1gakmxJcJ6RhkCkSKMzvAZUwHJRdf2VVI=;
	b=J2tBdgbVroRZDoiVMPegJf2WxPeDcUWZ0T8OvBnJnWbANcbAcnZ8o6SyvOOcftXlZb3yeS
	SCr/z9K6SB6hI13cg7qc2vos0eluYIAtEKEcT/zb/xYriLYpaKNa9f7Rd1hQR0VHovPc1m
	0p03Id/2F7RWDLipbDmyyZDsfZWKWwcHQAXwgtYEzj/dA+EcIsMZsmsltAepN0JVKje5oe
	AhEmFZtKAgJY85BTJM2tZC5N1GWiqrT/Qk9pU/iLrMLrq/YwM1kELIQtJelIAvx173kNul
	yPpNYtpp9m3bTv/gRV/OdvcdLsFKCNKPIwePWhh4H8Evy7UoLkaard/vSbQftg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 31 Aug 2026 18:13:31 +0200
Subject: [PATCH v3 05/13] drm/bridge: ti-sn65dsi83: select DRM_PANEL_BRIDGE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-bridge-drm_panel-cleanup-v3-5-50efd8168b3e@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Marek Vasut <marex@denx.de>, 
 Sudarshan Shetty <tessolveupstream@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Herve Codina <herve.codina@bootlin.com>, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This driver uses the drm_panel_bridge API and not the drm_panel API so it
should select DRM_PANEL_BRIDGE and not DRM_PANEL.

Cc: Marek Vasut <marex@denx.de>
Cc: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Herve Codina <herve.codina@bootlin.com>
Cc: Esben Haabendal <esben@geanix.com>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Esben Haabendal <esben@geanix.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index b6754ee505d0..944f2c00bf0a 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -462,7 +462,7 @@ config DRM_TI_SN65DSI83
 	depends on OF
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	select DRM_MIPI_DSI
 	help
 	  Texas Instruments SN65DSI83 and SN65DSI84 DSI to LVDS Bridge driver

-- 
2.55.0

