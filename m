Received: from mail-m1973175.qiye.163.com (mail-m1973175.qiye.163.com [220.197.31.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3C62E06EF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160362; cv=none; b=Ux340GkYFvkQ+lDB+gGXXgWEY679X65HtRLD70b8A4jGxZB8kxcN2GXFC4xDGqVV7AY7MALBw6PxkDOHqExX/rrHBiAqcHA8VyEzWr8BHB86iQhkwkmx/QNsNW0ePo6TDVmOBgjW7KDX1pCmj+znxKLdNDtvGNSTc35G02mVqRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160362; c=relaxed/simple;
	bh=50vCqvJLMpB1URDB6KUPUp0TPNIIAW9FzAdIHwSIOi8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=ZrBAd6esUGMxHy9C8d0XiIgVnu6CQWihxbiiZJedCQFVCES1AXndUhErp+aZ5zWYO9pp4YxGawKYW7BAw1HwZrHnfqaIIvBr6UR3nK1GTroo1ktqU+I1ehdkXURzxNIIjTG+foHlEZw4LArZ3lFs3I3YNzbL1HR4T4s1LfWQ7pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=f6G5P3sj; arc=none smtp.client-ip=220.197.31.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="f6G5P3sj"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4be9c29ca;
	Mon, 31 Aug 2026 14:36:56 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] phy: rockchip: naneng-combphy: Fix TX detect RX termination errata
Date: Mon, 31 Aug 2026 14:36:44 +0800
Message-Id: <1788158204-161347-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Tid: 0aa0568907fa03a4kunmda4bace446a0ab
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGk9CSVZNTx5IHkMeGU
	1DSUlWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=f6G5P3sjOCx1T9mcIIBZGVZcZPtlosS34n6wryvcpRH1kVxgrKkUT9XimYCecbeM2KpTjfzTWd3NuxG2JwEDNhoa0dxECebzNnwgwfsLksupuDT5g0HRyOPVHLkk6C3eAW7PYFrpmKjqTxbd0+4n+MgJ3huX/ysbU1PEJECtx1A=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Qoc1zbK+pfmGG4t1HLPMA0l2I29GPvBOn6lUEXanbS8=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Some PHY revisions may fail to detect the peer RX's termination
resistor (RTERM) under certain critical temperature conditions.
This causes TX detection failures on PCIe links.

Add a workaround to force the RTERM detection ready signal for
affected PHY revisions. This ensures reliable TX-to-RX termination
detection across all operating temperature ranges.

The fix applies to RK3562, RK3568, RK3576 and RK3588 SoCs which share
the same PHY IP with this hardware errata.

Fixes: 7160820d742a ("phy: rockchip: add naneng combo phy for RK3568")
Fixes: f13bff25161b ("phy: rockchip-naneng-combo: Support rk3562")
Fixes: ba8ad7eece66 ("phy: rockchip-naneng-combo: add rk3576 support")
Fixes: a03c44277253 ("phy: rockchip: Add naneng combo phy support for RK3588")
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 7843356..3102a99 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -106,6 +106,9 @@
 #define RK3568_PHYREG18				0x44
 #define RK3568_PHYREG18_PLL_LOOP		0x32
 
+#define RK3568_PHYREG26				0x64
+#define RK3568_PHYREG26_FORCE_RTERM_DET_RDY	BIT(5)
+
 #define RK3568_PHYREG30				0x74
 #define RK3568_PHYREG30_GATE_TX_PCK_SEL         BIT(7)
 #define RK3568_PHYREG30_GATE_TX_PCK_DLY_PLL_OFF BIT(7)
@@ -194,6 +197,7 @@ struct rockchip_combphy_cfg {
 	unsigned int num_phys;
 	unsigned int phy_ids[3];
 	const struct rockchip_combphy_grfcfg *grfcfg;
+	bool force_rxterm_det_rdy;
 	int (*combphy_cfg)(struct rockchip_combphy_priv *priv);
 };
 
@@ -265,6 +269,17 @@ static int rockchip_combphy_init(struct phy *phy)
 
 	switch (priv->type) {
 	case PHY_TYPE_PCIE:
+		/*
+		 * Hardware Errata: TX fails to detect peer RX termination.
+		 * Some PHY revisions may fail to detect remote RX's RTERM
+		 * (receiver termination resistor) under certain critical
+		 * temperature conditions. Set force rterm detect ready to
+		 * fix it.
+		 */
+		if (priv->cfg->force_rxterm_det_rdy)
+			rockchip_combphy_updatel(priv, RK3568_PHYREG26_FORCE_RTERM_DET_RDY,
+					RK3568_PHYREG26_FORCE_RTERM_DET_RDY, RK3568_PHYREG26);
+		fallthrough;
 	case PHY_TYPE_USB3:
 	case PHY_TYPE_SATA:
 	case PHY_TYPE_SGMII:
@@ -801,6 +816,7 @@ static const struct rockchip_combphy_cfg rk3562_combphy_cfgs = {
 	},
 	.grfcfg		= &rk3562_combphy_grfcfgs,
 	.combphy_cfg	= rk3562_combphy_cfg,
+	.force_rxterm_det_rdy  = true,
 };
 
 static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
@@ -998,6 +1014,7 @@ static const struct rockchip_combphy_cfg rk3568_combphy_cfgs = {
 	},
 	.grfcfg		= &rk3568_combphy_grfcfgs,
 	.combphy_cfg	= rk3568_combphy_cfg,
+	.force_rxterm_det_rdy  = true,
 };
 
 static int rk3576_combphy_cfg(struct rockchip_combphy_priv *priv)
@@ -1219,6 +1236,7 @@ static const struct rockchip_combphy_cfg rk3576_combphy_cfgs = {
 	},
 	.grfcfg		= &rk3576_combphy_grfcfgs,
 	.combphy_cfg	= rk3576_combphy_cfg,
+	.force_rxterm_det_rdy  = true,
 };
 
 static int rk3588_combphy_cfg(struct rockchip_combphy_priv *priv)
@@ -1391,6 +1409,7 @@ static const struct rockchip_combphy_cfg rk3588_combphy_cfgs = {
 	},
 	.grfcfg		= &rk3588_combphy_grfcfgs,
 	.combphy_cfg	= rk3588_combphy_cfg,
+	.force_rxterm_det_rdy  = true,
 };
 
 static const struct of_device_id rockchip_combphy_of_match[] = {
-- 
2.7.4

