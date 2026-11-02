Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.92
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793607677;
	b=PFHn1wc5Szo4d61/acSJ0DXexBgniVPe1A5zBfuMjDDD1lvxGZitKfS06yilbdutoqn2
	 3FBEe93i2ZRQUovsT3ImcfOc7lYPT3q/EbZ8Qfy5p/o+gflnp4gi5tbGQfsn/eU1DWLpm
	 X1saG0IkbP8noxJ1TkgTq8d9ZZu6RgvH2OS1eXfP85lGKRt4omzMEj6AXY3xE3K8AtMzK
	 N1YdvwS5fIM3dDKgtqALMipl/BOSCLLetxqv9QH57GkN4jUi6vFxKai6bhb5YoOrkx8/a
	 1RGgqJdfUw0DtQH8XHpfewULutD7/jfMjTbuTakAe4/EGxc4JnG1xJRD13RZFSnR+Gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607677;
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
	b=4PZhU7eFBJ/e71uzGTw0TCLG9ZTLcallxvrWsPGqgHvcNxy/qA7/3/dSdlBaxIprlFv7
	 zkP/12bwmb9bI6ehLvRU4mK5N+Zt0bekvBsEM0WQYiy/Q4nvpnxVvS7krC0XxzCh753Dp
	 su4osuvplCwFo0w0Ya4McCllD2SCeVB0UVVwMcs65q635gv5RKelo9+VLiBOaHEmbyDhh
	 /jSvT7p1zB/VJj7eizNCPsG+lk3/O9BH3ebCw2XOyRS0eXCy/3mKAa3JbvMHFXcd4Xof1
	 Lwx61pH6UvYxbDcvZOlpY5mQLWjdpJX+uKIML+9be81ysdi39UPnZdGvRpMBpOXsdZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.92
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022092.outbound.protection.outlook.com [40.107.75.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31068606A333;
	Mon,  2 Nov 2026 08:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31068606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zB1s92lexyHwqX8KWdVAsdsCDPkwY9Bw4MziC0OGr70KJ5Ze+pfAw7UXJCDKrnkSpgq8Y2WAeG5L+k9m1ESwYAg5Y4eTbxy8y7/L+1d111BxQeCOIMkGAamwE7sZ8E/j58YOcetCPVSPdgY6uqDk+fwKBUmQ4Tmw0Pz4Ll9gKpz2lRsUJdrN4Hc2LzVBh2IAbacU5Cffam/SGuNAJb4gRVp1DYDcDQxGgHYokfg1QyOgekTDhsOwf+KZdWlsdRL0cAPdIz4nhF6wVOryqcMpZZqwjKlNLYZtyMW9FovZCvziGFIpue6ycl7Bn4GEwr58Qmy7gVGbLlmNWaSHWyeYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4fC9HpkQH9uy9WJbcsy7NyRTVzN4duiCLV71TQ/6SQ=;
 b=qauVCzgc41EBFjzB52C9cicJ30LG5iT6VjmzR5gtXGq2DPSRKVBewN9VZHg2ufpT7AZmJ7VeZeELlGvlet2HbwjRkQmlFirVpjrGAOD7InN+vOZmm6P2sMg1QNQUnowBveL5bbVU25DMaryflyBAIRzE9+J57AXgGE7cU9g9J64Bw3T+OP3wp4QvA6o/EVvx1FC6mOSsjoGiiLB19LlfVkaPGr6iTyCujk3YIj4lDnNnAeSmVrXOn90rN/3lHsR6uYDj1WA1kcs7kwdAUnICif7mIEPMuJ/4a7K9fLkZ5TlkVhR6T6x7FSi0c7Fq/aXs4iSH7A1s8cpBm99Z7uINsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYWPR01CA0020.jpnprd01.prod.outlook.com (2603:1096:400:aa::7)
 by SE3PR06MB8014.apcprd06.prod.outlook.com (2603:1096:101:2de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 08:21:14 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:400:aa:cafe::26) by TYWPR01CA0020.outlook.office365.com
 (2603:1096:400:aa::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 08:21:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 08:21:13 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8B33D4102B63;
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
Subject: [PATCH 1/3] dt-bindings: phy: add CIX Sky1 USB/DP combo PHY
Date: Mon,  2 Nov 2026 16:21:10 +0800
Message-ID: <20261102082112.2306326-2-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|SE3PR06MB8014:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 42703adf-a733-4fcd-05a1-08df38ba424a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|82310400026|56012099006|261009223027099003|261028144727099003|261021121427099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|20046099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	W5svLIo2eVYjgs4iEaAlFHrn7Y/CAWxUSLapeIGLmVUmsZA9vV4mAx9MwXwLJu99cDjrsAYehObSRjNZCh14pFeLrHE1XpFguIcNtsxv1OHCuJv9DZmhukqiwNIYOTf6dnDs+xYNQwGSPtqGRkDRiFoKDKq/yv+B11dZkWBHxfTyzbmsb5GCPm+sJkEKolzmEBfx2ZEiSpLnr3JABd262lEGKdQ3mdz7XQfMf8MtQy6AgN+JawkvMzQaU8f4vMAZAnwDrz9rngEZa2aSiCXNW/FRxKBvAIS2bPT9/OhoaKvXethvcLM7U+Vq82RSepoChnnwY2N/6Lw5gHNKDfGPMmibpI1BNCMg8T0cTdrOqzVBNY7ELHaPJzMMIYbUW+suPzJMY0jwKiA9Dr94R2d86GjGuF6F7mpU9IUSUStnV5itL8YXLAl72y8gsPxpOsQgpZuCDrgBfGInFbNkEZiDI9oRdUCHYDGeKjy0WOTgDbZHZQdx2ZYitHyVii0/HhvIGCekvR8zK1moLNP6jiCiBzcgc7MQGt8EdqM2EpoW131IxxvRE6vdYkbttpMSUQg3GKEQJfBVo5pi6UbmBksIUyy3DIMb9VeP5cWm0pi0wxmfGuaQZdEmKSFOOvh3wAKavpT/tWWsbRxlCLOlFdm7ig==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(82310400026)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(20046099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b529ACyQnog803z8fBE7pZO7kFiP5xEl9uVwsRd+xC5e3+atkQBVjDbVZTfeixqjOFtp7cjdh/kKCsIhChY37iTWBdDYzKdgv2AyKDi0gzOwsfFei9eipZLs0arFRRnj0FzSIUAOTTskAhzZke+q80nDu3Xeg24K56fNX+cdvKK/GLvzUTOpUM/6G2BrcGEha9GIeYjvKhqn81GxP25RKc/252R55Gv4Cx9wCmQuF+GHZIww2E+FHfy1Kx0ucxbS3e/hHsL7peiQiUio1zU2mRbkMCgy9N7UzqAe9Ye+vCp8w36PhLpZpGzFtVrqWGR4YcR2LWVCLDcTE7sp5zc6BZKSfQzk9Jqo8vAvnjtFpUqVsrEpFu8UKaXbjDxTpjrEObUrofWDbdqmDpIy1h0tFVl3HwgOwprFr1WrTS8PZhOl9Wo0EbUCpjTJ6hH0cymD
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:21:13.3957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42703adf-a733-4fcd-05a1-08df38ba424a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8014

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

