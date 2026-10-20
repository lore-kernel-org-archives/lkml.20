Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792523217;
	b=LqRzqtd9WnYRaSczPlvb0pAOLTIOExwaWCovvgfe1VHlq0CZLqEH25lOW/IyP3AtPDTt
	 YtyIZY7Asp7S3xn2R8QDtaFUPIsujdyktyAvlJU4InHS8Kj70J3VdFSk/RTZfGclBIPoB
	 qc8I0I7dLRiAwJKiAI8bI3pRLKvW9jyeO6NQ18AiCuMBTswQw/vozNoq8foonp9IJC4cS
	 BFF3AkDLje+hQPd2ecUg9KB9z06x/DZHPwg5DFTYVQJeW4g7RmouBfDEH+EpJt2f33YEh
	 ywwYTpBlss+HctRaLVOxTQ0NhYe4t3K1R5EBUqJqgMNuikzzsxrfZG6Oho7hGf/yzhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523217;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=3dwlDWgDfAiLTXh+k8Q772fX9Z37o8W3UZlBwnGE/e8=;
	b=fHpq6eEbWm1f3h/dfZYNGBj5pi/C5qxV7FUm4w1/5RDh7hmj1HEhP73jEb/e6977/H1o
	 jGODcwJBZc1JHHjGGqBjuD3zlXU8ndNuoD+Xb+WgIBwhMPSfGY5iqDqIMDfVq/BodEay2
	 mhYS9sq3GOuazGNCEPtV70hNhglw6Of1SOkRo2nPolbVmoWZMBU7IBzcbmu8u4Ta/3THP
	 oW2K84mCPaLtoEaCqlTTnK7FW0FLGoV0+BoHd+QTC6iSfNViV9dUUtKdU7JFCvMYRqYUb
	 a/vtP3Du/lEB97IjfzcswuHp3NkKYyiEGMoV6pCT+GvDkAC+/ut6wGaedZmwauLgImg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HvMZ4+DE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.0
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49978606A32E;
	Tue, 20 Oct 2026 19:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49978606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HvMZ4+DE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPBYboB40WFteNL0mvuTEcyEFWHxQzBe5gkFoOOuU8M18/Y84jnt1HUHi4H/ChZuafys53EiP7Ei0PDS6RZAuogiOQqw9kaji1nv5xhyDvVGtV8aA9Ewko081dx/RYGj/yZf7d7VBRJHnUfT6Y/Xh3wyllBsolCtNnC1heV7HIGmN1OeUje+VKQbEDwklZc6iHYYEWbtNQmmyjwbNGlHlwGpUPa1uujCIdbIvnGwz4/4YzQrP/gdNqHJmJ6UMrbGtg/Ijia58K9nRDl1aoJXnWmk5PFeo8AIMZhCNZd/U4KBcVfgMR827/vLNfJpI9dYAljw6wLJpvAPhwCNmWeJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dwlDWgDfAiLTXh+k8Q772fX9Z37o8W3UZlBwnGE/e8=;
 b=xFmKoInbEdTC0/YW57ilB4sXJBuvSuUFMNTzz/3+u1UtbyzWOUcHL1guIV1ImPCAf2WHxfNAXiuDjBdRPtu7L/fv1CzOj4TYCSdayBl75XdXFYy8UQrz63mvmnVIEjmoYbUMWbwN11EEft3W+dbokNLlb5K3nhCYpNeRY9UG8YK5gHoA8kgFJ5nUgTt+YZEIuWTovCeYgmqMgrNm9tEtC2A//tFVzx2lYKCvpjq4xI8dyP8JGcPruKngpyI2e64cao2httDZ9Bz77iuhJ2qF/w2ofVPhbOnAl0ATPU3VAwL59k/qV7rmCg1/jDpQxwvf4RC+XKoZpioHUTbTGGP6Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dwlDWgDfAiLTXh+k8Q772fX9Z37o8W3UZlBwnGE/e8=;
 b=HvMZ4+DEUvwv0mjGHhU2sU5hJrM+OlKP0+4PTkwpJ3c8cT3t3c44UgOw1vrnWnCct587PxpEGNZH98uh3gFZzQykvbcJ7oGYnbA2F/jvL1JWavX/ASE/XwVyQE6SktYj5XSJb3nK5nISt1h6pvM/VW1icvxyWEB3zyYW29R+JC1ioLSVKWlFdozUZwVKU1uM6LFd/S3D4Ze89CTVsXmS4N0lb4eeHSvY7nFc6KqEBmHIrGwUO/jravJt4mWzOYNBthG8bKK+lcdnSRMNfKOaGMKPvxW6S2jmrn+vzCAWPBdl3on2u+R8sYvdGpd1RFtsyL4yydBlKSuUBWyUhlZpGQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAWPR04MB9808.eurprd04.prod.outlook.com (2603:10a6:102:383::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 19:06:53 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 19:06:51 +0000
Date: Tue, 20 Oct 2026 14:06:42 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 0/5] LVDS support for TQMa8Xx
Message-ID: <ate7wryKqtokw_c7@SMW015318>
References: <20261019080621.194103-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019080621.194103-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: DS7PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:5:3af::23) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAWPR04MB9808:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b3ca5e-ad11-4729-2358-08df2edd4c8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|366016|376014|7416014|22082099003|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	72FiJgACjG7Hn5gOojhwm2BXchuhFGH5SzLfMSTMnkgowM469BC4DAFW1LqmfNGZ93KrBhdOnny489XyJInSFabkNlPea904fUe57aOwTObMzNPWRAS8WzGx8P5WWZD5k4x3XVgNlCDpuRqhM8yULq3LJTiLsqRFQhKMD8WceuBb4NzyAd5nmzYgZxHzwoaPlXKCwAnY6BpK2hP/f02ue4uDqeT1rwiS+pDVZZVGJSdRQ4+onhPupnIRJgxRmrVobniQKNtRBn5lU6tm4Kfgm78lsAZXtD4Jceknq4oFNo0a5zlRJPbZlSGCau/EJDkSS3ZxG2ZQ8/QUeywdH1y/kwqXVnStcF00flZ3rnkAvuH0W2KWepfj6IPYWJQrKZO2DoXQeaz9wGYKgVL6Tfv/ugKTo+lV6/qNpdSwEkEFUnJsXt3ABtqRR4rQ00xzdbYYWlnLbXg8ExGc2fJHKP4E5P3I6tkwUt3dHvu6ZETZcO0NXQc62ixW6gLTlaFpXchzR7TsBUBshKupmef1f2dV6sx29PK9llu4Gl1U7wM+Fh9K9ILX1Jt1xbImiRG+yCvA3Ch1vO34j/agUd+6xOE9n92U2yQ94GNqy8E9+Alq750Y5xmGAHGcmBTeLKbTRtfI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(366016)(376014)(7416014)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KCyfrPD5S+KLqFFp/dyUuruYbSxCM3FtYvTSyJBlIXoFhCsw21OeAZkHbdST?=
 =?us-ascii?Q?fPa97RhmfIhCyYVSMml2ZX3yuaSFNZSeItrfpO0YcktRIMC4OBPBLLDMFR3W?=
 =?us-ascii?Q?SJ5gIufhPm3bzR/3KNJfNWbg2YxCu6aY4W1+qaGtTFKHjIRmDzQW6ZIM+Nom?=
 =?us-ascii?Q?I/jGl4fhVAa/yUeRd+4VNqnd0ghU5uq3jZRP5K3R6T0sdDRqT8CMiTJ5neBD?=
 =?us-ascii?Q?fKUANqqAF6zmuIb3gu2pv417erpZhOmCzEyW62oeehxaAlmEjNzLPD8SKRLV?=
 =?us-ascii?Q?EOGr5bgLO/keY59Iq3i9AeqpXMoq8nB0xiSnQQ7f4dvxstVISbQFdw4voQrI?=
 =?us-ascii?Q?1ch/TEaVnva41AwA0639UwbG53gbuy4a06b8Nbw0Ja7ujMcQWEfQQHXN3GdT?=
 =?us-ascii?Q?Kd77pfypnN//UtdUVzNB+4QMptygFcV+upPp6TrMiETTYjR9QPw7ERn+TqxU?=
 =?us-ascii?Q?yt/41Uc6XOS0kAp8yMtbHO++Ps7GP0EgqdUda6tUU6p3uyTw8P9vsB/LuKaf?=
 =?us-ascii?Q?fIXET07d601Z+2oKwtN7I88cg76pJHEPfFfV5m0Y3tUuRYlDTxxBS+7V+CBy?=
 =?us-ascii?Q?HrE8D7dzmggB8hhVvr5lvT4z+i48y5/sRQcWQJ+a6NQWZAcz1eyUQqKiLfQ1?=
 =?us-ascii?Q?fSh39M9ehjj1zuTFSiRrawwMWZfJ3VmvvtW/5KVj+L/JdC68HDthXGIy/HP3?=
 =?us-ascii?Q?I8rplmJLTRGsWTPG5zK1Ggk7C4VLkaauHeiUQ9gSIZ5Ga0Ae+vlLMfVexDQp?=
 =?us-ascii?Q?hfcx+zgdfizVgMzdlTcqJfi0dcFhy0rDu60VitPggOK7UzSBIIKjne6UUPe/?=
 =?us-ascii?Q?lwdH0XLE9ylyWPQaglEs5g38EXGier+wUCEVknvlylc8GjLJdERTAl4lO7/n?=
 =?us-ascii?Q?QJ8iJkCIhrNlcfABLz863gcbQbU5nK55EuLpXZJgrfAPyYwzYrPwkZL/Tcqx?=
 =?us-ascii?Q?D0DUaditGOA2IcCqFc5yi4dBsgZ1kHTC4K9lThWLWDlXZB7HAer+d1xrP8xn?=
 =?us-ascii?Q?97vQnIWHnDP9zfDQv42MVplyHd5wYBxnP1pHW8GgcyjCNNhfzce0rP3Z/CQE?=
 =?us-ascii?Q?KFWeA8qXWvK+M4yqqkwQHQtBieKMnmS3Cs8i2FnRQbaiO+qYJqbjHFFSIcvp?=
 =?us-ascii?Q?AxamErzF9ChyWK/oBJxThYLLBIxoaBkWKwH3FjKxHq5tFsqiiMxmSg4gyFiy?=
 =?us-ascii?Q?ePDoFx0z9bh4x6S8cD6gZmOWUIXLAdGBXQ5rfqDtZ/AFaxtiP18sPFClZzLC?=
 =?us-ascii?Q?ojaDT8Y8ZJA5NN4R0eskJCBS0SGDU0/ToNMB4powJnsLdsJG3HQjzIZX8z+E?=
 =?us-ascii?Q?YaR7wOUb7iZySMkemKUhGyAu4r+cnDXkrFejcgOQmsBHZXZkYTbcnOZ7ogvR?=
 =?us-ascii?Q?Vzi4cLnS6cWyrYGyMvki1Yvz/ZrhNP2X9xpnm1tUKQR1LBREJQ6XA4cXVrAU?=
 =?us-ascii?Q?UCiAh66ZwVuGxNSWUoQoUX/tInOdb0Tz8E0gbHzZIKEwlfAMiYo2dFy/ks9j?=
 =?us-ascii?Q?/qQ8yIGiGyQpj7QJs821Hur2yNnls44PUz/eotsqreRu1LCQuisLxWCDCUc3?=
 =?us-ascii?Q?OOXtWwF/uVvA3wic9DBHlypfWzUU46qkDBtmcOQ5GTQ9sl5Untj/8sEcR0rz?=
 =?us-ascii?Q?E/RlozSCL7v0Fm/sb8gyXnRz5B4hJroBrzLGd5m1l5c95MgDYhgcMiulvHge?=
 =?us-ascii?Q?3WEcGEs3ki3JsNPJGHvK5VOsmv1g2BBp5/g+mnZ19I7oUvO0YBM5iAP5OF2I?=
 =?us-ascii?Q?Hyqp1kTF81a0uyflkD0mYhvBx/38yHuK1YMU+rlS2PKpuSfq4A1N?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b3ca5e-ad11-4729-2358-08df2edd4c8c
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 19:06:51.8904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBwmy2xvUFYqQW9Sl0MmtcEujDnYcB4l0BlATV71XY2pB7OAEHoHTGgKCe7ND8PwwEKpWzULTKOFC01dvQNpae5241mnJYiJQbjTVMkAXyZGTUxCwchc+lzy2TA0i7sa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9808

On Mon, Oct 19, 2026 at 10:06:15AM +0200, Alexander Stein wrote:
> Hi,
>
> this series adds the LVDS support for TQMa8Xx on MBa8Xx. It is based on
> next-20261016.
>
> Patch 1 is based on v9 series from Liu Ying [1] but uses patternProperties
> instead.
>
> The patches 2 & 3 are from an earlier v9 series from Liu Ying [1], with a
> smallmodification in patch 3 (changes mentioned there).
>
> Patches 4 and 5 add the overlay for LVDS support.
>
> Thanks to Liu for providing the DT patches earlier on.
>
> Changes in v3 include fixes to Sashiko findings. The changelog is in
> the individual patches.

Liu ying want to include prefetch engine at v2's feedback

https://lore.kernel.org/imx/20261014071657.118378-1-alexander.stein@ew.tq-group.com/T/#mdb12507457cc4a9e024a90015c7ab711703e91f2

Frank
