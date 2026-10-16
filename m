Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725BD3E63B2;
	Fri, 16 Oct 2026 20:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181549; cv=fail; b=qEr9pxmmVNyEGGZMPa9sZKXnTo7MWDAY//LA7g2Jm+ZgIxXWH2ODSvr6mMURun+gP8gb1eOnNlq2YE6/sYmm6ZpgDcfLvsmiIDd5a6hJEK+L6jYy06KYfr5MPtAWgHuPx3t6VTVJzI/bZBcA55KjDHL9nunTQpT3ZOPOzzk1zBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181549; c=relaxed/simple;
	bh=EABhWoLcjV2LseBuri61iZlgIhglpfDJiBFSX6EEOQc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rCgVuVx74JMjmHe1vf+LBISmbzc0Tk7R/EzBHfM6lFajEoyUpQytgx/QWJgRjvgHIq5uaOjCgt5zypGNQRaA9TR9KpHpauOrLLkRr/IZJ3/pl2pqC7QYwJSQqQi9giubV33/QJz0fGtP1tUDRMHgIdvOEmXtUFYnITp/ysKhWaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Dq9H8acx; arc=fail smtp.client-ip=52.101.72.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Dq9H8acx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKrmDI1llY6BUERfIoRyMURriX1RJ4ZSwQSQQ1M7Y6DXr0uQ/FqHLTBMmOAOZUZP6mEz/DC5Wxvh3YBlLcnxKWeMmZuPCQ/NC7dhH0KKooftvya9kqOl4qIYWn7+YmeIk50Ss4Q0TDJOuharN5cVfa33rrvN0jEoCZ05ptn0Don7eaOMmRzbvkuRYlIMe12/spc/r1hbSZ96mkOk/XpHIEhpEDpd6MSuXY475emQHGUiO3ySk+QYkwgXr4npyy1EZzFJDwvvpl+WJhYCeX75o0qNsatC+CbrxEpzb57zrnYC7bXzm3aXyaNTDlEnMoFAXy/ngmjOfHY1i7k26oBCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHJXiywH86VtoTDLrlm7iP3whdx8pmIgYCaQWpC+qfc=;
 b=LZHdXAGzWYwjSXU1j60wsMlVWxC9XAvtUv31lAV3U3dsf1B9d2EtSjGyEEWEv6bP/lRXpZF8Z6/Fh7TCZtubOfUFUKXgol0VQlMjHo9LCBZHnk3oVdIw58qYCJEBsS+8JeKhAVxcc+QcYBhaE4lGVcTL1Gg5BEVBOCgtfMDA8YeWRAteklpHku66DAANdsAVz4cat1MXTm+4AxBt3Bn926jeR06CLT91kzSTJQOOIsICx7ZNHYiN6bt82rw9oT+edrXlaYflHfBjr9owBtthJrF1GD6fp4+/wv2tq3Ya1V6x6fyPfEJhKxVKyQPBhsB9XhwFnqhVQDxUy3+W9BGmXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHJXiywH86VtoTDLrlm7iP3whdx8pmIgYCaQWpC+qfc=;
 b=Dq9H8acx5TwlQOV7Ju4cyvO355nKGRhC9IFJHgGIlAemylpOlIlujGfXotUzk7g70HUqNPr+JB11qcb78IgtHqTe3Mfqt58jBl+bLqXwI+Pf6kG1ZzjyKD+iDHKM8pOf6wUbW5IWhSzWs+dONQWv+DhcyJj7F8pFLyXIlnmmSUEsc0ZYQSq+hDVwYrLBl0xvqv4F4kUNobm5cCgKt7w6GmAB+b7q8Kwceb9pNim1s7M67KIbPqBB1XLciJMf04tsWAaTYHHKAmQeLLaGdJnZcXtuhXHtJgTRkjYzVmk6gFI/DRElyF0iSYGcnSYM0Lxf/xmMACts/QjA/NbB8QcAug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 20:12:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:12:04 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 16 Oct 2026 16:10:57 -0400
Subject: [PATCH 14/14] ARM: dts: imx6sx-sdb-mqs: remove empty pinctrl-0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-arm_dts_cleanup2-v1-14-3a0cab9fd784@nxp.com>
References: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
In-Reply-To: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181453; l=768;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=OMxbueNGr+vRDQa7DFmLaaH4S/x0dnn/E7+QFXHkFWk=;
 b=FJa7gf7JTKcjGoQCdp3joa8TaYT932wNRIskvvF//dVE9tSX5U6LLwo1/QtO8jSg7vMY5hBkr
 Lv2ZrbjtrDWASRP43bS7OOVqpg9i/ynr9dKFnBySBTYWd1cSZVdJo5m
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS3P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:45f::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: b40c2649-8505-49c6-291c-08df2bc1bf14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|10067099003|18002099003|3023799007|22082099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	hNOuRwf3PCVSIS5cX+zU/0SVIjVHR3Y79tTkdxTXS1EiSN7VFRUjDB1Nc5Xl6nKfU83Atj9viA70BHES9po2K7cl1DeG+dXA4HCAUkRkfjIOYk//1e6hh3s++kp78WuVN2iHvwgBfIljLKFdGrLvHN2ryqdXu1GNdw+yI8eThpiabBVK1VSJNJ8BXQZhj6n85FLOOnV+zWyKSXFIk5k3nLTLjx+SbGW0Xkdt6BeFzW+oBnLEX0gwP0Jabt+qwG87/9uYoTduaWmMeIyYStWTJZnsdBE50mTmJT9/IWURx+u4i7VpY3dE+jZTJCf0JW6je5Zl02XhoDmGZOLWwXjX9CDzhWlBPyhX2BKdhklxCO7HlyFq1rxeJRqDLKyFVvVf/viXYuaECPNeodUa3AhVzIvhNERtia1g0j5twjq9yAXHzu1RqN6j4FYfGoE7WrxL/ioQ8P9czNVnlDm4AxaqJgl+AIRGf4fScfviCwvunYz3dBWNvmtddmXZC+PRb5M1Qi69qON4KwMb0BU2kW9yeiP9BYMx0LQ0LxBM0uTt5gAf4xizLyuh93f7IucbxTzR5hxMYhAykX/4xjKOni3nTY5pKPojXiUkfNvmmoLArMyrxROOFEANZVzdpwUdyXma
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(3023799007)(22082099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGkyc3pvbzJGUzJCaytiYndoV09WeS9velRFeUoySXJmMTlpbWZwVmxiN052?=
 =?utf-8?B?TkpBYTlINTQzOWxnRHljQ2lESzZ6SmdTd21IWG80MlFSV01IRjIvWUdzd2lR?=
 =?utf-8?B?emphQkVOWXhoVHRwQXJ1amJCYlRhQTRGN3JldytLUmo5TmsycW1Sa3ZSK3k2?=
 =?utf-8?B?S0ZDdGp5LzNKeXFidm0zbzNJZXl3emhCa2JEOE5CcFVqalFyZDdxWEpSOEE4?=
 =?utf-8?B?NUdzUW42cUF6cWRDcEZtY0x2di8rRFRCVTRYbmV0ZnE1N0c2NXFWU1Q5dUdw?=
 =?utf-8?B?VE1qMTJUMnhlamtJeFF1Wk5HQjJZVmlqNGN6NGJOMjRQaEFjbDFHc2g5QmYv?=
 =?utf-8?B?Q3hZc0wrejF0c2tyakg2YmQwQ1N3Vi9MdllNQi8yejdJUVRTbDZQTzhPb2M0?=
 =?utf-8?B?b3VOQS92bkh2dnorenRFYmpGcEN0T3pyR21xMnpNNEE0aUtGM3YwMWpGOE15?=
 =?utf-8?B?Zmd6VTlQYW15Q3NIY2dIT0tSQzNGL2NoYlJKSnMzMzA1OElKTUxobVpTL0tt?=
 =?utf-8?B?RXpwSzhpcFJhWTJhZ0ZqY0ZrTS8rdkxJdEw0Ry8wL2ZuZVZnYUtVVkVDNDlI?=
 =?utf-8?B?SkxYNlRId2QvQllDTnQ0ZHpic1FCdURLenZ5MVgxMUNpM1F6ZVVXZEhpLzNv?=
 =?utf-8?B?bStoNWNIazlHbDNKNnJCS0kyVTJ3YWRhQU9Tc3VIVEN1a2pZZVJKRC8xN2hj?=
 =?utf-8?B?aURSZFpUeTVXSXpIcU1Ga3A2V3czZlhOeVhaeUtrS2s1Q2RWdWJMRTY3bzM4?=
 =?utf-8?B?amhwRjhrMlVvcG5IUldQdDR3VVF5YmxObUcrYUZDdUk0cU5zencxL3U2QzY1?=
 =?utf-8?B?MFdtenZ5TTlXTTBQcFlYMGJFMytHeDd3blljTkMzdTY0eEVCZCtlOE10YUNQ?=
 =?utf-8?B?ZGRvbDhnSHBBRUxxNmxkZktQS1FYTTBqRCtTL2J1MHBhekI1T1luUCt2RHBl?=
 =?utf-8?B?d1NuaU5uK0VPbC9GR0VZRXJ6U3RVK0daNU42aDdXVlNPOHlhWVNSTUUzbWph?=
 =?utf-8?B?WHJVT2R1NWVmRnZTRXF4cU9xTkxWdE9IZ1NLRHJxYW5JU0RyMHVtTDh0aEI4?=
 =?utf-8?B?UTZ5elRpbUVOcHMvTU5UYW84UUcwYVlUSnRVeXRKTHNWaVpiaGV3c2s5aks2?=
 =?utf-8?B?cHJpMm40NXM2QXFGVVZSc3IyNUU2ZFVPWnU3VkwxazdLTk5XK1pjbStzb0h2?=
 =?utf-8?B?MzBKQkkrQ0FJZDZoWm5Cd3dDZnI5TUdUb2VsYkhSc0h1aGRHYW5vbzZSQU1W?=
 =?utf-8?B?UzdZY1pLOVhJWUZOQ2R4Y3VkVVYvVU5QcHN6WnpZL09EclpyZWI2TVAyUzZY?=
 =?utf-8?B?RXU0SEZ6d243WmY1RlhQYm11dDR5QmR3K3F5blg1ODE2NG40aHl6d0xxY3pJ?=
 =?utf-8?B?SFIvNXkrZFRiWUs4Y2pXUjV6RjZPWEpsU1FHdFdYeldWaGJsRmNQS2F0bXZN?=
 =?utf-8?B?Z2pQUmVTMUlSSk9kK2k1QjlhNjF4MG0rNEJCUWhpekcrMTRGcVhLZnBjVmhZ?=
 =?utf-8?B?Z2pscEJ2cDRFalg5elFQamJNUGYrUVNFQzNxSHAzN0ZMNFhBaDJOMmRmbS9K?=
 =?utf-8?B?TDh5ZU1yR1ppWnRTUXIwczF2R0wvMklCeUVOV1BiV1lZNysxTHZjYm1KbEpB?=
 =?utf-8?B?Zk1oV09qY1JidEQ2cHpibWRnNG0vRU53V2wxUk15YnNuN2lhZEdMUkVsQnZH?=
 =?utf-8?B?dngrTi93ZTFUSXdOYW1aV21MeE8zWWlKdnYwdmMzSnFkYkV0OVUwWFRMVndU?=
 =?utf-8?B?aUNSYXRBaDVKZ2VHMGF6b0gxY1hzVTB2MVFqVXJqUklaQkZORDRxbFBrZ0VX?=
 =?utf-8?B?dTRUM0tMeU1UcHZyUFRZcHVHL1owN0dwbm5BZWNCRURsbmJFa29YVmJuYmFU?=
 =?utf-8?B?bVZrSEZqUW16TUFpTmdmVjB5aE1CN0pLVGVObTJ2SldHVUVieTlvNjl6Sjhr?=
 =?utf-8?B?VHFydUNHdnVvcFpLcCtGTkFaNyt2STdJV21VbGplV2Y3TEplUHo3b2RkL0Zh?=
 =?utf-8?B?MlNqUlVWM3dvNjNOYzdwRXNMREVwRUl6TDRHcVJOc3JyTElQWmxiNmZEUW9S?=
 =?utf-8?B?Q2h0U0U0aTBtY1QrVG9KYWRnUG12VTRRcngrVjZreVFDWXNrTWVOTVJONDhF?=
 =?utf-8?B?WWNMbFA0emdwaVZDT2RhcWRmVVIrRVhSbERmS2RscG1RNE04c0NuK1RINFlT?=
 =?utf-8?B?WE9UMWllZ012VWZ6OTRYT0xWUUIrWjh6eFNEYnZWNjhTeENESklYNWU5c0o5?=
 =?utf-8?B?ZjEvZGpwR2FZMUd0MkFvS1Y4a0dhTDZmMU5KSXZBcm1lamNJNDZnY08wYzUx?=
 =?utf-8?B?VGdlck1jOUVCTUYxRFVESXJNUTB2K2Q0UEdwZHhRVURhWkFFVm50bUFBL1NM?=
 =?utf-8?Q?c/v64wftBBCy5wK2yCzGR9Kio7/QsVNo4+/eV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40c2649-8505-49c6-291c-08df2bc1bf14
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:12:04.5584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJBNZLJU+hXJpMO3JC2eqsoivY5VepiWs94kwOtxdyx5ho1UYz+g1qYcQVNgkRcmb3YSvSBs6f+TwUcTRKkbVYcr6gc2twySmVd70Pnsb7lMgoOF46DGNPOk2wnzv/TI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738

From: Frank Li <Frank.Li@nxp.com>

Remove empty property pinctrl-0 to fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: sai@21d4000 (fsl,imx6sx-sai): pinctrl-0: True is not of type 'array'
        from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts
index a4ab2d3e960c4..82ae475a018e1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts
@@ -33,7 +33,6 @@ &mqs {
 };
 
 &sai1 {
-	pinctrl-0 = <>;
 	status = "okay";
 };
 

-- 
2.43.0

