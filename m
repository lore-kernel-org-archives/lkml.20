Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794906286;
	b=lVovMPb5FIEk6L7L5pDhSHQkxJFRU9vIlXliBGdHf3Rtm8BtpNnVEMjT4DTtTuFdJyrB
	 z3Ctiz/LL0FbVJyYt6FuM5uPjtukl1Gy4nQgy5kiFRyeOYIYrn6Z0YhAmd1zql0jYDn4c
	 hrz1Xs77PUxlMYbCUBv5NZVRuFs36Cb6KkdRHbIG3lEg3qynCSvBjfXIgrnJH7vfWZKJ6
	 YgjcuuNB75sh1aHEdCmZS5NHxEhNF/Ywt03fSRYvFFYDcHmcNRcaTEwuJlyXJ/zDLXM2p
	 aMGvpIi6Njg+NqZZs5E8FWYvbdnYlsEJ801o9iYmmFNz+wXZAKbHF2Lp2l/1ASEgCDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906286;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rpGdPUaYvdxV8SwlB9eFEWGNDR50djcdHcgGh/O/aFE=;
	b=bF72VBRwJxUMln6uXPiFReXXrYzcd+DKpwyO70qpodonwsgZSjvPGC5IWN44k07Zy6EK
	 hq1mvkbcLNmhz70zguzM6Eoc5T+78HwWgj8l7Cu4RfwJTq0kO3hlbdoIAG+5nQuVyoYpw
	 CdS+Pd6PXlkDqMSB8W7NJOBWVlPG80jDW2AkWn/d58BiMY5N/o+YZUgXibNa4zg3FPMDX
	 OtWkDcnrFshYal9rAR0W+kzHVyoTJfvI/FMP1M+xctKlDzh6aEMiKis/e+MuqEJf5QTib
	 xAhDFa5TmeUSxyHnv8p/+M3ICzClP4Lmk+Zul5tSUoxlpzXtCU2u51QH3IlTN8AAJTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCOnXrdX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8C0606A337;
	Tue, 17 Nov 2026 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCOnXrdX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794906286;
	b=a6gEl7dp6Ko1252OI7zeql2T+jS2QIV53nELOoKtgxnEXwSGD6ljv5pNxa0pQpGpcgLA
	 NLQBkqThnxQPUrdPBxo6BMqGDXbAd8pv8pwnXBeKVqwT/2wkXxkuOKCxU/AX+Uk54c76a
	 mMMmqPPTwBeXmaEAJTcS42Hx+GZ6DRbHCw0MpzV4eHfXcU6b6/V3pszePZ7UVW1agTEDA
	 c6NH3/XuuKQzFw+2GOOXg5mH+/jSv8gO1lmWHlWHhIljB4whACe1fTRZh13SxqoYsiN/n
	 G+4J2+GTd0CltXjPBV0w/HyWcgYx2Yh8hMOm3JR3mwuDDOExhNebL1a//HNLLdJb/mQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794906286;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rpGdPUaYvdxV8SwlB9eFEWGNDR50djcdHcgGh/O/aFE=;
	b=POnSJnI5fhv6NihDdxidPYvm+KOnCHXTuBf7qoUF1RqlR0PfGMoDyKeBxSxKMMq+jejj
	 cJHMfjX2fkTa5YDWT+pnIsjqtEI0GzAEW+drlucqTwyUetSdIgdblLL0ohStuYYQZos8b
	 xekuti0qdvYQS8gA3rmo+AFQBpV4ByfrlDxnJjpHJKx1h0V9J70R4DiPxAi+1EDvEJw77
	 vcTi+fE3iiCvwGgYsqwi32XzjLSEhoVNSXHchHysQXYmMG6JpOcWj7PFhEMLTbtX7Xgep
	 DKMb7zn5Gb5kAk9MVEZKBlHbq3cevBn1Btahy4oxg0If3qsyLI1vOQBX8Ma0rrTcbLQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0288A1F000C7;
	Tue, 17 Nov 2026 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906286;
	bh=rpGdPUaYvdxV8SwlB9eFEWGNDR50djcdHcgGh/O/aFE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fCOnXrdXgpOpJHDf5RNfSeWn1x/UgNBmgwOuSWpihr/Nffd7KYl4VnIorRrRxMwyx
	 7yNPQDFvqztUatjDVKxeNKUYmH7tFSMNr4QzaDN4aUq+gRs1RQp0QRWdjHPzaKQcl/
	 I2r4kBMAirRBl8X69iR5a8wuErGDb8SXsMIVpnPiqLngfMBhoF7VIyI0Dr9AhCsqYw
	 CdRKRI0F1g5sKvCR6hI6Nj48yVtBG7SwgHlyUW8f7Sw/DY/0JnNzTZu5LOW7cbjY1K
	 8bmOjQaf8McVJWpClwkDmqmsx49vhwCcqp8g0kMQcV83eIrPK9J34XIhaPAO9l+C02
	 Db26TSj+SxoNg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 870894A76B;
	Tue, 17 Nov 2026 09:04:44 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Tue, 17 Nov 2026 17:04:36 +0800
Subject: [PATCH net-next v4 2/2] net: stmmac: dwmac-rk: Add RK3572 support
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
Message-Id: <20261117-add-board-ok3572-c-net-v4-2-4e9da569395a@qq.com>
References: <20261117-add-board-ok3572-c-net-v4-0-4e9da569395a@qq.com>
In-Reply-To: <20261117-add-board-ok3572-c-net-v4-0-4e9da569395a@qq.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Wu <david.wu@rock-chips.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Cunhao Lu <1579567540@qq.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794906282; l=4926;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=PHpqZ+GOqfRjSMvMapiQiGM+AGA3jokwR7gl+Dnd1WQ=;
 b=dMpRZYGKOHZMR8D/GWCAP254JIBi6CDvFT1/dyMPXpXufhCMd4T9tTj8sw6mQWFYEF8ox4aoU
 lU13YKm+BqjCqUb0w5YhgXZBR41Dn0I3tGBxPhFcLKLcPP+BtTx/xbc
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
Reply-To: 1579567540@qq.com
Content-Transfer-Encoding: 7bit

From: Cunhao Lu <1579567540@qq.com>

The RK3572 has two GMAC controllers with separate mode and clock control
registers in the PHP and NVM0 GRFs. RGMII delay lines are configured
through the IOC.

Add the register layout and delay callback for both controllers so the
Rockchip glue driver can configure their RGMII and RMII interfaces and
select the appropriate clocks for each link speed. Skip parsing the
deprecated tx_delay and rx_delay properties for RK3572.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
Changes in v4:
- Skip legacy delay properties and disable MAC RGMII delays on RK3572.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 94 ++++++++++++++++++++------
 1 file changed, 75 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index a37df5767d84..95889cbc4c39 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -900,6 +900,58 @@ static const struct rk_gmac_ops rk3568_ops = {
 	},
 };
 
+#define RK3572_VCCIO0_3_VO_IOC_CON1		0x10608
+#define RK3572_VCCIO1_2_4_VI_IOC_CON1		0x12604
+#define RK3572_VCCIO5_6_IOC_MISC0		0x14630
+#define RK3572_PHP_GRF_GMAC0_CON		0x0070
+#define RK3572_NVM0_GRF_GMAC1_CON		0x0020
+
+static int rk3572_init(struct rk_priv_data *bsp_priv)
+{
+	switch (bsp_priv->id) {
+	case 0:
+		bsp_priv->gmac_grf_reg = RK3572_PHP_GRF_GMAC0_CON;
+		break;
+	case 1:
+		bsp_priv->gmac_grf_reg = RK3572_NVM0_GRF_GMAC1_CON;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	bsp_priv->clock_grf_reg = bsp_priv->gmac_grf_reg;
+	return 0;
+}
+
+static void rk3572_set_to_rgmii(struct rk_priv_data *bsp_priv,
+				int __always_unused tx_delay,
+				int __always_unused rx_delay)
+{
+	u32 val = GRF_CLR_BIT(15) | GRF_CLR_BIT(7);
+
+	if (bsp_priv->id == 1) {
+		regmap_write(bsp_priv->php_grf, RK3572_VCCIO0_3_VO_IOC_CON1, val);
+		regmap_write(bsp_priv->php_grf, RK3572_VCCIO5_6_IOC_MISC0, val);
+	} else {
+		regmap_write(bsp_priv->php_grf, RK3572_VCCIO1_2_4_VI_IOC_CON1, val);
+	}
+}
+
+static const struct rk_gmac_ops rk3572_ops = {
+	.init = rk3572_init,
+	.set_to_rgmii = rk3572_set_to_rgmii,
+	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
+	.gmac_rmii_mode_mask = BIT_U16(3),
+	.clock.io_clksel_io_mask = BIT_U16(7),
+	.clock.gmii_clk_sel_mask = GENMASK_U16(6, 5),
+	.clock.rmii_clk_sel_mask = BIT_U16(5),
+	.clock.rmii_gate_en_mask = BIT_U16(4),
+	.supports_rmii = true,
+	.php_grf_required = true,
+	.regs_valid = true,
+	.regs = { 0x29d20000, 0x2a040000, 0 },
+};
+
 /* VCCIO0_1_3_IOC */
 #define RK3576_VCCIO0_1_3_IOC_CON2		0X6408
 #define RK3576_VCCIO0_1_3_IOC_CON3		0X640c
@@ -1331,26 +1383,29 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 			bsp_priv->clock_input = false;
 	}
 
-	ret = of_property_read_u32(dev->of_node, "tx_delay", &value);
-	if (ret) {
-		bsp_priv->tx_delay = 0x30;
-		dev_err(dev, "Can not read property: tx_delay.");
-		dev_err(dev, "set tx_delay to 0x%x\n",
-			bsp_priv->tx_delay);
-	} else {
-		dev_info(dev, "TX delay(0x%x).\n", value);
-		bsp_priv->tx_delay = value;
-	}
+	/* Skip parsing legacy tx_delay and rx_delay properties on new SoCs. */
+	if (ops != &rk3572_ops) {
+		ret = of_property_read_u32(dev->of_node, "tx_delay", &value);
+		if (ret) {
+			bsp_priv->tx_delay = 0x30;
+			dev_err(dev, "Can not read property: tx_delay.");
+			dev_err(dev, "set tx_delay to 0x%x\n",
+				bsp_priv->tx_delay);
+		} else {
+			dev_info(dev, "TX delay(0x%x).\n", value);
+			bsp_priv->tx_delay = value;
+		}
 
-	ret = of_property_read_u32(dev->of_node, "rx_delay", &value);
-	if (ret) {
-		bsp_priv->rx_delay = 0x10;
-		dev_err(dev, "Can not read property: rx_delay.");
-		dev_err(dev, "set rx_delay to 0x%x\n",
-			bsp_priv->rx_delay);
-	} else {
-		dev_info(dev, "RX delay(0x%x).\n", value);
-		bsp_priv->rx_delay = value;
+		ret = of_property_read_u32(dev->of_node, "rx_delay", &value);
+		if (ret) {
+			bsp_priv->rx_delay = 0x10;
+			dev_err(dev, "Can not read property: rx_delay.");
+			dev_err(dev, "set rx_delay to 0x%x\n",
+				bsp_priv->rx_delay);
+		} else {
+			dev_info(dev, "RX delay(0x%x).\n", value);
+			bsp_priv->rx_delay = value;
+		}
 	}
 
 	bsp_priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
@@ -1720,6 +1775,7 @@ static const struct of_device_id rk_gmac_dwmac_match[] = {
 	{ .compatible = "rockchip,rk3506-gmac", .data = &rk3506_ops },
 	{ .compatible = "rockchip,rk3528-gmac", .data = &rk3528_ops },
 	{ .compatible = "rockchip,rk3568-gmac", .data = &rk3568_ops },
+	{ .compatible = "rockchip,rk3572-gmac", .data = &rk3572_ops },
 	{ .compatible = "rockchip,rk3576-gmac", .data = &rk3576_ops },
 	{ .compatible = "rockchip,rk3588-gmac", .data = &rk3588_ops },
 	{ .compatible = "rockchip,rv1108-gmac", .data = &rv1108_ops },

-- 
2.34.1


