Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA07437E5F1;
	Sun, 13 Sep 2026 05:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789277863; cv=none; b=ZAfKshQI2r0a/y68jsSiZVjRWPiIpD6/KjGmA7V10LSjdbP4xvOZT/dEkwPk2+44Ps0IgS9Z5MfPsau9tzXafM/mR0lULOpgA3facBzx16iGj9cA3d3znM5318XKe9KCFwSrPHoGnwOFUGrjladUbJoMSE04B2H5GCNMnsQB9GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789277863; c=relaxed/simple;
	bh=nN+YAuHRdrK2d4q8sNQtefTv1qOdyQd8xZ2iMEmb/gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qT5Kea+NaIqlnKJi/czXxoma5V179d/h2FkeKI092K9/5jkEiogHB4M+HrPtb7yv7pnMfsh83yB/TC3a3W3Q2K6GLLHUppNvQ/prJSIiSWtVp8zBaJvmza7PtghDEDYb/71t8Gdoz1EXIJGU7SOSuFv5NEl22mQnH2y4h/J+oGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=tdnCRLip; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="tdnCRLip"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+QttEVObrYR8GXWfoNvq0AB6iYbYDNJX/naKVGjPx2g=; b=tdnCRLipv4sh0Tlys5k4hJlNN4
	aYhCl7qJzw5T129DWXB+pI1MkEj0uUYpHa80svGzdlM+J5R0+ohX8LUBnO4MaDrH1ZAJoBkIRoCKb
	8iBlNyUMPvOJj1PqfskDufOokKGArX6sz1ROq3kKRQlRNaV+Hs6qrIwll5ZsLYjk9M3s=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1x5cuH-0000000Dxg1-0HNq;
	Sun, 13 Sep 2026 08:37:38 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Date: Sun, 13 Sep 2026 08:36:37 +0300
Subject: [PATCH 5/9] drm/panel: novatek-nt36672a: Combine two init
 callbacks into one
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-nt36672a-panels-v1-5-ce097402c6ea@minlexx.ru>
References: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
In-Reply-To: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
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
 phone-devel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>
X-Mailer: b4 0.16.0

The split between .send_init_cmds_1 and _cmds_2 is completely artificial
and unnecessary. Two command sets are split in between by the sequence:
 - exit_sleep_mode
 - delay
 - set_display_on

But not every panel driver follows this "split" in their init sequence.
Some may have different delay timer, or put exit_sleep_mode/display_on
commands into other places in the sequence.

In order to make this driver more extensible, combine two init functions
into one by puting exit_sleep_mode/delay/display_on in the middle,
followed by commands from cmds_2.

No functional change - full init sequence with all the delays for the
tianma_fhd_video panel is kept the same in the end.

Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
---
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 37 +++++++++-----------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 73bec4f47ec60..237a6a8699aef 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -51,8 +51,7 @@ struct nt36672a_panel_desc {
 	enum mipi_dsi_pixel_format format;
 	unsigned int lanes;
 
-	void (*send_init_cmds_1)(struct mipi_dsi_multi_context *dsi_ctx);
-	void (*send_init_cmds_2)(struct mipi_dsi_multi_context *dsi_ctx);
+	void (*send_init_cmds)(struct mipi_dsi_multi_context *dsi_ctx);
 	void (*send_deinit_cmds)(struct mipi_dsi_multi_context *dsi_ctx);
 };
 
@@ -140,22 +139,9 @@ static int nt36672a_panel_prepare(struct drm_panel *panel)
 
 	dsi_ctx.accum_err = nt36672a_panel_power_on(pinfo);
 
-	/* send first part of init cmds */
-	if (pinfo->desc->send_init_cmds_1)
-		pinfo->desc->send_init_cmds_1(&dsi_ctx);
-
-	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
-
-	/* 0x46 = 70 ms delay */
-	mipi_dsi_msleep(&dsi_ctx, 70);
-
-	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
-
-	/* Send rest of the init cmds */
-	if (pinfo->desc->send_init_cmds_2)
-		pinfo->desc->send_init_cmds_2(&dsi_ctx);
-
-	mipi_dsi_msleep(&dsi_ctx, 120);
+	/* send init cmds */
+	if (pinfo->desc->send_init_cmds)
+		pinfo->desc->send_init_cmds(&dsi_ctx);
 
 	if (dsi_ctx.accum_err < 0)
 		gpiod_set_value(pinfo->reset_gpio, 0);
@@ -192,7 +178,7 @@ static const struct drm_panel_funcs panel_funcs = {
 	.get_modes = nt36672a_panel_get_modes,
 };
 
-static void tianma_fhd_video_send_init_cmds_1(struct mipi_dsi_multi_context *dsi_ctx)
+static void tianma_fhd_video_send_init_cmds(struct mipi_dsi_multi_context *dsi_ctx)
 {
 	u8 reg;
 
@@ -352,15 +338,19 @@ static void tianma_fhd_video_send_init_cmds_1(struct mipi_dsi_multi_context *dsi
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x51, 0xff);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x55, 0x00);
-}
 
-static void tianma_fhd_video_send_init_cmds_2(struct mipi_dsi_multi_context *dsi_ctx)
-{
+	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
+	/* 0x46 = 70 ms delay */
+	mipi_dsi_msleep(dsi_ctx, 70);
+	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
+
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x24);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc3, 0x01);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc4, 0x54);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x10);
+
+	mipi_dsi_msleep(dsi_ctx, 120);
 }
 
 static void tianma_fhd_video_send_deinit_cmds(struct mipi_dsi_multi_context *dsi_ctx)
@@ -399,8 +389,7 @@ static const struct nt36672a_panel_desc tianma_fhd_video_panel_desc = {
 			| MIPI_DSI_MODE_VIDEO_BURST,
 	.format = MIPI_DSI_FMT_RGB888,
 	.lanes = 4,
-	.send_init_cmds_1 = tianma_fhd_video_send_init_cmds_1,
-	.send_init_cmds_2 = tianma_fhd_video_send_init_cmds_2,
+	.send_init_cmds = tianma_fhd_video_send_init_cmds,
 	.send_deinit_cmds = tianma_fhd_video_send_deinit_cmds,
 };
 

-- 
2.55.0

