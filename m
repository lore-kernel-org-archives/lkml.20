Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676B64EC670;
	Wed, 16 Sep 2026 11:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556937; cv=none; b=IJdCU2DiOOKDjyAHZvnAciD9v2PjVdlAvPYhiIfybpja/WqtnbdqXiAz/+Qg0DpPTR0v50MT4hPEL2JoOUjm1NDJfP1YeK2vcSkOh43gvekAKrn3/9fp9vJDgxIKP9ZB+FOh1vozr87viFNg1pGNSQ9MDW6YES9pI73Ffm+CR88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556937; c=relaxed/simple;
	bh=oz2OBCRQeNp7oxsHOzrhz8A95jACQzDfz9SB2Ntso8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kBV15Q4Niv8udWPazwPQ1YflOuqgC05MM/+4lZIC1IHu5xnq6wRH87NiOVsFwBbDIOvBx+8ZL+fPoK5ndygFvBv04UxACveL5QAtbaktcVTvMWgPH4Q/pgvkY8orNtTsXec5m/UvSKRGt8pVoRz7coI+uyZnytvYf6eQAWfFqwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dtvQgSYa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dtvQgSYa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789556918;
	bh=oz2OBCRQeNp7oxsHOzrhz8A95jACQzDfz9SB2Ntso8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dtvQgSYauTuJuopriVnw5uYT+mPAfeYky5HcAmJA7SmPsAvpGjLUvx7c3xh+RSAIa
	 U2kkDRgbe2PVJHhw49rNu51FtQ2F/5QapqZbCCW4U7kvrghDmNDd8UnBpaj+EI57dh
	 xgbIKT6L9ONK4ZGfVBcWdGhjQnkhvxYaz2garKlEkoI7wfCiHxdag1rMnmNOF/mMlX
	 ao1hedYy0QgznyJ7gNVD8Sczy4lbB+fpeBqTKNq43t0f3brQdsAxtccr2Y3+3dgJ0I
	 UsAcqDOsuUi5FyzGy5Zo/PiAQf3YBKndenlMQV/4/roFtnCaPlPF3hajco40zm8UCr
	 z43g47T4ukTsA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A2F1C17E0420;
	Wed, 16 Sep 2026 13:08:37 +0200 (CEST)
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
Subject: [PATCH v9 10/13] drm/mediatek: mtk_dsi: Add support for MT8196
Date: Wed, 16 Sep 2026 13:08:22 +0200
Message-ID: <20260916110825.102631-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
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
index 64dfc100f033..3b33419aee2d 100644
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
+	[DSI_PHY_LCCON] = 0x7d0,
+	[DSI_PHY_LD0CON] = 0x7d4,
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
@@ -1744,6 +1797,19 @@ static const struct mtk_dsi_driver_data mt8189_dsi_driver_data = {
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
@@ -1752,6 +1818,7 @@ static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
 	{ .compatible = "mediatek,mt8188-dsi", .data = &mt8188_dsi_driver_data },
 	{ .compatible = "mediatek,mt8189-dsi", .data = &mt8189_dsi_driver_data },
+	{ .compatible = "mediatek,mt8196-dsi", .data = &mt8196_dsi_driver_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
-- 
2.55.0

