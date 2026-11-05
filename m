Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793860898;
	b=de4gRXf8C1eL8hZbE00nIEzddnmdcDGagCooQl+swv00H7ShVksdgmD2TLlNC0k4EbEU
	 WvGCl/aBj7PqgJwUyiHVyTzRlLQCON4pcpvv4gKoBJPvP4fmN4QF2JKJ/k/w7p8DPm4fF
	 eIgSOODu+gvSeuXfOiWCBfLPDul/+TuRP4HWuP8EZdM70nc4YX4m+Gs8PDcj9XXXkQINk
	 UI+0DeXqVVtRV3nammFiu/gtveayAOO1wwDxEuV2afOHOFLvdTUga9Gw33g3Y+XgWpH8p
	 6OQFRm6rcsvqe0TBdak+cy18+d4PdzIGJERKRXKKPt81QAVfKa1LI2F0Wv42xF0zEGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793860898;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lP84x6jamEsQhmvAkar7pfpGsWrgb3M8UC8b8nLssoc=;
	b=Td1+FjTl/QXnsubK5cF8YSDPfQBt5Ri7HZniKT7BVWsjbY+/pAHZTG6uIjh/3u8Jajv6
	 r0g7bY8s4fq9avzoBBJUwjx6fXtqnkCF6BH8UbWON5tG4PfyeOegyv9igqENgN4IsC2Ik
	 wBX2QCm/Oem0+YDqr/WO1t/iibIAbKOOE9bn0ivSXiSB72wXRPX7BZPeiESvdHQiavUDm
	 igxwL3X4S/6LPG1oJ6AjZTYfUG1q4GzRgByMW+xSey9t/9fYMdeicunjQG/hLqFP4Vb5f
	 mif1MwM9JIhjuYgubEz2qAy8+uZCtopAMTzrjMQ/2ZgtzEwqy+Dw+U1zL3riIclJ/2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HGfEIAwt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.45
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013045.outbound.protection.outlook.com [52.101.83.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23073606D802;
	Thu,  5 Nov 2026 06:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23073606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HGfEIAwt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvjGLb2jgZ/AAkA/DlP79+f6ZWrHyABMpYfMIQr4vOE/EvuymMZUHsMEegDhSXZrGNLN7SalI+SObvqYILdFcbt6v32sFK2kX74WQfj9YLaanCvvZbNbFZvalYkJyknSYoEWg1VnWxJSe2nkR3ldcIFUqeHQFVPnblSwaC5ISJLTj4Da23nc61frRhOKsH3F8H0kDtYmu0iiCCF5bmGLVfsJFsz1gTiAd88Ll8FEQORXN3cPIzMBK9fVf77dfONmDQjGoQA5E0lucTQ52DIea+5T8w9asoM4keHxndqz0KfOi8xgzpeHc/UVE2h0jv9jX5ev7V0Go5IncAQhsFvUrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lP84x6jamEsQhmvAkar7pfpGsWrgb3M8UC8b8nLssoc=;
 b=gFpgI10/eHcAMpwDbwxseuPjDMwI9s3Ve/Wjgz30qpdFAcf+gBoeDzYzJ+U//2qWSZ0R8SPWCdNGK3SlyA7EJqgAfm9Dfl5gUB6V6ktdbTdg+xfnletQ/1n+cmUr67624s56LXWkUE1cPRhK5ZkoesgKop3tZbkA55uZaWSxBHzpSUsd6ojfzvK+tTJLsZk/GzVtU1azwjej4JcHCUudhPoEnMm0vqO25z5FaXBXycG7EPzhk17c3LIZCg5p9KUxyS6rdxRUgwr+Lj9+dOhIDJqA35AwPmDgnICNYTC0MRqnFXVCo5SlrUbWbkf1ld7W8s0Xm8KIWUUTAtjgsliWSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lP84x6jamEsQhmvAkar7pfpGsWrgb3M8UC8b8nLssoc=;
 b=HGfEIAwtvS84TClLlSw1uIMlfA1NNSO0pnHl0pomC8nh+GT8qxyLK6+YC7FS+XluCe0iY5UWJ8PYJPLKxO2AlTXQr5LpFqf/CmVsSCwVGIkxcQNWuaqfncTkMqgTHs4hEgz2IFPHKM2MQ+saV+CzqZhii3CUTR2K7+9fZL2z/lSc3wYQ/rUY6AjzvrSfAnGhdLABZqjdnwTZ/u8ZcY00vklw/VDb8EbyJ9cR4+EXGQC7xGobYaimyGxBz+/ieNZXXrZH/i808Aavk8wpDtPrEy0OFz+54YvjffTilnpUPCNA+J8GKBF7LegkbBpQRbA6c6XaVUAa5TjRszPZFvrcyw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by DBBPR04MB8026.eurprd04.prod.outlook.com
 (2603:10a6:10:1ed::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 06:41:35 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 06:41:35 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/4] dt-bindings: connector: Add fsl,aud-io-slot binding
Date: Thu,  5 Nov 2026 15:41:14 +0900
Message-ID: <20261105064117.277495-2-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
References: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0081.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|DBBPR04MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 2298d6e5-ffb0-4b7b-2e3c-08df3b07d5c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|23010399003|22082099003|18002099003|6133799003|10067099003|3023799007|56012099006|11063799006|261026140227099003|261028144727099003|261026121527099003|261021121427099003|261102123227099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	MYDZcGraKBXwXfmnEcjK4rKTMDa57mS+D6w93QmdBsdROMLuOY/QkDlu8s+y/f5ei/ckGeODgh7Mdmp6fBsxSCflwcfOJcRF/5nHHY5+FT+xqBAVqZzMd+Py5UQyLLstlw1LIrSNoqyEb6BZU9gn9IPm1tX5MxI433Hw3v+vKvn6XcRHzAcNHe18YXDPrJQlZUyAIfZjoCL3M4/CuivuxQYopgvDZwGlS3T5+5ce1199QOIvHzWuKREHk1s/CtJAiuWdH/icjyjus8/mYYGgs+z6rybr+VHLD/j/52jVkp5fG5+9Wa5Q0iePGQBZ1qGjkD927pjX7yLFsUd7hnhCIPhNfIO0XhECsl86hT9n8zt5At1tyOjxwBODpNVnCnL3/oluRu8bUU/kpYgt1zXvFbhBdK09GMnDmszWqgB7op4e4XEpfzg1k9M6fSes4kxjvgm9oVQZx4pR/KrU/ADkLt37TcBvj/gzM43TDAOHYz+1urSuUSmEWd0z8BsZlBsNcyM4aYsc8DSKs1DBMEuP7WrPddTo48aL0cGQXkw8L16a9D5EqUoVEOmx9EF8GvrtN/T1neAfQgdIuUm8gI/WzLhi7NRxlyhCcGGS8oDru2ZyD7fFjMGEP5wKjZNsu+YA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261102123227099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gWG8i8sb1vsbO+LNjjtMb65XPvqU4+Uepvi/gu0w/YghvcPWSIhsbZ+qhD/n?=
 =?us-ascii?Q?Lb1G+aYKQzP69GrSgw10jfv1PB8jFClQMpipC2ulkCVlQwVT5v3ECfg5B3P2?=
 =?us-ascii?Q?kU+5VpGInIdyPjUq2itxhCtkgQ7HQYuFoqg+DI/80KR2eUMu1goVSDjybj0L?=
 =?us-ascii?Q?CeTKAXDYTCJhzI8BQa2Q8NnlKp4eocvao5Y5EhFg0xxw8EXrKw9CHwS2WoDt?=
 =?us-ascii?Q?JrKHozSoy0XfsQmP2tRlV/CEt+isiMczMJsL57BY4vt2h2WuBs3Yc1l7bG05?=
 =?us-ascii?Q?4dJClebU2w5w+CUVFzzjAD+vw4O8GXXAMW39EWyBbesdZjJ8tUJFymSYSNke?=
 =?us-ascii?Q?BjiaBEbCqgLqqDOKqALPxnbFwuz7oEYVa1nM6TKSuDWUvpK/16OhlQRiVZVR?=
 =?us-ascii?Q?CXJ44csdfr55J1dPDnjVxIPmwNlr0QsoGU1ktzkSYZYxSnIgcVV7ekwk0PqD?=
 =?us-ascii?Q?rRx30lCHdwN0OAeglGTo8MRYZ1wU0Zft0nXy2E0n5iGRA2Ia73Ax2Q7wW3Cs?=
 =?us-ascii?Q?uHn6UoENDiLxVbulIgGMe0fP94h2L9+ljU1vv5jCx/ZWZhUaCgC8/PFOFqEs?=
 =?us-ascii?Q?ZzTTesyB8n0WENzzgBjdBKTTXSmMjSA7XRwpXTfSGM4xak1GFGNrVxEIjTjN?=
 =?us-ascii?Q?C0orBJ8Ev8B/cWBXkVAgjHfBKA2vIaF60Zt+SF+vwgBXR9/dhAeoEifXpSRU?=
 =?us-ascii?Q?N1h/6cZ0dmQZuwuK0xv6fdt+98ZXyaNc+4KK2iqImnPaPuDD9cZdPHoap2H9?=
 =?us-ascii?Q?x1Qim9jUaGEv6M/RSOdOr+S2eDIKknlaI51sgmmfelcFaxHY6LAkE72z68kZ?=
 =?us-ascii?Q?q9VtrEml9WKX9xpw02Zr83RBzzEWfpRZJISwizmeSiNraMJ0Dd0Vp2R/VOXP?=
 =?us-ascii?Q?OLWB6UpZpt/myrd1e+A4A0PmnBoMh3N+fZ3BCgf5pA4q5oP5gZiqqUniy/cz?=
 =?us-ascii?Q?Lpk7iXdNHeM+aPJdLaBbOMOXaecMfMIIuMq9UuaiEUpjHeUDFQt00ktpX+Vi?=
 =?us-ascii?Q?SuZQtS8II+Edg5gmY8vm++5MReteua2p2VZdHc/x6fuPdj0kQv1HGcY/Wsql?=
 =?us-ascii?Q?+ucwYiw3hrnt7oMXa6LCUJNiIh9R8tKmBhtG2RG4t4eGkoJnBFaBA3q8AvFT?=
 =?us-ascii?Q?njxwzGGZQ6P8P8OGqN+Xn1Y9Mgv4Kk42i0aCBWYfdDpJviQfr+WmufmUoPnC?=
 =?us-ascii?Q?sRSOecQWr0kXiUZ6sW2nQooqy/05Nvi7bEL2DExR40pt0xEaDoXizb5JnlPg?=
 =?us-ascii?Q?Lwbh/FCB6YHu+yrHhCEZAKL18YjWHoHbRZOmQxBL2LrbcVJvV7qvONKyISXx?=
 =?us-ascii?Q?fxpn5mlJp8dRZ28d3qe3twBgEFe/RkwONSt6Zl3fufuwtjCAgBfLV7T+jIgj?=
 =?us-ascii?Q?WyTW1Ku/thBJ+kEShlTpqOBCGit4DrEHsQpAT7bixt2xxZYjmh68mtXD+Ubd?=
 =?us-ascii?Q?voVtSX8Z/11vNfJqpaULAGfdykDq5c+kwYUowayvEwnMjkYX8lBweA75y3Ti?=
 =?us-ascii?Q?E9AguIKkPlr7sVzqQSpfywPpFSsOPSIADNGrhlSY8Tsj3fTYGbf/3on3aYFr?=
 =?us-ascii?Q?N1p5qgPpMelhfdpLQQ8i4y+TcOr7iXI9IE2bngtdNyoh3zAT1WtLudgAIwFU?=
 =?us-ascii?Q?s3QPEXecuCnrtrYsde6Qa6gMVCf8gfLf2M/xO6WpzE0qvQT2kkndQCP5wdvr?=
 =?us-ascii?Q?s3BUfesHxKP9b7op4oJkP9ci37mQi+gY9G7u6Xh3dgf96LrCuHSWhyqGZ1ij?=
 =?us-ascii?Q?CuAlydb3k2MPnNTd55/nh9HYxc7s/INXEs0mA9fC+bYbwrynSaTC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2298d6e5-ffb0-4b7b-2e3c-08df3b07d5c6
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 06:41:34.9120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUD1oowliaMijbl6krj2CJ7gbqnVYZgReAp6+uHj7wVjDZH43IcjelutQdAnoOJI6nwDkmbG+ZMiUlbVMuIMuYWc8dzr5YN4dYSBQiuvAVDNQAaT+l1T+x1V9ph0UUQv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8026

From: Chancel Liu <chancel.liu@nxp.com>

The NXP AUD-IO slot represents a physically present I/O connector on
the base board. It acts as a nexus that exposes a constrained set of
I/O resources, such as GPIOs, clocks and interrupts, through fixed
electrical wiring. All actual hardware providers reside on the base
board. The connector node only defines index-based mappings to those
providers.

This connector type is present on i.MX95 19x19 EVK and i.MX952 EVK,
where it is used to attach the IMX-AUD-IO audio expansion card[1]. The
same add-on board can be reused across different base boards that carry
this connector.

[1]https://www.nxp.com/part/IMX-AUD-IO

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../bindings/connector/fsl,aud-io-slot.yaml   | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml

diff --git a/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
new file mode 100644
index 000000000000..6e1e3f1b6a33
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/base.yaml#
+
+title: NXP AUD-IO Slot
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+  - Chancel Liu <chancel.liu@nxp.com>
+
+description:
+  The NXP AUD-IO slot represents a physically present I/O connector on
+  the base board. It acts as a nexus that exposes a constrained set of
+  I/O resources, such as GPIOs, clocks and interrupts, through fixed
+  electrical wiring. All actual hardware providers reside on the base
+  board. The connector node only defines index-based mappings to those
+  providers. This connector type is present on i.MX95 19x19 EVK and
+  i.MX952 EVK, where it is used to attach the IMX-AUD-IO expansion card.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx952-evk-aud-io
+          - const: fsl,imx95-19x19-evk-aud-io
+      - const: fsl,imx95-19x19-evk-aud-io
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-map:
+    minItems: 1
+    maxItems: 3
+
+  gpio-map-mask:
+    items:
+      - const: 0xffffffff
+      - const: 0x0
+
+  gpio-map-pass-thru:
+    items:
+      - const: 0x0
+      - const: 0xffffffff
+
+  '#clock-cells':
+    const: 1
+
+  clock-map:
+    minItems: 1
+    maxItems: 2
+
+  '#address-cells':
+    const: 0
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupt-map:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-map-mask:
+    items:
+      - const: 0xffffffff
+      - const: 0x0
+
+required:
+  - compatible
+  - '#gpio-cells'
+  - gpio-map
+  - gpio-map-mask
+  - gpio-map-pass-thru
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    connector {
+        compatible = "fsl,imx95-19x19-evk-aud-io";
+        #gpio-cells = <2>;
+        gpio-map = <0 0 &gpio1 8 GPIO_ACTIVE_LOW>;
+        gpio-map-mask = <0xffffffff 0x0>;
+        gpio-map-pass-thru = <0x0 0xffffffff>;
+        #clock-cells = <1>;
+        clock-map = <0 &clk 1>;
+        #address-cells = <0>;
+        #interrupt-cells = <2>;
+        interrupt-map-mask = <0xffffffff 0x0>;
+        interrupt-map = <0 0 &gpio2 27 IRQ_TYPE_LEVEL_LOW>;
+    };
-- 
2.50.1

