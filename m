Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331183;
	b=pZEfgxUJCLXxDqkNJ1HPWuMHVFNRm+VEHHbMfeE/rseI3kFt/QXR8B/eeTz0HkkhsxM3
	 IMkTHsbEt6SWiKIA9USCaU8yBS1rzwTimZc4IhZZSG7LXtuEIeyVaG0O1UxnagtJqimAo
	 XiRsvTvyVyjc7dp/M+za2VRfCMxNI7CuJVbdj49ko6lDCJv2YU2bV3rb4cecPSd24H25Y
	 g+QYYuEbgjiVhHUFUnZ9RQYiwSTh6+tRxIVGoN1nzz6Sy3La+iq7auRZkYuoL9XHJuEY/
	 rgF1pgnEWKADLRz+SUEjtKMs+JJBeeKdBZ0wjjly9eB2uYZItHuNFtptXj6VKNB7BDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331183;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=W0+EyXibpOEclVGjpm0uYBDA59a93+6rqY65GSuAGZ8=;
	b=HEpgryDqPL97H9lL8G+ogllcs7+5oSpHddu4y6rv7yY45r9OUdTUrgo/s5RVqPT253kQ
	 ipwn6WeboZX6wlpXrYAzzV4qqf7AhvprDBTpDiSdOlSfKDdELH29u5ah9LstIHfZ/2Dtt
	 +Zg5e1BtxVf9qRbEeAEK+GjQtUWtL5MqyDhApqsTdT+cv/AnxdEfN1lJIWSAZxdwIZTvf
	 bnxvPx4LUHbYREdUn9xFzU/7Z7FD/Jl5UWjSRhUHXUbYGZLnxnE8mOt7BWtUfKUr/w6A3
	 AmVwScuYx/EGqtiDBMnDOlijH9Jtrk9NVXf56YwSq+w8+J4zaKpajO/d/aI54Gd6Yfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=oGHuQGtx;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F24D60A2636
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F24D60A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=oGHuQGtx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794331179;
	bh=IxmqW4hHZiplRSteB24WwisyJf/oUe3XCb1imAlD1pw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oGHuQGtxgP6gMMHD6OMhO7vts9PJLtMBIBGS738b5r3oMLMZqBPGjewPVwf9pAYgM
	 YWHVCUADrt/m5gBUCH4/HNlxXAoKF8RJgZSS8+TAulrpkstH7l6/m+kFrEeU2/Z1T9
	 Hl5DsHKVhNIREAaz8klvEpPGfaL1gC4AbDzseuxiMhkA2UO1HXP4GDpCd4JZ6sCuC0
	 3vYVAdwg5yVEJslxN4M/sxtno2qS7D2YAy8eB6JCfbSvd3+zT/zZRGgKsvUn+MubCr
	 zG6w7HQuSjYVHqhgOb60P0Ct4vx4b96xzuRC+bnGkO1+2+4sq37Ijo+IEB/NDBd6q1
	 gopUPnodg+Sdw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A76B317E1504;
	Tue, 10 Nov 2026 18:19:39 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 139CE48003A; Tue, 10 Nov 2026 18:19:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 18:19:19 +0100
Subject: [PATCH v5 6/6] phy: rockchip: inno-usb2: move suspend handling
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
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-6-d2e24582ab22@collabora.com>
References: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
In-Reply-To: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5215;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=IxmqW4hHZiplRSteB24WwisyJf/oUe3XCb1imAlD1pw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrzUiosvgz/3X9XcI6pCxsD6nhaDbGdGWTFw
 r/smNzs2LPhQ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq81IqAAoJENju1/PI
 O/qa4VcP/3gWTm6w+cBQJw1ADgK3UKOOHfVcVcAcJQr7ux+G+DPIx0g1KQrY025ZI+oP/AQ1Brn
 15lNee4Ucqu69e2p87I2srUWETz+JGiGUYyTZQ1IAclnJT8B0ytVA1XPTzL5oSpgzRVP93vTgwe
 vl3bazeae3YUsKIHlnJR/zd4DfOHNi2/5FnWxbuBCbEfXr897HAxpIvgyQ8N/4G71JdfRfFLjpM
 Zku3JUwoOlne7ZqsYbhl6qmXrNQqQNYZR7OfPeNQ9EkUk/yhGcZUpeKp9MKBNZEOh9w+Tkcp8rG
 5cU/EZLPTfbkc9kTg5KPLeR7KmAOO2k535uKpEUpaDEo4jzsFHIY7xTAChMZyxtwEiOqBsw4k88
 CmFGGiPeOlYI3D6sMMTMf1KotaysCjPNWBcI/ET8xQZa5wUzjmi1iKO5bO7XKARXJwGuzZYa83g
 1wDxflxmr3/LwcwgNA/Z1u1FGo0Wzq2tCjEemHi6d5MmficbAfQ5GTtWoGKux4d+JRPMTV02DSk
 9r/EppqBD+FMFbbOXegmncbDgc79Su9+WT8G2oYVnrhxQE4yvyv6dBgvqgZOaYHNJW6xXtp0WXT
 8lFMYFDwoNv6f1LPiC1SUb3Oyjp6jofJffveveVtunLoWgkCT9If6q/UuxoI5w96qwccVx91I/i
 dXy7wMv5GwalrVb3t5U4u4g==
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

Note that the 480MHz PHY clock provider registration is moved after the
port initialization loop as the clock operations may access the port after
this change. Additionally the old behaviour is used for single port
devices, that have their port disabled and thus port_cfg == NULL.

Backporting this is not trivial as the change relies on prior cleanups.
Considering system suspend/resume on RK3588 never worked on upstream and
there are more issues from preventing it (especially on older kernels),
this is not marked for stable backporting.

Fixes: 3a7db8e9edef ("phy: phy-rockchip-inno-usb2: add rk3588 support")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 30 +++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 99416f6ba1c4..3ee058f7645e 100644
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
@@ -437,10 +452,7 @@ rockchip_usb2phy_clk480m_register(struct rockchip_usb2phy *rphy)
 
 	/* acquire a clk reference for internal power_on()/power_off() use */
 	rphy->clk480m = devm_clk_hw_get_clk(rphy->dev, &rphy->clk480m_hw, NULL);
-	if (IS_ERR(rphy->clk480m))
-		return PTR_ERR(rphy->clk480m);
-
-	return devm_of_clk_add_hw_provider(rphy->dev, of_clk_hw_simple_get, &rphy->clk480m_hw);
+	return PTR_ERR_OR_ZERO(rphy->clk480m);
 }
 
 static int rockchip_usb2phy_extcon_register(struct rockchip_usb2phy *rphy)
@@ -545,7 +557,8 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	rockchip_usb2phy_set_suspend(rphy, rport, false);
+	if (!rockchip_usb2phy_clk_manages_suspend(rphy))
+		rockchip_usb2phy_set_suspend(rphy, rport, false);
 
 	rport->suspended = false;
 	return 0;
@@ -561,7 +574,8 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	if (rport->suspended)
 		return 0;
 
-	rockchip_usb2phy_set_suspend(rphy, rport, true);
+	if (!rockchip_usb2phy_clk_manages_suspend(rphy))
+		rockchip_usb2phy_set_suspend(rphy, rport, true);
 
 	rport->suspended = true;
 	clk_disable_unprepare(rphy->clk480m);
@@ -1407,6 +1421,10 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = devm_of_clk_add_hw_provider(rphy->dev, of_clk_hw_simple_get, &rphy->clk480m_hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add 480m output clock provider\n");
+
 	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
 	if (rphy->irq > 0) {

-- 
2.53.0

