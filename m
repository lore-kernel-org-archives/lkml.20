Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013063.outbound.protection.outlook.com [40.107.162.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720254BEE59;
	Thu,  1 Oct 2026 22:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894205; cv=fail; b=QI4LcE1xfYA/vITlnq/DaUgrp1rUu2IAo3ehJ2LsCXtHvKik6w0nzDGUT748Q1J2yKnEN06Ui0MsmcRPEcwcVEfQiA55DNh7RbIGt9KYy0pYbxCNwZGWsRy+tRx3D29fcHxEWja3C3GGGrWQ2zMOpvWf5sUU7KKCncbXsJf1PHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894205; c=relaxed/simple;
	bh=4ODIw4lgiHUec5CO6s+SGorLb4HAoshDaFBWQ0o8leY=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=jg7URdQxyhEF0xz1o0/C8/CdD5u+C+p9nfdEiz/vcxcufAt9ozyFYk9QoFxcmxc58GE39V5TyesAQTKTaoZaMeok+9MfRg55v/bB24plHtqP2XsY6FvP9lV4NRbWYFVgae9i7r+mJiTPNot7Wuq0tSB7m3i/rwprbvSJGs0BV/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=QPHdursg; arc=fail smtp.client-ip=40.107.162.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="QPHdursg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKuqTGoYufE8cQ+1wUatNhikP52C44UkXrnGcPjjIyAHmpi2ODxNSRMFPwdzY60NL5RqrIZnPdreJVbPO0Woip3irYNqYjr12qWcv+v2Gaz50IkcRuTzZRH5WYvxqLG3EUbX1bDjUuHuq/FMPcc+51vWIFRHRYUS05Ko4h2WAuzBKx2DPU2E7X6YEh5trBvLLhG+bkN8ycuyj3XBvfQfjbNvRPjITA1ElY6t+raGXmB/YMBU1TXZg+V3zRhz+ZjkJTR97blwVsvUxMNIqwod4dC7GdA0diEh1WN5G6fTX82Oqp5/0waeve/fDTMh38d+lOTR8IZzAS7B6bl4Ve8j4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+hCpU5Q9qFZroXrUvMVKyL9IxzgDrYkp59VXdEyxNg=;
 b=pamrXUSSLAHBtB4OCZWLQ0DU+TbWSUH5IZJRXyjuGlKMEDUV4wk+KmLl1gDSEH7tU0Be3uYKDk+YiZvilEchcOE/hHNrghd1nArViewHUvCyrhrTRTA2DHy8ypWHyV332AHjQOsA5TTQ5JYLNTCVyBvv8y38yW0rAYGpuV8KyPVdoGPy2MvIBXTbGVHk6zBHC5dwRLSpy7Oy5YIQOhS/msYGn5CBepp5u9+jzvHdxTpJ3pl9VSQ3pBOqKI71Yl7badg1yrpHn0fscVvaTMpTgIQeFPRB8Ge7VRVNoB+inXw8gn9DOlsD5ymw0gosCRiGyKyOpU/r6OqoYCx+3ZsdQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+hCpU5Q9qFZroXrUvMVKyL9IxzgDrYkp59VXdEyxNg=;
 b=QPHdursgCR83W9F/PU8LDeyvWsBeApDsKUzjVyF8IFyfm5S2D+BnfyCxaK0sdriImvkE6Iqw3QIj2k0qTwsngxv/zMNeVWvY4Wik1iOxeZUNEi44RTImVlhvywdj3dhA7Lwb/5CGRzOZahlcjStAb1R+nCwtdQF0yiDz1cRZ5oM=
Received: from DUZPR01CA0318.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::7) by MA9PR02MB866549.eurprd02.prod.outlook.com
 (2603:10a6:250:104::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:39 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::16) by DUZPR01CA0318.outlook.office365.com
 (2603:10a6:10:4ba::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:39 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:35 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 08/38] arm: dts: qcom: apq8060: Add newline between subnodes
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <1651102270b2dbf6d21809f94d00af11f3aff98e.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|MA9PR02MB866549:EE_
X-MS-Office365-Filtering-Correlation-Id: 059f4582-16f8-40cf-9b46-08df200c75cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	dXnvBK1bJ+G9vvEkvw0z34ZgxNO2Iba01U1979hSM27crWe8DZ6Gcmvffs1RAQtyI3PLiOJzVwPZn15ge8/Li05xC5lgT4So7JDFchWWaIcgmHb+SM+ubcMViUFTFAhQf63liU+eOu1dkeu0vmBYN/oFGYjQMsQkI0h7kO57Y5+WT2YK7KRIcBD/ZdIi4B+JCLCj2NZa4tkEZi0kGnBHdpIl95LkvMTx0vRU48lk/98XvqtK40ipqq5yWcB4nRTZIpBJ7mAVL3X789c7T9/v5epmanPbvo/9wEwq3Izn+26R/Ni+RAVOayYLQUiCU+FrYlMhRAHAgDOA7+U8CYKcPiNYD+afKAMfherLAEQlDCtMhpORKHGih3ggTMNSsMnCMqayxfg9bi76NFONhdpp8lIbC8w0XA8Owcv0oZ+ZFYrE77gT7cMQPANWcCUn7XLRGxcvLGQxUiY3uE2oh8H5FbFZzZ9D37s2iZEGTAGiaB8+UBq77oTOAYcT6myzxkk2UZdPj5cVwDQrJuL7ESOJWIJlTKWauIIo7gZFtujWdFbkNnljzxXBYkP1GDTtwDpkfuvCJYw5UKcTlrmPcHUGM4wMfa3GiPxW1x8R9Xr6YuelJI5DtTSCKicSmkJNBqYGV98hCx0dhOFWgi5iXHj0OPkv9SIWYy+TWrb9fijNtp7zs5t9mIQ5041ACJN/lRElP6S9z1rKcT/sZRqKh1EtCA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0gDDAA95JaZKLvfmnyuJRyfh6MErRPXTwvcKvyY2IJT08LIh45WEms23Igog/ccOoPWnAm63sHa4bCCKX3eXzynAJecOQQ3aw3gjx00ECqTNVgFFdDH0Ry57WSWMvmJ/UqinXYjMdhz+Qzv/RodPwaW0mag6ZFFZrFGK75haJ7DCSgs1SkqstSxc20tQLV18MHWeHx7I+NcU0DA4x6mnvPq+q1lgEl7D7bLZAMqEryHziwRea8wIveTzlpp/dqrQmyNaFdthUMzCG6leu+kMEzDlNKe1W1M55v3ayKt1OPuWNz/zkwIfESTH3c4Jp8QP7vYrmIioTpUGz0L2us18mXopzbUvnzPHKZmfKHYuEis6UwXk/gO5KrDsBhsxIMjNajMgf9SQVhHZpVvR+q6SO7ccLR040C5QofJYPSFhq3cVa78GBEVcJ8vgwHSEMHf5
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:39.7464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 059f4582-16f8-40cf-9b46-08df200c75cc
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR02MB866549

There should be a newline between subnodes. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 .../dts/qcom/qcom-apq8060-dragonboard.dts     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index 009afd8212c22..fa2b372e51bf3 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -181,6 +181,7 @@ eeprom@52 {
 		vcc-supply = <&pm8058_s3>;
 		pagesize = <64>;
 	};
+
 	wm8903: wm8903@1a {
 		/* This Woolfson Micro device has an unrouted interrupt line */
 		compatible = "wlf,wm8903";
@@ -226,6 +227,7 @@ ak8975@c {
 		vid-supply = <&pm8058_lvs0>; // 1.8V
 		vdd-supply = <&pm8058_l14>; // 2.85V
 	};
+
 	bmp085@77 {
 		compatible = "bosch,bmp085";
 		reg = <0x77>;
@@ -237,6 +239,7 @@ bmp085@77 {
 		vddd-supply = <&pm8058_lvs0>; // 1.8V
 		vdda-supply = <&pm8058_l14>; // 2.85V
 	};
+
 	mpu3050@68 {
 		compatible = "invensense,mpu3050";
 		reg = <0x68>;
@@ -287,6 +290,7 @@ pinconf {
 			power-source = <PM8058_GPIO_S3>;
 		};
 	};
+
 	dragon_bmp085_gpios: bmp085-state {
 		pinconf {
 			pins = "gpio16";
@@ -296,6 +300,7 @@ pinconf {
 			power-source = <PM8058_GPIO_S3>;
 		};
 	};
+
 	dragon_mpu3050_gpios: mpu3050-state {
 		pinconf {
 			pins = "gpio17";
@@ -305,6 +310,7 @@ pinconf {
 			power-source = <PM8058_GPIO_S3>;
 		};
 	};
+
 	dragon_sdcc3_gpios: sdcc3-state {
 		pinconf {
 			pins = "gpio22";
@@ -314,6 +320,7 @@ pinconf {
 			power-source = <PM8058_GPIO_S3>;
 		};
 	};
+
 	dragon_sdcc5_gpios: sdcc5-state {
 		pinconf {
 			pins = "gpio26";
@@ -324,6 +331,7 @@ pinconf {
 			power-source = <PM8058_GPIO_S3>;
 		};
 	};
+
 	dragon_ak8975_gpios: ak8975-state {
 		pinconf {
 			pins = "gpio33";
@@ -333,6 +341,7 @@ pinconf {
 			power-source = <PM8058_GPIO_S3>;
 		};
 	};
+
 	dragon_cm3605_gpios: cm3605-state {
 		/* Pin 34 connected to the proxy IRQ */
 		gpio34-pins {
@@ -342,6 +351,7 @@ gpio34-pins {
 			bias-disable;
 			power-source = <PM8058_GPIO_S3>;
 		};
+
 		/* Pin 35 connected to ASET */
 		gpio35-pins {
 			pins = "gpio35";
@@ -351,6 +361,7 @@ gpio35-pins {
 			power-source = <PM8058_GPIO_S3>;
 		};
 	};
+
 	dragon_veth_gpios: veth-state {
 		pinconf {
 			pins = "gpio40";
@@ -521,12 +532,14 @@ pm8901_s2: s2 {
 			qcom,switch-mode-frequency = <1600000>;
 			bias-pull-down;
 		};
+
 		pm8901_s3: s3 {
 			regulator-min-microvolt = <1100000>;
 			regulator-max-microvolt = <1100000>;
 			qcom,switch-mode-frequency = <1600000>;
 			bias-pull-down;
 		};
+
 		pm8901_s4: s4 {
 			regulator-min-microvolt = <1225000>;
 			regulator-max-microvolt = <1225000>;
@@ -837,12 +850,14 @@ clk-pins {
 			drive-strength = <16>;
 			bias-disable;
 		};
+
 		cmd-pins {
 			pins = "gpio168"; /* SDC1 CMD */
 			function = "sdc1";
 			drive-strength = <10>;
 			bias-pull-up;
 		};
+
 		data-pins {
 			/* SDC1 D0 to D7 */
 			pins = "gpio159", "gpio160", "gpio161", "gpio162",
@@ -863,11 +878,13 @@ clk-pins {
 			drive-strength = <8>;
 			bias-disable;
 		};
+
 		cmd-pins {
 			pins = "sdc3_cmd";
 			drive-strength = <8>;
 			bias-pull-up;
 		};
+
 		data-pins {
 			pins = "sdc3_data";
 			drive-strength = <8>;
@@ -883,12 +900,14 @@ clk-pins {
 			drive-strength = <16>;
 			bias-disable;
 		};
+
 		cmd-pins {
 			pins = "gpio95"; /* SDC5 CMD */
 			function = "sdc5";
 			drive-strength = <10>;
 			bias-pull-up;
 		};
+
 		data-pins {
 			/* SDC5 D0 to D3 */
 			pins = "gpio96", "gpio98", "gpio99", "gpio100";
@@ -930,6 +949,7 @@ tx-pins {
 			drive-strength = <8>;
 			bias-disable;
 		};
+
 		rx-pins {
 			pins = "gpio118";
 			function = "gsbi12";
@@ -951,6 +971,7 @@ mux0-pins {
 			    "gpio134"; /* CS0_N testpoint TP29 */
 			function = "ebi2cs";
 		};
+
 		mux1-pins {
 			pins =
 			    /* EBI2_ADDR_7 downto EBI2_ADDR_0 address bus */
@@ -983,6 +1004,7 @@ reset-pins {
 			drive-strength = <6>;
 			bias-disable;
 		};
+
 		irq-pins {
 			pins = "gpio61"; /* IRQ line */
 			function = "gpio";
-- 
2.43.0

