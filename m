Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32779503BF7;
	Wed, 30 Sep 2026 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784287; cv=fail; b=JmExJO0t9Xe4skJtniyeuEZjgvAa/il4LAV6YZdkme3Q6eNcBCry20ckHc6v3tAjvMD1LpTh/UhbY+d1SEOjDescvG5NYL1xtyhQjasDOR3/ocXQdgLEqAKmBB8cXim4oO0VwtD6SfHM3VOqxCbf4GU0B5scKZbFvrhycIFxWEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784287; c=relaxed/simple;
	bh=fSDJMtLh7vpWmwg48n939fPZcnkOFZLdEIUDqBCqRAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u4fxD5S4Y44wPF146iIavq9+YGP0DmdtmlU2JBBkrTBhhPC0vgWwCt2H+t0V+zFOQEFRa5/N98tax1HcdSSSuwEy9Z/uccFTZCeU4eBcCDke79OEc2v/drDWe6GTk2KkD8oR4mwQ2HmP73/bbrJgbHTTrrK7RwLsiUtcCQDhBWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ghp1sF9n; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ghp1sF9n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFL/NM8HTZQce4DYnrugx9qlqbWwThFd+ZYbi8c6gQLaletfLIpS1mvPDLyv0rIsLm8iKFSX5i01YrDbocu55KfIwxQH6ojlHqN17FoMR42UQueN3yEQ9RCjMbFL+mMJoYrsteJrXBxA0FnF9ka+kI7c/yXRbsiQrVnMuLa987CWnJ98OlC9x+eN+pBUM0u4mEMhPoC6UVjYRG+amjCea7j7ddaLleBclOtsyiezHxDketbLtcExoNe/ryebSzRVRAK0PAmAn1AgNcjmKNloXj/ysIV/E3eseklxd0yRlCGLo/mMxj7koKfHlQD6m/YITDHgtHSDQdFGpDQDthO2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0+fRfGmNJk9dZlfXHPtMZ0o0/WnM2Da0jRT6bHhn9A=;
 b=B3ygnNYRrgjSPud3zMtoMWhp5ljp3wBWVo5jg6H5slAnVs/QxBHN5uq5phAdpGtzzN5vjOg+y1i1dRDO8KVPIGYs7QbATQ6sAcwtyfTQu7D/zg6iPq8Lsety5cTZibKdDd25IATgBONp9Z/NdfrL+WocAuJIb8BGPknnOcRudbeU8dSPt4GkpnOQjnnD5MCKYLvlSV5QmeGI3LWUXvB9t4AJ2+W8jkFCXTYRiaxLsUcoNty81gtVZ6dknf6ExtBiXA6Vd9Giz5C8pJGQrN0sSyMHAYoyy3h4CWbltQMA1rq8iYAIhAj+5BrTECDABUTyvrVBRT0dgb2mtAkM26CGvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0+fRfGmNJk9dZlfXHPtMZ0o0/WnM2Da0jRT6bHhn9A=;
 b=Ghp1sF9n8jMojQRIBP3ieV78YiVaP8TGgcJoQA/RRkkeO4CtRmoHJNjRMhiYMiX4x7NkZQroSNOqH3rtLPXotwqW+JpAz9mPOVbxCQlPd6AZIgtOXTjiqXI55eDgb86sWc0M/BpQQ2TBZaShWYaEzTip+AT5PAuDaXWHRoNyiPsmOJEa7b9rSxo0yXkdZgqwTkNjxHHR7tjtkzROSH9uafZrKTU81GZgq23LqH4x+v4DcmEJct2+2ITphDVfKHMbVOscJyr0Xj2RVkYhoe5kN8RzwHyyHQ3N2Icnkwqky0sdyMtZjg8RaXkVbSnzBe8+3B25OsJ8pIylazPyuXimBQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9911.eurprd04.prod.outlook.com (2603:10a6:102:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 16:04:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 16:04:39 +0000
Date: Wed, 30 Sep 2026 11:04:27 -0500
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
Subject: Re: [PATCH v6 1/3] media: verisilicon: Remove deprecated
 nxp,imx8mp-vpu variant
Message-ID: <ar0zCzdfPum2KMML@SMW015318>
References: <20260930151241.58233-1-benjamin.gaignard@collabora.com>
 <20260930151241.58233-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930151241.58233-2-benjamin.gaignard@collabora.com>
X-ClientProxiedBy: CY3P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9911:EE_
X-MS-Office365-Filtering-Correlation-Id: 34deeaa8-410e-4dc3-530d-08df1f0c87ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|1800799024|7416014|366016|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gwprnuxZvD5Skp8Kny35CheYenuIduO6POdK+4eiJOqP93jl7x3ADoMWeowBoY58wVXremJdBeZp+Be88QOrE6U8MdHsnAmk4I2W9aWlJFJTqx1e0RhWNOVkruTeA+kLsA03c6QmkL2by6x6diyRYbhWQmN3OvrY4kYWbbbdhcgKxZYOqTs0kHqaakPH2YnDCPI2w/bLAG5dBdJRWcpQzpLtpexcng03wN65PcyLXItKxaP0K5fYUYJezsoxiDAIyvip1IWLET0MXdTvwjfeUJjXRYZ2ZM0JuZyaRgqWg7k1z1lK238gS7hDPOaaqa4VcXnBHwpPo2AnmS1/PJEbsOtjq9KzJBSWoOwOhdSlOiEmvkfVDhnmfHAFKpenZbs+cfYxGExpHcHUOsqpj2XUvOsJeewdaGkeQzT4AdvkFrnfpCIvfgK5R5HlrovH/nY7SolcQILQvgdPb7k8hVKghfoAUUYSAK3O5uH9RUxj/WCjsrZTFH/wrfMl7zaPP+6Mx4tNA4eqa6nVg8gdRq+nVdehNuZk07oToZS7WNl3wNcFga1tryDlJQXBGsFFLKHTdHZFqqIeJDwLtKt0NSlp5W4bqQuZnTPk5da2dz1LmkU9wH4gQdVlTDl0R2ka3bKBglgI6kUJWzMxHScN12qGXXr4PF9L80SKY3rQyqdYPDI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(1800799024)(7416014)(366016)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9vWxYhh1+rhW2SHDOfbpfnt78fDag5Fs8Ud7pzW0N5ReNB4rRw+rRCVjD+ah?=
 =?us-ascii?Q?xWeQEsmyLQH2dl8vR9GXhssScvodiNNfiXe8XAMw/xGCVAhY0T12lCUyS6Q/?=
 =?us-ascii?Q?j91MBBOEvvQzwIeDePNbl5HcANTl7QbZoAnhwznKk3unSxy+JWdvSoOV/AzR?=
 =?us-ascii?Q?/eNdVW3t7KjvU0K/3Q3dwMD1buqV/SzEgBw/bOcFGaKfMgr2LMktd60m6BNq?=
 =?us-ascii?Q?iY6D1ZOq0OhJd0ZIrcpg+MdH27WSnYqmskep4TxSbBam4PsdIB70Cmy0CoMv?=
 =?us-ascii?Q?evcBOSVFcyEwY+JpCoZ1+f8LugDmyW4V62xkGujePSGmp5+ucXItNndC5VkY?=
 =?us-ascii?Q?Mt/Qp7+qYBqFSI8BSrgnWfnEfvBB/r6UF3OGHL7qkIa07I76l7imgLjZ4LcU?=
 =?us-ascii?Q?AB0Y6DggXcQW2BNa5d4McPNA1KJZLqZMmCcqF4LvWuGDZTWR4xJTUqmhCyxI?=
 =?us-ascii?Q?6uJPy4YZX+Tw15EKYnug3vtWD7yHIc9AZ13aW8GcfF8f6Yy5Uze/FmgPy2sM?=
 =?us-ascii?Q?YpGivG1gWcz7Tpoz3RMPbNhMPcDHkgRP5I/6DMuegOowM0ZosFbgq53AO3u7?=
 =?us-ascii?Q?GmwBkXUL2YEc68d5qiEZqCpZMN7aqvWgYRMauEygqAHxym0q944AjRMO3Snx?=
 =?us-ascii?Q?ILQlDKVA0KQNAS68Fwg/6cC7Nr0Ig7mrSaeIwoeAJhddPFGypJCRIgBMPlt2?=
 =?us-ascii?Q?y3xDne2NDvR0wZmPnUJq9slbUmJ2lCz6+zGViSYcF58RqwqFGLduDDriClKq?=
 =?us-ascii?Q?D3Y/D3GvoLOTxrJ5nzSYAe0/ehVEk/BnRxPoe22MeDGCJTP07ADIZNr0zFqv?=
 =?us-ascii?Q?wN3Lmg4bls1nKdlWCEEfChklUZ4ECIBahCy4aVCRdekb0EyjMj+btHQOFA/f?=
 =?us-ascii?Q?/2sn9qNeSfsCo19iNzKRGUopRgHMx9/wIHMkmnqo8SNYaAugVg38D+N55m1+?=
 =?us-ascii?Q?pKBiV9hv7Seb9WxcWjUJ0uFLgC6p75EtYg9+1mIOaGFpIfcrhNrDjnyYEN/s?=
 =?us-ascii?Q?EL2ZrAaIJEim4bSPK6b72YFA0wvz8utWeTKTlL0OXfeAbLlZ/U9SwBvQmyeH?=
 =?us-ascii?Q?iNEat30aP0tL2HDtwO96R6vr3qJmhcczCKf7Wv6uD703FWg8aCHYcaq1Czg8?=
 =?us-ascii?Q?xIHcRdO18hflGg2qt6f8GGapKDTaghAWMZyQjXQjKF2EFokqC95+CVGj+TuZ?=
 =?us-ascii?Q?HnbaArOX7A9lX/mXe+6F4zeoWO1B20X1usCcGOVEhpReT+/tLK2XKqjYkY9Y?=
 =?us-ascii?Q?akYUEB9SeDqopT7C89tx6jgacK2fIUq3hiXKwjg0QWGKjGSejxEjTS+V3VQs?=
 =?us-ascii?Q?a5XpEMgzvOIA6iVkHfXSKsIMCvUPHSJIMSK8wgsLcWGzgjPQt1reZblt/rAA?=
 =?us-ascii?Q?5LfTaxmLYhFYEK0EwHHHyd3mbvg7oeKVvxXPr8teG4LHQ9XyUmq9CZiqFUY2?=
 =?us-ascii?Q?GbkghkTjQ68qcz8GRWiSdgkQFFalhbkU1VK3qu0T9eiUmv6syYm0GzQnK3Ev?=
 =?us-ascii?Q?czTtDga810vnU13L7smUjgs1YuWijSq9k6BYWeLdHrrIWfX+qYhx464A+GYO?=
 =?us-ascii?Q?dRWpH0ezC3Q3uIN7WWU1vLe9ka2g7FYEpBWMiUvKU7XxMfuFABmXD9ZOcqtF?=
 =?us-ascii?Q?6/kmE+mkL4nZ78g3Rkp3f2pNvTNyG2KOvVq9oCBgFu/kFlOLjm7LegHZVZJi?=
 =?us-ascii?Q?iuHZ7RKdzREyjXv7rMroeREWvLwm9TbVbvs++MP+76WP38rGZYZCPBbTQvHd?=
 =?us-ascii?Q?ikq/bGufLtHiA1TDS6V+7pSV2BQx6bqlxK6PM09V80VCFS3Ndz/S?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34deeaa8-410e-4dc3-530d-08df1f0c87ea
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:04:39.3230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJiCxI6x1Y10NH0WAz4Bo6tFMQmUnRkSWyVIIr1ngHPuL9SL3qZEsG49G738rSrc1OXLlz5ni74C9kWViPkhVkcgylxg4aKfkC2umsI0CPKFk6JzTJ3L7DH73moroykS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9911

On Wed, Sep 30, 2026 at 05:12:39PM +0200, Benjamin Gaignard wrote:
> "nxp,imx8mq-vpu" is tagged as deprecated since:
> commit f3116f2e52e6 ("media: dt-bindings: media: nxp, imx8mq-vpu: Split G1 and G2 nodes")
> merged since v5.17-rc1. There is more reference to it since that.
> Remove all references to it into the driver and remove dead code.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> changes in v6:
> - rework patch 1 commit message
> Keep hantro_runtime_resume() because it harmless and futur patches will
> need it.
>
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
