Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268973;
	b=jwlB6E4MClT6aVs0LOQ2evz7m8HbinUI8ctXwwGvW3LR/WRk/HxqliYFmYU0LAlCXNis
	 vkLoRlBVHXPGi7aYD5owyFtHlB1fDX7zwQBmdb2yVd4gmPoyHw/o/6uAqQMTnwYHChWSo
	 r/gOHS6UvvQ/s5KDwZpzgxrRSj9fzgjb5Tc1vBe9vm/tBlmlreA60f8aP9pU+tA/c6Yk+
	 ZcySwZmcPq5lZ5HhXMgno/7ZrisNCaV79kSFFSH7xwXe6YKpa44uZLvg9jhR/aAmFnUoS
	 PKXGB0C0nU3C6l8klIMWFT0wQ6M9ums8UxaDY0Rr19FgO8ZftsKwh2RYvX3jAnI2YIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268973;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=5pmq+eGO7PnID3i5wqOYXC5SqQeE4O47YKg4WojFp2k=;
	b=MMUqjbner71yDb+diEkWbm8Ch/1HW0VITdSwoq9WcKAMw15mq1TCXfa9YM8nm6w9Fbq+
	 2TRE15nW+9gtmR/+caL9TYSflbNdQO2P0XKOMHrvW1G8h6mOGuf8v9IlTQfRuX+HY1Z5M
	 JKd0mzYAHp7Ku2mWrbI1A6csXsN7HK8SZGCTlR4QJgmLgewX6rJTWfDHaPAc+8tr5WeZ8
	 GogcgWalIEziDIVE3brXwpNNTN6ca1v954GblkhFghu0LEtEH1ooTIERUfd8BOxy1VPBU
	 SM8s2IdNa8d7fi+MhgDyFDDJDAhezpC84DLKrLu07e8sD1Kg0wra1clog5LsIm7Lm8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=TuQIpCN5;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F2D60A261C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79F2D60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=TuQIpCN5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794268968;
	bh=BQgZPTgLJ7+3Z978mywaO2hIMczDhrYpHoIMQtLi5q0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TuQIpCN5tIIPhYPKkDUgn6Pt8OjfuktNosBXYZLIHRkMOcLiN9ne46e4N7MuJrLhI
	 pfOIfPt9MXDg3v5K4dnd4fco8tcYlXTAJXCec2sWJQEYxe8eNpLQeBvVjIitaA09li
	 c2FMlfhTP088ZSMoDebzyy5Df5ufLmr7hT1kLJN7wdMrZ4YbNuRw9P3dVAFEPjeKki
	 kw/eEuiT653JuDFSpwxcVFXLKx7/se4yl4A36n+E3CPZRbGTCwwkdZZGpHwdsXLllk
	 V3KFDS12XowaYyHU6O92bnCX585pTthq/BddwV3lkkCeNn+G6r/iS53XLD0lMI3+M2
	 uc6Juu0cznGgA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B4B7717E150A;
	Tue, 10 Nov 2026 01:02:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 28C25480038; Tue, 10 Nov 2026 01:02:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 01:02:50 +0100
Subject: [PATCH v4 5/5] phy: rockchip: inno-usb2: move suspend handling
 into clock prepare/unprepare for RK3588/RK3576
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
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-5-51acc071634f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5082;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=BQgZPTgLJ7+3Z978mywaO2hIMczDhrYpHoIMQtLi5q0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGryXygtU//Jjb1tabrxgjpmXtE/y8LP3Ztjj
 2ObXnIDy/5+yYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq8l8oAAoJENju1/PI
 O/qaJLEP/i59wub3x8Vk/XSJ3ivtLTSlt7F6YaxeamMa3fVyvyRmIDtY9ZTmH/dLakop96+RiCt
 P9cAmxBB3Ig9YoPdV2FaYP5J+kT3XMm+fnNpcjpCPykGc0eMCWryLm8lIgz2Bzgsex+qgx+BWk1
 dKusi7wbPIRo2SXaQF6ENyIOhqZ3jDM0EUL7f92XKV+Otet5BD3R1oXT8wGSOw8dz3Wj9h57XF8
 ewcMjZwOHROBZA0eaIO5DVjy+rRSnuMYu5l5M8xVfxvkOYeT3QNX0xzXaqP34OQ0DNyYzP+WH9c
 7m49R6N5zx+lD21eXRJ2JEq841QZtMtIsp8xqReVEDPPCW21zRTSHA0VEICKZdGk5qbcBVsTbDa
 si3YcPZUiuoyM8eAftYa4Ro/HlrjbaVZRNEwehiZ9+BdWZdute8TydTBFDrkbi/MsY1TIEcM2MG
 pabCySH8k42IpYfTLe7sbT+m88mKiVhdOUsPWAnHZY+/O1X0VH6EKXMwKIdwCkv/v030C+7xHqo
 aTg9IE0QFwy7IU0A9IbkrV8MsP5myQA3ntNRUAitulkk2ttCi5A7ul1f+816s0f9CcxO9HOASMX
 hMWLrW9nf3BenIczQFGnjhKwh701CsWH2lE9/w4/7rPaOoy54XinLRMHTBm7kxrU6Z2+kFqznEM
 h+rEGGFTYw//IUnnk7KQysQ==
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

Note that the 480MHz PHY clock registration is moved after the port
initialization loop as the clock operations may access the port after
this change. Additionally the old behaviour is used for single port
devices, that have their port disabled and thus port_cfg == NULL.

Backporting this is not trivial as the change relies on prior cleanups.
Considering system suspend/resume on RK3588 never worked on upstream and
there are more issues from preventing it (especially on older kernels),
this is not marked for stable backporting.

Fixes: 3a7db8e9edef ("phy: phy-rockchip-inno-usb2: add rk3588 support")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 29 +++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 642c996d23de..9fbd9e25f2c1 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -342,8 +342,15 @@ static void rockchip_usb2phy_set_suspend(struct rockchip_usb2phy *rphy,
 	}
 }
 
+static bool rockchip_usb2phy_clk_manages_suspend(struct rockchip_usb2phy *rphy)
+{
+	return rphy->phy_cfg->num_ports == 1 && rphy->ports[0].port_cfg;
+}
+
 static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 {
+	struct rockchip_usb2phy *rphy =
+		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
 	const struct usb2phy_reg *clkout_ctl;
 	struct regmap *base;
 
@@ -357,16 +364,24 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 		usleep_range(1200, 1300);
 	}
 
+	if (rockchip_usb2phy_clk_manages_suspend(rphy))
+		rockchip_usb2phy_set_suspend(rphy, &rphy->ports[0], false);
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
 
+	if (rockchip_usb2phy_clk_manages_suspend(rphy))
+		rockchip_usb2phy_set_suspend(rphy, &rphy->ports[0], true);
+
 	/* turn off 480m clk output */
 	property_enable(base, clkout_ctl, false);
 }
@@ -559,7 +574,8 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	rockchip_usb2phy_set_suspend(rphy, rport, false);
+	if (!rockchip_usb2phy_clk_manages_suspend(rphy))
+		rockchip_usb2phy_set_suspend(rphy, rport, false);
 
 	rport->suspended = false;
 	return 0;
@@ -575,7 +591,8 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	if (rport->suspended)
 		return 0;
 
-	rockchip_usb2phy_set_suspend(rphy, rport, true);
+	if (!rockchip_usb2phy_clk_manages_suspend(rphy))
+		rockchip_usb2phy_set_suspend(rphy, rport, true);
 
 	rport->suspended = true;
 	clk_disable_unprepare(rphy->clk480m);
@@ -1365,10 +1382,6 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
 	/* Clocks are optional */
 	rphy->num_clks = ret < 0 ? 0 : ret;
 
-	ret = rockchip_usb2phy_clk480m_register(rphy);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to register 480m output clock\n");
-
 	ret = clk_bulk_prepare_enable(rphy->num_clks, rphy->clks);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to enable phy clock\n");
@@ -1421,6 +1434,10 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = rockchip_usb2phy_clk480m_register(rphy);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register 480m output clock\n");
+
 	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
 	if (rphy->irq > 0) {

-- 
2.53.0

