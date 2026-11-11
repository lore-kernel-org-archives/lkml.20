Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.92
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794366588;
	b=rbypkczGuwOJHpWEmh5r/dIuI693R5wnZkRmh0KTBL76+fN3Y5hqZsoZkk0AE3FLOAh3
	 DtrhX1cx9HA7N2sqYSc+IU9kLTf7s/aV6AS2VHCvK63sy/PocJpnika2qChWsMiJHNug5
	 oVzJBXy+oqdGhWMqoII7FjdZVMPASIIX5m2k2XvjB+nXP+YyMnoK6RFCxIQxYTBmqXBNv
	 kvNfihBB2f5r1Bcp3K0EHUgvrNC8qj5nJslaPqRq71eF52tLE3ER+GJ1tvWamAbY33b0o
	 oRfO5G/wmVR8cYDiUA2n8tlc3B4kGbLeT0eA2oH166ZtVrHfw5PqiOektSPBfqZbHCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366588;
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
	bh=lvSu7AhVLbMLhLIQCXtxPqvA7yUCBiyk7/6hYNrWuec=;
	b=YTEz1kN1vNE6ud1GFaibhRVC2emMRdLam7o9einbqKe+tqmNFzLkE5NFGbPLHJRJaEPx
	 /TS++TyhYCdkicDVEfG5LfDLgYJvniuxh2oBsmgX1txA4pNSJ8F9+RzJcQNRyyasPdcAW
	 fjkS8AQDexgi5d72ofSB2GV7z4T5ve5dTB2UOJJaNqDAaZPtajHHlxeBSPMgtvfbks5Zh
	 U1uW7KPdyLv+KSlM5WH/bYmbYeKUDLoowKV5XOusG3oXdiaEWwc/E0HHLXXFiuNZbtEKM
	 RRdhMyPXuNXercjDIgRqbMP21cnm3jo62qgGShYmirXleXN2LErZ0r31ym2rjQSiM5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.92
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023092.outbound.protection.outlook.com [40.107.44.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8E3606A332;
	Wed, 11 Nov 2026 03:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E8E3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/qJGtb+Y/aE3n3Jav0SM/klB9IZyyTRlzJK3K72mUgJOXl3b9j+HwOzLyYcO0YVcFDRPit9jS1MTsCU+lXsljqSq8jTg5qO605B48j/3m568HluB+xjA5VoPXiUq1UrHfcHcL7kxavCVR7tz9Z34IUAUDVk9cX762Znr0Wo9SMhKySP8Eq1gP/peRMaMY+PJljsL55UUuiGqXHTkGaZdNZv7fHr6hNtiAm+zbDW8X2jV3fXkxiX8WilvV22k9y9tisUEkkUQaamatZWwGYt9+aFwLbR1XE6INVdXp7m6xxp7gcLT0/Ij1PhFAa9CqCoaaU2NYEk6Blg6a91o+fLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvSu7AhVLbMLhLIQCXtxPqvA7yUCBiyk7/6hYNrWuec=;
 b=Anc25Ml2W/mswxnUT+ViwUaGPQXH3/hmo3c6V7+E68IOdDkI2F6n7DZz3BlN3XwOcUCfl609MLJB/CHR6vDfav4EKGyaeUSLCAwpuwUYPbQJNZ/GjNS3oNsEHMXuJBW5Xpvyc9LgIsXgjWjqV3veI2RvMAHEaZvGD/lAE+NLPssBgqHAs3ubO8cgABtvmzE7HRzVXN3r8nSDOU0/Q5X+kYS69m+Ys/Cha740gfdHkIpbDKPzRkxXFWx6IBXEcUzOUNmeGq8UgIHgj4FmnHRZGb21DWsxcA/p37IXSSrKCln0VbI4FlJPzsrlqkNfO2Rmva1Pp1znb+NtcIwhRQ7fUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0087.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2c6::7)
 by TY0PR06MB6855.apcprd06.prod.outlook.com (2603:1096:405:13::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Wed, 11 Nov
 2026 03:09:41 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:101:2c6:cafe::94) by SE2P216CA0087.outlook.office365.com
 (2603:1096:101:2c6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 03:09:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 03:09:40 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D21B14102E73;
	Wed, 11 Nov 2026 11:09:38 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Gary Yang <Gary.Yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Hongliang Yang <hongliang.yang@cixtech.com>
Subject: [PATCH v7 1/2] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Date: Wed, 11 Nov 2026 11:09:36 +0800
Message-ID: <20261111030937.2954646-2-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111030937.2954646-1-hongliang.yang@cixtech.com>
References: <20261111030937.2954646-1-hongliang.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|TY0PR06MB6855:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 044ef520-a77d-4f4a-8f87-08df3fa13a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|7416014|1800799024|6133799003|22082099003|18002099003|10067099003|3023799007|261021121427099003|56012099006|261102123227099003|261022105027099003|261009223027099003|261026140227099003|5023799004|261026121527099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	OpB28Low+MW6jY4jsqA7tme8FrH8Vh7fI7LE2T6uOjkev4p8P5SRbNyVi9Vo4VSwoH/Z76X3zH3BVP0y4xcgcQwA/slA0EcSGxYUdmT9Z0SlZeMiLBXD+5HDfPrSROtjtMzVNbnLSt0cM7zcfg/2sHBrp2o2WI/MxvWh/kZo+ffenM+bCKm2VxJUIoOKB8MhnxVmNIDXCAvXAKOhRnjltlaOlDy9FTKJthyO6BgdfW8tZ0fXrHSc4CqGIouIv2gS1DBOM1XUOTrHfLMek2ia9nmYqClJVcB+HYA8vk/gQreQSoRjux+gdLtyof3+vh9EdIwn0SlkCArsaEahLWconobuA5u/yNPvsVXBByZDGcqcRjkKO8RlDgdJU0MtWngb2sebwVf2ZgsKVhsbVXl1lY4cksmQ0+NQ5NfkSYML7WZbiUg6arqwVk8/lf2f5cmNono+7AJ0OgWklpFVX8bCe2khSvXYY0n2FuTjjK1bIoJskO40b4IV9BmG4lQB2/KuZ4BSst2H/pht0SE3zKXhvAj8LC8FanCJOKBtCIkhCKe/YTIiTbPZPeRu+7ksw2FjVUJhJOmc8ISZoDWNuz0hksdzili5+L0jPgNuz9kTED/4SsCucckRG9uOOzVqFv5tTD45Vd/RgbJjjZ7trFKREg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(7416014)(1800799024)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007)(261021121427099003)(56012099006)(261102123227099003)(261022105027099003)(261009223027099003)(261026140227099003)(5023799004)(261026121527099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HLCQgHK5G6vsiwd4ZaZT8ObWm3BN09y2FxSPDzR9KrF1mPSmnBKihTUSYkwiCxYMxPUoomnXwXHn2r2/EfX0PKdk8dwsF8CO7UCFiSWIpk9w6zt3nIGjPDBxgw12F942cUOI2vpWlKA8tzolKweEQzuu10lrfbB6OO3mznaRo7+4FUZecHvEl7GbOuH1h06v9RlsOGfNvNV6CVgHk9x76rNCjSoubftFEdi1GmdYQlDdVwjhZ0CoGcHtjQkAfqBnMxqeuemBBxMU431jP3h6a8o+jqjr/trthwBIESh4aYq0kaR3EGTevscQXMHHyRQHFm9gi3FPjrC/zg5yh43OXoF6cZ5fsE1MoyEyAAIcEMkmvi94TodNoVS0gLJ8rvNxJuriOW7eHxt/PdX6ajHnSV9E/3TWMqW8dk1qw6s394QHWclCOynTB1yFtJOmPf5I
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 03:09:40.2134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 044ef520-a77d-4f4a-8f87-08df3fa13a0e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6855

Add device tree binding for the CIX Sky1 USB3 PHY, the SuperSpeedPlus
PHY of the two USB3 Type-A ports of the SoC.

The two lanes are not separate devices: they live in one register
block, share the same clocks and resets, and are brought up by the
same initialization sequence. The node is therefore a single PHY
provider with #phy-cells = <0>, referenced by both controllers, and the
driver reference counts phy_init() and phy_exit() so that the block is
set up once for all of them.

Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
Changes in v7:
- Describe the PHY as one provider of both lanes and say why. v5 had
  one child node per lane, v6 dropped them, and nothing in the binding
  or the changelog said where the second lane went.
- Reword the description so that it describes the provider instead of
  the register programming of the block.

Changes in v6:
- Drop the per-port child nodes. The parent node is the PHY provider
  with #phy-cells = <0>, as the block drives both lanes and the ports
  share the initialization sequence.
---
 .../bindings/phy/cix,sky1-usb3-phy.yaml       | 78 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
new file mode 100644
index 000000000000..205140bf84e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/cix,sky1-usb3-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 USB3 PHY
+
+maintainers:
+  - Hongliang Yang <hongliang.yang@cixtech.com>
+
+description: |
+  The CIX Sky1 USB3 PHY provides the SuperSpeed lanes of the USB3 Type-A
+  ports of the SoC.
+
+  Both lanes are programmed through one register block and share the
+  same clocks and resets, so the node is a single PHY provider with
+  #phy-cells = <0> that all consumers reference. The driver reference
+  counts phy_init() and phy_exit(), so the block is set up once for all
+  its consumers.
+
+properties:
+  compatible:
+    const: cix,sky1-usb3-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: APB register interface clock
+      - description: PHY reference clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: ref
+
+  resets:
+    items:
+      - description: PHY reset
+      - description: PHY APB preset
+
+  reset-names:
+    items:
+      - const: core
+      - const: apb
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    usb-phy@9210000 {
+        compatible = "cix,sky1-usb3-phy";
+        reg = <0x9210000 0x40000>;
+        #phy-cells = <0>;
+        clocks = <&scmi_clk CLK_TREE_USB3A_PHY3_GATE>,
+                 <&scmi_clk CLK_TREE_USB3A_PHY_x2_REF>;
+        clock-names = "apb", "ref";
+        resets = <&s5_syscon SKY1_USBPHY_SS_RST_N>,
+                 <&s5_syscon SKY1_USBPHY_SS_PST_N>;
+        reset-names = "core", "apb";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..73783abe027e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2903,6 +2903,7 @@ S:	Maintained
 T:	git https://github.com/cixtech/linux-mainline.git
 F:	Documentation/devicetree/bindings/arm/cix.yaml
 F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
+F:	Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
 F:	arch/arm64/boot/dts/cix/
 F:	drivers/mailbox/cix-mailbox.c
 K:	\bcix\b
-- 
2.54.0

