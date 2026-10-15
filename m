Received: from mail-m127101.qiye.163.com (mail-m127101.qiye.163.com [115.236.127.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0C04ADD9B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052181; cv=none; b=pOa5dWfUa+8R8na9O9n9NKJaFFqxMHT2Xi6oHFOCIpB/viUfeGW1BRgSq6EoQhHJO0ocmYMctsAzbUfci9TMemp/VxKXS8sM6zMQc2/DbHQe88rIwy65fHrfRmcNttaYD/N5U+jvdklVq+nQNJUuD7XOShPUc1s+2QwTbIfuk4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052181; c=relaxed/simple;
	bh=kxSxdbTW1yBezPmHAYo25zI63O7k2SXizNGNlRfeI8U=;
	h=From:To:Cc:Subject:Date:Message-Id; b=tYaSN8SPJ54k3jtcnn02Hh0gGd2mRU8ULgTJhj/I8IMymIjj3opxYVSFOCQuLFO/Myx9NuluCkykGE+em4N8w/JYsyDfEMxxnEOsCHvZovr+YHsP22l3ciJDv1etWOn7QgkjNMafzxtFGD/Kek/122+mxl72hmDz+Jt2NEssmAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=cadfJqWo; arc=none smtp.client-ip=115.236.127.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="cadfJqWo"
Received: from localhost.localdomain (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5125548e2;
	Thu, 15 Oct 2026 16:10:59 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2] phy: rockchip: snps-pcie3: Raise the SRAM init timeout
Date: Thu, 15 Oct 2026 16:10:43 +0800
Message-Id: <1792051843-93245-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Tid: 0aa13e9d4cdd03a4kunmff98bd243d8280
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZShpJVkwfSUpLHxhJTk1PTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cadfJqWos44zIX7hyQWrJmLvw8qsbJto6mNuj/ggulUOlhYSNRr07ODcQf36OMhS8ukJGJDtNL4GbrM96tM78GL+iQaiaYKxUodKlLPAT0Dx1tWaNOsjKpn+8DIwft/gPmrq8IT7RCWNMQ/hfzcQZV94NEgtGbBTZnvvX4t4iXw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=f6mtt1FuPkav0gMKJDC6dik1kQ9Fy+q/TLzhk6xwuhU=;
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

A non-zero sleep interval (1ms) is passed to the polling helpers so the
CPU is yielded between reads. With sleep_us == 0 the helpers tight-loop,
which would otherwise burn the CPU during the now much longer wait.

The two PHY lanes share most of their circuitry in both aggregation and
bifurcation mode, so in practice once the first PHY locks the second one
can be assumed to lock as well. The two sequential polls therefore do
not add any noticeable delay.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

---

Changes in v2:
- address Sashiko's comment

 drivers/phy/rockchip/phy-rockchip-snps-pcie3.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
index 4e8ffd1..69bda8b 100644
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
+				       1000, RK_PCIE_SRAM_INIT_TIMEOUT);
 	if (ret)
 		dev_err(&priv->phy->dev, "%s: lock failed 0x%x, check input refclk and power supply\n",
 		       __func__, reg);
@@ -187,11 +189,11 @@ static int rockchip_p3phy_rk3588_init(struct rockchip_p3phy_priv *priv)
 	ret = regmap_read_poll_timeout(priv->phy_grf,
 				       RK3588_PCIE3PHY_GRF_PHY0_STATUS1,
 				       reg, RK3588_SRAM_INIT_DONE(reg),
-				       0, 500);
+				       1000, RK_PCIE_SRAM_INIT_TIMEOUT);
 	ret |= regmap_read_poll_timeout(priv->phy_grf,
 					RK3588_PCIE3PHY_GRF_PHY1_STATUS1,
 					reg, RK3588_SRAM_INIT_DONE(reg),
-					0, 500);
+					1000, RK_PCIE_SRAM_INIT_TIMEOUT);
 	if (ret)
 		dev_err(&priv->phy->dev, "lock failed 0x%x, check input refclk and power supply\n",
 			reg);
-- 
2.7.4

