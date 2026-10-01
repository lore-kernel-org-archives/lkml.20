Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737B8495044
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860386; cv=none; b=SVfRDPWtAOSeiGa/ISQK3giaRglQQ+0f3hDtWgBRQNtZIiG6bvmv+nkBcf8O68acHb+CAaKKcsnLQLIVbxtniF97NAxH7anRuWeh8Lx9lXuMA29m9PuuOkJKn+1KisenHf2lQid9jDaVTvKdg5bC9PYN00gLb226FMOX6WWRWL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860386; c=relaxed/simple;
	bh=LqRHdeRqB3JBonmJ1Qavl1AGpOkWFclCKjb3FPr6XEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c/MfI4VTtHHSfhFP+jRcXm0FrIag/QSDDLPiyqjSE7YjL3mnQi5kmUk6OZSmQpE41Fl5ydfoWE30aUBMbAHuCMt8fv4Af609v5jQp5Y2PBcpf3jeEzjcpm/dOaodPNwugAmrZ7XKMEUj7t2yn/7BIRlQyYFpbOSU7jxtdFbUC/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=D2gi/aP+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="D2gi/aP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790860382;
	bh=LqRHdeRqB3JBonmJ1Qavl1AGpOkWFclCKjb3FPr6XEU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D2gi/aP+Hmhci5z5zv6yzHBwoES/N7dsTJejP0CvCr00TPTWbp+fmPQEOGGbjM4QX
	 x4eJrkj43RXjig/pz6/o8hAc+PslXF5kgVriIwXaOH5mnBq2Ui/bEGD6qGte+I2aTJ
	 YPXtHPZ8Fr2l7A6RunrJ0Cp/Co2VRvw+/pyIsd1DHjfkYr2IKg7KRsz5E0imWi+fXa
	 7QZWVB1m8tHpCxeSdZZ+vNs97X32ZsK3jWwV2sCVceN5JTvowuqGJN98H/2ocN4ftw
	 /pDFYHxVx0pIw3RIwZ32F2jbih7ecloqwlVNPGHrcP8TMX+UACvihlWL2VMf5yZLb7
	 qiasat3U2O+ZQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 769B617E0803;
	Thu, 01 Oct 2026 15:13:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 294ED480031; Thu, 01 Oct 2026 15:13:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 01 Oct 2026 15:12:42 +0200
Subject: [PATCH v2 4/4] phy: rockchip: inno-usb2: move suspend handling
 into clock prepare/unprepare for RK3588/RK3576
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-4-e01bf509359e@collabora.com>
References: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com>
In-Reply-To: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3741;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=LqRHdeRqB3JBonmJ1Qavl1AGpOkWFclCKjb3FPr6XEU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq+XF76P9cQAjt6hMwhAFreZmNUhQKycK4P0
 1G/cgbYsIbnE4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvlxeAAoJENju1/PI
 O/qap6EP/01UisRTHqF/46cdECa+p6iVGK/P8oHwCtPXo3CrkQrUoFyoqniD6UyspkztDobc3zy
 uzvHNXe4QATibVEqp8Zlh48SJcpQZXiNaCW39cXI4LN5NAFOv5cAq2iOR0nZAYbNx5oTld5sY41
 bwtnrpHAJOM8acEALV+J/Suj+ncev03vwjYxy6ry/j7/y87SGsjSqN3XPGpjRYZDnWZef+WapuF
 IwBZ+gAOhIIvGKZTJHImoT5QmGvkRRA687VLVjhy23xxYDWlPoYWOXXU8YIUoIwNMY8dZ7QLnBS
 6qhk5DZaH5L1+5zpXqHgPDjRjwoywkdZDoUt9EkCTGMWFwCnKqmWh3kbdgfoaBQF2HVLNP6zCZO
 r4i2sX9PmUNjW/e2zZjWYuXvlV0cy3Vepx3WDsKbOsPD0kDwUeOSXbOEcddcrhHXqwd73D58KbX
 mGj2Nzkv+o1bUTg3lBCXg90b8PBPd2QeJaqRL8fLM68kHygC71XnHmOlkQ2VbEIIyLPJtBlUNhX
 wKtvFhfNPkYb2mM5rC3vk8HAkr+J9VJ5FkbBMZPOPbpmRwqCvaYOBPe9NL3PTpTALzaYQbsueNs
 5sHYYIw4p2A+UfUDVgqLIBHywo99WyY2EVFkjIHtcDubuNqCJk6lsb4OSECDTFhxXLD/ZLqc1FL
 XeNORufyJDaO7UsnubwM1Ag==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

On RK3588 the 480MHz PHY clock must be running to access registers on
the OHCI and EHCI controllers. This requires that the clock output bit
is configured correctly (already happening) and that the PHY PLL itself
is running. The PHY PLL is only running when the PHY is not suspended.
This is currently handled independently of the clock and thus the clock
might be enabled with the PHY being suspended resulting in a
non-functional clock despite the clock being marked as prepared and
enabled according to the common clock framework.

This is especially a problem with OHCI system resume on RK3588, which
does:

ohci_platform_resume
    -> ohci_platform_resume_common
        -> deassert resets
        -> ohci_platform_power_on -> enable clocks
        -> ohci_resume
            -> ohci_readl(ohci, &ohci->regs->control); // SError !
            -> ...
        -> ...
    -> root hub resume (this resumes the PHY)

Fix this by fully powering the PHY from the clock prepare function.

This does not work on older platforms, which have multiple ports and
only one 480MHz clock as we do not know which port should be resumed.
But as far as I can tell these platforms do not have the clock
dependency from their USB controllers and thus are not affected.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 31 +++++++++++++++++++++------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 925a03fee6bc..cc923d12ef7b 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -363,6 +363,8 @@ static int rockchip_usb2phy_set_suspend(struct rockchip_usb2phy *rphy,
 
 static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 {
+	struct rockchip_usb2phy *rphy =
+		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
 	const struct usb2phy_reg *clkout_ctl;
 	struct regmap *base;
 	int ret;
@@ -379,16 +381,27 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 		usleep_range(1200, 1300);
 	}
 
+	if (rphy->phy_cfg->num_ports == 1) {
+		ret = rockchip_usb2phy_set_suspend(rphy, &rphy->ports[0], false);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
 static void rockchip_usb2phy_clk480m_unprepare(struct clk_hw *hw)
 {
+	struct rockchip_usb2phy *rphy =
+		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
 	const struct usb2phy_reg *clkout_ctl;
 	struct regmap *base;
 
 	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
 
+	if (rphy->phy_cfg->num_ports == 1)
+		rockchip_usb2phy_set_suspend(rphy, &rphy->ports[0], true);
+
 	/* turn off 480m clk output */
 	property_enable(base, clkout_ctl, false);
 }
@@ -632,10 +645,12 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = rockchip_usb2phy_set_suspend(rphy, rport, false);
-	if (ret) {
-		clk_disable_unprepare(rphy->clk480m);
-		return ret;
+	if (rphy->phy_cfg->num_ports > 1) {
+		ret = rockchip_usb2phy_set_suspend(rphy, rport, false);
+		if (ret) {
+			clk_disable_unprepare(rphy->clk480m);
+			return ret;
+		}
 	}
 
 	rport->suspended = false;
@@ -653,9 +668,11 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	if (rport->suspended)
 		return 0;
 
-	ret = rockchip_usb2phy_set_suspend(rphy, rport, true);
-	if (ret)
-		return ret;
+	if (rphy->phy_cfg->num_ports > 1) {
+		ret = rockchip_usb2phy_set_suspend(rphy, rport, true);
+		if (ret)
+			return ret;
+	}
 
 	rport->suspended = true;
 	clk_disable_unprepare(rphy->clk480m);

-- 
2.53.0

