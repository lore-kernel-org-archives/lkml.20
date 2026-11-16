Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794826536;
	b=J4H1qMCAkoSRKCQdNgCHDMwBIf9h9EPFSYrFJPZ+c340g6NYfNmmtVdQ+BWaSe9STby6
	 iPPgJGXXqj4yhjcNPD3wyDpfBUp1U5a7Ah33VN6hYeS/yYRQeXwxhOdeJTe0Sn8ckL6S1
	 kBvawWL7NysA79Dep8+jrViWNTaxsTVHKDlTLiy6RAp3YC9lJA2pfYu1piwBp4SlVj1ar
	 O6XiLJytwOKtg92KkIz237AXoIs2lrriDmAZMtjmAohWkQYF6zKMIUmmUwoDJOXzEnG7o
	 EYIaXdUzLXqzQsdzJLXADA0VsJi8bIxukMghtnPdneiClcdl597g0pPFF2xfB1gNYIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826536;
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
	bh=PgFerp9bYdWHmptPdkU5zXRRqpxLNHurE/UUOjD2YT4=;
	b=E0YVna8Vm9C1irOEVQDuiVfzyVV1yNxdRwDSAM8K2AIjXTxthfYstQ4tWRVpqLvPaoTK
	 FQcsDwF6NbAllZVPJipS33A1fBC2yLkR6DFugyxWaOjOoPSMcYLB+/5G4c/MSI9p7fWpL
	 v5uOt/kt+pUmhY0GJ3fM3V1eF0GVl5eCZBPqfvPkt9aQHX39M13Yy/cDYR1cItt4aKgO1
	 8nGYc4hhLktrOmhWBUeD8rGBQ3u2e7C1Fuw7pxY2QM5bdHvcdW2qv5Jk28ohq07yPhaIG
	 4nLa5G5VTN64LpEKvZaKe22/76lIuaXGsrhss8bLiE/2cUwvWTZeB0YVYIRdQMz9Tdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=GfA58yjv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.131
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020131.outbound.protection.outlook.com [52.101.84.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09330606A33B;
	Mon, 16 Nov 2026 10:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09330606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=GfA58yjv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvcnS10usgmgbm9VNm0VH3IV0PmaMBCMZmrjUivPs7N7M/BVGl5j3ADecP759iyguh0zY1c/9/gn34YSjIJB/Y6L098APDRyaB+7SwX6aV9Y3rT6xNYP7t1wFNntMMtpjRkCHNMlvJbNsSsxjYp6d0UyzeRdz8/76ehjCP9d/yVun7M6MrL7tmXBuMy9/rY6/D55b54rqhyZ+cIZW4b/h7jp5HgS40feoZ3Brhtr+0KX1h7UefvK/shXzQU3sUrQ4pgXnyPVegwGeMNXuQn2oDhwB6pd7Pja+nJsbP9BeWpaaSEKYPsLaIaXQ4fpVX5lQHbkstqZ6ekuQZpTMEOChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgFerp9bYdWHmptPdkU5zXRRqpxLNHurE/UUOjD2YT4=;
 b=kvJd21sqIN/J832Nsee9Bx1p2PSKv1a/k9ahMSDShzFUeeoLdx5jIdLJe8ddZK3JAOE2+4T3wAGhaJPdL3T0c6G55hsv/FzIgBi3qNGNZ9aekwf2lGOnzzuiyFw+j1OeRiUvRHIeipV026ZqvtHCrUdqUWn1tVQ+CcTxWXdKkJd0IBzHO/D3LKulXOKwfPZsdw0ZAGnUZxCDPtUQZWQH23dWZAeNkCRh+vpeiuqchUjldAb4lXnktNgJopicjn740XdQMocsvWe+jgS+3CQUBV7H4Nm6r/YUKRfTltb1YW/eAYpOstYYCkgW2/bcP3GsW7zKqho6NOjjnNo7mvSuWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgFerp9bYdWHmptPdkU5zXRRqpxLNHurE/UUOjD2YT4=;
 b=GfA58yjvXfUifZ29BXdlhP1FDUY6SPncpVmKcZi+40NOkPigxx+8MwiDnmoBRqoxoa5iJEVJir0gs17OACaYJitEZ8iidIiH3WtSBAg7LXteVYpnT5mY3a9YmyztbP5+bAzNfZE8BHuzUxpEPu2heyCm4LQ23zWedhR4i0lxHNwEksi4QwSwWV321ubSp1WYbS5hqmyjTLEGV3r4G4otMTgx8l6Czs5k0JHW7tXFHOb7zGmOqo+mO9T5mWKQO4pbcltdvomhGgCIbaNXDvFTOS0wdtxBPM89bu3bwcjFszFYE88bVAy4/TgmvHy0jm6vt31JT6wQ7Dc39rB+E7Kd+Q==
Received: from DUZPR01CA0257.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::29) by GV2PPF563CA1DD0.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:158:401::8d0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 16 Nov
 2026 10:55:29 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::6b) by DUZPR01CA0257.outlook.office365.com
 (2603:10a6:10:4b5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 10:55:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:55:29 +0000
Received: from [192.168.2.225] (172.25.39.168) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 16 Nov
 2026 11:55:27 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Mon, 16 Nov 2026 11:54:41 +0100
Subject: [PATCH 2/5] arm64: dts: Add phyFLEX-Libra i.MX 8M Plus FPSC
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
Message-ID: <20261116-imx8mp-phyflex-v1-2-4adcf8b4d373@phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
In-Reply-To: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: Benjamin Hahn <b.hahn@phytec.de>, Christian Hemp <C.Hemp@phytec.de>, "Jan
 Remmet" <j.remmet@phytec.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Yannic
 Moog" <y.moog@phytec.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794826527; l=39042;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=7qSVVKJU/xjWfMjX4VLo9R3owpCLIU8XOpQgCYZlIaw=;
 b=Td2MPqnpsXPcTSQRnQUvThWxtvEby+vcNU6T88Jx6AgYmjZfx4aISx2XwKSaLr4oTS5Uw135N
 +Mseps7awRKAb8UgTW5L79shecls7Dz3hf0zSB8pvD8WfUIFQdbPJkr
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|GV2PPF563CA1DD0:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e225fc4-d35a-474a-03f4-08df43d020f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|82310400026|1800799024|56012099006|11063799006|261026121527099003|261021130227099003|261009223027099003|261021121427099003|261022113327099003|261021135927099003|261022105027099003|261009221227099003|261026130827099003|261026135527099003|261021123027099003|261022115727099003|261022075727099003|261021133027099003|261026140227099003|261028144727099003|261102123227099003|18002099003|22082099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	sSkE5UQbVjgzlWeySbrw9RKssODq4vf3BBbVkVw6E4KN/Vt3q4vTo93HfV2vH3s/GMI1SGH0WZwyV5/7oEEE58DzVcobyR4tQiL2giJj5dpZn7wVplUxFzRubF/FC9y1lJrozbvZcLfqqz52KUwmlr+sWQHVtUhsmjiY+bwzhVNQldz/BvUkSXmoY37OuJKqeUYq59IvQ9J4nuFD6ZefEmTDyTvZJc9qf6H+ZH6Ne2THZyUm9ZBYlFGX4Kja4Yafn0WHqv1hXGD6rgYBKkjeSv3j0nhIc31ZjiVDlgaF/nKnQLtm9mkIKvexU0JUXW7VsYpp5KMvFb4gbIAsWZkf5peIE965Ykr5pNdtmpLJfzKijSqWOvTkW0ybY+zrdI7yavX/WUVOats1dFg9KC5WAhldDsv44c400vXdvMv/UeNpZAEB11MgjXLE2HUxuq0/K/CJJ/oVFzL0ImPTGwTOgqKXPm4CZdaGO+Gw62vaK+GdfOt+DZwjcgCUCQYzlMX36t6ZvaX9U7lfskTaqpiNI7SV9rDYVBjZ+EJAqx+TWaefPCtCI/BI/7+mKmLBA8R6gTEp12B7HtbntTLYPSbdAyUIVYp+FCyAQiCmoqbXuM4zBnOBDwCI8ep1wrkT6QeXEO4oqUP8VeE0Lku5VWOhu6ei9DD7LAT9BzKUOlNwpPEhNS8DEY6ZkKDqPB6jL9p7
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(82310400026)(1800799024)(56012099006)(11063799006)(261026121527099003)(261021130227099003)(261009223027099003)(261021121427099003)(261022113327099003)(261021135927099003)(261022105027099003)(261009221227099003)(261026130827099003)(261026135527099003)(261021123027099003)(261022115727099003)(261022075727099003)(261021133027099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(3023799007)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l+ayU/m1XKk8lwt4VEDJtWtcVZA39leDGy8cKvwTD/OiZEB1N/fhjBIxfIYzRQ2Qf0dPhqNiZGIBmiDrC0LWhuy1CgQ0na5R+o1FJLejWjyHOf1ApF0E9ZX4qiw5BvbZGCGO6mx5/qCEL4qz9QjfcEV7QENYRfsfPdV9LdCIRDfhotdexJh1QL7yiwO4s6gXkkDbFA4+3ROYxN7JEggNfgm70p4sFKeTz+22jP657l/MhobeO5AiuTUMypoM4dyPMdkoMmmvRifOHauUsMcQPMTIPHroQi3abRuSaZxFbVnkj8WkufEfynrBUOMpwv2KQ3y/KHQcCPkjBaR4D2JQHAlxgdRoI5ecowoDdxOt8SlIilCr6pfD0mUjxLKUdnNZqXiFt8L1LYm7xJwqQERF5E7W4eO+dMjswDheKlMnO+G94to153ahKeUVr0mXeY6J
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:55:29.4359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e225fc4-d35a-474a-03f4-08df43d020f4
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PPF563CA1DD0

phyFLEX-Libra is the successor to phyCORE-Libra i.MX 8M Plus. It has
gone through a rename and extensive baseboard changes from revision
1618.1 to 1618.2.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../dts/freescale/imx8mp-phyflex-fpsc-g-som.dtsi   | 858 +++++++++++++++++++++
 .../dts/freescale/imx8mp-phyflex-libra-rdk.dts     | 604 +++++++++++++++
 3 files changed, 1463 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf5..c716beaefbf09 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -468,6 +468,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-ph128800t006.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk-no-eth.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-wlbt.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyflex-libra-rdk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-prt8ml.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-basic.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-hdmi.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyflex-fpsc-g-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-fpsc-g-som.dtsi
new file mode 100644
index 0000000000000..384a19743b15f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-fpsc-g-som.dtsi
@@ -0,0 +1,858 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+#include <dt-bindings/net/ti-dp83867.h>
+#include "imx8mp.dtsi"
+
+/ {
+	compatible = "phytec,imx8mp-phyflex-fpsc-g", "fsl,imx8mp";
+	model = "PHYTEC phyFLEX-i.MX8MP FPSC";
+
+	aliases {
+		rtc0 = &rv3028;
+		rtc1 = &snvs_rtc;
+		/delete-property/ ethernet0;
+		ethernet1 = &fec;
+		ethernet2 = &eqos;
+		/delete-property/ i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c5;
+		i2c5 = &i2c6;
+		/delete-property/ serial0;
+		serial1 = &uart3;
+		serial2 = &uart2;
+		serial3 = &uart4;
+		spi1 = &ecspi1;
+		spi2 = &ecspi2;
+		spi3 = &ecspi3;
+		usb1 = &usb3_0;
+		usb2 = &usb3_1;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0x0 0x80000000>;
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
+		startup-delay-us = <100>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		bootph-all;
+	};
+
+	reg_vdd_io: regulator-vdd-io {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "VDD_IO";
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_1 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_2 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_3 {
+	cpu-supply = <&buck2>;
+};
+
+&ecspi1 { /* FPSC SPI1 */
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	pinctrl-names = "default";
+};
+
+&ecspi2 { /* FPSC SPI2 */
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	pinctrl-names = "default";
+};
+
+&ecspi3 { /* FPSC SPI3 */
+	pinctrl-0 = <&pinctrl_ecspi3>;
+	pinctrl-names = "default";
+};
+
+&eqos { /* FPSC RGMII2 */
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-names = "default";
+};
+
+&fec { /* FPSC GB_ETH1 */
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_fec>;
+	pinctrl-names = "default";
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			interrupt-parent = <&gpio4>;
+			interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+			enet-phy-lane-no-swap;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,min-output-impedance;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		};
+	};
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
+&flexspi { /* FPSC QSPI */
+	pinctrl-0 = <&pinctrl_flexspi>;
+	pinctrl-names = "default";
+};
+
+&gpio1 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "PCIE1_nPERST";
+	bootph-all;
+};
+
+&gpio2 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "SD2_RESET_B";
+	bootph-all;
+};
+
+&gpio3 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "I2C6_SCL",
+			  "I2C6_SDA", "I2C5_SCL";
+	bootph-all;
+};
+
+&gpio4 { /* FPSC GPIO */
+	gpio-line-names = "GPIO6", "RGMII2_nINT", "GPIO7", "GPIO4", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "X_PMIC_IRQ_B", "",
+			  "", "GPIO5", "", "", "RGMII2_EVENT_OUT",
+			  "", "", "RGMII2_EVENT_IN";
+	pinctrl-0 = <&pinctrl_gpio4>;
+	pinctrl-names = "default";
+	bootph-all;
+};
+
+&gpio5 { /* FPSC GPIO */
+	gpio-line-names = "", "", "", "", "I2C5_SDA",
+			  "GPIO1", "", "", "", "SPI1_CS",
+			  "", "", "", "SPI2_CS", "I2C1_SCL",
+			  "I2C1_SDA", "I2C2_SCL", "I2C2_SDA", "I2C3_SCL", "I2C3_SDA",
+			  "", "GPIO2", "", "", "SPI3_CS",
+			  "", "GPIO3";
+	pinctrl-0 = <&pinctrl_gpio5>;
+	pinctrl-names = "default";
+	bootph-all;
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+};
+
+&i2c1 { /* FPSC I2C1 */
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	pinctrl-names = "default", "gpio";
+	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	bootph-all;
+	status = "okay";
+
+	pmic: pmic@25 {
+		compatible = "nxp,pca9450c";
+		reg = <0x25>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_pmic>;
+		pinctrl-names = "default";
+		bootph-all;
+
+		regulators {
+			bootph-all;
+
+			buck1: BUCK1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <950000>;
+				regulator-min-microvolt = <850000>;
+				regulator-name = "VDD_SOC (BUCK1)";
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1000000>;
+				regulator-min-microvolt = <850000>;
+				regulator-name = "VDD_ARM (BUCK2)";
+				regulator-ramp-delay = <3125>;
+				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-standby-voltage = <850000>;
+			};
+
+			buck4: BUCK4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "VDD_3V3 (BUCK4)";
+			};
+
+			buck5: BUCK5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "VDD_1V8 (BUCK5)";
+			};
+
+			buck6: BUCK6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1155000>;
+				regulator-min-microvolt = <1045000>;
+				regulator-name = "NVCC_DRAM_1V1 (BUCK6)";
+			};
+
+			ldo1: LDO1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "NVCC_SNVS_1V8 (LDO1)";
+			};
+
+			ldo3: LDO3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "VDDA_1V8 (LDO3)";
+			};
+
+			ldo5: LDO5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "NVCC_SD2 (LDO5)";
+			};
+		};
+	};
+
+	/* User EEPROM */
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+		pagesize = <32>;
+		vcc-supply = <&reg_vdd_io>;
+	};
+
+	/* factory EEPROM */
+	eeprom@51 {
+		compatible = "atmel,24c32";
+		reg = <0x51>;
+		pagesize = <32>;
+		read-only;
+		vcc-supply = <&reg_vdd_io>;
+	};
+
+	/* User EEPROM ID page */
+	eeprom@58 {
+		compatible = "atmel,24c32";
+		reg = <0x58>;
+		pagesize = <32>;
+		vcc-supply = <&reg_vdd_io>;
+	};
+
+	rv3028: rtc@52 {
+		compatible = "microcrystal,rv3028";
+		reg = <0x52>;
+		#clock-cells = <0>;
+	};
+};
+
+&i2c2 { /* FPSC I2C2 */
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	pinctrl-names = "default", "gpio";
+	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+};
+
+&i2c3 { /* FPSC I2C3 */
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	pinctrl-names = "default", "gpio";
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+};
+
+&i2c5 { /* FPSC I2C4 */
+	pinctrl-0 = <&pinctrl_i2c5>;
+	pinctrl-1 = <&pinctrl_i2c5_gpio>;
+	pinctrl-names = "default", "gpio";
+	scl-gpios = <&gpio3 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+};
+
+&i2c6 { /* FPSC I2C5 */
+	pinctrl-0 = <&pinctrl_i2c6>;
+	pinctrl-1 = <&pinctrl_i2c6_gpio>;
+	pinctrl-names = "default", "gpio";
+	scl-gpios = <&gpio3 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio3 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+};
+
+&iomuxc {
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK   0x82    /* SPI1_SCLK */
+			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI   0x82    /* SPI1_MOSI */
+			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO   0x82    /* SPI1_MISO */
+			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09     0x106   /* SPI1_CS */
+		>;
+	};
+
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK   0x82    /* SPI2_SCLK */
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI   0x82    /* SPI2_MOSI */
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO   0x82    /* SPI2_MISO */
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13     0x106     /* SPI2_CS */
+		>;
+	};
+
+	pinctrl_ecspi3: ecspi3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__ECSPI3_SCLK     0x82    /* SPI3_SCLK */
+			MX8MP_IOMUXC_UART1_TXD__ECSPI3_MOSI     0x82    /* SPI3_MOSI */
+			MX8MP_IOMUXC_UART2_RXD__ECSPI3_MISO     0x82    /* SPI3_MISO */
+			MX8MP_IOMUXC_UART2_RXD__GPIO5_IO24      0x106     /* SPI3_CS */
+		>;
+	};
+
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXC__GPIO4_IO01				0x10	/* RGMII2_nINT */
+			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27				0x10	/* RGMII2_EVENT_IN */
+			MX8MP_IOMUXC_SAI2_TXFS__GPIO4_IO24				0x10	/* RGMII2_EVENT_OUT */
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2	/* RGMII2_MDIO */
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2	/* RGMII2_MDC */
+			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x12	/* RGMII2_TX_D3 */
+			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x12	/* RGMII2_TX_D2 */
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x12	/* RGMII2_TX_D1 */
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x12	/* RGMII2_TX_D0 */
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x12	/* RGMII2_TX_CTL */
+			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x12	/* RGMII2_TXC */
+			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x90	/* RGMII2_RX_D3 */
+			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x90	/* RGMII2_RX_D2 */
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x90	/* RGMII2_RX_D1 */
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x90	/* RGMII2_RX_D0 */
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x90	/* RGMII2_RX_CTL */
+			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90	/* RGMII2_RXC */
+		>;
+	};
+
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD2__ENET1_MDC		0x2
+			MX8MP_IOMUXC_SAI1_RXD3__ENET1_MDIO		0x2
+			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0		0x90
+			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1		0x90
+			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2		0x90
+			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3		0x90
+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19		0x140
+			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC		0x90
+			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0		0x12
+			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1		0x12
+			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2		0x14
+			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3		0x14
+			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL	0x14
+			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC		0x14
+			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL	0x90
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_RXC__CAN1_TX		0x150   /* CAN1_TX */
+			MX8MP_IOMUXC_SAI2_TXC__CAN1_RX		0x154   /* CAN1_RX */
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_TXD0__CAN2_TX		0x150   /* CAN2_TX */
+			MX8MP_IOMUXC_UART3_TXD__CAN2_RX		0x154   /* CAN2_RX */
+		>;
+	};
+
+	pinctrl_flexspi: flexspigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_CE0_B__FLEXSPI_A_SS0_B	0x82	/* QSPI_CE */
+			MX8MP_IOMUXC_NAND_ALE__FLEXSPI_A_SCLK		0x1c2	/* QSPI_CLK */
+			MX8MP_IOMUXC_NAND_DATA00__FLEXSPI_A_DATA00	0x82	/* QSPI_DATA_0 */
+			MX8MP_IOMUXC_NAND_DATA01__FLEXSPI_A_DATA01	0x82	/* QSPI_DATA_1 */
+			MX8MP_IOMUXC_NAND_DATA02__FLEXSPI_A_DATA02	0x82	/* QSPI_DATA_2 */
+			MX8MP_IOMUXC_NAND_DATA03__FLEXSPI_A_DATA03	0x82	/* QSPI_DATA_3 */
+			MX8MP_IOMUXC_NAND_DQS__FLEXSPI_A_DQS		0x82	/* QSPI_DQS */
+		>;
+	};
+
+	pinctrl_gpio4: gpio4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03	0x40	/* GPIO4 */
+			MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21	0x106	/* GPIO5 */
+			MX8MP_IOMUXC_SAI1_RXFS__GPIO4_IO00	0x106	/* GPIO6 */
+			MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02	0x106	/* GPIO7 */
+		>;
+	};
+
+	pinctrl_gpio5: gpio5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05	0x106	/* GPIO1 */
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21	0x106	/* GPIO2 */
+			MX8MP_IOMUXC_UART3_RXD__GPIO5_IO26	0x106	/* GPIO3 */
+		>;
+	};
+
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x19	/* HDMI_CEC */
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x1c3	/* HDMI_SCL */
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x1c3	/* HDMI_SDA */
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x19	/* HDMI_HPD */
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		bootph-all;
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA	 0x400001c2      /* I2C1_SDA_DNU */
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL	 0x400001c2      /* I2C1_SCL_DNU */
+		>;
+	};
+
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15	0x1e2
+			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14	0x1e2
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA	 0x400001c2      /* I2C2_SDA */
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL	 0x400001c2      /* I2C2_SCL */
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17	0x1e2
+			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16	0x1e2
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA	 0x400001c2      /* I2C3_SDA */
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL	 0x400001c2      /* I2C3_SCL */
+		>;
+	};
+
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19	0x1e2
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18	0x1e2
+		>;
+	};
+
+	pinctrl_i2c5: i2c5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA	 0x400001c2      /* I2C4_SDA */
+			MX8MP_IOMUXC_SAI5_RXD0__I2C5_SCL	0x400001c2      /* I2C4_SCL */
+		>;
+	};
+
+	pinctrl_i2c5_gpio: i2c5gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04	0x1e2
+			MX8MP_IOMUXC_SAI5_RXD0__GPIO3_IO21	0x1e2
+		>;
+	};
+
+	pinctrl_i2c6: i2c6grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA	 0x400001c2      /* I2C5_SDA */
+			MX8MP_IOMUXC_SAI5_RXFS__I2C6_SCL	0x400001c2      /* I2C5_SCL */
+		>;
+	};
+
+	pinctrl_i2c6_gpio: i2c6gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXC__GPIO3_IO20	0x1e2
+			MX8MP_IOMUXC_SAI5_RXFS__GPIO3_IO19	0x1e2
+		>;
+	};
+
+	pinctrl_pcie0: pcie0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__PCIE_CLKREQ_B	0x10	/* PCIE1_nCLKREQ */
+			MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08     0x40	/* PCIE1_nPERST */
+		>;
+	};
+
+	pinctrl_pmic: pmicgrp {
+		bootph-all;
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18	0x140
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO01__PWM1_OUT	0x106	/* PWM1 */
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO09__PWM2_OUT	0x106	/* PWM2 */
+		>;
+	};
+
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__PWM3_OUT		0x106	/* PWM3 */
+		>;
+	};
+
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_MCLK__PWM4_OUT	0x106	/* PWM4 */
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		bootph-all;
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19    0x40
+		>;
+	};
+
+	pinctrl_sai5: sai5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_MCLK__AUDIOMIX_SAI5_MCLK	0xd6	/* SAI1_MCLK */
+			MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI5_RX_SYNC	0xd6	/* SAI1_RX_SYNC */
+			MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_SAI5_RX_BCLK	0xd6	/* SAI1_RX_BCLK */
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI5_RX_DATA00	0xd6	/* SAI1_RX_DATA */
+			MX8MP_IOMUXC_SAI5_RXD1__AUDIOMIX_SAI5_TX_SYNC	0xd6	/* SAI1_TX_SYNC */
+			MX8MP_IOMUXC_SAI5_RXD2__AUDIOMIX_SAI5_TX_BCLK	0xd6	/* SAI1_TX_BCLK */
+			MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI5_TX_DATA00	0xd6	/* SAI1_TX_DATA */
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_TXC__UART2_DTE_RX	0x140	/* UART2_RXD */
+			MX8MP_IOMUXC_SAI3_TXFS__UART2_DTE_TX	0x140	/* UART2_TXD */
+			MX8MP_IOMUXC_SD1_DATA5__UART2_DTE_RTS	0x140	/* UART2_RTS */
+			MX8MP_IOMUXC_SD1_DATA4__UART2_DTE_CTS	0x140	/* UART2_CTS */
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA6__UART3_DTE_RX	0x140	/* UART1_RXD */
+			MX8MP_IOMUXC_SD1_DATA7__UART3_DTE_TX	0x140	/* UART1_TXD */
+			MX8MP_IOMUXC_SD1_RESET_B__UART3_DTE_CTS	0x140	/* UART1_RTS */
+			MX8MP_IOMUXC_SD1_STROBE__UART3_DTE_RTS	0x140	/* UART1_CTS */
+		>;
+	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX	0x140	/* UART3_RXD */
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX	0x140	/* UART3_TXD */
+		>;
+	};
+
+	pinctrl_usb0: usb0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR	0x106	/* USB1_PWR_EN */
+			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x106	/* USB1_OC */
+			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10	0x106	/* USB1_ID */
+		>;
+	};
+
+	pinctrl_usb1: usb1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x106	/* USB2_PWR_EN */
+			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC	0x106	/* USB2_OC */
+			MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID	0x106	/* USB2_ID */
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO07__USDHC1_WP	0x106	/* SDIO_WP */
+			MX8MP_IOMUXC_GPIO1_IO06__USDHC1_CD_B	0x106	/* SDIO_CD */
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x106	/* SDIO_CLK */
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x106	/* SDIO_CLK */
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x106	/* SDIO_DATA0 */
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x106	/* SDIO_DATA1 */
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x106	/* SDIO_DATA2 */
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x106	/* SDIO_DATA3 */
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		bootph-pre-ram;
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B	0x40	/* SDCARD_CD */
+			MX8MP_IOMUXC_SD2_WP__USDHC2_WP		0x40	/* SDCARD_WP */
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190	/* SDCARD_CLK */
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0	/* SDCARD_CMD */
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0	/* SDCARD_DATA0 */
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0	/* SDCARD_DATA1 */
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0	/* SDCARD_DATA2 */
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0	/* SDCARD_DATA3 */
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B	0x40	/* SDCARD_CD */
+			MX8MP_IOMUXC_SD2_WP__USDHC2_WP		0x40	/* SDCARD_WP */
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194	/* SDCARD_CLK */
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4	/* SDCARD_CMD */
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4	/* SDCARD_DATA0 */
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4	/* SDCARD_DATA1 */
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4	/* SDCARD_DATA2 */
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4	/* SDCARD_DATA3 */
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B	0x40	/* SDCARD_CD */
+			MX8MP_IOMUXC_SD2_WP__USDHC2_WP		0x40	/* SDCARD_WP */
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194	/* SDCARD_CLK */
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0	/* SDCARD_CMD */
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4	/* SDCARD_DATA0 */
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4	/* SDCARD_DATA1 */
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4	/* SDCARD_DATA2 */
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4	/* SDCARD_DATA3 */
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		bootph-all;
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x190
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x194
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d4
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d4
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d4
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d4
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d4
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d4
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d4
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d4
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		bootph-all;
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B	0xe6
+		>;
+	};
+};
+
+&mipi_dsi {
+	vddcore-supply = <&buck1>;
+	vddio-supply = <&buck5>;
+};
+
+&pcie { /* FPSC PCIE1 */
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+};
+
+&pwm1 { /* FPSC PWM1 */
+	pinctrl-0 = <&pinctrl_pwm1>;
+	pinctrl-names = "default";
+};
+
+&pwm2 { /* FPSC PWM2 */
+	pinctrl-0 = <&pinctrl_pwm2>;
+	pinctrl-names = "default";
+};
+
+&pwm3 { /* FPSC PWM3 */
+	pinctrl-0 = <&pinctrl_pwm3>;
+	pinctrl-names = "default";
+};
+
+&pwm4 { /* FPSC PWM4 */
+	pinctrl-0 = <&pinctrl_pwm4>;
+	pinctrl-names = "default";
+};
+
+&sai5 { /* FPSC SAI1 */
+	pinctrl-0 = <&pinctrl_sai5>;
+	pinctrl-names = "default";
+};
+
+&uart2 { /* FPSC UART2 */
+	pinctrl-0 = <&pinctrl_uart2>;
+	pinctrl-names = "default";
+	fsl,dte-mode;
+};
+
+&uart3 { /* FPSC UART1 */
+	pinctrl-0 = <&pinctrl_uart3>;
+	pinctrl-names = "default";
+	fsl,dte-mode;
+};
+
+&uart4 { /* FPSC UART3 */
+	pinctrl-0 = <&pinctrl_uart4>;
+	pinctrl-names = "default";
+};
+
+&usb3_0 { /* FPSC USB1 */
+	pinctrl-0 = <&pinctrl_usb0>;
+	pinctrl-names = "default";
+	fsl,over-current-active-low;
+};
+
+&usb3_1 { /* FPSC USB2 */
+	pinctrl-0 = <&pinctrl_usb1>;
+	pinctrl-names = "default";
+	fsl,over-current-active-low;
+};
+
+&usdhc1 { /* FPSC SDIO */
+	no-mmc-hs400;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-names = "default";
+};
+
+&usdhc2 { /* FPSC SDCARD */
+	no-mmc-hs400;
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	sd-uhs-sdr104;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&ldo5>;
+	bootph-all;
+};
+
+/* eMMC */
+&usdhc3 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC3_ROOT>;
+	assigned-clock-rates = <400000000>;
+	bus-width = <8>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	bootph-all;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-0 = <&pinctrl_wdog>;
+	pinctrl-names = "default";
+	bootph-all;
+	fsl,ext-reset-output;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk.dts
new file mode 100644
index 0000000000000..7ebedbcba7c67
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk.dts
@@ -0,0 +1,604 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+#include <dt-bindings/pwm/pwm.h>
+#include "imx8mp-phyflex-fpsc-g-som.dtsi"
+
+/ {
+	compatible = "phytec,imx8mp-phyflex-libra-rdk",
+		     "phytec,imx8mp-phyflex-fpsc-g", "fsl,imx8mp";
+	model = "PHYTEC Libra phyFLEX-i.MX8MP FPSC";
+
+	chosen {
+		stdout-path = &uart4;
+	};
+
+	backlight_lvds: backlight-lvds {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_vdd_12v0>;
+		status = "disabled";
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
+
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
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		hdmi-pwr-supply = <&reg_vdd_5v0_hdmi_out>;
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
+	m2-key-e-connector {
+		compatible = "pcie-m2-e-connector";
+		clocks = <&rv3028>;
+		i2c-parent = <&i2c3>;
+		sdio-reset-gpios = <&gpio_expander2 6 GPIO_ACTIVE_LOW>;
+		sdio-wake-gpios = <&gpio_expander2 5 GPIO_ACTIVE_LOW>;
+		uart-wake-gpios = <&gpio_expander1 13 GPIO_ACTIVE_LOW>;
+		vpcie3v3-supply = <&reg_vdd_3v3>;
+		w-disable1-gpios = <&gpio_expander1 9 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&gpio_expander1 10 GPIO_ACTIVE_LOW>;
+	};
+
+	/* RTC (rv3028) clock is used by default */
+	m2_suspend_clk: oscillator-suspend {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768000>;
+		status = "disabled";
+	};
+
+	panel_lvds1: panel-lvds1 {	/* FPSC LVDS1 */
+		/* compatible panel in overlay */
+		backlight = <&backlight_lvds>;
+		power-supply = <&reg_vdd_3v3>;
+		status = "disabled";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		interrupt-parent = <&gpio5>;
+		interrupts = <21 IRQ_TYPE_EDGE_RISING>;
+		#cooling-cells = <2>;
+		cooling-levels = <0 128 255>;
+		fan-supply = <&reg_vdd_5v0>;
+		pwms = <&pwm2 0 86958 0>;
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
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "VDD_5V0";
+	};
+
+	reg_vdd_5v0_hdmi_out: regulator-vdd-5v0-hdmi-out {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio_expander2 7 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "VDD_5V0_HDMI_OUT";
+	};
+
+	reg_vdd_5v0_ref: regulator-vdd-5v0-ref {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "VDD_5V0_REF";
+	};
+
+	reg_vdd_vbus: regulator-vdd-vbus {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "VDD_VBUS_C";
+	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+
+};
+
+&{/thermal-zones/soc-thermal/trips/} {
+	atrip2: trip2 {
+		temperature = <55000>;
+		hysteresis = <2000>;
+		type = "active";
+	};
+
+	atrip3: trip3 {
+		temperature = <75000>;
+		hysteresis = <2000>;
+		type = "active";
+	};
+};
+
+&{/thermal-zones/soc-thermal/cooling-maps/} {
+	map1 {
+		trip = <&atrip2>;
+		cooling-device = <&fan 0 1>;
+	};
+
+	map2 {
+		trip = <&atrip3>;
+		cooling-device = <&fan 1 2>;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&eqos {
+	phy-handle = <&ethphy1>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0x1>;
+			enet-phy-lane-no-swap;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
+		};
+	};
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
+&ecspi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	num-cs = <1>;
+	status = "okay";
+
+	adc@0 {
+		compatible = "microchip,mcp3208";
+		reg = <0>;
+		vref-supply = <&reg_vdd_5v0_ref>;
+		#io-channel-cells = <1>;
+	};
+};
+
+&ecspi2 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <22500000>;
+	};
+};
+
+&flexspi {
+	status = "okay";
+
+	spi_nor: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <90000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		vcc-supply = <&reg_vdd_1v8>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			/* Partitions handled by Bootloader */
+		};
+	};
+};
+
+&gpio5 {
+	gpio-line-names = "", "", "", "", "I2C5_SDA",
+			  "GPIO1", "", "", "", "SPI1_CS",
+			  "", "", "", "SPI2_CS", "I2C1_SCL",
+			  "I2C1_SDA", "I2C2_SCL", "I2C2_SDA", "I2C3_SCL", "I2C3_SDA",
+			  "", "GPIO2", "", "", "SPI3_CS",
+			  "", "GPIO3";
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	status = "okay";
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
+
+	gpio_expander1: gpio@21 {
+		compatible = "ti,tcal6416";
+		reg = <0x21>;
+		interrupt-controller;
+		interrupt-parent = <&gpio5>;
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+		#interrupt-cells = <2>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names = "VCONN_nFAULT", "CSI1_CTRL1", "CSI1_CTRL3",
+				  "CSI1_CTRL4", "USB-C_nINT/AUDIO_AC",
+				  "CSI2_CTRL1", "CSI2_CTRL3", "CSI2_CTRL4",
+				  "CLK_EN_AV", "W_nDISABLE1", "W_nDISABLE2",
+				  "PCIE1_nWAKE", "NC", "UART1_nWAKE",
+				  "UART1_BT_RS_SEL", "UART1_RS232_485_SEL";
+
+		vcc-supply = <&reg_vdd_1v8>;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	gpio_expander2: gpio@21 {
+		compatible = "ti,tcal6416";
+		reg = <0x21>;
+		interrupt-controller;
+		interrupt-parent = <&gpio4>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "CAN1_STBY", "CAN2_STBY", "NC",
+				  "KEY-E_nALERT", "NC", "SDIO_nWAKE",
+				  "SDIO_nRESET", "HDMI_EN", "RTC_nINT",
+				  "LVDS1_BL_EN", "NC", "NC", "NC", "NC",
+				  "NC", "NC";
+
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
+		id-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio_expander1>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+
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
+
+			port@2 {
+				reg = <2>;
+				hd3ss3220_orientation_switch: endpoint {
+					remote-endpoint = <&usb_phy_orientation_switch>;
+				};
+			};
+		};
+	};
+};
+
+&lcdif3 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel0_in>;
+			};
+		};
+	};
+};
+
+/* M.2 PCIe */
+&pcie0 {
+	external-facing;
+	reset-gpio = <&gpio1 8 GPIO_ACTIVE_LOW>;
+	supports-clkreq;
+	vpcie-supply = <&reg_vdd_3v3>;
+	wake-gpios = <&gpio_expander1 11 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&hsio_blk_ctrl>;
+	clock-names = "ref";
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
+
+&pinctrl_uart4 {
+	bootph-all;
+};
+
+&pwm2 {
+	status = "okay";
+};
+
+&reg_vdd_io {
+	regulator-max-microvolt = <1800000>;
+	regulator-min-microvolt = <1800000>;
+};
+
+&rv3028 {
+	interrupt-parent = <&gpio_expander2>;
+	interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+	aux-voltage-chargeable = <1>;
+	trickle-resistor-ohms = <3000>;
+	wakeup-source;
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+/* RS232/RS485/BT */
+&uart3 {
+	uart-has-rtscts;
+	status = "okay";
+};
+
+/* debug console */
+&uart4 {
+	bootph-all;
+	status = "okay";
+};
+
+/* USB1 Type-C */
+&usb3_phy0 {
+	orientation-switch;
+	vbus-supply = <&reg_vdd_vbus>;
+	status = "okay";
+
+	port {
+		usb_phy_orientation_switch: endpoint {
+			remote-endpoint = <&hd3ss3220_orientation_switch>;
+		};
+	};
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
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
+
+		port@1 {
+			reg = <1>;
+			usb3_role_switch: endpoint {
+				remote-endpoint = <&hd3ss3220_out_ep>;
+			};
+		};
+	};
+};
+
+/* USB2 4-port USB3.0 HUB */
+&usb3_phy1 {
+	vbus-supply = <&reg_vdd_5v0>;
+	status = "okay";
+};
+
+&usb3_1 {
+	fsl,permanently-attached;
+	fsl,disable-port-power-control;
+	status = "okay";
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usdhc1 {
+	bus-width = <4>;
+	status = "okay";
+};
+
+/* SD-Card */
+&usdhc2 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
+	assigned-clock-rates = <200000000>;
+	bus-width = <4>;
+	disable-wp;
+	status = "okay";
+};

-- 
2.43.0

