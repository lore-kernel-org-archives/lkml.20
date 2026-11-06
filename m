Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.100
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793959939;
	b=TqneCtjDMBzUu+3+vkHDDjFxF9PGxYG05ekagzPiWbkc0zOc8GgYUgsR8AMMcqyIrwho
	 C+CVMWWmdumW6OUQ8NAboXjVGr4vk/q0azOssw6xbjFNrrr04CE29CfforgZKotybwLSo
	 oRpWOJQEwb7gz+XW2FW2cdQIRx9yPHLSnGyX/vcwFw+4kOAZjStBvbNZm62nSAziGzL3p
	 QIXP8tOaabmhO9Yvb3X5kaoMtd7A+v1Vi+e1jmss4N7z53BQo6d7lDife5784lmHA/+7n
	 nUHv1QniTb/+QaI2xs7CkRFl4AhuUCJTLQHZ930V36r1WRjRcBBvvyDnH5RoZiDhGRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959939;
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
	bh=ohKLCzWVZCN7dPy5umZEkZ+ikQpFFhNocTY0Z9ZMcmg=;
	b=yR3OvWx2llIT7ks47rnPBYVT2fveemFFcMchTInG9vdQ0zYDSqmbaZxySshppkCQST0d
	 CK8g0lutl4K4gFf+/6yMHwf2EVXmTyGpqLrS50EM4OQacX1KAGevoRBvI9iKCaIGfVwAr
	 y9WASryFtIyQ49cg+PALHnnY5dhelRDA1qFlaUyp6MBV5eLSHVgeK2R8EfTdlQjHmqeb7
	 6CA0tnO4UUPadSMFW0a7WPk8VzvLj+ZVxL31Q3HW/Eg0xE8mgdmzkCOoexqpCDPrVoqsr
	 T79Z++WcMEMLkB8tXJMMbEOlKBMJrOlR6Rrr8/LbnL5sphk8KICRkLdfls4sL+J9gpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.100
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023100.outbound.protection.outlook.com [40.107.44.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBD9606A32C;
	Fri,  6 Nov 2026 10:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DBD9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vexHuGAG8xNr4mWk6OK604ow9uN/YjVJICcyy8mZZQ0MjSNY+HCSaF9lXj3fli/CbcOgYK+l2BRPZowv4wTUFrPgqX52ERX86EonVg//mgIloSev6zRd4O7k6uaMwcpORbz5vLlEz1CKRYmCv38HDwdTVHXIX43UBjLeOV3SHwNfCfjUiNOHKUF3i4M9aQjmHTUhqbf+1Smlb55rEu0ur9Jq28WXecGwKPzGLac+UtSvXdIy/QOEZ5ACWTIqyjfPbarFweANp6sPVSZ6hZcqgDzKDMlYyJEUTAjIYkSQaCdeIfTleGxm/SVfnv7IYPi7eHwKxJ8DTlByv8kYOGYflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohKLCzWVZCN7dPy5umZEkZ+ikQpFFhNocTY0Z9ZMcmg=;
 b=GD/ZH11sqF3bgU50ITJuDuvtfVFTPNfP9BlSK292Y9TzQPlJ5DknrEJacX8Gj7W0EPCWAHXq5RKJ3wGC0NbyytQ9pYvBqDXEPkNuiEfx2AzwxoBzH2mtvOmpHhbXiieCw/2hbM9l/h85bjR+O/jjvlElHNQ202oGEskMyXlNvjiO7si2s+8wZBhsNglj2k2B4boufGtLssd8GkxUt5Xgqaj9Cl3cKxN4RSOqEew+oFonm47BsW7wRdvbIQYb5zvc2t8pZTMdAPAbhAUsH9uFpbE+GoiIs2CIVlYtevkvxbEenVXWRnk/K7/pk/ztkJgZqh3uUieTKu5hPMyXJLEFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0008.apcprd02.prod.outlook.com (2603:1096:4:1f7::14)
 by SE2PPF06C2A6398.apcprd06.prod.outlook.com (2603:1096:108:1::7c4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 10:12:15 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:1f7:cafe::75) by SI1PR02CA0008.outlook.office365.com
 (2603:1096:4:1f7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 10:12:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:12:13 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E3AAF4102E68;
	Fri,  6 Nov 2026 18:12:11 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Gary Yang <Gary.Yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	hongliang.yang@cixtech.com
Subject: [PATCH v7 1/2] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Date: Fri,  6 Nov 2026 18:12:09 +0800
Message-ID: <20261106101210.1059256-2-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106101210.1059256-1-hongliang.yang@cixtech.com>
References: <20261106101210.1059256-1-hongliang.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|SE2PPF06C2A6398:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 48a7e083-d3e5-48dc-9f5b-08df3bee6d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|10067099003|921020|261026140227099003|261009223027099003|261022105027099003|261021121427099003|261102123227099003|261028144727099003|261026121527099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	4QnB1mAANZRDCEqzmSs9MRzyXyd7l3VxxfoYdZJDuTFdb/RoqOL/bMFFzS3VM4UZ1lCkz7Y6rkRba9T7NhwlKMi1y1bPnEmfiJGr8VGnSzHlfkwmBptSQqSJI3+PJc+NKQc3tzR2RSxwt6gSdlBLKqxCpTNYt0YhJhv5+cZEbXlxeJGv654knSpIbTdSXhG7gbDEDybqjoGPyKoymFvi7t+t4WU0Hsi1fpg3bZT60Eu4135I2gDDKyrL6j4sPn/AlzCPYg4fvHSMXcwT/6H85zL6kXYL/nkhr8jY6+oShrliErfu9TFucIM2QtMuFd1zZcCkUXNoz1DsZoWNYk1+ePMXP4AbFuI8LtdtXEGioJNO05vAx5v6NEg/bnVXHLWXQLiQJNrdOPZRkNACHgfRDhPl0HCp4p7gj9j20b6D5gshR219cfZBTWcaGd780f3yC6DoqJxtk1wcgZd3JMtD0Cd3obJWyoY6lgixF/izmsftwAMeLWvZEHefhouGcPKwzHK93y0ceIzcd5hH4C24bVJ4ykGZh4dEuLjs/hkIaL0e4tX2vVk38uduigtI5szE3lmkuh8AYTYSEZr70lrRroAdD129eqTLtJ2zIvlF2JENn6CS8UClT/E5zgheHq8iKy/qXMB+S91Fl2xYgtQ35Z2xRKvGmlOa01jTK/GY4BWXhvr6M6mCNQB588hDedGT
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(10067099003)(921020)(261026140227099003)(261009223027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026121527099003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kPNmHjNP2SFvr86wKfGW9vMpg7rq+f+b35bJKGvrIxtLcIYrmbL1kjCpgRoPEFdDLIA7yJuaPbVF+Zv4FqxPDvwvb01vcb8G3ozt56htTaRRP4u1+wPzx4tXTB8Rp6OccZhQB60uD+IVankm2nsRWRt1C78RpfQDc3uqiVHfKJKgU9PuLOQ/ATfkVq+LHLc7BlODM3uFm6B+6JLPctS/0OXvAZ+2cDQA3IphLOoO9ZGnDXEfEj9Fd5QsVD3wA43OwFNdKqyv+qnTUObPqve0s8Nkk0SJ8wDY/xhAx7+FTJhOy4f6aQojabraXgvgYm9r9DDEtjmB5JSUs/FKLeoicaoSgb/t9oGZnUEX/8CUchZXWRH5gSe4YkVksEy9e7rFjeGV6w7Qq9PaW9kB9Sz2tJJDr1CMBqt07+xqnAP3Xx8/IXHU7V0gDF06S4W54xAA
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:12:13.0434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a7e083-d3e5-48dc-9f5b-08df3bee6d88
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF06C2A6398

Add device tree binding for the CIX Sky1 Cadence USBSSP controller.
Each instance wraps one of the two USB3 Type-A DRD controllers of the
SoC and owns a register range in the USB30 Type-A DRD RCSU block at
0x091c0000:

  offset  register       contents                       controller
  0x0300  STRAP_PIN0     stream ID (SID/SSID)           USB4
  0x0304  STRAP_PIN1     stream ID (SID/SSID)           USB5
  0x030c  STRAP_PIN3     clock enables, ctrl and PHYs   USB4, USB5
  0x0314  STRAP_PIN5     awcache[3:0], arcache[7:4]     USB4
  0x0324  STRAP_PIN9     awcache[3:0], arcache[7:4]     USB5
  0x0328  STRAP_PIN10    USB2 PLL controls              USB4
  0x0400  STRAP_STATUS0  AXI clock enable/valid/req     USB4
  0x0410  STRAP_STATUS4  AXI clock enable/valid/req     USB5

Controller 0 of the block is used by USB4, controller 1 is used by
USB5. The range of each instance starts at its own AXI cache attribute
strap register and ends after its own AXI clock status register, so the
two ranges overlap: the strap and status registers of the two
controllers are interleaved in the block.

The Cadence USBSSP core itself is described by a child node at its own
address. Mode strap controls are programmed through the Sky1 S5 system
controller referenced by the cix,usb-syscon phandle, whose arguments
give the register offset and the bit position of the strap field.

Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
Changes in v7:
- Describe the registers of each controller as one address range
  starting at its AXI cache attribute strap register, instead of two
  16-byte register slots, and drop the reg-names property.
- Document the register map of the shared RCSU block and the resulting
  overlap of the two ranges.
- Do not touch the S5 system controller binding.

Changes in v6:
- Describe the glue registers at their real addresses instead of
  wrapping them in a simple-bus container with translated offsets.
- Document the register offset and bit position arguments of the
  cix,usb-syscon phandle.
- Document the ssp-disable and u3-port-disable properties read by the
  glue driver.
- Fix the property order reported by sashiko.
---
 .../bindings/usb/cix,sky1-usbssp.yaml         | 154 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 155 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml

diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
new file mode 100644
index 000000000000..137ef9ac1335
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
@@ -0,0 +1,154 @@
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
+description: |
+  The CIX Sky1 USBSSP controller is based on the Cadence USBSSP DRD
+  controller. Each instance wraps one of the two USB3 Type-A DRD
+  controllers of the SoC.
+
+  The register range of an instance is a window in the USB30 Type-A DRD
+  RCSU block at 0x091c0000, starting at the AXI cache attribute strap
+  register of the instance and ending after its AXI clock status
+  register. The strap registers of the two controllers and of their PHYs
+  are interleaved in that block, so the ranges of the two instances
+  overlap.
+
+  The Cadence USBSSP core itself is described by a child node at its own
+  address. Mode strap controls are programmed through the Sky1 S5 system
+  controller referenced by the cix,usb-syscon phandle, whose arguments
+  give the register offset and the bit position of the strap field.
+
+properties:
+  compatible:
+    const: cix,sky1-usbssp
+
+  reg:
+    maxItems: 1
+    description:
+      Window from the AXI cache attribute strap register of this instance
+      up to and including its AXI clock status register.
+
+  ranges: true
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
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
+  ssp-disable:
+    type: boolean
+    description: Disable SuperSpeed Plus mode of the controller.
+
+  u3-port-disable:
+    type: boolean
+    description: The board does not route the USB3 port of the controller.
+
+  cix,usb-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Phandle to the Sky1 S5 system controller followed by the register
+      offset and the bit position of the USB mode strap field.
+    items:
+      - items:
+          - description: Phandle to the Sky1 S5 system controller
+          - description: Register offset of the USB mode strap field
+          - description: Bit position of the USB mode strap field
+
+required:
+  - compatible
+  - reg
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - cix,usb-syscon
+
+patternProperties:
+  "^usb@[0-9a-f]+$":
+    $ref: cdns,usb3.yaml#
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
+            reg = <0x00 0x91c0314 0x00 0x100>;
+            ranges;
+            #address-cells = <2>;
+            #size-cells = <2>;
+
+            clocks = <&scmi_clk CLK_TREE_USB3A_H0_CLK_SOF>,
+                     <&scmi_clk CLK_TREE_USB3A_0_AXI_GATE>,
+                     <&scmi_clk CLK_TREE_USB3A_H0_CLK_LPM>,
+                     <&scmi_clk CLK_TREE_USB3A_0_APB_GATE>;
+            clock-names = "sof", "axi", "lpm", "apb";
+            resets = <&src SKY1_USBC_SS2_PRST_N>,
+                     <&src SKY1_USBC_SS2_RST_N>;
+            reset-names = "apb", "core";
+            cix,usb-syscon = <&src 0x424 8>;
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
index 93abbb315065..5144d02fc998 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2903,6 +2903,7 @@ S:	Maintained
 T:	git https://github.com/cixtech/linux-mainline.git
 F:	Documentation/devicetree/bindings/arm/cix.yaml
 F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
+F:	Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
 F:	arch/arm64/boot/dts/cix/
 F:	drivers/mailbox/cix-mailbox.c
 K:	\bcix\b
-- 
2.54.0

