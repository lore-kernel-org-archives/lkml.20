Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793367198;
	b=DCFMJnd/DU4aCY/8/FpPlfNd9L/r53J7t6J3VKe5c48szDfUAfbag61xvG9NHLEWPWGY
	 2WQSJV436pSGt+PsU/Y89dfsPhMv65H9RBTQ56qZZq+6UqSKQI57PY/CPZn+n8fnQemX9
	 N2BT16JguCG/VCQN/dBAdUKOEjzqOpreXipyVs2cYujcoYCDQvUHkQXxXULCcl989MJDU
	 TudK2NpTjRyMs07WPUw9WXR9kXXJFfYmQBjX3pT2Wru36HNFzqjj55J4TsiXZveqVy+EW
	 VyMisVI53/C/moro7Z/1eK6lQIsWF0Zszpw/if7kLxGCvxl0aurnEZWgImYPznZpNgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367198;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=BRUwh/av5Q4YIXj0PKuOsTa6LZ4w9/1fvExvk42e8AA=;
	b=pakOpLAqfrZ3Goa1fOtKHk/fhgept77Taqqlxitw0IiCLJoO7rGxpZl0f5mLass9GisB
	 R4arrQEg3K8e5hXxhMazjPRpqZAlYD1zbAR//czZzd6v2U0o1P4b42SvM55O/r78J9RgF
	 ZPqN4+O2JiZoIhcu2qe3ChH4IvPiHCfddEZPIzVsbe7MsRWJyOqKw9hjprN/70FtXsx+w
	 eqBZHE6gUKuAE7uhpHa7HD5IP9zlRBr234IDLKGWToCRJhQrNhj5pqwzW/nnq8mJLRHTh
	 TGvaw/N19AzCdy2yq2nKz2/o3mzdNdobzZLZO+P4DVmlaS4t0eKjhHKO1HV7m9f1r6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=TdDyOkf2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.104
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021104.outbound.protection.outlook.com [52.101.65.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FFC606A321;
	Fri, 30 Oct 2026 13:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3FFC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=TdDyOkf2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDZMHv34CGQ0/BJIzcLkE/zLnqcCi41WIeonsCWchWEz/gw9aMYWFKfM9w8gybqkZbH+pq3S1lnUF5RKRbbdmzW0XIIUoJfKAo/teAImC+YOInEALD78kE8IT9QF1GTvkR0OGWGM6CFEm81II84nud9cXzxdGZnHMCVLqWTo0aOUj6zwGrabJra5KWcVhoVNCdw8ZK77HiV7vliRiNh7yd8siTwrQTOr40+NLlK12Yr3oCrvXy5hqUEvafakGwVwVjHJkhksKXvJXhW/4AIKMEOw+zgkCcMfvPUabHsGoNDcYTjurTHXrn0o+3DHEWUUKCrFC7y3md7mj8NJCNGc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRUwh/av5Q4YIXj0PKuOsTa6LZ4w9/1fvExvk42e8AA=;
 b=DAOg/5lXvN+KP55ZCBao12sS+F3OQS3VmjTTajjGMiTNFzc2MyIF1QQLV8FeacHUVZteAJUZZNpCnvuYf6+3fT3VN8eXvt0ol1sOni31u5vj8ksEvYj6jKxi5DM1pWPOHe+Ho6C+YSdFHSDBRhaKSbkHb3uZGL3atOiC1jy8owJsHSzxXeVPU1RfF/EcHlhVMI2CStYANNBJj8X9SPtMPqVxDM50Ldgp4bILM/w8obXNH4Wwmar4FWEwKJRSLEap38fGOfNDuk947aFWf28CthdR/tAoyl5HudGR2Qa9ZDi50CCKo0Ozzg4m3wM3nhuRfjZqGlGQKr/2C+LUKT+iHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRUwh/av5Q4YIXj0PKuOsTa6LZ4w9/1fvExvk42e8AA=;
 b=TdDyOkf2v0ptUS9evwUwP6hXQ6Rj87GLNhOlaLJkx1bD/jjly/xRFRqCQtHbkf07+SIILsk8TKhBHcqwn42R4kVyhk4NqzC2ZD3LgOuwu9eVdL5yGWYlnCRZRNPK42rHSrXaDbLoCGI499BlC3TzPCQ6Ee9EmYa0/yQkQRa2imlYEvcGauNinOJp8uo63PLC4eoncMQXv2qOQ6FOYGRoa7G0CWjgF7vCoWIpvZ/JYr4OOHFt/XBFvID0PxorM9WO4ZaGM+AalVwK7wXa8tY/9WWMG6VEIklH0HN9YKwsVoQeBguxzP/TadS9Fej5B8I1pj+Fypj3O29dGfAB/McP+Q==
Received: from DUZPR01CA0315.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::6) by VI2P195MB3031.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:2df::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 13:33:09 +0000
Received: from MA3PEPF00000406.eurprd04.prod.outlook.com
 (2603:10a6:10:4ba:cafe::ac) by DUZPR01CA0315.outlook.office365.com
 (2603:10a6:10:4ba::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.10 via Frontend Transport; Fri,
 30 Oct 2026 13:33:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 MA3PEPF00000406.mail.protection.outlook.com (10.167.241.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 13:33:08 +0000
Received: from llp-hahn.hahn.test (172.25.39.126) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 30 Oct
 2026 14:33:06 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Fri, 30 Oct 2026 14:32:44 +0100
Subject: [PATCH 2/5] dts: imx95-phyflex-libra-rdk: Add dts for phyFLEX-i.MX
 95 Libra RDK
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261030-wip-bhahn-imx95_upstreaming-v1-2-1c1cebb5be99@phytec.de>
References: <20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de>
In-Reply-To: <20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Yannic Moog <y.moog@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>
X-Mailer: b4 0.16.1-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793367177; l=35100;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=vhC+213pSYMUWRlxQPmaBlohd0ZrzN2RTUPiEurwNIE=;
 b=w5LiglctOo0Zc9+mMCOpNDQ9Zltrh18qZ7QixHudeli6AHHdM7T1jMPsdP2PD7+bazBIJligf
 7MOM+uiJPbPDw6kOhw4fa50twFKgqyAJRqjM5YrKfdnYxAAQyJnxk/w
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000406:EE_|VI2P195MB3031:EE_
X-MS-Office365-Filtering-Correlation-Id: b24189a9-ba08-4779-4c69-08df368a55f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|23010399003|1800799024|22082099003|18002099003|3023799007|56012099006|11063799006|261021133027099003|261022115727099003|261022075727099003|261022113327099003|261021130227099003|10067099003|261021123027099003|261021135927099003|261028144727099003|261021121427099003|261022105027099003|261009223027099003|261026135527099003|261026121527099003|261026130827099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	8XLSg8BGiOGB313ClviLmQz+Bxgmac1BfYkLlgInLXmWx/oKb3RVHzcS5czqNWXzNK/+02c0r1hH4vzWhjPxzGH0vhWQRlFEWc/Dr9ia8Cl40aZ3urA4YY5EWDm5FGw3TpyAd9udbC1jJ6U+gm3rpZ5stu6FXwIoNYtERe4IxN14PX7shS/Q6miCA4Ifbz0fLP/YSChMNxS1x+4dXffr9JoMk5o8LClF2DgvDIUzwqb/Fg4ip/z9aYuRczcrqZpce/YDMwimYleZXBtYYOAI0mQJTRvDVUzgkZoUTYPMv1smSdf+JenJB3d9J0ZvySqHrgcaIT+SZOEnBOlzEa9jUl/Ntn96Ti+jt+OXtkZia9/RMO+GgPjzlXBvZsoEYeGJJG0jR8t4ms34WFwZEl5AS0SPeaqASjgjh06qC847G8q43xMWWCIULyaehL9Q0kU/IvwbS/I3bXulDydUht69zNpFJJqF0t4DN+3lA25BcRd3Nz57ljvrq2NOPXkYYiFeOfYzSR5UmqmlQUWDXqUboCu564knfGYMa52nWTxs5LD5IGRzy9IVZbF4goZmOpLHg493sTexYZmdT4EcLgLoG9o8wfWwUTVv+8dMWwN13GgMjvLAgv1nGkEdsWIEDudGA2InTc6UnxyiDP9hN0+drOy0G9EhBSngTRxjKBVVGnR1r5iWX6EsUzSlmZnDcIZInsH6h4OSVlKdNNMW+lbtaA==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(261021133027099003)(261022115727099003)(261022075727099003)(261022113327099003)(261021130227099003)(10067099003)(261021123027099003)(261021135927099003)(261028144727099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026135527099003)(261026121527099003)(261026130827099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+Un4CfL4bqkACB9dCY9Yz4jHO18jWBLYOLORciEVZ97y2ntHO2VXrttAXSRVuR8UWGeRKarLvRYdEgggxXJVGV5cY+Jy+8VvsAYcTDscq8Qs9vnupbCd4e84E+UogAbp7DVYHZ5/Np6y684aXPZvbl/lmpaXFs92hkUSqfNPBdynL9ra02el11knE+a0ruX7iFA1S3Hxf77IjjTVpGquLIkhl5KOQm0J5xG1Ojk/AlSIV+uEN4cLvgQ/c2HCe0K44sCWKg4TRc2ngBdokH9j3JNYSviKHhATsNlX38ZLX5sJD70rOWyvmLX2dv53v0Iw4dwEACQTO6xIeS4ovibnS4nnp8eyHepoORi8BgxzThNFLB9Pg1s1KbN8WtWgoELu4ZZ4a14mESiMgfFhIqhur4Gnr8uxLmwRZ+TI2GUYLmp5YhEX2IrzYkja7eg15iJI
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 13:33:08.4572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b24189a9-ba08-4779-4c69-08df368a55f5
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	MA3PEPF00000406.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P195MB3031

The Libra RDK and i.MX95 FPSC SoM have been updated with new hardware
revisions 1618.2 and 1620.3. With these new hardware revisions they also
got renamed slightly, as they have been integrated in the phyFLEX
series. The baseboard is now named phyFLEX Libra RDK and the SoM is now
named phyFLEX-i.MX 95 FPSC Gamma.

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx95-phyflex-fpsc-g-som.dtsi    | 736 +++++++++++++++++++++
 .../boot/dts/freescale/imx95-phyflex-libra-rdk.dts | 558 ++++++++++++++++
 3 files changed, 1296 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf..4eb7508193e7 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -739,6 +739,8 @@ imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-libra-rdk.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx952-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som.dtsi b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som.dtsi
new file mode 100644
index 000000000000..4b37d76cced1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som.dtsi
@@ -0,0 +1,736 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 PHYTEC Messtechnik GmbH
+ */
+
+#include <dt-bindings/net/ti-dp83867.h>
+#include "imx95.dtsi"
+
+/ {
+	model = "PHYTEC phyFLEX-i.MX95 FPSC";
+	compatible = "phytec,imx95-phyflex-fpsc-g", "fsl,imx95";
+
+	aliases {
+		/* FPSC alias definitions */
+		ethernet1 = &enetc_port1;
+		ethernet2 = &enetc_port0;
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+		gpio4 = &gpio5;
+		i2c1 = &lpi2c2;
+		i2c2 = &lpi2c5;
+		i2c3 = &lpi2c3;
+		i2c4 = &lpi2c4;
+		i2c5 = &lpi2c1;
+		pcie1 = &pcie0;
+		pcie2 = &pcie1;
+		pwm1 = &tpm3;
+		pwm2 = &tpm5;
+		sai1 = &sai5;
+		serial1 = &lpuart8;
+		serial2 = &lpuart5;
+		serial3 = &lpuart7;
+		spi1 = &lpspi7;
+		spi2 = &lpspi3;
+		spi3 = &lpspi4;
+		usb1 = &usb3;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000 0x00000002 0x00000000>;
+	};
+
+	reg_nvcc_aon: regulator-nvcc-aon {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "VDD_IO";
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		off-on-delay-us = <12000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VDDSW_SD2";
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		bootph-pre-ram;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x00000000 0x90200000 0x00000000 0x6fe00000>;
+			reusable;
+			size = <0x00000000 0x3c000000>;
+			linux,cma-default;
+		};
+	};
+};
+
+&enetc_port0 { /* FPSC RGMII2 */
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_enetc0>;
+	pinctrl-names = "default";
+};
+
+&enetc_port1 {
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_enetc1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&flexcan1 { /* FPSC CAN1 */
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	pinctrl-names = "default";
+};
+
+&flexcan2 { /* FPSC CAN2 */
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	pinctrl-names = "default";
+};
+
+&flexspi1 { /* FPSC QSPI */
+	pinctrl-0 = <&pinctrl_flexspi>;
+	pinctrl-names = "default";
+};
+
+&gpio1 { /* FPSC GPIO */
+	gpio-line-names = "", "", "", "",
+			  "GPIO2", "GPIO1", "", "",
+			  "", "", "PCIE1_nPERST", "USB1_PWR_EN",
+			  "GPIO3", "USB2_PWR_EN", "PCIE2_nPERST";
+	pinctrl-0 = <&pinctrl_gpio1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&gpio2 { /* FPSC GPIO */
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "RGMII2_nINT", "GPIO4";
+	pinctrl-0 = <&pinctrl_gpio2>;
+	pinctrl-names = "default";
+};
+
+&gpio3 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "SD2_RESET_B";
+};
+
+&gpio4 {
+	gpio-line-names = "ENET2_nINT";
+};
+
+&gpio5 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "USB1_OC", "USB2_OC";
+};
+
+&lpi2c1 { /* FPSC I2C5 */
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c1>;
+	pinctrl-names = "default";
+	bootph-all;
+	status = "okay";
+
+	dram_sense: temperature-sensor@48 {
+		compatible = "ti,tmp102";
+		reg = <0x48>;
+		#thermal-sensor-cells = <1>;
+		status = "disabled";
+	};
+
+	emmc_sense: temperature-sensor@49 {
+		compatible = "ti,tmp102";
+		reg = <0x49>;
+		#thermal-sensor-cells = <1>;
+		status = "disabled";
+	};
+
+	ethphy_sense: temperature-sensor@4a {
+		compatible = "ti,tmp102";
+		reg = <0x4a>;
+		#thermal-sensor-cells = <1>;
+		status = "disabled";
+	};
+
+	pmic_sense: temperature-sensor@4b {
+		compatible = "ti,tmp102";
+		reg = <0x4b>;
+		#thermal-sensor-cells = <1>;
+		status = "disabled";
+	};
+
+	/* User EEPROM */
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+		pagesize = <32>;
+		vcc-supply = <&reg_nvcc_aon>;
+	};
+
+	/* Factory EEPROM */
+	eeprom@51 {
+		compatible = "atmel,24c32";
+		reg = <0x51>;
+		pagesize = <32>;
+		read-only;
+		vcc-supply = <&reg_nvcc_aon>;
+	};
+
+	rv3028: rtc@52 {
+		compatible = "microcrystal,rv3028";
+		reg = <0x52>;
+		#clock-cells = <0>;
+		trickle-resistor-ohms = <3000>;
+	};
+
+	/* User EEPROM ID page */
+	eeprom@58 {
+		compatible = "atmel,24c32";
+		reg = <0x58>;
+		pagesize = <32>;
+		vcc-supply = <&reg_nvcc_aon>;
+	};
+};
+
+&lpi2c2 { /* FPSC I2C1 */
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	pinctrl-names = "default";
+};
+
+&lpi2c3 { /* FPSC I2C3 */
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+};
+
+&lpi2c4 { /* FPSC I2C4 */
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c4>;
+	pinctrl-names = "default";
+};
+
+&lpi2c5 { /* FPSC I2C2 */
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c5>;
+	pinctrl-names = "default";
+};
+
+&lpspi3 { /* FPSC SPI2 */
+	pinctrl-0 = <&pinctrl_lpspi3>;
+	pinctrl-names = "default";
+	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
+};
+
+&lpspi4 { /* FPSC SPI3 */
+	pinctrl-0 = <&pinctrl_lpspi4>;
+	pinctrl-names = "default";
+	cs-gpios = <&gpio2 18 GPIO_ACTIVE_LOW>;
+};
+
+&lpspi7 { /* FPSC SPI1 */
+	pinctrl-0 = <&pinctrl_lpspi7>;
+	pinctrl-names = "default";
+	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+};
+
+&lpuart5 { /* FPSC UART2 */
+	pinctrl-0 = <&pinctrl_lpuart5>;
+	pinctrl-names = "default";
+};
+
+&lpuart7 { /* FPSC UART3 */
+	pinctrl-0 = <&pinctrl_lpuart7>;
+	pinctrl-names = "default";
+	bootph-all;
+};
+
+&lpuart8 { /* FPSC UART1 */
+	pinctrl-0 = <&pinctrl_lpuart8>;
+	pinctrl-names = "default";
+};
+
+&netc_blk_ctrl {
+	status = "okay";
+};
+
+&netc_emdio { /* FPSC RGMII2 */
+	pinctrl-0 = <&pinctrl_emdio>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ethphy1: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x0>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		enet-phy-lane-no-swap;
+		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+&netcmix_blk_ctrl {
+	status = "okay";
+};
+
+&pcie0 { /* FPSC PCIE1 */
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+};
+
+&pcie1 { /* FPSC PCIE2 */
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+};
+
+&sai5 { /* FPSC SAI1 */
+	pinctrl-0 = <&pinctrl_sai5>;
+	pinctrl-names = "default";
+};
+
+&scmi_iomuxc {
+	pinctrl_emdio: emdiogrp {
+		fsl,pins = <
+			IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO	0x97e	/* RGMII2_MDIO */
+			IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC	0x502	/* RGMII2_MDC */
+		>;
+	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO16__GPIO2_IO_BIT16			0x31e	/* RGMII2_nINT */
+			IMX95_PAD_CCM_CLKO3__NETCMIX_TOP_NETC_TMR_1588_TRIG2	0x31e	/* RGMII2_EVENT_IN */
+			IMX95_PAD_CCM_CLKO4__NETCMIX_TOP_NETC_TMR_1588_PP2	0x31e	/* RGMII2_EVENT_OUT */
+
+			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x51e	/* RGMII2_TX_3 */
+			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x51e	/* RGMII2_TX_2 */
+			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x51e	/* RGMII2_TX_1 */
+			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x51e	/* RGMII2_TX_0 */
+			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x51e	/* RGMII2_TX_CTL */
+			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e	/* RGMII2_TXC */
+			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e	/* RGMII2_RX_3 */
+			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e	/* RGMII2_RX_2 */
+			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e	/* RGMII2_RX_1 */
+			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e	/* RGMII2_RX_0 */
+			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e	/* RGMII2_RX_CTL */
+			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK	0x58e	/* RGMII2_RXC */
+		>;
+	};
+
+	pinctrl_enetc1: enetc1grp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_MDC__GPIO4_IO_BIT0			0x31e
+			IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0		0x57e
+			IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1		0x57e
+			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2		0x51e
+			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3		0x51e
+			IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL	0x57e
+			IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK	0x58e
+			IMX95_PAD_ENET2_RD0__NETCMIX_TOP_ETH1_RGMII_RD0		0x57e
+			IMX95_PAD_ENET2_RD1__NETCMIX_TOP_ETH1_RGMII_RD1		0x57e
+			IMX95_PAD_ENET2_RD2__NETCMIX_TOP_ETH1_RGMII_RD2		0x57e
+			IMX95_PAD_ENET2_RD3__NETCMIX_TOP_ETH1_RGMII_RD3		0x57e
+			IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL	0x57e
+			IMX95_PAD_ENET2_RXC__NETCMIX_TOP_ETH1_RGMII_RX_CLK	0x58e
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			IMX95_PAD_PDM_CLK__AONMIX_TOP_CAN1_TX		0x51e	/* CAN1_TX */
+			IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_CAN1_RX	0x51e	/* CAN1_RX */
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO25__CAN2_TX	0x51e	/* CAN2_TX */
+			IMX95_PAD_GPIO_IO27__CAN2_RX	0x51e	/* CAN2_RX */
+		>;
+	};
+
+	pinctrl_flexspi: flexspigrp {
+		fsl,pins = <
+			IMX95_PAD_XSPI1_SS0_B__FLEXSPI1_A_SS0_B		0x39e	/* QSPI_CE */
+			IMX95_PAD_XSPI1_SCLK__FLEXSPI1_A_SCLK		0x39e	/* QSPI_CLK */
+			IMX95_PAD_XSPI1_DATA0__FLEXSPI1_A_DATA_BIT0	0x39e	/* QSPI_DATA_0 */
+			IMX95_PAD_XSPI1_DATA1__FLEXSPI1_A_DATA_BIT1	0x39e	/* QSPI_DATA_1 */
+			IMX95_PAD_XSPI1_DATA2__FLEXSPI1_A_DATA_BIT2	0x39e	/* QSPI_DATA_2 */
+			IMX95_PAD_XSPI1_DATA3__FLEXSPI1_A_DATA_BIT3	0x39e	/* QSPI_DATA_3 */
+		>;
+	};
+
+	pinctrl_gpio1: gpio1grp {
+		fsl,pins = <
+			IMX95_PAD_UART1_TXD__AONMIX_TOP_GPIO1_IO_BIT5	0x31e	/* GPIO1 */
+			IMX95_PAD_UART1_RXD__AONMIX_TOP_GPIO1_IO_BIT4	0x31e	/* GPIO2 */
+			IMX95_PAD_SAI1_TXC__AONMIX_TOP_GPIO1_IO_BIT12	0x31e	/* GPIO3 */
+		>;
+	};
+
+	pinctrl_gpio2: gpio2grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO17__GPIO2_IO_BIT17	0x31e	/* GPIO4 */
+		>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <
+			IMX95_PAD_I2C1_SCL__AONMIX_TOP_LPI2C1_SCL	0x40000b9e	/* I2C5_SCL */
+			IMX95_PAD_I2C1_SDA__AONMIX_TOP_LPI2C1_SDA	0x40000b9e	/* I2C5_SDA */
+		>;
+		bootph-all;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			IMX95_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA	0x40000b9e	/* I2C1_SDA_DNU */
+			IMX95_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL	0x40000b9e	/* I2C1_SCL_DNU */
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO28__LPI2C3_SDA 0x40000b9e	/* I2C3_SDA */
+			IMX95_PAD_GPIO_IO29__LPI2C3_SCL 0x40000b9e	/* I2C3_SCL */
+		>;
+	};
+
+	pinctrl_lpi2c4: lpi2c4grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO30__LPI2C4_SDA 0x40000b9e	/* I2C4_SDA */
+			IMX95_PAD_GPIO_IO31__LPI2C4_SCL 0x40000b9e	/* I2C4_SDL */
+		>;
+	};
+
+	pinctrl_lpi2c5: lpi2c5grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO22__LPI2C5_SDA	0x40000b9e	/* I2C2_SDA */
+			IMX95_PAD_GPIO_IO23__LPI2C5_SCL 0x40000b9e	/* I2C2_SCL */
+		>;
+	};
+
+	/* lpspi driver only works with cs-gpios currently, thus mux
+	 * to gpio instead of native controller cs signal. To compensate,
+	 * cs-gpios is defined as active low in this file.
+	 */
+	pinctrl_lpspi3: lpspi3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO11__LPSPI3_SCK		0x3fe	/* SPI2_SCLK */
+			IMX95_PAD_GPIO_IO10__LPSPI3_SOUT	0x3fe	/* SPI2_MOSI */
+			IMX95_PAD_GPIO_IO09__LPSPI3_SIN		0x3fe	/* SPI2_MISO */
+			IMX95_PAD_GPIO_IO08__GPIO2_IO_BIT8	0x3fe	/* SPI2_CS */
+		>;
+	};
+
+	pinctrl_lpspi4: lpspi4grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO21__LPSPI4_SCK		0x3fe	/* SPI3_SCLK */
+			IMX95_PAD_GPIO_IO20__LPSPI4_SOUT	0x3fe	/* SPI3_MOSI */
+			IMX95_PAD_GPIO_IO19__LPSPI4_SIN		0x3fe	/* SPI3_MISO */
+			IMX95_PAD_GPIO_IO18__GPIO2_IO_BIT18	0x3fe	/* SPI3_CS */
+		>;
+	};
+
+	pinctrl_lpspi7: lpspi7grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO07__LPSPI7_SCK		0x3fe	/* SPI1_SCLK */
+			IMX95_PAD_GPIO_IO06__LPSPI7_SOUT	0x3fe	/* SPI1_MOSI */
+			IMX95_PAD_GPIO_IO05__LPSPI7_SIN		0x3fe	/* SPI1_MISO */
+			IMX95_PAD_GPIO_IO04__GPIO2_IO_BIT4	0x3fe	/* SPI1_CS */
+		>;
+	};
+
+	pinctrl_lpuart5: lpuart5grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO01__LPUART5_RX		0x51e	/* UART2_RXD */
+			IMX95_PAD_GPIO_IO00__LPUART5_TX		0x51e	/* UART2_TXD */
+			IMX95_PAD_GPIO_IO03__LPUART5_RTS_B	0x51e	/* UART2_RTS */
+			IMX95_PAD_GPIO_IO02__LPUART5_CTS_B	0x51e	/* UART2_CTS */
+		>;
+	};
+
+	pinctrl_lpuart7: lpuart7grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO37__LPUART7_RX	0x31e	/* UART3_RXD */
+			IMX95_PAD_GPIO_IO36__LPUART7_TX	0x31e	/* UART3_TXD */
+		>;
+		bootph-all;
+	};
+
+	pinctrl_lpuart8: lpuart8grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO13__LPUART8_RX		0x51e	/* UART1_RXD */
+			IMX95_PAD_GPIO_IO12__LPUART8_TX		0x51e	/* UART1_TXD */
+			IMX95_PAD_GPIO_IO15__LPUART8_RTS_B	0x51e	/* UART1_RTS */
+			IMX95_PAD_GPIO_IO14__LPUART8_CTS_B	0x51e	/* UART1_CTS */
+		>;
+	};
+
+	pinctrl_pcie0: pcie0grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO32__HSIOMIX_TOP_PCIE1_CLKREQ_B		0x31e	/* PCIE1_nCLKREQ */
+			IMX95_PAD_PDM_BIT_STREAM1__AONMIX_TOP_GPIO1_IO_BIT10	0x31e	/* PCIE1_nPERST */
+		>;
+	};
+
+	pinctrl_pcie1: pcie1grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO35__HSIOMIX_TOP_PCIE2_CLKREQ_B	0x31e	/* PCIE2_nCLKREQ */
+			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_GPIO1_IO_BIT14	0x31e	/* PCIE2_nPERST */
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7	0x31e
+		>;
+		bootph-all;
+	};
+
+	pinctrl_sai5: sai5grp {
+		fsl,pins = <
+			IMX95_PAD_XSPI1_DQS__SAI5_RX_SYNC		0x51e	/* SAI1_RX_SYNC */
+			IMX95_PAD_XSPI1_SS1_B__SAI5_RX_BCLK		0x51e	/* SAI1_RX_BCLK */
+			IMX95_PAD_XSPI1_DATA7__SAI5_RX_DATA_BIT0	0x51e	/* SAI1_RX_DATA */
+			IMX95_PAD_XSPI1_DATA5__SAI5_TX_SYNC		0x51e	/* SAI1_TX_SYNC */
+			IMX95_PAD_XSPI1_DATA6__SAI5_TX_BCLK		0x51e	/* SAI1_TX_BCLK */
+			IMX95_PAD_XSPI1_DATA4__SAI5_TX_DATA_BIT0	0x51e	/* SAI1_TX_DATA */
+		>;
+	};
+
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO24__TPM3_CH3	0x51e	/* PWM1 */
+		>;
+	};
+
+	pinctrl_tpm5: tpm5grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO26__TPM5_CH3	0x51e	/* PWM2 */
+		>;
+	};
+
+	pinctrl_usbc: usbcgrp {
+		fsl,pins = <
+			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_GPIO1_IO_BIT11	0x51e	/* USB1_PWR_EN */
+			IMX95_PAD_GPIO_IO33__GPIO5_IO_BIT13		0x51e	/* USB1_OC */
+		>;
+	};
+
+	pinctrl_usb2: usb2grp {
+		fsl,pins = <
+			IMX95_PAD_SAI1_TXD0__AONMIX_TOP_GPIO1_IO_BIT13	0x51e	/* USB2_PWR_EN */
+			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14		0x51e	/* USB2_OC */
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x138e
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x138e
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x138e
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x138e
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x138e
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x138e
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x138e
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x138e
+			IMX95_PAD_SD1_CMD__USDHC1_CMD			0x138e
+			IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x158e
+		>;
+		bootph-pre-ram;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x138e
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x138e
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x138e
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x138e
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x138e
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x138e
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x138e
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x138e
+			IMX95_PAD_SD1_CMD__USDHC1_CMD			0x138e
+			IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x158e
+		>;
+		bootph-pre-ram;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x13fe
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x13fe
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x13fe
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x13fe
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x13fe
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x13fe
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x13fe
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x13fe
+			IMX95_PAD_SD1_CMD__USDHC1_CMD			0x13fe
+			IMX95_PAD_SD1_CLK__USDHC1_CLK			0x15fe
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x15fe
+		>;
+		bootph-pre-ram;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CD_B__USDHC2_CD_B		0x31e	/* CD */
+			IMX95_PAD_SD2_CLK__USDHC2_CLK		0x158e	/* CLK */
+			IMX95_PAD_SD2_CMD__USDHC2_CMD		0x138e	/* CMD */
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0	0x138e	/* DATA0 */
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1	0x138e	/* DATA1 */
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2	0x138e	/* DATA2 */
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3	0x138e	/* DATA3 */
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+
+		>;
+		bootph-all;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CD_B__USDHC2_CD_B		0x31e	/* CD */
+			IMX95_PAD_SD2_CLK__USDHC2_CLK		0x158e	/* CLK */
+			IMX95_PAD_SD2_CMD__USDHC2_CMD		0x138e	/* CMD */
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0	0x138e	/* DATA0 */
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1	0x138e	/* DATA1 */
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2	0x138e	/* DATA2 */
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3	0x138e	/* DATA3 */
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+		bootph-all;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CD_B__USDHC2_CD_B		0x31e	/* CD */
+			IMX95_PAD_SD2_CLK__USDHC2_CLK		0x158e	/* CLK */
+			IMX95_PAD_SD2_CMD__USDHC2_CMD		0x138e	/* CMD */
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0	0x138e	/* DATA0 */
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1	0x138e	/* DATA1 */
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2	0x138e	/* DATA2 */
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3	0x138e	/* DATA3 */
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+		bootph-all;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			IMX95_PAD_SD3_CLK__USDHC3_CLK		0x159e	/* SDIO_CLK */
+			IMX95_PAD_SD3_CMD__USDHC3_CMD		0x139e	/* SDIO_CMD */
+			IMX95_PAD_SD3_DATA0__USDHC3_DATA0	0x139e	/* SDIO_DATA0 */
+			IMX95_PAD_SD3_DATA1__USDHC3_DATA1	0x139e	/* SDIO_DATA1 */
+			IMX95_PAD_SD3_DATA2__USDHC3_DATA2	0x139e	/* SDIO_DATA2 */
+			IMX95_PAD_SD3_DATA3__USDHC3_DATA3	0x139e	/* SDIO_DATA3 */
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD3_CLK__USDHC3_CLK		0x159e	/* SDIO_CLK */
+			IMX95_PAD_SD3_CMD__USDHC3_CMD		0x139e	/* SDIO_CMD */
+			IMX95_PAD_SD3_DATA0__USDHC3_DATA0	0x139e	/* SDIO_DATA0 */
+			IMX95_PAD_SD3_DATA1__USDHC3_DATA1	0x139e	/* SDIO_DATA1 */
+			IMX95_PAD_SD3_DATA2__USDHC3_DATA2	0x139e	/* SDIO_DATA2 */
+			IMX95_PAD_SD3_DATA3__USDHC3_DATA3	0x139e	/* SDIO_DATA3 */
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD3_CLK__USDHC3_CLK		0x159e	/* SDIO_CLK */
+			IMX95_PAD_SD3_CMD__USDHC3_CMD		0x139e	/* SDIO_CMD */
+			IMX95_PAD_SD3_DATA0__USDHC3_DATA0	0x139e	/* SDIO_DATA0 */
+			IMX95_PAD_SD3_DATA1__USDHC3_DATA1	0x139e	/* SDIO_DATA1 */
+			IMX95_PAD_SD3_DATA2__USDHC3_DATA2	0x139e	/* SDIO_DATA2 */
+			IMX95_PAD_SD3_DATA3__USDHC3_DATA3	0x139e	/* SDIO_DATA3 */
+		>;
+	};
+};
+
+&tpm3 { /* FPSC PWM1 */
+	pinctrl-0 = <&pinctrl_tpm3>;
+	pinctrl-names = "default";
+};
+
+&tpm5 { /* FPSC PWM2 */
+	pinctrl-0 = <&pinctrl_tpm5>;
+	pinctrl-names = "default";
+};
+
+&usb3 { /* FPSC USB1 */
+	pinctrl-0 = <&pinctrl_usbc>;
+	pinctrl-names = "default";
+};
+
+&usdhc1 {
+	bus-width = <8>;
+	mmc-hs400-1_8v;
+	non-removable;
+	no-sd;
+	no-sdio;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	bootph-pre-ram;
+	status = "okay";
+};
+
+&usdhc2 { /* FPSC SDCARD */
+	bus-width = <4>;
+	disable-wp;
+	no-mmc-hs400;
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc2>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	sd-uhs-sdr104;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bootph-pre-ram;
+};
+
+&usdhc3 { /* FPSC SDIO */
+	bus-width = <4>;
+	no-mmc-hs400;
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc3>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+};
+
+&wdog3 {
+	fsl,ext-reset-output;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts
new file mode 100644
index 000000000000..55d49f810956
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts
@@ -0,0 +1,558 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 PHYTEC Messtechnik GmbH
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pwm/pwm.h>
+
+#include "imx95-phyflex-fpsc-g-som.dtsi"
+
+/ {
+	compatible = "phytec,imx95-phyflex-libra-rdk",
+		     "phytec,imx95-phyflex-fpsc-g", "fsl,imx95";
+	model = "PHYTEC Libra phyFLEX-i.MX95 FPSC";
+
+	aliases {
+		ethernet3 = &enetc_port2;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		mmc2 = &usdhc3;
+		rtc0 = &rv3028;
+		rtc1 = &scmi_bbm;
+	};
+
+	chosen {
+		stdout-path = &lpuart7;
+	};
+
+	can_transceiver1: can-phy1 {
+		compatible = "ti,tcan1043";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+		standby-gpios = <&gpio_expander2 0 GPIO_ACTIVE_HIGH>;
+	};
+
+	can_transceiver2: can-phy2 {
+		compatible = "ti,tcan1043";
+		#phy-cells = <0>;
+		max-bitrate = <8000000>;
+		standby-gpios = <&gpio_expander2 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	connector {
+		compatible = "usb-c-connector";
+		label = "USB-C";
+		data-role = "dual";
+		pd-disable;
+		self-powered;
+		typec-power-opmode = "1.5A";
+		vbus-supply = <&reg_vdd_vbus>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hs_ep: endpoint {
+					remote-endpoint = <&usb3_hs_ep>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+
+				ss_ep: endpoint {
+					remote-endpoint = <&hd3ss3220_in_ep>;
+				};
+			};
+		};
+	};
+
+	m2-key-m-connector {
+		compatible = "pcie-m2-m-connector";
+		clocks = <&rv3028>;
+		i2c-parent = <&lpi2c5>;
+		vpcie3v3-supply = <&reg_vdd_3v3>;
+	};
+
+	m2-key-e-connector {
+		compatible = "pcie-m2-e-connector";
+		clocks = <&rv3028>;
+		i2c-parent = <&lpi2c3>;
+		sdio-reset-gpios = <&gpio_expander2 6 GPIO_ACTIVE_LOW>;
+		sdio-wake-gpios = <&gpio_expander2 5 GPIO_ACTIVE_LOW>;
+		uart-wake-gpios = <&gpio_expander1 13 GPIO_ACTIVE_LOW>;
+		vpcie3v3-supply = <&reg_vdd_3v3>;
+		w-disable1-gpios = <&gpio_expander1 9 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&gpio_expander1 10 GPIO_ACTIVE_LOW>;
+	};
+
+
+	osc_mclk: oscillator-mclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <19200000>;
+		status = "disabled";
+	};
+
+	osc_mclk_gated: oscillator-mclk-gated {
+		compatible = "gpio-gate-clock";
+		#clock-cells = <0>;
+		clocks = <&osc_mclk>;
+		enable-gpios = <&gpio_expander1 8 GPIO_ACTIVE_HIGH>;
+		status = "disabled";
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		interrupt-parent = <&gpio1>;
+		interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+		#cooling-cells = <2>;
+		/* startup 35%, duty cycle 30%-100%;
+		 * polarity inversion does not appear to work
+		 */
+		cooling-levels = <255 166 96 0>;
+		/* fan-supply = <&reg_vdd_5v0>;  probe fails with this set */
+		pwms = <&tpm5 3 86958 0>;
+		pulses-per-revolution = <2>;
+	};
+
+	reg_vdd_12v0: regulator-vdd-12v0 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <12000000>;
+		regulator-min-microvolt = <12000000>;
+		regulator-name = "VDD_12V0";
+	};
+
+	reg_vdd_1v8: regulator-vdd-1v8 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "VDD_1V8";
+	};
+
+	reg_vdd_3v3: regulator-vdd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VDD_3V3";
+	};
+
+	reg_vdd_5v0: regulator-vdd-5v0 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "VDD_5V0";
+	};
+
+	reg_vdd_5v0_ref: regulator-vdd-5v0-ref {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "VDD_5V0_REF";
+	};
+
+	reg_vdd_vbus: regulator-vdd-vbus {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "VDD_VBUS_C";
+	};
+
+	reg_usb3_phy: regulator-usb-vbus {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "usb3-phy-dummy";
+	};
+};
+
+&enetc_port0 {
+	phy-handle = <&ethphy0>;
+	status = "okay";
+};
+
+/* CAN FD */
+&flexcan1 {
+	phys = <&can_transceiver1>;
+	status = "okay";
+};
+
+&flexcan2 {
+	phys = <&can_transceiver2>;
+	status = "okay";
+};
+
+/* SPI-NOR */
+&flexspi1 {
+	pinctrl-0 = <&pinctrl_flexspi>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	spi_nor: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <166000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		vcc-supply = <&reg_vdd_1v8>;
+	};
+};
+
+&gpio2 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "RGMII2_nINT", "GPIO4", "RTC_INT", "",
+			  "LVDS1_BL_EN";
+};
+
+&lpi2c1 {
+	temperature-sensor@4f {
+		compatible = "nxp,p3t1755";
+		reg = <0x4f>;
+		vs-supply = <&reg_vdd_1v8>;
+	};
+};
+
+&lpi2c3 {
+	status = "okay";
+
+	gpio_expander2: gpio@21 {
+		compatible = "ti,tcal6416";
+		reg = <0x21>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "CAN1_STBY", "CAN2_STBY", "NC",
+				  "KEY-E_nALERT", "KEY-M_nALERT",
+				  "SDIO_nWAKE", "SDIO_nRESET", "HDMI_EN",
+				  "RTC_nINT", "LVDS1_BL_EN", "SFP_TX_FAULT",
+				  "SFP_TX_DISABLE", "SFP_MOD_ABS", "SFP_RS0",
+				  "SFP_RX_LOSS", "SFP_RS1";
+		interrupt-controller;
+		vcc-supply = <&reg_vdd_1v8>;
+	};
+
+	led-controller@62 {
+		compatible = "nxp,pca9633";
+		reg = <0x62>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_STATUS;
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+		};
+	};
+
+	usb-typec@47 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x47>;
+		interrupt-parent = <&gpio_expander1>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hd3ss3220_in_ep: endpoint {
+					remote-endpoint = <&ss_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hd3ss3220_out_ep: endpoint {
+					remote-endpoint = <&usb3_role_switch>;
+				};
+			};
+		};
+	};
+};
+
+&lpi2c5 {
+	status = "okay";
+
+	gpio_expander1: gpio@21 {
+		compatible = "ti,tcal6416";
+		reg = <0x21>;
+		interrupt-controller;
+		interrupt-parent = <&gpio1>;
+		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+		#interrupt-cells = <2>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names = "VCONN_nFAULT", "CSI1_CTRL1", "CSI1_CTRL3",
+				  "CSI1_CTRL4", "USB-C_nINT/AUDIO_AC",
+				  "CSI2_CTRL1", "CSI2_CTRL3", "CSI2_CTRL4",
+				  "CLK_EN_AV", "W_nDISABLE1", "W_nDISABLE2",
+				  "PCIE1_nWAKE", "PCIE2_nWAKE", "UART1_nWAKE",
+				  "UART1_BT_RS_SEL", "UART1_RS232_485_SEL";
+
+		vcc-supply = <&reg_vdd_1v8>;
+	};
+
+	/* Factory EEPROM */
+	eeprom@51 {
+		compatible = "atmel,24c02";
+		reg = <0x51>;
+		pagesize = <16>;
+		vcc-supply = <&reg_vdd_1v8>;
+	};
+
+	/* User EEPROM */
+	eeprom@52 {
+		compatible = "atmel,24c02";
+		reg = <0x52>;
+		pagesize = <16>;
+		vcc-supply = <&reg_vdd_1v8>;
+	};
+};
+
+&lpspi3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	num-cs = <1>;
+	assigned-clocks = <&scmi_clk IMX95_CLK_LPSPI3>;
+	assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD0_DIV2>;
+	assigned-clock-rates = <50000000>;
+	status = "okay";
+
+	tpm: tpm@0 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <22500000>;
+	};
+};
+
+&lpspi7 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	num-cs = <1>;
+	status = "okay";
+
+	adc@0 {
+		compatible = "microchip,mcp3208";
+		reg = <0>;
+		spi-max-frequency = <2000000>;
+		vref-supply = <&reg_vdd_5v0_ref>;
+		#io-channel-cells = <1>;
+	};
+};
+
+/* Used for M33 debug */
+&lpuart2 {
+	pinctrl-0 = <&pinctrl_lpuart2>;
+	pinctrl-names = "default";
+	status = "reserved";
+};
+
+/* A-55 debug UART */
+&lpuart7 {
+	status = "okay";
+};
+
+/* RS232/RS485/BT */
+&lpuart8 {
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&netc_emdio { /* RGMII2 */
+	ethphy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+		enet-phy-lane-no-swap;
+		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+/* M.2 Key-E PCIe */
+&pcie0 {
+	external-facing;
+	supports-clkreq;
+	wake-gpios = <&gpio_expander1 11 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+	vpcie3v3-supply = <&reg_vdd_3v3>;
+};
+
+/* M.2 Key-M PCIe */
+&pcie1 {
+	external-facing;
+	supports-clkreq;
+	wake-gpios = <&gpio_expander1 12 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
+	vpcie3v3-supply = <&reg_vdd_3v3>;
+};
+
+&rv3028 {
+	interrupt-parent = <&gpio_expander2>;
+	interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+	aux-voltage-chargeable = <1>;
+	wakeup-source;
+};
+
+&scmi_bbm {
+	linux,code = <KEY_POWER>;
+};
+
+&scmi_iomuxc {
+	pinctrl_lpuart2: lpuart2grp { /* FPSC proprietary */
+		fsl,pins = <
+			IMX95_PAD_UART2_TXD__AONMIX_TOP_LPUART2_TX	0x31e
+			IMX95_PAD_UART2_RXD__AONMIX_TOP_LPUART2_RX	0x31e
+		>;
+	};
+};
+
+&thermal_zones {
+	a55-thermal {
+		trips {
+			atrip2: trip2 {
+				temperature = <55000>;
+				hysteresis = <2000>;
+				type = "active";
+			};
+
+			atrip3: trip3 {
+				temperature = <65000>;
+				hysteresis = <2000>;
+				type = "active";
+			};
+
+			atrip4: trip4 {
+				temperature = <75000>;
+				hysteresis = <2000>;
+				type = "active";
+			};
+		};
+
+		cooling-maps {
+			map1 {
+				trip = <&atrip2>;
+				cooling-device = <&fan 0 1>;
+			};
+
+			map2 {
+				trip = <&atrip3>;
+				cooling-device = <&fan 1 2>;
+			};
+
+			map3 {
+				trip = <&atrip4>;
+				cooling-device = <&fan 2 3>;
+			};
+		};
+	};
+};
+
+&tpm5 {
+	status = "okay";
+};
+
+&usb2 {
+	disable-over-current;
+	status = "okay";
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	adp-disable;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			usb3_hs_ep: endpoint {
+				remote-endpoint = <&hs_ep>;
+			};
+		};
+		port@1 {
+			reg = <1>;
+			usb3_role_switch: endpoint {
+				remote-endpoint = <&hd3ss3220_out_ep>;
+			};
+		};
+	};
+};
+
+&usb3_phy {
+	status = "okay";
+	vbus-supply = <&reg_usb3_phy>;
+};
+
+&usbphynop {
+	vbus-supply = <&reg_vdd_5v0>;
+};
+
+/* uSD Card */
+&usdhc2 {
+	status = "okay";
+};
+
+/* SDIO used on pcie m.2 key-E */
+&usdhc3 {
+	broken-cd;
+	disable-wp;
+	status = "okay";
+};

-- 
2.53.0

