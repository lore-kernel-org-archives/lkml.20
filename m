Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833688;
	b=cUA0UMHbTEfWxxvwJdsT6B3iQDNbwPEekHgK7zEjZWORpvp8oqVLGe65tOabP1Z6xMFJ
	 CRkjUFSB+CM7mxoUrWo/TbwnubvtswFPvN4nKzRNg/lKuczgRfl6+T+x2F10wBGKIe8sG
	 jIBrScFoWUXbU0z24pJkRlJKBxq5YXF3K3/0XqaH872le3GcaWaKRGSx4fdLVRD8bDdYd
	 ntKu9JIrrUya5/MagPKFNNyqtEi8hKdKkCWazglaXEM4/viC/Nx4tr7t+uF4AUUwf9C0d
	 fhsg3vTcerveN3wltobx53j5ElFD93Q96EyxoQoE9FrPcc03HZFZbu//MRt5CegvMdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833688;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=SeMeuT/h6863CtRsmF+5VPe+S9J14Zl3iI04dPXlvQE=;
	b=Q2oT0VO0+eEwFvUg4IAIn59iOkxwT5BY6xhf7RzoQIvB6xAg13u9tyNmy+VTpCx6RJ7n
	 5bQxngh6GutvWBsvC6ZrHv0adtoqnf3ScXgcmvi7NeikVcwkdQOv2I0oBL5LmByX3dyj4
	 xhb5WEayjSlZ4pzBLZibvBnMKw6nSZK7DSQcxg1eKh2MKliyQTaVCujt214u24h3z4se0
	 aw2tYiDpFhI2czs+mEPiaWc5IQ4klIpJhsD2b+j9FIJX/JGWTmS1S2u5b8Eyvcw7IMg56
	 J34hiHNz1aHQgp8ZUbXnEXf1w034W77Zz/RTzs2YVJZkdfUf/8dXA9jNyoy2WH13MnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=oJhcIaBk;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F692606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F692606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=oJhcIaBk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793833685;
	bh=rX9nu49yVHon/eoArd9zChZ1LRjZoDqVhWArx28DxU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oJhcIaBkcH+r0p8sAeDaziN2EQV/IFXW0JY83ec8IXbVKaJPImGMYY6KHZrJyoo8z
	 Tw63jYNyVT0sMYXprt3k7j2eDMr/JVntBQtck0lzwwy/h068khx6W1er02nj+yhvNJ
	 E2xIT00xwx7tEo43kYsdyPrgaucPawviW3Ar1jz3teNAaeYsGVJNmzAW9TrX7+flVn
	 AcaENKhrekC5O6gGadumv7hpJ7TwYwrmUidDDT07+HWzgrlLZrF/veXDzdxYqs+fbs
	 U6SFRYfHeMNSrMcEmV0oCcyF3cnMiNiKYbyRoWpQwvIV0Uy0WSush+HWCbPLljJnIh
	 GQaMHdNxGCoAQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 97E6617E0D43;
	Thu, 05 Nov 2026 00:08:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5BD92480030; Thu, 05 Nov 2026 00:08:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 00:07:59 +0100
Subject: [PATCH v3 3/4] phy: rockchip: inno-usb2: move suspend handling
 into new function
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
Message-Id: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-3-b20608c08b94@collabora.com>
References: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com>
In-Reply-To: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2717;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rX9nu49yVHon/eoArd9zChZ1LRjZoDqVhWArx28DxU4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrutXgLb9DhtD6zxpWrnTdXUCySn85eBGll
 yUpbCI9C/WcdIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq67rVAAoJENju1/PI
 O/qaducP/1HoudOHIpkYPZuBpSk+JB3yjf2J/78yalMteoo6DXmXIcU9dLX+Rp6VVatu18uOlCn
 hY9BDwcBVTi4X1g6I78ZP7sw427gIoc/w/91We3afdZL4sg/SQzQHO9S4DBMCzniy4f3cTk/tRK
 1iceILrYk2WjRnUncIydPSUxmbfqpMGQS+ZPX7aDIiM/ikIG+HGZB52azAEDpbY2NrUnOxhBcR+
 sZtFyfnUN3x6C+5OCdZvkZR1YJGyyqLaO/+gJh8mPR4m+mtCVfyyMPtrfUVBBAgm79Cu9d+qU1K
 o1dI/FkLaoWkDRkU0AMUbPrnfV9FEEtaaY8kDZK9ZqGY5m9xlJrrOZiPfIFZ2OyIBxGrZ4Bn1Er
 hO81XdGGrM98bB9G3W8Nryp+2l+64CaSpJLD9Vkw2hJNAytMMPm8ekM4Hp6ORqFc3UXrHMWfqX2
 cEOvBLtdLIfxvFgtFPXET19zLlnm3yMoePdQA7SosIWlGv1Sz3IwiJbe2nHAppbGyZTGTQVDJGJ
 0w3z9jhFJKoq67VG9D39av/uoVGJJsGoZger7yiRnu+sNBG7iL5HpenG4gBsAZ46QyarKxfBPKb
 yBCgolS6Zulsbsv32QUPaM65j9zyLYDCMZpECMwWBw5WSajMFTGh2vjvruhMX+PRVHdBd+3w4dJ
 5DxP4roLm6U/C7Ee7UpwzZA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Move handling of the PHY suspend handling into its own dedicated
function. No functional changes intended.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 48 +++++++++++++++++----------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 51afbcc40c4e..2919c2e11968 100644
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
+	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, do_suspend);
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

