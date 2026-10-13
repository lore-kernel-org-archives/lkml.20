Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CEC4F052C;
	Tue, 13 Oct 2026 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892308; cv=none; b=Yo7xOleOmXlcosEdEZ+MOgSLpSUbYuGnYrCjWDEglUbN37CKgP/ZwyYy1xrCzILxuahMGig45xBqqaLgXtbL4x+z53g+Wl4+rWE7cQ/go8wsRQvCN/vEZMURmq4V6G+joaMI3SYjrV7ikCUtLQnOChPSyuDPYs0tcNAgldkv9ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892308; c=relaxed/simple;
	bh=warkN9W6JfrJcA6DivZUbpf6r0vDEgkxmgja+2Dlqzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MADYmodlFHwLTuAulxSGNI4yub+Okzq3ou62SUL+NGpQyHht6AMouaX8F+lJNrXTGEmEOyrAhLNiFCmKXo2OE0OUa1q2t1z0fX+n6SjlZrEH9cHNeM8PKURs8El1mMMOxV6ddLjBQozO9OJn+BcxFJOyW5835xu6+h/HYUSXQjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=PHi9Tp64; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="PHi9Tp64"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791892304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aZzR7DfaI5+qyDMit5ERE7zlJ207/SzVa7DOfqeAcHM=;
	b=PHi9Tp64t+50phgQuKhIb9sElWZZOUSnXsqd2Snkec64PQO7lQQT9hbV4E0r0bZxl/rb6h
	tt6TRY9SkhcVmPTPEEvieGabNkZxnofwBamjzLMb+tULYSIWVUn4YePeax6BPI5VgG1H+0
	5wMypuEBCuzj+zKAord2yDnScbJ8lv/IGt7GsYSvwakxsbK1aqM27k08H1N1g0ShiRWW3c
	aOnFRAPMiXpEt2m7V2qI2u2ZU915AHm7lPWRME5hBgSisOIF95FsAAYbSMDJ4120tQFEEv
	xxyfpFYEqLL1sGaGO6XOm8cR1rYXTEVEjvC9X7BC9C+p4rrGJEQaNBlX6Mn+pw==
Date: Tue, 13 Oct 2026 13:51:06 +0200
Subject: [PATCH v2 1/9] arm64: dts: imx8mp-kontron: Fix GPIO label
 assignments
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v2-1-d464ca652c91@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6655;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=+zV3LGZPvv/o5QyNdbFepYoX8BW6jQLYxmeB8Uq7phM=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuctJ9bVhFnngvrTjGTmmMv/sRpeF3q2titOVVp4Ylnk
 51aLNZ0lLIwiHExyIopskjxW7y2NYv1kT9WHQUzh5UJZAgDF6cATOTvIkaGa7s9+jh1Ft9e0Poq
 /vs05tLErVe0//ue/XKnyGD3D+6KEIb/fs5nXNet9Dj5YmJLy3wzV71Dov3zrfsSCnc0T8qfX1P
 PCgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Eberhard Stoll <eberhard.stoll@kontron.de>

The OSM-S pad names GPIO_A_7, UART_B_RX, I2S_LRCLK and PCIe_CLKREQ
are incorrectly assigned. The labels I2S_B_DATA_IN and I2S_B_DATA_OUT
are missing and SPI_A_WP/SPI_A_HOLD are unconnected. Fix the labels.

The BL and SMARC board devicetrees override the GPIO labels of the SoM
and inherited the incorrect assignments. Fix them accordingly.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts   | 10 +++++-----
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi     |  8 ++++----
 .../boot/dts/freescale/imx8mp-kontron-smarc.dtsi     | 20 ++++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
index 29ce863403b88..b6ffea952b69f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
@@ -134,12 +134,13 @@ &gpio2 {
 
 /*
  * Rename SoM signals according to board usage:
+ *   GPIO_A_7      -> TFT_STBY
  *   GPIO_B_0      -> IO_EXP_INT
  *   GPIO_B_1      -> IO_EXP_RST
  */
 &gpio3 {
-	gpio-line-names = "PCIE_WAKE", "PCIE_CLKREQ", "PCIE_A_PERST", "SDIO_B_D5",
-			  "SDIO_B_D6", "SDIO_B_D7", "SPI_A_WP", "SPI_A_HOLD",
+	gpio-line-names = "PCIE_WAKE", "TFT_STBY", "PCIE_A_PERST", "SDIO_B_D5",
+			  "SDIO_B_D6", "SDIO_B_D7", "UART_B_RX", "I2S_LRCLK",
 			  "UART_B_RTS", "UART_B_CTS", "SDIO_B_D0", "SDIO_B_D1",
 			  "SDIO_B_D2", "SDIO_B_D3", "SDIO_B_WP", "SDIO_B_D4",
 			  "PCIE_SM_ALERT", "SDIO_B_CLK", "SDIO_B_CMD", "IO_EXP_INT",
@@ -151,7 +152,6 @@ &gpio3 {
 /*
  * Rename SoM signals according to board usage and remove labels for unsed pins:
  *   GPIO_A_6      -> TFT_RESET
- *   GPIO_A_7      -> TFT_STBY
  *   GPIO_B_3      -> CSI_ENABLE
  *   GPIO_B_2      -> USB_HUB_RST
  */
@@ -163,7 +163,7 @@ &gpio4 {
 			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "CSI_ENABLE", "",
 			  "USB_HUB_RST", "TFT_RESET", "CAN_A_TX", "UART_A_CTS",
 			  "UART_A_RTS", "CAN_A_RX", "CAN_B_TX", "CAN_B_RX",
-			  "TFT_STBY", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_LRCLK";
+			  "I2S_B_DATA_IN", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
 };
 
 /*
@@ -181,7 +181,7 @@ &gpio5 {
 			  "I2C_B_SCL", "I2C_B_SDA", "PCIE_SMCLK", "PCIE_SMDAT",
 			  "I2C_CAM_SCL", "I2C_CAM_SDA", "UART_A_RX", "UART_A_TX",
 			  "UART_C_RX", "UART_C_TX", "UART_CON_RX", "UART_CON_TX",
-			  "UART_B_RX", "UART_B_TX";
+			  "PCIe_CLKREQ", "UART_B_TX";
 };
 
 &hdmi_pvi {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
index ea69c639b30b8..3c183ab573bed 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
@@ -158,8 +158,8 @@ &gpio2 {
 &gpio3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio3>;
-	gpio-line-names = "PCIE_WAKE", "PCIE_CLKREQ", "PCIE_A_PERST", "SDIO_B_D5",
-			  "SDIO_B_D6", "SDIO_B_D7", "SPI_A_WP", "SPI_A_HOLD",
+	gpio-line-names = "PCIE_WAKE", "GPIO_A_7", "PCIE_A_PERST", "SDIO_B_D5",
+			  "SDIO_B_D6", "SDIO_B_D7", "UART_B_RX", "I2S_LRCLK",
 			  "UART_B_RTS", "UART_B_CTS", "SDIO_B_D0", "SDIO_B_D1",
 			  "SDIO_B_D2", "SDIO_B_D3", "SDIO_B_WP", "SDIO_B_D4",
 			  "PCIE_SM_ALERT", "SDIO_B_CLK", "SDIO_B_CMD", "GPIO_B_0",
@@ -178,7 +178,7 @@ &gpio4 {
 			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "GPIO_B_3", "GPIO_B_4",
 			  "GPIO_B_2", "GPIO_A_6", "CAN_A_TX", "UART_A_CTS",
 			  "UART_A_RTS", "CAN_A_RX", "CAN_B_TX", "CAN_B_RX",
-			  "GPIO_A_7", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_LRCLK";
+			  "I2S_B_DATA_IN", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
 };
 
 &gpio5 {
@@ -189,7 +189,7 @@ &gpio5 {
 			  "I2C_B_SCL", "I2C_B_SDA", "PCIE_SMCLK", "PCIE_SMDAT",
 			  "I2C_CAM_SCL", "I2C_CAM_SDA", "UART_A_RX", "UART_A_TX",
 			  "UART_C_RX", "UART_C_TX", "UART_CON_RX", "UART_CON_TX",
-			  "UART_B_RX", "UART_B_TX";
+			  "PCIe_CLKREQ", "UART_B_TX";
 };
 
 &i2c1 { /* OSM-S I2C_A */
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi
index 1e831d9b8a935..d63c10b9b3d72 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi
@@ -116,13 +116,13 @@ &gpio2 {
 
 /*
  * Rename SoM signals according to SMARC module usage:
- *   PCIE_CLKREQ -> PCIE_A_CKREQ
+ *   GPIO_A_7 -> TEST
  *   PCIE_A_PERST -> PCIE_A_RST
  *   SDIO_B_D5 -> n.a.
  *   SDIO_B_D6 -> n.a.
  *   SDIO_B_D7 -> n.a.
- *   SPI_A_WP -> n.a.
- *   SPI_A_HOLD -> n.a.
+ *   UART_B_RX -> SER2_RX
+ *   I2S_LRCLK -> I2S0_LRCK
  *   UART_B_RTS -> SER2_RTS
  *   UART_B_CTS -> SER2_CTS
  *   SDIO_B_D0 -> GPIO8
@@ -144,8 +144,8 @@ &gpio2 {
  */
 &gpio3 {
 	pinctrl-0 = <&pinctrl_gpio3>, <&pinctrl_gpio3_smarc>;
-	gpio-line-names = "PCIE_WAKE", "PCIE_A_CKREQ", "PCIE_A_RST", "",
-			  "", "", "", "",
+	gpio-line-names = "PCIE_WAKE", "TEST", "PCIE_A_RST", "",
+			  "", "", "SER2_RX", "I2S0_LRCK",
 			  "SER2_RTS", "SER2_CTS", "GPIO8", "GPIO9",
 			  "GPIO10", "GPIO11", "", "",
 			  "SMB_ALERT", "GPIO6", "GPIO7", "LCD0_BKLT_EN",
@@ -170,9 +170,9 @@ &gpio3 {
  *   CAN_A_RX -> CAN0_RX
  *   CAN_B_TX -> CAN1_TX
  *   CAN_B_RX -> CAN1_RX
- *   GPIO_A_7 -> TEST
+ *   I2S_B_DATA_IN -> n.a.
  *   I2S_A_DATA_IN -> I2S0_SDIN
- *   I2S_LRCLK -> I2S0_LRCK
+ *   I2S_B_DATA_OUT -> n.a.
  */
 &gpio4 {
 	gpio-line-names = "", "", "", "LED",
@@ -182,7 +182,7 @@ &gpio4 {
 			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "ETH2_INT", "USB_HUB_RST",
 			  "ETH1_INT", "GPIO4", "CAN0_TX", "SER0_CTS",
 			  "SER0_RTS", "CAN0_RX", "CAN1_TX", "CAN1_RX",
-			  "TEST", "CARRIER_PWR_EN", "I2S0_SDIN", "I2S0_LRCK";
+			  "", "CARRIER_PWR_EN", "I2S0_SDIN", "";
 };
 
 /*
@@ -215,7 +215,7 @@ &gpio4 {
  *   UART_C_TX -> SER3_TX
  *   UART_CON_RX -> SER1_RX
  *   UART_CON_TX -> SER1_TX
- *   UART_B_RX -> SER2_RX
+ *   PCIe_CLKREQ -> PCIE_A_CKREQ
  *   UART_B_TX -> SER2_TX
  */
 &gpio5 {
@@ -228,7 +228,7 @@ &gpio5 {
 			  "I2C_GP_CK", "I2C_GP_DAT", "HDMI_CTRL_CK", "HDMI_CTRL_DAT",
 			  "I2C_CAM1_CK", "I2C_CAM1_DAT", "SER0_RX", "SER0_TX",
 			  "SER3_RX", "SER3_TX", "SER1_RX", "SER1_TX",
-			  "SER2_RX", "SER2_TX";
+			  "PCIE_A_CKREQ", "SER2_TX";
 };
 
 &usb_dwc3_1 {

-- 
2.55.0

