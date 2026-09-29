Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7E85326C2;
	Tue, 29 Sep 2026 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692313; cv=fail; b=qQ5A16afXOle6g7xLw3eptfnox9I+wsaUWCAs21bELvoXeGGfu9NeP+3F9Ao4MQ9xn+H7KbdoTpG96hpFptLyogfD66tKiiQmj6+8be+AJZ72qcbu2BLNbFfK9E5pQgf3eI2HmoOzoe4TR0nlXX5dc3BOaWlPuu1J8QEY8N7/Mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692313; c=relaxed/simple;
	bh=BpHnvgcTNyFCL3bHKAsde/Jx4nHTTrrPiMYcjc6TaAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sX/iHc90XlB+9cNnrr/xyh7ad0nA1b6In3thWRQss73ynwDGiao/les2L6ieLM1/SJxZ7RULIo+KsUxpN+JTP5oBViuvMoqFqessAsdqH27RPAogStcSYfupwMp9UHfv/Bp4hPUF3q81Tu6M2P6bxwOI9bb3meabBWNhRmXO7uA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vQ58vdF0; arc=fail smtp.client-ip=40.107.159.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vQ58vdF0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qu1V1KEOLsslRdrMNMo81Hx2aMDE4RF/q1n+FuugFgWyxEk9b+qHqhU4MqslyapQP0WyRJo1WTicoG94lqOD8mW6qVwmMt65en/Xr4Skm4RHCU+pDY+lrVYY+lT6sWcAMUrWPWjN7no/IBSk6FhdO3mxDeFc6LZW6LsL21sMLqXqvVmFbC+f+3FbXRwjwyxuEMJaNYb5l/KQpDV9q3T2eFFXfYyYoCyA4fbni/uaDpR7UcczHlYNwXB+6z9AD7vT9dgeYvu+dPW7ll8WIq23TA0fjrGhN0cGvfKcmdIGhAeUeC3PoHnky1mtBXkq2uT6hB5+LXlL0iPYIQ5IDo7a+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJWy1g0yPzG7SPIZMzcccBCIYf0abEhkkoV/iKi2iZ4=;
 b=gM8reykjddKYPvfSDJGQiP7Mvs4zNj0qL716IYY4zbA7MnTI9BIv1RVkhjBSEnCMBeyqvxvAbL4dOLfXIGG3txJ1vYXySMZuaB43ph5dy0ogo0E/1EYvH4Sya864xCuuqC6faNTXBGqQekBzP/YcwKC8wdq2H+mWLRhUiT9xpQK6VSNibav/FLRptxCM4iRhKhzAdVBlPBUjh7kTbi+u8QV+PkQwVJhJOMVzTc+OVlq/KIzXALsQh3pkb5qUV/Jrh7A5VUuMmVONyEIHNAMYa9ZSQJYarteIapybF0MjpJ3WXs9FqgHuXFKiyEeRKB9E+MPvMgboUvHIP2kckT7y7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJWy1g0yPzG7SPIZMzcccBCIYf0abEhkkoV/iKi2iZ4=;
 b=vQ58vdF0dDZr7u0LwbUVEEcDJxyRPyupbFdiqif13dlMhSh/dq8qkBXiC0E782l4LxTjLmDVuCqvJ9Z5vZZ6LR6O9VUH4X1p0AWgaFB4ZSwWKNYLeuE/yM7pvJVcgv3AJgwjmAPyDY7F3Yf5UjY1uYy74VhV13GPc9vol7SFGzKeIqwPLIL4aB0OLApU5BVzfUBWW059IotMaZQUOLVgeoyNXTt8bucfdwk/nUmPYKT782OgbuxsOR3VmYI2bKqHxqqINfk9hNN8JpZKm0WoWuQtdifWDFaFib7IdeN2FgRKHSdVcWcZBulxx5ce3Now3XDE9FbR5BrXRbx7u5SDsg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10222.eurprd04.prod.outlook.com (2603:10a6:800:221::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 14:31:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 14:31:42 +0000
Date: Tue, 29 Sep 2026 09:31:32 -0500
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
Subject: Re: [PATCH v4 07/11] media: imx8-isi: Select MSB-aligned RAW input
 from pixel link on i.MX95
Message-ID: <arvLxIDg9Z85BQL9@SMW015318>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
 <20260929-isi_imx952-v4-7-e69f89c7c651@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-isi_imx952-v4-7-e69f89c7c651@oss.nxp.com>
X-ClientProxiedBy: PH8P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10222:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c39d30-b234-49e8-99d9-08df1e366122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|19092799006|1800799024|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3AqIEAFFUsv0V1sOYH5+BB8KKjNxS2K4H2OlpSe0F0gSRX7laCEhOFk1+nV/8vqHfj+hYu6K4QdSBx9rndOuCARvvGbZwzINJDIEUJCgz87UhCe4QS02HVNZGAEnsDAuPDOteOJaDa4UtGY/BJvxAH/cB24tr5lI2s9d2uUT4AJuYvOr08W1o2nIW1s3m4DcZNRiGmO73oFmnlfUe0xTg7RkM8+xQGRWc7QBHfgY5c9VC5P5YId5IRwzU8B1Ydvz/Nic+YFjR52rRBEs87c8DMu315miaQGwYIbTdxj/hKXSjYDLWCjLsqpDupva2TrlDsAdwEX59HAib39CIKP6TYhpzxjN3qYSYHD70XXc1Tr0D7mh8ITxKuq93k49undFXEMW4TdoLlDJNB176wLgZpQ6PRIhxv34VO4P8ZNiW25akFMDqluAwWNrdsD8J4U9kZw3+6aBhXUE2m8qxWqqCU0xqvZRsHMR3GlqRzY76W2TUB/zP53/OQNW6fINQh2GUjNtapAi3ehwp2gt7SXYHBDXhZjWkABifZeKOmPZqNwNquHMlSi2jdrg6TLtgSJGNZ/4WCUsxBYiShzd2xQj5ikCxZshVSSl6V2CmrT+J46Q42dd0tT8V+Vwa3vrREHx82z8aY9012M5eeW79DGGu+Q4ACRSHH6RyU6/AXmxSt8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(19092799006)(1800799024)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QDagBuUDeAay/AXK/viECU1ytCF+q1kXVtAfnN36oWGeuExhWxlb9kJhxka3?=
 =?us-ascii?Q?qjaHjJkFWHg2a9EgYfZ05ODvnnBO2QcXopSSZ37BLBiM6Mr3SnQcbjFHOtrD?=
 =?us-ascii?Q?DVF77cHVTju5r3tKqx077fqa8ebnJGrgfblWl0SpstsE+amhojLSUueEmQv9?=
 =?us-ascii?Q?oOdA50Zy5qqDxWXVqHJGbc5mc+BXRWdWJJMqFwYD8C7c+dFGsQOEPjjPS8Sn?=
 =?us-ascii?Q?Kg2sZW/A/pEVBlzRP2+0A/FthdvfamA7DQBQn+q+LMVUlkNUDjfkbTZnZtoJ?=
 =?us-ascii?Q?3O94TvkTX0uciRrmCGaoQdWbmfEonZwRWUW5qwzc389oNNyJLcP5FhvlxNW9?=
 =?us-ascii?Q?LgCP4AF5iiLhEQZWw+O9bINeNYIAE/fJFbvsnpGJjvCx9jrjkrDhjd+Ck0Gd?=
 =?us-ascii?Q?16pzueDMbLn7Y0spm8SAsBvnIWZzdNg5q3js/6rkgQRuxuzu+jzP5CgYvABu?=
 =?us-ascii?Q?wlvMmT+Lz6sYM3xyWBLS+XiuXbwJ+dbXtC8eyPaW0SjzSIHfL0Fti5D0e3/U?=
 =?us-ascii?Q?1mEwE724DD2rkDuXFj6MF0/Yk3aFx3UBDw/DFLHjMqnob2NjWW5HgtguYS0U?=
 =?us-ascii?Q?2YWqkZSvjnFt3lZlQNxtWegMrH3l9NyydIC/U9aKCj/IrQz3coJD3jxCbRwd?=
 =?us-ascii?Q?LZi+tc4FKsAtdgInRn65iPe08aIV+OzCw8qB8WkdRjlIAlVo4HEbn80zHy40?=
 =?us-ascii?Q?YAO9NYVJN1arIGgXCq+73+vJJZBtdUtYj4eTmAl3IDTTmoySo46fuIOmz5kv?=
 =?us-ascii?Q?nyu/oPNJcC2R462+KbTFUtmAN+PjZNmfERLx4VYdEylXOa/RkzwOGPsS2mSZ?=
 =?us-ascii?Q?WLL+13LYYuUkal6ca6Vq79JMOIDBVl4LlCbQThNwO97oHiy9Wszw589QSf3y?=
 =?us-ascii?Q?ER9I+Sqf7bOL7meCh4dApAh2cYm8tLJMRoCSQcNTXWaqmngHlodWoZ5Aj+yz?=
 =?us-ascii?Q?1JPNyqCPjiRyuJb30fp2h6wKr7z+i6Qd6MzLp8HghBqFNcQ3QujMGaDFcPbl?=
 =?us-ascii?Q?3huqmyuqYsIYXwCGFRjvPl2KU4Div9igH2v9HJqpuUUdoKQ6qjgV0U/d1bLx?=
 =?us-ascii?Q?ClCKU0RkUcApxzKhxibeYKItDTvXi3guh/u0E1m56Ahvhmwudau+pfXeSE3H?=
 =?us-ascii?Q?svhJtUoIH570o2wsA3uKHFMxGvj5xyIUL46PUE9EjgPYSplW5c/fmOleHJii?=
 =?us-ascii?Q?y6x0Yj9GeYo9pI+DuQE3g33PSdOVQDH40MTg7l023lV21/2Xv+0VWyiOuSnL?=
 =?us-ascii?Q?4y2DmUzn1KQFdzNL5xHtp7wVz53W7QKAZNpU9P6mCn38oudnx03Ntzcs6MNV?=
 =?us-ascii?Q?ewSo1UcVUo9tXDRWsiupRDViBSNeSunqBVJTQ6MYmsycqJqn1KNR23Uv+TDg?=
 =?us-ascii?Q?GzUPU9QhjsCeeHUWMF7JSJ+7bHS4khg9eNWwg99djD1y2clSaCRjEKB97HzI?=
 =?us-ascii?Q?RUtyZhZ5gM2wtGt4vHn7gQLPGhv6+a4dCTe4H87QByzB/mwObH1JOKC8hfjY?=
 =?us-ascii?Q?Jq2TxYpy433mmDtmkkuWPL3IITHFWAHITXph2y02+6q1xuClD1Ud2uuaGTQv?=
 =?us-ascii?Q?oiND8KSJ/JaW3KNFcItWOtGyODVxMAJ40pq/yelyIprvnZbse91ptjUTK5jv?=
 =?us-ascii?Q?tI9p3yQ7TBavfJg0x+cDKMgjFmwYS8WaRhhJ72Goce4kgrbkowxY6XFzIHaI?=
 =?us-ascii?Q?fv4MJ0tv3JtqehJEzjjqcyZAOmcLWarj8AkpHBXgJRyRSI8YkPdbBkmgfTDv?=
 =?us-ascii?Q?Bfo5pzp5T1l+0J5fX3PeJ4LWvc/61PqmO5MsOvcSAUbQgJm41l2U?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c39d30-b234-49e8-99d9-08df1e366122
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 14:31:41.9585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQSB1eh3dOgwikxB8M8FFN6DaFSPHxpYo1CtJYFj9RUaub4tyZqbJMwKfR3RQgZdW1AfHp3K+E9YuMeHzWlZkzZZf8ANYfFpIelANKPY81ub4RZ0qBHmkYZis1V7Ggwi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10222

On Tue, Sep 29, 2026 at 04:52:28PM +0800, Guoniu Zhou wrote:
> The ISI receives RAW data from the Pixel Link, whose alignment is
> determined by the SoC integration. Before i.MX93, the Pixel Link
> provides LSB-aligned RAW data to the ISI. Starting with i.MX93, both
> LSB and MSB alignment are supported and can be selected via
> CHNL_CTRL_RAW_IN_MSB_ALIGN, with the default keeping LSB alignment
> for backward compatibility. From i.MX95 onwards, the CSI formatter
> replaces the gasket and only provides MSB-aligned RAW data.
>
> Set CHNL_CTRL_RAW_IN_MSB_ALIGN on i.MX95 so the ISI selects RAW
> samples from the high bits of the Pixel Link bus.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v4:
> - New patch
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   | 20 ++++++++++++++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h |  1 +
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index cc52a90c2477..b3f32b9796d5 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -303,6 +303,22 @@ static void mxc_isi_channel_set_panic_threshold(struct mxc_isi_pipe *pipe)
>  	mxc_isi_write(pipe, CHNL_OUT_BUF_CTRL, val);
>  }
>
> +/*
> + * The ISI receives RAW data from the Pixel Link, whose alignment is
> + * determined by the SoC integration. It originally selected RAW samples
> + * from the low bits of the Pixel Link bus. Starting with i.MX93,
> + * CHNL_CTRL_RAW_IN_MSB_ALIGN was introduced to allow the ISI to select
> + * RAW samples from either the high or low bits, as both LSB and MSB
> + * alignment can be selected in the gasket.
> + *
> + * On i.MX95, the CSI formatter provides MSB-aligned RAW data, so the ISI
> + * must select RAW samples from the high bits of the Pixel Link bus.
> + */
> +static bool isi_raw_in_msb(const struct mxc_isi_plat_data *pdata)
> +{
> +	return pdata->model == MXC_ISI_IMX95;

Can you add bool in plat_data to avoid check model? In case future other
chip also use msb and complex check logic here.

Frank

> +}
> +
>  static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  					enum mxc_isi_input_id input,
>  					unsigned int vc,
> @@ -357,6 +373,10 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  			val |= CHNL_CTRL_VC_ID_1(vc >> 2);
>  	}
>
> +	/* Select MSB-aligned RAW data from the Pixel Link when needed. */
> +	if (isi_raw_in_msb(pipe->isi->pdata))
> +		val |= CHNL_CTRL_RAW_IN_MSB_ALIGN;
> +
>  	mxc_isi_write(pipe, CHNL_CTRL, val);
>
>  	mutex_unlock(&pipe->lock);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index 5f66b7c9cd1c..35438abf3172 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -20,6 +20,7 @@
>  #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
>  #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
>  #define CHNL_CTRL_SW_RST					BIT(24)
> +#define CHNL_CTRL_RAW_IN_MSB_ALIGN				BIT(22)	/* i.MX{91,93,95} */
>  /*
>   * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
>   * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only
>
> --
> 2.34.1
>
>
