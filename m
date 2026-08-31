Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36985471249;
	Mon, 31 Aug 2026 15:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190627; cv=fail; b=pTWlqL/fb6O0zfNIcxtaKDV7YagYfeGfZoIWARTJoPFDToI1s4RSuiHwimXfHa58+1Ru/YnjzwDnIpLxmnjT1J0/E/VujzzuTREPw2OJq+4UgxF43HeAUIq0g5d5OxBPtZlKYzu5KO38BTmAvh3wNuMVf4E3zVtEFuW29iFsl4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190627; c=relaxed/simple;
	bh=1Ne2jgrCkNkJ5xz8Ilnl7UDKsfId7j5qK3EfKmTjMQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J8+AInqPP9gAgsQSZBxsR6d3oxoqV0bTU8UJpy3TVyuRqHJnEko5nHcshzSUlC7/O/foDYurZ2xwm+K7Y86pEskxFV7cQeG3AsxAJLu0Qc1lf06T8xO8c6bL8ts/0R1ibBITfPRrFRPP6KXfxHpuNsxYlxSsQEPC1uv9Xw9FqY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Dd1I5n0Z; arc=fail smtp.client-ip=52.101.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Dd1I5n0Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHZgs6NvnXTEL3rrr6ym7j8e6ZmKVFQ39gGB2POMRUYcAhOILc77l9PYGlH71CBugvX+yYByRBkuGjc9jyRW7vx23f4PE6zY8oCMAgn88Qtkri/rfcmuaiRg398K5wcEx++RkizsNjecUI0Nl7D8PU1kFxfKnHs1tlXw5QszdR9tMjR5Z3NWDh7S/6nFdK6Xa1bv6xDAmwNKPEuoZUbz3XjKtD1JX/ATfSxOali+j+DeCgzip4PsU6ht51OJ0lBr4nou43w4Y2yX347R5loVi2VggA7hjap1Ds25ptY3dAMPJ8Z+0iHrNfLRw8sR/eRJWMA1sCK/T8JH7aTeaOyoQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpMu2uq2gG4x7dYpu/hrIOAuQgV/tr1A/ZSboPqJXww=;
 b=riH1Dr3dAiJ6P/naBzBLLli6VWFUrEVZ2Ulm6AqWxVNYHz0xLDy0TNdShYzS/CdEplZomHbHP9lJ742RCIGpetTLgtd6/mwyWXEnjFgz0vIpNJE2N+caj2eQdrM3L2E8Sw0L0rZU/FhYTuRMN3O4UM4jqrR5PcRMKuoLHOckZ4PuUL/oNea7x9mQoLBl/PzkLwqRmONvJHg03R9Wu9Gf/nytCPCprN3rPkPWjX24kfIiTiecK3IHeveKVcB1v74jUp60UyWP14A5nUza/uZ/2HDDIUTjnJZqC89ZoWfuToEIRJ/tksLBOBXYi1bqi64lHGfY9K8dhtHicKfdY/27ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpMu2uq2gG4x7dYpu/hrIOAuQgV/tr1A/ZSboPqJXww=;
 b=Dd1I5n0ZletzniKgeWkpnoiYcDbIN1TRF1TWX4DgjQwdHsfi5h3lXt2zcmngAn1NAHwU7vhT6Lo4Jfatg1DijqcJx4Mv+GR6Qbg9wyi6egbeJ38TdZS+OGpSW1q9hnxEdllPlGEptJKgNE/sWfh/+/ZlV4CCU1sdg14ZDDQd2fqUZlAN5qFi04hDc+m1gRXrShz9g+Q92AsbkPjQ9GdjiKzSaV4yJURFa2KSNVG3AHXUnBii6Iw4vuJyU/DfIhA84XDkK1f7g4r/ULT1pDxBNzwBDJufb4lmGt4OeyA931LK1k/rF40lInG8sn0qRwhQhBlQI+aPV7o7ObNT6BrEBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB9193.eurprd04.prod.outlook.com (2603:10a6:10:2f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:37:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:37:01 +0000
Date: Mon, 31 Aug 2026 10:36:51 -0500
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
Subject: Re: [PATCH v2 6/6] media: imx8-isi: Enable ISI RAW10/12/14 output
 LSB alignment
Message-ID: <apWfk3ZjVZl7SKnB@SMW015318>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-6-fafdb4b446d4@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-6-fafdb4b446d4@oss.nxp.com>
X-ClientProxiedBy: PH3PEPF000040A0.namprd05.prod.outlook.com
 (2603:10b6:518:1::51) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB9193:EE_
X-MS-Office365-Filtering-Correlation-Id: 010421b8-9acd-4714-f0f3-08df0775b33d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|19092799006|366016|23010399003|376014|18002099003|22082099003|3023799007|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	LoOWVe/xYDslnbpAXdbo/YBevkZztMaJXK/TQVHUueWxCSknH9looqBPs/FnWnYUgzTduFIaIuwv027GOjX3AGFnzSjX0m28yWlMWreANh0XNKxr7rmMCOS8sdEiZPOqdPxLf0Qv3wHjRW2VlY/13LIYB8BifPErKZRmTioNpdwXHMo4YV5h5FHvf7gikUuxJqxCj60z+xHmt8QT00pHXrcu5MnQyu26B1dXod9UZ8GTUGKOrlLxljI+HE9aQDrbOu9URqqVnuWc2YW0jWX5CV8rhQDSUU6Reg1NjFafQvqhRN/T38H1QN6a6M6V5h9dkqnFfUd9OpwQF5zwWhdMLC8cddB7qo65U4m8ReP2Fls98WrICLabe6rztye1xVh2dk0IylodUzS4RcS4bfwC1/RicpMjpiBtco60MqJH9+SpjXlVL9/umbdAAn4dL9P8g+2SO6S36Pl5MkPle5CJSE1uutor08S+Iq73NItf5eSS7TJ8/0WawaXbEVHuq092jPDd8oyaRweWjCFK9EsdvySxeo9rq+mlSJ3wfUCK4GqkUQlmiDqbvKHNKGU9QpoN2zfgy0Hn2q3KjmP+yA6RnZa0jOLcIada7x7d/VTeVBkM9U5itBJgMqk8o4CLejRshQL2kbfloW+NdsYEMWn1CJJtkk1VSxCpQRfmfmj2G6E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(366016)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DamkAEeM5HPYRPIfiZD+V35mDXUxA0Jvt2WLc9gDALiL9Ux79EYQjAT77sdI?=
 =?us-ascii?Q?VCpofD5y2t/nrzdhjiE7rULEDAO9M7tRgm61qrN3qClZTnNy2VeSs6HVUZFF?=
 =?us-ascii?Q?1QWmCcGvKosDTFPQpfcaVginwuUNtfhQM1XTxDk5YX9j6gyUK4t9oU5MiTB1?=
 =?us-ascii?Q?fWciQic1ga1UyEoO3a8v1R3teX+ouuU5PdjMMhg3TzmJqJS7uXoeFV6tW7/F?=
 =?us-ascii?Q?K3FSUuWI00sbcn72T9dVv6kdbUzmHQ/e8r4rI/5fg+SvFolQAUcQItfkLEKS?=
 =?us-ascii?Q?/mtS/WLp58NO59tk2JarqtwwvaLwf12nZd5QnrpwizzeJfX/wXR9ZR4sIx50?=
 =?us-ascii?Q?0JQOjI92eGYahIZe/qphM70WPF7FfpqEreq1Pt8v/qGRLNBD2LxRp9p6bmZo?=
 =?us-ascii?Q?t6bFAYZ0n8ka4tzzU+nfght6xyKccqgoCGAulO8fTeD7LZemVAUoYoBjaOE+?=
 =?us-ascii?Q?J2fbJKLHY+RzX2Xj4OmIm7pzoAS/247eP7PIeaks41N0CldX+1iItaTf7rS0?=
 =?us-ascii?Q?8aA96gTKd/En9J3bqfM7o86+AkpF8VQouFTP9MN0si0Pi7j0Xw9dTm/6JLh4?=
 =?us-ascii?Q?bkBbk6NxK4Ct9ztAfzG9LgvX9zN8uET+KP7KoSNwjV3zr8E4qJ41CEp9nMgt?=
 =?us-ascii?Q?s/nwy4qXrXKOMMloAv5mEln+Rvx5p/a8iOrK8Ve5wus/H9thdr9CJovbHlfA?=
 =?us-ascii?Q?8/P1x8JDMAt9IrdWp9cgRv09wCPBIfn0G+fCVpqRV++2yMWl2qBuc6HmNK6G?=
 =?us-ascii?Q?WnqWTtd3lshmvOi4nL2B3DZ8krxPQ5AEdlFkuGsivDUYC6M1nJxxXnVwovgP?=
 =?us-ascii?Q?n3MMm1KS8svSAPiBCjbo5IZRMxa0I3AlSGIYlGE8rxIpI5O1oehoSh5hTA/Z?=
 =?us-ascii?Q?cQubLn8aOh8jXoy++kbific/fjtBGhwxIWJ1Jtypi9W07dqEyydR4kb0CE6T?=
 =?us-ascii?Q?xfwy8yghuLswS66JaQ+Zrw04FMHkMJlF0qvp/+DHn/QblRy4ujLksiY/Z3L/?=
 =?us-ascii?Q?yPChy8zhKseO0Km1esM1Y7BgULN4Xw0ESH9CzqX3W4Olk+ggzy0rcJyZiZnF?=
 =?us-ascii?Q?Y5ctdvXGL7MJ7731VHKv9Mv64ANIykYe2KJ0HaF5MCAmW+TFVYs/gWdFgym/?=
 =?us-ascii?Q?psff/aiH/hUOgXtBUcxQQNnREY9gu8JkkwBC+46uDUQ4HPOpkXly8cmFtdJQ?=
 =?us-ascii?Q?YWLAVNucZiBNXCPAyM7OIMq/YOInsRxdPDOk82/wqtjCclfsRlgji6ZkA5Ow?=
 =?us-ascii?Q?ETivWuaHUBN6YAPmnjy/3s53xWDt/xmDAIo4tr7suRYLhGj8jzE0AvVnvfhE?=
 =?us-ascii?Q?+eyD8zSPN5SNyFHq6SEvk/rTXsE3YDWd8dIexYSVZTEaP9tchUCoarPWfn/9?=
 =?us-ascii?Q?Ou7UN8URfySVnk2Az0Qa2JSpYfi8HFDLEH9x3c+Ys04ZMByOciHEpT8TFbyr?=
 =?us-ascii?Q?LiGIe5Y+5va3ND89+bJRNGFBdQRKk+vQkEakTT0PdNtGv3ZLyXjUMvdZkC6k?=
 =?us-ascii?Q?Tp09heug+agnmndQ+J3J3Zmd27qHm+qGc/MGZmffxAZtVohV8vOcLM84Yuih?=
 =?us-ascii?Q?RzVpLVCWrOVQntnsUUTVrmk8LNWfAo0AYBAYsqTeTum+6LDyV1q2uTG4B9f0?=
 =?us-ascii?Q?H7Rwo6bPKWYDfwzJMF2HUEf4XcqX+t8QsMzHtDXHZtoFDFnF9H10CW+fySrc?=
 =?us-ascii?Q?Obku/tQ7Lt6fBqIa/G/kPmcTGehIBiXLRXBaLQPInE/u6dN7dMUTHHHDVRMT?=
 =?us-ascii?Q?MGDULVcHuBsWlZJWKkoAy/YSLgGKgR+thw7DroMsSrd7yA3KBbye?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 010421b8-9acd-4714-f0f3-08df0775b33d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:37:01.2763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xv64VhEUwFN0Nv8jO2FeLfDGn22QgwUvK4PHMv1hY0EKq1r6b9qR12SJtqaDgai60gI6HM03uCDsz8aRbS3BESIj99mu1K+YsGy34J1y9bSqY38KI6LmdT07l51m5cqN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9193

On Mon, Aug 31, 2026 at 11:37:01AM +0800, Guoniu Zhou wrote:
> V4L2 requires RAW formats to be LSB-aligned (right-aligned). Before
> i.MX952, the ISI shifts RAW10/12/14 output left to MSB, so the driver
> works around this by using RAW16 format instead.
>
> The i.MX952 ISI introduces a RAW output LSB alignment bit. Enable it
> along with the input MSB alignment on platforms that support this
> feature, so that RAW10/12/14 output formats can be used directly
> without the RAW16 workaround.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  1 +
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 39 ++++++++++++++++++++-
>  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  3 ++
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 40 +++++++++++-----------
>  5 files changed, 63 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index d492631dfb6d..0f776fc8fd7e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -394,6 +394,7 @@ static const struct mxc_isi_plat_data mxc_imx952_data = {
>  	.format_mask		= GENMASK(30, 24),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= true,
> +	.raw_out_lsb		= true,

Sorry, I may miss this change before, if it is difference with imx95,
needn't fallback to imx95. You just mention what's difference at binding
doc.

Frank

>  };
>
>  /* -----------------------------------------------------------------------------
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 73f6ea7b0ea1..c352bcf8dc47 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -166,6 +166,7 @@ struct mxc_isi_plat_data {
>  	u32 format_mask;
>  	bool buf_active_reverse;
>  	bool has_36bit_dma;
> +	bool raw_out_lsb;
>  };
>
>  struct mxc_isi_dma_buffer {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 2405f7d33d0a..4838b445f279 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -308,6 +308,7 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  					unsigned int vc,
>  					bool bypass)
>  {
> +	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
>  	u32 val;
>
>  	mutex_lock(&pipe->lock);
> @@ -357,6 +358,20 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  			val |= CHNL_CTRL_VC_ID_1(vc >> 2);
>  	}
>
> +	if (pdata->raw_out_lsb) {
> +		/*
> +		 * Enable RAW10/12/14 output LSB alignment to match the
> +		 * V4L2 requirement that RAW formats are LSB-aligned.
> +		 */
> +		val |= CHNL_CTRL_RAW_OUT_LSB_ALIGN;
> +
> +		/*
> +		 * Align the data selection from pixel link to MSB to
> +		 * avoid data shift since the data from PL is MSB.
> +		 */
> +		val |= CHNL_CTRL_RAW_IN_MSB_ALIGN;
> +	}
> +
>  	mxc_isi_write(pipe, CHNL_CTRL, val);
>
>  	mutex_unlock(&pipe->lock);
> @@ -406,11 +421,19 @@ void mxc_isi_channel_set_input_format(struct mxc_isi_pipe *pipe,
>  		      CHNL_IN_BUF_PITCH_LINE_PITCH(bpl));
>  }
>
> +static bool isi_out_raw(u32 format)
> +{
> +	return format == CHNL_IMG_CTRL_FORMAT_RAW10 ||
> +	       format == CHNL_IMG_CTRL_FORMAT_RAW12 ||
> +	       format == CHNL_IMG_CTRL_FORMAT_RAW14;
> +}
> +
>  void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
>  				       const struct mxc_isi_format_info *info,
>  				       struct v4l2_pix_format_mplane *format)
>  {
>  	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
> +	u32 fmt;
>  	u32 val;
>
>  	/* set outbuf format */
> @@ -418,7 +441,21 @@ void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
>
>  	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
>  	val &= ~pdata->format_mask;
> -	val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
> +
> +	/*
> +	 * Before i.MX952, the ISI shifts the 10/12/14-bit formats left
> +	 * by 6, 4 and 2 bits when using CHNL_IMG_CTRL_FORMAT_RAW10/12/14
> +	 * respectively, to align the bits to the left and pad with zeros in
> +	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
> +	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
> +	 * After i.MX952, ISI add RAW10/12/14 LSB output alignment, so skip
> +	 * the above workaround.
> +	 */
> +	fmt = !pdata->raw_out_lsb && isi_out_raw(info->isi_out_format) ?
> +	      CHNL_IMG_CTRL_FORMAT_RAW16 :
> +	      info->isi_out_format;
> +
> +	val |= CHNL_IMG_CTRL_FORMAT(fmt);
>  	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
>
>  	/* line pitch */
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index 35dec3a650ac..c9c22a3668f9 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -20,6 +20,8 @@
>  #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
>  #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
>  #define CHNL_CTRL_SW_RST					BIT(24)
> +#define CHNL_CTRL_RAW_OUT_LSB_ALIGN				BIT(23)	/* i.MX952 only */
> +#define CHNL_CTRL_RAW_IN_MSB_ALIGN				BIT(22)	/* i.MX{91,93,95,952} only */
>  /*
>   * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
>   * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
> @@ -88,6 +90,7 @@
>  #define CHNL_IMG_CTRL_FORMAT_YUV420_3P10P			0x3a
>  #define CHNL_IMG_CTRL_FORMAT_YUV420_2P12			0x3d
>  #define CHNL_IMG_CTRL_FORMAT_YUV420_3P12			0x3e
> +#define CHNL_IMG_CTRL_FORMAT_RAW14				0x41	/* i.MX{8ULP,91,93,95,952} only */
>  #define CHNL_IMG_CTRL_GBL_ALPHA_VAL(n)				((n) << 16)
>  #define CHNL_IMG_CTRL_GBL_ALPHA_VAL_MASK			GENMASK(23, 16)
>  #define CHNL_IMG_CTRL_GBL_ALPHA_EN				BIT(15)
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index f45c2aae59ce..9a6a8302774c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -221,11 +221,11 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  	/*
>  	 * RAW formats
>  	 *
> -	 * The ISI shifts the 10-bit and 12-bit formats left by 6 and 4 bits
> -	 * when using CHNL_IMG_CTRL_FORMAT_RAW10 or MXC_ISI_OUT_FMT_RAW12
> -	 * respectively, to align the bits to the left and pad with zeros in
> -	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
> -	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
> +	 * The format entries use the native RAW10/12/14 ISI format codes.
> +	 * On platforms without hardware LSB alignment, the driver
> +	 * substitutes RAW16 at runtime in
> +	 * mxc_isi_channel_set_output_format() to avoid the left shift
> +	 * that the ISI applies to RAW10/12/14 output.
>  	 */
>  	{
>  		.mbus_code	= MEDIA_BUS_FMT_Y8_1X8,
> @@ -240,7 +240,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_Y10,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -249,7 +249,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_Y12_1X12,
>  		.fourcc		= V4L2_PIX_FMT_Y12,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -258,7 +258,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_Y14_1X14,
>  		.fourcc		= V4L2_PIX_FMT_Y14,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -312,7 +312,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_SBGGR10,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -321,7 +321,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_SGBRG10,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -330,7 +330,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_SGRBG10,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -339,7 +339,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_SRGGB10,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -348,7 +348,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
>  		.fourcc		= V4L2_PIX_FMT_SBGGR12,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -357,7 +357,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
>  		.fourcc		= V4L2_PIX_FMT_SGBRG12,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -366,7 +366,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
>  		.fourcc		= V4L2_PIX_FMT_SGRBG12,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -375,7 +375,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
>  		.fourcc		= V4L2_PIX_FMT_SRGGB12,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -384,7 +384,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR14_1X14,
>  		.fourcc		= V4L2_PIX_FMT_SBGGR14,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -393,7 +393,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG14_1X14,
>  		.fourcc		= V4L2_PIX_FMT_SGBRG14,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -402,7 +402,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG14_1X14,
>  		.fourcc		= V4L2_PIX_FMT_SGRBG14,
>  		.type		= MXC_ISI_VIDEO_CAP,
> -		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 16 },
> @@ -411,7 +411,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
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
