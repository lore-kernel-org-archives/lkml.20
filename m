Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE90443E38;
	Mon, 14 Sep 2026 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387108; cv=none; b=OEpiQQoQ6o0leNHnQSEFDdxIHbvfHUNa0Wcp2UzgeaTnbyj44kcLHNJaQ3IhdNoKgdZMz2LuhUb1JxBtyDwS4e8u1Bsn8XtAzIe1a8frq/LUGl+FssWXCLv1t+LF7QR66iCj2JxrtwJzo0AAnfCXZCpri6I6LWTyI2epMf9CupE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387108; c=relaxed/simple;
	bh=FyxzOXMGvGyR9IGtJX49GOeZL3XtdoX7TlUz8JNlRyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exHPPhcYA9vPLb68uinS0wifnjIHQ3CpO9MGkoTat74SXHA2bdc+guFmnEMoTRDnpOSeoxkhqUeXTEjwDnQwT8m8l62ljl59KnpP8uZcUFY+oSofcauZxLxYI6Bo9x3gRdLIUwZ1BTKabyojNNSST85K0mEXNr22UOlGGL9QRz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JACHQ/dr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JACHQ/dr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789387102;
	bh=FyxzOXMGvGyR9IGtJX49GOeZL3XtdoX7TlUz8JNlRyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JACHQ/drqgRWgwcWUd4Du51rNSc3r7eXrrsZBQMljimyKEaEiK3ly8d5feSBBvg3E
	 uiLuRsaXVO5cH8xiwgSgUxbOj9dJJ0lGCZxdMYlwf5M2UPulUQPtgQdDQ5enICoJyS
	 3c/klWuEk6QRy+KXlZBpbdKCKiSaxCqLROn+YJOyuQM7OAMyrKjgtbyWd/rLZ8rzE2
	 K2U50FltlplWRbqdePPu5mRnc8+BeTrdVNCmf38eu+tigsk8NDRcyUJpbP+cXOawU9
	 jKkENJuGgOzs7pyac5tBVZ0WbYw29JTm/2qYfg/6ZBEz114oWyuRNCUsU/3ks9Lk+Y
	 DTVOSanxPqcJA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FE1617E0D43;
	Mon, 14 Sep 2026 13:58:21 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v7 07/13] drm/mediatek: mtk_dsi: Move max link rate parameter to platform data
Date: Mon, 14 Sep 2026 13:58:06 +0200
Message-ID: <20260914115812.22751-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914115812.22751-1-angelogioacchino.delregno@collabora.com>
References: <20260914115812.22751-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer MediaTek DSI IPs, found in newer SoCs like MT8189 and others
can support a higher link rate up to 2.5Gbps, while older ones are
limited to 1.5Gbps.

In preparation for adding support for those, move the maximum link
rate parameter from being a magic number in mtk_dsi's .mode_valid()
callback to platform data, declared for each SoC.

Note that said number was previously expressed in Kbps but, in the
platform data member, it is now expressed in Mbps instead in order
to keep the mtk_dsi_driver_data structure footprint smaller: for
this, the calculation in mtk_dsi_bridge_mode_valid() was changed
to multiply the max_link_rate_mbps parameter by KILO (1000), which
brings the value back to Kbps.

Also, since now higher maximum pixel clock rates are achievable,
make sure that calculations are not overflowing by casting to u64
where needed.

In terms of wasted cycles, this is fine, because this callback is
executed only once during display IF enablement (at boot, after a
resume from suspend, or during runtime display resolution changes).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index fa0f404bc7ad..6e92e4e1586f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -234,6 +234,8 @@ struct mtk_dsi_driver_data {
 	const u16 *reg_main;
 	const u16 *reg_adv;
 
+	const u16 max_link_rate_mbps;
+
 	bool has_size_ctl;
 	bool cmdq_long_packet_ctl;
 	bool support_per_frame_lp;
@@ -921,7 +923,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	}
 	bit_per_pixel = ret;
 
-	dsi->data_rate = DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
+	dsi->data_rate = DIV_ROUND_UP_ULL((u64)dsi->vm.pixelclock * bit_per_pixel,
 					  dsi->lanes);
 
 	ret = clk_set_rate(dsi->hs_clk, dsi->data_rate);
@@ -1097,13 +1099,21 @@ mtk_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 			  const struct drm_display_mode *mode)
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
+	const struct mtk_dsi_driver_data *data = dsi->driver_data;
+	u64 wanted_link_rate, max_link_rate;
 	int bpp;
 
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 	if (bpp < 0)
 		return MODE_ERROR;
 
-	if (mode->clock * bpp / dsi->lanes > 1500000)
+	wanted_link_rate = mode->clock;
+	wanted_link_rate *= bpp;
+	max_link_rate = data->max_link_rate_mbps;
+	max_link_rate *= dsi->lanes;
+	max_link_rate *= KILO;
+
+	if (wanted_link_rate > max_link_rate)
 		return MODE_CLOCK_HIGH;
 
 	if (dsi->dsc) {
@@ -1547,28 +1557,42 @@ static void mtk_dsi_remove(struct platform_device *pdev)
 static const struct mtk_dsi_driver_data mt8173_dsi_driver_data = {
 	.reg_main = mtk_dsi_regs_main_v1,
 	.reg_adv = mtk_dsi_regs_mt8173,
+	.max_link_rate_mbps = 1500,
 };
 
 static const struct mtk_dsi_driver_data mt2701_dsi_driver_data = {
 	.reg_main = mtk_dsi_regs_main_v1,
 	.reg_adv = mtk_dsi_regs_mt2701,
+	.max_link_rate_mbps = 1500,
 };
 
 static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
 	.reg_main = mtk_dsi_regs_main_v1,
 	.reg_adv = mtk_dsi_regs_mt8183,
+	.max_link_rate_mbps = 1500,
 	.has_size_ctl = true,
 };
 
 static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
 	.reg_main = mtk_dsi_regs_main_v1,
 	.reg_adv = mtk_dsi_regs_mt8186,
+	.max_link_rate_mbps = 1500,
 	.has_size_ctl = true,
 };
 
 static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 	.reg_main = mtk_dsi_regs_main_v1,
 	.reg_adv = mtk_dsi_regs_mt8186,
+	.max_link_rate_mbps = 1500,
+	.has_size_ctl = true,
+	.cmdq_long_packet_ctl = true,
+	.support_per_frame_lp = true,
+};
+
+static const struct mtk_dsi_driver_data mt8189_dsi_driver_data = {
+	.reg_main = mtk_dsi_regs_main_v1,
+	.reg_adv = mtk_dsi_regs_mt8186,
+	.max_link_rate_mbps = 2500,
 	.has_size_ctl = true,
 	.cmdq_long_packet_ctl = true,
 	.support_per_frame_lp = true,
@@ -1581,6 +1605,7 @@ static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt8183-dsi", .data = &mt8183_dsi_driver_data },
 	{ .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
 	{ .compatible = "mediatek,mt8188-dsi", .data = &mt8188_dsi_driver_data },
+	{ .compatible = "mediatek,mt8189-dsi", .data = &mt8189_dsi_driver_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
-- 
2.55.0

