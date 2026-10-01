Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03114A2A5E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858663; cv=none; b=M0JEpzfpmItsud07t8Iqw8sWQbEsAXC4DbUhz2vD6QYZqBrLdwv1Nifht4r7bLfF0kt6WTUKTmD25MPod8ls1Ogv2WrRJwiGpxPQNHGjztqB3u2HT34bjdznse8OtXzeMaeBmipIO5nEDQICbW4KWVJpd5O1+eAhtSel8ErRuQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858663; c=relaxed/simple;
	bh=ksWzs0Nqles4NrPLHoCXXwgwiYjoKXHReGcRvbjtsPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YeiBfDwSfNgwa/t0yDxuZ/Gcv+k1Q7XLqIXbqTsUFO9W/Rsxaa6P8e4sSIjQhE3enh2kWoXh+O+OxXFjVAyn6R9jkwN2HOIyNw9vyONM6SEmoLY+b4hxo1x+AMCu6uN74TxhaiCAtUlERiIgeaTRHE2cq/q0nVsjls82YyJOc0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aBPKzM7g; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aBPKzM7g"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 72BB91A24DD;
	Thu,  1 Oct 2026 12:44:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42C2560341;
	Thu,  1 Oct 2026 12:44:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3F3E103280C2;
	Thu,  1 Oct 2026 14:44:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WapcN4u4O2P2Y+ZdWXKtu9oaGnwPkCOTy0BexZllVJ4=;
	b=aBPKzM7g8VsMMRJ6dD92iJu+e9xBuoG91dnx+NjfTvZY4daWydYrbRK3OEY1q2sDB8QgLa
	bMJe5HarR/RyCZMGwGHePJNbBtVgZbqbsr+VU6pbFQ+fS7r9igQAIxQcAJKk4wAwytNe9q
	vYdW06HwfKqcGXQK8QX7c9zI0ARqj5jAN7xB9A0TEVnZo/d0gjyE+SEdcsxbDTedFjZKRP
	MRhHWm+SOCwcCja8bGdxTXnD0KnhwoaWrKKPjwBqlrFIOmcnfTGiB/zcktScPT/eNFNvsa
	imua9heDWQ+eXKqQLPyxmUrh/I2K6crsDT0gdIef3pDU88Wf2KxQrAkc3lvnjw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:38 +0200
Subject: [PATCH RFC v2 16/24] drm/mipi-dsi: notify about DSI attach
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-16-8e34986dcb68@bootlin.com>
References: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
In-Reply-To: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

In preparation to support DRM bridge hotplug, let the drm_mipi_dsi code
emit an event when a DSI device is attached to the corresponding DSI host,
so that this event can trigger the actions needed to deconfigure the
pipeline and unregister the connector as appropriate.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/Kconfig        | 1 +
 drivers/gpu/drm/drm_mipi_dsi.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 17c86244c75a..59015e89de92 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -45,6 +45,7 @@ config DRM_MIPI_DBI
 config DRM_MIPI_DSI
 	tristate
 	depends on DRM
+	select DRM_EVENT_NOTIFIER
 
 config DRM_KMS_HELPER
 	tristate
diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 3ac1dd5ad640..eaa474da4a51 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -34,6 +34,7 @@
 #include <linux/slab.h>
 
 #include <drm/display/drm_dsc.h>
+#include <drm/drm_event_notifier.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_print.h>
 
@@ -386,6 +387,8 @@ int mipi_dsi_attach(struct mipi_dsi_device *dsi)
 
 	dsi->attached = true;
 
+	drm_event_notifier_notify(DRM_MIPI_DSI_ATTACHED, dsi);
+
 	return 0;
 }
 EXPORT_SYMBOL(mipi_dsi_attach);

-- 
2.55.0

