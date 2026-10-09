Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023074.outbound.protection.outlook.com [40.107.44.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49032497B7E;
	Fri,  9 Oct 2026 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537969; cv=fail; b=JEpItKo3dgM6bl53bWrrM6krA+bJXGuVSsPJWZhDZ8GM3k1P6ag9tu0hOJQB+FYJWMvMACNtI1gqX5ZWh9Tcy2+OnauRyulOZ/VuFw8Hut67fU5eJzHfSOK9PJZr0gZoI2g1bwVS32HTXitqM1Y6zcZ2Snwqm5zfE+C8+jyHYDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537969; c=relaxed/simple;
	bh=HeS30dGw+n7U9rknU1yn/kZEfdSzIsss2TLmxpQYFUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q7eRrmpektYO+OkQsdWONST36+dJrae6lFdU+iXErCr5ytct7izXAx6WGmCEnw7Sl4AJXM/YMUzUl3Vd5WfEd68hbplQTUiqSNMnc49WIsSMsVvLMeVfcBnQvrS7kKe3PCHhDPgadDvlNJuTzCGEG8BClxKWGtRVAV9NnK0q1/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSVe1xZgnIwQUub1ON/IBfa9yPbgml9gp8siiAxN9F1jJD7pGV8RgW7bjhi5aSytDMEptb0tqeA+r68y8kOFGDxQO/cJA+oCLQa3SiFjgI9yJMeIvfIn0P8hjOlsK/hrMA5sWPcbn36luQ8PPE1Wwe7/b5e7bZrQ5pxIpdlAjKmaM+hgqwAGtLo3peW8kHqAuEq5dc87yNNZE6rIkrXBnp+Qf/2Eh2hUDokGDfWxsneSAazV5CH65vTqStq1gC3e3sYVTiTWFWK3HO3ulRJ0bvj7ISMAHEtWrz0CO37kbNNrdcuZJ9TWGCdm+bFnL+kmu6/RYyoYiNkecsgohvLCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2o3tC8S8FaiUOJP7MVA4jQYf4M7+FC9FY1lAyKjGJ4=;
 b=fxRXjaK6+XCaTbb3tIzNAbYObZBPojJ+fnZPdaRGxl2lbrcqmDfs/xZ72CSy6R1nFA83aAJ1DO4pEf/5uGzRKHg8+uNtfNwWT22WIwInqxljtHC9NSfngVNnS9F3omcH8oso+wU8pHPmDXYic1Yk/IpZVe2TlK6h/sWDMW0JUx19cZ9eT3WBexRHtbcit5ZHfkCAzFceBdwoEWON7qMG6zcPvdg42l4ROxTGtdmWOz0wAbuJDGg+luOzT3egHM9mxPkqB6Kugg/zT4PIWrxH0fzhTVnY1gxskU/SrBJdLJlSzM6YkSaR5qoF+cq3GJThFDy0rEZdeSQdyzCAbjQi+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from MEWPR01CA0160.ausprd01.prod.outlook.com (2603:10c6:220:1d9::10)
 by TYZPR06MB5736.apcprd06.prod.outlook.com (2603:1096:400:26b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 09:26:03 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:10c6:220:1d9:cafe::a) by MEWPR01CA0160.outlook.office365.com
 (2603:10c6:220:1d9::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 09:26:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 09:26:00 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id DE23A4091E04;
	Fri,  9 Oct 2026 17:25:58 +0800 (CST)
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
Subject: [PATCH v3 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Date: Fri,  9 Oct 2026 17:25:49 +0800
Message-ID: <20261009092552.2377960-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
References: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|TYZPR06MB5736:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 00f192fb-e6ea-4a40-ce0f-08df25e75506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|376014|82310400026|23010399003|1800799024|18002099003|22082099003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ALGKKfpVeSqVhUK3vXm4R1EB1t/IMQqg+tpSDTfKi5BrByxoXffLBykPQLiKmDqk2t4Zsl59yLGu03Oyzp9MfD+TyZVws5z8oSM76zVzg5tdLJfeS40MOXEUvuMQj71GV4iZEzNDAWg20ay7A0LosgbXLToEnImv3ubYlcez50XhaMyQyvdmIuSbiUiT4Sf92nhV9ugLNEVIg5w1K+3r/sK3R6LGe0Kxgk5WBHOtnPOP/+2IIjSJnEaBpUhFX5UFWLGnNnmR/jvNvBcSuUdy95heTCayFlCaHy+yobPPdp5n0+vKeb8d++RuIR+SyLc1yP4+z0DU2k75E9DQJfT8ResOq6eYbM70y7w/G7ViDIg3oYPzYoGPZ7/kBigmM9w5Kq6kM1cSJZ6E0Q0DHQnQZxQ/hCVfWKUKczZPD6O69MeLA0H8aoorGY3ypJ1cBl8d4fHSiY2tC77GIC1fIxg4b9Pn24qNV7VYyZLNf1YDyxnMXIJfGKkzwYyzC4RxB/P/bPzCqeMLnDFIo2sb8vdJ1HLDSIW2Syip199TJTqxzOvjWY4BIpXjef3lY7keNNF7eY68yzC5JPqvMXE+RwwESzIx9CGlaii1t7cOFX3k6eUXUW0BM4p00iQUKJoX4MIYZw1ciTpXGJLPAEibAL06hg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CNYyW0sisPGttwC7Ye8SNEoQ1pwpDr/aRKfMbrWxA28NHDssQoQCRQpxWhNaAu2lhnjKHTc41gFw5YXlFohEPDpkzULMfITurSgkuPJpUDAbK6E47pNgvmhWExoo7agxRHcEEP8h1Zp1eAFFgyO259S9FkFm5ogfaUQI/xp8UV68XIbtgK9jE2nC4FeQMpMoiV9amnYgFuthKAoGBx8YPVg3voYJFGR3PUCwbcD+6xCNmQelT690vju+6DdYqL/0wbFRghE94ySgtgAYtyYwnRch2rNkCL2dJODd2F8m9KXF5A00cfpQGD3cOKB6dFUu/a0Ub0TjBPLp95d2yTAq1bXZS8g3ggpPZq1DNx5evpllseu2N2chxjOx8Gpg+FBRa4qfsUCgdKb7RBpFD4lFRc8k57H4TdfSghNzOdGcIf5ggECFHbWRjSp8f98wE7om
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 09:26:00.1674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f192fb-e6ea-4a40-ce0f-08df25e75506
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5736

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add the DT binding for the Cadence I2S-SC controller integrated in
the CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo
controller supporting standard I2S, left/right-justified and DSP
formats, plus TDM operation with up to 16 slots.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/sound/cix,sky1-i2s-sc.yaml       | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
new file mode 100644
index 000000000000..3fdf2334c492
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
@@ -0,0 +1,93 @@
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
+    maxItems: 2
+    items:
+      enum: [ tx, rx ]
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
+    audss_dmac: dma-controller {
+        #dma-cells = <1>;
+    };
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

