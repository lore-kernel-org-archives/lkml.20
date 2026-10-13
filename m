Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FA84B7A35;
	Tue, 13 Oct 2026 09:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884757; cv=none; b=gPjuWmB7HNi44qNbLZsF86tkvITO3r+ateklqBCgJVw32O3f+qHoSMclA+jY+jATn8GqQ7xNy+FQ6+CpC670Ce10kxfLNRUyBKl0Kou9eJftnjcAR2zvMtfbCtTddfh6Zhumq7FckhbEAKri1PTBmOkZpzc+MZxRNcBclyKuXdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884757; c=relaxed/simple;
	bh=JTEqCuLg9ri8hxGAApv+F+nTAiRwGfopyWl/JnfC8Zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBPvQxX7ty1z6dzSsEcmuVcPbnw/q5mVyBQVFK44rLQW7mB1ccezPIdakDysgSd67Sn9tPjBd/ugtGl7Za8JkayTiYq4v5EwIKPQWEeA7sz4oeJrALShsV1dqaHmtQq4c7j0knpeHVNybtRfVZwttre51RsSMIqIk3wUp+71Gio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=URZieJOz; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="URZieJOz"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791884743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRvuRuILNq/yWoa/NRjDFom6P+NjTUbwcwNhaaI2vJw=;
	b=URZieJOzf2PGaw4fALxQV5hq/IUG1Fk/9VmZ2wYiuUFFKXgIn768XI7LPiyd6BHviOdIZR
	/eg6hFUHcQcZh00KjetK2DWmohla2vGy8/yWP0cbHJOW4Igflzg/t8wuGUrJQ1N8piL7SR
	5XatkH/tKtm4X145O6LjnoT7vYCZUwtsPx1X+U3kzRf2DQ4L+hsSMYuAyO2F/jdsk3ymBW
	BFB9aKP4cJHJeWcW/trkU38ecBhLulVF8iZdO012JOaG4DgM/JvSCH+zUVCQmCE3PD/CMV
	dWQEZZqwzEOBYoqD7OwgWxSv+PBQO70SEmo+6fsxX4u5kTEir77cDNuD3H/P2w==
Date: Tue, 13 Oct 2026 11:44:48 +0200
Subject: [PATCH 3/8] arm64: dts: imx8mp-kontron: Remove obsolete
 VDD_CARRIER regulator
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v1-3-94f09ec520ef@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2612;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=BlLX2poyrIK+m0d4cirwujiYu4ewF9ZSgcg39h5GqLs=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIevs36OqzJ3vNx4s+db86GTG2tSGwE6ZBznPRM758JepG
 cizHLvdUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJFZpYwMR89GHbot9HHjuU8+
 t9hVP/yMC7LvZqx+VONkl8F9y4y9iJHhp+4VlYd9+/wml5TtjG7+7W8oNYdFitO/+0X1KiHxiYv
 YAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Eberhard Stoll <eberhard.stoll@kontron.de>

For early prototypes, the CARRIER_PWR_EN signal was controlled
by software. Now, for the regular revisions, this signal is
controlled by hardware. The corresponding pad is now available as
GPIO_C_1. Reflect these changes in the devicetree.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   | 32 ++--------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

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

-- 
2.55.0

