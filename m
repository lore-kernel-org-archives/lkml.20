Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268971;
	b=JfAiYoqCt/A/j5lWqkfuHdnjo+ot/nUjfHcE9Hvzu71+uZHmgw2NV+CGChXRSzRt7OQt
	 F4fOtPInV5VXBh7ck6XEsFsONt/ceN3tWRLs3fM2cO34EcVNggLvFG49aD2+maT6CR3/Q
	 Z3KpMFJmWM4sz0qSCw+TH9e0kkuLVVsA8LDsDnqtD1Ycf/tsYMAwTl5wzFfxKl/izlSye
	 h0XqjbK5KZ8J+lBi5wkaUykGLTTsAITVDKfH5dOngP1/npPIEcwoRUrHJxm646v1D3sDx
	 eAjT/lVhcO7wRfn4TfTwoZWjZ6me25SkVeo46w9mjemjY8i/Sqo1+3ImVP+fbbQAh5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268971;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ABxWzgzmGEph2AHBxDZRCgEW99uo6BmUCnWoisNV7Yw=;
	b=Kj0OIbG4JpEBinrQJWkdgLIqphIEZsO/ClHr5mblql/2yds++SMIpE+jPapTHRwo6X0t
	 YdnUXcgrtdNfN80nBA4Mv8F8Afh9LuceQ4kAyv6p2gjXZ+w+YRlJ2UrIuLqzAbbcClkIZ
	 Ej9Yv9+UT+NJntkwUYhKMq7Z2CvrnOrKrO97p5uLNUGfCdiyPVcAZvIkIbY2L+9X65++o
	 2nmjUzIZms78iu1MdWivz95L9ivMVdkH5fZE61DagIhxuzzYkOP0xPNT+igpyiG7lEXxK
	 ATWAXJgjW/d3KFGVnXyasvCUTWE8N0tWFB6VerRvIiKroTUjYRSH8NPfOKZ9P+Rddwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=TzqZBKMl;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEF5606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DEF5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=TzqZBKMl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794268968;
	bh=GN4bmnoEDDAXDU5l7MQkDzQrhcRMkLzOepWx2peIp3g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TzqZBKMlDbyecZRI8Acku4S9WOI8n1T3yAhQybhrGEzD4TizsfhYWTt3MOHAa3W+B
	 aKOY1ttJqMyuJLz992F4z+X7upBp2MHpkpDWfFY9qpcqXj53yjO5O8nisprPnvhe83
	 69WHqKLtCDKRImFIo12oAJ8QXEedA4O/DaLxuHZPKB7sOHsDaWei9BStmChRWZZ/D1
	 wkAg9HbnCF0BLMVwTwB0h5H4mFM1dLfWsiyootrdBwsT9J7S3OxjNRow2ybw0xUp/D
	 NMtNzRrTI6uRnYDwfUXaR7AXlEClM0fTzOFq+1Li2eTXifqyr1j57tMO18QCsUc9+d
	 /wFKiMQW5kTSw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 681F217E07EC;
	Tue, 10 Nov 2026 01:02:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 23876480030; Tue, 10 Nov 2026 01:02:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 01:02:47 +0100
Subject: [PATCH v4 2/5] phy: rockchip: inno-usb2: ignore regmap_write
 return codes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-2-51acc071634f@collabora.com>
References: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com>
In-Reply-To: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 William Wu <william.wu@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10869;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GN4bmnoEDDAXDU5l7MQkDzQrhcRMkLzOepWx2peIp3g=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGryXydIITBhOGACeSv+CQfTAL5yJOqSyFfDl
 /YVT83PjR73i4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq8l8nAAoJENju1/PI
 O/qa8E4P/2vejFM2vnvgfwZ5YHGBB1PyXWvUMB1mXQYTvxauDN/9cZbk8TggFUF98oqa9B85WP7
 Kvz5uyHpb0QtTR8reOav7Q8vMLRHT/VS+jY2HUmJE7dM5ue9Cwk+a07L/H6cAAhZjM4cM+jxq4a
 by+7jWiCAiSx2lb08EuJ6m+GKS0EurrnC1tKD/+TuK7dszf4/X4o9d8JAGpApC0Hy1u+bQWHptm
 1jWTdIb8anSzOhfJbGxyRkm+tXSTF+FP4PMtrsw6Q/N2ZChAyROsVnF37/nQ1RTXtCeMOSWa/UT
 uiy5k7yEotLppLw/KOmyzNezdJS0cxak0ijFNdj1z7g2rghd4f37MsH5nE3pAd8krapkuP+gY7n
 c6wwYvMBKNoUcBQuL/V82TmJ2+5ZhzWwYzpp+Wsf7Brj+sz7LQpwrE6FFwS2Fx2jpvA1VQb5+eO
 O37o7sNQVcxIni0ZyWzSLPVafAe99XmnzprslIUkrfE2lauFRwIieySadW4V8mTGU9X8QW188AI
 BOQQ9wMdj1l7L9pGmLCS06pRBJfetZMfwuUED6rttxoU9ixAwJ7nSI2cvQf8gsb7/qb9SSFxeY7
 owQO7nFGplz7qdzZfEzhTaN1CX0Hst1tls5GG5VUi//t9Dakmh5UmLTObPqnb8pO+yxVpnDAg55
 VdIPAbDKbA+Q6NdqaZKw6mw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

This driver only uses MMIO regmaps, which means regmap_write and
regmap_write_bits() cannot fail (writing to unpowered/unclocked
registers would result in an SError instead of a regmap_write failure).
Thus drop the useless error handling for better code readability.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 161 +++++++-------------------
 1 file changed, 43 insertions(+), 118 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 0b61f152eb3f..a705c4b18bd4 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -263,8 +263,8 @@ struct rockchip_usb2phy {
 	struct rockchip_usb2phy_port	ports[USB2PHY_NUM_PORTS];
 };
 
-static inline int property_enable(struct regmap *base,
-				  const struct usb2phy_reg *reg, bool en)
+static inline void property_enable(struct regmap *base,
+				   const struct usb2phy_reg *reg, bool en)
 {
 	unsigned int val, mask, tmp;
 
@@ -272,7 +272,7 @@ static inline int property_enable(struct regmap *base,
 	mask = GENMASK(reg->bitend, reg->bitstart);
 	val = (tmp << reg->bitstart) | (mask << BIT_WRITEABLE_SHIFT);
 
-	return regmap_write(base, reg->offset, val);
+	regmap_write(base, reg->offset, val);
 }
 
 static inline bool property_enabled(struct regmap *base,
@@ -336,15 +336,12 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 {
 	const struct usb2phy_reg *clkout_ctl;
 	struct regmap *base;
-	int ret;
 
 	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
 
 	/* turn on 480m clk output if it is off */
 	if (!property_enabled(base, clkout_ctl)) {
-		ret = property_enable(base, clkout_ctl, true);
-		if (ret)
-			return ret;
+		property_enable(base, clkout_ctl, true);
 
 		/* waiting for the clk become stable */
 		usleep_range(1200, 1300);
@@ -481,25 +478,14 @@ static int rockchip_usb2phy_extcon_register(struct rockchip_usb2phy *rphy)
 	return 0;
 }
 
-static int rockchip_usb2phy_enable_host_disc_irq(struct rockchip_usb2phy *rphy,
-						 struct rockchip_usb2phy_port *rport,
-						 bool en)
+static void rockchip_usb2phy_enable_host_disc_irq(struct rockchip_usb2phy *rphy,
+						  struct rockchip_usb2phy_port *rport,
+						  bool en)
 {
-	int ret;
-
-	ret = property_enable(rphy->grf, &rport->port_cfg->disfall_clr, true);
-	if (ret)
-		return ret;
-
-	ret = property_enable(rphy->grf, &rport->port_cfg->disfall_en, en);
-	if (ret)
-		return ret;
-
-	ret = property_enable(rphy->grf, &rport->port_cfg->disrise_clr, true);
-	if (ret)
-		return ret;
-
-	return property_enable(rphy->grf, &rport->port_cfg->disrise_en, en);
+	property_enable(rphy->grf, &rport->port_cfg->disfall_clr, true);
+	property_enable(rphy->grf, &rport->port_cfg->disfall_en, en);
+	property_enable(rphy->grf, &rport->port_cfg->disrise_clr, true);
+	property_enable(rphy->grf, &rport->port_cfg->disrise_en, en);
 }
 
 static int rockchip_usb2phy_init(struct phy *phy)
@@ -516,42 +502,14 @@ static int rockchip_usb2phy_init(struct phy *phy)
 		if (rport->mode != USB_DR_MODE_HOST &&
 		    rport->mode != USB_DR_MODE_UNKNOWN) {
 			/* clear bvalid status and enable bvalid detect irq */
-			ret = property_enable(rphy->grf,
-					      &rport->port_cfg->bvalid_det_clr,
-					      true);
-			if (ret)
-				goto out;
-
-			ret = property_enable(rphy->grf,
-					      &rport->port_cfg->bvalid_det_en,
-					      true);
-			if (ret)
-				goto out;
+			property_enable(rphy->grf, &rport->port_cfg->bvalid_det_clr, true);
+			property_enable(rphy->grf, &rport->port_cfg->bvalid_det_en, true);
 
 			/* clear id status and enable id detect irqs */
-			ret = property_enable(rphy->grf,
-					      &rport->port_cfg->idfall_det_clr,
-					      true);
-			if (ret)
-				goto out;
-
-			ret = property_enable(rphy->grf,
-					      &rport->port_cfg->idrise_det_clr,
-					      true);
-			if (ret)
-				goto out;
-
-			ret = property_enable(rphy->grf,
-					      &rport->port_cfg->idfall_det_en,
-					      true);
-			if (ret)
-				goto out;
-
-			ret = property_enable(rphy->grf,
-					      &rport->port_cfg->idrise_det_en,
-					      true);
-			if (ret)
-				goto out;
+			property_enable(rphy->grf, &rport->port_cfg->idfall_det_clr, true);
+			property_enable(rphy->grf, &rport->port_cfg->idrise_det_clr, true);
+			property_enable(rphy->grf, &rport->port_cfg->idfall_det_en, true);
+			property_enable(rphy->grf, &rport->port_cfg->idrise_det_en, true);
 
 			schedule_delayed_work(&rport->otg_sm_work,
 					      OTG_SCHEDULE_DELAY * 3);
@@ -562,28 +520,16 @@ static int rockchip_usb2phy_init(struct phy *phy)
 	} else if (rport->port_id == USB2PHY_PORT_HOST) {
 		if (rport->port_cfg->disfall_en.offset) {
 			rport->host_disconnect = true;
-			ret = rockchip_usb2phy_enable_host_disc_irq(rphy, rport, true);
-			if (ret) {
-				dev_err(rphy->dev, "failed to enable disconnect irq\n");
-				goto out;
-			}
+			rockchip_usb2phy_enable_host_disc_irq(rphy, rport, true);
 		}
 
 		/* clear linestate and enable linestate detect irq */
-		ret = property_enable(rphy->grf,
-				      &rport->port_cfg->ls_det_clr, true);
-		if (ret)
-			goto out;
-
-		ret = property_enable(rphy->grf,
-				      &rport->port_cfg->ls_det_en, true);
-		if (ret)
-			goto out;
+		property_enable(rphy->grf, &rport->port_cfg->ls_det_clr, true);
+		property_enable(rphy->grf, &rport->port_cfg->ls_det_en, true);
 
 		schedule_delayed_work(&rport->sm_work, SCHEDULE_DELAY);
 	}
 
-out:
 	mutex_unlock(&rport->mutex);
 	return ret;
 }
@@ -603,11 +549,7 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, false);
-	if (ret) {
-		clk_disable_unprepare(rphy->clk480m);
-		return ret;
-	}
+	property_enable(rphy->grf, &rport->port_cfg->phy_sus, false);
 
 	/*
 	 * For rk3588, it needs to reset phy when exit from
@@ -632,16 +574,13 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 {
 	struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
-	int ret;
 
 	dev_dbg(&phy->dev, "port power off\n");
 
 	if (rport->suspended)
 		return 0;
 
-	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, true);
-	if (ret)
-		return ret;
+	property_enable(rphy->grf, &rport->port_cfg->phy_sus, true);
 
 	rport->suspended = true;
 	clk_disable_unprepare(rphy->clk480m);
@@ -1511,39 +1450,29 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
 static int rk3128_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 {
 	/* Turn off differential receiver in suspend mode */
-	return regmap_write_bits(rphy->grf, 0x298,
-				BIT(2) << BIT_WRITEABLE_SHIFT | BIT(2),
-				BIT(2) << BIT_WRITEABLE_SHIFT | 0);
+	regmap_write_bits(rphy->grf, 0x298,
+			  BIT(2) << BIT_WRITEABLE_SHIFT | BIT(2),
+			  BIT(2) << BIT_WRITEABLE_SHIFT | 0);
+
+	return 0;
 }
 
 static int rk3528_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 {
-	int ret;
-
 	/* Turn off otg port differential receiver in suspend mode */
-	ret = regmap_write(rphy->phy_base, 0x30, BIT(18) | 0x0000);
-	if (ret)
-		return ret;
+	regmap_write(rphy->phy_base, 0x30, BIT(18) | 0x0000);
 
 	/* Turn off host port differential receiver in suspend mode */
-	ret = regmap_write(rphy->phy_base, 0x430, BIT(18) | 0x0000);
-	if (ret)
-		return ret;
+	regmap_write(rphy->phy_base, 0x430, BIT(18) | 0x0000);
 
 	/* Set otg port HS eye height to 400mv (default is 450mv) */
-	ret = regmap_write(rphy->phy_base, 0x30, GENMASK(22, 20) | 0x0000);
-	if (ret)
-		return ret;
+	regmap_write(rphy->phy_base, 0x30, GENMASK(22, 20) | 0x0000);
 
 	/* Set host port HS eye height to 400mv (default is 450mv) */
-	ret = regmap_write(rphy->phy_base, 0x430, GENMASK(22, 20) | 0x0000);
-	if (ret)
-		return ret;
+	regmap_write(rphy->phy_base, 0x430, GENMASK(22, 20) | 0x0000);
 
 	/* Choose the Tx fs/ls data as linestate from TX driver for otg port */
-	ret = regmap_write(rphy->phy_base, 0x94, GENMASK(22, 19) | 0x0018);
-	if (ret)
-		return ret;
+	regmap_write(rphy->phy_base, 0x94, GENMASK(22, 19) | 0x0018);
 
 	return 0;
 }
@@ -1554,9 +1483,7 @@ static int rk3576_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 	u32 reg = rphy->phy_cfg->reg;
 
 	/* Deassert SIDDQ to power on analog block */
-	ret = regmap_write(rphy->grf, reg + 0x0010, GENMASK(29, 29) | 0x0000);
-	if (ret)
-		return ret;
+	regmap_write(rphy->grf, reg + 0x0010, GENMASK(29, 29) | 0x0000);
 
 	/* Do reset after exit IDDQ mode */
 	ret = rockchip_usb2phy_reset(rphy);
@@ -1564,12 +1491,12 @@ static int rk3576_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 		return ret;
 
 	/* HS DC Voltage Level Adjustment 4'b1001 : +5.89% */
-	ret |= regmap_write(rphy->grf, reg + 0x000c, GENMASK(27, 24) | 0x0900);
+	regmap_write(rphy->grf, reg + 0x000c, GENMASK(27, 24) | 0x0900);
 
 	/* HS Transmitter Pre-Emphasis Current Control 2'b10 : 2x */
-	ret |= regmap_write(rphy->grf, reg + 0x0010, GENMASK(20, 19) | 0x0010);
+	regmap_write(rphy->grf, reg + 0x0010, GENMASK(20, 19) | 0x0010);
 
-	return ret;
+	return 0;
 }
 
 static int rk3588_usb2phy_tuning(struct rockchip_usb2phy *rphy)
@@ -1594,9 +1521,7 @@ static int rk3588_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 	}
 
 	/* Deassert SIDDQ to power on analog block */
-	ret = regmap_write(rphy->grf, 0x0008, GENMASK(29, 29) | 0x0000);
-	if (ret)
-		return ret;
+	regmap_write(rphy->grf, 0x0008, GENMASK(29, 29) | 0x0000);
 
 	/* Do reset after exit IDDQ mode */
 	ret = rockchip_usb2phy_reset(rphy);
@@ -1604,21 +1529,21 @@ static int rk3588_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 		return ret;
 
 	/* suspend configuration */
-	ret |= regmap_write(rphy->grf, 0x000c, GENMASK(20, 16) | suspend_cfg);
+	regmap_write(rphy->grf, 0x000c, GENMASK(20, 16) | suspend_cfg);
 
 	/* HS DC Voltage Level Adjustment 4'b1001 : +5.89% */
-	ret |= regmap_write(rphy->grf, 0x0004, GENMASK(27, 24) | 0x0900);
+	regmap_write(rphy->grf, 0x0004, GENMASK(27, 24) | 0x0900);
 
 	/* HS Transmitter Pre-Emphasis Current Control 2'b10 : 2x */
-	ret |= regmap_write(rphy->grf, 0x0008, GENMASK(20, 19) | 0x0010);
+	regmap_write(rphy->grf, 0x0008, GENMASK(20, 19) | 0x0010);
 
 	if (!usb3otg)
-		return ret;
+		return 0;
 
 	/* Pullup iddig pin for USB3_0 OTG mode */
-	ret |= regmap_write(rphy->grf, 0x0010, GENMASK(17, 16) | 0x0003);
+	regmap_write(rphy->grf, 0x0010, GENMASK(17, 16) | 0x0003);
 
-	return ret;
+	return 0;
 }
 
 static const struct rockchip_usb2phy_cfg rk3036_phy_cfgs[] = {

-- 
2.53.0

