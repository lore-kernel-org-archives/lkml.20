Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BADC442FAE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860386; cv=none; b=gck2j32h1y1XP8hgsYvi43mJmPvJUC5LA8ZBS/lQjkGUNjlstbu87Qht0bYrmtQJRwBabRSwG1uSPLjAv3BeivAAhG3y+Fr+efw6dbWJlO8ucYQ5Ih3hf5Wfzuuiihx4iJEZ5eCSsklltP3Epd6lmW1REFrsvjtXs+RpLkmyQuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860386; c=relaxed/simple;
	bh=uFbEv/1TqnqlOuSGoR42a3bpiDveNN7733gqKv617I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M3uJKcATK3IzlHu7NJVRvRYJBjP3MFWUabvgDD9hOkM/iF7hSczbgGNOlKKd4DulK9BbMIdrBR6PQznmsShgY3TUWGXfSUDNcwokCPFPUpZMdTZaAS263X/lT2YCR8lSTD4wVoNcKkBlpitnmFAlPwVEym78c4ublPZt53mUbng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pPdrR9jI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pPdrR9jI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790860382;
	bh=uFbEv/1TqnqlOuSGoR42a3bpiDveNN7733gqKv617I4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pPdrR9jI0cK58QWxUwsH4kGbXZ/FWujMugIZL+xfEcRoAsx7EXQVRq5A/KME9OZPN
	 euPKfEu3G77MbE/rLIVlKfEBuez7YLAFT7HNEXov2k6wHPK4dRcIGDQVaQtBms01TP
	 vZSEKbg5H82U1wkE2h4A+c7W5R2mxwpbnJH+2FcuOTHVmgY1rPerE2CGRGbcwAQHHh
	 S2t7EOHxVqwUJGHTMjd7+8PUrPki9qPkWst/Y8ezD40VAzs4ARusvsXzMuMzGK3ksw
	 dJ0hGsG9oxiZOSQne4ifdB9KOut4LmJCnYqk0cysMj67hJdGcyMVg188mS0al+8T07
	 MuyhTEBu+Vv1A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7569617E0667;
	Thu, 01 Oct 2026 15:13:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 277F8480030; Thu, 01 Oct 2026 15:13:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 01 Oct 2026 15:12:41 +0200
Subject: [PATCH v2 3/4] phy: rockchip: inno-usb2: move suspend handling
 into new function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-3-e01bf509359e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2718;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=uFbEv/1TqnqlOuSGoR42a3bpiDveNN7733gqKv617I4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq+XF6B98k0YLaQ3k15aklynKvMPiCB6RPbD
 fRii1jNsvGscokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvlxeAAoJENju1/PI
 O/qa8usP/0ve5gpKWNGmuTNBPDErf2viFgWW//19Ku1xoBv2Kkg8XSD9ejdQYKx7R/qm/fhREH2
 Fzj4FCzWz4uOCjJZ+ff+1UGzUk78TsX3Ej88kqan2ykOMWBtp8nS3D/r77GxLJCoC8oXqiguil8
 m8rp8kWcsFPbjZ/0/N1qBqsgluPmeWK/0QR7VwtEdaWhRZpNsOoGJ0IKM77m78dlMw7Mrl6Wzgn
 aCDguu0xmWtJaTcA/Z4gmCByhH782hehHh6feYPmLyIJjdX8xjivHCYAJvDMl3eYvf9qDhSW//1
 emmK2A6lfYOU/H8v6EgFhKh+6RwxFLjmyIWxnsQYZHmPgvTxtl9gN06pJvEowcMbnmiBa1/gt10
 vwmFxXQdSMjOjcOmPDFXzZPHDsIQmrBEAS0X97ch17CBzNYxH7qS8YV1BM/mBtmVDYGFVT3XGJW
 e8Lp281/RUHedEcaEJzx4r9BQDyy8Zt+gZZHvDDMgDfomIaMcIbaI0TwGNyPgN3ORkJJEKwjvbD
 GjlagYbWwG0/okT3LGYt9iQ5DOfTbOtbMSvztHI4QTzOiCmRXLpnzLoD1ese+q/9ENL+PF/3KU8
 6CY7nutDg89IbdHcLGDOjBEViM5kuI7MCC+Kob2wNgyI9SpniItWc07nD/zrtnGXvWuKwx1Dl4F
 a7+NbC+hmB2aZyvwuDXI4tw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Move handling of the PHY suspend handling into its own dedicated
function. No functional changes intended.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 48 +++++++++++++++++----------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index e4d8abf935c1..925a03fee6bc 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -332,6 +332,35 @@ rockchip_usb2phy_clk480m_clkout_ctl(struct clk_hw *hw, struct regmap **base,
 	}
 }
 
+static int rockchip_usb2phy_set_suspend(struct rockchip_usb2phy *rphy,
+					struct rockchip_usb2phy_port *rport,
+					bool do_suspend)
+{
+	int ret;
+
+	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, !do_suspend);
+	if (ret)
+		return ret;
+
+	if (!do_suspend) {
+		/*
+		 * For rk3588, it needs to reset phy when exit from suspend
+		 * mode with common_on_n 1'b1(aka REFCLK_LOGIC, Bias, and PLL
+		 * blocks are powered down) for lower power consumption. If you
+		 * don't want to reset phy, please keep the common_on_n 1'b0 to
+		 * set these blocks remain powered.
+		 */
+		ret = rockchip_usb2phy_reset(rphy);
+		if (ret)
+			return ret;
+
+		/* waiting for the utmi_clk to become stable */
+		usleep_range(1500, 2000);
+	}
+
+	return 0;
+}
+
 static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 {
 	const struct usb2phy_reg *clkout_ctl;
@@ -603,27 +632,12 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, false);
+	ret = rockchip_usb2phy_set_suspend(rphy, rport, false);
 	if (ret) {
 		clk_disable_unprepare(rphy->clk480m);
 		return ret;
 	}
 
-	/*
-	 * For rk3588, it needs to reset phy when exit from
-	 * suspend mode with common_on_n 1'b1(aka REFCLK_LOGIC,
-	 * Bias, and PLL blocks are powered down) for lower
-	 * power consumption. If you don't want to reset phy,
-	 * please keep the common_on_n 1'b0 to set these blocks
-	 * remain powered.
-	 */
-	ret = rockchip_usb2phy_reset(rphy);
-	if (ret)
-		return ret;
-
-	/* waiting for the utmi_clk to become stable */
-	usleep_range(1500, 2000);
-
 	rport->suspended = false;
 	return 0;
 }
@@ -639,7 +653,7 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	if (rport->suspended)
 		return 0;
 
-	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, true);
+	ret = rockchip_usb2phy_set_suspend(rphy, rport, true);
 	if (ret)
 		return ret;
 

-- 
2.53.0

