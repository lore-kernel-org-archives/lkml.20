Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792698273;
	b=a/wwS1CONCTJay+Qt4P9IDxme6nyljCFeYE1GdfFZYCOzTm0q33UygcgznxQMEI39Y/p
	 XN/3AF4dNuPS5dqseOId1HfV2q6sZdJ7PHEiO7VF7uzSuQLiCul3nvuTEmJUZ+tyvpDdU
	 NuNFAEWEYuKuz9larX6h+LLDbMW3gJiQtKxn4Il9Uo+XtNDvum74qfqo0ZDFilqKxa2Yc
	 yD8YE0ZKxoOnIt6DWTK69cAGiI6NydLY+GD7WQBmUkoNazbFu0AUDiZc7Y9xxLJZL9Y0k
	 9MXAUq7+EWmDwaFRT66g8RjoTy2pwmBZrwZhzMvaabAgGQsia273LcLVbuQzKCDdh/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698273;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=nwpjFnv6b1l2qrkWcMkqr20+ehW8Sd02i5TNHUjwcvA=;
	b=DISH7sdTzfPDnmu7VndFJFvwpsWuEeJp+0wDf2DRFrAuxj612/LheF7ZV7mpqi+2VA3U
	 qDZIcCiuYbr8K7Z9gXrIThj0pfYQbvyVOQQs3NoxOsM3S/VCc+WVcb/BYuoPqOLlC32tz
	 djz8zj7hPNjtl830pO8Lizk1NONmhli2rkp9FkxTrUPT/PCO+Zl7ZFCJEGjxakfEO3l+h
	 xtGDSOEu2Wwu4JBOMPJKi6lxirMJzbKBvSIhAg1ChvRqlvxhg1wFEN0iPNxlXHc7WsbFE
	 homP6qKn/9mEOZObLBrKzVmI6j4eojP1rQwn/cYZETBRzA1IoyH6+8QD1j86KeSbKnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=q4KQlN8X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.6
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACC6606A31B;
	Thu, 22 Oct 2026 19:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DACC6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=q4KQlN8X
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWrHzjHwbwXxGQUMG+iBBegWpNzI0mq5VLeMRiYGvC1jQHRf7tPsVuF9pTvjk8ehFaUoVq/hzYinF3nXRfItwIj1qzsFJBBXz1B3ah7Z0saa2ARYRHIa+BzAT8NicWBZzuduWDe7oL+QrEQb/zA0eeWJwsAOPBr9gbQctSMKnAXswd8rzWzksSau75x/Hjb/8sDXn0zqfvga3FhFEV7eqHk7uUjmjPUh8PvDvCxbMXukyj7zo6PUGT0qmVGChPg3UPQ5TjHg6l1jKSIPYboGbUtDg9zN1GSNRTePSSM+dukLFlhhvJLtbn4FftnKwbaWX0sz6Zkjv9lpXaAUxCrSVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwpjFnv6b1l2qrkWcMkqr20+ehW8Sd02i5TNHUjwcvA=;
 b=Zh5yc9b6ORDz3TvUkOdMqhiVmwPEbD86a7pOY4m00KqgCpp30FKRyeNmSQIaaCMvvUT3kiE/H0Z98GAdrOoOc6FtLasYYtPuNmTSADEURcdsN6UEqVPBq/kB+V5bDARe5duc73a0bL1HTItq5qRVOosDkdo4z+nBO5J9kJqC2kXe5UECOLmhEo8G5cYygjlvCjUZ23jLVPCrVaLcu9JaC+NNw45S2krLXq9t2tbIfyNyZgApiLQsc26Jqee2+Eu8v6OrlQMsYIyQ7ga7HQBkHnhPirwvfJ2j2mfe0Uf/O2IBpWsY5kq4Ge9QGFpK4cIDVdf8V6FoA4huRNpgfYMPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwpjFnv6b1l2qrkWcMkqr20+ehW8Sd02i5TNHUjwcvA=;
 b=q4KQlN8XVnuSl3xpUUYryLaxHpPq6OYWtS48FyHsCGfh5TKZ9ntl0pHVtGhxOTclyLewRrEViqVF6iPJNnGF8SAGesLGFnyA035sl7eu4iceHDiVGZfqA7Q3S/R5AZgpLSJYIDKyBD1n6YirZWThRFOdGbXsXTEeJQOuW6AgFSuEAulYqwbZKjoTt9kMRXiVrz8Rsu44Q2DpNw902rYTubl2BlSWy0PaIz1EY0cU3RJ5e+Nu25dFx2f5ei4NJbaq3hH01FdirkgXCG0vK3IJTJHR7BliAQZfzZlvIiApPPAYquF4N83W5I3K/T0gruCt339i5tToeBVhd2R0GrLo4g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMDPR04MB11651.eurprd04.prod.outlook.com (2603:10a6:20b:71c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Thu, 22 Oct
 2026 19:44:29 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 19:44:29 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] ARM: dts: imx: enable SPI on Apalis iMX6 and Colibri iMX7
Date: Thu, 22 Oct 2026 15:44:21 -0400
Message-ID: <179269819274.1261785.1048583515170191615.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155401.2584935-1-francesco@dolcini.it>
References: <20261001155401.2584935-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0085.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMDPR04MB11651:EE_
X-MS-Office365-Filtering-Correlation-Id: 031aa6eb-9a4e-4e39-3e3b-08df3074e344
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|22082099003|18002099003|11063799006|56012099006|10067099003|261009223027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	f5Dkpji8kH7A7qSWAvZz/0QZj+fJ/xqJtxqd0672AoNGi4R4MPQmL8WOM7tZ4WhWzq3JjLrBxOI21YGYPZGeGlqMZ6Sh28nXl+FmVQdG9kmmKpBBQvwol7rJ4iS6pVGo7QQ9wb7M+T0PXYL3LMap/8cFsQfqeW2Gka9qflQImpVsh7/0hF875CUlz5Zl18W3XUt8KaF9CJoQtrrt9PgD0VLNzVB0f3kp7j1NxGXSkhIdAY4CxDTrQ5ylgLxLHct9th32bvegxdpFhy4lEwlGLAzYMm2pxz3p/FfE6prQQrQ0lKB0H79IwETy9cmY5a3qIyLlLWV2VxLxi8qVbwfU4Vci27tWH7xpFqIJ76fliu8+Pqf6b5f2SODlqb3HukBc/CXRRmaV2iNtKXzyO5kGn6EOd8MX6POABGoh1gzFM8GffabdFqpJvtgxuieXYc4tVpdW6rcWesV0gNE6DFYYGKtyxxiLZlJrySTmTa+/oXXjezHTxn0ZxLX8CWKKfgqNe4dFeGlwWYTkSW28fOhLmA84cgkNlx1eTos3z5A5lbyBl9K+oh/gixWtreM52rH6G5HL4jh6dgriPrX0nv1BpGv0I69UzTgHm+xhxMMYf/Y3pKbdof/uAvJW4S9X22hUJJJxm3VaQ4ozrsiMm9WXwqYXFCFHweeTSJs/vP5twbA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzQvbU1IbHN2UTh5azVPbkcvOGYzY0dIa0ZXdjhYdnVjVVNTREFxZTRvTUsy?=
 =?utf-8?B?L1luQUwrVmNFb0tKQzZzZVZDYkJtd0M0THdlMGFxTHJJRmNOblpGWmdJSGlL?=
 =?utf-8?B?MEJYVG5iQ0pCNllUcTVOMHRHdTF2Smx1VjE1aVExNk9JRm9aSjU1T0k3Ti9G?=
 =?utf-8?B?Y0p4S2lFLzVUUHFkNkcxZ09aQ1pQUGdZekZRMDh2RW1pUkNBQlNDY3cwZnhC?=
 =?utf-8?B?WkFRelpXTGY2dmZQRU5jNmhZbFFqRS9NT0JYeXdNay9Vc2daYk4yZTJncUQw?=
 =?utf-8?B?U1NlWDE5Z2x4eTJkejhUdDllMHAxYlp1cUtKeitQNENhUWs5MkpBS3c2c3Nq?=
 =?utf-8?B?UXBtRmJwV1VhQlNzRTFXemQ4dU9FZitDVDJQOVltRFlaTi9JWXZZaWQ1dk9z?=
 =?utf-8?B?K01lRUtOeklTdjNSQ1RHeEg5NFd1czZXVjFMSjh1TEVIdWNzTW1ocjQ2USta?=
 =?utf-8?B?WHNPaE1kR2xvdXJvZTlLRWYwOFNROU9uU1dpaThuQjNsSUs0K0lQL1dxRXRi?=
 =?utf-8?B?aTFJelR0U0RreE5WZkpsT0R0blJvbDdhRTVReENKZ3BEK3k5VmdPbmVKYWZR?=
 =?utf-8?B?d0NkMzlUYktOdkNkRUNMcStFSzI1VUhIdVAxbm50aGtkTVF2SU5hZFBBbWE1?=
 =?utf-8?B?RVpYcnJMRE9OY1F2aUdJY01KVWg3TDZueVlEd3JRYnpmN0g1b2cvYUI4WjZw?=
 =?utf-8?B?NjluV0ptZ2x3c2ZuaVdXcUN3SWFpbFFENVYrb1N6aW9FK3pNQVlWM2ZMMGhz?=
 =?utf-8?B?VGMrMC9BUExRaklsY0I4eXl4eWM1RUgzVXBEVVZLTjBaNTcyc0hsWmtZUDBC?=
 =?utf-8?B?Tkovb09GR3lwbW02OUJNRW5EUy9jTDBuS3krU055QTlPNUUrZHBKVHNuYm0x?=
 =?utf-8?B?NE5McERBMzhadWJEZFFXTW1YQitWWVVodUs0M3d4NmNQMXZnY2Q3TjB0bmVU?=
 =?utf-8?B?bW4rbllPWks4ZHNxOW44TlAycXBEa3dUeDJrbURUT3Bsd0NsY3JKelMyQ3VH?=
 =?utf-8?B?cldZRUdaa2EwQStZT2Z6anJMcEpaUkpGVDdyMFBPdGxoU21kOStXdUFGQk5Z?=
 =?utf-8?B?ZmF4QTR0eFYvMXhrOHdLUTlQb1NKc3V1eW5MSnIvVUxjNWlLNUdZdzB4dWx2?=
 =?utf-8?B?a2dHMVNrSGVabVdVZW9MYnZuZW5FYzhldjUrQllMOTdHQzIwMTBRMWZ4SGtw?=
 =?utf-8?B?TUVMWHpQRWpSa3dUT1pxQ2RrZ21Ca1piVDhWZ0tCT3BBKzdOMHlieXJ6MHR3?=
 =?utf-8?B?NFdxbkZiZHo1bVg4RzMxMCtlbXNaT29QT2VtVWdIT3AzU3V5UnU0Yzhwb1JT?=
 =?utf-8?B?UjFEVXRpL1RldWRuTlhWQ256OWNJZFhHWXV0d2R2NkNQUndTaStodmtuYmhL?=
 =?utf-8?B?VmtOYmpvVURlbFRtRzQ3YXdRL1k2RTFiLy9kODlRbENyUHpWNE9WNy85elJ1?=
 =?utf-8?B?anBXY2hTWThCUkZNL0NIYzZQNkhmb1luY09TTTdvMWFrTGFBdzFTNVZ2MkZT?=
 =?utf-8?B?NkJYTkxPWTJzK2p4d0EzVnZLUFpIUTBBajFmWUFjUThrdzhSMUVIYlA5aEEv?=
 =?utf-8?B?ZmNaWmg2dkl5ZlhrR0lURGlWNCtYeEVDN3RlMjB2TXNtb2tPNzhINU9EWUt3?=
 =?utf-8?B?dDBSMjdxZENtb3M1djRnQzg3dlA1OGFrcFhuK1hYS2ZYRjYwZ3QxV1lLZnhm?=
 =?utf-8?B?b1J1bGpzQnJrZnpkNkg2NWc4a2U2ZGxOaXIwYTBIUmZtQVZPSlBHenNueElo?=
 =?utf-8?B?VFZTdzA0S0RMM3pCYkdkYjVzUjJWSEUvUThxZmorUFlVMnM3K3M5SEwrSzhz?=
 =?utf-8?B?NDlocDJydytPSVRWSElUNVIwb2J6MjVzTEIxeEtQa0V0K21uZHNmbVQ4N1Ns?=
 =?utf-8?B?ckpuQkFsdHFrbTJNU1JCclNSZE4wR0Nvb1lqdi9LTnhiSUVRbVZYRFV6dFRI?=
 =?utf-8?B?Z003cmN5MzBtelZvY2pZd0d1Ukg1Q0JOSWF3SUZpc08xTHgrME1wVm0xZHFT?=
 =?utf-8?B?a1VkUTlPYThMWkhOZlFqVkJkN09SYnlqWUJ3ek9KWTl1QUsvSjJZb2NESzdO?=
 =?utf-8?B?b3BXWDRTSFZrcXZHK0Y0UFZKZUxJeTBtdVl4VjVtNDBtdk81SC9vTnVBYlBt?=
 =?utf-8?B?Yk5MQnlvMmhoWm01azZTTzlXTFhaZk1vZUZsdWVpaS9TSXRJNkxiNUdzQXJu?=
 =?utf-8?B?aHFSTGwydkdnMExuYkhNakptcDFlMG5nc0xyazR0MWZEaHJVTW9rNlMwNUZW?=
 =?utf-8?B?OGhKWFppNVVIQnJVYVhtcVl3QnBJaHBkSEpyVmJTTHNmcVdtdkdYazMxWUls?=
 =?utf-8?B?UVhsNXZNYm80MkFNVFFoYm9EMGt0c015WVdXUGYzTTBZTHRLZDlMSUphYWNq?=
 =?utf-8?Q?7N+o1BPnSjjmpE22R8E4yYL1cA+k2hKAT+h91?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031aa6eb-9a4e-4e39-3e3b-08df3074e344
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:44:29.7960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dXfsk3vw/HQuOPVT0NoU/sEHcTz5f2+hktc7AgFlP8uyD0CBYH9GSFr8ptCkDbMW8GKXADYP3rGMjnOCAFYTLVgH6aPWoO7bE1CrlTO8BMgI/G70++45h85vB0hbdya
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11651

From: Frank Li <Frank.Li@nxp.com>


On Thu, 01 Oct 2026 17:53:57 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> The SPI controllers of the Apalis iMX6 and Colibri iMX6ULL modules are
> disabled in the module device tree and no carrier board enabled them.
>
> A device can be instantiated from user space through the spi_master
> new_device sysfs interface, so enable the controllers on the carrier
> boards where the signals reach a user accessible connector.
> The Colibri iMX6 and iMX7 carrier boards and the Apalis iMX8 ones
> already do this.
>
> [...]

Applied to imx/dt-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/2] ARM: dts: imx6q-apalis: enable SPI1 and SPI2
      commit: 119f908dae670028f5198e3b662489297393851e
[2/2] ARM: dts: imx6ull-colibri-iris: enable SPI
      commit: 180afbab4babacbc4d9f6100722170470a0ff9ee

Best regards,
--
Frank Li <Frank.Li@nxp.com>
