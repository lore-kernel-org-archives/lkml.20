Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013067.outbound.protection.outlook.com [52.101.72.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2A8441616;
	Wed, 26 Aug 2026 16:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760267; cv=fail; b=oHX24h3ZwdytI0DILxcG4k27wHlg+fFQi890SdA5Aw3L5p0fFeHLv+DebEzRni8XL1AZ1bPuiGv1XMWJA3p91IsD4k2Bjy3Ck1N8n4a7u3qTISjpl04jIHX0DEv+PZaIJeuWfhCyE+nkCBlJ2M0R5bt4WDPRX0WykqfFjkkH4CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760267; c=relaxed/simple;
	bh=Qm9cT+MWnxnwPhnnVbVcBHRzRH0DYVtIp6cRAk/GwCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T8l9XZ77LQaj66q0G1Apn797JTJrNuPP5IX4mlgJn0HlzVWSdouvymzWjPmJdxbXy9dl1BGV3vrmzGmFBkXeW4uZjHGNChjJt8U4D8mCSPWxLsyC6BM/tODtle/LZfF6rN1pvpE9CZz+It9App24Mjibqo5QJkpXtuS0+1KWTD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fmzf+CUy; arc=fail smtp.client-ip=52.101.72.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fmzf+CUy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJ8Mq7WOL81w8VexjxkUcPKjMZsziagcDNsrmhUbc8kR+0r4zvgGwrUbTcibBSf1CVHzUOHWKbRKXBt3FDQccqplZ+ppdKbo5CzFOSPgKzpCllgG1qo7M8H+EcpSBynINyO6yZ9oqT2Jjx8EIx7PdunTZXudXSc7OUd7COZKwzrPJScGoGLXACuwTqPKNMufIoy4rjSjCv2se2JzXGYlBZey9IkKHSM6l6yVd5CEZd2XXOUoIYX8Ps5LFgaWlspA/3/SQlKD0qjLCwm1KI8wVqeCT4qUsx/Z8qs09pcVwwXbz/90c0l4INl8XKrF/kCAjd69+/sI1kyeYH23Q8xbng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kK30/FhmyqI9B87j3ydEWH1NZDIEDFYxvRLPX54rWNI=;
 b=aiY7gfXCV/ng9gGXtYcnqg6jq9GB42QJ9WFhYqbNcwRzXR79PBgaOk1UZIvIvgK6Lz3X4vOaJAC9mLZ4v8pwv77CxAPyErRr/89jJFW5QZW5V3vt23F48idVUS4Wgu1hfjY/p4Mha/qJPzQUW7tv4ZwnmDTo01qWO0lqkW4cOWfMmfgCYdX9959lxqNdTU8bJRlisM55VlKZiXKWSUoS+6iioSx8C/61DjgA0Cu5dKYRaX6BMbGSp4bnDHhkdXV1egQF4rLVHNSCxhtIvDTJSDZO4678W0t9I0teYqF2CAKHh3r+TFjpCZIjzt5EcOLmEILqW1R6RnVZoZkPkSVQaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kK30/FhmyqI9B87j3ydEWH1NZDIEDFYxvRLPX54rWNI=;
 b=fmzf+CUypjxBYgiKrfjTJbyvXcGPQdPBRJoQUcKFF2MlKWTAqXZknEilVR5GfJIV+ZAY5tYeW0V+Pd0ntGEBWtXD5DJa//IX7x5PIZ9ZKJqij6QZDpt2zjS6RSJh2qCgi6LO403DoxvrvYcUjzPVcSgq97J2vET/i5lZblrRzfp6wKJ3iWG012BM1GuyZGM+J1dbQuafHQBE/NCgf0jsF//Q4aSybb4PHumYf+3BvNUmPaavHUZIW7WI8YFmmVpOzi6izp/8VSJWNRsP6qmQyN20Bvz+YGPMZfeBzw5AIN3FELZIOqP1sN5gUzKhbfqXk/L+1u672UVawV1MiEL/aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB11032.eurprd04.prod.outlook.com (2603:10a6:10:58a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 16:04:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Wed, 26 Aug 2026
 16:04:06 +0000
Date: Wed, 26 Aug 2026 11:03:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] media: imx8-isi: Use per-platform format_mask for
 output format field
Message-ID: <ao8ObWRVHf5nlHq0@SMW015318>
References: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
 <20260826-isi_imx952-v1-2-cbfaaa3f0000@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-isi_imx952-v1-2-cbfaaa3f0000@oss.nxp.com>
X-ClientProxiedBy: SA0PR11CA0196.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB11032:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c5d092-98d3-44f0-ae4b-08df038ba7e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|19092799006|23010399003|3023799007|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Q6SmxCxo/lmAdpCqAuztvFVeQm9ZxVhqRvldFOhyAarOHq8Edz8UJJ6pKaB9OLNdLBRSztIQsd1H/0H8BGpHqSR6sfMFtDjKrzzGKdq6/LETIT/pUjwr0X62wRejGTJNhhyaXeqP1r26I9XybH7HwlwiygQqJhpeFZL3//H3AH1cIcTl6HCyeY/xkCZ2swlAE4XyThVm7SPvfOnsHea8e7O6ZlsXVK8yt2E8q1ojJrnxpy9tafnUXqg+LPz68oZGJy/rpqOdOOq+9Cu5a0AdpftISCp8ndbqiAMz0qp8QEjY/wXvwB1QWzoSa4PXackrFh8PfYvlvjRS57UgHcu+SORdYOoy3DiwQa6kJdHRM3hSx6jh3bOZEm3z+QYPlyuFjSFqjCUeCyyifLf+UCUJbSthAggfejuxUgP+6gO91uKU4gsbsl2Iv+6wv0LpCXpuSr+BLFeYCdYHMIhwFahuc4l5/wHUwkTwxwkjSKq/KYN9Aq+RnwF1hnvFq4PRUO3SwzSP9sn7WIKtVjYqlahwR/NI9U58YQJZGqf6u/OjU+qA2DVEuXF/58uQWjyYZcwrS7BSqYbD+E0fncX7wq0CMsWMFJ6c6qgm8R/pzIpDSTvTT9XLydRFJpwrZ1GgoJERCnRpT8fxtxQ8C9YhSd5NHmtBvOpdnRUkvP4INCou2/c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006)(23010399003)(3023799007)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ple8718sDgnUraW+qvbZy7+v086roVmzXb6OiDWkLV+ZjR39P2HS1pvyEFWg?=
 =?us-ascii?Q?SIG5gHQ+c1VXObPl8vIZCAunP2MJjbykbAkB8gSsMhgWUsktggw27RqOjDa5?=
 =?us-ascii?Q?hx5ZNMDduWOHTRB5GG4WqS5H8c+7fdI7lU0je8uhyi02oemq4a9YzdBo5tbh?=
 =?us-ascii?Q?f+1ltmbhlgg8NdEXWgcE73WmewJ4xnIxIeGUXIUJiAOKi3x9Zd68ROIDWyMv?=
 =?us-ascii?Q?MesIsn6rrGwBT7Qca9fLQkFC/gYnGYBK201jydAs1U2QHYSu5X06aBVkXd+4?=
 =?us-ascii?Q?KvABSf2gCayFRQYRm+ffAh7UfahZScjaJGJNeE8LW9felif0hSOn47grv34V?=
 =?us-ascii?Q?CG7Q8p34Wrbv4vXLSA4R04CErPyTvKi+8WqFVyWRJwNihi2/ZUoZ1nr9AkGX?=
 =?us-ascii?Q?+ULxo/RwBCvnNpWKM8tC9HWxSFrBG0i34T/RvZdJAOy0qXWbP6I0CxDcO1xv?=
 =?us-ascii?Q?6NQbSW6KP5qkYGB+19cwzOgTbSgcOSSAKm6JE88bWGKAnQgQhwbpiYywWiDg?=
 =?us-ascii?Q?b2BYaz/Ko0drlJYn69p0EOW5p8dRGl3icuR3+LRWgvmQ1xIj09yaC+8KpPsj?=
 =?us-ascii?Q?NPl1jwoOa9PWsqVXAsfOXZugt/7c1QnlFXJe4OiWMxS1gytLbY8q0Z0LKqmG?=
 =?us-ascii?Q?2tNF0Byt4NEgjz6I3PKOJmpO4un9V2fcNTUQpfSxeiiUDhYKzAkx4q4MR133?=
 =?us-ascii?Q?1Q1zZhsx0Q9DIxILxZwzz8FS1JCyyM7lwKA+YVRew6BEeCoSVfKJ1CY6oFYd?=
 =?us-ascii?Q?UxrnuNkBPMUl7HdVOw9ZATUrDXMQfqbzj7fGRzdm7aMeMj005TAGS2tUmw7d?=
 =?us-ascii?Q?CL0D2rYUO1+zsdftWZDvap39q8SzvKIOx89/EWADycnZm4WHyGrDlA9FBfxG?=
 =?us-ascii?Q?nGuLrFQSVwdOwB3ua/E2NJeeL06HUjnobi8mRd7NO08XQ25LcMbbqwdAPpfF?=
 =?us-ascii?Q?usnV9NbU1THGqSgfROwQ4CqflcNzmNNllewFzAgSQyHDSuIZVfGkqf/SW/wK?=
 =?us-ascii?Q?Gy5M1ALg7sbdNthwMecedGahSoo5oV10fvubP74ztH3h2I0mFUdNgu/XqMZd?=
 =?us-ascii?Q?ALW88KUhvizs2v9SqdBOT3mQ0cng+Xv9kXsR6R3TBZwSVHHcKgXgoH4bbR8/?=
 =?us-ascii?Q?Eqqz+2zIzGRvkncqDyGyWCz77GXxQOuu4E50oneLOf8ql8ssPEsLTB4neZtz?=
 =?us-ascii?Q?moj1jODoCV0OpYX6rtFdOQaiYuQV8GI+BJ7naYSPmStO8KnCRVMPxz9cc+Pp?=
 =?us-ascii?Q?FLoJ68kfAjY2etXwLKcg92gItI7pT89TasHzsdTZCMv8JOtOIlO2aYBWZCh0?=
 =?us-ascii?Q?df7JyelWhaPsNxCQvqkiYbSCorV8v6UI9vqM0TD7nBRc9apPM1GkiEwIz7ds?=
 =?us-ascii?Q?rrKRZiJL3A2KVoFVQjEDyvNT6xA4WdMAdsLQPBKCIaUVMXdaOGU76hpEP28c?=
 =?us-ascii?Q?dxHdE5yBthyVGiqtgg233eBFpvqJHy7JrJmCezYF+Z2nt90XL4axM3baz6KA?=
 =?us-ascii?Q?NhS1OIgtWGFRbGrdRHEcc8UdiwxOqAvRGwjVhZ16frTloZGCLB8Q4KSu6+VS?=
 =?us-ascii?Q?vUgr7YVTATa1cfiOL8UPXbOlThWmEabFrJ5kfH70TG/BCnE0eSqfTWwHVjdU?=
 =?us-ascii?Q?Ft9ft1Jy33rdp0efSFQ56k11e5WRjJj+vta5G7/lgyoJScYKwtyqvWqT4X/Z?=
 =?us-ascii?Q?aP3qaR5q1IeMLGQa18QNtGZ8wCE6Iypi65IYe93WN3SiOva0GlIvCHGbZO/p?=
 =?us-ascii?Q?AtUS8X+yJeApx2iFWlIpwUbnbkS5VdkhZOzjQFXrHDl3Cik4/5Xt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c5d092-98d3-44f0-ae4b-08df038ba7e4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 16:04:06.5045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sASda/SVYaFnbdOz1gA3/+4VqD7d0gOccYnkPJSJeuTIiuABly7x8MDsLEyIVfH7Q1kUjNM8q8v+JF9WXAHAFXa1qnayo5/att2ueRU9EpKzp9oK0Z0YOlnTCNekX+qa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11032

On Wed, Aug 26, 2026 at 12:55:43PM +0800, Guoniu Zhou wrote:
> The ISI output format field width differs across SoC generations:
> i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
> from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
> extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.
>
> Replace the static CHNL_IMG_CTRL_FORMAT_MASK with a per-platform
> format_mask in mxc_isi_plat_data to correctly match the hardware
> format field width for each SoC.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 8 ++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 1 +
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   | 3 ++-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 1 -
>  4 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index f2a8eb82fbfd..c1c16dbc1539 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -297,6 +297,7 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  	.reg_offset		= 0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v1,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(29, 24),
>  	.buf_active_reverse	= false,
>  	.gasket_ops		= &mxc_imx8_gasket_ops,
>  	.has_36bit_dma		= false,
> @@ -309,6 +310,7 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.reg_offset		= 0x2000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(29, 24),
>  	.buf_active_reverse	= true,
>  	.gasket_ops		= &mxc_imx8_gasket_ops,
>  	.has_36bit_dma		= true,
> @@ -322,6 +324,7 @@ static const struct mxc_isi_plat_data mxc_imx8qm_data = {
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_qm,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(29, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= false,
>  };
> @@ -334,6 +337,7 @@ static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(29, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= false,
>  };
> @@ -345,6 +349,7 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
>  	.reg_offset		= 0x0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(30, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= false,
>  };
> @@ -356,6 +361,7 @@ static const struct mxc_isi_plat_data mxc_imx91_data = {
>  	.reg_offset		= 0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(30, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= false,
>  };
> @@ -367,6 +373,7 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.reg_offset		= 0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(30, 24),
>  	.buf_active_reverse	= true,
>  	.gasket_ops		= &mxc_imx93_gasket_ops,
>  	.has_36bit_dma		= false,
> @@ -380,6 +387,7 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(30, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= true,
>  };
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 58b47335afc7..05c21c448b93 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -175,6 +175,7 @@ struct mxc_isi_plat_data {
>  	const struct mxc_isi_ier_reg  *ier_reg;
>  	const struct mxc_isi_set_thd *set_thd;
>  	const struct mxc_gasket_ops *gasket_ops;
> +	u32 format_mask;
>  	bool buf_active_reverse;
>  	bool has_36bit_dma;
>  };
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 6aa760ce3605..2405f7d33d0a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -410,13 +410,14 @@ void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
>  				       const struct mxc_isi_format_info *info,
>  				       struct v4l2_pix_format_mplane *format)
>  {
> +	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
>  	u32 val;
>
>  	/* set outbuf format */
>  	dev_dbg(pipe->isi->dev, "output format %p4cc", &format->pixelformat);
>
>  	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
> -	val &= ~CHNL_IMG_CTRL_FORMAT_MASK;
> +	val &= ~pdata->format_mask;
>  	val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
>  	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index e795f4daf3ff..7c4e736f4651 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -39,7 +39,6 @@
>  /* Channel Image Control Register */
>  #define CHNL_IMG_CTRL						0x0004
>  #define CHNL_IMG_CTRL_FORMAT(n)					((n) << 24)
> -#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(29, 24)
>  #define CHNL_IMG_CTRL_FORMAT_RGBA8888				0x00
>  #define CHNL_IMG_CTRL_FORMAT_ABGR8888				0x01
>  #define CHNL_IMG_CTRL_FORMAT_ARGB8888				0x02
>
> --
> 2.34.1
>
>
