Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022080.outbound.protection.outlook.com [52.101.66.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2954DD6D9;
	Thu,  3 Sep 2026 15:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449611; cv=fail; b=BPOcLjAxg9tfzO/q3V7Goi85wAqSxvOKWk732UXcAIE8zDyG3328yFdY7xU/ZCeEgMRdUXBmogTcPe1f3fSOJN6qksV9zoQ7eRmSJaJDTXvTqCR5BzBDIDN9AbfKpplolEFDMVgMLxQs81NTSe2g8meMiM0lr9WIET2DrXF7HXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449611; c=relaxed/simple;
	bh=m8Loxp7/KLKuF4hF7J7KFu5kYF5dL9vus05EovyZw6I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZfSaa8rv2iZrPZjooOyC8UYktiZ/+SIqBRoQvvD9RycZ5OdHdg75019UxQsok5nUfGNS4S1iE5vRPH01oK7A3ivqcvEiwndEfqL3c4dPLiANiN92s3zXe8BQYVfk0jBRQbJE0HvDpav1y4cpY5Zla/wMG83NHhQAik3+IARjvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.com; spf=pass smtp.mailfrom=phytec.com; dkim=pass (2048-bit key) header.d=phytec.com header.i=@phytec.com header.b=SAeI/1Fw; arc=fail smtp.client-ip=52.101.66.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.com header.i=@phytec.com header.b="SAeI/1Fw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rc5TObjixpAlCvRp5Sa5ppwh0HxLMEWJ/2SsIM5meDQeZzx3fAAHAdIyymqsDIJcIzn+3GySnwUfMhkW5iDx8tGU8zqRDCHn8i4THxFXsu9h6SJFp/3RNaqcya1K4tnPljDDkw+iv6nwAV40lqgIb3dJH71h++XI4wkF26NiSn3VV8aug28EiGrz8QI8IbPkdPKFO13YgXMrmjNd/JwXm86F8wt30nH1pLUcg6meyVcbZTT60YcVhbFvYHHeQJs6pvncg5FGXYIK04NrmGI1SZ3yhYhpTbA6WnQmZGS/HsuOQHiQijsJs0fDCbFSG4pKATFJ/aEErR4R8guyVVj4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f32M8UjwSjjTq+4x2wrdi6XVyHwP2W6yQkMyc5boZ2U=;
 b=Wjyv/FCF5/cZTUSlBazM5dpizcnrsW4pM+x5MUmeoqiKIAtePwejUzlYe/uvth3rnL4nn+pmRDUAweGqyu3Ue3OW9TmbOKunqX7XdUmPz3MrtEdfqvK0zhdMVpULILq2KkqDM8a9CnakoZB/VvBRzgYIBXp/vd8/B+OVVVIqx1C3z+gvEnw7EGLWNV3nLZn6CXGli8UKKjQP45IdeTkq2V+r7hO8cfvbGR9QOI+aEY4z7+yNsdpGJjpFsiN6glRe/mxvODdA1JFFKyTTOj6IshhhlqzRI3WtSr17q1UCOgaCccVZPZB6aMvb06W+OSx0SCAuciT6z2yKPMbk3PWuAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f32M8UjwSjjTq+4x2wrdi6XVyHwP2W6yQkMyc5boZ2U=;
 b=SAeI/1FwPJ4MGs35MkEleXpP8OEsY514p/tP+rcn+fgGml6V8Nci6qL1auQEhxW2fo4UzMdMMNSflGpWCkxic/ecXcWRo5bB7jzYST4bp7ayZk6niLcEfEtT7QLV4dEQk23O7sAFfkRrBmyEnl03XUiUvTEAmZS4yFlBghzjGE27iLjMrv5nW43arEaawhg65VUDJy8rD/ehmsAlChNuwdQlCirzwJY5Mddcw0g7a/Kph9DqI1+HEa2H1lgKpxAhIVeFBHxR0Uh0dDwXnOqZ7Q9OduHunuLXl9cbl22IWdThilVB7PO+WDYbnYOz7GuNqPyRTy3KlaCUiIiWwuZsrg==
Received: from DB9PR01CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::18) by DB8P195MB0694.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:15c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Thu, 3 Sep
 2026 15:33:23 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::4e) by DB9PR01CA0013.outlook.office365.com
 (2603:10a6:10:1d8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 15:33:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 15:33:22 +0000
Received: from phytec.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 17:33:18 +0200
From: Nathan Morrisson <nmorrisson@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <sashiko-reviews@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>,
	<w.egorov@phytec.de>
Subject: [PATCH v5 2/2] arm64: dts: ti: Add support for the phyCORE-AM67x
Date: Thu, 3 Sep 2026 08:33:04 -0700
Message-ID: <20260903153304.2823245-2-nmorrisson@phytec.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903153304.2823245-1-nmorrisson@phytec.com>
References: <20260903153304.2823245-1-nmorrisson@phytec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F8:EE_|DB8P195MB0694:EE_
X-MS-Office365-Filtering-Correlation-Id: 240e95d3-238e-45d2-41de-08df09d0b04b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|7416014|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	IZT/Bs0bSLiQwjjWSwJO2XzO/6vKYVtkXeOeoN5oxV+osu5vpgAs2eRX1KibLD8+J8sHj3h6Mt8Y4gnq3EWj4n1fF/UZknhTIBniHC1YutseVQyX7T0OPWYU/O6lL0m0U9kPkvtEUFjME9bXi/8gDb7YQkoBEjhI2DHcgkCT7o502wpI4wnB56TtDjwSkb/N8bOWzePaKYsBlw8VhBvIGWpLOQKzOsNttyatWGihM0UeW3a3mhS2sBlxJuHH2DFOZDpjx/r9dW9sl2gNiBp4UArf7Dwy2WcofJEDaatDkmMO/O9BYx3722o/C2YREPG7Yp5x3Us1rEpTs2PgF2YhNDqj/3muBFGpGnNzXzqqcAULDtMLjCFGr7KpooJO08io2qoITtRQKeGzvVRl2lDW7KMK9Fq9xrKq3CK1D1ZGeo21ekSGqrRMw3nygvOYaFB4d7FTA5wY7XWicu6ndnOAH4L/n7Yyr+rGxwL9Z7WhOM4NpJ7QPYg/IcnAe+BC/XPCjYeRMGL5c+G7cOiGNG4ltD8H/8EeFjsj9U9UiaSOdGZzttO5YNQHaDeYIjZ7GkX3w4X/zmKko0b2dbqM82mxhDr1wImVhMuEtH8gplCVrCBhghkO4bfTIJYQcwW5mOxMsZG6AOH6e20EW2olNYrem5J7vXSXV/YAgp5KP7ngNs54+Vyu5P1GqTKPKVNS7xpbJzgg/CX34BGdHl27Sumi5w==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(7416014)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l9irtaMKNymtABmm16jDPE0yXtoqfaUM5NCqCXxeY2oZEfbyDKfH6rUnk7OpPPl6v80lmxaXqZpUYEwfAqbObk8FkTokKKA8N4qgC2ghFKpiozqepD7cWcpjIHNfHcxdxdiFVZyeUvmgDq2lY97B1Tu8dfzoWYxbBTYM8ZghF02g3hTXZZaAINrKGqpHZVhJLui7+TVkcQeILCXnQo0GrSR4Y/9eb4mWSKjh6J8hEeHp/GypslVLn4H649GG94BqHXOSn1XzPwFHHHzlpl7iwUWXhN1La2l76iG1aT4jpvFHT/Dx2LH3WBq61BgVIroZ3fvFRSISiGQAylZBANTJJLF5Y8CkXbaiZrPPEhspynS0aABFkeFthpkwWXBhxitxbEqRGKu88KFyWB5ANA3fEKxXGkZ6fSt1S8sT6fW25JoIWGmXYndYmY8uU0BG4d+1
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:33:22.4773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 240e95d3-238e-45d2-41de-08df09d0b04b
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P195MB0694

Add support for the PHYTEC phyCORE-AM67x SoM [1] and the
corresponding phyBOARD-Rigel carrier board [2]. The phyCORE-AM67x SoM
uses the TI AM67x SoC and can come with different sizes and models of
DDR, eMMC, and SPI NOR Flash.

Supported features:
  * Audio playback and recording
  * CAN
  * Debug UART
  * eMMC
  * Ethernet
  * GPIO buttons
  * Heartbeat LED
  * I2C Current sensor
  * I2C EEPROM
  * I2C Light sensor
  * I2C RTC
  * Micro SD card
  * SPI NOR flash
  * USB

[1] https://www.phytec.com/product/phycore-am67x/
[2] https://www.phytec.com/product/phyboard-am67x-development-kit/

Signed-off-by: Nathan Morrisson <nmorrisson@phytec.com>
Reviewed-by: Andrew Davis <afd@ti.com>
Reviewed-by: Wadim Egorov <w.egorov@phytec.de>
---
Changes in v5:
* Rebased on v7.3-rc1

 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am67-phycore-som.dtsi      | 324 +++++++++++++
 .../boot/dts/ti/k3-am6754-phyboard-rigel.dts  | 431 ++++++++++++++++++
 3 files changed, 756 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 795978e962ee..0b0e2b75b5cb 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -200,6 +200,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 
 # Boards with J722s SoC
+dtb-$(CONFIG_ARCH_K3) += k3-am6754-phyboard-rigel.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai-csi0-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai-csi1-imx219.dtbo
diff --git a/arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi
new file mode 100644
index 000000000000..bc74c4eef193
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi
@@ -0,0 +1,324 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2026 PHYTEC America LLC
+ * Author: Nathan Morrisson <nmorrisson@phytec.com>
+ */
+
+#include <dt-bindings/net/ti-dp83867.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "phytec,am67-phycore-som", "ti,j722s";
+	model = "PHYTEC phyCORE-AM67";
+
+	aliases {
+		ethernet0 = &cpsw_port1;
+		gpio0 = &main_gpio0;
+		mmc0 = &sdhci0;
+		rtc0 = &i2c_som_rtc;
+		rtc1 = &wkup_rtc0;
+		spi0 = &ospi0;
+	};
+
+	memory@80000000 {
+		/* 4G RAM */
+		reg = <0x00000000 0x80000000 0x00000000 0x80000000>,
+		      <0x00000008 0x80000000 0x00000000 0x80000000>;
+		device_type = "memory";
+		bootph-all;
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		secure_tfa_ddr: tfa@9e780000 {
+			reg = <0x00 0x9e780000 0x00 0x80000>;
+			no-map;
+		};
+
+		secure_ddr: optee@9e800000 {
+			reg = <0x00 0x9e800000 0x00 0x01800000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dma_memory_region: memory@a0000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa0000000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: memory@a0100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa0100000 0x00 0xf00000>;
+			no-map;
+		};
+	};
+
+	vcc_5v0_som: regulator-vcc-5v0-som {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_5V0_SOM";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&leds_pins_default>;
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&main_gpio0 13 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			function = LED_FUNCTION_HEARTBEAT;
+		};
+	};
+};
+
+&main_pmx0 {
+	leds_pins_default: leds-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x034, PIN_OUTPUT, 7)	/* (K22) OSPI0_CSN2.GPIO0_13 */
+		>;
+	};
+
+	mdio_pins_default: mdio-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0160, PIN_OUTPUT, 0)	/* (AC24) MDIO0_MDC */
+			J722S_IOPAD(0x015c, PIN_INPUT, 0)	/* (AD25) MDIO0_MDIO */
+		>;
+		bootph-all;
+	};
+
+	ospi0_pins_default: ospi0-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x000, PIN_OUTPUT, 0)	/* (L24) OSPI0_CLK */
+			J722S_IOPAD(0x02c, PIN_OUTPUT, 0)	/* (K26) OSPI0_CSn0 */
+			J722S_IOPAD(0x00c, PIN_INPUT, 0)	/* (K27) OSPI0_D0 */
+			J722S_IOPAD(0x010, PIN_INPUT, 0)	/* (L27) OSPI0_D1 */
+			J722S_IOPAD(0x014, PIN_INPUT, 0)	/* (L26) OSPI0_D2 */
+			J722S_IOPAD(0x018, PIN_INPUT, 0)	/* (L25) OSPI0_D3 */
+			J722S_IOPAD(0x01c, PIN_INPUT, 0)	/* (L21) OSPI0_D4 */
+			J722S_IOPAD(0x020, PIN_INPUT, 0)	/* (M26) OSPI0_D5 */
+			J722S_IOPAD(0x024, PIN_INPUT, 0)	/* (N27) OSPI0_D6 */
+			J722S_IOPAD(0x028, PIN_INPUT, 0)	/* (M27) OSPI0_D7 */
+			J722S_IOPAD(0x008, PIN_INPUT, 0)	/* (L22) OSPI0_DQS */
+			J722S_IOPAD(0x038, PIN_INPUT, 7)	/* (J22) OSPI0_CSn3.GPIO0_14 */
+		>;
+		bootph-all;
+	};
+
+	pmic_irq_pins_default: pmic-irq-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x030, PIN_INPUT, 7)	/* (K23) OSPI0_CSN1.GPIO0_12 */
+		>;
+	};
+
+	rgmii1_pins_default: rgmii1-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x014c, PIN_INPUT, 0)	/* (AC25) RGMII1_RD0 */
+			J722S_IOPAD(0x0150, PIN_INPUT, 0)	/* (AD27) RGMII1_RD1 */
+			J722S_IOPAD(0x0154, PIN_INPUT, 0)	/* (AE24) RGMII1_RD2 */
+			J722S_IOPAD(0x0158, PIN_INPUT, 0)	/* (AE26) RGMII1_RD3 */
+			J722S_IOPAD(0x0148, PIN_INPUT, 0)	/* (AE27) RGMII1_RXC */
+			J722S_IOPAD(0x0144, PIN_INPUT, 0)	/* (AD23) RGMII1_RX_CTL */
+			J722S_IOPAD(0x0134, PIN_OUTPUT, 0)	/* (AF27) RGMII1_TD0 */
+			J722S_IOPAD(0x0138, PIN_OUTPUT, 0)	/* (AE23) RGMII1_TD1 */
+			J722S_IOPAD(0x013c, PIN_OUTPUT, 0)	/* (AG25) RGMII1_TD2 */
+			J722S_IOPAD(0x0140, PIN_OUTPUT, 0)	/* (AF24) RGMII1_TD3 */
+			J722S_IOPAD(0x0130, PIN_OUTPUT, 0)	/* (AG26) RGMII1_TXC */
+			J722S_IOPAD(0x012c, PIN_OUTPUT, 0)	/* (AF25) RGMII1_TX_CTL */
+		>;
+		bootph-all;
+	};
+};
+
+&mcu_pmx0 {
+	wkup_i2c0_pins_default: wkup-i2c0-default-pins {
+		pinctrl-single,pins = <
+			J722S_MCU_IOPAD(0x04c, PIN_INPUT_PULLUP, 0)	/* (B9) WKUP_I2C0_SCL */
+			J722S_MCU_IOPAD(0x050, PIN_INPUT_PULLUP, 0)	/* (D11) WKUP_I2C0_SDA */
+		>;
+		bootph-all;
+	};
+};
+
+&cpsw3g {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii1_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&cpsw3g_mdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mdio_pins_default>;
+	status = "okay";
+
+	cpsw3g_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
+	};
+};
+
+&cpsw_port1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&cpsw3g_phy1>;
+	status = "okay";
+};
+
+&ospi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ospi0_pins_default>;
+	bootph-all;
+	status = "okay";
+
+	serial_flash: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-tx-bus-width = <8>;
+		spi-rx-bus-width = <8>;
+		spi-max-frequency = <25000000>;
+		vcc-supply = <&vdd_1v8>;
+		cdns,tshsl-ns = <60>;
+		cdns,tsd2d-ns = <60>;
+		cdns,tchsh-ns = <60>;
+		cdns,tslch-ns = <60>;
+		cdns,read-delay = <0>;
+	};
+};
+
+&sdhci0 {
+	non-removable;
+	bootph-all;
+	ti,driver-strength-ohm = <50>;
+	status = "okay";
+};
+
+&wkup_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wkup_i2c0_pins_default>;
+	clock-frequency = <400000>;
+	bootph-all;
+	status = "okay";
+
+	pmic@30 {
+		compatible = "ti,tps65219";
+		reg = <0x30>;
+		buck1-supply = <&vcc_5v0_som>;
+		buck2-supply = <&vcc_5v0_som>;
+		buck3-supply = <&vcc_5v0_som>;
+		ldo1-supply = <&vdd_3v3>;
+		ldo2-supply = <&vdd_1v8>;
+		ldo3-supply = <&vdd_3v3>;
+		ldo4-supply = <&vdd_3v3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq_pins_default>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		system-power-controller;
+		ti,power-button;
+
+		regulators {
+			vdd_3v3: buck1 {
+				regulator-name = "VDD_3V3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_1v8: buck2 {
+				regulator-name = "VDD_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_lpddr4: buck3 {
+				regulator-name = "VDD_LPDDR4";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vddshv_sdio: ldo1 {
+				regulator-name = "VDDSHV_SDIO";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-allow-bypass;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_1v2: ldo2 {
+				regulator-name = "VDD_1V2";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdda_1v8_phy: ldo3 {
+				regulator-name = "VDDA_1V8_PHY";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vdd_1v8_pll: ldo4 {
+				regulator-name = "VDD_1V8_PLL";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+
+	vdd_core: regulator-vdd-core@44 {
+		compatible = "ti,tps62873";
+		reg = <0x44>;
+		bootph-pre-ram;
+		regulator-name = "VDD_CORE";
+		regulator-min-microvolt = <850000>;
+		regulator-max-microvolt = <850000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+
+	som_eeprom_opt: eeprom@51 {
+		compatible = "atmel,24c32";
+		reg = <0x51>;
+		pagesize = <32>;
+	};
+
+	i2c_som_rtc: rtc@52 {
+		compatible = "microcrystal,rv3028";
+		reg = <0x52>;
+	};
+};
+
+#include "k3-j722s-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts b/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
new file mode 100644
index 000000000000..5fd4a8ceca16
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
@@ -0,0 +1,431 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2026 PHYTEC America LLC
+ * Author: Nathan Morrisson <nmorrisson@phytec.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "k3-serdes.h"
+#include "k3-j722s.dtsi"
+#include "k3-am67-phycore-som.dtsi"
+
+/ {
+	compatible = "phytec,am6754-phyboard-rigel",
+		     "phytec,am67-phycore-som", "ti,j722s";
+	model = "PHYTEC phyBOARD-Rigel AM67";
+
+	aliases {
+		gpio1 = &main_gpio1;
+		mmc1 = &sdhci1;
+		serial2 = &main_uart0;
+		usb0 = &usb0;
+		usb1 = &usb1;
+	};
+
+	can_tc0: can-phy0 {
+		compatible = "ti,tcan1042";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+		standby-gpios = <&gpio_exp1 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	usb0_connector: connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		label = "USB-C";
+		data-role = "dual";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_usbc_power_pins_default>;
+
+		id-gpios = <&main_gpio1 15 GPIO_ACTIVE_HIGH>;
+
+		port {
+			usb0_con: endpoint {
+				remote-endpoint = <&usb0_ep>;
+			};
+		};
+	};
+
+	keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_pins_default>;
+
+		key-home {
+			label = "home";
+			linux,code = <KEY_HOME>;
+			gpios = <&main_gpio1 23 GPIO_ACTIVE_HIGH>;
+		};
+
+		key-menu {
+			label = "menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&gpio_exp1 4 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	vcc_1v8: regulator-vcc-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_3v3_aud: regulator-vcc-3v3-aud {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3_AUD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_3v3_mmc: regulator-vcc-3v3-mmc {
+		/* TPS22963C OUTPUT */
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3_MMC";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_3v3_sw: regulator-vcc-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3_SW";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_speaker: regulator-vcc-speaker {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_SPEAKER";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,widgets =
+			"Microphone", "Mic Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Stereo Jack",
+			"Speaker", "L SPKR",
+			"Speaker", "R SPKR";
+		simple-audio-card,routing =
+			"MIC1RP", "Mic Jack",
+			"Mic Jack", "MICBIAS",
+			"Headphone Jack", "HPL",
+			"Headphone Jack", "HPR",
+			"MIC1LM", "Stereo Jack",
+			"MIC1LP", "Stereo Jack",
+			"L SPKR", "SPL",
+			"R SPKR", "SPR";
+		simple-audio-card,name = "phyBOARD-Rigel";
+		simple-audio-card,format = "dsp_b";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,bitclock-inversion;
+
+		simple-audio-card,cpu {
+			sound-dai = <&mcasp0>;
+		};
+
+		sound_master: simple-audio-card,codec {
+			sound-dai = <&audio_codec>;
+			clocks = <&audio_refclk1>;
+		};
+	};
+};
+
+&main_pmx0 {
+	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0a0, PIN_OUTPUT, 1)	/* (N24) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
+		>;
+	};
+
+	gpio_exp0_int_pins_default: gpio-exp0-int-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0054, PIN_INPUT, 7)	/* (T21) GPMC0_AD6.GPIO0_21 */
+		>;
+	};
+
+	gpio_exp1_int_pins_default: gpio-exp1-int-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0244, PIN_INPUT, 7)	/* (A24) MMC1_SDWP.GPIO1_49 */
+		>;
+	};
+
+	gpio_exp2_int_pins_default: gpio-exp2-int-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0050, PIN_INPUT, 7)	/* (T24) GPMC0_AD5.GPIO0_20 */
+		>;
+	};
+
+	gpio_keys_pins_default: gpio-keys-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x01d4, PIN_INPUT, 7)	/* (B21) UART0_RTSn.GPIO1_23 */
+		>;
+	};
+
+	main_i2c0_pins_default: main-i2c0-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0)	/* (D23) I2C0_SCL */
+			J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0)	/* (B22) I2C0_SDA */
+		>;
+		bootph-all;
+	};
+
+	main_i2c1_pins_default: main-i2c1-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x01e8, PIN_INPUT_PULLUP, 0)	/* (C24) I2C1_SCL */
+			J722S_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0)	/* (A22) I2C1_SDA */
+		>;
+		bootph-all;
+	};
+
+	main_mcan0_pins_default: main-mcan0-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x1dc, PIN_INPUT, 0)	/* (C22) MCAN0_RX */
+			J722S_IOPAD(0x1d8, PIN_OUTPUT, 0)	/* (D22) MCAN0_TX */
+		>;
+	};
+
+	main_mcasp0_pins_default: main-mcasp0-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x1a8, PIN_INPUT, 0)	/* (C26) MCASP0_AFSX */
+			J722S_IOPAD(0x1a4, PIN_INPUT, 0)	/* (D25) MCASP0_ACLKX */
+			J722S_IOPAD(0x198, PIN_OUTPUT, 0)	/* (A26) MCASP0_AXR2 */
+			J722S_IOPAD(0x194, PIN_INPUT, 0)	/* (A25) MCASP0_AXR3 */
+		>;
+	};
+
+	main_mmc1_pins_default: main-mmc1-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x023c, PIN_INPUT, 0)	/* (H22) MMC1_CMD */
+			J722S_IOPAD(0x0234, PIN_INPUT, 0)	/* (H24) MMC1_CLK */
+			J722S_IOPAD(0x0230, PIN_INPUT, 0)	/* (H23) MMC1_DAT0 */
+			J722S_IOPAD(0x022c, PIN_INPUT, 0)	/* (H20) MMC1_DAT1 */
+			J722S_IOPAD(0x0228, PIN_INPUT, 0)	/* (J23) MMC1_DAT2 */
+			J722S_IOPAD(0x0224, PIN_INPUT, 0)	/* (H25) MMC1_DAT3 */
+			J722S_IOPAD(0x0240, PIN_INPUT, 0)	/* (B24) MMC1_SDCD */
+		>;
+		bootph-all;
+	};
+
+	main_uart0_pins_default: main-uart0-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x01c8, PIN_INPUT, 0)	/* (F19) UART0_RXD */
+			J722S_IOPAD(0x01cc, PIN_OUTPUT, 0)	/* (F20) UART0_TXD */
+		>;
+		bootph-all;
+	};
+
+	main_usbc_power_pins_default: main-usbc-power-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x1b4, PIN_INPUT, 7)	/* (B20) SPI0_CS0.GPIO1_15 */
+		>;
+	};
+};
+
+&audio_refclk1 {
+	assigned-clock-rates = <25000000>;
+};
+
+&main_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c0_pins_default>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	veml6030: light-sensor@10 {
+		compatible = "vishay,veml6030";
+		reg = <0x10>;
+		vdd-supply = <&vcc_3v3_sw>;
+	};
+};
+
+&main_i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c1_pins_default>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	audio_codec: audio-codec@18 {
+		compatible = "ti,tlv320aic3110";
+		reg = <0x18>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&audio_ext_refclk1_pins_default>;
+		#sound-dai-cells = <0>;
+		ai31xx-micbias-vg = <2>;
+		reset-gpios = <&gpio_exp1 7 GPIO_ACTIVE_LOW>;
+
+		HPVDD-supply = <&vcc_3v3_aud>;
+		SPRVDD-supply = <&vcc_speaker>;
+		SPLVDD-supply = <&vcc_speaker>;
+		AVDD-supply = <&vcc_3v3_aud>;
+		IOVDD-supply = <&vcc_3v3_aud>;
+		DVDD-supply = <&vcc_1v8>;
+	};
+
+	gpio_exp0: gpio@20 {
+		compatible = "nxp,pcf8574";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_exp0_int_pins_default>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
+		gpio-line-names = "CSI3_STROBE", "CSI3_TRIGGER",
+				  "CSI3_SHUTTER", "CSI3_OE",
+				  "CSI2_STROBE", "CSI2_TRIGGER",
+				  "CSI2_SHUTTER", "CSI2_OE";
+	};
+
+	gpio_exp1: gpio@21 {
+		compatible = "nxp,pcf8574";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_exp1_int_pins_default>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <49 IRQ_TYPE_EDGE_FALLING>;
+		gpio-line-names = "GPIO0_HDMI_RST", "GPIO1_CAN_nEN",
+				  "GPIO2_LED", "GPIO3_MCU_CAN0_nEN",
+				  "GPIO4_BUT2", "GPIO5_MCU_CAN1_nEN",
+				  "GPIO6_AUDIO_GPIO", "GPIO7_AUDIO_USER_RESET";
+	};
+
+	gpio_exp2: gpio@23 {
+		compatible = "nxp,pcf8574";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_exp2_int_pins_default>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
+		gpio-line-names = "CSI1_STROBE", "CSI1_TRIGGER",
+				  "CSI1_SHUTTER", "CSI1_OE",
+				  "CSI0_STROBE", "CSI0_TRIGGER",
+				  "CSI0_SHUTTER", "CSI0_OE";
+	};
+
+	current-sensor@40 {
+		compatible = "ti,ina233";
+		reg = <0x40>;
+		shunt-resistor = <18000>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c02";
+		reg = <0x51>;
+		pagesize = <16>;
+	};
+};
+
+&main_mcan0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mcan0_pins_default>;
+	phys = <&can_tc0>;
+	status = "okay";
+};
+
+&main_uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart0_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&mcasp0 {
+	#sound-dai-cells = <0>;
+	op-mode = <0>; /* MCASP_IIS_MODE */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mcasp0_pins_default>;
+	tdm-slots = <2>;
+	serial-dir = < /* 0: INACTIVE, 1: TX, 2: RX */
+	       0 0 1 2
+	       0 0 0 0
+	       0 0 0 0
+	       0 0 0 0
+	>;
+	status = "okay";
+};
+
+&sdhci1 {
+	/* SD/MMC */
+	vmmc-supply = <&vcc_3v3_mmc>;
+	vqmmc-supply = <&vddshv_sdio>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mmc1_pins_default>;
+	disable-wp;
+	no-1-8-v;
+	bootph-all;
+	status = "okay";
+};
+
+&serdes_ln_ctrl {
+	idle-states = <J722S_SERDES0_LANE0_USB>,
+		      <J722S_SERDES1_LANE0_PCIE0_LANE0>;
+};
+
+&serdes0 {
+	status = "okay";
+
+	serdes0_usb_link: phy@0 {
+		reg = <0>;
+		cdns,num-lanes = <1>;
+		#phy-cells = <0>;
+		cdns,phy-type = <PHY_TYPE_USB3>;
+		resets = <&serdes_wiz0 1>;
+	};
+};
+
+&serdes_wiz0 {
+	status = "okay";
+};
+
+&usbss0 {
+	ti,vbus-divider;
+	status = "okay";
+};
+
+&usb0 {
+	dr_mode = "otg";
+	usb-role-switch;
+	maximum-speed = "high-speed";
+
+	port {
+		usb0_ep: endpoint {
+			remote-endpoint = <&usb0_con>;
+		};
+	};
+};
+
+&usbss1 {
+	ti,vbus-divider;
+	status = "okay";
+};
+
+&usb1 {
+	dr_mode = "host";
+	phys = <&serdes0_usb_link>;
+	phy-names = "cdns3,usb3-phy";
+	maximum-speed = "super-speed";
+};
-- 
2.43.0

