Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72033389104;
	Tue, 13 Oct 2026 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892312; cv=none; b=jeUaQ4Oz7oAP6BXMeQ37UJBXfj99uV1HwaE0t5qzNkdosazVnlWBWkdX7HcxWEOWclNouKzVSpbHWQbmC15x0DXqps9eExAjZujWygtUgXPp78lhW54NftIEyWS3bGizb+96jBkQDTbz/kXn4+cPEFmvCImnJPzcLbBfjqHsabI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892312; c=relaxed/simple;
	bh=Nh3EWY6Qf3SWKHyBzyosLrzbl2u4ADCKvvfT0FTmCNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wike/NBb/0N3hWOqfxPaWUM9BDT77SV62iiWRjho+n0/DFZHqDakQ0GH/zai7g8HrymZwN/s0aFe7z+eJ8fKPsC3S6O1PCuTYnyBKVqFVne9TwIDk0NKXlPaWbnahVP8GvOVdc1IxEJkH8R0Ub51Rotn/vSaf6crg40W9v+IFRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=LbTRI2b/; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="LbTRI2b/"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791892304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BUAOO2g1S6N+IEVzTRP75gwGuHNEJ0tzC+aT31NxblU=;
	b=LbTRI2b/G0N1TC6nbovg5lKcAu9kya64pYvS7hLimCqkP8niOgs2DZvrJwbEld1stC2igi
	AHUxfbOHloi6QqPN1cq4IFzuEmGkAN6Xg1evWqb1/JYnbU98rsEQxHQNSqmBqD1oknyxQy
	fqs9GsUdSGREC0ZYP10cFT+CiadLdgnArR9Tp1piOPTAsdOBWo08GkUTzIxMo/frDndZGQ
	k3uisSYE5YOO77kVKvGZoz06kDkJgeruUZ5pXfCXXscvrVFGm3uioYMqKS+beUP6LIdexX
	mBy1iiPnWk3QRXCNPorZAweNy52oDje0NUbSFwZwzdMHfVArkNS9NpiZ7AJ2Rw==
Date: Tue, 13 Oct 2026 13:51:08 +0200
Subject: [PATCH v2 3/9] arm64: dts: imx8mp-kontron: Fix GPIO labels
 according to OSM spec
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v2-3-d464ca652c91@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=13713;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=CVbrqOYOR/kudULUbAIkDjJqdA8G3mDUbqVWz9U+PYA=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuctB+LQ8KRnvtXfyi2qe7+venXnyUPo2JfPFesu3pF1
 21Skv2LjlIWBjEuBlkxRRYpfovXtmaxPvLHqqNg5rAygQxh4OIUgInELGBk2LF92aO7f2etlDe6
 /1aIr9p3y6JdAqekH89ijbtSa3Rego3hr8h/5Xt3H9ut+vWm/v685OyAziw/jnccLIeyU3Y/3Gi
 RyQkA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Eberhard Stoll <eberhard.stoll@kontron.de>

The OSM specification provides generic names for all pads. Fix the
GPIO labels to use the correct pad names in order to align the
labels with the spec and with other OSM module devicetrees.

Also align the labels in the BL and SMARC board devicetrees that
override the GPIO labels of the SoM.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts | 37 ++++++++------
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   | 50 +++++++++++--------
 .../boot/dts/freescale/imx8mp-kontron-smarc.dtsi   | 58 ++++++++++++----------
 3 files changed, 83 insertions(+), 62 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
index b6ffea952b69f..831bf8cfc5bd1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
@@ -127,7 +127,7 @@ &gpio2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio2>;
 	gpio-line-names = "", "", "", "", "", "", "", "", "", "", "", "",
-			  "SDIO_A_CD", "SDIO_A_CLK", "SDIO_A_CMD", "SDIO_A_D0",
+			  "SDIO_A_CD#", "SDIO_A_CLK", "SDIO_A_CMD", "SDIO_A_D0",
 			  "SDIO_A_D1", "SDIO_A_D2", "SDIO_A_D3", "CAN_ADDR2",
 			  "CAN_ADDR3";
 };
@@ -139,13 +139,13 @@ &gpio2 {
  *   GPIO_B_1      -> IO_EXP_RST
  */
 &gpio3 {
-	gpio-line-names = "PCIE_WAKE", "TFT_STBY", "PCIE_A_PERST", "SDIO_B_D5",
+	gpio-line-names = "PCIe_WAKE#", "TFT_STBY", "PCIe_A_PERST#", "SDIO_B_D5",
 			  "SDIO_B_D6", "SDIO_B_D7", "UART_B_RX", "I2S_LRCLK",
 			  "UART_B_RTS", "UART_B_CTS", "SDIO_B_D0", "SDIO_B_D1",
 			  "SDIO_B_D2", "SDIO_B_D3", "SDIO_B_WP", "SDIO_B_D4",
-			  "PCIE_SM_ALERT", "SDIO_B_CLK", "SDIO_B_CMD", "IO_EXP_INT",
-			  "IO_EXP_RST", "", "BOOT_SEL0", "BOOT_SEL1",
-			  "", "", "SDIO_B_CD", "SDIO_B_PWR_EN",
+			  "PCIe_SM_ALERT#", "SDIO_B_CLK", "SDIO_B_CMD", "IO_EXP_INT",
+			  "IO_EXP_RST", "", "BOOT_SEL0#", "BOOT_SEL1#",
+			  "", "", "SDIO_B_CD#", "SDIO_B_PWR_EN",
 			  "HDMI_CEC", "HDMI_HPD";
 };
 
@@ -157,10 +157,14 @@ &gpio3 {
  */
 &gpio4 {
 	gpio-line-names = "", "", "", "",
-			  "ETH_A_MDC", "ETH_A_MDIO", "ETH_A_RXD0", "ETH_A_RXD1",
-			  "ETH_A_RXD2", "ETH_A_RXD3", "ETH_A_RX_DV", "ETH_A_RX_CLK",
-			  "ETH_A_TXD0", "ETH_A_TXD1", "ETH_A_TXD2", "ETH_A_TXD3",
-			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "CSI_ENABLE", "",
+			  "ETH_MDC", "ETH_MDIO",
+			  "ETH_A_(S)(R)(G)MII_RXD0", "ETH_A_(S)(R)(G)MII_RXD1",
+			  "ETH_A_(R)(G)MII_RXD2", "ETH_A_(R)(G)MII_RXD3",
+			  "ETH_A_(R)(G)MII_RX_DV(_ER)", "ETH_A_(R)(G)MII_RX_CLK",
+			  "ETH_A_(S)(R)(G)MII_TXD0", "ETH_A_(S)(R)(G)MII_TXD1",
+			  "ETH_A_(S)(R)(G)MII_TXD2", "ETH_A_(S)(R)(G)MII_TXD3",
+			  "ETH_A_(R)(G)MII_TX_EN(_ER)", "ETH_A_(R)(G)MII_TX_CLK",
+			  "CSI_ENABLE", "",
 			  "USB_HUB_RST", "TFT_RESET", "CAN_A_TX", "UART_A_CTS",
 			  "UART_A_RTS", "CAN_A_RX", "CAN_B_TX", "CAN_B_RX",
 			  "I2S_B_DATA_IN", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
@@ -168,20 +172,21 @@ &gpio4 {
 
 /*
  * Rename SoM signals according to board usage:
- *   SPI_A_SDI	-> CAN_ADDR0
- *   SPI_A_SDO	-> CAN_ADDR1
+ *   SPI_A_SDI_(IO0) -> CAN_ADDR0
+ *   SPI_A_SDO_(IO1) -> CAN_ADDR1
  */
 &gpio5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio5>;
 	gpio-line-names = "I2S_BITCLK", "I2S_A_DATA_OUT", "I2S_MCLK", "VCC_PANEL_EN",
 			  "PWM_1", "PWM_0", "SPI_A_SCK", "CAN_ADDR1",
-			  "CAN_ADDR0", "SPI_A_CS0", "SPI_B_SCK", "SPI_B_SDO",
-			  "SPI_B_SDI", "SPI_B_CS0", "I2C_A_SCL", "I2C_A_SDA",
-			  "I2C_B_SCL", "I2C_B_SDA", "PCIE_SMCLK", "PCIE_SMDAT",
-			  "I2C_CAM_SCL", "I2C_CAM_SDA", "UART_A_RX", "UART_A_TX",
+			  "CAN_ADDR0", "SPI_A_CS0#", "SPI_B_SCK", "SPI_B_SDO",
+			  "SPI_B_SDI", "SPI_B_CS0#", "I2C_A_SCL", "I2C_A_SDA",
+			  "I2C_B_SCL", "I2C_B_SDA", "PCIe_SMCLK", "PCIe_SMDAT",
+			  "I2C_CAM_SCL/CSI_TX_P", "I2C_CAM_SDA/CSI_TX_N",
+			  "UART_A_RX", "UART_A_TX",
 			  "UART_C_RX", "UART_C_TX", "UART_CON_RX", "UART_CON_TX",
-			  "PCIe_CLKREQ", "UART_B_TX";
+			  "PCIe_CLKREQ#", "UART_B_TX";
 };
 
 &hdmi_pvi {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
index 3c183ab573bed..3459ee2c0eb64 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
@@ -141,16 +141,19 @@ &gpio1 {
 	gpio-line-names = "GPIO_A_0", "GPIO_A_1", "", "",
 			  "", "GPIO_A_2", "GPIO_A_3", "GPIO_A_4",
 			  "GPIO_A_5", "USB_B_EN", "USB_A_ID", "USB_B_ID",
-			  "USB_A_EN", "USB_A_OC","CAM_MCK", "USB_B_OC",
-			  "ETH_B_MDC", "ETH_B_MDIO", "ETH_B_TXD3", "ETH_B_TXD2",
-			  "ETH_B_TXD1", "ETH_B_TXD0", "ETH_B_TX_EN", "ETH_B_TX_CLK",
-			  "ETH_B_RX_DV", "ETH_B_RX_CLK", "ETH_B_RXD0", "ETH_B_RXD1",
-			  "ETH_B_RXD2", "ETH_B_RXD3";
+			  "USB_A_EN", "USB_A_OC#","CAM_MCK", "USB_B_OC#",
+			  "ETH_B_MDC", "ETH_B_MDIO",
+			  "ETH_B_(S)(R)(G)MII_TXD3", "ETH_B_(S)(R)(G)MII_TXD2",
+			  "ETH_B_(S)(R)(G)MII_TXD1", "ETH_B_(S)(R)(G)MII_TXD0",
+			  "ETH_B_(R)(G)MII_TX_EN(_ER)", "ETH_B_(R)(G)MII_TX_CLK",
+			  "ETH_B_(R)(G)MII_RX_DV(_ER)", "ETH_B_(R)(G)MII_RX_CLK",
+			  "ETH_B_(S)(R)(G)MII_RXD0", "ETH_B_(S)(R)(G)MII_RXD1",
+			  "ETH_B_(R)(G)MII_RXD2", "ETH_B_(R)(G)MII_RXD3";
 };
 
 &gpio2 {
 	gpio-line-names = "", "", "", "", "", "", "", "", "", "", "", "",
-			  "SDIO_A_CD", "SDIO_A_CLK", "SDIO_A_CMD", "SDIO_A_D0",
+			  "SDIO_A_CD#", "SDIO_A_CLK", "SDIO_A_CMD", "SDIO_A_D0",
 			  "SDIO_A_D1", "SDIO_A_D2", "SDIO_A_D3", "SDIO_A_PWR_EN",
 			  "SDIO_A_WP";
 };
@@ -158,13 +161,13 @@ &gpio2 {
 &gpio3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio3>;
-	gpio-line-names = "PCIE_WAKE", "GPIO_A_7", "PCIE_A_PERST", "SDIO_B_D5",
+	gpio-line-names = "PCIe_WAKE#", "GPIO_A_7", "PCIe_A_PERST#", "SDIO_B_D5",
 			  "SDIO_B_D6", "SDIO_B_D7", "UART_B_RX", "I2S_LRCLK",
 			  "UART_B_RTS", "UART_B_CTS", "SDIO_B_D0", "SDIO_B_D1",
 			  "SDIO_B_D2", "SDIO_B_D3", "SDIO_B_WP", "SDIO_B_D4",
-			  "PCIE_SM_ALERT", "SDIO_B_CLK", "SDIO_B_CMD", "GPIO_B_0",
-			  "GPIO_B_1", "", "BOOT_SEL0", "BOOT_SEL1",
-			  "", "", "SDIO_B_CD", "SDIO_B_PWR_EN",
+			  "PCIe_SM_ALERT#", "SDIO_B_CLK", "SDIO_B_CMD", "GPIO_B_0",
+			  "GPIO_B_1", "", "BOOT_SEL0#", "BOOT_SEL1#",
+			  "", "", "SDIO_B_CD#", "SDIO_B_PWR_EN",
 			  "HDMI_CEC", "HDMI_HPD";
 };
 
@@ -172,10 +175,14 @@ &gpio4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio4>;
 	gpio-line-names = "GPIO_B_5", "GPIO_B_6", "GPIO_B_7", "GPIO_C_0",
-			  "ETH_A_MDC", "ETH_A_MDIO", "ETH_A_RXD0", "ETH_A_RXD1",
-			  "ETH_A_RXD2", "ETH_A_RXD3", "ETH_A_RX_DV", "ETH_A_RX_CLK",
-			  "ETH_A_TXD0", "ETH_A_TXD1", "ETH_A_TXD2", "ETH_A_TXD3",
-			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "GPIO_B_3", "GPIO_B_4",
+			  "ETH_MDC", "ETH_MDIO",
+			  "ETH_A_(S)(R)(G)MII_RXD0", "ETH_A_(S)(R)(G)MII_RXD1",
+			  "ETH_A_(R)(G)MII_RXD2", "ETH_A_(R)(G)MII_RXD3",
+			  "ETH_A_(R)(G)MII_RX_DV(_ER)", "ETH_A_(R)(G)MII_RX_CLK",
+			  "ETH_A_(S)(R)(G)MII_TXD0", "ETH_A_(S)(R)(G)MII_TXD1",
+			  "ETH_A_(S)(R)(G)MII_TXD2", "ETH_A_(S)(R)(G)MII_TXD3",
+			  "ETH_A_(R)(G)MII_TX_EN(_ER)", "ETH_A_(R)(G)MII_TX_CLK",
+			  "GPIO_B_3", "GPIO_B_4",
 			  "GPIO_B_2", "GPIO_A_6", "CAN_A_TX", "UART_A_CTS",
 			  "UART_A_RTS", "CAN_A_RX", "CAN_B_TX", "CAN_B_RX",
 			  "I2S_B_DATA_IN", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
@@ -183,13 +190,14 @@ &gpio4 {
 
 &gpio5 {
 	gpio-line-names = "I2S_BITCLK", "I2S_A_DATA_OUT", "I2S_MCLK", "PWM_2",
-			  "PWM_1", "PWM_0", "SPI_A_SCK", "SPI_A_SDO",
-			  "SPI_A_SDI", "SPI_A_CS0", "SPI_B_SCK", "SPI_B_SDO",
-			  "SPI_B_SDI", "SPI_B_CS0", "I2C_A_SCL", "I2C_A_SDA",
-			  "I2C_B_SCL", "I2C_B_SDA", "PCIE_SMCLK", "PCIE_SMDAT",
-			  "I2C_CAM_SCL", "I2C_CAM_SDA", "UART_A_RX", "UART_A_TX",
+			  "PWM_1", "PWM_0", "SPI_A_SCK", "SPI_A_SDO_(IO1)",
+			  "SPI_A_SDI_(IO0)", "SPI_A_CS0#", "SPI_B_SCK", "SPI_B_SDO",
+			  "SPI_B_SDI", "SPI_B_CS0#", "I2C_A_SCL", "I2C_A_SDA",
+			  "I2C_B_SCL", "I2C_B_SDA", "PCIe_SMCLK", "PCIe_SMDAT",
+			  "I2C_CAM_SCL/CSI_TX_P", "I2C_CAM_SDA/CSI_TX_N",
+			  "UART_A_RX", "UART_A_TX",
 			  "UART_C_RX", "UART_C_TX", "UART_CON_RX", "UART_CON_TX",
-			  "PCIe_CLKREQ", "UART_B_TX";
+			  "PCIe_CLKREQ#", "UART_B_TX";
 };
 
 &i2c1 { /* OSM-S I2C_A */
@@ -623,7 +631,7 @@ pinctrl_pcie: pciegrp {
 			MX8MP_IOMUXC_UART4_RXD__PCIE_CLKREQ_B		0x19 /* PCIe_CLKREQ# */
 			MX8MP_IOMUXC_NAND_CE1_B__GPIO3_IO02		0x19 /* PCIe_A_PERST# */
 			MX8MP_IOMUXC_NAND_ALE__GPIO3_IO00		0x19 /* PCIe_WAKE# */
-			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16		0x19 /* PCIe_SM_ALERT */
+			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16		0x19 /* PCIe_SM_ALERT# */
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi
index d63c10b9b3d72..a88883e847457 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi
@@ -82,22 +82,25 @@ ethphy0: ethernet-phy@1 {
  *   GPIO_A_5 -> GPIO3
  *   USB_B_EN -> n.a.
  *   USB_B_ID -> n.a.
- *   USB_B_OC -> n.a.
+ *   USB_B_OC# -> n.a.
  */
 &gpio1 {
 	gpio-line-names = "GPIO_A_0", "GPIO_A_1", "", "",
 			  "", "GPIO0", "GPIO1", "GPIO2",
 			  "GPIO3", "", "USB_A_ID", "",
-			  "USB_A_EN", "USB_A_OC","CAM_MCK", "",
-			  "ETH_B_MDC", "ETH_B_MDIO", "ETH_B_TXD3", "ETH_B_TXD2",
-			  "ETH_B_TXD1", "ETH_B_TXD0", "ETH_B_TX_EN", "ETH_B_TX_CLK",
-			  "ETH_B_RX_DV", "ETH_B_RX_CLK", "ETH_B_RXD0", "ETH_B_RXD1",
-			  "ETH_B_RXD2", "ETH_B_RXD3";
+			  "USB_A_EN", "USB_A_OC#", "CAM_MCK", "",
+			  "ETH_B_MDC", "ETH_B_MDIO",
+			  "ETH_B_(S)(R)(G)MII_TXD3", "ETH_B_(S)(R)(G)MII_TXD2",
+			  "ETH_B_(S)(R)(G)MII_TXD1", "ETH_B_(S)(R)(G)MII_TXD0",
+			  "ETH_B_(R)(G)MII_TX_EN(_ER)", "ETH_B_(R)(G)MII_TX_CLK",
+			  "ETH_B_(R)(G)MII_RX_DV(_ER)", "ETH_B_(R)(G)MII_RX_CLK",
+			  "ETH_B_(S)(R)(G)MII_RXD0", "ETH_B_(S)(R)(G)MII_RXD1",
+			  "ETH_B_(R)(G)MII_RXD2", "ETH_B_(R)(G)MII_RXD3";
 };
 
 /*
  * Rename SoM signals according to SMARC module usage:
- *   SDIO_A_CD -> SDIO_CD
+ *   SDIO_A_CD# -> SDIO_CD
  *   SDIO_A_CLK -> SDIO_CK
  *   SDIO_A_CMD -> SDIO_CMD
  *   SDIO_A_D0 -> SDIO_D0
@@ -117,7 +120,7 @@ &gpio2 {
 /*
  * Rename SoM signals according to SMARC module usage:
  *   GPIO_A_7 -> TEST
- *   PCIE_A_PERST -> PCIE_A_RST
+ *   PCIe_A_PERST# -> PCIE_A_RST
  *   SDIO_B_D5 -> n.a.
  *   SDIO_B_D6 -> n.a.
  *   SDIO_B_D7 -> n.a.
@@ -131,20 +134,21 @@ &gpio2 {
  *   SDIO_B_D3 -> GPIO11
  *   SDIO_B_WP -> n.a.
  *   SDIO_B_D4 -> n.a.
- *   PCIE_SM_ALERT -> SMB_ALERT
+ *   PCIe_SM_ALERT# -> SMB_ALERT
  *   SDIO_B_CLK -> GPIO6
  *   SDIO_B_CMD -> GPIO7
  *   GPIO_B_0 -> LCD0_BKLT_EN
  *   GPIO_B_1 -> LCD1_BKLT_EN
- *   BOOT_SEL0 -> BOOT_SEL2
- *   SDIO_B_CD -> n.a.
+ *   BOOT_SEL0# -> BOOT_SEL2
+ *   BOOT_SEL1# -> BOOT_SEL1
+ *   SDIO_B_CD# -> n.a.
  *   SDIO_B_PWR_EN -> n.a.
  *   HDMI_CEC -> n.a.
  *   SDIO_B_PWR_EN -> n.a.
  */
 &gpio3 {
 	pinctrl-0 = <&pinctrl_gpio3>, <&pinctrl_gpio3_smarc>;
-	gpio-line-names = "PCIE_WAKE", "TEST", "PCIE_A_RST", "",
+	gpio-line-names = "PCIe_WAKE#", "TEST", "PCIE_A_RST", "",
 			  "", "", "SER2_RX", "I2S0_LRCK",
 			  "SER2_RTS", "SER2_CTS", "GPIO8", "GPIO9",
 			  "GPIO10", "GPIO11", "", "",
@@ -176,10 +180,14 @@ &gpio3 {
  */
 &gpio4 {
 	gpio-line-names = "", "", "", "LED",
-			  "ETH_A_MDC", "ETH_A_MDIO", "ETH_A_RXD0", "ETH_A_RXD1",
-			  "ETH_A_RXD2", "ETH_A_RXD3", "ETH_A_RX_DV", "ETH_A_RX_CLK",
-			  "ETH_A_TXD0", "ETH_A_TXD1", "ETH_A_TXD2", "ETH_A_TXD3",
-			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "ETH2_INT", "USB_HUB_RST",
+			  "ETH_MDC", "ETH_MDIO",
+			  "ETH_A_(S)(R)(G)MII_RXD0", "ETH_A_(S)(R)(G)MII_RXD1",
+			  "ETH_A_(R)(G)MII_RXD2", "ETH_A_(R)(G)MII_RXD3",
+			  "ETH_A_(R)(G)MII_RX_DV(_ER)", "ETH_A_(R)(G)MII_RX_CLK",
+			  "ETH_A_(S)(R)(G)MII_TXD0", "ETH_A_(S)(R)(G)MII_TXD1",
+			  "ETH_A_(S)(R)(G)MII_TXD2", "ETH_A_(S)(R)(G)MII_TXD3",
+			  "ETH_A_(R)(G)MII_TX_EN(_ER)", "ETH_A_(R)(G)MII_TX_CLK",
+			  "ETH2_INT", "USB_HUB_RST",
 			  "ETH1_INT", "GPIO4", "CAN0_TX", "SER0_CTS",
 			  "SER0_RTS", "CAN0_RX", "CAN1_TX", "CAN1_RX",
 			  "", "CARRIER_PWR_EN", "I2S0_SDIN", "";
@@ -194,28 +202,28 @@ &gpio4 {
  *   PWM_1 -> LCD1_BKLT_PWM
  *   PWM_0 -> LCD0_BKLT_PWM
  *   SPI_A_SCK -> SPI0_CK
- *   SPI_A_SDO -> SPI0_DO
- *   SPI_A_SDI -> SPI0_DIN
- *   SPI_A_CS0 -> SPI0_CS0
+ *   SPI_A_SDO_(IO1) -> SPI0_DO
+ *   SPI_A_SDI_(IO0) -> SPI0_DIN
+ *   SPI_A_CS0# -> SPI0_CS0
  *   SPI_B_SCK -> ESPI_CK
  *   SPI_B_SDO -> ESPI_IO_0
  *   SPI_B_SDI -> ESPI_IO_1
- *   SPI_B_CS0 -> ESPI_CS0
+ *   SPI_B_CS0# -> ESPI_CS0
  *   I2C_A_SCL -> I2C_PM_CK
  *   I2C_A_SDA -> I2C_PM_DAT
  *   I2C_B_SCL -> I2C_GP_CK
  *   I2C_B_SDA -> I2C_GP_DAT
- *   PCIE_SMCLK -> HDMI_CTRL_CK
- *   PCIE_SMDAT -> HDMI_CTRL_DAT
- *   I2C_CAM_SCL -> I2C_CAM1_CK
- *   I2C_CAM_SDA -> I2C_CAM1_DAT
+ *   PCIe_SMCLK -> HDMI_CTRL_CK
+ *   PCIe_SMDAT -> HDMI_CTRL_DAT
+ *   I2C_CAM_SCL/CSI_TX_P -> I2C_CAM1_CK
+ *   I2C_CAM_SDA/CSI_TX_N -> I2C_CAM1_DAT
  *   UART_A_RX -> SER0_RX
  *   UART_A_TX -> SER0_TX
  *   UART_C_RX -> SER3_RX
  *   UART_C_TX -> SER3_TX
  *   UART_CON_RX -> SER1_RX
  *   UART_CON_TX -> SER1_TX
- *   PCIe_CLKREQ -> PCIE_A_CKREQ
+ *   PCIe_CLKREQ# -> PCIE_A_CKREQ
  *   UART_B_TX -> SER2_TX
  */
 &gpio5 {

-- 
2.55.0

