Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013029.outbound.protection.outlook.com [40.107.159.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A614437F315;
	Thu, 24 Sep 2026 14:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259616; cv=fail; b=WXRoWJ0wzAAS533U5wzA0vqY0tEY08alYEF1GHkoXasX35VfoID/w6i/8S4kmQ0TNVq5NrsACUTgX9zApJvSc9Lf/psKLrchFNS1GfwFI+/6Q1JS2y1l68X+WYTS4lAUljsrRMfih23KuwR91rnJ9EaXUA/MF7It1Jsb9zbbqwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259616; c=relaxed/simple;
	bh=4TwaLy9D3KjGiXXZ6WC2wxXnFQDL8yYoisf5nZgCw+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tI2FisyPWEYE6cCXq2w7DNQLVRFL19cVT1A3MCfo331NVPi3zBvoBAo3X8SmfG6ANvzg3bviNCmFU1vtL7FaE7zXNPFupyTSkvO6y1N3YshWAlyY2iP+vr47NE5XMPhoUpnsfIAmzBGzs6Vg7NsNoC+M/OdcI+PDCgN42sEO3O0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oZJTvpW9; arc=fail smtp.client-ip=40.107.159.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oZJTvpW9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAwMWyaLB064dmgP010inJPIbO1DQtBIA8kPZIpO3m+nNFbceKDA4eO/tXZ2cvAHGCKycgpD3fXYjvyH8BUh2LVdhzzuVS9yWFEzKCTClrgj9IH/vdh9Q5HyPCob2lg1zBc68gXf72Rz5YPIleTdfpBUHda2YdjqONxI0i6lLkwPrg2yCIagdpSWpz9uQGSZXlOK0zo7LM1EJ4IuHQv6sF8EX3HTYwcPN0WXEKVJfmNefgNtw36QHZijpZWgr4+nDEXT+/ehy2ZL6m18pTys4s8dtHHE3wKdkq73wsT9KsHBr1M0B1p1+bEh7Jeoc+mrGVBFG2QVsZXxJH/RKrcpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pJHQs1U0YvgAycUyy7C4gMYdKpEuhTjgvchaA4KM1I=;
 b=YvMZpJiDul8D1fgUcq2YoD9g+e/tfXsIe6dIDFruBNHHFzQOXf2Zsd5EEojyOG3iYs48sYevz4SzRlh3BlwRY8ukFR+L1N+hgQm8OugHw92oH48wXbI7FHj17gkLuNsbk194UhV6UbCiKN/ooJYhjltOtr699vKGPKpw8MAlj8BHLczfY8UNyzN10BWJ/9KFmHqfglC9g1VAap0er1wY/CeBf+7QTPDgA4IEPHmQNj3K/1aV0awvo8RrzkbyVqkRpY4xjw5inFy70I8YQRclfYMTTwySNQm83SQBrYGnSlXFoob2kqUGqWtjZFfn9ZZkwzAoxQvmG3gY74gktDAFcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pJHQs1U0YvgAycUyy7C4gMYdKpEuhTjgvchaA4KM1I=;
 b=oZJTvpW96qcsy7bJZZVc0pOBPqK5jKjJQ5b7OwWR88stDyxNwmntOXG0XWlUMRzqcc+HTRGldS6wQgPsDU3pJ/1vX4yP7Q06otHkFjzzLYx8opD5LOSkmmeaS39HUJcoodhF4qI/Nc5xm522ork7N5FnKT80IraW5YiaueEeppVxjSMwJC8Y8lo5wbon8ChRNGrqE7tOnXyLxI+hs2mkhF/rOHgs9WgvV2lPGYZJTLrBczK6q+O8UsDWiGouO5aFIsfQUcQrLDOf6VWxzup0uJNV1qg6ZlOXT7Lno0cDwCfHnQlJCvZNAwteHrYMcnaPkZgGOTz5zn6ImX6Xr4m1lg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB6775.eurprd04.prod.outlook.com (2603:10a6:20b:102::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Thu, 24 Sep
 2026 14:20:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 14:20:06 +0000
Date: Thu, 24 Sep 2026 09:19:56 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v3 2/3] media: dt-bindings: media: nxp, imx8mq-vpu:
 Remove nxp,imx8mq-vpu
Message-ID: <arUxjHjr99jGBmzj@SMW015318>
References: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
 <20260924130453.196299-3-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924130453.196299-3-benjamin.gaignard@collabora.com>
X-ClientProxiedBy: PH5P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: b306a56b-9f97-4884-49d5-08df1a46ee31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|7416014|19092799006|10067099003|56012099006|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	jsYZulL+bcJ5tbqWtEKTeS+K3t60W7k84Rn6HjdkdcFgNlUeWKAQGPPVc/k+tiKYhOvgdoca4FO8b0+W+LripsHJl90/W9LA9mlQbInj4Gj3W3LhjNpE6D5traQ+4ydCq280ikqLIJNgEiKn5b1LFmaxDeUt1xCnjWaMdpXTC4gmK8p1GKcjZsDmcSJD/bYQr4wJfJDsMcCWFYmjmZuyMsaiUika3D68OxFCh1XeW1Q2rpqptSSOqIZOI9WVsP8p/z6T1iD7DhIakLgRbhi7s6cwHT1NL1g5cDCYE6JSWDdV/+R3p6/nzu1kkApfn4TgQaRjma62rToxkL3z6KESZO+H0+q3ONbYSLQngXJAeeN5DG+Vi9mU+MUuPEf26QtMZxe4+xbSZy5fqqZh4qxEvBynlI56wux0vrFKGQzr20txSOZRJaNwA+bXHDSd+n+plzx3rEi50c6AArL3jXuDDZ/Pm6wCmpSSdTNAGAFJXZNKgJEerKaeQUGh2q2Vpn3wAEJ8Vdj7M+qcRRZB2X3/omX1EuHpOkmVyKykREACRyupzaCB5BlWQOf5hM7aWWauyfHt7Ma0C8ERiV01MrhnW+CGo+q8GdRb+CH/28UTA37T591yJ/9FtEMoILe0dGl1S/9WOYd60ypxCt9qq2W/ieZGFPpDkUGmX0KYChhlHr8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(7416014)(19092799006)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NSbJ/qOmYMFJ+vIQSj2n3UvfdYzTV7tSIRMeSQrnuxtLIalUqPSKeRiRTdO+?=
 =?us-ascii?Q?KIcvPv/M9FOEYX2OvFrbAk1N5a8s/fxB9DHKcWOpLpbLmV4o7oyvizhJZAZs?=
 =?us-ascii?Q?HAc6mMkl4ZjRtdcDXjMLu1eAvQefcVbrUiZ4AqVlUxGmdLf4GzIBwGTon9j+?=
 =?us-ascii?Q?PsNHbGRwlk/hQJJnTBZ9Ncx+VWt3WoM7XDvinqL5SVk0LSLoFTqaUFAjGMpf?=
 =?us-ascii?Q?VUg+W+h9ZojWZkl9kbssyuG71zXgGcxLRzU6vSWMGrIQg9FrIP03rt3IhWM4?=
 =?us-ascii?Q?34AYkLk6iZlYxkLA/qp6klbXuQNy8QM6Apkbe+99LXKNrPB8/Y54LhPYL1H7?=
 =?us-ascii?Q?B8YfYB0XiT11oZ3wsWA7Ce4p1r8fC9JnvAZl5OqcMbX66/QMd/sgGckMdEsB?=
 =?us-ascii?Q?70eYK99Eg3aYjztIZnXplbfxFgDVwLgIogzGNzE/NiEiwbanEGZPHV60HVHC?=
 =?us-ascii?Q?HVsteeQ9a1hYQMok6JaFu5kQ4PbsLYwwdyu2SoEMOkRjEbMPCFYSkl86qFdS?=
 =?us-ascii?Q?8VgobTMvovANe4tM1LjuyeF8Gh7ftHH9q5GJFDjZfNnpZA9BkBS6b+bawSEa?=
 =?us-ascii?Q?QqBqjkVYY6sucMV2pchspOgfW8wh15a5oIg1eTghpwJDECpChTJpvgda/LNA?=
 =?us-ascii?Q?ovjDHYGQ6wAlBtqsaS/d1S5DXQNR9MJwITx85OnRL4zt6nTz9tMxkHjC9Ohs?=
 =?us-ascii?Q?bjEw6NElSM4g1OiA9fzwMqtoFL1kmq5Jrxj4XbzXYVIZACvFFDQbWDupEcho?=
 =?us-ascii?Q?JO6EeJE8EtVYgmM/J0r5SXAxHugM3knOIQFYR8bhWeqCL0Nbsv4L88ykMcl5?=
 =?us-ascii?Q?Nlitybmy701r7Zf6VmDC+SKZdi6ZmunPeNbda7ZsoajNS7uQ+YpGVFWuDoP8?=
 =?us-ascii?Q?9YuNqsmEnQh9QLlgnKWyEBPhdpw7x+RCQW9Y57VAiiteqhl3lVHrq8NiH/VK?=
 =?us-ascii?Q?I73Y1ob76odnwsysZ4U2QKUheANr+2t7MKpzrxPeXEM1JLf0A6W4IeP9fBCR?=
 =?us-ascii?Q?q68IkECnBKvyo7Kjmxd4Zn875pYd4QakrKqmx6Lxq9GrCaglFhNBEGOKDgoo?=
 =?us-ascii?Q?SP3FxEU+ttpEcySdNbAe/j1XpRn2cDauve2LF86JMsC0O/vhgna/jQSKbu9C?=
 =?us-ascii?Q?98gyvXrO+dZ27lnvfZ/Mea+PPP1Zl/5KOL4zZ0PRN1hz+DqFWuP+2XDa9Vhe?=
 =?us-ascii?Q?EQLKGYPtcBPwppuWt72qVVBpnzJuWTLGYCP2LCC1cQxddcWsQpq7h4aYa5Gg?=
 =?us-ascii?Q?+4JRX8IqKRFtky+rovEecO1U4jlMpWhAkNHJZ5eUrgY1AUZxellrMyND/UFo?=
 =?us-ascii?Q?eNjyGrFlpd1EhmYINreXo01Rdn+WLR+I228Bdndl8ymeuiW1cVYfBbYLVb/u?=
 =?us-ascii?Q?L1UI5UihNgQOB6Sh/R7x2Phk1/19l5z2heHTaRYnx1hD7lNMWpuuqGR55xFh?=
 =?us-ascii?Q?dRooNXqGBn1+P1tlrvPcc9O9GYepev8GM2OzZo+uLtBYDG4FcZ6AkG+lvr8A?=
 =?us-ascii?Q?/T8HZVIsOhR6qVFwkwmH20afV2TvHGlwyI6Um14fPhzpPOd+Uj1xks62nifY?=
 =?us-ascii?Q?KLX2zbow1/vH0RUiCUwSLqCeDZ9cX5cHImv5osc9efpJ/icrowmzL2PV7BhX?=
 =?us-ascii?Q?nqy/Ib6pNc4WeO5zAYYgejP/+F6OPZvlwHvvbq2knoZkPR4NLll2HMyJ8+x8?=
 =?us-ascii?Q?sKy12alSnajzTapPYl24lP9Xb7oneDtRO0IL86hrM0DszUT9xRDsp9R4O6z/?=
 =?us-ascii?Q?i0hK0k6nqxYnSx95vzCUTQbUbLB789yI9q3l6agHEvkm36dVRdty?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b306a56b-9f97-4884-49d5-08df1a46ee31
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:20:06.0069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7BKvAMJVeWo5W78QPHoAxSNmwLJ9pZw3+sOvGBeU4amTZCBD4n/tdCVLY6sx//u4LmNOo2HxYRvwKWGPshk823bmjbkJPjxGdNs9dbHifRoQ/wMa8C0AlMlPaWGQQF3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6775

On Thu, Sep 24, 2026 at 03:04:52PM +0200, Benjamin Gaignard wrote:
> nxp,imx8mq-vpu has been tagged has deprecated since a while.
> After driver clean up it is time to remove it.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml      | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> index 19528262810a..69619d2c86fa 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> @@ -14,12 +14,10 @@ description:
>
>  properties:
>    compatible:
> -    oneOf:
> -      - const: nxp,imx8mq-vpu
> -        deprecated: true
> -      - const: nxp,imx8mq-vpu-g1
> -      - const: nxp,imx8mq-vpu-g2
> -      - const: nxp,imx8mm-vpu-g1
> +    enum:
> +      - nxp,imx8mq-vpu-g1
> +      - nxp,imx8mq-vpu-g2
> +      - nxp,imx8mm-vpu-g1
>
>    reg:
>      maxItems: 1
> --
> 2.53.0
>
>
