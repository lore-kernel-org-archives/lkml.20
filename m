Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C703DEFFA;
	Thu, 10 Sep 2026 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032051; cv=none; b=YW/AgFhKXpDkDIdeKjaZ5btjwgsNWLXTLWbWRRd0JIewSfoXG+NsRryU/9NB+5RXRl/pA9m2VRBNVB3r30ADRdBKJ98ov2f9G0UStGZ8xjty3xknCcJtgoEyHJrDoBrSKAPoJEYu4nSEiDrK1FmCWII2BeArKtkHOy+B8vHZIN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032051; c=relaxed/simple;
	bh=kbWNFq1oRF1nFAazrEptlrlglPwPZ7zaOn5uHB4r+tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILQa24lPFMnz3qrCRn4qI3JoiVPnWyw8Ir8/H5c/nQCsDqMLG1xdGA5KsCYC6gkGP744ANlKsok7S9c1qHeL7bi5jf2wHigI8HtcG+ZybXB0uq9Xl81G4jhYffyrGXjB96Ftj1rf/QoWpFfzqFo7GhVElxvZ9FBLrVWpxWBkVnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RvFtmZmP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RvFtmZmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789032047;
	bh=kbWNFq1oRF1nFAazrEptlrlglPwPZ7zaOn5uHB4r+tE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RvFtmZmPkGuOr0rvxeSYncIAwghTYvjy3SnkJ8qqz1kayfpO8NeQryyr2SGzVBgeR
	 PplIIpnpanQFt1JYZfNcNSg47d/5qTkRLIx586TJ0F23QPBgwKtqUNfDY9plm8IZT0
	 pS0MWd65KBbExRdHKXpucleHZzwH+0s6kIlSUsHfxbxJql7J8DjUVwUVNJpXGWB2pA
	 xhkiesG2cvnWXCxjQA4gWbju4S68rM5X1SNLMevVTF0WwNoCslcCLRTYGgtsF6/XPd
	 RiIom7ndAEfq7IJj41A7ft60N+k602Mw8LhxFXyMvBCtlOVk1o++PdJ9jsI5S4NyGi
	 sT6rBaGf1Qaqg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2FD6617E0FE2;
	Thu, 10 Sep 2026 11:20:47 +0200 (CEST)
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
Subject: [PATCH v4 06/12] phy: phy-mtk-dp: Support set_lanes in configure and properly cleanup
Date: Thu, 10 Sep 2026 11:20:32 +0200
Message-ID: <20260910092038.48291-7-angelogioacchino.delregno@collabora.com>
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

Add support for enabling a specifically requested number of lanes
in the .configure() callback and disable all lanes in power off
and reset callbacks for proper hardware cleanup.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 57 +++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 4247506ceb99..276391d991aa 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -10,6 +10,7 @@
  *                     AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
@@ -50,6 +51,9 @@
 #define DRIVING_PARAM_1_DEFAULT	0x0
 #define DRIVING_PARAM_2_DEFAULT	0x0
 
+/* DP_PHYD_TX_CTL_0 */
+#define PHYD_TX_LN_EN			GENMASK(7, 4)
+
 #define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT	BIT(4)
 #define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT	(BIT(10) | BIT(12))
 #define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT	GENMASK(20, 19)
@@ -113,6 +117,7 @@ enum mtk_dp_phyd_dig_glb_regidx {
 	DP_PHYD_SW_RST,
 	DP_PHYD_BIT_RATE,
 	DP_PHYD_AUX_RX_CTL,
+	DP_PHYD_TX_CTL_0,
 	DP_PHYD_GLOBAL_MAX
 };
 
@@ -131,6 +136,7 @@ static const u8 mt8195_phy_dig_glb_regs[DP_PHYD_GLOBAL_MAX] = {
 	[DP_PHYD_SW_RST] = 0x38,
 	[DP_PHYD_BIT_RATE] = 0x3c,
 	[DP_PHYD_AUX_RX_CTL] = 0x40,
+	[DP_PHYD_TX_CTL_0] = 0x44,
 };
 
 /**
@@ -200,6 +206,7 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
 	const struct mtk_dp_phy_pdata *pdata = dp_phy->pdata;
 	u32 val;
+	int i;
 
 	if (opts->dp.set_rate) {
 		const u32 reg_bit_rate = pdata->regs_dig_glb[DP_PHYD_BIT_RATE];
@@ -226,6 +233,17 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 		regmap_write(dp_phy->regmap, pdata->off_dig_glb + reg_bit_rate, val);
 	}
 
+	if (opts->dp.set_lanes) {
+		const u32 reg_dig_tx_ctl = pdata->regs_dig_glb[DP_PHYD_TX_CTL_0];
+
+		val = 0;
+		for (i = 0; i < opts->dp.lanes; i++)
+			val |= FIELD_PREP(PHYD_TX_LN_EN, BIT(i));
+
+		regmap_update_bits(dp_phy->regmap, pdata->off_dig_glb + reg_dig_tx_ctl,
+				   PHYD_TX_LN_EN, val);
+	}
+
 	regmap_update_bits(dp_phy->regmap,
 			   pdata->off_dig_glb + pdata->regs_dig_glb[DP_PHYD_PLL_CTL_1],
 			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
@@ -254,12 +272,39 @@ static int mtk_dp_phy_power_on(struct phy *phy)
 	return 0;
 }
 
+static int mtk_dp_phy_disable_all_lanes(struct mtk_dp_phy *dp_phy)
+{
+	const struct mtk_dp_phy_pdata *pdata = dp_phy->pdata;
+	const u8 *regs = pdata->regs_dig_glb;
+	int ret;
+	u32 val;
+
+	/* Get mask of currently enabled lane */
+	regmap_read(dp_phy->regmap, pdata->off_dig_glb + regs[DP_PHYD_TX_CTL_0], &val);
+	val = FIELD_GET(PHYD_TX_LN_EN, val);
+	if (val == 0)
+		return 0;
+
+	/* Disable all lanes (needs to be done one by one, from last to first) */
+	do {
+		u32 lane_num = fls(val) - 1;
+		val &= ~BIT(lane_num);
+
+		regmap_clear_bits(dp_phy->regmap,
+				  pdata->off_dig_glb + regs[DP_PHYD_TX_CTL_0],
+				  FIELD_PREP(PHYD_TX_LN_EN, BIT(lane_num)));
+	} while (val);
+
+	return 0;
+}
+
 static int mtk_dp_phy_power_off(struct phy *phy)
 {
 	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
 	const struct mtk_dp_phy_pdata *pdata = dp_phy->pdata;
 	const u8 *regs_dig = pdata->regs_dig_glb;
 	const u8 *regs_ana = pdata->regs_ana_glb;
+	int ret;
 
 	regmap_set_bits(dp_phy->regmap,
 			pdata->off_ana_glb + regs_ana[DP_PHYA_GLB_FORCE_CTRL_1],
@@ -269,6 +314,12 @@ static int mtk_dp_phy_power_off(struct phy *phy)
 	regmap_write(dp_phy->regmap,
 		     pdata->off_dig_glb + regs_dig[DP_PHYD_AUX_RX_CTL], 0);
 
+	ret = mtk_dp_phy_disable_all_lanes(dp_phy);
+	if (ret) {
+		dev_err(dp_phy->dev, "Could not disable lanes for poweroff!\n");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -277,6 +328,7 @@ static int mtk_dp_phy_reset(struct phy *phy)
 	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
 	const struct mtk_dp_phy_pdata *pdata = dp_phy->pdata;
 	const u32 reg_rst = pdata->regs_dig_glb[DP_PHYD_SW_RST];
+	int ret;
 
 	/* Clearing bits sets reset state */
 	regmap_clear_bits(dp_phy->regmap, pdata->off_dig_glb + reg_rst, DP_GLB_SW_RST_PHYD);
@@ -287,6 +339,11 @@ static int mtk_dp_phy_reset(struct phy *phy)
 	/* Setting bits means go out of reset */
 	regmap_set_bits(dp_phy->regmap, pdata->off_dig_glb + reg_rst, DP_GLB_SW_RST_PHYD);
 
+	/* Disable all lanes and continue reset even if this fails, but notify */
+	ret = mtk_dp_phy_disable_all_lanes(dp_phy);
+	if (ret)
+		dev_err(dp_phy->dev, "Could not disable lanes during reset!\n");
+
 	return 0;
 }
 
-- 
2.55.0

