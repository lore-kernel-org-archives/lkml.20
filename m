Received: from mail-m127157.xmail.ntesmail.com (mail-m127157.xmail.ntesmail.com [115.236.127.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FF842E437
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048724; cv=none; b=DXlzkO/liESIXtAU+i63p3V4DibyjdzI74TNL47QRx6pwBOZIrZ0kRlrMvC/vNBjcaRjWidmXhUaqhjx9ejSdfAvsfpfdR7H35l1BBdhry+PZgp+baPlATTTuBPiikPSU9Ys+JPpixKAxlDGbFTgWG3HNhbs1he4vwK1sa7eoJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048724; c=relaxed/simple;
	bh=MjdshGD1KHEvcjYDGFB1h8nOpewj1ZuLyIsZvoNDof8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=ZTqDXEgr36eDNtiMyIbMF87PcU0uHhHHbafKbMco5jZFutf5JxwXXr0akVC4ttF8sjTZl8UGBqKgqHtp/iKWn7HpdTyPCW018wrZ4Lv7rnVcA89xRgvZBCTNpTuokivajapPr9iTzzzK05P/IChZjbDdx7ON2yDk6RjZx1PnEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ikq3T0/6; arc=none smtp.client-ip=115.236.127.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ikq3T0/6"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51225b578;
	Thu, 15 Oct 2026 15:03:05 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] phy: rockchip: snps-pcie3: Raise the SRAM init timeout
Date: Thu, 15 Oct 2026 15:02:55 +0800
Message-Id: <1792047775-77954-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Tid: 0aa13e5f227a03a4kunmf26a377d3cb404
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQhpJHVYdSBhNT09OSE
	4dHh5WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ikq3T0/6pXVMroIJZuX4amQAj+Bgq1URrN60TL/hEYp7vaQ6b0k3ojgA2QwfK8exMPw11elJ1JH7Q/iul5yHgV6VvnEjrJRWwIJ3Z/dD094NQo7QBlUyL88rNKO0Yig6EfnhBxhQSiitheLU5C9Aq1GiH7Ca6SaFk8I7RmBmxT4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=F5HjPREDwq11Y08CEYvkPat2goorfkTC4raeVBv7ccM=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The SRAM initialization of the PCIe3 PHY may take longer than the 500us
currently allowed, especially on a slow power-up such as at low
temperature. In that case the driver reports

  lock failed 0x..., check input refclk and power supply

even though the input refclk and power supply are fine.

Raise the timeout to 20ms and use a named constant for it, applied to
both the RK3568 and RK3588 paths.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/phy/rockchip/phy-rockchip-snps-pcie3.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
index 4e8ffd1..bbbfd6d 100644
--- a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
+++ b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
@@ -19,6 +19,8 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#define RK_PCIE_SRAM_INIT_TIMEOUT		20000
+
 /* Register for RK3568 */
 #define GRF_PCIE30PHY_CON1			0x4
 #define GRF_PCIE30PHY_CON6			0x18
@@ -127,7 +129,7 @@ static int rockchip_p3phy_rk3568_init(struct rockchip_p3phy_priv *priv)
 	ret = regmap_read_poll_timeout(priv->phy_grf,
 				       GRF_PCIE30PHY_STATUS0,
 				       reg, SRAM_INIT_DONE(reg),
-				       0, 500);
+				       0, RK_PCIE_SRAM_INIT_TIMEOUT);
 	if (ret)
 		dev_err(&priv->phy->dev, "%s: lock failed 0x%x, check input refclk and power supply\n",
 		       __func__, reg);
@@ -187,11 +189,11 @@ static int rockchip_p3phy_rk3588_init(struct rockchip_p3phy_priv *priv)
 	ret = regmap_read_poll_timeout(priv->phy_grf,
 				       RK3588_PCIE3PHY_GRF_PHY0_STATUS1,
 				       reg, RK3588_SRAM_INIT_DONE(reg),
-				       0, 500);
+				       0, RK_PCIE_SRAM_INIT_TIMEOUT);
 	ret |= regmap_read_poll_timeout(priv->phy_grf,
 					RK3588_PCIE3PHY_GRF_PHY1_STATUS1,
 					reg, RK3588_SRAM_INIT_DONE(reg),
-					0, 500);
+					0, RK_PCIE_SRAM_INIT_TIMEOUT);
 	if (ret)
 		dev_err(&priv->phy->dev, "lock failed 0x%x, check input refclk and power supply\n",
 			reg);
-- 
2.7.4

