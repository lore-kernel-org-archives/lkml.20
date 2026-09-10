Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95553B585F;
	Thu, 10 Sep 2026 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035393; cv=none; b=CljWZFv8vqx1WD90SKnbt/g86DqL1Eo4o+eJJs/L2rMMpdfvyHz3+HKoPxQOt7WybMDdd7gbw2UAYshVQRGU/lNWKxuYi7E3Mp6dqcootqLhBp4fN39nHnoGZvfFvhr8kGLCuoS+DU8MF2vLTAwWbWuCME6AAvDlHh/NxmUQz+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035393; c=relaxed/simple;
	bh=qv/pge2Ap4CnQwMwwU/apBOTqI1n0BM0YF/SNPyiN8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ah1BD2jscCx9r39RMhzBk05U9lND3RfhYN2aFhHFZ/dUHMNdc9/DRAhBMlvDpIwBkLgJVMwatujwlXOZdXBixyjSN9xgbKp+AKhfyB2j9TyHykC74tlw7Y52+A91HgZ+Q2qO6/GqTTi0UL1h+D8/rRVYeIkD/d6FpqPt3DhNzIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=lUlL+B4n; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="lUlL+B4n"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 1AF6C1FA78;
	Thu, 10 Sep 2026 12:16:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789035387;
	bh=QHfO73kDcEP+7INr7vFqDT9vnQPxAaieW9owluqHhx4=; h=From:To:Subject;
	b=lUlL+B4nqGoW0SptASPlQ7VAv3u6zYcbmnSmoLXRNYd/lDMOjr7LBJbo1m19jDzRu
	 8DxNZFzXF/GPtR2KUMxAicMVUX0ECAy9ehnQNEJo9B2k31c6wrmHZcLsJTgJgfe5EA
	 cetmbHSMPYaJar2gDXoP0R+XrST0xC3QjkEaFh8V3HggPi0U10+lYKdLmKtMrs7jYq
	 vKdzdULkdM7nhmWY2kxKtJu4AYlLw6f+oLwkE33M8WGcWVfc1fQTay4m2BdhYYgjCn
	 hd4l1Jc59Rttqm9I9hSlMMRSpRDt81Zcg3RDQyzMpwB+JWXHyQIaxS1gYdPHBK4nBR
	 /AEwT8DzJPNqA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 4/7] arm64: dts: freescale: imx93-lino: Add dahlia
Date: Thu, 10 Sep 2026 12:16:10 +0200
Message-ID: <20260910101616.139270-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910101616.139270-1-francesco@dolcini.it>
References: <20260910101616.139270-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support for Lino iMX93 mated with the Verdin adapter and Dahlia
carrier board.

Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
Link: https://www.toradex.com/accessories/lino-verdin-adapter
Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 ...imx93-imx91-lino-verdin-dahlia-common.dtsi | 198 ++++++++++++++++++
 .../freescale/imx93-lino-verdin-dahlia.dts    |  24 +++
 3 files changed, 223 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dahlia-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index eb71f126a8ed..319a0e797e94 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -887,6 +887,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dahlia-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dahlia-common.dtsi
new file mode 100644
index 000000000000..5f6136204e30
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dahlia-common.dtsi
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Lino iMX93/iMX91 SoM on Lino-Verdin Adapter / Dahlia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx91
+ * https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
+ * https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
+ */
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	reg_1v8_sw: regulator-1v8-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "On-carrier +V1.8_SW";
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "verdin-wm8904";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"Microphone Jack", "MICBIAS",
+			"IN1L", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904_1a>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai3>;
+		};
+	};
+};
+
+/* Lino ADC_1, ADC_2, ADC_3 and ADC_4 */
+&adc1 {
+	status = "okay";
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio1>, <&pinctrl_gpio2>, <&pinctrl_gpio3>,
+		    <&pinctrl_gpio4>, <&pinctrl_gpio5>;
+};
+
+&gpio3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio6>, <&pinctrl_gpio7>;
+};
+
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio8>, <&pinctrl_gpio9>, <&pinctrl_gpio10>;
+};
+
+/* Lino ETH_1 */
+&eqos {
+	status = "okay";
+};
+
+/* Lino CAN_1 */
+&flexcan1 {
+	status = "okay";
+};
+
+/* Lino CAN_2 */
+&flexcan2 {
+	status = "okay";
+};
+
+/* Lino I2C_2 */
+&lpi2c3 {
+	status = "okay";
+};
+
+/* Lino I2C_3 */
+&lpi2c4 {
+	status = "okay";
+};
+
+/* Lino SPI_1 */
+&lpspi8 {
+	status = "okay";
+};
+
+/* Lino UART_3, used as the Linux Console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* Lino UART_4 */
+&lpuart2 {
+	status = "okay";
+};
+
+/* Lino UART_2 */
+&lpuart7 {
+	status = "okay";
+};
+
+/* Lino I2S_1 */
+&sai3 {
+	status = "okay";
+};
+
+/* Lino PWM_1 */
+&tpm4 {
+	status = "okay";
+};
+
+/* Lino PWM_2 */
+&tpm5 {
+	status = "okay";
+};
+
+/* Lino PWM_3 */
+&tpm6 {
+	status = "okay";
+};
+
+/* Lino USB_1 */
+&usbotg1 {
+	status = "okay";
+};
+
+/* Lino USB_2 */
+&usbotg2 {
+	status = "okay";
+};
+
+/* Lino SD_1 */
+&usdhc2 {
+	status = "okay";
+};
+
+/* Verdin CTRL_WAKE1_MICO# */
+&verdin_gpio_keys {
+	status = "okay";
+};
+
+/* Verdin I2C_1 */
+&verdin_i2c_1 {
+	status = "okay";
+
+	wm8904_1a: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		clock-names = "mclk";
+		clocks = <&verdin_i2s1_mclk>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_1v8_sw>;
+		CPVDD-supply = <&reg_1v8_sw>;
+		DBVDD-supply = <&reg_1v8_sw>;
+		DCVDD-supply = <&reg_1v8_sw>;
+		MICVDD-supply = <&reg_1v8_sw>;
+	};
+
+	/* Current measurement into module VCC */
+	hwmon@40 {
+		compatible = "ti,ina219";
+		reg = <0x40>;
+		shunt-resistor = <10000>;
+	};
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp75c";
+		reg = <0x4f>;
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* Verdin PCIE_1_RESET# */
+&verdin_pcie_1_reset_hog {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dts b/arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dts
new file mode 100644
index 000000000000..c708a2e18c90
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Lino iMX93 SoM on Lino-Verdin Adapter / Dahlia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
+ * https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
+ */
+
+/dts-v1/;
+
+#include "imx93.dtsi"
+#include "imx93-lino.dtsi"
+#include "imx93-imx91-lino-verdin-common.dtsi"
+#include "imx93-imx91-lino-verdin-dahlia-common.dtsi"
+
+/ {
+	model = "Toradex Lino iMX93 on Verdin Adapter plus Dahlia Board";
+	compatible = "toradex,lino-imx93-verdin-dahlia",
+		     "toradex,lino-imx93-verdin",
+		     "toradex,lino-imx93",
+		     "fsl,imx93";
+};
-- 
2.47.3

