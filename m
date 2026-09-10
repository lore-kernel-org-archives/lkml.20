Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F373E5EEB;
	Thu, 10 Sep 2026 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032057; cv=none; b=qpyp6jf+RyIj78PbMv8cO2ECkHpzNooUYE01CjU9LMNGiW6dpsmcgwFmjthrMUYQNhVOxBEltCgpsylDvK0e8mLujuVHQNAuFLxfmGPpNVAMdGyhSEsBCyhEAwXEQu9ITBQ3o1wt0af2oRI/0EVSagbl/2qkDdhvON6HZYhPzTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032057; c=relaxed/simple;
	bh=ldi6Shky0O6c0vEROLxXRj05CZhkaRERiTZ6JwZW9KI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=srRruqkJPOfp02rXrEcyVXzw37J7+Zef16VexMA27lrPGCBWqczaIG0XywJuqLx07ArPUVcW+ztIBGRqlOnBA08mOtHGXuW2wfB++LRfc+B6rbdyr1PYYy8o9TvQQyo1oKL8CCQZTm5NtsKIbevLNTYEu8WS8gp7xM9jkJDYhm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IHfc3naU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IHfc3naU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789032052;
	bh=ldi6Shky0O6c0vEROLxXRj05CZhkaRERiTZ6JwZW9KI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IHfc3naU2sTdrlLccr5+DCLCIjJoWe0kUxXNXNQjEMoLK9PD0lsRO/puVNMdMO4Li
	 RvFRmLy2MO/fxxmLdsyr03MYursnj9MsQdFhxeVPoXzsPPnopCcEVwL45ScuLkDVtV
	 OhNFjYXPfb48P35ThW4YS7KZGzcWnm/JxoIRuD7o3keHKCC0ktpJx1D3qVcw8McO6K
	 GdfMa4E5sFvUbFtmjc7rpt0Iv71jcPB6S0mC3rTP45vltbY1pl1DWqEwNTRE9FXOqh
	 gqXOUJXfLyg/dvViu2Un13X3Cm586lJFmAcITHgPQ8pQKBT0Sr9I5tUw4pKZxF5aRj
	 aE5rf0pgW2/ZQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 986C117E0D7F;
	Thu, 10 Sep 2026 11:20:51 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mani@kernel.org
Cc: chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	justin.yeh@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v4 11/12] phy: phy-mtk-dp: Add PHYD Lane EN register mask to SoC data
Date: Thu, 10 Sep 2026 11:20:37 +0200
Message-ID: <20260910092038.48291-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
References: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding support for the eDP PHY found in newer
SoCs, transfer the register mask for PHYD_TX_LN_EN to SoC specific
data.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 643666c454f4..30f9fa6e6b9b 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -220,6 +220,7 @@ struct mtk_dp_phya_imp_sel {
  * @regs_ana_lane:  Register (layout) offsets for ana_lan
  * @regs_dig_glb:   Register (layout) offsets for dig_glb
  * @regs_dig_lane:  Register (layout) offsets for dig_lan
+ * @mask_dig_tx_ln: Register mask for PHYD_TX_LN_EN field
  * @val_dig_bitrate:IP Version specific register values for Bit Rate setting
  * @ana_bias_r:     Internal resistance "R" Selection Settings (global)
  * @ana_cktx_imp:   TX Clock Impedance Selection Settings (global)
@@ -239,6 +240,9 @@ struct mtk_dp_phy_pdata {
 	const u8 *regs_dig_glb;
 	const u8 *regs_dig_lane;
 
+	/* Register masks */
+	u32 mask_dig_tx_ln;
+
 	/* IP-Version specific register value arrays */
 	const u8 *val_dig_bitrate;
 
@@ -355,10 +359,10 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 
 		val = 0;
 		for (i = 0; i < opts->dp.lanes; i++)
-			val |= FIELD_PREP(PHYD_TX_LN_EN, BIT(i));
+			val |= field_prep(pdata->mask_dig_tx_ln, BIT(i));
 
 		regmap_update_bits(dp_phy->regmap, pdata->off_dig_glb + reg_dig_tx_ctl,
-				   PHYD_TX_LN_EN, val);
+				   pdata->mask_dig_tx_ln, val);
 	}
 
 	if (opts->dp.set_voltages) {
@@ -422,7 +426,7 @@ static int mtk_dp_phy_disable_all_lanes(struct mtk_dp_phy *dp_phy)
 
 	/* Get mask of currently enabled lane */
 	regmap_read(dp_phy->regmap, pdata->off_dig_glb + regs[DP_PHYD_TX_CTL_0], &val);
-	val = FIELD_GET(PHYD_TX_LN_EN, val);
+	val = field_get(pdata->mask_dig_tx_ln, val);
 	if (val == 0)
 		return 0;
 
@@ -433,7 +437,7 @@ static int mtk_dp_phy_disable_all_lanes(struct mtk_dp_phy *dp_phy)
 
 		regmap_clear_bits(dp_phy->regmap,
 				  pdata->off_dig_glb + regs[DP_PHYD_TX_CTL_0],
-				  FIELD_PREP(PHYD_TX_LN_EN, BIT(lane_num)));
+				  field_prep(pdata->mask_dig_tx_ln, BIT(lane_num)));
 	} while (val);
 
 	return 0;
@@ -730,6 +734,7 @@ static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
 	.regs_ana_lane = mt8195_phy_ana_lane_regs,
 	.regs_dig_glb = mt8195_phy_dig_glb_regs,
 	.regs_dig_lane = mt8195_phy_dig_lane_regs,
+	.mask_dig_tx_ln = PHYD_TX_LN_EN,
 	.val_dig_bitrate = mt8195_phy_dig_bitrate_val,
 	.ana_bias_r = 15,
 	.ana_cktx_imp = 8,
-- 
2.55.0

