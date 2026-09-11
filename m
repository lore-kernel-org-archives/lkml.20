Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5687F459AE6;
	Fri, 11 Sep 2026 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118430; cv=none; b=Z1OcWOqijt5TI8/+o56HQ8ck3BgPrinhS8s0jf7PAJK/rPsQQMKSDFNykvG4kWsDcyKsloXk6a/tPfzLimuv/G5hfV53NDd7w/5Lc+Xpj7xfhkU+uXRJTNOnU8nq36rZ3NCBoTs1JwcwwvVNxr0LIJ54Sxm+kiX4lxxJund3hLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118430; c=relaxed/simple;
	bh=zDuozSFLN77ms0vTMzTQo2/EhAtb8lCRzYfx0JJewuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ka+dRnfzYVNOFh8oNqPzXgxho06MyHk8SNvQ2g6buaC1urPF67ideXzjzhvpL1kJJsukHzUk1WycFxxriB+2L3IgqN3h9g1PtjzLfGqxwmosbdPEWBPIIye6oh6BoAB0Hh9t3iDl/UJZJRiwj9jQYK2BCa8+xD9Tqc10LHW0SYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Fpg8hlw3; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Fpg8hlw3"
Received: from francesco-nb.. (93-33-8-46.ip42.fastwebnet.it [93.33.8.46])
	by mail11.truemail.it (Postfix) with ESMTPA id D4C9E22DF8;
	Fri, 11 Sep 2026 11:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789118424;
	bh=+fXgJ6FTBhJKMQWWGbI864QlYzjIWfxe9el3rWoJZGo=; h=From:To:Subject;
	b=Fpg8hlw3O99YIIFfe8WplUm6EKGw+Tg6jLkDgOxRzEbFFQ7xAzh9NYMwZ8phhaH4N
	 yBVS+xJXy5PiYrO0JL3PaiV9Q6iyYUdQnU5aEDuZwOnkkVWO/wTwN6OS7IeDYIPctN
	 nyOMEXnZdnaVgZ0gVNdDKM2sJDBA+2dMgI03omqTYT5nnGbBtlhaNLCho+3pFyNyXf
	 aIAw0lLF4pcytfVz26m5FwskLkNyxp/+9x1kV/k5knHTNoAMAOoyeBStWACY0rP1CN
	 gc7g8wKY++zVU592Wn21IssIhhd9m4yK3eIq3LMhjpx25tcKe2qVYjCAsWHV8OWzbo
	 VdRzRtAYalg9w==
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
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Date: Fri, 11 Sep 2026 11:19:46 +0200
Message-ID: <20260911091952.96233-4-francesco@dolcini.it>
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

Add support for the Lino iMX93 SoM, its Verdin adapter and development
carrier board.

The SoM is available in two variants, with i.MX91 or i.MX93 SoC, using
the same PCB (the two chips are pin to pin compatible), to avoid
duplication create a common dtsi to share commonalities.

Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
Link: https://www.toradex.com/accessories/lino-verdin-adapter
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Co-developed-by: Franz Schnyder <franz.schnyder@toradex.com>
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2:
- drop #address-cells/#size-cells from &lpi2c1, &lpi2c2, &lpi2c3 and
  &lpi2c4, already set in imx91_93_common.dtsi.
- drop #sound-dai-cells from &sai3, already set in imx91_93_common.dtsi.
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../freescale/imx93-imx91-lino-common.dtsi    | 536 ++++++++++++++++++
 .../imx93-imx91-lino-verdin-common.dtsi       | 175 ++++++
 .../imx93-imx91-lino-verdin-dev-common.dtsi   | 216 +++++++
 .../dts/freescale/imx93-lino-verdin-dev.dts   |  24 +
 arch/arm64/boot/dts/freescale/imx93-lino.dtsi | 359 ++++++++++++
 6 files changed, 1311 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dev-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 984642146dd9..eb71f126a8ed 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -887,6 +887,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi
new file mode 100644
index 000000000000..f8f13f785860
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi
@@ -0,0 +1,536 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Lino iMX93/iMX91 SoM
+ *
+ * https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
+ * https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx91
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
+		i2c1 = &lpi2c1;
+		i2c2 = &lpi2c3;
+		i2c3 = &lpi2c4;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		mmc2 = &usdhc3;
+		serial0 = &lpuart6;
+		serial1 = &lpuart7;
+		serial2 = &lpuart1;
+		serial3 = &lpuart2;
+		usb0 = &usbotg1;
+		usb1 = &usbotg2;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	/* Lino SD_1 Power Supply */
+	reg_sd1_vmmc: regulator-sdhci2-vmmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sd1_pwr_en>;
+		/* Lino SD_1_PWR_EN (Lino P72) */
+		gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		off-on-delay-us = <100000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "+V3.3_SD";
+		startup-delay-us = <20000>;
+	};
+
+	reg_sd1_vqmmc: regulator-sdhci2-vqmmc {
+		compatible = "regulator-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sd1_vsel>;
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
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		/* Lino USB_1_EN (P27) */
+		gpios = <&som_gpio_expander 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "USB_1_EN";
+		startup-delay-us = <20000>;
+	};
+
+	reg_usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		/* Lino USB_2_EN (P61) */
+		gpios = <&som_gpio_expander 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "USB_2_EN";
+		startup-delay-us = <20000>;
+	};
+};
+
+/* Lino ADC_1, ADC_2, ADC_3 and ADC_4 */
+&adc1 {
+	vref-supply = <&reg_1v8>;
+};
+
+/* Lino ETH_1 */
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio>, <&pinctrl_eth1>;
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
+/* Lino ETH_2 */
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eth2>;
+};
+
+/* Lino CAN_1 */
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can1>;
+};
+
+/* Lino CAN_2 */
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can2>;
+};
+
+&gpio1 {
+	gpio-line-names =
+		"LINO_P18",
+		"LINO_P16",
+		"PMIC_I2C_SCL",
+		"PMIC_I2C_SDA",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"LINO_P65", /* 10 */
+		"LINO_S18",
+		"LINO_S24",
+		"LINO_S20",
+		"LINO_S22",
+		"";
+};
+
+&gpio2 {
+	gpio-line-names =
+		"LINO_P30",
+		"LINO_P32",
+		"LINO_P24",
+		"LINO_P26",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"LINO_P58",
+		"",
+		"",
+		"",
+		"",
+		"LINO_P34",
+		"",
+		"",
+		"", /* 20 */
+		"",
+		"LINO_P36",
+		"",
+		"LINO_P38",
+		"",
+		"",
+		"",
+		"LINO_P20",
+		"LINO_P22";
+};
+
+&gpio3 {
+	gpio-line-names =
+		"LINO_P78",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"LINO_P72",
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
+		"LINO_P40",
+		"LINO_P42",
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
+		"LINO_P46",
+		"LINO_P48",
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
+		"LINO_P44",
+		"GPIO_EXP_INT#";
+};
+
+/* Lino I2C_1 */
+&lpi2c1 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	clock-frequency = <100000>;
+	scl-gpios = <&gpio1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
+};
+
+/* On-module I2C - PMIC_I2C */
+&lpi2c2 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_pmic_i2c>;
+	pinctrl-1 = <&pinctrl_pmic_i2c_gpio>;
+	clock-frequency = <400000>;
+	scl-gpios = <&gpio1 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
+
+	status = "okay";
+
+	som_gpio_expander: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_exp_int>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names =
+			"Lino_P27", /* Lino USB_1_EN */
+			"Lino_P61", /* Lino USB_2_EN */
+			"TPM_SPI_CS#",
+			"Lino_P29", /* Lino USB_1_OC# */
+			"Lino_P63", /* Lino USB_2_OC# */
+			"PMIC_INT#",
+			"TPM_IRQ#",
+			"Lino_S66";
+	};
+
+	pmic@32 {
+		compatible = "nxp,pf9453";
+		reg = <0x32>;
+		interrupt-parent = <&som_gpio_expander>;
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
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
+/* Lino I2C_2 */
+&lpi2c3 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	clock-frequency = <100000>;
+	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
+};
+
+/* Lino I2C_3 */
+&lpi2c4 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	clock-frequency = <100000>;
+	scl-gpios = <&gpio2 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
+};
+
+/* Lino SPI_2 */
+&lpspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2>, <&pinctrl_spi2_cs0_gpio>;
+	cs-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>, <&som_gpio_expander 2 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+
+	tpm@1 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <1>;
+		interrupt-parent = <&som_gpio_expander>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <18500000>;
+	};
+};
+
+/* Lino SPI_1 */
+&lpspi8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1>, <&pinctrl_spi1_cs0_gpio>;
+	cs-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+};
+
+/* Lino UART_3, used as the Linux Console */
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+};
+
+/* Lino UART_4 */
+&lpuart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+};
+
+/* Lino UART_1 */
+&lpuart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	uart-has-rtscts;
+};
+
+/* Lino UART_2 */
+&lpuart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	uart-has-rtscts;
+};
+
+/* Lino I2S_1 */
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2s1>;
+	assigned-clocks = <&clk IMX93_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <24576000>;
+};
+
+/* Lino PWM_1 */
+&tpm4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+};
+
+/* Lino PWM_2 */
+&tpm5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm2>;
+};
+
+/* Lino PWM_3 */
+&tpm6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm3>;
+};
+
+/* Lino USB_1 */
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
+/* Lino USB_2 */
+&usbotg2 {
+	disable-over-current;
+	dr_mode = "host";
+	vbus-supply = <&reg_usb2_vbus>;
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
+/* Lino SD_1 */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_sd1>, <&pinctrl_sd1_cd>;
+	pinctrl-1 = <&pinctrl_sd1>, <&pinctrl_sd1_cd>;
+	pinctrl-2 = <&pinctrl_sd1>, <&pinctrl_sd1_cd>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	vmmc-supply = <&reg_sd1_vmmc>;
+	vqmmc-supply = <&reg_sd1_vqmmc>;
+};
+
+/* Lino SD_2 */
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_sd2>;
+	pinctrl-1 = <&pinctrl_sd2>;
+	pinctrl-2 = <&pinctrl_sd2>;
+};
+
+&wdog3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-common.dtsi
new file mode 100644
index 000000000000..0023e76210ce
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-common.dtsi
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Lino iMX93/iMX91 SoM on Lino-Verdin Adapter
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family
+ * https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
+ * https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx91
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/net/ti-dp83867.h>
+
+/ {
+	verdin_i2s1_mclk: clock-24576000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24576000>;
+	};
+
+	verdin_csi1_mclk: clock-25000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		id-gpios = <&adapter_gpio_expander 1 GPIO_ACTIVE_HIGH>;
+		self-powered;
+		type = "micro";
+		vbus-supply = <&reg_usb1_vbus>;
+
+		port {
+			usb_1_connector: endpoint {
+				remote-endpoint = <&usb1_drd_sw>;
+			};
+		};
+	};
+
+	verdin_gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+
+		status = "disabled";
+
+		key-wakeup {
+			debounce-interval = <10>;
+			/* Verdin CTRL_WAKE1_MICO# (SODIMM 252) */
+			gpios = <&adapter_gpio_expander 2 GPIO_ACTIVE_LOW>;
+			label = "Wake-Up";
+			wakeup-source;
+			linux,code = <KEY_WAKEUP>;
+		};
+	};
+};
+
+/* Lino ETH_1 */
+&eqos {
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+};
+
+/* Lino I2C_1 */
+&lpi2c1 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9543";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		verdin_i2c_1: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		adapter_i2c: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			adapter_gpio_expander: gpio@21 {
+				compatible = "nxp,pcal6416";
+				reg = <0x21>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_gpio_11>;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+				interrupt-parent = <&gpio1>;
+				interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				gpio-line-names =
+					"SODIMM_244", /* Verdin PCIE_1_RESET#    */
+					"SODIMM_161", /* Verdin USB_1_ID         */
+					"SODIMM_252", /* Verdin CTRL_WAKE1_MICO# */
+					"ETH_1_INT#",
+					"CTRL_EN_WIFI",
+					"",
+					"",
+					"",
+					"SODIMM_42", /* Verdin I2S_2_BCLK  */
+					"SODIMM_48", /* Verdin I2S_2_D_IN  */
+					"SODIMM_46", /* Verdin I2S_2_D_OUT */
+					"SODIMM_44", /* Verdin I2S_2_SYNC  */
+					"SODIMM_64", /* Verdin QSPI_1_CS2# */
+					"SODIMM_66", /* Verdin QSPI_1_DQS  */
+					"SODIMM_60", /* Verdin QSPI_1_IO2  */
+					"SODIMM_62"; /* Verdin QSPI_1_IO3  */
+
+				verdin_pcie_1_reset_hog: pcie-1-reset-hog {
+					gpio-hog;
+					/* Verdin PCIE_1_RESET# (SODIMM 244) */
+					gpios = <0 GPIO_ACTIVE_LOW>;
+					line-name = "PCIE_1_RESET#";
+					output-low;
+
+					status = "disabled";
+				};
+			};
+
+			/* Current measurement into module VCC */
+			hwmon@40 {
+				compatible = "ti,ina219";
+				reg = <0x40>;
+				shunt-resistor = <10000>;
+			};
+		};
+	};
+};
+
+/* Lino UART_1 */
+&lpuart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+		fw-init-baudrate = <3000000>;
+	};
+};
+
+/* Lino Ethernet MDIO */
+&mdio {
+	status = "okay";
+
+	ethphy1: ethernet-phy@1 {
+		reg = <1>;
+		interrupt-parent = <&adapter_gpio_expander>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+/* Lino USB_1 */
+&usbotg1 {
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&usb_1_connector>;
+		};
+	};
+};
+
+/* Lino SD_2 */
+&usdhc3 {
+	keep-power-in-suspend;
+	non-removable;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dev-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dev-common.dtsi
new file mode 100644
index 000000000000..1664b380e58e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dev-common.dtsi
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Lino iMX93/iMX91 SoM on Lino-Verdin Adapter / Development carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx91
+ * https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
+ * https://www.toradex.com/products/carrier-board/verdin-development-board-kit
+ */
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "verdin-nau8822";
+		simple-audio-card,routing =
+			"Headphones", "LHP",
+			"Headphones", "RHP",
+			"Speaker", "LSPK",
+			"Speaker", "RSPK",
+			"Line Out", "AUXOUT1",
+			"Line Out", "AUXOUT2",
+			"LAUX", "Line In",
+			"RAUX", "Line In",
+			"LMICP", "Mic In",
+			"RMICP", "Mic In";
+		simple-audio-card,widgets =
+			"Headphones", "Headphones",
+			"Line Out", "Line Out",
+			"Speaker", "Speaker",
+			"Microphone", "Mic In",
+			"Line", "Line In";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&nau8822_1a>;
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
+/* Lino ETH_2 */
+&fec {
+	phy-handle = <&ethphy2>;
+	phy-mode = "rgmii-id";
+
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
+/* Lino Ethernet MDIO */
+&mdio {
+	ethphy2: ethernet-phy@7 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <7>;
+		micrel,led-mode = <0>;
+	};
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
+	nau8822_1a: audio-codec@1a {
+		compatible = "nuvoton,nau8822";
+		reg = <0x1a>;
+		clock-names = "mclk";
+		clocks = <&verdin_i2s1_mclk>;
+		#sound-dai-cells = <0>;
+	};
+
+	carrier_gpio_expander: gpio@21 {
+		compatible = "nxp,pcal6416";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
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
diff --git a/arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dts b/arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dts
new file mode 100644
index 000000000000..a79553d94649
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Lino iMX93 SoM on Lino-Verdin Adapter / Development carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
+ * https://www.toradex.com/products/carrier-board/verdin-development-board-kit
+ */
+
+/dts-v1/;
+
+#include "imx93.dtsi"
+#include "imx93-lino.dtsi"
+#include "imx93-imx91-lino-verdin-common.dtsi"
+#include "imx93-imx91-lino-verdin-dev-common.dtsi"
+
+/ {
+	model = "Toradex Lino iMX93 on Verdin Adapter plus Development Board";
+	compatible = "toradex,lino-imx93-verdin-dev",
+		     "toradex,lino-imx93-verdin",
+		     "toradex,lino-imx93",
+		     "fsl,imx93";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-lino.dtsi b/arch/arm64/boot/dts/freescale/imx93-lino.dtsi
new file mode 100644
index 000000000000..cab7f344f2fe
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-lino.dtsi
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Lino iMX93 SoM
+ *
+ * https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
+ */
+
+#include "imx93-pinfunc.h"
+#include "imx93-imx91-lino-common.dtsi"
+
+/ {
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
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
+	/* Lino CAN_1 */
+	pinctrl_can1: can1grp {
+		fsl,pins = <MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e>, /* Lino P12 */
+			   <MX93_PAD_PDM_CLK__CAN1_TX		0x139e>; /* Lino P10 */
+	};
+
+	/* Lino CAN_2 */
+	pinctrl_can2: can2grp {
+		fsl,pins = <MX93_PAD_GPIO_IO25__CAN2_TX	0x139e>, /* Lino S28 */
+			   <MX93_PAD_GPIO_IO27__CAN2_RX	0x139e>; /* Lino S30 */
+	};
+
+	/* Lino ETH_1 RGMII */
+	pinctrl_eth1: eqosgrp {
+		fsl,pins = <MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x1fe>, /* Lino P77 */
+			   <MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x1fe>, /* Lino P79 */
+			   <MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x1fe>, /* Lino P81 */
+			   <MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x1fe>, /* Lino P83 */
+			   <MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x1fe>, /* Lino P73 */
+			   <MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x1fe>, /* Lino P75 */
+			   <MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x1fe>, /* Lino P97 */
+			   <MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x1fe>, /* Lino P95 */
+			   <MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x1fe>, /* Lino P93 */
+			   <MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x1fe>, /* Lino P91 */
+			   <MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x1fe>, /* Lino P89 */
+			   <MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x1fe>; /* Lino P85 */
+	};
+
+	/* Lino ETH MDIO */
+	pinctrl_mdio: eqosmdiogrp {
+		fsl,pins = <MX93_PAD_ENET1_MDC__ENET_QOS_MDC	0x1fe>, /* Lino P69 */
+			   <MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO	0x1fe>; /* Lino P67 */
+	};
+
+	/* Lino ETH_2 RGMII */
+	pinctrl_eth2: fecgrp {
+		fsl,pins = <MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x1fe>, /* Lino S77 */
+			   <MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x1fe>, /* Lino S79 */
+			   <MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x1fe>, /* Lino S81 */
+			   <MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x1fe>, /* Lino S83 */
+			   <MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x1fe>, /* Lino S71 */
+			   <MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x1fe>, /* Lino S73 */
+			   <MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x1fe>, /* Lino S99 */
+			   <MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x1fe>, /* Lino S97 */
+			   <MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x1fe>, /* Lino S93 */
+			   <MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x1fe>, /* Lino S91 */
+			   <MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x1fe>, /* Lino S87 */
+			   <MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x1fe>; /* Lino S89 */
+	};
+
+	/* Lino GPIO_11 */
+	pinctrl_gpio_11: gpio1io10grp {
+		fsl,pins = <MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10	0x139e>; /* Lino P65 */
+	};
+
+	/* Lino SPI_2_CS as GPIO */
+	pinctrl_spi2_cs0_gpio: gpio1io11grp {
+		fsl,pins = <MX93_PAD_SAI1_TXFS__GPIO1_IO11	0x139e>; /* Lino S18 */
+	};
+
+	/* Lino GPIO_1 */
+	pinctrl_gpio1: gpio2io0grp {
+		fsl,pins = <MX93_PAD_GPIO_IO00__GPIO2_IO00	0x139e>; /* Lino P30 */
+	};
+
+	/* Lino GPIO_2 */
+	pinctrl_gpio2: gpio2io1grp {
+		fsl,pins = <MX93_PAD_GPIO_IO01__GPIO2_IO01	0x139e>; /* Lino P32 */
+	};
+
+	/* Lino SPI_1_CS as GPIO */
+	pinctrl_spi1_cs0_gpio: gpio2io12grp {
+		fsl,pins = <MX93_PAD_GPIO_IO12__GPIO2_IO12	0x139e>; /* Lino P58 */
+	};
+
+	/* Lino GPIO_3 */
+	pinctrl_gpio3: gpio2io17grp {
+		fsl,pins = <MX93_PAD_GPIO_IO17__GPIO2_IO17	0x139e>; /* Lino P34 */
+	};
+
+	/* Lino GPIO_4 */
+	pinctrl_gpio4: gpio2io22grp {
+		fsl,pins = <MX93_PAD_GPIO_IO22__GPIO2_IO22	0x139e>; /* Lino P36 */
+	};
+
+	/* Lino PWM_3 as GPIO */
+	pinctrl_pwm3_gpio: gpio2io23grp {
+		fsl,pins = <MX93_PAD_GPIO_IO23__GPIO2_IO23	0x139e>; /* Lino P5 */
+	};
+
+	/* Lino GPIO_5 */
+	pinctrl_gpio5: gpio2io24grp {
+		fsl,pins = <MX93_PAD_GPIO_IO24__GPIO2_IO24	0x139e>; /* Lino P38 */
+	};
+
+	/* Lino GPIO_6 */
+	pinctrl_gpio6: gpio3io26grp {
+		fsl,pins = <MX93_PAD_CCM_CLKO1__GPIO3_IO26	0x139e>; /* Lino P40 */
+	};
+
+	/* Lino GPIO_7 */
+	pinctrl_gpio7: gpio3io27grp {
+		fsl,pins = <MX93_PAD_CCM_CLKO2__GPIO3_IO27	0x139e>; /* Lino P42 */
+	};
+
+	/* Lino GPIO_9 */
+	pinctrl_gpio9: gpio4io14grp {
+		fsl,pins = <MX93_PAD_ENET2_MDC__GPIO4_IO14	0x139e>; /* Lino P46 */
+	};
+
+	/* Lino GPIO_10 */
+	pinctrl_gpio10: gpio4io15grp {
+		fsl,pins = <MX93_PAD_ENET2_MDIO__GPIO4_IO15	0x139e>; /* Lino P48 */
+	};
+
+	/* Lino GPIO_8 */
+	pinctrl_gpio8: gpio4io28grp {
+		fsl,pins = <MX93_PAD_CCM_CLKO3__GPIO4_IO28	0x139e>; /* Lino P44 */
+	};
+
+	/* On-module GPIO_EXP_INT# */
+	pinctrl_gpio_exp_int: gpio4io29grp {
+		fsl,pins = <MX93_PAD_CCM_CLKO4__GPIO4_IO29	0x139e>; /* GPIO_EXP_INT# */
+	};
+
+	/* Lino I2C_1 as GPIO */
+	pinctrl_i2c1_gpio: lpi2c1gpiogrp {
+		fsl,pins = <MX93_PAD_I2C1_SCL__GPIO1_IO00	0x40000b9e>, /* Lino P18 */
+			   <MX93_PAD_I2C1_SDA__GPIO1_IO01	0x40000b9e>; /* Lino P16 */
+	};
+
+	/* Lino I2C_1 */
+	pinctrl_i2c1: lpi2c1grp {
+		fsl,pins = <MX93_PAD_I2C1_SCL__LPI2C1_SCL	0x40000b9e>, /* Lino P18 */
+			   <MX93_PAD_I2C1_SDA__LPI2C1_SDA	0x40000b9e>; /* Lino P16 */
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
+	/* Lino I2C_2 as GPIO */
+	pinctrl_i2c2_gpio: lpi2c3gpiogrp {
+		fsl,pins = <MX93_PAD_GPIO_IO28__GPIO2_IO28	0x40000b9e>, /* Lino P20 */
+			   <MX93_PAD_GPIO_IO29__GPIO2_IO29	0x40000b9e>; /* Lino P22 */
+	};
+
+	/* Lino I2C_2 */
+	pinctrl_i2c2: lpi2c3grp {
+		fsl,pins = <MX93_PAD_GPIO_IO28__LPI2C3_SDA	0x40000b9e>, /* Lino P20 */
+			   <MX93_PAD_GPIO_IO29__LPI2C3_SCL	0x40000b9e>; /* Lino P22 */
+	};
+
+	/* Lino I2C_3 as GPIO */
+	pinctrl_i2c3_gpio: lpi2c4gpiogrp {
+		fsl,pins = <MX93_PAD_GPIO_IO02__GPIO2_IO02	0x40000b9e>, /* Lino P24 */
+			   <MX93_PAD_GPIO_IO03__GPIO2_IO03	0x40000b9e>; /* Lino P26 */
+	};
+
+	/* Lino I2C_3 */
+	pinctrl_i2c3: lpi2c4grp {
+		fsl,pins = <MX93_PAD_GPIO_IO02__LPI2C4_SDA	0x40000b9e>, /* Lino P24 */
+			   <MX93_PAD_GPIO_IO03__LPI2C4_SCL	0x40000b9e>; /* Lino P26 */
+	};
+
+	/* Lino SPI_2 */
+	pinctrl_spi2: lpspi1grp {
+		fsl,pins = <MX93_PAD_SAI1_TXD0__LPSPI1_SCK	0x139e>, /* Lino S20 */
+			   <MX93_PAD_SAI1_RXD0__LPSPI1_SOUT	0x139e>, /* Lino S22 */
+			   <MX93_PAD_SAI1_TXC__LPSPI1_SIN	0x139e>; /* Lino S24 */
+	};
+
+	/* Lino SPI_1 */
+	pinctrl_spi1: lpspi8grp {
+		fsl,pins = <MX93_PAD_GPIO_IO13__LPSPI8_SIN	0x139e>, /* Lino P54 */
+			   <MX93_PAD_GPIO_IO14__LPSPI8_SOUT	0x139e>, /* Lino P56 */
+			   <MX93_PAD_GPIO_IO15__LPSPI8_SCK	0x139e>; /* Lino P52 */
+	};
+
+	/* Lino UART_3 */
+	pinctrl_uart3: lpuart1grp {
+		fsl,pins = <MX93_PAD_UART1_RXD__LPUART1_RX	0x39e>, /* Lino P17 */
+			   <MX93_PAD_UART1_TXD__LPUART1_TX	0x39e>; /* Lino P19 */
+	};
+
+	/* Lino UART_4 */
+	pinctrl_uart4: lpuart2grp {
+		fsl,pins = <MX93_PAD_UART2_RXD__LPUART2_RX	0x39e>, /* Lino P23 */
+			   <MX93_PAD_UART2_TXD__LPUART2_TX	0x39e>; /* Lino P25 */
+	};
+
+	/* Lino UART_1 */
+	pinctrl_uart1: lpuart6grp {
+		fsl,pins = <MX93_PAD_GPIO_IO04__LPUART6_TX	0x39e>, /* Lino P11 */
+			   <MX93_PAD_GPIO_IO05__LPUART6_RX	0x39e>, /* Lino P9 */
+			   <MX93_PAD_GPIO_IO06__LPUART6_CTS_B	0x39e>, /* Lino P8 */
+			   <MX93_PAD_GPIO_IO07__LPUART6_RTS_B	0x39e>; /* Lino P6 */
+	};
+
+	/* Lino UART_2 */
+	pinctrl_uart2: lpuart7grp {
+		fsl,pins = <MX93_PAD_GPIO_IO08__LPUART7_TX	0x39e>, /* Lino P15 */
+			   <MX93_PAD_GPIO_IO09__LPUART7_RX	0x39e>, /* Lino P13 */
+			   <MX93_PAD_GPIO_IO10__LPUART7_CTS_B	0x39e>, /* Lino S7 */
+			   <MX93_PAD_GPIO_IO11__LPUART7_RTS_B	0x39e>; /* Lino S5 */
+	};
+
+	/* Lino I2S_1 */
+	pinctrl_i2s1: sai3grp {
+		fsl,pins = <MX93_PAD_GPIO_IO16__SAI3_TX_BCLK	0x139e>, /* Lino S94 */
+			   <MX93_PAD_GPIO_IO19__SAI3_TX_DATA00	0x139e>, /* Lino S98 */
+			   <MX93_PAD_GPIO_IO20__SAI3_RX_DATA00	0x139e>, /* Lino S100 */
+			   <MX93_PAD_GPIO_IO26__SAI3_TX_SYNC	0x139e>; /* Lino S96 */
+	};
+
+	/* Lino PWM_1 */
+	pinctrl_pwm1: tpm4ch1grp {
+		fsl,pins = <MX93_PAD_GPIO_IO21__TPM4_CH1	0x139e>; /* Lino P1 */
+	};
+
+	/* Lino PWM_2 */
+	pinctrl_pwm2: tpm5ch2grp {
+		fsl,pins = <MX93_PAD_GPIO_IO18__TPM5_CH2	0x139e>; /* Lino P3 */
+	};
+
+	/* Lino PWM_3 */
+	pinctrl_pwm3: tpm6ch1grp {
+		fsl,pins = <MX93_PAD_GPIO_IO23__TPM6_CH1	0x139e>; /* Lino P5 */
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
+	/* Lino SD_1_CD# */
+	pinctrl_sd1_cd: usdhc2cdgrp {
+		fsl,pins = <MX93_PAD_SD2_CD_B__GPIO3_IO00	0x139e>; /* Lino P78 */
+	};
+
+	/* Lino SD_1 */
+	pinctrl_sd1: usdhc2grp {
+		fsl,pins = <MX93_PAD_SD2_CLK__USDHC2_CLK	0x5fe>,      /* Lino P68 */
+			   <MX93_PAD_SD2_CMD__USDHC2_CMD	0x400013fe>, /* Lino P66 */
+			   <MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x400013fe>, /* Lino P74 */
+			   <MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x400013fe>, /* Lino P76 */
+			   <MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x400013fe>, /* Lino P60 */
+			   <MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x400013fe>; /* Lino P64 */
+	};
+
+	/* Lino SD_1_PWR_EN */
+	pinctrl_sd1_pwr_en: usdhc2pwrgrp {
+		fsl,pins = <MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x139e>; /* Lino P72 */
+	};
+
+	/* On-module PMIC_SD_2_VSEL */
+	pinctrl_sd1_vsel: usdhc2vselgrp {
+		fsl,pins = <MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e>; /* PMIC_SD_2_VSEL */
+	};
+
+	/* Lino SD_2 */
+	pinctrl_sd2: usdhc3grp {
+		fsl,pins = <MX93_PAD_SD3_CLK__USDHC3_CLK	0x5fe>,      /* Lino S10 */
+			   <MX93_PAD_SD3_CMD__USDHC3_CMD	0x400013fe>, /* Lino S8  */
+			   <MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe>, /* Lino S12 */
+			   <MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe>, /* Lino S16 */
+			   <MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe>, /* Lino S2  */
+			   <MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe>; /* Lino S4  */
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY 0x31e>; /* PMIC_WDOG_B */
+	};
+};
-- 
2.47.3

