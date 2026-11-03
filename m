Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745757;
	b=zLjZ9JKZ0FRD23lOvZVEjxtrVqXC9JEXODZ6X20SLbjqcieeD4IMb147IB1ZCefXCF9f
	 h9aDzW8gKRWgJX1RoBp8xoP6QNlb9T4waWClvZRFY2fJYthUBLhKf1jLqe4f536JfbIlc
	 Gxu/vUIgWLCoVgDxKrUFjb9dgEp8EbVJ249/8ceNlA774nRv17IzGVdOn15k65YIJ3UuJ
	 LILS7IydOgrtfO6mm7M7y2HjTmBgcvQxdlW2dj5OvyFVyZBX9v/dkBlyNde5wcc/oEhdH
	 j9GyUBRz8x+i6R2Svd1pnNX+LinGqfrvgJnqxmE1uxUenokZutPjcDCaXBSTu3+7aeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745757;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=JDOFP0lBfi8GeV67m9asGivOpxWxqXgZkhYHVbXSUTg=;
	b=CdmTM/j97wMXAeuuzMs3nw+xWE+lfb+rsrwP54GtFTjhkzXSZE3IG36vJV9CxYgzVHkq
	 dQHOrrv7OPV/pE6fzlROMiHupo67RLqjSoFKzGLRo62QxDrQgU8OD5z81eHmcZx1K1iIY
	 Mh2dA4z3UgqFKP28hewsPO8y79lKrKXPmvUMFFqblT3597FVjxhgngJLlHFjtPYh7Ryoe
	 e1jGBPZy98t5hfkzvCVcYVP+bfZAEtLu8+0d1DZVnccukvK+6ywMiXhDq553nk1q98h2e
	 30O90o0dZ8sHAH27eTHZKSuREKBGEnZxz0y13Nkay9lRBmopkFYHGnjpne+N7rKMhWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ERNW35KG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1058606D81A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ERNW35KG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BBC1F0093A;
	Tue,  3 Nov 2026 22:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793745756;
	bh=JDOFP0lBfi8GeV67m9asGivOpxWxqXgZkhYHVbXSUTg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ERNW35KGsHiVym8/H0/iOko9whJ/J9EGYfN9IFD9bgM6VLE8FcAbzfOHRFKVTiHno
	 nWEj6ogTZeJ6tXM22S+qUWMJlKfSNMa+RMaQzfsPCkjCLYO0m7vb8HpS49DhiwaA70
	 8fOb2gTU6o09dPsLWNfOfsaZE48wJuMt1eMdJceMb2OCb0wgvs4ib8efRxrl0PJKcG
	 FSoL8QhaXx9Gzo23mcNC+Jb4mPm+j0jEeh2S3NE45/gxa92u/3btja60PVh4Ip3+4c
	 z/q7BPLvalkzh1p10d3J7TBrFjbmg78n6EmoHscHVndp8xxBLop7ZnjAb6SNukDls2
	 TDwj1S6egLjDw==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
Date: Tue, 03 Nov 2026 16:42:12 -0600
Subject: [PATCH v11 11/12] drm/bridge: add PS8622 connector luminance
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
Message-Id: <20261103-superm1-backlight-property-v11-11-00cce7b2ba22@kernel.org>
References: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
In-Reply-To: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
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
v11:
 * Track internal PWM mode explicitly so it is still configured with
   LUMINANCE (Sashiko)
 * Don't access I2C while the bridge is powered down (Sashiko)
 * Keep selecting BACKLIGHT_CLASS_DEVICE (Sashiko)
 * Program the committed luminance in pre_enable
---
 drivers/gpu/drm/bridge/parade-ps8622.c | 66 +++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 3a2ec482037df..c88bd7a97d4a4 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -45,6 +45,8 @@ struct ps8622_bridge {
 	struct drm_bridge *panel_bridge;
 	struct regulator *v12;
 	struct backlight_device *bl;
+	u8 brightness;
+	bool internal_pwm;
 
 	struct gpio_desc *gpio_slp;
 	struct gpio_desc *gpio_rst;
@@ -268,7 +270,7 @@ static int ps8622_send_config(struct ps8622_bridge *ps8622)
 		goto error;
 
 
-	if (ps8622->bl) {
+	if (ps8622->internal_pwm) {
 		/* DPCD720, internal PWM */
 		err = ps8622_set(cl, 0x01, 0xa5, 0xa0);
 		if (err)
@@ -276,7 +278,7 @@ static int ps8622_send_config(struct ps8622_bridge *ps8622)
 
 		/* FFh for 100% brightness, 0h for 0% brightness */
 		err = ps8622_set(cl, 0x01, 0xa7,
-				ps8622->bl->props.brightness);
+				ps8622->brightness);
 		if (err)
 			goto error;
 	} else {
@@ -324,6 +326,8 @@ static int ps8622_backlight_update(struct backlight_device *bl)
 	struct ps8622_bridge *ps8622 = dev_get_drvdata(&bl->dev);
 	int ret, brightness = backlight_get_brightness(bl);
 
+	ps8622->brightness = brightness;
+
 	if (!ps8622->enabled)
 		return -EINVAL;
 
@@ -332,6 +336,20 @@ static int ps8622_backlight_update(struct backlight_device *bl)
 	return ret;
 }
 
+static void ps8622_set_luminance(struct drm_bridge *bridge,
+				 unsigned int luminance)
+{
+	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
+
+	ps8622->brightness = luminance;
+
+	/* Applied by ps8622_send_config() on the next pre_enable */
+	if (!ps8622->enabled)
+		return;
+
+	ps8622_set(ps8622->client, 0x01, 0xa7, luminance);
+}
+
 static const struct backlight_ops ps8622_backlight_ops = {
 	.update_status	= ps8622_backlight_update,
 };
@@ -340,11 +358,22 @@ static void ps8622_pre_enable(struct drm_bridge *bridge,
 			      struct drm_atomic_commit *commit)
 {
 	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
+	struct drm_connector *connector;
 	int ret;
 
 	if (ps8622->enabled)
 		return;
 
+	/* Program the committed luminance from ps8622_send_config() */
+	connector = drm_atomic_get_new_connector_for_encoder(commit, bridge->encoder);
+	if (connector && connector->luminance_property) {
+		const struct drm_connector_state *conn_state =
+			drm_atomic_get_new_connector_state(commit, connector);
+
+		if (conn_state)
+			ps8622->brightness = conn_state->luminance;
+	}
+
 	gpiod_set_value(ps8622->gpio_rst, 0);
 
 	if (ps8622->v12) {
@@ -438,6 +467,7 @@ static const struct drm_bridge_funcs ps8622_bridge_funcs = {
 	.atomic_disable = ps8622_disable,
 	.atomic_post_disable = ps8622_post_disable,
 	.attach = ps8622_attach,
+	.set_luminance = ps8622_set_luminance,
 };
 
 static const struct of_device_id ps8622_devices[] = {
@@ -502,18 +532,28 @@ static int ps8622_probe(struct i2c_client *client)
 		ps8622->lane_count = ps8622->max_lane_count;
 	}
 
-	if (!of_property_read_bool(dev->of_node, "use-external-pwm")) {
-		ps8622->bl = backlight_device_register("ps8622-backlight",
-				dev, ps8622, &ps8622_backlight_ops,
-				NULL);
-		if (IS_ERR(ps8622->bl)) {
-			DRM_ERROR("failed to register backlight\n");
-			ret = PTR_ERR(ps8622->bl);
-			ps8622->bl = NULL;
-			return ret;
+	ps8622->brightness = PS8622_MAX_BRIGHTNESS;
+	ps8622->internal_pwm = !of_property_read_bool(dev->of_node,
+						      "use-external-pwm");
+	if (ps8622->internal_pwm) {
+		if (IS_ENABLED(CONFIG_DRM_LUMINANCE)) {
+			ps8622->bridge.ops |= DRM_BRIDGE_OP_LUMINANCE;
+			ps8622->bridge.luminance_max = PS8622_MAX_BRIGHTNESS;
+			ps8622->bridge.luminance = ps8622->brightness;
+		} else {
+			ps8622->bl = backlight_device_register("ps8622-backlight",
+							       dev, ps8622,
+							       &ps8622_backlight_ops,
+							       NULL);
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

-- 
2.53.0

