Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9E33BFE5C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141024; cv=none; b=DtundqBtL7X90TOaqMlPe7PHFi0C9tsNy7mSXtMB/d+PiH/UF2N+uyTBxlPYL9WgYgjJWnGKoGKpREPd+UQwULOTtwlRwLwN7FwyAfA5FNXyXvxR/968PbyShXLDdQEZpt4hxmTf/VH0aBawHVvnkQXsK95L2Yih11GviCpXB78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141024; c=relaxed/simple;
	bh=PaA+7EhfjjyXSykHdMCAcs/0kj/172DSX40sjJai2Vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9Ru6kV6FTPaZ3HNFZAq0qu8GptVDbvURQzuFhv5ZYkK8iPIHblomhnzvrBLaOFO5tfh21L8jUq+yLWf7rluX1tmD6MZYLsqsv4XQfTHy0IUex34oyXIfgbSjHH+aeSndp3ml8TftmTJREbIQotA6EL5fXu/bJuQNDl8Ll2o6Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSUIn+5S; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSUIn+5S"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d01548ac96so4296045ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141020; x=1792745820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVh2yBZbg04QeorXCBZsTA793N8VgD96vnjMkJMi9Ig=;
        b=aSUIn+5SI8lmMwdgu6BBmWeBuwXgWDlDzbxOfuSNiWyg8tkvrZDgOLjoH9DCJaxi3c
         J7GBfJJyGKAMcq6MRKJ1Zik2vDdbNKbuWSjkWcGBUkVKe5zCW0zZRdHKLdMUulkvFMbn
         0zUnK1CQk+i9S9gqPb0PfX8J2wRGiPuJvchQT/Z3Oa2tvV58clknTEFxQNqpallCo/ZL
         6HGhGmb7I3F/MltXDs/cTU8beAU4O/fNrHpoVxzKksZ012vP/IAiVbewm4WX0O5Fliiz
         kWLe1EvmmYDS7y4wb8XdqDKCkhBuYfnSQViU8Q/glVUyQdvcQQGL/lPkL8DxnvOrxkPN
         T3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141020; x=1792745820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVh2yBZbg04QeorXCBZsTA793N8VgD96vnjMkJMi9Ig=;
        b=aNRs840sRQgCY4Auy34vHnzgQOxcbpSz4lP24eql8qepCOy10m5WePV14jk8phSv+R
         yPnhoph59u+FaIf+9l9X/R2TkJudkae0FTc93styS5iyITyI+eNTdYPthyJicIg2U1Ur
         HPHnAXUO6cyohNbhEBI2Bp7bXdMzNeCIAdBQGHrPjYNnOp1/XUf4391pA8rj2G3hWEKC
         EUInDv5DI68WNZiyQUM8Nw+s2lJJ12JDdTVSGHQZKXAhHTc7EW1VXv2VrazOGewvX+Hm
         V/ZqPAtYxdXRrUeJZB6g8o2hkpIM9b16CSghU1CyrCGRSRalWymSiD7/JZaqgSpcV26v
         G4Ug==
X-Forwarded-Encrypted: i=1; AKwUvBwkRk8o6uVNTyvbdtfNBhEh5rYWQpWvuFLxc6H4bcZWtDvkd5tn8BxM+LDrpjWJk7miSffqmCEG0CrXvOw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTM45cpu9/I5ObRvZRgurqSyXXPYwAqffPle+U211i4aJu2h1X
	znV8wmQw/DiXClMCIZ24oKZTa6fK4lv2LjlI5AYFpcBU6nDt5bpdeVbXV0LcQpMK
X-Gm-Gg: AYBFou2UGrXQ0WsxO8U+10Wna9ZIHbak9wmtD2aCWtd9Gi9dHHTOhFEOSFPZfNIyLfw
	Ik65451wa9bZTsDesDHFLNBpVMtLeaXLcsLYZNqoPau/V11iEi9+E3ateAkiwO64UtTjzoVjb8U
	XOKZLNuOOWKe4LVZ7d4E12UFsdWmyMNlfpZwDKgrKLXzwSZ3AgxtiGEABUJe3Zq98DsfVu6xE0T
	IzwY7WFBZYiCM7ut5sSsLlwZmd1A0fZCD9ddvSpv3vfkloa8a+xykbpHsPXClSmlZhr8HqjLYFL
	uST1ncz1xt1YSl1WMaFyV7gJQiaORA3j4u+uaqrhXdmOwiY55wQlozCecZMQkzxZXZ0XaTiqtBC
	LkV3wOU4vZv/EF64QYYF5o9OVcXoAZ/4DFs5BjS7frc7ch1CZXn6jP8c+mqJ8ygd0sADLrqzKGE
	IR0+OJ8ilMwDizCfNLLnqDy1keJU+RG+evitQ6B2vs17I7QvFJtK6uqLZ4EAP6WhMMS5uIiKz//
	HGfjFHGFTgcp5j3f+7vCtSmCxInyMJCUQ2OI2+m
X-Received: by 2002:a17:903:2a8d:b0:2e9:6468:1ff1 with SMTP id d9443c01a7336-2e9646824d2mr63085325ad.2.1792141019112;
        Fri, 16 Oct 2026 01:56:59 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:56:58 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:37 +0800
Subject: [PATCH v5 3/8] phy: rockchip-samsung-dcphy: Move block-level setup
 to runtime resume
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-3-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=3359;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=PaA+7EhfjjyXSykHdMCAcs/0kj/172DSX40sjJai2Vs=;
 b=hOMpC3DGfbUpIpLLafpPHjqPnGV4sluEAXnjKxw4tpYX/teHfoW6y5UED13eX1vDR6A9Q7kpt
 me89SI01UkhASRauzk+6cNOCWTsoXBiWJaGuu5kjAWRlBRFI731Q3dH
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The APB reset and the BIAS references have to be treated as block-level
[1]: both the transmitter and the receiver need them, and they only have
to be programmed once. They are programmed from the transmitter's
power-on path today. A later change registers one struct phy for each of
them, and a second consumer coming up would then reset the block
underneath a PHY that is already running.

Program them from runtime resume instead, where whichever of the two
comes up first brings the block up and a second one no longer resets it.
This puts the BIAS writes ahead of the per-PHY reset assert, where the
TRM's worked example has them after [1]. That is safe: neither M_RESETN
nor S_RESETN covers the BIAS registers, and the values written are those
registers' reset defaults.

The output level select in BIAS_CON4 stays on the power-on path: it
selects 400mV for D-PHY and 530mV for C-PHY, and the driver core resumes
a runtime-PM supplier before the consumer's probe runs, so runtime resume
cannot yet know which of the two applies.

[1] RK3588 TRM: sections 22.4.1 (address map), 22.4.2 (reset values),
    22.6.1.2 (reset) and 22.6.4.1 (D-PHY transmitter start-up)

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 25 ++++++++++++-----------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 7382043e1f31..1471a1563d2a 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -980,13 +980,6 @@ static void samsung_mipi_dcphy_bias_block_enable(struct samsung_mipi_dcphy *sams
 						 I_LADDER_1_00V);
 	regmap_write(samsung->regmap, BIAS_CON2, REG_325M_325MV | REG_LP_400M_400MV |
 						 REG_400M_400MV | REG_645M_645MV);
-
-	/* default output voltage select:
-	 * dphy: 400mv
-	 * cphy: 530mv
-	 */
-	regmap_update_bits(samsung->regmap, BIAS_CON4,
-			   I_MUX_SEL_MASK, I_MUX_400MV);
 }
 
 static void samsung_mipi_dphy_lane_enable(struct samsung_mipi_dcphy *samsung)
@@ -1338,7 +1331,13 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 
 	reset_control_assert(samsung->m_phy_rst);
 
-	samsung_mipi_dcphy_bias_block_enable(samsung);
+	/* default output voltage select:
+	 * dphy: 400mv
+	 * cphy: 530mv
+	 */
+	regmap_update_bits(samsung->regmap, BIAS_CON4,
+			   I_MUX_SEL_MASK, I_MUX_400MV);
+
 	samsung_mipi_dcphy_pll_configure(samsung);
 	samsung_mipi_dphy_clk_lane_timing_init(samsung);
 	samsung_mipi_dphy_data_lane_timing_init(samsung);
@@ -1362,10 +1361,6 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
-	reset_control_assert(samsung->apb_rst);
-	udelay(1);
-	reset_control_deassert(samsung->apb_rst);
-
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
 		return samsung_mipi_dphy_power_on(samsung);
@@ -1656,6 +1651,12 @@ static __maybe_unused int samsung_mipi_dcphy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	reset_control_assert(samsung->apb_rst);
+	udelay(1);
+	reset_control_deassert(samsung->apb_rst);
+
+	samsung_mipi_dcphy_bias_block_enable(samsung);
+
 	return 0;
 }
 

-- 
2.43.0

