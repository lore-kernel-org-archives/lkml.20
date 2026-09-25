Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012057.outbound.protection.outlook.com [40.93.195.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE8F24501D;
	Fri, 25 Sep 2026 04:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790309757; cv=fail; b=uvz4owhmVnxCueChVSv4m/l+iGXkts9l5xbP4rgLuXbdOkxXIo/8i366j/jbHhq1TKfwqsaJHvO4g7HohQkVqPMEjWFSA8nQzmfheCoplg8KJXfWaCnO+H9rrfhVLrBM2bVrHF+kouBKLLAMGguOA0/TUOUmkBlEl0HGcoDcA3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790309757; c=relaxed/simple;
	bh=+2/DPm6iHTLQvH6GPl2AQabpMCm5kQOmKQO4ncE/uZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dd8I/gpAcieW1zBPZXGVvd6wRBSP9OjIUjYf6TTfjGXlJ+1bAbtOX2ETppghP1OqsaTwWDTMapM8JTCnuv/SQYevzAnrNxkhvPKkjtXytu1kTEfc8cKIL5reuUsmgF7GQ59gzS1jb/hmaYnCzj5MaAgpHakeMKjBQWB3j0MDzKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=KKqwvi/b; arc=fail smtp.client-ip=40.93.195.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="KKqwvi/b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKDWqhI+sTopXrndv+dfC1+/RNO0s2WjtWgs+QQHMI5ZbBtjHwVuuYkwy5KELa1GCer/GwAQn0hNbnJEjycWz+KwdmBOcbsZUEqZz27jj20LfSwqJeRc49Wc1RT1V+L0HJpjhAvv/iP8HyYBO2MP54mAxO0CtvlbI5nwcs087WEWgCHCEwiFmFfm/Jky/h5WmCcD3qVsM/SAFxJRpblpAarIhNKF/d2ZKjuzbcEl97X3ZbKC8ZZZAbo2ZwW0aCsYipKGRRSN139SFtP507Mp+5j94i8d47QVf1luQcQU1pQdCDdh176esrGjGDaSOH7EI/l/bx+rovUO0uhoOPg1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RI/dlO8/SocyckWMOynO62ejX7Kaqj7K3qqSBeqWhLI=;
 b=CwfzIc66AQbuSPHKHaThYU+wUuMnNvdZf6CvxF+jSjrKiRLDYtVBA8qjoJPBYrzcs5t8lCugx4gW2UFO30ltUh2oFNCbPxwAjwMn+/SZLCE9AmED4W+H3CBZvILCyBXEUoSTu9gVRJy38vLGhsfxkKYJJy/ZXxYtp0vJnpBH6+dPRUn8FVi23HQWK56N+eKaYuJD5XUR1f0ytO6RZ6MeaLjQIQF4sHP1TbhnpAW3J/kYr12kt4tIatOGbZGlLKyg3EMDnJibjSxMb6Q8BieNmSEkAoSGjIq3rL21jbYX2X6oeKHj2ObJVetblPukPzqEVhtfoHU8uRHf4bIluMtNDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RI/dlO8/SocyckWMOynO62ejX7Kaqj7K3qqSBeqWhLI=;
 b=KKqwvi/b9kOVg3pySo6GRls7PknBau/PsrkTBc9iDB+ACkdWa0AlSpbJ/88uRzX+/NDDgEjTEggeYDkWaMixdy/rgXGhBB1yhxadmpplzKwKBrW9/NZz0obJh13z4EJLSzFt4YAAsdHjCOhLtT1Fhai6umCiN3Yaeg37MDIP8j7xJWueyC7P/WqJrz9QGnJCpUhGOIIa1u6mwNGq8BhjlTo8nxvuNCS9gi/UDN5h9ZA6XPWv6Pc1ZO5KNi4+ksFw0sJm75Q2zBz4TA1kdk+ddqxlyGcuVEky9SwXSc7hfAdekj9UBjGIgjhsJT7Swe4MfzUger3WEjLxGmWHj5a5xg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by PH8PR03MB989672.namprd03.prod.outlook.com (2603:10b6:510:409::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 04:15:53 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%3]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 04:15:53 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Eggers <ceggers@arri.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 2/2] arm64: dts: agilex5: add support for debug daughter card
Date: Fri, 25 Sep 2026 12:15:37 +0800
Message-ID: <3dc20b61d38e.1790308304.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1790308304.git.adrian.ho.yin.ng@altera.com>
References: <cover.1790308304.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:4:186::21) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|PH8PR03MB989672:EE_
X-MS-Office365-Filtering-Correlation-Id: 14089816-b08b-4165-405a-08df1abbb062
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	38BeGGh+3SYMtn81gILg7/bskHOjwsEm+W6VIn4r+hb900mDS09oKTB0e5Tb/zoLBplzN54o09Izf4ONloh9/2i3MbSOxkR9HwHz2MwCyYaqSw0EKUIXOI+u32Q0bYGzDot7GeTjEG/iIMaSnw3w8PO0yChovw/maspQIHNShhhIQKmuaIO1vXjnShmcbeG2Tn7enuWIj+2SbXp7vd5+anLBQ8nGFKp9jSj2xNxDWR2QZ1bST9H/n1w2/k5YbETLW8KwsXkzoftA29kXOkRkpRG527iWNpi3QNClpyGyY2ogV8nFIqSb94E7WT1L8dLC4ZyKWogYf0U7f9RDgx0rVRAZwqaczxnWijjrY8DTjuxVca5AELPy7IP3sKEn6fQDHW26kNEy0GOtSsXPd2hWh47r5/VFSD3eifGhEX/MnuCdZnMWxTOBRT67JPCzi6eLUi8PXI+gU8n8K3j7p4+/kh9RQahb4rEzb74TCU7NExLCsGwnhscI9d289tvEoBRvzoUSSy6FRXOMBHpv6QJ8VQnCtYoKwErVDlfd/TlwCO9ztOtEJ9LgnCtEV8670+Lkw5UqHg5VCMfBsNFKxoUUReRFH4v8nQXzTta2KaUVL8YE/wQyCFt+YoVrBUwMiQqf9Usj45g+yxH0n83Ls0Cr01qDmI0yvnqfGQx+1Hqjlxg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PU9gg0+VwV2uTeqOOdDrYuJO6U15U9V38dnKXI3KBnYt+IskYXbINLiEbaWY?=
 =?us-ascii?Q?+0tBs6ZkNUEM6lRD7fPjxEtDMjXosLI60Cbbj4yE2+pOQZdOgYbvMnvwTelP?=
 =?us-ascii?Q?hBIiChbgZjmuwb+ucqgONBlWkQ7J6TFT8Y40dtMFc+aF5wMhNor6tIyV74+d?=
 =?us-ascii?Q?+d6ZCaJxS8KaBjO25Akr0szed2lAw4wUOabhpFHpmJ4xjjOgszUB2zuSo77G?=
 =?us-ascii?Q?DAQRU51G8cWBp6PuehUz9hEFLolyFqyxjAd/H3zcyE7dlH10mXzR4LtdZ1Eg?=
 =?us-ascii?Q?4aa9jnddRyJNeDN8CLl4VMTA3ygnvh04Azjj8c5hj3KRQ1O4co11SQwZ9j+4?=
 =?us-ascii?Q?z+W7hq3ShFSbTVsdKi4pwDHq+3iwSUz4B0o2cGQvNHXAGf/TYYvVBdjiBQy2?=
 =?us-ascii?Q?outxBUAN71EyXLfMogzKGaN0tC5NOImF/WUT3r5qQBiQHMyru6cgMxuQ/c2I?=
 =?us-ascii?Q?Z3UKmvpwwv+tVxZ85+tdKvp25B9+8hmRYI/DBLbLhHElUXRUYK8CdYyy9vZ/?=
 =?us-ascii?Q?c3g11W4HyWIyJ7bcnc6SQH0Lfb1yhDyRuj1hg7rxZEdpkRcR1zyZq9KD47Jk?=
 =?us-ascii?Q?SX8vY2hxPJDbUdu4AnGpHusAXr/sBSTA9PWjiHeLYq3jLilaQAwt45CwRf2j?=
 =?us-ascii?Q?sbEZmmirwVncQ0iLlZ4DlsWXDRK7RhMo2ZZ93v6PTKN1eM0GVIONoRoesVmR?=
 =?us-ascii?Q?+xdXleh7baTnKozXyxKCjuZSZJR/60SU7wS5h8GJBwpH1RhAywaDQbRIRwzI?=
 =?us-ascii?Q?iBV2h6fMJfGUQN0jNS6aG4yc2vUkZ/XX60k9UaJP8PAoiQMO/ls1Fm22nXz4?=
 =?us-ascii?Q?4LdHeCHnNN80/2Hbz8oCrAukS+Yex6AhLD9U/S90lZtdt0J/Y0KgqJKOV2/R?=
 =?us-ascii?Q?Z2SfIzEGdUC3v3mzGOsFDbWePFpJTXLWqn7Mr4VBZ2FAPGbV9fOx2yopmVjD?=
 =?us-ascii?Q?WiZBQRGzoD5itF0M8ed5v5zsSLLERcqVJabxDT2AENG3Xe9hIQ3fpHfk61L0?=
 =?us-ascii?Q?9jaqPxWeN6mvcPZ0L5lNv+NL4RpDkZqCY9CAG5mavkIISscUbCus3GDi9o2l?=
 =?us-ascii?Q?x+D2fAPeNPOnynojo3Wvb18ALuy5lXt8UwAeJShZWvm/53MEOcTghgsDA7iK?=
 =?us-ascii?Q?wzLGCwjBuWvf2jnvGj1IkOCBh1oH8i+pJzGC+D9a+LFUiK9+xe4Aid0S2X+f?=
 =?us-ascii?Q?YpXA13C+VYRqfKF1j1YFGtQQPVNg6g7O4Aa/Nmb1eXcJEzv6XfHu5VgejgqD?=
 =?us-ascii?Q?ewH1sLHAM+GjTPWlWsqT3rACfxWnOGENdM7oHxLlW74CNWhZG1f8gFQd7YAZ?=
 =?us-ascii?Q?ngZHsUOHILibUDL9ZQuttW6p2f4/jEhCyUkzu/hjoNB2Fa5Ydhgf/k9X2lSG?=
 =?us-ascii?Q?swcSWWz8fwH291gpgU/e7DVyZ8ADyNttlO5Q/y3KF6ZdfHXjb8hptKYntuPC?=
 =?us-ascii?Q?rEwVllPE9p/LxKZWMpyMtoF2IjBfyIH85U+1BDWbnTi1F8YWnGx/dyVCbMQW?=
 =?us-ascii?Q?zdttZX8FP9adN1zoPEU0JGJFDlBZe6kadPSiaRv45POsyv5D4EHYXQxZ5iRq?=
 =?us-ascii?Q?Owluqyj8Pit8fNeJrHSbekGVY8YfxX/FLerEaT70UEo1VI0knoBllY6ehxSi?=
 =?us-ascii?Q?n+kA1rPOwB+VA0EONSP1f5isfM1dDvoqJUjuovBmY/XyWTLVV8X3h4jqWQqL?=
 =?us-ascii?Q?XmPrTTgUCElQI2HqR0hOZ54+R6m6puRWZQOPAh/6NqtHh0uerMcE8bD3xptc?=
 =?us-ascii?Q?N5rATED0MXn7ch/RBieU0Tj54U93pxg=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14089816-b08b-4165-405a-08df1abbb062
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 04:15:53.1286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBRhy7UR2rGCT4JTVRoM0MgqrToB0+9w9gDYZIh1zSXPbxlIzknWDvSOoVZp/ECadB59vlAKJtYPSLVi42C+k1IDlFfj69LPCSAs5P3TvIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989672

The debug daughter card replaces gmac2 with gmac0 for Ethernet, leaves
gpio0 unrouted (HPS LED on gpio1/portb), and adds a Microchip 25AA128
16 KByte SPI EEPROM on spi0. Retain the SoC dmas/dma-names on spi0 so
the DT continues to describe the hardware DMA wiring. Set
spi-max-frequency to 500 kHz for board signal-integrity limits.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../dts/intel/socfpga_agilex5_socdk_debug.dts | 121 ++++++++++++++++++
 2 files changed, 122 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts

diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index b52cd2330cef..96dcbeed032c 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex3_socdk.dtb \
 				socfpga_agilex5_socdk.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
+				socfpga_agilex5_socdk_debug.dtb \
 				socfpga_agilex5_socdk_emmc.dtb \
 				socfpga_agilex5_socdk_modular.dtb \
 				socfpga_agilex5_socdk_nand.dtb \
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts
new file mode 100644
index 000000000000..b7b53576a136
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+#include "socfpga_agilex5.dtsi"
+
+/ {
+	model = "SoCFPGA Agilex5 SoCDK - debug daughter card";
+	compatible = "intel,socfpga-agilex5-socdk-debug", "intel,socfpga-agilex5";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+		i3c0 = &i3c0;
+		i3c1 = &i3c1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "hps_led0";
+			/* gpio0 is unrouted on the debug daughter card; LED is on gpio1 */
+			gpios = <&portb 12 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+};
+
+&gmac0 {
+	status = "okay";
+	phy-mode = "rgmii"; /* TX/RX clock delays provided by Agilex5 I/O hardware */
+	phy-handle = <&emac0_phy0>;
+	max-frame-size = <9000>;
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		emac0_phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
+&qspi {
+	status = "okay";
+	flash@0 {
+		compatible = "micron,mt25qu02g", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		m25p,fast-read;
+		cdns,read-delay = <2>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qspi_boot: partition@0 {
+				label = "Boot and fpga data";
+				reg = <0x0 0x04200000>;
+			};
+
+			root: partition@4200000 {
+				label = "root";
+				reg = <0x04200000 0x0be00000>;
+			};
+		};
+	};
+};
+
+&spi0 {
+	status = "okay";
+
+	eeprom@0 {
+		compatible = "microchip,25aa128", "atmel,at25";
+		reg = <0>;
+		spi-max-frequency = <500000>;
+		size = <16384>;
+		pagesize = <64>;
+		address-width = <16>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb31 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&watchdog0 {
+	status = "okay";
+};
-- 
2.49.GIT

