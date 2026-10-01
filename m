Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9E84B7141
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858578; cv=none; b=UEjQru0N9dql9FSIsWvXXuWNHxlSw7+UinjeIuiKbyHWwRKKU/6spJtKA7U1a67AEZUGG7K/+FWmz/ajdYJTvuQ7ly8r6H9Ooa9DVm6aKO46Xm1NHUNQbEkciBY/2fF5y7gjBmcHt2QUhZGHPNSBJnCjn5Vny3BnynKUCyS90Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858578; c=relaxed/simple;
	bh=KGYuyJoTgx0qg7PubwTaFnv/TZGl2J/L5naBC1bAsy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iq4J+8eFm/GjTuPyMMrtriYQPw/5AHkw+1vzPXZTPvY232FIooMVxPDrj78kupYrOd+HyN/6WsC30wuaO9TMRoEHrDkQWHnJZUcH8C0oKX94D0hs1s/xVkT20QPGOcTFRdXhBFYpRNvENDXfh3Z9SdNeGl+y9QyeM+SGMOM7ou4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=urbQxXiP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="urbQxXiP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F07A54E42329;
	Thu,  1 Oct 2026 12:42:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BD4F260341;
	Thu,  1 Oct 2026 12:42:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F9F010328128;
	Thu,  1 Oct 2026 14:42:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858568; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D1VRAZh1ZzWmZV8MM5Ev5DkBk/q2Q0JhZsVk9EAJ/vY=;
	b=urbQxXiPlP/xWxv7i27NQOLVk1JjP3uPjm8TTYjCm7N/BJrBVsO2QyIMEELAVCPIDAqAlC
	mEQUJ7xaJYLLRh25emcT62OqvsMkjI0RnLbmNVv9vOxluzovS5rjQpWsywQYtL7HMfeUEM
	HRr2vrD9wb0Ry7T80IuYvFzlsee7mS9rDX3SmZHIKoaqvdhKIQy8OfDO8080VreBNrDFlX
	3jg2eTTitBdZvIUr1IMdEEb571lPCJpKOl7VqcR4bGRLyoeniD3DBwqDLzRAh7sSrO311h
	mk1ZAPJeoYaY+J+kGtheMNH9WWLxjD2Ejbv/TPYNg2kgUXpCRyNeBSa1H8XnAg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:23 +0200
Subject: [PATCH RFC v2 01/24] drm/connector: split
 drmm_connector_hdmi_init() in 3 parts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-1-8e34986dcb68@bootlin.com>
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

In preparation for adding hotpluggable bridges we need connectors to be
created dynamically, both regular connectors and HDMI ones.

For non-HDMI connectors drm_connector_init() already has a dynamic
variant, but there is none for HDMI. Creating one would be easy by creating
a mostly-identical copy of drmm_connector_hdmi_init(), but it is a long
function so there would be a lot of duplicated code.

drmm_connector_hdmi_init() currently has 3 sections:

 1. sanity checks
 2. call drmm_connector_init()
 3. initialize HDMI-specific fields not initialized at step 2

For the dynamic variant, sectons 1 and 3 would be an exact copy, while
section 2 needs to be different.

To avoid code duplication, split parts 1 and 3 to subfunctions. The next
commit will introduce the dynamic variant.

No functional changes. Just moving code around.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- expanded commit message to clarify rationale
- rebased on current drm-misc-next, which required a full rewrite after
  the signature of drmm_connector_hdmi_init() changed in commit
  400c9ede1ea4 ("drm/connector: Add drmm_connector_hdmi_init() with new
  signature")
- renamed drm_connector_hdmi_init() to drm_connector_hdmi_initialize() as
  or it would look like an HDMI version of drm_connector_init()
---
 drivers/gpu/drm/drm_connector.c | 88 +++++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d94c86bfed86..f5bd08640d25 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -542,37 +542,11 @@ int drmm_connector_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_connector_init);
 
-/**
- * drmm_connector_hdmi_init - Init a preallocated HDMI connector
- * @dev: DRM device
- * @connector: A pointer to the HDMI connector to init
- * @funcs: callbacks for this connector
- * @hdmi_funcs: HDMI-related callbacks and capabilities for this connector
- * @connector_type: user visible type of the connector
- * @ddc: optional pointer to the associated ddc adapter
- *
- * Initialises a preallocated HDMI connector. Connectors can be
- * subclassed as part of driver connector objects.
- *
- * Cleanup is automatically handled with a call to
- * drm_connector_cleanup() in a DRM-managed action.
- *
- * The connector structure should be allocated with drmm_kzalloc().
- *
- * The @drm_connector_funcs.destroy hook must be NULL.
- *
- * Returns:
- * Zero on success, error code on failure.
- */
-int drmm_connector_hdmi_init(struct drm_device *dev,
-			     struct drm_connector *connector,
-			     const struct drm_connector_funcs *funcs,
-			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
-			     int connector_type,
-			     struct i2c_adapter *ddc)
+static int drm_connector_hdmi_sanity_checks(struct drm_device *dev,
+					    struct drm_connector *connector,
+					    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+					    int connector_type)
 {
-	int ret;
-
 	if (!hdmi_funcs)
 		return -EINVAL;
 
@@ -613,9 +587,15 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
 		return -EINVAL;
 
-	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
-	if (ret)
-		return ret;
+	return 0;
+}
+
+/* Initialize HDMI-specific resources of a connector */
+static int drm_connector_hdmi_initialize(struct drm_device *dev,
+					 struct drm_connector *connector,
+					 const struct drm_connector_hdmi_funcs *hdmi_funcs)
+{
+	int ret;
 
 	/* TODO: remove after conversion to new drmm_connector_hdmi_init() */
 	connector->hdmi.supported_formats = hdmi_funcs->supported_formats;
@@ -684,6 +664,48 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 
 	return 0;
 }
+
+/**
+ * drmm_connector_hdmi_init - Init a preallocated HDMI connector
+ * @dev: DRM device
+ * @connector: A pointer to the HDMI connector to init
+ * @funcs: callbacks for this connector
+ * @hdmi_funcs: HDMI-related callbacks and capabilities for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: optional pointer to the associated ddc adapter
+ *
+ * Initialises a preallocated HDMI connector. Connectors can be
+ * subclassed as part of driver connector objects.
+ *
+ * Cleanup is automatically handled with a call to
+ * drm_connector_cleanup() in a DRM-managed action.
+ *
+ * The connector structure should be allocated with drmm_kzalloc().
+ *
+ * The @drm_connector_funcs.destroy hook must be NULL.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_connector_hdmi_init(struct drm_device *dev,
+			     struct drm_connector *connector,
+			     const struct drm_connector_funcs *funcs,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
+			     int connector_type,
+			     struct i2c_adapter *ddc)
+{
+	int ret;
+
+	ret = drm_connector_hdmi_sanity_checks(dev, connector, hdmi_funcs, connector_type);
+	if (ret)
+		return ret;
+
+	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
+	if (ret)
+		return ret;
+
+	return drm_connector_hdmi_initialize(dev, connector, hdmi_funcs);
+}
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
 
 /**

-- 
2.55.0

