Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44080481FBE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950917; cv=none; b=AvQ50E+erZcCsWM8buyhhcy/9nXRxMbIlUk7fHUmNJR8m95DHPXQTbLHxkOTa+KmhQJ4R0ren++XaIxrFkovviay5o/vPM9sfkXIKPoy20rFQouhYoHC9mA3wmenoFzjPWOd+GEMFBurk834q4JuzPX36ofhydQYwGdc2OMGkvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950917; c=relaxed/simple;
	bh=ZPjR8uNbcSwIbyIe7MODi5v5UqxzXoTALCFYWo20Rhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BU4Vc5PV7SqK4IiiNbQoGaR3S8jLonaH4E4FAnA9THfs0RWAv9cHeYqnrHDWBCaP97LSEJHMHR0VlGIUVzxA21tf0qdmHTAnDuLgHn8LbaeXfLW95MR+faFVAlZ7rNktMcGh1X1lMZZjkzUC+fiexaTAwu7tttAVwO7SY2kiTlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VJdxtV/0; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VJdxtV/0"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2e59b02972so9334666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790950912; x=1791555712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CfPKQBhYqLt11gq7pg+zrzpcCHvv9FOQ7ebeJjOepi8=;
        b=VJdxtV/0lfwhj5zLhF49NXJ4yx++7sLdYdSJH+h88rHCtLFH8sYu8p/iR5zF53PNOQ
         m8wxe/A9YJSjT3+IFx0463yN3mSv/yOxK9sPzD6cus345Kaoh/2zLnv1VVuLFf6N+lID
         c8QyzJHLVbf4G2qN+zEYT9twr41fplO2g+1OboS3PuIOcGdHT0h2qo0juYK+JFa56H1V
         Dd2URw95C5MBq3eci9Q7MRsc283vavsLqswH6S8zFiG9khgLXI1Wi6CWm+J+oMcm+fdk
         wmJ8335jcunDJL08MTT2ZsziDynr9VOzef6dCKnn3G90JXUg3HxXVrGNvlQcFl8Y2HEd
         At/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790950912; x=1791555712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfPKQBhYqLt11gq7pg+zrzpcCHvv9FOQ7ebeJjOepi8=;
        b=J1d1j+HorXRd37B7yn6nS2hy2oajSVK75+zlsODlRedvTl45dfcvlRplPU4k5RBQFt
         /4+JP/USDLiVyUg1W5q68I3LfWPdIEiyn020cNmKU2LScorQ/e1MCcuwHztM+URE2EWv
         bkWkcGwagXXyaVNFC3sdRaz3msT4cI75WFcfkGjwq1NAL/y8e817oQmVYCN3Kyp2Gt2C
         rvBWB1xTYsJ51PTzPnnX3KnCGJcyWHbsc3cfYsLJU6WVl/+Igp5lkRwiJmB47pqAuZne
         3DSSYMJdH4qpfh2EWhOTFylJDWKsZBViqaR3fmM4OWmod12orhUIZXichEgwz86R6meZ
         TkGg==
X-Forwarded-Encrypted: i=1; AKwUvBzWmkReiyKE5aSt4jwKYALVbY5NL/T7Eqf8IPuzcAf9uwY6TUZzCwU+uYrYYduE5Xk2T55qJhpg0sDMYKE=@vger.kernel.org
X-Gm-Message-State: AFuF++lpEmzkh2yu3eMKrEQaqMdURkBruqMb+1Bg01ek2VvolzrjL1us
	VY8WhXvbdFaugTAR0R0MizKJ7PhAz/Q8xns29nR1TdvYRvw+Cb5bOpyQXNpJYNlydU8=
X-Gm-Gg: AYBFou1mXajzLYjpNIoZW+qPO7Br58cVB/ZLDyEdU1oTP93c4E5uEJvo7hRB5q5c8Lj
	/KfbBmRWWfuRTK86v1kFitJZnoGZeeR/vh2PJgDG0HOXRIR1LL/vxX5SNdAMt0L3A1ub3Vh3HYf
	wQ0WsGWp2g27PqDWLxTy0h5s7IbbselMwNUs1WSIdcJ1dgU0eXdCPhDptv+mMBHU/jFZonSpJHd
	D5b7RYexo854zwg2LZ1RWeFe56W8OYnzslFfiqQ18OrmfKaaoEq7RRRn070Er24lBDmn+V7/rTH
	PogwkUYiq+7rjhLqdSYoYdO6l+zgkYbcNWeXl6npZ67VQI2ZyYw9z0uNGAIpSGPtj7E+1elxkfC
	UL8PY1+jcvyRBop7zjvKkinj0rCRmHK947AVQJEQexDJeDTTXfx2NhjI0KSev1zY6TW+7rpzrAV
	ESjUOr6mInPCo4ymWyYbaxzdnR742DmBeZ0ZIcGaJCJd4lz3NeQrf5cRV4eAmR9bDYXoOFs52/I
	8DIFgQ5ZAdSAH6sCKvjtpDOrZDvXyTjb9IrYTC+VBGA4/AQZRgNjQ==
X-Received: by 2002:a17:907:969e:b0:c2e:4742:491c with SMTP id a640c23a62f3a-c2e4ae08db2mr227016866b.31.1790950911944;
        Fri, 02 Oct 2026 07:21:51 -0700 (PDT)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf684e3sm89307166b.51.2026.10.02.07.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:21:51 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 02 Oct 2026 16:21:46 +0200
Subject: [PATCH v3 2/4] drm/panel: Add driver for Novatek NT37705 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-fp6-panel-v3-2-4b80f83bc936@fairphone.com>
References: <20261002-fp6-panel-v3-0-4b80f83bc936@fairphone.com>
In-Reply-To: <20261002-fp6-panel-v3-0-4b80f83bc936@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790950908; l=16332;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZPjR8uNbcSwIbyIe7MODi5v5UqxzXoTALCFYWo20Rhw=;
 b=roAQlm3aXwa/W3sGl3tJDls1ePmq3vqHbOY/dq1vYjNYurzSH+Ua4dlTzPyWxBNn39aezhpqM
 TrSAHN1yNqUCdXGEeC/IaVCw/dePs7QH3MbabP2L70yaDmKdSyLFylQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the 2484x1116 AMOLED panel from BOE (BJ631JHM-T71-D900)
bundled with a NT37705 driver IC, as found on the Fairphone (Gen. 6)
smartphone.

The panel can also be configured in 10-bit (RGB101010) mode, however
currently it's configured in 8-bit (RGB888) since there's some issues in
the Qualcomm DPU driver when driving this panel in 10-bit.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  12 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37705.c | 396 ++++++++++++++++++++++++++
 3 files changed, 409 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index cbdf7b8f7f7a..be2f812bef76 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -706,6 +706,18 @@ config DRM_PANEL_NOVATEK_NT37700F
 	  Say Y here if you want to enable support for Novatek NT37700F DSI
 	  panel module. The panel has a resolution of 1080x2160.
 
+config DRM_PANEL_NOVATEK_NT37705
+	tristate "Novatek NT37705-based DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DSC_HELPER
+	select DRM_DISPLAY_HELPER
+	help
+	  Say Y here if you want to enable support for Novatek NT37705-based
+	  display panels, such as the one found in the Fairphone (Gen. 6)
+	  smartphone.
+
 config DRM_PANEL_NOVATEK_NT37801
 	tristate "Novatek NT37801/NT37810 AMOLED DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 3b523cf37833..e1366b5e25fc 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36536) += panel-novatek-nt36536.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672E) += panel-novatek-nt36672e.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37700F) += panel-novatek-nt37700f.o
+obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37705) += panel-novatek-nt37705.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37801) += panel-novatek-nt37801.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
 obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37705.c b/drivers/gpu/drm/panel/panel-novatek-nt37705.c
new file mode 100644
index 000000000000..3cf092a1f360
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37705.c
@@ -0,0 +1,396 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
+ * Copyright (c) 2026 Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/device-id/of.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct nt37705_panel {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct drm_dsc_config dsc;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+};
+
+static const struct regulator_bulk_data nt37705_supplies[] = {
+	{ .supply = "vddio" },
+	{ .supply = "dvdd" },
+	{ .supply = "vci" },
+};
+
+static inline struct nt37705_panel *to_nt37705_panel(struct drm_panel *panel)
+{
+	return container_of_const(panel, struct nt37705_panel, panel);
+}
+
+static void nt37705_reset(struct nt37705_panel *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int nt37705_on(struct nt37705_panel *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
+				     0x55, 0xaa, 0x52, 0x08, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x00, 0x01, 0x01, 0x01, 0x00, 0x05, 0x05,
+				     0x05, 0x00, 0x05, 0x05, 0x05, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x0b,
+				     0x0b, 0x00, 0x00, 0x0b, 0x0b, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
+				     0x1d, 0x00, 0x00, 0x00, 0x1d, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x5c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+				     0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+				     0x01, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x6c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x0b,
+				     0x77, 0x77, 0x00, 0x00, 0x0b, 0x00, 0x1d,
+				     0x00, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x7c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x0b,
+				     0x77, 0x77, 0x00, 0x00, 0x0b, 0x00, 0x1d,
+				     0x00, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x8c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x9c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x11, 0x11, 0x20, 0x02, 0x00, 0x03, 0x00,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0xa4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x00, 0xc0, 0x40, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0xa8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22,
+				     0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0xb0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
+				     0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22,
+				     0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
+				     0x55, 0xaa, 0x52, 0x08, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc5, 0x15, 0x15, 0x15, 0xdd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
+				     0x55, 0xaa, 0x52, 0x08, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
+				     0x55, 0xaa, 0x52, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x01, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x01, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf9, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf5, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x83);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x20);
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x045b);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x09b3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x00);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0xbb0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x04);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0xfe0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x01, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x90, 0x03, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x91,
+				     0x89, 0x28, 0x00, 0x0c, 0xd2, 0x00, 0x02,
+				     0x2f, 0x01, 0x18, 0x00, 0x07, 0x09, 0x75,
+				     0x08, 0x34, 0x10, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 22);
+
+	return dsi_ctx.accum_err;
+}
+
+static int nt37705_off(struct nt37705_panel *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	return dsi_ctx.accum_err;
+}
+
+static int nt37705_prepare(struct drm_panel *panel)
+{
+	struct nt37705_panel *ctx = to_nt37705_panel(panel);
+	struct device *dev = &ctx->dsi->dev;
+	struct drm_dsc_picture_parameter_set pps;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(nt37705_supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	nt37705_reset(ctx);
+
+	ret = nt37705_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(nt37705_supplies), ctx->supplies);
+		return ret;
+	}
+
+	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
+
+	ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
+	if (ret < 0) {
+		dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_compression_mode(ctx->dsi, true);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable compression mode: %d\n", ret);
+		return ret;
+	}
+
+	msleep(28); /* TODO: Is this panel-dependent? */
+
+	return 0;
+}
+
+static int nt37705_unprepare(struct drm_panel *panel)
+{
+	struct nt37705_panel *ctx = to_nt37705_panel(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = nt37705_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(nt37705_supplies), ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode nt37705_mode = {
+	.clock = (1116 + 100 + 30 + 100) * (2484 + 70 + 48 + 70) * 120 / 1000,
+	.hdisplay = 1116,
+	.hsync_start = 1116 + 100,
+	.hsync_end = 1116 + 100 + 30,
+	.htotal = 1116 + 100 + 30 + 100,
+	.vdisplay = 2484,
+	.vsync_start = 2484 + 70,
+	.vsync_end = 2484 + 70 + 48,
+	.vtotal = 2484 + 70 + 48 + 70,
+	.width_mm = 66,
+	.height_mm = 146,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int nt37705_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &nt37705_mode);
+}
+
+static const struct drm_panel_funcs nt37705_panel_funcs = {
+	.prepare = nt37705_prepare,
+	.unprepare = nt37705_unprepare,
+	.get_modes = nt37705_get_modes,
+};
+
+static int nt37705_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static const struct backlight_ops nt37705_bl_ops = {
+	.update_status = nt37705_bl_update_status,
+};
+
+static struct backlight_device *
+nt37705_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.scale = BACKLIGHT_SCALE_NON_LINEAR,
+		.brightness = 4095,
+		.max_brightness = 4095,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &nt37705_bl_ops, &props);
+}
+
+static int nt37705_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct nt37705_panel *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct nt37705_panel, panel,
+				   &nt37705_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(nt37705_supplies),
+					    nt37705_supplies,
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
+	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = nt37705_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	ret = devm_drm_panel_add(dev, &ctx->panel);
+	if (ret)
+		return ret;
+
+	/* This panel only supports DSC; unconditionally enable it */
+	dsi->dsc = &ctx->dsc;
+
+	ctx->dsc.dsc_version_major = 1;
+	ctx->dsc.dsc_version_minor = 1;
+
+	/* TODO: Pass slice_per_pkt = 2 */
+	ctx->dsc.slice_height = 12;
+	ctx->dsc.slice_width = 558;
+	/*
+	 * TODO: hdisplay should be read from the selected mode once
+	 * it is passed back to drm_panel (in prepare?)
+	 */
+	WARN_ON(1116 % ctx->dsc.slice_width);
+	ctx->dsc.slice_count = 1116 / ctx->dsc.slice_width;
+	ctx->dsc.bits_per_component = 8;
+	ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
+	ctx->dsc.block_pred_enable = true;
+
+	return devm_mipi_dsi_attach(dev, dsi);
+}
+
+static const struct of_device_id nt37705_of_match[] = {
+	{ .compatible = "boe,bj631jhm-t71-d900" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, nt37705_of_match);
+
+static struct mipi_dsi_driver nt37705_driver = {
+	.probe = nt37705_probe,
+	.driver = {
+		.name = "panel-novatek-nt37705",
+		.of_match_table = nt37705_of_match,
+	},
+};
+module_mipi_dsi_driver(nt37705_driver);
+
+MODULE_DESCRIPTION("DRM driver for NT37705-equipped DSI panels");
+MODULE_LICENSE("GPL");

-- 
2.56.0

