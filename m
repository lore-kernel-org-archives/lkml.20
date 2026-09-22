Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023120.outbound.protection.outlook.com [40.107.44.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2418053A8A5;
	Tue, 22 Sep 2026 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076130; cv=fail; b=A4OKj7i1zn1qH11SLQNepDxd7i9JR9CCSmx+iMLcX8MN2rPz8ysquePoLpsiaBBQAFLJJj2wLLgIBIFRD48hCuwwLZdINNFFVST9oW1Nq/UJ8E29fTpmpyAC7dRpSmOPkvOjVcQz8EjqvlXlJGo0LO+UDeL7wGTM8l6nZhh3bEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076130; c=relaxed/simple;
	bh=QURcmkyZwO4LIBWbf1x209bq04UN22NKOc9yXSEtAs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LBd/iqSkSRA00JTRRnQ4V6fFqRoZdFBumBRfGJiYbCOwise0NtuaZoWdjaJWbXMBfDDUxWs3LenTJtOAdEPY4ZeNPfE+/ma4Ga5GokcAtrXtIMf778wDYTFu674YTjnbAE+CDSsMSxZ2ic7Y3ja3qCs8n/0kNwQl3JOWUKW/AW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WG9Rn7qAVDjPyfL5yHZLh9IPazFwGD/ZWCbbi+x7N7u2KCboIqjiUdHaKXJH1OFoaijcFNGCX9C6kmh6SsLNU8L7px3T3aM6RUOtzF+HJxF/bNskd28AGBvn8/2ncuT+VjkIA0QlHnWSNLRMffSBmlrSxaEWVm9AJHe8WpMgf++SIjTFTw3mIegTA3Rjm1wCYnseWJHjWHrb9AE9Vy1G1lvqYGGv+/BAtJf3iBqn3tOpkHqZMp78NRoq3Go5ZdYGNmhndndnPt3XJoAfU3FouTU27PnBKkQNkCzB/DPEVvjnLkCPfODYm+YUcWJye12zHFtceP5iHtjTQgOohYr+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuuA2brUqiYLcSf09l0VtIoQPLhmGaiGcN5kGGoFxiU=;
 b=Tua/zqUrztlP3c2oDWDhuOCIKNFTREaplAt6Q6syhdaceA7hz61qQ0ZG4gm96SexYb4Mp8HChbiVyaiA12JS7ueIcvREPpY6i2OECAQhBLl8aczlQzzD1p8cptokWbdVzt3X8mSrMjnvCg0e6vVfeFfhqCYbRI6p+Z7lyquucpw1DJRXDlRh4B8pUnFCVzGELFwrl0e41PHk43Xql8ngv4d9IX3zX3Val7c+ujShLkcarophpQ8/CLulX0qqv68wu2rdl/eEBmKiaSKWgfZWWdB9s40cSgkZ3CV4AvllKUqRSDvL1SPM18QnxemuUmAu7F0bMcws4Sa6Wbpz6O6OOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0011.apcprd02.prod.outlook.com (2603:1096:4:194::20)
 by KUZPR06MB8967.apcprd06.prod.outlook.com (2603:1096:d10:86::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 11:21:55 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:194:cafe::65) by SI2PR02CA0011.outlook.office365.com
 (2603:1096:4:194::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 11:21:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 11:21:55 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CEC2940920E2;
	Tue, 22 Sep 2026 19:21:54 +0800 (CST)
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
Subject: [PATCH 3/4] ASoC: dt-bindings: Add Cadence I2S-MC controller
Date: Tue, 22 Sep 2026 19:21:33 +0800
Message-ID: <20260922112134.4167305-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|KUZPR06MB8967:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7bdf7a7d-554f-4490-2a18-08df189bb5b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|36860700016|82310400026|1800799024|6133799003|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZGopu2BXMrkL4MTjwjEocugTZYro3z1C6o1xGcWXfSXOaxoj5VYrbtjFMDcC8K+ofS5a6fWH0nH5WNjf7pcp1TsTFHiqnlFNKuF4XqC2xFLTINVUalOrtI76xvADb0qA22HgFC/a0/xjNYcNCmcoadzldWwX3cnsz/4aVdYeEzslA2bw+E4xqfn2Z88doLdfUD68IzFjJyM5xEb7jEAScxlbCBpO7FI7eES1xdCeod1jD88ygaxt/AqY0RzS9KGxzfAFiYpF42wbrOSy8bboVEWuj8NSfINa0XByjap0E/QHBAPCygFX2TykNciXsnkbZxgu3rH445Y84oCITIe5snhY3Zfq6QqT+7eGbz6jR+JQHqOlgKinZ3pqyQ8oMx085JmZedwixiJ0Zn0rMsGe705fHkATdMF2ArfnRMTyN6CLrn8gbByIYszo9PKFp/pRMTqjZp4TjGJ4CQJSoW2YMbQUL/Uq7EK7nO9x/pMoDmxD6qCyIfELUC5vuVvsGkJYmzeRUqcSjnG3vgnEHLXe9xOLoXhaF4KCdsk/7GWKgBZS3tpEgbkGVGvkTS+4OCfbMPfeVS/xpb2nyhssVRP8Ecb5Tegb12CsO574cCMvSlxYU1M19RtX2L6HEh5b3UbYvjo18X2VbCUCaHXY66nUUg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(36860700016)(82310400026)(1800799024)(6133799003)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3bSMrv5pgiPVUf4+fARoFfi8aHvAgEEOtpUbNmuL0OMg/cU6JxGRITO4KitfQNzEFGXv05XLH1WrAT7sNwaChNhbHJK1+SiMJ6Rk1wmsZGjvhi+/SVfLBB6MxYcBcQ8jaEvHTqi59wJSM7W6nUbM2PTdC1tM1PTmtXulnt5PtTD6aNnIc0mYURgh65KGRKN5JH/R7h11PZ6+sNYylkVbivR03QrV8KO8Tkvie+kDq3m5ihkBptR38e8V4Ums2vcNe/39Zc7NBRHXuRjnHTJRizUYiee8IzGXAyCXnOBhhDyPpHeYagKgJKSdiUsnXNhokdjuh37EpSSsnKVRTrJapHvkm7w+YmoL1wNMPUXLTSrncITZjGEm07wR33DSsZseQm8lSCmduPu+vJS9f7GvaNYD/lOJLuZcpXdzOmu+jfZPYzeEIyobD7ZsrMWl6cyM
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 11:21:55.5295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bdf7a7d-554f-4490-2a18-08df189bb5b0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8967

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add the DT binding for the Cadence I2S-MC multi-channel controller
integrated in the CIX SKY1 audio subsystem. The controller exposes a
transmit DAI and a receive DAI and moves audio through a configurable
set of its 8 data pins. Which pins are wired out and in which
direction is fixed by the board design and described by the
cix,pin-out-num, cix,pin-rx-mask and cix,pin-tx-mask properties.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/sound/cix,sky1-i2s-mc.yaml       | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
new file mode 100644
index 000000000000..a5160f2c2332
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
@@ -0,0 +1,124 @@
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
+    maxItems: 2
+    items:
+      enum: [ tx, rx ]
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
+    audss_dmac: dma-controller {
+        compatible = "cix,sky1-audss-dmac";
+        #dma-cells = <1>;
+    };
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

