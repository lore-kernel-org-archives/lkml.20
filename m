Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.137
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793962340;
	b=XKqj227rFMZJnWBHYAQlRqluqk8RUoO9+m4yW/mgmS9hvS838ESl5kWx++yZFD9mETS0
	 djOBaqHTiIuu/AA4f3ngJ96enW8dC3XarIMwak+xB/fN+GL6eTg4MylpUozQLIunOKpOG
	 J2sLYIb/lmgQodf1/HX1XIRluicct+z7++jPl49KXFlG/zHlQCafxJUz58CwTX4J5UOdC
	 wQZ50kSk48d0yAkEhEZwJ3ZVs70P54N44hLlLY8AQiMvwo1gKmtLz5oawk+c4/Ad4F9qu
	 r0rAnHismCt2vlBh4eCExUG/A/lCHDoOOryajaGNZgwvKhcw5T2oWVdPhX87qjWDSDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962340;
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
	b=WMaKiyLgR35QtbMtoGyZFS2bT3kCfufqcHe4sc4UZRzlzwj0fOCW8dsFK6LV7hRKTMcC
	 Nvs3IuDYIx6NZPz7jqJ0y5k4WYUtTpVY3pjvNVnYUWMYksf5ocBLHZC2XPeUEvpdxPiJe
	 FsCo9XCRLtfXpCiRFrFABQjd1rSNLrUNi83PpWbp6uqqoVC4CLaab7ZLsAFzC5gcmajKR
	 YFps4DRgvQ7I7ffYZO36dlzC4Q3XUnCtrARGpYJOSuM859DZcNVSyp7eBr5n5tVUtdQuc
	 BkAyuI515f8MOP5vFu9SAInnmkPF+r0ItlNCqIpQ51SwFmYDlPRN4JAoVUZ2aP9iJug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.137
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023137.outbound.protection.outlook.com [52.101.127.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC6C606D812;
	Fri,  6 Nov 2026 10:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC6C606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEov2htBmTeV/TnV57LDKTB2yKVjVkBaPQTotYtaKLzhVQFz/kZhb8JsZCasGi5kFuRZZHRyFdKZGYPeWDQ0hBfY1zGZ2nV+6/nH6U0ulmGQX/vPpIYhp1ll+Lq6ZSlhsxUyZPeueDkx4FBskTJ398z9k6PTf9ovvAwqQTg/CbveRie5H6Dgynb7UtBo0A7EyqrFG7W7+Xkvc5B4H4QpFY8azPkr9XL8Vi2kxTEYhrDO9eEstOK1G0vKAfqy0gOQWKC6bjkDQzIu12Q5asSUkFYnCBL3sNHhaHJcO2a/k3eNWoSnBNKxofzD9NnAXJ4Eaoqvpau058vYJoQ5IrE5Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWuxxH9KeTzjFdlQTFI0LN67TNXQ6QISFuOPWqPoIDE=;
 b=mAdgJ6q+JWCcrGHBIs5+wN6Lkv7i4lPPbFPbWJ/pF9PSuGvQnzJ7kO5K3bG93Qpat37pkRuBDSs2y0WMhA6a2fbyFMU7TkpQdKwE53HLU1835EiqIJtK5wMpJbsW8OF/0VGNJGojyHxQXAq9J77vYoSIhEVhk+CKV8HyTf1/qonYmP6APigZThksS+PPUGXH8B+yNFU4D4hhqG2MpWioH/6eM81pc6Bsna032jaj4odArX9YIDBpCshvAeTz5qUotf6ih7h8RoEtrLzySbasKTwQdrplHPsS2V9t7wlY/0IamHi9Yk6qz/JCMqSsj8uKXk9W0ECIdjW9IXKXVJEIoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) by SI6PR06MB7168.apcprd06.prod.outlook.com
 (2603:1096:4:250::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Fri, 6 Nov 2026
 10:52:16 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:192:cafe::2) by SI2PR01CA0036.outlook.office365.com
 (2603:1096:4:192::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 10:52:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:52:15 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 9617E40920E7;
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
Subject: [PATCH v5 3/4] ASoC: dt-bindings: Add Cadence I2S-MC controller
Date: Fri,  6 Nov 2026 18:52:07 +0800
Message-ID: <20261106105208.1246554-4-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|SI6PR06MB7168:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 48a213c1-fe4b-4661-1bc0-08df3bf40556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|7416014|1800799024|82310400026|56012099006|261021121427099003|261102123227099003|261009223027099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	HuO7fcGs/z4RMmwzPHq1WD3KqF0egZrwVbPgKrXGGlSuHbX6xabruaL+AUwrS7RlDegKrGG1yw1hLWPlo6jIVvdYMcaah0LMIE5xxWaDVGd4SFmqS8Gr7iafnvQ+N7KdyS2quTNXBzQVWXzXJULVlrPowvRGSWsofWAtNCuuvHVY30G8rxQOZh9bVJP0gPwBnr/OUDPAFDWdfn+blMm6TqBdnU2Z3FN+GX/fwaDWn5XLsQKYJa0tODPRfy7z5MAzk0PmdLsKnZf2LYoAopbfy8tt5h2IDGbynwiqrjSRGIK5vRoZIPysoI9vjdLXaeQk2PUDRvv0V/5JfIcOwTlORK7fs0Bq9HAqX8asKBtOTFmpx76Higcyrepf5Dz9jPSnusmjljEwXibKn+WJcWRKLibDniNiqBgU1/vayY4mViYJgaqSi+813kekzWkpcfPxchWqTrUwd9dKzlw1kHoOo72DO2ubu6X+DXmEKDx86CMSmrtGDwsAOmO/8bNTZePeSGwpyzIIQ0MZx2Rg5RXS7zAcSNS/5fl0fijlwVLAjvlwFuxZK6xaINbgwi4vJDdy5+v7tRaOKceGCeZAak6C+jGbur06MklymNZQZwgQYTKtbmX/IDGbu3TMCFPeuMrGBJW2pLb9YGlwE9iRvRjrSg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(7416014)(1800799024)(82310400026)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VnybMzmeIZwJozgFZGbLWU/ZwTtUQCh3SkObnagkGb5HyRg3g5c9l6Mn2HxCatLEVNX300Tr+cggSJsQARO/GqCiqnUb33ClVlUHf37s6Huz0qfl4YX8vJeqSTLwktdDYQsUr/7/DWdxZRb2BIyGfNwzCxsM7mlkqE36HUmdr1FoHi2y+P3zW8F3E6UaWnbwijEWWJ410NSC6sScF3GlUKxd2TGF78D5dmM89WmbonlGXS3+Sh8ulLDQcveAm8eOrsANkjd4dzU0l4Gzypwjm5QVSO2w8YI4SjWbMCyYLd6w1kdUKQZdaIcDlZYJiSJXxnad/t6KfEFTx50/CMqMjVkVSRsXx+FS0rhYpYmrrp/OBerDijPRBgYojGoTMTcZdoKfyd7TsrdhGgcYSiUJutL2SBIqD277bX53gAKiNPLoxRimyQIVPFQNbL9hLmTo
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:52:15.5218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a213c1-fe4b-4661-1bc0-08df3bf40556
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7168

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

