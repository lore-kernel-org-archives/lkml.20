Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF5A476046;
	Fri, 11 Sep 2026 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118434; cv=none; b=WuqjYOzwIRRF3Yz63SmgwT+41Unyb9+IbwHsG41bvC7tw4HbWzG+wIYVbI/I0m7S6fp40XzFbwknehdbCgaEyjs5Q7jn5d0Cbb2IExSQpUsvDowhjSXgMd+cS8VTm8gaYYSCwADJyYlepS8QHWnmLh+X6gQC0sO5R16f7k7yGRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118434; c=relaxed/simple;
	bh=yZoil1auBuJ/awBb6hQ9+QCf2VYqwHcuAEIdABhHQxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSDCYmaMZp3VOZn1LkGn/u61dRuIwmMwoc4BJhhdbtocSYimbO4O+avMoR3sJn4hPrV39fZiz0wmvhqqy3Yec4rmvcWJ6/7euoBzr/YLBKtu1+Qx6sZ8ulRdOLsL6md+cfB0tP3c2Yk/7z04Sjo00Du9CmLOM0wd+v6YhM8aFqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=TIvIlmVC; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="TIvIlmVC"
Received: from francesco-nb.. (93-33-8-46.ip42.fastwebnet.it [93.33.8.46])
	by mail11.truemail.it (Postfix) with ESMTPA id 60E2522E12;
	Fri, 11 Sep 2026 11:20:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789118430;
	bh=lhQ0s/YhP1w0rT3tIUApfrO0PRobLOkstDVUOplcnfA=; h=From:To:Subject;
	b=TIvIlmVCfpqZTKuxrzJLavz0mqniMYEU7Sfo8xGdNYAZEQCVByICFaDLg+CQBwAQ7
	 bWNxQEAxMxkoE9ynw0nkcjuKeZ/sR4Wzvu5l5nFR01kj/089/ys6mIOKH3BRc0063S
	 JO2jeSB5/0BPjxLksYpFs5jL6uJtvj+G9KXUTaagyZZcO5/FZHt0UdNborw9DEgvyM
	 6VEFAuj/pcO1dLSB53uSH1Gqs/6tS0Ct3+9iouGYAXCwqZBzHfzmPnzldotMK33dVT
	 nsUJBFTDEeBLlMvhDBEoYF8PPmOqdHjb4go1pAL0M0+e5cxjawyK15J9EJEGK2lcDX
	 lOjBuX4aSCPxg==
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
Subject: [PATCH v2 7/7] arm64: dts: freescale: Add Toradex OSM iMX91
Date: Fri, 11 Sep 2026 11:19:50 +0200
Message-ID: <20260911091952.96233-8-francesco@dolcini.it>
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

Add support for the OSM iMX91 SoM and the development carrier board that
can be mated with.

Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx91
Link: https://www.toradex.com/products/carrier-board/osm-development-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../dts/freescale/imx91-toradex-osm-dev.dts   |  22 ++
 .../boot/dts/freescale/imx91-toradex-osm.dtsi | 303 ++++++++++++++++++
 3 files changed, 327 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 64fa5d0527ff..39686f17891b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -856,6 +856,8 @@ imx91-phyboard-segin-peb-av-18-dtbs += imx91-phyboard-segin.dtb imx91-phyboard-s
 dtb-$(CONFIG_ARCH_MXC) += imx91-9x9-qsb-can1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin-peb-av-18.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx91-toradex-osm-dev.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba93xxca.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dts b/arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dts
new file mode 100644
index 000000000000..ec5e701fb275
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex OSM iMX91 SoM on OSM Development carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx91
+ * https://www.toradex.com/products/carrier-board/osm-development-board
+ */
+
+/dts-v1/;
+
+#include "imx91.dtsi"
+#include "imx91-toradex-osm.dtsi"
+#include "imx93-imx91-toradex-osm-dev-common.dtsi"
+
+/ {
+	model = "Toradex OSM iMX91 on OSM Development Board";
+	compatible = "toradex,osm-imx91-dev",
+		     "toradex,osm-imx91",
+		     "fsl,imx91";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi b/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
new file mode 100644
index 000000000000..9d990937fd8d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex OSM iMX91 SoM
+ *
+ * https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx91
+ */
+
+#include "imx91-pinfunc.h"
+#include "imx93-imx91-toradex-osm-common.dtsi"
+
+&iomuxc {
+	/* OSM CAN_A */
+	pinctrl_can_a: can1grp {
+		fsl,pins = <MX91_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e>, /* OSM AB17 */
+			   <MX91_PAD_PDM_CLK__CAN1_TX		0x139e>; /* OSM AC17 */
+	};
+
+	/* OSM CAN_B */
+	pinctrl_can_b: can2grp {
+		fsl,pins = <MX91_PAD_GPIO_IO25__CAN2_TX		0x139e>, /* OSM AC19 */
+			   <MX91_PAD_GPIO_IO27__CAN2_RX		0x139e>; /* OSM AB19 */
+	};
+
+	/* OSM CAM_MCK */
+	pinctrl_cam_mck: ccmclk1grp {
+		fsl,pins = <MX91_PAD_CCM_CLKO1__CCMSRCGPCMIX_CLKO1	0x51e>; /* OSM C2 */
+	};
+
+	/* OSM ETH_A RGMII */
+	pinctrl_eth_a: eqosgrp {
+		fsl,pins = <MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x1fe>, /* OSM K15 */
+			   <MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x1fe>, /* OSM L15 */
+			   <MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x1fe>, /* OSM N15 */
+			   <MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x1fe>, /* OSM P15 */
+			   <MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC			0x1fe>, /* OSM R15 */
+			   <MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x1fe>, /* OSM M15 */
+			   <MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x1fe>, /* OSM H15 */
+			   <MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1				0x1fe>, /* OSM G15 */
+			   <MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x1fe>, /* OSM H16 */
+			   <MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x1fe>, /* OSM G16 */
+			   <MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x1fe>, /* OSM J15 */
+			   <MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x1fe>; /* OSM K16 */
+	};
+
+	/* OSM ETH_MDIO */
+	pinctrl_mdio: eqosmdiogrp {
+		fsl,pins = <MX91_PAD_ENET1_MDC__ENET1_MDC	0x1fe>, /* OSM T16 */
+			   <MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO	0x1fe>; /* OSM T15 */
+	};
+
+	/* OSM ETH_B RGMII */
+	pinctrl_eth_b: fecgrp {
+		fsl,pins = <MX91_PAD_ENET2_RD0__ENET2_RGMII_RD0		0x1fe>, /* OSM J1 */
+			   <MX91_PAD_ENET2_RD1__ENET2_RGMII_RD1		0x1fe>, /* OSM K1 */
+			   <MX91_PAD_ENET2_RD2__ENET2_RGMII_RD2		0x1fe>, /* OSM M1 */
+			   <MX91_PAD_ENET2_RD3__ENET2_RGMII_RD3		0x1fe>, /* OSM N1 */
+			   <MX91_PAD_ENET2_RXC__ENET2_RGMII_RXC		0x1fe>, /* OSM P1 */
+			   <MX91_PAD_ENET2_RX_CTL__ENET2_RGMII_RX_CTL	0x1fe>, /* OSM L1 */
+			   <MX91_PAD_ENET2_TD0__ENET2_RGMII_TD0		0x1fe>, /* OSM G1 */
+			   <MX91_PAD_ENET2_TD1__ENET2_RGMII_TD1		0x1fe>, /* OSM F1 */
+			   <MX91_PAD_ENET2_TD2__ENET2_RGMII_TD2		0x1fe>, /* OSM G2 */
+			   <MX91_PAD_ENET2_TD3__ENET2_RGMII_TD3		0x1fe>, /* OSM F2 */
+			   <MX91_PAD_ENET2_TXC__ENET2_RGMII_TXC		0x1fe>, /* OSM H1 */
+			   <MX91_PAD_ENET2_TX_CTL__ENET2_RGMII_TX_CTL	0x1fe>; /* OSM J2 */
+	};
+
+	/* OSM SPI_B_CS as GPIO */
+	pinctrl_spi_b_cs0_gpio: gpio1io11grp {
+		fsl,pins = <MX91_PAD_SAI1_TXFS__GPIO1_IO11	0x139e>; /* OSM AA23 */
+	};
+
+	/* OSM GPIO_A_0 */
+	pinctrl_gpio_a0:  gpio2io0grp {
+		fsl,pins = <MX91_PAD_GPIO_IO00__GPIO2_IO0	0x139e>; /* OSM D17 */
+	};
+
+	/* OSM GPIO_A_1 */
+	pinctrl_gpio_a1: gpio2io1grp {
+		fsl,pins = <MX91_PAD_GPIO_IO01__GPIO2_IO1	0x139e>; /* OSM E17 */
+	};
+
+	/* OSM GPIO_A_2 */
+	pinctrl_gpio_a2: gpio2io2grp {
+		fsl,pins = <MX91_PAD_GPIO_IO02__GPIO2_IO2	0x139e>; /* OSM F17 */
+	};
+
+	/* OSM GPIO_A_3 */
+	pinctrl_gpio_a3: gpio2io3grp {
+		fsl,pins = <MX91_PAD_GPIO_IO03__GPIO2_IO3	0x139e>; /* OSM G17 */
+	};
+
+	/* OSM SPI_A_CS0 as GPIO */
+	pinctrl_spi_a_cs0_gpio: gpio2io12grp {
+		fsl,pins = <MX91_PAD_GPIO_IO12__GPIO2_IO12	0x139e>; /* OSM Y15 */
+	};
+
+	/* OSM PWM_0 as GPIO */
+	pinctrl_pwm0_gpio: gpio2io21grp {
+		fsl,pins = <MX91_PAD_GPIO_IO21__GPIO2_IO21	0x139e>; /* OSM E18 */
+	};
+
+	/* OSM GPIO_A_4 */
+	pinctrl_gpio_a4: gpio2io22grp {
+		fsl,pins = <MX91_PAD_GPIO_IO22__GPIO2_IO22	0x139e>; /* OSM H17 */
+	};
+
+	/* OSM GPIO_A_5 */
+	pinctrl_gpio_a5: gpio2io24grp {
+		fsl,pins = <MX91_PAD_GPIO_IO24__GPIO2_IO24	0x139e>; /* OSM J17 */
+	};
+
+	/* On-module CTRL_INT# */
+	pinctrl_ctrl_int: gpio3io27grp {
+		fsl,pins = <MX91_PAD_CCM_CLKO2__GPIO3_IO27	0x139e>; /* CTRL_INT# */
+	};
+
+	/* OSM GPIO_A_6 */
+	pinctrl_gpio_a6: gpio4io14grp {
+		fsl,pins = <MX91_PAD_ENET2_MDC__GPIO4_IO14	0x139e>; /* OSM K17 */
+	};
+
+	/* OSM GPIO_A_7 */
+	pinctrl_gpio_a7:  gpio4io15grp {
+		fsl,pins = <MX91_PAD_ENET2_MDIO__GPIO4_IO15	0x139e>; /* OSM L17 */
+	};
+
+	/* OSM I2C_B as GPIO */
+	pinctrl_i2c_b_gpio: lpi2c1gpiogrp {
+		fsl,pins = <MX91_PAD_I2C1_SCL__GPIO1_IO0	0x40000b9e>, /* OSM AA20 */
+			   <MX91_PAD_I2C1_SDA__GPIO1_IO1	0x40000b9e>; /* OSM AA21 */
+	};
+
+	/* OSM I2C_B */
+	pinctrl_i2c_b: lpi2c1grp {
+		fsl,pins = <MX91_PAD_I2C1_SCL__LPI2C1_SCL	0x40000b9e>, /* OSM AA20 */
+			   <MX91_PAD_I2C1_SDA__LPI2C1_SDA	0x40000b9e>; /* OSM AA21 */
+	};
+
+	/* On-module PMIC I2C as GPIO */
+	pinctrl_pmic_i2c_gpio: lpi2c2gpiogrp {
+		fsl,pins = <MX91_PAD_I2C2_SCL__GPIO1_IO2	0x40000b9e>, /* PMIC_I2C_SCL */
+			   <MX91_PAD_I2C2_SDA__GPIO1_IO3	0x40000b9e>; /* PMIC_I2C_SDA */
+	};
+
+	/* On-module PMIC I2C */
+	pinctrl_pmic_i2c: lpi2c2grp {
+		fsl,pins = <MX91_PAD_I2C2_SCL__LPI2C2_SCL	0x40000b9e>, /* PMIC_I2C_SCL */
+			   <MX91_PAD_I2C2_SDA__LPI2C2_SDA	0x40000b9e>; /* PMIC_I2C_SDA */
+	};
+
+	/* OSM I2C_A as GPIO */
+	pinctrl_i2c_a_gpio: lpi2c3gpiogrp {
+		fsl,pins = <MX91_PAD_GPIO_IO28__GPIO2_IO28	0x40000b9e>, /* OSM AA16 */
+			   <MX91_PAD_GPIO_IO29__GPIO2_IO29	0x40000b9e>; /* OSM AA15 */
+	};
+
+	/* OSM I2C_A */
+	pinctrl_i2c_a: lpi2c3grp {
+		fsl,pins = <MX91_PAD_GPIO_IO28__LPI2C3_SDA	0x40000b9e>, /* OSM AA16 */
+			   <MX91_PAD_GPIO_IO29__LPI2C3_SCL	0x40000b9e>; /* OSM AA15 */
+	};
+
+	/* OSM SPI_B */
+	pinctrl_spi_b: lpspi1grp {
+		fsl,pins = <MX91_PAD_SAI1_TXC__LPSPI1_SIN	0x139e>, /* OSM Y22 */
+			   <MX91_PAD_SAI1_TXD0__LPSPI1_SCK	0x139e>, /* OSM Y21 */
+			   <MX91_PAD_SAI1_RXD0__LPSPI1_SOUT	0x139e>; /* OSM Y23 */
+	};
+
+	/* OSM SPI_A */
+	pinctrl_spi_a: lpspi8grp {
+		fsl,pins = <MX91_PAD_GPIO_IO13__LPSPI8_SIN	0x139e>, /* OSM U15 */
+			   <MX91_PAD_GPIO_IO14__LPSPI8_SOUT	0x139e>, /* OSM V15 */
+			   <MX91_PAD_GPIO_IO15__LPSPI8_SCK	0x139e>; /* OSM U16 */
+	};
+
+	/* OSM UART_CON */
+	pinctrl_uart_con: lpuart1grp {
+		fsl,pins = <MX91_PAD_UART1_RXD__LPUART1_RX	0x39e>, /* OSM D22 */
+			   <MX91_PAD_UART1_TXD__LPUART1_TX	0x39e>; /* OSM D23 */
+	};
+
+	/* OSM UART_C */
+	pinctrl_uart_c: lpuart2grp {
+		fsl,pins = <MX91_PAD_UART2_RXD__LPUART2_RX	0x39e>, /* OSM A22 */
+			   <MX91_PAD_UART2_TXD__LPUART2_TX	0x39e>; /* OSM B23 */
+	};
+
+	/* OSM UART_A */
+	pinctrl_uart_a: lpuart6grp {
+		fsl,pins = <MX91_PAD_GPIO_IO04__LPUART6_TX	0x39e>, /* OSM B13 */
+			   <MX91_PAD_GPIO_IO05__LPUART6_RX	0x39e>, /* OSM A14 */
+			   <MX91_PAD_GPIO_IO06__LPUART6_CTS_B	0x39e>, /* OSM C14 */
+			   <MX91_PAD_GPIO_IO07__LPUART6_RTS_B	0x39e>; /* OSM C13 */
+	};
+
+	/* OSM UART_B */
+	pinctrl_uart_b: lpuart7grp {
+		fsl,pins = <MX91_PAD_GPIO_IO08__LPUART7_TX	0x39e>, /* OSM D13 */
+			   <MX91_PAD_GPIO_IO09__LPUART7_RX	0x39e>, /* OSM D14 */
+			   <MX91_PAD_GPIO_IO10__LPUART7_CTS_B	0x39e>, /* OSM D16 */
+			   <MX91_PAD_GPIO_IO11__LPUART7_RTS_B	0x39e>; /* OSM D15 */
+	};
+
+	/* OSM I2S_A */
+	pinctrl_i2s_a: sai3grp {
+		fsl,pins = <MX91_PAD_GPIO_IO16__SAI3_TX_BCLK	0x139e>, /* OSM W20 */
+			   <MX91_PAD_GPIO_IO19__SAI3_TX_DATA0	0x139e>, /* OSM W21 */
+			   <MX91_PAD_GPIO_IO20__SAI3_RX_DATA0	0x139e>, /* OSM V21 */
+			   <MX91_PAD_GPIO_IO26__SAI3_TX_SYNC	0x139e>; /* OSM W18 */
+	};
+
+	/* OSM I2S_MCLK */
+	pinctrl_i2s_a_mclk: sai3mclkgrp {
+		fsl,pins = <MX91_PAD_GPIO_IO17__SAI3_MCLK	0x31e>; /* OSM V18 */
+	};
+
+	/* OSM PWM_0 */
+	pinctrl_pwm0: tpm4ch1grp {
+		fsl,pins = <MX91_PAD_GPIO_IO21__TPM4_CH1	0x139e>; /* OSM E18 */
+	};
+
+	/* OSM PWM_1 */
+	pinctrl_pwm1: tpm5ch2grp {
+		fsl,pins = <MX91_PAD_GPIO_IO18__TPM5_CH2	0x139e>; /* OSM F18 */
+	};
+
+	/* OSM PWM_2 */
+	pinctrl_pwm2: tpm6ch1grp {
+		fsl,pins = <MX91_PAD_GPIO_IO23__TPM6_CH1	0x139e>; /* OSM G18 */
+	};
+
+	/* OSM USB_A_EN */
+	pinctrl_usb_a_en: usb1engrp {
+		fsl,pins = <MX91_PAD_CCM_CLKO3__GPIO4_IO28	0x139e>; /* OSM AC16 */
+	};
+
+	/* OSM USB_A_OC# */
+	pinctrl_usb_a_oc: usb1ocgrp {
+		fsl,pins = <MX91_PAD_CCM_CLKO4__GPIO4_IO29	0x139e>; /* OSM AC15 */
+	};
+
+	/* OSM USB_B_EN */
+	pinctrl_usb_b_en: usb2engrp {
+		fsl,pins = <MX91_PAD_PDM_BIT_STREAM1__GPIO1_IO10	0x139e>; /* OSM AC20 */
+	};
+
+	/* On-module eMMC */
+	pinctrl_emmc: usdhc1grp {
+		fsl,pins = <MX91_PAD_SD1_CLK__USDHC1_CLK	0x5fe>,      /* eMMC_CLK    */
+			   <MX91_PAD_SD1_CMD__USDHC1_CMD	0x400013fe>, /* eMMC_CMD    */
+			   <MX91_PAD_SD1_DATA0__USDHC1_DATA0	0x400013fe>, /* eMMC_DATA0  */
+			   <MX91_PAD_SD1_DATA1__USDHC1_DATA1	0x400013fe>, /* eMMC_DATA1  */
+			   <MX91_PAD_SD1_DATA2__USDHC1_DATA2	0x400013fe>, /* eMMC_DATA2  */
+			   <MX91_PAD_SD1_DATA3__USDHC1_DATA3	0x400013fe>, /* eMMC_DATA3  */
+			   <MX91_PAD_SD1_DATA4__USDHC1_DATA4	0x400013fe>, /* eMMC_DATA4  */
+			   <MX91_PAD_SD1_DATA5__USDHC1_DATA5	0x400013fe>, /* eMMC_DATA5  */
+			   <MX91_PAD_SD1_DATA6__USDHC1_DATA6	0x400013fe>, /* eMMC_DATA6  */
+			   <MX91_PAD_SD1_DATA7__USDHC1_DATA7	0x400013fe>, /* eMMC_DATA7  */
+			   <MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x1580>;     /* eMMC_STROBE */
+	};
+
+	/* OSM SDIO_A_CD# */
+	pinctrl_sdio_a_cd: usdhc2cdgrp {
+		fsl,pins = <MX91_PAD_SD2_CD_B__GPIO3_IO0	0x139e>; /* OSM J21 */
+	};
+
+	/* OSM SDIO_A */
+	pinctrl_sdio_a: usdhc2grp {
+		fsl,pins = <MX91_PAD_SD2_CLK__USDHC2_CLK	0x5fe>,      /* OSM F21 */
+			   <MX91_PAD_SD2_CMD__USDHC2_CMD	0x400013fe>, /* OSM E20 */
+			   <MX91_PAD_SD2_DATA0__USDHC2_DATA0	0x400013fe>, /* OSM G20 */
+			   <MX91_PAD_SD2_DATA1__USDHC2_DATA1	0x400013fe>, /* OSM G21 */
+			   <MX91_PAD_SD2_DATA2__USDHC2_DATA2	0x400013fe>, /* OSM H20 */
+			   <MX91_PAD_SD2_DATA3__USDHC2_DATA3	0x400013fe>; /* OSM H21 */
+	};
+
+	/* OSM SDIO_A_PWR_EN */
+	pinctrl_sdio_a_pwr_en: usdhc2pwrgrp {
+		fsl,pins = <MX91_PAD_SD2_RESET_B__GPIO3_IO7	0x139e>; /* OSM D21 */
+	};
+
+	/* On-module PMIC_SD_2_VSEL */
+	pinctrl_sdio_a_vsel: usdhc2vselgrp {
+		fsl,pins = <MX91_PAD_SD2_VSELECT__GPIO3_IO19	0x51e>; /* PMIC_SD_2_VSEL */
+	};
+
+	/* OSM SDIO_B */
+	pinctrl_sdio_b: usdhc3grp {
+		fsl,pins = <MX91_PAD_SD3_CLK__USDHC3_CLK	0x5fe>,      /* OSM K20 */
+			   <MX91_PAD_SD3_CMD__USDHC3_CMD	0x400013fe>, /* OSM K21 */
+			   <MX91_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe>, /* OSM L20 */
+			   <MX91_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe>, /* OSM L21 */
+			   <MX91_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe>, /* OSM M21 */
+			   <MX91_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe>; /* OSM N20 */
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <MX91_PAD_WDOG_ANY__WDOG1_WDOG_ANY 0x31e>; /* PMIC_WDOG_B */
+	};
+};
-- 
2.47.3

