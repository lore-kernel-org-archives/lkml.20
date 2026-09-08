Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ABD5540B6;
	Tue,  8 Sep 2026 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876007; cv=none; b=Leqf9SR2HABuf56sd7S760o/wMnkACEbBq87IpN5WEyOR3zsGeUQEiYZlaptutBdBHYfSYePsRQtI95R5CxOnoWjaVXBVSazBxIxqB6hTb9cd60J6NRWg4lNTbQofrmdQJ45SC52+V7ywizMDRtETTk45XWM42j9tYmDICpj6Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876007; c=relaxed/simple;
	bh=7ic4GctefoqLbsA/3ehMeZa39KRVKG5KRpWO8ZCeWZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dhrtMGXboj9IWLyLXaDeouFBAJ3MTF748UtIfC1g2a26G9NtnpAkVrG88sNhcGzcJGC3P9I9SawX/PN/WkHzQDn30Tu+m12q5vP1izL3kjyA0r3kyh41ZYMrlpzVasxssWFk1O8CkHi/MRPDO+9sy4hSmMHVBvY/yArmWAY+Jr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=DROXpOLF; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="DROXpOLF"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c+qgtzY6MaCxcO3ICUhFFV0vpVhq609X5qyt6lhvn+I=;
	b=DROXpOLFySrkh7eL4lQh9iit7MxFoKhb71uLelpFGxy7/I5ZKe47l68H7agFYXxlQp7qMt
	CLLgUY6xExEO3wHxvHEaRtK48ogDIc4ot86M+TYQQrQLVC74tl8A31qBseDe1dwo5ppN06
	equkc5mzTbNaYFrG24QkcZCJklzuPqv6dxa/PDH7kQBaZBKN2CbJ+Xa1xzoDlWEyhMsJ2E
	1y8tbUZBkxk66NiqEJo3LBypvkArloNd6VYcxdU7j00us8w5u3SBkbL6LFejXbuxJkxNfU
	DDcxDrV2iD40jzmCF3T6K4aPAuzvLaX8J07Ju4qo2jWjfUxYNnvZontVl49JBA==
Date: Tue, 08 Sep 2026 15:51:51 +0200
Subject: [PATCH 4/9] arm64: dts: imx93-kontron: Adjust GPIO4_IO29 usage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-4-4d0e8a75db79@kontron.de>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=MMVzO63V/8fkJV9PzRy2jq7KDqxZ4OTRvgqObIY0heI=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsNNpM/ur9mvOcDckfzognLTk/MmLYrvdPudVfz6in
 8p6JuBoRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwER2/mVk+FsRZcesUFU/aXXO
 4VK+Kd/YG1lrgr9N4p5mU6D5uZhZiJFhr3OnrHrBqXQptvkeGXdjCx43WDZ5BYm1CRx/rfqhoJY
 NAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Early prototypes had GPIO4_IO29 control the CARRIER_PWR_EN signal.
This is now controlled by hardware and the GPIO4_IO29 is routed to
the GPIO_B_2 OSM pad.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    | 32 ++--------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index f881912cde46..36548d918169 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -34,29 +34,6 @@ reg_usdhc2_vcc: regulator-usdhc2-vcc {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "VCC_SDIO_A";
 	};
-
-	reg_vdd_carrier: regulator-vdd-carrier {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_reg_vdd_carrier>;
-		gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
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
 
 &flexcan1 { /* OSM-S CAN_A */
@@ -113,7 +90,7 @@ &gpio4 {
 			  "ETH_A_TXD3", "ETH_A_TXD2", "ETH_A_TXD1", "ETH_A_TXD0",
 			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "ETH_A_RX_CTL", "ETH_A_RX_CLK",
 			  "ETH_A_RXD0", "ETH_A_RXD1", "ETH_A_RXD2", "ETH_A_RXD3",
-			  "GPIO_B_0", "CARRIER_PWR_EN";
+			  "GPIO_B_0", "GPIO_B_2";
 };
 
 &lpi2c1 {
@@ -385,6 +362,7 @@ MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e /* GPIO_A_7 */
 	pinctrl_gpio4: gpio4grp {
 		fsl,pins = <
 			MX93_PAD_CCM_CLKO3__GPIO4_IO28			0x31e /* GPIO_B_0 */
+			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x31e /* GPIO_B_2 */
 		>;
 	};
 
@@ -465,12 +443,6 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07		0x31e /* SDIO_A_PWR_EN */
 		>;
 	};
 
-	pinctrl_reg_vdd_carrier: regvddcarriergrp {
-		fsl,pins = <
-			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x31e /* CARRIER_PWR_EN */
-		>;
-	};
-
 	pinctrl_rtc: rtcgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_VSELECT__GPIO3_IO19		0x31e

-- 
2.55.0

