Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3722B4756AA;
	Fri, 11 Sep 2026 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118434; cv=none; b=aSSJYUBjqV/flZSbv96xW2lc+EvtUMdUYcNHuyrNdvemK/gqRrEev3QzSM4wHACR4iUDAQlcrMq3/kU6UvQNp5ZX8IF+E2AT3oj0Deejq4DwtC3llkGvgbS4alREP6qgzNu6G9WxHF8FVqkmatiCsrOK8zWEGdSBN9gxVR1DMN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118434; c=relaxed/simple;
	bh=NSMFmRCRTVREulaidm7sLt93ZmQkbnXRFeFIbFxYJ/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gfm2P/ya1jz5LGoQGdR5DLQFfp7aLj9ZlgnEFcv7gdXhKrQtrNm7jjhcY9hNRRsAr8IYL7+5t9Ilgx2asDNJTGahFwSElUFUUZlTKAYeHt1gXtK2AHbc2bLPghuNFS/m/CQMt2J6YdeuO9pO3IvNSBSZXpveUy0oI9+Ua3h5h50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=QJio11hy; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="QJio11hy"
Received: from francesco-nb.. (93-33-8-46.ip42.fastwebnet.it [93.33.8.46])
	by mail11.truemail.it (Postfix) with ESMTPA id 8B97722DFA;
	Fri, 11 Sep 2026 11:20:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789118429;
	bh=CiKp3WaY9AhXV4SlpSws6RkELCEzxmEI+lHOwFTluUg=; h=From:To:Subject;
	b=QJio11hyaJTZ9AL+I2LtW8letrVkMcsYLjpoWDFx/WjTVxOxwYnOGJT9P8UWDET8V
	 rld4bgKVExQBkqB6iK9mOT5w5VMaNQV3IkhMOrK04vQ9iV8hfdqMnFn2HunmmKTjMJ
	 kj51151A2R29XOvEDMRUxGA6VQpUFm36xBlXdUDYB2FvPK/DbwHFRAaRdy8Z7iKZp1
	 5k10po04gznDZ2F85QziW9Ho+5Sge7zy7nsjlYQC9rFVNiGWA+oR4yqmgyoZVqvWIb
	 t2GrGmrzU0PkSF4suJyBveOCO2Xg3aLIuFCgk0DY8UZCmPoaV8VGTxA2pmXnJRwa63
	 UpDvC8NMhsung==
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
	linux-arm-kernel@lists.infradead.org,
	Antoine Gouby <antoine.gouby@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: [PATCH v2 6/7] arm64: dts: freescale: Add Toradex OSM iMX93
Date: Fri, 11 Sep 2026 11:19:49 +0200
Message-ID: <20260911091952.96233-7-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911091952.96233-1-francesco@dolcini.it>
References: <20260911091952.96233-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support for the Toradex OSM iMX93 and its development carrier board.

The SoM is available in two variants, with i.MX91 or i.MX93 SoC, using
the same PCB (the two chips are pin to pin compatible), to avoid
duplication create a common dtsi to share commonalities.

Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx93
Link: https://www.toradex.com/products/carrier-board/osm-development-board
Co-developed-by: Antoine Gouby <antoine.gouby@toradex.com>
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Co-developed-by: Franz Schnyder <franz.schnyder@toradex.com>
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2:
- drop #address-cells/#size-cells from &lpi2c1, &lpi2c2 and &lpi2c3,
  already set in imx91_93_common.dtsi.
- drop #sound-dai-cells from &sai3, already set in imx91_93_common.dtsi.
---
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../imx93-imx91-toradex-osm-common.dtsi       | 526 ++++++++++++++++++
 .../imx93-imx91-toradex-osm-dev-common.dtsi   | 324 +++++++++++
 .../dts/freescale/imx93-toradex-osm-dev.dts   |  22 +
 .../boot/dts/freescale/imx93-toradex-osm.dtsi | 357 ++++++++++++
 5 files changed, 1231 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 823ef16ba621..64fa5d0527ff 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -911,6 +911,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx93-toradex-osm-dev.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
new file mode 100644
index 000000000000..8b0131d4e6e2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
@@ -0,0 +1,526 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex OSM iMX93/iMX91 SoM
+ *
+ * https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx93
+ * https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx91
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	aliases {
+		can0 = &flexcan1;
+		can1 = &flexcan2;
+		eeprom0 = &som_eeprom;
+		ethernet0 = &eqos;
+		ethernet1 = &fec;
+		i2c0 = &lpi2c2;
+		i2c1 = &lpi2c3;
+		i2c2 = &lpi2c1;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		mmc2 = &usdhc3;
+		rtc0 = &rtc_i2c;
+		rtc1 = &bbnsm_rtc;
+		serial0 = &lpuart1;
+		serial1 = &lpuart6;
+		serial2 = &lpuart7;
+		serial3 = &lpuart2;
+		usb0 = &usbotg1;
+		usb1 = &usbotg2;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	reg_sdio_a_vmmc: regulator-sdhci2-vmmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sdio_a_pwr_en>;
+		/* OSM SDIO_A_PWR_EN (OSM D21) */
+		gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		off-on-delay-us = <100000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "SDIO_A_PWR_EN";
+		startup-delay-us = <20000>;
+	};
+
+	reg_sdio_a_vqmmc: regulator-sdhci2-vqmmc {
+		compatible = "regulator-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sdio_a_vsel>;
+		/* PMIC_SD_2_VSEL */
+		gpios = <&gpio3 19 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "LDO1-VSEL-SD (PMIC)";
+		states = <1800000 0x1>,
+			 <3300000 0x0>;
+		vin-supply = <&reg_sd_3v3_1v8>;
+	};
+
+	reg_usb_b_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usb_b_en>;
+		/* OSM USB_B_EN (OSM AC20) */
+		gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "USB_B_EN";
+		startup-delay-us = <20000>;
+	};
+};
+
+/* OSM ADC_0, ADC_1 */
+&adc1 {
+	vref-supply = <&reg_1v8>;
+};
+
+/* OSM ETH_A */
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio>, <&pinctrl_eth_a>;
+
+	mdio: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+	};
+};
+
+/* OSM ETH_B */
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eth_b>;
+};
+
+/* OSM CAN_A */
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can_a>;
+};
+
+/* OSM CAN_B */
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can_b>;
+};
+
+&gpio1 {
+	gpio-line-names =
+		"OSM_AA20",
+		"OSM_AA21",
+		"PMIC_I2C_SCL",
+		"PMIC_I2C_SDA",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"OSM_AC20", /* 10 */
+		"OSM_AA23",
+		"",
+		"",
+		"",
+		"";
+};
+
+&gpio2 {
+	gpio-line-names =
+		"OSM_D17",
+		"OSM_E17",
+		"OSM_F17",
+		"OSM_G17",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"OSM_Y15",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 20 */
+		"",
+		"OSM_H17",
+		"",
+		"OSM_J17",
+		"",
+		"",
+		"",
+		"OSM_AA16",
+		"OSM_AA15";
+};
+
+&gpio3 {
+	gpio-line-names =
+		"OSM_J21",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"OSM_D21",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"PMIC_SD_2_VSEL",
+		"", /* 20 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"CTRL_INT#",
+		"",
+		"",
+		"", /* 30 */
+		"";
+};
+
+&gpio4 {
+	gpio-line-names =
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"OSM_K17",
+		"OSM_L17",
+		"",
+		"",
+		"",
+		"",
+		"", /* 20 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"OSM_AC16",
+		"OSM_AC15";
+};
+
+/* OSM I2C_B */
+&lpi2c1 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c_b>;
+	pinctrl-1 = <&pinctrl_i2c_b_gpio>;
+	clock-frequency = <100000>;
+	scl-gpios = <&gpio1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
+
+	status = "okay";
+
+	rtc_i2c: rtc@32 {
+		compatible = "epson,rx8130";
+		reg = <0x32>;
+	};
+};
+
+/* On-module I2C - PMIC_I2C */
+&lpi2c2 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_pmic_i2c>, <&pinctrl_ctrl_int>;
+	pinctrl-1 = <&pinctrl_pmic_i2c_gpio>, <&pinctrl_ctrl_int>;
+	clock-frequency = <400000>;
+	scl-gpios = <&gpio1 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
+
+	status = "okay";
+
+	som_gpio_expander: gpio@21 {
+		compatible = "nxp,pcal6416";
+		reg = <0x21>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio3>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names =
+			"OSM_D19", /* OSM GPIO_B_0 */
+			"OSM_E19", /* OSM GPIO_B_1 */
+			"OSM_F19", /* OSM GPIO_B_2 */
+			"OSM_G19", /* OSM GPIO_B_3 */
+			"OSM_H19", /* OSM GPIO_B_4 */
+			"OSM_J19", /* OSM GPIO_B_5 */
+			"OSM_K19", /* OSM GPIO_B_6 */
+			"OSM_L19", /* OSM GPIO_B_7 */
+			"OSM_D3",  /* OSM GPIO_C_0 */
+			"OSM_D4",  /* OSM GPIO_C_1 */
+			"OSM_E3",  /* OSM GPIO_C_2/CAM_B_PWR   */
+			"OSM_E4",  /* OSM GPIO_C_3/CAM_B_RST#  */
+			"OSM_F3",  /* OSM GPIO_C_4/DISP_VDD_EN */
+			"OSM_F4",  /* OSM GPIO_C_5/DISP_BL_EN  */
+			"OSM_G3",  /* OSM GPIO_C_6/CAM_A_PWR   */
+			"OSM_G4";  /* OSM GPIO_C_7/CAM_A_RST#  */
+	};
+
+	tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+	};
+
+	pmic@32 {
+		compatible = "nxp,pf9453";
+		reg = <0x32>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+
+		regulators {
+			BUCK1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1100000>;
+				regulator-min-microvolt = <1100000>;
+				regulator-name = "+V1.1_DDR (PMIC BUCK1)";
+			};
+
+			reg_vdd_soc: BUCK2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <950000>;
+				regulator-min-microvolt = <612500>;
+				regulator-name = "+VDD_SOC (PMIC BUCK2)";
+				regulator-ramp-delay = <12500>;
+			};
+
+			reg_1v8: BUCK3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "+V1.8 / +V1.8_ANA (PMIC BUCK3)";
+			};
+
+			reg_3v3: BUCK4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "+V3.3 (PMIC BUCK4)";
+			};
+
+			reg_sd_3v3_1v8: LDO1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "+V3.3_1.8_SD (PMIC LDO1)";
+			};
+
+			LDO2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <800000>;
+				regulator-min-microvolt = <800000>;
+				regulator-name = "+V0.8_ANA (PMIC LDO2)";
+			};
+
+			LDO-SNVS {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "+V1.8_BBSM (PMIC LDO-SNVS)";
+			};
+		};
+	};
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp1075";
+		reg = <0x48>;
+	};
+
+	som_eeprom: eeprom@50 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+/* OSM I2C_A */
+&lpi2c3 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c_a>;
+	pinctrl-1 = <&pinctrl_i2c_a_gpio>;
+	clock-frequency = <100000>;
+	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
+};
+
+/* OSM SPI_B */
+&lpspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi_b>, <&pinctrl_spi_b_cs0_gpio>;
+	cs-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+};
+
+/* OSM SPI_A */
+&lpspi8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi_a>, <&pinctrl_spi_a_cs0_gpio>;
+	cs-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+};
+
+/* OSM UART_CON, used as the Linux Console */
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart_con>;
+};
+
+/* OSM UART_C */
+&lpuart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart_c>;
+};
+
+/* OSM UART_A */
+&lpuart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart_a>;
+	uart-has-rtscts;
+};
+
+/* OSM UART_B */
+&lpuart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart_b>;
+	uart-has-rtscts;
+};
+
+/* OSM I2S_A */
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2s_a>;
+	assigned-clocks = <&clk IMX93_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <12288000>;
+	fsl,sai-mclk-direction-output;
+};
+
+/* OSM PWM_0 */
+&tpm4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0>;
+};
+
+/* OSM PWM_1 */
+&tpm5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+};
+
+/* OSM PWM_2 */
+&tpm6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm2>;
+};
+
+/* OSM USB_A */
+&usbotg1 {
+	dr_mode = "otg";
+	adp-disable;
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	disable-over-current;
+	role-switch-default-mode = "peripheral";
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	samsung,picophy-pre-emp-curr-control = <3>;
+};
+
+/* OSM USB_B */
+&usbotg2 {
+	disable-over-current;
+	dr_mode = "host";
+	vbus-supply = <&reg_usb_b_vbus>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	samsung,picophy-pre-emp-curr-control = <3>;
+};
+
+/* On-module eMMC */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_emmc>;
+	pinctrl-1 = <&pinctrl_emmc>;
+	pinctrl-2 = <&pinctrl_emmc>;
+	no-sd;
+	no-sdio;
+	non-removable;
+
+	status = "okay";
+};
+
+/* OSM SDIO_A */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_sdio_a>, <&pinctrl_sdio_a_cd>;
+	pinctrl-1 = <&pinctrl_sdio_a>, <&pinctrl_sdio_a_cd>;
+	pinctrl-2 = <&pinctrl_sdio_a>, <&pinctrl_sdio_a_cd>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	vmmc-supply = <&reg_sdio_a_vmmc>;
+	vqmmc-supply = <&reg_sdio_a_vqmmc>;
+};
+
+/* OSM SDIO_B */
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_sdio_b>;
+	pinctrl-1 = <&pinctrl_sdio_b>;
+	pinctrl-2 = <&pinctrl_sdio_b>;
+	disable-wp;
+};
+
+&wdog3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
new file mode 100644
index 000000000000..566671b32308
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
@@ -0,0 +1,324 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex OSM iMX93/iMX91 SoM on OSM Development carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx93
+ * https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx91
+ * https://www.toradex.com/products/carrier-board/osm-development-board
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include <dt-bindings/usb/pd.h>
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	reg_carrier_1p8v: regulator-carrier-1p8v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "On-carrier V1.8_SW";
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
+/* OSM ADC_0, ADC_1 */
+&adc1 {
+	status = "okay";
+};
+
+/* OSM ETH_A */
+&eqos {
+	phy-handle = <&ethphy_a>;
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+};
+
+/* OSM ETH_B */
+&fec {
+	phy-handle = <&ethphy_b>;
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+};
+
+/* OSM CAN_A */
+&flexcan1 {
+	status = "okay";
+};
+
+/* OSM CAN_B */
+&flexcan2 {
+	status = "okay";
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_a1>, <&pinctrl_gpio_a2>, <&pinctrl_gpio_a3>,
+		    <&pinctrl_gpio_a4>, <&pinctrl_gpio_a5>;
+};
+
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_a6>;
+};
+
+/* OSM I2C_B */
+&lpi2c1 {
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c_csi: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c_lvds: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* I2C on DSI connector pin #4 and #6 */
+		i2c_dsi_1: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* I2C on DSI connector pin #52 and #54 */
+		i2c_dsi_2: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+/* OSM I2C_A */
+&lpi2c3 {
+	status = "okay";
+
+	wm8904_1a: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_a_mclk>;
+		clocks = <&clk IMX93_CLK_SAI3>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_carrier_1p8v>;
+		CPVDD-supply = <&reg_carrier_1p8v>;
+		DBVDD-supply = <&reg_carrier_1p8v>;
+		DCVDD-supply = <&reg_carrier_1p8v>;
+		MICVDD-supply = <&reg_carrier_1p8v>;
+	};
+
+	gpio@20 {
+		compatible = "nxp,pcal6408";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names =
+			"PWR_CTRL_CAN_A", /* 0 */
+			"PWR_CTRL_CAN_B",
+			"PWR_CTRL_USB-HUB",
+			"LVDS_MUX_CTRL",
+			"USB_MUX_CTRL",
+			"I2CA_IOEXP_P5",
+			"I2CA_IOEXP_P6",
+			"I2CA_IOEXP_P7";
+
+		lvds_mux_ctrl: lvds-mux-ctrl-hog {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_HIGH>;
+			line-name = "LVDS_MUX_CTRL";
+			output-high;
+		};
+
+		usb_mux_ctrl: usb-mux-ctrl-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			line-name = "USB_MUX_CTRL";
+			output-low;
+		};
+	};
+
+	hwmon@40 {
+		compatible = "ti,ina219";
+		reg = <0x40>;
+		shunt-resistor = <10000>;
+	};
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp1075";
+		reg = <0x4f>;
+	};
+
+	tcpc@52 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x52>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_a0>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB_A";
+			data-role = "dual";
+			power-role = "dual";
+			try-power-role = "sink";
+			self-powered;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
+
+			port {
+				usb_c_a_conn_hs: endpoint {
+					remote-endpoint = <&usb_a_hs>;
+				};
+			};
+		};
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* OSM SPI_B */
+&lpspi1 {
+	status = "okay";
+};
+
+/* OSM SPI_A */
+&lpspi8 {
+	status = "okay";
+};
+
+/* OSM UART_CON, used as the Linux Console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* OSM UART_C */
+&lpuart2 {
+	status = "okay";
+};
+
+/* OSM UART_A */
+&lpuart6 {
+	status = "okay";
+};
+
+/* OSM UART_B */
+&lpuart7 {
+	status = "okay";
+};
+
+/* OSM ETH_MDIO */
+&mdio {
+	status = "okay";
+
+	ethphy_a: ethernet-phy@2 {
+		reg = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_a7>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+
+	ethphy_b: ethernet-phy@3 {
+		reg = <3>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+/* OSM I2S_A */
+&sai3 {
+	status = "okay";
+};
+
+/* OSM PWM_0 */
+&tpm4 {
+	status = "okay";
+};
+
+/* OSM PWM_1 */
+&tpm5 {
+	status = "okay";
+};
+
+/* OSM PWM_2 */
+&tpm6 {
+	status = "okay";
+};
+
+/* OSM USB_A */
+&usbotg1 {
+	status = "okay";
+
+	port {
+		usb_a_hs: endpoint {
+			remote-endpoint = <&usb_c_a_conn_hs>;
+		};
+	};
+};
+
+/* OSM USB_B */
+&usbotg2 {
+	status = "okay";
+};
+
+/* OSM SDIO_A */
+&usdhc2 {
+	status = "okay";
+};
+
+/* OSM SDIO_B */
+&usdhc3 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dts b/arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dts
new file mode 100644
index 000000000000..a6cc2ae35d04
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex OSM iMX93 SoM on OSM Development carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx93
+ * https://www.toradex.com/products/carrier-board/osm-development-board
+ */
+
+/dts-v1/;
+
+#include "imx93.dtsi"
+#include "imx93-toradex-osm.dtsi"
+#include "imx93-imx91-toradex-osm-dev-common.dtsi"
+
+/ {
+	model = "Toradex OSM iMX93 on OSM Development Board";
+	compatible = "toradex,osm-imx93-dev",
+		     "toradex,osm-imx93",
+		     "fsl,imx93";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi b/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
new file mode 100644
index 000000000000..ea5e6055e3f5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
@@ -0,0 +1,357 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex OSM iMX93 SoM
+ *
+ * https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx93
+ */
+
+#include "imx93-pinfunc.h"
+#include "imx93-imx91-toradex-osm-common.dtsi"
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		rsc_table: rsc-table@2021e000 {
+			reg = <0 0x2021e000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@a4000000 {
+			reg = <0 0xa4000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@a4008000 {
+			reg = <0 0xa4008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@a4010000 {
+			reg = <0 0xa4010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@a4018000 {
+			reg = <0 0xa4018000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@a4020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0xa4020000 0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&cm33 {
+	mbox-names = "tx", "rx", "rxdb";
+	mboxes = <&mu1 0 1>,
+		 <&mu1 1 1>,
+		 <&mu1 3 1>;
+	memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+
+	status = "okay";
+};
+
+&mu1 {
+	status = "okay";
+};
+
+&iomuxc {
+	/* OSM CAN_A */
+	pinctrl_can_a: can1grp {
+		fsl,pins = <MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e>, /* OSM AB17 */
+			   <MX93_PAD_PDM_CLK__CAN1_TX		0x139e>; /* OSM AC17 */
+	};
+
+	/* OSM CAN_B */
+	pinctrl_can_b: can2grp {
+		fsl,pins = <MX93_PAD_GPIO_IO25__CAN2_TX		0x139e>, /* OSM AC19 */
+			   <MX93_PAD_GPIO_IO27__CAN2_RX		0x139e>; /* OSM AB19 */
+	};
+
+	/* OSM CAM_MCK */
+	pinctrl_cam_mck: ccmclk1grp {
+		fsl,pins = <MX93_PAD_CCM_CLKO1__CCMSRCGPCMIX_CLKO1	0x51e>; /* OSM C2 */
+	};
+
+	/* OSM ETH_A RGMII */
+	pinctrl_eth_a: eqosgrp {
+		fsl,pins = <MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x1fe>, /* OSM K15 */
+			   <MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x1fe>, /* OSM L15 */
+			   <MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x1fe>, /* OSM N15 */
+			   <MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x1fe>, /* OSM P15 */
+			   <MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x1fe>, /* OSM R15 */
+			   <MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x1fe>, /* OSM M15 */
+			   <MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x1fe>, /* OSM H15 */
+			   <MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x1fe>, /* OSM G15 */
+			   <MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x1fe>, /* OSM H16 */
+			   <MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x1fe>, /* OSM G16 */
+			   <MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x1fe>, /* OSM J15 */
+			   <MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x1fe>; /* OSM K16 */
+	};
+
+	/* OSM ETH_MDIO */
+	pinctrl_mdio: eqosmdiogrp {
+		fsl,pins = <MX93_PAD_ENET1_MDC__ENET_QOS_MDC	0x1fe>, /* OSM T16 */
+			   <MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO	0x1fe>; /* OSM T15 */
+	};
+
+	/* OSM ETH_B RGMII */
+	pinctrl_eth_b: fecgrp {
+		fsl,pins = <MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x1fe>, /* OSM J1 */
+			   <MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x1fe>, /* OSM K1 */
+			   <MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x1fe>, /* OSM M1 */
+			   <MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x1fe>, /* OSM N1 */
+			   <MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x1fe>, /* OSM P1 */
+			   <MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x1fe>, /* OSM L1 */
+			   <MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x1fe>, /* OSM G1 */
+			   <MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x1fe>, /* OSM F1 */
+			   <MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x1fe>, /* OSM G2 */
+			   <MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x1fe>, /* OSM F2 */
+			   <MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x1fe>, /* OSM H1 */
+			   <MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x1fe>; /* OSM J2 */
+	};
+
+	/* OSM SPI_B_CS as GPIO */
+	pinctrl_spi_b_cs0_gpio: gpio1io11grp {
+		fsl,pins = <MX93_PAD_SAI1_TXFS__GPIO1_IO11	0x139e>; /* OSM AA23 */
+	};
+
+	/* OSM GPIO_A_0 */
+	pinctrl_gpio_a0:  gpio2io0grp {
+		fsl,pins = <MX93_PAD_GPIO_IO00__GPIO2_IO00	0x139e>; /* OSM D17 */
+	};
+
+	/* OSM GPIO_A_1 */
+	pinctrl_gpio_a1: gpio2io1grp {
+		fsl,pins = <MX93_PAD_GPIO_IO01__GPIO2_IO01	0x139e>; /* OSM E17 */
+	};
+
+	/* OSM GPIO_A_2 */
+	pinctrl_gpio_a2: gpio2io2grp {
+		fsl,pins = <MX93_PAD_GPIO_IO02__GPIO2_IO02	0x139e>; /* OSM F17 */
+	};
+
+	/* OSM GPIO_A_3 */
+	pinctrl_gpio_a3: gpio2io3grp {
+		fsl,pins = <MX93_PAD_GPIO_IO03__GPIO2_IO03	0x139e>; /* OSM G17 */
+	};
+
+	/* OSM SPI_A_CS0 as GPIO */
+	pinctrl_spi_a_cs0_gpio: gpio2io12grp {
+		fsl,pins = <MX93_PAD_GPIO_IO12__GPIO2_IO12	0x139e>; /* OSM Y15 */
+	};
+
+	/* OSM PWM_0 as GPIO */
+	pinctrl_pwm0_gpio: gpio2io21grp {
+		fsl,pins = <MX93_PAD_GPIO_IO21__GPIO2_IO21	0x139e>; /* OSM E18 */
+	};
+
+	/* OSM GPIO_A_4 */
+	pinctrl_gpio_a4: gpio2io22grp {
+		fsl,pins = <MX93_PAD_GPIO_IO22__GPIO2_IO22	0x139e>; /* OSM H17 */
+	};
+
+	/* OSM GPIO_A_5 */
+	pinctrl_gpio_a5: gpio2io24grp {
+		fsl,pins = <MX93_PAD_GPIO_IO24__GPIO2_IO24	0x139e>; /* OSM J17 */
+	};
+
+	/* On-module CTRL_INT# */
+	pinctrl_ctrl_int: gpio3io27grp {
+		fsl,pins = <MX93_PAD_CCM_CLKO2__GPIO3_IO27	0x139e>; /* CTRL_INT# */
+	};
+
+	/* OSM GPIO_A_6 */
+	pinctrl_gpio_a6: gpio4io14grp {
+		fsl,pins = <MX93_PAD_ENET2_MDC__GPIO4_IO14	0x139e>; /* OSM K17 */
+	};
+
+	/* OSM GPIO_A_7 */
+	pinctrl_gpio_a7:  gpio4io15grp {
+		fsl,pins = <MX93_PAD_ENET2_MDIO__GPIO4_IO15	0x139e>; /* OSM L17 */
+	};
+
+	/* OSM I2C_B as GPIO */
+	pinctrl_i2c_b_gpio: lpi2c1gpiogrp {
+		fsl,pins = <MX93_PAD_I2C1_SCL__GPIO1_IO00	0x40000b9e>, /* OSM AA20 */
+			   <MX93_PAD_I2C1_SDA__GPIO1_IO01	0x40000b9e>; /* OSM AA21 */
+	};
+
+	/* OSM I2C_B */
+	pinctrl_i2c_b: lpi2c1grp {
+		fsl,pins = <MX93_PAD_I2C1_SCL__LPI2C1_SCL	0x40000b9e>, /* OSM AA20 */
+			   <MX93_PAD_I2C1_SDA__LPI2C1_SDA	0x40000b9e>; /* OSM AA21 */
+	};
+
+	/* On-module PMIC I2C as GPIO */
+	pinctrl_pmic_i2c_gpio: lpi2c2gpiogrp {
+		fsl,pins = <MX93_PAD_I2C2_SCL__GPIO1_IO02	0x40000b9e>, /* PMIC_I2C_SCL */
+			   <MX93_PAD_I2C2_SDA__GPIO1_IO03	0x40000b9e>; /* PMIC_I2C_SDA */
+	};
+
+	/* On-module PMIC I2C */
+	pinctrl_pmic_i2c: lpi2c2grp {
+		fsl,pins = <MX93_PAD_I2C2_SCL__LPI2C2_SCL	0x40000b9e>, /* PMIC_I2C_SCL */
+			   <MX93_PAD_I2C2_SDA__LPI2C2_SDA	0x40000b9e>; /* PMIC_I2C_SDA */
+	};
+
+	/* OSM I2C_A as GPIO */
+	pinctrl_i2c_a_gpio: lpi2c3gpiogrp {
+		fsl,pins = <MX93_PAD_GPIO_IO28__GPIO2_IO28	0x40000b9e>, /* OSM AA16 */
+			   <MX93_PAD_GPIO_IO29__GPIO2_IO29	0x40000b9e>; /* OSM AA15 */
+	};
+
+	/* OSM I2C_A */
+	pinctrl_i2c_a: lpi2c3grp {
+		fsl,pins = <MX93_PAD_GPIO_IO28__LPI2C3_SDA	0x40000b9e>, /* OSM AA16 */
+			   <MX93_PAD_GPIO_IO29__LPI2C3_SCL	0x40000b9e>; /* OSM AA15 */
+	};
+
+	/* OSM SPI_B */
+	pinctrl_spi_b: lpspi1grp {
+		fsl,pins = <MX93_PAD_SAI1_TXC__LPSPI1_SIN	0x139e>, /* OSM Y22 */
+			   <MX93_PAD_SAI1_TXD0__LPSPI1_SCK	0x139e>, /* OSM Y21 */
+			   <MX93_PAD_SAI1_RXD0__LPSPI1_SOUT	0x139e>; /* OSM Y23 */
+	};
+
+	/* OSM SPI_A */
+	pinctrl_spi_a: lpspi8grp {
+		fsl,pins = <MX93_PAD_GPIO_IO13__LPSPI8_SIN	0x139e>, /* OSM U15 */
+			   <MX93_PAD_GPIO_IO14__LPSPI8_SOUT	0x139e>, /* OSM V15 */
+			   <MX93_PAD_GPIO_IO15__LPSPI8_SCK	0x139e>; /* OSM U16 */
+	};
+
+	/* OSM UART_CON */
+	pinctrl_uart_con: lpuart1grp {
+		fsl,pins = <MX93_PAD_UART1_RXD__LPUART1_RX	0x39e>, /* OSM D22 */
+			   <MX93_PAD_UART1_TXD__LPUART1_TX	0x39e>; /* OSM D23 */
+	};
+
+	/* OSM UART_C */
+	pinctrl_uart_c: lpuart2grp {
+		fsl,pins = <MX93_PAD_UART2_RXD__LPUART2_RX	0x39e>, /* OSM A22 */
+			   <MX93_PAD_UART2_TXD__LPUART2_TX	0x39e>; /* OSM B23 */
+	};
+
+	/* OSM UART_A */
+	pinctrl_uart_a: lpuart6grp {
+		fsl,pins = <MX93_PAD_GPIO_IO04__LPUART6_TX	0x39e>, /* OSM B13 */
+			   <MX93_PAD_GPIO_IO05__LPUART6_RX	0x39e>, /* OSM A14 */
+			   <MX93_PAD_GPIO_IO06__LPUART6_CTS_B	0x39e>, /* OSM C14 */
+			   <MX93_PAD_GPIO_IO07__LPUART6_RTS_B	0x39e>; /* OSM C13 */
+	};
+
+	/* OSM UART_B */
+	pinctrl_uart_b: lpuart7grp {
+		fsl,pins = <MX93_PAD_GPIO_IO08__LPUART7_TX	0x39e>, /* OSM D13 */
+			   <MX93_PAD_GPIO_IO09__LPUART7_RX	0x39e>, /* OSM D14 */
+			   <MX93_PAD_GPIO_IO10__LPUART7_CTS_B	0x39e>, /* OSM D16 */
+			   <MX93_PAD_GPIO_IO11__LPUART7_RTS_B	0x39e>; /* OSM D15 */
+	};
+
+	/* OSM I2S_A */
+	pinctrl_i2s_a: sai3grp {
+		fsl,pins = <MX93_PAD_GPIO_IO16__SAI3_TX_BCLK	0x139e>, /* OSM W20 */
+			   <MX93_PAD_GPIO_IO19__SAI3_TX_DATA00	0x139e>, /* OSM W21 */
+			   <MX93_PAD_GPIO_IO20__SAI3_RX_DATA00	0x139e>, /* OSM V21 */
+			   <MX93_PAD_GPIO_IO26__SAI3_TX_SYNC	0x139e>; /* OSM W18 */
+	};
+
+	/* OSM I2S_MCLK */
+	pinctrl_i2s_a_mclk: sai3mclkgrp {
+		fsl,pins = <MX93_PAD_GPIO_IO17__SAI3_MCLK	0x31e>; /* OSM V18 */
+	};
+
+	/* OSM PWM_0 */
+	pinctrl_pwm0: tpm4ch1grp {
+		fsl,pins = <MX93_PAD_GPIO_IO21__TPM4_CH1	0x139e>; /* OSM E18 */
+	};
+
+	/* OSM PWM_1 */
+	pinctrl_pwm1: tpm5ch2grp {
+		fsl,pins = <MX93_PAD_GPIO_IO18__TPM5_CH2	0x139e>; /* OSM F18 */
+	};
+
+	/* OSM PWM_2 */
+	pinctrl_pwm2: tpm6ch1grp {
+		fsl,pins = <MX93_PAD_GPIO_IO23__TPM6_CH1	0x139e>; /* OSM G18 */
+	};
+
+	/* OSM USB_A_EN */
+	pinctrl_usb_a_en: usb1engrp {
+		fsl,pins = <MX93_PAD_CCM_CLKO3__GPIO4_IO28	0x139e>; /* OSM AC16 */
+	};
+
+	/* OSM USB_A_OC# */
+	pinctrl_usb_a_oc: usb1ocgrp {
+		fsl,pins = <MX93_PAD_CCM_CLKO4__GPIO4_IO29	0x139e>; /* OSM AC15 */
+	};
+
+	/* OSM USB_B_EN */
+	pinctrl_usb_b_en: usb2engrp {
+		fsl,pins = <MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10	0x139e>; /* OSM AC20 */
+	};
+
+	/* On-module eMMC */
+	pinctrl_emmc: usdhc1grp {
+		fsl,pins = <MX93_PAD_SD1_CLK__USDHC1_CLK	0x5fe>,      /* eMMC_CLK    */
+			   <MX93_PAD_SD1_CMD__USDHC1_CMD	0x400013fe>, /* eMMC_CMD    */
+			   <MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x400013fe>, /* eMMC_DATA0  */
+			   <MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013fe>, /* eMMC_DATA1  */
+			   <MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013fe>, /* eMMC_DATA2  */
+			   <MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013fe>, /* eMMC_DATA3  */
+			   <MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013fe>, /* eMMC_DATA4  */
+			   <MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013fe>, /* eMMC_DATA5  */
+			   <MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013fe>, /* eMMC_DATA6  */
+			   <MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013fe>, /* eMMC_DATA7  */
+			   <MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1580>;     /* eMMC_STROBE */
+	};
+
+	/* OSM SDIO_A_CD# */
+	pinctrl_sdio_a_cd: usdhc2cdgrp {
+		fsl,pins = <MX93_PAD_SD2_CD_B__GPIO3_IO00	0x139e>; /* OSM J21 */
+	};
+
+	/* OSM SDIO_A */
+	pinctrl_sdio_a: usdhc2grp {
+		fsl,pins = <MX93_PAD_SD2_CLK__USDHC2_CLK	0x5fe>,      /* OSM F21 */
+			   <MX93_PAD_SD2_CMD__USDHC2_CMD	0x400013fe>, /* OSM E20 */
+			   <MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x400013fe>, /* OSM G20 */
+			   <MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x400013fe>, /* OSM G21 */
+			   <MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x400013fe>, /* OSM H20 */
+			   <MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x400013fe>; /* OSM H21 */
+	};
+
+	/* OSM SDIO_A_PWR_EN */
+	pinctrl_sdio_a_pwr_en: usdhc2pwrgrp {
+		fsl,pins = <MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x139e>; /* OSM D21 */
+	};
+
+	/* On-module PMIC_SD_2_VSEL */
+	pinctrl_sdio_a_vsel: usdhc2vselgrp {
+		fsl,pins = <MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e>; /* PMIC_SD_2_VSEL */
+	};
+
+	/* OSM SDIO_B */
+	pinctrl_sdio_b: usdhc3grp {
+		fsl,pins = <MX93_PAD_SD3_CLK__USDHC3_CLK	0x5fe>,      /* OSM K20 */
+			   <MX93_PAD_SD3_CMD__USDHC3_CMD	0x400013fe>, /* OSM K21 */
+			   <MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe>, /* OSM L20 */
+			   <MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe>, /* OSM L21 */
+			   <MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe>, /* OSM M21 */
+			   <MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe>; /* OSM N20 */
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY 0x31e>; /* PMIC_WDOG_B */
+	};
+};
-- 
2.47.3

