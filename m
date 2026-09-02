Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022087.outbound.protection.outlook.com [52.101.126.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4B524DFF9;
	Wed,  2 Sep 2026 03:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319307; cv=fail; b=h6jhAgTdF9Ae3lzURY+QT7wwISocmCfOSI0yB2te8o7Hz1rG9BJKsqm1q1udnBzR6j+bW+fJOVDAneopsVNsXVHfaItvF0tV73JRsqlG3hXJN+rL09sMOP2Au6MYvKJOjp8M31UnU6Cq34yjrci2t/dj+LmEZtGEGLQIUj/XuvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319307; c=relaxed/simple;
	bh=nvAQMsQ0B8QeCJ7BHM7OrPRB6i6MoILeQWILuuHdWpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EkQffDb5aONSOf6jdsZSX933RgOuwckYC7OO38L8TB/yGan86rQGiASjDqQn4AodlwOf+kruIMDmqT41zLStYReaKtBDwtmiBTCMYjTOarCGBiXXgHA9wra/wbhz3FTlWi1R9rxjE0V2abB36ZjjFYaSVGcqtTVqOGfozerNEws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TsTGNpb0rx25/E49ag9JzNouaY95lZferlg181IRm38qYLTKus69WuakaVT7EJ7vejPwcKnSuquKRtRkOvRBJV6/Gp6HHapgkqEbghOk9nBbxBIJPTi44uIFCVmJkTGC7+ICseDywFd/CCWjaWfKgPFp45Mi3IiLVNPkJdFjkxPTfwXPT7OHgVh4h819qAflXYXWYYL61W7/h8yaCykRUvy3NARuvJGzLRgdRx5oLcqNt6rJ35vZTCQgnzZbaCSI9Os2I5dJmEqpoFdxNPO5czPrV1zJrWlBEzM7oJLQqirD2m3STgwzKUxQGiH7z5MnQH08dTQP0MWxVScdFgAy7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlHZyN2fPM5TUY64AyRcXs5BLF8phoQH4+JdQXV8uBY=;
 b=G0QlPPMnSaw6Xr7pclTWCLPXPuzOFmSn10piftQM6uI6s/OCgFnkkd9WF7AOz8k3F6Opts4Nw2qOSTRpL6CO9tAooAxfeZzZdSX9iclm1jvsOrC+PUNWA3M1/7Mo9/lk8uqosgEGRbGfj8erEX80A+K5qxkdTr3ZbsFe7NwS0FwpA3fg0TW6p2RzgXKHWkE7InAdQ1MNPxLmJKyPW7BA0QAXpCSTyCG/DxvzE0VAVFVNQKfgKhLmDxKWt3FuEe8myjCd2/gNhLvcENmLkE8SgTxUbCVLbyu8n7mS4VWHDBo4wywKZpAs3qCCKw8ZleMQWK2yr9H8bDsvuxnSHoc2Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS0PR01CA0191.jpnprd01.prod.outlook.com (2603:1096:604:1c5::9)
 by TY0PR06MB5442.apcprd06.prod.outlook.com (2603:1096:400:31e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 03:21:38 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:604:1c5:cafe::33) by OS0PR01CA0191.outlook.office365.com
 (2603:1096:604:1c5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 03:21:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 03:21:37 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 27B32409210F;
	Wed,  2 Sep 2026 11:21:36 +0800 (CST)
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
Subject: [PATCH v2 2/5] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Date: Wed,  2 Sep 2026 11:21:31 +0800
Message-ID: <20260902032134.1182634-3-hongliang.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|TY0PR06MB5442:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 86f2eadc-9c65-41ca-55b8-08df08a14cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|23010399003|36860700016|22082099003|18002099003|3023799007|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	YvQxbJbPD5d2jYEreNsDbKR4rE4UnIiUz5aJlcUyp/r1xNZh9saJYtZCItEa4XgPhnt+H6iOobIkBXW/FWHG7ZDNf9e5OcX/HXhiHqXr4uOatgzOvUOpgqFvlJwuGarLpuATqUQAh8ZeYJ2prlXRuFVsxJbJbjbMXoMaA2KdjgyRVhwqtNyfL8Rdj0qY8uHB/0obrQVoT9A3DidENlyelAU7TtPtX2094uQpZvxu9SA8WlrspKOTJmLE2ixUGhvilHId7li5VJPIqPZUv8QOQpaXOi002HevYAFVRjcWO7F8JVYflPJXevuik7s/dYaz74voiobdarlfzMBDU8VhwXSVZJiQ+UK2B4YPu28m9gAqkDMdnBPMDNL3uNV/TvdtvHeiv9EWT7zirRimYJB5vbI1NM9rjIjBMkGdSIn/Bp3Alg3I7XaL0kTDJaIhCL/8rye1cn55wvHBKmmONmly4QTD7CfLu+NPl8mQ/fCnYl+YG2MjiFrEepmdmeMKrzjUdYJwIGZNMdaR2zY14IVEWGzuqVM0WJLFNoJbJoY9X7hxif7BbEiBXuRB/LH7yIFRGyQWFlQE5Z8NoFWWXR5gP66mngCC//hDGTk9tjyBmZoRMZjYnjMwRKdEx3yLFuti+oVjnZVNtX0+DBi39hik6g==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(3023799007)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hd/RkgSkeswdpqKYYE5OPLFqYhs5KSVKLMErUth36kg8FBKx1GRJAvACRp7oVKOcVH0duaJCJsSX4Y7AVEBiUj8+PNB1UHGNX2mpqE1PSO/1rQPkdf2EXtpLYP6ZJk6sA+8Ff4WPwjXqtxTW6TqUB/0S29FdIR6bh5QF5cQ6EXqhClP7OSgCwjSbudvxkkNzPXbO7zYXQmRUCaXgM8yz8QWqNEZ7rGWlpz+BfT2EndwqP1S8CjHv2+Kts8/WbpyOuNIgTDRwhwMhKmkZXNweFxvhus7ZWfnkkYdtTabFRjnU4PY3cxeZRIFSh/00tKfP9ht1cxsgm7MeWsJqT26Vu0dAF6QLK1TCuqcIdiy0XUcfb4hSXHnUs6ThKVeqvG4+Ri53ioFvcT+7FXSS9+xzuZYsTzRuBPL9gZTxRBIzkKyA5TLwrlKwQ9l63/5KTih0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 03:21:37.6321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f2eadc-9c65-41ca-55b8-08df08a14cac
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5442

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

