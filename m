Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBD2126C02;
	Fri, 25 Sep 2026 07:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790320101; cv=none; b=BwO4WmIXU4q1wAQG2V9+M9eagcYiBSLx9scbou04Os1j/Af6SBEPzJc8ZYQTC1R33GGLO9JGb+CM19zl/TeniP4oaYpUig8x9lTz1Yj5IH+8Ak+OCxdVSgKQcftgmsiATdJFaGXq0sVXp6ABAYjbC9jFqI0D8p9o6744SR1Dqwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790320101; c=relaxed/simple;
	bh=8etL+wAs3Ize3LP595qqpuZ9KDwh/FUcMQQ9FuaU0Lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W7Ftr5+EZLBWPP086xKDG6jBeP2XV1ofBxkkl8Qu+HjIhwyd2QssoF00QnKJCL49t3y1D/Pp1CdAkt1PwrcoDl7ftuzA5e4EVQoKwDU9b7/jSSApvUQnU7kpwAihuPxXHyHgueERnY2ykTXeWotPIsvIdkEKt1YpJnVglVhDRG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgACLZmf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgACLZmf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D197C2BCFF;
	Fri, 25 Sep 2026 07:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790320101;
	bh=8etL+wAs3Ize3LP595qqpuZ9KDwh/FUcMQQ9FuaU0Lc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GgACLZmfAVKOvmdV1bh7w7e61ro2Kl609Z7toDiwX+U26Ef+eZ9J7b9uz1Nc+++ko
	 djrgypZtsO3wiJqsq23nI51EUXQOzDOrBI5MAWp0GHjwkCWffkDhh7jZnd3SVUxDJa
	 v+yc5hl1JWcJPdsa9jCd+JFivnxNxdPWdSS/9NCD2smL+E7pbQkEYEqX6VuTefrMQR
	 o3ByUsqSHiN7wJJD4D6pOEQ9St/JSFc5V5a9i4sUfNC4s3G44iRwFUjt9rOD2QXLln
	 M6qlWwBb/nHRvhJMLiUNpAnuXFU4uqOEBzYSL+zsDZ6lQKxbne2sVWcQQ1aRYa4fAn
	 xbEnvhlVXa+Tg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D06C98328;
	Fri, 25 Sep 2026 07:08:21 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 25 Sep 2026 02:08:22 -0500
Subject: [PATCH v2 4/4] drm/panel: visionox-vtdr6130: Add Retroid Pocket 6
 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-rp6-panel-v2-4-19c425e523de@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790320100; l=6014;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=KK2X91MsaixtTJvsZhX3AF+6Xf7FsHhTOW13xw4bzA0=;
 b=n9gro6KbuHIq9LRGBxSsfQnTdP577N5Y5RXJjt7mTqOO/1RjkJmQpigYn3aYRBkAf+t2S2bB3
 HdgDwMduGpFBQU1U3iENE8tOeqO07IwlG50kRABLqLYlj1ufqWSPu+v
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Add support for the 1080x1920 panel used in the Retroid Pocket 6.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 114 ++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
index 278f5acc2d661..d0db128cda819 100644
--- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -60,6 +60,82 @@ static void visionox_vtdr6130_reset(struct visionox_vtdr6130 *ctx)
 	usleep_range(10000, 11000);
 }
 
+static int retroidpocket_rp6_on(struct visionox_vtdr6130 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+	struct drm_dsc_picture_parameter_set pps;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x01);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx,
+				     MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0xff07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x11, 0x00, 0x00, 0x89,
+				     0x30, 0x80, 0x07, 0x80, 0x04, 0x38, 0x00,
+				     0x14, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
+				     0x02, 0x25, 0x00, 0x20, 0x01, 0xd5, 0x00,
+				     0x07, 0x00, 0x0d, 0x05, 0x7a, 0x05, 0x16,
+				     0x18, 0x00, 0x10, 0xf0, 0x03, 0x0c, 0x20,
+				     0x00, 0x06, 0x0b, 0x0b, 0x33, 0x0e, 0x1c,
+				     0x2a, 0x38, 0x46, 0x54, 0x62, 0x69, 0x70,
+				     0x77, 0x79, 0x7b, 0x7d, 0x7e, 0x01, 0x02,
+				     0x01, 0x00, 0x09, 0x40, 0x09, 0xbe, 0x19,
+				     0xfc, 0x19, 0xfa, 0x19, 0xf8, 0x1a, 0x38,
+				     0x1a, 0x78, 0x1a, 0xb6, 0x2a, 0xb6, 0x2a,
+				     0xf4, 0x2a, 0xf4, 0x4b, 0x34, 0x63, 0x74,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xaa, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x02, 0x15, 0x00, 0x14,
+				     0x00, 0x20, 0x00, 0x02, 0x16, 0x00, 0x14,
+				     0x07, 0xb4, 0x00, 0x02, 0x16, 0x00, 0x14,
+				     0x00, 0x10, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xaa, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x03, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x0a, 0x72, 0x00, 0x00,
+				     0x0a, 0x72, 0x00, 0x00, 0x0a, 0x72, 0x00,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x00, 0x1e, 0x1e, 0x1e,
+				     0x1e, 0x1e, 0x1e, 0x06, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x00, 0x00, 0x08, 0x1e,
+				     0x1e, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc, 0x10, 0x00, 0x00, 0x08,
+				     0x11, 0x1e, 0x7c, 0x1e, 0x7c, 0x1e, 0x7c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbe, 0x10, 0x10, 0x00, 0x0c,
+				     0x22, 0x1e, 0x62, 0x1e, 0x62, 0x1e, 0x62);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x5a, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x5a, 0x81);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf9, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x5a, 0x83);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xaa, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x5a, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 150);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+
+	drm_dsc_pps_payload_pack(&pps, dsi->dsc);
+	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
+	mipi_dsi_compression_mode_multi(&dsi_ctx, true);
+
+	return dsi_ctx.accum_err;
+}
+
 static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
@@ -200,6 +276,43 @@ static int visionox_vtdr6130_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
+static const struct drm_display_mode retroidpocket_rp6_modes[] = {
+	{
+		.clock = (1080 + 22 + 2 + 16) * (1920 + 16 + 2 + 20) * 120 / 1000,
+		.hdisplay = 1080,
+		.hsync_start = 1080 + 22,
+		.hsync_end = 1080 + 22 + 2,
+		.htotal = 1080 + 22 + 2 + 16,
+		.vdisplay = 1920,
+		.vsync_start = 1920 + 16,
+		.vsync_end = 1920 + 16 + 2,
+		.vtotal = 1920 + 16 + 2 + 20,
+		.width_mm = 69,
+		.height_mm = 122,
+	},
+};
+
+static struct visionox_vtdr6130_desc retroidpocket_rp6_panel_desc = {
+	.modes = retroidpocket_rp6_modes,
+	.num_modes = ARRAY_SIZE(retroidpocket_rp6_modes),
+	.bpc = 8,
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET |
+		      MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.init_sequence = retroidpocket_rp6_on,
+	.dsc = {
+		.dsc_version_major = 0x1,
+		.dsc_version_minor = 0x1,
+		.slice_height = 12,
+		.slice_width = 540,
+		.slice_count = 2,
+		.bits_per_component = 8,
+		.bits_per_pixel = 8 << 4,
+		.block_pred_enable = true,
+	},
+};
+
 static const struct drm_display_mode visionox_vtdr6130_modes[] = {
 	{
 		.clock = (1080 + 20 + 2 + 20) * (2400 + 20 + 2 + 18) * 144 / 1000,
@@ -353,6 +466,7 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id visionox_vtdr6130_of_match[] = {
+	{ .compatible = "retroidpocket,rp6-panel", .data = &retroidpocket_rp6_panel_desc },
 	{ .compatible = "visionox,vtdr6130", .data = &visionox_vtdr6130_panel_desc },
 	{ /* sentinel */ }
 };

-- 
2.54.0


