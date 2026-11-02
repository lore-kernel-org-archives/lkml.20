Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793607342;
	b=k7GlZZVhzjwyuMvWX7LyzzSWuOYs+1LZEsFNa8ZR6M9WRR7tippWxf3PVX2+yLCT5kim
	 w8xotS939SgbHjQ6U+eMRnSS3cZ23l1YWrr7jqYp5zwWwA9MCAekfQH/0ab+vHyGdcXDX
	 ZcDqjlndK6wdGqzJXlLmZN5cvbE7+D/MU9/chnF+ZuV1LEOVtBMiBRyE3IqhDZjL72//w
	 Degs7dPxwNYOTM8twOK2eg6wkfymtwORiC8MRMp9O0RlOEFaphlQlanLkC4814feyd5Gd
	 DYcb+usTWlc8wuqoczFknNh1EnxwXzSk3FgUdgOna+MzmALDvN04ZMRdiVAApcmPabQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607342;
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
	bh=Z4fC9HpkQH9uy9WJbcsy7NyRTVzN4duiCLV71TQ/6SQ=;
	b=1bpoJQwqBQvmTVMxjEdINqHcg4+gTwRdFRvjRn1yiR/H5uauI6IcKybIR1XkmsOfGWCP
	 3MrCqnuglmWjBPGnvHTo5R2vr7sgCI10ikVAzxm5R6Qy5yKLHD1nvxoo9On5EGMK2z5GD
	 x0pmvd3ZrcVtiwOYByfCB5/G16MN3IqhETDK8d+oeM1gp0cylPodNkJQbN65mffsj8OaL
	 4lLpUBhG2zf+y3SahNR/6uToQppf2DZiD0EVImOdvlYaUAAu8N6lYVNBF3pvwwNAiJ0q1
	 qWQHFQBHgYX6bjUIzoCx1RjWfe2gg8QeM0SeyK44o66Mdd/ZYWzuJTjCVLrC1Xo0FXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.114
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023114.outbound.protection.outlook.com [40.107.44.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DDF606A329;
	Mon,  2 Nov 2026 08:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0DDF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eu+z50ge7FP79Pc1QTqPGFP4Nc/2NoXoydOe5EQVH2qKR6EV0oRkw1XCzhYE5B1cTgkJUoJPCN1uThgyiOXCD6VHIstlz2RI/wyDGNLlF/2+qynAweVJorRR/j0ftsjtWwPhC7F/nXVrxjhfkig7wp+QIT6HnIMVU+/kXUcqrMi3tKrPnCTVSq/we3Pweb3KL35mryK3ELqE1SQytigQdKSokZ+4/A205pbFPgGjqjctC4zL/m8QV6Aa3wFi3I3gs99g12Qf1yxqtOgDC0t5D6+Z3jCoHjYO93yvu5NiH9xNuUpFhqxaVthZsMM/kah9ixJrCNU4c/wbt8CoIOQzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4fC9HpkQH9uy9WJbcsy7NyRTVzN4duiCLV71TQ/6SQ=;
 b=W/JoZfVZqS01J4gecN5Gj589xoBmEM19ks0V7Af5AyaEoLrRuU42WppQ5YglvO2oKL+Qgb5KMwNiKNeX72QhFzipYw1Cx5cG+rtIwPsRpiT3J5grmzojEdvwLjmLkRxbT37tX4qdko5OLHQNm3/2LUPktlcBv1uGkeKHZoCIX5ufxc8YLiGc/1MJp6hWGX7XntUE31p4b6lJKQmrWFVm7tRkMCz9eE3lpGZfGCJf55WW/A0AGd6U82BSc08yIAH+nOxHgSY04TOf2yFWrINWfjo1bgdE1Hs90RZJejh7PZVtwpFsFoY6aXGNvgfGGrhs33C6zGJdnWcJkqVjSylyKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0305.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:38b::16)
 by TYZPR06MB5949.apcprd06.prod.outlook.com (2603:1096:400:337::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 08:15:35 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:400:38b:cafe::46) by TYCP286CA0305.outlook.office365.com
 (2603:1096:400:38b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 08:15:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 08:15:35 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AF03A4102B47;
	Mon,  2 Nov 2026 16:15:33 +0800 (CST)
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
Subject: [PATCH 1/3] dt-bindings: phy: add CIX Sky1 USB/DP combo PHY
Date: Mon,  2 Nov 2026 16:15:30 +0800
Message-ID: <20261102081532.2305142-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261102081532.2305142-1-gary.yang@cixtech.com>
References: <20261102081532.2305142-1-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|TYZPR06MB5949:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c075a8bc-6d9f-4134-71db-08df38b978a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|82310400026|56012099006|261009223027099003|261028144727099003|261021121427099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|20046099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ERIZkK5EMpN/vob87cYXUPJy8sQDz+UBfZ9AA1V71kbs6+k96LG6/ZuxFCmg19TKBi+LDTUzOda6nkAQn18s+Qjwo2JzqcTO7OCthDHtpFfZ2DnpboCDqJwoWm/Abv6c3SswTZ5yXf/fianMhtKmMusmeLfyEvbh80WoqzwsvPvGHtHcTiBsnci4vB91ySsM0Ta0VWhFqhVcaDdXzdyHj/s6unjV9KwEEvcgmmnI8nvsMBUm3UolHqiz8VCg9HiXzA+04W6K8OfWRqgXOGlw59vQXbqS2T1YUgkfjNj3RCmh5ZDVB6DRM0dAlVs4ArLLyuaiC/Ekh37r0XnL4m9LM3gWJbKYNbdiYXgQCOM+WusPscXy+7/7GFcd6cFjIMYKj2xZo4EAjQr6EzTKkkC2N97yB3g2yQ7IwLhXW2OjR+zM7k5EyLu9kwKpC7h61r31XhvQAiEnj+etrku4O9hvsXOYQ5YgrkCRGejOOn0lH96QRetVAWBpVwnH4dkuSwedruscqwGXYUNVP89FQEPx7E+KThG34fSZsHs/0teSQIUPPXYqAcNHet6a+wXd4iqOsHpuF3N1SZFzVeTxrrJzPXWoXD8JjcIYxISZ6gIVv7RJj+VGpJSe8C4Pfb8sspUQYoVI3J/yKktlct1+h1Fjrw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(82310400026)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(20046099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3+DXZaIOKJ0ewSyx3JwnaI5cwqVC0tu4rCfcCPYweHaEAby2EyxTV5IH6EO8q7Wpw7ub5tF7kIQT/wmX1v9bRWeEgMbhXG9asH7oMp+sGY3523OoBuEPmZW24PiW2jNdUKx9hyDazv7tkg5O6vasnldu3/ZPlIWkyPstWcQXPtX6ZYXozdJQCxZVF+xvoitrANGB9mzXnOMCfI4KIOSTD8cJUyGqCw6uSTf9j2sAEmiwNi0p/JOg3RYILWQmUREFqPK97J/fQo+icMXZWXLeY4TkM0Xnt63QJeOu9EiqXD/nhacm7XXKuGI4qXaCywjwBskA+vF6zhaRcIXgGYlD7DWVGqgDRCiJa9G3tyf1Zkb9lxj6HAJsuQJC2xXAriunJNfPO6kVpZd8G5j0utHgDT7YPt++rZXZC6Oc0BtimO2IRW4jAAMSfy2rc0xc2+dn
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:15:35.0445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c075a8bc-6d9f-4134-71db-08df38b978a7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5949

Document the USB/DP combo PHY of the CIX Sky1 SoC. Each PHY instance
exposes one SuperSpeedPlus USB lane and one DisplayPort lane as child
nodes, so that the USB and DP consumers can each reference the lane
they use.

The PHY performs Type-C plug orientation switching and USB/DP lane
muxing in hardware and is therefore described with the
"orientation-switch" and "mode-switch" properties. Lane muxing is
programmed through the S5 system controller, identified by the
"cix,usbphy-syscon" phandle followed by the PHY instance index.

Reviewed-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../bindings/phy/cix,sky1-usbdp-phy.yaml      | 150 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml b/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
new file mode 100644
index 000000000000..a5b6943f84eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/cix,sky1-usbdp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 USB/DP Combo PHY
+
+maintainers:
+  - Gary Yang <gary.yang@cixtech.com>
+
+description:
+  The CIX Sky1 USB/DP combo PHY provides one SuperSpeedPlus USB lane
+  and one DisplayPort lane for a USB3C Type-C port. The USB and DP
+  lanes are represented as child nodes of the PHY controller.
+
+properties:
+  compatible:
+    const: cix,sky1-usbdp-phy
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+    description: PHY APB clock.
+
+  resets:
+    items:
+      - description: PHY core reset
+      - description: PHY APB preset
+
+  reset-names:
+    items:
+      - const: core
+      - const: apb
+
+  orientation-switch:
+    description:
+      The PHY handles Type-C plug orientation switching.
+    type: boolean
+
+  mode-switch:
+    description:
+      The PHY handles multiplexing of the USB and DisplayPort lanes.
+    type: boolean
+
+  cix,usbphy-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the S5 system controller
+          - description: PHY instance index within the system controller
+    description:
+      Phandle to the system controller used for lane muxing and
+      Type-C orientation control, followed by the PHY instance index.
+
+  cix,default-conf:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3]
+    default: 3
+    description: |
+      Lane mode the PHY is put in until a consumer changes it through the
+      Type-C mux. The value is a bit mask: 0 = none, 1 = USB, 2 = DP,
+      3 = USB and DP.
+
+patternProperties:
+  "^usb-port@[0-9a-f]+$":
+    type: object
+    description:
+      The USB lane of the combo PHY.
+
+    properties:
+      reg:
+        maxItems: 1
+
+      "#phy-cells":
+        const: 0
+
+    required:
+      - reg
+      - "#phy-cells"
+
+    additionalProperties: false
+
+  "^dp-port@[0-9a-f]+$":
+    type: object
+    description:
+      The DisplayPort lane of the combo PHY.
+
+    properties:
+      reg:
+        maxItems: 1
+
+      "#phy-cells":
+        const: 0
+
+    required:
+      - reg
+      - "#phy-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - resets
+  - reset-names
+  - cix,usbphy-syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    usbc_phy0: usb-phy@9030000 {
+        compatible = "cix,sky1-usbdp-phy";
+        reg = <0x09030000 0x40000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&scmi_clk CLK_TREE_USB3C_DRD_PHY3_GATE>;
+        resets = <&s5_syscon SKY1_USB_DP_PHY0_RST_N>,
+                 <&s5_syscon SKY1_USB_DP_PHY0_PRST_N>;
+        reset-names = "core", "apb";
+        cix,usbphy-syscon = <&s5_syscon 0>;
+        cix,default-conf = /bits/ 8 <0x03>;
+        orientation-switch;
+        mode-switch;
+
+        usb-port@0 {
+            reg = <0>;
+            #phy-cells = <0>;
+        };
+
+        dp-port@1 {
+            reg = <1>;
+            #phy-cells = <0>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..8fb940a3ea3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2903,6 +2903,7 @@ S:	Maintained
 T:	git https://github.com/cixtech/linux-mainline.git
 F:	Documentation/devicetree/bindings/arm/cix.yaml
 F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
+F:	Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
 F:	arch/arm64/boot/dts/cix/
 F:	drivers/mailbox/cix-mailbox.c
 K:	\bcix\b
-- 
2.50.1

