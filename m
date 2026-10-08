Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010004.outbound.protection.outlook.com [52.101.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FBF447811;
	Thu,  8 Oct 2026 08:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447039; cv=fail; b=HcNNhZnLT0n58MPUxvQ0GQw0WWemG62xShw3y02ca4zRHwMdpWb34RmlYwVfdPoNYNlEiqvt7Akc72GfEK3oImqL0CtvYMobulKqQmcR2QWI8wpkNCK4LWla23XuuFM8LPl9to6e4T5mmrZfzLK9dfLVHc2CMzOLcSjksT1jidc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447039; c=relaxed/simple;
	bh=vY/RZ5WMPEKSUuX1cqguaCN0tIr4loO6/K2oi4bHzsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YxSKV4LqYjEI5bwV2v0w2GXOAD/XVjPWbZTH/jbPtK6y/M05sOghzDlq/aOhLLEPCrnkEvnBOJdPitgiKaUihzwemiJ2F2DoBGDhYNGWSGRgRHBFX5BfQxCkAPZdga3Aznc+yEzM/CaNWNwV645MM1tqFFXCdtMlbZaWtVyxwhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=HVL3Dqqp; arc=fail smtp.client-ip=52.101.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="HVL3Dqqp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WV/lmlDz8pvc2tnkHUwBuMnyEbiTUZv09BzE78ijwurwVCn1HFXQp4bEwU2g57K3uE7WVyE8VSPvg5C8U9d/r2wcSTJGMzLpOSAdOSTNkD185evR8cThd2cCAkuoQAxCh3uLyY2Haz1tJjzsvM+mMe+eQflcvqkzt4u3fIXPr+YlIhvhqG6URSxz50e1R21VfhIoE2pJrBxIV4abFrRroXAEXDjBUdutmyCQLOvZQZTN3io1Lkz+Uj5tjjCg5dM6ZvY1RWaMw7GGUHyL5EAWIEHkNCuqqpy9Ona8/aOaOx6AezQKqtw2biO5aVicgjPljHLegSQ8PgemD9Bf3gOeVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kW2kgoyCLRsJ2ykllmu3RS1dKnIrvATQutM7/d7bxis=;
 b=APTkyukw4UrdMS+bL8+HN+Fg5Io6sdtALtU0Suh7Sq2bcT3Qw/C54oXl40J1jgu4wXC1gA1e9UvBhMCPWwCvax2m7GdnKLuO3fqlwj1SWW8KZqnED76LNQY47ac9Ztwt6BiIQivslFG0qAuU/DgF9FBDIgnyfktJMvqgYwIjfP6HT7xrBqfPg/k5BN0u9XFM/lt1z68Dis30FrR8aCFkueQILQWbg32PuJZx9Acbv9Iqxd+Suf+mjAUtrsGpzHRqNnlrIqKVkSZdRGyLXGyWspLsl+Gz6Pg4dpx9lcLBUOSgVJy1KUfd2jX8SImjIKliK6TGcLVCkCINHw5aPDJbNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kW2kgoyCLRsJ2ykllmu3RS1dKnIrvATQutM7/d7bxis=;
 b=HVL3DqqpjjgSs4dc1WhN9do52IhzvMVwTB1AGg67iA4HgRTqv1oNaO0MWGPD+NuOV6LX/bsJr5yZ3huoezptGGz7b5mGXJ6ttvcFlNwhW+NaTE8grbEvVwaQAFYX1YuoxXB7Iv8Wnr8rll4Ek9/Ula0ofDKKUWrFInTtYrEpD+506UwZJVvTmLS2banu6yVcZkkyBbezqPbNVXpPmK22cYUobfKJj3iryXqAMiq9zD0P+q4MYWACWkesB2RxpFjeS78dAkLmebarNZGAYmmNjn1deka5t84+vQiJbDTKxqauxFBiNZPZ+ZMfeQS0kPs2zBUcRUKRnppsl8Qdsmrnyg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by CH4PR03MB7745.namprd03.prod.outlook.com (2603:10b6:610:243::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 08:10:27 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 08:10:27 +0000
From: genevieve.chan@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: socfpga: agilex: add SoCDK multi-QSPI board
Date: Thu,  8 Oct 2026 16:10:14 +0800
Message-Id: <20261008081014.35006-3-genevieve.chan@altera.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20261008081014.35006-1-genevieve.chan@altera.com>
References: <20261008081014.35006-1-genevieve.chan@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::7) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|CH4PR03MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: f98d65a5-5de5-48a9-8029-08df25139c7a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|10067099003|18002099003|55112099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+mXe/nQCoIsDp56ZbcmnTF9QLEKsMcuAkIPZgT/0gK9c5RtZVCY2KGoD2QVE/U0+hdAV9KS4EzQCpYDxEPNtwdgqH6j52Kk//Z3zrnqWwTMZcBTMZYJPR1a7WB7WBqMOBv93AItR7LGOHoRBfUT1J/N+31gYIgEtWP0Z9mr4pTDkgthh3GnfikR6Rl1pd8X4kc9M8SjiwyYhMcrEE+T2dHRKvyR6DpW5PM9wSwUYFkeqSoAAXNRNGa0Hyg4uBp8Hnb/KdGvNkJDnYFvFssf7+LRPY/k1S6FQi/8F/z+MWDOvhVwmpxnojTg7gIfT3oSKKRhfEgutM4qg7jfJ/UeWKSTg8yNcwc2S8mT7OuXGrqI+wbv7m7d2hZa+EmF1c2D7GcMhkpW0NJqE3B88WtePKR0cc0YUvf7AVzmTB2nWGP8RAc7jDStalhiw14tZbQyFg2tFyFFX1kSREYLV08nD0kgpqNjcqFZmC/pbu2ku2pTECTqSGuh1LAdMG1oetNUq+DR11QNf810aTKV2I4AfTqWT1GqUHMBszx+KYanXGzh5WOsZ6PH+ag3DquooLJOUpAIAEmhX4t8kJeRHtIrcYz44kk7qap+lri6eJl7uUPZ4bpRv9SP00Qqxguh4DAA3njVV8u8my4LMA3bEJtJxVOzK8qqCk3oX1wt5r0Z3w5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(55112099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Aws3/7fIrUaDsGRer8G4V17v010kPM6rMk3ogJ0KTH1YlHVm0x3ZZA9Ptguo?=
 =?us-ascii?Q?azbfEj28gzA1AdLsYd2jPbpCw+jfO0TAjx+3axXfc11jUAJILKbw/MqNj582?=
 =?us-ascii?Q?QcOQPH4K/xRWVXc6TV7p0UY8MfyIG5TyBZ/t4V9kYxGO3m2PE1THZY2oCKt0?=
 =?us-ascii?Q?7tYWZXUHgmlkurdHn8PLI+hzvmt6biLgrtsX3EFRYIFajI0/89dZf4EhJ31v?=
 =?us-ascii?Q?IQfpwU2ZzbcKUcUG7bnHLwH1dv9rQPFcPqVCCAoQ9C1e+kcIaQ4Huvf97DNB?=
 =?us-ascii?Q?Py8kKEUIsj+zElu0vGqz8I5zAkUzIrT12ZB9EST2dpMJkoR2OHlwiWwhtusg?=
 =?us-ascii?Q?J6fUvu7HYDt7xedHr4Gylb72EfOcUhIBCanY1QMImE5n3wSf6TxgcFeGTUwm?=
 =?us-ascii?Q?8bnQKiDP/7w9kmfB1aIk2D1yGJ2k3k9L5Tb/+5uf8ph8Ac9Xgz9rMTLNK56X?=
 =?us-ascii?Q?gSzShnGNDe1F/nRYnVwbKTLrtOh8jIeZnf8t/RjXv0AP/4t1e5bceQzBkP9k?=
 =?us-ascii?Q?9Clgv8EoTUdT2bvn9adb+xwZpg7HJyGAqK6oWMOglU8beJxXRoZIMRLlzHDa?=
 =?us-ascii?Q?Ibj/KIe63DTvA8u3/BQR2IBKf8YqNvLQQcBd0U0HMKo5t+zlq7B3MilQ5/rw?=
 =?us-ascii?Q?duwNscqAAs0lKCDBc9v7ikkKqC3H1UCc0j3OsuugTURfKfrWi2e0S3NIdHKL?=
 =?us-ascii?Q?Rc7ZZ2z7cHugQpqrJV187mXnwdGJPSTfAqAZ7p9fCym4zDWO83zjW/MLow4u?=
 =?us-ascii?Q?6Um4pvl9OR0RaKgLChGwu4YhCPIz6Ly9dtH4uJZhgkm8u+S4Cw3tAW4onZdd?=
 =?us-ascii?Q?+PZMk4Msp29xZh/9y/KnxrH5CX+7CVF44EI+LnqoUbPaUm9qQsX2+Hd5vNcx?=
 =?us-ascii?Q?xw1m3MXcESwqraq+5sr/BLvvpmhfl+9qXo38cwwn09RDzO7zRf+h1Mi8QIBk?=
 =?us-ascii?Q?dm4lAp0qIa7mPM3oZgwBPbh/e04P0MCb7rOs/4ni3GBI6tWQKCbcUtB3SbqK?=
 =?us-ascii?Q?XBaLc88RJGHjjML7bMlUV6QaRmN3AKiiyQjGtkzmE3RBJC6pONqDMx3KOChe?=
 =?us-ascii?Q?RBsdHPZu6QnuSG8YfI61kTZQsnxdYddAnx27Ps/MwQdO0qrFacogW8LiODVx?=
 =?us-ascii?Q?dTF8Vw3V44MBqSfsgv436WfMZX8+fPaR9tcWNu8qd0H67aY7/puJPwNq/Vq4?=
 =?us-ascii?Q?6DRz/WNiKdI1w1QwJWboaXilVZmUGIop1UHOdRE2feUcM/XNExHM6ux44up+?=
 =?us-ascii?Q?rPu4SyBB8XaJHk7f1oCDEKtc29r/ic6qNiP0xTMzFAp0ZIM2/S8MBNSRuNPk?=
 =?us-ascii?Q?e0BCJDQg8V89k62w/LnKo456XJw0T4ASKFdRZh+c3jDF5/NiMUfiU6P+uGfA?=
 =?us-ascii?Q?h+nZkm9CDxHY0DwD2M3Uw6okh8CPPal3aLU8B/DIQqxaGKVzizPlleiqYEBa?=
 =?us-ascii?Q?sIO4qk92EZ8sTPOsXFDSonlw6MwE/ufWBchd1WjA5vwBhQtvcvXYKEM/3jtL?=
 =?us-ascii?Q?V1xKnsKb7bukHNuu9Z3bnX6pwdXZ2HpKlIHaAJI5I8z+ti57UVXnMPaE0SCz?=
 =?us-ascii?Q?4CnQXjoTIaPwvs+D8QbbT8+/bmz6jBbPgx1408z0ZKDQXK6rLEWkhJQ2gwem?=
 =?us-ascii?Q?cSvLth68V89PelabBeTaa/ePgQAfGfWoLIcGz5jkjcH6RKEogMaSdMI21uct?=
 =?us-ascii?Q?r3DWhc1IqFKHKVTYU1U7TBc/MY+5cQKFr3kFP7o3njeMsWvcghqbSjpCHH/g?=
 =?us-ascii?Q?mf3LigzOlb7mCJQ+GNsAo7IFhZ7o+Cc=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f98d65a5-5de5-48a9-8029-08df25139c7a
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 08:10:27.0714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYwG0RwbgX0LPYT2VUZ2lheEiQYb9qizV+G1QoC7r5z1BPET7nnU9Lf51zFrW/5khSpAUDPleU1uxtq4NtyqqCvxU8IYC1eLNCd8UcHmpkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7745

From: Genevieve Chan <genevieve.chan@altera.com>

Add a device tree for the Agilex SoCDK fitted with the multi-QSPI
daughter board. The daughter board replaces the single QSPI flash of
the default SoCDK with four Micron MT25QU02G flashes on chip selects
0-3, which allows the system to use up to 1 GiB of QSPI storage.

The board is otherwise identical to the SoCDK and builds on
socfpga_agilex.dtsi.

Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
---
Changes in v3:
- Reword subject to avoid repeating "Agilex".
- Move the DTS to arch/arm64/boot/dts/altera/, following the move of
  the SoCFPGA device trees in for-next.

Changes in v2:
- Rename file, compatible and model to drop the "agilex7f" prefix.
- Reword commit message to describe the hardware.

 arch/arm64/boot/dts/altera/Makefile           |   1 +
 .../altera/socfpga_agilex_socdk_multiqspi.dts | 213 ++++++++++++++++++
 2 files changed, 214 insertions(+)
 create mode 100644 arch/arm64/boot/dts/altera/socfpga_agilex_socdk_multiqspi.dts

diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
index 8f41349103b8..d38fe88a1cc8 100644
--- a/arch/arm64/boot/dts/altera/Makefile
+++ b/arch/arm64/boot/dts/altera/Makefile
@@ -2,6 +2,7 @@
 dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex_socdk.dtb \
 				socfpga_agilex_socdk_emmc.dtb \
+				socfpga_agilex_socdk_multiqspi.dtb \
 				socfpga_agilex_socdk_nand.dtb \
 				socfpga_agilex3_socdk.dtb \
 				socfpga_agilex5_socdk.dtb \
diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex_socdk_multiqspi.dts b/arch/arm64/boot/dts/altera/socfpga_agilex_socdk_multiqspi.dts
new file mode 100644
index 000000000000..0bf087fa7553
--- /dev/null
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex_socdk_multiqspi.dts
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

