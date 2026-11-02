Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628224;
	b=PhFfj8GM07nyGNNUqOE3ChQ3y9IkF1Z5EnUdG7QaHm7sLcppei20yyEW0xij4ZyOtqcI
	 lH298h1/UX6l/HleBtcpX4TDqPr0w+3NGedbHbPxJrU3Wm3Cxp4OcVP1HLToHN/zNp0Wy
	 MpWTyiAmQp28gBJRcMjocAyiN026U2MRVwqq9zkj4OOX0pc0rNwtQIUtVBZD216gbG4hA
	 1KzXm+CoHSARW/O49W++qdxdedn+FY0Xe1TsmTqY3nynP4/fkW5OoPif0uuJglxXkzSdX
	 Ad+SBKggFGMx3cNV4RUb4W57uSWqtBedNaRgEDK/h3yAdx4xHX1hUhTRLC5tpKIkqfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628224;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=11etErCdYlYeb0zZZxXO7jsUaGHeDfDwRx2OU7c7OBk=;
	b=0suln3oVAU0bwZcPYOMKcLEK2eytdHggdHFOvfw69laliRrFD91Q26DCHSLOlEuTv6ow
	 xthtXS5PCyWdKzwcL+1+d7EbiVDimSPGq7tcJJ6c0XjZP9zx0pkfok17eqZokQJuSil/r
	 hOUJO6IApSzoEatHTfq1HKvXIsnFt0b3XJi33Om/xoIqoq860LiEBf8QhjpKzOVCFaSXr
	 0EY5v5KZ0Rdyj2/a6Uk66daUo1JNCTXJG+sJHT9Di8UwIq3ikP3pFYAz8BzxGnotvoE8Q
	 IxNnLFXAkMJr/cf4UpIjhByAqJofDnJk2PxchC7PG20tZt2kjEwQuSstGnpLuxaLEtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="Td/mEe1h";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.58
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F63606A333;
	Mon,  2 Nov 2026 14:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35F63606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Td/mEe1h
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bw0/VnVLuAPGvNsVtiOqOnvm33QcLLDev1+Q6y+zwY8cgGCrvhCX/mxeKADJg+ITZ0bg90+/sqlonDyy5nswbkorb8aiGn1OWSuvBb72HBubqWLdcvUnaCRkO76IL0pIlBXJzm6YCGwuTv/E7c3ZTozmu7xzqaOBCUcDsIWAjBFYv3IeEkFOhwJSyCKMJiRpuiSUHtcokjPiku+hwIjOycI263dEncSriqdGD3NtAJm4RnmPIQFNcPP5OGhbPUUpg0LdW9yroj8L7aR5XRohrXOHNrOsy0LFWWa+EXRyOsOEFmbjyM1/ZG2oHJq4B/hKr0Wco4K7zwJ+eNdSsnThBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11etErCdYlYeb0zZZxXO7jsUaGHeDfDwRx2OU7c7OBk=;
 b=XfCj6sgAd0TljgXa1Xt78Vd6TY0CUbwbkQkpS1gdWSpji/Kt28KQ6F8YwwCNbiHdP4QBKdw6/QaHrAx0U3EQyRQzCTmN471Yzk28vIVTf891j6D8us1HtDzvEmtWFFEw/02nEaF6fzEFunAHxcoespjQ/c+KYHbvk0N7qZlO9BhVbP8IAKFeApSt8eYsAP+M2cGJQnARGY79j3M2JRp/DL2L9FFtVJonJqWCgRuG8Nisqv+FgpYHJn3zI5dV5rBbc0Lz98XL3/JwE4E8SD7HO+Soy08ICvS85yX2Z+8QFu0lh4ecTWQhe8IYu+G8z5EODZc+O2ZBptIEo8rWSU9Izg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11etErCdYlYeb0zZZxXO7jsUaGHeDfDwRx2OU7c7OBk=;
 b=Td/mEe1hKZnsh24Ijzhz/NV78e4XIz0kIny+d/9dDa4SGEsZVRCsPWa9te+HOANT9O8LwZMXGWbUhZl+UcuewPIw+oV1d4VwavxpgLpB2V+pJ95/lDXCtkrB9WC5Mp76jVcj4ZTvWjxiDwg1jTx7rtwCTmpXJQjgBMOuZ5aaPwdqf+ck+16msQV/aWYKV5PpSkkVnmFxZhAUXXhjSyc5NW1+jc9WGtyy3LlhEdDn5OXFMJYLCzv1BXxYxdnFys7DGIcHGmTZg8SCXMVcEBkd5LF8bd1kjXXxw3MXn1/ME70OLzpDnV6y6Z7iyRfkygMFN/ugjDy3vgxWKW6MuBByUA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by AMVPR04MB12628.eurprd04.prod.outlook.com
 (2603:10a6:20b:773::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:03:41 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:03:40 +0000
From: marouene.boubakri@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Subject: [PATCH 1/8] dt-bindings: vendor-prefixes: add OpenHW Group
Date: Mon,  2 Nov 2026 15:17:20 +0100
Message-Id: <20261102141727.640769-2-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:510:23c::11) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
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
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|AMVPR04MB12628:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a3efd0-6954-4417-702e-08df38ea1935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|19092799006|22082099003|18002099003|56012099006|261009223027099003|261022105027099003|261021121427099003|11063799006|10067099003|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	V2+1kg/TPYah5o4lNi4c4YHDU1FAETbPHVQqJbBWMKL95+iT8RzCi9joYYYHy8YiZhJoAMCgJDhLDbbOtNpbDrgOf4hrghibbnIGhOPtP/9g1cssQQ4aXA0HT9stL0BkpI+kWIyE2bYV0cmEyMq/tK69RZFT2qrhI0MDNvQmiOzGxvotNKprluM+eb4FDf1LN7tumgfa2C+uw7AfRrPLJb312PhKUN2cHiazBAgNW0ZLHbiT+cfKMMvmkz6XzHn4uaJIKBCK2SBe8ML8c2xbv3lIsbjVwUq9XImJcR2KZoOt6vggaG+EBnwm9Nw7J1CboiLXTU8NhTDoCGKhJp/htMyLpvVE9ogmG0liBzhM0DbqA42bBTxiibvkWx0lujtXO8Ujh6oOOhI2C3iyvsTPKtO2idRh7tVIESxIG3jkzK9Rc6dFwza39YYP5AcaPWWU1AxdsltcRGTB8XzQ0TZYRXurikxMNMNY/+9yGJcg4FP+F3Od0uSkIkBfXNYZdMqnSekJxWQCx31CtYEMRx168hiJNFvwFMdpBl2ZNseWrbqKXqZqdv3BMDU75UKYR1WvMjqoEbz/P0DBh4uCBY6cIpu86oaubEJfAS3kIherfTg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(19092799006)(22082099003)(18002099003)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(11063799006)(10067099003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I8XdYfSdlkFrkVtuDovzGyJL1zuH5sx9UasbCVgYAu9QDnOQJaUTht8ED/Mv?=
 =?us-ascii?Q?BSkgaBvyeVvVe/cYpt1t4mNmrpnn7Tr+sFRJbwExcw//Ux2I7uZykWiBIFF1?=
 =?us-ascii?Q?7Wh7Zkdj8q0g2SFpZssuTKLOIUIQ+6WmQb6ayThMzsvmOWPdEpf4Uj/96cch?=
 =?us-ascii?Q?H3sOxxQEPZBgCsWH9ZZ8WmC+6qbkpdQk/L4+p5zGLqGtN8FZG6vARsuzTLz0?=
 =?us-ascii?Q?pVu91KhCIkoynZuoXaPsg6pzXFuxT+T83Sxk5Kq2GCGE6HkkemwHGqEAeFV3?=
 =?us-ascii?Q?CUh5YZzpCAaM5IXDnoIQAuBSI5NR4BPvjk+l9NbbmeF0R0NMrpi8bLzkgPGL?=
 =?us-ascii?Q?EcPI0qY6fgn4wbB/4VbmzTazInoxWyPXYw8BVxidX+r5zJi/FyZ5yCZbsPZE?=
 =?us-ascii?Q?sMznvGTXsbhvVEhdLOsYjyYvSfojoGw/UXJjLgR4CSWfXNRi2YWy0JOVwwfQ?=
 =?us-ascii?Q?HHlCck5iccjJaL2ItmDwaDHLjx/GElGiLGmDErM8ceMcLWI/bIU5rZFqIUi8?=
 =?us-ascii?Q?sBjWIS+LaKCKCsNhjx1VhMtKrNm+ILarZS/tG2fuONu0e0SS0ZX7cqaYuYuG?=
 =?us-ascii?Q?cGOZO0Jg2XkjmdIYTRGA7KchN8NJs8JOvnWCvHPoNsoIFsMZzxfPjBVHq6hY?=
 =?us-ascii?Q?ScWILVVFKmKKn7//+wAfTKLCzzZxd6sYC9ZJVl+oJnDAtvXekcJibO0Hs/AH?=
 =?us-ascii?Q?ApZErUdFXuDjQYBveJ1cNjis/cYiU8xKFfEUYpECB6MlpvJC5fSH+nAprwqL?=
 =?us-ascii?Q?ybexP/tWBSXf/DDXWYfmI5WLPQ5p6ux23wqPGGQxrm39qtgQatVvRyT5kGJi?=
 =?us-ascii?Q?eD/9ueGV7LICRQxqN1z1Y9eIpoVEmdpUhPNLHj42iuk4OivSCrs2VrLSB7fw?=
 =?us-ascii?Q?ZvWnbSDP7piIthynDdzu6BUszhkMikwtFqBfUpD2hNQw/Vils9qew+evdJcS?=
 =?us-ascii?Q?apILnHlzBuiaOBiLeja7gc+goKPlCSM39gTLr8Wx5T6h6MszZbNSr7KRmDen?=
 =?us-ascii?Q?bw/+w7AYsLwrpC45JJEoRitQrHMniwn9CnTlbegcjjSswo8xFifTwep23pzf?=
 =?us-ascii?Q?sUM7B8xrSAgR1OWsFHLaFy8cpyy9z0OJplA5N9LXrl9NcHuGRrBm2dTCA3jE?=
 =?us-ascii?Q?/ii3DxraRJvisXSQ9nHudZ/U6eCYvhD+fvqOduYUuBIjWXkPOMhMeA4BxVbW?=
 =?us-ascii?Q?QBK65mlRlEJwYQmUxYxYd1Kl3BBal8Zdad7+04hoB+Hc5MjyOW8ferFOYHrq?=
 =?us-ascii?Q?snmwyTVstzQB3KgmgGaIuuT+5BN4sToJCY5z01YSyTwTb+vPcFhp+ye0TNau?=
 =?us-ascii?Q?VfJymHwOfA8h3oD9Rw7WvicphM2nN/s9rvau731G8OIIuUCl5QJTW8N2kaG2?=
 =?us-ascii?Q?pKEfJcjTxfZghtEWVwKStmCtAYdChKVG7iJPIHTwqNTQ4Q90m74bdy10pU4Y?=
 =?us-ascii?Q?xRXOYFeBjhKAQruUrCrv7s0Zjtw6v3VjTtaot5+BoFE4xMOB0RZaeblT93yF?=
 =?us-ascii?Q?lb7oLYd+cFJxJGJFBcjuveaozVew9svg76lmD4fbmhp1fGyt7c+AZH96dU+B?=
 =?us-ascii?Q?AnQf/9iUOPFlxdwdnarTEWXUzfzFbNiGcWBsObuoe2LBr9/pVcBlncYRYXSS?=
 =?us-ascii?Q?Al1E/qxcqIZd1hIdo66dc+feTtp9AIPwXaorD0ERdHG+CdIIRHm0ur1Ug3vo?=
 =?us-ascii?Q?ENQ9mYrjOOlIaz2cDya0k9mGdG4QXp8o4Pjg7cfBUMPUvY7s3JzLHHLFTxit?=
 =?us-ascii?Q?rjoDh2jCXKIaDsu1gGQckYE69FXsnCqIjBY9QLnIC6h+GtOHrYzG96G6WaeJ?=
X-MS-Exchange-AntiSpam-MessageData-1: HbvDrtft/M1mUw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a3efd0-6954-4417-702e-08df38ea1935
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:03:40.8029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RR1OZaFma/lIWXz3SYSIDnmGTVvA2L4LZ/mAqhLwfevwjjv4t2efvAJtol/qejNZloBbyjgTmEgef5Rzgnbl1dyEddiKE4pOCnsI3G+r387nB/gV145E2CK0NHjV1KSC6RswE16x2XbnZ6wTq5o9ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR04MB12628

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

The OpenHW Group (https://www.openhwgroup.org) maintains the CORE-V
family of open source RISC-V cores, including the CVA6 application
class core and the CVA6 APU FPGA platform built around it.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693..82440d498d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1263,6 +1263,8 @@ patternProperties:
     description: OpenCores.org
   "^openembed,.*":
     description: OpenEmbed
+  "^openhwgroup,.*":
+    description: OpenHW Group
   "^openpandora,.*":
     description: OpenPandora GmbH
   "^openrisc,.*":
-- 
2.43.0

