Received: from mail-m118211.qiye.163.com (mail-m118211.qiye.163.com [115.236.118.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436F83FC5C4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.118.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037117; cv=none; b=CfZZs+INXtya6YP8Veut4oPWhZbVPe7t/Mf1Qlkki4dyGStMZIDGlAtyhjUrLGMN8j5SGUhaOIOA/Qk6LstfiBRoiZTq0SVufarqABP1q3BB45ZNsogNgGNFKMEsjVDl12tb8dukaF2WAFhJKM0plP2wYdS0Ru022l25IgBGO50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037117; c=relaxed/simple;
	bh=AVXukLJxDWUTPFPzgkn4OaSL0lD+Iy3DRdR9Rro1Bso=;
	h=From:To:Cc:Subject:Date:Message-Id; b=M9KK2mIef+J6ft3hO7NzZrXizxFoFU/bOi6ANWIGpIdInnqZuUNs97zUh4gR9NVCeZawv02hTzkU9CCzZMf0xClos0ywJ8VoAqOMXgcnOdVIyQdGlscjIFApDiVkBl7hYe3GKUHBldWtXSPt9zs/UKs3tFv12z9bgsZMu45PG2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=UsVVxotJ; arc=none smtp.client-ip=115.236.118.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="UsVVxotJ"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 511c64fea;
	Thu, 15 Oct 2026 11:59:55 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] phy: rockchip: naneng-combphy: Fix overwritten PLL SSC control bit
Date: Thu, 15 Oct 2026 11:59:47 +0800
Message-Id: <1792036787-37927-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Tid: 0aa13db771c103a4kunm0d452a123b0e15
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQkpMHlYaGkJLGhhPH0
	gaTh9WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=UsVVxotJPQ1v+E+yDQ7Hi3OH6sxoy5G2le0fc7Kf46PYtHIc/cK8J2RGT0KFe/VlZTC7a7MQ8Cbbb7bNvBv2gwl8Xod/CFpt6nzvR6Uc0zSs8AfQoelkaJfkBqSBKWkCxF1W13N9FQ076FLaUPmurKAHWGwyIGTlj4LzuwYaLB0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=5ouESOob9KPg2dEHIqwtyo3anJ0ed+UGtz0b1buJpts=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

rk_combphy_common_cfg_ssc() first sets RK3568_PHYREG33_PLL_SSC_CTRL on the
RK3588 and RK3576 SoCs, then, for PCIe at 24MHz, programs the PLL KVCO
adjust field. The latter used a plain writel() of the FIELD_PREP() value,
which cleared all the other bits of RK3568_PHYREG33, including the
PLL_SSC_CTRL bit that had just been set a few lines above.

Use rockchip_combphy_updatel() so that only the KVCO field is updated and
the SSC control bit is preserved, as the comment and the pre-consolidation
code intended.

Fixes: 0b31f297557f ("phy: rockchip: naneng-combphy: Consolidate SSC configuration")
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 3102a99..b6cc010 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -526,7 +526,8 @@ static void rk_combphy_common_cfg_ssc(struct rockchip_combphy_priv *priv, unsign
 
 		val = FIELD_PREP(RK3568_PHYREG33_PLL_KVCO_MASK,
 				 RK3576_PHYREG33_PLL_KVCO_VALUE);
-		writel(val, priv->mmio + RK3568_PHYREG33);
+		rockchip_combphy_updatel(priv, RK3568_PHYREG33_PLL_KVCO_MASK,
+					 val, RK3568_PHYREG33);
 	}
 }
 
-- 
2.7.4

