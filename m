Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E2048A8B7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192879; cv=none; b=BnzcjH7swv7eiGJiezq1UGfQkPp3n34jNYdSWOufDnn8p3syM5ZjAyj3TAdy0cbZ5Vsr34EbTNiV+qVNPptjRV/kjNeSU/ZCLdtjXpkgj/rcPYzEsCA95Y2lCIOvbv8u6ui/MAE9Gs9qK2cC7DAIcHkesroVePLZTsDD7mAMVzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192879; c=relaxed/simple;
	bh=e/Tak4F3H07WQYkAOUgC/764u76uLj/ncVWOJj0+ICk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vj8nM//+mg318OygdL/MnXw2GSwL8Dwn6hSjs+wgkhUihlmH5+ZBX/GBBMydD7KsbmXAlzYZijYlmoLoa3jypHcNKRseWCNUSIryO2HAL/2Ek+qA5u05UGz9ZOG50MEr9qVRX2YizlO35OXOUNjcDx35TRH/YQmvdnxxmnHAf0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U3boEL05; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U3boEL05"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BA6831A1903;
	Mon, 31 Aug 2026 16:14:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DD9560231;
	Mon, 31 Aug 2026 16:14:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 727E811C78AC8;
	Mon, 31 Aug 2026 18:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788192875; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xp2N0cOy+TiY59aqZ4rVGkxXownNoIYqVRPjYS4Hsao=;
	b=U3boEL05ounHVaCMa0GrNo8HA6zb0PrE9z/ua4r5uSz1VY5qP4yvinh4PmgV6XDjM8FXXI
	nfRsl3BGvJF81sQooGiYqhzfjhmocE4Y5OPVDksLaAtk9gvOaacmKpt6EHSNb9Gz5tDFjQ
	6oZ5LGp1ehm2vCgv/jMYU5DmD+yH309um7m8qtO4l1YC5SbmvrdnKII5J55ZgVtv8tLvIo
	aN7iv9R/VkAF8HGk0LLrEqct/7r4yyK2/v59UsEiMamUT0eMfVSQ8auYA4VqRQAppPFVBp
	n5ILacANZlsQcOm9wZflr1dYap22Bg0iQ2kxYQ2uJNLIFWY2w4be9NXIiQO6Rg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 31 Aug 2026 18:13:34 +0200
Subject: [PATCH v3 08/13] drm/bridge: parade-ps8640: select
 DRM_PANEL_BRIDGE, not DRM_PANEL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-bridge-drm_panel-cleanup-v3-8-50efd8168b3e@bootlin.com>
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
 Douglas Anderson <dianders@chromium.org>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Pin-yen Lin <treapking@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This driver does not use the drm_panel APIs at all, so no need to select
DRM_PANEL.

But it uses devm_drm_of_get_bridge(), which is enabled by DRM_PANEL_BRIDGE.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Jitao Shi <jitao.shi@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 85a9bd53001c..65f4d9d9b67d 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -290,7 +290,7 @@ config DRM_PARADE_PS8640
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  Choose this option if you have PS8640 for display
 	  The PS8640 is a high-performance and low-power

-- 
2.55.0

