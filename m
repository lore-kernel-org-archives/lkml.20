Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560DF3D6CB8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545121; cv=none; b=mIwEF7xuKDF4f0/F+HMiQyRn0gkKnkwr64OOPBhOJpa3gYDCuU+EBlJ+Yn4xoc3JXzCRt5Y1hOUXoUSLfPIj0SduzEB9kGwAoyBs/d3VeK7xGUSAfT9w/YnmGOASRAIBCcSREAIB6Cy53ugjWWU36g8A3F7voP4pAur3YNHkUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545121; c=relaxed/simple;
	bh=2exeomNvNVtau9BYLCJIPraM28/MSqBn3EoEXDaJKQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FGnoH/+YXBxhtCd+8CqpiA9UotRNNJED3hx0N3xnrFymZVeXJNQFzv9HD2hAjdYcn0q3rc05+aVq5StP6baw3/Qswi5/2JvG+6MJdwswCthhBuaRXP0aEP9qjW34yqB187wlZ8uQyl7oCLxcRdroQjSUZ0tPocTZO0OJJNmWb3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3MnLetRW; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3MnLetRW"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso6211589a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791545108; x=1792149908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9urKl8p4Pb3MU4JPw6JjcKl2cynA9wfgFtnwwTO9i/c=;
        b=3MnLetRW3Cw4r9XHs7DdI9Vh7R1FUUM2e1W+wwV6Y+LRB/6PcDG8b1ar38BUUgk1iL
         LXNgUzIPejklW8lwBG817k7E/+5qMrYCbhmxfzj4waL8t2hu0SGWzekqpj+Gb/SUKD/M
         P9TXIHEUVMxOokQFvHAYaXv5MdniVIAFyFvYoOIa5kLuk+qO1z+G/9ODvmnaCtBw7UN7
         zsgmRpJqLLHfz2G39QUySFApA7H7liZX9Zwknxt0FAJT5DJZ7tBOCX0842zLMRN4Q4NN
         /41hjAODn/Atgs5QR4HM/M/TTg6e1H78/A/+IFK2oAfSpyIvQcs2f95eyqEl6iCPVjRz
         B3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545108; x=1792149908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9urKl8p4Pb3MU4JPw6JjcKl2cynA9wfgFtnwwTO9i/c=;
        b=1vHmYK1FYqFjodt91lDLiPBth8rCn7lrIvzQ5az4MWWL5e986Vs3k74SZ9/y9feeEC
         0PU0B4Eb2S4vIfTn36ppky7JTQ7iEMbW6vplVQpVPqSmTg+PcYKInUTjUIlnNiP8E7Yu
         Y13Z7Yl6tRqfmH8gLWAXBSS5BrcucJTo5J9VWKTsNCAdttJn+cFHRL/8hYDYUTFDKW9P
         U45/RqFwsc8UeLZQzFtXXm3hEPMg6wusvE5sICo1HDTjYPAdg5Dl8kOP+hj3VDjv0Gb1
         ShbDdBPt/1rSkozQPw3qsRFydJflFlw4fWTA08bBdomYdV9weRXobpCVFrdkWSmZgZh8
         KHvg==
X-Forwarded-Encrypted: i=1; AKwUvBxNAEnD9D75HmdLTHH+43AKvw4yfWQt+7lyD5n0UWUNFBR1Q9+DcgX2QDp/2IBzIWh3iK4LAafujn7WOGA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlh7qMaXeY9e1yOWpDJWtVypcBDKAIAHSaBWr+T8pVSuAC1rYR
	nYtlGAYYtfWKW4JDUI4Mx1hjkBj4ym+S2JRkla4mcxAp6AMdhe8GecE94R8u+BfJUnE=
X-Gm-Gg: AYBFou0TXJX4VWT/HKu0hVpEwdLxLCNiKizR72rWN6gxRnf2Qh38slMd9BM0HdAavJT
	yq5ohiDMaTdRhwUO6JvhW2S4paRJqQqf9AWenY11trCX59vhlumJ+MqgPpI4DfBxWhs75wJieNH
	XFigMd0K2zMj3QI5a5G5Lqt9BHuhn041s3F224Qa3XYYS41odyBKnrZBzGDko3e3bczdiqhKVCZ
	IpP1nKOUcKAc3vyu7tZhIcuVYTs/Lc2zfbxXBp1fhVGXl2az9yqT+HFzgJJewEiY8ZsktI9h0Qz
	K4z7CcdscpFX1B2hlaa6RVyAgRqoIcB+j3Hkd8EmufKcb5FzgojJM1tY2iQ9kLpyK2NDmUyLUok
	HfH2mdZvai/x74EOuR98zdPhfLoUuGBUqIFcZkxCCeqp32VajKeiSmbxc6EN682eHEB9/4kYzin
	BfIyVPUfqAG/1T0Z3snSBWzwDq1tJetx4AufB/dcIO3Rpq8jKBU7qg9wFmmhGhHTY81hAYyL+XG
	VleRI/Qa5zdqY5CdUMmbgTU8VONwPbFRhpRy2RTsHiDTe8HXf6KbsuAS8EcZjlQ
X-Received: by 2002:a05:6402:450e:b0:6aa:a040:cbd3 with SMTP id 4fb4d7f45d1cf-6b17c1deb13mr1295076a12.3.1791545108072;
        Fri, 09 Oct 2026 04:25:08 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3597sm985764a12.14.2026.10.09.04.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:25:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Oct 2026 13:25:01 +0200
Subject: [PATCH v4 2/4] drm/panel: Add driver for Novatek NT37705 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-fp6-panel-v4-2-7c3819664778@fairphone.com>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
In-Reply-To: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791545105; l=16428;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=2exeomNvNVtau9BYLCJIPraM28/MSqBn3EoEXDaJKQ0=;
 b=FxoSa/HZpkCN8Cs5G7GpkgxqOHxqG54K+GXnqOcbbf4NUYkFl7rRZ1PE1Rp43J5/OQ3HpB8TY
 kJlgLabURS4AM4g7WTZHDhNSHQtwj47hbrSYHLAzJNV18sc5WkboHbq
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
index 000000000000..342e58591bab
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
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_TEAR_ON);
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
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_EXIT_SLEEP_MODE, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_DISPLAY_ON, 0x00);
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
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_DISPLAY_OFF, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_ENTER_SLEEP_MODE, 0x00);
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

