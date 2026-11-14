Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794681011;
	b=j07lePvxMKCPB3fhb0c5j6TsjTximEo07aPXEDbSzFV2XbxslO13unwoCdBipm0ffRH/
	 O4/TMk/AkLTR5AYYsF4fESQnE9B1jNl/Ge/w2/vNOqRlUEHvTstiCiPwShqJIUMtJ0bXT
	 qoVR8Qk4/gXgaY06ChNCs09r9PFb8nkzhcwpmAHhya4lR+UCsnjT/5aK8JbUr2muIZFBu
	 BQA3HPDvYMuIVFn5kfuK5PJGo/kfUZ2dHaMff83rH8iOXR6F4bEkKvqyuJQC6MQRT/p2+
	 jdN3SUZhw4lJ4KLveHBN8wSQB+egLRM0B7TQTEFK5IArj20Nu1d65pssN5FFxjqRaIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681011;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=nYDYoF3gGW5p7HLPxBjiU8e9F6de3Kcrrviy0toSoXI=;
	b=g2GxU2300eibOSBwFbM6w6amu7qUhUB7WIKkmLtyFHhG/xjbK2gfJMMJRJGV5W4+JBoI
	 mFVQeM++uyEH+yEa9geB6JzIYXYiUOu/XPLrvPzzw6c6MeZGaD0fIUpxJP9zlJqxMYB0m
	 JEaljx34GKsTDVb7CArxqMFnyPriEdgFSSaxNyMTMMMWsdqRKsDHyIEmG8omgNxFNfnGA
	 zNy4ta5OXY8Vc+zA+pVTS011wOYRsiu5nSU90V8TI9lEkeqeg68XrQVo8V/ZB+6ihU8eZ
	 EQas9bCE81wOj+OMCy5mswxdmOMtFvzOaNvQyLSfwkrWiLBiefGcaV7TwHvUHk2v3tQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CRSxQBZc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.38
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15894606A332;
	Sat, 14 Nov 2026 18:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15894606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CRSxQBZc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdxX6un/Di7Wakd4pmfwRB8Ums6V/GcieETjy9qrA9CrdUv2KXjI4Ciq7ozCgxpBqutdWFUnagYGUjhsm/1R+gtf/IjvX1oxHkhN1S1BvdcfE8KtWbKyt/dHhxHexlFV93FWxwQf9NTE0RerPkguOh0DUMMz+i4+kN0SLHs46eBtvxWxNGE4+bHFoIDgoqmEQwVC39VGph90sJQNwe+rXJd3qnnZvLMnmlMrGdluY8IGZp74fwSBXYS4A121/SyYIHr3IKFLttdysxe7daB1UCiMjZpqVPYGXu7eyPAZ/xuDBGiuZ8jvZGZLDz87+rKUHf5nCV1q3afoArU7ZYXm7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYDYoF3gGW5p7HLPxBjiU8e9F6de3Kcrrviy0toSoXI=;
 b=J6iWmgxrMZLRZXLPBKHrlGmgjRuGuZwXx5VsREWpFuBem0VJq7+iDRgdIrhy3TyiWJb5N3UQSa2SDFyUT0BL/baLeQaJzFe75jySZ3DG7PueRbj1F4WHI09bWXcvQF1ITZ58KhsGXWUY3FvHAbZ4f7pSzy0lFS0HpLqLVdoIKYLck4sqJ7dsomOedHLy4W8oyfXcih8RAp5eUwtDdCSFg33vg8JQwmE8LGPpy543Qwid6KE2R8Bf7qlavz/U0AoIJ/NBor+ySZtr2c1NuaNfPjk5jRDW9NYc8wMR5ZcivZFX3JSc7aRo0P3fbXbDR1exm+//cUhslcvd9iDBZ1go2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYDYoF3gGW5p7HLPxBjiU8e9F6de3Kcrrviy0toSoXI=;
 b=CRSxQBZchgh6pbCP5vU/qpcRa0Vyx+bS4W3ekzVKL8o3rrBsmAIsQGdg+GyYUjJYwapfZuYa43Ya0sVxZD25E+NzGnynG6WBDNBc2XaytMXuFe/bEowE0X5eI0vaPrSGEIbM61Haoftrij8nNAsgdC9HG8SSaz9nu4CwWLBSbn8=
Received: from BN9PR03CA0214.namprd03.prod.outlook.com (2603:10b6:408:f8::9)
 by BL1PR12MB5875.namprd12.prod.outlook.com (2603:10b6:208:397::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sat, 14 Nov
 2026 18:30:06 +0000
Received: from BN7PEPF00000092.namprd03.prod.outlook.com
 (2603:10b6:408:f8:cafe::59) by BN9PR03CA0214.outlook.office365.com
 (2603:10b6:408:f8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Sat, 14
 Nov 2026 18:30:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF00000092.mail.protection.outlook.com (10.167.245.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 14 Nov 2026 18:30:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 14 Nov
 2026 12:30:06 -0600
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sat, 14 Nov 2026 12:30:02 -0600
From: Suraj Gupta <suraj.gupta2@amd.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Michal Simek <michal.simek@amd.com>, Russell King <linux@armlinux.org.uk>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH net-next v5 2/6] dt-bindings: net: xlnx,xxv-ethernet: Add Xilinx XXV 10G/25G Ethernet
Date: Sat, 14 Nov 2026 23:59:43 +0530
Message-ID: <20261114182947.2908628-3-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261114182947.2908628-1-suraj.gupta2@amd.com>
References: <20261114182947.2908628-1-suraj.gupta2@amd.com>
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000092:EE_|BL1PR12MB5875:EE_
X-MS-Office365-Filtering-Correlation-Id: 5321a706-db22-4217-2b89-08df427d4eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261022075727099003|261102123227099003|261009223027099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	C0ey7IC9S92pftQ69zdS8zuBxJiy2y9mB6I2NEmd/o2OZhDcpH3lCwJ/PXIGIMO/TZJgBa+PMEqb7dXnAx9WGUwOe/SIptw6WBYlwV/ynuG2Y35tI28ZXKtr78rg+h/T6SaqH+9fI7CiqSOIFj0b+nVh7XqE/Hay4cdYd7PKC+bOSFsAytRyICBWkAdlJk8+Ky/jpwmAU8nIB3aP9pUwHt+SIMKWFx/Rpn2UkQ4WC5lmKwF0PB6P6SWZrh4oBn5ujZY9CTA3Of3+FV5TCtfRf/0ek8zGslF09LF6meSO8k1/QTbevF2XyFdPiq3y+Ku4lbWk2yHnE0fYSE4SA/msBWToZWbOVFxg5vwbsCm0/PWubm2sEzxUm0R0OrD2D/S6p+Xdljb2tn0jUWS4JN6qFKeuZY45RCmJ2XGY7NSavusX17+dTTlF2i/IG9Q0IWRDv+/+3rZ2MsUuTTyjG9VpxLQi78jGP2yAWu2IjukuOP6sa61SUHKN6fbzJg5VuldZWlchSWphqCxbtSuWgZ2C6Qe2KlS+XkBdjpaUJIxCy/qUKEJMq80xCy6Kf3bsxnEnyKkdNv+I6j+M8+AhJhKlG+eJGA7YPo2MS11Ehbb8EsUciP4/qw4E/WP8kupyNTbDdAdpkrbYbqRa8mtXar1ovg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261022075727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xsUpcrx723oIVl2KTNujGNerFECsMBoeTxo1y5WX4Va1dfNp8GjSUK0mwrOVDp7aeW2GXxIWD5zMBTEVXJaBCFKKb6S1d1z8lDcH985wV6tmfs0gpqYf/k1n9BeTtRP2EWrDI49iaIl9EmwJi0Cl+kHypwi59Vnb6YrxpPp/5ZPHILLOuQN+iS09qoV4GMBYKU/2S1hoiEbKh7bfO308k0n8YxbRazYiOhCeIck7cP4twCTd4zwC7NoXPdf+L+eWN/W8sGsQJC12TlnFaDlpJImMVsp+gVr7wmsg+jnaar7zrc+pxcejZH0T4jBfjUnrVWVDf63G66J4tGMPdcm+xxoDF1EIa3TFsgGtGcsSSirQv29gqi6rmyVQLtVyJHt8AyuKHCsAXIS7I5iuXE/Di/b9W3Y6J4KttyhmR8ktypngbEdh07x42gSe2gTE3wyK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 18:30:06.7951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5321a706-db22-4217-2b89-08df427d4eb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5875

The XXV Ethernet IP integrates a 10G/25G Ethernet MAC with an in-core
PCS/PMA driving a high-speed serial transceiver. Its payload is moved by
an external AXI DMA (or multichannel DMA) controller referenced through
the dmas/dma-names properties. Document the IP in a dedicated schema
file.

Add the "xlnx,xxv-ethernet-1.0" compatible with the 10gbase-r and
25gbase-r phy-modes, the rx_core/drp/s_axi clocks and the AXI DMA
channel properties. The GT transceiver reference clock is described as
an optional fourth "ref" clock, for boards where it is supplied by a
Linux-managed clock provider rather than a fixed oscillator.

Add "xlnx,has-statistics-counters" as well. The statistics counters are
an optional part of the IP, selected by the "Include Statistics Counters"
build option (PG210), and unlike the 1G MAC the subsystem has no ability
register that reports whether they were included, so the devicetree has
to describe it.

Require "xlnx,rxmem". The driver reads it unconditionally at probe time
and fails if it is absent, and the value is what bounds the largest frame
the device accepts, both when validating a new MTU and when deciding
whether jumbo frames can be enabled.

Disallow phy-handle, its deprecated phy and phy-device spellings, and
pcs-handle. All are inherited from ethernet-controller.yaml, so
unevaluatedProperties does not reject them, but the subsystem has no MDIO
bus master and its PCS is in-core, so neither an external PHY nor an
external PCS can be attached. Constrain managed to in-band-status for the
same reason; it stays optional, as the link is always managed in-band.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 .../bindings/net/xlnx,xxv-ethernet.yaml       | 146 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml

diff --git a/Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml b/Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml
new file mode 100644
index 000000000000..caf582c72a8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/xlnx,xxv-ethernet.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx XXV 10G/25G Ethernet Subsystem
+
+maintainers:
+  - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
+  - Suraj Gupta <suraj.gupta2@amd.com>
+
+description:
+  The Xilinx XXV Ethernet Subsystem implements a 10G/25G Ethernet MAC with an
+  in-core PCS/PMA driving a high-speed serial transceiver. It supports the
+  10GBASE-R and 25GBASE-R line rates, with 25G operation following the 25G
+  Ethernet Consortium specification. Because the PCS/PMA is integrated into
+  the IP, the subsystem has no MDIO bus master and is not managed through an
+  external MDIO PHY; link state is read from the MAC's own status registers.
+  As there is no PHY to manage, the link is always managed in-band.
+  Any SFP module management (e.g. I2C) is handled by separate IP outside this
+  binding. Its payload is moved by an external AXI DMA (or multichannel DMA)
+  controller referenced through the "dmas" property.
+
+properties:
+  compatible:
+    const: xlnx,xxv-ethernet-1.0
+
+  reg:
+    maxItems: 1
+    description: MAC control and status register space.
+
+  clocks:
+    minItems: 3
+    items:
+      - description: RX AXI4-Stream clock.
+      - description: GT helper (dclk) stable clock.
+      - description: AXI4-Lite register clock.
+      - description: GT transceiver reference clock (refclk).
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: rx_core
+      - const: drp
+      - const: s_axi
+      - const: ref
+
+  phy-mode:
+    enum:
+      - 10gbase-r
+      - 25gbase-r
+
+  # The subsystem has no MDIO bus master and its PCS is in-core, so neither
+  # an external PHY nor an external PCS can be attached. phy and phy-device
+  # are the deprecated spellings of phy-handle.
+  phy-handle: false
+  phy: false
+  phy-device: false
+  pcs-handle: false
+
+  managed:
+    const: in-band-status
+
+  xlnx,rxmem:
+    description:
+      Size in bytes of the Rx/Tx packet buffer memory built into the IP. It is
+      fixed by the hardware design and bounds the largest frame (jumbo MTU) the
+      device can accept.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,has-statistics-counters:
+    description:
+      The statistics counters are an optional part of the IP, selected by the
+      "Include Statistics Counters" build option, and the subsystem does not
+      advertise whether they were included. Present when the design was built
+      with them, in which case the driver reports the MAC counters through
+      ethtool and ndo_get_stats64.
+    type: boolean
+
+  dmas:
+    minItems: 2
+    maxItems: 32
+    description:
+      TX and RX DMA channel phandles, one per entry in "dma-names".
+
+  dma-names:
+    minItems: 2
+    maxItems: 32
+    items:
+      pattern: "^[tr]x_chan([0-9]|1[0-5])$"
+    allOf:
+      - contains:
+          const: tx_chan0
+      - contains:
+          const: rx_chan0
+    description:
+      Should be "tx_chan0", "tx_chan1" ... "tx_chan15" for DMA Tx channel and
+      "rx_chan0", "rx_chan1" ... "rx_chan15" for DMA Rx channel. The first
+      Tx/Rx channel pair ("tx_chan0" and "rx_chan0") is always required. There
+      is one name per entry in "dmas", in the same order.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - phy-mode
+  - xlnx,rxmem
+  - dmas
+  - dma-names
+
+allOf:
+  - $ref: /schemas/net/ethernet-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  # Single AXI DMA channel pair
+  - |
+    ethernet@80000000 {
+        compatible = "xlnx,xxv-ethernet-1.0";
+        reg = <0x80000000 0x10000>;
+        clock-names = "rx_core", "drp", "s_axi";
+        clocks = <&rx_clk>, <&drp_clk>, <&axi_clk>;
+        dma-names = "tx_chan0", "rx_chan0";
+        dmas = <&axi_dma 0>, <&axi_dma 1>;
+        phy-mode = "25gbase-r";
+        managed = "in-band-status";
+        xlnx,rxmem = <0x8000>;
+        xlnx,has-statistics-counters;
+    };
+  # Multichannel DMA (MCDMA) with multiple Tx/Rx channels
+  - |
+    ethernet@80010000 {
+        compatible = "xlnx,xxv-ethernet-1.0";
+        reg = <0x80010000 0x10000>;
+        clock-names = "rx_core", "drp", "s_axi";
+        clocks = <&rx_clk>, <&drp_clk>, <&axi_clk>;
+        dma-names = "tx_chan0", "tx_chan1", "rx_chan0", "rx_chan1";
+        dmas = <&axi_mcdma 0>, <&axi_mcdma 1>,
+               <&axi_mcdma 16>, <&axi_mcdma 17>;
+        phy-mode = "10gbase-r";
+        managed = "in-band-status";
+        xlnx,rxmem = <0x8000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 893b0670a7b6..b33fd70d242f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30683,6 +30683,7 @@ XILINX AXI ETHERNET DRIVER
 M:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/xlnx,axi-ethernet.yaml
+F:	Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml
 F:	drivers/net/ethernet/xilinx/xilinx_axienet*
 
 XILINX CAN DRIVER
-- 
2.25.1

