Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9702D4B95C7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858606; cv=none; b=ujKYr7evhyhYuFSwlKhpoUJZP1NzsXbqa91Q1vsIPR12Yak9VSUZb83wQvbNkiau2CRSh6MVCWorAXw9zEsiN/K5/9B7bEGI3gc/ktt2EtaMr2F71U725wA0ORwm9Kfus04IVHkTcrnViJYfN8EtXVV8oH24jLRm0QDVn+/x4SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858606; c=relaxed/simple;
	bh=U8N1/pEhkWgK5/sCYjqA714FCNpfqmCF6cAcdu+O0no=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pbqxGAB2f6nnLGlX2RhEQGLsl4Y/RR4MZb2Xpq979Z4ERf0YpsANlw4ZeleAoRGiM8+BTiSL/Cl+bVTo9yupx4ao8kBD3RZmRYy8vUBZCDGXjcvcsKxXrXmLYfJ0JBo8shekvOBlabsS0yzd5AlNdB5mepHbBBrFGC2J6WbPd6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hjBDSF0x; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hjBDSF0x"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DA8474E41E84;
	Thu,  1 Oct 2026 12:43:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC37160341;
	Thu,  1 Oct 2026 12:43:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D73901032809F;
	Thu,  1 Oct 2026 14:43:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ND0w8x6SjvxTQcT5Pm7Wq/sYjQ6rNdvUYUeltXYrX2I=;
	b=hjBDSF0xjz9+SLnKqtULk9L55F1t8IHF76eLE6yPLuVb+1l5WFbPCkfQjyi0qfF4PN4t8T
	KgRDk4m8eGkbk4dsTxhAcR0hZkKofIvhOfBv+MUafnzpCefoSZIBcFOFIhmCQtEV76Hen+
	UxAcEvq15ExeMRrovYIVArVwjUTFWSX+w2JdDtbqEbql6L4mhyU/y2bZ5wK28NeRM2PxTe
	oHq0Oq+41eK9MBbFHOOiQUPxitam1w3sOzAUdRxW4qeVahONucK4sa/TrhbQaepQaA7q+9
	14MV+SgjQLxz8KGH1BQ84dIpyoE9ceFiPWg7NDpoPzk7xaleqTuK3VvsDJ26Pw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:28 +0200
Subject: [PATCH RFC v2 06/24] drm/display: bridge-connector: add APIs to
 add/remove the connector dynamically
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-6-8e34986dcb68@bootlin.com>
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

drm_bridge_connector_init() adds a drmm-allocated connector. For bridge
hotplug drmm allocations are not suitable because a connector may have to
be added and removed multiple times in the lifetime of a card.

In preparation for bridge hotplug, add APIs to add and remove a connector
using regular non-managed allocations.

For the dynamic connector, this requires the kfree() the allocated struct
drm_bridge_connector in the destroy func. However that func will be called
even when using the pre-existing drmm API, leading to a double free
(kfree() in the destroy callback + drmm).

One option to avoid this issue is introducing two mostly identical
drm_connector_funcs instances, one with .destroy and one without. But that
would be an annoying code duplication. Instead take a different approach:
always allocate using non-drmm kzalloc_obj(), so that deallocation always
happen in destroy->kfree().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Uhm, maybe the change from drmm_kzalloc to kzalloc_obj and addition of
kfree to the destroy callback should eb a separate commit?
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 24 +++++++++++++++++++++++-
 include/drm/drm_bridge_connector.h             |  4 ++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 1c222e27767d..2a0065208fb8 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -285,6 +285,7 @@ static void drm_bridge_connector_dynconn_destroy(struct drm_connector *connector
 
 	drm_connector_cleanup(connector);
 	drm_bridge_connector_put_bridges(bridge_connector);
+	kfree(bridge_connector);
 }
 
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
@@ -1184,7 +1185,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_connector *connector;
 	int ret;
 
-	bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
+	bridge_connector = kzalloc_obj(*bridge_connector);
 	if (!bridge_connector)
 		return ERR_PTR(-ENOMEM);
 
@@ -1199,3 +1200,24 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
+
+struct drm_connector *drm_bridge_connector_dynamic_add(struct drm_device *drm,
+						       struct drm_encoder *encoder)
+{
+	struct drm_bridge_connector *bridge_connector;
+
+	bridge_connector = kzalloc_obj(*bridge_connector);
+	if (!bridge_connector)
+		return ERR_PTR(-ENOMEM);
+
+	return drm_bridge_connector_initialize(bridge_connector, drm, encoder);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_connector_dynamic_add);
+
+void drm_bridge_connector_dynamic_remove(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector = to_drm_bridge_connector(connector);
+
+	drm_bridge_connector_fini(bridge_connector);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_connector_dynamic_remove);
diff --git a/include/drm/drm_bridge_connector.h b/include/drm/drm_bridge_connector.h
index 69630815fb09..de6ec91dbfab 100644
--- a/include/drm/drm_bridge_connector.h
+++ b/include/drm/drm_bridge_connector.h
@@ -9,8 +9,12 @@
 struct drm_connector;
 struct drm_device;
 struct drm_encoder;
+struct drm_bridge_connector;
 
 struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 						struct drm_encoder *encoder);
+struct drm_connector *drm_bridge_connector_dynamic_add(struct drm_device *drm,
+						       struct drm_encoder *encoder);
+void drm_bridge_connector_dynamic_remove(struct drm_connector *connector);
 
 #endif /* __DRM_BRIDGE_CONNECTOR_H__ */

-- 
2.55.0

