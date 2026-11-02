Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638190;
	b=scxZ8ay9RwmucnM23UVEUeyz109+FBddimiOX0+hgNi9QWVEEEoNv/nu9l9RyMZMOGRO
	 LoblwX9ENY8/4KIa8nnqVHfxGfNh7MMRbCx/O+jP/M0tJpKauztblUyjcWvLtCfC24IYO
	 fA6GgYi5Iw+flCF0pze0ADkEanhS1SOqZCKf2i0XvoAnvxfIYO6PfEjdLw/PPm+KoULny
	 G0GxMNWEDfzt/HjSLsInJ7I4i4O7qDv9Nyfyft3Dx0j2lrVDvJbJON94D1gymkEdEP0yC
	 /04buSA8lvcWNwuueEek8WUYfMZZpVjO++nxPbZk0jhGTyTQSfbkoqjucCXCxn97GuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638190;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=M0S7Plyxl/wKk/6wjg5hLmpEjTmoWY4ha2B+N9pJ66I=;
	b=VxQRa9g8VxxWDhS/cJEggdlOq6+QX/2aJdOKbvMbUmU5CiR35eC7G0GWXX4s4+lLkhTt
	 iEwbC4Jf1IACDgv6IhphmhU7hy2IG2FCTdwRsWrVvpTtLqt5oLl4wKff4EWiqObpP2X7c
	 kLZ5kMkOULsB2Ci8YnRgLevJpvfvesz2K98TEx3FEY7xD0UKge3cuNRlugH8GK2MAIF1x
	 q62UWsepA3ZFCvIaqXWvmCsfMyIl89n7GACrpK/0o8DXJpuhNp7rOvys9l8O1Qw0Gn60k
	 qX3wc52lEZS2XfCh4jslv4tvb7rC+GF47/2IZbArr29WKhJzBJ6Bynxmhy9kOp2iDuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EYuNMXnF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1948E606D80A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EYuNMXnF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9F71F0281A;
	Mon,  2 Nov 2026 16:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793638189;
	bh=M0S7Plyxl/wKk/6wjg5hLmpEjTmoWY4ha2B+N9pJ66I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EYuNMXnFTGEfJkNkQ41sILvpiahTUv/RWdnx6XdjKtlSZpv863kPTLuI3SGowj+JR
	 cG7eDUw+btu9sVOGc7O+nN1RYMwjP10ay9wArWGIm8zrBKkDnrCJbG323WboiIJDO1
	 skidsKISPF8M1KEJzr2dfIou9EDHkc287N6b48/nbGZFdTtFFzhKi85dg7R+bi8pkq
	 ZJYMc3viPDvMuoMgo/h9eAen+v95Cyp6Qf1zp8dIsD5ePZDDgytPGVNrAtTh5aQnSy
	 Bn9InmAb8Y3o+Sv9h8OwVBkaj9Q1BF3C8IGkSNa44Lmixe8HaJDa40xMcGuHTEhf3k
	 AmBMYCzSuVSNw==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
Date: Mon, 02 Nov 2026 10:49:27 -0600
Subject: [PATCH v10 11/15] drm/gud: add connector luminance support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-superm1-backlight-property-v10-11-b2a6f24131f5@kernel.org>
References: <20261102-superm1-backlight-property-v10-0-b2a6f24131f5@kernel.org>
In-Reply-To: <20261102-superm1-backlight-property-v10-0-b2a6f24131f5@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Cc: Mario Limonciello <superm1@kernel.org>, 
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, 
 Mario Limonciello <mario.limonciello@amd.com>
X-Mailer: b4 0.16.0

From: Mario Limonciello <mario.limonciello@amd.com>

Expose GUD display brightness through the connector LUMINANCE property
when DRM_LUMINANCE is enabled. Keep brightness state in the connector and
retain the asynchronous USB update path.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/gud/Kconfig         |  2 +-
 drivers/gpu/drm/gud/gud_connector.c | 48 +++++++++++++++++++++++++++++++++++--
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gud/Kconfig b/drivers/gpu/drm/gud/Kconfig
index b4d2136942f0e..6c250d3d5e203 100644
--- a/drivers/gpu/drm/gud/Kconfig
+++ b/drivers/gpu/drm/gud/Kconfig
@@ -7,7 +7,7 @@ config DRM_GUD
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
-	select BACKLIGHT_CLASS_DEVICE
+	select BACKLIGHT_CLASS_DEVICE if !DRM_LUMINANCE
 	help
 	  This is a DRM display driver for GUD USB Displays or display
 	  adapters.
diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
index 8141c3a1e30ad..bd7688676e9e1 100644
--- a/drivers/gpu/drm/gud/gud_connector.c
+++ b/drivers/gpu/drm/gud/gud_connector.c
@@ -16,6 +16,7 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+
 #include <drm/gud.h>
 
 #include "gud_internal.h"
@@ -25,6 +26,7 @@ struct gud_connector {
 	struct drm_encoder encoder;
 	struct backlight_device *backlight;
 	struct work_struct backlight_work;
+	unsigned int brightness;
 
 	/* Supported properties */
 	u16 *properties;
@@ -84,7 +86,7 @@ static void gud_connector_backlight_update_status_work(struct work_struct *work)
 	}
 
 	/* Reuse tv.brightness to avoid having to subclass */
-	connector_state->tv.brightness = gconn->backlight->props.brightness;
+	connector_state->tv.brightness = READ_ONCE(gconn->brightness);
 
 	ret = drm_atomic_commit(state);
 out:
@@ -110,6 +112,8 @@ static int gud_connector_backlight_update_status(struct backlight_device *bd)
 	struct drm_connector *connector = bl_get_data(bd);
 	struct gud_connector *gconn = to_gud_connector(connector);
 
+	WRITE_ONCE(gconn->brightness, bd->props.brightness);
+
 	/* The USB timeout is 5 seconds so use system_long_wq for worst case scenario */
 	queue_work(system_long_wq, &gconn->backlight_work);
 
@@ -132,6 +136,19 @@ static int gud_connector_backlight_register(struct gud_connector *gconn)
 		.brightness = gconn->initial_brightness,
 	};
 
+	gconn->brightness = props.brightness;
+
+	if (IS_ENABLED(CONFIG_DRM_LUMINANCE)) {
+		int ret;
+
+		ret = drm_connector_attach_luminance_property(connector, 0, props.max_brightness,
+							      props.brightness);
+		if (ret)
+			return ret;
+
+		return 0;
+	}
+
 	name = kasprintf(GFP_KERNEL, "card%d-%s-backlight",
 			 connector->dev->primary->index, connector->name);
 	if (!name)
@@ -314,12 +331,37 @@ static int gud_connector_atomic_check(struct drm_connector *connector,
 	return 0;
 }
 
+static void gud_connector_set_luminance(const struct drm_connector_state *conn_state);
+static void gud_connector_disable_luminance(const struct drm_connector_state *conn_state);
+
 static const struct drm_connector_helper_funcs gud_connector_helper_funcs = {
 	.detect_ctx = gud_connector_detect,
 	.get_modes = gud_connector_get_modes,
 	.atomic_check = gud_connector_atomic_check,
+	.set_luminance = gud_connector_set_luminance,
+	.disable_luminance = gud_connector_disable_luminance,
 };
 
+static void gud_connector_set_luminance(const struct drm_connector_state *conn_state)
+{
+	struct drm_connector *connector = conn_state->connector;
+	struct gud_connector *gconn = to_gud_connector(connector);
+	unsigned int luminance = conn_state->luminance;
+
+	WRITE_ONCE(gconn->brightness, luminance);
+
+	/* The workqueue will apply it to the hardware */
+	queue_work(system_long_wq, &gconn->backlight_work);
+}
+
+static void gud_connector_disable_luminance(const struct drm_connector_state *conn_state)
+{
+	struct gud_connector *gconn = to_gud_connector(conn_state->connector);
+
+	WRITE_ONCE(gconn->brightness, 0);
+	queue_work(system_long_wq, &gconn->backlight_work);
+}
+
 static int gud_connector_late_register(struct drm_connector *connector)
 {
 	struct gud_connector *gconn = to_gud_connector(connector);
@@ -334,7 +376,9 @@ static void gud_connector_early_unregister(struct drm_connector *connector)
 {
 	struct gud_connector *gconn = to_gud_connector(connector);
 
-	backlight_device_unregister(gconn->backlight);
+	if (gconn->backlight)
+		backlight_device_unregister(gconn->backlight);
+
 	cancel_work_sync(&gconn->backlight_work);
 }
 

-- 
2.53.0

