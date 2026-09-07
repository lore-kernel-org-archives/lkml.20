Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62A448823A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781973; cv=none; b=QkZY3NLYMFHm2wKbdDN6s1+8IHeXTrCWBKE5V5oicPCK/FTJPgz8tQvw33/kAC55y+VX2KSGzsJxhul+kJ75NCtDJW7qoPQXW9wQCmOSoVQlQ2BAwZZFidHfDVsdh8T6G8EicgJQuKSmrpTt2PTget5YYuAAwQdNxBKaYug7c1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781973; c=relaxed/simple;
	bh=amn/RFS6smWPBd7o2YH5YZXbbloLAPzDGopj96clkUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEEkvwJYG2OmUP32JTuCJeUxEB9GumU3SVzZH3HdNn6R5gAxNlvasZM39/ROP+BUH0VhA88G2z+5vzWnQB3Id3bLXPj4XoZFDza1pe1di7WrevuxHOUs/Evg/cUYnqqltkLS/eWuEeu/GGcIl7i2dOnDmAAmR/rEaAHrXsHpXOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7EqESRX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7EqESRX"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so29116795e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781970; x=1789386770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7R3VJcHDlomCHsnFsSOZiYtq/P5zAezYH17tYJWimU=;
        b=S7EqESRXalBcfYg+v8yaiLIq2F4oLA2ux02488laTqQntcgKelmMcu939PprvViJcA
         KyBVJTaazgdH+SDgtF4JOLOolm0NBCLjiTKzeI9T07vdMrr7r25StdphdNQBhHfmXk8+
         WBMckDXDYa9HgOH3/+DSL7KRZI6mJnN4i/QViqHh8E0z0HO6uZeQ02X6JqHLHYFXjp4T
         /aaSzLcnEnYUF0RWvKVD6nerHiFMvL0JsgUrXZGJG9n9YzT11v4sqpM2RO4w5JHu7xhx
         jDso3RI2o5wXlIYUWse8Sr1hHgtgbjYRHbZIUhk5Qg/+olze2I4tA8AdQ6tY5B4qFlms
         Qk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781970; x=1789386770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D7R3VJcHDlomCHsnFsSOZiYtq/P5zAezYH17tYJWimU=;
        b=n/KgBF5dscMlLMU45qkya+Q6rEBlvpVnUa9uacx68WtS+mIizNAEwLHedxTbwWziDH
         Ycr3NyLcXVK9jKEzX5YniKEAdP9tVw30OsWDt++62D+nA1Hh1bTGs18ZZtsEr7oN2f1r
         htDxDAlB52m7CcniozlmwyIZV+DDBs8dvJIJrTJXc+NPHzCKR9Zro6raRAqamHTlMcA7
         IX8OEmQpKtObvHKw0JQRDDaOmNekEEfVCxNciMlOO0eLVDwv/ZhBLDO1n7gWpHEUCGhu
         mG9XxwXQugZDmvkAAo5ANlhsmf1cW/KOz+S87Yx9nPmPhtomSonFKGcego3Nwwig5iDt
         ntcQ==
X-Forwarded-Encrypted: i=1; AKwUvBx39ykygTsjFMhmwWZIkSFp9bqfkXJ6/iLqsuNScP7GDnR6C/iYkBd/1UPbHq+NLdU9R7yKbogSdWc8Hjc=@vger.kernel.org
X-Gm-Message-State: AFuF++l2uT9Rb6w7JkwhmLf/RWd9HP1VtSr9HD5JlfvfZ0yP+VwhqE4S
	WxlYJCIDzHnystswxk6aUQYC0fBVHMUBZDp5wc+/6/bAt/aizOzyousy
X-Gm-Gg: AYBFou2F8UNz3+PKaEPnzYVRGXGyALmWPRFtDOun/ZlPAwscjYqAqVyQ/GeePuPqQcB
	3fsMJ3Iu+0dSkvbp5KJ73b/ybO0DLgdhTmcnGgL/GisYTDr6jAc8bjyba6OtO/cZ+XyPPEPr132
	mz6x+jOixHurJDhUrWYSIlHpFtiGb5+U2kd120h31xVzOdeV/M6o8X8eDaGTGVlih+e2yZPfjOT
	syFRP/L5CTxYLP8pL7eUVAFngjo57HqTQn0AS39Y5Ik4xxLZFzXRBZ7E4a612+jOiPAvkQEX+AS
	SJn5nbRrmDcHYOZNOMMYa8G7ZLdQlQGaw1zReqaKQEfoSXTMH/4zVxnfG4I4wTE7SpM2jiWkZe7
	9miLVnQX4zp0uP4VYxSBfJ+BwIwMl7ZQodC5CFoUnEwuJLwugaPYmVVyn1Fanitp+c2dkadqUrf
	WstPxd3kZ8/km+hPgoDogst6gO15RTVBtYysS5U0SE6s3zC5anN5TkIXLiER7Et5Lr3sheKIJkN
	00=
X-Received: by 2002:a05:600c:4fc5:b0:49c:fe18:6dd5 with SMTP id 5b1f17b1804b1-49cfe186dfemr187825235e9.29.1788781969872;
        Mon, 07 Sep 2026 04:52:49 -0700 (PDT)
Received: from Empers0n ([193.23.219.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26830718f8f.3.2026.09.07.04.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:52:49 -0700 (PDT)
From: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
To: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: jesszhan0024@gmail.com,
	conor+dt@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	mripard@kernel.org,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Subject: [PATCH 2/2] drm/panel: Add Samsung AMS662ZS01 panel driver
Date: Mon,  7 Sep 2026 18:51:30 +0700
Message-ID: <20260907115130.95394-3-sevanevorotov29@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907115130.95394-1-sevanevorotov29@gmail.com>
References: <20260907115130.95394-1-sevanevorotov29@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Samsung AMS662ZS01 AMOLED display panel used in the
OnePlus 9RT (martini) smartphone.

The panel operates in Command Mode with DSC (Display Stream Compression)
enabled at 1080x2400 resolution at 60Hz.

Signed-off-by: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ams662zs01.c  | 398 ++++++++++++++++++
 3 files changed, 412 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams662zs01.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index cbdf7b8f7f7..c94116ca42c 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -904,6 +904,19 @@ config DRM_PANEL_SAMSUNG_AMS639RQ08
 	  Say Y or M here if you want to enable support for the
 	  Samsung AMS639RQ08 FHD Plus (2340x1080@60Hz) CMD mode panel.
 
+config DRM_PANEL_SAMSUNG_AMS662ZS01
+	tristate "Samsung AMS662ZS01 panel"
+	depends on GPIOLIB && OF && REGULATOR
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_HELPER
+	select DRM_DISPLAY_DSC_HELPER
+	help
+	  Say Y or M here if you want to enable support for the
+	  Samsung AMS662ZS01 FHD Plus (1080x2400@60Hz) DSC CMD mode panel.
+	  This panel is connected via MIPI DSI interface and is
+	  primarily found in the OnePlus 9RT smartphone.
+
 config DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24
 	tristate "Samsung AMS427AP24 panel with S6E88A0 controller"
 	depends on GPIOLIB && OF && REGULATOR
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 3b523cf3783..fc5cfc4dd6b 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -88,6 +88,7 @@ obj-$(CONFIG_DRM_PANEL_RENESAS_R69328) += panel-renesas-r69328.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01) += panel-samsung-ams581vf01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08) += panel-samsung-ams639rq08.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS662ZS01) += panel-samsung-ams662zs01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-ams662zs01.c b/drivers/gpu/drm/panel/panel-samsung-ams662zs01.c
new file mode 100644
index 00000000000..52e7e75c08b
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-ams662zs01.c
@@ -0,0 +1,398 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Samsung AMS662ZS01 6.62" 1080x2400 AMOLED DSI command-mode panel with DSC.
+ *
+ * Found on the OnePlus 9RT (oneplus,martini). Both panel revisions the vendor
+ * tree carries -- "samsung ams662zs01 fhd cmd mode dsc dsi panel" and its
+ * dvt respin, which the martini bootloader hands off as
+ * msm_drm.dsi_display0=qcom,mdss_dsi_samsung_ams662zs01_dvt_dsc_cmd -- share
+ * one initialisation sequence and one set of timings; the revisions differ only
+ * in the HBM/fingerprint brightness tables, which this driver does not use.
+ *
+ * Command sequences and timings transcribed from
+ * arch/arm64/boot/dts/vendor/qcom/display/dsi-panel-samsung_ams662zs01_dvt_dsc_cmd.dtsi
+ * in the vendor kernel (timing0, the 60 Hz mode).
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+#include <video/mipi_display.h>
+
+/*
+ * Samsung DDIC vendor commands. The PPS is written as a DCS long write of the
+ * 128-byte payload rather than as a MIPI PPS (0x0a) packet, and compression is
+ * armed by a DCS register write rather than by a MIPI compression-mode (0x07)
+ * packet -- that is what the vendor sequence does on this DDIC, so it is what
+ * is known to work here.
+ */
+#define AMS662ZS01_DCS_WRITE_PPS		0x9e
+#define AMS662ZS01_DCS_COMPRESSION_MODE		0x9d
+#define AMS662ZS01_DCS_ACCESS_KEY		0xf0
+#define AMS662ZS01_DCS_FREQ_SELECT		0x60
+#define AMS662ZS01_DCS_GAMMA_UPDATE		0xf7
+
+/* Payloads of AMS662ZS01_DCS_FREQ_SELECT, from the per-timing switch commands. */
+#define AMS662ZS01_FREQ_60HZ			0x00
+#define AMS662ZS01_FREQ_120HZ			0x08
+
+struct ams662zs01 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct drm_dsc_config dsc;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *vout_gpio;
+	struct regulator_bulk_data *supplies;
+};
+
+/*
+ * vddio is pm8350c L12C at 1.8 V, vdd is pm8350c L13C at 3.0-3.2 V. The vendor
+ * tree wires both through the DSI controller node (display/lahaina-sde-display.dtsi)
+ * and lists them as the panel's supply entries; lab/ibb are commented out on
+ * oplus builds, so the pm8350b AMOLED AB/IBB regulators are not involved and
+ * need no driver here.
+ */
+static const struct regulator_bulk_data ams662zs01_supplies[] = {
+	{ .supply = "vddio" },
+	{ .supply = "vdd" },
+};
+
+static inline struct ams662zs01 *to_ams662zs01(struct drm_panel *panel)
+{
+	return container_of(panel, struct ams662zs01, panel);
+}
+
+/*
+ * qcom,mdss-dsi-reset-sequence = <1 10>, <0 10>, <1 10>: the pin idles high,
+ * is pulled low for 10 ms and released. reset-gpios is active-low, so the
+ * logical values run the other way round.
+ */
+static void ams662zs01_reset(struct ams662zs01 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+/* The 0xf0 key gates every vendor register touched below. */
+#define ams662zs01_unlock(dsi_ctx) \
+	mipi_dsi_dcs_write_seq_multi((dsi_ctx), AMS662ZS01_DCS_ACCESS_KEY, 0x5a, 0x5a)
+#define ams662zs01_lock(dsi_ctx) \
+	mipi_dsi_dcs_write_seq_multi((dsi_ctx), AMS662ZS01_DCS_ACCESS_KEY, 0xa5, 0xa5)
+
+/*
+ * The payload is built at run time rather than with
+ * mipi_dsi_dcs_write_seq_multi(): that macro stores its arguments in a
+ * "static const u8" array, so every one of them has to be a compile-time
+ * constant and a variable freq does not compile.
+ */
+static void ams662zs01_set_freq(struct mipi_dsi_multi_context *dsi_ctx, u8 freq)
+{
+	const u8 freq_select[] = { AMS662ZS01_DCS_FREQ_SELECT, freq, 0x00 };
+
+	ams662zs01_unlock(dsi_ctx);
+	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, freq_select, sizeof(freq_select));
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, AMS662ZS01_DCS_GAMMA_UPDATE, 0x0f);
+	ams662zs01_lock(dsi_ctx);
+}
+
+static void ams662zs01_send_pps(struct mipi_dsi_multi_context *dsi_ctx,
+				const struct drm_dsc_config *dsc)
+{
+	struct drm_dsc_picture_parameter_set pps;
+	u8 buf[1 + sizeof(pps)];
+
+	drm_dsc_pps_payload_pack(&pps, dsc);
+
+	buf[0] = AMS662ZS01_DCS_WRITE_PPS;
+	memcpy(&buf[1], &pps, sizeof(pps));
+
+	mipi_dsi_dcs_write_buffer_multi(dsi_ctx, buf, sizeof(buf));
+}
+
+static int ams662zs01_prepare(struct drm_panel *panel)
+{
+	struct ams662zs01 *ctx = to_ams662zs01(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	dsi_ctx.accum_err = regulator_bulk_enable(ARRAY_SIZE(ams662zs01_supplies),
+						  ctx->supplies);
+	if (dsi_ctx.accum_err)
+		return dsi_ctx.accum_err;
+
+	/*
+	 * Panel VOUT enable (tlmm 25). The vendor driver raises it right after
+	 * the rails and the pinctrl state, and drops it in power-off
+	 * (techpack/display/msm/dsi/dsi_panel.c, panel_vout_gpio).
+	 */
+	gpiod_set_value_cansleep(ctx->vout_gpio, 1);
+	usleep_range(1000, 2000);
+
+	ams662zs01_reset(ctx);
+
+	/*
+	 * ctx->dsc is filled in by the DSI host: dsi_timing_setup() runs
+	 * dsi_populate_dsc_params() on the panel's config before the panel is
+	 * prepared (panel.prepare_prev_first), so the rate-control parameters
+	 * the PPS carries are computed by then.
+	 */
+	ams662zs01_send_pps(&dsi_ctx, ctx->dsi->dsc);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, AMS662ZS01_DCS_COMPRESSION_MODE, 0x01);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 128);
+
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, 1080 - 1);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, 2400 - 1);
+
+	/* FQ CON: pick the fixed-frequency (non-adaptive) frame rate path. */
+	ams662zs01_unlock(&dsi_ctx);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x27, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x00);
+	ams662zs01_lock(&dsi_ctx);
+
+	ams662zs01_set_freq(&dsi_ctx, AMS662ZS01_FREQ_60HZ);
+
+	/* Brightness control on, dimming off. */
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+
+	if (dsi_ctx.accum_err) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		gpiod_set_value_cansleep(ctx->vout_gpio, 0);
+		regulator_bulk_disable(ARRAY_SIZE(ams662zs01_supplies),
+				       ctx->supplies);
+	}
+
+	return dsi_ctx.accum_err;
+}
+
+static int ams662zs01_enable(struct drm_panel *panel)
+{
+	struct ams662zs01 *ctx = to_ams662zs01(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int ams662zs01_disable(struct drm_panel *panel)
+{
+	struct ams662zs01 *ctx = to_ams662zs01(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	/* Leave AOD, in case the panel was put there behind our back. */
+	ams662zs01_unlock(&dsi_ctx);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x91, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	ams662zs01_lock(&dsi_ctx);
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 11);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 121);
+
+	return dsi_ctx.accum_err;
+}
+
+static int ams662zs01_unprepare(struct drm_panel *panel)
+{
+	struct ams662zs01 *ctx = to_ams662zs01(panel);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	gpiod_set_value_cansleep(ctx->vout_gpio, 0);
+
+	regulator_bulk_disable(ARRAY_SIZE(ams662zs01_supplies), ctx->supplies);
+
+	return 0;
+}
+
+/*
+ * timing0 of the vendor panel node: 60 Hz, hfp 64 / hpw 8 / hbp 48,
+ * vfp 8 / vpw 4 / vbp 12.
+ *
+ * The 120 Hz timing1 (hfp 8 / hpw 24 / hbp 8, vfp 2 / vpw 2 / vbp 8) is
+ * deliberately not advertised. Switching rate on this DDIC needs its
+ * AMS662ZS01_DCS_FREQ_SELECT payload changed to AMS662ZS01_FREQ_120HZ in the
+ * same breath as the CRTC timing, and drm_panel_funcs has no mode_set hook to
+ * hang that off, so a second mode would give DPU 120 Hz timings while the panel
+ * stayed at 60.
+ */
+static const struct drm_display_mode ams662zs01_mode = {
+	.clock = (1080 + 64 + 8 + 48) * (2400 + 8 + 4 + 12) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 64,
+	.hsync_end = 1080 + 64 + 8,
+	.htotal = 1080 + 64 + 8 + 48,
+	.vdisplay = 2400,
+	.vsync_start = 2400 + 8,
+	.vsync_end = 2400 + 8 + 4,
+	.vtotal = 2400 + 8 + 4 + 12,
+	.width_mm = 70,
+	.height_mm = 153,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int ams662zs01_get_modes(struct drm_panel *panel,
+				struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &ams662zs01_mode);
+}
+
+static const struct drm_panel_funcs ams662zs01_panel_funcs = {
+	.prepare = ams662zs01_prepare,
+	.enable = ams662zs01_enable,
+	.disable = ams662zs01_disable,
+	.unprepare = ams662zs01_unprepare,
+	.get_modes = ams662zs01_get_modes,
+};
+
+static int ams662zs01_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return ret;
+}
+
+static const struct backlight_ops ams662zs01_bl_ops = {
+	.update_status = ams662zs01_bl_update_status,
+};
+
+/*
+ * qcom,mdss-dsi-bl-max-level = <4095>, default level 1600. The DDIC takes the
+ * 12-bit value as a big-endian 16-bit DCS 0x51 payload, which is what
+ * mipi_dsi_dcs_set_display_brightness_large() emits.
+ */
+static struct backlight_device *ams662zs01_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 1600,
+		.max_brightness = 4095,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &ams662zs01_bl_ops, &props);
+}
+
+static int ams662zs01_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct ams662zs01 *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct ams662zs01, panel,
+				   &ams662zs01_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(ams662zs01_supplies),
+					    ams662zs01_supplies, &ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->vout_gpio = devm_gpiod_get(dev, "vout", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->vout_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->vout_gpio),
+				     "Failed to get vout-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS |
+			  MIPI_DSI_MODE_LPM;
+
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = ams662zs01_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	/*
+	 * DSC 1.1, two 540x30 slices per line, 8 bpc, 8 bpp -- 3:1 against the
+	 * 24 bpp source. The panel has no uncompressed mode.
+	 */
+	dsi->dsc = &ctx->dsc;
+	ctx->dsc.dsc_version_major = 1;
+	ctx->dsc.dsc_version_minor = 1;
+	ctx->dsc.slice_height = 30;
+	ctx->dsc.slice_width = 540;
+	ctx->dsc.slice_count = 1080 / ctx->dsc.slice_width;
+	ctx->dsc.bits_per_component = 8;
+	ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
+	ctx->dsc.block_pred_enable = true;
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
+static void ams662zs01_remove(struct mipi_dsi_device *dsi)
+{
+	struct ams662zs01 *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id ams662zs01_of_match[] = {
+	{ .compatible = "samsung,ams662zs01" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ams662zs01_of_match);
+
+static struct mipi_dsi_driver ams662zs01_driver = {
+	.probe = ams662zs01_probe,
+	.remove = ams662zs01_remove,
+	.driver = {
+		.name = "panel-samsung-ams662zs01",
+		.of_match_table = ams662zs01_of_match,
+	},
+};
+module_mipi_dsi_driver(ams662zs01_driver);
+
+MODULE_DESCRIPTION("DRM driver for the Samsung AMS662ZS01 DSC command-mode panel");
+MODULE_LICENSE("GPL");
-- 
2.55.0

