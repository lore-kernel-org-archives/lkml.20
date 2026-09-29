Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013022.outbound.protection.outlook.com [52.101.72.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388E53D3D18;
	Tue, 29 Sep 2026 14:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691759; cv=fail; b=P5+lgFQaEUCm4kYL61tBTlmY9uVT6Rq47F8m5HqxJ2ZdrppK58ubHwmUKZARAeLUrFESRzcOL+AeYg3nU8KnVjEjk9sJpahMQFPGs7Kt/RYGB3MsHOj2BFt9rpOi/TkrC2aSuKIv2VU2jEbmJWz8AFJph4CccSjzJVDmI8K4sDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691759; c=relaxed/simple;
	bh=lJmIZ3EmGapFurvfRD0KCx2ef9hf0lwNIXicADQhWI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pa6Bg1hljfaZfwFIzZpGk/NVG+PtdRI8nQLSoPVZ/JH2AumyTM7r1zFvRF6vUR5vn6cHJABay3NB/r0vLAFcKXC7HRa3yP4NKeCNBiODrmJBOtDAG49FuOL41oL0GAvM5u5ARFsbiGfwNxVHE3RPEdbPGLTiyIB5YP7196Nx3fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=anFJsX6v; arc=fail smtp.client-ip=52.101.72.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="anFJsX6v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKP2PagTUHwjO/dUMKsh+Um7Q/O8lTK1z9dSqCoWoTv7Hkoq7uF7W2tMvP+NH/stoVwAAkf0SicUbAzL2DhzPPYEfDK63WD2BzoduqRuKdFCaembg9kAplrc36r5AIJs6l6kfa33a3NinEGnQdhEltwjV8CK7chczjwc7VtNRLBZWpqrWb+tDeRLTr6tqpQGDqo8E0RRtVjf72Br9fdy3VcPEDwnHj1f4APxHk+hj8pSSHjM59jb5EsIEti/A9J2/yuUmBnGysH749/VB1AScNi0aR+ACfi0Z8CLklBPd1NRp7bGkrhGp46aPHAIcRFyOjUPHz0b6tR3eViO5pkHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dP11d71qA64RXQG0l8UkefcXYo39MtfMPTbQyK3kgN4=;
 b=fUvMHsx6UV4fIbiFEOSUjVme/pIWrsZjNEEsWuWxYOa6eO21yxwny3almCKjqAQSLjIsaWQszk7LhvFfvGckfM7Y2QNH9PMf4REi/irg4xCy6+Kwml8W6PBtmWVhaEeCtfWCvyiloDrqXtZaR0z284zIfIGqCJOezX01iwBkJZ8dWgsgwqyoDY+v2+X9IjC/MjcUxJGM/KWdSqeheLwfporVcnXsZ93V4tXLe03urGyfpc64GMTy3ixkqpjG54+PQamXsd9DtQ8OGNdaEahgQUyU0Hy/+vAPJvafO/ftzPw8xmZLHoZBwe0rVlV/qZbi/liwg8ODgy6loxVlD2DWjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dP11d71qA64RXQG0l8UkefcXYo39MtfMPTbQyK3kgN4=;
 b=anFJsX6vsqEFzpjTudm8qVIRF3bJDeLoQH50AZDBdT5lE9bq4k2sbPPkDCU+ADXrnNPr07LQVweKTt2z5a4qzYi3vgn7HlvMqqOKe9dR+Y2ShqFIv4m9XPZKVSBuLbiaD+CIEA9o4Tpg3MXpz6zswADw50V4Am/4qYlOgfXsLgJbNh7i0xbFUn8L4USxO31IX6Y8H/m9Rk107eHisCLhGQSstk3Dk+0tdGXRmtUlw9nnRTCVIYCqk34nyHPd5+YuHyfJbzummcXDHh3W5HGNfLensOwaFTikVO/JGYizFn3OVQ94tdqgH2Mw+JEjsco+e4thgxbcJaBHC4WBC9z9bA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 14:22:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 14:22:34 +0000
Date: Tue, 29 Sep 2026 09:22:23 -0500
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
Subject: Re: [PATCH v4 03/11] media: imx8-isi: Support mbus_code filtering in
 format enumeration
Message-ID: <arvJn9iaYVuL7Bn1@SMW015318>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
 <20260929-isi_imx952-v4-3-e69f89c7c651@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-isi_imx952-v4-3-e69f89c7c651@oss.nxp.com>
X-ClientProxiedBy: PH7P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: c94bc616-3392-4c48-1d73-08df1e351a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|1800799024|366016|7416014|10067099003|11063799006|56012099006|3023799007|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	kaRs95WzkYUzjC3ttnNUN1uQDtrsponFKLCU3L8VK6QrCZ0PCzaQKqLcmFNANUCuSKqpA8wfqzANeelCbXq1vbCAg1Vnl5a1ZDW2V2S4iHnsIAGrSRQz4c720d+WkFXxmTm2oKcmiI3OShUX3bDZnVrwOG6vxLyx08tFof/P0Owliep6g0GF4VM5oAmCempwhICenDFLnQ8e5kWgznoEHscZZHA25RB+J4MoT22/Hoxz2Ip19H1KnCB0kkZddBlQrjK8giM+nfBh2AUqKJemXSXjFRtxAJKRMXBCKqvhapsDc39kR3ezUkL2WGIJBtlOMGx1Fd9quT0cI5qxq3a3g2QTE4dI5U8ho3M+IGzlU1hvGT9lByjg8/0Ro4ej6XlF5QWVRu7Y7Z0lkpJbpUwNgw8ft+ASzrnb/jnr3Y3OPt49PrD2+LTUIvvjAko/D6A0C4p+9UgDk8NLGgOQAW4Ju/HbTGoVsyq0xE5E7BaYWFu+dKYjb0yE/GFJonw1TzYYMaqo8Ms2ILYBGn5LwriVnl+IvPqZ4v/3O99xEjm01MtUL3WI0bHRJvlTas6/jt67j7mAZR45d/WkTlAiiGypeloA4fN/6njW3c4qjxqQAi9irpWmOua+nDqt+vhLZBpdb5wuTtqIVDmKvwSRSvCJZf7o3ZYyTG07hJmK6oJqRq0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(1800799024)(366016)(7416014)(10067099003)(11063799006)(56012099006)(3023799007)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/PGm+kIQnIoGtp0BbHR/7gFrwKgavaIEf2L8MXAHzLI/eYYJw2jcrnhqF5/3?=
 =?us-ascii?Q?zHZq4DSWb38t4W68kWlnCAaVGvma8b/LAydOPVifC0hWN+Rx6RWwfwNrlX8x?=
 =?us-ascii?Q?ppiYHT9h80qvOkDvA43QmMrC+XMgj3O8KAgTDxIaASScX19dREw/RMo1BMCZ?=
 =?us-ascii?Q?yF0mkCvSQXF8T2eOtcVIqAaOE2AFIc/OW2A2+FGVgaQ/6c8MEqGfntAi27OC?=
 =?us-ascii?Q?EsauAVflWMx5jDKqPVzQliMOvtsvbXppWB+qz3StKfSuXklGq5YmGqqqH1ke?=
 =?us-ascii?Q?EHo4lRWrxm1Gh4lDufXoHB7rDKIvb498EK+Ghc2Cte0130sMuOQkVNFiGnHI?=
 =?us-ascii?Q?AmngVUiQeQ6zMdN7HcqgiDAK8RPzPEOZouPXHo+Faeeckcb9/XK9LvUdasin?=
 =?us-ascii?Q?z+D0MsqjsFK8pu8yZlBNhDappLABWkyR+EoWBn8D5P5CmhXXniaJO8qKt2e+?=
 =?us-ascii?Q?vMUUwUVoilaNKJVRZIBxBUj1tVOnplQiMVqj6gnrtMa/0eAZ67q6t0f+8Cx0?=
 =?us-ascii?Q?yE8bMMG+tv3nkuzvXyzKExeeLOhZwDuKRcpvW16wXhYUWOt8AoG/OYiUMrZo?=
 =?us-ascii?Q?j8iMMJvNuX5IBsHyij0u2vNbm7FCmaPumRI8qdfcoXyyOzmJv1BtZe3KwGaS?=
 =?us-ascii?Q?zikKfFKAifLADVOTbXl6h1MYybr2Jd5njSiX0v0nar+bPh0K27JVpiXrwogH?=
 =?us-ascii?Q?8i4f3PmDXzdJaBRSketTghqUJLsu7epc1HrL6GBrt8eIRvmRNImyGBlUCdnm?=
 =?us-ascii?Q?7dbAmB1/IwTVMelWlKsUsk4R4SOdvq1IPtx2HJd5aCSN3lZckW2u8Kd3L07l?=
 =?us-ascii?Q?VHBblyjEy+kUgILkgp2e+B/wb0Oetqf5JPsOxQm8DdkVBIpEzLwJKNbZSh6e?=
 =?us-ascii?Q?Cx5HXHyrBe/zdUMv4Pz0FsPYbsvcca+3ysfemk6yFFSyQ0iQ0L+980Z9hpfS?=
 =?us-ascii?Q?3+G9KJgOfoeiLedgnkImhL9ypHeTNNb5uoekfgMilsuO4XkGGn6okuw0IN8o?=
 =?us-ascii?Q?guCaMYTNU7J456QhmFVKxVULi/yNcMddvJYRLj9U4hydDHO4rtRzq1o4XC6q?=
 =?us-ascii?Q?ml82eqdgc3qaaR1bIGnwY5i1ewBI0pbDBM72WJHmnnC3smCMdw3YdHgCYSmh?=
 =?us-ascii?Q?I1ZqcrJZf1GCQlDqWEXKL0d+lb0Vub2B+2cq8AL/Og2cNxiJBSHP/Y36XsiT?=
 =?us-ascii?Q?oPu7TI3vIVCnt2M0J6fHu+wI68I6dnO+ZC7uHSCA6Bzdah0Cx3p/o3nIe1jG?=
 =?us-ascii?Q?LhB2JLKJmMpLXoWKVtcQXheikTD1MVsVV1hFWbkMnXaa2on46ElOTsad8tL0?=
 =?us-ascii?Q?m9+apdUfO9XDXLFjB2lELclvyvOxHHFw7S0cfHyrlBOvr5bBiv5eiv8djf2q?=
 =?us-ascii?Q?n0kUp6DW63GzjLCFtNbnAKMkFSAtLRemCxajwihyuqvPW4LGarWZR9BRLIxZ?=
 =?us-ascii?Q?WP650BjZIiMZgctlz7kVaeKHMN50Ir/2YngMCdEkPshW6Gzb6pMcmlf36MXA?=
 =?us-ascii?Q?u/rLWcjILT1QO17Y62Klqouse4oOV1quFaBPofMQC4A/DFq/6dOLQOzUd+Kd?=
 =?us-ascii?Q?AUApgvZwkJbXHQTjCohXtW2blMTeVyFFx4mixyT78XEZwEBjUKc1FhkOHWsE?=
 =?us-ascii?Q?Hqyahq5CDEtrELwfK7xMEiHB3p6qhwpmUG/X83yhcDjJlEhMWTm3QeKTjKcP?=
 =?us-ascii?Q?MMKZVgtSoX8yf8S5qt8Kf47brtgXKKbSNd0rST5OP9jlQOoN92IFzPVdwQnf?=
 =?us-ascii?Q?gykVQm6OB1rTP3uDrBOdblwPh6dr8HFauBVG+u7k+B5xtwUfa400?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c94bc616-3392-4c48-1d73-08df1e351a6d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 14:22:33.8932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZqliYjYB6tmF84Rf0OBZT2GveHFf4w2bvQX2d1J7NDF0VlegNXg9pkvJZtb0Ty6ZxX7O65wBASUyg6PGYsdRPaymVuVOaTWybyAwv2jfgCJh/9cr/Joz3wmSQJ8WAcG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8774

On Tue, Sep 29, 2026 at 04:52:24PM +0800, Guoniu Zhou wrote:
> Extend mxc_isi_format_enum() to accept a v4l2_fmtdesc pointer instead
> of a plain index, so it can filter formats by mbus_code when set. This
> is used by the capture path to enumerate only formats compatible with
> the connected subdev output.
>
> For the M2M device, the V4L2 framework clears mbus_code to 0 for
> devices without V4L2_CAP_IO_MC (v4l2-ioctl.c), so this change has no
> effect on M2M format enumeration.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v4:
> - New patch
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h  | 2 +-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c   | 2 +-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 6 +++++-
>  3 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 58b47335afc7..a30633a7e2e9 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -322,7 +322,7 @@ mxc_isi_bus_format_by_index(unsigned int index, unsigned int pad);
>  const struct mxc_isi_format_info *
>  mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type);
>  const struct mxc_isi_format_info *
> -mxc_isi_format_enum(unsigned int index, enum mxc_isi_video_type type);
> +mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type);
>  const struct mxc_isi_format_info *
>  mxc_isi_format_try(struct mxc_isi_pipe *pipe, struct v4l2_pix_format_mplane *pix,
>  		   enum mxc_isi_video_type type);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index b729eecad0fe..1178947bb548 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -492,7 +492,7 @@ static int mxc_isi_m2m_enum_fmt_vid(struct file *file, void *fh,
>  		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
>  	const struct mxc_isi_format_info *info;
>
> -	info = mxc_isi_format_enum(f->index, type);
> +	info = mxc_isi_format_enum(f, type);
>  	if (!info)
>  		return -EINVAL;
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index f45c2aae59ce..0d87a1082727 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -482,13 +482,17 @@ mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type)
>  }
>
>  const struct mxc_isi_format_info *
> -mxc_isi_format_enum(unsigned int index, enum mxc_isi_video_type type)
> +mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
>  {
> +	unsigned int index = f->index;
>  	unsigned int i;
>
>  	for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
>  		const struct mxc_isi_format_info *fmt = &mxc_isi_formats[i];
>
> +		if (f->mbus_code && fmt->mbus_code != f->mbus_code)
> +			continue;
> +
>  		if (!(fmt->type & type))
>  			continue;
>
>
> --
> 2.34.1
>
>
