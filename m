Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9085187F3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858646; cv=none; b=KbPjGT01Bkq5wyeo78yONDpvzB6zVmE6JJV1KhBobU6nb3cqjFWlm08AdlHkG2HvhgWzz8JRIHDpK3ouWTVU4E4+c2xfr2/n9Yxj5ietfUSTr+0pjdbEc3nq1Qe6P/KmnYHFdBFc/ei5K4tDxVp3EU1xk8PBMpwRXH1wjiIs4h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858646; c=relaxed/simple;
	bh=z+AaU/ykCM4uAQ+kMDGiYVjyQbqS/MvdfVUyJg2tnc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KgoEFN3zVJX3f+BEE5IRRmiLb/wWRLpwfC6vvKtYyUCYuQfseFvEKRBoeS+o/CYSDyKUzL/hZICV09VvON1pmtgP7KmUmqdnbasDFojCO47A5chuyRIfCgaEqqgk82LkN3y0NLCHScl3gNdfPnNtsX6hX48GvjQoKs2s/4nDRJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l6E/hJpN; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l6E/hJpN"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2D7EB1A24E0;
	Thu,  1 Oct 2026 12:44:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0068060341;
	Thu,  1 Oct 2026 12:44:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16164103280FE;
	Thu,  1 Oct 2026 14:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858641; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AUKPK9U8OAs79EQDiMTTQ3omvx3FyhTr7rZYJ0m5H1E=;
	b=l6E/hJpNkQvA4979IIyCGoMsI3IbAeqg3adfvKdcQbRoG6V90lKidwMJvnOVOb5XJ1a0Ew
	ZKGpu6EQCbBYPxGD4rm3/mMS4JAyjXINFHmH+9ZIqPLbI9svK+hQzphUTGuF8KtLuQUWXg
	J1w7EqltNnacx2KseALb3/76VS4W+ipguuSFsVwYXMHTqcVm8QFH4TuzmKT7c6BWm3ddeC
	0q+lCn41kKLRWYi1eLllE1C3/ZxMGaHcj12lTOawri9q3GdR9c87zu5wpoBvL9MhWWcP1l
	Xfh2F10t8BKnV2fOUpS78O0xuQ+j63GyrB7PiEU7ZYs9P6C8+wuUET1AXZDReA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:36 +0200
Subject: [PATCH RFC v2 14/24] drm: event-notifier: add mechanism to notify
 about hotplug events
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-14-8e34986dcb68@bootlin.com>
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

In preparation for supporting DRM bridge hotplug, add an event notifier to
allow interested parties to be notified about events they need to react to.

For the initial implementation of bridge hotplug, two events are needed:
bridge detach (happening in drm_bridge.c) and MIPI device attach to MIPI
host (happening in drm_mipi_dsi.c).

For this reason implement the event notifier in a new common file that
event producers can easily use to send events.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

A different approach I have considered is keeping the event notifier in
drm_bridge.c (as in [0]) instead of a new centralized file. But then
another notifier would be needed in drm_mipi_dsi.c for the DSI attach
event. That would be particularly awkward because the designated component
to implement hotplug is the drm_bridge_connector, which would then need to
depend on DRM_MIPI_DSI even though it does nothing MIPI specific.

Changes in v2:
- added missing include

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-12-9d6f2c9c3058@bootlin.com/
---
 drivers/gpu/drm/Kconfig              |  3 ++
 drivers/gpu/drm/Makefile             |  2 ++
 drivers/gpu/drm/drm_event_notifier.c | 58 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_event_notifier.h     | 38 +++++++++++++++++++++++
 4 files changed, 101 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 9bdd9110e754..e661241ed1df 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -33,6 +33,9 @@ endmenu
 
 if DRM
 
+config DRM_EVENT_NOTIFIER
+	tristate
+
 config DRM_MIPI_DBI
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index cadc8529c995..ac75a13592c4 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -94,6 +94,8 @@ drm-$(CONFIG_DRM_DRAW) += drm_draw.o
 drm-$(CONFIG_DRM_RAS) += drm_ras.o drm_ras_nl.o drm_ras_genl_family.o
 obj-$(CONFIG_DRM)	+= drm.o
 
+obj-$(CONFIG_DRM_EVENT_NOTIFIER) += drm_event_notifier.o
+
 obj-$(CONFIG_DRM_PANEL) += drm_panel.o
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
diff --git a/drivers/gpu/drm/drm_event_notifier.c b/drivers/gpu/drm/drm_event_notifier.c
new file mode 100644
index 000000000000..76af4dd4cdb0
--- /dev/null
+++ b/drivers/gpu/drm/drm_event_notifier.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Internal event notifier for DRM drivers
+ *
+ * Copyright (C) 2026 GE HealthCare
+ * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
+ */
+
+#include <linux/module.h>
+#include <linux/notifier.h>
+
+#include <drm/drm_event_notifier.h>
+
+static BLOCKING_NOTIFIER_HEAD(drm_event_notifier);
+
+/**
+ * drm_event_notifier_register - Register to be notified of DRM events
+ * @nb: the notifier block to be registered
+ *
+ * @nb will be notified of events defined in &drm_event_notifier_event
+ *
+ * Returns 0 on success, %-EEXIST on error.
+ */
+int drm_event_notifier_register(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&drm_event_notifier, nb);
+}
+EXPORT_SYMBOL(drm_event_notifier_register);
+
+/**
+ * drm_event_notifier_unregister - Unregister from be notified of DRM events
+ * @nb: the notifier block to be unregistered
+ *
+ * @nb will stop being notified of events defined in &drm_event_notifier_event
+ *
+ * Returns zero on success or %-ENOENT on failure.
+ */
+int drm_event_notifier_unregister(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&drm_event_notifier, nb);
+}
+EXPORT_SYMBOL(drm_event_notifier_unregister);
+
+/**
+ * drm_event_notifier_notify - Emit an event to be notified to registered
+ *                             entities
+ * @event: event ID as defined in &drm_event_notifier_event
+ * @data: metadata associated to the event
+ */
+void drm_event_notifier_notify(unsigned long event, void *data)
+{
+	blocking_notifier_call_chain(&drm_event_notifier, event, data);
+}
+EXPORT_SYMBOL(drm_event_notifier_notify);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
+MODULE_DESCRIPTION("Notifier for DRM components addition/removal and attach/detach");
diff --git a/include/drm/drm_event_notifier.h b/include/drm/drm_event_notifier.h
new file mode 100644
index 000000000000..2457719d50fe
--- /dev/null
+++ b/include/drm/drm_event_notifier.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Internal event notifier for DRM drivers
+ *
+ * Copyright (C) 2026 GE HealthCare
+ * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
+ */
+
+#ifndef _DRM_EVENT_NOTIFIER_H_
+#define _DRM_EVENT_NOTIFIER_H_
+
+#include <linux/notifier.h>
+
+/**
+ * enum drm_event_notifier_event - DRM bridge events
+ */
+enum drm_event_notifier_event {
+	/**
+	 * @DRM_MIPI_DSI_ATTACHED: A MIPI DSI device has just been attached
+	 * to its MIPI DSI host. @data is a pointer to the &struct
+	 * mipi_dsi_device that has just attached.
+	 */
+	DRM_MIPI_DSI_ATTACHED,
+	/**
+	 * @DRM_BRIDGE_NOTIFY_DETACHED: A bridge has just been detached
+	 * from the encoder bridge chain. Emitted at the end of
+	 * drm_bridge_detach(), after removing the bridge from the encoder
+	 * chain. @data is a pointer to the &struct drm_bridge that has
+	 * just been detached.
+	 */
+	DRM_BRIDGE_DETACHED,
+};
+
+int drm_event_notifier_register(struct notifier_block *nb);
+int drm_event_notifier_unregister(struct notifier_block *nb);
+void drm_event_notifier_notify(unsigned long event, void *data);
+
+#endif /* _DRM_EVENT_NOTIFIER_H_ */

-- 
2.55.0

