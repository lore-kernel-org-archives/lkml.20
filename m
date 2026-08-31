Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8757239B972
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192913; cv=none; b=DtrZUV94yJrNjL8sQRRzZPvCw0jDPTeT/9z3/AbbV4cBR/WlVoh2VuvaiRLDSPIFVPkWl0VzpAWTqyKlZVGIvcDH/vznlR3KaeUFT8g1/KdvZaAWlLK+y776QSU6Ltdc2bDkmZZ7aG9DRz3JD8nTgebdGjXMwU/O7hD0kxIvN/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192913; c=relaxed/simple;
	bh=/U5zpG8r+DhkMalFm7WhbCJVXzYhF2k2zPzgleG5DDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGXLj2ZTDB9BLhF7Hq68an9Zpp34DIXa4/Kstg5q1tWuYAwvjJ/PEER76DyufLkJ7mL6Tmwxbqve1XZyAWulIPma6TCjG+yP6o0efoinXX6e4nGzXme5X4lzX1Z81Jke04GIbcEd3oU/vg8c5ZNH4HCF5v8eeVk9+TOloMfzIao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ej6u9ZW9; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ej6u9ZW9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0C7814E4147F;
	Mon, 31 Aug 2026 16:15:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D151360231;
	Mon, 31 Aug 2026 16:15:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86CCF11C7922B;
	Mon, 31 Aug 2026 18:15:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788192907; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QLrtm4PjnIPMZjGOBkD2GjpIeV2schSUM6vZ//r0E74=;
	b=Ej6u9ZW9pubc1ChmjbF1r7gwKgdbCx8SMZe+c9nMLnjyROr8ln2hFeT8KSNWRnyaGIeCuF
	hZcu6UjYnhuk63QAB87l4NRBR6LQLOSoLTdOl32t2npOxnMxKkDG1bmbYmbr+HtBXJe+/+
	2SfVffkTEXLY/dM10s69O7aEImdOsUASybouxPzMUE03CO9jJHjM45FZ99uR3f1U7ZMoDJ
	fQHl/WJxsX5VDPonJsdgVNtLGKORGy9iBOv8yqC/lJec4mRdIiVU7DzlMHLHNMJqZIE42d
	/u+MF0gIbk8HKkp8asbNBls6CpIq10blHXkB9t303KwMfqKhoRsH2slyNtNxnw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 31 Aug 2026 18:13:39 +0200
Subject: [PATCH v3 13/13] drm/bridge: tc358764: select DRM_PANEL_BRIDGE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-bridge-drm_panel-cleanup-v3-13-50efd8168b3e@bootlin.com>
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
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This driver uses devm_drm_of_get_bridge(), which is enabled by
DRM_PANEL_BRIDGE.

Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Suggested-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260825103234.3F2B71F000E9@smtp.kernel.org/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch is new in v3.
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 92938df3b747..f2db7f60d40f 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -389,6 +389,7 @@ config DRM_TOSHIBA_TC358764
 	depends on OF
 	select DRM_MIPI_DSI
 	select DRM_KMS_HELPER
+	select DRM_PANEL_BRIDGE
 	help
 	  Toshiba TC358764 DSI/LVDS bridge driver.
 

-- 
2.55.0

