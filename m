Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011005.outbound.protection.outlook.com [52.101.70.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2849946EC8E;
	Mon, 31 Aug 2026 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190132; cv=fail; b=jNNCyp+nmmav8YK+hsxWems47NgCSezXbyynDUFp9IylFrcetDqV++AlQTgD4qEdMfqAPXSBWICuvb9YbeP6R1Y26E0XNweYraQ9KVMv8n2vlE2GJM+GrkvY+fAf4uxVOjbxOcVTJW4L+EPV64lHI7vugB+eTSZ12mJojfcHfMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190132; c=relaxed/simple;
	bh=FVV8P7yddsUI59bDccaL2joQSU0aDRdLfekXS+ZV+W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BGJF6r5FcXUee/cmIT6pqa06JvA/gS7afzMbY8jKyeGnwSidaBUGuwgpw/1UqIEhkIGfIV/ZJOhcMf64L3jmDsZukFvHCfl14RAk2l6rwCVG4ll7iHE7kBr2JmqwSGOqufpqoC9rRk1LWNXdnQZQUpo+sbDIr/01+vHtdg2NBbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aQ93cGuR; arc=fail smtp.client-ip=52.101.70.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aQ93cGuR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/k5NwJ92IHST745/pkNhUHW8cq4N5SeN8dUsyph/7BXKRcOInOMCAh9SC7z+1R3sJuji9NPjNF0K5m3c/NJPkv9m0WkXdEEOncHYBx29dhPQSDjCcy6pjvc+Nsyq+ZK1qZsmA2r9YwiPJnLDRgncLnOOzu3oyf/TvFcdt2thJwkgoR/BkTpfr4nCFgbJzAuMmTwwzS5sf5ABDpUwy9MPo/8mHv5WwTiPPOzqZGcGWdGaAalzuzRTe5QoGyHAlokg5lWhjRH+1ILnSUtP2hzVLJhzFy/PVQ2XblpBxUG3/urIBSQwhd1itSzlrs4IraCTU55bZ816PHZfLXtQFDJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTJGiymNweAO3MR3ozZme9qbxyHuVC8dWkc67P1Agn8=;
 b=V7tfXRyfluc5ePUjYrgrwlCxpYOYU+gZqk6NslPj/igMSQxmKgXX7Pb6XqNwlkrcd9Nh6RRRWqI08wY0J0YuYHMuZp5JvmC6Xysf65PtAJGEEc6VZwwIghh24wdVbfoh9niJh/STDZS2s7CIsz5fqNe9SJ7nd4R8wVqjcNUixryXXcDIO5JHFxXUIBEFaDKX9xfiRbaeP4khwkY8Iz1OFjXXcoUBROK5XqOZh8W99O+7nLzTLu17YU/IAUrD1O0teCkGgTz55NfuTJP277JCwwOWUMxEKT8YTcVREQvAzQfEGBbCkG2lLNxdGt1bMtPLtrUw1ZgkFVyyxWhblabpFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTJGiymNweAO3MR3ozZme9qbxyHuVC8dWkc67P1Agn8=;
 b=aQ93cGuR6UR2l9v7WSF0Nxu5HDdBSmxaO9FeKErkZn1OXDzJ8Nxj8L19rHiFRU5za4+EtJiV6TH73xYCKDVvXYLgzN/ww6YwaeRN0sEbEHhbkkLr9ycIVN/G9MeQ/0zeYbYLZAk8LVFjowOcAERhd60PFO2hCLpLCHdZHQQ7f/8dCpWluP45OW0gFaoEHCwt19/zhW51A0i8y1KuXIsWaVMpXqjyLnV51/1RyRCf4rt+CzfZxQsmKbX692gl90GuUQ1nwmX3mTthLNA5LAr3KmKdRv8t4b3ygZ4WSUb8EkfKUG8d7KNYonz7ezP/PY+Phf69BedI0nFFTGq8ZcUvWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8130.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:28:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:28:47 +0000
Date: Mon, 31 Aug 2026 10:28:37 -0500
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
Subject: Re: [PATCH v2 3/6] media: imx8-isi: Remove unused model field from
 platform data
Message-ID: <apWdpYUfSMY8mBVw@SMW015318>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-3-fafdb4b446d4@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-3-fafdb4b446d4@oss.nxp.com>
X-ClientProxiedBy: CYXPR02CA0081.namprd02.prod.outlook.com
 (2603:10b6:930:ce::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 9906fcf4-3632-47d1-3a49-08df07748d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|19092799006|366016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OQdTv/KT3gi5QZDE6m3N1/xrWwZgEaUCy2f6Qwnv/y8WjfERVBDgbg8h/4ZjNTeJnXIyYtoxmJhNCBq1TNHbA0rrXuchw9+47ULUId/Jt9aWuXAGdMKlN2TIF+VI32i6oQQt8V7eRKrD8GKsp8lDS5PpHBOgUeTD+Fr0CQDjeroL9s9VxSHdDYtUurHMlmha0qk2ROC9DWJCVYiuTzGacOQx+3Dek0Z6YXd83UlMNcXaXQwISvLaW/U6p44x29jBq2zHJFX+d8fOe0555F4x5rnjloT1tkZ23HVY342cAu9s1kq/67usGl55z+l26ys3bHkiSxB4NCf6Hz5d3lb9BO+YjB386BioVLoMwUMfiFwGBLGS9nSoVvWIO/Tkq5NYyt79U6Zcj9xkbT1ZWF9Hn25Q3U9JvYvMSMabFK8eLtENaoT/LnqF+Xy8BEFmjVwyG/Q4Qlc/6OcbODkVA5anlS8T/RKZ/c+OuQa0Lkb633Sik+HxlRejAkyjiQZSbtF0jFqfMiMPN5+NLq9FVjjIKPPUB2wPbK1Yov57OITod9ytW3eeMJm0k7jqx5qbxQWLopE1jntdQlPkC3Z9dbkOe0YmP6acVCPf2U/036pLGBAizfc+MrCWswcEtlJZL54QTEQqrEhDe0xGp+xTsaE924ps8FGsXhESJ6Z9I5I5dQ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(19092799006)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ODA6V8pB1Pl37skFkmk49r6kuBwNFstfJcp2lN6SJjiIcp3el5GI33xydjuj?=
 =?us-ascii?Q?ODRsxxIfJqGu7a4YIK+miNwjojy2jSO9LP4b7svxNv4xYNBiVAfmYSuFyKmX?=
 =?us-ascii?Q?+cJ1F12RshGspNKDOcMgB4vXgDxcOMbmP19+nAburty5WZ4s3THYIm+2ueu2?=
 =?us-ascii?Q?wmdhyrh0H1963TVtQbVqb1K7f7M+X+ZvgIie+BQY/SAxxM0ePapzvhX3wtN2?=
 =?us-ascii?Q?ArcfzoTBttLSOSKcDkFrsKmkxgYwNQnTjEvhqwqShm6mzA75a42SfIkLrByx?=
 =?us-ascii?Q?c86sqab2bktGcF2dVr59OSeQPGkIFpqnrrbOET+Iy1EQNIhI4yR0w8oXGBRY?=
 =?us-ascii?Q?ZV4kBsu0HECLbwsRnus7hdtFrPkByJQ3DIukMjjTqA7/yewd5j8SboOG8C3X?=
 =?us-ascii?Q?zHOcDPKaTZIYS1r7lk29lBBIiJW12OHUYe4qGMlysCvq8adx8ouKqusruDFo?=
 =?us-ascii?Q?LTjuL1rIAl1Vtucv4s05my5/xP5KadB166U8g//d+rk4WcujT8lYVytUR13C?=
 =?us-ascii?Q?wmXbJqAj5l8h5iHaZvSYaF6xKr6UT8BzYZ8bQ4xEnPrAKmYf+Q3aQsIFZQqY?=
 =?us-ascii?Q?9IDmHPbn3jctOslLFD8PwuBrpo6/LGxpuFs/naSS3U2+XYsAqQIQOQyHXyg1?=
 =?us-ascii?Q?0yVC1QrvmboyAXFRuYkj+Ih/iVmHUfw9u9sIjtEd3GAsHQZh7NLKTwMPh1zZ?=
 =?us-ascii?Q?dVTH87Gk5+54Hb1n3TqarUljTxpb8N3FREEQ0xFCUPssA9ysyTf+xsWHWP8b?=
 =?us-ascii?Q?q3FzXPKB/GPlysjgsS6QjnKpu60dMcP08v7+5XrR728NbpONUI7SJFrcUfS7?=
 =?us-ascii?Q?CdgcLxtq6wCdGFaxrX/bE4Tv6HEkrMPEO4Hu/GRptXDk7axZR1T2j+/u7FPA?=
 =?us-ascii?Q?mja5a5Hd4jIO3XTnxmGZOS0PtANBHwsEPFj+RuaeRhTX0nuSN8+8prcp6yqb?=
 =?us-ascii?Q?dRSTYVkPjQudVowlN8G8wDtNCdWmklLQukZ2HppAp9GdCUmkyIjAFfmDwkzm?=
 =?us-ascii?Q?y0Yknk1o3VSVZARwBouoLBa8OCue01o6wZBafumjW0zXYZoKYDkn2D3G1LwR?=
 =?us-ascii?Q?j3hzrrTyUugTGTalVeuUUAJWpQbw/F0lopCPMRubTzg6NMduEI2qB7Ol1Xjn?=
 =?us-ascii?Q?fS1shIz8h/KzFzwcQ5hu8HLMtAdQQENJO3JonDq8leCofmwXqEN36lUJZG6w?=
 =?us-ascii?Q?JV74pIdOv9lRnq1JY0LlaxyBIqRvFwus2sTGjRPldI6cq+sjPtDkre/l8K8u?=
 =?us-ascii?Q?IpIVCQ7iMo4WhNMobIJtCDM9aC15q6jR8NU3c2ueEfuYYaNrOXk7Jk/9wbdG?=
 =?us-ascii?Q?Q87bpIqLK9GbulSL/cPCVBktbcx6kCV3xgiFz4EETx7rKvA60uOp+UlerRE1?=
 =?us-ascii?Q?WIScj2OpQqWIBtKy41Dnx9cCZJKW2vur9PfbpEXRsJVy0V7tihmfp1K8b1ck?=
 =?us-ascii?Q?uC1gUE4F+yg6t+aiHth93EEhWzIqLo/mjZfityibiRR6ZAZYnuh7d/l8enJn?=
 =?us-ascii?Q?u5xXQi9SxxmwUEbsyli99KALH7VffE4jBfBLQRS2AK+hQMoUekIggtOB21TY?=
 =?us-ascii?Q?aHOFYd4x+k13SEgEn1GXhb2mttUwxwCMa62x4EfE/GFKgdxhEMYM3DZpRcmn?=
 =?us-ascii?Q?3xlAdQ9gW5fkB3iZRpmyB+WsYR1JqYl+8WXlMVYs9b5zITvO8DJKr/uKiHgV?=
 =?us-ascii?Q?9BdZ3lferJOSK5w1y7c6BYffPcSRR9fuksDTtL6ONIZJR18jN5K61hkduIAQ?=
 =?us-ascii?Q?ym9JBe8tqhRSO4fi7226CXeiePI8ylMeutTjwdDO0fiFLAedWOEv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9906fcf4-3632-47d1-3a49-08df07748d0b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:28:47.7035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TR5Hgc9L4N+95ifIDbRFEjsp1jP3RVESgVnawq3AhSjlsGjoSQSjGWVBWTDRXzEmxoSMztTZIp6rq53QChzfQj5JLw4SDeQWvZZVl31yjXs8cPZGwkt8HZvxuzHgx5c0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8130

On Mon, Aug 31, 2026 at 11:36:58AM +0800, Guoniu Zhou wrote:
> The model field in struct mxc_isi_plat_data and the corresponding
> enum model are never referenced in any driver logic. Remove them
> to simplify the platform data structures.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - New added in v2 (Frank)
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c |  8 --------
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 12 ------------
>  2 files changed, 20 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index c1c16dbc1539..e627054bbc8e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -291,7 +291,6 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
>  };
>
>  static const struct mxc_isi_plat_data mxc_imx8mn_data = {
> -	.model			= MXC_ISI_IMX8MN,
>  	.num_ports		= 1,
>  	.num_channels		= 1,
>  	.reg_offset		= 0,
> @@ -304,7 +303,6 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  };
>
>  static const struct mxc_isi_plat_data mxc_imx8mp_data = {
> -	.model			= MXC_ISI_IMX8MP,
>  	.num_ports		= 2,
>  	.num_channels		= 2,
>  	.reg_offset		= 0x2000,
> @@ -317,7 +315,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  };
>
>  static const struct mxc_isi_plat_data mxc_imx8qm_data = {
> -	.model			= MXC_ISI_IMX8QM,
>  	.num_ports		= 5,
>  	.num_channels		= 8,
>  	.num_vc			= 4,
> @@ -330,7 +327,6 @@ static const struct mxc_isi_plat_data mxc_imx8qm_data = {
>  };
>
>  static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
> -	.model			= MXC_ISI_IMX8QXP,
>  	.num_ports		= 5,
>  	.num_channels		= 6,
>  	.num_vc			= 4,
> @@ -343,7 +339,6 @@ static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
>  };
>
>  static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
> -	.model			= MXC_ISI_IMX8ULP,
>  	.num_ports		= 1,
>  	.num_channels		= 1,
>  	.reg_offset		= 0x0,
> @@ -355,7 +350,6 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
>  };
>
>  static const struct mxc_isi_plat_data mxc_imx91_data = {
> -	.model			= MXC_ISI_IMX91,
>  	.num_ports		= 1,
>  	.num_channels		= 1,
>  	.reg_offset		= 0,
> @@ -367,7 +361,6 @@ static const struct mxc_isi_plat_data mxc_imx91_data = {
>  };
>
>  static const struct mxc_isi_plat_data mxc_imx93_data = {
> -	.model			= MXC_ISI_IMX93,
>  	.num_ports		= 1,
>  	.num_channels		= 1,
>  	.reg_offset		= 0,
> @@ -380,7 +373,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  };
>
>  static const struct mxc_isi_plat_data mxc_imx95_data = {
> -	.model			= MXC_ISI_IMX95,
>  	.num_ports		= 4,
>  	.num_channels		= 8,
>  	.num_vc			= 8,
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 05c21c448b93..73f6ea7b0ea1 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -155,19 +155,7 @@ struct mxc_gasket_ops {
>  	void (*disable)(struct mxc_isi_dev *isi, const unsigned int port);
>  };
>
> -enum model {
> -	MXC_ISI_IMX8MN,
> -	MXC_ISI_IMX8MP,
> -	MXC_ISI_IMX8QM,
> -	MXC_ISI_IMX8QXP,
> -	MXC_ISI_IMX8ULP,
> -	MXC_ISI_IMX91,
> -	MXC_ISI_IMX93,
> -	MXC_ISI_IMX95,
> -};
> -
>  struct mxc_isi_plat_data {
> -	enum model model;
>  	unsigned int num_ports;
>  	unsigned int num_channels;
>  	unsigned int num_vc;		/* Number of VCs, 0 = no VC support */
>
> --
> 2.34.1
>
>
