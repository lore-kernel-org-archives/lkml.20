Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E56401A02
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 20:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791491780; cv=fail; b=m/WH3vdEHT/iBqhfjlUnbSyiJj7ItWLUcvZ7FA1TH1ijbk36ERI8qI5LfrhYKGbHx9tzlOujHHD90wrgXQWvppLTpVOJMeH0eTG9hJz5H2fNsnpBZZQm6ArH6r+Z41Ffkf3GdknCBzLkKNscD/8ZEJJ7ersi7odjbjkDRJEvLRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791491780; c=relaxed/simple;
	bh=Vo3zqDnD93UlxxOUgNcvq87DnYyTwIISybQVuERTKPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R5Erwzl9gjchJddndKfvbxeJ6Wp0KrjOZ3PAWFXvMCJmOdemZYV9QqVFl5ZbOqnTrcs1C7UE/M6KusJM9xd3BP1XtmwwAdPe8y8faVQ4eqflQjwYO7Zh3hAVAKzIsZW/WfZvC6v4+PfXnoUMyyk4XzLBVUU1sTbssCe1FLidxqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ahovX/xp; arc=fail smtp.client-ip=52.101.69.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ahovX/xp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hE1SqK3zZ4PyvXpNleyBLzbQGyuQOIoN5W2SnS5CHlJoI7i739M6tseoheYl+6z/drY37k4IslR/kQJLB1Cyzmw71cHk2ppo58vARWDUr2JmQ6cD7RGdGkU+CkY5IgUsIp1LWH6xsC5opuVj4owqZ2X1xcHcr78j8CwArVcF69h7fYS7Dc5cEl8W2WrJyN2vxRSby9fVJVzlD4pMdkCA0qZLSyWjgCXN8DT3vU6Hj0YwA63CEdKOouX7XsifRyrQl9EfIPPGDz05FEmk24ZknUrZKeo4zF3BJgFbdI8OuG6+fXEklIqb/j0abiEf+r5xz5kxv2iSQR5BloKA3Pm4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=km2oPrZqGSrS1tWo1yNltbzssiLwnfmIKBxsSJvpeaE=;
 b=j8G8tsHt0ZrXpj/LXLteAQNTqy7KeHKIUKo7Y/opIlzoVg2jVPX/Zt82DP/KbBlRxpfLrtYOjgGte09+UUZS7HoF+cZgLwp2k9+HuUCXJ9bQ7dMjfIHJNIS/w/CAIZqw3yvPuMXn1QN/eSvVV95TWkyDFXcgE7vuXwkEjHBT06zzbUHAPJ+8kTPEjZZneQfwXcr/iUZJtIjC/Fz0DmaX3UEV/FuizMQuLUKD835xsRLTVqACtFtswjp6pBZciTQI7e1SNBUxtH/u/xaCnFITGh/EYERF8hsABTRrzrHIcryt1XE4zJjSXDPRJrGOxFIKjHaozEfW/tBqf5RZjsc5mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=km2oPrZqGSrS1tWo1yNltbzssiLwnfmIKBxsSJvpeaE=;
 b=ahovX/xp923F0tovJwkTytc8AeRmJR40jnTNxU7gqUhQKiBFsl08p0LfcYzOr3sPRSlKP35BLCetRSTmlPdjWtafR/evkwxEe6GO2Ct0zG1BKVUbfEd0rzeUPPKWF4fzX94fc/PX+7h9IxhZJLd8/VfIULUSkiERMlIYr5yWVDn+FwC6TGyWiP6AgvbIkuqNjr/wkx+8ijI+nEcc4vj3o6eacG8sFoprSZLNyrGbPvrI4YQ7RzuVfUifpjkughydRMZrtxS4j6ntulHPTAaR6TjiajPApCyjXb7yY6Lbq15k+hrWW5HzxUA+fQYGH2xS5bJYm3OzvPpdtw3uNONclA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7700.eurprd04.prod.outlook.com (2603:10a6:20b:2db::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 20:36:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 20:36:15 +0000
Date: Thu, 8 Oct 2026 15:36:11 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Zhipeng.wang_1@oss.nxp.com
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>, xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/9] irqchip/imx-irqsteer: Validate IRQ count before
 creating domain
Message-ID: <asf-u0q_4tdkOZQy@SMW015318>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
 <20261008090231.796511-3-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008090231.796511-3-Zhipeng.wang_1@oss.nxp.com>
X-ClientProxiedBy: AM9P193CA0018.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 1212b7d9-47ae-4bb9-f0e4-08df257bcc98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|10067099003|56012099006|4143699003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6ZD07Z48sDf9CVGJ815jJ+iL4goX8vEokwhqCThKIEdObiiouN5RlqgkwinTuNBdU8GaS/m69Tkri+suIixxE8k2+j1IJSiPDH4uCQ0GsFQ2HhNRF/wY5tBcSdrAxfA2LVSMHLHYOVn2jaavSPuJN3Yz/eA7A+q+vad6DVu66C/PJTsOcW4IIVHk56SVd6PL3aHQekdHU8nwIrSu0ofmIOkZHmCAcOZl+1uHinJ4aebg25f4vzfWPqe1I3Hge01N2owtqVMj1FZkxdkLJcpsbk1FeOQgPHr0RV39zvwZIx/lyRJ2xDqNaPZ5Px3XoZolpzCs631SXdhitOPqkpaMxSz5VRRv2KQMUB6sstwzeR0aTPi3Vg0J5tbFs6SKzQapDhnnpxyRSWCuqAA5DG3bFh+jBB3oGP8T3iDqqYKLJyu2iKDSOe+HflTH0T7j7uSDAuEvbl4YRXu3RxL3fgTmH+gIZVgGFUXm/iCVuNqvv1M7zhKveZ0I0lOYnUFHH1dLJKTc2eb1zjDigp9onoGElexrpVNJFKyyalVVl3b9nQxTZVlU+4tfV+/8BD1pI/2+ciGAGBFPv+iO4KA18UaqjydmqbhRfKsmfVrgXy0sTF4KznGvT5mugOWgmIAYBdtd562BNvGlmygMiIu7tx55L0H5xlgMF2n1OcfO8I2EnYg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vDUgZwY3vjfux46hoMYROtvBTh9NrRFHcz7T3e2ukO6dEfPbZS7isisk+soG?=
 =?us-ascii?Q?c+9V9Z7cX2PN/3zHkP5/2sWIRzztuxej97qgT2pDS5dLsefZ64iJgfkscPAa?=
 =?us-ascii?Q?xyRc8GNuflqTJzMUMSOk7B8tAAiv419PfS513ZnH0swE7BtrUz0XpLdyck11?=
 =?us-ascii?Q?XNLkAvpiVXGtzdXvSsr6fy2mYmyrMy9HdmzOZGOhh/+nSa16Uuy0xhRPYjPT?=
 =?us-ascii?Q?CGC/Ur8l9HkO4AeaMDQBdihSxFYha/zxbVFXLqJovR9kNExnRZc4Ut+WZITE?=
 =?us-ascii?Q?bBUr6HChIgG6DgX9Ht5hpuUof/YF6fMcxkLXVm4Q/0VqKanVoG7wPutifhqE?=
 =?us-ascii?Q?7ykACsZGNio7pbW/5jd3BmFLh7IpY5MkmonRxFrQCGMhGnkjj0HWnuwUTnA6?=
 =?us-ascii?Q?scBKSmFgwsXW5QWz3DthBW9qcc0nxN6vNKzJ7jx9SXJSuaiYlI97v1An/4yC?=
 =?us-ascii?Q?hD9WLhdMU0H1sUVRTjvRbA8NKiuWlileyt9gqwFTo/O2U6cCHLbReBTGJqjM?=
 =?us-ascii?Q?35pspkvITWnoNnQZenhxiujM/wV+AK6mqst27Yqj5zkNdPP4mHMa26Gavna9?=
 =?us-ascii?Q?zyWreEpSS2R2s+WbfMiRzDx4cVorx7pH9Ble1NRCIcNXeeQRogapnePkxV93?=
 =?us-ascii?Q?x0b3ioUHdqFodS4mqJfQAE8tAjWjixQU/YUeSPEiiKAK7O/yyw0Xwv2X5MOt?=
 =?us-ascii?Q?nO/Neqb7fX5wT/5ESJZt4c1AJwpM5uVoBtNUsC8PvgY+Mi8a4x1J+ZDNaEdE?=
 =?us-ascii?Q?MKLH5fGqg5SBmqladCBHdO/qWpeGAdysQn1hSdrhtXhUqwDfjyoFFv1aHJJw?=
 =?us-ascii?Q?s8t9b8tmmfjb+SXRQZ2lUTX9qLKD0DM/cAtTm9nYjPqP/C7mSr3SC7ygP7HV?=
 =?us-ascii?Q?ih+VJ9jbOZoFBWULwoRd5JxEr6wYXiYJIu2EtJL2XaloYMdbyneBU41NYN2z?=
 =?us-ascii?Q?P51M7o5y14d0UlJKPkN3C0TkuBB3hPtRuSM131oLr0x5OAH2a4caeA/sPbLI?=
 =?us-ascii?Q?pHNGEC2XT1xeo7BGwwAQgiSXxrdeEOjhYlRhen0npoB//t6kziCFn4NNBNau?=
 =?us-ascii?Q?mcniWSQ4tL0Lqhneq+JGDejKL+jlCPB1QHKX96ZKePgw0fwsuU3PzWKkLm2g?=
 =?us-ascii?Q?fDONljh81gy446NWF8HKTsKe7ulLUsgQBSle3bImQCCgedmjYIZAxkvwhHl/?=
 =?us-ascii?Q?an6wrXR8LYjNx6CpTxWI6MUrg8QkGgOV3Kif+pbz/tkns2mzufUd0ifJhoAl?=
 =?us-ascii?Q?MGrBgM7GhayMnJJvtZDr0ah/QvMaMXm7IEcO8xuCDjjZNpkqGzMQfYVV6qAM?=
 =?us-ascii?Q?AtS0NLb+SvyWPu1kVxMFanY0yNRHzZA/S/Ez4PcTHW4S9QEkmDrIYSLudlYC?=
 =?us-ascii?Q?ZgjbbjliS5xrdZjhjc1D49N1mgBnyGvJ98GFr39H7aeMqO4ugZFNfXCRbwGf?=
 =?us-ascii?Q?hYXJaAMCSovYCGTBJ5OZjRhgmzZQ50G0vJm+/sdv1WKqMB1IZUCd/5U/6RL8?=
 =?us-ascii?Q?ITmfI1s8JCJE1TnDUKOiqDjXRNwumADapHAAnINWybuxRNUqCDR0fiFGRLlB?=
 =?us-ascii?Q?3Xkj7Fe89IkvkeyyN6NvaanXcYsJYFPTptL00TER5Zcqh+o1B4Mgq018V4Vi?=
 =?us-ascii?Q?eDBjeikxCe1gDemEKPUYA3w8v5FEvLOuYYTXS5dgy7y0fB3kLdwz5AtvLZFe?=
 =?us-ascii?Q?BSKs+vJmxssCOn3TaMYXIRJMkWEgRE0NnJ2RlPK2cuKPXk7IwlKb/eMqznuG?=
 =?us-ascii?Q?2fhzzmst3Ig0nz3mjMGwHuTNJGCSjYyDWwuQVl+9yeeqCJuLRSPu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1212b7d9-47ae-4bb9-f0e4-08df257bcc98
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 20:36:15.5627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPSwLiP5s2w40O/cGfwO3qhJ6jGGRiHl8QuZXwx6k7DqRc6j5Uc44MNoug4DraD2EatZ21I0ovIwLWZNLsB9tX0SHH6zbF78C/CgQnxmcctB6dKIicQh+lRByP7Oz8eo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7700

On Thu, Oct 08, 2026 at 06:02:24PM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Fabio Estevam <festevam@nabladev.com>
>
> The IRQ count is validated after creating the IRQ domain. If it is
> invalid, probe returns without removing the domain, leaving its host
> data pointing at devm-managed memory that is freed on probe failure.
>
> Validate the count before allocating resources to avoid the leak and
> dangling pointer.
>
> Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/irqchip/irq-imx-irqsteer.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index 1b8d0c8eedb9..766756e76c47 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -218,6 +218,8 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	 */
>  	data->irq_count = DIV_ROUND_UP(irqs_num, 64);
>  	data->reg_num = irqs_num / 32;
> +	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT)
> +		return -EINVAL;
>
>  	if (IS_ENABLED(CONFIG_PM)) {
>  		data->saved_reg = devm_kzalloc(&pdev->dev,
> @@ -246,11 +248,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	}
>  	irq_domain_set_pm_device(data->domain, &pdev->dev);
>
> -	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
> -		ret = -EINVAL;
> -		goto out;
> -	}
> -
>  	for (i = 0; i < data->irq_count; i++) {
>  		data->irq[i] = irq_of_parse_and_map(np, i);
>  		if (!data->irq[i])
> --
> 2.34.1
>
>
