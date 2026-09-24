Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2294E3115A2;
	Thu, 24 Sep 2026 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259568; cv=fail; b=Vvjm1v9xCQXXEQt3Vru74w4+AsWA4sYzzguSANenjIQYyeLcNWz+ZETbodQudDacqjRHohHIMsUdNPwIDh6thRwQqFO2LjyqJVThLzhhp80/roBRTGQt7qWG+S2gTobYSTBE/HYX5CVkh9SoRVbVnqDQyxawrI7Zp1lB+zPHdHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259568; c=relaxed/simple;
	bh=5UGLlK8fXPwSSOb/NxaqTnkiRsj26daXLDtIboWsL5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jHp6ipOf7IYjiM9MRFucQA2lZpHrOvHkzOJBx90uNrd8q6H5YgbvYQaWotDlsuXyA/TXMkncXLNQdhAtKZHYFdUkBmVYT0SE8lxUluCuTFYKsqafINZUMYs1UXQ+NKpzNSdvBhbMwI0j274uQ8b5ANR0TgK4BvUz+sOWKxusmXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vSnyfEKD; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vSnyfEKD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phDJBHWso4mUGlbfGwiVuWL3zMiaT9U30swvd1xQWufjIjNx7o56Vv2X15XzJ48dolzHDgMHMbarv7UYQKbBYnq10NZEVSvPyJBDsJKjmDMiCXDjOKz3NPHtuzAsPBIkOao5Stun3y63t7K2fkVrRXVH0155d4LHQn67QowTSKaFh5Dap3y6hj48AEV5tBz8lQFSUvivnrTxBLkP6trIMFPypmQUspb/zah7h0snIqY9+ePxjnkRevFeayqVNe7koXxnr19TKe68/5pccdrWrqoN0tOlWSn/5snFUWvHGaoNnizIoEk3JYym8pst/DIiy1ZCN/UhxCw4Hz5tVAw8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AerwPDO6NKHjqzStHYHRD0omEp3+3gp4i+3PR+nyn3o=;
 b=vh/YA2GXlJGphujQxFMtOxjrue+hC5WVu1RDYv0QBhRMaDRs05kP7XyH4aAQvRFZKRMRKRRvkFmY7ANg/tw7Ix2o+P2n1t2asX799/vvaSTV7VswGDgfBQqJwhIHwr2ETTKuxzVcevbw48izSi8w+gmcrYoP4xzD9+GCTl1xtzl1wO3uOurjwi3QdUjM66YwAWDKjTCsPMh8pA7qYGyvob/RLnapEwyzAPUYEzdVVo7/poSsyfNqH4+9G444U8vLuuIk+QznlT6jjwljcNp2ZY0oA2+7iE2h0e9R8rnjEs+f4+/6qgkTu9DQS9TeVl8wWVFCcnfZDfWVSDzIxTeWww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AerwPDO6NKHjqzStHYHRD0omEp3+3gp4i+3PR+nyn3o=;
 b=vSnyfEKDI+0cxiItwfoXK+6Egv2enJ6aXQTlCbkpL7wGs4k42XfFZJ/xTDmJ3I45PYPKBrO1X3kc2Mj/VmZ6Ljwr2Bbcc6mF3rE2fOuC6YXONcHftHkCo53/EET1+zNiLrwFd+J6esMmwQTlWzH5F+34eANPziSQwqGA24dakGJtUp3a7ji/Ke4iAvJjDHd8fi3eSXrDaHqJfHeEmmdSyPo9RzkgfUT9NpC3bcuxfKXwRXpAWzswfp4/toN5h0RLxNPt/kjJHCU6Ot+hJy7BTPdbEj0uhTYceuW+GRND/DNx8OXbEug6HYDfrD1nJjQol4igoAsx8k3ZzenyXs5MvA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MIWPR04MB011266.eurprd04.prod.outlook.com (2603:10a6:290:e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 14:19:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 14:19:21 +0000
Date: Thu, 24 Sep 2026 09:19:12 -0500
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
Subject: Re: [PATCH v3 3/3] media: verisilicon: Remove useless internal fields
Message-ID: <arUxYI0DP-nwjmg1@SMW015318>
References: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
 <20260924130453.196299-4-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924130453.196299-4-benjamin.gaignard@collabora.com>
X-ClientProxiedBy: PH7P220CA0067.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MIWPR04MB011266:EE_
X-MS-Office365-Filtering-Correlation-Id: 0687a3b2-cd38-46c3-d3ca-08df1a46d3e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|23010399003|7416014|376014|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lxNKsUGatlPwgxlJH88pLfWzTxYKxlfvPl9VPlAwUG2u7Io77/RVm5A/SvVNa7aZm5QkSTT/THkshN1BeI3A22fAB4Rw4VxFpayPOFhBQSvLggtdETkJvKEMb9KjrZrOay1NjqNF6nHmBxK7hp/QlAoufxNbSc10sDW/PT5C763soWcMYdIlixPLpGYzATtQDLHM4nKMXZ1W0wd7jNLx1FNDXc3dPyEqFR4hUHFPXl5xRWxriEd9V7te2zSwgXmagRanIMyhHy3ccvPQzXwjUyfKqF4KMBk9p2sVqbClgrRbhuGDvKsgmaDd66zjfhk37R+M22o9l4BTUt6xyBiuD5WAFrJkuzWHfOgG9+B8Mj1bNldO9Prc1+Y7hV8wvrFeVV6cy0kJCbCfRm64tXnpEHMFy2VQAD6IfoZe6S9dt/giJOPnZYoTv2+WSqso5142ALporiG2laK4tq+UsfU9jxUL1aM2XWBfdWfHNOpxLKGlbBZ15xpPIlbK1mhGB0S2M6G4/rt8ZzqLN2r8K71beFCndj8PdA6YC7Eit7kB11q5gEXlCj0TMEOaTSLABPtsPIGzXutP8KnE8b9aKbeO+NC+4eycUm84wSUqLWiTed+v1Sgk4HwrRdv6BxMstjZKmMduXhjksmfCOjRQbRX4VE036v25wnvZR4uVOcoRC8A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(23010399003)(7416014)(376014)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CDmLQqGB6lWxxI0peOyX++pNo+jUL0R4bKKpejCRz982hJ9kp05Ds3E95yLL?=
 =?us-ascii?Q?Peer0bkttoHwkmmI+czC3f6zlgai6kqhK8YsyxfMdDjzn/y2ei64FnTxZoUO?=
 =?us-ascii?Q?PSqzrNjJgTwhl6sGXTf6Ioy0/6sjc8NQDAIDorVlaui9bjgI5Pyv2gyHsO3g?=
 =?us-ascii?Q?/aua9XTx9Dtr8PObkAYwPQBwnxvzsVH+b6HYBOYhzL2Xqi+lIa71kK+Xkpwc?=
 =?us-ascii?Q?+TXoD/7PoRsQnvMh/A8+AOAeDdTOlHXqEH/3/GDYTHWRNnf2XreS+wog69He?=
 =?us-ascii?Q?nXxdMOaC9MhiEp8adhwV1XIHH8KMadmFqOucIL7/9s0WhwI5JEwi32ebOH3G?=
 =?us-ascii?Q?GZ7uZt7rYogE9t3HwsyfWMP0xlc2x1zrhLmbuuGaKK0efXCUUTvzVmBv9lD+?=
 =?us-ascii?Q?em60RVFG6wKyGQSKjFn4KYirX1IN3GHTtQPzGIgC3AL4cYzyX+q0x+N0hQhg?=
 =?us-ascii?Q?as6A8bDD8Fe7P30ADuySW4TkGpvJBYNl03VTop/byCXkU5zBy42zPLIwqW0t?=
 =?us-ascii?Q?niVUvKuHK12shEk61XVGpR7RCqN5FSgYpkm9fPEcRQyz7l3HJ3K+czf/6Kxp?=
 =?us-ascii?Q?0gr1arPE7etikKPIQaxP9+X+WkWST5xAN7yA72JFTpt/x701EMGSjBcEVtfO?=
 =?us-ascii?Q?9v5RGlV7oni2+gJS+Xf34A50eNwU0vtpMbs9cfnKkadZ0o3KNvPYiFTr8i77?=
 =?us-ascii?Q?UNlIPFDRgPOTC9Tn3JF3VhN3BZvKoMC5kZnJMuSkLaT5JwVgYbMTsAJIkrdd?=
 =?us-ascii?Q?Teg2E+IvALZWNGRXEyaoc0RpRZkg3/bghIBZL8yXWy2PIRihzCQXW613yH2/?=
 =?us-ascii?Q?eoXJsDCizjaGwg5lSAj3pNrAWR2R+0YrRtnHZDROi70D/VoOjvQLjreUv2Ib?=
 =?us-ascii?Q?sNa44cfbgAOR28253kIjNL/SbXMfuJIpbyn34BS9qKLxSRloUoPZqYj9vtDm?=
 =?us-ascii?Q?vgTkOlo6fPWde5NzgCjeBzbvKbiLsxA67U+TGmx3Vw5vaivo7fQ2W6/ENyDv?=
 =?us-ascii?Q?0iotodPTZc9LpqrWpkhBDt0uVowUkqoUoNKmhAtz4bgxmOnhrhM3uZ5hWIB6?=
 =?us-ascii?Q?k8LhX1AdmtLp+Hp/V5gN0y1DkfgYYG1ZhawHRg7BjVGOWprZHWuvfZRAJzNr?=
 =?us-ascii?Q?JVV+YfLZW7nRYbpAeWkhvMfenVxmXTvI9YOcY4/IdXbxRD++nAq1ke7w1RF1?=
 =?us-ascii?Q?Lm9RC1VZBZomOnnx/wqi3rFDN/YmeeYiADljxlqVrEk/QD0D/PSX8C9j48DJ?=
 =?us-ascii?Q?sgBoqh17sAOVKPtxqWGJxs1I9vkGDUafyB9mCW+mVb+7/P55PAxkjHS0pAy+?=
 =?us-ascii?Q?TD48CWRsuNWPkQ5TLK4e/iuYTINtXDqU4hI8I0PeUCHDfZ/WvPoEnyH/4YFJ?=
 =?us-ascii?Q?N1tWKyfAPgUa2EQ39er7o3R121fDhu76a7fKL9/PViv3Dxrwbr45PsUn2URi?=
 =?us-ascii?Q?vMVv3Y5+uSSffPQDaGnVS69d5D9eDgXXFQnr7c3KidTAnaKAgorgaE0a7tgW?=
 =?us-ascii?Q?sly8iSF52EUfmobJFxR39paEKQj9R6L21k7KF/cY6PVxNRGZGgb42/0extVG?=
 =?us-ascii?Q?VDjWGH9v9ZRJtjgLjgQ/Lt9dewkbNJmGdPqaY/WaSUnfwMv4DKpZ/3yW9GSY?=
 =?us-ascii?Q?Dt3eZzVEqKnf1zJpBPYEdexasYFcYSUmeXUG0QJzFm8xfHfup15ffUzlXbUi?=
 =?us-ascii?Q?hE0gPEUJbMqXaum+qLAEj6uGn6lJXy7i2OuUP4P+kw1nMd57z26casVVfM6z?=
 =?us-ascii?Q?5G3dlc15wplz0/eMauOk3dpKXsZaaA9QOhiBd22IOOp+Rkm7JiWK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0687a3b2-cd38-46c3-d3ca-08df1a46d3e7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:19:21.6497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gErx+kKJo77Wy5sXGOBjWGoVnmD2kUpJUgG3v/IpnB0sANX9vBGqmlYu4fQCj5ZjL9jp8GRCHxZSIFejszLbmXMAUHAxWqoxn72uUEeQOs1azBdLGY0blFZIxhYye/Pa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB011266

On Thu, Sep 24, 2026 at 03:04:53PM +0200, Benjamin Gaignard wrote:
> No more variants are using multiple registers regions.
> Remove the useless fields and simplify driver code.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/platform/verisilicon/hantro.h   |  9 ++-------
>  .../media/platform/verisilicon/hantro_drv.c   | 20 +++++--------------
>  2 files changed, 7 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
> index 0353de154a1e..ca03bc690fbf 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -72,8 +72,6 @@ struct hantro_irq {
>   * @num_irqs:			number of irqs in the array
>   * @clk_names:			array of clock names
>   * @num_clocks:			number of clocks in the array
> - * @reg_names:			array of register range names
> - * @num_regs:			number of register range names in the array
>   * @double_buffer:		core needs double buffering
>   * @legacy_regs:		core uses legacy register set
>   * @late_postproc:		postproc must be set up at the end of the job
> @@ -97,8 +95,6 @@ struct hantro_variant {
>  	int num_irqs;
>  	const char * const *clk_names;
>  	int num_clocks;
> -	const char * const *reg_names;
> -	int num_regs;
>  	unsigned int double_buffer : 1;
>  	unsigned int legacy_regs : 1;
>  	unsigned int late_postproc : 1;
> @@ -184,7 +180,7 @@ hantro_vdev_to_func(struct video_device *vdev)
>   *			dev_ macros.
>   * @clocks:		Array of clock handles.
>   * @resets:		Array of reset handles.
> - * @reg_bases:		Mapped addresses of VPU registers.
> + * @reg_base:		Mapped address of VPU registers.
>   * @enc_base:		Mapped address of VPU encoder register for convenience.
>   * @dec_base:		Mapped address of VPU decoder register for convenience.
>   * @ctrl_base:		Mapped address of VPU control block.
> @@ -204,10 +200,9 @@ struct hantro_dev {
>  	struct device *dev;
>  	struct clk_bulk_data *clocks;
>  	struct reset_control *resets;
> -	void __iomem **reg_bases;
> +	void __iomem *reg_base;
>  	void __iomem *enc_base;
>  	void __iomem *dec_base;
> -	void __iomem *ctrl_base;
>
>  	struct mutex vpu_mutex;	/* video_device lock */
>  	spinlock_t irqlock;
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 12c804dcc669..6e3a24156a69 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -1080,7 +1080,6 @@ static int hantro_probe(struct platform_device *pdev)
>  {
>  	const struct of_device_id *match;
>  	struct hantro_dev *vpu;
> -	int num_bases;
>  	int i, ret;
>
>  	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
> @@ -1128,21 +1127,12 @@ static int hantro_probe(struct platform_device *pdev)
>  	if (IS_ERR(vpu->resets))
>  		return PTR_ERR(vpu->resets);
>
> -	num_bases = vpu->variant->num_regs ?: 1;
> -	vpu->reg_bases = devm_kcalloc(&pdev->dev, num_bases,
> -				      sizeof(*vpu->reg_bases), GFP_KERNEL);
> -	if (!vpu->reg_bases)
> -		return -ENOMEM;
> +	vpu->reg_base = devm_platform_ioremap_resource(pdev, 0);

Please descript reg_bases -> reg_base change in commit message, it is not
simpile remove.

Frank

> +	if (IS_ERR(vpu->reg_base))
> +		return PTR_ERR(vpu->reg_base);
>
> -	for (i = 0; i < num_bases; i++) {
> -		vpu->reg_bases[i] = vpu->variant->reg_names ?
> -		      devm_platform_ioremap_resource_byname(pdev, vpu->variant->reg_names[i]) :
> -		      devm_platform_ioremap_resource(pdev, 0);
> -		if (IS_ERR(vpu->reg_bases[i]))
> -			return PTR_ERR(vpu->reg_bases[i]);
> -	}
> -	vpu->enc_base = vpu->reg_bases[0] + vpu->variant->enc_offset;
> -	vpu->dec_base = vpu->reg_bases[0] + vpu->variant->dec_offset;
> +	vpu->enc_base = vpu->reg_base + vpu->variant->enc_offset;
> +	vpu->dec_base = vpu->reg_base + vpu->variant->dec_offset;
>
>  	/**
>  	 * TODO: Eventually allow taking advantage of full 64-bit address space.
> --
> 2.53.0
>
>
