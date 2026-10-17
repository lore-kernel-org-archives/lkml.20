Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023076.outbound.protection.outlook.com [52.101.127.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A015F3BCD2A;
	Sat, 17 Oct 2026 04:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209663; cv=fail; b=IkgE0zqw256aRxIf5R3o7AV/CC4I1fcZsNqLiYaQhqNt7MmaGRDlCqicDORPPZKBMZRDxeZMtjWHsfwWvDakYY+CG26UUMkB3kfiHys2BdDVx74uf3twigQOMf0WcGk8Y1itVWMT6ZNT+MSvZ6xCT76wdksOBMCN3mBp5KpW3mQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209663; c=relaxed/simple;
	bh=AnC9GGCjby0jGpXHCKpefL35ni2Oa9pJHAOoYijJjxc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pN537+MxwW8NlFeFZKHycH9hQZAoAPDRhONBJi+FsxjC54eZvsZUMkI/GTv+rHkBnxjrGLIDlIrBpfbeQmLs9WUA027fLK6YO6+1rLrsXJyjE2Fp5S2hIayy+/7hBouef27P5AV1de4ctPvazICPSUbQI8TsbNHN1xby1Gf02Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khadas.com; spf=pass smtp.mailfrom=khadas.com; arc=fail smtp.client-ip=52.101.127.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khadas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khadas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoVYM2c/YT66QiuwH2v1ELSJBX7fZr7PMxVneFrVmL8+x7vB5jFyycZzXH7KFGEJdft6hTTH8ArLoF/bgWUTab6+MwwC17MGZZ5OePwgUY/lyV5nFQeLbtc9AFlQkoBGTwSpo0GK47ppan0dMpkSFLRqrQQO8JRNNco6ifa94saNCwhaF5nmirU5T4bWiQTWuRYHXxhvbMWNrbeif1UUdjyWAGk+k9O/z4SPPpEi3EOIGoD0/UDCMDQo2R9qk9FjfwiAGrcoP6+A4fQa6kELJuQe6/RyX2CJdd6L6gN6nzSbRooMKuXsjFOry+i7LiWJ3Vqn60W8l++nOgWHUg4q4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slda/DG39SvznetwCR8B6tRHrN4ajmqs3rExHNqn+7M=;
 b=cC/izwiZRF01jajcpLC2qaatDEOWKcSGXizEAXVC3Zm7yrLJ9Z2JjrU6jdNWqXHDjfFkTMixKQaD8TL6Zx5xRZ/t08Pos66kYRIwG0d/e5BTtEiaaABt24AnaGmptaVr4i5HSX8k7gCDHuuCA7gqGTK6452hdQXd3LeJKak7LUs43KlmmS4TO6pV3rXGYOiX6h9YQ9crnZmS2ZY6YhlffTjAk+7GvkhHY0DKaikjNQ4m6H9H2+xHNT0g/Jv2KGbZY2XAI2Q0zZEiFL5fyRmUkNOhjcIM1/9By/OaaQfkM+JCWFxap6sxlET/OfuyimUrmLBPb8seCR+t5Fx4ZE9b6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from KUXPR03MB10477.apcprd03.prod.outlook.com (2603:1096:d10:6e::13)
 by TY1PPFAEA8AB8B7.apcprd03.prod.outlook.com (2603:1096:408::a66) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Sat, 17 Oct
 2026 04:00:58 +0000
Received: from KUXPR03MB10477.apcprd03.prod.outlook.com
 ([fe80::889e:504a:790b:aa74]) by KUXPR03MB10477.apcprd03.prod.outlook.com
 ([fe80::889e:504a:790b:aa74%3]) with mapi id 15.21.0522.016; Sat, 17 Oct 2026
 04:00:58 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	christianshewitt@gmail.com,
	xianwei.zhao@amlogic.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xieqinick@gmail.com
Subject: [PATCH 2/2] arm64: dts: amlogic-a9-a311y3-khadas-vim-5: add initial device tree
Date: Sat, 17 Oct 2026 12:00:38 +0800
Message-Id: <20261017040038.3702428-3-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017040038.3702428-1-nick@khadas.com>
References: <20261017040038.3702428-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::15) To KUXPR03MB10477.apcprd03.prod.outlook.com
 (2603:1096:d10:6e::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUXPR03MB10477:EE_|TY1PPFAEA8AB8B7:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0e8558-46f8-4d71-f8b6-08df2c034009
X-LD-Processed: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|1800799024|366016|7416014|23010399003|38350700014|56012099006|261009223027099003|22082099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 mv+shi7pbe9fREowuJYnDu47V93ajNtHpqgIwipr5VW5U4sCDvDmkxnL+ALA7lfKpPiqpiYoIy7v0C233gdeRNXdAsOd6ENbCHf+r5M/+capLicXHZIGOOaFq0JTLR6FNVoG214CUx/EBf+T2HNFaAWll+5Ze0DR+7fthn5Grpk8eSS6s9vbV5Jix3YJfkl0mAadecb76L4eVHdEI49J3NMNkLfvXTCT5X4DVOQokola3d1UpAZoDwtlTGjZrI9jDnZP3qJEwliW3Jty1Suu4Oie/vh2LgHpbcbJoxMQGNdIJt9EBQLMSNzyasBZsSEmqXNRuV9DC2JbiHjBH+gI1n+ZPgwmbNGjEnm3YaPHP22niRkI2tEw2VCTG1n6Y1K1euOfZLIU1rR+XxmVjUv9eIc1LTPcBYFAfSHJc2FMarZ919F9pMHPrZZ0Yhz6OgIoQiRsYxQubF1TSG+hNzrN35BE6GnULcIoMj8JUjhYkjjaqc24l7oKuNzBJgiARySUW+yFelAHOXisdOXvF4cwSBjrSgsfV9PZwtWFwzhaFgRHnBDXhb9hDg6F6TwhzOYnvF9kA5A83gsPGtZTb2IwYTmKebGTbGEGFabH0DLkm2u8k4q/RnFs2/8UVSLYG8f2qqKVEUJkzcsvbKnqeaovgUat0i3U2eY5sFhYub0nbeWtzj2FYSl78i6tuzR5c1oU1UVIIqAtikXFdpMRBbNgUA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR03MB10477.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(7416014)(23010399003)(38350700014)(56012099006)(261009223027099003)(22082099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?VC4AstaM1XnIT+BxdMKdYvc6SbmJv8A38+YPvMIGHr0M1x58gdfSiFeGZUb6?=
 =?us-ascii?Q?U38tCybbkqpnZBC81nwAR18hIlG5gq0ROYQJPKMMyly1iWHn0gLQeT4vkplx?=
 =?us-ascii?Q?yTRInTgDFU4Tki6vPDwzhaSej1VbkCyF/v6jSbCQrrF1184tYP6hhUuMnv0g?=
 =?us-ascii?Q?QXayT9iNfYAZjjHr/nuq6aiOScEU2FBI/3/6Ldq/EDMcffZ6nak0vvmcN2O8?=
 =?us-ascii?Q?t+G9w8RDPsgCoyfZYYvgr+K9Saege6q8HfpChtgaJY4tbfAM3wFUDpd9qJOO?=
 =?us-ascii?Q?qWW5COcI6Ni89zUaqSOtSYC3KOODRRJe6FC3570TblWjwKpcnEs4sBY18k/i?=
 =?us-ascii?Q?LxRXcXy6Hz/as/dI0jcriGOiVKJxyznIJAx1q5NI7J9NVVBuf0nDWkWjdOYF?=
 =?us-ascii?Q?ZChX5HjdblEcItUoIFAriqQ1cxui5IBvQ5R3h8t3wBujj1efr5LHNlW8f6c/?=
 =?us-ascii?Q?qQlLKW8mzupGGsWNRXxzGH0in4v515t9bjeJ+hxdu7T//xgmZ5zFz2MLsT9k?=
 =?us-ascii?Q?ObzzIefhY9OIi6Oc+K7Sv3hqkMyc9zp1XCMQIAhZoPd46cS1qaAi4b/JS80q?=
 =?us-ascii?Q?ZtDePbz9VU7Az28Q7l6a+MVKJ2pMF1aFiddijjuRfFpoOJt6iP38+3mBbgEc?=
 =?us-ascii?Q?ZXtrYkiSJtPr+hSOFACnU7MTtDXkddu+tBlmii5ysI208j9lllnNv7UV9BGF?=
 =?us-ascii?Q?Dc48FXhSsVjDu4Aq58V2ZMkywQ4gM9jEigRGDWa43UUCzpScYUwXVsKzMQuC?=
 =?us-ascii?Q?Dd4kJ0eba+9ELr1EXNQGVbdwkozzGfLP8w8EGumN35ZnW9LEo0RKtG/L8mYr?=
 =?us-ascii?Q?mUuq2rKBNi1veQkBrxsNglx+R5DXSSDcXS1/ui4/2+LpMmmPCkg6dLfOe9TI?=
 =?us-ascii?Q?Kp/2mLuGvPkLBiL1Cg6pZeTNgdezCVcIJn7oeC+MRHFa3ePCiJTKbHzXrj47?=
 =?us-ascii?Q?bl4kANd80YCTleKA6hNl4s0geuQeq0JweaSFllXqWsSMNOfL1b6Za2/iVzPD?=
 =?us-ascii?Q?arNkW/u3QIXZbxUoiK4dlhxRa//qCqjrH5KnD8Jv+KsOfYpWbX47tyQQ1nqp?=
 =?us-ascii?Q?4FHywhEtxGXa5ek7ZC0+m4Il7im9RW+p3yoTwjGyRlv+1tJ0TDPVEre3uSEq?=
 =?us-ascii?Q?Uey1e9MLUsGY3OstGT2gN5hXw0DXpf6SQkAFjFHyGaHBzmzIoovoyPuQKUte?=
 =?us-ascii?Q?zbalUZLWVNXJ8NJ+7McLRGKca7HsA6L+zHuIJ/gShwhMbq3dgVyOHFt7vYRa?=
 =?us-ascii?Q?3Yt9noScqJu+ccoBttNPN3OrtDu3hyJoawz97qlvipiaUUmydfnd3Fp0rB/Y?=
 =?us-ascii?Q?Qe/ypH46mTQZP7IPJ26NuKHb/7trwm2bvF6IdI8dkbV/jcbXOzMh2P38GuoF?=
 =?us-ascii?Q?UAfhuEfB3m7uuYmc9TSWE5dDa50PBa7/t1FhBK0Kt5GAjysxkVk8YXwy+3kd?=
 =?us-ascii?Q?AgKENQ0cBHEtYW3u37YqHsa3aXfhktM1qW8pQOwSHflamgSdl/ke0jF2vfH+?=
 =?us-ascii?Q?eqJv5rX4PAlcvzE01nEHjliFUqgvIS2/dxbc6NVM0NyO0JA/QKyz8sCEW9Fr?=
 =?us-ascii?Q?RnAZTNPuylJcd8jC7qwSw6/jozFUZ8PyvcXkjC0hzok9LUFDSJ34BV5j4a6B?=
 =?us-ascii?Q?toMgorunPvawQIT1eC5DvGyfDP1gGp0O7oTnUgV4GpbfSiSKwzhWgjIex9EY?=
 =?us-ascii?Q?cAb+Tfjx3MQk2D6yEO3sw/qIMksJRnsOQIp17UV8v9O2RkcW?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0e8558-46f8-4d71-f8b6-08df2c034009
X-MS-Exchange-CrossTenant-AuthSource: KUXPR03MB10477.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 04:00:58.2164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkEFhLbbPO6FiIE3YWjIk0zvqSq4Bcs/KP6j0/uxM7RZCcMp4YwuWAp+Wpv1Gnw+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFAEA8AB8B7

The Khadas VIM 5 uses the Amlogic A311Y3 SoC, based on the Amlogic A9
SoC family, on a board with the same form factor as the
VIM/VIM2/VIM3/VIM4/VIM1S models. The serial debug console works with this
initial device tree.

It features:
 - 8GB LPDDR5
 - 64GB eMMC 5.1 storage
 - 32MB SPI flash
 - 10/100/1000 Base-T Ethernet
 - AP6275P Wireless (802.11 a/b/g/n/ac/ax, BT5.1)
 - HDMI 2.1 output
 - HDMI 2.1 input
 - 1x USB 2.0 + 1x USB 3.0 ports
 - 1x USB-C with USB 3.0/DP/PD
 - 2x LEDs (1x red, 1x white)
 - 3x buttons (power, function, reset)
 - M2 socket with PCIe, USB, ADC & I2C
 - 1x 4 lanes MIPI DSI
 - 1x 4 lanes MIPI CSI
 - 40pin GPIO Header
 - 1x micro SD card slot

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../amlogic-a9-a311y3-khadas-vim-5.dts        | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa55cc..8b4e3212be131 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -2,6 +2,7 @@
 dtb-$(CONFIG_ARCH_MESON) += amlogic-a4-a113l2-ba400.dtb
 dtb-$(CONFIG_ARCH_MESON) += amlogic-a5-a113x2-av400.dtb
 dtb-$(CONFIG_ARCH_MESON) += amlogic-a9-a311y3-by401.dtb
+dtb-$(CONFIG_ARCH_MESON) += amlogic-a9-a311y3-khadas-vim-5.dtb
 dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c302x-aw409.dtb
 dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c308l-aw419.dtb
 dtb-$(CONFIG_ARCH_MESON) += amlogic-s6-s905x5-bl209.dtb
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts
new file mode 100644
index 0000000000000..3989ce7a8aff9
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-khadas-vim-5.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Khadas Technology Co., Ltd.
+ */
+
+/dts-v1/;
+
+#include "amlogic-a9.dtsi"
+
+/ {
+	model = "Khadas VIM 5";
+	compatible = "khadas,vim-5", "amlogic,a9";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart_b;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0xe0000000>,
+		      <0x1 0x0 0x1 0x20000000>; /* 8 GiB */
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* 35 MiB reserved for ARM Trusted Firmware */
+		secmon_reserved: secmon@5000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x05000000 0x0 0x2300000>;
+			no-map;
+		};
+	};
+};
+
+&uart_b {
+	status = "okay";
+};
-- 
2.34.1

