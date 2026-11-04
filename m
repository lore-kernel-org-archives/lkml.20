Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833688;
	b=2i/nWIbd7lvHc0kugwqnj9w1GLy4yuk5aqOicWlLCaV8CiDuyHlr8+TwDmpC6ESdrRiM
	 kaQGinEwhiL3afjyz7cm1ettpIoU8MY3vfTzX/8ZDqpSkQShVu7hdZustIebVUtx2nSgy
	 hrz2Q4OvfAnLHdCDSif7I+il/ZBvIa9WxxX7Y2y3lP+whE3thauNOweKcdsbTTyqpt8Cf
	 KSj2nmtS6lo8asphwdiST009DxDa/P4ueDuI2rE/yrkcRa4I2orhebBCGaq4MdZMPCM0c
	 0khmFL0DGvatwQqn11fV3O/uvirnJzo465whBUFI/HVJsqjDMgEeHvahgw82bJvPDLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833688;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qfjNaaONMVdslcm9K32Igu96RORAIzBg3CTRJPaZu6Q=;
	b=YTs6qw9AptTJhjDmPwT/wR1zwvhOcR4J7koH+S8GWNpcpUmmDs8qTa6TSL4MYIj7ltY1
	 MyGgagOiRnAIF9OcNMHjQ0xI/TNhR2xOYtqO7WJmZxDURibr/g4icrW1+i/NnwjcREPG9
	 0oP31pPT+g/pzmJirLw72wg0vQbYcXFVXt75UqAGCBBQwSdj8NO+JlZxdaa5GjQU6oTIc
	 pf5PCltN2aEUdmcJHdTZRwe+gjnOG0tOP39kx6JTG462nVUL9/xhV7q4MrK/uetG0+mnA
	 7dF3gE/gTEAZ2W4Z7WRqFQ/0CjXGLxfHE5R7iFW091PQPyGuYActNqcwRBuYp5a+XMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bTJNqt9t;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C384606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C384606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bTJNqt9t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793833685;
	bh=R9T9QAKc4ksxWAIHU2ATuxJGU0UUeyNedli7ypE2MQw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bTJNqt9tY03wVaOf38Irh1yAUaaiwQFApSFEeYAHVqUPh7yR81chcV6eJ5zuZoVec
	 +he4RCon76sLEzqJgtZy1GukF4mPO+OZlwwZVrr0WwtlJtPbVqxYaqrTqIpsALEvx/
	 5FbA3nzOwYeQ9YifNXHFUtEMtcr3SDhY81qgfHih4cBqwlxDe0qH/UqjcO3lh1cUQ9
	 jjWQs/kMM189FvtqaAzPH8P/wSlky9OiadjM6I/lcgEIoDkGQqbatpKx9RYd+y5uFj
	 GojecWaDJjF/7RU/7V6ws85wIES+5sjNa3gOFq3wkb9XYaS/cllJWhj7J5O7W8U7Am
	 pw7nJGwpCS5bQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 990C017E0D48;
	Thu, 05 Nov 2026 00:08:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5D842480031; Thu, 05 Nov 2026 00:08:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 00:08:00 +0100
Subject: [PATCH v3 4/4] phy: rockchip: inno-usb2: move suspend handling
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
Message-Id: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-4-b20608c08b94@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4038;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=R9T9QAKc4ksxWAIHU2ATuxJGU0UUeyNedli7ypE2MQw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrutXnwMDLPqdfC42KSNtrX7rkfA+9EdtVb
 gJ/BRuek1n6X4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq67rVAAoJENju1/PI
 O/qaTogP/3iAA020/fwpypxE1nMZRyCbVGOI/+NxLJplRMniJ1fX9ypQU+nDvpd7CfeX6v9VO49
 q8LsjUasqTd8ogNhBI3oJuLPrqS0KlhOMKL/zNIGbvLP9O9AF92EYiShLZWy61xmZAdXH9J85NX
 hn9X0sbhXXKX+3eB6yET1dVP31BC9wE1rxok/CAPORhybRuVN96EG5pNfa4I4cdk7Thbjx7L5tI
 cw/7U6kuoS9xuGE1HVpjVg6Mhlmo9izz9ZSu5wBFdebA0jaY+DpWYqQocmazy57W2czi8UWvNXr
 JXRO4SF8DaI0H0WNWrjv024BQewSX5K0h9TXuqYebeO5zGcJjqVL36WxiglbBH3+11IgMVMeR6u
 kdDdDBS5lxgzu5TiR5IU7zlHCpwYKciFoUhxQa1iFLTrxgEfPoykjKG90teT/3e+NNazriQtSMr
 AzVH+wam4aV9Az+41nRQE59O6+JmGjRVVdBWIvj1NtVujEgwDGYMJAznUS78YfLIPN5233GKXlX
 tPhngMUn3DHT+WfX3YONN6/05zg/AdrJglbyjMSaDiJB4rcHX0aP9gz5u8GP+4omQYjcU2E7y39
 o+TepsXPNI0eJQRZzgrf9keH0z8ice99xqKVSFFVfI4ZtM3NUpOmpkHVOljGxgs9C+3PWiborHO
 rDtjwtHg9umGdvGuAR6MwBw==
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
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 38 ++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 2919c2e11968..b2633b83f7ab 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -363,10 +363,15 @@ static int rockchip_usb2phy_set_suspend(struct rockchip_usb2phy *rphy,
 
 static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 {
+	struct rockchip_usb2phy *rphy =
+		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
 	const struct usb2phy_reg *clkout_ctl;
 	struct regmap *base;
 	int ret;
 
+	if (rphy->phy_cfg->num_ports == 1 && !rphy->ports[0].port_cfg)
+		return -EAGAIN;
+
 	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
 
 	/* turn on 480m clk output if it is off */
@@ -379,16 +384,31 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 		usleep_range(1200, 1300);
 	}
 
+	if (rphy->phy_cfg->num_ports == 1) {
+		ret = rockchip_usb2phy_set_suspend(rphy, &rphy->ports[0], false);
+		if (ret)
+			goto disable_clkout;
+	}
+
 	return 0;
+
+disable_clkout:
+	property_enable(base, clkout_ctl, false);
+	return ret;
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
@@ -632,10 +652,12 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
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
@@ -653,9 +675,11 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
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

