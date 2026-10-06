Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1579130D40C;
	Tue,  6 Oct 2026 02:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791255276; cv=fail; b=WDWdWYOhmNuAgUtZs1hATtlJNXt1HPBwKrYu9lUhKVEyZsumoJ4BYjWP4IJPeIfPVL9k2YwUI7MPnPpZhrUcxz4Y8a4r0Ya3jEupyc+ZxlLtCWjoMv4jqUW3wOJO8oCkCI7PL5MNPF0v1Kb5+BgF7PT4dH0sOVNmwNtTKnCKidY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791255276; c=relaxed/simple;
	bh=orMkYlPad/AWA+po7bE9HqPU+GdzRh0BDbKQLjRqyb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a0sfssA1Mz3ui+A0YUrqU1uXDm+AKq1ah/eP0ITjH0ipj7swqA+Uek7kB62Je3KuXx37ab42j5+OwNbwL7T0uociGoRt01ckVZ2QJDyiJ+QXuHCFy6oOCTW19/WKN7Y9/L+BaFsSXTYFMzNDvASWeibAWarhX1LJ92ZRChjpeV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=YM+j0g7s; arc=fail smtp.client-ip=40.107.209.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="YM+j0g7s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8C8aZT7BMNRwRgFTE10hEPWVPIRUahZb4pGAg6uO3wJb7xQdb/2bzPHzvi2CgfPktafH/8rYp/cXIizzXVgMx58q6C8WbfRr8ggYJA45zNZTPxNYAfZZa9CkhF2EVQOgdMmft7YHBMcrapebyqAkwsugQsnUK/SzW0oZLSqxgEY3Ubp+qA2WFmcNfqOsrslFvDJxzNyDF7q5e4r/r8wCMhauMD8VtmFAyDGjrdV1BO7JtdTBxtij2scJKIaSS4Nb+Ev6Xovp2D2FmjLUELI/yr8RiiPkC0ObINKNRsLCREUiXz7a1MwCQGEBsv53cjcygAGolzHQhO9wmM5pN7EQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uad9LL5/yE2pdzy5303Dfb+abjnyrWlK3nAcQoHCLdA=;
 b=cLhzrjzSQJc6ApiHwVaqKejouyXnNSJarg7gTfCixzJ6RuRvOQfTMv2mllPjkQFhiLX6V8MMMC/rPrxUdKvIWLmB4tny6Id56vfYM99KAdpThNPI9wrNMzC8DRekFx+DORF2ChzZQGO/qJNHXFgemzsOIH1ARK6ikkqgQDk5pDoNQ5LlUEKMQMjjlPWO4N7A9+wqH7OfBzrUF3rQr6vQYVvM/M1qgzNoqDqKVP6u2picc6dKjA7UK4nQBeFrvPH4l9OvKB16yda7+Q0Hk40Vm76ne5EBkUamLUADL84TL7YeYDUTpYwk+u8PjlCrRJf5l1ZfDuSHdMEpd1c8gy+DMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uad9LL5/yE2pdzy5303Dfb+abjnyrWlK3nAcQoHCLdA=;
 b=YM+j0g7sskdoyadxQAdjiFJs5+oO8K7aFUtxe4fpoQBCWUCyQlXB7u2dOa7wFdAXVyv3uO9o0XqfhV0jUwA4H2xkUxE5e55165Ug8Hw+1G17NUq6LlndzAyc62jpgEDXMlLbAm6GYahAV68tTTclAsO6Cs2ngiYslNj7OVI1SYFlDtRH5IgSGZv6VxRiLU443DBmTF9Cp234oyDlq3NKBUtaHNUm18QdhDHYsjDSP8yrVSELf5hxT0ricK/yLDE07np4p8c/QKVk3hbzMfn6XFlSyIrt02K2gz8UjVfQAecH5mGtuTDUVFxiVtPh5uhfgzfiFXYZYRo71dfH3btKNg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by DS0PR03MB989595.namprd03.prod.outlook.com (2603:10b6:8:432::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 02:54:31 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 02:54:31 +0000
From: genevieve.chan@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: socfpga: agilex: add Agilex SoCDK multi-QSPI board
Date: Tue,  6 Oct 2026 10:54:18 +0800
Message-Id: <20261006025418.31931-3-genevieve.chan@altera.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20261006025418.31931-1-genevieve.chan@altera.com>
References: <20261006025418.31931-1-genevieve.chan@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|DS0PR03MB989595:EE_
X-MS-Office365-Filtering-Correlation-Id: bc192bda-cdbd-452e-753e-08df23552531
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|10067099003|22082099003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CknLV0bqZHXP+gDp6pq/HZjP3/4boDdJcVvgzeW2IPUqkxV+c/evifuLhYRLk60rxocGPcj94c4hcFS26k5vPdoMwxafhdqIK0EPZITKaxAweowQYcYKuAZZbQ3f0xPpy4r3CURPQ44oA0FDtwoy9cXCcQTbd+KejdxCgqIY9unEKE+2qJhNhfLPzjGox6F3kC4AqngjHQgXcwVWsP/h3sTcWKCkDptdI1uxAa6KS8pYJvGCkLRWZrN91eJ59k2yqqdfUVYfttmC5vHXV6PIwNYKmIEu+7g/a0zG9KuLsT/AMoSHeJHi4eDnaCGbOzyIxY7z5w0lP5atGngDIceGmsDCCKuZUGwP2L0L9tA4AZmIRz7xx17YAzMlC9mckyyS/Wh9AEuJK+/PGPOCcNIa9T82i1tib9S7WpWcxJU4wtSZMpj1nTrArjOFaSyUObBXvLjtv16kECGq4tYGEOTT2CuLYCtTGjDj8tqYiLw5Uz29p1DIeXoSSmYWD34xIM1TSdj27cpM5tuNyhAs9S/NloONxdbyjjBvcU5OZQJ4ksZPb0qoPv3UDVN/OyQJoodGsHAcvi8EASp4LGwaaeHODkjJbMzkoRAPbTMJsFv9Ti/4PTq+eBA+LO7fg27Z8bEoRb3Ot8DpiHwUta9rL2IBBnrIZklt8/1jeYWZ+3zG6PI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1tytatJteEPwvJtNyAAdoMQHmcHK54SfV3FAjv/cPRLGBSS1mYxjaDSZsOnI?=
 =?us-ascii?Q?pWemQk3E80GUtMIOcX8CJ5H9C5uCZbCrkE6s6LtXdD36nwgeFWL8PO0fApiH?=
 =?us-ascii?Q?SRUc9U91FDRoF2gncoLnPdKrTJ5MT3F9vdNCEHwbDd6LAH923jNbV23t9Jyf?=
 =?us-ascii?Q?asrdhMjhvXhAmFLMkxyFyGUC3QpznYvibLZWocp6pxCCGUXMPQHXlB4mQo+g?=
 =?us-ascii?Q?n/tiShm5jFQUhZOND1YK5qI4lNykFjlf9PLR1g1ImKflM9RZ7HvxVjs7bxuj?=
 =?us-ascii?Q?Fk/3dqlEUHrpKecA7XUCO+l9BJMcnE7ay/XNQHQUvF0prqp6DFbAqmJRS47W?=
 =?us-ascii?Q?k7P52PlPbUB9I+sfw4yipyxF2BvThPfCFK40urcDYN/cGQyBzgT/DniR8Nze?=
 =?us-ascii?Q?uFfqbvegnD9NC7U7XHzLrhb8QtMjvcMHPcMvNnwVHcXgy8Azmrg7fLf+XQdT?=
 =?us-ascii?Q?ie/4syJCiw7iE69yod06mqhF4fk+aMsUARCc9wAcXxLY9kyVqveq7QX3Vwdf?=
 =?us-ascii?Q?lNKBf6Mgutu3eGXLG9iXSVQZT4uWAAgEKPGtUGizzSbrtUEJ5WiazhxVumRo?=
 =?us-ascii?Q?tC50PPZkGIlU+QEZljg1WIfm9rLmguzvX/5CgvVhR7iXtxh0NXGnonyF+jol?=
 =?us-ascii?Q?n4taSY/9Iw7w+pqOLFqnY3r96ytI1q4akaSRb+3jKfANxTpSSBnAPpzen8vF?=
 =?us-ascii?Q?5Y3YyR/0RV0DewUYCKOWmnGd/uRZc2aGTFOZONrZzVbWx8VyCLhYBfUKqAmz?=
 =?us-ascii?Q?WmeRIK/7F3hGGw6dohSECGQd14dyUFpx25GyDWL08ZdBpp9fCF7jBaW0WDSA?=
 =?us-ascii?Q?pZwBOwPda19oJpUBhbhOR8vOaaVT4vgRukVihLVMO4O0t24cd1Kcc9+YnCaZ?=
 =?us-ascii?Q?O6YgBfMINdAALuzogVtCiEQ9mrKghqUkkyQQevRapiRhpKbjAXHF6lNYL55w?=
 =?us-ascii?Q?HG4hk8yzVA/Xp2HtbqnpIGS7MFDTfQN3lbj/LjiKO0WcjiGCHpOwAPRG6ckU?=
 =?us-ascii?Q?uqOo8fT5cy+GoesK5PNftB/Bxb5GWJa5mJDFRs7aMTsODYdtbTAPZeUvBJxT?=
 =?us-ascii?Q?XRmh6OAyNtwvfBCIGlOuA/3JejLgCZ/2GsjXVG0J7hyzVp0un5OSt/KnciPO?=
 =?us-ascii?Q?KctxVZHNycFuup/9x96fTlw/op8oLFzWE0/xhIEV4N6UvGiI5qSNhwf/BEiF?=
 =?us-ascii?Q?L8P+EKQriyuEySWMuo1AbWWtmVP88E1OqK+8sijxkLdaNH192Aw2RobySPxl?=
 =?us-ascii?Q?GRcEJlNokIyZr7Znh0SCi9GX+HzOSYikaA9VOh3Jx/EY68yON3VxwvqKEY14?=
 =?us-ascii?Q?tq/V3OOBYzqkQEFN5Ww4M5rRgDoeyUtF+zdd+RBaM4O6qPs5D3bQpgn8gpzN?=
 =?us-ascii?Q?UEJbnwQVSwWroNDBoFrgFNWY/0jvj4NIklAzktz4mLYpTaH52UrYZ82Ugfk/?=
 =?us-ascii?Q?PprNZbNyAvgYgo04sCCFBdqmYp1vP9m/Oah0PL2wjd0NxqJq87yiHKV6LrFE?=
 =?us-ascii?Q?00HP66cnZEdKmBjWrZRsYBweu4SEgCjembZV2fE1ieAZZQ9yHbBDOmKEC7yZ?=
 =?us-ascii?Q?U/nZzmMeiY3j1pddW4JxtH3VOxiktyzdkP7STCEJ7S42RIX+CnBA19OXoU/k?=
 =?us-ascii?Q?rwLV448VySB7revyYyQXU+G1JqurqN7xEk0D/CJb6eOpQL7Qwk00rK6tM8tO?=
 =?us-ascii?Q?ZFFR9tzFrjBw1Fil2F13mcMzG+Hi5n5UgKC2CMs+behDOx3WI97CYERxlJUI?=
 =?us-ascii?Q?B5HSRbFnF84kky4xyjn5HcVGS+fpkAw=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc192bda-cdbd-452e-753e-08df23552531
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 02:54:31.4681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqWqfaOdzgEDt0VbSSk4iHfZ9ebKZMj8yPinEifoiT9KVRZWqH3u3HDoFU5RtIlE2p9PC/E/kSVOZgAp9d/ItkP2Jjrc2lqiUupARGac0fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989595

From: Genevieve Chan <genevieve.chan@altera.com>

Add a device tree for the Agilex SoCDK fitted with the multi-QSPI
daughter board. The daughter board replaces the single QSPI flash of
the default SoCDK with four Micron MT25QU02G flashes on chip selects
0-3, which allows the system to use up to 1 GiB of QSPI storage.

The board is otherwise identical to the SoCDK and builds on
socfpga_agilex.dtsi.

Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
---
Changes in v2:
- Rename file, compatible and model to drop the "agilex7f" prefix.
- Reword commit message to describe the hardware.

 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../intel/socfpga_agilex_socdk_multiqspi.dts  | 213 ++++++++++++++++++
 2 files changed, 214 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex_socdk_multiqspi.dts

diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index b52cd2330cef..071bad408688 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -2,6 +2,7 @@
 dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex_socdk.dtb \
 				socfpga_agilex_socdk_emmc.dtb \
+				socfpga_agilex_socdk_multiqspi.dtb \
 				socfpga_agilex_socdk_nand.dtb \
 				socfpga_agilex3_socdk.dtb \
 				socfpga_agilex5_socdk.dtb \
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_multiqspi.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_multiqspi.dts
new file mode 100644
index 000000000000..0bf087fa7553
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_multiqspi.dts
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026, Intel Corporation
+ */
+#include "socfpga_agilex.dtsi"
+
+/ {
+	model = "SoCFPGA Agilex SoCDK multi-QSPI daughter board";
+	compatible = "intel,socfpga-agilex-socdk-multiqspi", "intel,socfpga-agilex";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led0 {
+			label = "hps_led0";
+			gpios = <&portb 20 GPIO_ACTIVE_HIGH>;
+		};
+
+		led1 {
+			label = "hps_led1";
+			gpios = <&portb 19 GPIO_ACTIVE_HIGH>;
+		};
+
+		led2 {
+			label = "hps_led2";
+			gpios = <&portb 21 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0 0x80000000 0 0>;
+	};
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+	/* PHY delays are configured via skew properties */
+	phy-mode = "rgmii";
+	phy-handle = <&phy0>;
+
+	max-frame-size = <9000>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@4 {
+			reg = <4>;
+
+			txd0-skew-ps = <0>; /* -420ps */
+			txd1-skew-ps = <0>; /* -420ps */
+			txd2-skew-ps = <0>; /* -420ps */
+			txd3-skew-ps = <0>; /* -420ps */
+			rxd0-skew-ps = <420>; /* 0ps */
+			rxd1-skew-ps = <420>; /* 0ps */
+			rxd2-skew-ps = <420>; /* 0ps */
+			rxd3-skew-ps = <420>; /* 0ps */
+			txen-skew-ps = <0>; /* -420ps */
+			txc-skew-ps = <900>; /* 0ps */
+			rxdv-skew-ps = <420>; /* 0ps */
+			rxc-skew-ps = <1680>; /* 780ps */
+		};
+	};
+};
+
+&mmc {
+	status = "okay";
+	cap-sd-highspeed;
+	broken-cd;
+	bus-width = <4>;
+	clk-phase-sd-hs = <0>, <135>;
+};
+
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	disable-over-current;
+};
+
+&watchdog0 {
+	status = "okay";
+};
+
+&qspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "micron,mt25qu02g", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <25000000>;
+
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
+			qspi_boot0: partition@0 {
+				label = "Boot and fpga data";
+				reg = <0x0 0x10000000>;
+			};
+		};
+	};
+
+	flash@1 {
+		compatible = "micron,mt25qu02g", "jedec,spi-nor";
+		reg = <1>;
+		spi-max-frequency = <25000000>;
+
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
+			qspi_boot1: partition@0 {
+				label = "Boot and fpga data";
+				reg = <0x0 0x10000000>;
+			};
+		};
+	};
+
+	flash@2 {
+		compatible = "micron,mt25qu02g", "jedec,spi-nor";
+		reg = <2>;
+		spi-max-frequency = <25000000>;
+
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
+			qspi_boot2: partition@0 {
+				label = "Boot and fpga data";
+				reg = <0x0 0x10000000>;
+			};
+		};
+	};
+
+	flash@3 {
+		compatible = "micron,mt25qu02g", "jedec,spi-nor";
+		reg = <3>;
+		spi-max-frequency = <25000000>;
+
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
+			qspi_boot3: partition@0 {
+				label = "Boot and fpga data";
+				reg = <0x0 0x10000000>;
+			};
+		};
+	};
+};
-- 
2.43.7

