Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57954D0CEF;
	Fri, 16 Oct 2026 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162572; cv=none; b=XVx6wduxYua9S6qcmeHryQVCI3uT7UtK7OOr3LBPvTmDFhCTnRuHOELlH3BWXNkhQ1+gU5qNMTibauuVAzRrnDm/sYrAvHSDVfApiUZt7yXjociI26XeWiuuz5ffnbOnKRpHY08LsbS3X6G/BSQF7miY5tomHQ/+U21tlzgJMf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162572; c=relaxed/simple;
	bh=gkrZ3n9shfxAbVLU7LrBVA96LpfGfrsV4xz6J6pmyHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pswmCyPiGrPqMhg4ptUWGlwNN/cCAEQtMLgDq7sMIYOKNTFpMw5K9bY24gNreZbhj3s1+l6RlJ12ZhlHZ8YV7Up9GZlP4/buRG7gT/3tkzUMZch2N0lR48WusZxZXmj3i3vCLZHBzCiGbKFKksganVdC5zeelPbPaHEftFs6WEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PncvVlT9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PncvVlT9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC679C2BD04;
	Fri, 16 Oct 2026 14:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792162572;
	bh=gkrZ3n9shfxAbVLU7LrBVA96LpfGfrsV4xz6J6pmyHY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PncvVlT9tVOZYGdWao4TGGk2SZmeDnxN5Sm3DX0QXYnRAERX80d/NMolxOIEGr/xt
	 OP3MM7luHy0WhqOee8bwEgf8RPk4p09OdOBpA46sQE2yrR4g1HjCKw4yWrXhqXwmtE
	 5HQ2wtdXX2NIlhH4E7vV+d6ZQRHyh2NKZ58TrQJCWT+xkb38Ibhn+/c1uRTLn9/Ho0
	 3dre8nXU9Ufk7ZDl2S4jgVN2krRmF1e6eLWxQKjdjaDbZG9+SW9P9eDIbHhnAnDzmZ
	 KBssk5CGrtz7VmGwo5qqGeoyVgV9FBoYvm5554qT7p5UDFhS2jJ5Xx3h23io3E11nq
	 VIR78OpUon+Tw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95754CCA462;
	Fri, 16 Oct 2026 14:56:12 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Date: Fri, 16 Oct 2026 15:56:14 +0100
Subject: [PATCH v3 4/6] phy: qcom-mipi-csi2: Add lane mask and lane
 polarity helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-x1e-cphy-rfc-v3-4-40a346a72153@gmail.com>
References: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com>
In-Reply-To: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, 
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, 
 Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, George Neacsu <geocausa@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792162570; l=3920;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=IdF/EPNDqFiB6gXpG01nIGTiB2hoKtKKWj6IdgpRK5U=;
 b=R5a+jiNCha6yXWvYSmmeHB5+h8p6taT+wYlHoIpK0DQCHnwHwxMdkOVOBPiEzQm4PVOoE8V43
 NADsgC20YQwAU2Ewj8TbN7tCAJY0ARKrCyHNlJ9VYUrNBfjSuApTHU9
X-Developer-Key: i=geocausa@gmail.com; a=ed25519;
 pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
X-Endpoint-Received: by B4 Relay for geocausa@gmail.com/20261015 with
 auth_id=1199
X-Original-From: George Neacsu <geocausa@gmail.com>
Reply-To: geocausa@gmail.com

From: George Neacsu <geocausa@gmail.com>

Move the CTRL5 lane mask and the CTRL9 lane polarity writes out of
phy_qcom_mipi_csi2_lanes_enable() into two helpers,
phy_qcom_mipi_csi2_lane_mask() and
phy_qcom_mipi_csi2_dphy_lane_polarities(). A C-PHY path needs a
different lane mask and no polarities, and with the helpers it can be
added without a goto or a second copy of the common setup.

No functional change.

Suggested-by: Bryan O'Donoghue <bod@kernel.org>
Suggested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: George Neacsu <geocausa@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 64 ++++++++++++++--------
 1 file changed, 42 insertions(+), 22 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index b2d4ec3e81..a44e104301 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -268,34 +268,32 @@ phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
 	}
 }
 
-static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
-					   struct mipi_csi2phy_stream_cfg *cfg)
+/*
+ * CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
+ * - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
+ * - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
+ * - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
+ */
+static u8 phy_qcom_mipi_csi2_lane_mask(struct mipi_csi2phy_device *csi2phy,
+				       struct mipi_csi2phy_stream_cfg *cfg)
 {
-	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
 	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
-	u8 settle_cnt;
-	u8 val;
+	u8 lane_mask;
 	int i;
 
-	if (cfg->link_freq <= 0)
-		return -EINVAL;
-
-	settle_cnt = phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2phy->timer_clk_rate);
-	if (!settle_cnt)
-		return -ENODEV;
-
-	/*
-	 * CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
-	 * - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
-	 * - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
-	 * - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
-	 */
-	val = BIT(lane_cfg->clk.pos);
+	lane_mask = BIT(lane_cfg->clk.pos);
 	for (i = 0; i < cfg->num_data_lanes; i++)
-		val |= BIT(lane_cfg->data[i].pos * 2);
+		lane_mask |= BIT(lane_cfg->data[i].pos * 2);
 
-	writel(val, csi2phy->base +
-	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
+	return lane_mask;
+}
+
+static void
+phy_qcom_mipi_csi2_dphy_lane_polarities(struct mipi_csi2phy_device *csi2phy,
+					struct mipi_csi2phy_stream_cfg *cfg)
+{
+	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
+	int i;
 
 	/* Lane configuration for polarity @ CSIPHY-base + CTRL9 */
 	for (i = 0; i < cfg->num_data_lanes; i++) {
@@ -308,6 +306,28 @@ static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
 
 	if (lane_cfg->clk.pol)
 		writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(lane_cfg->clk.pos));
+}
+
+static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
+					   struct mipi_csi2phy_stream_cfg *cfg)
+{
+	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
+	u8 settle_cnt;
+	u8 val;
+	int i;
+
+	if (cfg->link_freq <= 0)
+		return -EINVAL;
+
+	settle_cnt = phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2phy->timer_clk_rate);
+	if (!settle_cnt)
+		return -ENODEV;
+
+	val = phy_qcom_mipi_csi2_lane_mask(csi2phy, cfg);
+	writel(val, csi2phy->base +
+	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
+
+	phy_qcom_mipi_csi2_dphy_lane_polarities(csi2phy, cfg);
 
 	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
 	writel(val, csi2phy->base +

-- 
2.53.0


