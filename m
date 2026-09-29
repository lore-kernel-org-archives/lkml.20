Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81942F8BEE;
	Tue, 29 Sep 2026 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692133; cv=fail; b=spbPJRiKKBtxskBnWjdAKSFwdDzJlkAc92mGtSb5kA2MH4OgGFbcz5y88UbHNsGbWyM4QeF+ZD1RrKrO/guAgeeJ4SyTFqwMd88Qjco/VTaWXRE3fQamNNzZz/0a/KAhfpHg92YVf7fkeJhazKKPX1Hlh+cL6gAMP4NlFc6lrQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692133; c=relaxed/simple;
	bh=FQUjQjol/GHSngsKPKISpBuDGc/6NZzwcNiKkNoGlFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=alQkLDF2tSdLUjfmaJDsH0BE0GmHfQfXdIBLC08746YRnrw7aB+7pY0TFQj4ui2BDVhz5MBVqmKcn4eTsfiqiTVehQe5TTbRRSt8vSx5wvmz6XJNJ2PlyYgO1+5O7vv0g/LcR3pMezPwv0lTNureq8BiLObp2Z0r2oeMIQjMQrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tsYGYIV8; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tsYGYIV8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0BdnHHFjqnoWzGyqQhsxO6cbSbcEaxkibAPc8jwXCFUhIp7HJ+5kDl3t2rVJnF6M+C9Kmg7NT75G4ptZ86NumoD2Y6E7add6nmhid+lYujxZ+sQvpWEWRDcNbnN48HZ/JS3iAYf/rqOHb+QXC0NIXarn6g9eEeadpUwaVAr50PMJZpjpEp7bWGQqO91FM+yOm6ie+DDgYhKeod7QhJATSJb3OJwNXqpTs64juFEV+h/VOqDJC0brsLH01AC6JPtNjfdX2rBq+rSPhuiF4eSNVrMjf5HY5V+6wfyx4OuDL30d8B7rxjYrFKm7r/AaB8zINjymYXldPDhuUtBMfR2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgoFN9Bl+liPMfgRWfJMe2xuTEXpZPcGU6ctS9WCJgo=;
 b=I28yRNNyHZCWmY8n9RJzgs5TebuvKaXJS8w8UUPd/mzaldPOmTZvPuXfsnkz1jNyZ6Wlc2YeqCNmICnczvl21dGnMiCv/zpxOvHeLYEoFfFcYyczNE4Zb5bc/5fSqUFWcWIIKQedgcNJi84fsBLEuDEUYRhwNUizBzTlSSuSUzJgV7it3SPgrdfEYz3yG1kcIrwBcR1eCXkZ2vKU5/O2yIHM9VIFkICIeY9tz8IIFBoduX7Pu+kEybsRCgGHycz1dQGXU79Nlm22RlZy+CJ2TaP+UVq+/5mXVfitcffVANMT5oQzTHeVqhbHZgu9koii0Yl91eOLA/yjUPc5WXYPrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgoFN9Bl+liPMfgRWfJMe2xuTEXpZPcGU6ctS9WCJgo=;
 b=tsYGYIV88jYEr4eVGNqZUwwoYeArrqpVEW0rai4BgWgHCN5eWo5iYmLYs1ZCEhR6qKQFg2o45VpbiiCJqZddNlueFH3aIuVsIG38wVqwyZ3NAzWVR4wySyCWAAbynWpCFcX1NnUt6H795/yblvPNRtcBt8Nysd/TYiZ6f/4HEED2xs+uyhmFdGug1pBlUJP5pJHj5mGQZC9+tj6F9h9o6UT49WnIwzy4v0R+9zs+pIZwFccik/9tN15Zqk/J2Rxdx6BZd/ZXUuWj5mKXn1B12XctHgkw6DtsubBx+xF8muoFVfOs+WHn/Ba1hBVeJ1sLIvWfRyVOIas76nznZQk5Hg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMCPR04MB12621.eurprd04.prod.outlook.com (2603:10a6:20b:76d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 14:28:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 14:28:45 +0000
Date: Tue, 29 Sep 2026 09:28:36 -0500
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
Subject: Re: [PATCH v4 06/11] media: imx8-isi: Add RAW14 output format support
Message-ID: <arvLFAK2Baf4j6Mf@SMW015318>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
 <20260929-isi_imx952-v4-6-e69f89c7c651@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-isi_imx952-v4-6-e69f89c7c651@oss.nxp.com>
X-ClientProxiedBy: PH7P220CA0088.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMCPR04MB12621:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a75d6ab-3d1b-4b64-3a33-08df1e35f820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|7416014|10067099003|11063799006|3023799007|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	FH44JxdrTmCdBknXhecbQrhHbKjBqEXmW2Q+8ITbfLh8Pn8+dCp+Id8sgzF9ie18JvKCai9xhhgf7HtCoN34SRPp9X/SHVnlfaXocvwbVlVOvfu8DXZyMycFE7qh+80B6kljMzSFTyaXRFtMXi19s0PzgqI/UCIQhXFsRFYemoqQRdurfrL1ZvNoM5Ya67XeijJvZd0Tm2H2LaLrJbv7GTWlDqDolMBFOWDUgazPbvzFmzOvS5sRdCQ68aBTqjOjSoMOCMZ4DnQ1RNTz+8+VH037IgqP6N9PPDkeYFZQkVjPjFLbVCRAsmFEnYi8SOphLX0GolwOP+d+JZ/966s4ZjtaLJLpGmMYmOCwl15iO+j7d0+IQzDhQfFV62MwWIg+lR/E5hT3c/+ylFZQYQtHAP+aaOW9CdN91Fp04ws76APfYUL7iF4c7LFpUZrovjZ/izjaxid0cJSJqD/Io3JHbrXwP59ILbfZBEZG43SrbIl5ziHSfct+GOwAgODM6k8NyUWrwdjkpG5w+LzmBMUWELV8iKucuAGWO5xOdUbZo4p2YQKgOf0gH71G8eDaVb389yWWCKlluxOi+WelMBMtG/tg9Aqz21++YgUyqZ8zq/fwd6ZQ1750jRJmy6tD6FB05k0Q3mJRdLxPqkc1nQecoE4UNL9zFN+TPNVqpNdCjc0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(7416014)(10067099003)(11063799006)(3023799007)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7zmfkKxM60elHDPCbrSD0AdtrSGE1NuxmeFKvLxsze50BgtWTuYwEf7LntEi?=
 =?us-ascii?Q?LNcmmvDPAUJVbSHBKJzWdLdSCFPegjUBcmJbwF3HvvyfkogDTj5/NSbOMkH1?=
 =?us-ascii?Q?RhWHXARweDHtKmGypevb6GlvBF9mgobex9+Z/vE+weybO8n0haTG0ShYJUOA?=
 =?us-ascii?Q?3Cvedc9Og0UwVHMQHryzG7AY1bh3O+/plsZcKJ7MSRhCMxCHrD5oISMtrEfh?=
 =?us-ascii?Q?bif4hmv18emYDVpBd8JQWjPNXtZ09LRaHtaDwlYEoO4xhBM06sZw8DnfTtjr?=
 =?us-ascii?Q?Rq0YXIi4CUe3tZKsgzv3WBipZarDs8cZs5VJzXjxcFQ8Rmn+gpIxk2S/jG3E?=
 =?us-ascii?Q?y8UfZ82bMohZ1B56CihiLOlXx6sila7Czi5+s0IsRaLA9Ik1nA+6L4x+xXKi?=
 =?us-ascii?Q?8cI2sH/sdG5rsIUoSh4tgvppFugJbpSR9Bqcmq9qmyAD5UP5Metl3AVpcZQC?=
 =?us-ascii?Q?YF3Ojct/zvHe6AhGtY1cjppdWWVz6deBZtwMl7ulDqijBZsna2wAtOAeVgrm?=
 =?us-ascii?Q?NuLto30D/H0uFPaf6RitCrNlMGuNhwyqBbsgUB1RlSy7sfleDwp8iSfaNi67?=
 =?us-ascii?Q?cvS+jBpp81SFTf59/cJDQKYe1mP1d5SMEkp6kk9+Jviz1+VSI2BcRO8nW5xD?=
 =?us-ascii?Q?FMq0Rvdjp6J2HiGoqmwRXvOC9JmoGQBMrUzykAK/ELyx+yAFyLDxZvBwwuxa?=
 =?us-ascii?Q?48smWHZHl2juJ28SMVhUGBfrg42U2Jc8O0IppPhJUXRpVIzShwSvxTZma5af?=
 =?us-ascii?Q?6QVfOaHpwBti1UtK+yilRYp2aTkMa2Xwww56FwaRkrDEzDaw94AEm4MGpadQ?=
 =?us-ascii?Q?XIeR5v7+k0+lba/EY6AbeiJpY/AUaW7OE90MWXj7Wjo4QPHThNuIIIYjMzqr?=
 =?us-ascii?Q?xyHXD+pCpZS4i0qmMeQNLyJ41MetvkaypX9/eT0RSngTnn+mStL3056sjezW?=
 =?us-ascii?Q?g4VBRu+82pcsxA05wLJH6IuwDDBaFQStrYvcA7yKNtGWL5U4pIpITy20J/hf?=
 =?us-ascii?Q?LxkWP2bQVDDDJA5/tVOiB9BVR7rCCp4V17flGXAC7pIHHHiM+MkCq4w5Ra8y?=
 =?us-ascii?Q?1utp+hsOxO3sOD1CfW/jLbuTQgBxXpqbwNv1mM0TFB1PUcSb3KsUaxWm/kn7?=
 =?us-ascii?Q?heAEE8knw/WGB0ZiNSCBg9TCFoyJzy2r1acy/ZXUa+txWM6k5kRy+Cv/PtUf?=
 =?us-ascii?Q?Kd8OD6elnd2U/I8MSBXdkDXjo8lAdEf+VhlHgMQ1ViyxFd9DhLIBlHf1jLQy?=
 =?us-ascii?Q?+q9BanOdFjr/9wxVoPq+/lwXnvkXNu0Yk+rGAc3+oU6df2cHRbf9VhNfcFlE?=
 =?us-ascii?Q?egDllYMvhImwNH7gro5KHC90iRbYKT83TVlBTo7sJC0o9cRXntoWGr232jbL?=
 =?us-ascii?Q?2x8R3so5JoJwDARrNWxBREZRz+ftBNRvgZ2SuEEH7CjkxKbX7l/HPubxMByg?=
 =?us-ascii?Q?AXJlVnlXCCsmdrY9SmRr44ZHssSrVMMq7A6gpeuga76GqtRXhlWoHiD3XM/e?=
 =?us-ascii?Q?XC+t9/xhVrF1C5DaHP3NB0kKut71QMu8hY4L82hCRLPQr5fJAbwRj90T3MvL?=
 =?us-ascii?Q?3fmfBIY6ZwsdO1Gp/hmPwHp49pcLeaV0BslvIS+zoYiJk66I9Rxpfrss6qST?=
 =?us-ascii?Q?B+Od9c1j1FQ+JcLeHh4wU5jHxRs3frkYHONrs2gfdozosQxxq+phc4+dGvY8?=
 =?us-ascii?Q?P5+rwyF8Reu6M6+5d0Lr7Kj9KRCdzFHg1Hr6IsifDLGL8NAhmIeQwspKkmOq?=
 =?us-ascii?Q?rOak3nDZtpvqTft2P0aBkr2tU3ginIx+KCPsoSpoWx58/6zRDjAV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a75d6ab-3d1b-4b64-3a33-08df1e35f820
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 14:28:45.7225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCKRd3bxKwCehrrDcYXcM0OMD4mcSNHGkd/JJElfnUes3FDbuOUfk0ARA+NFbwm0/77gWj4vLDfGteht/KDzlaM5mntuTeP0ixJgSvOI84acGnZzB8t/JDZwhcTlB4UZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR04MB12621

On Tue, Sep 29, 2026 at 04:52:27PM +0800, Guoniu Zhou wrote:
> From i.MX8ULP onwards, the ISI added RAW14 output format. Add its
> register definition and use it for all 14-bit RAW formats in the format
> table instead of RAW16.
>
> Include RAW14 in isi_out_raw_shifted() so the RAW16 workaround covers
> it on platforms that lack LSB-aligned RAW output.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v4:
> - New patch
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h  |  5 ++++-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 10 +++++-----
>  2 files changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index 0f3ada30e71e..5f66b7c9cd1c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -89,6 +89,8 @@
>  #define CHNL_IMG_CTRL_FORMAT_YUV420_3P10P			0x3a
>  #define CHNL_IMG_CTRL_FORMAT_YUV420_2P12			0x3d
>  #define CHNL_IMG_CTRL_FORMAT_YUV420_3P12			0x3e
> +#define CHNL_IMG_CTRL_FORMAT_RAW14				0x41	/* i.MX{8ULP,91,93,95} */
> +
>  #define CHNL_IMG_CTRL_GBL_ALPHA_VAL(n)				((n) << 16)
>  #define CHNL_IMG_CTRL_GBL_ALPHA_VAL_MASK			GENMASK(23, 16)
>  #define CHNL_IMG_CTRL_GBL_ALPHA_EN				BIT(15)
> @@ -431,7 +433,8 @@
>  static inline bool isi_out_raw_shifted(u32 format)
>  {
>  	return format == CHNL_IMG_CTRL_FORMAT_RAW10 ||
> -	       format == CHNL_IMG_CTRL_FORMAT_RAW12;
> +	       format == CHNL_IMG_CTRL_FORMAT_RAW12 ||
> +	       format == CHNL_IMG_CTRL_FORMAT_RAW14;
>  }
>
>  #endif /* __IMX8_ISI_REGS_H__ */
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 365057db47bd..feef79b1b718 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -250,7 +250,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_Y14_1X14,
>  		.fourcc		= V4L2_PIX_FMT_Y14,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -376,7 +376,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR14_1X14,
>  		.fourcc		= V4L2_PIX_FMT_SBGGR14,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -385,7 +385,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG14_1X14,
>  		.fourcc		= V4L2_PIX_FMT_SGBRG14,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -394,7 +394,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG14_1X14,
>  		.fourcc		= V4L2_PIX_FMT_SGRBG14,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -403,7 +403,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SRGGB14_1X14,
>  		.fourcc		= V4L2_PIX_FMT_SRGGB14,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
>
> --
> 2.34.1
>
>
