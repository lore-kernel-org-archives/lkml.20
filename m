Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDC93D75D1;
	Fri, 25 Sep 2026 07:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790320101; cv=none; b=EHcbn6JvoyGlW6kfo89nlXrt3QEf+r8sGs0wpmamgyedUUKaWvvc4nvRCT1dw0+WM7ElciBXMGkShO2dQ1qu5EXIMzi4JsqW8StPgYCC5lOHSjJLVBUm29ewlD5RXbVwmRRDzGwBZRdOwz3F+e+mlIZDAFPAG3YF850+EtSj4Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790320101; c=relaxed/simple;
	bh=Ye1Lwu6HhMt9l1l+ih9pWPnf6Cac+RNhY9u/U+CqJrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WXhGF8gj1poFQbAt6iMNJm2HvHRf704ERSs7aahVD1zVy2V1ejgx2Iw9j0rUN034HWdHknKJs5bkk1dBzFvISMvpQcE+Uzd/X9cqzDrCX8kJijyzYkyeDK7KzlpDBNCJwAMV1B0HBa4JKnvPG+oNeI8KI7xT3HW52WMz//xomWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyGhofsf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyGhofsf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46D35C2BCF7;
	Fri, 25 Sep 2026 07:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790320101;
	bh=Ye1Lwu6HhMt9l1l+ih9pWPnf6Cac+RNhY9u/U+CqJrM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lyGhofsf/D78UugMYMcJIxG6o5VmVwwWIVd8bMXMUHGOC39UW7rG6kq//qx9SoNDt
	 cNQSgOQnJ3hdup6OfGilg8YJVHSsGEB8VZU8P0htbDQ6fU7pgwb4XIgOXhzFBipZcJ
	 umb5YBe3anjq4gqXPXkUqoH9SgScHJZELZ7ffcs+PcFePSgnENFlgdFruArCcDJvG3
	 BGPxHTQcBDRfRtLBYRA9ziAHVYf2uQ2YFMjcXwW837r1CB29oVQLMSehYBWTNGedBF
	 oHv5ccS5R01KNs8a1DpugLTaTfmzarCSFw+8viZcjeLzAIrOElPLVAwgIwVyIqMkVK
	 JLepDiu8NWMNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27916C98326;
	Fri, 25 Sep 2026 07:08:21 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 25 Sep 2026 02:08:20 -0500
Subject: [PATCH v2 2/4] drm/panel: visionox-vtdr6130: Add panel orientation
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-rp6-panel-v2-2-19c425e523de@gmail.com>
References: <20260925-rp6-panel-v2-0-19c425e523de@gmail.com>
In-Reply-To: <20260925-rp6-panel-v2-0-19c425e523de@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790320100; l=2208;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=XYfhvMoyxwMtq/M1dOwLhFn0oqv6k+OlxjCG6KQEnFE=;
 b=ugTdYHBOlhgxveZ3vh05Cq9/fm4/x7uPDm7b3ziQhPe6yODtFtKzIESE7H/W+qaTGFQ6quPvC
 t47Uo0vVC37A+4sH5X+mVvp+UFrN8nFzV2zbFuBiwHojSsFTGKz8LrL
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Fetch orientation from the device tree if provided.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
index 6733e0e1d0612..b66d6c7128c75 100644
--- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -11,6 +11,7 @@
 #include <drm/display/drm_dsc.h>
 #include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
@@ -22,6 +23,7 @@ struct visionox_vtdr6130 {
 	struct mipi_dsi_device *dsi;
 	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data *supplies;
+	enum drm_panel_orientation orientation;
 };
 
 static const struct regulator_bulk_data visionox_vtdr6130_supplies[] = {
@@ -218,10 +220,18 @@ static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
 	return 1;
 }
 
+static enum drm_panel_orientation visionox_vtdr6130_get_orientation(struct drm_panel *panel)
+{
+	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
+
+	return ctx->orientation;
+}
+
 static const struct drm_panel_funcs visionox_vtdr6130_panel_funcs = {
 	.prepare = visionox_vtdr6130_prepare,
 	.unprepare = visionox_vtdr6130_unprepare,
 	.get_modes = visionox_vtdr6130_get_modes,
+	.get_orientation = visionox_vtdr6130_get_orientation,
 };
 
 static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
@@ -293,6 +303,12 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 	ctx->panel.prepare_prev_first = true;
 
+	ret = drm_of_get_panel_orientation(dev->of_node, &ctx->orientation);
+	if (ret < 0) {
+		dev_err(dev, "Failed to get orientation %d\n", ret);
+		return ret;
+	}
+
 	ctx->panel.backlight = visionox_vtdr6130_create_backlight(dsi);
 	if (IS_ERR(ctx->panel.backlight))
 		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),

-- 
2.54.0


