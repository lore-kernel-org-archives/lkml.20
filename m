Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA95B4F30D7;
	Tue, 13 Oct 2026 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892308; cv=none; b=iMQ9guRNDXeRc8diYgrCF4KZOX4kHe4455bv7Vdp/xkS9F51j76Ml4ynwbab1UotweOrhZfXOCnvyCx+dftEglqaSZKg7NPELftsuVVIq1HDmZCbdq2xXBqYTJBsh2neWKH1t6ZQ5Nk9iSfadFwtO1QEwhRQR+driCaHG+/JQH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892308; c=relaxed/simple;
	bh=OZyt4IHgkMwX0bJDoEVVa6P56ixpMqpyHvf0smEAU/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c6pZ5I6c0FpcuvSQN5cPs7D2ToKbZwniGKxjQX9Y2bObcOoA7tiOlLl+xAIKno2VvTYDheUOvQ762tul3aJTShitRXM3N3JnGr117Z3/2rI2s2byX55E6cMfL921UJYt6qUgbXswBpaUKzI+9mjDnugUEt4USPJR85xk06Gohi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=sMriuHDb; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="sMriuHDb"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791892305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUMQVPmAXVyHnbGSMizW+WgNWwNECkBdTvVIDO923a0=;
	b=sMriuHDbbUocAMam8jKFeNarTr7Hcdg4y+PutzwPz0TzQRSrIUDkO/X3bD6V4jW42PPX76
	/qK8f3y6bE5ogHHIU3cnz0OShFe3oALxt9RlI9Qf7ldb1I93fXYycD11LT/jj5eVY8Gpwj
	i6L1E4RiH6dguHJHMGdlSr0NPQPvRTPQADKBuldK0fWhHUHUqxSKq7IEna5NQ8OIS53w/g
	jq40MSX1FSWq4hPjU+yZm9KnAeSyLPR4WR1yWaZPSc4JhyQVzjUF9M8cVZEqgsz59x4y90
	W1UhD2wc5YBA8BiWMgKTrKP4I6/R6FKM4MWGGmOosEwZzI+gkOlKXTPRJQmhFA==
Date: Tue, 13 Oct 2026 13:51:09 +0200
Subject: [PATCH v2 4/9] arm64: dts: imx8mp-kontron: Remove obsolete
 VDD_CARRIER regulator
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v2-4-d464ca652c91@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4262;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=rxs3VbVI1vjxWa6AD5PEYJSFI5cFMyZj7PFfdoDP6C8=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuctJ+3fJFT6u2VWUmfdq95vP3v/APSXJYnxB3PsTo6H
 6zVm5zSUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJH90YwMh0JW5pjGaRmrrFg4
 S6H9eNF9+absmvlcLR1THSfM3+PKxshww7CjdevM9bPXXyyeWeUX9X0Fa/6W88w3nX/u3rv3O7c
 YNwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Eberhard Stoll <eberhard.stoll@kontron.de>

For early prototypes, the CARRIER_PWR_EN signal was controlled
by software. Now, for the regular revisions, this signal is
controlled by hardware. The corresponding pad is now available as
GPIO_C_1. Reflect these changes in the devicetree.

Also update the GPIO label in the BL board devicetree and drop the
CARRIER_PWR_EN label from the SMARC module devicetree.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts |  2 +-
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   | 32 ++--------------------
 .../boot/dts/freescale/imx8mp-kontron-smarc.dtsi   |  3 +-
 3 files changed, 5 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
index 831bf8cfc5bd1..e7241a71da68b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
@@ -167,7 +167,7 @@ &gpio4 {
 			  "CSI_ENABLE", "",
 			  "USB_HUB_RST", "TFT_RESET", "CAN_A_TX", "UART_A_CTS",
 			  "UART_A_RTS", "CAN_A_RX", "CAN_B_TX", "CAN_B_RX",
-			  "I2S_B_DATA_IN", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
+			  "I2S_B_DATA_IN", "GPIO_C_1", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
 };
 
 /*
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
index 3459ee2c0eb64..4fd42e7170ee8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
@@ -72,29 +72,6 @@ reg_usdhc3_vcc: regulator-usdhc3-vcc {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "VCC_SDIO_B";
 	};
-
-	reg_vdd_carrier: regulator-vdd-carrier {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_reg_vdd_carrier>;
-		gpio = <&gpio3 16 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-name = "VDD_CARRIER";
-
-		regulator-state-standby {
-			regulator-on-in-suspend;
-		};
-
-		regulator-state-mem {
-			regulator-off-in-suspend;
-		};
-
-		regulator-state-disk {
-			regulator-off-in-suspend;
-		};
-	};
 };
 
 &A53_0 {
@@ -185,7 +162,7 @@ &gpio4 {
 			  "GPIO_B_3", "GPIO_B_4",
 			  "GPIO_B_2", "GPIO_A_6", "CAN_A_TX", "UART_A_CTS",
 			  "UART_A_RTS", "CAN_A_RX", "CAN_B_TX", "CAN_B_RX",
-			  "I2S_B_DATA_IN", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
+			  "I2S_B_DATA_IN", "GPIO_C_1", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
 };
 
 &gpio5 {
@@ -547,6 +524,7 @@ MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18		0x19 /* GPIO_B_3 */
 			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19		0x19 /* GPIO_B_4 */
 			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20		0x19 /* GPIO_B_2 */
 			MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21		0x19 /* GPIO_A_6 */
+			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0x19 /* GPIO_C_1 */
 		>;
 	};
 
@@ -683,12 +661,6 @@ MX8MP_IOMUXC_HDMI_DDC_SDA__GPIO3_IO27		0x19 /* SDIO_B_PWR_EN */
 		>;
 	};
 
-	pinctrl_reg_vdd_carrier: regvddcarriergrp {
-		fsl,pins = <
-			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0x19 /* CARRIER_PWR_EN */
-		>;
-	};
-
 	pinctrl_rtc: rtcgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SAI5_RXD3__GPIO3_IO24		0x1c0
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi
index a88883e847457..599faf4600d48 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi
@@ -175,6 +175,7 @@ &gpio3 {
  *   CAN_B_TX -> CAN1_TX
  *   CAN_B_RX -> CAN1_RX
  *   I2S_B_DATA_IN -> n.a.
+ *   GPIO_C_1 -> n.a.
  *   I2S_A_DATA_IN -> I2S0_SDIN
  *   I2S_B_DATA_OUT -> n.a.
  */
@@ -190,7 +191,7 @@ &gpio4 {
 			  "ETH2_INT", "USB_HUB_RST",
 			  "ETH1_INT", "GPIO4", "CAN0_TX", "SER0_CTS",
 			  "SER0_RTS", "CAN0_RX", "CAN1_TX", "CAN1_RX",
-			  "", "CARRIER_PWR_EN", "I2S0_SDIN", "";
+			  "", "", "I2S0_SDIN", "";
 };
 
 /*

-- 
2.55.0

