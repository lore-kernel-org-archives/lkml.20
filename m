Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F265F4E36CB;
	Mon, 28 Sep 2026 16:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613714; cv=fail; b=DgCYAv8sg0/+y4wxWHENTjoKei+GyEIaVcxTEkAPP6U0DdEHKBTRgJ9OGfveyBXc55iz+D6h9WuBdrBgWrwjVFFCOvQJQjcxqlspwD4I7rHG++POba9fNHoQWYi2tjKMHXpwM2WVjHPE4ySvESF8e7pPEmSfBvICAbF0vmwQXYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613714; c=relaxed/simple;
	bh=fpScFPJpwxhv//kuI2Qe8GAgU8Q6gqPCTi9QBUkunko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q10v79Wz+WlCoLtoO5Pf50ol1W0HmQ9MfAqmDZPtsIWz0DLU4OvorHarE+bITOOW1QdipMr3dxP1Gp2jsNUG9VbpInux3Y+xcb6RdUOkn3yDhlzd3OaK03/sgz/UVm0wbNUFGlrlgDuDdwmVe284gfCnYNCRC2nYhW6vk4VCJJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YvV7A8FR; arc=fail smtp.client-ip=52.101.69.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YvV7A8FR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EEIj4C7poKz4M7Z3DWDfNqxX1N+nYm4tKYrSYLGt5vBG1EDcFq8fzggWdjCoXO+GYSIFCHFg+2LLe2GlMLjltQLFfcieQqZRqItHLyidZBiHEA4IPijFtjMeXi5QYo6CfrjKQunz760c3B9svKMPnrRjTCYBvwvSLHMgiLtwxK5seSWnW+i1kGiQ5XOuGvdFMLezVMDdTM+AcqAcDtCYTP5sCIYEzThemf8OxcT5SnU6b/Pf99wnAqWh1RL427m6c385qv2sA/rLu9tYeox+g6OH+KDHKKHNwgfUc1hDkjjJAZvq8uB1W5Sz5EZKcAVch2GZcgM7h03XQHHrXK6jcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uy8lBu5StWu3f3+ss2y5On6Vp+f2gT5DtA0tXeFWNY=;
 b=wNfylZV9HhdtIAJoexM2boy4PlKsYC9XzkUI7Puhg3cWcQW5v+DarGasvTMyih8xLPyflCu+1PkA9Yth/XvQ5LmubpNpWpN+0eQcKeVZ+hQcZjn8xGnMZmS0WoVelQ+Az24jNi/BJzdekQFXOB3yUj4qXU8KLwwyi9elLozD153w/r5KVlY0Lxt+7KuJ4zAAVGUMLCedxvjPZaVugJF4UeR/4Wb+x/mvAlWS7wC+vEJSwyvjQCQyonrO9xM0/IIKZDDidqf8UQOLDKzB7sO1AIynjisAP5fPRVWdAEGJz8t/27Q2KRPqoQZ97qHd2oP9p2reKqwVP8w9Sm+Ev5GLiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uy8lBu5StWu3f3+ss2y5On6Vp+f2gT5DtA0tXeFWNY=;
 b=YvV7A8FRNFqNfVOV55NM7JxxuN9X0yHZQ8SMQ3jpsS2bJL6xerHU9x5UnvEdcoMscOt5bp+ZKKGOZ9CiULaOQ9N+y+59NFxWWSUwLWguHDNneWstkhzhZoe1OzG3ebzmNXriu6ByIKGqsYqs+FXmIXFijIukz8XSFok2ieobwUEXwzx1NPMQOujgqlar/7JRptmGCRHB6qDVTbiiw9BONY2Nq/cX1Ta1tJhmD3zxnfhSeKPtVqsx8YfZdGx/x9Di9g8zLfqmmqMqaEmOARzFHBvvUsIIFYcRBK9nEa61HlLvAAnl6fpPYVpx9HGTeYVryz5fgtRlFmvIzjxXgQnY2g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMZPR04MB384512.eurprd04.prod.outlook.com (2603:10a6:20b:7c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 16:41:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:41:50 +0000
Date: Mon, 28 Sep 2026 11:41:37 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, conor@kernel.org,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v5 1/3] media: verisilicon: Remove deprecated
 nxp,imx8mp-vpu variant
Message-ID: <arqYwTQ5_nyqB_8U@SMW015318>
References: <20260928080822.19553-1-benjamin.gaignard@collabora.com>
 <20260928080822.19553-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928080822.19553-2-benjamin.gaignard@collabora.com>
X-ClientProxiedBy: CY5PR14CA0010.namprd14.prod.outlook.com
 (2603:10b6:930:2::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMZPR04MB384512:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ed45c0-2793-48d4-8855-08df1d7f64ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|19092799006|10067099003|11063799006|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	VSTSldyc8/I7FlqqFJKqnoBSGQds3Gxi9Jyl58izw+CVs6fThJkvEKDvDp9zpRfV0vGPzqLmLF07ZMzFDBAB8Q3NTH3AhQ3zr2V27VpW5xp3aWQgmJY6VgxrQeCa2IUfTcH7MqkmfIfxc/JLxaBm3eZRGH3XDDBBqSe+NFIy7p7aD6Jk5SSItNrUBkkyXxhDz9pyjo93IfJ90tkwaJI+BbLeivAeuM32bXf5RphuaSng49c0EkOHDYhKicB8z5aWuXfUYxO5AXv0+1NltUcdiachqw8q5gXrfMfnRGvx6/SdpSwu7nicdEpWp47nhuZRG4qFeluqXptleArGR5D437xnNTsrPUT6v7d91n5/aWLMgUpW859z26UIxkVcy7z+vrCv0FIABbZUPzmqjAhgey2b6WlyfPVmqT+u+ASPoBql8+t5lv1T+KsmzhX/NsrH3Kce20I9iCaBEwdwxbCkXwOZmpbube8UWQxFHbvQQVcXbrIwsWSjCVwEKic3pFPAP/yL3vHURUBYvojai/8QHfXhSyrhnROykZVG3cSpdGl1Xrf7kh91fNUvkXhbbhlQ7ohJ+iImrk4cE4FN+3e94mnOIB5EWbLIW3cuuqA1lyGPljUjRTAkk1OSRnwfH0ns69ZT9wcm4ESbC67vtmDVKpKzsVcfsb6Uzl+JMVONWYo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(19092799006)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3nLQKc8jq2D5eVqQvztd0p47bViiAZi8iJW09z0hc/mdtT+fWwjPmfOsbQqt?=
 =?us-ascii?Q?vpq8lcBiJXNxW0FNTlGudy6DO3kRqglIwNVuFZfHPy8CsmHhCcpkdIVeb0SO?=
 =?us-ascii?Q?aGm0U15zq8by9eDQbvCRXe1hTbBM82oGb2JRcM8fzO75+8i9nlESl5CFF/7a?=
 =?us-ascii?Q?fYvSr7n5Bt8gt42z1LvBcvyNenT9skdA44mUxqf0Wuzf0H238qRr9M5MPMAO?=
 =?us-ascii?Q?gvd9BY/4SErLA7HdMdTsFfT3o30n1JnSc6XA+oY1Cejaa19FImU+oXih9MXb?=
 =?us-ascii?Q?KuKD8zZmCjs0Vcra1P1y8BkZoWSlNLmOQEy8gg2sYp8sqDOr5zIKsvvic3U/?=
 =?us-ascii?Q?G3C2pD7XhS8HeTYUnJtpRMeEIjqq/eG/A4k9tE6MyCQGqLwJXstZrANI7/w9?=
 =?us-ascii?Q?5DPfc25NGd2JQtyS/0X/7iT9JFzi8MT78ufwwcQh+kMVsv5capOYJzcn39b8?=
 =?us-ascii?Q?rCfBB1Ldj/NscZ52clpVdulOkwQoGw4FEbFyLEy9niOT7BACZzDKmQBeZ9aa?=
 =?us-ascii?Q?vknMK9Edu3h4w/ktFDiToILza4Jf8zSbfV3Emsj6g9pVgtW3F9uEXVJMtY9k?=
 =?us-ascii?Q?yaF2oBgOjR5C+v0+wzhRg/2ueEUaQD+wgCBRZ5dEVVtBL/9z+0igu/xMxyPG?=
 =?us-ascii?Q?AuzGRppOqQgL4JrcW5EGXgxJXNHhLzid8gqlbk0KbbS59/sAY0lSPE6RB6Ur?=
 =?us-ascii?Q?TaITe3y+ZzBwEd1HHCV5leBFlKAkYW0EaYwAF3JWVZrAc5z+n0JQ6bwOxC2l?=
 =?us-ascii?Q?qNw6hWe2pK1Nxt5Bgqt+3faNqNHWLgB03+NCwUGUHUvi3iCbXK/r1VVj2NQh?=
 =?us-ascii?Q?t5ZudeIbkbCHvi2g3UlxhJzLsIH9wEEz8ad2Lm55nWRiNDCPyM3Bkv1sxEQZ?=
 =?us-ascii?Q?zfLdXPqd5u7xzPX5KrUF3FfFnxhwJUKqtIXsRpgOY4D2Hypam1tSwk+o1tTC?=
 =?us-ascii?Q?sIK1WmsWYsKTPJe8iJPzMzQ3zTaOHCjHyH31LVeN0MZ69CJy1weytPehKe/n?=
 =?us-ascii?Q?VVy81R1/tEYkNQNfxazTzkpD6K8UYMsAwjFAuVT/qpS3x3X3Hyd4KCtz9bFE?=
 =?us-ascii?Q?lON/PD6JFqbLTTpvzit5yqP61e6aLzXOVYgmpngw030pvBAsnenP2d0TRH4s?=
 =?us-ascii?Q?YDF6imE5sg7Ras2quRLB51SBldRzflvp3NP66+XBbvG01Gt2RCarKh5HbPbL?=
 =?us-ascii?Q?xoSu6dtDS85nhIh+xd7oVavXm70zWJjGcfAHlBBLUKPtwvBaaHVTdBsK4kK8?=
 =?us-ascii?Q?aknOf4ylk71g2N8IBbOkbesJmhb5GC/w1k8qlGlwyTW5Wzb5YI1gwcSMVAIw?=
 =?us-ascii?Q?ogsIWezClolaoifxHQHNqR6uDDGhMrUplPKA9OhTHehedk/DmIEQkBbDSyEA?=
 =?us-ascii?Q?I+CsDSK7Ux1zFC4NwgGtRBp7BDjQ14Z8TL6m8F552JEABMIDgSS5eutmaCdZ?=
 =?us-ascii?Q?cCWBfbWVGJjKHyLAJhRMDMy4IbqzSNpEqjOrQckR/aRcv1hj9R/NqhZIVXwK?=
 =?us-ascii?Q?OPfFkSbiHU7zI1tdvBH0A4X8nLScVbQHDa6nLZ+UMsEnZEHLaZz6GnXnKRII?=
 =?us-ascii?Q?L9cZTWlPiWNO75xaq7u+f4itA1vvpmNrLlLybB0W4mCw0nu6d38WCY9pgxoV?=
 =?us-ascii?Q?KiypxdYjNnB48VezWBvZgrXpijfrHa12rJ2Xlj8vNpH/aB9EH6n4LG0SVpFS?=
 =?us-ascii?Q?Pg/ZfWPHDIgb9XPGCCEVTHmTeWDyxgQRQ7AJAK47wIkRVkZk48Zwz5f+LPf3?=
 =?us-ascii?Q?4LvMPUN6fDTRGAA0QTtfUzbAPB8+sCsRILuTpdCqaj6tvFIHsphL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ed45c0-2793-48d4-8855-08df1d7f64ce
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:41:50.2063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RD0bFvwTK623xxoInR9btQsMVOoUnDz2nrN3pExOua3ruqhpm1IYHf1nSJ8E89otkHf+qz207yNZOiHLKz2Vo0+hCiuETTbUWXpwndyms9IK1658tFlG40vrwgLBA8hq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB384512

On Mon, Sep 28, 2026 at 10:08:20AM +0200, Benjamin Gaignard wrote:
> "nxp,imx8mq-vpu" is tagged as deprecated since:
> commit f3116f2e52e6 ("media: dt-bindings: media: nxp, imx8mq-vpu: Split G1 and G2 nodes")
> merged since v5.17-rc1. There is more reference to it since that.
> Remove for driver to clean up the code.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../media/platform/verisilicon/hantro_drv.c   |  10 --
>  .../media/platform/verisilicon/hantro_hw.h    |   1 -
>  .../media/platform/verisilicon/imx8m_vpu_hw.c | 117 ------------------
>  3 files changed, 128 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index ad71c0402ef3..12c804dcc669 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -725,7 +725,6 @@ static const struct of_device_id of_hantro_match[] = {
>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>  	{ .compatible = "nxp,imx8mm-vpu-g1", .data = &imx8mm_vpu_g1_variant, },
> -	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
>  	{ .compatible = "nxp,imx8mq-vpu-g1", .data = &imx8mq_vpu_g1_variant },
>  	{ .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
>  #endif
> @@ -1100,15 +1099,6 @@ static int hantro_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>
> -	/*
> -	 * Support for nxp,imx8mq-vpu is kept for backwards compatibility
> -	 * but it's deprecated. Please update your DTS file to use
> -	 * nxp,imx8mq-vpu-g1 or nxp,imx8mq-vpu-g2 instead.
> -	 */
> -	if (of_device_is_compatible(pdev->dev.of_node, "nxp,imx8mq-vpu"))
> -		dev_warn(&pdev->dev, "%s compatible is deprecated\n",
> -			 match->compatible);
> -
>  	INIT_DELAYED_WORK(&vpu->watchdog_work, hantro_watchdog);
>
>  	vpu->clocks = devm_kcalloc(&pdev->dev, vpu->variant->num_clocks,
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
> index 13e573f1f19d..865de26ffbce 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -405,7 +405,6 @@ enum hantro_enc_fmt {
>  extern const struct hantro_variant imx8mm_vpu_g1_variant;
>  extern const struct hantro_variant imx8mq_vpu_g1_variant;
>  extern const struct hantro_variant imx8mq_vpu_g2_variant;
> -extern const struct hantro_variant imx8mq_vpu_variant;
>  extern const struct hantro_variant px30_vpu_variant;
>  extern const struct hantro_variant rk3036_vpu_variant;
>  extern const struct hantro_variant rk3066_vpu_variant;
> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> index fa4224de4b99..0d6a71ae5f45 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> @@ -13,67 +13,6 @@
>  #include "hantro_g1_regs.h"
>  #include "hantro_g2_regs.h"
>
> -#define CTRL_SOFT_RESET		0x00
> -#define RESET_G1		BIT(1)
> -#define RESET_G2		BIT(0)
> -
> -#define CTRL_CLOCK_ENABLE	0x04
> -#define CLOCK_G1		BIT(1)
> -#define CLOCK_G2		BIT(0)
> -
> -#define CTRL_G1_DEC_FUSE	0x08
> -#define CTRL_G1_PP_FUSE		0x0c
> -#define CTRL_G2_DEC_FUSE	0x10
> -
> -static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
> -{
> -	u32 val;
> -
> -	/* Assert */
> -	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
> -	val &= ~reset_bits;
> -	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
> -
> -	udelay(2);
> -
> -	/* Release */
> -	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
> -	val |= reset_bits;
> -	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
> -}
> -
> -static void imx8m_clk_enable(struct hantro_dev *vpu, u32 clock_bits)
> -{
> -	u32 val;
> -
> -	val = readl(vpu->ctrl_base + CTRL_CLOCK_ENABLE);
> -	val |= clock_bits;
> -	writel(val, vpu->ctrl_base + CTRL_CLOCK_ENABLE);
> -}
> -
> -static int imx8mq_runtime_resume(struct hantro_dev *vpu)
> -{
> -	int ret;
> -
> -	ret = clk_bulk_prepare_enable(vpu->variant->num_clocks, vpu->clocks);
> -	if (ret) {
> -		dev_err(vpu->dev, "Failed to enable clocks\n");
> -		return ret;
> -	}
> -
> -	imx8m_soft_reset(vpu, RESET_G1 | RESET_G2);
> -	imx8m_clk_enable(vpu, CLOCK_G1 | CLOCK_G2);
> -
> -	/* Set values of the fuse registers */
> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_DEC_FUSE);
> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_PP_FUSE);
> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G2_DEC_FUSE);
> -
> -	clk_bulk_disable_unprepare(vpu->variant->num_clocks, vpu->clocks);
> -
> -	return 0;
> -}
> -
>  /*
>   * Supported formats.
>   */
> @@ -234,45 +173,10 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
>  	},
>  };
>
> -static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
> -{
> -	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
> -
> -	return 0;
> -}
> -
> -static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
> -{
> -	struct hantro_dev *vpu = ctx->dev;
> -
> -	imx8m_soft_reset(vpu, RESET_G1);
> -}
> -
>  /*
>   * Supported codec ops.
>   */
>
> -static const struct hantro_codec_ops imx8mq_vpu_codec_ops[] = {
> -	[HANTRO_MODE_MPEG2_DEC] = {
> -		.run = hantro_g1_mpeg2_dec_run,
> -		.reset = imx8m_vpu_g1_reset,
> -		.init = hantro_mpeg2_dec_init,
> -		.exit = hantro_mpeg2_dec_exit,
> -	},
> -	[HANTRO_MODE_VP8_DEC] = {
> -		.run = hantro_g1_vp8_dec_run,
> -		.reset = imx8m_vpu_g1_reset,
> -		.init = hantro_vp8_dec_init,
> -		.exit = hantro_vp8_dec_exit,
> -	},
> -	[HANTRO_MODE_H264_DEC] = {
> -		.run = hantro_g1_h264_dec_run,
> -		.reset = imx8m_vpu_g1_reset,
> -		.init = hantro_h264_dec_init,
> -		.exit = hantro_h264_dec_exit,
> -	},
> -};
> -
>  static const struct hantro_codec_ops imx8mq_vpu_g1_codec_ops[] = {
>  	[HANTRO_MODE_MPEG2_DEC] = {
>  		.run = hantro_g1_mpeg2_dec_run,
> @@ -319,30 +223,9 @@ static const struct hantro_irq imx8mq_g2_irqs[] = {
>  	{ "g2", hantro_g2_irq },
>  };
>
> -static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
> -static const char * const imx8mq_reg_names[] = { "g1", "g2", "ctrl" };
>  static const char * const imx8mq_g1_clk_names[] = { "g1" };
>  static const char * const imx8mq_g2_clk_names[] = { "g2" };
>
> -const struct hantro_variant imx8mq_vpu_variant = {
> -	.dec_fmts = imx8m_vpu_dec_fmts,
> -	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
> -	.postproc_fmts = imx8m_vpu_postproc_fmts,
> -	.num_postproc_fmts = ARRAY_SIZE(imx8m_vpu_postproc_fmts),
> -	.postproc_ops = &hantro_g1_postproc_ops,
> -	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
> -		 HANTRO_H264_DECODER,
> -	.codec_ops = imx8mq_vpu_codec_ops,
> -	.init = imx8mq_vpu_hw_init,
> -	.runtime_resume = imx8mq_runtime_resume,
> -	.irqs = imx8mq_irqs,
> -	.num_irqs = ARRAY_SIZE(imx8mq_irqs),
> -	.clk_names = imx8mq_clk_names,
> -	.num_clocks = ARRAY_SIZE(imx8mq_clk_names),
> -	.reg_names = imx8mq_reg_names,
> -	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
> -};
> -
>  static const struct of_device_id imx8mq_vpu_shared_resources[] = {
>  	{ .compatible = "nxp,imx8mq-vpu-g1", },
>  	{ .compatible = "nxp,imx8mq-vpu-g2", },
> --
> 2.53.0
>
>
