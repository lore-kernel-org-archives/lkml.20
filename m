Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023079.outbound.protection.outlook.com [52.101.127.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7788A30100E;
	Mon, 28 Sep 2026 05:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573795; cv=fail; b=kmwR2zYQvGzsGutSZSpfkt73B6UoFYW9TQjJOwVeh/Hb+ZP6JLBq+BzjjasOb4e7tgCghDw4gq5cv3Qt8djsRwLLkJUwKLFrC8rkGwG0l9VfZKhs5rpcfzjhOoysr68jaAHCArGKHBuPNYlMwW4bUGg4b8jNgqAXcYFZ8cqLcAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573795; c=relaxed/simple;
	bh=HeS30dGw+n7U9rknU1yn/kZEfdSzIsss2TLmxpQYFUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MCSP1rp/Roicno3uEzWIONII0yQ+29qNGM7ILWZSlDEzYp9mQ8LxtmJ5KvPafS1t+T54oZpNwTcXF5KGXNbGVg0JnJIHlQ1MBo1M3HiFuaOAikVzrvRAA7cZeyIxxwOJWINBDd+lEQK4OqJFFmdb5fLyhjAvu1QgI4JpWX+EWB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpMygpBSGUc5T4hynqvL3+9WCUhOGyf3r7BgoIh/eqc/C2WEpICt54u53rbALBtfg0fYWYZ4RVYe/xSLTtE8vJWzsDhw/E1LgdC3iYjTZTEsFTiX6iq+kXNpiybzYl5fbW0tJP1iq6YlYJQjYLp0ei5tEypWNEAQDM8Hu6AaKZAwXgALMOzZ+8oNgGQn+4QKnVarPoKjPSiR8Cpu+z790IqsNE0SMx9AySnZzZCeH2p6jWLHE/Wnd92JHbaRZ8x342lgHE7qMlQteT7lWVVjiQFzPAU2K2IRl24+ioAfFdsr6FdLxkVYnT0BWyFInqrSm5koS6zHTGh12eD3pJj5LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2o3tC8S8FaiUOJP7MVA4jQYf4M7+FC9FY1lAyKjGJ4=;
 b=TN1Ogx1GfbI6TTR7zW0k3rD2xER51RZ7rCf/fKnz1wxOtu5k/fgSPDH+/K54UkxG50d5MC4RtynnWA7bJyG3bYFIUVDdrXIooXycnyb69G0AUCyoOA+8Q6cR2AwiYyXde3fSw0+v3M3bOTjk8HgOgu11lvt1kMfpSgryUi79s4ai6vH00ohLDPkGvqMsxpD6DTpe3oVk+P0+hBlb/n1KLiB6/Z4SmfYfR4GnjsTJNDxHX831Es+QW9ACq6HHUZEch7/2JMjk6sT601R84REdkIiaBI0YCOsNMOXubhXzxDx5BpeclPik3eh+DaFg7p5mMlNfGAiY3r596PC1FUu4Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0055.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::19) by SG2PR06MB5153.apcprd06.prod.outlook.com
 (2603:1096:4:1cc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 05:36:30 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:300:57:cafe::c) by PS2PR01CA0055.outlook.office365.com
 (2603:1096:300:57::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 05:36:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 05:36:29 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BB83C43B1076;
	Mon, 28 Sep 2026 13:36:28 +0800 (CST)
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
Subject: [PATCH v2 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Date: Mon, 28 Sep 2026 13:36:10 +0800
Message-ID: <20260928053613.2158446-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260928053613.2158446-1-joakim.zhang@cixtech.com>
References: <20260928053613.2158446-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|SG2PR06MB5153:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ffb19306-891f-4389-b30e-08df1d2272b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|23010399003|36860700016|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nKh0JZaObnnECOVKhzreFVF9Idy4HZK9wUzLUApNhW6+EVMAO9HhnOYJ30cDJsdHsELVcDJspsJeloeiZ5l+9kTvWbaqldodEMPgMWDnjt6EmQl8BEWISUCPJQiuDJyJqkeHtwdl27apw3MnHLed6qIooePg9k+RpAPB/Dyrj6XfGMdBY+b/s1uP7Vo3AUyoSrZhJMWR4fclY0gFd3jJq32D7zGpiNreJuRN1MEkVuaEOIz3cLBawmmlEjNVCng4kDJlQK/TcxB0brfWTDS8gE/tIIWokTTmyEefxByYsvXyg9mKQbVaU7phl70NTGS5vE40enClnZ7ce4pIaB13zJQj4dj2ZYHnyHe3c3BJH0cUT0BME6h9n7lxgosJRhG/m2pHlv8Vm+VulDZmYYLz/f7+NRJc6lt7Whqtp7sTUxYD1R2BJGu2ISFk34UWD18UHRD0IbOoLwYTHaJfMY0QbTUvtSSavN4LPQ1Y1Vgj+XmQzV/W0lOKuhbwEnVrNf52XK6T3YiFmCSzXfqmCAXv3LIGaPUvlly7m5T7/efe7MyfBt623NsBXcHvpVYlVim1I4iVO3FD7iXQ4UQXG6Lb0xOCnNweQ839/Crw7FPV8tBn/AXP9rOJ++VB2OJ0q/8EoW+XKMRf32lFORK/7sTZwg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(23010399003)(36860700016)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	McxsNtF0OSOO7KyTjab0TSkbGxm//oYpuZFPyLhgvTVRV5kB6OeC7GlRGQGj8qdrvrmUPPPCLqIphpmZ8vcLOBHL+we7WOrBBgbnwuiQTkZPPtO6QKxNbz2hwZJhBvx/GqSwpJcTbBmiieVa1439zygG15sVfMfDcTsrfZtiRw2P4cnkrD4bkhdBLgZ4EUdj+lRk3SCddfauiQs3caZaiJzVRjN19pp5jxXV2tCIo3nOnRMvoyDGWpv1fMFLpAnq6LVHjePxoQzLqD0m0fPfCT8BvOChjSdbHnYp1nyFOX1eRFd17HLKvuMe+icayJj5jeTkGi/r8YiA4zqkxfnsAlYwDyxvu8+qjHv3wpIV1apMDwXjEG465/dGzvwDA7HU/p0ARBbpbpCUikzvhNhcr4SYC2Xf8HwrCFfjlL9q5iKGf9S8p6qsEMWWtBmMusYr
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 05:36:29.8153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb19306-891f-4389-b30e-08df1d2272b0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5153

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

