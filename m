Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCF747F79B;
	Tue,  1 Sep 2026 22:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301573; cv=fail; b=PdGr7aM6lLIq9TzkyxECYMKS4mRoDIGuyZZDyo6csdE4qGbo+JrpaUwtVNrb7P2KHAWMG4m6eOsv40T3PNI/O5T6obp7CtJ6Ex0GQUehfA6IvmSOknsbC/b8nJhiHL+6EJDubovazwGBMNZ3U+nkcY/52o0DDxTPYXZEGDmu5jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301573; c=relaxed/simple;
	bh=k0G0J6OrHLKdYF1W2MaCnYkyk+R3zh8nx7mzE9ioCy0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=A17EBhowFnY5F20cuZRAC1mmHFyhBhoI7TW6S526Vim+194FR7TqOvTn/Li3FnNOfhD31o73h+fDIql4hRQkoNeBpza88ONz+JZvp/C4auA4Fer6K5YH1KCNnz1zkKC0r94Cf8teoCbTsKQHsavMZZOzUswaBBnaDVeT5B7Vz+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Mdnepi2i; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Mdnepi2i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuxhNRjcCL6kvUGKq5pkyzz+rTVSo5M8U4MnsuCq2t7fuQK7jaU9x/F2X9PXorZBGOTyAx1mdnrk15lGLeegQDPJ+rxo1ZCfC8vQwuwuICdiF2GYqVpxXhi6xJzG7GNxPMN7kLf0C6wk9wLLOuB1LcZrin+liScAUqPD3hubtuR1uc2tLLvLDz1zBDXwAOTAddDIFG/ACMwTJ+7tiYcMS+rqVsa1KOkDmotu4uQTz8+6AlcX2yeTAFVkUCIht2jIj2hEAMXo8ADvqkcTZIwDt0c2e+GcbxglfY3P5DGDUh8CwE08YP38EoG+c79Rb++Q6w3PKPn+6HULlzgNDqAJjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7y0K4xRW8BrWnYDUD0wtiY+PXjc8S8mfG2f2Bl6ho3U=;
 b=wCoXZ74nQKoeO7d0KIDjC/w8hit0Y5dT4Qe4ywA9hWCdex6aKRALv4ZZSqIVbm5A1ezh6xwZMLlY+ZvX9ORCcyv5lcwPmy8tBtmA/s4vTD5oNP+Y1Qy8fypzqiKtLODSUiXVVkDrc5hlwpay63JkowIk7Af9WMX9cN8U1zwozexkX9mag9jny/fvypZhfzwlEbOJPWylI0PGKZfy3Y5zGEUUwynotF0a7+oqnljSQBSoA08pbCAsKT1c3MKfm66TLTMwu5/RkXo3NccCX9HCCr5ayK7Pa1MmupAiFd+bu+NSbzTF1nIDw8ueL7J9HSuuS9jmruA9rQn7nptpQDCOYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7y0K4xRW8BrWnYDUD0wtiY+PXjc8S8mfG2f2Bl6ho3U=;
 b=Mdnepi2iZkpUnkaFzAVySsk0WVw5huyCsgyVZkY0J9nIxiXqmX/SOowDv8TgfywkAJzU85G7+VqtNFrtBS4O2A2fYeFda29geqbiztYH0t7vcRgf5t06o0wO97C35jRb/P04PS+L9AKlFHvHfdo1r2wG8/6oOu4Ubh8ULUN/UsdZT+JNfxPtoPzpTI+JPX3/b2LLxR8AeV2XsNXLqthHLz0Y1EB3fcp2n2iILz7zbJWCJ/72Adqi6gk/gBmoqI+Fd5YbT045qlRJfY1O1WuRbylx82ploeL7Gi5yxCZCrdBsNl9yltqMPS2Gi6KuHAamoWiRgB/191xnMwrJwWRqSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MMZPR04MB319484.eurprd04.prod.outlook.com (2603:10a6:190:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:26:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:26:08 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 01 Sep 2026 18:25:37 -0400
Subject: [PATCH 3/8] ARM: dts: imx7d-nitrogen7: drop unsupported
 wakeup-gpios from tsc2004
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm_dts_clean1-v1-3-db741f37a1f4@nxp.com>
References: <20260901-arm_dts_clean1-v1-0-db741f37a1f4@nxp.com>
In-Reply-To: <20260901-arm_dts_clean1-v1-0-db741f37a1f4@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788301547; l=960;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Z4o62lzdbUGMoPOQAzjo/JNtj+p/JZ0+ST9BZ9VgySQ=;
 b=4WHodgSW5gSr2V4VstkDzxwelo7es6CBZ9Bh3m6Z1+/IXxa/SwVA7jvNAmmFEM3LOLoRqjP9X
 iP3FgXTsLheAZ8d3JglI8dE4xtw6iUrhnm9yMSgikabZWAgDHty0po9
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR21CA0007.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MMZPR04MB319484:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c0628af-030e-4bbe-0472-08df087804d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|7416014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	F4RhidgxteEJkBH50CsX52I+2Xue83gD/myPNYVseg0EvdPBjYXOdm7r/SI94Q0eWuhop5Z774AcOr2dHt1Idllni3X93uCWc55rDWlkYBVB1Ncrena+L3dmSx7wuP7rpb+3w/qdSNyl9GvJUTRecpNmd1kOPq6LOOKdkACAJXQVRn/z2WTLi3I3fHj6rxR+x0NpbPJ87Lv9oqVoDx3FyKuh8dsm4rffThIBvqHtBrWsosem6V5g6V0B2I+FrM7MgF9rSNDv86YgfgH6KwGfWjyuIH3M+h1OnHj84bg1+Qp6GDoXPmO9OuNxp0t/j5rK5KDueZRTv0ltNsjq2OTnsForNU2kKLWLOPdNbycMLw82a+OOg22+YH02ojYWnyE+pSKtoMb719JvC2Ckaint010I7JGt80XaIx6vsX0pje1tIiukEACj6N/BLtQtSvKw58lUQ9RmgWhfh6TLwe+ELQ/X25Ysv8hcZFguIlNfo7uanlOZvc41t9YA2SNKPb81zoIuVpQy+WT7BLLE4uzsmIS4NniGjZ61h+UO+3wgJbzb1W6pFwGHwpHCWxuhuJ+5rHEUuMa9I0v8nD6c7EggLob2bqDKQBOssYMy0REYOyR2YH+Vrh82X6zefjalYufkWfpsTV9jL5u7iAKvJ7oeLGv/7BQSITBR5TrXi65g01Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0xwY3VseHVFQlIxQldMYXNlVHJlYURkU0NWK1RzTXNENkNrcWM3eTNrbnN6?=
 =?utf-8?B?c1psMnJuRldOOG1wK0ZoQ3oyd3IzbUp4emdNMmZLempDV0I4c1c3WUlMUnRJ?=
 =?utf-8?B?RXdXWFdBNEpIclRnYlpwZllrVTQ2UnBWQ24rbGV3NGI5dHRObVhhdzdDRUw5?=
 =?utf-8?B?TjFrb0xONlNpTXBoOW4vbjRJczY2RU9iVUJNbXphKzN1UFpIRDhSQ2tNV2RV?=
 =?utf-8?B?S01KQUhabXlwNXlrekl6Vmh3dVJTTTZRcE9CQ1NRdUxPWDNtL2M0SXZoN09X?=
 =?utf-8?B?V3d2M3QvQ1d3d1dKUDAyNjBXZUs1THNLMVhpWWFscWtFSFZqYXF0RVhMa0Q2?=
 =?utf-8?B?VWJIZWZQYTg2dzdiY1hsTXh6SGZ5V2lpU29iR21FVHJLTVNNeXd5U1Q1a09t?=
 =?utf-8?B?WWlWMmxCVXF4RVhwbk5OL3ArL2crb1kxTVpzS0lxMUdqL01LZENjZTUrK0p1?=
 =?utf-8?B?dWxuWFVRVDNOVjcwT2dMckJSeHNmdXowNjFySktCNk1VVmdGTjQzc3Zwb3VI?=
 =?utf-8?B?N3NjNDVVcXZqeUg3eGtsVWFuRXdhelVjRWF1a29CUkVxUWdwbGttOEl6UC9t?=
 =?utf-8?B?bHZObjJVSktVN2pvUjAvcmlkMnlNUDl2TXNsZXFYN1JmTnZES1ZsMnhwMjZx?=
 =?utf-8?B?ZGp0eVBGQWNia0hxLzM3bWRjcDZvNHhPYXI1S1FBU1R6ZUt1WS84MHdvZE82?=
 =?utf-8?B?ZVEwcExSNnZqeGRUVCsxNWtXMWRtbDYrNkxjcGxRUExhTjB3MjcxZ0p6czRy?=
 =?utf-8?B?YVErK0wydEN2aEpJYisvSzUyZFhKaGlUVkdLblZ0ZGxhQXBYR2lGWmdFUXg4?=
 =?utf-8?B?N0tuWnc1MzJOamNudzJVYmFNV0RvMlRIbjBiMDVJdE9Ibm1KZHlZd1lrNDha?=
 =?utf-8?B?cE1TdXp2QmZnK2ZKZU5GWEF0MHlJd1JVT1lLWFU0dmhWU001UlRsTWpaVmNj?=
 =?utf-8?B?VnY5R1BlRCsyS0RyTFNJZktCeFE3dlg5TDVvZlNsc3IvQk9lZmdFTjI3Lzlm?=
 =?utf-8?B?WWVmaFF0Q1pyck95OWc4NkJxUERhSVp2V2hvSWpHT1o0YWFpS0hWSFV6elJl?=
 =?utf-8?B?Nk1LUmRWU25nRURPSmFTWjhzcmQ3VVZFcXg1VUhhU1NibndJaE5INURlbUV6?=
 =?utf-8?B?MGx1amVab00xQlFOWHdaQlVsVGVhS0NWSGxPSHZFekpCRW54QUI4UW5SeE9h?=
 =?utf-8?B?SXdLcjhnQ29Tb1JnZ0NNc2tvMzFJaldQYmM2VFowWlRmU2oxSmVvV1orZGRN?=
 =?utf-8?B?WnJqMkJWR0oza1N2K3BRNHFCRlJHTE0yQkNrTERBZXJlMGE1VFRrbmY5V0VE?=
 =?utf-8?B?eU11cEZvekZid2pIbTdOS2Vxc05pSGFGNjdpOTJFd2V4eGc0TXgrOGdiSVJB?=
 =?utf-8?B?clZHTGYyQks2NUFTUEFKVyszYStBQTdzWlRVMXU3L0pSdWN6VCtHS1owWllM?=
 =?utf-8?B?WisvL1lIN1VGNGhDcnQ1KzRueVY3THplTGJOd24rSWorTlB1UTdheHRFQzBI?=
 =?utf-8?B?MFpXOTBwdGRRbDk2R0dMemNLMmNqTnpzZk1yNDJoa0Z2T3c2QlAwZ1RzYmhB?=
 =?utf-8?B?WWhOdE9rVVEvbE9UQjd2VGsrR0V2OFBRNVJIUXRUTGY2eXNDWmJ2czBFcjlC?=
 =?utf-8?B?UVViejhYcnpsQ2pjejBkaTljN05uV0t4NW9MRFAwUFJIVjJSL1RjakNpMlFW?=
 =?utf-8?B?czBzRG1nS0h4UHZxSnJlclBkaEVkZHU0c042Qjl0VFVJeWRVUmJxalNOT0Rs?=
 =?utf-8?B?NzBNOTRaWjhndnl4K1d2NEloTkxzRk9BbndqZ0YxOG9vbzltT3JQekxrWjh2?=
 =?utf-8?B?SVc0ekVnSDZMb3lUVUFrei81N3lQTHVXeFdLdmFkSTNPWGo0L3FhUDNyVm91?=
 =?utf-8?B?YXFYWW0zTVFwdkZXVk5DSkNBWE8wM3cwS0lGaDQ3MjBsa1BjcDBXV1kwdU9Y?=
 =?utf-8?B?Uy8xRVo4RVNBd3BJSnF5RkhuazhpRmtUdFpCem5ldy96MW5rQjFoVEZpWkdp?=
 =?utf-8?B?VkRvQzRhdHZGU2oyb2ZNcVdhNVIxVlF4RFVHSFhRZmRmaitNeUt0YWJ5dHdy?=
 =?utf-8?B?Q3NPbmVTMzZZYmhrRmV1WkJVeWppRlhpVGhPRnd5NGw1aVpIU29Fb3dMcW1m?=
 =?utf-8?B?WEpXL0N0WXVudmV0VFVkb203QlpoZGgrd1NCQjQ3WlhmTkxMZUcxZEp3cFg5?=
 =?utf-8?B?NGpHbEZPYVNveVExRnJUSUhpMEJrN0ozeUFGaEx5VHNzTis1ajNOMGhCaTdD?=
 =?utf-8?B?dDVMNWRhTmlaU3B6dUZhbmpidC9NNkx1YkRjTGt2ZTU5dWZwbGJhc3l0STlv?=
 =?utf-8?B?L2hDaXBGL2tWVDN6STJaeDJMd1IvcnI3OE1FOVk3OEs2Ti9Gb3UvSkdTWGl1?=
 =?utf-8?Q?Hu8OKcl9ClQwY8LokiyBL1wUPoCCv/PB8rmLS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0628af-030e-4bbe-0472-08df087804d2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:26:08.1570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3gkKFCMy7CkCEySPsoaKmcr+y3Jz/rQTw4TK0k4W3m7dKYjtYALK9L+1qvB2ULWyUtUqLAQ4OzyasvgeKSFb78MXHAjXjB3XPRAQL+AoP/Ag1QUMSwanZT/u95lPPCA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB319484

From: Frank Li <Frank.Li@nxp.com>

Remove undocumented and used property wakeup-gpios, which is the same
as interrupts-extended.

Fix below check_dtbs warning:
  arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dtb: touchscreen@48 (ti,tsc2004): 'wakeup-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'

No known other user use wakeup-gpios.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts b/arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts
index 2192f105ec81c..c72859ac43e1a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts
@@ -284,7 +284,6 @@ touchscreen@48 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c3_tsc2004>;
 		interrupts-extended = <&gpio3 4 IRQ_TYPE_EDGE_FALLING>;
-		wakeup-gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
 	};
 };
 

-- 
2.43.0

