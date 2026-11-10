Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331183;
	b=BubFaBCBiLDwWMsOQjeelCHtTNZnx62tlG+w/iIqvE6JM2ACi4jh6JpgM/UuKl7AyFav
	 23L944QpeKzOlQYrPrJylFHBAmQ8Hibm41UsT0BY1wpQ3yoGF8rTycg7VrghtRdi5/B68
	 wFuz2mYecHknobW2zUtgmHZpLRUC9OlX6sex2lwMEy0VGrEH+Vs6pF9Egj4Vgy+PCMZC+
	 XOBK+nCsrp3WuWBA6alMziC6GIK36UaTvuAllpz2WIWfkNF/O7mG5hEc9173HeWMIVDmy
	 J7Ei3YzQi/ADL81fJpQS2ga4Jjvyb0QKS7Vi7RQR9X3JVAwolmwB86xY/ndEJzdX1yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331183;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=FJppWOnyTt9DZtc+FHPiQQxS3jOtEqZJrdgIOgwpmJ0=;
	b=OYhXMJMbI73C+84BF2FEvADNTaFgIv4enueGivXr2Kpy6zmcVZiJtxwpZVimpfRJlaRK
	 TjYVp437SeXKmEnelTX4XmJ5mdqRzWwchRJmyIFRkg2hMScpKZIW2Jz/jwySASTFvqyqj
	 oIKcit/nIqhwYAql6mimOJVnrdV3IPRp/xIXRD9fh4uZlrhD/HfxdbFatoKrqPTyuOvjm
	 XNkif9aTtAeMkTgyk0cBF3XHWiytNRPUrY5HvnpakXc/ZalbdxWsHGU9EdGInNP3p7VyD
	 tFtek5M+0gKbGUoA73eEI/DlHwedQhIQfA4yOjkfyypE6VnUZwEWZ41k47YnN1yN4DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=IAL2bxxV;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1D960A2635
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E1D960A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=IAL2bxxV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794331179;
	bh=J10wxRz8jVsNiG2URQvahFtGbMuwglI13tTx3pFQivE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IAL2bxxVciIcQm/N7ZPYxeFGocvptpdexQ67ujXkoibAKwYEJTRQLL0Cff3JOJOOG
	 FOY7mC6sVwvCAqpv/2xRGxKKwzhiSVJUAcPVZmMFUcND52aLX9MkzfmO2rB0faWIeD
	 /QnXH8kecb0lMaMXf2EA7HBh52neSvKEmeHFK5iQWKU+jHDP1wZmQ6PQLRAbFV+1V7
	 6XDVsFx3ybB3ITq2ZGDqMcAhCyJ3PJLExqMLrpSv0VPyS1w8z5BEjpKedcqQrB/iJO
	 DVNX3e3TKiVDWbIXattR/tPDz7cKgyjP5OIplps+lQjVBS0hvIkiGx6EWAOe/4cA6E
	 PKBei2HQk5HTA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4B8417E1054;
	Tue, 10 Nov 2026 18:19:39 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 11F53480038; Tue, 10 Nov 2026 18:19:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 18:19:18 +0100
Subject: [PATCH v5 5/6] phy: rockchip: inno-usb2: move suspend handling
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
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-5-d2e24582ab22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=J10wxRz8jVsNiG2URQvahFtGbMuwglI13tTx3pFQivE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrzUiornpGl3xGPeN/rN6wOXg51cdGxdbdN5
 2NVQq+GDGxk5okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq81IqAAoJENju1/PI
 O/qaU4EP/A0UpAXKloA2+nYEnHYjRZQrUOV/HS1dUABhV9U1yitTWEFv9vdinm8vsY3ToFam7wW
 qiX8CCeGv53JQuFdRJVbdjID9ghHbZ6u4ZtqtECpT+6O1dZLiugWl3AdKSS11RCt3zBFHHavO+A
 YjO2VeqRGXA2DJf0UUvNuIImoaJN0XPsbEiBziw7jUbEsFoGan374CmMf+w61v7P/rR/za5aAlE
 uVw5cLBchTkxrXSW2AH+GyxmzokBmmV/TchsTF0sMQtJNJTb6Bw24pC5Cn6K314/2QFgbLm5nnm
 TdRRwNAoB1ciwrdZwNsFaFLcmt+MF3muX/bNlteOSK3Rl2FmZL0t6PdL0+9PzS5V1sg+OLHbcTU
 qhxVBaMZNjuuqpA+a4F13V1fUHgkZOyxXqJX0nV2/UjsOQ4zlMsku9TUtN7Qf2ioSIUJT5RI8JG
 s/W5h+yv5G/fp+HEiBhzthP0wHVs6KXsQYipTHLapUNsupwnDcI8tr9kHXAYQqCTXnc8aAqP4J9
 q7xmK5HGRZ6x4VoG798dwQdkNc4YFkI54iVeD4AxUhQoSiwgfICCg4zo+oGyuyF0VDg3dUdq35h
 H7sX7zLZD0AzNUT3vv1Q+uyCPyLfa1Cf5UYCg3zdqE5GpfBzrsioOUM0OiPh09U/+axyxWlzZ5v
 iHUuI4fUzGny9HbJ4PworAQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Move handling of the PHY suspend handling into its own dedicated
function. No functional changes intended.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 38 ++++++++++++++++-----------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 4c0feb6b20ad..99416f6ba1c4 100644
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
@@ -524,20 +545,7 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
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
@@ -553,7 +561,7 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	if (rport->suspended)
 		return 0;
 
-	property_enable(rphy->grf, &rport->port_cfg->phy_sus, true);
+	rockchip_usb2phy_set_suspend(rphy, rport, true);
 
 	rport->suspended = true;
 	clk_disable_unprepare(rphy->clk480m);

-- 
2.53.0

