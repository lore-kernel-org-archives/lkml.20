Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF9344E643;
	Wed, 16 Sep 2026 20:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591547; cv=none; b=B/iZzqwGtJkj4R4DWU+uUREf2LQKo/XT9+VLk4Sq4PhcQVwNnG5CV4hjUphbI2uKl5ctoJqS+Mw4LV7XwkD44n8HtEv+sdcgm/vg7PhiEdHaJiC9nrklVfYlvfD5b172kbOSo5iWWx0bEbrwsaWn24RfpH7beOABQWwvto21/gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591547; c=relaxed/simple;
	bh=TvSKCJsAq/O93QTgZ9ns9ddaLFPYsvJD1246e7VsV7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3LpZ9muwSkCi5sB+uip/9iPcQWc+y5P4TJTuTeC71Q5+JrjchRWhnmluMuMKsFrEGpzHsE524M4Dl5AArfNDq3ZoH4MSFaVlHVrcTxxik++16eMvIRX+fli3lO+UdflHrXunZbZ8P5Iducc17waCjsPdxQCPb0A0QbOTHdagTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=FWNPUY3+; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="FWNPUY3+"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C9D771048C9;
	Wed, 16 Sep 2026 22:45:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789591523; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=oy8FvNcsZUYI8cQuMY26obZ1RBpFojwLhsw5L0bjQp4=;
	b=FWNPUY3+Pn9YrmIXEKGqo7C4Bu7Cl11Jcm1CnoidCFTlKTRl2fcJ/OysosRWgRBI56xoQE
	nQRU4zs2U949/iLXjD44G3OUp0JPT64FgK7rnlu9+WXUzK1UoQTKmEhxqba/nMT2lF+GDC
	C8OUd+2oovZyqmVFcSaOVmKp7TI5+N5jU7UtqDZCKaKEGwSSkxs2+nYY634DszYRKpprC1
	/g3KFlY74sZRONnaRpeoL5MWCBXec3cNBKVoULvNT5zVlGfnR78rWJpOuJ8J775eywfv2J
	XpcEpqmgu+bENqE164uLW2EWKizuCel7fT508bRzg6oetLJohMWrPMf+J9JOgA==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
Date: Wed, 16 Sep 2026 22:44:28 +0200
Message-ID: <20260916204509.166633-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916204509.166633-1-marex@nabladev.com>
References: <20260916204509.166633-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
The board is populated with four ethernet ports, QSPI NOR,
eMMC, UART and USB host interfaces.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
NOTE: Checkpatch complains about ethernet-phy-id2000.a240 being
      undocumented, but the TI DP83822I is generic C45 PHY that
      is valided by Documentation/devicetree/bindings/net/ethernet-phy.yaml
---
V2: - Rename lm75 node to sensor@
    - Use GPIO_ACTIVE_LOW macro
V3: - Drop bogus clk_ignore_unused bootargs
    - Drop gpio line names
---
 arch/arm64/boot/dts/xilinx/Makefile           |   1 +
 .../dts/xilinx/zynqmp-vhip6-evalboard.dts     | 300 ++++++++++++++++++
 2 files changed, 301 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts

diff --git a/arch/arm64/boot/dts/xilinx/Makefile b/arch/arm64/boot/dts/xilinx/Makefile
index 70fac0b276df0..936ddf6eb80a6 100644
--- a/arch/arm64/boot/dts/xilinx/Makefile
+++ b/arch/arm64/boot/dts/xilinx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ZYNQMP) += avnet-ultra96-rev1.dtb
+dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-vhip6-evalboard.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1232-revA.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1254-revA.dtb
 dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1751-xm015-dc1.dtb
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts b/arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
new file mode 100644
index 0000000000000..ed2c6d170426d
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * ifm Zynq UltraScale+ MPSoC VHIP6 Evaluation Board
+ *
+ * Copyright (C) 2022-2026 Fedor Ross, ifm ecomatic gmbh
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
+
+#include "zynqmp.dtsi"
+#include "zynqmp-clk-ccf.dtsi"
+
+/ {
+	model = "ifm ZynqMP VHIP6 Evaluation Board";
+	compatible = "ifm,zynqmp-vhip6-evalboard", "ifm,zynqmp-vhip6", "xlnx,zynqmp";
+
+	aliases {
+		ethernet0 = &gem0;
+		ethernet1 = &gem1;
+		ethernet2 = &gem2;
+		ethernet3 = &gem3;
+		gpio0 = &gpio;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		rtc0 = &i2crtc;
+		serial0 = &uart0;
+		spi0 = &qspi;
+		usb0 = &usb0;
+		usb1 = &usb1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+};
+
+&dwc3_1 {
+	dr_mode = "host";
+	maximum-speed = "high-speed";
+	status = "okay";
+};
+
+&gem0 {
+	phy-handle = <&phy0>;
+	phy-mode = "mii";
+	status = "okay";
+
+	mdio0: mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: phy@1 {	/* TI DP83822I */
+			compatible = "ethernet-phy-id2000.a240",
+				     "ethernet-phy-ieee802.3-c45";
+			reg = <1>;
+			reset-gpios = <&gpio 78 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10>;
+			reset-deassert-us = <10>;
+		};
+	};
+};
+
+&gem1 {
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-rxid";
+	status = "okay";
+
+	mdio1: mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy1: phy@1 {	/* TI DP83822I */
+			compatible = "ethernet-phy-id2000.a240",
+				     "ethernet-phy-ieee802.3-c45";
+			reg = <1>;
+			max-speed = <100>;
+			reset-gpios = <&gpio 8 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10>;
+			reset-deassert-us = <10>;
+			tx-internal-delay-ps = <1>;
+		};
+	};
+};
+
+&gem2 {
+	phy-handle = <&phy2>;
+	phy-mode = "mii";
+	status = "okay";
+
+	mdio2: mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy2: phy@1 {	/* TI DP83822I */
+			compatible = "ethernet-phy-id2000.a240",
+				     "ethernet-phy-ieee802.3-c45";
+			reg = <1>;
+			reset-gpios = <&gpio 79 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10>;
+			reset-deassert-us = <10>;
+		};
+	};
+};
+
+&gem3 {
+	phy-handle = <&phy3>;
+	phy-mode = "mii";
+	status = "okay";
+
+	mdio3: mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy3: phy@1 {	/* TI DP83822I */
+			compatible = "ethernet-phy-id2000.a240",
+				     "ethernet-phy-ieee802.3-c45";
+			reg = <1>;
+			reset-gpios = <&gpio 80 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10>;
+			reset-deassert-us = <10>;
+		};
+	};
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	sensor@48 {
+		compatible = "national,lm75";
+		reg = <0x48>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+		label = "ifm-logging";
+		wp-gpios = <&gpio 36 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+		label = "ifm-deviceinfo";
+		wp-gpios = <&gpio 37 GPIO_ACTIVE_HIGH>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			vhip-signature@0 {
+				reg = <0x0 0x4>;
+			};
+
+			vhip-version@4 {
+				reg = <0x4 0x4>;
+			};
+
+			vhip-size@8 {
+				reg = <0x8 0x4>;
+			};
+
+			device-serial@c {
+				reg = <0xc 0x10>;
+			};
+
+			order-number@1c {
+				reg = <0x1c 0x20>;
+			};
+
+			article-name@3c {
+				reg = <0x3c 0x20>;
+			};
+
+			article-rev@5c {
+				reg = <0x5c 0x4>;
+			};
+
+			hardware-rev@60 {
+				reg = <0x60 0x4>;
+			};
+
+			product-type@64 {
+				reg = <0x64 0x20>;
+			};
+
+			software-compatibility@84 {
+				reg = <0x84 0x4>;
+			};
+
+			manufacturing-date@88 {
+				reg = <0x88 0x20>;
+			};
+
+			production-order-number@a8 {
+				reg = <0xa8 0x20>;
+			};
+
+			/* Each MAC address is padded to 8 Bytes */
+			cfg_eeprom_mac1: mac-address-1@c8 {
+				reg = <0xc8 0x8>;
+			};
+
+			cfg_eeprom_mac2: mac-address-2@d0 {
+				reg = <0xd0 0x8>;
+			};
+
+			cfg_eeprom_mac3: mac-address-3@d8 {
+				reg = <0xd8 0x8>;
+			};
+
+			cfg_eeprom_mac4: mac-address-4@e0 {
+				reg = <0xe0 0x8>;
+			};
+
+			cfg_eeprom_mac5: mac-address-5@e8 {
+				reg = <0xe8 0x8>;
+			};
+
+			cfg_eeprom_mac6: mac-address-6@f0 {
+				reg = <0xf0 0x8>;
+			};
+
+			cfg_eeprom_mac7: mac-address-7@f8 {
+				reg = <0xf8 0x8>;
+			};
+
+			cfg_eeprom_mac8: mac-address-8@100 {
+				reg = <0x100 0x8>;
+			};
+
+			next-block-offset@108 {
+				reg = <0x108 0x4>;
+			};
+
+			section-crc@10c {
+				reg = <0x10c 0x4>;
+			};
+		};
+	};
+
+	i2crtc: rtc@52 {
+		compatible = "microcrystal,rv3028";
+		reg = <0x52>;
+	};
+};
+
+&qspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-max-frequency = <80000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&sdhci0 {
+	xlnx,mio-bank = <0x0>;
+	status = "okay";
+};
+
+&spi0 {
+	status = "okay";
+
+	eeprom@0 {
+		compatible = "atmel,at25";
+		reg = <0x0>;
+		address-width = <16>;
+		pagesize = <64>;
+		size = <32768>;
+		spi-max-frequency = <60000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb1 {
+	reset-gpios = <&gpio 77 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
-- 
2.53.0

