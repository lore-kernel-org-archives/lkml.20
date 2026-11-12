Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501457;
	b=v4zIg/szbUeVZea/+Wf4qYWCM84dDgPpLl2WgdtG2p9CMe/tW69iggEkmJDcpctYhL8A
	 3aAUb2P4k7m4O/2+mGalvlSHpyBGznrxm0w72MKGBd1HTqWYBhdVU5UoQ6ms+0L1Hg7RX
	 x6Cfv1WpzNqm45rNLY7jtHsaD/k0OFDqig9XCN5O+jgPZrgapzOLxNpG9hDlcRV+4TQTT
	 1CAJTlGq0tCKcdpJ2qOznW6Tppv7c2IBkzdPXrpTOby82E/ebTkLoVH+IOVXaUbgwWEAI
	 T7PgnLSL6WHRkzZK18igpZExnV+MI1+v3Sdzc4joAXuUl7w9zOkGrjz1yqDunamLAsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501457;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=bmCCn+K3i4/sRd++OhLzk9C5bUxbF0z90HafwvK/dKg=;
	b=LdwF6ZZOH0AJLalFf+mrWdeVGrVSxwmcITvDTDl3TV/8ZjRJvBM9mnmeDONNrwRamWIn
	 h0X9Q+u5vXiZxrrKQWNJPzPjDhiUdE5hX/1P73XNN4b4WVKQCGYXkjeK3P0S4Liv1dRcl
	 TCjaAMqS72daCQrveWxRw1R3gamc5JRei/nN2nnhW5My49WpXqN2UnUXYWfn9wOp+vZxB
	 AXsVZBLv9mNlFi0KbTo7nCm3FRO0boE32fE1whirYzz2eG66eHuy9c5iHOJl03BjOyyuZ
	 zj+tjkWwAGnAuvhqIJD1fEjLVKgqfd/AmNV5ewDyVIuIRIJ4XLM5n+phKQV5tw3tTwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b="jzkHY/d+";
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E54606A32A;
	Thu, 12 Nov 2026 16:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E54606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=jzkHY/d+
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCE8610BD79;
	Thu, 12 Nov 2026 17:37:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794501450; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=bmCCn+K3i4/sRd++OhLzk9C5bUxbF0z90HafwvK/dKg=;
	b=jzkHY/d+OwS9nGQgkb5joC5/4v78HGQ43/bny3yCjdWnABV/4c/5lWTgAdNYVFtDjMezLw
	ApAjk2/VESxczFLPLEQsG4izQfDbWuchlsjrJEHEr3vOlfHedJcmrREBQUq3S6UVswOgWd
	AEDoRl3mMCHJkcc1/fIF29w4gn5YlFvHJcwVBIxmh5Dl6IJna2PWVm0/37LkPNMxauBkmZ
	ozJFKprGrh42ilaVTIkeFdYQ2HCIjkyw1rqZ8ZkJPSoZQowIw9xCyqVlitSXDsvFmRXO/L
	kg59Lu4arAvADgflGidEFoHeajQRMYCHRkRg+XYajblfZEreygEiF3YISQSxBQ==
From: Lukasz Majewski <lukma@nabladev.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v2 3/3] arm64: dts: freescale: Add device tree definition for Cloos CBASE with i.MX8MM
Date: Thu, 12 Nov 2026 17:37:03 +0100
Message-ID: <20261112163703.3358164-3-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112163703.3358164-1-lukma@nabladev.com>
References: <20261112163703.3358164-1-lukma@nabladev.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This commit adds support for CBASE board, which incorporates the TQMa8MQML
module.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
Changes for v2:
- Fix the DTS according to the sashiko bot review (gemini/gemini-4-argon)
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../arm64/boot/dts/freescale/imx8mm-cbase.dts | 581 ++++++++++++++++++
 2 files changed, 582 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-cbase.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..c14e5ae2e4a0 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -121,6 +121,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxl-hummingboard-telematics.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-cbase.dtb
 
 imx8mm-data-modul-edm-sbc-overlay-cm4-dtbs := \
 	imx8mm-data-modul-edm-sbc.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts b/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts
new file mode 100644
index 000000000000..029a637c9530
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts
@@ -0,0 +1,581 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022 Fabio Estevam <festevam@denx.de>
+ * Copyright 2026 Lukasz Majewski <lukma@nabladev.com>
+ */
+
+/dts-v1/;
+
+#include "imx8mm-tqma8mqml.dtsi"
+
+/ {
+	model = "Cloos i.MX8MM CBASE board";
+	compatible = "cloos,imx8mm-cbase", "tq,imx8mm-tqma8mqml", "fsl,imx8mm";
+
+	aliases {
+		mmc0 = &usdhc3;
+		mmc1 = &usdhc2;
+	};
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	clk_xtal40: clk-xtal40 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_led>;
+
+		led-0 {
+			label = "status1";
+			gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-1 {
+			label = "status2";
+			gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-2 {
+			label = "status3";
+			gpios = <&gpio2 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-3 {
+			label = "status4";
+			gpios = <&gpio2 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-4 {
+			label = "error";
+			gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-5 {
+			label = "run";
+			gpios = <&gpio2 0 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	reg_usb_otg_vbus: regulator-usb-otg-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_otg_vbus_ctrl>;
+		regulator-name = "usb_otg_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio2 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc2_vmmc: regulator-vmmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <100>;
+		off-on-delay-us = <12000>;
+	};
+
+	sfp_bot: sfp-bot {
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp_bot>;
+		tx-fault-gpios = <&sfp_gpio 4 GPIO_ACTIVE_HIGH>;
+		tx-disable-gpios = <&sfp_gpio 5 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sfp_gpio 6 GPIO_ACTIVE_LOW>;
+		los-gpios = <&sfp_gpio 7 GPIO_ACTIVE_HIGH>;
+		maximum-power-milliwatt = <1000>;
+	};
+
+	sfp_top: sfp-top {
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp_top>;
+		tx-fault-gpios = <&sfp_gpio 0 GPIO_ACTIVE_HIGH>;
+		tx-disable-gpios = <&sfp_gpio 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sfp_gpio 2 GPIO_ACTIVE_LOW>;
+		los-gpios = <&sfp_gpio 3 GPIO_ACTIVE_HIGH>;
+		maximum-power-milliwatt = <1000>;
+	};
+};
+
+&ddrc {
+	operating-points-v2 = <&ddrc_opp_table>;
+
+	ddrc_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-25000000 {
+			opp-hz = /bits/ 64 <25000000>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+		};
+
+		opp-750000000 {
+			opp-hz = /bits/ 64 <750000000>;
+		};
+	};
+};
+
+&ecspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>,
+		   <&gpio1 1 GPIO_ACTIVE_LOW>,
+		   <&gpio1 12 GPIO_ACTIVE_LOW>,
+		   <&gpio1 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		clocks = <&clk_xtal40>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <4000000>;
+	};
+
+	can@1 {
+		compatible = "microchip,mcp2518fd";
+		reg = <1>;
+		clocks = <&clk_xtal40>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <4000000>;
+	};
+};
+
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1>;
+	fsl,magic-packet;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	fixed-link {
+		full-duplex;
+		pause;
+		speed = <1000>;
+	};
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		managed_switch: switch@0  {
+			compatible = "marvell,mv88e6190";
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			interrupt-parent = <&gpio1>;
+			interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+			pinctrl-0 = <&pinctrl_switch_interrupt>;
+			pinctrl-names = "default";
+			reg = <0>;
+			status = "okay";
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				switch0phy1: ethernet-phy@1 {
+					reg = <0x1>;
+				};
+
+				switch0phy2: ethernet-phy@2 {
+					reg = <0x2>;
+				};
+
+				switch0phy3: ethernet-phy@3 {
+					reg = <0x3>;
+				};
+
+				switch0phy4: ethernet-phy@4 {
+					reg = <0x4>;
+				};
+
+				switch0phy5: ethernet-phy@5 {
+					reg = <0x5>;
+				};
+
+				switch0phy6: ethernet-phy@6 {
+					reg = <0x6>;
+				};
+
+				switch0phy7: ethernet-phy@7 {
+					reg = <0x7>;
+				};
+
+				switch0phy8: ethernet-phy@8 {
+					reg = <0x8>;
+				};
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					ethernet = <&fec1>;
+					phy-mode = "rgmii-id";
+					reg = <0>;
+
+					fixed-link {
+						full-duplex;
+						pause;
+						speed = <1000>;
+					};
+				};
+
+				port@1 {
+					label = "lan1";
+					phy-handle = <&switch0phy1>;
+					phy-mode = "internal";
+					reg = <1>;
+				};
+
+				port@2 {
+					label = "lan2";
+					phy-handle = <&switch0phy2>;
+					phy-mode = "internal";
+					reg = <2>;
+				};
+
+				port@3 {
+					label = "lan3";
+					phy-handle = <&switch0phy3>;
+					phy-mode = "internal";
+					reg = <3>;
+				};
+
+				port@4 {
+					label = "lan4";
+					phy-handle = <&switch0phy4>;
+					phy-mode = "internal";
+					reg = <4>;
+				};
+
+				port@5 {
+					label = "lan5";
+					phy-handle = <&switch0phy5>;
+					phy-mode = "internal";
+					reg = <5>;
+				};
+
+				port@6 {
+					label = "lan6";
+					phy-handle = <&switch0phy6>;
+					phy-mode = "internal";
+					reg = <6>;
+				};
+
+				port@7 {
+					label = "lan7";
+					phy-handle = <&switch0phy7>;
+					phy-mode = "internal";
+					reg = <7>;
+				};
+
+				port@8 {
+					label = "lan8";
+					phy-handle = <&switch0phy8>;
+					phy-mode = "internal";
+					reg = <8>;
+				};
+
+				port@9 {
+					reg = <9>;
+					label = "lan-sfp1";
+					phy-mode = "sgmii";
+					sfp = <&sfp_top>;
+					managed = "in-band-status";
+				};
+
+				port@a {
+					reg = <10>;
+					label = "lan-sfp2";
+					phy-mode = "sgmii";
+					sfp = <&sfp_bot>;
+					managed = "in-band-status";
+				};
+			};
+		};
+	};
+};
+
+&flexspi {
+	status = "disabled";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	onewire@18 {
+		compatible = "maxim,ds2484";
+		reg = <0x18>;
+	};
+
+	temperature-sensor@49 {
+		compatible = "national,lm77";
+		reg = <0x49>;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9543";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c_sfp_top: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+		i2c_sfp_bot: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+	};
+
+	sfp_gpio: gpio@38 {
+		compatible = "nxp,pca9554";
+		reg = <0x38>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "SFP_TXFI_T", "SFP_TXDIS_T",
+				  "SFP_MODPRES_T", "SFP_LOS_T",
+				  "SFP_TXFI_L", "SFP_TXDIS_L",
+				  "SFP_MODPRES_L", "SFP_LOS_L";
+	};
+};
+
+&reg_usdhc2_vqmmc {
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	vbus-supply = <&reg_usb_otg_vbus>;
+	status = "okay";
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbphynop1 {
+	power-domains = <&pgc_otg1>;
+};
+
+&usbphynop2 {
+	power-domains = <&pgc_otg2>;
+};
+
+&usdhc2 {
+	assigned-clocks = <&clk IMX8MM_CLK_USDHC2>;
+	assigned-clock-rates = <400000000>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_400M>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	bus-width = <4>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	no-mmc;
+	no-sdio;
+	sd-uhs-sdr104;
+	sd-uhs-ddr50;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ECSPI1_MISO_ECSPI1_MISO		0x82
+			MX8MM_IOMUXC_ECSPI1_MOSI_ECSPI1_MOSI		0x82
+			MX8MM_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x82
+			MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9		0x19
+			MX8MM_IOMUXC_GPIO1_IO01_GPIO1_IO1		0x19
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x19
+			MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12		0x19
+			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13		0x19
+			MX8MM_IOMUXC_SAI1_MCLK_GPIO4_IO20		0x19
+		>;
+	};
+
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <MX8MM_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK	0x00000006>,
+			   <MX8MM_IOMUXC_ECSPI2_MOSI_ECSPI2_MOSI	0x00000006>,
+			   <MX8MM_IOMUXC_ECSPI2_MISO_ECSPI2_MISO	0x00000006>,
+			   <MX8MM_IOMUXC_ECSPI2_SS0_GPIO5_IO13		0x00000006>;
+	};
+
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC		0x40000002
+			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO		0x40000002
+			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x14
+			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x14
+			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x14
+			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x14
+			MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x90
+			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x90
+			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x90
+			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x90
+			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x14
+			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x90
+			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x90
+			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x14
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x10
+		>;
+	};
+
+	pinctrl_gpio_led: gpioledgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_CLK_GPIO2_IO0			0x19
+			MX8MM_IOMUXC_SD1_CMD_GPIO2_IO1			0x19
+			MX8MM_IOMUXC_SD1_DATA1_GPIO2_IO3		0x19
+			MX8MM_IOMUXC_SD1_DATA2_GPIO2_IO4		0x19
+			MX8MM_IOMUXC_SD1_DATA3_GPIO2_IO5		0x19
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6		0x19
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_otg_vbus_ctrl: otgvbusctrlgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_DATA0_GPIO2_IO2		0x119
+		>;
+	};
+
+	pinctrl_switch_interrupt: switchinterruptgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO00_GPIO1_IO0		0x19
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX		0x140
+			MX8MM_IOMUXC_UART1_TXD_UART1_DCE_TX		0x140
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX		0x140
+			MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX		0x140
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART3_RXD_UART3_DCE_RX		0x140
+			MX8MM_IOMUXC_UART3_TXD_UART3_DCE_TX		0x140
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2grpgpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x1c4
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d6
+		>;
+	};
+};
+
+/* SPI-NOR memory is not mounted on the used SoM */
+/delete-node/ &flash0;
-- 
2.39.5

