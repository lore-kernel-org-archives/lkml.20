Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CB951DAE0;
	Thu, 17 Sep 2026 16:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663469; cv=none; b=ZdFVb2+SFVWf2TqC6dtwVcWfV4ir/3BXLVrSQrURvm3GetiWriWca0Hg5VrgDjaJJwp4R5hvLqwh/51SxlFAEjLswCY0NptR09kE3zQgbdH3vdkokjmKutGa31/bpOcbhbEEKuoaqUt5U7D7IP/FFn60I0u1HJX7qh3oI7lx9qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663469; c=relaxed/simple;
	bh=dMQIC0cPZTsuqcWZzXFykyLUfxYCcFMu1A1+cGaVfvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tAgQLeIOlCCYJmjRAvFF9wQlB7Uadn26pVA+VOBx8sDBaQtP+yUk8yWcRdR0kTZGZsduCl8Sx/SdV+D3ockBY8eYRTFXeUnJNnND/DxCbvr1apIvrAmb+7PmpqPi/ufqwghN1hAHsbXdLCNXiLLaTvBJTWpYExTsTfkyRfI4xsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=npiYHbzV; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="npiYHbzV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vSHMqTD6DTrYG4jyPlHTGH4wyhIEg8VqHx98b7hhbZc=; b=npiYHbzVvIu6G4+zrP6rvcM0i6
	tplmqvIN5mJL/1tV0CrTO6S3CmqMwqZbdsvJpsrg3qjfmXICHEiwVUwn9CjsZpHOQAfJPnLCg3ppk
	f7UDOq932YjdKrj7PyixbMiuLuMmD3c1V+mR7gaxoMy4i82X0WUyItEzH8JV34P+/KFM=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1x7FDj-0000000Bw3I-227J;
	Thu, 17 Sep 2026 19:44:24 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Date: Thu, 17 Sep 2026 19:43:08 +0300
Subject: [PATCH v2 6/9] drm/panel: novatek-nt36672a: Add 3 panels used in
 Xiaomi phones
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-nt36672a-panels-v2-6-f8de8be5b86f@minlexx.ru>
References: <20260917-nt36672a-panels-v2-0-f8de8be5b86f@minlexx.ru>
In-Reply-To: <20260917-nt36672a-panels-v2-0-f8de8be5b86f@minlexx.ru>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>, 
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 Richard Acayan <mailingradian@gmail.com>
X-Mailer: b4 0.16.0

Add support for 3 panels used in 2 Xiaomi smartphones, all based on
Qualcomm SDM636/660 SoC:

* Shenchao panel used in Xiaomi Redmi Note 7 (xiaomi-lavender), the
  exact model string is unknown
* Tianma TL063FVMC43-02  for Xiaomi Redmi Note 6 Pro (xiaomi-tulip)
* Tianma TL063FVMCA01-00 for Xiaomi Redmi Note 7 (xiaomi-lavender)

They all are DSI video mode panels using Novatek NT36672A controller,
so they can share almost exactly the same init/off sequences with
minimal differences between variants. This allows to avoid a lot of
code duplication.

Co-developed-by: Richard Acayan <mailingradian@gmail.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>

---
v2: sort compatible strings alphabetically in of_device_id
---
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 166 +++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index a445c8067aa5f..d356348d39608 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -357,6 +357,90 @@ static void tianma_fhd_video_send_deinit_cmds(struct mipi_dsi_multi_context *dsi
 	msleep(60); /* 0x3C = 60ms delay */
 }
 
+static void lavender_tulip_init_cmds(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	/*
+	 * This function supports 3 similar panels with minimal differences
+	 * in their init sequences. We assume base to be lavender-tianma
+	 * panel, and 2 variations (lavender-shenchao and tulip) are handled as
+	 * differences to base.
+	 */
+	const struct device_node *node = dev_of_node(&dsi_ctx->dsi->dev);
+	bool is_shenchao = of_device_is_compatible(node, "shenchao,fhdplus-video");
+	bool is_tulip = of_device_is_compatible(node, "tianma,tl063fvmc43-02");
+
+	dsi_ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x25);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x18, 0x96);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x05, 0x04);
+
+	if (is_shenchao)
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x27);
+	else
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x20);
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+
+	if (is_shenchao)
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd9, 0x10);
+	else
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x78, 0x01);
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x24);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x82, 0x13);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x84, 0x31);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x88, 0x13);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x8a, 0x31);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x8e, 0xe4);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x8f, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x90, 0x80);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x26);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xa9, 0x12);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xaa, 0x10);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xae, 0x8a);
+
+	if (is_shenchao)
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1c, 0xfa);
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x10);
+
+	if (is_shenchao)
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0, 0x01);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 80);
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0, 0x01);
+	mipi_dsi_dcs_set_tear_on_multi(dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	if (is_tulip) {
+		mipi_dsi_dcs_set_display_brightness_multi(dsi_ctx, 0x00ff);
+	} else {
+		/* lavender tianma + shenchao specific part */
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x68, 0x03, 0x04);
+		mipi_dsi_dcs_set_display_brightness_multi(dsi_ctx, 0x00b8);
+	}
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+
+	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
+}
+
+static void lavender_tulip_deinit_cmds(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	dsi_ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_set_display_off_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 20);
+	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 120);
+}
+
 static const struct drm_display_mode tianma_fhd_video_panel_default_mode = {
 	.clock		= 161331,
 
@@ -389,6 +473,85 @@ static const struct nt36672a_panel_desc tianma_fhd_video_panel_desc = {
 	.send_deinit_cmds = tianma_fhd_video_send_deinit_cmds,
 };
 
+/* common for both lavender-tianma and lavender-shenchao panels */
+static const struct drm_display_mode lavender_panel_default_mode = {
+	.clock		= (1080 + 90 + 2 + 120) * (2340 + 10 + 3 + 8) * 60 / 1000,
+
+	.hdisplay	= 1080,
+	.hsync_start	= 1080 + 90,
+	.hsync_end	= 1080 + 90 + 2,
+	.htotal		= 1080 + 90 + 2 + 120,
+
+	.vdisplay	= 2340,
+	.vsync_start	= 2340 + 10,
+	.vsync_end	= 2340 + 10 + 3,
+	.vtotal		= 2340 + 10 + 3 + 8,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct nt36672a_panel_desc shenchao_lavender_panel_desc = {
+	.display_mode = &lavender_panel_default_mode,
+
+	.width_mm = 67,
+	.height_mm = 145,
+
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 4,
+	.send_init_cmds = lavender_tulip_init_cmds,
+	.send_deinit_cmds = lavender_tulip_deinit_cmds,
+};
+
+static const struct nt36672a_panel_desc tianma_lavender_panel_desc = {
+	.display_mode = &lavender_panel_default_mode,
+
+	.width_mm = 67,
+	.height_mm = 145,
+
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 4,
+	.send_init_cmds = lavender_tulip_init_cmds,
+	.send_deinit_cmds = lavender_tulip_deinit_cmds,
+};
+
+static const struct drm_display_mode tianmaplus_e7t_tulip_mode = {
+	.clock		= (1080 + 100 + 28 + 120) * (2280 + 10 + 3 + 8) * 60 / 1000,
+
+	.hdisplay	= 1080,
+	.hsync_start	= 1080 + 100,
+	.hsync_end	= 1080 + 100 + 28,
+	.htotal		= 1080 + 100 + 28 + 120,
+
+	.vdisplay	= 2280,
+	.vsync_start	= 2280 + 10,
+	.vsync_end	= 2280 + 10 + 3,
+	.vtotal		= 2280 + 10 + 3 + 8,
+
+	.width_mm = 68,
+	.height_mm = 143,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct nt36672a_panel_desc tianmaplus_e7t_tulip_panel_desc = {
+	.display_mode = &tianmaplus_e7t_tulip_mode,
+
+	.width_mm = 68,
+	.height_mm = 143,
+
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 4,
+	/* tulip panel uses almost the same init/deinit sequences as lavender */
+	.send_init_cmds = lavender_tulip_init_cmds,
+	.send_deinit_cmds = lavender_tulip_deinit_cmds,
+};
+
 static int nt36672a_panel_add(struct nt36672a_panel *pinfo)
 {
 	struct device *dev = &pinfo->link->dev;
@@ -465,7 +628,10 @@ static void nt36672a_panel_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id panel_nt36672a_match[] = {
+	{ .compatible = "shenchao,fhdplus-video", .data = &shenchao_lavender_panel_desc },
 	{ .compatible = "tianma,fhd-video", .data = &tianma_fhd_video_panel_desc },
+	{ .compatible = "tianma,tl063fvmc43-02", .data = &tianmaplus_e7t_tulip_panel_desc },
+	{ .compatible = "tianma,tl063fvmca01-00", .data = &tianma_lavender_panel_desc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, panel_nt36672a_match);

-- 
2.55.0

