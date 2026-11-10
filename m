Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794280485;
	b=Wzd+Xfjv6x55Gsju+D5KyJpuKz1SXBeYr+xZWmUbWtstnpwpHN4MuslxqR0eO8Ok3bwK
	 YAg53WD1T1pXM2iluQavDvO6NUDGg5oYZ7VJnFjIKxwIhPyKy480QFtUDJBPutnVeT7EY
	 RcygbfeCbFs7K6IAI/hnl5xBVwO1dgt45kYEKBEYax8erZl/q7ZXbb10sb0tWpzrVGPuv
	 PZicojpLAFTFgwbnxwIORrnV0qnP2rCPKwMENW6SEV7mc/z44yJQtpTa+2DHxazFGf0TD
	 BIQ90oglL82dU0Exp7WC+wI3MU16Ne2W+QnGIZcg+3clp3tzPpv93p6+dDTB2xKdeoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280485;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=CKSI1/pddaGfUZ3avyvSUHc8WYpwpcTdPU6X+fFDHWY=;
	b=I3m2GoSyZtNBk5+KWoiNj4mfeI6Fuxf+TIT/H5/kSUzFYACGNNT5CrSMcb5Mc7MLI1cT
	 6DFxW5OH7MjlQPCLQ0IGhVmBqI5amJxUCU2C55SBQ4YakZ5DjAkX96xP0X4/wjQ4pe6X5
	 1x4f019HMPyGkKpt7RxCjgvazSVTVkRJbDZsqTBA0KBXaFAx6bq2n/oBFPkQiC0r1upKR
	 JX1nY1HdWZnyBXIXWz7sn0RRclV17I8fOHrORzTuo66N6434kiR9V8JC7HyqwqOYnZx08
	 WZGxlNL96aZrgyrSiHEi6TRXoLqh+/jPFTbbhw837KQQ0dknmIu1hSR5T8zCBotwL/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="u/4QQyQE";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.4
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A90606A32E;
	Tue, 10 Nov 2026 03:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A90606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=u/4QQyQE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+LQnuBPl/giE8MaQQd1khPzOdQ0VKjE3UeoI/fO/m12ctIf1E3LCulc+Z6pa6idn6bxAPwosVuAuDkuth6lrBF1BWNOeZARpC+Y02kAcBQtwijyAQZVNDYijDLjCmK/ZvVnQ8oUwYHKwX13rvQT5gbw904zTrJXk/77JAf6ZYIPOJbGrOMTuTPMwpHXA8Bo5Z07M3a3RBiyN0fROLgt2+/blY2p5sqhLCFu9tIm+7r7L68NshLflIewPQWnwwGoKfjyV2F/h/kVh9P8rXf8q80MrqdOMwhrUUbu/D1qyKOqoQj2D1G4fIer1hwLFobVvLlbJkF0P9FW4f8UgpBBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKSI1/pddaGfUZ3avyvSUHc8WYpwpcTdPU6X+fFDHWY=;
 b=hiLaAQws0jJCOS8fDwE55HXBnbepvarmpd3cJLmr4X9MdC5oy0ifSC1fiOyjeCSCSZ835swIk4L0tqoiTgANDZ7noc5fNLdU4eBDxBcPWiz0Y0QH9isrNa9ca49P3qkdB2K4DnfKStBuOdjod3RX67FDTCn1aU6IR7zA1BCUbDhC193ehQogKjoUvaXOOivv9QN8L7CEf3DtDX7RkZfNVWpYAV0Ki60iWulKf+GeSWaOLQhuRg39j2yOBdLuy5kodnlb/6/k0aq+8yd4sFzY6v/3H1gOda4npGOg2YRCi1OnbCWbGKUjOpY+F/eUljtF7IH+e7pVNiYUdeE1/ZSH3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKSI1/pddaGfUZ3avyvSUHc8WYpwpcTdPU6X+fFDHWY=;
 b=u/4QQyQEkBO5FSzw6G9JlHcBKOvb6C83DBsWOscVpJ0jkkLX+35Bbqw7M5c5epCjjs0o3SnNBaZpADrwl/NLtGHql2wVf/JnG5+8AGMRW5TlPYV6oZYHi+3F84i0hDC8mmNRBuyJ3GGOf/XXn6FWQpC1mglQF2umNE5winf05lGLAHw+Fz1/kd39LtHu8c5p1spvASX1wnJtll6xiuCGAjd9vPmVBJ+vFPWnRIgaQa3cVb12S+3Rs/wsCbX6VnT1Uv63/at+gSpMl+E+0o5gCiELrH1Zui83NLRpkbtqBp32A8ztQOm5vscByIxAi4D/AkIHpA1S6zePt6RPrPvaJw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by DU0PR04MB9227.eurprd04.prod.outlook.com (2603:10a6:10:352::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 03:14:42 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 03:14:42 +0000
From: wei.fang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: wei.fang@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: imx94: add NETC switch node
Date: Tue, 10 Nov 2026 11:19:17 +0800
Message-Id: <20261110031918.89948-1-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|DU0PR04MB9227:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b44cf9-4f20-4ca0-4d55-08df3ed8c323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|23010399003|376014|18002099003|10067099003|11063799006|261009223027099003|261026121527099003|261102123227099003|56012099006|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	axm27P5SPkgwXO+co/6Ut0uZ6PcjOxEqROcMLO4EGkq+iwSVBpCmRTNbeOwDCg3Vi7P7o9pVEqOyCJ8oPv6LoQifwv1srZYQlMMFzyDTQoiSKiLnFB99fxm4QErFuBGID/8XGWEbY/zXPkx4SfiAFDPMDJY+3v2MNJOifFDNY7VoZxY4VPHJY1enMzpPpsF1+R5JEdzXF3OIBunEAuex5bo4PfxZ/h4wgxiWbYY3d65qUY2N+YyJpwfipV7Qo3xH2oiTQ2mEIa17MKfzx6zISGQAtAcFU7neFDfeWSxWCi2eudwPK9x8s8D5OOwXl6pVwTGrirxcEADnRrbETJGKpzVvD917CFLACMgx5VQfCC3WFV4I5ps8gnIsyLGXY7i4HNcH+pj9jMzF9tVSaHpcrVeL935OohvrJ422IwoTzLdSt61eVQGsh7oiGtp7a/Wk+pVkyHTMq6zLh/M/GyDEC4w24g6Scof4phj7cezMVaD3RxxBlG8ypqq1rUzIcfIZUydGjMKC0E/C1vNniWsgiUFuvg9jGEzzFdehHdjwPqZkqaOtgfBOaUA/YFCeeIsWotXw5cLKhbIHhGQL5B7vB5LK8cBhMOuQifmJR4YFWQp/CJ20EVizLMNnSmEpLZbz0dG+N0bWTO1ogWAlPcNyj6Go4JORcqhbuaCxytCZ4dk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(23010399003)(376014)(18002099003)(10067099003)(11063799006)(261009223027099003)(261026121527099003)(261102123227099003)(56012099006)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BEszXpjeDQp5FUYGNjBNx5otGDAYFYJvvImn4qYbcNubhwsA3W6fNtLRDEhN?=
 =?us-ascii?Q?IT7RRW6CY+Yjei4dlNjk632taltC95GAMpf9oZbyQvleDbMGfQIUV8FNT6xa?=
 =?us-ascii?Q?1s3wc74wMXM7vcnb9I6CrPQ35FLIS79wTbCeuOeu3NmTm6ySYuGlk/WhfaO5?=
 =?us-ascii?Q?pPkez9ygpMxDsBTfk+TlyMZw4smdZh+nE0duj+qu0jXxfsVH6XvlKR/fT4+a?=
 =?us-ascii?Q?6A1P7JypXd/JdxT1b0DpcVjPl5MfSJHPBz4kYiV1cOt9bzr7urOJ9SpLQLHl?=
 =?us-ascii?Q?IrS42J+No6ue/Rm7kPmA230nYp5GUUq9SMog7DnBZZRCslGc6S6EaNqx1IqH?=
 =?us-ascii?Q?tmqdGfNix5Cu5fCtzMzJAd22B3HX1RIcMvfIJiZ4q8M0iEF+1yebyHnPeqql?=
 =?us-ascii?Q?7YuqpQ5NntkGNPcN0LXjqwKtgkTJ1ULlEi69A/hlT+Q2T2qGuM2FIktY1plK?=
 =?us-ascii?Q?gev7X1K1bxTcnI1eYPmheBRxXncENDXjgrXmgShRr6bUBFQWdwKhcOINtPMG?=
 =?us-ascii?Q?TArruOKEmW1gInIh1FXXVuso/QvAwnEXyYCaXn5jsd8TswBkARqmXwqdYGGM?=
 =?us-ascii?Q?mrGMlpxnEPnZBI7CpyYN4YKq71Y72M8P9IE6X+dwR0vc4L//ah7hZS8AbN4v?=
 =?us-ascii?Q?cezS8SBjNAtKsIZpKYHjBjfLz+bkPYNG2vlfKtGpdm9Th1R428ulenT/+Qfr?=
 =?us-ascii?Q?JBNMvVTS/ooeMN6egzGHVchgdjjv/8JPmACRnRyQ6MWsCdXLvYU/J422HV4k?=
 =?us-ascii?Q?aXaWXfea8WLe4/kIjG5RhVDk6F7IjoVRKRr2k2R6wMzrnhGUJxO2B7DBfkWb?=
 =?us-ascii?Q?DA49fLNQ7itG/wTr2jX3ilyFmTsP4ayTbUWpO7tnsVq2G/94n7ejbbGulmlB?=
 =?us-ascii?Q?3lU8D6YDJonqyF1B7iguY2MQp8T+8PPjK697xM4mtQfpCD88MBe7J/krYqJd?=
 =?us-ascii?Q?glRi0X4z+hvR3/qbj6mwFr2ig09G6wMisxgE1jujhm2Hzqrgngso1Gpr93u2?=
 =?us-ascii?Q?0Yj3d7EAFwtJ5bAfAim4PDW2OlX08MI/Xsf/ajYDu5Eh2ekIG697957kYy7O?=
 =?us-ascii?Q?GObwJaW80qlgY5iva6R1Kj89sGLo259SoAsHKpnfHfAdQ1HNmSMfXK1WJR1T?=
 =?us-ascii?Q?oqCJ5QfupMN/K03JGwfkiNEkq3RKZWOB/r3kIAR4jH8+cquTChlTPC5SfpgQ?=
 =?us-ascii?Q?QCf/ImH4IDFmCdplTZpURuVl0ZaeV8l0TWoOUAkH8LVtvGf88RDGYb4A9htt?=
 =?us-ascii?Q?pZxidlYKBFMCgKDRpM0dwHn5fTQKXZJY2l0MLOiDfbCOsR2xWMUJOtQUco7p?=
 =?us-ascii?Q?LpEcDaNdFmfp4ETVVj64+OBb8eYCJchkPXxyH/N3HvWi0cmB0juwiiaaCUkM?=
 =?us-ascii?Q?IQ8U+gYih0eCsqVg6BPOVEPvqWwFFMD0eF8HuUog0tgGSRUahcwEql6AKhIc?=
 =?us-ascii?Q?3LTFZk3QWYVI+O4MWfVlTXJTDkPpyRipYSxiLiZHZOn8bVQnRyaA9T8GJbCC?=
 =?us-ascii?Q?Wr479keQLPoQ4chK6m0tYiPuX8+MIaafDrHPrg3PVXABge3ufSvsKGKNsa3V?=
 =?us-ascii?Q?KR4gtHo+3CxA/NI7DkeZsLhRU06enJfEtIJC814Cu0S6tF7IqhLtlCQ2zvs5?=
 =?us-ascii?Q?6QXtuOYC4b6dlugSB74vaAGmWvGq0ncgwQ9MvcNWKtTbxndkDOOSLd8A4J1x?=
 =?us-ascii?Q?HgFOi95rCX85lUA9Lj9lDdlJrV2426acdat2jjVPI6sm3mRHi4pTN/QAzZSZ?=
 =?us-ascii?Q?2zvUM+nvI1CqvhwpNjYxG8rOc2YHtx1sGS6o+2i1M6d3p0twF5uN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b44cf9-4f20-4ca0-4d55-08df3ed8c323
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 03:14:42.0938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: veO6syn8ijtlzU1rXbeHqi9gzpSMLwgZhVgOGLAO9W41NnOpvwRA5y9eHeZeZUNmxbApTG1ld8J9O9nW9qfa5d7aZ7PCHOzbv08+QTUIR+9zyFusVqhBu9viFuB8JsnX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9227

From: Wei Fang <wei.fang@nxp.com>

The NETC switch of i.MX94 has three user ports and one CPU port. The CPU
port connects to an internal ENETC (enetc3) through the pseudo link. The
"dsa,member" property is used to specify the switch index, which is
reflected in the switch tag as an indication of the switch ID where the
frame originated.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 020aa1da3315..952dad5aa656 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1521,6 +1521,47 @@ netc_timer0: ptp-timer@0,1 {
 					status = "disabled";
 				};
 
+				netc_switch: ethernet-switch@0,2 {
+					compatible = "pci1131,eef2";
+					reg = <0x200 0 0 0 0>;
+					dsa,member = <0 1>;
+					status = "disabled";
+
+					netc_switch_ports: ethernet-ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						netc_switch_port0: ethernet-port@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						netc_switch_port1: ethernet-port@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+
+						netc_switch_port2: ethernet-port@2 {
+							reg = <2>;
+							status = "disabled";
+						};
+
+						/* CPU port, a.k.a switch management port */
+						netc_switch_port3: ethernet-port@3 {
+							reg = <3>;
+							ethernet = <&enetc3>;
+							phy-mode = "internal";
+							status = "disabled";
+
+							fixed-link {
+								speed = <2500>;
+								full-duplex;
+								pause;
+							};
+						};
+					};
+				};
+
 				rcec@1,0 {
 					reg = <0x800 0 0 0 0>;
 					interrupts = <1>;
-- 
2.34.1

