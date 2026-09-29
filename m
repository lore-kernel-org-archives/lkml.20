Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C61E3C8C43;
	Tue, 29 Sep 2026 14:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692005; cv=fail; b=JmJSWVNIScCHDUD2GS7ayCneL8IdFV6fWgmVl3XXqVI9ZQdL6SJgbC9Gj+qHAPq3Ts35KT0CqaOkFI3ErGwtk4iD+QEW1BWFpbE25x2BsB96GgjuHBI5kIvwcV3E0siXYtrdjhd2vGkuw6sP8GYR8CrcSt0tnTOxrYEVIIuwkjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692005; c=relaxed/simple;
	bh=mOw8nvAF3KJSjjfidqAmCoXyOWuWt73fstbczHACMKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Iy1xkSuqgfjrMRMuJZdcnd/Jk7oTHA//vgrKq9V1M90RdBVeP4Sxk7lbjCzGFKZVhfLODFzqjYDYRFupeD0Wb/P5na3m4FepT98VOHYIZVWppPiuhbfnS6at2bie6ljraiMjTt7yQtIiCun5Bko70nP+0l5kNL2yG/ad2DKpV3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e03eTyml; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e03eTyml"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9DcVXk96m5j3DX6uoPnZm2OC1iLZf72qRTX0M2Qx7usiDx945b3FSRJn5FfvKDzJtIGKlknT0BgmMrca/IvYmjDlKSFskAyGTpSZ9LUeVd70RGCOkWpGLFLpDQ0aHZzlgdnqDmddJrBIIjsjlywKPY875KbzC+6RcMjk/2Dvs1FOX6uKrOX3QAqWJ1nHrZv2qaLnlE/GmBPcaHWWoJ6D3OSMaEQbvWNLcQ9yppfZFY7vwiyOyQzNgCe5CCmI8Fj/+dBDOOtN0jJi1wj5BxMY7xftAsgGJuislV7L6QpcF2STIa3Ry+qKstd0wtMXsZ7EOwLN61HVJClcaX5J7BnxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6Dt9MxgfzfIIkNf14UlJHDn0keXs9wuQHl6095nKuY=;
 b=KsQVWvqiYFBJzp+IiXPqsjyOu3kYnwoXOMboQoYvgNGp9cDx/tz5YjdrSviWCPBUD2fBOFyoVK+onezsnRLT6yDgmcexkp1QWhlpr33LV/mn89UNcFCVeOTzQibTST6WIrdbPkXyHWXjb0YPvrJGako906WA2jTB4axhwYGrXmcYW92OWQV8qoXj9UdfonGa4sqX998r57nHG0s3st9qVKiaHIjsv0iYP3mwpgca0Qna8k4wQBeCgstWypwit6XLlBMtBwmH9D+hOOnT5NpX7zMD1sjBrPkQ7EpE8ftPHErWs9Dvcxo2TP7Za0Drll30STlKDgYJf15nJhgvNo60nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6Dt9MxgfzfIIkNf14UlJHDn0keXs9wuQHl6095nKuY=;
 b=e03eTymlk36KaQphpVWF6C8AJYMn/ej36+OWgUg0ibgYInt1Web54CBjc45i+1Lt5V0ZPRr2HTLlywq7agtFHWm0kf0ICMDWFPD25Dix9mBJbgH2bah7cj0SvKMxW0oRxQuu4Ew2OgW8mA6X+H/YSpKHrK2ucUvzhJh9NDV1X4gcx5agAB/yKzJZnGhtmXPtMTsNl9x86Ughv7Nc+3kkp2TDQU3kMt6PuNx8zETnaKZyK1x7956B05BVRn4ZEz++k5mbVo16aI2I5h6TnoBwsXTCCVyhutCX4N77QfJttfUDRlEBXcnB24zrhGoDDjqonDYcPdJYrNU1DsFaV2Zc0Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10770.eurprd04.prod.outlook.com (2603:10a6:102:492::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 14:26:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 14:26:39 +0000
Date: Tue, 29 Sep 2026 09:26:29 -0500
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
Subject: Re: [PATCH v4 05/11] media: imx8-isi: Apply RAW output format
 workaround at runtime
Message-ID: <arvKleQMr1mF6va5@SMW015318>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
 <20260929-isi_imx952-v4-5-e69f89c7c651@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-isi_imx952-v4-5-e69f89c7c651@oss.nxp.com>
X-ClientProxiedBy: PH7P223CA0009.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10770:EE_
X-MS-Office365-Filtering-Correlation-Id: 29fe1903-9180-48ea-a8c3-08df1e35acc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|366016|7416014|10067099003|11063799006|56012099006|3023799007|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	yXPc1TbocfZ2viqqKdYeFHMBcyx5K1gP7o6LZYR5bQWWvcmkZ4wwrktw+g+dtYsv46yDKxtPfUyz/K4jRZPKkItTN0VoHo/S2VvA4yzblwg7sIeQxs2Sdw7yLKcaerY4FhbR/55ZNMLTsXbVwt9cKnIvMUXZCAbJTFzEt31Bpl9KOOkZrx/Lvgxqzn4P/GR1oqzFIUyBmLdl2mL9oDDb1FX4HRmix34DyandVoYWKJX/M5q0igKJwjTnkc1kS+h+iZ0FcUtvhJS2/MYEEsAyhpd2UndfPmwYd03WcdaJ2NK44jDP8rJVHmsdANVflo2v11H0pDl6wVyu2Q0o/QTvuK/DBvN4HI6PMJhVww4kppgLwDRzSVbeSME+cr25lYV3dm8AME15n0HddhpIyEj/LpkjZcQ6llaFZgwl7zkx9Mc9OGxnkltkSFcCHUUzt4P7fQojaza33d/z2ZiCZBa+aQuSIxNYR3JfQv6uDBMos9dk9VmGO+RhWZ8EhM+fFloU8o01koCBI27g/z5z/dI8v4biuNsRZUMiD+7zeeA/kISxnX5vNs8MjQ+L1/OrsYik5uAgj/cDHN2bOk0FUIlkS/MuWH/jiAdCqa8EXc9mL5TmiDbJsqmbHpF7W/+tHkXwiOfTvnae0pJHIuNbEoE2Ntyz+PwSaS1WBQGNmU+t84E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(366016)(7416014)(10067099003)(11063799006)(56012099006)(3023799007)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2yzcte/HOQIMOlJjuzpkjjnBwZa0mlhCqAVks1DZi6m+2wlW3lqnBNiSISPa?=
 =?us-ascii?Q?am6jfwJvNAXBuPVadvYVuCL4uRF24E0pCW//SiOx77hokNGiH0NVjwZG/Zrq?=
 =?us-ascii?Q?TlpHMIdPU6VWxjVOw+Whk5id0iss77DuiyFbJqHS8VKr+Rx5jjYXl2vztwoQ?=
 =?us-ascii?Q?iAiKmeSuWSj9KZPkOh2xizwJKTA8fVh/J/inGiuwTQF8T9KzV8eGmzNhA8Ob?=
 =?us-ascii?Q?CPjCC0Ug2a3XWDL5uKOVK4f3J4C9iowQC9mpWtgAmG5VNpJiIUrOzohsszqe?=
 =?us-ascii?Q?NGdakf4U6BpHW0wM2PnfCqxopgJ4YgWtHPcEqPF3pvq2nHmi58sUj+UlOmuH?=
 =?us-ascii?Q?qFzceBZB97tYPptz2itYr0dvQ/iGeTc2x5pS1FVvwDvemBLmj/jy5WbPWezw?=
 =?us-ascii?Q?2c+zU4Md85hRXMRjZTS6tEV4nygaGil/aN0+fp11XP83jwRNVmKKDD6fPdqc?=
 =?us-ascii?Q?SHGDSBE2ACo9AYdkI/22llHhdBTipA+q9s0AQ4jbPheAZPXdXqstWepZeiGU?=
 =?us-ascii?Q?rlKclNJnWgWorKx2SIDdjogEPeyFyQ6hQunUDV4d+og9p9BbqhNTMLeUKXWv?=
 =?us-ascii?Q?fUzm2RWWUPy/CDZpoqYQnqxWX/eLa867oh2b407jyqCh366m3yAWE9g732W+?=
 =?us-ascii?Q?J8RhUH0Qj8CB78ahqStlSRmeZTCTLbWtW1hpwDmM+LFz/w54v0HYuFeRS+hi?=
 =?us-ascii?Q?m8wo6EU9sTg5QDZ/Wep3h2JPdsONSj85//4g0vZqYWkJVkC/GvUhfqjL321R?=
 =?us-ascii?Q?WQp/0wBJwRdciZKxDWH7ad4v6wQNfym9UfYDfJxRebZOnhx9o+N9WJzI9s3u?=
 =?us-ascii?Q?iJAI5KvaVCeYKfGjVbJuVuOQ/h1qLk3Q8sAv+NmZ4PtMyU64lJBvWxFUjMNC?=
 =?us-ascii?Q?3lUE0Q4J22m2miIqAkP9Y8IABhOhLwhKEgQYMl2zSxNQ2VIPCP4luY85JN6E?=
 =?us-ascii?Q?KxzrBXscUl1k/t5PGzVlCjUcenAmJmQ2efayESU28gbMEn9o2AJGRBKT4yVU?=
 =?us-ascii?Q?mdaGbqdwDHEKGZouBuInsvtRTYCGIjow3c5uaEeR/ye73P0zJ0slgKG5fpr/?=
 =?us-ascii?Q?ZIvfcBgTfyJ/9VrLbXgrQWsQQtr0824hhYf8Sws6FkS0O0yzAxVcOj09vldu?=
 =?us-ascii?Q?Nm73nWECid+o8IDD5xAmN94MBXZwS7MtwhX9h8NP0IUicyTGmB8buvw1C4BW?=
 =?us-ascii?Q?6DcZFw2e6VWoLUgpKrx3C4BT9saFfzxBGEloOTxSTIk2D4YpYvN76noTZAM9?=
 =?us-ascii?Q?uf/j9EeIyzUl52dfFeAmq0vKWhWmHXBCFq9PzMH6PAbC2HYNX0Rrzf7rS8PU?=
 =?us-ascii?Q?dHgJFzJLd9h7vXN3JIEUeoXgKc2Jajou1uV5PPazydDhEOgkix+5GPDvxdnW?=
 =?us-ascii?Q?/5OftyMqQCpxkqy1S1jRPZVrV/UiDf7AdQFy7NWGypBWCZ2KB35qxHTeRnoQ?=
 =?us-ascii?Q?lb8L3aChu2QRBASLc6IebR5Ys9OOtDvs/j5GS+tb0y+/IIc9PB2HojSIykdW?=
 =?us-ascii?Q?S4aQKljkw96zZXXYDDcU/5++FekP+9gJaoY9+n0SBGR41y9G9GFTugHdRMrT?=
 =?us-ascii?Q?9wC3xSPILLyP4nL7hOE4N4mUL28b4KX3faar4GBTZ7rx01T3433H49dtFokF?=
 =?us-ascii?Q?T8DQpO1RDz1ekXJKyhUK0PeZQRkFGGhxicxwVYtK13ojCGv5NhEEnNI4cwf6?=
 =?us-ascii?Q?jnFI7Zf1W735bhCkyEIz1ujeBX0xLrU4oqzrgaivFWjx88a3KVYB4asvy0A/?=
 =?us-ascii?Q?0uMxBjjwl9drrt9W/gCzwuK/Ff/HBr6qMkSDxQ6Wgp/Dfpsnm98r?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fe1903-9180-48ea-a8c3-08df1e35acc3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 14:26:39.3485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3pTGHsc9Se8brYpiHJ7A+DUqcqPnBPm0HG8eW2dm0wQ73n/KYE9g98+nx5QwxlLWgRJ7ToZKEwzAm3FGw3AW2kxa6oLEkZMBCwcmc6aThJ67oOkx7Nf8n46Bj7/cC8q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10770

On Tue, Sep 29, 2026 at 04:52:26PM +0800, Guoniu Zhou wrote:
> Refactor the RAW format handling by storing the actual hardware output
> format (RAW10/RAW12) in the format table instead of the workaround value
> RAW16. The RAW16 workaround is now applied at runtime in
> mxc_isi_channel_set_output_format() via the new isi_out_raw_shifted()
> helper in imx8-isi-regs.h.
>
> This makes the format table accurately reflect the real hardware
> capability.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v4:
> - New patch
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  7 ++++-
>  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    | 13 ++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 30 ++++++++--------------
>  3 files changed, 30 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 6aa760ce3605..cc52a90c2477 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -411,13 +411,18 @@ void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
>  				       struct v4l2_pix_format_mplane *format)
>  {
>  	u32 val;
> +	u32 fmt;
>
>  	/* set outbuf format */
>  	dev_dbg(pipe->isi->dev, "output format %p4cc", &format->pixelformat);
>
> +	fmt = isi_out_raw_shifted(info->isi_out_format)
> +	    ? CHNL_IMG_CTRL_FORMAT_RAW16
> +	    : info->isi_out_format;
> +
>  	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
>  	val &= ~CHNL_IMG_CTRL_FORMAT_MASK;
> -	val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
> +	val |= CHNL_IMG_CTRL_FORMAT(fmt);
>  	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
>
>  	/* line pitch */
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index c704be882705..0f3ada30e71e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -421,4 +421,17 @@
>  /* Channel Input Buffer Extended Address Bits */
>  #define CHNL_IN_BUF_XTND_ADDR					0x00b8
>
> +/*
> + * The ISI shifts the 10-bit and 12-bit RAW formats left by 6 and 4 bits when
> + * using CHNL_IMG_CTRL_FORMAT_RAW10 or CHNL_IMG_CTRL_FORMAT_RAW12 respectively,
> + * to align the bits to the left and pad with zeros in the LSBs. The
> + * corresponding V4L2 formats are however right-aligned, so
> + * CHNL_IMG_CTRL_FORMAT_RAW16 must be used to avoid the left shift.
> + */
> +static inline bool isi_out_raw_shifted(u32 format)
> +{
> +	return format == CHNL_IMG_CTRL_FORMAT_RAW10 ||
> +	       format == CHNL_IMG_CTRL_FORMAT_RAW12;
> +}
> +
>  #endif /* __IMX8_ISI_REGS_H__ */
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 21849af3121b..365057db47bd 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -218,15 +218,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.depth		= { 32 },
>  		.encoding	= MXC_ISI_ENC_RGB,
>  	},
> -	/*
> -	 * RAW formats
> -	 *
> -	 * The ISI shifts the 10-bit and 12-bit formats left by 6 and 4 bits
> -	 * when using CHNL_IMG_CTRL_FORMAT_RAW10 or MXC_ISI_OUT_FMT_RAW12
> -	 * respectively, to align the bits to the left and pad with zeros in
> -	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
> -	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
> -	 */
> +	/* RAW formats */
>  	{
>  		.mbus_code	= MEDIA_BUS_FMT_Y8_1X8,
>  		.fourcc		= V4L2_PIX_FMT_GREY,
> @@ -240,7 +232,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_Y10,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -249,7 +241,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_Y12_1X12,
>  		.fourcc		= V4L2_PIX_FMT_Y12,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -312,7 +304,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_SBGGR10,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -321,7 +313,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_SGBRG10,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -330,7 +322,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_SGRBG10,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -339,7 +331,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_SRGGB10,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -348,7 +340,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
>  		.fourcc		= V4L2_PIX_FMT_SBGGR12,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -357,7 +349,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
>  		.fourcc		= V4L2_PIX_FMT_SGBRG12,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -366,7 +358,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
>  		.fourcc		= V4L2_PIX_FMT_SGRBG12,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -375,7 +367,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
>  		.fourcc		= V4L2_PIX_FMT_SRGGB12,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
>
> --
> 2.34.1
>
>
