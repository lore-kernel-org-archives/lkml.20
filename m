Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.133
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793607678;
	b=q9GoBSvXgJs2c5PgpBSFtk+Qa6tCegk+QFV7Bw/rhEtAFeD96v2XPMv0lXzCjZ7d6EX6
	 kSPrlkOUcAFkkuh3gkO1GCVZr7naZfgvT6w+7l+XuduaCxgKd1UYm9a+eFwBgfoxweTPB
	 x0puxwvQz6rGfaM7yOQZEde4nefstvkXIt9zxcXF6G+zd/J+h6kRZj6z0EUpKU7nNMp9Z
	 DB8iZXTI8jivviQ3w6zqCdelktxrMwchq05tryaaPSTkjS131AfDHhPfVCCXEhYRGKbOM
	 K+y9e8iz8fkNnRpMWGcCcx3DYJ1PsVpdSXN6fB5xRTuspzBShUgEiT92yla6HGZh5NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607678;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=TALd2tD3KaCkVwTSjviOuKEa/hjB+/91eq4eMjUUc0U=;
	b=GnqW1D1w65CyYrHL8n+UkzKHLHZAmFdP5KBax8X0lh3F/lE1eYTaMsA0Bpc1Cffvvenw
	 DbE5FdLlvyBmpnYRKRtD6YeHNIgOmyuGmTBKOua3BbFKFqb929fFht4fAkkdqv5fwEEI8
	 mW853Kpqs540JVatXDFlr8AZjqAg1823p2py1vzXC9F9FkD35hKIBLtkU5BcMNv+xtur7
	 QTJ+KkWrSOmy4mzhvbkG8f1kWxgDvKvjOWxL60lNGYeTHkAaqyCA7gjBZ307oAQYnFUDH
	 wnaoKuLGEKheALNlZs7ch1S7oeuiKEAwHVLSFHcSc0KQiSjPF0g5gVYRcvT3x/jY9kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.133
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023133.outbound.protection.outlook.com [52.101.127.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3EF606A334;
	Mon,  2 Nov 2026 08:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C3EF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iyh7e8Ex05BLZcW7ETCKpA344C/MlG6Ovhz4Z+IrF3F7bzazw2cMHRaln9UJol0LGa0Evr08FlP88vig4lPI97BcU3sTyKhn0URItmsCeU4B9czska9nbHmGyirfV51TfF3P2Ls7p9pxCZAYhRuqslpGe1i2CzqJoqsT4RXPxZtyI5oGRRqMLMeLOf2ePNOq2assLdaAzgT6w9dhN9rUZfKrJ2a5K94SyojJuD3Ot0utqN+8B66D0+Fw/uEiRl1c7mAo88g6VAJ2AjljzA6ay6OyVvY0l+Lisqsg+Nnfy6KZYLJkM3DgoY8naDPTkuTU+9Ru/+GtXq+5iD0Ybzszxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TALd2tD3KaCkVwTSjviOuKEa/hjB+/91eq4eMjUUc0U=;
 b=YJTZA+oB9yovakfZIluQ9P2paeQ8gzY6k/7acosiKcuybwWJcPebGMZvl0dH/6e66LN/aiRkIBIMPJ4OxHzNPbCjmcdgJorFaTltzKr42At4MW67p3EH+Z2qVPgt9DAV8nEoPzQ+D1tskWrfh64VCjchJvEaT7U3hClRvmsaMzahG4J8OsZ6VxfrkUCFP5nI/aNSmksswAWk2avFF8eOZCsjEKHmvAWnKou9V1JdaG591GbTtyiRqzQRR2t6O+YOlA8xEdI2uh8QwoYE2h/4MU876GY1gXMbrfnVL9DccKS7SGkHR93oH7/fsdcVADaL7MEFZL6eG+UMk1Ruo2uyPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0019.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16e::17)
 by SEZPR06MB5608.apcprd06.prod.outlook.com (2603:1096:101:c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 08:21:14 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:301:16e:cafe::86) by PUVP216CA0019.outlook.office365.com
 (2603:1096:301:16e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 08:21:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 08:21:13 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AF70040920E2;
	Mon,  2 Nov 2026 16:21:12 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH 3/3] arm64: dts: cix: add Sky1 USB/DP combo PHY
Date: Mon,  2 Nov 2026 16:21:12 +0800
Message-ID: <20261102082112.2306326-4-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261102082112.2306326-1-gary.yang@cixtech.com>
References: <20261102082112.2306326-1-gary.yang@cixtech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|SEZPR06MB5608:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 161a02e9-c310-4e3a-071a-08df38ba429a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|23010399003|18002099003|22082099003|10067099003|56012099006|261009223027099003|261022105027099003|261021121427099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	I77d8Hbtib2bA+s88+SegxKQJUBzJ9jqrfbiHgSmrgj/Nfs0DnM7u2HYV+an4cGlXR7LrARmbqN44HwaWpL/byPiSeJ59vJmUQLtRtdWvV0Dfcbnwg0XxlHi8vWNYRsEWC8Fh/HBTncIjgJqWmBK9SqHCiQWIi4uZUcKxNL9HntkmXyjknx2vsWAjqeEYrMEC5QvQfE5sfnljhJpEgkHGkUJ9/yWmw+pyfX/xrA59M7O8X7YfkCCWoWZl+twEmXEzU1LamkKqzHl01ZaBfpHM9vyeheD1urG2mrhnJ21vFJRNwUna7sf39Kcy9oOFkvqBFpRepnbLHPT6KjxA4BJRV2OxLJUMFJZ/HhdZE5HTaqsLUzWEQZXPzWrBRt1eC9vnz2DZ4Hrhi4nsyH8PQrhzCVAAy/WkV74inR0IbwiZMCjXCl4wypXZAPra8CM7zUZgnaUyYbKibVTNqKqtSdyDdSg5qUuCsQpCddgZw7o1/lIAn80VfVkcKu0+AqemaXQjywjRLN82CurOSygptDoVCJCWajAHApWFZDxeP8+DtMQHgEGvccnP8Qre3LQ6b9m4dmsA8fG3pioq/cNizuVqqSjp113GmftXilaN2YzuCQVrjON/0YCcUcUSWtWxD1DiwuG8KDVNsBBih7xJg2F1Oo0ODDHu0tIps2RNP0LmawjCRZJzmrJ82fnbXAezu25
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KwEljr1wY9BqttJFIU91V9AE7zBkugFiBHE2UUkC7VKIyznBEZ6b6FJ3eSn6UMa2mR7JrcHF5n46hyJ2L9c0YQh+8mV7L6Sus8LaoMH44T2LwJCPFP6I55V+1TC5OYPrd4AiYo2yLWBMQczFMwmtqRJaNtM0V409vcIaG+vULh6mdMNh9gSHmhAM3nf08MJ4uKE3Hp1yLuxY9wc3Qu5G5TOh4I/FqdEfcm7q+rVer99Kww/OIpl5AXsUxStA2l5Cf7SCpM3JSyHP2wR/ET/388SxyXvXpBLN9T9kakYQaqClEe8C8kTkod4hQ0p4BQhOGuYJ8J+8/I57MnlGXGqjv4YS4XOlBwT+dbUvHq4rF5ECryGI/aHctJWlyD+OPrOQbx0/I6HtB4cQy8ZZdtvohSWwNkPrcUdUT10mU8RfjONXcVdNqYtruyQGwr18RHDZ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:21:13.9824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 161a02e9-c310-4e3a-071a-08df38ba429a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5608

Add the four USB/DP combo PHY nodes to the Sky1 SoC device tree and
enable them on the Radxa Orion O6.

Each PHY node describes its USB and DisplayPort lanes as child nodes,
points at the S5 system controller instance that controls lane muxing
and plug orientation, and is disabled by default so that boards that do
not route the port stay unaffected.

Reviewed-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 28 +++++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 96 +++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index e39c87774c12..76f75185b6a8 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -117,3 +117,31 @@ &s5_gpio2 {
 &uart2 {
 	status = "okay";
 };
+
+&usbc_phy0 {
+	orientation-switch;
+	mode-switch;
+	cix,default-conf = /bits/ 8 <0x03>;
+	status = "okay";
+};
+
+&usbc_phy1 {
+	orientation-switch;
+	mode-switch;
+	cix,default-conf = /bits/ 8 <0x03>;
+	status = "okay";
+};
+
+&usbc_phy2 {
+	orientation-switch;
+	mode-switch;
+	cix,default-conf = /bits/ 8 <0x03>;
+	status = "okay";
+};
+
+&usbc_phy3 {
+	orientation-switch;
+	mode-switch;
+	cix,default-conf = /bits/ 8 <0x03>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0a820f45feb9..672aade42d6f 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -606,6 +606,102 @@ mbox_ap2sfh: mailbox@80a0000 {
 			cix,mbox-dir = "tx";
 		};
 
+		usbc_phy0: usb-phy@9030000 {
+			compatible = "cix,sky1-usbdp-phy";
+			reg = <0x00 0x9030000 0x00 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&scmi_clk CLK_TREE_USB3C_DRD_PHY3_GATE>;
+			resets = <&s5_syscon SKY1_USB_DP_PHY0_RST_N>,
+				 <&s5_syscon SKY1_USB_DP_PHY0_PRST_N>;
+			reset-names = "core", "apb";
+			cix,usbphy-syscon = <&s5_syscon 0>;
+
+			status = "disabled";
+
+			usb3_phy0: usb-port@0 {
+				reg = <0x0>;
+				#phy-cells = <0>;
+			};
+
+			usbc0_dp_phy: dp-port@1 {
+				reg = <0x1>;
+				#phy-cells = <0>;
+			};
+		};
+
+		usbc_phy1: usb-phy@90a0000 {
+			compatible = "cix,sky1-usbdp-phy";
+			reg = <0x00 0x90a0000 0x00 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&scmi_clk CLK_TREE_USB3C_0_PHY3_GATE>;
+			resets = <&s5_syscon SKY1_USB_DP_PHY1_RST_N>,
+				 <&s5_syscon SKY1_USB_DP_PHY1_PRST_N>;
+			reset-names = "core", "apb";
+			cix,usbphy-syscon = <&s5_syscon 1>;
+
+			status = "disabled";
+
+			usb3_phy1: usb-port@0 {
+				reg = <0x0>;
+				#phy-cells = <0>;
+			};
+
+			usbc1_dp_phy: dp-port@1 {
+				reg = <0x1>;
+				#phy-cells = <0>;
+			};
+		};
+
+		usbc_phy2: usb-phy@9110000 {
+			compatible = "cix,sky1-usbdp-phy";
+			reg = <0x00 0x9110000 0x00 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&scmi_clk CLK_TREE_USB3C_1_PHY3_GATE>;
+			resets = <&s5_syscon SKY1_USB_DP_PHY2_RST_N>,
+				 <&s5_syscon SKY1_USB_DP_PHY2_PRST_N>;
+			reset-names = "core", "apb";
+			cix,usbphy-syscon = <&s5_syscon 2>;
+
+			status = "disabled";
+
+			usb3_phy2: usb-port@0 {
+				reg = <0x0>;
+				#phy-cells = <0>;
+			};
+
+			usbc2_dp_phy: dp-port@1 {
+				reg = <0x1>;
+				#phy-cells = <0>;
+			};
+		};
+
+		usbc_phy3: usb-phy@9180000 {
+			compatible = "cix,sky1-usbdp-phy";
+			reg = <0x00 0x9180000 0x00 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&scmi_clk CLK_TREE_USB3C_2_PHY3_GATE>;
+			resets = <&s5_syscon SKY1_USB_DP_PHY3_RST_N>,
+				 <&s5_syscon SKY1_USB_DP_PHY3_PRST_N>;
+			reset-names = "core", "apb";
+			cix,usbphy-syscon = <&s5_syscon 3>;
+
+			status = "disabled";
+
+			usb3_phy3: usb-port@0 {
+				reg = <0x0>;
+				#phy-cells = <0>;
+			};
+
+			usbc3_dp_phy: dp-port@1 {
+				reg = <0x1>;
+				#phy-cells = <0>;
+			};
+		};
+
 		pcie_x8_rc: pcie@a010000 {
 			compatible = "cix,sky1-pcie-host";
 			reg = <0x00 0x0a010000 0x00 0x10000>,
-- 
2.50.1

