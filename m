Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA0E4FD269
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858586; cv=none; b=BP9MmvVLDJ2jGc24olYeGhT/DzpCq8Msmwyg7Wm2wzYielcgQYIKfxONf0DjmMFWkMiSgj7AUko93cF6XntJpej3NpyYLbOgopkOxJWjPtAkDryLkbfjc+zpEmUltTGkQXsmF5+VyBOwtoffyczQXuR3Jm2tccWEOWVoVudirdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858586; c=relaxed/simple;
	bh=KF/Qu/0gsfa33ntx/RWczeDGw4/dEfXenXdAb2o5o1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5Zv3SjdWJMhMFiHoNCooYy/lizBJJTIviNqo8Jx0UWJ/gZSZ6rOlGRMoLfeZ53f9IMir/JspRFsA4oq2z5PDrY0/2hzXURBChnybOn2vsTGCKr2lnSQr/KJxYt63YYJBUgN+GO344s7dHnBBAjSFdv6rW0LyJHyzH1eWk5L6bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YAuT9Wp3; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YAuT9Wp3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 435B91A18DE;
	Thu,  1 Oct 2026 12:43:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 083E260341;
	Thu,  1 Oct 2026 12:43:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5930710328112;
	Thu,  1 Oct 2026 14:42:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858577; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i5Z3bJt46CPEmDU7cFKYbz4SNeEy4GjbkdDR4/WWzvg=;
	b=YAuT9Wp3cfXOBkE+gTazN0+HCqHYvNj2scp5Mul69TeqDXSt7EUg+E/OGZb88mzr/F3nF2
	RLxKzWvEeJKoa4I3gbW+Mdx4DqO6Vp22k07NmAoG1RqN7IsqcI+IoxJUXj4Y9+oHekgAC1
	E/KnqnnMcU7t/+8R5mSivpg79K/0xFa/2Eu2tVYrYBT9q56wD7KlRVME/VVAiU9N4iRBKp
	J9SfTAf/ir/6dKiB4myDV4FUgatnn5HsMUDrZdnXwn0IU+DxsfbkBuAe6iH4viAJ9kwA5E
	esPdi5rOhd0hkGJp0SXTgDVkdtKxfkpnPDsd8zdySSQtu4yZlM6/mD8UO/3aDQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:24 +0200
Subject: [PATCH RFC v2 02/24] drm/connector: add
 drm_connector_hdmi_dynamic_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-2-8e34986dcb68@bootlin.com>
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

In preparation for adding hotpluggable bridges into the
drm_bridge_connector, we need connectors to be created dynamically, both
regular connectors and HDMI ones. drm_connector_init() already has a
dynamic variant, add one for HDMI connectors too.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- rebased on current drm-misc-next: now drm_connector_hdmi_init() can fail,
  so call drm_connector_cleanup(connector) if that happens
---
 drivers/gpu/drm/drm_connector.c | 42 +++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  6 ++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index f5bd08640d25..f264cab0d184 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -708,6 +708,48 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
 
+/**
+ * drmm_connector_hdmi_init - Init a preallocated dynamic HDMI connector
+ * @dev: DRM device
+ * @connector: A pointer to the HDMI connector to init
+ * @funcs: callbacks for this connector
+ * @hdmi_funcs: HDMI-related callbacks and capabilities for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: optional pointer to the associated ddc adapter
+ *
+ * Initialises a preallocated dynamic HDMI connector. Connectors can be
+ * subclassed as part of driver connector objects.
+ *
+ * See drm_connector_dynamic_init(), the same constraints apply here. This
+ * is just the HDMI version.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_connector_hdmi_dynamic_init(struct drm_device *dev,
+				    struct drm_connector *connector,
+				    const struct drm_connector_funcs *funcs,
+				    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+				    int connector_type,
+				    struct i2c_adapter *ddc)
+{
+	int ret;
+
+	ret = drm_connector_hdmi_sanity_checks(dev, connector, hdmi_funcs, connector_type);
+	if (ret)
+		return ret;
+
+	ret = drm_connector_dynamic_init(dev, connector, funcs, connector_type, ddc);
+	if (ret)
+		return ret;
+
+	if (ret)
+		drm_connector_cleanup(connector);
+
+	return drm_connector_hdmi_initialize(dev, connector, hdmi_funcs);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_dynamic_init);
+
 /**
  * drmm_connector_hdmi_ini2 - Init a preallocated HDMI connector
  * @dev: DRM device
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 2ee7c59329aa..48bbbc365c93 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2743,6 +2743,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc);
+int drm_connector_hdmi_dynamic_init(struct drm_device *dev,
+				    struct drm_connector *connector,
+				    const struct drm_connector_funcs *funcs,
+				    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+				    int connector_type,
+				    struct i2c_adapter *ddc);
 int drmm_connector_hdmi_ini2(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const char *vendor, const char *product,

-- 
2.55.0

