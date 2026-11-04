Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.75.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793792033;
	b=gSRtVWFN9FPmNIOiW64zkjbm+3vCtQeJZ2hBVkhSpeU+6IaZifbDBDmNA2Ntm68i5Axv
	 dbZuRUb5nhyOHSqixCcGySe8/pcsvAzKU+04YZjdEDiOgYODsEJjSReXzJxyG20s2fYvw
	 ISWs05Xp4jwAl9R1hdA2bp288JF/DRz0qdokUxhZ6sStg13C3A0f4XDHdxPMlK7NlH500
	 M12ddhEntPhl2Czy9GNtDvvKRB38lDrioriUnO74SqNfpnR7KG3W4KnCY5KyQ5t7dpGZO
	 +zKLwNR9ZgyNXSk0QyJDZ2oqYH4zRKNIm88E60qRHRuO1RFGjpWFor7VJ/z9xRxIGyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792033;
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
	bh=sWuxxH9KeTzjFdlQTFI0LN67TNXQ6QISFuOPWqPoIDE=;
	b=Nh3eOuAKJF0R3hQUQx2vaXVK8MSTasx+Z2cul2vbg5+0EYSL7mnmYRfCvueMCfqyMw9S
	 vbOu6jOGFliG5+HP8bHvx3XairE2oVO5bJkgr+Fpi5yhZwLWcZ2NmcEngVgsH6I97Knqz
	 efeISmfzcNB7EsVJO3Nl42GecoEzUX1odtTbJgLXIqd+bL84V3EMu7nZIhDsb+ogpTbBB
	 kqKq3lKc/HXcU2xypd53uA6Dsu0RVtHvB1uBvbc219gY1YRTdOr9vDN9wSm3FHdFEgciq
	 iJb9p8cSTLWHA9adNVGg2RHPEWuTd1KBd51YbJ7x/pTtLYohsy7j24dZXYfljhaACEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=fail smtp.remote-ip=40.107.75.122
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022122.outbound.protection.outlook.com [40.107.75.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD59606A31B;
	Wed,  4 Nov 2026 11:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BD59606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxKle5nYf1+JWkOqTRJnpW8f7HX0O/KdW/9gypgWuc8TaUYZIx3+bg6t+ZwIBj5TTx4pblZJYWvk1fYxx0vgi8QIrKux2EQr02YsMQvgNlpfYPdB5oI7yJAcbXbcgQMCegmgbYf1Hm6+6q5VXA5oMm4xJPzQg0B3Odix2W4gLvp+p6RpO0dlAWqwqoREW8BLw1XZsKZdhMNbuP1HqSM/nBYn74DwgJnEwGEsOYw3FWpqOQP0EmCtPTo7Mk7Pq9ikp4GEeYTT8/qrL5heIhqy4D/ch2aWyQ3mmvlr3S7+jG2o8vRMz8AikJ3CSYVtoEcUp47vXUYYY048ReK+gUq9uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWuxxH9KeTzjFdlQTFI0LN67TNXQ6QISFuOPWqPoIDE=;
 b=bQAsVEbyzNWb3vYPnghQyLapVIAyEWn6SJme4lyBkoS0jdzCthi5qw2ALRpAP/oHzpHt7Ws45IDz/8bphYjZ6+0od0Jo18Zo6wSou3QJ6CM1HfAhASqUcv4YWtb5RLm74xTv75aWoRF7WyEEI6z2Inq7A8b68UGY3g6TGRK2VtZUO8g8eF8PP2flKuxR08f02fAeKCulZqVjaWgXRvtsUvIqW6KsuaWM0h3zBGwwvGP5InzCJnZCXRmRiFGBw+nC5I8TwG7T9QsRyZwhuC979M0TG6geko3li2EYOCqzMfnLGDRu+7PW6uBNcLwqBXtRvkeFVih6Q9naGOdv6FPfCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P286CA0137.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:37f::11)
 by SE3PR06MB8095.apcprd06.prod.outlook.com (2603:1096:101:2e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 11:33:47 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:405:37f:cafe::95) by TY4P286CA0137.outlook.office365.com
 (2603:1096:405:37f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 11:33:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 11:33:46 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5BB0C40920E1;
	Wed,  4 Nov 2026 19:33:45 +0800 (CST)
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
Subject: [PATCH v4 RESEND 3/4] ASoC: dt-bindings: Add Cadence I2S-MC controller
Date: Wed,  4 Nov 2026 19:33:41 +0800
Message-ID: <20261104113342.3660269-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261104113342.3660269-1-joakim.zhang@cixtech.com>
References: <20261104113342.3660269-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|SE3PR06MB8095:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3f56196a-f881-46f2-777e-08df3a677d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|82310400026|261102123227099003|56012099006|261021121427099003|261009223027099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	sskGzA7Ho+el3M3MGJN0mAnFeSDR1pZEumc8P+Me3f5aT5uw6AUlfZdsXG6NgDRHalMr9Zvoeg2X0WpGHIIP1RPujO+PVDEtCqd1o/UOmjWz/blVx+zBw1tZJFjeQuke+/ch6DYrYTdPnmVtbJUBvO/vAR/puDCqmApRhICUp6Ef4H2x10+m3dINZ6Zyvy6DDTAwSxDlheizPKa6GTYbgxZ4cmMETpKyz3Bue38uMQuIZb1imIwywaS/UtcvKR4K8MTK3UUGq0tu2nLj6nLzrwxecgObe0tKWIzr4gFJgbfiGFyU/SfAlxWpYoW5cGAreSS6vjrCBiN4gfsv47JJ+EJf+xN29Lxz+1U66Q0UJKbohh40ApnlzSobuGKI83K0e2Cms/Up7tbTLOwFtG+xNzfsXsZ+Ny6lZlzJ/I4HgYZ6jYQiYk3LfXiW/qwab9twlp7gMpS/jwRmXUxWAeBni5YNDhFcDqefepulwcYYc4fFl/3Auag634wfnqDkYWnFHvSBfCG9ALkWQrO9G4HFvENuoY43j8j9E8uaDZc3NNg+tMQcSVa/mZ7WUOY9cvULEPU9MQm446qvUFTdCzS5ErW97iKUMdi10QPnQ5FrN6xL77UsT0ESGNJdn6EJR89AuxpueQoR1AfTW1BqMfyInA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(82310400026)(261102123227099003)(56012099006)(261021121427099003)(261009223027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/XQaf9pHyB7drSXdHI7vWZKQfwaqSfARacAS+972Xd7X6hmMhbBwbPIf0Rogm9Wvl4fhia8SwU3R2W/4cyvRmVcAczdJODNjBPcwcPgBXeT/EWo/zoVp4Omg9sk8mAk3/DJJsSeFWG2OAQAiaEw4C9ouQRUKhGXozMiSp5DPiZKz8mQl/TqD0o/5NchJ2KXahXsoZN4m2Pzgzj4X/8CZUAmpJbqmZVMBUKzmwla9pYuXPuRcv4Rs+XRyrIYp8rVK48TC3sW4Hu8I2JtA8gLXghY0W5+PifMyXaszTsrbTv991oIyHTY/Hc6K8tF0y2ECW8nPWcn37DQc6c2E7FjpQPREJY9bkHHuYU3UxIiOyRpLxPzdS58RNIVs/Wslw4L3/kA1fJ2G2eunpuTOZeyzS2qdt54M65IzRSBCHVxlQwe3pbOSOVchv2auihw8xBy/
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:33:46.4694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f56196a-f881-46f2-777e-08df3a677d40
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8095

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add the DT binding for the Cadence I2S-MC multi-channel controller
integrated in the CIX SKY1 audio subsystem. The controller exposes a
transmit DAI and a receive DAI and moves audio through a configurable
set of its 8 data pins. Which pins are wired out and in which
direction is fixed by the board design and described by the
cix,pin-out-num, cix,pin-rx-mask and cix,pin-tx-mask properties.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/cix,sky1-i2s-mc.yaml       | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
new file mode 100644
index 000000000000..e750009edbdb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cix,sky1-i2s-mc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence I2S-MC controller
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+description: |
+  The Cadence I2S-MC multi-channel controller integrated in the CIX SKY1
+  audio subsystem. It provides up to 8-channel playback and capture through
+  a configurable number of I2S data pins, and exposes two DAIs: a transmit
+  DAI and a receive DAI.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: cix,sky1-i2s-mc
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
+    const: 1
+    description:
+      Cell selects the DAI, 0 for the transmit DAI (i2s-mc-aif1) and
+      1 for the receive DAI (i2s-mc-aif2).
+
+  cix,pin-out-num:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 8
+    description:
+      Number of I2S data output pins wired on this instance. Which of
+      the 8 controller data pins are wired out is fixed by the board
+      design and can be any subset.
+
+  cix,pin-rx-mask:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Bit mask of I2S data pins used for capture, bit N selects data
+      pin N.
+
+  cix,pin-tx-mask:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Bit mask of I2S data pins used for playback, bit N selects data
+      pin N. The rx and tx masks must not overlap, and the number of
+      set bits must not exceed cix,pin-out-num.
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
+  - cix,pin-out-num
+  - cix,pin-rx-mask
+  - cix,pin-tx-mask
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2s@7050000 {
+        compatible = "cix,sky1-i2s-mc";
+        reg = <0x7050000 0x10000>;
+        interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&audss_cru 17>, <&audss_cru 27>,
+                 <&scmi_clk 100>, <&scmi_clk 101>;
+        clock-names = "hst", "i2s", "audio-clk0", "audio-clk2";
+        resets = <&audss_cru 1>;
+        dmas = <&audss_dmac 2>, <&audss_dmac 3>;
+        dma-names = "tx", "rx";
+        #sound-dai-cells = <1>;
+        cix,pin-out-num = /bits/ 8 <2>;
+        cix,pin-rx-mask = /bits/ 8 <0x1>;
+        cix,pin-tx-mask = /bits/ 8 <0x2>;
+    };
-- 
2.50.1

