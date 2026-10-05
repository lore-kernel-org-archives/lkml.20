Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE084D8D97;
	Mon,  5 Oct 2026 17:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221461; cv=none; b=gG3hOgh4SqlsfXIuah2djtJZefchDC7zl3IjbuWMoMW44Yc4YJ7buWpIJ1ZSa+HG9H8AHd4XUeThvnoiOAHocKnFEL4KLNEtFvfVjX2cYWsttDLMK+o6iOIbBzXVuY1da2zfhqnozEebh6sITMszjoQ3u/qabG9/rSOhaSVFoR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221461; c=relaxed/simple;
	bh=5NQ7XyPBSEK4cJl6wabNj7mdug4k/mpztbOtcDO6dRg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=nUYcTyGqqrW/9dnvMyVqk9xZbzv+EZVoe0t8AOutpNEP2HvmREe/v2nSaGlIsbD17wbtACXF/1hVZVKda3trXgBCwFLGwdLLrN4t2ZL8g0ofbWALj1MoYEZrFJ+KDL4EuQ7LAVyvYt2QKSK3HQlZj2BooEq8V99XmKQoLbYGTC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=l9YZuGu6; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="l9YZuGu6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791221447; bh=4TqsOa1rvGDxopVBYQ+zTn4967jcE0GLlKMO9YJV04I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l9YZuGu64l6YNUScxZAqrPveQSupH1zujFv8+6J0fKEyUVIWbD53R0CLzCGKmkxLH
	 tplAT6rbWFBmLV7q1Dsa3nDsiToHcn3m7SkL2Y5FNnAmS1LCldJXxdzCNhy2MGJ8K7
	 BPBw090a1EkNNeviBIlnTPHw1NFtkmDeuGHCmqck=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 7A82281B; Tue, 06 Oct 2026 01:30:40 +0800
X-QQ-mid: xmsmtpt1791221444tw7m44esb
Message-ID: <tencent_B409D5BD9480045814D3720C7D9047C55406@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb56ovUuknNPm1oIUn05VExjOqJsUmdfwgXPZ8UhOh5pdOVgOxrAb
	 Tc/jw7pRzljOXyzCjQlL819NaOO1hIidkUgYJCLUlAsE7cCgd5vQIDi0m822WbhFglB6ZsbKMn+d
	 UTb61T659JM9zT/U37G0baid56y8+nILjDqp33F+wY2v2N22OLSelUHGGidelLsEkxlAsXzIB/hW
	 7YX4Vayzd4uVt/NvVwllWnfDH3O/G+p6V4KKjYt8jNJDL0ct/azAoHQvw4t1wI3FSoCS2d5/xRg8
	 d4+5y0xSxj76zROcUD9Ofd8IX1wIeFcPEgAaUvoQkEvG0iFijvddQYFF9IHPvxbYwiOgkIhT399P
	 z4q2C7gR31cKQu3jZ8axcRqP/yWqxK+qvFKCknSoOpi//25zXg3ynIQc5FcZWcXsOnN1kvdHzSBM
	 YvgTrEP2o5rmkAfhrhXomGyNP/ypDqtZP+C/nUtF3md3SDWkZHx/tVlgVkRCt2vzhdc4dfOPG2wk
	 Eaddk7C3aCLlGPAsGjq4yZzZXihdN88sxLUBirWg43RrJyN2bPaT+DT1SJ5ctpeF3gc5YT8AZ7zn
	 pjIfqba61L5vW0VZTOa/JYYHHXzVGPCDXs1WoSZSvSD1F3iQFSVnVq/LcePUqNFIv0LfTShNFUCI
	 bKa8bMEMkIzTr0jHQywVYRE/qvQ9LNJUROvGhWPFeWGJOtfpKg6t2SFu8JqSnObMeYhqdEub7nfO
	 9nALAAgpEEwqWLPsYdo7/WZg1PHV8KiBe8GkWjyvSddOu/QtqB4Vw+lTrItqKOq9ByIn8P78Xxm5
	 LQQ78NIdap3tESlHq4WO/qFVr0M7hNimLQq8L9N9IxNB9332HJJQDYIlO7oMZ3p9185YPIWdkU9R
	 ++pWylDkMeZTsA0m5+nbrIk9DJBaIXUUdZzp9ZmxZ1iN9TcOASl0qEZn992Lrfx4jn2F69EUZTUh
	 xu62pNP9NKvH6VRP93brwJq+W8ggjLbgYs5aVImIaYUAAdeFcSlwRJ+ds+dhWM4Sckm342LFwbD/
	 X0zWKeYKKTcxJMkcwoywf7qYP+a4PuUqzzIe0ezcJadH05AfYoLqqBUKh3SRsMWVSGPOahidDQYW
	 QiXmXuQUl23KDR1pdiyOi6J1zEOQ==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andrew@lunn.ch
Subject: [PATCH v2 3/3] arm64: zynqmp: Add ALINX EdgeBoard FZ3A
Date: Tue,  6 Oct 2026 01:30:39 +0800
X-OQ-MSGID: <20261005173039.707304-4-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005173039.707304-1-2254650260@qq.com>
References: <20261005173039.707304-1-2254650260@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree for the ALINX EdgeBoard FZ3A, a single board computer
based on the Xilinx Zynq UltraScale+ XCZU3EG SoC.

Supported peripherals:
  - UART1 debug console
  - eMMC (HS200) and microSD card
  - GEM3 Ethernet with Micrel KSZ9031 PHY on the MDIO bus
  - I2C0 and I2C1
  - QSPI NOR flash
  - PCIe
  - USB 3.0 host
  - DisplayPort output

Tested on hardware with Linux 7.3.0-rc5: the board boots from SD card
into userspace over the serial console, gem3 negotiates 1000Mbps/Full
duplex with phy-mode = "rgmii-id", and the eMMC runs in HS200 mode.

The base DTB passes CHECK_DTBS=y, and the Xilinx SoC binding passes
dt_binding_check.

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 arch/arm64/boot/dts/xilinx/Makefile           |   1 +
 .../xilinx/zynqmp-alinx-edgeboard-fz3a.dts    | 350 ++++++++++++++++++
 2 files changed, 351 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts

diff --git a/arch/arm64/boot/dts/xilinx/Makefile b/arch/arm64/boot/dts/xilinx/Makefile
index 70fac0b27..3e07b36ef 100644
--- a/arch/arm64/boot/dts/xilinx/Makefile
+++ b/arch/arm64/boot/dts/xilinx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ZYNQMP) += avnet-ultra96-rev1.dtb
+dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-alinx-edgeboard-fz3a.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1232-revA.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1254-revA.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1751-xm015-dc1.dtb
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts b/arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts
new file mode 100644
index 000000000..ab6bda7a6
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts
@@ -0,0 +1,350 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device tree for the ALINX EdgeBoard FZ3A
+ * based on the Xilinx Zynq UltraScale+ XCZU3EG
+ *
+ * Copyright (c) 2026 Pufan Jin
+ */
+
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
+#include "zynqmp.dtsi"
+#include "zynqmp-clk-ccf.dtsi"
+
+/ {
+	model = "ALINX EdgeBoard FZ3A";
+	compatible = "alinx,edgeboard-fz3a", "xlnx,zynqmp";
+
+	aliases {
+		ethernet0 = &gem3;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		mmc0 = &sdhci0;
+		mmc1 = &sdhci1;
+		serial0 = &uart1;
+		serial1 = &uart0;
+		spi0 = &qspi;
+		usb0 = &usb0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	dpcon: connector {
+		compatible = "dp-connector";
+		label = "mini-DP";
+		type = "mini";
+
+		port {
+			dpcon_in: endpoint {
+				remote-endpoint = <&dpsub_dp_out>;
+			};
+		};
+	};
+
+	dp_aclk: clock-dp-aclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	gtr_refclk0: clock-gtr-ref0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	gtr_refclk1: clock-gtr-ref1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
+
+	gtr_refclk2: clock-gtr-ref2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+
+	/*
+	 * Vendor TF-A 1.8.1 does not register LPD_LSBUS (ID 31) into CCF.
+	 * Provide a fixed-clock fallback for bus peripherals to probe.
+	 */
+	lpd_lsbus: clock-lpd-lsbus {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x7ff00000>;
+	};
+
+	vcc_3v3_pcie: regulator-pcie {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie-reset";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio 37 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux_cma: cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			alloc-ranges = <0x0 0x0 0x0 0x80000000>;
+			size = <0x0 0x20000000>;	/* 512MB */
+			linux,cma-default;
+		};
+	};
+};
+
+&ams_pl {
+	status = "okay";
+};
+
+&ams_ps {
+	status = "okay";
+};
+
+&dwc3_0 {
+	dr_mode = "host";
+	maximum-speed = "super-speed";
+	snps,dis_enblslpm_quirk;
+	snps,dis_u2_susphy_quirk;
+	snps,hsphy_interface = "ulpi";
+	snps,usb3_lpm_capable;
+	status = "okay";
+};
+
+&gem3 {
+	clocks = <&lpd_lsbus>, <&zynqmp_clk GEM3_REF>,
+		 <&zynqmp_clk GEM3_TX>, <&zynqmp_clk GEM3_RX>,
+		 <&zynqmp_clk GEM_TSU>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gem3_default>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy0>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@1 {
+			reg = <1>;
+			compatible = "ethernet-phy-id0022.1620";
+		};
+	};
+};
+
+&gpio {
+	clocks = <&lpd_lsbus>;
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c0_default>;
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1_default>;
+	status = "okay";
+};
+
+&out_dp {
+	dpsub_dp_out: endpoint {
+		remote-endpoint = <&dpcon_in>;
+	};
+};
+
+&pcie {
+	phys = <&psgtr 0 PHY_TYPE_PCIE 0 0>;
+	status = "okay";
+};
+
+&pinctrl0 {
+	status = "okay";
+
+	pinctrl_i2c0_default: i2c0-default {
+		conf {
+			bias-pull-up;
+			groups = "i2c0_8_grp";
+		};
+
+		mux {
+			function = "i2c0";
+			groups = "i2c0_8_grp";
+		};
+	};
+
+	pinctrl_i2c1_default: i2c1-default {
+		conf {
+			bias-pull-up;
+			groups = "i2c1_8_grp";
+		};
+
+		mux {
+			function = "i2c1";
+			groups = "i2c1_8_grp";
+		};
+	};
+
+	pinctrl_usb0_default: usb0-default {
+		mux {
+			function = "usb0";
+			groups = "usb0_0_grp";
+		};
+	};
+
+	pinctrl_sdhci0_default: sdhci0-default {
+		mux {
+			groups = "sdio0_0_grp";
+			function = "sdio0";
+		};
+
+		conf {
+			groups = "sdio0_0_grp";
+			slew-rate = <SLEW_RATE_SLOW>;
+			bias-disable;
+		};
+	};
+
+	/*
+	 * Omit 'power-source' and 'bias-high-impedance' to avoid spurious
+	 * warnings on the board's pre-2023.1 PM firmware. Bank voltage
+	 * and pin directions are already configured by hardware.
+	 */
+	pinctrl_gem3_default: gem3-default {
+		mux {
+			function = "ethernet3";
+			groups = "ethernet3_0_grp";
+		};
+
+		conf {
+			groups = "ethernet3_0_grp";
+			slew-rate = <SLEW_RATE_SLOW>;
+		};
+
+		conf-rx {
+			pins = "MIO70", "MIO71", "MIO72", "MIO73", "MIO74",
+			       "MIO75";
+			low-power-disable;
+		};
+
+		conf-tx {
+			pins = "MIO64", "MIO65", "MIO66", "MIO67", "MIO68",
+			       "MIO69";
+			bias-disable;
+			low-power-enable;
+		};
+
+		mux-mdio {
+			function = "mdio3";
+			groups = "mdio3_0_grp";
+		};
+
+		conf-mdio {
+			groups = "mdio3_0_grp";
+			slew-rate = <SLEW_RATE_SLOW>;
+			bias-disable;
+		};
+	};
+};
+
+&psgtr {
+	clocks = <&gtr_refclk0>, <&gtr_refclk1>, <&gtr_refclk2>;
+	clock-names = "ref0", "ref1", "ref2";
+	status = "okay";
+};
+
+&qspi {
+	clocks = <&zynqmp_clk QSPI_REF>, <&lpd_lsbus>;
+	num-cs = <1>;
+	status = "okay";
+
+	flash: flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+	};
+};
+
+&sdhci0 {
+	clocks = <&zynqmp_clk SDIO0_REF>, <&lpd_lsbus>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sdhci0_default>;
+	non-removable;
+	disable-wp;
+	no-sd;
+	no-sdio;
+	mmc-hs200-1_8v;
+	cap-mmc-hw-reset;
+	bus-width = <8>;
+	xlnx,mio-bank = <0>;
+	assigned-clock-rates = <187498125>;
+	status = "okay";
+};
+
+&sdhci1 {
+	clocks = <&zynqmp_clk SDIO1_REF>, <&lpd_lsbus>;
+	disable-wp;
+	no-1-8-v;
+	status = "okay";
+};
+
+&uart0 {
+	clocks = <&zynqmp_clk UART0_REF>, <&lpd_lsbus>;
+	status = "okay";
+};
+
+&uart1 {
+	clocks = <&zynqmp_clk UART1_REF>, <&lpd_lsbus>;
+	status = "okay";
+};
+
+&usb0 {
+	phy-names = "usb3-phy";
+	phys = <&psgtr 1 PHY_TYPE_USB3 0 1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb0_default>;
+	reset-gpios = <&gpio 44 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&zynqmp_dpdma {
+	status = "okay";
+};
+
+&zynqmp_dpsub {
+	clocks = <&dp_aclk>,
+		 <&zynqmp_clk DP_AUDIO_REF>,
+		 <&zynqmp_clk DP_VIDEO_REF>;
+	clock-names = "dp_apb_clk", "dp_aud_clk", "dp_vtc_pixel_clk_in";
+	phy-names = "dp-phy0", "dp-phy1";
+	phys = <&psgtr 3 PHY_TYPE_DP 0 2>,
+	       <&psgtr 2 PHY_TYPE_DP 1 2>;
+	status = "okay";
+};
-- 
2.55.0

