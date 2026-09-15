Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE4748034A;
	Tue, 15 Sep 2026 08:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461740; cv=none; b=f9OaDGJtsEouQazmeBN5RhiUV0rWSFiNdXLt3czdxlrV3uDHJYIfA+/X5zrdeLpVfiEcQpDhjGY/PR2j0t+99OtRfVZZ1IqjL3KsxVC8G2qSOTgZhEMmcEVW657szbpLlcYvcN1yR3piJoOYdOm6aQAfBam/g2Bs4IzdJBpExDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461740; c=relaxed/simple;
	bh=c7XddCiS6S/HY6vNB0OxftBcsBRc5rJIdwTpW043qdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G879x4brUXGvKRap6735tPnOVjTQpJWPUe9hEtXZCt0lqr7JUaE3EWzwdrut2Lm9Nc4ybMFH9nRM1g2PJm2hvsjmaoraIu2R0NXnRXSS+hoiREcwKTpmkLe4H5wPy/P91INb+QS2I5ZxgTb134ugiWPxlUbPo48+0unEn+f3Vwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=isGC1Gtj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="isGC1Gtj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789461735;
	bh=c7XddCiS6S/HY6vNB0OxftBcsBRc5rJIdwTpW043qdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=isGC1GtjBaND7JQvauHzOhfSZKJfjXdmvRY5lPV6nWWLB/ESPiS9bRFKY21B0TFxP
	 AB0qkBFZcFi36NV7haHWVSPcg8afUfyJpKCe4f0tp2/fg4UxO1RlHfwoZtWsRlDFs6
	 ZwUzwAfp7sLfu//517KqFDaHVjj6hGQrshgbTWcXpr/wDJ8ned1KJ+7qvaEZEx5zyc
	 lEwenpKrQvHKSyIMwhiwP+EZOgl1C7vojZJL3EkJpHYOCSxszqVfktRCE33SY7EJfR
	 0kSCMWXWVQwo1jg6FsIKHYCTGsovKZnFIF5rOpz3Jip/2NXEg6Jc3uzuCZrA1wUFqM
	 vEU8oJBqmtDCw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F318B17E0FE2;
	Tue, 15 Sep 2026 10:42:13 +0200 (CEST)
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
Subject: [PATCH v8 10/13] drm/mediatek: mtk_dsi: Add support for MT8196
Date: Tue, 15 Sep 2026 10:41:45 +0200
Message-ID: <20260915084148.11385-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
References: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the new DSI IP found in the Kompanio Ultra MT8196
SoC and its Dimensity and Genio variants.

Differently from the older DSI IPs, the one from MT8196 requires
the initialization of all of the QoS parameters and can make use
of a DSI SRAM reserved buffer (present also on older SoCs but not
mandatory on those).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 +
 drivers/gpu/drm/mediatek/mtk_dsi.c     | 67 ++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 08f6be311dd1..aec8da072a41 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -828,6 +828,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8189-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8196-dsi",
+	  .data = (void *)MTK_DSI },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 16bf08bee38e..d930cb3c4d74 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -373,6 +373,59 @@ static const u16 mtk_dsi_regs_mt8186[DSI_ADV_REG_MAX] = {
 	[DSI_CMDQ] = 0xd00,
 };
 
+static const u16 mtk_dsi_regs_main_v2[DSI_MAIN_REG_MAX] = {
+	[DSI_START] = 0x00,
+	[DSI_INTEN] = 0x08,
+	[DSI_INTSTA] = 0x0c,
+	[DSI_CON_CTRL] = 0x30,
+	[DSI_MODE_CTRL] = 0x34,
+	[DSI_TXRX_CTRL] = 0x38,
+	[DSI_PSCTRL] = 0x3c,
+	[DSI_VSA_NL] = 0x60,
+	[DSI_VBP_NL] = 0x64,
+	[DSI_VFP_NL] = 0x68,
+	[DSI_VACT_NL] = 0x6c,
+	[DSI_SIZE_CON] = 0x2c,
+	[DSI_HSA_WC] = 0x80,
+	[DSI_HBP_WC] = 0x84,
+	[DSI_HFP_WC] = 0x88,
+	[DSI_CMDQ_SIZE] = 0x44,
+	[DSI_HSTX_CKL_WC] = 0x100,
+	[DSI_RX_DATA0] = 0xa4,
+	[DSI_RX_DATA1] = 0xa8,
+	[DSI_RX_DATA2] = 0xac,
+	[DSI_RX_DATA3] = 0xb0,
+	[DSI_RACK] = 0xb4,
+	[DSI_PHY_LCCON] = 0x1d0,
+	[DSI_PHY_LD0CON] = 0x1d4,
+	[DSI_PHY_TIMECON0] = 0x600,
+	[DSI_PHY_TIMECON1] = 0x604,
+	[DSI_PHY_TIMECON2] = 0x608,
+	[DSI_PHY_TIMECON3] = 0x60c,
+};
+
+static const u16 mtk_dsi_regs_qos_v2[DSI_QOS_REG_MAX] = {
+	[DSI_QOS_BUF_CON0] = 0x300,
+	[DSI_QOS_BUF_CON1] = 0x304,
+	[DSI_QOS_TX_BUF_RW_TIMES] = 0x310,
+	[DSI_QOS_SODI_HIGH] = 0x314,
+	[DSI_QOS_SODI_LOW] = 0x318,
+	[DSI_QOS_PREULTRA_HIGH] = 0x324,
+	[DSI_QOS_PREULTRA_LOW] = 0x328,
+	[DSI_QOS_ULTRA_HIGH] = 0x32c,
+	[DSI_QOS_ULTRA_LOW] = 0x330,
+	[DSI_QOS_URGENT_HIGH] = 0x334,
+	[DSI_QOS_URGENT_LOW] = 0x338,
+	[DSI_QOS_PREURGENT_HIGH] = 0x33c
+};
+
+static const u16 mtk_dsi_regs_mt8196[DSI_ADV_REG_MAX] = {
+	[DSI_VM_CMD_CON] = 0x110,
+	[DSI_SHADOW_DEBUG] = 0xd0,
+	[DSI_CMDQ] = 0x400,
+	[DSI_VDE] = 0x3f8,
+};
+
 static inline struct mtk_dsi *bridge_to_dsi(struct drm_bridge *b)
 {
 	return container_of(b, struct mtk_dsi, bridge);
@@ -1743,6 +1796,19 @@ static const struct mtk_dsi_driver_data mt8189_dsi_driver_data = {
 	.support_per_frame_lp = true,
 };
 
+static const struct mtk_dsi_driver_data mt8196_dsi_driver_data = {
+	.reg_main = mtk_dsi_regs_main_v2,
+	.reg_qos = mtk_dsi_regs_qos_v2,
+	.reg_adv = mtk_dsi_regs_mt8196,
+	.max_link_rate_mbps = 2000,
+	.dsi_sram_bytes = 32,
+	.pixels_per_iter = 2,
+	.num_burst_lines = 8,
+	.has_size_ctl = true,
+	.cmdq_long_packet_ctl = true,
+	.support_per_frame_lp = true,
+};
+
 static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt2701-dsi", .data = &mt2701_dsi_driver_data },
 	{ .compatible = "mediatek,mt8167-dsi", .data = &mt2701_dsi_driver_data },
@@ -1751,6 +1817,7 @@ static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
 	{ .compatible = "mediatek,mt8188-dsi", .data = &mt8188_dsi_driver_data },
 	{ .compatible = "mediatek,mt8189-dsi", .data = &mt8189_dsi_driver_data },
+	{ .compatible = "mediatek,mt8196-dsi", .data = &mt8196_dsi_driver_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
-- 
2.55.0

