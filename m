Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.105
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794450109;
	b=aCqSJyHkK6XjcOQGe6za8eQhurPqw5OLrUXHXjyhv/4Uc57D5bPRl2ZtVG/S3fnRizU6
	 OIklC8RScoyBKm5/03auvaDyqV4P/6cJno/pbU2IYbLTYK02GhC5HJ8hZQXhxqeqFCHor
	 sOv3d5iOAnPLmGBz/uBwWNA/2IhWRMpFIIz17VPCFmCjogAYmlDxverO9EXVOLfxjkm4f
	 JqnePzuwE9rpEOmT6AwJYbw/eGkQFm0KrYLbXTdd0txLSY6Xxs/Pp33OPDcZHAdblzhWp
	 A/Qbf7rP0brJQ7WhwVO0q9ww7KgB5R9sY9CkCpgcUD5nzczwGkPZ+3uUKrvB1DHbRhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450109;
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
	bh=aNAzdSf9YKGebRN7kwtU3xvJdAfntxR/R+bLdrxw++o=;
	b=I5Ld6QzdiXqI5uco4FQ87SvtjLRZBL3tzKlfbamlGm1Sh4h+9xumHWy7CGzHfAX6eIXz
	 oQdJixd98pVYm/PFHBHYRu1Cuq9VWHpgzCw66so4iRCEUM+PDo8E8qWhFgUh6jJtKljpD
	 E7macT+xFke2eYPC/8qJmBlw9xX15fI9V85FrrXDf85L6Kj5xl3P9PPRADljK5erKywE7
	 El90Lj3880/wo+GWJYr44dtLCmzlc4VAzpvn4sEfGzFB5WG4PXdbk/DUBOnYWCYhhnACb
	 AnABcbEug+bnWGwKYJaP6Wtp+j06uSHprzJzAsNk9rrrVtUnQjaqteOjA99JAUHG31Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.105
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023105.outbound.protection.outlook.com [52.101.127.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD8A606A324;
	Thu, 12 Nov 2026 02:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CD8A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxYkregEFOXAVGA3bcwLUKjJuJtDNjoSN6cxMfA47eLc0faqrGUNXj35U03gLL/jtXt5X4cOggP3BPyUb6m0/8wa4OE9TN+aM71OdVZj8ALQXISUIlxbbOT2m4xbsDG0L3Ef4/E/rtoQdHM2yIlFnb9NgIktc2vlg3gq47qk0xGtTZ6YYYNVD+zbA2dGd90Jo5oMW7H19KJoeMZYFv3P2kXSXuuFUlRGF4qaAcQZj7GTPHsvh/yVHHln8e8+zf9wwhW+DkhbOOS7BvbBPssNwuqfufQI27HQ72cizBvCHsPe7dqwhP6EJsmGd1iQWS/c7AmSYrORHeHSKCF7mlqSqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNAzdSf9YKGebRN7kwtU3xvJdAfntxR/R+bLdrxw++o=;
 b=KMhJiEDNNbBYV7ZaHr+opk1k2t6lcuaIVG5RS22JU+jtv8r3+fvcFp7LrvzNpc2WJSHWAiMrJDzMJpPFdHEZyXUqtTDA1ZoOwf/8ayIMMHLHNyU7UYaQXXEK/Hd7cqyTvPXm01PObi0RM99fIXLwDDUJkM0owM7AeAcLKWvYEzbr5R7poDzLcPsaJzBb2qh7YPd0Evj5YExNb7943gFnWkw7olLrNbU4n1AuB7G201mBZDM9yjLMsE2ySFKNcoClYY+dGtacFdmxtudwvIqMZNCq+zE1UXSIOCHm/5snOb7/Iwegb6WS2ecURZEGYJemdv7++2BsWfMAQlMoqe8feg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) by SI4PR06MB8898.apcprd06.prod.outlook.com
 (2603:1096:4:2af::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Thu, 12 Nov
 2026 02:21:46 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:191:cafe::82) by SI2PR01CA0006.outlook.office365.com
 (2603:1096:4:191::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 02:21:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 02:21:43 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BED794102E64;
	Thu, 12 Nov 2026 10:21:42 +0800 (CST)
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
Subject: [PATCH v8 1/2] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Date: Thu, 12 Nov 2026 10:21:40 +0800
Message-ID: <20261112022141.4136099-2-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112022141.4136099-1-hongliang.yang@cixtech.com>
References: <20261112022141.4136099-1-hongliang.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|SI4PR06MB8898:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7ff2ed53-071a-4b3e-685f-08df4063b1ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|36860700016|82310400026|921020|10067099003|56012099006|261022105027099003|261028144727099003|261022075727099003|261026121527099003|261026140227099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	aHprN75cseWYIzOByYgS4Dmen65RbKi2ZeDngb/3Y1dvv9kvBTvO+DGulKUtryAaLqpP82H8GNMUb2LOdDU00nlrrPIpmug8Ck4dwparrWH47jE3K1evP97KoOL97OyDSAwMNeJTKCwXleindwjH0uzr5EsoEPx+IrQ89hSlT1WtIBySDcPtdRje+SHpVoquGCD2OCO9elvtltNCgMjudlDSzI0gTzjM8F03KfXDxrQHuLxkaXE687L/2QOZLKTqeIeri907x7smWeajAmjM5TPBwpGdqBrn+Ut1GgYjBat/1zepGlLBxnKd+dwV8CdUhSsPJZ7/eTxTzdvcwkGeK9SpmzgXM3ytEVdJ0CBbmONgZ/e0oRC1yHACyjyk4zFK8nYZeyKSjlJVwFTwbvRImfuGghFPc946UGHvCAqTUxmuZIJrBlrRNICZyqpZ32+3v1Rsam37PTGklnNxamaKKcj1s6KdpfGKZPCFsDaLtLtLbFr1mCO1chybpyK8fXv4KaT0ZyemMQAl2YV8g4rmnXQ6SiDz3EoWlLqeWsZrspv0q7wvx7ruNB1jLv4aFoVOG8TElrWg9IXvYKCH/yrbztICuKUUFadknh3sCEXmRneNaGDVTqbJ4HT2hxyZ/pqec6bme4bXjg9UIKRwYGMkj9r2z7cWx+XG/4vvULEDQL1WXuCdh0Fh+h4SOwkleZk4
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(921020)(10067099003)(56012099006)(261022105027099003)(261028144727099003)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ylgR0vgEiqUPIbbVcP07O0MlCSsIkSnDN3IdFcu5lREZZGubih1ji6YTv5vWVRjF6YfapNi1CmVtcbxwqo96uZlZgM8un7eiodJu/YW+XnWj5c+6ecXyFILKQXM2AoESqMq7WTcKBdo0V060RaNqQNw6V8y587e4PhLL9vJKD6iQn2q3LI0QtH9+pARGRgSq7daZpsJ+C9C+hypEbDCZL4pyEhZWSG56yCqrijFyOSu3Pz9y28sXK/l6clFPJM76EG5oi6rBvlqT6K7RiAQLpvGrrHXL4v1rsoqWdOXoN9NCqmcmtsjzuCA8kPqQ0WsMO2l25cidBHt83T9JlSyN2I5OJOG055AsA2y9eyYlQFlTu3vzDWZfqQ1fRyFxQvRZidWiHVhTWB0v0xQBgVqxZFTbUqliS2TL9lLDzci3S5UADkdad/ZjIcnE/HCyvpvF
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 02:21:43.7797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff2ed53-071a-4b3e-685f-08df4063b1ec
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR06MB8898

Add device tree binding for the Cadence USBSSP DRD controller integrated
in the CIX Sky1 SoC. Each instance wraps one of the two USB3 Type-A DRD
controllers of the SoC.

The register range of an instance is its window in the USB30 Type-A DRD
RCSU block at 0x091c0000, from the AXI cache attribute strap register of
the instance up to and including its AXI clock status register. The strap
registers of the two controllers and of their PHYs are interleaved in
that block, so the ranges of the two instances overlap.

The Cadence USBSSP core is described by a child node at its own address.
Mode strap controls are programmed through the Sky1 S5 system controller
referenced by the cix,usb-syscon phandle.

Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
Changes in v8:
- Fix the example: the USB3 PHY is a single provider shared by both
  controllers, so the core node references one phandle. The example
  still carried the per-lane two-PHY form that v5 of the PHY series
  used. Keep the USB2 PHY reference and describe it as usb-nop-xceiv,
  since it needs no configuration.
- Add the vendor prefix to the two board properties: cix,ssp-disable
  and cix,u3-port-disable.

Changes in v7:
- Describe the RCSU registers of each controller as one address range
  starting at its AXI cache attribute register, instead of two 16-byte
  register slots, and drop the reg-names property.
- Take the offset of the AXI clock status register from per-compatible
  driver data (0xec on Type-A, 0xf0 on Type-C), instead of two
  reg-names.
- Dropped #syscon-cells from the S5 system controller binding: the
  property does not exist in the kernel, and the series no longer
  touches bindings/soc/cix.
- Removed the arm64 dts from the series: it is a separate SoC patchset.

Changes in v6:
- Dropped the simple-bus RCSU container; each node is placed at the
  address of its glue registers and the core is a child at its own
  address.
- Replaced the usbN aliases and the undocumented id property with the
  register offset and bit position arguments of cix,usb-syscon.
- Converted probe error paths to dev_err_probe().
- Removed the unused over-current GPIO handling and the unused dr_base
  and cdnsp_pdev fields.
- Fixed the 125us prescaler value: time * frequency - 1.
- Made the AXI halt writes read-modify-write so the preserved and RW1C
  bits of XEC_AXI_CAP keep their state.

Changes in v5:
- Dropped the cix,sky1-usbss-rcsu syscon binding and the cix,usb-rcsu
  phandle; the glue registers are described in the controller node.
- Added the MAINTAINERS entry for the glue driver.

Changes in v4:
- Split the combined PHY/USBSSP series into two independent series.
- Restructured the RCSU registers as a shared syscon region with offsets
  (reverted in v5).
- Fixed the indentation reported by checkpatch.

Changes in v3:
- Fixed the interrupt specifiers of the core nodes: the Sky1 GICv3 uses
  four cells, so every entry needs the fourth (empty) cell.

Changes in v2:
- Split the single binding into a PHY binding and a USBSSP binding.
- clock-names: sof/axi/lpm/apb for the controller.
- reset-names: core/apb instead of reset/preset.
- Dropped axi_bmax_value from DT; it is a driver constant.
- Added the MAINTAINERS entries.

Changes in v1: initial version.
---
 .../bindings/usb/cix,sky1-usbssp.yaml         | 163 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml

diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
new file mode 100644
index 000000000000..994c805d30da
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
@@ -0,0 +1,163 @@
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
+  The USB2 PHY of the controller needs no configuration. It is described
+  as a usb-nop-xceiv device and referenced by the core node like any
+  other PHY.
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
+  cix,ssp-disable:
+    type: boolean
+    description: Disable SuperSpeed Plus mode of the controller.
+
+  cix,u3-port-disable:
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
+                phys = <&usb3_phy4>, <&usb2_phy4>;
+                phy-names = "cdns3,usb3-phy", "cdns3,usb2-phy";
+            };
+        };
+
+        usb2_phy4: usb-phy {
+            compatible = "usb-nop-xceiv";
+            #phy-cells = <0>;
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

