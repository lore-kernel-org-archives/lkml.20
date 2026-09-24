Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5D2339362;
	Thu, 24 Sep 2026 14:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259421; cv=fail; b=NPDOjzLgzTYaOPWuO71l55kPMgrDZQI9PHmsW8t7D4OZSHtpE/xUKewlR7rpPSWLrIDhhRUDhPovtSEv3iXU3OX7pqTD2NqsvuGeX5AE6om7UNRUrp8NLBG9KMEQ1M6cUMXyqK5CG/0Ny+O/RlH8t9inkgtRzmPmVfYgkiFw5JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259421; c=relaxed/simple;
	bh=IKo0gbhgGZKp3oTvDfjiEIOGO9z0moMHE+F90Awbr8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Uv5tKuiXw5hOg8nE2mHJOTJBOmMIB48jLuESLN7hMngK5UxY1lBZ+qZcrxpOWiEB7gCzQUpGA6fQZB9JiCUFRIxS4pRGoy64WmRt+YIpNZ9hkVGkowo6eF9h4nr6U5Z8W3IpEx9VS/YLKa4F8KhbXBoMe2Lr9Z+zaIF9y5LCRoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Hq0uwX8Z; arc=fail smtp.client-ip=52.101.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Hq0uwX8Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6f4MgQnLbY/CCTt3D8obiiy/nbUw+1haz4EaJBpbuuRzrDOSrds4KD/dRU6n76M6gAk4+G2OGAGz3SpcwIxdj1uzBkh0vmULO5mcSc4ybhzYz3bZE1SOeOHj6tXOvgcXkZNx8Vt+OWnuWih9CLIedFiFKxRqyYKj3q0oQwFpoygYJxknBK1bBG00YD091SEUKh5IpZza1xJBj0rlUXXJG0PTWkRJnWWG3jDFtRqQiwDditAxxDtD6Lb1VJUJvJCVuNxH7AthJ2gvlolfAW5AaY86I3ObWHnaT8wjoBG1jBhT1KESr36P9ECiTAlQiiAcp7VJln62zfhn6zueHfuSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhXF3Uk3wdZUQdQXH4OjUHsJSJvz18vCY6to51dooTs=;
 b=cJiubCBwTr6pU66pg6ZMBZNHIl53dUYm2+SlkkfmkeRExxpiXWOA5na+STAHvyxSWU65hKTde4SKrFnm/nv95gx+sbNl9fPcUndqvyiSpB7EpiECCqpi7Sz2CedX5hBU+NRS5sNVIYUHNqivoVRRpFaRO/nXsvTK8bs3oROVOE7H2Erk3gu+hCtD3qm5O9NMMlqkp4RQBueapowx1pQUBR7bELRP37EgVuZsH4qUHUUOc0m73eVG1WyntINZatdVKq1AWkydcVS5Tght/MPuCLKnN6digmNLvsE/jHhiNG2l1tPe4W7JVO4N7hfVKyRZr9teYjPBH6LGY+KwyRuB4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhXF3Uk3wdZUQdQXH4OjUHsJSJvz18vCY6to51dooTs=;
 b=Hq0uwX8Z4KaxU+qJ6iYlUS0AbL3fEhD9M4uw7KSF91VnA+cjipIdKYoxX+HKHKbEZNfEnx+HEemjuYZsDCRZdN9RzizilP11raTkjXMF4nUobcc79/Oqar2srRDCF1mAr1mbomOrMPOTcSVyHV3YGlD44Erhqy+kD/GOcdcu6BNVE3S7VRDgYM3nt9GPrJUcll9db1UmJmccsXzwnCHCjZi5GMMZnqA5HsBorHbpdttzcTBKmKNRzsRcqs9iUt9sv0ISaAvcCojcuwEwlY9+SusyFNTcq1kkVA4TU2krE9mHD2C+ZrbKqGsEVocU1EVMHcixHQFRT9v8Z8HYyE6gTg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB11387.eurprd04.prod.outlook.com (2603:10a6:10:5cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 14:16:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 14:16:54 +0000
Date: Thu, 24 Sep 2026 09:16:43 -0500
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
Subject: Re: [PATCH v3 1/3] media: verisilicon: Remove deprecated variant
Message-ID: <arUwy2kCDe4S4Wgv@SMW015318>
References: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
 <20260924130453.196299-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924130453.196299-2-benjamin.gaignard@collabora.com>
X-ClientProxiedBy: CY5PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:930:12::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB11387:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ad2e67-78a2-4dad-e463-08df1a467bc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|19092799006|22082099003|18002099003|4143699003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	mhNRC9davAad2UnG7u7IGToWu/QQapLB3AERqoJDYAVclthFgZ7W7Q4FdLe9WWFfMHKge2HixRJccC9Ioqinc9schWMGFeKAJwj3B5u//XVmD33wsgWeTqKp8DxFwm3nFiDyCyQ1YzxhpIg9R3kf3y/JCSEkwkBq5352AtuBpJcEk7tifjpYhL3iiPHZot9HfkdcwHIfSYkz6EImDzMND+iflr/BB5+D54lObEdmgGk25eXd827uxTmi9l9UYhfIZ90SL9dUoz9Pvf0+NJdvlL2KTRDTxDb/BmT/gkEQ4X0qgzFm//sV+yho9O46a2Apg8fAkrRu/qwD07WsQnrlpJKlzROtH5Asg8DFoGobXkEh2ioQiXCgYWiJ8X2jnHEHVulaRabEFku0iyjBR0mym2YnRKmIoRwO4/Jf35eglrBm46H2tCnNZTMTCAOe/p1QuyIYNPKZ9arFjzv9EKa9qbYI2QtjboB8NCbJHP7ZWIrV58czbPXU5b1J6bZqmSPiMxs5+g/xYwnbR0xjb4J5twSnLLJ8VgfG61I/Zpla2gvHKmIFj2gZx2daK428AM5/BPP6nRHYWFvcwn6gXbdtyoasWw8eH2sqkoPEt+3toWstc+q1AQOv78Q7apw9POLRXGGS3Xp7zRHLco+V9T9cV2s7SEr+wzn9inTfbUPBfCU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(19092799006)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NLJGYAg+lmmEZ+LAwP8Hf0i1R5OnZCeGQmvsZSQmwuRgK9R06KU9ehzzkjm6?=
 =?us-ascii?Q?RF/51Nfw7xlP8ZLAQ2nIY6oy7FKPOr9rCpF/yZgs4DU3ZSAN3vwuYnBgZVDJ?=
 =?us-ascii?Q?u7N68CsvdHx9kwCrVH8OyePXZiyJayj+zX6pvUPyMKp8aC8u+JjAfgyiU7im?=
 =?us-ascii?Q?0j+Dsg89cQJUwHa8koxurw/V2b4zhl0IRpjENW/rR3cF2pKGJp53QNX4zXPh?=
 =?us-ascii?Q?8FsAPnQDHUF4+c4Kj3W6xbjR97CQuSS9yIqEjOY7/f+/Zs6VlN5QhFlzcf79?=
 =?us-ascii?Q?1eoNdL0kRYHUGXphv0B5UGXROtCJAITaa5O0Y2b7lE+9u2htYLibBgGUpmL5?=
 =?us-ascii?Q?noNvPnVVt5g8OmjvjmEOvFkQRrfHEUxxOunMTWbNwoeMLGdIoaP4X6SIdVFa?=
 =?us-ascii?Q?yjD8IvXUoFq8ovSXr/QD/MVmsMapApDhmSrQIqDO4ZFsfqhr1Ks7RYB7CpNK?=
 =?us-ascii?Q?SdjjlvXp482GFbf7W0Pca2qNtAitxtjAt3IOl+SMGQWcHymdjXyVZGIZK5Tb?=
 =?us-ascii?Q?qPrvyhvt5XscWeqCOc9jWABdn5WdUIQq66PJB0tOkKJ0CmF7GQRkfPmj1yxN?=
 =?us-ascii?Q?p4o6adI43OBlIPA8VVE2f1aImaKB/hinUX0XzAqV3moCLSWMQfZwg1W2+ezL?=
 =?us-ascii?Q?JkaYrOEjL/mSmGwlZnyHu8nxfsI6avs9aCCg3DQAocN/feTUS3EskgtKlU/E?=
 =?us-ascii?Q?BlwCjI68a8HL+hObQEL8VOF+NecjDNf6f7FJieMlFEOgBCXgzAUDUAIWhlcl?=
 =?us-ascii?Q?ByXklECYD/kFX/6GVSBxoP4sBrBXnAkVoYMf/L1cpdvocGDDUuvdGKWP5dZX?=
 =?us-ascii?Q?kVU5adcLZTNWoiOJ5cZgX5Mumu5AzoNVj8I8WbfhlceKyD9HnXESeeHMcMfz?=
 =?us-ascii?Q?D6OIA9Awr2+i8y9F9VaPukYJnJZQggJZum3yhSWyv0PqNBdp8pkfSu1EbynW?=
 =?us-ascii?Q?P+CIBuCWLCjqNldVzNA4ovlafLnqM7oZLXqxGgk9+oPBipLnc9/f40U0vN6C?=
 =?us-ascii?Q?sJ2lYPszVqMBk2eJJ1gxwytAiwjuDDtIhE4T2U2uKMApro5S20eNW9ThAx3w?=
 =?us-ascii?Q?3u8ZkOFlpE8pDWvjLPanc81IC3TUbEea3shmFj9+aLr0SJTOhmL4UOKvvFet?=
 =?us-ascii?Q?cCmgCyCaAUDXhGgId/XpD1ZpJS/3/R5W9PRnR+nGDgAYD2zORIVvUbDsOYZ8?=
 =?us-ascii?Q?QXB9vq2uT1NBhFpUJFFRRXcTQDg9gt36ZYYb9vNOx3JurP6Vo/81uLbxkfxI?=
 =?us-ascii?Q?C1vN9j8AG6WZbe7cHF/+xpUPMX2nLfJdKoKintOfzlgLzytboJjNL6s3FcqI?=
 =?us-ascii?Q?ZoLoC2+wWKyfO++5Fpejl9O41rI+j7b6w/kbTSMYMIwnFWRtqFZTvobC6qsA?=
 =?us-ascii?Q?mYLfl6kCzw1fLsbiqGIAh5l3AuCX8/NcOk6lho6UneKHqotUdo9OhV5+CdZg?=
 =?us-ascii?Q?j8ORr4Lu6KsccBqYnnZkRrvo7aUitgrfaxhHU4T2IsE01qemWB+jGnvuCGLj?=
 =?us-ascii?Q?N9jfO0GxyZGkjqh/TpIoDKROb4yPCKM3zwjyo7gkpVpO7EQpkr/TjA03nb17?=
 =?us-ascii?Q?7X8wkaJ26ExuE6UNnYokWqAq53l14nuA1O0t9hg9SKB33JrkAU0yi19QVLpO?=
 =?us-ascii?Q?cqfH3Yi0FkSxDILYmuHW5XMH/gFoOQpTWosW70ntJdOXlzJzoR8qwdluGRf1?=
 =?us-ascii?Q?H37fp3XlAfi4pzRKWHskrrs8YNEz11KaNjTE7W4H8Df7sycQF0DdPtNu0PH8?=
 =?us-ascii?Q?no8I8id4AiYcZNfwJ43co2uLUrw7al1170iyzwo/ExPJAi/oJpfb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ad2e67-78a2-4dad-e463-08df1a467bc9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:16:53.9976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pw4/wN2padoT6132N2n+iKaoRIB7me7AG3E6WOnGkS8rLgOVumdPDMVhrnTqW6oGv7KwNPMhbdllzzTNC0CSPMQYuTeEx8JjymRMq9JzhumG4G/BXkw7tLgBojE+U8Wo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11387

On Thu, Sep 24, 2026 at 03:04:51PM +0200, Benjamin Gaignard wrote:

subject: media: verisilicon: Remove deprecated nxp,imx8mq-vpu variant

> "nxp,imx8mq-vpu" is tagged as deprecated since:
> commit f3116f2e52e6 ("media: dt-bindings: media: nxp, imx8mq-vpu: Split G1 and G2 nodes")
> merged since v5.17-rc1.
> There is more reference to it since that.
> Remove for driver to clean up the code.

Nit: Please merge to a paragraph, or add empty line between paragraph.

Thank you for cleanup

Frank

>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> changes in v3:
> - remove more dead code
>
> changes in v2:
> - have a separate patch for documentation
> - rebased on v7.3-rc1
>
>  .../media/platform/verisilicon/hantro_drv.c   |  10 --
>  .../media/platform/verisilicon/imx8m_vpu_hw.c | 105 ------------------
>  2 files changed, 115 deletions(-)
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
> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> index fa4224de4b99..b091d807ae4e 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> @@ -25,55 +25,6 @@
>  #define CTRL_G1_PP_FUSE		0x0c
>  #define CTRL_G2_DEC_FUSE	0x10
>
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
> @@ -234,45 +185,10 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
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
> @@ -319,30 +235,9 @@ static const struct hantro_irq imx8mq_g2_irqs[] = {
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
