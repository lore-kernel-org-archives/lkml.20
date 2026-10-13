Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC084BF924;
	Tue, 13 Oct 2026 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884761; cv=none; b=OhowXPehtJ0xUYfKNbV7FWjWp0AXHe52S8XIRO1YYUEdaJfPkFhOkXMpCozAN6p/Da70DFuduTnSn7TcDfL/3An1cD+CJHNQmfDCZrXCf5fhaDjirOfgcNFJcqCUgQNEXpUdAeBIrGXGQSl0YXomkCHDVridTXD3dJ7tAukuw0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884761; c=relaxed/simple;
	bh=7A1DJTfO+rtUCxthfPzK6qSztuLb5G+B7HY+Z9H20MY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Buoq40KKV/gY+90GmsmL4abs8/GbNaHRwMpmWWRoLkWK6h9BTK6OlKKUvRrErmivxCA3Bgwqutbm/g3UxSoFjfR/loBcCEQ8566VDUrBPKbWM4tSsyR6uJ1yzWArLhiUD4TSxVsFPrjA8L/zrEcBITphVFaUdklwTmGPSpUu46c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=vKYdBSIq; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="vKYdBSIq"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791884745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fyQIUlduan4uj3HkUskv3/VOAOYZ+LxCMRN6JoUgPXQ=;
	b=vKYdBSIqZkoUmDWhGpQ8grXi6ItjLTgwjdgupVOy9BkERBHnF4Ma7kzIztO+uSfCuJslK6
	ao29VaR7AMRYkbwr94yudXi+PKnKZpkCxf5p4o27dPLOrNAhI3Bj5kINOIXuSDq87FOA03
	MIsS5R7gmCDwRE1bpBcZuyf9DTQH8C4NADs3qdNeGeaVWYy2/F42FwYNXTiiY4iQvPUjDj
	vhiuca5/sEJqI0gYNgO1pS3EmLRRl36Ui1niSf1WBeWsu0T2aBnkppYeBCGC5AyCLd+a4t
	VPbM87S51zexDk6jKtIUOg2HCwSqtCsOJYYurnLPQBVc4lj+RwJ5SGb3WikPAA==
Date: Tue, 13 Oct 2026 11:44:53 +0200
Subject: [PATCH 8/8] arm64: dts: imx93-kontron: Fix GPIO labels according
 to OSM spec
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v1-8-94f09ec520ef@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=3515;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=e6m08tkTvA4gg72Au5Zi0RTkxyfrjwIcFur6slBKafI=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIevs36NL79lWpRRKqHy7tSQzOUTw91uPIpOcuzG2U2foM
 Yp+TF/bUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMBHnCkaGU09rZrzy/DwhTUA4
 qzWztPRy001tBc3oaCOBOeyJK45MZmT4dtqemYVhVW70S4lpj1au7DrX9+5SQVVSQM2d6xteWmo
 wAwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The OSM specification provides generic names for all pads. Fix the
GPIO labels to use the correct pad names in order to align the
labels with the spec and with other OSM module devicetrees.

Fixes: 2b52fd6035b7 ("arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    | 29 ++++++++++++++--------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index 850a92dd9b9ba..c104f42a825b9 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -51,8 +51,8 @@ &gpio1 {
 	pinctrl-0 = <&pinctrl_gpio1>;
 	gpio-line-names = "", "", "I2C_A_SCL", "I2C_A_SDA",
 			  "UART_CON_RX", "UART_CON_TX", "UART_C_RX", "UART_C_TX",
-			  "CAN_A_TX", "CAN_A_RX", "GPIO_A_0", "SPI_A_CS0",
-			  "SPI_A_SDI", "SPI_A_SCK","SPI_A_SDO";
+			  "CAN_A_TX", "CAN_A_RX", "GPIO_A_0", "SPI_A_CS0#",
+			  "SPI_A_SDI_(IO0)", "SPI_A_SCK", "SPI_A_SDO_(IO1)";
 };
 
 &gpio2 {
@@ -61,7 +61,7 @@ &gpio2 {
 	gpio-line-names = "I2C_B_SDA", "I2C_B_SCL", "GPIO_B_1", "GPIO_A_2",
 			  "UART_B_TX", "UART_B_RX", "UART_B_CTS", "UART_B_RTS",
 			  "UART_A_TX", "UART_A_RX", "UART_A_CTS", "UART_A_RTS",
-			  "SPI_B_CS0", "SPI_B_SDI", "SPI_B_SDO", "SPI_B_SCK",
+			  "SPI_B_CS0#", "SPI_B_SDI", "SPI_B_SDO", "SPI_B_SCK",
 			  "I2S_BITCLK", "I2S_MCLK", "GPIO_A_1", "I2S_A_DATA_OUT",
 			  "I2S_A_DATA_IN", "PWM_2", "GPIO_A_3", "PWM_1",
 			  "PWM_0", "CAN_B_TX", "I2S_LRCLK", "CAN_B_RX", "GPIO_A_4",
@@ -71,7 +71,7 @@ &gpio2 {
 &gpio3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio3>;
-	gpio-line-names = "SDIO_A_CD", "SDIO_A_CLK", "SDIO_A_CMD", "SDIO_A_D0",
+	gpio-line-names = "SDIO_A_CD#", "SDIO_A_CLK", "SDIO_A_CMD", "SDIO_A_D0",
 			  "SDIO_A_D1", "SDIO_A_D2", "SDIO_A_D3", "SDIO_A_PWR_EN",
 			  "", "", "", "",
 			  "", "", "", "",
@@ -83,13 +83,20 @@ &gpio3 {
 &gpio4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio4>;
-	gpio-line-names = "ETH_B_MDC", "ETH_B_MDIO", "ETH_B_TXD3", "ETH_B_TXD2",
-			  "ETH_B_TXD1", "ETH_B_TXD0", "ETH_B_TX_EN", "ETH_B_TX_CLK",
-			  "ETH_B_RX_CTL", "ETH_B_RX_CLK", "ETH_B_RXD0", "ETH_B_RXD1",
-			  "ETH_B_RXD2", "ETH_B_RXD3", "ETH_MDC", "ETH_MDIO",
-			  "ETH_A_TXD3", "ETH_A_TXD2", "ETH_A_TXD1", "ETH_A_TXD0",
-			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "ETH_A_RX_CTL", "ETH_A_RX_CLK",
-			  "ETH_A_RXD0", "ETH_A_RXD1", "ETH_A_RXD2", "ETH_A_RXD3",
+	gpio-line-names = "ETH_B_MDC", "ETH_B_MDIO",
+			  "ETH_B_(S)(R)(G)MII_TXD3", "ETH_B_(S)(R)(G)MII_TXD2",
+			  "ETH_B_(S)(R)(G)MII_TXD1", "ETH_B_(S)(R)(G)MII_TXD0",
+			  "ETH_B_(R)(G)MII_TX_EN(_ER)", "ETH_B_(R)(G)MII_TX_CLK",
+			  "ETH_B_(R)(G)MII_RX_DV(_ER)", "ETH_B_(R)(G)MII_RX_CLK",
+			  "ETH_B_(S)(R)(G)MII_RXD0", "ETH_B_(S)(R)(G)MII_RXD1",
+			  "ETH_B_(R)(G)MII_RXD2", "ETH_B_(R)(G)MII_RXD3",
+			  "ETH_MDC", "ETH_MDIO",
+			  "ETH_A_(S)(R)(G)MII_TXD3", "ETH_A_(S)(R)(G)MII_TXD2",
+			  "ETH_A_(S)(R)(G)MII_TXD1", "ETH_A_(S)(R)(G)MII_TXD0",
+			  "ETH_A_(R)(G)MII_TX_EN(_ER)", "ETH_A_(R)(G)MII_TX_CLK",
+			  "ETH_A_(R)(G)MII_RX_DV(_ER)", "ETH_A_(R)(G)MII_RX_CLK",
+			  "ETH_A_(S)(R)(G)MII_RXD0", "ETH_A_(S)(R)(G)MII_RXD1",
+			  "ETH_A_(R)(G)MII_RXD2", "ETH_A_(R)(G)MII_RXD3",
 			  "GPIO_B_0", "GPIO_B_2";
 };
 

-- 
2.55.0

