Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792699086;
	b=GO3ikuiFU4ssB3Z4vf7482so1Bvsd6s8H8PiXNj6/FxTbxEYzzvtQp7UitRd+0fhLO39
	 TuyzItzKpdyjWJugpg4yWU8fZByrYgwfwZmyMHtHghG0XLLUS4THEa27wGk9Zo/qD8JvN
	 fwB1CgllUy6XP6EbYc4ii5ZXKNQg6RCDSe9EieVWXHnSmGffffp1ZQO+PnKvYCr85GLuV
	 IuiD1S1XD0EtToxcXMU8wNd573FNXmIdUCT+ycGshHO6J4OYvKIaVyv/JbrOk/i7Hquzr
	 auGOP5Cig49JMn+HZRkVugDeTDJ468ygqrLFszpy5G+HgOnWF60ezG2uSPWjaBpqWoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699086;
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
	bh=4oKrObT4dg5MjaPFDRRKANsk4vrisCJ5HcM9AAZtbBA=;
	b=yuGtTbFyewT/eyPfs7JD8BU96tWHDyTYx9LsPlD0jWQXB/om12wHdwsROR6lw+t06z9+
	 +sQHvhO8bTOZRP3XqUPDA6uWdev40SJP0jEzq5LzoVtYGnHIB7RT45cc0Qs0Fdi8NhnL1
	 0Z0qHAwLG9Si0BTi/fLYePC9zalLYpVHOdyLa6IYV+Y0VGn4rgeATR0gPqaHNmWf97TKS
	 OTtVQKWNjpUoI9KDwXjDqq4SNgfm43wQ912GOoA5D6/tFGcZrI7yDCYayPXLReMVwtcK6
	 UF3Or355GDSRYu/d+dEaK7tq9cdeFWi+KAn4WVgeX3vpI1DdDsiRDlPADvbAmE+npFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Qpkn38cg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.28
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010028.outbound.protection.outlook.com [52.101.69.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AA5606A31F;
	Thu, 22 Oct 2026 19:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36AA5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Qpkn38cg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYlvIyG8jkbF37U9MXIPh7CEwP9l482PJSxs5wMEs/l+vnxLVhdJJJ8F10Rslj9KQye7ZMDTAWQ31Un+rIETofG2Cf8NEkJvHkSgKLJU7gWs9FmP4cEhclci2RT65aWvWiJMSu3X4JAMtvQSj9oxpJj1uddtTQV+YKNjK9wR1dyvHNXLo+FNUfTbDOe049B9gU0OGEptG8f3xXPCj+VCjBRBIs/XuCHI0zUQmxVPJOzE2Pu8uvFFls1ZO8itfiyNY36dsmmaoo6u95QfqCxweZ2pICPfrGFQUrk8jbUk7jdlxJc2rT7g+JfBKwpW705vkuoAPvBOv8xPi+C94pcCVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oKrObT4dg5MjaPFDRRKANsk4vrisCJ5HcM9AAZtbBA=;
 b=X40tppE6gqpL58mf/DNdz+J6UURXbaX+lFjTWQ3K2EM53mLIxf8yGfZXa/HzCb26493A9U/1ovhaAOFgfPcR51zH6RJr8NuK9D2fOwlwzOkH5hZKsdFmLzMJ3nNeNjowoRLyo8UuCFpm0mAmTC0R1hea4hG6Gbgspuuf+SXp/m8VB3lHnfIosU60AnlGlvfQUDzAjEq5Jl00gqDuLNB0EtqmihS0MrjBnRQ4G3PlpVA3oW/M7H2+5gVaWtzqTmbOcUBtwmTzoSgjx7HzEyfTFinZy+SRo01dGeCBpluehSELmpq6EHURS7bqRVM6S2jy8vpaggusqxlDqUcPvTIt1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4oKrObT4dg5MjaPFDRRKANsk4vrisCJ5HcM9AAZtbBA=;
 b=Qpkn38cgqr2Y+wKANVHqz8hnqKrRiZeg0emvYVghbuovpTNtTcqKnZKnKGk6xwaekySRYe8GQmFWV1ryRKd/J+aDvcM8kxO03BhyQw50RpTwxPJvk866V1xqHpFoiGRPdQ3s88irrZMHLajoG+D+AhwbKawMwb2N7tVtnhtmAaHG4pr5UW4+x8B5jmVA/qcVwnEngHBZ2f1OIdTxONJIRny6LPQs+0qfLLWDU8pDAMiliki1WILaxxlVxBRnyNtnaWPJJoe+jla73oPzdOI3azRgjsY+BgG1jJleFVYPRTVQRNoA1S/rLJrrJ+Mp9+Ne2xLFi6Hpcso7IBrIV7uk3Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS1PR04MB9699.eurprd04.prod.outlook.com (2603:10a6:20b:482::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 19:58:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 19:58:02 +0000
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
Subject: Re: [PATCH v1 0/3] arm64: dts: freescale: imx95-toradex: fix vdev buffer reserved memory node name
Date: Thu, 22 Oct 2026 15:57:54 -0400
Message-ID: <179269903686.1276702.32511351112816245.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002103757.70065-1-francesco@dolcini.it>
References: <20261002103757.70065-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS1PR04MB9699:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d126a9-cc59-4c56-ede0-08df3076c784
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|7416014|1800799024|18002099003|10067099003|261021121427099003|22082099003|11063799006|261009221227099003|261009221727099003|261009223327099003|56012099006|261009223027099003|261009220027099003;
X-Microsoft-Antispam-Message-Info:
	sugkaHC1R4dVY1GUbOqbTbPvhPGA69O300C7xjjohLXRIeWgR0sYRCYCKIRELYdQyl7yeE1skKDJ8CcpFalUenQ54jFggpaM6kweyHEoH+yBq3gDIDSxlUEHRag8zifLek+TBdwvaskBoj82nvqgC0mHlTitMzNLcBHo2+EemZRXKCMxZpTmIXMs0TWCqcVg/SDcsj5j/XPzrwbxeESYSBM0J44dqWtRAhkZzJbvqjNhBlQSLi9QAiI7vN0L2FeFkP4+3HyzoK8Sy/XLQMtrLfJleZZUp8s9FyB5ONJ7xHnCBafxbkF7YTlEmP13U2P9H9XDKm1NFrFkjRlUF62umDqSlV5/O3VNrsSO5uZNtbtwwl0zxxgAx6qPG4Q5aXj3dAe9X1hRK/jv7+shJlrJFWDOq5o8kSsKooqhOCUfIieku9QJrn9DVlY7j/R2Itm9GcYJMGDGQoNEB8l3oa4EqiQRVx2HrBu3mTujApu47gtg8DRxmWS3GuRCeh+qLMeU43tTNcf2Ogk4ZxeP/KppWXOA8vsLGzwYLqGXDvANg3DaC9AEcbN7nYF69uDsttMICgF8+klNCsBshuHPR2L09JFNVVmptt7jzpIKnywII7s3BMJvxWWV6i/upyWRC7SOwzu6HWg+CjExXtVj1gD4/C1avZiutBHW86HuSg1WUh0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(10067099003)(261021121427099003)(22082099003)(11063799006)(261009221227099003)(261009221727099003)(261009223327099003)(56012099006)(261009223027099003)(261009220027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0pvNm4rcGZVTHZ0MFRRUjRyNkRXa1lDdG9TbFVlTXUxUkU0ZG40UUN2ODYy?=
 =?utf-8?B?ZUNsQk5rM1JKMjYzbU04cEl4RHFrYzJodFNyU1YrNm9tTXAzM054OG1zNmhw?=
 =?utf-8?B?SGd0bHhOZThFTG8zdFVVeFlnNEdiTzJlaEJLRkFqaDVXR1A0KzRDVTdid1V0?=
 =?utf-8?B?dWpzaytDclh0QURKUk9GZjlxZ2htOFlHOXNmWlZqOGNVV1NIVGJKR3FkSHpv?=
 =?utf-8?B?anlncDBRQ1VtOUpFcm0waXlYbjIvMVA5REpMeUE4UzdQdkd1MzJFTzNSRktm?=
 =?utf-8?B?R0UwMVdDanRCaEpyTVZGUnh0MkdvcmI0eEVnMnVKdnJ2bTVtTnErK2IxUk95?=
 =?utf-8?B?SkJCTnN6dEE2N2RoS0ZoSTNLZ29keWNRd3VUQU53M0ZTb3VPbWYyeXZlU0JT?=
 =?utf-8?B?NmN4aEJOUmdvZFFIUGJob1pXczkvNkNwdUVaM0Y5ay9xOW4xMDlnWXZ6bTBt?=
 =?utf-8?B?QlB1K0gzT3BKcEo2RHdFL2ZDZUZaRERuMDA2WkhKVVdQVW54VDc4WGk2TWlP?=
 =?utf-8?B?ZGQxOWlPNU4yR1BqMlI3VmhZVkJIQWd1YXVvWnRpQk5Rd2RFUWUwdXRqNlV0?=
 =?utf-8?B?aHh2cEtVR0pjYllaSTVLWWNQdW5IRERGb3BQYUwzMFdCdndTdmNvY21FV0d5?=
 =?utf-8?B?amJpdlJXVlFtTndRZHJFRWNiV3NvZ1RuWkphNWtZdXJRcWh1eXN2Nmxxdk0x?=
 =?utf-8?B?RGp0dllCbDgra3lncnhMSlFuaGROWTVFWGlKSmJCY0NPV216Sis5K21OcXht?=
 =?utf-8?B?S2thellmby8yUnZvSUU4WXNXN2p5SVh3QU9xc1htYU9UclNmd010K1NZTW9o?=
 =?utf-8?B?aXcreEVFc1pjaEVnWngxZ1R2UUpVWi9KZjZQMzEvdDNvelhhZGlxb3lHZU90?=
 =?utf-8?B?MTNJQUwrWFVEOEM5VWNHaHFJZ2pqY2dSTVRPajhZdy80S3BzNWFkT0NJYmE2?=
 =?utf-8?B?Z3pXZkxVa3Z1Zm5ZZjFETkNpeWFGRWJGOG1GYWYyY09iamNaRjZqeklRL2xn?=
 =?utf-8?B?R25DT3E3M2RyTTh5WTJyd0ZtTGNyTEtiWUkwOEJuR1dINmZZcDhGSk5ZSFB3?=
 =?utf-8?B?WmIwYm5Fc2kxckJrcG82NFVhWnhDc0FJWVNyYml6Qk5ZWlkxdXpCRHZrWEw1?=
 =?utf-8?B?NGxJa1FGTzZqZ3cwTEFNaGgvaURXYkNzZVRNakFvTmxacXZ4V2tIaldySXNX?=
 =?utf-8?B?MDMwSUs0UnRjN045L093TThGZVVkQk5wa2h6YnhNNE1rWTYwVEFjRjJlRlhi?=
 =?utf-8?B?N2ZyTnBUTVBDZjd1ZS9ONWlRazE0MFIyYUlsSGdZYUM4WmZQaDBRSnB3aVVU?=
 =?utf-8?B?Sm1iOVJoWGUwK2VOVXFmbTN0UVAzWDRTVG5NUVhWeDhJRWIwOW0vcDJrNFNx?=
 =?utf-8?B?S1dWM3IxbHVNYUI1cnRYL0tYa3VLdEJETzRwemhzWXNFaS9FbTZMZTJXdEM4?=
 =?utf-8?B?SXRERmpZc2gzK0ZZUm9HMC9lbnd6UHVyTWdhMjkrOS9yOHdPS2w4alptdzc1?=
 =?utf-8?B?Z2VpYzdvVXpkT2gvVjdJRkNnYTZjcVIwd1VKZ2JQcGhjU1hFOXFOOGpLMHVq?=
 =?utf-8?B?Y3B4WmRtak9Rcnk4cndvMndCc1lJcytNRXlBbi8yZ1l6cjVhcFFnUFlLSWNO?=
 =?utf-8?B?WWFOSHg5K3FONGJpZEFUT1RPTmVZVWZTVVlKTmFaVy9YM2w1NVZJaWtJZ1Bt?=
 =?utf-8?B?Qm9JU2VzMmVNek1ERG1kNGtaZEdzSUdKb1lkdzdtMXFEeDhmcEladjF4T0Q4?=
 =?utf-8?B?MTRBMFdkK0h5K05rRGJuVTRvUFQ3TUd3UGJWOFZOcEgxdGpZejh4WGEwdkVw?=
 =?utf-8?B?QzQ1YWlseWxIcnNnVURNU1I4bE9UaElFR1FnVWNWNXBUNkZ1NUlkTE0wdlV5?=
 =?utf-8?B?WnFLWU9LS2dVaFpjR3pUY0kzdUoxQWxRRmJYMCtGeG1POHgwM2VkSjZKamlC?=
 =?utf-8?B?KzNVc1BSMWNCL3NvQWMzbzJLbjhiVEhpcHhGY2lCcnVGOG10bnFrOUNGUDhF?=
 =?utf-8?B?azIrc1pTcTdiSXRIeHFvMzcrRncwaXhhUVgrS1BYd2dsTHU2YnI2UXlzZWVp?=
 =?utf-8?B?RHlFVGlJdWFsRGJoNGdDaUlyYVpxMDNiWFUzb0tjTFFZRHdZc0p2cjRIdnVv?=
 =?utf-8?B?K1V1RU03TW14NVhIYmFiSkhSSFhCdXpkWFIyYnYzV2VsQi92RDhlcFhPQ3gy?=
 =?utf-8?B?ckJXWE50Nk5GTGNOd0VhdFRwc3FhWURFOWZmNHpzODR5RCtBcWVJb3JQbURB?=
 =?utf-8?B?NXdFQ05IZmtXTFVDcG1vREM5bk9LNHY3QjZVam9Lb2NNTWxTaFNYdGR1NFRh?=
 =?utf-8?B?Q3FtSTZCa2IxQkFoWjd2b3l4V2MxL1ZSTnVlNHRHZUR0TWtBV2prZkh0T1Iv?=
 =?utf-8?Q?VZZZioykPsDOyFDMEjWPf27ToqAUKoIGJgc9I?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d126a9-cc59-4c56-ede0-08df3076c784
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:58:02.2382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iIapsFeqR8wPPUQJWf10FYLO0KfiARdP0hDN0hbFxyVAdmIACNsPutPrqQAVd4Wl10llag2UKKQ7GpGRQIMp+SZu9q+C+cIJ+GOMClPQz+M29pBTpFAMi26wkXYyrv43
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9699

From: Frank Li <Frank.Li@nxp.com>


On Fri, 02 Oct 2026 12:37:53 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> The imx_rproc driver uses node names to identify reserved memory regions.
> It checks for "vdev0buffer" to skip mapping and "vdev" prefix to filter
> vdev regions.
>
> Rename the reserved memory nodes to use the expected names so the driver
> can correctly identify and handle each region.
>
> [...]

Applied to imx/dt64-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/3] arm64: dts: freescale: imx95-verdin: fix vdev buffer reserved memory node name
      commit: 429806a56097ecc82409e8658d6bc43c37ead1dc
[2/3] arm64: dts: freescale: imx95-toradex-smarc: fix vdev buffer reserved memory node name
      commit: b1067e3e920f068d035b37fba8201739dfc3340c
[3/3] arm64: dts: freescale: imx95-aquila: fix vdev buffer reserved memory node name
      commit: 49b64740fa4c8af94d929b69371ac10ad2f113f7

Best regards,
--
Frank Li <Frank.Li@nxp.com>
