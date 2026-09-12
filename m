Received: from mail-oa2-f0.google.com (mail-oa2-f0.google.com [74.125.231.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB41748EBC1
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789237366; cv=none; b=kARlWQjTTLzfpsj0OdL0Wpzn0W52gZJwKDc0HQ3/WXOU4O4obzepGrl/FbDGnHLjUWhCLDTOSGDMU9+tWZpTkrbMsdsUyrxs6yNplKgMoIeN/8owz+09M/wWccE0zRP65IO6xOfSA0KMHYsEJIu3ALwbVdUvoZqmodaK20Gy8BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789237366; c=relaxed/simple;
	bh=+ss2L+Ib4MBWxp1h1w+PuZmWHwVj9nyoMPZxLoTG0+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rpAM0H8Em7SLALIhHeXEAv3eypaukdnWLI6U3BJDGOB4yfqj52wWXgWYn/RSMvWD4JYLPtGGVGDqpCzbZIo7SSEJEI/oQUi6yJkYMVYKwuTm20mHpgPoCHQwgXn/l3/xWjy4ektCtGR8ABN3fbmdZliSNvgBkq0kPHYZgH9lHCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGLiI3aX; arc=none smtp.client-ip=74.125.231.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGLiI3aX"
Received: by mail-oa2-f0.google.com with SMTP id 586e51a60fabf-451e1066971so596360fac.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789237358; x=1789842158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AN4nkmy715+ZC3aVioDzrXzTiXOhWqzQ+KZN4fFwxng=;
        b=OGLiI3aXcYyhhdb3mUNqVkPTV+DDL171iN0IgRzg9kbaFqJYZHTd1Iiw8wMpEM2eRv
         2tdLro3NwSTCbbrWlyLMl+6S1HRtf2DyBtTEcQbHgDQ85mPxB415RPo3qyd79goWaHMz
         wcyzp87Nk8WquZYNjTREZnVuUDPsR8Bt4RjR0fLm9PN7FkCjUTgFT9gT4PZygSpU+gRN
         0ziAUL0rvjYyPyLpmTIrTPU92x7RxUyUJc+3aAw51TVvqX+CuKF1KDCPqKPYGqGNj2gg
         nRKrWcXGeJEjXwGX+j0xFhDZnjjwpNUYb8oMMrNuR02oXv1Y1xGQlEvb1uL54P8uvuFK
         hEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789237358; x=1789842158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AN4nkmy715+ZC3aVioDzrXzTiXOhWqzQ+KZN4fFwxng=;
        b=b2SRzB0Mdljp99DrSTm5BwkTdsk6lIN7SgOu8OFFppZWeUs7SW6FXXE7JXKMS61oSC
         4evyAo4cyId1uumn53WW+Lx1dogFnkbCHneMLJlue/6dLuqU051CtChqvx0M9Ori9Pzl
         u5w2mEtym217Hk5VIbMG1iGRcpZ1/BdOmTeS2FvIZUfwA6ojq54eqbc7yHBLV6yRoJsV
         Guy4HK4FPii9XkELMcS7i+nXGHNJhUtpwo7uf4/oaEvsBWhf0cn+vtm/OTCrvq3+aRZ8
         UZhU1tv8aAwqP+IGaXDKJxOQg2YpH4+8jPpoPUxnl3UzLBvQwZYzSdLU3a3LcuzmgNhc
         Hl6A==
X-Forwarded-Encrypted: i=1; AKwUvByM1U45jzjCfgeyw7TacH41MH7xg6y2cjf9XD3I5cGSU5edoFSm+dZHD2BKNNYt95OU4DzQi4b1dHrgfRI=@vger.kernel.org
X-Gm-Message-State: AFuF++nJOO2aQcNcb/apRzki/Zq7VfoDGZbCgGydZoG08tQSnpbHXtxh
	B6Jc5Qw88ufY8gxr04KDJabQkR1F+ztGnWbTJfMc12b2+yBjc76rkFxX
X-Gm-Gg: AYBFou30eOozrvAnu1zxJg8cQ7wd+SsckKJIMMhJEHW+HQ64W/knE2lqmgZRUC+0oMy
	dg8tpJfdocUkkl/3yDc4RnJnlJsVxtpCuIiY5Qe8WjCQX/rYnlsukep1dFroFHGB7UGYUT3749K
	0uHyRxC+S1UZZeLKiWE/W9oOK1NjdtVuNuaoX7bs31Z3WBNZfCPMMqOuanzoMUfAF25RWoecF0B
	5cHy0Pfo1ypRoURL7ypPu9hbtSiXPWl7lKhF1eSzo2aG1gjlSJ12mygrjTktF+8lKPzHFDrbUZn
	5fedK5JYPezUyCQiD2Zr+8d0nalM5J6OpGmTmArOAMi/+uwYVOHwVr6U8g6dStb1OD80jTCXX2P
	58sGl+LkWhoUSebnkUY8aXKTkJEHAI2p8H8cB9n890/4HWPvwd9/d6JYyW2+JXXeuIa53L6F1Ry
	KgAuuuEg2o4vvB0PgZ1XGfE2qhS7H5Gn7pmwud+oi4zek+n76gmG2B/VdskxNmr3m80+mY+rLDT
	0lVpA==
X-Received: by 2002:a05:6871:708:b0:46a:239f:fc75 with SMTP id 586e51a60fabf-47de872ac02mr13363495fac.6.1789237358141;
        Sat, 12 Sep 2026 11:22:38 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df64d89b9sm5413898fac.1.2026.09.12.11.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 11:22:36 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sat, 12 Sep 2026 13:22:23 -0500
Subject: [PATCH 2/2] drm/panel: novatek-nt51021: add the BOE TV101WUM-NM0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-add-boe-tv101wum-nm0-v1-2-3057a08e8b80@gmail.com>
References: <20260912-add-boe-tv101wum-nm0-v1-0-3057a08e8b80@gmail.com>
In-Reply-To: <20260912-add-boe-tv101wum-nm0-v1-0-3057a08e8b80@gmail.com>
To: Nickolay Goppen <setotau@mainlining.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789237347; l=8635;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=+ss2L+Ib4MBWxp1h1w+PuZmWHwVj9nyoMPZxLoTG0+8=;
 b=j1p228CnmIEzx9is8c0FeHCDh/btuOiRy02C9Vr5rG83/TfahazWxf2gXBWwsNoTKDnjiOb0/
 jstq0A03/EDAboCyB8HY+AhZZeJlh+vq/hctZv2L7SBp91JGOXdqRMa
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Add the BOE module fitted to the Amazon Fire HD 10 (2017), an MT8173
tablet, as a third NT51021 variant. How the part was identified, since
its label is not readable without removing the main board, is set out in
the binding patch.

The register sequence is the BOE branch of init_lcm_registers() in
drivers/misc/mediatek/lcm/nt51021_wuxga_dsi_vdo/ in the Fire OS 3.18
tree, command for command, with only a 120 ms wait after sleep-out added
where the vendor waits its trailing 5 ms. The 0x8f 0xa5 and 0x8f 0x00
that bracket it are the vendor's command interface selection, sent on
every board that is not an early proto or HVT unit.

It is much shorter than boe_tv101wum_nx0_init() because this module is
left on its own factory trim. NT51021 R8CH selects whether V1/V14, gamma
and HAOP come from the panel's OTP memory or from control registers, and
the 0x8c 0x80 here leaves all three on OTP, where the NX0's 0x8e
switches
them to registers so that the three pages of gamma it then writes take
effect. So the absent gamma is deliberate rather than an omission, and
the differing 0x8c is its consequence. CABC is likewise untouched
because
the vendor drives it over I2C from the backlight path. What is left is
0xc0 and 0xc8, which the public NT51021 specification does not describe;
everything else this sequence touches carries the same value as the
other
two panels, including the terminal resistor, TP_SYNC, the MIPI Rx drive
strength and all three test modes.

The timings are the vendor's lcm_get_params(): hsync 1, hbp 32, hfp 110,
vsync 1, vbp 14, vfp 11, so htotal 1343 and vtotal 1946. The pixel clock
follows the vendor's PLL_CLOCK = 490, which after DDR is 980 Mbps per
lane and over four lanes at 24bpp is 163.33 MHz, so 62.5 Hz. The
bootloader leaves the MIPI TX PLL at that rate: read back before the
kernel touches it, this board's PLL decodes to exactly 980 Mbps per
lane, so the panel is already there when the kernel takes over.

The front porch is the vendor's declared 110 rather than the smaller
value its own DSI driver ends up running. That driver also sets
clk_lp_per_line_enable, which makes ddp_dsi_config() overwrite HFP_WC
after the declared timing is programmed, shrinking it to leave just
enough room to take the clock lane to LP and back. That is a
controller-side workaround rather than a panel property, and it
contradicts the cont_clock = 1 set beside it, which disables the very LP
transition it makes room for. Mainline mtk_dsi handles the clock lane
itself, so the panel's declared timing is the right thing to carry here.

The vendor asks for SYNC_EVENT_VDO_MODE with cont_clock = 1 rather than
burst, so make mode_flags per variant instead of fixed in probe(). The
two existing panels keep the flags they had. Burst was also tried on
this hardware and worked, but the vendor configuration is the one the
module is characterised for.

The physical size is the datasheet active area, 216.576 x 135.36 mm,
which measures 216 x 135 on the glass. The vendor's declared a
physical_width = 136 and physical_height = 221, which appears to be an
error. The size of the test unit was physically measured. 1200/136 and
1920/221 disagree by 1.5%.

The vendor's bootloader and kernel both carry a second register sequence
for the Innolux module this board second-sources against, selected from
two board ID straps. No Innolux unit was available, so that sequence is
left out rather than carried untested; however, the Innolux part number
was identified as "P101KDA-AB0", should someone with that glass need to
upstream support in the future.

Tested on the Amazon Fire HD 10 (2017) driven by mediatek-drm: 1200x1920
at 62.5 Hz across a cold boot, display off and on cycles and a
suspend/resume, with the MIPI TX PLL reading back at the intended rate
every time.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt51021.c | 66 ++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt51021.c b/drivers/gpu/drm/panel/panel-novatek-nt51021.c
index 61dd283769a7..2a8fa181ac37 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt51021.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt51021.c
@@ -23,6 +23,7 @@ struct novatek_nt51021_variant {
 	int (*init)(struct novatek_nt51021_desc *ctx);
 
 	const struct drm_display_mode *display_mode;
+	unsigned long mode_flags;
 };
 
 struct novatek_nt51021_desc {
@@ -607,6 +608,39 @@ static int boe_tv101wum_nx0_init(struct novatek_nt51021_desc *ctx)
 	return dsi_ctx.accum_err;
 }
 
+static int boe_tv101wum_nm0_init(struct novatek_nt51021_desc *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x8f, 0xa5);
+	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x01, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x8f, 0xa5);
+	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x83, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x84, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x8c, 0x80);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xcd, 0x6c);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc0, 0x8b);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc8, 0xf0);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x97, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x8b, 0x10);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xa9, 0x20);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x83, 0xaa);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x84, 0x11);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xa9, 0x4b);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x85, 0x04);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x86, 0x08);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x9c, 0x10);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x8f, 0x00);
+	mipi_dsi_msleep(&dsi_ctx, 5);
+
+	return dsi_ctx.accum_err;
+}
+
 static int nt51021_novatek_off(struct novatek_nt51021_desc *ctx)
 {
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
@@ -713,8 +747,7 @@ static int nt51021_novatek_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_LPM;
+	dsi->mode_flags = ctx->variant->mode_flags;
 
 	ctx->panel.prepare_prev_first = true;
 
@@ -744,6 +777,21 @@ static const struct drm_display_mode boe_tv080wum_nx2_mode = {
 	.type = DRM_MODE_TYPE_DRIVER,
 };
 
+static const struct drm_display_mode boe_tv101wum_nm0_mode = {
+	.clock = 163333,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 110,
+	.hsync_end = 1200 + 110 + 1,
+	.htotal = 1200 + 110 + 1 + 32,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 11,
+	.vsync_end = 1920 + 11 + 1,
+	.vtotal = 1920 + 11 + 1 + 14,
+	.width_mm = 135,
+	.height_mm = 216,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
 static const struct drm_display_mode boe_tv101wum_nx0_mode = {
 	.clock = (1200 + 172 + 4 + 32) * (1920 + 25 + 1 + 14) * 60 / 1000,
 	.hdisplay = 1200,
@@ -759,18 +807,32 @@ static const struct drm_display_mode boe_tv101wum_nx0_mode = {
 	.type = DRM_MODE_TYPE_DRIVER,
 };
 
+#define NT51021_BURST_MODE_FLAGS	(MIPI_DSI_MODE_VIDEO | \
+					 MIPI_DSI_MODE_VIDEO_BURST | \
+					 MIPI_DSI_MODE_NO_EOT_PACKET | \
+					 MIPI_DSI_MODE_LPM)
+
 static const struct novatek_nt51021_variant boe_tv080wum_nx2_data = {
 	.init = boe_tv080wum_nx2_init,
 	.display_mode = &boe_tv080wum_nx2_mode,
+	.mode_flags = NT51021_BURST_MODE_FLAGS,
+};
+
+static const struct novatek_nt51021_variant boe_tv101wum_nm0_data = {
+	.init = boe_tv101wum_nm0_init,
+	.display_mode = &boe_tv101wum_nm0_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM,
 };
 
 static const struct novatek_nt51021_variant boe_tv101wum_nx0_data = {
 	.init = boe_tv101wum_nx0_init,
 	.display_mode = &boe_tv101wum_nx0_mode,
+	.mode_flags = NT51021_BURST_MODE_FLAGS,
 };
 
 static const struct of_device_id nt51021_novatek_of_match[] = {
 	{ .compatible = "boe,tv080wum-nx2", .data = &boe_tv080wum_nx2_data },
+	{ .compatible = "boe,tv101wum-nm0", .data = &boe_tv101wum_nm0_data },
 	{ .compatible = "boe,tv101wum-nx0", .data = &boe_tv101wum_nx0_data },
 	{ /* sentinel */ }
 };

-- 
2.55.0

