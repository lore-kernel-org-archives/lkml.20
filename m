Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52DE49550B;
	Sat,  3 Oct 2026 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791056813; cv=none; b=cU1mPIE6hQHAH53JdoHQkGdya2RrPygYBwqSqZivup1VRWJo1uo7FCtHOfeg1YZpTFQqJxwwmirbjOudec9zL8ufSXmPigVuDi7xqKXnTlFqRbcFg+Y2cB4LDZ3yuuzY86N16RmC5cWdNklIS5ujXQpG/FxwmENnVQBHVkt8HKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791056813; c=relaxed/simple;
	bh=P9ozSnqVWalRrSxH8tpe1ilXni1JBzvQ7/L4JbSF//M=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=AvqM7aSY5oQsWQ7yVv1ArcVdWRauq0RGEXHmUL2glj82xWgvuxH/Qs/2FXkOcSlPa6vstGM4pgGHEJBNKsxXkBxU3/JM/MeHhMRtWKKOZE/9NKv37lgawHsJ7IAtMK11xQP7THqoYfXvzwU056Zi9Xxrk2/EncrU2FSfwNg5F7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=KL67htwL; arc=none smtp.client-ip=203.205.221.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="KL67htwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791056799; bh=qHxiskIY67gFxvCoFU0DoVPH6gqP+XMqup+38g2FCHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KL67htwLP8adNkWrgQk4Z62iA5LA3ivXGXgUFhvap+iIikGAckLj7rOESB4ilH2V5
	 UV7bx12PabOL+9qHN11iIJd12qOQXIq0MIKw/Tj87dAPK9TYIYrsIwMDp+Qj+4m8+N
	 PMybA91NXrmVAkV0aCCx+x+F80AIi49hYwPOMxDM=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id B9D93CB0; Sun, 04 Oct 2026 03:46:29 +0800
X-QQ-mid: xmsmtpt1791056796t82wd2kuz
Message-ID: <tencent_06FFBD8580099835137D0C541050057B4906@qq.com>
X-QQ-XMAILINFO: Mg/13mbJq/RurwuuSVqwyyJAr5uYH7g5ymw98PrEwe1xCQ/PzoBKMK8Tsd6DXD
	 HlwTUVf1YiF5K9vIEIoTuV+e020xyd/TuvW1l419QgLxEWzaXsqUcY2qzu2SJbVYL6vjgk7LwDKl
	 Gsj3VAIY6bkrAKcw1jILcIt+k8M9rWs3ri/vjFUpUJMxGRFpZVyQ6WEoru9dLgixDQAOIi4rbrO5
	 BjNjbt01WQfzLm0psFJu9Xf6FLm2fwyZ3lK2cmw+3reIIl0GuZmbgpj+OWoaPXRhlpg9q4/NQcrk
	 MuTHsQaWFW5wLR+oL0ybtodUMJLuXyyEbOKNH5p7htatzFueNzmnVIY7+AggQ255wIA+YCN4QTUQ
	 oHtseFZXS2bOmtUfL5dAc1/KZljwqkWV+1Jcl75NU2au1I8e8YURVE60WuCiorgq9FR5AMW8fLH9
	 QbjM0H1c7ZMkRmZF+5nbYNTzDEC/fe9VfrSc6NSkwG/4Igop+LdUy0MyErsq+WRtvQmM3LCBq3PS
	 mDki3atUOFm34Pzr8CUFc1CjrXvqfWjBAuuH7Sc2BIMjcYxsUqhsauqN3Kyzg8uo+j/KjQ/XfjX6
	 jMxBtlNHbcIUndvXwAwgcoNfNMAD2VXi8Rv/f2NC6k0D9cFUFj4RrX7oqQavyGpVDQmZOgFSOaY0
	 Jaare/IfyBi98zZvmjl3JBZFLDp3kg6HjFqN50EnXhll1PWao6F150b/637hUJmPJLXJUhUXFDDF
	 AIu95z7Yz2nkZW8MNZc9EjPM+cHEkmy1mfUOvHR0a1sHeHMSThvAmahMgdxAoMk1K1bYp1lC8DZi
	 Ua5XttljftjSMPMiapqzEAMRD6mPC0tHBLwHDAsyN5UBmG3Zi2n7KVAT0uz8UQmxb/gjbbQLeBxK
	 S0Z+vJXMctqK/z7KKmPmNDZduukB2W6/Tja6IasGZ0KU1jG2HVrfm3kOLOCym4Q/nygnZptrlc0Q
	 dQkItb+bBTjLl3HXSqqnPff5+jREOZ/fimk4lT+Mm4LWgN2MghchHHrNAEWc7CytHOHPE/KSlDG2
	 HGFp/DNzIB2jdrhovsy9AxdMkQckcZ+UjqLox5ePMYEj+Dpc+qbpbzFB6PbIK94kDENVyh02vPUH
	 hvbpsj
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: zynqmp: Add EBDEE EdgeBoard FZ3A development board
Date: Sun,  4 Oct 2026 03:46:25 +0800
X-OQ-MSGID: <20261003194625.936288-4-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003194625.936288-1-2254650260@qq.com>
References: <20261003194625.936288-1-2254650260@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EBDEE EdgeBoard FZ3A is a compute carrier board built around the
MYIR MYS-CZU3EG SoM with a Zynq UltraScale+ XCZU3EG.

Enable the board peripherals wired to the PS, including Ethernet, I2C,
storage, PCIe, USB, DisplayPort, UARTs, and AMS temperature sensing.

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 arch/arm64/boot/dts/xilinx/Makefile           |   1 +
 .../xilinx/zynqmp-ebdee-edgeboard-fz3a.dts    | 272 ++++++++++++++++++
 2 files changed, 273 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-ebdee-edgeboard-fz3a.dts

diff --git a/arch/arm64/boot/dts/xilinx/Makefile b/arch/arm64/boot/dts/xilinx/Makefile
index 70fac0b27..e31d6ee2a 100644
--- a/arch/arm64/boot/dts/xilinx/Makefile
+++ b/arch/arm64/boot/dts/xilinx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ZYNQMP) += avnet-ultra96-rev1.dtb
+dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-ebdee-edgeboard-fz3a.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1232-revA.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1254-revA.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1751-xm015-dc1.dtb
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ebdee-edgeboard-fz3a.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ebdee-edgeboard-fz3a.dts
new file mode 100644
index 000000000..bbe9610e3
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ebdee-edgeboard-fz3a.dts
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device tree for EBDEE EdgeBoard FZ3A carrier board
+ * populated with the MYIR MYS-CZU3EG SoM
+ * (Xilinx ZynqMP XCZU3EG, quad Cortex-A53 + PL, 2GB DDR4, 8GB eMMC).
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
+	model = "EBDEE EdgeBoard FZ3A (MYIR MYS-CZU3EG SoM)";
+	compatible = "ebdee,edgeboard-fz3a", "xlnx,zynqmp";
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
+	 * The PM firmware on this ZU3EG does not report the LPD_LSBUS
+	 * clock id as valid, so <&zynqmp_clk LPD_LSBUS> resolves to no
+	 * clock at all and drivers that require their bus clock fail to
+	 * probe.
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
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&gpio {
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
+
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
+};
+
+&psgtr {
+	clocks = <&gtr_refclk0>, <&gtr_refclk1>, <&gtr_refclk2>;
+	clock-names = "ref0", "ref1", "ref2";
+
+	status = "okay";
+};
+
+&qspi {
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
+	no-1-8-v;
+	status = "okay";
+};
+
+&sdhci1 {
+	disable-wp;
+	no-1-8-v;
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
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

