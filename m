Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793367197;
	b=XNfVVBlnVoHla2WEwxDSWRcFAFp+3qgoMK6Yr5kf+7ems7hrkfmlPtGq8XC+99dqJ+hH
	 b9hsLeAjvoo+LuQiWGdqUCdUhplU7aUNuST+n+KMLNgYoUR7dPcGkCH7+VNN1/1aKBCje
	 PyVQ1vv6Mfeb99Jjh3nHaI8Gr08baqVcHip3skw62CkEfRVS0Fm6UWrWc0Cs5EVYePuOj
	 UYAj9EDyotRBdxq13ae/XrzeQa787tAxh/M6/DsmBAlLRAKS5Dd/eF4jNzPpPiSYvqqkQ
	 uoUrX5RriJY1rUytzG1tKos+yAuI8f8iQSvJN0TrnrQGmi9V1hET520hW7poQWpkTqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367197;
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
	b=c6XNzovQYXUZdvxwMUvk4pZfI/zupENT+eRwhK4drR8jn2EzFQ87UfGniBlAWfyZG0ux
	 fT4xF1oJpkinCgvzmJrcrIHA5jF0ri7BQlPlYMTXQNQXmBb+WHXsp95vdo7d5RdmPuZIZ
	 IpQ+z3kYQqi5T7SE4SDpqOGc3QqfoNOW41Sut3R9CMHdOOMZFHRLjkX/iUc8BicdyuFkr
	 /P1Ke3kyajcSeZESOEOOkFYrA0vfwSJfrPyYE3NUjyPLaLzfUh59hRKWSRUwBTMSyaG5p
	 QcoyDnGYboQPEbz4QC9gJ8Z4iFeYq39NWkhZ6aOT5A5CfwFXkW0OqzXsbfK6K7qbEbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=Q7efuQPs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.122
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020122.outbound.protection.outlook.com [52.101.69.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E104606A333;
	Fri, 30 Oct 2026 13:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E104606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=Q7efuQPs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cL1FUzwLavYrqOIBM3RSCxC6NCkqZNXf/1X2KgmHlLiIaZTSF/+aKL0dPB84yBbKN/HMZcwou0MkunfTqLJ5WZylzx2PkXRRfbNFONQQUYwi8m+2G1kWQ6SsXBw988pnMAVfQRQGkiATB7cu1+pEwSiMWPtzk1IqX51OUe1WUZBzYtWW6+M6RqgmOS5aF0xaaqWBa838maDlamb39JuIvb2arQsFXKRFvyeHiXJJBkXs6eeoGVydz4AvyqBwNf0yfOI1H5C2mJMPFjMAmPqFxCIEy+lSQFrTYyLlYWNBdS52MExOO14BksRyPBPAQGJp5FXIpjsJO65As3SkSm35rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRsMRcxg8gLnrMdi8No8SfFXmRjf5z621n9f4HF6SJI=;
 b=la/eOB4eZFIgVlTx8By5MBJcQROC0Gm5l2aLgQ91vMjgIDpPaSvXK27OjbGZ78xSkyvRv7cR1I72kh37uA7GCBA9MiH7Sl4c1NqXNNG13s6lEB6fKWyGJLtdJ2AL/eGgMGmvbhTboSSh7rqYc8GzylCuUJ8v6XC5qFrtfZf6/YGo67Nk1ImQMyq0QJmeyGcnCTxGZov6da0UOpE66yDccQ6VVvtuPLxoOSc06k2ReN7IDrl2P7jWNEXUYI6tMCixOpUNVaj5qKb/UzJWAJxyj8tS96ipwW+Giy4Ez2lSzXnQ2ps2l8pM0zjn1Gq76/brhOzw7dl80OLUMq6/S8xZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRsMRcxg8gLnrMdi8No8SfFXmRjf5z621n9f4HF6SJI=;
 b=Q7efuQPs66dh7fsxkFzVuEdwIAol1ZgWgFnoRMTlaQJyOBFnA1eSIPFfldNX5efgPAujWlMEiqSi4XIwQfzCjwSvU4UArm7v0RdRRdYBeuviXpeZW3X3K0grVIp2i5vLMNOIjuZcaFEQC2n7PcgGRswtDZUSKIc8xVVKuxxIbEMCUutuoBJfIZZx/s/Sw2JXYgX/JNSVT+FWgL8xvaEzKABrPhQn8Oxd1QMnd+eQKI18+UEqCYS+lqElRSXz+Ku272RdmQRimdyg/JoxPrG0FKyZr59pmtdqh1U1mFfIprdbuXpJuRbJ2CJQa982u49wbjvdZdOWFiYzPkFTItslEQ==
Received: from DUZPR01CA0318.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::7) by DB9P195MB2107.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:3d8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 13:33:09 +0000
Received: from MA3PEPF00000406.eurprd04.prod.outlook.com
 (2603:10a6:10:4ba:cafe::65) by DUZPR01CA0318.outlook.office365.com
 (2603:10a6:10:4ba::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Fri, 30
 Oct 2026 13:33:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 MA3PEPF00000406.mail.protection.outlook.com (10.167.241.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 13:33:09 +0000
Received: from llp-hahn.hahn.test (172.25.39.126) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 30 Oct
 2026 14:33:06 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Fri, 30 Oct 2026 14:32:45 +0100
Subject: [PATCH 3/5] dts: imx95-phyflex-libra-rdk: Add overlays
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
Message-ID: <20261030-wip-bhahn-imx95_upstreaming-v1-3-1c1cebb5be99@phytec.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793367177; l=2932;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=yyUMmAcS+fsoF4I4KpuQmN3ekfD0a78Q1zK1IHyj3No=;
 b=JvI9HSy+ygqZL1p+BxwGEukXJNzzL0T+y+2tlfeHHuyXZJ3gEmrgyNVkojnX3G2U4MG5+ebGv
 vTUtLV8ZMrMBWuUKuKw+jh+weF/yrvUSWqSnqVypvxbDuyjRs5ZpmnJ
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000406:EE_|DB9P195MB2107:EE_
X-MS-Office365-Filtering-Correlation-Id: 92eb2c57-2c1d-4992-2070-08df368a5694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|11063799006|56012099006|261009223027099003|261021121427099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	YizzbzIfMsvtfIMcKnWlBmnDoT3VL4z3A2j8PNEHmKVao4c7chDMROaUE/inRlaZjBH7yYqzdMEjDq2AxM4Vplz2zA8H3JkWymUYFkNYoa8u1v5SnGuwM6f0LvKCwBsYvCoOoZVlX7hVMroWEOiHjGWNcw81c5bV+wowvpKJ28Ed0jsdkwol1TlqvvyanH05JZuaK6zrPSPuQUmCRnptSf9tbf7dtD2U2V8Yx5g4i7zUnMsWBLAgszHe2PCW6YLa33/g/BCXNxB6+skGWRiwi1F96KnmRo0f2f7zsh053eHUg6XHQF+GXfXDrgqe6qR7vQ+YCvPCrXu3HWyHA5wYdK6pbyHXcPvRp92j42qze5nbMzSk1o4xNfjl8fA8gT/oEucZe7bp9hdUjymeS6KZwD3FDatebHVRHsjHAKveEGtq/dOtKUGb8ssKdOFGR2BIckWtq+xipxgMBZjQNuc1k2sCvOhLIfFNciWNTQL0tOM4IlFlCVvEVvpbpD9QfYLD8b89WBV3vjw4kWiMprqLrQ10kN0cojDpF7Dl/6wUrrlZH55C9GLqDJCptNsv89dJbZu6PzfTSOxNYXExRUDIwUnVa1q6ThjPlpmi3opx0RDeL4dEMvtK2AF4DceC8QpqEboIkcekfYgkeiOrCXtX6Rgm1lbE+UsuvdL1lNWnmaXUy0xQdAYmVvo+tsnZkwx4Uf0qF8Qc+pgINOZL3fj+0g==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6mjsmz6hrOEzqnyaGXOXTAYr32VlefKBNd6y7xXz93Gw/Bnyhq2Lb6epIO4p0+GF85jeNinXQYgDN8ggvnqBIX+Ubl2F01NZXxAgFud397dPxHsEddWBFUQIBCoHgwqQHCccR5i3Y+rxrksoPHo8FcIc4RyH6GWW8HJ9Ehd5cQyU+f9VPYInh/ZuYhAmjuf3MTIIl3KiV/GTcYgnn3HxosAgLJO5RedskxSkn62KIeiA1/vBfUd0byjpa+QNuqbcyyNtYgRenRU2UXV03ZI9RJrp0Cu6W+BNz8KSUndqlz0KV+s95Hp5PJZHWTxud83eMHPWwV5Xp2/S4ynp+4UipxScNhLo/xDMWsDxXHbMZ7uuD++78buvJmwKSfB57kcJ+hLgVkElLAVnzbWxfTHOH9SV3yzXnSSCIsqgAOrJuVFP4pNuXzMfOyNoavwBC2rP
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 13:33:09.4997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92eb2c57-2c1d-4992-2070-08df368a5694
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	MA3PEPF00000406.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB2107

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

