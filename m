Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792573368;
	b=lcbFbEs2Bgyodb/pByfKA+VpEefyT75M0u5/VrGPI+8ZyME14bWMFQSO3cjwSWF+ts6D
	 e7JtdVAktjpnI+6+SvL1pkKu0nMA5V9Ts3Vr77BZd6C/PTnzoO5fuSJvyubzn3aPbI20C
	 elXCWB8HVxdnZUqGuxuSbBul94UHr4eyaUpRa4kywIX+UGc0yAGj3Fdv+81x3OJ/n4Iar
	 MlQ8EghDWfVm/DAWMO7CyJlhaXPn+IAf3Wc7ZVBAKD0+g6b+GBiZXAlD/qgJgC3imupCg
	 8P5f6xn89ORIPou6sMLHygmyI4NlMu6BjEtS9l6xYt1coYpQBboYWapVbLf+lsf5DMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573368;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
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
	bh=kxnyoSU9MCaEaLeqsAvNl7VKifz2tHwBhqPBHgw2ChU=;
	b=Xm1mbtZHENKV/xhzYppZ8SBJHMqyaJPyZgmeAm6xpvHaNKJAQyg+ezPBIcaK2CFdIHS0
	 4riCpx+LxtAugUQUHunsjV1Fri1eyzqrmG6RdNbsLZcicRp+KxjPXyE5GuRS49mRtGrRD
	 tQWZxpJKQ0hXd0YT6uhjTDQkrRtkESuoBZyh6phntv0W+CcDaQujPQ9NGAdRQu7IQzrm/
	 oAOFBKqpGt7b2Kf0wpZ/2bs+PnV4rGU7cgYTB9KHfV3wyd6/wSpZICuaO9qTHbg5DwhNf
	 DU0GuCAWcuKRLkk1eh0OVaxd3pUbRUd8fe3QAiGyITJeoB7ODBME44Tk34vJH4NNALA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KLCHNU5r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.68
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010068.outbound.protection.outlook.com [52.101.84.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267B2606A31B;
	Wed, 21 Oct 2026 09:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 267B2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KLCHNU5r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crQaOIDU23ThkNcsb/T9qzFWiB2uri8Ws1w+FP+0whXX8zb98rFOeESLjm6ggl0oee6He8Wc5u1eyC65Lo98P/31SEyGrMIHo5qQ+taburBSzIVXqZzioBnNXzkoRSIpFE0ly8xrnwYnCOuNhT5S3U+mJk751cleNUxO+B3wc/5cxV9f8NpdXy9Kz20Y5ap94dL9y8RjaGQGh/2hcYTr8+xLZnpRDD8G5TL0ZFUtWlHvCSt7hPlq6EV8ffz0ItXMV0aLEWWj4yFDAFihRu6FVy5VWKw/H51XyLhF6/qDRcaxeoE22aQcvYzHkDceX0x/5F6jB/Cze/WMlOwLW8stcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxnyoSU9MCaEaLeqsAvNl7VKifz2tHwBhqPBHgw2ChU=;
 b=KXHQtvPyjm4acHV4030W5mq71seCrw54pOkLjNpUgXAaxAJ2PJhB8tinrz1vUSRhwkqerU73E3XHELuF+7hvPw4NYff3ts6YMcfMf/vzWnvAfMgnnzvanfW7Cn5QOVt09G9L9DDfLHi/BSoVpZYVD/5X5qbqc8S74g2Yj5unlj+Zq9Zt9aryKlGmYTMw6Ve6SZKioE22BGG206RpQMKkFBtaNCW6l9mAY3lGyCnh+O8AGkQ0HPQJt1y4Z6eJOkuNEIoUsdJi1WqiM+Qm7cChvtJpw8BVCUAz9JQt1nBOzWB2i59D/Ehd6eSmP5Gp114TqXFtX01uEVSLfKIU7aBUBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxnyoSU9MCaEaLeqsAvNl7VKifz2tHwBhqPBHgw2ChU=;
 b=KLCHNU5riRXCXS3zbwWaoLWcMGdS2B0ogtbKk5CaH+XGjmi84ZB9Ew6RP4C/nt7oR7w0BEB2xGhOkRtqSkULMlbjkvZYGzmwsIcrGlYf7rfBGOvEcyeMA5p9/a70ifR0kLxZ2gAojiktCJDBdm8hsuB7DGSNngKX1zQ6NNWxA9PflKz6MICBSmEB8cEa1Fc/gvSlg2rGPkT9FNH7gJkCXiV2HwHl9B2YBpipf32thPamxUleCTtlr1brQmqA4jz3YU7LSIKwP4cTaYtbFA69ebEfpXhxPrS5iqte9nxdWwalbTcFy8b+X8HcfaXEx3cYn1DEtyvf2tAVulGQnyV0PQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by AS8PR04MB7960.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 09:02:45 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%6]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 09:02:44 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Subject: [PATCH 0/3] ARM/arm64: dts: imx: Fix stale board level PCIe Root
 Port nodes
Date: Wed, 21 Oct 2026 17:04:21 +0800
Message-Id: <20261021-imx-pcie-rp-stale-nodes-v1-0-db6590e972b6@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABWA2GoC/x3MMQqAMBAF0avI1i4kUVJ4FbEQ89UFjSErIoh3N
 1i+YuYhRRYoddVDGZeoHLHA1hVN6xgXsIRicsZ5a5xl2W9Ok4BzYj3HDRyPAGW0vmlneG+coVK
 njFnu/9wP7/sBQ7rSHGkAAAA=
X-Change-ID: 20261021-imx-pcie-rp-stale-nodes-e4634fe66020
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sherry.sun@nxp.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573508; l=4962;
 i=sherry.sun@nxp.com; s=20260723; h=from:subject:message-id;
 bh=GCQrfAD/LJjM5ZkDFkFAmjU61MI6MMxcs6mBmb8aEJ8=;
 b=iPOg9lB/4/7bYWrSwXIB5c0UZL3tI0bnLBYAzomYSLEL9nGJt1B23QQUh3YYJ1I+0rOLjfcRh
 tjWDzj87hc3DJ5tnvaFhIpaaqX+NzHv17i8UTGvsKykIC3U7xZL+kkA
X-Developer-Key: i=sherry.sun@nxp.com; a=ed25519;
 pk=YnYnIFJ2l+5v951x9shBVfHhminNi+3LTfFa3PxSdnI=
X-ClientProxiedBy: MA5PR01CA0227.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::14) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
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
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|AS8PR04MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: 973c12bc-5feb-4083-a520-08df2f5211e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|19092799006|366016|261009223027099003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EU+Q2I4Z5uiKdQFQZzZjzYD1vawwkemrokFDNR2mSKkoGzoh/4XU3uetHTS4mKi3PJRTNQigOGA1rr5Oae5SuWNN6JNn0frRVflKiFRG2DOpp8oA8i9nWOyRtvfZEyXT28LIVU5NeBLYVTp00+lfrE96lAzB2H552R2+V/zKnVS5REYn2ZT66z/69e5KJWlAp5N8EPg1wVSoVmR8NERP/d4muLdKC4M1N8N2Ee9gxfWfw4QEumFtldkOLx7FDHzkTaCmLpEHhqJdTq32pXx8gdol2/fjgrsR8ZsBCETxnQU49KnrN4SegN8y/1tan3PrkmQXml+M8EQN8yDTmnfPZ/bqYb2UgQ+SiRNp9Vjzrb939jbwKvgkWv9oQURljaigDd9K0a84YfX1yeUx+3nDXL35CD6cqp+7ZChXbrM+VbO39nk024C9Iyn3wYo3A+HtJFLTJhj9JOJKuDHidS0vZnO/UgUeTiP6XWy5MA1Kunr5M7BFdOCTph+cXk0iprUeQx3hBGlwUWgu5YGLOMkZt7rSQOkeZyv6yvNYI0AisWeHVWUMl3d8CoDl93txy1xLorDsSjUuP8n2BrWnxMDU/fF2BB7fDw91H00twr8PfyE+rfPWbm/HClnwE7Yvm9nS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(19092799006)(366016)(261009223027099003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVdoWHZyUHl4cVhLanpLc05kZU1WUXh5cWFzc2hBNUlDN0VkYlNiTXZRL2hE?=
 =?utf-8?B?VFNIUytWczNpMjJYMlRQVWluYkVqS3FPUE5PZlVrZmd1WjlRM0RZcktsd2x0?=
 =?utf-8?B?WlIxaXpsMUVJUUxlZDE1WXd2SzBwTU9lRU14UXkyZjE0dUhXR0hCeTJRcWNP?=
 =?utf-8?B?bGhLYlBYMzdMUXpnbnN4U3FuSVhUaXFES0tDTExVZjNLSVBrSnBkWURwZDRn?=
 =?utf-8?B?VXVxZU1ReENCK2M3VnhmNWZXeVlNaUFnbjFuRkluaVlTZUMvUDJKNUZiZnlR?=
 =?utf-8?B?a3ZXaXcxTlR6OXM5N1lQcE41elFzeiswSW14M0NPeUlyWXVEUXNBcjJ2U0Na?=
 =?utf-8?B?ZlNDbHVuZ3ptWUZjSlJxV3JCY2Ryb0dmK0J4WTBBMTlzcXN5STNDclNQWFRT?=
 =?utf-8?B?dkZxcjhHajVna1kvUlhpVjhqQW5STno2K2UvaUMxOG56RHAxdEw5V1l5SVBN?=
 =?utf-8?B?MmhHM1RUMW45R2Y0TEtqM3pqZE55REZ5czRROVVDL3RRQnZZRUJxcDlveUhO?=
 =?utf-8?B?RTdDeWk2cG1aL1N0eXJjUUpuV1B2WTFNRVU3Zy9ETTFtWEZzT21lNUxyT0FD?=
 =?utf-8?B?eDZuRzVJVDlVVDY0cjFYZEgyV1piWWdMbUJxNnVzbE5YZ0t6YUhkOGhOSXQy?=
 =?utf-8?B?cXhCUDlhdDk3OEdzR2VFTEdoazFMS0lHc1k3ZzVSU2dUcVJsVUxaSDVSNmcv?=
 =?utf-8?B?aUd0cjdZMFZ0ZTBxaVBUaERldDROVkd2NW1UQlQ4cWpldlF3TWUvYUFGVHZu?=
 =?utf-8?B?QmhNb01Tdkpicmw1MTFJVmwwV2dlOUszNU1iVEIwSUt3R3djRFA5TTljY2Vv?=
 =?utf-8?B?L1JjM1lLZG9wbUVqcExwZDl4SnVIclJ1RDExTmozckplZENmeFdZQXBtRFlK?=
 =?utf-8?B?WkpSVHI4QTNnTEZIV2pBamtiTmhJOHIwQ3B3Sm9Tb3VwcVV3amRxTENxZ0FD?=
 =?utf-8?B?bzl3OHczVVBBZy8xR0N4dXBoenQrcXZiUmVSemU3UUdYUEN1bFlCUC9aenlK?=
 =?utf-8?B?aWQzd2x0WEpSRWZRSG5jRlR1RzRuNWw0VkFjRGFRdUUvNy9pcjlFcGlwU012?=
 =?utf-8?B?N2ExeE5Qc0NhY3p4MHpmMkxTL2xnN21GT3hlVFVibi9YVUNIc29uZllmNEhq?=
 =?utf-8?B?a2FtUDQ5VEhQWlB1dGlHVW5IemRhdmRXbUs4STFWVmdNMEtnS1pYMVE2c1FB?=
 =?utf-8?B?N0VnRzJlSGVSbkU0LzFoQStmcmV1SnBESHFSSlA3SVlSRGV1TDFhNW5GcTU1?=
 =?utf-8?B?bnBvYVU1eGVub2xqcFR0RkdIVWpwa1Z4RE9oVW5FbEVyMEZKZDAvTmdDd1NO?=
 =?utf-8?B?NU8wVHN3U1RRdEkvVlVmYXlSU2J1cTd4T3l1aXVXcWsyY3lPbDhTSTA5ZXBS?=
 =?utf-8?B?M3FDcHhEVnZvdFA2VGg3V2FYbnV1RVNZU2J6TEhOb2NPSFcydTBKN1RkUEZn?=
 =?utf-8?B?K2t0emM1ay9OdkIwRVM4aFlCdHZaQWVHMCtRSTkxSGpiTjBUQkZUQWV6SldJ?=
 =?utf-8?B?MWxFdFE0Z3l2UG9aMHZRS1piK0V5a01pT3VKRVF3N1crRXoxSGdnNWZTcStq?=
 =?utf-8?B?bDRTTWJ3ZDlVNW1WMDB0ZlFuTERQZFVkR3R6elc1QjZwZ2hzc2FzVmdqZ1pX?=
 =?utf-8?B?dWhESjlqZ3EydVZNOTdWT2g4cXV2aWxPRE93L3ZtdU82cXA2WHI1NDFhOGR0?=
 =?utf-8?B?V2lyNGcxQk82WnRnV09iU1phdGd2UmpyS2g2d2tLU3ExZ2xoa2VPczRTd2Ew?=
 =?utf-8?B?ejA5enhoRVZjME4zSHRDeVlKUCtEazFEeDFmaXJCK1NCZWM2NE5PYzlHTS93?=
 =?utf-8?B?aStWRVdZZ1U3ZjNsZHZIMW00a3RFSytUUkhEZzVrSWhFKzRSWDhuK2JuMWVO?=
 =?utf-8?B?d1hvUFpERjM0bWppUTFudE1URWNOV1U0ckhIdWQwYTZHRVFhakRoa3pYT1Fv?=
 =?utf-8?B?RytmTmpLY2FycVY5Zy90RU41VXNYRGlLdGU5V1FMRXFBT1o0TlBWUE9jam9u?=
 =?utf-8?B?eks5bTB4WTV5RGZqU2JrRmc2emlxNEMvRDBwK3h4ZTBOTkxBTUVqNzAxV1ly?=
 =?utf-8?B?S3gwVlgzb2FTNlZiUk5FaU9kR0NNb2w0RDEzZzdCN0VNMnlrK2pMdldya1h5?=
 =?utf-8?B?aUlFMzdXSDdZMjluaVUrVktQMEJYbVA0R1BEenlWQ0Y1QXltdUYydmVwU3R0?=
 =?utf-8?B?SVhFV09VdWVQVWwrUVVRUE43MmVxT01xSHdVaXdyRFRSUUNZU3N0VTN1Ulow?=
 =?utf-8?B?ajg4VWY1MEFVbFhHMDh3N0t2TnpSRHczNi85YnFaWGd4TEh1Z2dQR0RIQlJ0?=
 =?utf-8?B?cW1nVzlOeVFBdUVPWitLSi9CYnd0dm0rZmlYeS9CZllrVnA0YzMyR1RjRlk4?=
 =?utf-8?Q?BR6GxJNCuMmV4GXQaLxcInCCJkSQaKqLJ5y+c?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 973c12bc-5feb-4083-a520-08df2f5211e8
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 09:02:44.7751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hyfpXCcWeB3Nbm+3wtmPau9qFkMox2bEIp/6/F6lP1OYJ7EF591+Io0CpFJZ1ms0OsAa++ZPv0e5VQuyRyt1eCKXBbLhgMNtzgqHho2k7FhfaO3wW24ExtNFih1X8A5+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7960

Commits 9dc39532172c ("ARM: dts: imx6qdl: Add Root Port node and PERST
property"), 37f53f50b36f ("arm64: dts: imx8mm: Add Root Port node and
PERST property") and 396fbe9a028d ("arm64: dts: imx8mp: Add Root Port
node and PERST property") added a Root Port node pcie@0 to the SoC
level host bridge. However, several boards already described the Root
Port in their board DT under a different node name:
  ZII RDU2 (imx6q/imx6qp):               host@0
  GE B450v3/B650v3/B850v3 (imx6q):       root@0,0 (label pci_root)
  Gateworks Venice (imx8mm/imx8mp):      pcie@0,0
  SolidRun HummingBoard Pulse (imx8mp):  root@0,0

As a result, two Root Port nodes with devfn 0 now exist under the same
host bridge. of_pci_find_child_device() returns the first match, which
is the SoC level pcie@0 node, so the board level Root Port node and all
of its children (on-board Ethernet controllers, PCIe switches, etc.)
are no longer associated with any PCI device.

This series fixes the issue by moving the children of the board level
Root Port nodes under &pcie_port0/&pcie0_port0 and dropping the
duplicated board level nodes. All existing labels and aliases (i210,
switch_nic, eth1, pcie_eth, ethernet1) are preserved, so phandle
references such as the DSA "ethernet = <&switch_nic>" keep working.
The moved nodes now sit on the Root Port's secondary bus, so the bus
number in reg and the unit addresses of the first level children are
updated to match. The kernel matches nodes to devices by devfn only,
so this does not change which node a device gets.

Request for bootloader owners:
This series changes the full DT path of the affected nodes. If the
bootloader (barebox / U-Boot) finds the node to fix up (e.g. to write
local-mac-address) by a hard-coded full path, rather than by an alias,
a label or by walking the PCI hierarchy, it will no longer find the
node and the MAC fixup will silently stop working.

The node path changes are:
  ZII RDU2:
    /soc/pcie@1ffc000/host@0/i210@0
 -> /soc/pcie@1ffc000/pcie@0/i210@0
  GE B450v3/B650v3:
    /soc/pcie@1ffc000/root@0,0/ethernet@3,0
 -> /soc/pcie@1ffc000/pcie@0/ethernet@0,0
  GE B850v3:
    /soc/pcie@1ffc000/root@0,0/bridge@1,0/bridge@2,{1,2}/ethernet@{3,4},0
 -> /soc/pcie@1ffc000/pcie@0/bridge@0,0/bridge@2,{1,2}/ethernet@{3,4},0
  Gateworks GW72xx/GW73xx/GW82xx (imx8mm/imx8mp):
    /soc@0/pcie@33800000/pcie@0,0/pcie@0,0/pcie@N,0/ethernet@0,0
 -> /soc@0/pcie@33800000/pcie@0/pcie@0,0/pcie@N,0/ethernet@0,0
    (N = 3 on GW72xx, 4 on GW73xx, 7 on GW82xx)
  Gateworks GW7902:
    /soc@0/pcie@33800000/pcie@0,0/ethernet@0,0
 -> /soc@0/pcie@33800000/pcie@0/ethernet@0,0
  SolidRun HummingBoard Pulse:
    /soc@0/pcie@33800000/root@0,0/ethernet@1,0
 -> /soc@0/pcie@33800000/pcie@0/ethernet@0,0

Note that the ZII RDU2 i210 node has no alias in the kernel DT, so
the barebox fixup on that board is the most likely to rely on a full
path.

Ahmad, could you please confirm how barebox finds the i210 node on
ZII RDU2 to fix up the MAC address? If it uses a hard-coded path,
barebox needs to be updated to the new path above.

Likewise, Gateworks and SolidRun folks, please check whether your
U-Boot / barebox fixups (e.g. for ethernet1) depend on the node path.

Not tested on hardware, since I don't have access to these boards.
Tested-by from board owners would be very much appreciated.

Reported-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Closes: https://lore.kernel.org/all/171421fb-d0a6-4e3f-b2dc-226e9c548972@pengutronix.de/
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
Sherry Sun (3):
      ARM: dts: imx6qdl: Move board Root Port children under &pcie_port0
      arm64: dts: imx8mm-venice: Move board Root Port children under &pcie0_port0
      arm64: dts: imx8mp: Move board Root Port children under &pcie0_port0

 arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts         |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts         |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts         |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi        | 11 -----------
 arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi    | 13 ++++---------
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   | 22 ++++++++--------------
 .../boot/dts/freescale/imx8mm-venice-gw73xx.dtsi   | 22 ++++++++--------------
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    | 16 +++++-----------
 .../dts/freescale/imx8mp-hummingboard-pulse.dts    | 17 ++++++-----------
 .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi   | 22 ++++++++--------------
 .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi   | 22 ++++++++--------------
 .../boot/dts/freescale/imx8mp-venice-gw82xx.dtsi   | 22 ++++++++--------------
 12 files changed, 61 insertions(+), 118 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-imx-pcie-rp-stale-nodes-e4634fe66020

Best regards,
-- 
Sherry Sun <sherry.sun@nxp.com>

