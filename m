Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.91
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793962341;
	b=xLhwZhslXk+mEeFb3w1ZfIPyGG1NVKQSTHFWnq/sXJuk081jGoU5q2HUAAWgF2bi7JrJ
	 wO+oSubcfF0EdIWDKHPGP2eYyWMQz/L8zXutO4CeU4SZSbbGzcTmAkZ4BIOFxogsrZAU7
	 hobGaOj8FdNA8ICMhVJAbdNdGyWjR9DnTrrlypF6ul02w4JQUtEGeMEu1Sihv5PXFcloS
	 +jI4RWvUh0L+FMRV/iRIJWwuSB959Gi+BYziQLE3Tddjo8IHL7q4Eds17pLgeKWWbD3ji
	 ZzAC0HTe2Oqc1HcQn+2uLWIMXlnwMBV1+inf4nvk8xnbMAmubYqAeEiweX1fINv5QiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962341;
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
	bh=Bw3iYNs494OoZ2HUqf1eAnVbLeeNMMr6kGoN9P/R7gw=;
	b=qlLeqDQ1KnxgG1986r8DchD8UqY/f5ZifexCN0C4nC47uEq4JBTmqnLm2dq2oNlqdFXe
	 7J/2Vb3x6BjVKiTLg3h6Vg6RB5eWlKCfdBLWRDwsohiXVNdy/it6rQiDHV8eJq4S6RE/0
	 iEosGJ3VK6jBqJKY++uw1WObCgU8k5bLy9W7+cHXY6iDLgsB8igzo+bb3r7ybjysKrKb+
	 EqotYHUakXkMsDCZRm9N11fCTDfFjJ8O3Rk6miC53EKtdZtakRDKHm8I+mLEpgasvSZwX
	 oby1L3sfoGAkHrBrf6Xqpsf9TEfycTzEXJ8ttFrV2p+5c+AeEy/q0nOQAl/62NHpQSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.91
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023091.outbound.protection.outlook.com [52.101.127.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3EA606D813;
	Fri,  6 Nov 2026 10:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA3EA606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cunIVbDAMrwrAU3TwGeHzUugVvZcQQcMoIGh2WRSsG3EyRqqW0/yu60wuG95gn77EeVUfEImk79m5l7MHP7LNCQT3VLB31eC1QBZU+ThbKhHFZ0QqgBONEO6YM+FgkjpBYGZrnmGDByAXEBklc8vayof7Kt8dIrZkn5qBsk34Dl2D5zirwH+sv/mX1VbAxOuHpS+G6dvE9oSMLmWCHEzqtY7Hx/YlVIjN0DkEkbk4TCTMH0kw+8vLIgRuZFFcHoDKhhtjKZFOr3+Sn1J0KF3vjd3VwmNTrr42O2r10GXKfFoIllkb9Pf5DtLHMOHaLYhby7bwsqKLaofRONQ9KLbpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bw3iYNs494OoZ2HUqf1eAnVbLeeNMMr6kGoN9P/R7gw=;
 b=E5OleblEKQjvacly/aw7tZazjoNz0geSDzM4VIVVCXtFV/WL0rIdytpExspbL6PlwvSwysAPLKU63N1IqQO1V0Zcxh2AVNpLVcSQlOUCfIC0ydCz5np03EvOnT2MM6E8HRpyCU48w37GuQF4y7cdDuXYPpS0cQoJJ+3TzEAboQen9HXHcprGjjzwaRmB2ovuUWCverkDUdi5o/FRRXqds0Zjf4imuoq6yGKDZsm0H9IH65kjqQ+/wW2GpwmmdKN2GpFa0veD5hwCD0+Ial3A3m/fdkK6jgOBcmI2NIpiNoDR9bn/FZvxT/D31VM7kOYZVtBWGG0grI+hgHKPmRRutg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SGAP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::25) by
 TYZPR06MB7316.apcprd06.prod.outlook.com (2603:1096:405:a6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4; Fri, 6 Nov 2026 10:52:14 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:4:b6:cafe::d) by SGAP274CA0013.outlook.office365.com
 (2603:1096:4:b6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 10:52:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:52:13 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 46F9A4102E6B;
	Fri,  6 Nov 2026 18:52:11 +0800 (CST)
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
Subject: [PATCH v5 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Date: Fri,  6 Nov 2026 18:52:05 +0800
Message-ID: <20261106105208.1246554-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
References: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|TYZPR06MB7316:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6159cb23-3094-46ee-bd2e-08df3bf4041b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|7416014|22082099003|10067099003|18002099003|3023799007|56012099006|261026140227099003|261102123227099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	KhWd5FLsywLOIRiATnkZ+cGmwnu480MHKuviJrTVhz2k3Pv4DJRhesxDHPUMtGf7ZZJ0KNXQUF9inezxghgEEM9/fP9xSfODyX195kY6ABfXa1cRydw/+4Tqx7D/RBv6kXnte9zJtFkl5HmbuZMIzOXOg8VD52DsKGZmQyzRkHuIyb9K9Apawb1WKZNZPJaL60nLGndY5c3m/rZtej1vLiF3q0Jq2nTyE9AfmTWzGpwE0Mc1SVac/bmHhMm2hOzfPizVzI4lzGtejhiKEUwNDiAbFz4z8JB1oujbawQoW1em5offzLDNWqTyCIJu1xVWBaoWsuWLIdUhzyAPFNDhPE8kMiyuBEts4dbZUuAx9U8iRUma1vzbtvrhCPyHk6JxYFUAc47oTSHU/5N1sFoqSZlaa8m0U+E6edZjgthUBxJRP/UqbphXck1GCIEzYRY4PHGZpCLjiP7bOl1FFNZqJdfXqf88hci1Bf1WaeTF8YtjfV2JOVZwO+OclbdGa0tHRs1CmSveh4s1HLV6lcMJx1FU/VVMgE3xwFRmCziRNWzJxXyb3epCdIm1oq+DfC1IS8oxTFhyw+MBctQ5aekwQj6XttvVf0IwHS5/SLKEq+q7GcvT39ZjSxuY5NTPDQmF9/MD03+tFpeoZl4Eb1v39Q==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(7416014)(22082099003)(10067099003)(18002099003)(3023799007)(56012099006)(261026140227099003)(261102123227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1wZ6K2cazbqSzBCamJ49FY3KfmjDwKoMbkMpxyNM0VtI6ilIo8ZJjo4WZXbJLMF8vVe6arKDSk/YQy+mXx9eVXw17PiPs/3LgdlJVJ4VA4aQJt84ajpdONRpsM9rSkYoFHq3lIWf5cd/LW2NZm9NQ++1evMjIZE5JZgmPOT/qZxmi6sAetfR7WF73TAs7CzIyMmSPS6NaAb9fD813AIA3KY2tJ7pllNCFP68c5KjKkHPqHNMkXFjirUc4pMfSfCLFJ1MaUdvRT+kVoLTv7cEaAWcerh27Sd74fGTv94ZTTQQMuPUlQryTWbA8DgCompLSb74Ooaf/1BDTZAHCaondGVe1W1AhuVFINku2QsBpMAUBoSJ+xhMCTcDFi/NdGwYZVC61CoLT7Yao/brBz+bzYMEDDIUe3BT4BbfalHCol/dF9hDQ4p9jXAzNijF1oTF
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:52:13.4421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6159cb23-3094-46ee-bd2e-08df3bf4041b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7316

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add the DT binding for the Cadence I2S-SC controller integrated in
the CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo
controller supporting standard I2S, left/right-justified and DSP
formats, plus TDM operation with up to 16 slots.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

