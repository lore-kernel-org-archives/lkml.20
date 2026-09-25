Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C959B38D3F0;
	Fri, 25 Sep 2026 15:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348623; cv=fail; b=M4NyXWcRwuIC6szc2yTHU3pLRRO1DWrZ8+kcUQSJNxppKt1izpLZX9YxnuED/zWkHApHVt6JKhpd94a7IQyCxzcetqnooo0ilooCZ05RjZTlLEBCZ1Ijj5vGZwq7SmG1cCzurKdEOIjmEMKsMbEoLtTyxf0IBxT99KAYPXxrzm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348623; c=relaxed/simple;
	bh=cMFwkfbLx2UShfx48RV9BPcPCb2W+imm3zx10w+xeV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qj4mm2oD4aPiVkLSvs/iAeP3e8GohLeiVel77lxjJroY4ZNPwnPnh31WqBpkSgKx0OBGiJHKrtsWlc7jspv7eUyNvlPDygBpM7Uvbp713ykGMtrKykFFzFyGufEFFvvoo82Wg9NgGhKlUAx354NkXedSDcj81mFyGDkaSovj/vA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tI7du/oX; arc=fail smtp.client-ip=52.101.69.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tI7du/oX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdCEz9pGsLILzPN3+NgAxjmNZlb4luHguXkkIXsNp09X25vIqYKTjXY/ZUMy5qjKUZJhAJXKuUUXz/yp+w6xybGsE3uf3g6oTLUlhjVdy9oAUzOeZhCWXnChe2li8EuY+cgvhJBUsenqFSxMr70jiU+GVEnJ8lWmHBll09+qg4WZ8RmfEMUVlwHCMcRSvDJYkFlQzN03uSnXt7/9Fl6SPOQ8UrLeA4s6m1eREAjcMI6KPB54O65H7Jmj/Kywsejo9H7DCgJNSxiNqHhe0bkqUHUGEBZAtcsdkpuTN+w8AS/cWzaTd582ACTC6MG4Mg9SRGzaFvlbBlNkWDHWi+rB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ol2/P943VHNX8pz7YbLs6fKod7p9P9n9+1yOpUCN/Gk=;
 b=uIIK6hDCCGxu6sgMalbowqx3TClj6H3DPeGa7UKJViWnn7+8oOmRz2WqEcdIk9KHybmuIHftE8KUDJfmiUYb4RG6phf+AqAwdG9JbWNIKA+R7V/0H9sg9XkMMl/tzgeAJS13eWY6A70IKlSd63kQVFsO+RWwuLo4GSyJUXPj0fQssoMDS9ysR5aiihGwuRqaQqfJTgnqlT//oU6gDqRPz8U9TfeisHen30FjwSmBw3q22udkIYe6pzO8qtuj6/qSFMJ3zNjBqCkgp0Pf/nniZpEkF0YPa7PMUHjO+rhR9/nFSOWkog3YwaL+rEkyLDw+iCjDkFgfbR3ovYxWLfvxSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ol2/P943VHNX8pz7YbLs6fKod7p9P9n9+1yOpUCN/Gk=;
 b=tI7du/oXoRWYC2DIQZtlDcQM/PF+jIWSW/usSy9MqYI6EnITGxTw776vMtjIphiT8lNCPI2xSYFxHlf7NYIuXC7PU88vfsN7H9lnVErWFG5h8+JYeOY/8VpxVHhl1HHOh2nRlaNIfzBWoPPcXoL6mITsBMHi7xeDtzJ9b9VBbVcie3twYDpxoy5wOizAMqUhUypIenaWWwnoAo8hK6jUcdfDbHVn6CGuok4gI9NVAaBDJmcJntG1jfIQMfnf6yJb9i0zOg0aDDmSLb3TIb18wG45JRQw3YTX6LrOmJdNVij59/f0xfWXxQpQ06d4jE25RwQ/MM0Hr+Bf4rv26HjlbQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11896.eurprd04.prod.outlook.com (2603:10a6:150:2ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 15:03:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 15:03:28 +0000
Date: Fri, 25 Sep 2026 10:03:17 -0500
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
Subject: Re: [PATCH v4 1/3] media: verisilicon: Remove deprecated variant
Message-ID: <araNNW0RyJXSt5ST@SMW015318>
References: <20260925085152.41852-1-benjamin.gaignard@collabora.com>
 <20260925085152.41852-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925085152.41852-2-benjamin.gaignard@collabora.com>
X-ClientProxiedBy: CY5PR15CA0125.namprd15.prod.outlook.com
 (2603:10b6:930:68::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11896:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7203e9-0f42-4371-be85-08df1b1627d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|366016|1800799024|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NVrBqgFNzEOKpoaAMLfnPX73F6IDOihEkCgd4JWyWhWLLisU3xS0o0q/uk5ZhH8inB3UmIGGpkcsvUMmGrL44xIBzpZ1pCRwlwm1U17PmoYZwk/gHe48Y0C8lQoJjObInaRRnA5YdrxSSkKIlwfB/9A76mkscvAutgxAdDhE1hLLgp/UCqi7JgvpEi59r6MWXxlNlssx1WtgzAQVAP4MGjGlb6oUWrW5AVMycjdPA1+ZhpHLr5bFivIHzv18miya/o9xcWpx97lP7mPUTCxKrWVkOyNf0vnMtrcOi96b6Ja+/0zbPKdr7ui35Yw8EMkrdLxI10wJK2Ad07ZBP4HVZHZsj7GgZSnubZ3w07GxNk8+EkH5pMSOOCwLKYRrNI00mXzM7bYJVHur3zQou+xT69SaOvdESrhlcriFD3OoqHxDg3Js0zA2iSgwx0fFRzoj4uv7iJMhrmO6gCYiNBtP3b9qd/C7PL6lh6OddhyZT/SUxkItSgsCC0m1eXb4TlSqJbXyWSoujdeaAFGLprGb6gTGvVPXjUk8gDm4n+I2Y3y148kir3wx3xOEJr7+Cc5o5s62CGyVAhOecR9Kx2Wu8n5oB2Nkq35BhdXVPq5jKGJeWCVPjbbSTgxxbrHlfyalokVR2CfG7EoyA177s386WiU/3i1+yEetPn9O65pDy8U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MNaUQsCVDCzgP6SR56U+d4ROw0tiouys+BGSSUU1jS+nGs0HUays7QlPdTSf?=
 =?us-ascii?Q?b6O08ZFKKI8dY06JNyvD3BJ/0zQaoT/DlUN41FkQfTEKejG1zbD4mmRrEoPb?=
 =?us-ascii?Q?P8OuC6eeQVIy6mdAIxDeRKRAxLJwj7U4zaenaqLPwdtMLM1wXlgwoSfUrJ+H?=
 =?us-ascii?Q?wKE/WI/PYizhLnuDWOspu40E7RRejZgZbYm2q42y8MMxGu97BMQRuE8PHAve?=
 =?us-ascii?Q?6RHqqBCJ55jEa29aDifQt/c2KgskjLryaqgkvUdwA5c4Xb0ej7U4JQy4bb1D?=
 =?us-ascii?Q?19npQhY2lQ78u3/zPPS5hOlLRitmapiCWtI/jIkIGHa1CQ/U73g7vhFg/e7w?=
 =?us-ascii?Q?9Tt5CLYQxEw+PWhV1KyFvbk56Zbyr+reQT52GTatDI3lRIMrOR0sseCk5oVH?=
 =?us-ascii?Q?7Ku9c2TX1SQrCY1UmvHWZD2xWaaRN5/FeO5Rhff1I0O2y0BLgKNeh3/RlPgK?=
 =?us-ascii?Q?kmIok90FqlpOoaPfgOsNYPTy2cP5VtHsFAb1nxPiqspE3sRDlffj7qdMULRf?=
 =?us-ascii?Q?CaU6YyuIcpnL0H0EnSZUzMHfm/xR2mNaB+SWnlXbhhSf/rVIWkDCyrjGl0YR?=
 =?us-ascii?Q?SnBJ9jwrimGvldGE7ehx1cbm9eliwTb8UFky+V+v/WkNIXsT++6Adlyi2LSs?=
 =?us-ascii?Q?CrPxvJQOEDX6WHaDPX2GMxGlmwFVt82Q+BKrjknhN0Rw7i9nKWbRIY5U5+DF?=
 =?us-ascii?Q?fMWvMP0fBHfND8fdK+EvWhN07xLTWnEFbXfDkyAiv/qx5NtLyWsRE6huXM4g?=
 =?us-ascii?Q?SdpykVMgqXa8YDuEokkHu5Z00JlLl0RvQfgQ8azPiZuYLtELGqbN/3VeR1H9?=
 =?us-ascii?Q?lTHJ8BFQRNRsgWwtuj8CayPMIzovGM/2mMqkeWIRMwIs1fCQgrBJzvzWp3kX?=
 =?us-ascii?Q?bkf7ItOD7Ns6FRY2ngQ3kRqiiGbLgD2Qgz/ghApu0WzRALQ69OpKMRKTPOKe?=
 =?us-ascii?Q?mBHtFyTTZxaA7ea4lXt/O2FR9k2dcG3p7hpyXyzuVG9uFTiDsaHxN2p8fK0Z?=
 =?us-ascii?Q?PyHW4E6fU5OE34A99VTGRlq29dFjRp/Bx6H+M9VAQdDkmjm6uRUxjRY7Zgoh?=
 =?us-ascii?Q?mkf5yRl7RQagCFn2CGnxmHBaxDS0oMsu2H5yqkXYZzgRvN6ShP4Ue8XVQzE5?=
 =?us-ascii?Q?EjXZbsFD/b4iE3uYPtS3zcla8iwTfdVtxg5wLRCMtfN+7HrcwjUs32ebURfP?=
 =?us-ascii?Q?IKHrJmp1wgm8YK14ycRt8JGbXS1OFTKuwho4SP7Qkp1TKPVoIlpjWPOmo5Bh?=
 =?us-ascii?Q?wVk/PBiELhDqhNHF8lzBcAUvMn0NA4RE1lLEAckkWt0yPk7OhlPTsrDOfBgD?=
 =?us-ascii?Q?nQv/JQ9eQmWpNjWwQWpWU6hVFJKwWJjz5sxihiQC3UbqpvTleQ0wH60qK6x2?=
 =?us-ascii?Q?RQx/gWX3ABrPvNNAebPaM1WPtSE4TDch50+3FXqpC/IiHU5kjJid3kVcKJpX?=
 =?us-ascii?Q?oJVOKwuqjmbovNjGE+vzwRyP9yXh3JCbeRD3qOnlbROcMdowI59RyEgKc9as?=
 =?us-ascii?Q?74ciATI84xngOrJgH4mbl3HZf7vka/I/CSZDg80Ir6sjoDpxO3y3oHzRiGPQ?=
 =?us-ascii?Q?oduXBh6QaN0rfRwwT6OyEo2Yv58GjyOz5MjAO7s4F6BYXwZK89ZjUC+/w+oY?=
 =?us-ascii?Q?M8BHsMi42RIpWfgpFlMHsoDEvjNmwwL4NkGdhz43EOov2mOcfDBZlmUJo+An?=
 =?us-ascii?Q?w+6e5aLdyiBUMDtCJ7m7liNKuQzsmFVCtIygbJ+BNni+Egn3mUW1jt+/4awz?=
 =?us-ascii?Q?7nvf4uXe7FmVcGEODA1viyup6jf2q2WbeuB5+A04VmnW9TUgjAq3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7203e9-0f42-4371-be85-08df1b1627d8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 15:03:28.4908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFXCG7v2IWmZjgfbSTVR3dA4GNk6rbnb/EiSxcyxAz94CbgPKgEjRV24Lc2a1y37BqkDUJwIsBt3ieO0YruK7sMShMX9sS6O8QHZfl4ptShIHSlNKSrTjOSEfM6xsOMa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11896

On Fri, Sep 25, 2026 at 10:51:50AM +0200, Benjamin Gaignard wrote:
> "nxp,imx8mq-vpu" is tagged as deprecated since:
> commit f3116f2e52e6 ("media: dt-bindings: media: nxp, imx8mq-vpu: Split G1 and G2 nodes")
> merged since v5.17-rc1. There is more reference to it since that.
> Remove for driver to clean up the code.


You missed update subject

media: verisilicon: Remove deprecated nxp,imx8mq-vpu variant
				      ^^^^

Frank

>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> changes in v4:
> - rework commit message
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
