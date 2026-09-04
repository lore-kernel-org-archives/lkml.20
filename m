Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020140.outbound.protection.outlook.com [52.101.156.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7797F393DE2;
	Fri,  4 Sep 2026 06:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504420; cv=fail; b=V+6DsgGmaqYmxCVqFNfCkKru1SXkxMQ8xv0oc+CGnlP0b63Pp4L5nsSqRKdPPKM0Syzz/e2QfkFfGR6vuCXvODmXhRpdkLs7/nFP934sAKFJJCc/wzY2lvkPbcrBQvKJ50zyuh9u8cHalLw/Y+J0S0izRjkG+ecpZSfsyVhXUys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504420; c=relaxed/simple;
	bh=0sbeA4Q5qdrjwaEeMQaClE8dclWxfbXVSgPBZKbTPvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GKq/r/vUteRtENqwyMI5gUqSJNpt+d0b4puDiYZ2N3jJ/cXTKTZMkNE0pB8sWxnBiyb29ndVuwLeXwhGdCJMsqY2BFzJCVkmmafOxEiy7hYyzBywLhH1zxkSykO4OQ8oGFEace9FJPr89A0pvFsqiYH61+6qRgaGx/nr7WNQnEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=jBRjht7S; arc=fail smtp.client-ip=52.101.156.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="jBRjht7S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxnvPggzYt80WMOrgd8iiJy7tLmy/YQl6nP/qLsZ9kKl0b9EjDiXp25izatN48SVBO+jHM+QgOYS7iycKgqZ5wGkCjSyGfck0N6cPWs/G1VBcCaLnfwYVSttAiRakGcjehvAUjG9dLMJxbNRl6tJowEE63bwjNenI0a8qW3zoRvovM+jz/CBqOCx9Xj/+rVXSvJ7+Zt34QeWNIgzX9eahPcnpImYBjrhNyAj5lBFMHUaah75Hk94XeXxNWkfavYGJEd+A34pTYu8Fhns6YSjduf0B1jcnL+pPzo7S5RNVrqKzZUx7FOkxgd3KVMvpMG1ykAmiOtswdi8wWJn0/+3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uehjd3P9fSBbl5uS7A4GJAQsfdNpFpt1UphbdO4kLas=;
 b=XfPFWHhPOPrdrThukXF0wmPiPg0HahpjNnw6RLGGMoxLf3NS8leLlah7343Dn+KKTCxHJuWJLnM1tWPSJ9lXGkbFS4u1iGYCTEhboy5iOvS4+Zcz13JakohcCmkG0up6kbY3MYjyuPwKplkqhMPSdAVMk3Q+IrtuZ1362Ib/HqxuSYc7ziqpPY19rePFBrUCBpqKSr5oOXdA1natX1alC+tN+5RtJ/X9Zk98vQkQZz6p1jvOPibJA3nG76tvozTG7RghGhe2cGIwfjlAt7uDW1HA8yVM2FzQaHcCqNi9ITMeFRK2yM4+LbRVqHQjklTgMIaMydCJeLfEd4Hnx45/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uehjd3P9fSBbl5uS7A4GJAQsfdNpFpt1UphbdO4kLas=;
 b=jBRjht7SLbrsoHssbdxKk8tbIwWkfXpLOlucNNdAAiq7bTkRrECK0/hr2OTXM1SkjUJA/CAl2Ty4IeiIZOQA7XWJSFD95MGqIcih539YSav+15qkrFqFyUWOmw1S6gsor1jULow1STkj4kzFX4IQjjOwAN9yknt35vNth4S6bKkxjLczrESeYj+zz7f3aLLPh26GtfnZKvnlNcQJuY+71TP5xtuvJKqU6HrpIPJ3/z0wUVp6oHRTRDWVYTjs9SXhI2CZd9w62chtPUX4zjHOiFdjPzw1Ew0L+M5BW+pORz7R+D8jzmhfhdIK9UA8Lqx8mHSq1Db8Z0d5JfPXKd1sRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SEWP216MB2979.KORP216.PROD.OUTLOOK.COM (2603:1096:101:296::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 06:46:52 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:46:52 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v7 2/9] dt-bindings: media: nxp: Add Wave6 video codec device
Date: Fri,  4 Sep 2026 15:46:28 +0900
Message-Id: <d362714624fa5025db50293b1b737d3fa3ce2c49.1788496816.git.nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1788496816.git.nas.chung@chipsnmedia.com>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0130.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::8) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SEWP216MB2979:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d6ea402-5250-4f2a-6b7c-08df0a504d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|52116014|366016|38350700014|6133799003|10067099003|18002099003|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	FY8+c7T0caONULMD3nHPUQaMRjV45+wrbleJW69X1KJYkMwDm3K80nScT6xRa45PayR9KbvzmBpVuVsnAqYMrPoxXbGhMBqy8n9SUQdqInUMJuAeQGfj+mJ/Iot1ytjgrPK7Vm7UWuWI6TbbnbTtpxJERjjpuK969fMTZqHxonyfJpv9CDAgRI5oDwj73IXpdq2YBLFSCuu43al9QtmIrhY2v9FuN49Tm1sQmIi9kJV0N6ujOR54wuHxS7SgBiZ4FHWisvGCx9JHQj25M+z2Jq6LMXAZDXOdwijAe8hOp6/pSOtF/OxaGr2nvysZHlc/mn6BsyyeWlzAwVXV5XETm7IobbMMhHixi0F1Mp48bCo6vzpd0W/KoHw3THemkr9ak50hIIh7fi0MWEsXEN0uCm83buidjkVOoEhaEHbS2X9e2h2x0x/VQQ1ozCD5CXYv6xwFIzgIqTtNdFcb6EFwRZiMG63AcufnfQycBjky4PB6BvkV1HTysmdPVgolID40lkKixlTmchtQhWKEBZF3j5jnGeuFrJc7xt0I0Lr+sOK+Akrh8qDDmCT48pRDuZpnTerjFzk6slp8wkWZSa/m7E46ml7WSAmpeHelvfGEw9QMcF7XAgSRM0VU/ABIYITQC0hokabOsm27MRsZ+p/oOcH56ARn/P3EHbr/GGjAcP8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(52116014)(366016)(38350700014)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?038NgzLXfyzkpyJA3hmE3rgZ29sbcDL0zD50CLMDtLiAeh1ZBuxwoBY5xeiK?=
 =?us-ascii?Q?EzCGaBwtR9eVm0xvSYlMbKmmry32HKBVXLg8vQsjxX9oqFgeryaG28PVbkcA?=
 =?us-ascii?Q?iZh73rTuAnnIHqPv90NrObT81rIbrfrMplyevmlU2Bsb7OqWCDCs7qnujOM0?=
 =?us-ascii?Q?+wZzUHoZTm6g/yfGEdHbyGrpcMLG86/ktDIDLPFROc4VCvDijM9S0DqhCRjH?=
 =?us-ascii?Q?rR6TjN4MPGZEzKlQZ9+r6F/ZYpVUWWNZuALfGyaF8oLDySbPUk+yz8Zqyj0m?=
 =?us-ascii?Q?fjjQMKZQcextHyba4EwL5AKUE6TI3SOz5k2aTKzov01EtzFPPT/FoejFbbBV?=
 =?us-ascii?Q?ylV/HCUbzi7QtohfOTlh9g++rnjGv74NgQ4+P7gDO9wCozEoXNLadll7B69/?=
 =?us-ascii?Q?5Y9jgmYYnzXiMADX9xbP0/YcSDF9Vu34s8o+SWYU/K+V/Pyx0AUFymIXnIk7?=
 =?us-ascii?Q?6bwg8zzQRxSvlThePgP8AqlwHQyZCRzfRhjYXEF3S6iQtPp6n6WZAI3gxPeo?=
 =?us-ascii?Q?RdxUr2FGlsbhU/Bhb2Idthszt9AJTZEK5EohaF3TQo0mt4YwPjyaKYPkXRl5?=
 =?us-ascii?Q?ktu/BFgowZVsIrY2jeJ6zK553beIF/Aueb0EpDULKGMAZZyfx6S5hQ3XxXC2?=
 =?us-ascii?Q?jcZML2lJws/P4FjAPHx/3IWypazSiHUXDyOH7SssuQjYY6r6dBOzwOMpcN4x?=
 =?us-ascii?Q?ZfGglTrZCBmH85a8cqQm6nFgAOnER1N/lMnmdrcjLtAf5fKLJLbeDs6u23SK?=
 =?us-ascii?Q?dZEh6SY99HX8SdVpt7Cf+Bxql24h/kPGBCkMAtTah4maMaVZPiUSVdg5YzRB?=
 =?us-ascii?Q?PSh/9qRV22ABcuJ4vNydZwycRT36XuflGLP8VjZKxgeBY0RDf9g39oESZjYC?=
 =?us-ascii?Q?DztXiZRxjPUpiR8zMfhD3opHByi8rmKFSFgpJY7960tyxVDTc3csL4t4Vx4h?=
 =?us-ascii?Q?9vB0iuaUDjU6ESawDa8VpqQVDjGCzrYjCjiuAQZ3kNfR9GJRtEyuyB2USSpp?=
 =?us-ascii?Q?X9KLzm5fM1yPDbwuqnpD5ppGHQ6ra+s9/nxQyi0It6IMTn/Yk+Wm0UVthKWj?=
 =?us-ascii?Q?9kQv2OOWpopD0h09i2ke9sNgoGLbuQWMSx03LHMaFnb/a5Utnb/2kQJm5sgN?=
 =?us-ascii?Q?qina/imJhmoEdKotie+uabm6Ko52/E3e+hQtgiCC76Ya5quMd/gRozijwNx5?=
 =?us-ascii?Q?o4o303I8VBTCd4Y2COv8I9584O1SFTb7K57hDUO4EgMfryH2hLMYICJ4Hips?=
 =?us-ascii?Q?0SXGQgVMe8a5g6mVpOmi43WlX0J7ohqFbguwFQ9xSuWZfpNRf/z/1P4Oduq4?=
 =?us-ascii?Q?olHFejtYds59Wq8yBDWYgaKMBr+dQSyaLwuAUoj0bTY2ayrZ6hu5lGPYSRtb?=
 =?us-ascii?Q?N6VEmlay7ckNK/9cuKSPC4dKwFklNKK6SMR/WZRmljH5NIa1MnHOJjuKo0S+?=
 =?us-ascii?Q?15gBGdo3SXxMC3xe+ar0gvuGRvokjMi4LzMN0A7ZFdVG+O22+jvb+BCdh0Eb?=
 =?us-ascii?Q?Cx/EwEmwDQTu9rFOn/xVwQQ4U4Ce5BrNHPj2xPKAYFUGEL2Y34X3UgAnto5Z?=
 =?us-ascii?Q?bnvFTiMeDLO4jW792mo2fS6pjen5dRpX6GJVJmrcaJ3wWBsaYBNNJULieWYF?=
 =?us-ascii?Q?uY7z3/WvQ+Av1eMsPo7tTOVMnGikBZFP8l8sfIh0kF08pjJTlSOifnXVV6xL?=
 =?us-ascii?Q?YAKh7FoHqBuhc8Cc0PaOZp1szodBd1knJgPOzY9Z17nCKcYd9JHbxiugGwzB?=
 =?us-ascii?Q?9sFUs5X1hSLngXc8TvkOrwQsTMoyu7Y=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6ea402-5250-4f2a-6b7c-08df0a504d45
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:46:52.1071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zcpfk9bxQH7/2iereSgjpjdeb8qNtiQutvMkFL1jWaps4g2bq5IZ+Dxl/saARVfkH8OUUJYkqwgdAHV41KvU8TFWVly3IhAIZTSbERu37g0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2979

Add documentation for the Chips&Media Wave6 video codec on NXP i.MX SoCs.

The hardware contains one control register region and four interface
register regions for a shared video processing engine. The control region
manages shared resources such as firmware memory, while each interface
region has its own MMIO range and interrupt.

The control region and each interface region are distinct DMA requesters
and can be associated with separate IOMMU stream IDs. Represent the
control region as the parent node and the interface register regions as
child nodes to describe these resources.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../bindings/media/nxp,imx95-vpu.yaml         | 162 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
new file mode 100644
index 000000000000..aa7dd8838af0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx95-vpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chips&Media Wave6 Series multi-standard codec IP on NXP i.MX SoCs
+
+maintainers:
+  - Nas Chung <nas.chung@chipsnmedia.com>
+  - Jackson Lee <jackson.lee@chipsnmedia.com>
+
+description:
+  The Chips&Media Wave6 codec IP is a multi-standard video encoder/decoder.
+  On NXP i.MX SoCs, the Wave6 codec IP exposes one control register region and
+  four interface register regions for a shared video processing engine.
+  The parent node describes the control region, which has its own MMIO range and
+  manages shared resources such as firmware memory. The child nodes describe the
+  interface register regions. Each interface region has its own MMIO range and
+  interrupt.
+  The control region and the interface regions are distinct DMA requesters.
+  The control region and each interface region can be associated with separate
+  IOMMU stream IDs, allowing DMA isolation between them.
+
+properties:
+  compatible:
+    enum:
+      - nxp,imx95-vpu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: VPU core clock
+      - description: VPU associated block clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: vpublk
+
+  power-domains:
+    items:
+      - description: Main VPU power domain
+      - description: Performance power domain
+
+  power-domain-names:
+    items:
+      - const: vpu
+      - const: perf
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+    description:
+      Used to store reference data, reducing DMA memory bandwidth.
+
+  iommus:
+    maxItems: 1
+
+  "#cooling-cells":
+    const: 2
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+patternProperties:
+  "^interface@[0-9a-f]+$":
+    type: object
+    description:
+      An interface register region within the Chips&Media Wave6 codec IP.
+      Each region has its own MMIO range and interrupt and can be associated
+      with a separate IOMMU stream ID for DMA isolation.
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      iommus:
+        maxItems: 1
+
+    required:
+      - reg
+      - interrupts
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - memory-region
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      video-codec@4c4c0000 {
+        compatible = "nxp,imx95-vpu";
+        reg = <0x0 0x4c4c0000 0x0 0x10000>;
+        clocks = <&scmi_clk 115>,
+                 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+        clock-names = "core", "vpublk";
+        power-domains = <&scmi_devpd 21>,
+                        <&scmi_perf 10>;
+        power-domain-names = "vpu", "perf";
+        memory-region = <&vpu_boot>;
+        sram = <&sram1>;
+        iommus = <&smmu 0x32>;
+        #cooling-cells = <2>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        interface@4c480000 {
+          reg = <0x0 0x4c480000 0x0 0x10000>;
+          interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+          iommus = <&smmu 0x33>;
+        };
+
+        interface@4c490000 {
+          reg = <0x0 0x4c490000 0x0 0x10000>;
+          interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+          iommus = <&smmu 0x34>;
+        };
+
+        interface@4c4a0000 {
+          reg = <0x0 0x4c4a0000 0x0 0x10000>;
+          interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+          iommus = <&smmu 0x35>;
+        };
+
+        interface@4c4b0000 {
+          reg = <0x0 0x4c4b0000 0x0 0x10000>;
+          interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+          iommus = <&smmu 0x36>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8d9648737e92..7387a11facbe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29233,6 +29233,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/cnm,wave521c.yaml
 F:	drivers/media/platform/chips-media/wave5/
 
+WAVE6 VPU CODEC DRIVER
+M:	Nas Chung <nas.chung@chipsnmedia.com>
+M:	Jackson Lee <jackson.lee@chipsnmedia.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
+
 WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
-- 
2.31.1

