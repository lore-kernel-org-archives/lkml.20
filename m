Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00D05187D9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858686; cv=none; b=jsUKkjvrZowbzgcw+wDOEziuYVQKSZbj9wpKmC/gfCndfGeIAZ3XYMqnUKmwkQB7yJV9EeHtW/iwcJ1vmq8Z+rjcbNixqA51UG7Sbi8YSba8YIaCtiL5+giAFMC+GI+wQa6l3TuOXwsYtO6zAQpXb4LL9QyfYkdxdzObE11Wyq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858686; c=relaxed/simple;
	bh=vqEzno9sofBWUTy0HmIIKZ5KiuUSa8/ECv5vKa2T+VM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUTg/Dcyg25Y2kixA0ui6rMUb7QqgV8jsA1za8Jnsjafa17gfgfD9sqCQqiLotkbJsoJg0k5lJqMYj9ivf1q7jVf4tpMAkOYMDNzjH0QVYmG2VUFVm4aL/OjiMl9nm4f7ydm7OGCsQnoJYwNVWy537Gz3bmy6zTnicoNwwNhaBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bk0cDzyg; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bk0cDzyg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 612884E416CC;
	Thu,  1 Oct 2026 12:44:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A7A360341;
	Thu,  1 Oct 2026 12:44:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 523BC10328112;
	Thu,  1 Oct 2026 14:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858680; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1Tlnho1brzlMd4ksWzTtyfdq2Zw7j9o87SIUMOY24WY=;
	b=bk0cDzyg1YTT1G/89fCXjKIwa5+qKVwuT+Gst/ZBFW5kBoefdYewguhvKLuLO75angxUuU
	vALs6E1p9sJZsfbLvBADsLVywiyyH90uyZdcFay8tFlGtldvdxzabi7mQf3nEGqUS8jCpi
	M8i5vDcFxbYIgn8Xr71/l3KUAToKemYcv/SeAexWYbBBpeCKUeB0EJ4l2WzuHubrFn6DtF
	M8+xdeLd1pn7op8ArqwuG+SI2yjOYVOFTUA/QdS/Ku5/kw93cyCWwI4956qwsADXUjC260
	4rnqqbSGYWfN8nRqnYfhIAsRtMz+U5ITa9nvOXOn84zvIUxpn1KL7Qw7oThmnA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:41 +0200
Subject: [PATCH RFC v2 19/24] drm/bridge: display-connector: implement
 .get_next_bridge
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-19-8e34986dcb68@bootlin.com>
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

This bridge never has a next bridge. Add get_next_callback func to expose
this.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/display-connector.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index eb3412ec30a0..8b16ad89c7f1 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -36,6 +36,11 @@ to_display_connector(struct drm_bridge *bridge)
 	return container_of(bridge, struct display_connector, bridge);
 }
 
+static struct drm_bridge *display_connector_get_next_bridge(struct drm_bridge *bridge)
+{
+	return NULL;
+}
+
 static int display_connector_attach(struct drm_bridge *bridge,
 				    struct drm_encoder *encoder,
 				    enum drm_bridge_attach_flags flags)
@@ -214,6 +219,7 @@ static u32 *display_connector_get_input_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs display_connector_bridge_funcs = {
+	.get_next_bridge = display_connector_get_next_bridge,
 	.attach = display_connector_attach,
 	.destroy = display_connector_destroy,
 	.detect = display_connector_bridge_detect,
@@ -412,6 +418,7 @@ static int display_connector_probe(struct platform_device *pdev)
 
 	conn->bridge.of_node = pdev->dev.of_node;
 
+	conn->bridge.ops = DRM_BRIDGE_OP_GET_NEXT_BRIDGE;
 	if (conn->bridge.ddc)
 		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
 				 |  DRM_BRIDGE_OP_DETECT;

-- 
2.55.0

