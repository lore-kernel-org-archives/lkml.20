Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022093.outbound.protection.outlook.com [40.107.75.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECCC3515E9;
	Mon, 31 Aug 2026 08:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164602; cv=fail; b=Hh20w9ItIi+LM/jd6KllvStaBKygvN4bS1889w1YDWaZt2tDt1UBsfKgF2ko+xTH1J9nke8bKBRfme6MOOAsrA9vHbzmi9dEkCOZI3Gg/+UmVvH0nybPJev9KhL2ssdw4NJRoyziKTfuHErVVeEVe1Dy03q4cG69RsYbyXnNLMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164602; c=relaxed/simple;
	bh=TmWd8KFS7tjGmtP/zSJ77ijkBnQjTGG+d8IhujhpkBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tJKfLfYKqayX1TOPSVnBVT5iu+ctT1k+NCGLrPYqtf0zgTn/SpO/9jhhtMR/gbpAVXxFno3Zn04ozQq38BzOz8aQMaRDuAV2mfUHChhBJSuta8pEzN/IJCRfynCQSmK/ho+rC7iSJZGI2iQCpR1x0gYLA46qVWyvo5Lyi1OcbRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRoFD+l/dAVVzCGqNZghDrYyMcpd+DJqwpdQSm5JJudb4o0Q2ShQ09u9VFZ9oljtdYqcW4+TlHr21eTk7sfFGpd6+v9SNF3k9vovgVyMsbiazxgvIt7U0r3TaBekD0S0d/qhMs1H8G0/hSnwQrn7Owl3BJzenMlkMSFUyWJQYOIW3j01+dZ4XxcloaGdFjmLsyBERKUR3hFyfd+sN5IwOmPw00CLpwQufff0TOJk98MYJYnIiIXfRdfPhN2edsqSRGTZ7hYySXCNgm2spfuWE59DqUxeYnoGyHJBSbRrajh17vOfV9M//3T31sMJy50XF+jevi5v54uG1d1r54hXXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B55+arUK3YkHN/MAPMahJGjzFPVfakFNLdAKRzFm5XY=;
 b=CURrQzS72Ckd8Jfg+WUXcI0yFcBUo0sQQW1CIrsIOFK+0HKpHBJx9J97+wzo7Ccb67ZKz0EX2WFAwudWfU7aEO8LE43giD6GixHDSY4HzSoITbiN1YKFOX/dRhVft2LV76tP+eNnpdfSQPBcloh1kNA+f+TSNDRLPJkMnLVh/Yslyjc0YFWIy35BIHwVMPNvyxJUK+UEpYectjo+lwakIYPaHx56gxTz3dZPdaje3WP5wmtNiRczQxIqMIO0SuMJ/07R0ds9n0cX9pSOyu1da4HXYK4D4F7Q0ZqPefqPLMdkIrZ3HtAlFkVKEJl0DWtW0MVlORFxM7GwpSyKU7yWJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR04CA0011.apcprd04.prod.outlook.com (2603:1096:990:4::8) by
 KUYPR06MB9205.apcprd06.prod.outlook.com (2603:1096:d10:8f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Mon, 31 Aug 2026 08:23:12 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:990:4:cafe::44) by JH0PR04CA0011.outlook.office365.com
 (2603:1096:990:4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 08:23:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 08:23:11 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2B3A84092109;
	Mon, 31 Aug 2026 16:23:10 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: peter.chen@kernel.org,
	pawell@cadence.com,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: gregkh@linuxfoundation.org,
	rogerq@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	fugang.duan@cixtech.com,
	cix-kernel-upstream@cixtech.com,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hongliang Yang <hongliang.yang@cixtech.com>
Subject: [PATCH v1 1/4] dt-bindings: Add CIX Sky1 USB bindings
Date: Mon, 31 Aug 2026 16:23:05 +0800
Message-ID: <20260831082309.3854507-2-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
References: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|KUYPR06MB9205:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 33fb1285-9594-450d-775e-08df0739189b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|7416014|23010399003|6133799003|10067099003|56012099006|22082099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	/kiRrZf6+DlR4cFjjgduupO2rntpJKkadYFuNkUrqz57F3/gZJNVipvF/bvzmQxWmDZcF99mB7+VrzJD9gr4AYr5jMndnJbo0ureiaW1qprXcL7llLy/63rszh56wHOyIhm9MODPSOPlSOg1sMJTxwhwEDC0u1CE1bJDyeEL0eunYWETZC44f/PzHQ53Q5bYWTld+BQ0v2L/55V0ODcGteoX8K8EJTvtBx1mDeztyE8lvTNTFFlKJdevAVbnK8xOXtdF34wt25Rz4HNWQyFhBT6l7RkhHgUHprHQgyJtvdWh+Zu9VcFWLLZRgLXBtDwo8W3QO5TCegaH2dtYlA8WFxs8/srCOeFwlrgbfPKngbOCnHvYzh3ILPWbYIXvlxVAM1XzW9gnJNJN2+ARMsbZZi1a618mOlcIwgB/cBCYQmF2M4WluYaDYeV5aGHkB+QGCX3GjibQCW7yEPZ8j5OxcjsYcpD2WX28i97LDxcvzBy/hGkFrUgd9nZ02fMEgt/na6pXt3VQ5uDRfHq+3CSg/9sG5pISnbFEKwJrOlc5jprfLtnm992McxOSwCFIkO1ypG7GA/P4fDb9iMI3d0Sxba7bjBd2ThsoulfwOgxB4mEed5m0k4GNJtJMQN6BcertKU0c5hOJM2Wj+DF67V6H/Q==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(7416014)(23010399003)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4y84oh43pa+ozhPbEf0Cq3BW3OW6KpGGOuI5a1GnV/x/oxi9EHCfIJ6IV7fdkQsgZnD+HuAZqcGGXnHoaubZZzYJOtZH6uigEjFK/M7aoOz+yhAQ6XNBiGQWtO5YM4Ya9nu7+oOd4fuf9j2iwI4iq4S4WExDnBqaFE7/wwBy6A+01IAh1O6D/bxkUsq3DRHttho/m1+V+DDPNhu1xLXu39elrnp4XGHd0hFeBWg7oRGxTpkp/Gchj4fpOxjpK7RVldpA7IHglZrulC9quEGlIiYc5NqE2P2DBQFTNP0oF10UNnYNcSr4KArGregIWwF9o8khvLUepFCNl+XkRIkB7NxF+To0x/f/jgRgfgOuEvFQHF7OClxayzjG1BBs1acpp7tgYsBdCLc/7YpZSDOpr7Hk7UZ7+O9shWPJF6gjr54+oOMbb9GR6TUwJKrdug0G
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 08:23:11.4963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fb1285-9594-450d-775e-08df0739189b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB9205

Add device tree bindings for CIX Sky1 USB3 PHY and Cadence USBSSP
controller glue layer.

Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
 .../bindings/phy/cix,sky1-usb3-phy.yaml       | 109 +++++++++++++
 .../bindings/usb/cix,sky1-usbssp.yaml         | 153 ++++++++++++++++++
 MAINTAINERS                                   |   3 +
 3 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml

diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
new file mode 100644
index 000000000000..76d020df72dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
@@ -0,0 +1,109 @@
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
+      - const: apb_clk
+      - const: ref_clk
+
+  resets:
+    items:
+      - description: PHY reset
+      - description: PHY APB preset
+
+  reset-names:
+    items:
+      - const: reset
+      - const: preset
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    usb-phy@9210000 {
+        compatible = "cix,sky1-usb3-phy";
+        reg = <0x09210000 0x40000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        resets = <&s5_syscon SKY1_USBPHY_SS_RST_N>,
+                 <&s5_syscon SKY1_USBPHY_SS_PST_N>;
+        reset-names = "reset", "preset";
+
+        clocks = <&scmi_clk CLK_TREE_USB3A_PHY3_GATE>,
+                 <&scmi_clk CLK_TREE_USB3A_PHY_x2_REF>;
+        clock-names = "apb_clk", "ref_clk";
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
diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
new file mode 100644
index 000000000000..47202ff5b9e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/cix,sky1-usbssp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 Cadence USBSSP Controller
+
+maintainers:
+  - Hongliang Yang <hongliang.yang@cixtech.com>
+
+description:
+  The CIX Sky1 USBSSP controller is based on the Cadence USBSSP DRD
+  controller. The integration adds glue registers and mode strap controls
+  in the Sky1 S5 system controller. The CIX glue node wraps a Cadence
+  USBSSP core as a child node.
+
+properties:
+  compatible:
+    const: cix,sky1-usbssp
+
+  reg:
+    items:
+      - description: AXI property configuration register
+      - description: Controller status register
+
+  reg-names:
+    items:
+      - const: axi_property
+      - const: controller_status
+
+  clocks:
+    items:
+      - description: Start-of-frame clock
+      - description: AXI bus clock
+      - description: Low-power mode clock
+      - description: APB register interface clock
+
+  clock-names:
+    items:
+      - const: sof_clk
+      - const: usb_aclk
+      - const: lpm_clk
+      - const: usb_pclk
+
+  resets:
+    items:
+      - description: APB register reset
+      - description: Controller reset
+
+  reset-names:
+    items:
+      - const: usb_preset
+      - const: usb_reset
+
+  cix,usb_syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the Sky1 S5 system controller used to program USB mode
+      strap controls.
+
+  axi_bmax_value:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0x7
+    description:
+      AXI bus maximum burst length configuration value.
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+patternProperties:
+  "^usb-controller@[0-9a-f]+$":
+    $ref: cdns,usb3.yaml#
+    description:
+      The Cadence USBSSP core controller node. See cdns,usb3.yaml
+      for properties such as dr_mode, maximum-speed, phys, and interrupts.
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - cix,usb_syscon
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@91c0300 {
+            compatible = "cix,sky1-usbssp";
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            reg = <0x00 0x091c0314 0x00 0x4>,
+                  <0x00 0x091c0400 0x00 0x4>;
+            reg-names = "axi_property", "controller_status";
+
+            resets = <&src SKY1_USBC_SS2_PRST_N>,
+                     <&src SKY1_USBC_SS2_RST_N>;
+            reset-names = "usb_preset", "usb_reset";
+
+            clocks = <&scmi_clk CLK_TREE_USB3A_H0_CLK_SOF>,
+                     <&scmi_clk CLK_TREE_USB3A_0_AXI_GATE>,
+                     <&scmi_clk CLK_TREE_USB3A_H0_CLK_LPM>,
+                     <&scmi_clk CLK_TREE_USB3A_0_APB_GATE>;
+            clock-names = "sof_clk", "usb_aclk", "lpm_clk", "usb_pclk";
+
+            cix,usb_syscon = <&src>;
+            axi_bmax_value = <0x7>;
+
+            usb-controller@91d0000 {
+                compatible = "cdns,usb3";
+                reg = <0x00 0x91d0000 0x00 0x4000>,
+                      <0x00 0x91d8000 0x00 0x8000>,
+                      <0x00 0x91d4000 0x00 0x4000>;
+                reg-names = "otg", "xhci", "dev";
+
+                interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+                             <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
+                             <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+                             <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-names = "host", "peripheral", "otg", "wakeup";
+
+                /* Cadence USBSSP core properties - see cdns,usb3.yaml */
+                maximum-speed = "super-speed-plus";
+                dr_mode = "otg";
+
+                phys = <&usb3_phy4_0>, <&usb2_phy6>;
+                phy-names = "cdns3,usb3-phy", "cdns3,usb2-phy";
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..4c5f6cbe9124 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2775,8 +2775,11 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git
 F:	Documentation/devicetree/bindings/arm/cix.yaml
 F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
+F:	Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
+F:	Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
 F:	arch/arm64/boot/dts/cix/
 F:	drivers/mailbox/cix-mailbox.c
+F:	drivers/phy/cix/
 K:	\bcix\b
 
 ARM/CLKDEV SUPPORT
-- 
2.54.0

