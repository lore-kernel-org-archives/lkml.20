Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794585637;
	b=rnRT6ZZ0ZDP9oKIRuGag2DjpYXMwU+JBUWRdRuBzcMek70yceGHQRAkPcHrpya7A4a45
	 m27/2GHSZEa7fo0SkOgxx3iAI5xWmtDIUoDVOMwTuSA55KwUEz0mgusMWhkX4k74Ojd3l
	 yvI6l8/37372p7Xq7jHlU/ySLgcZBiA0FpQdf9m6pe7Sw16HsDn/weLk+wGrKhbJE38C2
	 W3Nsgr91ROcR3OqxIDwwsjaGOm0yDaygwqTAhJrIj7gZxl3MG53uKi9jUXuE4T0g9MlsP
	 irDOjM2gnzxMw1PIFsyDMouF+yB413exaitKovUDKatH8ri1V4mPuTM4Uu1y+FgoSsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585637;
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
	bh=hdNWgszzYT7kzl5EPc5KVDMR+l5ZI6ikf/a5rdQVRLs=;
	b=zxvPiBqI3difbDhv1FgZWcHbj25qiWe42NBndc8kXDJp/4APIHg/jH9YMIK1JKBqWaPT
	 xOXwO9N0/c/x22OsYCVn8t4zVltk10y0Vpvq6XldJCmy98YAbCBHM/yelzCrv5ZX3qx57
	 JwcibUTdXZ8eMW+30PovFNU56WCuiW8+247aNT4JU1uCA26bytJyyXjf2xYfOXytUQKqc
	 x0a5VTBsVClTdntOP0+qdgPkD9YkzqV+Eir9rWQ0P3bKhTJsFU/VsUefEvGeFYuhlkW1R
	 UMqgJEN3dydZqfnFtovpi3+41zLkJvx6Pzn25QULbjD8TANKFEfpPwcvqUSVG8t7QPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=csf835za;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.75
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023075.outbound.protection.outlook.com [40.107.162.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9256072314;
	Fri, 13 Nov 2026 16:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A9256072314
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=csf835za
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0tTeeYUSMk+PT7w40LAz5LgEapGIaaGwZ2LTmzelvILz1bc03U8fjNSZ7nkpjmSSSZMw3d//BC4f2Zq/GuN+dHbgAODH0uUI8mssOjMZ3eSEv++KEZHfUOOTIVj6AXBD78pXMVYZm9Wj+ZBiJgZLNaWzf2EUmCltKn7mlsGYeedanSTq8kmCzmUsWXB7Wfyl0+66K87y1NMjHe6hi2nGdrvNzAyqnACKucD3cdXeGEirFXYgKOQpz5hBW6JWICIMCoG/iC8Rwz4W/0HqSF1Bz/SF2NRztd+6fQCxbQhYHgZGGlKPsmaYvMoQ8O/3pE2iotnlOy3ZAHKVaE5Ivpmsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdNWgszzYT7kzl5EPc5KVDMR+l5ZI6ikf/a5rdQVRLs=;
 b=h3CPStAc2yIdPoKVk07eAA/LOB94AsO4iUZ82RjZtmw7rNeadVBXPXRmT+OZ5wxEvMVms7lkKlk/Fu6PumrX3EaGvPo3LXYj1q/pxtSCdm96HMmiByxGKZIwWFqs4RKUvrnh775x2415kGvd9Nz85q3YhtD9MZNP9TNJ/ydRgiGdliat9aAAEE/DRaykfwr8/YCP+bOv3kRW7OdTsoWt9cBi3CMBMqe7/QLKVlr0Glfnkklfv/tovjJI+ZzoR3MOhwamHK7ngwE9j7KybL8PrgQl5PAGlvRyG8P9hHXGVE980hkoMUAPrOThQKPu90VEub/Ddo5NEU0QzbVF5JRkaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdNWgszzYT7kzl5EPc5KVDMR+l5ZI6ikf/a5rdQVRLs=;
 b=csf835zaxODaErH4eRawjzAthmgPY/mCdmBuaO8dNNEpMVPLmq5vyWniUMRT4/tA8gFEbkxEwTw6jJ4PnV1GB3n1MjrUi/Veaxh6CvC8Vx7EflSU1g99sWX7REx9s7QgC2YyO5oAKruxAt3DEWsBF3AueXjGchAbJm1hoPigXU0OuLfWaXa1Db+KfvOsXQqN7RZpctWNJ26y/+Funy+8ojW5FzDo3/RhjTHN1RcCsGlNOIyqjkfW2TFnc/BEFjbAratm+nkvfHAKJPnJyll6AQ//0PLoKIAgVD4P5xmtqZoyIlRutxZ+zUiziVgXJRGbfDBS3ZIaQGfuz9EvCDyo4Q==
Received: from ZR1PEPF000077EB.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::449)
 by PA1P195MB3144.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:505::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 16:00:25 +0000
Received: from ZR1PEPF0000E6AD.eurprd05.prod.outlook.com (2603:10a6:918::154)
 by ZR1PEPF000077EB.outlook.office365.com (2603:10a6:918::449) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10
 via Frontend Transport; Fri, 13 Nov 2026 16:00:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 ZR1PEPF0000E6AD.mail.protection.outlook.com (10.167.241.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 16:00:24 +0000
Received: from llp-hahn.hahn.test (172.25.39.126) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 13 Nov
 2026 17:00:11 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Fri, 13 Nov 2026 17:00:06 +0100
Subject: [PATCH v2 4/5] arm64: dts: imx95-libra-rdk-fpsc: remove devicetree
 for old Libra
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
Message-ID: <20261113-wip-bhahn-imx95_upstreaming-v2-4-3ef58af5e689@phytec.de>
References: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
In-Reply-To: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Yannic Moog <y.moog@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>
X-Mailer: b4 0.16.1-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585609; l=27434;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=XCXLR7zB5EmZ5I1xsrLKDLviDtFqlXP7LS8bFC2DlcQ=;
 b=gYidDP7cM5wvREzGnQi/BVvzI0NHO3oBdHOwDOWXGPS1K1e2/HVFfGeTBgmS1aWZZC7cXjawO
 GnE31v8MH9OBaHfs6sIMpi5gUgxCEdIS+LKjF5NBJwsgDiAI+BKnjqF
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6AD:EE_|PA1P195MB3144:EE_
X-MS-Office365-Filtering-Correlation-Id: 8116a0ca-fc87-467f-c107-08df419f3a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|82310400026|36860700016|10067099003|11063799006|56012099006|261022105027099003|261026140227099003|261026121527099003|261021121427099003|261028144727099003|261102123227099003|261021123027099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	UU+Hk/jd7RTMvq1eIwbXeQdHZ0uY/qWdngappHBPISPnRNZSkNOrbRWqpHF/rIHjv0CAHSeDfI+VbY4DMzsRzCJRIExHBAMO89x7zKNfAoIBJJ0P3ShnXMRmQVg6Nq3lIl9Trx1XVi1LpXeix2bqWPJQP8NiJabJoY6f1ohrFBGYqxYrtJVqm/1cQnmRNtqoyn7T72WOcx33uGInYrp1Sb5+OF0nktm5kSDGEXL33XIcivZF0UCZx9NuoXK4xRCVcmxU4nMsh/U729MNm6Uu0vVbh5gNZ6lX80ZfQQfQriv7dKIA5hlkSc0jL1rWnZ3EAnmN3qWsxrBhfIPJmiOry9wvR3mHbrCuEtrNZ8+/vV50jY84yQWnGrfekLt9ajKaPMI5sZZ88Q0bN/vAr0Hacp80EXKurZiRpxfEz1E1Zf3VlX4Y1jsnwno39ZWEtAq/hGZA+R70FBifMqqnNbdRokIYZkFvX4NtoiCv8YUNgOyH5QMjrnZT15hkHqXcqdkCNNmvFOSKcc8xTSEYAiSIBZ0w12zmWZy831Z21M7zcow6Nna0paN+QsEXFEYRMuouuija7T8syiqacRwMJBf3Cm0aydb7VdAxg8HyX+3k6ZkdBPNdfks7dm7IKTh1sktaetVwjV7vlu4gGJJbGOhwVXcRLaVhKLeg247iHHkBV3Co5k4DVej/MVlvH5RfA4MBPaLRKhy0AXmSpJqEKcVcyA==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261028144727099003)(261102123227099003)(261021123027099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	boL/U5qLdgSgSUkvFwvK0+9y23oxvZV7mgfnPXq7I1Q32PRfey5Ukb6K7LVNv4DHGcNuFU0/iv+ekMft1jZBtrv10OMVJD+NBsuf5mvfYVJ/CWgtT289ihQDXGQ4nTVKISQkvwKX574dWAo2lawVichi0ON69VuaJhubdsuHWxmT9tRWQ0BjMNpkGKKhQAc1J8bIbB+41wPaFhlQUwBooreaFWiLg3zVIbr8aLXF40lqV0KlnzrYaUGowhLFNRPC12+xt7rc6CMtbfsFUQ+FPEoiZ5bjeVdHWFUnJZN+0tQDcVqssIa0Hwq2pJEVjpij2BcMZ0PZrfg1Y8uTNSULpF6H+4CywhVbL9rNWCv6Go9xyUNcPc0QYOlXmnpruBeD/ofUSbVq9fF3zRSF15ImjB/xIeCkW7hg1pDfPz6+xRwT72gLpDYoOQU/Sn4j/ivS
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:00:24.5895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8116a0ca-fc87-467f-c107-08df419f3a76
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P195MB3144

The old versions of the baseboard (1618.0) and SoM (1620.1) were only
ALPHA hardware and are not longer supported or built, as they were based
on the i.MX95 silicon revision A1, which is no longer available.

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |   1 -
 .../boot/dts/freescale/imx95-libra-rdk-fpsc.dts    | 318 ----------
 .../boot/dts/freescale/imx95-phycore-fpsc.dtsi     | 656 ---------------------
 3 files changed, 975 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 17b357f4886a..acf3f6c06f98 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -737,7 +737,6 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
 imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
 imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 
 imx95-phyflex-fpsc-g-som-temperature-dtbs := \
 			  imx95-phyflex-libra-rdk.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts b/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts
deleted file mode 100644
index 26c2df9b1b60..000000000000
--- a/arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts
+++ /dev/null
@@ -1,318 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Copyright 2025 PHYTEC Messtechnik GmbH
- */
-
-/dts-v1/;
-
-#include <dt-bindings/leds/leds-pca9532.h>
-#include <dt-bindings/pwm/pwm.h>
-
-#include "imx95-phycore-fpsc.dtsi"
-
-/ {
-	compatible = "phytec,imx95-libra-rdk-fpsc",
-		"phytec,imx95-phycore-fpsc", "fsl,imx95";
-	model = "PHYTEC Libra i.MX95 RDK FPSC";
-
-	aliases {
-		can1 = &flexcan2;
-		can2 = &flexcan1;
-		ethernet0 = &enetc_port0;
-		serial0 = &lpuart7;
-		serial1 = &lpuart8;
-	};
-
-	chosen {
-		stdout-path = &lpuart7;
-	};
-
-	backlight_lvds0: backlight0 {
-		compatible = "pwm-backlight";
-		pinctrl-0 = <&pinctrl_lvds0>;
-		power-supply = <&reg_vdd_12v0>;
-		status = "disabled";
-	};
-
-	transceiver1: can-phy {
-		compatible = "ti,tcan1043";
-		#phy-cells = <0>;
-		max-bitrate = <8000000>;
-		enable-gpios = <&gpio_expander 10 GPIO_ACTIVE_LOW>;
-	};
-
-	transceiver2: can-phy {
-		compatible = "ti,tcan1043";
-		#phy-cells = <0>;
-		max-bitrate = <8000000>;
-		enable-gpios = <&gpio_expander 9 GPIO_ACTIVE_LOW>;
-	};
-
-	panel0_lvds: panel-lvds0 {
-		backlight = <&backlight_lvds0>;
-		power-supply = <&reg_vdd_3v3>;
-		status = "disabled";
-	};
-
-	reg_vdd_12v0: regulator-vdd-12v0 {
-		compatible = "regulator-fixed";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-max-microvolt = <12000000>;
-		regulator-min-microvolt = <12000000>;
-		regulator-name = "VDD_12V0";
-	};
-
-	reg_vdd_1v8: regulator-vdd-1v8 {
-		compatible = "regulator-fixed";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-max-microvolt = <1800000>;
-		regulator-min-microvolt = <1800000>;
-		regulator-name = "VDD_1V8";
-	};
-
-	reg_vdd_3v3: regulator-vdd-3v3 {
-		compatible = "regulator-fixed";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-max-microvolt = <3300000>;
-		regulator-min-microvolt = <3300000>;
-		regulator-name = "VDD_3V3";
-	};
-
-	reg_vdd_5v0: regulator-vdd-5v0 {
-		compatible = "regulator-fixed";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-max-microvolt = <5000000>;
-		regulator-min-microvolt = <5000000>;
-		regulator-name = "VDD_5V0";
-	};
-};
-
-&enetc_port0 {
-	phy-handle = <&ethphy0>;
-	status = "okay";
-};
-
-&enetc_port2 {
-	managed = "in-band-status";
-	phy-handle = <&ethphy2>;
-	phy-mode = "10gbase-r";
-};
-
-/* CAN FD */
-&flexcan1 {
-	phys = <&transceiver1>;
-	status = "okay";
-};
-
-&flexcan2 {
-	phys = <&transceiver2>;
-	status = "okay";
-};
-
-/* SPI-NOR */
-&flexspi1 {
-	pinctrl-0 = <&pinctrl_flexspi>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	spi_nor: flash@0 {
-		compatible = "jedec,spi-nor";
-		reg = <0>;
-		spi-max-frequency = <166000000>;
-		spi-rx-bus-width = <4>;
-		spi-tx-bus-width = <4>;
-		vcc-supply = <&reg_vdd_1v8>;
-	};
-};
-
-&gpio2 {
-	gpio-line-names = "", "", "", "", "",
-			  "", "", "", "", "",
-			  "", "", "", "", "",
-			  "", "RGMII2_nINT", "GPIO4", "RTC_INT", "",
-			  "LVDS1_BL_EN";
-};
-
-&lpi2c1 {
-	temperature-sensor@4f {
-		compatible = "nxp,p3t1755";
-		reg = <0x4f>;
-		vs-supply = <&reg_vdd_1v8>;
-	};
-};
-
-&lpi2c3 {
-	status = "okay";
-
-	leds@62 {
-		compatible = "nxp,pca9533";
-		reg = <0x62>;
-
-		led-1 {
-			type = <PCA9532_TYPE_LED>;
-		};
-
-		led-2 {
-			type = <PCA9532_TYPE_LED>;
-		};
-
-		led-3 {
-			type = <PCA9532_TYPE_LED>;
-		};
-	};
-};
-
-&lpi2c4 {
-	status = "okay";
-
-	gpio_expander: gpio@20 {
-		compatible = "ti,tca6416";
-		reg = <0x20>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		gpio-line-names = "CSI1_CTRL1", "CSI1_CTRL2", "CSI1_CTRL3",
-				  "CSI1_CTRL4", "CSI2_CTRL1", "CSI2_CTRL2",
-				  "CSI2_CTRL3", "CSI2_CTRL4", "CLK_EN_AV",
-				  "nCAN2_EN", "nCAN1_EN", "PCIE1_nWAKE",
-				  "PCIE2_nWAKE", "PCIE2_nALERT_3V3",
-				  "UART1_BT_RS_SEL", "UART1_RS232_485_SEL";
-		vcc-supply = <&reg_vdd_1v8>;
-
-		uart1_bt_rs_sel: bt-rs-hog {
-			gpios = <14 GPIO_ACTIVE_HIGH>;
-			gpio-hog;
-			line-name = "UART1_BT_RS_SEL";
-			output-low;
-		};
-	};
-};
-
-&lpi2c5 {
-	status = "okay";
-
-	eeprom@51 {
-		compatible = "atmel,24c02";
-		reg = <0x51>;
-		pagesize = <16>;
-		vcc-supply = <&reg_vdd_1v8>;
-	};
-};
-
-/* Used for M33 debug */
-&lpuart2 {
-	pinctrl-0 = <&pinctrl_lpuart2>;
-	pinctrl-names = "default";
-};
-
-/* A-55 debug UART */
-&lpuart7 {
-	status = "okay";
-};
-
-/* RS232/RS485/BT */
-&lpuart8 {
-	uart-has-rtscts;
-	status = "okay";
-};
-
-&netc_emdio { /* RGMII2 */
-	ethphy0: ethernet-phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
-		reg = <0x1>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
-		enet-phy-lane-no-swap;
-		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
-		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
-		ti,rx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
-		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
-	};
-
-	ethphy2: ethernet-phy@8 {
-		compatible = "ethernet-phy-ieee802.3-c45";
-		reg = <0x8>;
-		max-speed = <10000>; /* 10Gbit/s */
-		status = "disabled";
-	};
-};
-
-&pcie0 {
-	reset-gpio = <&gpio1 10 GPIO_ACTIVE_LOW>;
-	vpcie-supply = <&reg_vdd_3v3>;
-	status = "okay";
-};
-
-&pcie1 {
-	reset-gpio = <&gpio1 14 GPIO_ACTIVE_LOW>;
-	vpcie-supply = <&reg_vdd_3v3>;
-	status = "okay";
-};
-
-&rv3028 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rtc>;
-	interrupt-parent = <&gpio2>;
-	interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
-	aux-voltage-chargeable = <1>;
-	wakeup-source;
-	trickle-resistor-ohms = <3000>;
-};
-
-&scmi_iomuxc {
-	pinctrl_lpuart2: lpuart2grp { /* FPSC proprietary */
-		fsl,pins = <
-			IMX95_PAD_UART2_TXD__AONMIX_TOP_LPUART2_TX	0x31e
-			IMX95_PAD_UART2_RXD__AONMIX_TOP_LPUART2_RX	0x31e
-		>;
-	};
-
-	pinctrl_lvds0: lvds0grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO20__GPIO2_IO_BIT20	0x31e
-		>;
-	};
-
-	pinctrl_rtc: rtcgrp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO18__GPIO2_IO_BIT18	0x31e
-		>;
-	};
-
-	pinctrl_tpm4: tpm4grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO21__TPM4_CH1	0x51e
-		>;
-	};
-};
-
-&tpm4 {
-	pinctrl-0 = <&pinctrl_tpm4>;
-	pinctrl-names = "default";
-};
-
-&usb3 {
-	fsl,over-current-active-low;
-	fsl,power-active-low;
-	status = "okay";
-};
-
-&usb3_dwc3 {
-	dr_mode = "peripheral";
-	status = "okay";
-};
-
-&usb3_phy {
-	vbus-supply = <&reg_vdd_5v0>;
-	status = "okay";
-};
-
-/* uSD Card */
-&usdhc2 {
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi b/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
deleted file mode 100644
index 7519d5bd06ba..000000000000
--- a/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
+++ /dev/null
@@ -1,656 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Copyright 2025 PHYTEC Messtechnik GmbH
- */
-
-#include <dt-bindings/net/ti-dp83867.h>
-#include "imx95.dtsi"
-
-/ {
-	model = "PHYTEC phyCORE-i.MX95 FPSC";
-	compatible = "phytec,imx95-phycore-fpsc", "fsl,imx95";
-
-	aliases {
-		ethernet1 = &enetc_port1;
-		i2c1 = &lpi2c2;
-		i2c2 = &lpi2c5;
-		i2c3 = &lpi2c3;
-		i2c4 = &lpi2c4;
-		i2c5 = &lpi2c1;
-		rtc0 = &rv3028;
-		rtc1 = &scmi_bbm;
-	};
-
-	memory@80000000 {
-		device_type = "memory";
-		reg = <0x00000000 0x80000000 0x00000001 0x00000000>;
-	};
-
-	reg_nvcc_aon: regulator-nvcc-aon {
-		compatible = "regulator-fixed";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-max-microvolt = <1800000>;
-		regulator-min-microvolt = <1800000>;
-		regulator-name = "VDD_IO";
-	};
-
-	reg_usdhc2_vmmc: regulator-usdhc2 {
-		compatible = "regulator-fixed";
-		off-on-delay-us = <12000>;
-		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
-		pinctrl-names = "default";
-		regulator-max-microvolt = <3300000>;
-		regulator-min-microvolt = <3300000>;
-		regulator-name = "VDDSW_SD2";
-		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	reserved-memory {
-		ranges;
-		#address-cells = <2>;
-		#size-cells = <2>;
-
-		linux,cma {
-			compatible = "shared-dma-pool";
-			alloc-ranges = <0 0x80000000 0 0x7f000000>;
-			reusable;
-			size = <0 0x3c000000>;
-			linux,cma-default;
-		};
-	};
-};
-
-&enetc_port0 { /* FPSC RGMII2 */
-	phy-mode = "rgmii-id";
-	pinctrl-0 = <&pinctrl_enetc0>;
-	pinctrl-names = "default";
-};
-
-&enetc_port1 {
-	phy-handle = <&ethphy1>;
-	phy-mode = "rgmii-id";
-	pinctrl-0 = <&pinctrl_enetc1>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&flexcan1 { /* FPSC CAN1 */
-	pinctrl-0 = <&pinctrl_flexcan1>;
-	pinctrl-names = "default";
-};
-
-&flexcan2 { /* FPSC CAN2 */
-	pinctrl-0 = <&pinctrl_flexcan2>;
-	pinctrl-names = "default";
-};
-
-&flexspi1 { /* FPSC QSPI */
-	pinctrl-0 = <&pinctrl_flexspi>;
-	pinctrl-names = "default";
-};
-
-&gpio1 { /* FPSC GPIO */
-	gpio-line-names = "", "", "", "", "GPIO2",
-			  "GPIO1", "", "", "", "",
-			  "PCIE1_nPERST", "USB1_PWR_EN", "GPIO3", "USB2_PWR_EN", "PCIE2_nPERST";
-	pinctrl-0 = <&pinctrl_gpio1>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&gpio2 { /* FPSC GPIO */
-	gpio-line-names = "", "", "", "", "",
-			  "", "", "", "", "",
-			  "", "", "", "", "",
-			  "", "RGMII2_nINT", "GPIO4";
-	pinctrl-0 = <&pinctrl_gpio2>;
-	pinctrl-names = "default";
-};
-
-&gpio3 {
-	gpio-line-names = "", "", "", "", "",
-			  "", "", "SD2_RESET_B";
-};
-
-&gpio4 {
-	gpio-line-names = "ENET2_nINT";
-};
-
-&gpio5 {
-	gpio-line-names = "", "", "", "", "",
-			  "", "", "", "", "",
-			  "", "", "", "USB1_OC", "USB2_OC";
-};
-
-&lpi2c1 { /* FPSC I2C5 */
-	clock-frequency = <400000>;
-	pinctrl-0 = <&pinctrl_lpi2c1>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	dram_sense: temperature-sensor@48 {
-		compatible = "ti,tmp102";
-		reg = <0x48>;
-		#thermal-sensor-cells = <1>;
-	};
-
-	emmc_sense: temperature-sensor@49 {
-		compatible = "ti,tmp102";
-		reg = <0x49>;
-		#thermal-sensor-cells = <1>;
-	};
-
-	ethphy_sense: temperature-sensor@4a {
-		compatible = "ti,tmp102";
-		reg = <0x4a>;
-		#thermal-sensor-cells = <1>;
-	};
-
-	pmic_sense: temperature-sensor@4b {
-		compatible = "ti,tmp102";
-		reg = <0x4b>;
-		#thermal-sensor-cells = <1>;
-	};
-
-	/* User EEPROM */
-	eeprom@50 {
-		compatible = "st,24c32", "atmel,24c32";
-		reg = <0x50>;
-		pagesize = <32>;
-		vcc-supply = <&reg_nvcc_aon>;
-	};
-
-	/* Factory EEPROM */
-	eeprom@51 {
-		compatible = "st,24c32", "atmel,24c32";
-		reg = <0x51>;
-		pagesize = <32>;
-		vcc-supply = <&reg_nvcc_aon>;
-	};
-
-	rv3028: rtc@52 {
-		compatible = "microcrystal,rv3028";
-		reg = <0x52>;
-	};
-
-	/* User EEPROM ID page */
-	eeprom@58 {
-		compatible = "st,24c32", "atmel,24c32";
-		reg = <0x58>;
-		pagesize = <32>;
-		vcc-supply = <&reg_nvcc_aon>;
-	};
-};
-
-&lpi2c2 { /* FPSC I2C1 */
-	clock-frequency = <400000>;
-	pinctrl-0 = <&pinctrl_lpi2c2>;
-	pinctrl-names = "default";
-};
-
-&lpi2c3 { /* FPSC I2C3 */
-	clock-frequency = <400000>;
-	pinctrl-0 = <&pinctrl_lpi2c3>;
-	pinctrl-names = "default";
-};
-
-&lpi2c4 { /* FPSC I2C4 */
-	clock-frequency = <400000>;
-	pinctrl-0 = <&pinctrl_lpi2c4>;
-	pinctrl-names = "default";
-};
-
-&lpi2c5 { /* FPSC I2C2 */
-	clock-frequency = <400000>;
-	pinctrl-0 = <&pinctrl_lpi2c5>;
-	pinctrl-names = "default";
-};
-
-&lpspi3 { /* FPSC SPI2 */
-	pinctrl-0 = <&pinctrl_lpspi3>;
-	pinctrl-names = "default";
-};
-
-&lpspi4 { /* FPSC SPI3 */
-	pinctrl-0 = <&pinctrl_lpspi4>;
-	pinctrl-names = "default";
-};
-
-&lpspi7 { /* FPSC SPI1 */
-	pinctrl-0 = <&pinctrl_lpspi7>;
-	pinctrl-names = "default";
-};
-
-&lpuart5 { /* FPSC UART2 */
-	pinctrl-0 = <&pinctrl_lpuart5>;
-	pinctrl-names = "default";
-};
-
-&lpuart7 { /* FPSC UART3 */
-	pinctrl-0 = <&pinctrl_lpuart7>;
-	pinctrl-names = "default";
-};
-
-&lpuart8 { /* FPSC UART1 */
-	pinctrl-0 = <&pinctrl_lpuart8>;
-	pinctrl-names = "default";
-};
-
-&netc_blk_ctrl {
-	status = "okay";
-};
-
-&netc_emdio { /* FPSC RGMII2 */
-	pinctrl-0 = <&pinctrl_emdio>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	ethphy1: ethernet-phy@0 {
-		compatible = "ethernet-phy-ieee802.3-c22";
-		reg = <0x0>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-		enet-phy-lane-no-swap;
-		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
-		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
-		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
-		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
-	};
-};
-
-&netcmix_blk_ctrl {
-	status = "okay";
-};
-
-&pcie0 { /* FPSC PCIE1 */
-	pinctrl-0 = <&pinctrl_pcie0>;
-	pinctrl-names = "default";
-};
-
-&pcie1 { /* FPSC PCIE2 */
-	pinctrl-0 = <&pinctrl_pcie1>;
-	pinctrl-names = "default";
-};
-
-&sai5 {	/* FPSC SAI1 */
-	pinctrl-0 = <&pinctrl_sai5>;
-	pintrc-names = "default";
-};
-
-&scmi_iomuxc {
-	pinctrl_emdio: emdiogrp {
-		fsl,pins = <
-			IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO	0x97e	/* RGMII2_MDIO */
-			IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC	0x502	/* RGMII2_MDC */
-		>;
-	};
-
-	pinctrl_enetc0: enetc0grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO16__GPIO2_IO_BIT16			0x31e	/* RGMII2_nINT */
-			IMX95_PAD_CCM_CLKO3__NETCMIX_TOP_NETC_TMR_1588_TRIG2	0x31e	/* RGMII2_EVENT_IN */
-			IMX95_PAD_CCM_CLKO4__NETCMIX_TOP_NETC_TMR_1588_PP2	0x31e	/* RGMII2_EVENT_OUT */
-
-			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x57e	/* RGMII2_TX_3 */
-			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x57e	/* RGMII2_TX_2 */
-			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x57e	/* RGMII2_TX_1 */
-			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x57e	/* RGMII2_TX_0 */
-			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e	/* RGMII2_TX_CTL */
-			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e	/* RGMII2_TXC */
-			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e	/* RGMII2_RX_3 */
-			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e	/* RGMII2_RX_2 */
-			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e	/* RGMII2_RX_1 */
-			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e	/* RGMII2_RX_0 */
-			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e	/* RGMII2_RX_CTL */
-			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK	0x58e	/* RGMII2_RXC */
-		>;
-	};
-
-	pinctrl_enetc1: enetc1grp {
-		fsl,pins = <
-			IMX95_PAD_ENET1_MDC__GPIO4_IO_BIT0			0x31e
-			IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0		0x57e
-			IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1		0x57e
-			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2		0x57e
-			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3		0x57e
-			IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL	0x57e
-			IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK	0x58e
-			IMX95_PAD_ENET2_RD0__NETCMIX_TOP_ETH1_RGMII_RD0		0x57e
-			IMX95_PAD_ENET2_RD1__NETCMIX_TOP_ETH1_RGMII_RD1		0x57e
-			IMX95_PAD_ENET2_RD2__NETCMIX_TOP_ETH1_RGMII_RD2		0x57e
-			IMX95_PAD_ENET2_RD3__NETCMIX_TOP_ETH1_RGMII_RD3		0x57e
-			IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL	0x57e
-			IMX95_PAD_ENET2_RXC__NETCMIX_TOP_ETH1_RGMII_RX_CLK	0x58e
-		>;
-	};
-
-	pinctrl_flexcan1: flexcan1grp {
-		fsl,pins = <
-			IMX95_PAD_PDM_CLK__AONMIX_TOP_CAN1_TX		0x51e	/* CAN1_TX */
-			IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_CAN1_RX	0x51e	/* CAN1_RX */
-		>;
-	};
-
-	pinctrl_flexcan2: flexcan2grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO25__CAN2_TX	0x51e	/* CAN2_TX */
-			IMX95_PAD_GPIO_IO27__CAN2_RX	0x51e	/* CAN2_RX */
-		>;
-	};
-
-	pinctrl_flexspi: flexspigrp {
-		fsl,pins = <
-			IMX95_PAD_XSPI1_SS0_B__FLEXSPI1_A_SS0_B		0x3fe	/* QSPI_CE */
-			IMX95_PAD_XSPI1_SCLK__FLEXSPI1_A_SCLK		0x3fe	/* QSPI_CLK */
-			IMX95_PAD_XSPI1_DATA0__FLEXSPI1_A_DATA_BIT0	0x3fe	/* QSPI_DATA_0 */
-			IMX95_PAD_XSPI1_DATA1__FLEXSPI1_A_DATA_BIT1	0x3fe	/* QSPI_DATA_1 */
-			IMX95_PAD_XSPI1_DATA2__FLEXSPI1_A_DATA_BIT2	0x3fe	/* QSPI_DATA_2 */
-			IMX95_PAD_XSPI1_DATA3__FLEXSPI1_A_DATA_BIT3	0x3fe	/* QSPI_DATA_3 */
-			IMX95_PAD_XSPI1_DQS__FLEXSPI1_A_DQS		0x3fe	/* QSPI_DQS */
-		>;
-	};
-
-	pinctrl_gpio1: gpio1grp {
-		fsl,pins = <
-			IMX95_PAD_UART1_TXD__AONMIX_TOP_GPIO1_IO_BIT5	0x31e	/* GPIO1 */
-			IMX95_PAD_UART1_RXD__AONMIX_TOP_GPIO1_IO_BIT4	0x31e	/* GPIO2 */
-			IMX95_PAD_SAI1_TXC__AONMIX_TOP_GPIO1_IO_BIT12	0x31e	/* GPIO3 */
-		>;
-	};
-
-	pinctrl_gpio2: gpio2grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO17__GPIO2_IO_BIT17	0x31e	/* GPIO4 */
-		>;
-	};
-
-	pinctrl_lpi2c1: lpi2c1grp {
-		fsl,pins = <
-			IMX95_PAD_I2C1_SCL__AONMIX_TOP_LPI2C1_SCL	0x40000b9e	/* I2C5_SCL */
-			IMX95_PAD_I2C1_SDA__AONMIX_TOP_LPI2C1_SDA	0x40000b9e	/* I2C5_SDA */
-		>;
-	};
-
-	pinctrl_lpi2c2: lpi2c2grp {
-		fsl,pins = <
-			IMX95_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA	0x40000b9e	/* I2C1_SDA_DNU */
-			IMX95_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL	0x40000b9e	/* I2C1_SCL_DNU */
-		>;
-	};
-
-	pinctrl_lpi2c3: lpi2c3grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO28__LPI2C3_SDA 0x40000b9e	/* I2C3_SDA */
-			IMX95_PAD_GPIO_IO29__LPI2C3_SCL 0x40000b9e	/* I2C3_SCL */
-		>;
-	};
-
-	pinctrl_lpi2c4: lpi2c4grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO30__LPI2C4_SDA 0x40000b9e	/* I2C4_SDA */
-			IMX95_PAD_GPIO_IO31__LPI2C4_SCL 0x40000b9e	/* I2C4_SDL */
-		>;
-	};
-
-	pinctrl_lpi2c5: lpi2c5grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO22__LPI2C5_SDA	0x40000b9e	/* I2C2_SDA */
-			IMX95_PAD_GPIO_IO23__LPI2C5_SCL 0x40000b9e	/* I2C2_SCL */
-		>;
-	};
-
-	pinctrl_lpspi3: lpspi3grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO11__LPSPI3_SCK		0x51e	/* SPI2_SCLK */
-			IMX95_PAD_GPIO_IO10__LPSPI3_SOUT	0x51e	/* SPI2_MOSI */
-			IMX95_PAD_GPIO_IO09__LPSPI3_SIN		0x51e	/* SPI2_MISO */
-			IMX95_PAD_GPIO_IO08__LPSPI3_PCS0	0x51e	/* SPI2_CS */
-		>;
-	};
-
-	pinctrl_lpspi4: lpspi4grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO21__LPSPI4_SCK		0x51e	/* SPI3_SCLK */
-			IMX95_PAD_GPIO_IO20__LPSPI4_SOUT	0x51e	/* SPI3_MOSI */
-			IMX95_PAD_GPIO_IO19__LPSPI4_SIN		0x51e	/* SPI3_MISO */
-			IMX95_PAD_GPIO_IO18__LPSPI4_PCS0	0x51e	/* SPI3_CS */
-		>;
-	};
-
-	pinctrl_lpspi7: lpspi7grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO07__LPSPI7_SCK		0x51e	/* SPI1_SCLK */
-			IMX95_PAD_GPIO_IO06__LPSPI7_SOUT	0x51e	/* SPI1_MOSI */
-			IMX95_PAD_GPIO_IO05__LPSPI7_SIN		0x51e	/* SPI1_MISO */
-			IMX95_PAD_GPIO_IO04__LPSPI7_PCS0	0x51e	/* SPI1_CS */
-		>;
-	};
-
-	pinctrl_lpuart5: lpuart5grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO01__LPUART5_RX		0x51e	/* UART2_RXD */
-			IMX95_PAD_GPIO_IO00__LPUART5_TX		0x51e	/* UART2_TXD */
-			IMX95_PAD_GPIO_IO03__LPUART5_RTS_B	0x51e	/* UART2_RTS */
-			IMX95_PAD_GPIO_IO02__LPUART5_CTS_B	0x51e	/* UART2_CTS */
-		>;
-	};
-
-	pinctrl_lpuart7: lpuart7grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO37__LPUART7_RX	0x31e	/* UART3_RXD */
-			IMX95_PAD_GPIO_IO36__LPUART7_TX	0x31e	/* UART3_TXD */
-		>;
-	};
-
-	pinctrl_lpuart8: lpuart8grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO13__LPUART8_RX		0x51e	/* UART1_RXD */
-			IMX95_PAD_GPIO_IO12__LPUART8_TX		0x51e	/* UART1_TXD */
-			IMX95_PAD_GPIO_IO15__LPUART8_RTS_B	0x51e	/* UART1_RTS */
-			IMX95_PAD_GPIO_IO14__LPUART8_CTS_B	0x51e	/* UART1_CTS */
-		>;
-	};
-
-	pinctrl_pcie0: pcie0grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO32__HSIOMIX_TOP_PCIE1_CLKREQ_B		0x31e	/* PCIE1_nCLKREQ */
-			IMX95_PAD_PDM_BIT_STREAM1__AONMIX_TOP_GPIO1_IO_BIT10	0x31e	/* PCIE1_nPERST */
-		>;
-	};
-
-	pinctrl_pcie1: pcie1grp {
-		fsl,pins = <
-			IMX95_PAD_GPIO_IO35__HSIOMIX_TOP_PCIE2_CLKREQ_B	0x31e	/* PCIE2_nCLKREQ */
-			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_GPIO1_IO_BIT14	0x31e	/* PCIE2_nPERST */
-		>;
-	};
-
-	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
-		fsl,pins = <
-			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7	0x31e
-		>;
-	};
-
-	pinctrl_sai5: sai5grp {
-		fsl,pins = <
-			IMX95_PAD_XSPI1_DQS__SAI5_RX_SYNC		0x51e	/* SAI1_RX_SYNC */
-			IMX95_PAD_XSPI1_SS1_B__SAI5_RX_BCLK		0x51e	/* SAI1_RX_BCLK */
-			IMX95_PAD_XSPI1_DATA7__SAI5_RX_DATA_BIT0	0x51e	/* SAI1_RX_DATA */
-			IMX95_PAD_XSPI1_DATA5__SAI5_TX_SYNC		0x51e	/* SAI1_TX_SYNC */
-			IMX95_PAD_XSPI1_DATA6__SAI5_TX_BCLK		0x51e	/* SAI1_TX_BCLK */
-			IMX95_PAD_XSPI1_DATA4__SAI5_TX_DATA_BIT0	0x51e	/* SAI1_TX_DATA */
-		>;
-	};
-
-	pinctrl_tpm3: tpm3grp {
-	      fsl,pins = <
-		      IMX95_PAD_GPIO_IO24__TPM3_CH3	0x51e	/* PWM1 */
-	      >;
-	};
-
-	pinctrl_tpm5: tpm5grp {
-	      fsl,pins = <
-		      IMX95_PAD_GPIO_IO26__TPM5_CH3	0x51e	/* PWM2 */
-	      >;
-	};
-
-	pinctrl_usbc: usbcgrp {
-		fsl,pins = <
-			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_GPIO1_IO_BIT11	0x51e	/* USB1_PWR_EN */
-			IMX95_PAD_GPIO_IO33__GPIO5_IO_BIT13		0x51e	/* USB1_OC */
-		>;
-	};
-
-	pinctrl_usb2: usb2grp {
-		fsl,pins = <
-			IMX95_PAD_SAI1_TXD0__AONMIX_TOP_GPIO1_IO_BIT13	0x51e	/* USB2_PWR_EN */
-			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14		0x51e	/* USB2_OC */
-		>;
-	};
-
-	pinctrl_usdhc1: usdhc1grp {
-		fsl,pins = <
-			IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x138e
-			IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x138e
-			IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x138e
-			IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x138e
-			IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x138e
-			IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x138e
-			IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x138e
-			IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x138e
-			IMX95_PAD_SD1_CMD__USDHC1_CMD			0x138e
-			IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e
-			IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x158e
-		>;
-	};
-
-	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
-		fsl,pins = <
-			IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x138e
-			IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x138e
-			IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x138e
-			IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x138e
-			IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x138e
-			IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x138e
-			IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x138e
-			IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x138e
-			IMX95_PAD_SD1_CMD__USDHC1_CMD			0x138e
-			IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e
-			IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x158e
-		>;
-	};
-
-	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
-		fsl,pins = <
-			IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x13fe
-			IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x13fe
-			IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x13fe
-			IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x13fe
-			IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x13fe
-			IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x13fe
-			IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x13fe
-			IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x13fe
-			IMX95_PAD_SD1_CMD__USDHC1_CMD			0x13fe
-			IMX95_PAD_SD1_CLK__USDHC1_CLK			0x15fe
-			IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x15fe
-		>;
-	};
-
-	pinctrl_usdhc2: usdhc2grp {
-		fsl,pins = <
-			IMX95_PAD_SD2_CD_B__USDHC2_CD_B		0x31e	/* CD */
-			IMX95_PAD_SD2_CLK__USDHC2_CLK		0x158e	/* CLK */
-			IMX95_PAD_SD2_CMD__USDHC2_CMD		0x138e	/* CMD */
-			IMX95_PAD_SD2_DATA0__USDHC2_DATA0	0x138e	/* DATA0 */
-			IMX95_PAD_SD2_DATA1__USDHC2_DATA1	0x138e	/* DATA1 */
-			IMX95_PAD_SD2_DATA2__USDHC2_DATA2	0x138e	/* DATA2 */
-			IMX95_PAD_SD2_DATA3__USDHC2_DATA3	0x138e	/* DATA3 */
-			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
-
-		>;
-	};
-
-	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
-		fsl,pins = <
-			IMX95_PAD_SD2_CD_B__USDHC2_CD_B		0x31e	/* CD */
-			IMX95_PAD_SD2_CLK__USDHC2_CLK		0x158e	/* CLK */
-			IMX95_PAD_SD2_CMD__USDHC2_CMD		0x138e	/* CMD */
-			IMX95_PAD_SD2_DATA0__USDHC2_DATA0	0x138e	/* DATA0 */
-			IMX95_PAD_SD2_DATA1__USDHC2_DATA1	0x138e	/* DATA1 */
-			IMX95_PAD_SD2_DATA2__USDHC2_DATA2	0x138e	/* DATA2 */
-			IMX95_PAD_SD2_DATA3__USDHC2_DATA3	0x138e	/* DATA3 */
-			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
-		>;
-	};
-
-	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
-		fsl,pins = <
-			IMX95_PAD_SD2_CD_B__USDHC2_CD_B		0x31e	/* CD */
-			IMX95_PAD_SD2_CLK__USDHC2_CLK		0x15fe	/* CLK */
-			IMX95_PAD_SD2_CMD__USDHC2_CMD		0x13fe	/* CMD */
-			IMX95_PAD_SD2_DATA0__USDHC2_DATA0	0x13fe	/* DATA0 */
-			IMX95_PAD_SD2_DATA1__USDHC2_DATA1	0x13fe	/* DATA1 */
-			IMX95_PAD_SD2_DATA2__USDHC2_DATA2	0x13fe	/* DATA2 */
-			IMX95_PAD_SD2_DATA3__USDHC2_DATA3	0x13fe	/* DATA3 */
-			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
-		>;
-	};
-
-	pinctrl_usdhc3: usdhc3grp {
-		fsl,pins = <
-			IMX95_PAD_SD3_CLK__USDHC3_CLK		0x158e	/* SDIO_CLK */
-			IMX95_PAD_SD3_CMD__USDHC3_CMD		0x138e	/* SDIO_CMD */
-			IMX95_PAD_SD3_DATA0__USDHC3_DATA0	0x138e	/* SDIO_DATA0 */
-			IMX95_PAD_SD3_DATA1__USDHC3_DATA1	0x138e	/* SDIO_DATA1 */
-			IMX95_PAD_SD3_DATA2__USDHC3_DATA2	0x138e	/* SDIO_DATA2 */
-			IMX95_PAD_SD3_DATA3__USDHC3_DATA3	0x138e	/* SDIO_DATA3 */
-		>;
-	};
-};
-
-&tpm3 { /* FPSC PWM1 */
-	pinctrl-0 = <&pinctrl_tpm3>;
-	pinctrl-names = "default";
-};
-
-&tpm5 {	/* FPSC PWM2 */
-	pinctrl-0 = <&pinctrl_tpm5>;
-	pinctrl-names = "default";
-};
-
-&usb3 { /* FPSC USB1 */
-	pinctrl-0 = <&pinctrl_usbc>;
-	pinctrl-names = "default";
-};
-
-&usdhc1 {
-	bus-width = <8>;
-	non-removable;
-	no-sd;
-	no-sdio;
-	pinctrl-0 = <&pinctrl_usdhc1>;
-	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
-	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
-	pinctrl-3 = <&pinctrl_usdhc1>;
-	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
-	status = "okay";
-};
-
-&usdhc2 { /* FPSC SDCARD */
-	bus-width = <4>;
-	disable-wp;
-	pinctrl-0 = <&pinctrl_usdhc2>;
-	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
-	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
-	pinctrl-3 = <&pinctrl_usdhc2>;
-	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
-	sd-uhs-sdr104;
-	vmmc-supply = <&reg_usdhc2_vmmc>;
-};
-
-&usdhc3 { /* FPSC SDIO */
-	pinctrl-0 = <&pinctrl_usdhc3>;
-	pinctrl-names = "default";
-};

-- 
2.53.0

