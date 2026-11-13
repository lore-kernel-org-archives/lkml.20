Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794585634;
	b=RWSFW1dQ5LJeXywo0nD5k552c4l/sf/wo91FUwzuTaf17reuVtb9GvmNF4aMjJ+UO8O0
	 R+FWxUxevvpmWfEVR1dw8risyVK8DUqOxaqWcyci3/pgeWiuK1KaHf8tDmzIDEYEUa9tG
	 GrW2tHP+zTOI1Ct9L5KistIyx6WftEj/HeMCylozsm7qdBykcZP7zC5eqCmquSTcRHomo
	 HqD7bU7M9xJUOCzNk2lYnVTFkOwOEvMmVnQJ0Y1fsNk3L3p3ZWBzmANTmR8+2UmolhEyF
	 p0UZM66Ufpq8ZDVZ3Dg1mxMyVf0HbDT3reo4rsTP9WLqnc6V/lRf/a8SpcOSEKJxgvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585634;
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
	bh=eRsMRcxg8gLnrMdi8No8SfFXmRjf5z621n9f4HF6SJI=;
	b=R8Ak2bBt6ijVz7q11tdcRzRwsFomC6DfR+m4VtYQTORpBGdk1JRkQ/Fm3t5ulzp9M/Yn
	 s5/1l+BVq5PAOfZiBE26+A5ROzVOk8S7NWb4yIOH5eGZ6LI7lwubPfa8MjEBLJ0uI7dwX
	 /IMBvlCBsTse76cmSOzdshnEd/BIYAdnLatGtO3qojWrp9EZTsJFoDzJUzcwvWcWEDLho
	 QtPxL489e7rI5k6QuY286FCgGzdNVLlVIwdFzsc/mfhIer8PjIGYd4QKRFzwX3Wfnk5KJ
	 p2x5QI7rmozSMxh57n8qEc3rLWFLmqk2OniCne9SA897I4iDnpqzIiK0zBLxXAb7seQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=gPQeXuN5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.114
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021114.outbound.protection.outlook.com [40.107.130.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87A360A263E;
	Fri, 13 Nov 2026 16:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B87A360A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=gPQeXuN5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgvG3hLQWrJKHuoSW1Ihzw8dqRDsgcBPHDk5Wh5+pYNKOgghHZ/tD0ZVucu+6PHcaEUuisgt/QOwqsy++9Dx2RoYsWmNpygPx+S1bbdqxywUi9FO8/9C4cvlR56sAl32WNXXcTiYWr6POf12XQujGDTY3gR89dPRXGfYrghOxAU/OypIO/BXiMX8JE2nDZrVLN0XcIEwOQQFll5C4K7333l4jVBDOUZGJLwEYiTGvY0xqtqRBqvbn33xN5rdDas16il6S47RyCt3ajclY6Z18klunAnPSR/wv7syFSsBhlL0dxz8QAWxbiR9hAsLJ4VTLUZgWaRkKTU+l/zab4UXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRsMRcxg8gLnrMdi8No8SfFXmRjf5z621n9f4HF6SJI=;
 b=eEOT5PpZrtalX4sLizh6bQea0nkx0AyHRNJcvFtQZh6aMH5A4mouf/h9IhkFAVCbdmMx9AuUxeOzkBs+ko8B0McgFRZdB/HXo7aXOpYbghxh8wmwb/5OhEEwfLC8ryb21C2VafZDcdnvHUb/Ce4V64dHwHDvQAtqA67VsqMC7gLzmJHlCXYI248Pq9jNV+rsh/n3A91QIsIsHjBGrYGivWYTZyodc7TQ8sig+v82cnJSIoZD9eKM8iVSmyZ3Mil4IzDCOh8PEUOJgV0csoDdFLHbcGNDG4Eaz9z64dsf6Pg6xKy1IKlqV7+vRdGx7kpsZHYiGiezqyojycbA1WsA+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRsMRcxg8gLnrMdi8No8SfFXmRjf5z621n9f4HF6SJI=;
 b=gPQeXuN5o0x8rcptrUT5IUpI2ftb0XkOCLhwx+7IAXZAMxFKdhDppL6v3t4M6SMYLuwAafyJZYfNguWzkInqGREyP18rAjtrPsb9YH9IeY6KxcC3xOGZhFCrpnaE/3sADiv+ZoTNyWH1CWaXq09hlA3tPE8p2PSSu4zGKeRd+G0bFpBtdlxQhDPapwHAXdq23kevbbML02tODPQIw5SzWPFY5J6AWjlCqIgzYwdqV9iphNx5jeCN8r7RoCih1WfQEWuXhhVMXw0ewuaCDMZgEq3Ktz1xXrQt+M3PImlHEBkNiV7cGxEdt2wELHvfMsSKFZQ4TGhixTCHSrDZGu5afw==
Received: from ZR1PEPF000077EA.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::45b)
 by AS4P195MB1670.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:511::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 16:00:23 +0000
Received: from ZR1PEPF0000E6AD.eurprd05.prod.outlook.com (2603:10a6:918::154)
 by ZR1PEPF000077EA.outlook.office365.com (2603:10a6:918::45b) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10
 via Frontend Transport; Fri, 13 Nov 2026 16:00:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 ZR1PEPF0000E6AD.mail.protection.outlook.com (10.167.241.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 16:00:22 +0000
Received: from llp-hahn.hahn.test (172.25.39.126) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 13 Nov
 2026 17:00:11 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Fri, 13 Nov 2026 17:00:05 +0100
Subject: [PATCH v2 3/5] arm64: dts: imx95-phyflex-libra-rdk: Add overlays
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
Message-ID: <20261113-wip-bhahn-imx95_upstreaming-v2-3-3ef58af5e689@phytec.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585609; l=2932;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=yyUMmAcS+fsoF4I4KpuQmN3ekfD0a78Q1zK1IHyj3No=;
 b=oJC82ErDdRJx7Hg6hD4fQMcSpKTQ2RYgNdMcpdh2p7eN78VJfbOCcR4IjQq5bwg3mMSC1cRVz
 auD9OvQRj/IAN8F7HW2m9CcBK6E5xOCc2dvVvLC9RycOCgGeIuT6KFB
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6AD:EE_|AS4P195MB1670:EE_
X-MS-Office365-Filtering-Correlation-Id: b26c19ab-711b-482b-32c9-08df419f3940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	lxG8g29V83KbaOg6eUOPIRnChL76Q9/d3affDQQzjp0Az8Itvu41zhh09zGSCH/I2cUJ6O0c9U0FcF0CzCpXHCNjb0ULH9fVAUzplsBSpRUYqq2opM3rkHedcwB3bflMs37HM7BGy2votyqDoPHp+i6Kec34jB5pi9QvErEA9yFPcan6+U5KE0zwFGt9BjbZQS3+C3L0ADxYoV48wdfiJMot+EyQ3mDi2+yqxBzwKSO/2mijVvHiM6Rccf8Q/NX8TazswI6OeaMmyX43yhrIoGXrB72KQNf9qssUVJOFrwbptcS+OPkW2OLkCAFXH9kRYxeh7pRKSIu0PJ4i4Fho1UQCwD0sPSfnQ3xImnh8a2DhLvITx0YfKMFIkEKXBJ55+8xaK805zSUpjZQhA8x1Y2vLM8v1sX1wmp57tD1ej89a4AS4Y55FabvkLz0QB4yjo4XrPnm+3ZTATKi4ojFGdcOWB2+ps+r1/vSXKcA34mIGPAhTZurIwzhxIOLFmX8PTBKykSIickX7xLCdRYstFvA8y1Wt2WCLyi8zShN0Dm0zVWvNbashRXTXLDk9RlxhXPEpMt4pq7+p45N8KKES0ZIcPhaanUrU8yXt1ckXPy+4lpntzYt11vleP3lVWWMaQtVEjYVtgOdMLyZxZ9QF/6TesxcJp6UVs0Z2g+k9OIuq4K36K/Mi8wN/uJvqnnc92GIvg4OvxVF/7w+QvrWMHQ==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y1u7XQOSqzvoVHV5gl1a1RFIJxBMKRnyvPUp+2OuWx/RiOYA9uDPSoUjT28hVSPQvZEjqGi8EAC8kDd8QGLcOIw30J4ihbD8Z1qd9iRTQsC/B6tAOYAltKr7QirmGyMYzKdiGb5oVo/1FgiWHVxueSxozgvRmCYvdNbwUV3KaqZDcmIuthZUlD87mdjJrmIkfFsbhWXQ00dTIwmtSGqVG/Ao/X5Yt0pWssg7AuORbXrXfbmyzR+abSmJWdLGeqHxJtg43kNCsx6sO2MB45zfV6NyI99Yx262TnyokNNWKKbdhAmz9aZLiTnWugQYdmuZRPUC0j+wIAr7mx9h8qM0DnY5re/lFbIYUMqutqUeDRnpipvBvhb43LKwAkzTdG8gnfbTRZE3D8qdO/1W2wOOaqfhAGfxXxNjsmM2uma1bu9wqoQlkg2rLxMyYTJKi8Sy
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:00:22.5562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b26c19ab-711b-482b-32c9-08df419f3940
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P195MB1670

Add overlays for SoM temperature sensors and M.2 Key-E WIFI/BT cards
that need the nxp,88w8987-bt compatible in devicetree (tested on
IW611/IW612).

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  9 ++++++++
 .../imx95-phyflex-fpsc-g-som-temperature.dtso      | 23 +++++++++++++++++++++
 .../imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso | 24 ++++++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4eb7508193e7..17b357f4886a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -739,7 +739,16 @@ imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 
+imx95-phyflex-fpsc-g-som-temperature-dtbs := \
+			  imx95-phyflex-libra-rdk.dtb \
+			  imx95-phyflex-fpsc-g-som-temperature.dtbo
+imx95-phyflex-libra-rdk-bluetooth-88w8987-dtbs := \
+			  imx95-phyflex-libra-rdk.dtb \
+			  imx95-phyflex-libra-rdk-bluetooth-88w8987.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-libra-rdk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-fpsc-g-som-temperature.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-libra-rdk-bluetooth-88w8987.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso
new file mode 100644
index 000000000000..84afe1ff9f06
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+&dram_sense {
+	status = "okay";
+};
+
+&emmc_sense {
+	status = "okay";
+};
+
+&ethphy_sense {
+	status = "okay";
+};
+
+&pmic_sense {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso
new file mode 100644
index 000000000000..1601e04b3940
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2026 PHYTEC Messtechnik GmbH
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&lpuart8 {
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+		fw-init-baudrate = <115200>;
+	};
+};
+
+&gpio_expander1 {
+	uart1_bt_rs_sel: bt-rs-hog {
+		gpios = <14 GPIO_ACTIVE_HIGH>;
+		gpio-hog;
+		line-name = "UART1_BT_RS_SEL";
+		output-high;
+	};
+};

-- 
2.53.0

