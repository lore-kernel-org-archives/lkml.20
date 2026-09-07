Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011025.outbound.protection.outlook.com [40.93.194.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B435543C076;
	Mon,  7 Sep 2026 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769757; cv=fail; b=O5HT3OvmJrYeiRxtWUslvayjwo4YfRCILdo8U0l4TjSHHg+kHEljn3g/Jfu+9H1uQxKX5v3KvyLfzdKvGxKUWSYGCH75vqgw0ocBbgE3tEqTPL2yG6gnDsQ6thUDc88YR6MXnjHcW4fJvsABWb046SNwtKBQdeBnTAAIn2s81uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769757; c=relaxed/simple;
	bh=asAxI7IpWrcbua6FrjOmpo0L9SVigIzMlmRJ7HRYHd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s2ttSjwZD7d0rOAeUQ/w7w9mlaKXfuw0cRGn6o1FKPQrSpW8nGsmr5zPJ//KwODnk5EG9QMWG6iNrwU01Kf5dnA+4LkvqxWBFzMX5TBO6rBWPHZrYhHl4mOQV/BXGyx9sJjQiq9Vo1hIdqd8n9SO1sH7/7AjRv2H+eBQLNZAD4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=upSDk2/X; arc=fail smtp.client-ip=40.93.194.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="upSDk2/X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Muy6adBDjGbUAk/YlFUBUimqBTMhxfpeGzUUTvIgRnXF6NMmM6Spn4G60K7b42iFTisd8VYoj3l56hhCBUqcx6t1Sp94ipiR1/u+HdAog5bZ/01w6reD7t/F/onsUR05uc4mtJJeIStnyNh1bixzTZSR9NtGLY+ATCdMN8xPOzXk+1/Jr1+JRLSeYjJBhfvhx5TzNzXkOI2QrzGChxGjBBDslfSPvnaAYpU/tFM0Jq2NI3GK+g1hxXKU230GHnWAjds7EgsQPmORXr1euTsPLSNasPhr76d0xrghjEP1Ia0aqQGZgkINQ3w/BgkHth8wQBCVqYVMktTFlIzz5J7vPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4lKLykRizlOgoGemPODwx1sAnurIjb93wE2haFDtd8=;
 b=a/wq8nesvxm/yP7rLisOttmS63uI9jUBT05UF2BNAWNGuYT8Zrc0mMPm6YLg2SDlpokQ2HcfJhICy9sa+Zmma11S+AamUsGIkdHAtQeof3AWUaJn7mMMLBRw9RSHY4M/waZqUAMnuYX5ShDBGYzOQVzqWwf9gwXcF65U0+iJmCkWkr2r6p2AUGyaa51Lr3ImJLlR0eEB5cWGTzcUtgi3npbseMFuibtHxBMCmxotfLFVC3O16T1F2TUWYH2oMwLoGFuB2gAEwTRAMTGMfm1/yk6ZWzWpl1GtY5GvW9FXdxH8NW6rLcHEBwDCqkIZvVVYcGXPWIg/3E2KHU+mRE2PuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4lKLykRizlOgoGemPODwx1sAnurIjb93wE2haFDtd8=;
 b=upSDk2/XFnvpY2Zqv7NOuBdcBC7CE0jYYX1usRW7rxm0SKIf9Qsbh5gj9woT8zWZb+3JunsB/MRqCedA0GebX9eKPQNBdUmpKTT84i8hgd/rk69NP1xdHRSkDzQ/PxgxiNLaWaU7CbF49TB0K5opVvnz5j/55Exl3DbAqZ4Sv05IWnvYxR3Ju7Uw3/BBX/7aTCwzrEP8L5YF0XTkelose9d8r8sJ3bYE8ZJyt/V0wsFAFuA2KHD6UX1LnKUAqHkhAuqjN5A9FxKsyltJJJUuCduStMvvzGiYXJZrHBDKOFitxxtm36kMdTaAayeyiy5kSEwuIS1CdOe7bDUDctaJLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CO1PR03MB5777.namprd03.prod.outlook.com (2603:10b6:303:9c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Mon, 7 Sep 2026 08:29:12 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:29:12 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v5 1/4] dt-bindings: usb: add Altera Agilex5 DWC3 controller
Date: Mon,  7 Sep 2026 16:21:38 +0800
Message-ID: <19d22389b795bd0883dc481f045a293b400f1ea3.1788757821.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1788757821.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788757821.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CO1PR03MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: ac422b46-7f9d-4f84-87ee-08df0cba1866
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	X4qDfWgPy/JNiy5jwHWeFxPq3VZeA12jBOm05TSsSHOppWwdStG5e8wRvcGSUoH81vD6qroRLaIuFn239AMQ1sNlRwQrJIPQdJlUICEwBxx13y5L4O7WxiuSdvxfTxR1BGtZS2EfYsapsSNTn1/KWwTww7MOYCH+ic91jpmYGM7kpYizvfFeIrr+YW5hwnv9zlJZaMDzNcAM81TOKltztHNLMs6wPEG2t7oBW4Z8/unQrQEQ9rLnr51/b1+5u+7QmvWjxYbMQemRzkuQ56p558d5iCuPvXC7gz4CTZvdUSXXV9vcKZCJiIJKN5MuaVS/NNJ6ei9XkRk4/dukLkN0I6RkyuOZY2bHEdPTa3tIasRhUwgNHIQQCuwv9SrYm5RWzGViZU6h6B6pkbMKQC1imUCPxWi0eOKSbw2ZackgJPYF00w9f7MJO2ifF8PTRobcslWkFUARdQpoYnJGZkSZtYt7fpqpnZ5/D8BGPVKgodNn17hRVBeUOeWAJGW4axvCGPuLKPS2HAyd+BZaTqDPRZQJwmTlOZtxA3qKxbImrUbYNSgtT9M18GO/3N9dR7sDUgpju0JKwvZ13JgCK4PA/poOrNDPx5cEODaHGtv2+aA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ygorwLcws7Igks5PG2Ms+un8CIAALfsyCLKCqmejXLSKhgarej1wy6mV7uDy?=
 =?us-ascii?Q?QLCTYHBwptDr0jt6hLwl57Rpf8zq6t073rYVcUEDO2ofp+E9m9G0/BfCZbuT?=
 =?us-ascii?Q?uUQfQZpLE33Vb8skIcwWPDYQOsd9/bC7QTzdl5/p+raUO9byKARe9RDrhZlg?=
 =?us-ascii?Q?6TfRqJJ+wn1PPy00lj11G2k32rSVcZ7sk9o/QA/x4RZkRCiy/px1Yg/uVc55?=
 =?us-ascii?Q?eqpZMfTJrZYGHKAuGEgCCITTAo2UOsAQfjad9AWhM2L7XbGccuKYMQImNZSU?=
 =?us-ascii?Q?QOAKW6NHmEAsdTlfxI2WBjfpPlOV/Wzqzh+6UMiLWdyhWBUO2Hh9KjkM2SjM?=
 =?us-ascii?Q?Cv30aGpK4HFDyPujBL+7ZP0VyI+vuoKfWvxSK1uk6CYdjx9k6jAGhJLwQnE+?=
 =?us-ascii?Q?BQMzhWarqSiiuypKhfkXvyDOlOkaHXuhIDhjjAFONvYRHeozgX4zo9frN/s9?=
 =?us-ascii?Q?zQeD5xom0NHvLXcLDVvQpq16f50Hw/9e8j9CULaosGTmqqoY3iPDLB5k6AxY?=
 =?us-ascii?Q?sFSYlDECABRpWebXccQdWbAzANx8O6kKM3r6teHlNvUd9GZ13asITxYXXCm7?=
 =?us-ascii?Q?jvhoLa+RoCYY+7KUbi1s8sewd+4SwIpjg7zs6y6plbMu9i6ExN3i65qWnO4D?=
 =?us-ascii?Q?X8+/5BtR59eS4aHqZBPTyXarXtXaF9yNUMZORZtyDKL22kSZDxXv5TPg0kfp?=
 =?us-ascii?Q?QemIITVMKfUkptv71qB8bcDzhRpLmjJnd2kmFs+JjYcjDOZdqE6+X3tLt75k?=
 =?us-ascii?Q?c7ZTgeDY9X6KVKAQEnz7YMZQK9wVC2iWa/DGidDuFD0pu5WKftHhyLhjd82b?=
 =?us-ascii?Q?z4Dvcs/FLq/iU4/6FpGi9DiO2bvQWMdlTQtZgyIrWgxXhzqPmOMYUvqutike?=
 =?us-ascii?Q?kAYZaARy3AAijHeXk0CPa0U5BF+dC/sdtPZ7p3l7RjoQgRliRFtkyX/PnPpA?=
 =?us-ascii?Q?zfMOeuRzpl12c1Jkjoc/iWPcPK0j5ivy7iHeNAt546V4TqV2jmgBmGLXE4ZT?=
 =?us-ascii?Q?F4y3MhxP1CtXm+mhgO2sRz2LYYjIMZl36FrzhOTAK5ldL4C8TQSme2wZT1d/?=
 =?us-ascii?Q?bsHF4rfN0k5dZx0ysJH39lCuVYYYNcgD0Ov667qmH5HPZ9aYrG6wbysUojFF?=
 =?us-ascii?Q?PBu4dvz8OF/R2o9UOVtUmffK5U/e+XhwYI3C0qP1o1mtqsAAX/kohB25+pIe?=
 =?us-ascii?Q?zO3JzdVGc5cPiL15FqDIJCcPtEXgo6ii0o08DdYsyJWT8iKnqcqo9QzoCQGc?=
 =?us-ascii?Q?jVo5VvLqq7GIi+05G/A3EkqGlbq1Vab/brltePXKRG3UFSCfFUKjy9TacXh9?=
 =?us-ascii?Q?47fzGGu9nJowitMi3hhtOb+ttgofT81RnmueiOY40KBzC7ZrYRH8/I/fu0LB?=
 =?us-ascii?Q?GavlNoFtkoBEn6zlv2OT2mar4V0ErMZoQBkXSjm3Eq763w1Lst21ppdbWQ0u?=
 =?us-ascii?Q?D6CNELjg3QaWiFTriB+xf4JYOyZ+gIhnrdY/ikZcLKqBqK2mZg2fam75K6A3?=
 =?us-ascii?Q?jlFhL2ILauzWQiN001CXimdNtdinDMyFoesTxft2o3WChjUlZZl/xBvwPMkM?=
 =?us-ascii?Q?D7T0RI2OlkPSQ6mR+clNAwi1AMw1ZpJylOR7GjMEf/G+/4wnxMj+teFjbUTJ?=
 =?us-ascii?Q?w5I+pUWn4hJF25psJWop8PZR1A0ld7M8HUbvcbfjsx0LC5tR3L3XpSojPmNj?=
 =?us-ascii?Q?kWsn4hb/t7zkcdWeL1ksDBkywdeEkxx4sd7RF4zr6PzuPIl4SmfPjl4jDpSC?=
 =?us-ascii?Q?1VgbRlLkGGioWNZepMICu00MAzQpm+A=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac422b46-7f9d-4f84-87ee-08df0cba1866
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:29:12.6045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3OE9fzaX0jI7odmNykFox0m6yZmnGFsMwzPmkmb8qOJBw0Ez8juYRSIlhnfDNGpSDcjdREkd9WzdherSqRmJHTPuutXcs2AlriEAL4xMLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5777

Add a binding for the Altera Agilex5 SoC integration of the Synopsys DWC3
USB controller (compatible "altr,agilex5-dwc3"), covering clocks, resets,
PHYs, and optional IOMMU support.

Clock names follow the snps,dwc3.yaml example order (bus_early, ref,
suspend). Reset names use core/ecc. On this SoC ref and suspend are the
same hardware source, so the example reuses AGILEX5_USB31_SUSPEND_CLK.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 .../bindings/usb/altr,agilex5-dwc3.yaml       | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
new file mode 100644
index 000000000000..9970d7c9d6fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/altr,agilex5-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera Agilex5 DWC3 USB SoC Controller
+
+maintainers:
+  - Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
+
+description:
+  The Altera Agilex5 SoCFPGA integrates a Synopsys DesignWare USB3 (DWC3)
+  controller that supports host, device and DRD modes.
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: altr,agilex5-dwc3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Master/Core bus clock
+      - description: Controller reference clock
+      - description: Controller suspend clock
+
+  clock-names:
+    items:
+      - const: bus_early
+      - const: ref
+      - const: suspend
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    minItems: 2
+    maxItems: 2
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  iommus:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: DWC3 core reset
+      - description: DWC3 ECC reset
+
+  reset-names:
+    items:
+      - const: core
+      - const: ecc
+
+  dr_mode: true
+
+  maximum-speed: true
+
+  snps,dis_u2_susphy_quirk: true
+
+  snps,dis_u3_susphy_quirk: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - phy-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/altr,rst-mgr-s10.h>
+    #include <dt-bindings/clock/intel,agilex5-clkmgr.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        usb@11000000 {
+            compatible = "altr,agilex5-dwc3";
+            reg = <0x11000000 0x100000>;
+            interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clkmgr AGILEX5_USB31_BUS_CLK_EARLY>,
+                     <&clkmgr AGILEX5_USB31_SUSPEND_CLK>,
+                     <&clkmgr AGILEX5_USB31_SUSPEND_CLK>;
+            clock-names = "bus_early", "ref", "suspend";
+            phys = <&usbphy0>, <&usbphy1>;
+            phy-names = "usb2-phy", "usb3-phy";
+            resets = <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
+            reset-names = "core", "ecc";
+            iommus = <&smmu 7>;
+        };
+    };
-- 
2.49.GIT

