Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828C23A3E73
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 20:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791492096; cv=fail; b=rAkq7Cjf6giZ6TTZ8W/5ZElXrNLuX5c2E6JgNCEaoZzKWXWCRxTjBx8KcnAR2++qWIyrWSdSvgxEXE4nHO474/GkQsI3rHJK+B516ZunaxOozsPQBnUb0Zqtfv6NxHnZaEmhtfdM6w1SA4UhMmjGNGGYyxVvEoyt5k+TY7gsHNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791492096; c=relaxed/simple;
	bh=FDWn5k/6jA1myD+OPmooAGKjcN45U4pHSnI7mT2elbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O9DuBD7qY629FkXlKn1Qqy/vOW2kUrSKCTIPZTC6ZNhRhAUrW0emVN5jmu2B49MuUu49Nz6BUTaxcRVyHRPHrohgLBhw1ROe5lHNFTOmzFG4vXkf7CTgrf41tbPjsJF1/jSlX8Gtrf2j3cRDrkkLacqmIMuB9rpau9wadfpk9Ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HsQrNl+x; arc=fail smtp.client-ip=52.101.69.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HsQrNl+x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTBkrZ87eaADLLe2gmlJoOGI1kWm/npxj6KPNQns/62ebYXHQSEODcufGND+lnaVu2VODSdxGOUnFonFCnWlnJmkd5CFVRh0dZ0LoyQBBrUC72bA6TjB+Qg7c+SXN5FPWElZanhanq6w2xEs4+weHVErjdozg0mYI8TpXssQl/Hz9ol62PnEwesPzKg9kUwVChtb2vh10rEUOJWlnUw7VB6Y+YodeRWeFWc5dPAxjIGrj/rSd8sYCpUBLpQb5v3SLrA7Ol3UvmBt2mkQxx2QXKl5COKsjzGFZaYDesdjemAwk4Ww5YpxknKAqRj5ByPIh9/GiPjZuOZj1F/cYovE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQhlbzKLaS9sHurYqxGSU7ekR3LBGzzCe0//enaDRsg=;
 b=mHWQ5+8c2oYy6mCiepV4oDg18Vtlw9X116Tj4WuUeDshug+AtF5adEPofBM6GIbvvyP038AO1u9P1z6Nlo3Vvnt+K8edRi3OR2kr8635WPWXbsODs1IsE+DnDoaBicnP8KVGCiWn3E7UqVxTNJ7DmRfTxxBWZTaUM37Js/80u0H8I7EhDo9hz5aNvN9PL+/5nd+xRxcbmh0pW0QtuIOz1t+dEc/hXSFe4Zu+ZQsgUixHE0oNskpmn7/D9ph9LDHneh1rS+Bs7ByI2aiAVUaVdRRePCEicnlcbqTaYqhdjXW0t0t8Bs7lUTO0aGLd4Wp90nehtgsHtf61Cg71OFw8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQhlbzKLaS9sHurYqxGSU7ekR3LBGzzCe0//enaDRsg=;
 b=HsQrNl+xwGozSRGg8HKthMrRwxOVcU3/6+/ZKPCGOX7T8O6Ekr5r0dN3o701O2WQCG+/iq3XZfuGrgeiQ8Limrz9k6hcrAec4j85gnr+Yzn8QR/CpD/mle0l0iCVhcltENWTFJDC5AFjiqKOCIHF8bY4uIilhFpFFpapu7+ijVR1A1qTYN2y9jZmo9yqGbfUDurRvVXL44VEieiNkPblO4BqHqopI0XjS7ga9trwW5l0S+LAzVrS2R78qeyMO4LRty82K9L2NchJR74qLkC824Sso/DtJdZlsLc7rPLRpivdpUY6pjO0JUJrFRS3yb9AxUqhPR0Qpd3TKP/YrDkSzQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7700.eurprd04.prod.outlook.com (2603:10a6:20b:2db::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 20:41:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 20:41:32 +0000
Date: Thu, 8 Oct 2026 15:41:26 -0500
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
Subject: Re: [PATCH v6 4/9] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_set_active_enabled()
Message-ID: <asf_9lgB-ULFooH9@SMW015318>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
 <20261008090231.796511-5-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008090231.796511-5-Zhipeng.wang_1@oss.nxp.com>
X-ClientProxiedBy: AS4P190CA0063.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ebbca69-03cd-44da-6244-08df257c8999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|10067099003|56012099006|4143699003|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	B59kxzaIBb7D+vB9JzwgxbMKyw0npJWnt5wjNjyxyGkSQ/8nWdRg6d13BJVPTlFqHidhPd8iQ8om3CwgvvHrNW6H+UzawJCUisl7KGgtkQIi0kl8P1/KsVVRLKkAoMi94sGIfiJaK1gzq3LOw6hNl5t7bNlj0+yZNlRplPCL/Qx0b0cAU8qq5K55eqiW6UaguVnCpLnLJ/ewq5Bm6rxDuII+lcfGc4h0BHaQHrRc8sfiUANhOk4nQHtNsckxV4fjHUdwWzbYGL1gf75nvi/RYR/pzaKxG//+lt4ZIYXpD4WQYecYxTf1Twsvlg3fOxiggFkH2jLobHVBkzIzdC6N1/vzemkJYiKov50xHHckvIE9P8f+sAcWYqLa87X68+EJ+7hrqPNa4EcW+O2fj2uq42Gci9kYHRv9po5VBnrCWIoos/wPE6GTsAiqmMOd0ISbaFzmK6KiUeZGu58M58RLS7Ghc2oQ3VvZwuoLbHCiX3JQI3kJBcYYmUvEEbkQy//5IZMq2uxRuWgMl/ITZaBPMu9vHUvXT10UpzRrp/F2nCd5Fz+59jtCiOFqYd5Kw0BEgYTq8jQNNsnGQcvpkc1XQ29OmIq9u521LdjlU0lQ77LRVkKjGFUChhAt81nV+H1ywAj503Dg6Xi+nx/0C2uXnPmsVkC0cdfkiAfMD1dR8SI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(10067099003)(56012099006)(4143699003)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F23Sn5gZdkn2SPbB5ESn7VM2s+Q0Vl2lB8PJBa9pPnkTaEo/O6hiGRdUW5k8?=
 =?us-ascii?Q?JS9rq2Z6wvQ4/1eldN6Tw2d8nJGG1N3bs9bLdCpHfiBBCzly0IsQw5WpnCK6?=
 =?us-ascii?Q?usDhl5GXcaToAj+mi+HbrnYbc/oA/n05wOLWG7ni9R8g0q4Ngkndbpjigp8w?=
 =?us-ascii?Q?0iFW9MyQPdSHxSRHPwVbJbGtSR81C0JQpKjieJrF9cHiQyJTSTl/vDTn/qQi?=
 =?us-ascii?Q?rJ61NnZXBDEFSuPyZPvQvOCkhPZ1+/cqtdS93uigYH9xGc0Pa/4WhxqFQJGI?=
 =?us-ascii?Q?o3XB4uHODCorW4EjWp9Ge30lv3ubgdfkUsX9sHJNCeUpnsI+Zof9baDIQ7Ud?=
 =?us-ascii?Q?9pPmFSaRawKc22xN4hEjAKvQ6vwzT4opHJSkWjbA0y+iXXWQUEt4iK6+TnZb?=
 =?us-ascii?Q?H4c596wc7TbnoODQh7TSlSYoiQDd/3eFb4Di7goEEHqxqC7RegJekDuH1FAK?=
 =?us-ascii?Q?mXj4ZIrhXRA/EApupZsaMfQySYBz4AIVNQxgnmootEdorIl4mMaaGJFryFJp?=
 =?us-ascii?Q?/7wwUzdE4DA6A3/tX48k8vBu6U2WXAWN8aSvTvdCYTE+g8PGOBqqB1Lx7jeS?=
 =?us-ascii?Q?V4SrDiq1Bzd6RSExP7U64ZytawDFzZTxphXhjdjIinTVot0hl360/EeBsALc?=
 =?us-ascii?Q?PPEbfyD8IjvYRzGa13x0caqyBkwYy+1Xb3ru/imYYI5K8AH4+bQtLSmUmJgw?=
 =?us-ascii?Q?axR9YGcBe/isQEpbFkZcSfPyb27tUjdyUWLsRED7dVTVCyCx2bJ34K9xFPHz?=
 =?us-ascii?Q?AS/EaB7XgFu4BigU9HIp+uL9JI+x3cWoeZP0s5REt9XTeN600SbgnODRbMvC?=
 =?us-ascii?Q?13pwOvbWbpCbFBBPV3kWOIFJeWjzuLal1mt91S2qV5Y/JZHoOeH6QiCu8dgP?=
 =?us-ascii?Q?x4piJ0+dzHLeQVBhqQXqgDY4m1ZNkNV32oJ929ibsf84tC11L2EjSoj//rmr?=
 =?us-ascii?Q?Cj9GD7n/Cpi5xVPtN4GV7Ox2SxNdkYiU2gNSq21VSQl3rjyqyqL+cxs77eZV?=
 =?us-ascii?Q?SCHxVqum6+4+ZHUaKwv4BdPsY+FsEHX9KWy1NkuNkJ1ayf0/+SZ5iqj2LCMA?=
 =?us-ascii?Q?sebi8gxPZYvFH2uh7DbmdFowADA/2mLHknMWeWhccub6zjxnmOoWPeuENQjF?=
 =?us-ascii?Q?rI5n9RcN8AyEDLg1KDzrCBGfNEkf1P/bYBVCEHdOxZ6z7EmTOckbmY10IQDs?=
 =?us-ascii?Q?IrPAi9uhfL1oDwiPiGmG+mykaENoOV9PrnZe2la1DiX7pef9sPnGcNvYlF0K?=
 =?us-ascii?Q?mdKC3g2FiAxuJx1hrf8LU2Risu5TAY89zd2nI9xx4E77jVHXgDuBqbX71FK7?=
 =?us-ascii?Q?L8/8GwsHMooA+cbTCKCOf8C0Rh3cEo+0tljippQZllyhTg+1txm6PRggig8f?=
 =?us-ascii?Q?C8sGGJfp/2BvxENfs/SPwVUdPRyCxlGNHmbK+2upo4haZu13fPifOBu2fYsG?=
 =?us-ascii?Q?cfFZKBm/zbbk2JTMzUM6u+GyUiqSoOMlUZbcaOsZySkG/3LShYRvvAqiK0vY?=
 =?us-ascii?Q?xqLLNWmge7ZQzZl1pDh1Rt6InsJ2xuexK6TgNImPdL2cAo2qRSzIZsreViDS?=
 =?us-ascii?Q?sYUxS8N1cXnlZRWR6EORgCXYBsIHaj341DGU6gBCPo+kv7vucc4n2hi5RPjY?=
 =?us-ascii?Q?0TNX0UmsqoBVDAM+sX5JisYCgq4+MStWJ+S6No4AfiXKOuJYc1Wqjtdspu2i?=
 =?us-ascii?Q?DmLDUP3pXDLieyjPABSf4X90OHcqEvX0z9HAHSuQezVfI1mJ5zvVxC7FGDzH?=
 =?us-ascii?Q?ryIuErurmnU9YquEdRx4fgTd6uh3TdriSfyKrXSdNg0kCm+feme8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebbca69-03cd-44da-6244-08df257c8999
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 20:41:32.6793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDEUu4epZ2DFLxnNP0JVsPbVqVCF278D9Zf0hrL2AAkBpFVfGG6FbFa0dSkZNfSTa6nW9cSbIrOdKfGa/LwKmJi+hBRABqnZeiY7Htt836eRS/tfK+aXD7E3BFdGq+R5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7700

On Thu, Oct 08, 2026 at 06:02:26PM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> imx_irqsteer_probe() enables runtime PM with pm_runtime_enable(), but
> imx_irqsteer_remove() never disables it. Runtime PM therefore stays
> enabled after the device is unbound, and rebinding it triggers:
>
>   Unbalanced pm_runtime_enable!
>
> Use devm_pm_runtime_set_active_enabled() so the driver core marks the
> device active (matching the enabled clock) and disables runtime PM again
> on unbind, keeping the enable balanced across unbind/rebind.
>
> This becomes reachable once the driver can be unbound and reloaded, but
> the imbalance already exists today on unbind, so fix it separately with
> a Fixes tag for stable.
>
> Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
> Suggested-by: Fabio Estevam <festevam@nabladev.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
>  drivers/irqchip/irq-imx-irqsteer.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index d05de3d26fb2..5acc04504e52 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -239,6 +239,10 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	if (irqsteer_has_chanctrl(data->devtype_data))
>  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
>
> +	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
> +	if (ret)
> +		goto out;
> +
>  	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
>  						&imx_irqsteer_domain_ops, data);
>  	if (!data->domain) {
> @@ -260,9 +264,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>
>  	platform_set_drvdata(pdev, data);
>
> -	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> -
>  	return 0;
>  out:
>  	clk_disable_unprepare(data->ipg_clk);
> @@ -285,7 +286,8 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
>
>  	irq_domain_remove(irqsteer_data->domain);
>
> -	clk_disable_unprepare(irqsteer_data->ipg_clk);
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		clk_disable_unprepare(irqsteer_data->ipg_clk);

Are you sure need do this? suppose runtime_pm tear down call runtime pm
susped to disable clock.

Frank

>  }
>
>  #ifdef CONFIG_PM
> --
> 2.34.1
>
>
