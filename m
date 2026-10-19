Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022120.outbound.protection.outlook.com [40.107.75.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36444E50A9;
	Mon, 19 Oct 2026 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412467; cv=fail; b=iNVcuFZiGnRAnEooMaCWdEVrK0bZHcUTt1VgOHOLzJLFc5BRhgS1nFBT5W5JnY8vVdR8M96kVioWlbsb94hjZt2QMsebBv4ujPN34uKdLk2s5a7RjcDJYhbBgsXG0gKDOIDAuX1mN0dBvpdA6TMM893qyImhm+HTaB5gOyilQM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412467; c=relaxed/simple;
	bh=v5iOcAxUlTmnlfJl/7ZpbGw4dcmYU2EX/mdFVIWDhcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hOEjGZ3bZarcAn40TEqJbBiGs5/5jESLs2iq/gmuUyBmB8Mv+L4AOfDj5oW61u5wGjwOeDJ1eeaZBVtLgI3K828ycHu6maRN8P14f20hclhzrRzDY0EHKkBZr6eijW5OB6A8WfJxuWlQGcdvUGbLp4NMQrnsm2dwSpBdN3Ary/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwnyrhY7VPz/lOM1XTwhiYPHk8AxnUGkJsCnN6QkYwk0FAj1Frj7Ulxa3j3WvkQtIwyN39g2NAXyRyij9bGzkuKap5lOxOAEwiw4PJsweIXrvJiyOah350mj7kdzmIbVcCtc9G4LpPfdXPlQJRE0zfp9F1iUnaKSotZ7RVsaL/8O0qi5oiRYzw/jt5eQ+mbyaQvoML7K6/qQfW7p4S1oXI0dYoyvuQcwb11F1mLO9Pr2SQ4Gxk+iLy9VEjVTxVXgVUIqic0kxbsMGz7054oyOW1JxF2nZlg9PkNYdRasM9QpeO4Ia3RemsKp0BTixULrEgeYSdU607Xt+DwBIbrgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Fj9MobuaSxu7TIISp7rfkd7VzhaJrjNhS7503NQM40=;
 b=lwmX8VtuD/LsifXkDlStEBEQ/CDKfsEHKf/4WE9FLT9j8bxwnJR7nHgWx89fOa9mvQLVYxQqorXRIdRSTeisb1zQdE3eQmLmY+LW1K9pM68lagu2QPhtMoqGqFNPefQ8cd5uCq6Zy7w2TXlSyloHcIkSSJb9SEdVpJUJY5HKB8KBPX3xjL+uqvF/CvQDfK9+jFFpLidPQtlIXevWG6EiTp9MmJLUOWUZI3qfpUkW8mcRNRfsQC3P10CTbx5Z7omWuH9zGPKW9lPIxCMTyMtDADVpgQg/t+K/tRYeKx2SlvXHSKKJxSud/cBEYxI1+CcHIksRoZsX7FYDfE+jEqSS+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS3PR01CA0056.jpnprd01.prod.outlook.com (2603:1096:604:de::7)
 by TYZPR06MB5483.apcprd06.prod.outlook.com (2603:1096:400:288::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 12:21:02 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:604:de:cafe::63) by OS3PR01CA0056.outlook.office365.com
 (2603:1096:604:de::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 12:21:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 12:21:01 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5D9B642C6451;
	Mon, 19 Oct 2026 20:21:00 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v4 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Date: Mon, 19 Oct 2026 20:20:45 +0800
Message-ID: <20261019122048.1107179-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261019122048.1107179-1-joakim.zhang@cixtech.com>
References: <20261019122048.1107179-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|TYZPR06MB5483:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7f5336b8-8f11-4a84-8bf8-08df2ddb70b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|23010399003|56012099006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jEGEWNsHQGEO2pn0IMaK+f3r6BDmD67ms8rWEEG95TN1geftP8/NdXZ8HqFS9b0VclDtK8A1N4zfUPeN7E9N9bDkh5t+0crwwQ1FRwcCGaVvIC308s6MSPKlPila6p1DESlS+0ggkBcqyujzG78col6AJ1GOrC/mc9doISqmhbyEtrIXi8ORSuPcYqAABG3xA3EkrRYfF3lWrZFx+9m3nIdggRafmRXkKDrbujqOxrqyux3645E2TxAGsk++N1RaEa5TuPdn/Fe+Hl0DgtU88Ge42OxuMGq1ooSpM3vGDAXlYfBFGoPyL5S0/x2yfnf1g5ZfTQMS5uRc65iSCQRipCZ2x1wQjfJObkGplrH1+e8U3/VOH8TWV2m79vofmPsG8Y2QbMZndkzpZ/Y8luDfnXPstI6jVVGQzyPDYfuiCe4hhWuri6MciLC6GIy5ROJjIONHGnXMYZAseunC06uZamHdZCEmvUt7fVWmpuaNLR4wkwJHv2dde12XN+bqDAVGHjM5Qkp9TfBsua2+pAEm30zQzIPFKLbgJCisHOtR/tnGegB1LBERD8RujT0gzi9ocnzpuLcWKdiGvC1+MUjXnaDnntu/i5ouvcqjdLwoHMT+S3sp51LJiyZl/htsioiDyRXnCxaqewcCbFUjZss2JQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(23010399003)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	foDmnaJFKHV9vzki9W6P4PDUWw39tSXLbchJndRBpycobROLRS8QEgB0YJrb+JCjSFSM+f6HvXUhESVXZt4PJvEzq3sHhpF0vUiEnyyrIlZhYUaWcb7wxA19Ni0gM7oekpIlMq7ig5Ka7El0vu45ppROGEoQ+09S0zMjzB0GTFUxoZSB1Q53Imdny35R+F7kIM6W5kDpB4V8QmBej7NgVtf/OUs+lcNSob6T3VEFcxXVNb7ZUDhrhIpyErG9qpJVUZit/DlHUGsmhtaijPNj++0inVeLaKfv13GDYJLbUHwxn874bAVsdkyybGesA9JB8tztnAFyeLzAMxyVwgscfqliYbPspizKWhgswLkGtq7XVIfRkAZa5LmILyGIEeo7OuRwIPN7fgIXCqQvcnovqnBtBhcafWeOcF/dkoMMg9sZfs5jXDbghJpDO+FUVzR8
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 12:21:01.8981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5336b8-8f11-4a84-8bf8-08df2ddb70b7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5483

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add the DT binding for the Cadence I2S-SC controller integrated in
the CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo
controller supporting standard I2S, left/right-justified and DSP
formats, plus TDM operation with up to 16 slots.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/sound/cix,sky1-i2s-sc.yaml       | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
new file mode 100644
index 000000000000..9ef11272d0fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cix,sky1-i2s-sc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence I2S-SC controller
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+description: |
+  The Cadence I2S-SC controller integrated in the CIX SKY1 audio subsystem.
+  It supports full-duplex stereo playback and capture in standard I2S,
+  left/right-justified and DSP modes, as well as TDM operation with up to
+  16 slots. The transmitter and receiver are started and stopped together
+  by the controller.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: cix,sky1-i2s-sc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: hst
+      - const: i2s
+      - const: audio-clk0
+      - const: audio-clk2
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+    description:
+      One DMA channel for instances wired for a single direction, either
+      "tx" or "rx", or two channels for both transmit and receive.
+
+  dma-names:
+    minItems: 1
+    items:
+      - enum: [ tx, rx ]
+      - const: rx
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - dmas
+  - dma-names
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2s@7020000 {
+        compatible = "cix,sky1-i2s-sc";
+        reg = <0x7020000 0x10000>;
+        interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&audss_cru 16>, <&audss_cru 26>,
+                 <&scmi_clk 100>, <&scmi_clk 101>;
+        clock-names = "hst", "i2s", "audio-clk0", "audio-clk2";
+        resets = <&audss_cru 0>;
+        dmas = <&audss_dmac 0>, <&audss_dmac 1>;
+        dma-names = "tx", "rx";
+        #sound-dai-cells = <0>;
+    };
-- 
2.50.1

