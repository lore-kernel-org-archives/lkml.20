Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794881834;
	b=QCuGZQGnRdtFTxLc7hwgfvMOLPmtVchHokF5gEeV2wEj4lSxhg3VWYBLcNHYVEyxUCUl
	 DcQl/o1FR12royHK+OQQPzSh81r+siDb8Ywx0xMl5bzyrvUhflP37ugtZK4jivHO1Qj8X
	 VUZQ/kONuecQuneWcF1LoVd783l4pPZebh/JCZJIG/Bxi02uLCblG6G4dI/j2HY1bTQXB
	 kGp84PEXjBPrrZfP02K/ytugXdtq4yGhUVgE1r2xLlxQ4/dWNmHq9HHuA4HakXEXCNzCE
	 IUKVYvZPZmZObHG4kTtxtYg3y6cwe0sshmSp0G1vmIfB0ajHZeFK6cLHiVbSZIcFVqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881834;
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
	bh=BqmLrCifD/uJdLacn4JzVUrDjw/JlF6C+7MWZhAQrw0=;
	b=JqEtMkJu164HRiBg8VwLnsa56BdwaHsR+w56vl2WKzAnPFe8xNBulGyma2lJnUYsHQ8V
	 pMGWcv2oOLQ5J5g2ebTtzBdn4GAchp7W8CcPKDL23P+BEu8Z1RlJOp4yRkzPgl/a5nA0T
	 yLcP4LS3B1VIJDTtT0p850DEvswbe84HYaU5IBlRRERsM2L6h1gi8p58/x/tPwl8oJ8br
	 7MNPvcR/C79X1sWLhFrA4z5qdwfFiIYQ9tYunfnqzMvgUHatnFFTpMQsj4ynT0t4j3nnR
	 VWiyglpUl71oEsHxA0T47qXS3ADR0kfCgS94WVbZTv+fZmajxuGas5zOKzRKmYq78bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.124
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022124.outbound.protection.outlook.com [52.101.126.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C813C606A329;
	Tue, 17 Nov 2026 02:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C813C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qblu23ZTe8TfMZ9tAC88Zo9wZJb1QOhmcAsB27uvpAivCCDgvsczqZxE8YS0U3sPe/wjg9dOTzK28sH2JKOIrt6BKPPXdADfGGVRFe9TARv8p5Y5XXfr8bR0/yBNw2Y6SDPd9JdxM7Vm3+oe5wNzJBNUmPomvBJB25h1UvAvLJcCMw5JK1kdxUd93asgEBnoZqeZ3aYVdZ/a+t9MObc/EDPmmtpAM9soKslAJr1vT52VBK6a3zu4PKLp63pLpvbhXZ1z68wczVm35X5ZR6RdVcwd3sXW7eGfGznw8i63kZpkygPwWpfGdzUwbojl6eiDGhtO/Dd5SRP01Mc+ZXAukA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqmLrCifD/uJdLacn4JzVUrDjw/JlF6C+7MWZhAQrw0=;
 b=L5RPCTPjJnAuX9AP6u0Na7Ik5xl87ORhzrOaFkS5q7rYtMwTQ9KnD3NgaS+20338KEJNEpCE1mx9DkdXcTMyaGgdKtqdUykEgM4HFu7YvaFFKp6Rk/PMuAaZ/UTJIY736EunU+0pDaC+Cy8sfpJApHs39KjjXPCCQND25ommQ4W0XSM3pUkTbjrE5vxRQbQkQFiVintpBATKivmMPm5ZPwLiIie1FEE+1dYKm2xbpWogLuzIuAwo6WuFWY/fUDbKBv+MKn4GLZPxffEnD2BHWvi6hp1i8WrQj4Zik2Z6feo2imDL6Yww5u44vZp322ZfuvSbXlP9XMxI6vp7UoQQmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0068.apcprd02.prod.outlook.com (2603:1096:300:5a::32)
 by SEZPR06MB5958.apcprd06.prod.outlook.com (2603:1096:101:e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 02:17:09 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:300:5a:cafe::9) by PS2PR02CA0068.outlook.office365.com
 (2603:1096:300:5a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 02:17:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 02:17:08 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AF690427EFD0;
	Tue, 17 Nov 2026 10:17:06 +0800 (CST)
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
	Hongliang Yang <hongliang.yang@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/2] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Date: Tue, 17 Nov 2026 10:17:04 +0800
Message-ID: <20261117021705.2202892-2-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117021705.2202892-1-hongliang.yang@cixtech.com>
References: <20261117021705.2202892-1-hongliang.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|SEZPR06MB5958:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 693aebf8-23b1-4822-00d7-08df4450e1b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|7416014|1800799024|18002099003|22082099003|6133799003|3023799007|921020|56012099006|10067099003|261022075727099003|261026121527099003|261028144727099003|261021121427099003|261026140227099003|261009223027099003|261102123227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	snpp87ojGHZyN475gH1R361zC7/yFq6ouziF5WJ0AbUA/QdcFIvmAMUv2v6QBM0tEDOPtrIuYHNecWwAUKWoIPrC8mzIaHIQUDVD9lhqINuK1zcmosAKORgz94ViVeh2SSRrRukDQnRKPfrNKUws6XxLZ2LhDl+9GKMnWQGj0IAnzl09msARkPGVPa74eEjpTFTVKF3kQu509PAj8To9601vJuj5nC4nJ1fXg1bfczkHsJxzpKgioDI8mgB86gN1Saf0n9zXIjGbafFqnPAcHIfMEF94qMj4AQMDtKC21m6PORlPbbyoqBgV9HxHX7dhU/TYGcl6nxp4jlihtgMpX2uS6XVGu8XXsNtAd1UINjr6gaL00i/wU5aXJ6FZlkf0/IWIKA7ebiQj/WniarA7502heDO82BPWcibegwL//h9cioEF4NSzZ6KcdfV3GdLkTeNkk290nC8m07JEyxXs9gZ/fh2d/6wyiPGeJU1D7R1TOaFfvDCt+uFl22Lw9yjB+PuVhoJpCmxzC6NN/M4BhFqMONFGgTIHJMeS0XdJ7Bg1l3NDSLZe9dempEhLFdDd5Cli81olaP3J/3aqkOrsUu4enQkR8okcck8u/7jji/0dZtsPWEswrIWrmAbW5QcTU4wK3BbDRQaYPCJSi9uCtRyyl+rZciQvEn4YrjBcT7rTuGiyXzFDW/jF70mlUiv0
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(921020)(56012099006)(10067099003)(261022075727099003)(261026121527099003)(261028144727099003)(261021121427099003)(261026140227099003)(261009223027099003)(261102123227099003)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lR1zPvjlGl5i94AJUTEBXPph2Nm8n2aVH7Hax/sh9Uf+kzCthEOsWD4zCQ/sKZbQT9hYxxC8EXOdulbYIBUzdjM3ibIgTKAsfjoPk0kWiKb2r80StnE0WvlyTJJKI9KCQzpiDNSwFOQc3SOVAHlAxmVGBpC1r5CXEzroeCJtw37+n0y7PsjBgrHRCJTUKbU95IqvZAwEzW0MpPeG6C9wFHmMrba5dwCw3yNyzVKsvNemNCWn2UPtSGQuEE3wCtRPUaHHqURnQMUK8d+VNgoJYoDF+UF2xBJi/NGMHa+5tIQCgSVfZmuIkbkad980lRubzkWKBKaURLOqDwzHpA0FmI7fpcQ4kXWBX5oKhWHbvv7Gr0qHfUF6UAeZQWltsTThzTGUABpWdHVeQ4/67TiwDLzVzvDBPKOaLVz0zqDVdrn6yk6unmsSC70+MJJ+RF9s
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 02:17:08.0850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 693aebf8-23b1-4822-00d7-08df4450e1b3
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5958

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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v9:
- Move patternProperties before the required block.
- Drop the usb-phy node from the example: the USB2 PHY needs no
  configuration and is not described in the device tree, so the core
  node references only the USB3 PHY.
- Fix the window of the example to 0xf0 bytes. It ends after
  STRAP_STATUS0; 0x100 made it reach STRAP_STATUS4, which is the status
  register of the other controller.
- Document that cix,u3-port-disable is only valid on host-only ports: it
  programs the 3xPort mode register that the gadget driver also programs
  from maximum-speed when the device role is started.

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
index 000000000000..992a35dfb0be
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
+  The USB2 PHY of the controller needs no configuration and is therefore
+  not described in the device tree; the core node references only the
+  USB3 PHY.
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
+    description:
+      The board does not route the USB3 port of the controller. The
+      integration value written by this property changes the 3xPort mode
+      register of both register sets, which the gadget driver also
+      programs from maximum-speed when the device role is started, so the
+      property is only valid on host-only ports.
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
+patternProperties:
+  "^usb@[0-9a-f]+$":
+    $ref: cdns,usb3.yaml#
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
+            reg = <0x00 0x91c0314 0x00 0xf0>;
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
+                phys = <&usb3_phy4>;
+                phy-names = "cdns3,usb3-phy";
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

