Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268971;
	b=KP8QNZs/vvNl15WV0UvO1H0ty90qVd1wvXewbQqG4PTgaZcS4cPCuDdnriTxEq4OpF1y
	 pXsXB19BqQ0k+nL4P/DQZ7r+yFCagcXl7UAjKyKNwm/JRgkwoMNCQlNpi5JUnEE9e06Qi
	 oxno2QVZmaTn/mhZKEK9xF9uKyr1UaQdqFs+xvTAPWGpWumMDKYVrEQY586dfQH2P//sM
	 Hh9KfdXnGnJQ2a2a9XN/OFNpN9MGO4lUdO2hmxHFuuxMeMmDUDpGJDglvGRK7mx/+QcPs
	 Q507xQP6sHj1oAB3KVNh3g5WhV6UijMHtIUMyPWfoxpfWpHp23DJmo474hyP/FQDaIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268971;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=GHa4vWG2U9qBCeacF4dbyMI7nvPN86lsjzLRf7abFNY=;
	b=ik+RCd/c0FWgiOHq2MTs/JXV9Z44d18dnh+dYviI42cnKlVkqWgpvE9z02vveCae5W8k
	 aueJueheqm4vzGaTrN2j7g1O31Ywr0sThuKsHmR0mrxOJ3oAL2KmFje8wZ5Pt1Ky9id2Q
	 NR1DoiaW2dY/uc5Pk4Xjc5bn51DhzVlJmO3ky2+YweGx+1LifFU63l7EDOOId7MdjRg86
	 eerhS2CHzqZWl54DWu7YmWQCo/+v6jz14e5dt7o0bLddy6bJ8fEPy7tpPfOoORAj3FSHt
	 r0KsNEhHi4hlXGm6QYbpd/ZIf5+TqpuqJl4uusJ/pP6QQK98G6Giu43w4Ke8MYbrgDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XyWulKBJ;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46334606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46334606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XyWulKBJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794268968;
	bh=bw1d5xrjZc5YajWiuD/ZNG9Z7ntS2LT1VtNZ9HjI77U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XyWulKBJ9/ANjWHN7jYfaZ2ufF/Wtql0q1KIxvGvrKyJR0Q1tLi6D8XhOGHv4tLRK
	 muLwdTYkZoTOkC+S1QDnsXXXk9wqSgd+Vd3k9kaPj58p22yHWMeIDDHaK8TwcEV8eE
	 KGnTCvLPsohhZKY8uU7EXMuGgyPHbHTW9N8IiOZ+hakM+Ti/i/9iyZcSEmRCyLba4t
	 8nqAzBK4s0NpLjWcYqIPRFCUt7ldMlMD2K6bE7u6l+VtknvhsUDqE1rYg8TFEubzY3
	 rN7s+o/e/ITnMCwA1FkP1H6YaezUKHNhfa+X0lirqWUNAXLWN7G5NhltPXvVFe8p+V
	 7naP4U0UngMqg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6CB2417E14AA;
	Tue, 10 Nov 2026 01:02:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 27139480035; Tue, 10 Nov 2026 01:02:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 01:02:49 +0100
Subject: [PATCH v4 4/5] phy: rockchip: inno-usb2: move suspend handling
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
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-4-51acc071634f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=bw1d5xrjZc5YajWiuD/ZNG9Z7ntS2LT1VtNZ9HjI77U=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGryXyiY+G477NlDWvzikDMWU1Px7+wGDgk45
 OBRS5+8Qo4/o4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq8l8oAAoJENju1/PI
 O/qay+4P/iLVWJy8rwwLpujrTfdyiWyLldY3t9yrGsSPrN4+hLaq3yt5z4tUSJQjZ9weuqvyGU/
 z5pK95W4DAIJfEmY8Lu72bLWRUZ53AkDYMK/b04aHqOcYncIG25Kph5OrXKeyT8/9p/WhFhlcHy
 o6k/CbVJ+SYy0ulhTvGXwZ0hLChFdMfEeKyJmcbSadNQI+N4vJrEJeLNtz9KChITl6GTdyUexzS
 Zx47PE8NFtjghCMdkgmlGWmqvUSXtsQdAIupWzu8lgvd3dsjXFhjAhJqnhAEjCotOYNBv5bj0a8
 hdjizI/8NHYP7yC4aXsFxRwYm6BNo+nRDsukPGh8fbkuVt52RaToNFRE7gxm4VVgPAOdmad2gR7
 MH60oM1S1zodA/z3CwQzbBM6vIWnqkaACR85dCD5o/62QjRIJQhgCo2OagpfeyMm8uYHzV65fh2
 uW3DOpcydxqsC7fwy4nWdOGl+6zB1vpMpW59iNZIo2h/1hovz2eO+n169YPebswCsGilqwNZpGq
 zOg/lnDXZQk2E1hVZI6b0IXPnmlBvIN6bVkYr8KLXBKeFUuHQTxxGN5CpIGECmrYwWaY0J2z4/n
 S9K1ZpKNfY4d4WedpikXxoIapJVpRy7vaCVidN0W99ZE97NxHPtHtWuCYHqavtpW+nD9qag/MjT
 HrRPkEF1/NdtLOnNvfr4rcw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Move handling of the PHY suspend handling into its own dedicated
function. No functional changes intended.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 38 ++++++++++++++++-----------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 6b3104901695..642c996d23de 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -321,6 +321,27 @@ rockchip_usb2phy_clk480m_clkout_ctl(struct clk_hw *hw, struct regmap **base,
 	}
 }
 
+static void rockchip_usb2phy_set_suspend(struct rockchip_usb2phy *rphy,
+					 struct rockchip_usb2phy_port *rport,
+					 bool do_suspend)
+{
+	property_enable(rphy->grf, &rport->port_cfg->phy_sus, do_suspend);
+
+	if (!do_suspend) {
+		/*
+		 * For rk3588, it needs to reset phy when exit from suspend
+		 * mode with common_on_n 1'b1(aka REFCLK_LOGIC, Bias, and PLL
+		 * blocks are powered down) for lower power consumption. If you
+		 * don't want to reset phy, please keep the common_on_n 1'b0 to
+		 * set these blocks remain powered.
+		 */
+		rockchip_usb2phy_reset(rphy);
+
+		/* waiting for the utmi_clk to become stable */
+		usleep_range(1500, 2000);
+	}
+}
+
 static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 {
 	const struct usb2phy_reg *clkout_ctl;
@@ -538,20 +559,7 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	property_enable(rphy->grf, &rport->port_cfg->phy_sus, false);
-
-	/*
-	 * For rk3588, it needs to reset phy when exit from
-	 * suspend mode with common_on_n 1'b1(aka REFCLK_LOGIC,
-	 * Bias, and PLL blocks are powered down) for lower
-	 * power consumption. If you don't want to reset phy,
-	 * please keep the common_on_n 1'b0 to set these blocks
-	 * remain powered.
-	 */
-	rockchip_usb2phy_reset(rphy);
-
-	/* waiting for the utmi_clk to become stable */
-	usleep_range(1500, 2000);
+	rockchip_usb2phy_set_suspend(rphy, rport, false);
 
 	rport->suspended = false;
 	return 0;
@@ -567,7 +575,7 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	if (rport->suspended)
 		return 0;
 
-	property_enable(rphy->grf, &rport->port_cfg->phy_sus, true);
+	rockchip_usb2phy_set_suspend(rphy, rport, true);
 
 	rport->suspended = true;
 	clk_disable_unprepare(rphy->clk480m);

-- 
2.53.0

