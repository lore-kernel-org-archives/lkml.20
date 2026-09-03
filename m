Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022086.outbound.protection.outlook.com [40.107.75.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0330F34B1A5;
	Thu,  3 Sep 2026 02:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788402934; cv=fail; b=XwfLJmkI0I/CLjz+Iv4flcxFvxcna0eaHVx3/lPXwJp9x+dnJbvvHnHgngyMwsl1i14s7ttM2+MKYETbabN+d9VbPSXdUN0+C3dCLsC8b8XDvTJORGEhI0LjBNVW4oba5ovf3HwQIJ7R/FZBrzkuQOmPcO9nPBv7Nga+BfGLGII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788402934; c=relaxed/simple;
	bh=hv+IrMUbkRdQmPk9mu0jDmITKr/DjC547ipVw+Lf8Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HsH1s3/4iwFh43+Dqx3o25m01VTpyWkEqyJWi6TsLAEThgehdEFrHcGHlen+8UjggSWldQz/Die66u+GnvAe077otW7c0AE5sKb8WAbzruNiEWSv3G72dPkBFzgFmVnCWo3aOQffhx7Yd+OpPBqzG+BsD94bVwgHC121ozFmB4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8m5UkWVHky+paTU1yPG7acZC3s3uii1v8X9jMIb4DE1j8NHagoThqUvWlUbjNrTWZMKQseo3ENeTb3pGdTI5TFyasKc0ABdyHWaVEp/xVySfBaLin7kvWsyJxqPy1b5FCnY5GeZf/QcAnT7LZNzIrTReXBg5X+jLUc3UFYAl6AMTOEufcbVQ9ObYXW2wUmGLlZaTFBJOwgRjnBeH6CibEn0tB7igLR3VV+TKiZg5ywiE7KZeNc3G01yZ1HJ53BksjlvxU1odK5UsxLuIwsTeLU4PZPE5iByDiJM9GslFwxP9A2uvBZBCJm/XLo7p6aHeKITTvALFP4sEn+JCxrEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8WtX0k4EqwDh/TgPkcMz1aEkAtxppzLjZYw7yZxlbs=;
 b=UQEdenIDESWBp5pWNkHF7OE23iMmGujQAt8ow1sGkvGyxjMmStn/VhjctYJWqWs9KscXhPeLPbP0whFzaxwkb3mVJY+YLOhrprjVEdxMST1QtVVkedyCsavKB2zF9hnmUAhCKgXewwhGex+0CmQ5AlhF4HmgFI66GH5tywhE1D/CPbdD9cNFi/zVuPERdW0W1PC/Cu6l57jSBwftxJd08y+bLOhhckTHT8BmwxghV/5HsHj/vW+4tdbfvzVY5810oWJ8PBBwIFQ24Xch4cEmCdX41bX60wlLRcvuyp2GPE/4TcNJgUH/AGlQYT+iTxR/1r5xDzpPuZDTACiPpFE/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:990:56::10) by SEYPR06MB5159.apcprd06.prod.outlook.com
 (2603:1096:101:5b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 02:35:24 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:990:56:cafe::15) by JH0PR01CA0011.outlook.office365.com
 (2603:1096:990:56::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 02:35:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 02:35:23 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 35786409210E;
	Thu,  3 Sep 2026 10:35:22 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: krzk@kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	fugang.duan@cixtech.com,
	gregkh@linuxfoundation.org,
	hongliang.yang@cixtech.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	pawell@cadence.com,
	peter.chen@kernel.org,
	robh@kernel.org,
	rogerq@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v3 1/5] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Date: Thu,  3 Sep 2026 10:35:17 +0800
Message-ID: <20260903023521.2064986-2-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903023521.2064986-1-hongliang.yang@cixtech.com>
References: <503e87d9-3311-413a-98c0-e02a02c4a354@kernel.org>
 <20260903023521.2064986-1-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|SEYPR06MB5159:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 27c77602-24f6-47e3-ca90-08df0964015d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|376014|82310400026|36860700016|22082099003|18002099003|3023799007|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	yicrPkZRLQXIoqCYFZQNF32zElrQvVn/Y6EpOKEVSYmsRUDNCwBEKhOELS7wSMfe06ZuKXmvSfPdx/Dixfh/+yB+w+ENlMwjPObI3eLxpP+hE5LWfou3flk1NWX9OKAOMPuVYgoYbvD9ORwyIqXEc3f1KZTUqqDDEOjY1upaNkZOFsVgu20wMR50BbntSEttyL3MpkSHG3zNczNzOIhqGhIW7GFF3QdV4nBSupQH3hRg3EyR2+UY+piUVWEmwVfI3zTQUdyhzBnni7bVvrNZIxIJ9ehzeYPm2+cZ3grkfWFGKB1y3OBqxIM8bupITorCHeWEmv3XWdK5zFg+o9bciRIZ5NyzicLpZL9Tbgvgfu4n57nJentZM3C0yJkq5E6H1iOikOE/0K2EVRg8s9T4xQVbQZBFf3pyei/lfWS+Shdy6mYoL9UPtUnm1C0iv+d3zTnEMw74CHv8a7JI0PmpF90m4KbUfV+qS+rcUsvptkkqi4gfi1FGMeihL3/i9ApLGzSDqPCqLNfUGJ43DKJaYQckh8+D5eq/gJNeTO3PRBVrgfJ0K9gTZKGNyn2uvLCnpsxQd5VF/fsL44SuObH+FFhRMplDIWnNMvGPgv/ntjQR4PHmU+HW/6VIAN1XvhsadyG67Im0HVMqnMtNnIHJtA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(3023799007)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xpy9mL2m0mJqLxEg8X2EKRD3s37pu9QqVPflSySDfQCBUN8jIac0xAHFw/e7qd210RCXQKCSeNTPoSRogf+x+B6cPVYE2g7XF1uqVbDCOQ08NPvagt3mO0RoDVdIpnJBBfQIiW2AoAC8zpE4pf31pKZl50JVtNCHqVmPmT51bmkG0VER4TCkPsmEeDhd+jwdfp3Yrso4B9dHCvkfNVtLamCaSdMQEds2FZgghCzxPM/Zil4DHbEmuZq9PgIHDFG37QVjytPqBkTFz3t9wGS1W08m78GzJ0wgBosE2bEPIIEU8NGZbjUeaDDkNlTMmOET1UlLgRsaYe+SwaV2cAjE3H06PVKOguMP0uEL7deqenC6MvlySd+GiahwG4iQj+2KEJXpxolPw/f9e5JzZnzA2qvjyuSCGW4uc1NYdZZD2b6qq5hRy3M9js2kL7ieU/o8
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 02:35:23.2325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c77602-24f6-47e3-ca90-08df0964015d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5159

Add device tree binding for the CIX Sky1 USB3 PHY, a multi-port
SuperSpeedPlus PHY supporting up to two USB3 lanes.

Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
 .../bindings/phy/cix,sky1-usb3-phy.yaml       | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
new file mode 100644
index 000000000000..5b025a48c844
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
@@ -0,0 +1,107 @@
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
+description:
+  The CIX Sky1 USB3 PHY is a multi-port SuperSpeedPlus PHY that
+  supports up to two USB3 lanes. Each port is represented as a
+  child node of the PHY controller.
+
+properties:
+  compatible:
+    const: cix,sky1-usb3-phy
+
+  reg:
+    maxItems: 1
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^usb-port@[0-9a-f]+$":
+    type: object
+    description:
+      A single USB3 PHY port/lane.
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
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - "#address-cells"
+  - "#size-cells"
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
+        #address-cells = <1>;
+        clocks = <&scmi_clk CLK_TREE_USB3A_PHY3_GATE>,
+                 <&scmi_clk CLK_TREE_USB3A_PHY_x2_REF>;
+        clock-names = "apb", "ref";
+        resets = <&s5_syscon SKY1_USBPHY_SS_RST_N>,
+                 <&s5_syscon SKY1_USBPHY_SS_PST_N>;
+        reset-names = "core", "apb";
+        #size-cells = <0>;
+
+        usb-port@0 {
+            reg = <0>;
+            #phy-cells = <0>;
+        };
+
+        usb-port@1 {
+            reg = <1>;
+            #phy-cells = <0>;
+        };
+    };
-- 
2.54.0

