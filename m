Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013026.outbound.protection.outlook.com [40.93.196.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF9E2BF3F3;
	Mon, 12 Oct 2026 07:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791346; cv=fail; b=YejIlcXlYq5W7JJGKVuTy9udahHX5XIl0/ZrkKnZFHVhGXTg3XL3RislsBGPoEpo+/Dt/CUMZnVZ6FQpGhO60oXiAt2JZAeZ1UnOun7NG1Rb8JTYiaOWAwZsXtguCovEL3YGtIsM5wuXiGsLbpV3dTN4o6ZdxvXMyRZ7O6IoGE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791346; c=relaxed/simple;
	bh=uiEwZf7MpHrkFeqDXueYw68LYKgOKKd9x8DtwsBcYmU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l85ePXtuGiJdSAoVEJCutKpU+i+lmwg+KZkNpURuceBr58FKn463Gsw08vQl6iyt/9h+LekeJ8WxNOwKs2GVPEHX0W996P/6PnbxZt933N9Nd1DCaBfPpVrIIt+rBrp7bKiiVxzhrhyc4YTgxnzNkL8EQt0zkdAd9meu21RCxXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Hob2QMVa; arc=fail smtp.client-ip=40.93.196.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Hob2QMVa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZoHQx5oSVZr5iM3+4VRSW2ru0E1LoEYSnTicbRUUA3Lh2/TISeSFZ70I/Yrvzm52PuypqcwNZ/YQIA3+t/76bKM94cLMWH24Cyj+xW2+f1UynWApc3+ZdFja9RdH4JETXVogRZtnaH1mU+GiJcGsbyFGqgMo+AX2pGfuzrfoWHkxJR0bH9oVjH8Joe2JijaWA+Gzy2CI/srF7iEd01aUtSssL1vYTmVOw9wih9IhebTLMem55B/8w8Z5uJ41dZfyJV7pCUGP33qwk/+fHrZr+uUFN+INt0tnNTOmDJ5iEETboiCH3psr8rMOlq1UyvVa9x9mUBNXLufrwv5sV6ajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NV4zrVsefDJOD+Lhkz4gBWSeKjzgGP135SEWnBcGZNo=;
 b=duteMbCFeOqeuTklYj+GO/vuzwXd7tnphMM6Qit5LsdSiD+FrjPPK9GHPx0tpCOH+N8cD2c1AXckHi9CvecFlbM8AA325go8j2luifb3n7Es3MNlXonSl/YhvHZbV7xmG+lhuUMJNn4AVwBIy61gAvxu8J+7KzjgIXEd8hMoKJlhHjIytLUacrIG7uijmey7jJt8uMT32D3LL6BTkOEyMJWqOZ65NHooqKjChsKq3sU6LAux4Ah+uEQ23B7OU84RZjg0TJG2XcaLFTQKoQuNqVRLJnKPSd7NRSjpLDGl4RlLnE5Hzx/9a9uSWuM+GPqIygV9Ndu+X1E33LyQbnvGkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NV4zrVsefDJOD+Lhkz4gBWSeKjzgGP135SEWnBcGZNo=;
 b=Hob2QMVaQ8twgQPoF7SG8x8qkXH1l8TI/eX+5xvly5Q2SURrjYX3j8sQT0vHvCHMLIfcYbduVv2ete1t31FEm5MiRqv8rWOa2RDHNAuMq4aC305oMS2FmGxSHWtl9xdym8dyIft16n7eA7z6v43SXDTHurCLiljAL4ZrkMBrn5V1iz2xTBHrQSoeWxYZYtNndDyKScNT8X6IAZnwmVZu83eDgCW1kui+kAUIbqFuMP6PDMsGfD2XLsf6UkHfWXyW1WiCXf9wLdF2VS6F78FCmPQnyESoE/9XHAlVglTl8nkeKofxJOpgjh0aTgL8xa+eol8PliBUxZ1ncuB0Bq74pw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by CH7PR03MB7980.namprd03.prod.outlook.com (2603:10b6:610:249::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 07:49:00 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 07:48:59 +0000
From: genevieve.chan@altera.com
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] arm64: dts: socfpga: agilex: add SoCDK multi-QSPI board
Date: Mon, 12 Oct 2026 15:48:45 +0800
Message-Id: <20261012074845.18039-3-genevieve.chan@altera.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20261012074845.18039-1-genevieve.chan@altera.com>
References: <20261012074845.18039-1-genevieve.chan@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|CH7PR03MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: 68927fd3-6d58-4944-00fd-08df28354697
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|261009223027099003|11063799006|18002099003|22082099003|55112099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	/rG6waIUbBZr+y43tB1dp90A1NaZ13/dcKp0lawtQkliZxlHhrEyfiOlggiRMSk6jRtb1ZUOD5fTVpotumBS0Irv5EJxaB8Lm1AHaCr1vyYDiMGU3swIwLbhRscPu+iA0S27ujs/DgjGoQDO9d+G0MKg6na2yFbp0QDmL3bWPEwZ2Sn+GIqe/59djQuddBK4Afqs8s1eRXuASp+0IfmstoeovqxwMzVBnRyE2daEm8jIgx85joRijsGS0aVbyo2N+NiC6URqWpUQWYgzDoURUQAtLFAeLKFRRRc7baDCigRwwCRv3F3wbCp+QIOzHrKZ24jyaiK09ah7LCE2TZOgpATa6/041KXMtxZTZdtnofSj93YJziiLu9coLuPVeO9LTRv+Mld81XcWa/UJHID67wz6iCcOg5xYhS+/C2WRTO+KFabvnCHpruWKKgcO5Dq1mfOICdCrJT94n1wJkDEg1PpUGCsKhAmfUmvFTEeg4dmjemYvL/h2f+1awDG4MJdec8AKsWXe36gTMaZExpjUDEIqKRjMehyBQAf8U7hFwbGJFo1lxkG6btv0/S+yynDJa+mOaHmLVMRfdXsYAtXPQOxkGKxrkcFw5hqBceuojs4rs7BB5+gxzMRrAqyzeEmXn0ACN7R0IfQGS4EuGiq9Qk+F01zK2kDDg+kUmEG6fxU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(261009223027099003)(11063799006)(18002099003)(22082099003)(55112099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CfV6WSLSV7pYE3FC6Q5gUiAeQSilff5qnvG4+GkxOQwrDnbpSjer6dayysTY?=
 =?us-ascii?Q?h8PHXXzbIGJpvpzhh40bEmzlQEbIXVqxaeYimJSWXEzE0R4qle3Xt5ReDwPn?=
 =?us-ascii?Q?zGfHlQCTAS90fFT8A+TnOgx8r7ohIR2A0FMTy24kpUJ+r9bmiERs5nV0zuPD?=
 =?us-ascii?Q?cbOf2DjiBz+GlHanev643ZSd/Z4rQ8d98uGZpRZnxlVav6WcT0utz9QrPFv1?=
 =?us-ascii?Q?3BgXZg7bjO4Gkd1LMvSwvEiUT4s92h75jT7CEWaBPX6CXqpVcoAi5nuXuiHj?=
 =?us-ascii?Q?gxkTUZP+vOqnX0VfvF13qvv4DSQ5/7ueWDGK40p+HG8wojeDctsgomFZPLHf?=
 =?us-ascii?Q?Liqol7AHu3ZuTbZ1wd8vowa4qWWNFSpee/LWkX98rCT7ra4qPq7uREIkgolt?=
 =?us-ascii?Q?UULgEt3tMunPF8XM/4YtHjr9+ZEHEozRORPeieznkK9/zL/9ivJ4cexivl/G?=
 =?us-ascii?Q?18C5gxsq1JlLkTPcXABqi2DZUETfDPbklN+3MPbaIUp4PeT68eenk7z+VPFm?=
 =?us-ascii?Q?gI/fkV9LSlTkAt6PWca5xjOPJKsX2ucR7RN0C8iAu5xQpPrL2DfFWUZjnjm/?=
 =?us-ascii?Q?lhco6GLwpi2P2K6o+cw9tl/ZuyU7NBQBU2DDUr5EbEEvfYbMeqH2RIA2FHNb?=
 =?us-ascii?Q?C1++jRE5pYO3ly3i8qGA09qQ4gY4BovHF8+5heljb+dnstrDR/CM/07xfKls?=
 =?us-ascii?Q?7i7Y48i3luzmIXAln0K4qjl7urKrguwk0oV3oVH3cWi3ES9pra5FmAea8kPL?=
 =?us-ascii?Q?ClnWASzIC/eWynW0manF4YfqWF4XLJYKmSynr8HYzAtQNP2wFpg9cpZvY1xH?=
 =?us-ascii?Q?CXmPW5ctkWSnBv7ZppFlsZXaj0NVwFJhiSht7PsDgz275pXVi2rFSSvtSJpA?=
 =?us-ascii?Q?voFBmAaYQ+dwsToUBdE2U9Fk9XdD9TJJBPsdGN7zl8Nb+NEtpMHWIRwoEG1k?=
 =?us-ascii?Q?Rjq33YGcJ1leTAidHXENXwHOHXGfXKq5MQM4BtiwxMVF8T6m0YUv862ld0/j?=
 =?us-ascii?Q?4gXEaAdcSMmOAfdBs0knOmJkkEPz7VksRWb6r6LF1nAy8epc+tVmOe7dYrx/?=
 =?us-ascii?Q?qUbRzEuL3/FrADoOHDuba7HRoLivGAvAANnZY5cHEUlDewusQ3HLWwzcPdZs?=
 =?us-ascii?Q?jnV4l17IrKsRTjH0w+YgiwHT5DeGQRVXxSri0mNLhJeuQiGT8X9S7bmmxo8Q?=
 =?us-ascii?Q?V+ae7sWR+0W3gkCN24RSCV/3oc8OsvTFa4+RIy2+rzC+uoJQqhgrW/OcLhFU?=
 =?us-ascii?Q?KZrKClagkqC/989AdljZLuuVIgRMAqj5OVNb+l9CQ83J2RzEBfjNt10GD+zH?=
 =?us-ascii?Q?gg9V5iGNG/aJLHQO5wn3lGJlWizYk5ipeREelLLLNzKtNExcW1KkBjg38MMu?=
 =?us-ascii?Q?dJ/924ml7RQEEyUnPPMvkh0M+L7UDfeno+LN/dF55iUGP9wiBBqVSQNFD9bA?=
 =?us-ascii?Q?tx1sElJ3+BenZjRfsPXb5YJ/eEi6rU639f+n625M2fgyw3wmn1DYOBhPujXs?=
 =?us-ascii?Q?FsHmSU+URumQqcddlfJQGhpXCpdYDo+xN++j77odZKApe1mDWRC1l6mQwa7h?=
 =?us-ascii?Q?aOnW/S2CEvbCBQd9NQ7M9Acf1v0fcMaICXL7DpADCgQrtzotLIFHWaiXtbfC?=
 =?us-ascii?Q?NxGOtMgKsLlwlYr3323h8DEMFkB/3+JtwCHPwxITVmTD8kkxSwkpj1Dp4G3B?=
 =?us-ascii?Q?rCbModMn3bkninl64dAapn2IZ6ZEhFqicxCGr132a4M4Qqf+1O2KVSkzYgdj?=
 =?us-ascii?Q?txv0utW5aBg3BRVJ+bim5HBueGVgfD8=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68927fd3-6d58-4944-00fd-08df28354697
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 07:48:59.5311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpWcUUQOU6xRfVWR9ZUzs14QXolo5Ukv+0WdE/y9PPXyyYpewUcM7RSaRoEYC0bO0Hp527RYAGcUZS7y9NYoMs97ROncDUnnx+pIAqMxLe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7980

From: Genevieve Chan <genevieve.chan@altera.com>

Add a device tree for the Agilex SoCDK fitted with the multi-QSPI
daughter board. The daughter board replaces the single QSPI flash of
the default SoCDK with four Micron MT25QU02G flashes on chip selects
0-3, which allows the system to use up to 1 GiB of QSPI storage.

The four flashes share SCLK and DQ[3:0], with only the chip selects
routed separately. The added load of four devices and the longer
routing on the daughter board lower the clock the bus can run
reliably, so the flashes are described at 25 MHz, the rate Altera's
multi-QSPI reference design for this board is validated at, rather
than the 100 MHz used on the SoCDK.

Each flash has one partition covering the whole device. The partition
on flash@0 keeps the "Boot and fpga data" label, which U-Boot's RSU
code looks up to locate the boot partition on chip select 0. The
partitions on flash@1-3 are numbered so that every label is unique.

The board is otherwise identical to the SoCDK and builds on
socfpga_agilex.dtsi.

Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
---
Changes in v4:
- Give the partitions on flash@1-3 unique labels so that they do not
  share an MTD name with flash@0 (Dinh, Sashiko).
- Explain in the commit message why the flashes run at 25 MHz rather
  than the 100 MHz used on the SoCDK (Dinh).

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
index 000000000000..9b49d12cba36
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
+				label = "Boot and fpga data 1";
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
+				label = "Boot and fpga data 2";
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
+				label = "Boot and fpga data 3";
+				reg = <0x0 0x10000000>;
+			};
+		};
+	};
+};
-- 
2.43.7

