Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B03320CBE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858672; cv=none; b=G5H6ZHxqJ9NPXxpOLZU1BIzKB6AJBMj8VQG8qhsZMDEbLabJehgqHsRMdkQIlI6gRqVHmR0s0C73DxeU0Ip+eYA4ti/rxrxSUyxkoGm+tQdClM5Q9W/8ymNxn6pdBmHvHMAGeGwEBPAZFTONxuv5qqn9/Se4witUqwkQ3y3dIKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858672; c=relaxed/simple;
	bh=imhvzveJ9s46UxKHlEg4I3JFrIMCYKbq0aB6fHD9rwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYFarbkVIiO3DWxvLAwQtsLtBjjIxQLWh9rlw7B9m6Nbc4UIrerZnDcbYAr7Htl3tpCCzWWSQQ4XhlnOpHTpNRY7XFwStepfpOjAlk2YqlJw2Ynn/rzkPRn9Ot3Zl3HwIA6ygR63WcdC3Lywx76zElAJ+zt0D/RdYio0lM2gF1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fFy9NQWq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fFy9NQWq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1F4251A24E0;
	Thu,  1 Oct 2026 12:44:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E302560341;
	Thu,  1 Oct 2026 12:44:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E18E4103280FE;
	Thu,  1 Oct 2026 14:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858663; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aOfkoQ9imkkPwg3cJ8LAELQnUwhwSzX3LqlhAmQUNGs=;
	b=fFy9NQWqfRfFs8FMQ2JGN4Az2Da/aMdqZZ0iWZt57kaTlyuEm3BNALwQb+RM3AnOJm3Lfk
	G+HrlHjQE1GhGLO+vpNN3bb0/hcEZ4YYE8VmIHF5vgiKA7ypqu2RH/jgi4gxjw0BigNE0k
	nTCF7Er28lQi7T+Q/5dtF7BdSY5nkeFpn+X5VHdqxFAfE4ynGms25KLM/GKlfjmcVTy6lJ
	3Yjf78CGhIuiK0cz7GMnIj3UK5wdUxYDEQSX9g/vb46OJwxDGxqAcGtynbRVdC9inKk2R0
	8fkTabyXCdz39kittZO1VkFUWmSZOghJVJCPAmnyz+aDSL7MrNxNvComZgC/Bg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:39 +0200
Subject: [PATCH RFC v2 17/24] drm/bridge: add drm_bridge_get_next() and
 supporting func
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-17-8e34986dcb68@bootlin.com>
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

For bridge hotplug we need to successfully probe a card with an incomplete
bridge chain, i.e. a chain whose last bridge currently in bridge_chain
needs another bridge at its output. Such a card would have no connector,
and be able to add one as soon as the followong bridges are added up to the
bridge that requires no further ones (like a panel or a connector_bridge).

So we need a way to know whether the pipeline is complete in the hardware
(all bridges probed)), in order to complete it in software (attach all
bridges not yet attached). Currently common DRM code has no way to know
that.

Add drm_bridge_get_next() and a supporting get_next_bridge func so each
bridge can expose its next bridge, and whether there's supposed to be one.

A subsequent commit will use this function to detect whether the pipeline
is complete in the hardware or not.

Link: https://lore.kernel.org/r/20260624-vagabond-neon-gorilla-cd6487@houat
Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 28 ++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     | 26 ++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c825e80b9a7f..6a00dba0c2c8 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -710,6 +710,34 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	drm_bridge_put(bridge);
 }
 
+/**
+ * drm_bridge_get_next - return the bridge at this bridge's output port
+ *
+ * Return the next bridge, i.e. the bridge that is connected at the output
+ * port of @bridge. The next bridge might or not be in the encoder chain.
+ *
+ * Returns:
+ * * Pointer to a bridge connected to the output port of this bridge,
+ *   with refcount incremented; call drm_bridge_put() when done
+ * * ERR_PTR(-ENODEV): this bridge has an output port where a next bridge
+ *                     needs to be present for video output, but the next
+ *                     bridge is not currently available
+ * * NULL: this bridge does not have an output port where a next bridge
+ *         is expected
+ * * ERR_PTR(-ENOENT): the bridge does not implement the func
+ * * Another negative error returned by the bridge func
+ */
+struct drm_bridge *drm_bridge_get_next(struct drm_bridge *bridge)
+{
+	if (!(bridge->ops & DRM_BRIDGE_OP_GET_NEXT_BRIDGE)) {
+		drm_warn_once(bridge->dev, "get_next_bridge func not implemented!");
+		return ERR_PTR(-ENOENT);
+	}
+
+	return bridge->funcs->get_next_bridge(bridge);
+}
+EXPORT_SYMBOL(drm_bridge_get_next);
+
 /**
  * DOC: bridge operations
  *
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d..f020e0c2a268 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -62,6 +62,26 @@ enum drm_bridge_attach_flags {
  * struct drm_bridge_funcs - drm_bridge control functions
  */
 struct drm_bridge_funcs {
+	/**
+	 * @get_next_bridge:
+	 *
+	 * Return a pointer to the bridge connected at the output port of
+	 * this bridge.
+	 *
+	 * Returns:
+	 * * Pointer to a bridge connected to the output port of this bridge,
+	 *   with refcount incremented; call drm_bridge_put() when done
+	 * * PTR_ERR(-ENODEV): this bridge has an output port where a next
+	 *                     bridge needs to be present for video output,
+	 *                     but the nextbridge is not currently
+	 *                     available
+	 * * NULL: this bridge does not have an output port where a next
+	 *         bridge
+	 *         is expected
+	 * * Another negative error returned by the bridge func
+	 */
+	struct drm_bridge *(*get_next_bridge)(struct drm_bridge *bridge);
+
 	/**
 	 * @attach:
 	 *
@@ -1021,6 +1041,11 @@ enum drm_bridge_ops {
 	 * &drm_bridge_funcs->hdmi_clear_spd_infoframe callbacks.
 	 */
 	DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME = BIT(10),
+	/**
+	 * @DRM_BRIDGE_GET_NEXT_BRIDGE: The bridge implements the
+	 * &drm_bridge_funcs->get_next_bridge callback.
+	 */
+	DRM_BRIDGE_OP_GET_NEXT_BRIDGE = BIT(11),
 };
 
 /**
@@ -1270,6 +1295,7 @@ void drm_bridge_remove(struct drm_bridge *bridge);
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      struct drm_bridge *previous,
 		      enum drm_bridge_attach_flags flags);
+struct drm_bridge *drm_bridge_get_next(struct drm_bridge *bridge);
 
 #ifdef CONFIG_OF
 struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np);

-- 
2.55.0

