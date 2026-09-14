Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E2E3B27F9;
	Mon, 14 Sep 2026 21:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419696; cv=none; b=DjQdW0fnhAC14ItWM+TQqzqES4H1beOOZyvyd8m0VYP139dcJMxtg/4SzwEOQuvwHF8793fXXN2g5XKKYhl2RCCOOWgnpXM1zswYN/rvQ0SdUOzoRqh+S7lk+QwIafsRGl2pnx0JobMFa3h0RbultACHGKV94aPS9TlnN9gOl18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419696; c=relaxed/simple;
	bh=wVxReddzjO9S9wewVM8/csXpD5Km0fztYNCNBl/sgU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cgqytVoAoAMfTBK8tv5Q6hCe6aSw8yZJDOaG/AjTPTk6iWUC1vWmTulVtAaHVyTAuL64g26ualdYVwBTzmDPusQVTI7DWX7zkwzJaWjl+4uMRy5lyh3Z6CncYJEPCZvVtYJ3gwo/AvqVHwghRKUmq9Yf4af+ZG2tUBDCGwacqiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ei/yw5JL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ei/yw5JL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 326EFC2BCF6;
	Mon, 14 Sep 2026 21:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789419696;
	bh=wVxReddzjO9S9wewVM8/csXpD5Km0fztYNCNBl/sgU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ei/yw5JLUJQxWNCI7BWFSYx3Wp0EdaI4RFyiTpAOhEp025hXpC8tZLZ2pQe+smTU8
	 zrGziHjs/6+KS5NbvvyS6goCBH7AqqoFlvkv/uBCojibyFmQMOy4Sd1vy4s3jgIGxW
	 sCxflRZdCMLz/LmgKvA4efSyPawEi1og2E/EeKcP7k+OjGcD1oD5hj0KdUR0WRfZLN
	 I/xTglOJxKPIJZgN8XX7hlYuHSJYdOmb7xcTlp85ZL9y4CulmR/CMIy5hCtHiE4CJE
	 77AHPhNxZV+Jc8Vfxrp/rKJqI95jYfNJL4TuDktqYhBlr9btZooD1RcnmRN0w443zi
	 Z503u5A2uZQmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB4CC88E7F;
	Mon, 14 Sep 2026 21:01:36 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 14 Sep 2026 23:01:36 +0200
Subject: [PATCH v7 3/3] arm64: dts: freescale: add Nodebox v3 CPU Module
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-for-upstream-nbxv3-dts-v7-3-373a142b08d5@free.fr>
References: <20260914-for-upstream-nbxv3-dts-v7-0-373a142b08d5@free.fr>
In-Reply-To: <20260914-for-upstream-nbxv3-dts-v7-0-373a142b08d5@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789419694; l=9164;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=CrxchG6uhU5lZQK2GkWIyJtGL1/C5sPltynvlPb/sR8=;
 b=QOi4LfsyDDJ8P/uZV08LH03p+CEmVEHRLQCdva8LkaVvDELM8K7VfRm0rtOn7QOGKn45zer0h
 VPn5CnbgE2QA34xVHjaHzxC1pO/MEB0ALdTvpK95uKK72ECogwYlnsa
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

The Nodebox v3 is a Free Mobile CPU module built around the NXP
LX2160A (16x Cortex-A72, DPAA2).

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts |  34 +++
 .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      | 330 +++++++++++++++++++++
 3 files changed, 366 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf..faab8bf0e167 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -55,6 +55,8 @@ DTC_FLAGS_fsl-lx2160a-half-twins := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-half-twins.dtb
 DTC_FLAGS_fsl-lx2160a-honeycomb := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-honeycomb.dtb
+DTC_FLAGS_fsl-lx2160a-nbxv3 := -Wno-interrupt_map
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-nbxv3.dtb
 DTC_FLAGS_fsl-lx2160a-qds := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-qds.dtb
 DTC_FLAGS_fsl-lx2160a-rdb := -Wno-interrupt_map
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts
new file mode 100644
index 000000000000..cc02204e9d1b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Free Mobile Nodebox v3 CPU Module (LX2160A)
+ *
+ * Copyright 2026 Free Mobile, Vincent Jardin
+ */
+
+/dts-v1/;
+
+#include "fsl-lx2160a-rev2.dtsi"
+#include "fsl-lx2160a-nbxv3.dtsi"
+
+/ {
+	compatible = "freemobile,nbxv3", "fsl,lx2160a";
+	model = "Free Mobile Nodebox v3 CPU Module (LX2160A)";
+};
+
+&fspi {
+	pinctrl-0 = <&fspi_dqs_sck_cs10_pins>, <&fspi_data30_pins>;
+	pinctrl-names = "default";
+};
+
+&gpio1 {
+	pinctrl-0 = <&gpio1_31_28_pins>;
+	pinctrl-names = "default";
+};
+
+&pcs_mdio13 {
+	status = "okay";
+};
+
+&pcs_mdio14 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
new file mode 100644
index 000000000000..9c5588a75cdd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Free Mobile Nodebox v3 CPU Module (LX2160A)
+ *
+ * Copyright 2026 Free Mobile, Vincent Jardin
+ *
+ * This file is shared by the Linux kernel and U-Boot.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+		priority = <128>;
+	};
+
+	reg_ethsw_mdio: regulator-ethsw-mdio {
+		compatible = "regulator-fixed";
+		gpio = <&gpio3 25 GPIO_ACTIVE_LOW>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "ethsw-mdio-en";
+	};
+};
+
+&crypto {
+	status = "okay";
+};
+
+&dpmac13 {
+	phy-connection-type = "10gbase-r";
+	phy-handle = <&lan8023_phy_s0>;
+
+	status = "okay";
+};
+
+&dpmac14 {
+	phy-connection-type = "10gbase-r";
+	phy-handle = <&lan8023_phy_s1>;
+
+	status = "okay";
+};
+
+&dpmac17 {
+	phy-connection-type = "rgmii-id";
+	phy-handle = <&rtl8211fd>;
+
+	status = "okay";
+};
+
+&dspi0 {
+	status = "okay";
+
+	dpll@0 {
+		compatible = "microchip,zl30733";
+		reg = <0>;
+		spi-max-frequency = <12500000>;
+	};
+};
+
+&dspi2 {
+	status = "okay";
+};
+
+&emdio1 {
+	status = "okay";
+
+	/* Microchip LAN8023 dual 10G PCS/retimer, Clause 45 only, one address per slice */
+	lan8023_phy_s0: ethernet-phy@2 {
+		compatible = "ethernet-phy-ieee802.3-c45";
+		reg = <2>;
+	};
+
+	lan8023_phy_s1: ethernet-phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c45";
+		reg = <3>;
+	};
+
+	rtl8211fd: ethernet-phy@6 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <6>;
+	};
+};
+
+&emdio2 {
+	status = "okay";
+};
+
+&esdhc1 {
+	bus-width = <8>;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	non-removable;
+
+	status = "okay";
+};
+
+&fsl_mc {
+	status = "okay";
+};
+
+&fspi {
+	status = "okay";
+
+	/* GigaDevice GD55LB02GF, 256 MiB boot NOR */
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reset-gpios = <&gpio1 28 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <150000000>;
+		spi-rx-bus-width = <1>;
+		spi-tx-bus-width = <1>;
+	};
+};
+
+&gpio0 {
+	gpio-line-names =
+		"", "",
+		"altfn:iic1-sda", "altfn:iic1-scl",
+		"altfn:uart4-sin", "altfn:uart4-sout",
+		"altfn:uart2-sin", "altfn:uart2-sout",
+		"altfn:uart3-sin", "altfn:uart3-sout",
+		"altfn:uart1-sin", "altfn:uart1-sout",
+		"altfn:spi3-pcs3", "altfn:spi3-pcs2",
+		"altfn:spi3-pcs1", "altfn:spi3-pcs0",
+		"altfn:spi1-sck", "altfn:spi1-sin",
+		"altfn:spi1-pcs2", "altfn:spi1-pcs1",
+		"altfn:spi1-pcs0", "altfn:spi1-sout",
+		"altfn:iic6-sda", "altfn:iic6-scl",
+		"altfn:spi3-sin", "altfn:spi3-sout",
+		"altfn:iic4-sda", "altfn:iic4-scl",
+		"altfn:iic3-sda", "altfn:iic3-scl",
+		"altfn:iic2-sda", "altfn:iic2-scl";
+
+	status = "okay";
+};
+
+&gpio1 {
+	gpio-line-names =
+		"", "", "", "", "", "",
+		"cfg-rcw-src2", "cfg-rcw-src3",
+		"reset-req-b",
+		"altfn:sdhc2-clk", "altfn:sdhc2-ds",
+		"altfn:sdhc2-dat0", "altfn:sdhc2-dat1",
+		"altfn:sdhc2-dat2", "altfn:sdhc2-dat3",
+		"altfn:sdhc2-dat4", "altfn:sdhc2-dat5",
+		"altfn:sdhc2-dat6", "altfn:sdhc2-dat7",
+		"altfn:sdhc2-cmd",
+		"cfg-svr1",
+		"altfn:xspi1-cs0", "altfn:xspi1-sck",
+		"altfn:xspi1-dqs",
+		"altfn:xspi1-data0", "altfn:xspi1-data1",
+		"", "",
+		"flash-reset#", "pltrst#", "", "ethsw-reset#";
+
+	status = "okay";
+
+	/* Platform reset, no consumer node: released at boot */
+	pltrst-hog {
+		gpio-hog;
+		gpios = <29 GPIO_ACTIVE_LOW>;
+		line-name = "pltrst#";
+		output-low;
+	};
+};
+
+&gpio2 {
+	gpio-line-names =
+		"lan8023-mdint",
+		"i2c2-alert#", "i2c4-alert#", "i2c6-alert#",
+		"u800-tca9539-int#",
+		"spi3-alert#",
+		"wake0", "wake1",
+		"carrier-hot#",
+		"u1300-rtl8211fd-int#",
+		"ethsw-int#",
+		"", "",
+		"u1700-zl30733-clk-gpio0", "u1700-zl30733-clk-gpio1",
+		"u1700-zl30733-clk-gpio2", "u1700-zl30733-clk-gpio3",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "";
+
+	status = "okay";
+};
+
+&gpio3 {
+	gpio-line-names =
+		"altfn:ec1-txd3", "altfn:ec1-txd2",
+		"altfn:ec1-txd1", "altfn:ec1-txd0",
+		"altfn:ec1-tx-en", "altfn:ec1-gtx-clk",
+		"altfn:ec1-rxd3", "altfn:ec1-rxd2",
+		"altfn:ec1-rxd1", "altfn:ec1-rxd0",
+		"altfn:ec1-rx-clk", "altfn:ec1-rx-dv",
+		"", "",
+		"ptp-refclk-in",
+		"", "", "", "", "", "", "", "",
+		"u1700-zl30733-pps-out",
+		"",
+		"ethsw-mdio-en",
+		"usb1-oc#",	/* USB1_PWRFAULT and USB2_PWRFAULT pads: one wired-OR net */
+		"",
+		"usb2-oc#",
+		"altfn:spi3-sck",
+		"", "";
+
+	status = "okay";
+};
+
+/* On-module management bus */
+&i2c0 {
+	status = "okay";
+
+	/* +0V8_VDD core rail, MPS MPQ8646 (MPQ8785 core) over PMBus */
+	vdd08: regulator@10 {
+		compatible = "mps,mpq8646";
+		reg = <0x10>;
+	};
+
+	/* SO-DIMM SPD temperature sensors */
+	temperature-sensor@18 {
+		compatible = "jedec,jc-42.4-temp";
+		reg = <0x18>;
+	};
+
+	temperature-sensor@19 {
+		compatible = "jedec,jc-42.4-temp";
+		reg = <0x19>;
+	};
+
+	eeprom@52 {
+		compatible = "atmel,24c32";
+		reg = <0x52>;
+		pagesize = <32>;
+	};
+
+	/* Board ID straps */
+	gpio@74 {
+		compatible = "ti,tca9539";
+		reg = <0x74>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names =
+			"boardid-0x0001", "boardid-0x0002",
+			"boardid-0x0004", "boardid-0x0008",
+			"boardid-0x0010", "boardid-0x0020",
+			"boardid-0x0040", "boardid-0x0080",
+			"boardid-0x0100", "boardid-0x0200",
+			"boardid-0x0400", "boardid-0x0800",
+			"boardid-0x1000", "boardid-0x2000",
+			"boardid-0x4000", "boardid-0x8000";
+	};
+
+	u800: gpio@75 {
+		compatible = "ti,tca9539";
+		reg = <0x75>;
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		gpio-line-names =
+			"carrier-gpio0", "carrier-gpio1",
+			"carrier-gpio2", "carrier-gpio3",
+			"carrier-gpio4", "carrier-gpio5",
+			"carrier-gpio6", "carrier-gpio7",
+			"carrier-gpio8", "carrier-gpio9",
+			"carrier-gpio10", "carrier-gpio11",
+			"", "", "",
+			"lan8023-rst";
+		interrupt-controller;
+		interrupt-parent = <&gpio2>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie4 {
+	status = "okay";
+};
+
+&pcie5 {
+	status = "okay";
+};
+
+&pcie6 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};

-- 
2.43.0


