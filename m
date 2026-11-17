Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794882546;
	b=5trvU3Cgwb1Ve4HcF5cHSj/I0KYxzvk+hBoi2CGSjdv+SelmxDvjJZNHvYbINO82GBig
	 gjEK+waajElq9U1/Rymza0Aws8eK2RppgyZQsnyQCAwhS+3i+QPkqt2UaHQVX+8n+ePQ4
	 8GCmTgA5k6oKQwEBZSTP9hQw/5IZ/fppwS7Yx81hX7OTnTloDREjon/CO00vQSzjYbr7r
	 9SAvQL4GEvwVquc0XwkCdF4FCbIakXZmOD0ComzWIF3QVRGmkVTA4k5ilXDT421Lj4keI
	 De+b4T80qpya+PqgwXIy/0geW4ijmkOJ0FnIWdh+dQPwCXoJggH18pZ2fS7kbN4M0kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882546;
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
	b=toVCQrTTzyPM7xu1AsFrKoj6HGnv15OdPBXZ5zy+q9w8qZGC+BO7qBLU3/pxnBg/87jK
	 LKpkpkwS2ozfWW2Z4EJ0yIK2qRU/iDXnUNw/7be6HDd9+RGCXxrRXqpbgdcyk8aWmpk7j
	 J7H+Wt/r+MqWwRYhl8t2S9ZKmBwJ70skugRh89gFtECLQJA64sB5vzvxfF47PRpH7qZAW
	 bfnB9SAxCCrsS+41k6OZ4Ucx2x7LRQQlKTl0cxcHCBrOUhLa3puOo39xsLg0Pl1q4bK+K
	 jYW6E3DOCueRYmBYQ3YfiI7B7zRiN2U+rhyN3vUeqkWNDCs4il5DDGTk98V9ZTc4IFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.81
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022081.outbound.protection.outlook.com [52.101.126.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B7A606A323;
	Tue, 17 Nov 2026 02:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B7A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=df84NVMEvZjwxJoYw/xmbhslXObgGdFzBQZ2ntghMA7Z4Svq1yvvng4furuDGu1eVq5Qu0IBq/N59KblZ4zLrRGuSWaGfbHjGTK+QX60ecHbXVP+4Maq2DKa6kvoSsUz436VqrVKLXgIaKo4O0PkDAWSwoPfV228dy+A9zzG6+KPxw89iKi1SjksZqEpVBppM9zITosxxn6Wxg+4wB3eFkAWybJ3UymdzaPbwM/LQjcspb8GBR0X88h6B7KDOtWbd2tY+og8W+J4fIKMIHH7Rr/r+V5VG+ZFKKCJRjpcjPOZNv0+SrlyPwy1bRO5VpAPw/me4ekTxcGde2XKMR9CxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvSu7AhVLbMLhLIQCXtxPqvA7yUCBiyk7/6hYNrWuec=;
 b=Qkdau7LlSPc4lNu91Z/XwFZP+wSmyqakv3q7D1uBKf7e3YqjivvjZZwt3taNsBAms98dGC1cEUiXMk6zwuPX5FpioElB0Zi3zH76NQdyppPhQkY8KyXvTGkJObzkI+/g+7UpQL3zd4wnCJcT/lawbDIDz9Rn0/Ej+gxY4LWqRkIzkPwtc1QvfQzQvCJULVqaJOhmk9ackN9glOe93K4IlbLYZbeD2sHC72RcvweUO7ytWALV+CZK5pZaNujtA4rjt/gu9O9EQknQIm3WJAorTVbKM4CUQ1kPLrZkJLQr/9MfaaLGwPxU3F5Hlsias2bsIRMHjQkHZ7m5gULDxFcLPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0032.apcprd02.prod.outlook.com (2603:1096:4:195::12)
 by KU2PPF056618284.apcprd06.prod.outlook.com (2603:1096:d18::487) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Tue, 17 Nov
 2026 02:29:01 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:4:195:cafe::1a) by SI2PR02CA0032.outlook.office365.com
 (2603:1096:4:195::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 02:29:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 02:29:00 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 89177427EFC6;
	Tue, 17 Nov 2026 10:28:59 +0800 (CST)
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
Subject: [PATCH v8 1/2] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Date: Tue, 17 Nov 2026 10:28:57 +0800
Message-ID: <20261117022858.2210212-2-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117022858.2210212-1-hongliang.yang@cixtech.com>
References: <20261117022858.2210212-1-hongliang.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|KU2PPF056618284:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 302c4cd4-3ffb-4d18-bdec-08df44528a70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|7416014|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|5023799004|56012099006|10067099003|22082099003|18002099003|261009223027099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ePiBjpYJMYu6L4P33LQDKfKDI8Blm9WTQi3PXOG5spZo+AKWJDpNG+NHh+oQnj0YKh18Og0b6ZMR6aTNyPCSluZYCSLm3kZLbKgLN4PTH31MDppPOEqIM/dMOlN71bG1Ej2d/BCmJVL9QTcwcQkZfHhZTArsAL7ysAgJu6vndZAvsIsplik8a5bcP2l/BceHBJQNGEMnO8+T+HS8ouHle1Xkf2zj2MFNAPkGkjU8EjvnkVIpQTjE9KbAtYipxsDMALYQtV1CH6IMTyMMvwXeuyAQwypchsKDCGSQ+crdV20C2xaEaJOc98+4vyzQNQSvPVoDqufN1jpZHC/hxhtdHa+v2sCji9xvp0cRc4zbgbac/PgHJRSX3w48kTxUIdBN7iTA6axkPzYy2chT1BQkKrMjB2cVzFbEHZRmR9mwn69uwunqh2P+syV2QiY6MzPr/SYU8+Mzv0w69b/aSXO+3S5EPvrb3c8O6Xbt+jxTHS02S+m+lGbhePHksUQUmp1Y7nZfKuZeCvzDyYAGBbVL/pmqkDGVX1bSuvx/fO3QvWFOgKec79yq/cF4ooSkBLaAKIQB6cHGup1HaoxQ/1bTitGOGB9H0OvtbM8e37A+LgelgThEaggiaJi7rpgtMbr4easPT7bo5UHMKh7t+I3oDQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(7416014)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(5023799004)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jWXgltC8kVc4oo0DrJze4wP1QQ0H+GdBv7E+NE1s1YGzF2JU1RJAUttYrigyTv6SkxKWeHNRM5iGp/X/Mum65f4GAl8nfsnEJUoAn8YYSpRzgPhejWWRWvbxXswugtTdtsagpUlyjrWL75WAKX/PdrWIh9Ikg/L1z2Z0BD3szXLVFm17+QNkC0DTiVS3ybIhZEIPdb+AG3HMeclnu3JBvfCYFaQs+f/7OhpBkBTaUh+ZeWGXGpgp68TqIYvbexnGJ++a6aVP+gXlm4G+M6bo9+sHeq4Jy9Qwfz5vMElN2Vj+4xA3J/waa91/sWHKa0/KmGhBk7iBDcrd0i1wILT+e3ZFNhWbXXueIcCdaAndioMjaNWfcLiwS1WMWOehaMPey5HdJKOIiKgszxjYBmY8/GVmJiaHU+AnDPQrCiPK0J5Sq0pdT5AsOFqgY7fgzxIr
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 02:29:00.7962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 302c4cd4-3ffb-4d18-bdec-08df44528a70
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF056618284

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

