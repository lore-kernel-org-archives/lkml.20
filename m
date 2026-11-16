Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794799424;
	b=jUWAoKTqM+ySqndPws0iee6fm+hmJf1IMV2JzZLoQ35oh0Tm/ShRQuwDUMs1zciGwgBz
	 NrilTwDOnT9LkMRtwm7JL/mduAA3dQdl0eXIYM/jxkUyUl/cHkGrBoSYrnhWANeo8V52A
	 4bmhqy9NHp8jDzqbP0coXPnmMkqUBJZvuKydGhR1I01nChiM1zqWgoydH1jk3qND3tPz6
	 29bkFFR+U/CntUVvVhWF4EPUu6G9L53O5rkNQy5W1ZLZ4N19njh0Wegt8CRjH7MDvATQ/
	 cdOh30VIktH2CNvcwAcXBOom/+Zq9JPBhbFfOw/5p6epxcp7Sp8FIWwS4+WlgfDY8tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799424;
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
	bh=C7uJvRs73O1LCH6ffHaqYlcgfpbgp1YqDkVmkSirdh0=;
	b=GM7XXsS3/GVjI57Mv0tpu2XwBlUkyBadgpla/VBkRnslUIWfQu+Zns7AUwbtRx0Bp6b7
	 zD5DexgMvaEvqCgap8wXPhhbU/8ZXd0zZlRuXTJbYG5G6j1Lg7gQ1aJ0eXgJ25g40E7Ej
	 HyhJrCV09kECI39fiPaJoWD/jDLxW3FcR7fiI0cz4hn1mWtH8euHIJu3nEicmAovlVD5j
	 j3USCtPu1jTDZ9HGh4rXwzBsK9w/FOplU2lQuFk8OVGv8EiqEmXnxxpkzrw8BVkyjBBXw
	 WiqGVYeKnRf2HbD8gOQBUOK68ht5xsbGqSJXzdRsRbqVdbHNMZ5Ba220+g4paa3JgCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pce33DYm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.8
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B56606A338;
	Mon, 16 Nov 2026 03:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60B56606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pce33DYm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FELvSfAl2+rBXXZbHpbMi0jAnAjOWPmsCsRvTxBt4Ru3BD6Zg8CKWUusiB9EkQgGXWfLqcDD+lKocbdebEATFljoXREVfw6Nx88gystPql+JrlL6/dvkrl5Fzs13keIETF7xmSJYAyoIjJf40eaV+LBm+iNRvE+el4qUxqnO1J2rwKzZJSSwx6KgjJiEpeywI5aXeADPY7lLxRgz/guaMGJKNdWmx0zW7tJScIxNSm6NpVdq8IQzbEbmD679cDujOmbA8lcY2zJtLIN9E084ThTM9jpl+2ZdN7kiYehSo0127aWrt03dTd5wGZOaFzWDVsF3517+e86pRTuG1EPMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7uJvRs73O1LCH6ffHaqYlcgfpbgp1YqDkVmkSirdh0=;
 b=LIi9vc/EW2DQ9jzqon+avufmh7uQDBexE2hdUMMpFLVM+/BAWPQtLN+ZkuYNDlT6+9IElWjVOuFr8+l4xr561Q+X6uRBjsGtC4uXo4V7v2FZZ/gnbL8mL5Mv/Mg2Vw8Ih4DMunKdRDDGFB3zrwJ1u42D3/29Ex/yrs9LKcPKNDEDoA9kPtBSroWd368VdtUfrTzx07WuUMfJuih1jF1DX/7J4AvsJnew/UJcRHbwKTZyCiUXOjat7Wp6EruPOsUgOtQ7bpbvetoGU/tD/Wa/0X6vHoRnwIvuJeSEPrAcvqneVnPINnSZ0YPdZiAQkM3F+3BZfSvJh0aKUVKYgLSM4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7uJvRs73O1LCH6ffHaqYlcgfpbgp1YqDkVmkSirdh0=;
 b=pce33DYmykVtU8Vo4REXQKC3NIHjvCbEBrxmry3VryQzrXr1m+BBDxeGf/YAi4pyE/i+qw0SxE1U0S+tUM3inYTFfkpEgNsEBBu6rnxzkYktQ2lreuYL/y1pNCO0A3GeCGx1HKK3YZf0bPcY+u9HCesrnFfDzlkqakRZSQkdiHM6RBs+2HdSjLEAguYIIS6MGG5pSEgRnKPLNCVmYUgW3dbw3YIrUoCqzN9EPHexwfpNPeE0+s0ii2TEXutvqv0Ed9FwfcKNh/oRXsi6J1ythJcvH3ddFPxJ96nwlPzej7x/7LrZrOjAx0sJE+6ksKvk+0uzUZh5KbPPLZcA85i4BA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by BESPR04MB035703.eurprd04.prod.outlook.com (2603:10a6:b10:118::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:23:41 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 03:23:41 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 16 Nov 2026 11:28:21 +0800
Subject: [PATCH v5 03/11] media: imx8-isi: Support mbus_code filtering in
 format enumeration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-isi_imx952-v5-3-46de1d24efd4@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794799700; l=3196;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=/HbW2WA304XaDjnsDAvJQkRlAEIlLtCEhVGAsq1r+RA=;
 b=LEK/XvLWDLygk8AL/HQO2OCXXBGdwef3srb9K7lxSdFz0BmHPPkz2WdQv6TS9OEPEntguz0gk
 bW9XKB6pLfuBsnuVR56ReIElqYYpnsYbc4NPy5iDlB7Cz3zKHnNBaLH
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To DB8PR04MB6667.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 8d2681fe-2ed1-4014-c48c-08df43910358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|921020|10067099003|11063799006|56012099006|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yi47hSa4PiTUCPczy7ygzHqWzGh85e80BlCcaXypzyeF10IfgIjtFXi+sGf9dhwAJbqymXWk8QgA7jSa4I24qDwMenJU+p3n0je+RGcsCFXq6Lu9A8xEG+aZgFG3pwWpURbrtbsD3iHZaMN9mCYlxQKZoTuu7wKL7PUnKceNsT/b0i9F57I+F2TtRmp7mcBUUyBl5UK5OSzu9DBpD2roKB5MqIYHHlmxtxb8JnMgijPNNfUwOHjmyAWineGCjF42+YOI1st9wDzt6ENDPU7WHT3k7Pdaayfkika7HhvHvhtmOYyt1pz/AbdIAGLeJzveeGIMLjbBbPkzIbhMb6G6w1bNoyo8wUIAb7GWAUWlUyTYl8tOK3p0DrM48Rkb4M8I2OwDmBlQevOfqA+4pJzJ9GipCcInaA6Ls2+mtJZ2+PrqlSYIsukmY2CyP0LdVYiAjpGwoTSAgLbF64Nt8Tf/OmD3Zx4zPuXs+4hXv+t3/G0KzeylwAzscmnXxfHmjxQB0tT5Jp6osGwwtPLCQ0tO/EvZxY0kXpBhoV5LitHUdmF8HZnPTAAbQV9OfbEnLX8DfMDVLeJ2FrMk8PCSV6L7as38XkslT90prZcvsX10qnCoguHNzKNUZ4od+3HRQAHJGwQcK8kxCNHEVSZn74fN9ABRi4/KaX+zAx5Jj8lYgZQnnAL3BnFj5leyOYrNYPFnymwEhJhZbep/tL5eaOYcwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(921020)(10067099003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1BaeFRTb2RBRml2dHdvem9uM0htVWVsclhqYUpBelEvQkFrbDBCZGMvbXB6?=
 =?utf-8?B?UFBUd0pTU1hCMG9iS1VhY0ZoK21UVHVYZXFUVm9kSUowem9pVDdtZk4xVlo4?=
 =?utf-8?B?WUczbFl2U0tvMzJZVk5RYlFXVWNkalExVElkUlI1MHNZVG9OZThWbGxidmZy?=
 =?utf-8?B?Z01NRW9VQTBvV3gyV2JTcVZtRmJiSElxUStGcWF6eWJaNmYvWlJzVHlHWWFn?=
 =?utf-8?B?RmR4MkZ3N3ArYWt0aXo1WUtFYXgwUmpvUlNzRGJXUVpKTGtpU3N5czhFYWZV?=
 =?utf-8?B?RHAxeW82MGg0RHBlcWlnSmxnelFTcVI1Mk11V2VBZWNHMXhDTzd5ZEs3a0w0?=
 =?utf-8?B?dGdCYWk1MkYvdkFSck5WN1VmMmVFU1FpWFpQcWJudzJveE4ycVJrWUFoUEl1?=
 =?utf-8?B?dU1ROUM0akUwbUxEL0RaVE80TGpmbms2ZTJsUC9XblZFZEI2a3E5bHR4MUl3?=
 =?utf-8?B?eldhMm51Y2JnMGZidVE2UGRCNlRJQVo1VWhVTGIwUVJRVlFpdUZmaEtmWW5N?=
 =?utf-8?B?K2tQeFQvRm53cVhvT0gyVnhMUWRUNlFSUnJiUTdZT2dVZEdYVkFobDcyUSsw?=
 =?utf-8?B?cFJMNEJpS0dZWGRpNTZpeVVndXVMTUV5UEtwRFA5TlpsdldBTktFelFmd2tZ?=
 =?utf-8?B?Vk05K3hWZ0hRb05FbFNieEY2cGV6ZWhXNE1TNFg4dW5NNDlFQ2MwRXRoSG44?=
 =?utf-8?B?TVRwT2d2TFNhYXp3bDEwNktVYzlYSUFTOURzUEIvVHlEVG52cUFYbGFWUHhn?=
 =?utf-8?B?YjZjUkp1eGxQMkFlL1RCdXJ4L05mZnRSbFBrUTBtMnZaeDlYWEMyWHZ3ejlQ?=
 =?utf-8?B?V1BQL0RCK1ZqN0FpeWRyVWpBb0dmN1VSOHFpZDA5akVvb2pwdHFCMHNlSTNB?=
 =?utf-8?B?MFhSZE1zUEFkenQ0cmNtM1hTeUFTeXJ4QlBac3BZa2gvSmt3UURRUmQvSElk?=
 =?utf-8?B?OGIvUUl0MDdjSU1FY0lBUlFPSVpTb2RNbk5hSEJxU0VrVGJEaWtzazVoUGYw?=
 =?utf-8?B?VnRkb29yWXZlNGlQQlVjdFBrUk9sam5YTEgvb1ovNnBvZjFTYndjQ0VVUVpI?=
 =?utf-8?B?dXdIQ0Jia1JJaGE2OVZwUTA3R051Wi91NzdxWmZQNEFXbHBSMC9hS05LdUlU?=
 =?utf-8?B?ODVpZVpLb3QrblZtbmprNndERkkzSDNNaXFjcDg5S2VTMEVWOXFVYjZMYVJL?=
 =?utf-8?B?UmN5UGVOZVVlZ2cvZjVXRXFxaC9SSTUyZ1phcG1CdUh5TXhVUDZHNzFaZUdh?=
 =?utf-8?B?NTdPSWkyMkp1UndrMnJXU3ROcVI0U05FNmJrdlJ5ODB3emNRVkxJZVlhVi80?=
 =?utf-8?B?bWVOOFU0K3FlRHA1cGZOdXNGYjJBQ05sRW9vK3dta0szZWtDMGltb2hEYTFI?=
 =?utf-8?B?ZWY3QUpsanpRaW9OamMwelhlSTBkT24yODRXV1VxRE9ieDc5U00wRUJEY3Jp?=
 =?utf-8?B?R1JvOXNZbUhlU1dEYzdScFl5UkF2am1JSG9qWVIxd3FMUHV1cUovcngyTmJH?=
 =?utf-8?B?d3RSM3pZQzZPUjJ4WkpGSU9HVkg0Nlp3R2RkSmJsakxsRFRYYWJGUGFFbGxp?=
 =?utf-8?B?elRwVnFzbnM4UVo4UGVSaWxMTVhVaUdkMjdJc0ViTWJ2WCtqZFhVMjJRNE12?=
 =?utf-8?B?SVdNU3pJK2htb21Sdy9kYVhnWDFtTGVHWlBraTZzZU4ycmZTdzJQVFRSV1dM?=
 =?utf-8?B?NjhlOVF3M0tkMDZmQk5EY1h6V2tCT090d2Z3RExiQmFCUzNsYTJsQThaeFFW?=
 =?utf-8?B?cXJxaWUxeERMSTd3QkRpWi9PWFk2QTN6T1g0bmdXd0VRNTRDaVZkaTdLb0x3?=
 =?utf-8?B?VEtQWGJTQTc3Nng0cThpTWRva2E2MWtGQVdPNlBMM25lUkdNYTgwNWhTMkdn?=
 =?utf-8?B?MTdNc05wdlJYZ0l1cmFUVVdwaURuNGRSK1lYb3J0S1NxMTFwbXErWm84aGtZ?=
 =?utf-8?B?YU0ydS9lWm9WRGV6UEd0aUxMa2V2RTJ4UHBWRXR3M2szN3ZYVlZCNjVjbGRm?=
 =?utf-8?B?OWNQNHFZNGNXWThiNjVPdkxQeE1yVk1VYm9BaXo4bHJ1eDZBK3lZZjRRQWFV?=
 =?utf-8?B?eWljK2xPakZ5WGJLbFE3Y01ZT0UyMjlleHc5VStheFQ3Q1p3WW8wcms1Tlg2?=
 =?utf-8?B?Y3N0cUpNK1JtV2NBL0NFTEthYlNlZjlMVVZhZWRkVllPTENFblVOa1c4RkxS?=
 =?utf-8?B?NFUxVVZia29aazhBUFVOL0Q5bHdSUjk1bElxZnlWdGhuRHdMSURKbGZLN1Uy?=
 =?utf-8?B?K3B3QUZNc2haeEUzN2tsNDU3VUZhditwOGVPZnFmMWlsQnhRN1JnRFFJN2dI?=
 =?utf-8?B?dVBIT05vOGFMLzR1OGg4YVAzR0ZPbk5UL3RTQ1pLTm53c2N3WXpiL1BaS1RG?=
 =?utf-8?Q?HLgPl//P+lvzDQEwprIs110hNlfWVvnCxdjq+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2681fe-2ed1-4014-c48c-08df43910358
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 03:23:41.8562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bc/WmxXoy8OGaK5nvOHipy+cmCnY4cMsE9kGFUgdG2VUQM7kQSt5HHim5XkSD6lfQdM5BKAoOksyeyZzNAs1YML9IcYv0sDJUOgjd+tg+lA3NdBz12Imwu/ijabJ49Lo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB035703

Extend mxc_isi_format_enum() to accept a v4l2_fmtdesc pointer instead
of a plain index, allowing callers to filter formats by mbus_code.

This is a preparatory change for capture format enumeration. No
functional change is introduced by this patch. For the M2M device,
mbus_code is always cleared by the V4L2 framework for devices without
V4L2_CAP_IO_MC (v4l2-ioctl.c), so format enumeration remains unchanged.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v5:
- Clarify that this preparatory patch introduces no functional change (Laurent).

Changes in v4:
- New patch
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h  | 2 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c   | 2 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 6 +++++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 58b47335afc7..a30633a7e2e9 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -322,7 +322,7 @@ mxc_isi_bus_format_by_index(unsigned int index, unsigned int pad);
 const struct mxc_isi_format_info *
 mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type);
 const struct mxc_isi_format_info *
-mxc_isi_format_enum(unsigned int index, enum mxc_isi_video_type type);
+mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type);
 const struct mxc_isi_format_info *
 mxc_isi_format_try(struct mxc_isi_pipe *pipe, struct v4l2_pix_format_mplane *pix,
 		   enum mxc_isi_video_type type);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index b729eecad0fe..1178947bb548 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -492,7 +492,7 @@ static int mxc_isi_m2m_enum_fmt_vid(struct file *file, void *fh,
 		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
 	const struct mxc_isi_format_info *info;
 
-	info = mxc_isi_format_enum(f->index, type);
+	info = mxc_isi_format_enum(f, type);
 	if (!info)
 		return -EINVAL;
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index fc907d357149..a904cd2739ea 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -482,13 +482,17 @@ mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type)
 }
 
 const struct mxc_isi_format_info *
-mxc_isi_format_enum(unsigned int index, enum mxc_isi_video_type type)
+mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
 {
+	unsigned int index = f->index;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
 		const struct mxc_isi_format_info *fmt = &mxc_isi_formats[i];
 
+		if (f->mbus_code && fmt->mbus_code != f->mbus_code)
+			continue;
+
 		if (!(fmt->type & type))
 			continue;
 

-- 
2.34.1

