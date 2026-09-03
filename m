Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022122.outbound.protection.outlook.com [52.101.126.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E2132B130;
	Thu,  3 Sep 2026 02:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788402936; cv=fail; b=V20Do1N3OOu+Y/4b4ofUpKM8R2KxFwLUqYyef/XTKqjyvFHc6lVOVXk2hB8YGfSng/AViI6r81BoOn9EagpFUDDGeuDnoF4KTsemmckygfTfqPz1Amx4mieUX+kYT3QnA5pIm4/ir0ZYTL4MFBJT5rv3lzGP+N86E5CwbGSUJ98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788402936; c=relaxed/simple;
	bh=nvAQMsQ0B8QeCJ7BHM7OrPRB6i6MoILeQWILuuHdWpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D+u1Dkc4OuYgxBgnFTqoHjVY5y+jqN+QnpcxtyNvwEuBlP9d/4sG6mUuXm7yr5ShWExAM3Z8nDvHoQbBFkpxDo3jlD0lVjiI7/TAVu69Emo4EnPnNhZJ805jV4bxAgwZvvS5IesIVpWZoVPCuAs8Bl0hi5SD4BsEYxDPGfKHU+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G91B0vXuQfed1SWCpiNvzOGA8NPbdVZ4eFAiG7rsoBO9A9Bstx10G3s1ADYpRycGcPQy4z6/IA7kQIP0oFkk3/gG/BV+q29RFC8Q7P1NRTFHSYIMbyJkq1oXfy+09lNxNUUkFaVY0KrLYSb0HVnO+4dvFacVuwwXIUWvcdYUkGNeMuttZMEtXPfGxcu55Wf+q+SLvRuPgZNBJcTZAETvjjKl5xbQmAHIrlANErCQjNYFnDU4yxJ3Q/xMODpyKiAZdP9DJYe8nZJ2HQtpxtxx07AxidBKhnweq0wH67Fl+rhmM0HbrWO0+sU3XFrcSagVcc8NfWD4pM8be+rayEfndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlHZyN2fPM5TUY64AyRcXs5BLF8phoQH4+JdQXV8uBY=;
 b=yJQIwFpMX6uI1XeKQt+u8l2iBPy3yjg0Ra90mA68rwGehK09rZSnohXECEdxmz0uPvNCqIhYe1rXxKnD282k1QrNRfsRS7IcWoeLRYmUZUvLWgW0ixipmRkeUYg3PJFTx3E9pLtuune0NG70bkeauBkWGIHnuWImbsVmkxiQMVfDJiqKiJgnLB07Fmu6bYd2BpzQIOcNCPOZsANuUMU70TqHl79iKlvb6qgyyCkzIxfoKzN7DJSHZTQhDHX+jvgLCVU6nbaUBzPSm29ELnGFB5qCkdn2BCoXgYGnT8SOOpC+vjm7IGJUn68iE6JbvI9haxtcTavtPTBT0DPGxC7mhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) by SEYPR06MB8224.apcprd06.prod.outlook.com
 (2603:1096:101:2f4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 02:35:28 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::34) by SI2PR01CA0047.outlook.office365.com
 (2603:1096:4:193::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 02:35:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 02:35:25 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A77AD4092111;
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
Subject: [PATCH v3 2/5] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Date: Thu,  3 Sep 2026 10:35:18 +0800
Message-ID: <20260903023521.2064986-3-hongliang.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|SEYPR06MB8224:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5793627a-4dbb-469d-2b51-08df096402f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|7416014|376014|1800799024|6133799003|22082099003|18002099003|3023799007|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	r62sWIM3wKUg4g/Byhd5Q6oKDk1ISj/f+YjSOhvAZ0gD1fExTkOmUwJcdzl/e47NA4pVTUyydOYQRbCmXKmvOpMpTXfjJNnjzGR5M9VLKMkUa9mMwXMRHtlqWjhFiM5TUKRUfG8DV5uU2/CdoXz+rO4nA+qvccr1LpPKmk/c3K79+yjfKJKCJZn+GTtR8COYYGTSu4Pjy3rn2ahTj7iMxke644qzA/Mi3agj69Mpjutj5no/x5qBH++sEM+Axr70gCs3q4+3oSbSwzuFLdL+/BeEzG8Xoi4BohdVXN3kjVbSnvC0JhZVzE8ED8f68KFQsTan9e25NDEneVVEU+93hXQF1b+wjtLKhDqsnRgBCrXtwm2XWTl1TsMjrZc4z+JYXNLs0ILdaOqvv9N15zXa1qNY8uuydJPD1LhfwQhLYCymSELNMUps29LLnbDWch9t13DQ8GZU4Fp0YfccBZc6FBFzgwdZawZGrEnpoHp1nLIWuI3C/zEvP4oeid7ls5GqJUjuFN1Tj0ymJwYT9ELbLpz0S60iOILDcbqOi3fsrLZAnfF2soDLnJz8pnOCPITs8WN/zWyx94r2A9IldK9rphee5AD90xvjojpOzOdAwl+bgMpDw3lPxGU6DCJxN52+g5i6GC0MJUOWv6/KxXJjJQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(7416014)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LrbjbaOkgPFDJ72IRgxxyAx2U155rJazOUo1gtex2A5O06inBy4ck3UWU2hRxBGyJzOwhuq3XrIndmUtvbJELG7PMw0CBroHItUqyIzC/lSoujuq2M2mfvl4lFCCsFKg8N7ke5EZhL0E6KL8UMcQBE9O4f07KrR/dFfGUUq9gvP7vlqx/ogSxEAcJxcJkdHK+p1X7JHDWQlki5YdzX3zHFUHtTBuzM8/vpQ24i/vmgGJ2gsbV6Vl9mXD+1cf0bYp1f2IE1WSwmrvQDKz0DiXStOh+IiWg2MFJP1pnhZwF7LEI+WMiZcQEtt0+YM6TmZh9aLdIjusokaKYW/N6b4SRh7d2KSrXKWLvQ7DzPLgUSVOiF7D6qyLAWa35EHL9COgvvkn4Ubhg2GvP+bhzeLsNVjN+SqukJ6s01aZ3NLJTYa8upzT/tpYe3A6aioRki/k
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 02:35:25.7600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5793627a-4dbb-469d-2b51-08df096402f7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB8224

Add device tree binding for the CIX Sky1 Cadence USBSSP controller
glue layer. The integration adds glue registers and mode strap
controls in the Sky1 S5 system controller. The CIX glue node wraps
a Cadence USBSSP core as a child node.

Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
 .../bindings/usb/cix,sky1-usbssp.yaml         | 137 ++++++++++++++++++
 MAINTAINERS                                   |   3 +
 2 files changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml

diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
new file mode 100644
index 000000000000..73231a2741bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
@@ -0,0 +1,137 @@
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
+      - const: axi
+      - const: controller
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
+      - const: sof
+      - const: axi
+      - const: lpm
+      - const: apb
+
+  resets:
+    items:
+      - description: APB register reset
+      - description: Controller reset
+
+  reset-names:
+    items:
+      - const: apb
+      - const: core
+
+  cix,usb-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the Sky1 S5 system controller used to program USB mode
+      strap controls.
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
+  "^usb@[0-9a-f]+$":
+    $ref: cdns,usb3.yaml#
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - cix,usb-syscon
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
+        usb@91c0314 {
+            compatible = "cix,sky1-usbssp";
+            reg = <0x00 0x091c0314 0x00 0x4>,
+                  <0x00 0x091c0400 0x00 0x4>;
+            reg-names = "axi", "controller";
+            ranges;
+            #address-cells = <2>;
+
+            clocks = <&scmi_clk CLK_TREE_USB3A_H0_CLK_SOF>,
+                     <&scmi_clk CLK_TREE_USB3A_0_AXI_GATE>,
+                     <&scmi_clk CLK_TREE_USB3A_H0_CLK_LPM>,
+                     <&scmi_clk CLK_TREE_USB3A_0_APB_GATE>;
+            clock-names = "sof", "axi", "lpm", "apb";
+            resets = <&src SKY1_USBC_SS2_PRST_N>,
+                     <&src SKY1_USBC_SS2_RST_N>;
+            reset-names = "apb", "core";
+            #size-cells = <2>;
+            cix,usb-syscon = <&src>;
+
+            usb@91d0000 {
+                compatible = "cdns,usb3";
+                reg = <0x00 0x91d0000 0x00 0x4000>,
+                      <0x00 0x91d8000 0x00 0x8000>,
+                      <0x00 0x91d4000 0x00 0x4000>;
+                reg-names = "otg", "xhci", "dev";
+                dr_mode = "otg";
+
+                interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+                             <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
+                             <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+                             <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-names = "host", "peripheral", "otg", "wakeup";
+                maximum-speed = "super-speed-plus";
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

