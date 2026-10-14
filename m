Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6D0563FD8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000249; cv=none; b=fPBAnrBTw7VpTVpbVSh12bI5yPQ8UuaAVABBYFEJQ3d8LCn4wqgWuv/WxlSIL/FXyk4f4tRJMZOGxsPKTY9E+rUVEm4R76hCECAAnjJaIW62eOGhs63ERGz/hiXN9HXmgCn3g5fnKuLpd0w5YXnIVzt22kReuKePH7r8BuL/TOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000249; c=relaxed/simple;
	bh=/ylPdz8tAGQFE2nYyZ2JzRgfHecRLY44y8Sr3VU56To=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gU69sxkFQ9+8JWnBDIOfZgY6FD5eZTkuQTK2+aC4FOEsdUJ72RA+nCeBMjaxrp7+hFXL70YnpMXsa/wGT8YX4k9IQtIXrmBJRy0uMpaD5EzDRhEH9mLkSjcl+tB0RSZvelfwU91IdfA63boYmVmY4Gn4P7qfxBWn+PIHg3Uucak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vsul7Wu4; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vsul7Wu4"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso2160120a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792000247; x=1792605047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYBpgkegkWJ3CyqTzxpHF4GV7nXLkfCjAQXCSbyoKms=;
        b=Vsul7Wu40rvB4XumWCNmyYCGhFY1o28JLKw46/I3jaD7RVJ/YWOfTODxNd9+92HjU0
         3QYHbTOdjCUiY2d6itJuT2o3AJ9IzlqEZGKKoc02Tfn6Yd8ybht18giXRUOXyPvhxuXd
         8oi5gwA9/xQa94sTl8zo5YSc7Y3KiBd2mVkJXqr6GBjKK4M0MnG9kh9EL8qPBDBF/esF
         5yJdH89SfJgZI9Rj6NFFhAxMp0p7hEDI8P1q3FsuxpNXkLLuCBINC4bJdixun/64I3Ir
         pP4YPvgMgr10iVCkiH4gcLXjkxeiTOEU5RMYMuQrj0raephZvkkh/nrK3gcYHz4AkgN0
         cIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000247; x=1792605047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYBpgkegkWJ3CyqTzxpHF4GV7nXLkfCjAQXCSbyoKms=;
        b=Lj9UaGB2fzwL9ldpEyd81jyK1Lvd5KOvXUT+2Zger6QdktJBOB8/v8ANQEy/Y/cBm1
         M2T1B+JtDsSanDyZqS2qyEgXs5WeSc4R5+TK8qL3W/9OlW1CT3XSbJfYbYP9Qc2Kr1BF
         PeUgoUe16uPXu3LYnmkjM+JXMJLi3Botn6twTucm8u4jSfFAbP/IQ0ubqq40Bt/1YBC6
         ZUt2sb59cFJ3B74aa+7x55ogDOFMb01UnAjHQuH/HAOdI1srvvZqm8eC9+cLzWX515pR
         EHYDSR8VZCLbruVmTB91+suqGasvYthwtC9o3H07Nt63O6f3L3ghNOn8S7KkDBqZWU7J
         burQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1l5munA0Fx+ycAy+OYaV3JCZQjjR4kZUIF/vPgVN4d7gAkMwN8WuQbwwrDCv19Eaw0Yt0BI3kOQDxweM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNfwjWs9QODp00PEfzk1wbyiu/2IWfELv0nX9fToEhBpiOkwmf
	qdsg8VIj0/7FWa6JqAU1ZuBom6NP0Kbh+wvqRX17q8YPOcVP0E4zg7p5
X-Gm-Gg: AYBFou2sxMa5XiH7ZWBT6xCwtC5NAZSiGWV3eOe3RIq28jOtuJLv4DCdPMsrVaxperS
	MGvS8kio54QeP/9Y8PVClqsznXd7uiribVew3MlGEpBgs1xZ+ar1WSdhrUwOyl7T+dk0jivmvpo
	az35wKQOd/aVi7l6XhPM/NocMjyH6K+FlB1xxNilvyatRmsv/LgGlX1YCjqA968VMfZXTi/0So7
	zJZSbN6WMPuQ8CAoWYRneY3ECfNczXSoUbJlIb6EZaR3wd1RhyU36BYG6XARgBgWdV7CKVJCUAb
	U0CY9TzmtVh/KBtOkqV9t5LTBa5QkaXr3YWof1Ea1aMCf/s5TkWDPN+PHvp8T3oGI0ksOUSH1Sv
	l0ID9kSHezdJr3YmlE5j5gJEFv4ocPiIEC9SpMaDVIKcXhuMlqgH+epmE46ed4+1fCVaJx9sHms
	v5CgT2pCFWQ+I6CDxVbLUihujOO3w+QbaVXCL2thzbJFjWsuPxNxouuOrV0p5oy0firD/tG0tgq
	529s0O1CH19hVGs3ea6
X-Received: by 2002:a17:90b:3c04:b0:3a8:a190:a18f with SMTP id 98e67ed59e1d1-3ab3a735fc7mr14363006a91.21.1792000246707;
        Wed, 14 Oct 2026 10:50:46 -0700 (PDT)
Received: from AERO17.taila7786d.ts.net ([156.231.115.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9449ae48sm403009a91.13.2026.10.14.10.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:50:45 -0700 (PDT)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: zynqmp: Add ALINX EdgeBoard FZ3A
Date: Thu, 15 Oct 2026 01:50:20 +0800
Message-ID: <20261014175020.62907-4-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175020.62907-1-cyan2254650260@gmail.com>
References: <20261014175020.62907-1-cyan2254650260@gmail.com>
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

Link: https://ai.baidu.com/tech/hardware/deepkit
Link: https://ai.baidu.com/ai-doc/HWCE/8kq9b2121
Link: https://www.alinx.com/
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
Changes in v3:
  - Update author and submission email to cyan2254650260@gmail.com
  - Add public board documentation and product links in commit message
    and DTS header comment (Michal Simek)
  - Conform to DTS coding style:
    - Sort compatible before model in root node
    - Sort children in natural-sort order
    - Reorder properties in canonical order (phys before phy-names, etc.)
    - Add required blank lines before status properties
    - Alphabetize pinctrl children and pin configurations

Changes in v2:
  - Rename to 'zynqmp-alinx-edgeboard-fz3a.dts' using 'alinx' prefix
    (Krzysztof Kozlowski)
  - Describe the board as a single board computer with the SoC, DDR4 and
    eMMC on one PCB, not a carrier board with a MYIR SoM (Andrew Lunn)
  - Add the MDIO bus and describe the KSZ9031 PHY with phy-handle (Andrew Lunn)
  - Enable eMMC HS200 on sdhci0: drop no-1-8-v, add pinctrl and mmc-hs200-1_8v
  - Drop power-source and bias-high-impedance from pinctrl_gem3_default,
    which only produce spurious warnings on pre-2023.1 PM firmware

 arch/arm64/boot/dts/xilinx/Makefile           |   1 +
 .../xilinx/zynqmp-alinx-edgeboard-fz3a.dts    | 360 ++++++++++++++++++
 2 files changed, 361 insertions(+)
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
index 000000000..6cad90091
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts
@@ -0,0 +1,360 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device tree for the ALINX EdgeBoard FZ3A
+ * based on the Xilinx Zynq UltraScale+ XCZU3EG
+ *
+ * Product info: https://ai.baidu.com/tech/hardware/deepkit
+ * Documentation: https://ai.baidu.com/ai-doc/HWCE/8kq9b2121
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
+	compatible = "alinx,edgeboard-fz3a", "xlnx,zynqmp";
+	model = "ALINX EdgeBoard FZ3A";
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
+	vcc_3v3_pcie: regulator-pcie {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio 37 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "pcie-reset";
+	};
+
+	reserved_memory: reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux_cma: cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x0 0x7ff00000>;
+			reusable;
+			size = <0x0 0x20000000>;
+		};
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x7ff00000>;
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
+
+	status = "okay";
+};
+
+&gem3 {
+	clocks = <&lpd_lsbus>, <&zynqmp_clk GEM3_REF>,
+		 <&zynqmp_clk GEM3_TX>, <&zynqmp_clk GEM3_RX>,
+		 <&zynqmp_clk GEM_TSU>;
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_gem3_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@1 {
+			compatible = "ethernet-phy-id0022.1620";
+			reg = <1>;
+		};
+	};
+};
+
+&gpio {
+	clocks = <&lpd_lsbus>;
+
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c1_default>;
+	pinctrl-names = "default";
+
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
+	pinctrl_gem3_default: gem3-default {
+		conf {
+			groups = "ethernet3_0_grp";
+			slew-rate = <SLEW_RATE_SLOW>;
+		};
+
+		conf-mdio {
+			bias-disable;
+			groups = "mdio3_0_grp";
+			slew-rate = <SLEW_RATE_SLOW>;
+		};
+
+		conf-rx {
+			low-power-disable;
+			pins = "MIO70", "MIO71", "MIO72", "MIO73", "MIO74",
+			       "MIO75";
+		};
+
+		conf-tx {
+			bias-disable;
+			low-power-enable;
+			pins = "MIO64", "MIO65", "MIO66", "MIO67", "MIO68",
+			       "MIO69";
+		};
+
+		mux {
+			function = "ethernet3";
+			groups = "ethernet3_0_grp";
+		};
+
+		mux-mdio {
+			function = "mdio3";
+			groups = "mdio3_0_grp";
+		};
+	};
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
+	pinctrl_sdhci0_default: sdhci0-default {
+		conf {
+			bias-disable;
+			groups = "sdio0_0_grp";
+			slew-rate = <SLEW_RATE_SLOW>;
+		};
+
+		mux {
+			function = "sdio0";
+			groups = "sdio0_0_grp";
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
+	clocks = <&zynqmp_clk QSPI_REF>, <&lpd_lsbus>;
+	num-cs = <1>;
+
+	status = "okay";
+
+	flash: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+	};
+};
+
+&sdhci0 {
+	assigned-clock-rates = <187498125>;
+	bus-width = <8>;
+	cap-mmc-hw-reset;
+	clocks = <&zynqmp_clk SDIO0_REF>, <&lpd_lsbus>;
+	disable-wp;
+	mmc-hs200-1_8v;
+	no-sd;
+	no-sdio;
+	non-removable;
+	pinctrl-0 = <&pinctrl_sdhci0_default>;
+	pinctrl-names = "default";
+	xlnx,mio-bank = <0>;
+
+	status = "okay";
+};
+
+&sdhci1 {
+	clocks = <&zynqmp_clk SDIO1_REF>, <&lpd_lsbus>;
+	disable-wp;
+	no-1-8-v;
+
+	status = "okay";
+};
+
+&uart0 {
+	clocks = <&zynqmp_clk UART0_REF>, <&lpd_lsbus>;
+
+	status = "okay";
+};
+
+&uart1 {
+	clocks = <&zynqmp_clk UART1_REF>, <&lpd_lsbus>;
+
+	status = "okay";
+};
+
+&usb0 {
+	phys = <&psgtr 1 PHY_TYPE_USB3 0 1>;
+	phy-names = "usb3-phy";
+	pinctrl-0 = <&pinctrl_usb0_default>;
+	pinctrl-names = "default";
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
+	phys = <&psgtr 3 PHY_TYPE_DP 0 2>,
+	       <&psgtr 2 PHY_TYPE_DP 1 2>;
+	phy-names = "dp-phy0", "dp-phy1";
+
+	status = "okay";
+};
-- 
2.56.0

