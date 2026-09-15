Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5819B4AFE3D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490842; cv=none; b=az+2wVjMjkcG8U10QsQmgu/UMfbqb3CPBQqEOvFVux4w96LAcSGB4XeZDoRFFFgigbdco7SFuzjCjaP2oy+bcQ7qVuOyv7+I64+v9FSTM3lQRsOHGyGBVNpRlFmZV5TIXWYIeht4Qtrg+Bvnpl09K40af0i1zOTUE0NfORPgAm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490842; c=relaxed/simple;
	bh=A5I1hDJ9rJVsPiJpYuBRbKUIUD4wM8izun6Hzn9Xbtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ls6fyFX9tFORtOeVI9ncncS0IuoF0UPeO4Ns9xUn6StKER8TfGoFbJ7gPGsWtR+3iaMvfRyqaqCtMxyl4cH5gTEvsL16Zclt2pHVqmBsxKhJDMqAtOu+ySYbukZG5xZTvgsOt0AbOQYmTKDvXCWfGDbQek+RSTdIAGHjtxgcG4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BYjV5xyS; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BYjV5xyS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EAD794E4063F;
	Tue, 15 Sep 2026 16:47:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6F82602B0;
	Tue, 15 Sep 2026 16:47:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAF8611C7AFE9;
	Tue, 15 Sep 2026 18:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789490829; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EjicvGqkSrsJUQu/V2bDvrATSZ5gFUEV+GL7szDeTF8=;
	b=BYjV5xySY6DjHBybQdkBwpd/o13W4UJaSd50ibfYqddE0WmnwB1yC6DyN04yemFmm8mkzU
	eDmwD9EOyHVkJ5glBuJflq7aaugksOQ/enyKDccb3wiAjDWMboj3rBnseB9tgqdmxUYk/f
	+KK3i+HYxw26wui2Ht5NopAy0a0gg6+oNcAiwhYgrrqpsC259bRYjwnL2XA7RriJDck7gd
	8jds2v140yTOiNQbaQiMml0Wdkwbho9pOqK0lVA1KI3ir9Ohzvuk5XJh+M9tXSok3+iwJ6
	rv8PQFw/VNhh/Ylqz95B3PrBGuQlMqKhbrtsFof870HYvjw7RAI6t7Nv6PZLJA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 15 Sep 2026 18:46:18 +0200
Subject: [PATCH v4 5/9] drm/bridge: tc358775: select DRM_PANEL_BRIDGE, not
 DRM_PANEL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-drm-bridge-drm_panel-cleanup-v4-5-30401d9406f3@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Tony Lindgren <tony@atomide.com>, 
 Michael Walle <mwalle@kernel.org>, Vinay Simha BN <simhavcs@gmail.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This driver does not use the drm_panel APIs at all, so no need to select
DRM_PANEL.

But it uses devm_drm_of_get_bridge(), which is enabled by DRM_PANEL_BRIDGE.

Cc: Tony Lindgren <tony@atomide.com>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Vinay Simha BN <simhavcs@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 65f4d9d9b67d..e2ee76899468 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -421,7 +421,7 @@ config DRM_TOSHIBA_TC358775
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	select DRM_MIPI_DSI
 	help
 	  Toshiba TC358775 DSI/LVDS bridge chip driver.

-- 
2.55.0

