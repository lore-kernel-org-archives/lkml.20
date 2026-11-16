Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794799438;
	b=5IS4tu3KN3mntvJK4A0gohO1tZVSOGeF1KkfveEmHUsyjbP+gU4caTEgiknLBH38k4ma
	 nOoT3gjTwGunq6bZJelovOtaQFbVcCoIat4eDpk82xfAHGfDOO9DwYOgWmV30dUXoCg7S
	 JzndvY8j9qdftPtBqBI9C/EKBkBAXFKjt8BqVSg5tAD/Ov34rsn7dXlRiWbMV45GpHaWj
	 WIsLfOy5Yo34Hj233oH/anCI+OYuWV2IlcYlPWZJGbPPtrm4CKLOEA/EirkVJu37UTic7
	 NKJ7p6QGJzpn3ZAaaM1radrz3Sg74a9H6APTiEfCk3UHNVFM7IbR4uSxrB17qs2qTdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799438;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
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
	bh=5/H7doojInv9kkYV0HZIYfYXusZ/wIqXxBLrnqDJphU=;
	b=AYmftFSAXv0R1Jj8Jt/8c7bGH1QumbePhuMXg7oK70pMzhqzN17sZstOljKBusEQ7RYs
	 +W7rWPu6NywPile1d9Ndzo7wsaIL9BkqZLF03x7EjXyP8ahbrqIaJ50Of8HBo8yIy4FnT
	 PwDfDyJhYQhM6AYK6v/CytW3otmOhw2bCn+SuIat/0CQDk8vUOKXC1AAMdCHhIPpt+9E7
	 77Jbb0fhzDYQw0BfRK8cVJJYeknFzlT0rlQYD0eshMkC+evOYL4ccMYSo602NWcWEHqdA
	 FRMroZ3QTmBUfj/wBV4YKpmZlu0xEWheLQzClvOG91A5RToFznUybeoFAtxS4O2Io/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=f2QJFjiv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.5
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010005.outbound.protection.outlook.com [52.101.84.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AA5606A89B;
	Mon, 16 Nov 2026 03:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00AA5606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=f2QJFjiv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brFYdBckwmYpGN7mPU7cteXz4zAResydKk+dYwdV80RqQ87QmK9ZbnBlT2EIj0RYcEVY0s1o0QGN6x3+M50KSgou2+B/EvNlMM2dFr1ixbD15hHAkfZjaV51DG/d7nv/1fJJ3v4ndKbhRcowI//usCy3/ZOzryKJsiopqvfyH6dozB9Pjg3OLzkvgjsma50+x8Iic1x62fo+3Ftytm4P07FxRmN7iZBb2nJ4HacOQXO5IhfQkk9PEeTNNXTWNVZtvgQykPaCDETmXDeYxUJ/FBWeuSR9XbesBBEj+zdkbRq3u0UdNYgcj4Kpu7Dc/Sn5KA2nbnikDjbaehv2xSbZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/H7doojInv9kkYV0HZIYfYXusZ/wIqXxBLrnqDJphU=;
 b=gD6GoaXhJrxUBDG/PmXxGKR1u8tsGNArKRs9SKFtrqn31Bsyqsb+CPQoxu2/Kw22wfRhR8dM4BXwCN0Bbx0D79e+Qlpw5pd5iAStcsPeEJZ+dTjHkNb796OMG2jDmhytvTQZzNSPsIR50OubrlKRe+o+ytlyfRCPiiVJie3JwCxMJ7TsARCxD7bnZ0msyTjbF613n3cmnFwcDDXM2Gzkw+dNsZ45bzhQVa76zXBH8LghUvoFdbN55SyXB6Aa+Fd9zpxCetfDHycwBXpyFonnHn6nIfhvpCrpqmipWSnjcUX3u3dkaYhABiG2uScZHpaqz7uM5ivXhYziaeZdH+0n8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/H7doojInv9kkYV0HZIYfYXusZ/wIqXxBLrnqDJphU=;
 b=f2QJFjivd2wIanBequkEkFSSLxPnXee4+Lb5nEFGMr6WIYRvkguhkWRZn5ebjMiQ17JzI0gzvMX7Mp+u90Oa+BFwbT+6XjB4Lrf4XhyycmSvv4MqizMQfVvaf5X2864poeICzrapRMj9vDB+BWnsaxBrCh3QD+yRiFWahdxq+XxgHw/2rgWJ/SurT59vbELoq5iIKyjqAkDha9sBURnZqTAGFWUWMB5ubOWY5wcA8ZgGxuX7awvdY6Y0yrgyWnNkU2oEgUil7MiHs4YCy5+/6q/ZX4R4m5CdWax4KBR5WdaY/h+nvxZwdy9gXO0KmMvIgtuVEOJMw9/5PYJhqyYKhQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by BESPR04MB035703.eurprd04.prod.outlook.com (2603:10a6:b10:118::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:23:54 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 03:23:54 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 16 Nov 2026 11:28:23 +0800
Subject: [PATCH v5 05/11] media: imx8-isi: Apply RAW output format
 workaround at runtime
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-isi_imx952-v5-5-46de1d24efd4@oss.nxp.com>
References: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
In-Reply-To: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794799700; l=7221;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=W1fjarq+Suj7Hzq28ArBqEaKqdQUNk5s5wQ9XjzwFK4=;
 b=w6rOqo6Ma/CR17sAfkTKQYHsinxwVHX12GJmOEu4W2GNqjVQ1bP6Ztrj6wNSgWujawepeOEaj
 JWR9Ygjwh6yDayKYsoEMXi+kaAMyXnPM+ctF3iIE1STpqFgjEQRe+ft
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
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
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|BESPR04MB035703:EE_
X-MS-Office365-Filtering-Correlation-Id: 44e1895f-9fd2-4bf1-5654-08df43910b0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|921020|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	7kJKvrm62qvAvi0viDhWDWf8qcEQfo8T8a6nPnJYogw5KvGiqajqjhwlIqFmZBWqKqugGMO63Qr9Gh15jWbH/Yq8DUxMO+PM/G95J8S6xd9n7QYeJWNkVIxhYp3mksxcB6yhU5pkfzhL9WZGKnaZspAlcwvgvTYKmNrPjPjVUFCA1Gi5a+iwKnIexTp7uHgECf1U63BTn5u0rM8lne+We5/DNjtprrLFmiq0vlnVXAPi8BXgIFevBU9J6IUI1iV9T3otxsFsQE/qpI8aqcNatNBdGxJjmPd4mLJQi7bi1pRQuExkP1wiD9VPibgNL3t2NtYsBtnBJ9piZl99vIRL+BjqsP6oRu6522q6EHCb17BVd28VAj4gT3FUdhHyoqAvTgJyIf26WSLEpC1pwftDk2at/JOTwpo9Nj1Xq3+oofnMjN6YwuOllTmGtyUkFkd1ZEMnq8D2e1v9EHXJbRwgdluCyt+EcVMYfnmzKP1bN+3BOtuNInmi39DYZQhj/dAtX71jxU+htaf4mKhFS+pl4wJ9tRpsiH5XjMkcDvDRRerf2I2Iy7zYFNKJwEKMlYA749hojzcO+l9SbBmDB4FjvAbAS0GhHElLGCG8RYwdsJAVoantLL3TdcFDG1vxivvt9QGhkMuSH8pphJJtwNvzabbAb/edNek+TWRUSJbuBoxR8yojJrZUP/uQNrNpU5eIZPVspYr44zYTgN3tsF/fNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(921020)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGNwNVhKTGxNVnNLNDZmRXN5WXhGRG1vQUtMNlkrdGJxWUJ3cjdKTXNZeWdi?=
 =?utf-8?B?SVhUVy9pcENJdk1PWGk0MXpUWTNCMlpQeU5BR2VQeW9ldGVPVGNPR013SkVG?=
 =?utf-8?B?aFRPUjN2SG1wRjN4RkdveSs5WHAxakhlR0F1Y2xXaWtnNTBJY1BoS09WN0hH?=
 =?utf-8?B?UUV5R2lxdVFyUXBQaFd0K1BuSnI1NEY4NzJpTWZPRVh0M1lXdVNKcDVqVytS?=
 =?utf-8?B?VTBiUmxtckVGYjJPUjdtVmF4WG0rc3A1QzJPdXdRKzEyOHhBRyt4K3RmdW9C?=
 =?utf-8?B?Ym81ODNaVHZXZXJ4S0dCN3EwUzM0TnE0cHJ0QmVRZW1EeUx2MFhnUGQvWExJ?=
 =?utf-8?B?eXJJQmtpZkJnUDl4ZHYrSUpYMGVPKzVrRGdvdEt6N0t4QWxCQzhRcjFFQkJa?=
 =?utf-8?B?YXpzckhmcXI5dDI4OFhCVmhHUWxyWWdxa1JPOHpaVGQxSHpLRVdkaW1Nck14?=
 =?utf-8?B?OGd3TEhXckpEQXMwc04wZjlpZld1STZoeXJSdmFDU0l4dXhwTjh3RTJEdHlz?=
 =?utf-8?B?bGV4SWtsWEd4UWRSUG1lcllrRmpWUElqVlV2aEpNeFRyYjYxSS9nNnpBOW5Q?=
 =?utf-8?B?Q25lbk5qZ0JDSThnTVBBM3hFWVg5NCtDWVVOZ2NoSWN1M0pPVGNIM2JLaTVK?=
 =?utf-8?B?K09QQlZKTFE4TG8vYTh0ZFN4VVU3T3dHck1qVzgxaGVGeng1T0djeW0zQXBB?=
 =?utf-8?B?Slh1ZHdvdU03MzhENENGbkZkMUZrQk1uRmUxSGJyeDBnY3BPWWRRODhzc2dD?=
 =?utf-8?B?OHZ3bXppZy9JQmxyK0dyeTZZSmo4eElSUWtVZ1FBdE1QQzM0M3k5YzZoblNv?=
 =?utf-8?B?U1FmYmhXcmVTQVA0S0ZqWFlvTkNrWk91UjBxWVJpR00xL0p0M2dNM1FYb1Zh?=
 =?utf-8?B?WWxENkc0Y05PTUkyQUNvY0FFYURKeS9sSWd5VmpXckRmekJvaW83QWhQYndY?=
 =?utf-8?B?b0tQVmxadUZWVFNOczNkL2pWb0Q0YytuU2hCbjNiMVpRRFBOVkRMa2dPNlRW?=
 =?utf-8?B?TEV0QlN4YVJrbDV0UUY5TlA4WEtNd0NycDBGTjZyeWNCUVcyMmdFcWN0REZv?=
 =?utf-8?B?V2piSVN4b2U5OTEyWWFYUjBmcXRxaTlmVHdxdEpNdjNrei84azVrZ0NucDFO?=
 =?utf-8?B?ajNDOWlYRFZBZDBKUWRuYWVHcTBDN3BwNUNCbnQ5cWpSbjFyZ0tVN1hQVnZq?=
 =?utf-8?B?MituQ2wvQUlMeUJRRFEyUkcrc2dRdXFaWkZOa2t4Q3ZHZEhQRFpmT0N6bldN?=
 =?utf-8?B?SlpzMllpclRBTG5kVC9FQnBxbzhkOUhsUGhybEtTMHVhWlpMVG9sTk4wZ3Fj?=
 =?utf-8?B?bkZLK3lWREg4OHp0ZUlaNjhSeHlScXA1Q1NGM0x1dlBHVUw0Nms3ZnZaVTVP?=
 =?utf-8?B?UlJmbExhL3Z1T2ZzeHp3TGRHczNpalNhSlRUWDRkVEF1bElyUW8rTEdBcWps?=
 =?utf-8?B?b2JzNXduOVBjTEw0WmxTRlVnMU1BV2NHRTYzb21jakd6TmFrRCs1bjNMamYv?=
 =?utf-8?B?Vm1jMHRhUWRSNzBxUjRzV281Y0o1UHdXRWdPZ2xMbXhNSlJOc0FKcjhIN1NN?=
 =?utf-8?B?akpxZDFPWmx2c0VVemVNQkdWcGNWNjR1Z2swcVpJWnF5bXpTZzl6OGZ6d3lC?=
 =?utf-8?B?Y0RVZVpUd2tMME0wazRPVkE5OHhLRWVHYUVyNGxGVmxNTUNrUElIMld0dUE4?=
 =?utf-8?B?WnB6cEJUSWNZU1hXK05UL3ZlZWw1OTBSbVN2QTViQlFSeHBOaFV1NThPUTZm?=
 =?utf-8?B?V0RQZWFMdHlNM2lZTDlmUXJOMnNmbTJFdEJQbmNEekduaFFSbFRZeTNZWjZh?=
 =?utf-8?B?SlZEQUJWQm02VXNrQ3FLcTVHQ25PYlV2UGFMSUNqeld2dTh5OG5zOThpTTF6?=
 =?utf-8?B?V2ZxRHlYSE1aQWN5OUFUZ3VKSTBTU29oVWQvVlBheUFTNURLN3lTdmpsZkdr?=
 =?utf-8?B?bjFXazVMNlUrajFPTVFCcmJsTU5lZVNhZ1VuaU5nTWpQYzNyQXNOczI1dU52?=
 =?utf-8?B?Qm5DVGFVdXhkcVVUSVlaOUs5SE5TaGU5TjdEdTBJZWRsWEk0SXlGZE9VeUtO?=
 =?utf-8?B?RTM4SGNjeWtxSHpYVTUvdFc2SnlRVy81V250SzdLSlpHTll2bmVBc3M0MWlG?=
 =?utf-8?B?RE5ETkhKdVhKaXFXWkZMd1A0RVYvdHRTSXFZeHArcS9paThBbGkwYlN2ZnBP?=
 =?utf-8?B?Q2kwcTlXWWsyZUpOSDNXVzFncEF0NU8ycmxJTTBoZUxRTnd1amY0UGFSZjNQ?=
 =?utf-8?B?V0pnT2c0eDJabHpKSng5emlURzNEbXl2d3ZJMHlKY010U3pxdXhrVUkxdHZt?=
 =?utf-8?B?V1NlMDR4OG0zbnY4SlIvdmQ0cGYvV0lxUzBTc3FLVG9TbUR0Z1NMelRobXBj?=
 =?utf-8?Q?vXl7ci3qd7K869SScjWdnwPCGXGLoftPXiXYZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e1895f-9fd2-4bf1-5654-08df43910b0d
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 03:23:54.6268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96MeBLio7iyg5riCEkvufP+XJRAB6y4MIHEX0pdThNQn8ZsPYw2W8Xz4n58in3jMcnfbyIQ43J7uK/GvIjM5kfaqNxyM2fj2GxqM5vOX9CDYpKmfT0LINKBQGek8G83f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB035703

Refactor the RAW format handling by storing the actual hardware output
format (RAW10/RAW12) in the format table instead of the workaround value
RAW16. The RAW16 workaround is now applied at runtime in
mxc_isi_channel_set_output_format() via the new isi_out_raw_shifted()
helper in imx8-isi-regs.h.

This makes the format table accurately reflect the real hardware
capability.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- New patch
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  7 ++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    | 13 ++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 30 ++++++++--------------
 3 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 6aa760ce3605..cc52a90c2477 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -411,13 +411,18 @@ void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
 				       struct v4l2_pix_format_mplane *format)
 {
 	u32 val;
+	u32 fmt;
 
 	/* set outbuf format */
 	dev_dbg(pipe->isi->dev, "output format %p4cc", &format->pixelformat);
 
+	fmt = isi_out_raw_shifted(info->isi_out_format)
+	    ? CHNL_IMG_CTRL_FORMAT_RAW16
+	    : info->isi_out_format;
+
 	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
 	val &= ~CHNL_IMG_CTRL_FORMAT_MASK;
-	val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
+	val |= CHNL_IMG_CTRL_FORMAT(fmt);
 	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
 
 	/* line pitch */
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index c704be882705..0f3ada30e71e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -421,4 +421,17 @@
 /* Channel Input Buffer Extended Address Bits */
 #define CHNL_IN_BUF_XTND_ADDR					0x00b8
 
+/*
+ * The ISI shifts the 10-bit and 12-bit RAW formats left by 6 and 4 bits when
+ * using CHNL_IMG_CTRL_FORMAT_RAW10 or CHNL_IMG_CTRL_FORMAT_RAW12 respectively,
+ * to align the bits to the left and pad with zeros in the LSBs. The
+ * corresponding V4L2 formats are however right-aligned, so
+ * CHNL_IMG_CTRL_FORMAT_RAW16 must be used to avoid the left shift.
+ */
+static inline bool isi_out_raw_shifted(u32 format)
+{
+	return format == CHNL_IMG_CTRL_FORMAT_RAW10 ||
+	       format == CHNL_IMG_CTRL_FORMAT_RAW12;
+}
+
 #endif /* __IMX8_ISI_REGS_H__ */
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index af91bd65b2c1..978a637f539d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -218,15 +218,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.depth		= { 32 },
 		.encoding	= MXC_ISI_ENC_RGB,
 	},
-	/*
-	 * RAW formats
-	 *
-	 * The ISI shifts the 10-bit and 12-bit formats left by 6 and 4 bits
-	 * when using CHNL_IMG_CTRL_FORMAT_RAW10 or MXC_ISI_OUT_FMT_RAW12
-	 * respectively, to align the bits to the left and pad with zeros in
-	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
-	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
-	 */
+	/* RAW formats */
 	{
 		.mbus_code	= MEDIA_BUS_FMT_Y8_1X8,
 		.fourcc		= V4L2_PIX_FMT_GREY,
@@ -240,7 +232,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
 		.fourcc		= V4L2_PIX_FMT_Y10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -249,7 +241,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_Y12_1X12,
 		.fourcc		= V4L2_PIX_FMT_Y12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -312,7 +304,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SBGGR10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -321,7 +313,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SGBRG10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -330,7 +322,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SGRBG10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -339,7 +331,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SRGGB10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -348,7 +340,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SBGGR12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -357,7 +349,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SGBRG12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -366,7 +358,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SGRBG12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -375,7 +367,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SRGGB12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },

-- 
2.34.1

