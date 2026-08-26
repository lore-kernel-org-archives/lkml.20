Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9943D2236F2;
	Wed, 26 Aug 2026 16:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760561; cv=fail; b=ltvHU0p9UF7JsknBY0yKl2d8kLWeHb25OHKM5a27HjY3uYBCbrTgakpm6eM4l512DQfwe/wr7R808PA1kEh6Ho617dWFslNeAdd0TktFvSuqiJ14dUFYZKTS9Q5fgkCB2zH4NWIHoA6TUNdw2UZYw6FqataLHfjAnGQ3qRvUqbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760561; c=relaxed/simple;
	bh=zIqIGMarSX1keYsMuIlZdGwS3xooGKzHHtP0Nb35O14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mZPjavDjpxdLKPKM99oMbgXOLyIjCGSoFd7230VIxPQTs7Oi8A5A9+ccdNGjkATfzhedKaHcfRqnIQ5L1ZlhbQO/gBiq0RtxSWbM3GhxDQ7IiCH3olHV5ihJ4ZcmcL6dUDmovVxPg5TgnacYAwLUKGi61QqugHYKM8mMjvox0Pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=c2XMTExZ; arc=fail smtp.client-ip=52.101.66.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="c2XMTExZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hj3DzuPH7Lgf7v+V/pFVLEspTH1Wz0ILvlxiBXxgnaKHtI/64d1/EQ1XOFFUqYf2CN8qDlgUPvP8JAY4FDafhI9dfn7p6jwL0EGsMuEsh5SLof/GCcyxKr9iaO4STO6U62nvjeWx8qm7eScnL6lEkOia2z2R1fNodNXdscJgYGOPZ8VmMFHNW/F+5VTLYETED9lrxCxJMLBcp5uYgTsJJcAzj6Xb8BZYDH6YUK1KdlWbuhWWWUTOe9c1D17Hmon6Jy5/deBEmUOJYlBnQRpP9lM6aW2ge3PQCPR320slA1vcoLPsEiISPwOP+wulhec8FPGsADonGIIzOonE+lZPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAFihzp58G799kmRaa8UWuOXh4vzZ+m8ClBZ7HOpGGc=;
 b=b3YMIuEW+8cWgXDTr3xrX2h5ifsUrE+DF5Pw8tpvD0cGR9EAn39rWb/q+N8cjkc5SJUKivMi5iicvmIlMWjjQxkee8eLEkdeXVit0NXZU4d5vHKeJEL3IXyu5MsZ4WcgmHEXpEUTi3V9l3Nzoa4yNc9iWfzImBQFdUWy8Ct07cLCWY/LzRdYKLBYcr3YonNOKb/TwGUuN7hUnlUERla+xTFs77TPI9jiMl5cfWiG5Nx4FJTt6iqgAorM/VuAs5zy976hKtBlG5THpCA+FHgXYwn3qtqjGie5VwtjXCrOd6HZBJW9XdpBGbwE4HP8+ecQ0v16AsnQEMY/JS7qlQrwsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAFihzp58G799kmRaa8UWuOXh4vzZ+m8ClBZ7HOpGGc=;
 b=c2XMTExZqxLpKrtEI7/7CIOo3+nSUKp+lf+UWrQFGx7eAthICJ839iHdFs23G79uN1oFZSVlwVZT0U55OWV8eXMwB0No5VNiOr/0gJqrCtlpmmh1kUf1nx2y0cElU3nyBoc3vQZwjWfO4qa2serNE84XMgo6JcQh+mvaLaRRmNoWARd9ERPRkvqqtNQW/2khnFucYwXLcVcrFL5FOIi02IfLXTiYUUhLYhnDmF/kYelaFk2/K0R5ipB34kWzd4N2RFarpxkwTCNSm/UApwk3GqcNgLdDjj/reoM1xXuzIyyg3+5yvl4HBWoQsyjZCKeuQycoGFe+oGEE7z05D4czdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12) by DU2PR04MB8632.eurprd04.prod.outlook.com
 (2603:10a6:10:2df::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 16:09:15 +0000
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953]) by VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 16:09:15 +0000
Date: Wed, 26 Aug 2026 11:09:04 -0500
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
Subject: Re: [PATCH 4/5] media: nxp: imx8-isi: Add i.MX952 ISI support
Message-ID: <ao8PoOqPX7gwlm3L@SMW015318>
References: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
 <20260826-isi_imx952-v1-4-cbfaaa3f0000@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-isi_imx952-v1-4-cbfaaa3f0000@oss.nxp.com>
X-ClientProxiedBy: SN7P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::17) To VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB11784:EE_|DU2PR04MB8632:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf2fc2f-c1c0-4f7a-54e5-08df038c6000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|19092799006|366016|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WkxqPUDZ1C1jkkoQ88MpCy3JBMGNcBfdkcQxBcffz8Ss0jFlfDRJ6t5QVwso8BYlfJfq3svYNICpSP/1722EVTQVQvVnOZ2MJFjn9T2yFz91h1ks9WSG8RDnwAED4h/eOjj0dODItBla95xua4Z+dzC6/tkPPkOmbNuI58C6YUC9UjsHDxEGYj1OwvhfUXfkGsbJT4qmjYhGr2D0sWgPEPTLNaeqKP4tfEr0D3TKtbhSmONUABWos1sEu4S5viUl7WIC4Mcar92SVTXCNpHdCmJJ2FVed/ALTKjSjWrge4+PcXZAMjCuVaqVjmXXse2ieMBjr1CJINnab+7Y3GqGhrnnPUSp7ShIAthHWlBFogLRCj4hLxN4GFWqUK5sW7G8nNz6obMAaCoZ78RlH+hjNoB94U3Tl2/vTTl3iraA6KKT9iGLl090/z8D4MGM7KDzZx++tKvHTsdMCuV/Q5i0jSxKzBM7FMJ9oAiEs5uhJ+lQUHC1Dagpy+UN4cv4F8Yyzobr52gyXM63SPM2HaWbmteQ7kXRvwNMTw0xj4qGu6gLKNtGjwjL61VZpNEDZHLAMBMfD8ncQ9NqGx/WRgliI69/kl/ZpfqDhZ+T8kpWuLUr1swxca6/dk1fEXdi12xTHo1cYq3zq1P9hCuC4SAHmwOLEHiHpfwrk+WrEWt9JKw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB11784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(19092799006)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1dKNEHcylF/uzpraRKaoMmvTQgDEt605aptc9wg7v4ZcfrWAa97b03XW2h3F?=
 =?us-ascii?Q?PoqurdOCyJjhQ4ByxhUgUPNjJESBQ+TrtUvRvPQp2gtGToC5sa8uaaenvtmG?=
 =?us-ascii?Q?Xgdmp4i8VhsaDIGY6hy89RORcETBIOKuJrn+YU6bDkOSQH/vw2D8Bb/Ghio7?=
 =?us-ascii?Q?8ocelvtRTHBIjWrhTyEbMZZzmP+aZUR2zXJ4ax0BF4WEFv3ZGMTq1Mve1jZV?=
 =?us-ascii?Q?RMbtSQIrLbq4vLahpN01FvnnGPEEtiKs8ptWUiCiBQzF9rl5PQNXyW1x/3PM?=
 =?us-ascii?Q?H0OyXKFg7CHWsJ7y9y5ZPUAvlZ1D/iJzj1CLMj2qur022G8ssV7oyWY/kWKc?=
 =?us-ascii?Q?M33vHUKGETiu3qLgptgr0YrOnaTmDuTv8xHBhrpKaKT7OQX14UKPKY83VIvG?=
 =?us-ascii?Q?TKjJBbPh4QaDm0D6KINe55Rg3Jh4hh8HVJIwZtCyqFCxLMHvroZCkDhvKOng?=
 =?us-ascii?Q?WYFUlzwfcw6NDUPoaAFu9Lf1WIQZIujMV0GVijV6RtGvdRwZlqo+CLoV+yvO?=
 =?us-ascii?Q?jKlVlx9tIb2jRxxx0Wc4haQ7Ti7/tForFeg6HRQ1L8YRO1r7UPiErxoI3FmV?=
 =?us-ascii?Q?KYZy2edHdsqsPW7n+aSmMPV6Zf2qyyqrxhlBYa9ImgvcWSeev4PM8EFU97wf?=
 =?us-ascii?Q?7XelLPlRez/zh4B69/wTXZttfIaOecvOmRG0XskeI9um5d3cVTMi5l9rL0xf?=
 =?us-ascii?Q?qoPck8atS5BW1pVTI+7ctWikHYkn7mJlXhxg8aYXxD/xFMcZDDVqEpa+6H10?=
 =?us-ascii?Q?X6u4uVunN088Msj/BWL8mIhCQLlLN27E2Nxf6XCtsnk3jmM0XjFZmd3uPA54?=
 =?us-ascii?Q?18WgKUghd0jP4ChoOcIaHqXZGklF4Je7635zbejOkqzYMuMDFayKuoMBxLA1?=
 =?us-ascii?Q?aIAVHONgt3a5cwE4ZTj8q2iJwn0iLqXwv7Y0iaJQFqErqKU/Wjasy7eNjxqc?=
 =?us-ascii?Q?tFjB7JCDCWi0OQlEHfhVbhV42UFfel5kqWLk2NbHERRKjPfiq4CU1tffw2QX?=
 =?us-ascii?Q?7VK9GFxhwey4IRkz1omjbpGuGlVcW3Xt84wl4W7Htg5jMFv6+jOp+x1luGt6?=
 =?us-ascii?Q?jXpRqUcGXOL6cJeD1DDFEqdZvu+JrsDITCAVd2p06yjErC7LYBRSauDbcpuv?=
 =?us-ascii?Q?SC/QO6mgtbnDFF2XDH8fom8FoIylJ4pWpF1YET5+3zNOXfeTF8E6UyHnPzPk?=
 =?us-ascii?Q?aRS1Htx/a8S+sR5X3b5zPFYVgrUtViHxm6NrJMOK8jFm6J54YwmGCN9oR1r+?=
 =?us-ascii?Q?yz5UyDVI2v5QslAc36/BwhZA+1DW8pmsf3graut0/emxnP82gPdeOqb7eY2+?=
 =?us-ascii?Q?7BkDrye8K+DJ1L+FEYnkTT2/sGjCNTuRQsh4HbAsBvGcoi2TNczuLat2eKPS?=
 =?us-ascii?Q?S/WiCpWXjYI+q/ibby5F2LwCjSdw0345hFOeNobKkPXVeDOQ42yIjjQFrIkd?=
 =?us-ascii?Q?2vDsJxv5OgiNZWugLP1gCj5RVkoN9rXBezVTqi/284ftQy5j8yWv4+DVkslD?=
 =?us-ascii?Q?XWSqFWTb+PxCzkS6D+5b29SQE8MGdvcgva72yEekVWjfR6WcrwSR3FEbGCzz?=
 =?us-ascii?Q?+kZh0kZCMqIFAh+jARwuUWAg++u9qOQe1y3TbXTGn5Hj97qxG+NkR7AuOYrZ?=
 =?us-ascii?Q?dyM2Ub73qn9BoENznNeyQRyBKWs9Fh8F/Kz4fFVQtemu+0WQtxyoV5AcCRlZ?=
 =?us-ascii?Q?m+MqbONn/XwEPZilCdlY0ZQffqM2NkJG6lvZIF3i+XRPqAwLjKKM/Xv8JU5B?=
 =?us-ascii?Q?yDCeAEBY6KKTmQG6K9ic0WfKrUW4nH6nw2nJAi9HZax53r30UlhP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf2fc2f-c1c0-4f7a-54e5-08df038c6000
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 16:09:15.4548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/YnHH4rMpyxnlzynhyZjyv1BvJeCo66z7LeNzvYNuKP9f9OEyl8vJJizmSGoiUk70Up2zZa6W0E5ITXeT74hVWigKDXY58bwN9It5L9tZZFQMR8026b1XdpXUwQs9Ri
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8632

On Wed, Aug 26, 2026 at 12:55:45PM +0800, Guoniu Zhou wrote:
> The i.MX952 ISI is reused from the i.MX95 ISI with a minor silicon
> revision. It can process up to 8 image sources simultaneously and
> obtain image data from up to 4 pixel link sources.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 14 ++++++++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  1 +
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h |  2 +-
>  3 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index c1c16dbc1539..5b19b581b38e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -392,6 +392,19 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
>  	.has_36bit_dma		= true,
>  };
>
> +static const struct mxc_isi_plat_data mxc_imx952_data = {
> +	.model			= MXC_ISI_IMX952,
> +	.num_ports		= 4,
> +	.num_channels		= 8,
> +	.num_vc			= 8,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(30, 24),
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= true,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Power management
>   */
> @@ -582,6 +595,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx91-isi", .data = &mxc_imx91_data },
>  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ .compatible = "fsl,imx95-isi", .data = &mxc_imx95_data },
> +	{ .compatible = "fsl,imx952-isi", .data = &mxc_imx952_data },

It is the almost same as imx95 except model, I am not sure if model is
used in code.

why not fallback to fsl,imx95-isi.

compatible = "fsl,imx952-isi", "fsl,imx952-isi";

Frank

>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 05c21c448b93..a4b638508522 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -164,6 +164,7 @@ enum model {
>  	MXC_ISI_IMX91,
>  	MXC_ISI_IMX93,
>  	MXC_ISI_IMX95,
> +	MXC_ISI_IMX952,
>  };
>
>  struct mxc_isi_plat_data {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index 7c4e736f4651..35dec3a650ac 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -22,7 +22,7 @@
>  #define CHNL_CTRL_SW_RST					BIT(24)
>  /*
>   * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
> - * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only
> + * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
>   */
>  #define CHNL_CTRL_BLANK_PXL(n)					FIELD_PREP(GENMASK(23, 16), (n))
>  #define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))
>
> --
> 2.34.1
>
>
