Received: from mail-pz2-f5.google.com (mail-pz2-f5.google.com [74.125.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9813BB13D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233265; cv=none; b=b2fWNz4FI3xTlTBq8/JRJXvCf++yWMZhhyrXvX/dbA16iD/9cWnY5jLzmgVblq4elA1GhKltYK2H8CaB9/+iWQulrsVca9ypeN6B33Trws8CZAXe1e/T011jMER17H3RUW1NXl7bzCaVpfzBCCGO6qWMIRhxDSezOLGgVEaoOOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233265; c=relaxed/simple;
	bh=9+jl9FDVu+RV3NES3Jh+tmu31ocodeERMXQQnFKY5Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBOdWxvDHgwaoiO0lAroh1NIWR2KIlb9Z/HD+zkId2lkIh2ZrovOKxOoAmoFe6X8tNXjQNjasvjY9ucWH/kY13T6C6aNs3+HuYQB+YwKing7b6rLLE7WqILVeu/zERg9Q6R4Q2SKujh7DP1UG5Usmz0T7smqTvGocsYnIH+Mxm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XO708yWe; arc=none smtp.client-ip=74.125.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XO708yWe"
Received: by mail-pz2-f5.google.com with SMTP id 41be03b00d2f7-cc7c286026aso433944a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792233262; x=1792838062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WiyBe7vhMbtf4uRkYpBiNCvTHoDTzCk8KGb/Yp4fKF4=;
        b=XO708yWeqVhe5Q0YlVQzEoKoa3z5gwKul7djKX/ypGZQe9m0BGZ7oDJ1yBGGobXu9d
         yk3RO9TlYqyO1+9u+gza3G4pQ6h1gEHHz9h+k6ynUnYJz1sDCgwEy94md0DpLAgbnjdP
         9heNb6HyezikV3F1hldJgb8xPaVGXDFTo5zVBWMD3YcBlCwUp1rIXbfnStaIwr5L+2X3
         v40Y0ijRcJkchFZuekd2cfUz5d/KtIl8qQM0IbjCXW+r2BCS8dR+z34AF5hVflNkWUV8
         n8DR6E1m/Qp6yvR8+sCDAR9woQNcKI4AYj/l5FMWYnckoLDslc5zuU61SDH297TxP+xm
         4VKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792233262; x=1792838062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WiyBe7vhMbtf4uRkYpBiNCvTHoDTzCk8KGb/Yp4fKF4=;
        b=T/p0+lL8hoIRB55tW1urVC6hHoq3OElvvujFZp9rMvI0tERirFCNz9LNjKRpYGwxjM
         5vRBFVqo+ZvYBSdj3knsNGfkaA/fhJqwZ5nVmYTTfkfnYhjxNeENNmchZ3DaxvMXUmcI
         LrO/JnN4YarEaIYznMor06Cd1Tm70veOMk++xPCqhpMOVKzps6U99NgltrCbCi4PdwDv
         xhSdqvr11f0QCrbSxyApQ1oZSQEaR3sFkW0Xr890knlyXZISKkSUwcZVJhHxb++H3qvS
         HkspZ2ejC1TLiIVykbeQ3PlehOsfGJeJpgEByL3ui89gVUw0R6IY74P+kmjgKzP47fWI
         ASCg==
X-Forwarded-Encrypted: i=1; AKwUvBwiPGXArx+Y7en6rMbu8G7SAq5mXCIjxfdLyoWpGmrkorlrTwuDcYRYRvSXJbqaYYwrUR8nyWAS3qdIGJE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXl3ed2PQJ/LXCK+LibiGsnz12YZNNtiFjcWL+hcTNJbwpKFHM
	74ZE1brJVYk5tdlftqJlSVqsV58uXMuU7c+2k+VPU3wrRYUtlIcM0ByZ
X-Gm-Gg: AYBFou3wzU+xxU6lK9ruvDJ0ZKmm/E9DApNPWV7dAxdXH8VrCGJHEWgFSaFiAiHGC0J
	N7q9lOs+7BSnJXOMbRAo9GUYVgCx1CTtOfo5AugS0j+vjQReqi31D9dQj/cfprn7+ZTf8h4Y6pQ
	Y0VY6UZJjKdE2QRHdfysnX6FZQpkMz96YYN6okT2qTEAlLfHWMEPyuWtUip44IslZoZCqStLNjA
	LTXulsPQM5XIupPvSzuDVGbi6vGQrnT9fpGkMWXW4zDACwMgKQj6oNwABzUUtTPQcJaLNWBQabo
	/7cJm0gomWwjW2FRqHx3Ale4P8Yy6yOFIBFxdA5o0dakxXdx7DUIZ/Pjnu3FI5FQpmAgvq4reCZ
	3JpOl/rx1+WLHg2BWx75bzs8Emh+FUAoy4DD9v2eu6zu3UQQTdSIQksrotDRjs3EnO5vemK3Ojz
	oItpjKbkhJUMVSEFbIpzIyWN9zJSBWJoBni4OLYOnCsaUBpsGaImjMtnhn
X-Received: by 2002:a05:6a00:1f12:b0:880:973d:597a with SMTP id d2e1a72fcca58-8a04d04e513mr1777109b3a.53.1792233261655;
        Sat, 17 Oct 2026 03:34:21 -0700 (PDT)
Received: from Linux-PC ([2a09:bac5:1f0f:372d::57f:4e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58414986sm2051585b3a.57.2026.10.17.03.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:34:19 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>
Subject: [PATCH v2 3/3] drm/panel: add driver for Smartisan TD4362
Date: Sat, 17 Oct 2026 18:32:50 +0800
Message-ID: <20261017103250.800109-4-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017103250.800109-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261017103250.800109-1-tianshi12127@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Chen <tianshi12127@gmail.com>

Add support for the Smartisan TD4362 1080x2242 command mode DSI
panel found in the Smartisan R1 (trident) smartphone.

The initialization and power sequences were generated from the
downstream device tree with linux-mdss-dsi-panel-driver-generator.

Tested on a Smartisan R1 (trident).

Signed-off-by: Lu Chen <tianshi12127@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-smartisan-td4362.c    | 263 ++++++++++++++++++
 3 files changed, 277 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-smartisan-td4362.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index b30d7781745c..0b413152267f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1124,6 +1124,19 @@ config DRM_PANEL_SITRONIX_ST7789V
 	  Say Y here if you want to enable support for the Sitronix
 	  ST7789V controller for 240x320 LCD panels
 
+config DRM_PANEL_SMARTISAN_TD4362
+	tristate "Smartisan TD4362 DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the Smartisan TD4362
+	  1080x2242 command mode panel found in the Smartisan R1 (trident)
+	  smartphone. The panel is driven over four MIPI DSI lanes in
+	  command mode.
+
+	  If unsure, say N.
+
 config DRM_PANEL_SONY_ACX565AKM
 	tristate "Sony ACX565AKM panel"
 	depends on GPIOLIB && OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 4532f79021ea..bc4fad310554 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -112,6 +112,7 @@ obj-$(CONFIG_DRM_PANEL_SHARP_LS060T1SX01) += panel-sharp-ls060t1sx01.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
+obj-$(CONFIG_DRM_PANEL_SMARTISAN_TD4362) += panel-smartisan-td4362.o
 obj-$(CONFIG_DRM_PANEL_SUMMIT) += panel-summit.o
 obj-$(CONFIG_DRM_PANEL_SYNAPTICS_R63353) += panel-synaptics-r63353.o
 obj-$(CONFIG_DRM_PANEL_SYNAPTICS_TDDI) += panel-synaptics-tddi.o
diff --git a/drivers/gpu/drm/panel/panel-smartisan-td4362.c b/drivers/gpu/drm/panel/panel-smartisan-td4362.c
new file mode 100644
index 000000000000..7fb0ca43780d
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-smartisan-td4362.c
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2026 Lu Chen <tianshi12127@gmail.com>
+// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+//   Copyright (c) 2013, The Linux Foundation. All rights reserved.
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct smartisan_td4362 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+};
+
+static const struct regulator_bulk_data smartisan_td4362_supplies[] = {
+	{ .supply = "vddio" },
+	{ .supply = "vsp" },
+	{ .supply = "vsn" },
+};
+
+static inline struct smartisan_td4362 *to_smartisan_td4362(struct drm_panel *panel)
+{
+	return container_of(panel, struct smartisan_td4362, panel);
+}
+
+static void smartisan_td4362_reset(struct smartisan_td4362 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 10100);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 10100);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 10100);
+}
+
+static int smartisan_td4362_on(struct smartisan_td4362 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
+				     0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x82);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x0437);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x08c1);
+	mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx, 0x07fa);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 80);
+
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9,
+					 0x9b, 0x51, 0x07, 0xe6, 0x00, 0x10,
+					 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xba,
+					 0xbb, 0x2f, 0x1d, 0xbe, 0x00, 0x10,
+					 0x04);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xce,
+					 0x5d, 0x40, 0x60, 0x78, 0x87, 0x94,
+					 0x9e, 0xab, 0xb8, 0xc4, 0xcd, 0xd6,
+					 0xde, 0xe5, 0xec, 0xf3, 0xfd, 0xff,
+					 0x04, 0x28, 0x04, 0x04, 0x42, 0x00,
+					 0x69, 0x5a, 0x40, 0x01, 0xf4, 0x00,
+					 0x00, 0x04, 0xfa, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xca,
+					 0x1d, 0xfc, 0xfc, 0xfc, 0x00, 0x07,
+					 0x07, 0x00, 0x00, 0x00, 0xeb, 0xe7,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+					 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf9, 0x64);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x03);
+
+	return dsi_ctx.accum_err;
+}
+
+static int smartisan_td4362_off(struct smartisan_td4362 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 16000, 17000);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 64);
+
+	return dsi_ctx.accum_err;
+}
+
+static int smartisan_td4362_prepare(struct drm_panel *panel)
+{
+	struct smartisan_td4362 *ctx = to_smartisan_td4362(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(smartisan_td4362_supplies),
+				    ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	msleep(100);
+
+	smartisan_td4362_reset(ctx);
+
+	ret = smartisan_td4362_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(smartisan_td4362_supplies),
+				       ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int smartisan_td4362_unprepare(struct drm_panel *panel)
+{
+	struct smartisan_td4362 *ctx = to_smartisan_td4362(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = smartisan_td4362_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(smartisan_td4362_supplies),
+			       ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode smartisan_td4362_mode = {
+	.clock = (1080 + 44 + 2 + 60) * (2242 + 8 + 2 + 100) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 44,
+	.hsync_end = 1080 + 44 + 2,
+	.htotal = 1080 + 44 + 2 + 60,
+	.vdisplay = 2242,
+	.vsync_start = 2242 + 8,
+	.vsync_end = 2242 + 8 + 2,
+	.vtotal = 2242 + 8 + 2 + 100,
+	.width_mm = 64,
+	.height_mm = 117,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int smartisan_td4362_get_modes(struct drm_panel *panel,
+				      struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector,
+						    &smartisan_td4362_mode);
+}
+
+static const struct drm_panel_funcs smartisan_td4362_panel_funcs = {
+	.prepare = smartisan_td4362_prepare,
+	.unprepare = smartisan_td4362_unprepare,
+	.get_modes = smartisan_td4362_get_modes,
+};
+
+static int smartisan_td4362_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct smartisan_td4362 *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct smartisan_td4362, panel,
+				   &smartisan_td4362_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(smartisan_td4362_supplies),
+					    smartisan_td4362_supplies,
+					    &ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	ctx->panel.prepare_prev_first = true;
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void smartisan_td4362_remove(struct mipi_dsi_device *dsi)
+{
+	struct smartisan_td4362 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id smartisan_td4362_of_match[] = {
+	{ .compatible = "smartisan,td4362" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, smartisan_td4362_of_match);
+
+static struct mipi_dsi_driver smartisan_td4362_driver = {
+	.probe = smartisan_td4362_probe,
+	.remove = smartisan_td4362_remove,
+	.driver = {
+		.name = "panel-smartisan-td4362",
+		.of_match_table = smartisan_td4362_of_match,
+	},
+};
+module_mipi_dsi_driver(smartisan_td4362_driver);
+
+MODULE_AUTHOR("Lu Chen <tianshi12127@gmail.com>");
+MODULE_DESCRIPTION("DRM driver for Smartisan TD4362 1080p command mode DSI panel");
+MODULE_LICENSE("GPL");
-- 
2.56.0

