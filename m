Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638197;
	b=1HAH6Vzt/zwtcJNC4AE4Jqi37MgUaTU+PYFXlfLHsCuFTzH2gpnPxZHZJt+9KOnEqO86
	 1D+oUrH7O9uQJ5ljZBAsie4iXGjdQmWwiOUuzo0Z+IxuitqOOnoMhBw6JJHSgSfndACSH
	 IgOhSc/pIleWUoyRrjHO2b0MztJXUvXomhzkO4xC/Vi3Se0Y1rjMQjAJAdyj3HvCX4XI/
	 7OGhlRa5j4UMWnRcPbkJ1JOJg7jrffR+it37A5NJxBQzkNbbJ6OkRe4ms3Ld2HETRXTvG
	 y61Y5a0/yc7Ud7/y/hZwPAOGhPo+cgU45aE1uyFlOvtMQ42oOi6r5GrNxijcEoC/QDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638197;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=oRJRMMD3ctMEcVviiDxytRdlmLbWxJT80Ce13o2Sbyo=;
	b=emAOzkbQyzbXvhQpoR+kBay9PEFFhguVly/LZYtg5tDjBkRyRaPzvY9D3GzZLeLH1wDK
	 L5Pcd5sUHAVlmdKaBhBHK6V6zpZqHtkzW+H+hBJB4RqRjWSGO+02xzUoN4CPn7yr39bAw
	 jaRyeeH6GNbWFvDPhah/pDmeqKDDvGeKbIcwDAmPQ8a3Zmifj3dKbvjMp8PHCLIfos4qh
	 XZYz6AcXfEaLydAkhd7ZrtEuP8I4VU8EU6PIJyFkFZwzo5IqMeVG99QyGZZOktnxqmrfr
	 bnUG2QQpxM8rPpQ1VyDnF5VOTlWNMzyFCiC+TdJcUf/rxf5qqSuyWaW8/8Nuajdd+0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MuWq2jam;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31F06072C76
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MuWq2jam
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE081F00A16;
	Mon,  2 Nov 2026 16:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793638195;
	bh=oRJRMMD3ctMEcVviiDxytRdlmLbWxJT80Ce13o2Sbyo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MuWq2jamAXbNo1Xz1TG/MelTuHxU/QDkjNY8A2r74MLF0kgIrW9J9Lh9vTAH5DlvO
	 wByf+MJ7ePvJsu2l+iowPAmRUqHNcmxH4pz6cwPwKQtKdyUuK+NF5Hl5AypF1dA2Ad
	 IPEqidNpl1XAuUx/eqhXekQwyEZOwOkPoxfu1E3CZdzQO3542cG6xuI9n42GT4Lq5f
	 kRnfbMw05gz4v9r4zlrh31fcSnRsyOP5Muky17VgkzADC5+3P4SsKFF/vkSvGZrgd4
	 9hIJkQyMZKG4osAc/yFaHFf9YBOaj6RO0YOYTJl9rbFQo/XmZ39tm+Of3t0u6WJZ4V
	 ZgXhqwnCZaI5g==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
Date: Mon, 02 Nov 2026 10:49:30 -0600
Subject: [PATCH v10 14/15] drm/bridge: add PS8622 connector luminance
 support
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
Message-Id: <20261102-superm1-backlight-property-v10-14-b2a6f24131f5@kernel.org>
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

Expose PS8622 brightness through bridge luminance operations when
DRM_LUMINANCE is enabled. Keep registering the backlight class device
otherwise.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/bridge/Kconfig         |  2 +-
 drivers/gpu/drm/bridge/parade-ps8622.c | 45 +++++++++++++++++++++++++---------
 2 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c7da6b02d7b6b..d27e9b2485fd6 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -278,7 +278,7 @@ config DRM_PARADE_PS8622
 	depends on OF
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
-	select BACKLIGHT_CLASS_DEVICE
+	depends on DRM_LUMINANCE || BACKLIGHT_CLASS_DEVICE = y || !BACKLIGHT_CLASS_DEVICE
 	help
 	  Parade eDP-LVDS bridge chip driver.
 
diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 3a2ec482037df..229d9d7218c4e 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -45,6 +45,7 @@ struct ps8622_bridge {
 	struct drm_bridge *panel_bridge;
 	struct regulator *v12;
 	struct backlight_device *bl;
+	u8 brightness;
 
 	struct gpio_desc *gpio_slp;
 	struct gpio_desc *gpio_rst;
@@ -276,7 +277,7 @@ static int ps8622_send_config(struct ps8622_bridge *ps8622)
 
 		/* FFh for 100% brightness, 0h for 0% brightness */
 		err = ps8622_set(cl, 0x01, 0xa7,
-				ps8622->bl->props.brightness);
+				ps8622->brightness);
 		if (err)
 			goto error;
 	} else {
@@ -324,6 +325,8 @@ static int ps8622_backlight_update(struct backlight_device *bl)
 	struct ps8622_bridge *ps8622 = dev_get_drvdata(&bl->dev);
 	int ret, brightness = backlight_get_brightness(bl);
 
+	ps8622->brightness = brightness;
+
 	if (!ps8622->enabled)
 		return -EINVAL;
 
@@ -332,6 +335,15 @@ static int ps8622_backlight_update(struct backlight_device *bl)
 	return ret;
 }
 
+static void ps8622_set_luminance(struct drm_bridge *bridge,
+				 unsigned int luminance)
+{
+	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
+
+	ps8622->brightness = luminance;
+	ps8622_set(ps8622->client, 0x01, 0xa7, luminance);
+}
+
 static const struct backlight_ops ps8622_backlight_ops = {
 	.update_status	= ps8622_backlight_update,
 };
@@ -438,6 +450,7 @@ static const struct drm_bridge_funcs ps8622_bridge_funcs = {
 	.atomic_disable = ps8622_disable,
 	.atomic_post_disable = ps8622_post_disable,
 	.attach = ps8622_attach,
+	.set_luminance = ps8622_set_luminance,
 };
 
 static const struct of_device_id ps8622_devices[] = {
@@ -502,18 +515,25 @@ static int ps8622_probe(struct i2c_client *client)
 		ps8622->lane_count = ps8622->max_lane_count;
 	}
 
+	ps8622->brightness = PS8622_MAX_BRIGHTNESS;
 	if (!of_property_read_bool(dev->of_node, "use-external-pwm")) {
-		ps8622->bl = backlight_device_register("ps8622-backlight",
-				dev, ps8622, &ps8622_backlight_ops,
-				NULL);
-		if (IS_ERR(ps8622->bl)) {
-			DRM_ERROR("failed to register backlight\n");
-			ret = PTR_ERR(ps8622->bl);
-			ps8622->bl = NULL;
-			return ret;
+		if (IS_ENABLED(CONFIG_DRM_LUMINANCE)) {
+			ps8622->bridge.ops |= DRM_BRIDGE_OP_LUMINANCE;
+			ps8622->bridge.luminance_max = PS8622_MAX_BRIGHTNESS;
+			ps8622->bridge.luminance = ps8622->brightness;
+		} else {
+			ps8622->bl = backlight_device_register("ps8622-backlight",
+							       dev, ps8622,
+							 &ps8622_backlight_ops, NULL);
+			if (IS_ERR(ps8622->bl)) {
+				DRM_ERROR("failed to register backlight\n");
+				ret = PTR_ERR(ps8622->bl);
+				ps8622->bl = NULL;
+				return ret;
+			}
+			ps8622->bl->props.max_brightness = PS8622_MAX_BRIGHTNESS;
+			ps8622->bl->props.brightness = ps8622->brightness;
 		}
-		ps8622->bl->props.max_brightness = PS8622_MAX_BRIGHTNESS;
-		ps8622->bl->props.brightness = PS8622_MAX_BRIGHTNESS;
 	}
 
 	ps8622->bridge.type = DRM_MODE_CONNECTOR_LVDS;
@@ -529,7 +549,8 @@ static void ps8622_remove(struct i2c_client *client)
 {
 	struct ps8622_bridge *ps8622 = i2c_get_clientdata(client);
 
-	backlight_device_unregister(ps8622->bl);
+	if (ps8622->bl)
+		backlight_device_unregister(ps8622->bl);
 	drm_bridge_remove(&ps8622->bridge);
 }
 

-- 
2.53.0

