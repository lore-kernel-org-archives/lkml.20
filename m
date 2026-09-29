Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013008.outbound.protection.outlook.com [52.101.83.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8163E49F5;
	Tue, 29 Sep 2026 14:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692446; cv=fail; b=dD1OX+sRW5HrLdxljfDTna704kiV2o2CRvumZc8+nfENGNGzothpzEN+fl4cqrSHAx1jOVLKLiY3TH2t7PO6mt/O0pIm8tXXD8LTRIPf4V6M99KHKBqwFa/QdpKeMiVzdsvR476YgGM1k1Dmn70YEsblYnxKmN9RwidalNM2gzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692446; c=relaxed/simple;
	bh=6PANhbYV3uk0x48H4Oi3fHQXmLJVhC/dANXDwyZlu1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=adbKBr4ApQePtSfC9dcZvfC9tjVBR1Sdg1OxwVlAMuk9UU/l9WEO53v275wAjwVtBOtnpU6ak+49ieZhMIHseaX1df9aB/otHXLJuUU3czz6ZOEKmiDrJClJ/B7skSluGRVtd+UyXepAqtHAV9n1AXQIpfVa9IbonY1S4IEHy4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sOjo8Qdb; arc=fail smtp.client-ip=52.101.83.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sOjo8Qdb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSa0T/IjmvBtS4Yy7xx8cANm8k0OChlvkqo1jcphc1hOGdfnt6CRKxTjrQimuU7Wyge7x36ThlCjUw8rmdXYCeNo5lWs/2b9LEo9mnWj3X7wlH9Ryl0iCXSkbbtLPCwoH3/XXI2PxdafifPAaDhOemNcmrTmUfyqAgdEF4e3Ga6ewRXLOagmXVzxZvl6vAm7iO94eBwe3+Vpk44kxTCBycvJ7HYQ1pt1mYi1DolEJwigEDI6L3qwk0wCCRCoPzFQXwy5TFarYzuot6t4fTZ16fX7N/tGtPQ+0RFDVD65hS8BjlEiiZIr41yebur/vdV6Uug2x0PN1chD3IqCTdlG1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BQPAe8FdykUzLsAz6fzwo25B8Z46TzK/UPfPgGxWfg=;
 b=eBoc/afUYEcIQZtg2XThNbidB01JgXTkmNYrPajDPLF4Rf0j2SiJWDgew8Lz78Hmiw9sh4+TLkIxKaGy58Jk7BoCq/RqMKhoV/+RHaV7K22TrhTKGTdJ5aDAgnNLLyFZB9tYzxOfJZpAlaAydqJ+KfpKpD0aVIjhYyYBh3s/afK8nFpfj+rC79hghgrkmyyJvxeSc2XRJCrASzfPtUBRnLXXNTPEeQF4iTYUzm2mfjzO3+fWm2w1gPOhDx8ogKDr68alhjIrk7jubeNMrYWvdwaJsZTfeiORRmahDdzCtUW2WPigC7p+e42F6VU2+eL1SLAogV/dqYq2SlQQ8G1kjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BQPAe8FdykUzLsAz6fzwo25B8Z46TzK/UPfPgGxWfg=;
 b=sOjo8QdbtwL0MjDvE94A8UBuv9q6Wx77e5uh6tnxXBphNzGOahvQz/j+Tp+T4INaxWfakee6e0ExSB+8aCOtCnunuETzIu0LnbuRQa5OtDFsM7HjcmUYnJsT5PW+0IAP7GaTEtHIjk6ihb+tA377xFkK5fxWJ7nikiUvIIX6lfBQBL9n0mwMCGMXA3St4nMnQea6G5nIo90QEIMFfCeqCdIKZjNSNGrVEcjh9n7GcBXTV/cfT63mtrggihuJb9NBbMSSlqm3t6gbN2lCd9Z3o5MlPD1kL4y2pcXssyMDbmMitqNGa+lv0rOP5F4ht3MD0CF1IW5Lyr+24r9mOsl7tA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB935183.eurprd04.prod.outlook.com (2603:10a6:150:399::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 14:34:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 14:34:01 +0000
Date: Tue, 29 Sep 2026 09:33:51 -0500
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
Subject: Re: [PATCH v4 08/11] media: imx8-isi: Exclude RAW10/12/14 output
 formats on i.MX95
Message-ID: <arvMTz3d-cROiY79@SMW015318>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
 <20260929-isi_imx952-v4-8-e69f89c7c651@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-isi_imx952-v4-8-e69f89c7c651@oss.nxp.com>
X-ClientProxiedBy: CY5PR19CA0109.namprd19.prod.outlook.com
 (2603:10b6:930:64::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB935183:EE_
X-MS-Office365-Filtering-Correlation-Id: cc28964d-b213-4c2e-913c-08df1e36b3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|366016|7416014|10067099003|11063799006|56012099006|3023799007|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	l2y0+Uia52J/EECZAiVEHti5v0udh/5Rl0qVZCV55eQe6Fqh+ndB9a7ASF8wMzjFTAHuV1fIUIxGdhT3rphTRXjvs11LslSAGcv9XWtR4Ms9ueA/kZ+iYm9sq6nms9n4oCU+MPII2HWtZERL0Vta2gOcKjtNRXuC33JUmZYnU0RmkR6kd7LFUVMitLLE6HAn4fcuReLTyCfm0sGQRm8AGePUV6WyrkLqMQTVvKvCud1YF8ctY0JMiz8C7pBjFiWJgdyA0t82XL63R5rrCyFqOSQmsP87c8DOwxFbQYxwyF2Xmc98V1AAUZXaOZFKr1mf47itUc482YqAPqecVwzWh1uqCiKdudvEJdW8PDZa8WoPK4dd7Gz/fafBK6gnTqC7QZ28tnG3Jc91n9skiToFLuGdgo3BerH9r0LLgyDEZa1w9m0GGMT/nBVjnOCE6sdZi8otWWoztHJhsqzsxdJTjeRycH45fIJ2S3C51h9ecDarB0jUMn9Vcze86sSIWA9ZCW3WPss8RRDYSGTsyfPhLTlw/ons8AU7bAFTjIPvZ1ihc9G3miMCnc96YRuX115HD7Fe52UACSOTH6MHb3Ffy8RqvvomJOiVflQb/EVQMp/DG8f8+SR2NTtlsh/CuExmo7088oS78cy0dvZhUjg/F+lW1iAfFi2NRvxB4yyVJp0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(366016)(7416014)(10067099003)(11063799006)(56012099006)(3023799007)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?819NMs9Z9PeRUC432Lzu9lUnmNXZEWfMMI/V3URYhiSCEJTRremJi6i+1EzD?=
 =?us-ascii?Q?x9/oFmFYtykdDAih60rVGTsnl9GjLecp3PEjA4X95N8DsThE7bLOT/TYGgH+?=
 =?us-ascii?Q?MzjIEvW9IbvLo/1mPOjtA6vnm+z3brg2EGEXmeV/Z+LaZTnoIIOJiYauOFYE?=
 =?us-ascii?Q?/n/y8nTFSuLNkMKL/YHcy76EiA2PeBoC6JLDFpEtdo7rCTz3upPEJEFaeANi?=
 =?us-ascii?Q?RiaNekGncWV8XIy6OcYQQppMRGbYQvTgNMmKiUIp4DyM/dE3ugrYym9UhGZg?=
 =?us-ascii?Q?F+p/4/AaDbi7SUV1feDlIKGvCkWrSGyk5dxNgcyqK88WsdCg6mqF0YoI8UUB?=
 =?us-ascii?Q?KrWrNweUqgVeFV3wuUrdxQoiCB9B7Q2+Be1DPmOqNc8BHgDfIMu+n8QMBjYl?=
 =?us-ascii?Q?aXwUiPQQJnsaDQNcotGhqfQdmI7Lwr5ZqyDTkpvK3vcXevmLPq2uQKydahzv?=
 =?us-ascii?Q?JiY7zx0ROTNDF8t9FEnb1L1T8gRa0yvMEe3jZ1TKUE0wXYz3yzT0JbCRmdKM?=
 =?us-ascii?Q?cKYSR6ZEU7QUsf569yVIAZuHEA7V3IPRMLOfCBb/1XO+tG6Hv7Tm8aPOe9P+?=
 =?us-ascii?Q?mqfoVm+a76c3YyNwvvHVmciJlZqJQTctGb3qgKMM0i8TJRNrvJHGhpxtQXk2?=
 =?us-ascii?Q?gLK8gNzigWA4V+zXwZ6S5qS8H+wbPlkZDH4q4Qj3f7u/LyFHPFK2rl8GwNSA?=
 =?us-ascii?Q?v90vc62Ye7qwR65ChKUigOuarPkFQW+4uV0Sbbuow5aolu6H31UsMXlTfzr7?=
 =?us-ascii?Q?BKjN/QYj7Uh0Kwh3IZO78xT1oUOnmG8YiM5aql0oP/eKe8yxfLThPJcbEiOv?=
 =?us-ascii?Q?S8+Yg2ArlUVrXjkd8hpbN8Kg5ZC5oGFGbRBPcYFrtnTQB8pccd0LP3rflyWg?=
 =?us-ascii?Q?W68Mzvm+lMCWw4tM73GuxI9lERWVWLWt9yd72DC9LQoyeQr/YCLcCnbVWXBf?=
 =?us-ascii?Q?98MQVSEEXU4OwzThS2U5fLZFsdGwBSnhNj0aWwp86T1YUnRs3ZB8rTynk4a/?=
 =?us-ascii?Q?tS6jloD691nbhw1xfOOkGnYfsMg7SIzgZijXlAJlU4Tw9A4j0dU1NKnX+PnD?=
 =?us-ascii?Q?OXr9xhX0kUbGMvNUjbrXfbvBC3YKJhBjQPcRGNyCMITCBrsUjP7jl9y9F/X5?=
 =?us-ascii?Q?v1Mz7wpgXN8HAs9fmp1BicFYfVX4v6Bwvo4sbd7RZFIGd/XmHRHboaRHN0Hw?=
 =?us-ascii?Q?vRGanHmYODjyLQo/8oq/OfuFmQrjti2LfaCwRtsmMVGE/IYtAW1uUxqH8H7O?=
 =?us-ascii?Q?A5Qw2GcdziAt2JA8iocuuGgvXWyV8TJ1LPC7No2ii1GYaXYgPRB5c5msl0dS?=
 =?us-ascii?Q?0udsbbGEK2E4ElDnw2SRDmaVKH9YTrSbuUHLAWNyh6rBuB2Vfu0a/6eogAQz?=
 =?us-ascii?Q?8eU5XWkRkNZIO2ylGp5IcPjdUMDz3x74wMCCK+SsmFSd5aDRMoGdNHYfXCKu?=
 =?us-ascii?Q?TxMTBaHwpNj+P00eG7FuNta6JDDV0NbmEwvHdKk6Nd+HHnb0NcGrLSImQ5kX?=
 =?us-ascii?Q?Gsw2cQ4pD7Y007UXxX1jfkTvUhw1noI/JXdgofknx/b+eBWh5gozR3GIH3xG?=
 =?us-ascii?Q?bnd3OYe9SJhxi2s7SW9JceF5AvnKsMiejg8J2mYILfNttrAlEkUKxVbwKTND?=
 =?us-ascii?Q?QNRZ89XrdM4sswCyjUQe19dpg+guRfGYIDoqMzuwgdp8Mzwky+6F51HK4GuH?=
 =?us-ascii?Q?DMPT83bNL6VXp1tsVe5kZX90GNLO21irmx2UAL0ecCnsq6sC4YUNBDnhY1il?=
 =?us-ascii?Q?bkZ887fGpSwlzlrZ/Q0iW8IX1ucXbKJ99eMUlliMAD+gSnpdIHGx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc28964d-b213-4c2e-913c-08df1e36b3ef
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 14:34:00.9073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQ1btQUGA5x9FwZ9R8Zg0OZVUyV/n78B7e9q9UImwaL5SlLi/1iTfImZmQ4aCm/FbKREoTKzDHthrZNwgyCdEX/dmwrWeW8C9VNVGxdzxPAv8S1susT7Veyh0ZMJkDr9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB935183

On Tue, Sep 29, 2026 at 04:52:29PM +0800, Guoniu Zhou wrote:
> On i.MX95, the CSI formatter provides MSB-aligned RAW data to the ISI
> via the Pixel Link. The RAW16 passthrough that older platforms use to
> produce LSB-aligned output now passes through MSB-aligned data instead,
> so it no longer produces correct V4L2-compatible output. Exclude
> RAW10/12/14 from format enumeration on i.MX95.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v4:
> - New patch
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  6 ++--
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  2 +-
>  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    | 10 +++---
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 38 ++++++++++++++++++----
>  4 files changed, 42 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index a30633a7e2e9..ba0d6df98fd4 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -320,9 +320,11 @@ mxc_isi_bus_format_by_code(u32 code, unsigned int pad);
>  const struct mxc_isi_bus_format_info *
>  mxc_isi_bus_format_by_index(unsigned int index, unsigned int pad);
>  const struct mxc_isi_format_info *
> -mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type);
> +mxc_isi_format_by_fourcc(const struct mxc_isi_plat_data *pdata, u32 fourcc,
> +			 enum mxc_isi_video_type type);
>  const struct mxc_isi_format_info *
> -mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type);
> +mxc_isi_format_enum(const struct mxc_isi_plat_data *pdata,
> +		    const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type);
>  const struct mxc_isi_format_info *
>  mxc_isi_format_try(struct mxc_isi_pipe *pipe, struct v4l2_pix_format_mplane *pix,
>  		   enum mxc_isi_video_type type);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 1178947bb548..1ad0fd1af3b1 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -492,7 +492,7 @@ static int mxc_isi_m2m_enum_fmt_vid(struct file *file, void *fh,
>  		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
>  	const struct mxc_isi_format_info *info;
>
> -	info = mxc_isi_format_enum(f, type);
> +	info = mxc_isi_format_enum(NULL, f, type);
>  	if (!info)
>  		return -EINVAL;
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index 35438abf3172..b83a25a58ebe 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -425,11 +425,11 @@
>  #define CHNL_IN_BUF_XTND_ADDR					0x00b8
>
>  /*
> - * The ISI shifts the 10-bit and 12-bit RAW formats left by 6 and 4 bits when
> - * using CHNL_IMG_CTRL_FORMAT_RAW10 or CHNL_IMG_CTRL_FORMAT_RAW12 respectively,
> - * to align the bits to the left and pad with zeros in the LSBs. The
> - * corresponding V4L2 formats are however right-aligned, so
> - * CHNL_IMG_CTRL_FORMAT_RAW16 must be used to avoid the left shift.
> + * The ISI shifts the 10/12/14-bit RAW formats left to MSB-align the output.
> + * On platforms where the Pixel Link provides LSB-aligned data, the RAW16
> + * passthrough must be used instead to preserve LSB alignment. On platforms
> + * where the Pixel Link provides MSB-aligned data (i.MX95), these formats
> + * cannot produce correct V4L2-compatible output and must be excluded.
>   */
>  static inline bool isi_out_raw_shifted(u32 format)
>  {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index feef79b1b718..fac24ee3887b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -458,14 +458,32 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  	}
>  };
>
> +/*
> + * On i.MX95, the Pixel Link provides MSB-aligned RAW data, so neither the
> + * RAW16 passthrough nor the native RAW10/12/14 output formats can produce
> + * correct V4L2-compatible LSB-aligned output. Exclude these formats.
> + */
> +static bool
> +mxc_isi_format_is_raw_unsupported(const struct mxc_isi_plat_data *pdata,
> +				  const struct mxc_isi_format_info *fmt)
> +{
> +	return pdata && pdata->model == MXC_ISI_IMX95 &&
> +	       isi_out_raw_shifted(fmt->isi_out_format);

The same here. don't check model.

Frank

> +}
> +
>  const struct mxc_isi_format_info *
> -mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type)
> +mxc_isi_format_by_fourcc(const struct mxc_isi_plat_data *pdata, u32 fourcc,
> +			 enum mxc_isi_video_type type)
>  {
>  	unsigned int i;
>
>  	for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
>  		const struct mxc_isi_format_info *fmt = &mxc_isi_formats[i];
>
> +		/* Skip formats unsupported by the platform. */
> +		if (mxc_isi_format_is_raw_unsupported(pdata, fmt))
> +			continue;
> +
>  		if (fmt->fourcc == fourcc && fmt->type & type)
>  			return fmt;
>  	}
> @@ -474,7 +492,8 @@ mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type)
>  }
>
>  const struct mxc_isi_format_info *
> -mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
> +mxc_isi_format_enum(const struct mxc_isi_plat_data *pdata,
> +		    const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
>  {
>  	unsigned int index = f->index;
>  	unsigned int i;
> @@ -482,6 +501,10 @@ mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
>  	for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
>  		const struct mxc_isi_format_info *fmt = &mxc_isi_formats[i];
>
> +		/* Skip formats unsupported by the platform. */
> +		if (mxc_isi_format_is_raw_unsupported(pdata, fmt))
> +			continue;
> +
>  		if (f->mbus_code && fmt->mbus_code != f->mbus_code)
>  			continue;
>
> @@ -509,7 +532,7 @@ mxc_isi_format_try(struct mxc_isi_pipe *pipe, struct v4l2_pix_format_mplane *pix
>  		  ? MXC_ISI_MAX_WIDTH_UNCHAINED
>  		  : MXC_ISI_MAX_WIDTH_CHAINED;
>
> -	fmt = mxc_isi_format_by_fourcc(pix->pixelformat, type);
> +	fmt = mxc_isi_format_by_fourcc(pipe->isi->pdata, pix->pixelformat, type);
>  	if (!fmt)
>  		fmt = &mxc_isi_formats[0];
>
> @@ -803,7 +826,8 @@ static int mxc_isi_video_validate_format(struct mxc_isi_video *video)
>
>  	state = v4l2_subdev_lock_and_get_active_state(sd);
>
> -	info = mxc_isi_format_by_fourcc(video->pix.pixelformat,
> +	info = mxc_isi_format_by_fourcc(video->pipe->isi->pdata,
> +					video->pix.pixelformat,
>  					MXC_ISI_VIDEO_CAP);
>  	format = v4l2_subdev_state_get_format(state, MXC_ISI_PIPE_PAD_SOURCE);
>
> @@ -1222,9 +1246,10 @@ static int mxc_isi_video_querycap(struct file *file, void *priv,
>  static int mxc_isi_video_enum_fmt(struct file *file, void *priv,
>  				  struct v4l2_fmtdesc *f)
>  {
> +	struct mxc_isi_video *video = video_drvdata(file);
>  	const struct mxc_isi_format_info *fmt;
>
> -	fmt = mxc_isi_format_enum(f, MXC_ISI_VIDEO_CAP);
> +	fmt = mxc_isi_format_enum(video->pipe->isi->pdata, f, MXC_ISI_VIDEO_CAP);
>  	if (!fmt)
>  		return -EINVAL;
>
> @@ -1281,7 +1306,8 @@ static int mxc_isi_video_enum_framesizes(struct file *file, void *priv,
>  	if (fsize->index)
>  		return -EINVAL;
>
> -	info = mxc_isi_format_by_fourcc(fsize->pixel_format, MXC_ISI_VIDEO_CAP);
> +	info = mxc_isi_format_by_fourcc(video->pipe->isi->pdata,
> +					fsize->pixel_format, MXC_ISI_VIDEO_CAP);
>  	if (!info)
>  		return -EINVAL;
>
>
> --
> 2.34.1
>
>
