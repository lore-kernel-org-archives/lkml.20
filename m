Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189D33A6B8D;
	Mon, 14 Sep 2026 19:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413722; cv=fail; b=fu4g2kGFa9yi9rb7cevtVx7/XxWOwuUKBec9nyF9e48fBobm9ui147fViXGumy9+F1Xk/HhwtU3JidfwaKlx2YnysD01b8Rm2HtEMFctWwhLIlLr9gI5wydksiqww36Yoa82R6VskBQChF/asQCvDdBfdvP4KkfBac9EXQ6hoao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413722; c=relaxed/simple;
	bh=uuwANCaRFGC1X2Mcu5oiopd/w6g5pbDgQ2fhHoBMZWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RLB6op81TalcKYXLYoeyOS9Ku9LCMVJ0NxFMRSIH+GypfLGw+xVhMiLg6OfcJolbbkJ1UDtO8kU6WBH8aN1UMkIFeWV5YYAefse7kYE9I+IBeQ/nmpfyUnv/9n81/hGXwW8YGuNFR4wRioIcQaShmjxXKmkZNhSFfJt+hGVlFpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JsqaRcMi; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JsqaRcMi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+f+HIID1b2MczeiRWwJBj8iOxovzEeQsIGm5ivSmaukkhaICq06EOkIsqD6oaJgij8eptspp9OOxauq/Mcfjwx1YWKsuc05kCbAWvLBIqbrwHcJHvIuXRC7yUhhDsARAj9JN7wSfTa+mzD5DB33APuKGCdFZAIf4WQ8aYhu0zCSeQdx9TwjD7DLaqaJfvc9YFpy8rww2663a//lkcj4d2OZTw/XYMeXc4DYpIaveVemp5ssHZf/AGuJWQhPw9NJf7sm/tJ3VDcPAZVoHWvtm7d7gafSR6Yy11lyQE7ZMBX55x9w0AcNrfhzF6yPCpzjll3ksU05GYFrNye2gqfrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdHF7p+9TZqrn55ScaqeBQwD3+TKb8y+DZAYt0POxmE=;
 b=F6M45Vdv1SODiyjAYbYGpOFCI9mOMMwqxExT0a70/ZrbXIUvyKWWFrZj50dzL+j2fiOUiQirvMpqzB2ALZS+oaI3Sjoj8s56oLk5KfM/9QT1eYHT34XmkvYGW2K+CH/yIbVv9I2PSQvF5LQZzJkTXOj+U1bSVjqPHxVMvfAHrz1BMzyclGXIUv3N54zR9AvREDm2OxQ77rvb5E67KDu33Un5KO9y/aclGeb9tWWkXnMtL+7V/nfDyxRGE3KLLmFQwd1JBBx1Rlb4xrDwjL8NzQsKPh+0JEUJ0E7o0s9fxdgBf07epTodxK58fvwLOXMpdI+ysPzmGOHvqX2CDT1wjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdHF7p+9TZqrn55ScaqeBQwD3+TKb8y+DZAYt0POxmE=;
 b=JsqaRcMi7+6ghorseo/Tgam7E4ddLWdRSHZ9aufUXufbib2K2v0n4ROXT5SOFaahuxUU3O5QMW4O1dVEC/sVTeBfF0auNp2Tp3GRU6rab/H026oIICsLFeoCB1m5zIapq6/FkSbJK8UPQhHBYgw+KiSejiUn8+ITsQYVJxLh/DVdFAZCa03GmgTYuacZopBcTjtvSP6al0zSHckmoW9ql/dUOfB80yoeoFn+xaWdy1/lC28H53+kSTCXMH0jrimK1xr9Zw78Jz/Dbuh1hRra14oo3PTJu3k84/BIiQ7kk8go/EMaNNbHdI26Sn2Y6p2J6QGXtTFBAaTqxM7PvHXapQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9377.eurprd04.prod.outlook.com (2603:10a6:10:36b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Mon, 14 Sep
 2026 19:21:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 19:21:57 +0000
Date: Mon, 14 Sep 2026 15:21:48 -0400
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
Subject: Re: [PATCH v2 5/6] media: nxp: imx8-isi: Add i.MX952 ISI support
Message-ID: <aqhJTDASOtDZrYDn@lizhi-Precision-Tower-5810>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-5-fafdb4b446d4@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-5-fafdb4b446d4@oss.nxp.com>
X-ClientProxiedBy: CYXPR03CA0048.namprd03.prod.outlook.com
 (2603:10b6:930:d2::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9377:EE_
X-MS-Office365-Filtering-Correlation-Id: a053a979-c24f-4b66-d33f-08df12957147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|7416014|376014|366016|4143699003|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	3vaG5GXd8JBydEsBTH0wm3O6n3E/6SIVbIlHen7DVV02Ja5X4PyGU1gxhv9oy5cj3THX4fiRx74Yl9FKIlKYYk2Z4FcL/ulU2a33MH//eNNlL8CqC4+/E95ylioceZovQmKd5oPVR3ue+AXcJj1AbsQJDQEawe4Wl967aObXnhM4LQu/ZG47s5Srp4aDNZ8VWb176Nr5pTrA1k0lS8O9kHI690pv7uOdiVmZo7OO93m+/JU164VwurE848UGSElv024+nEmu8IoUcoP1qsjiS5eEtAXE/AptB0hM2KWGlQneNsP1iD54Iw6oweM7gnkHyRPYWGh9TUa2w4tCyLj2hnRKxjLc7PjOzzlyg55d3Wlp93JVIwj63BsBuaNgovZT3TIdQAe5E/A6fLzv8Eo31+oXTveglH7SaXVViOCzADhfG/cVJDp8qPwbrgGnj69qBR8pMaJZo/qcUWsJT2iJAeAnqV1o8Ayf4g464ts6qoReTUO1arwaMtAtCyd7WhfdD/uj8XUZjLzErsMm0DJGAWchJ/09QhoG4wEtCl4aIMygCkXhBC4hal3W34NRtTejj0ZMzORdvEtPSjguCGGclVY44qwqbILcRGdz0cBmRoWQHGlLI9hy4bViHkuwxprir07xb/69Qtsn9+W/QSJthQuSCoUq0grzTrLoqnN3eG8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(7416014)(376014)(366016)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dzg8LjJiKHPODsOWI+klcoDZXf7KSLajCx1YyeUpDkWFVNEa5c1hNaeRAVJ3?=
 =?us-ascii?Q?R6ejKNwHyUyr9B8lgsCxnS97K9y9743qFvehIg+dQAhUK4DK1YQ/DhouFmj1?=
 =?us-ascii?Q?Wla6JbmKJz9CZWFzV3qu8zOGLItU4CH5MQYLdmBwHdvSTdmCTdH1uFnVG/26?=
 =?us-ascii?Q?raSxslIrPMQEhrDgDZEFQepkwDTLUCTqLtUdeshM2NX6jLWQ3GqCAqlETdFd?=
 =?us-ascii?Q?ptEqWSkXUQkzXacQxVp+oPavmcgqcLVI6eQ3KZGr/SOIdn4pE7nlZTBl8fY3?=
 =?us-ascii?Q?pX5/AJxN5K6F1AokjD1dXNrCWgN8kZ2sNZHnymz6ESu+woQqbjIbTUHiZunI?=
 =?us-ascii?Q?M0vzHobLhA1Lp2Sygy9Fwq8p2nQ95OsNGfE4hlDAMnNiflnSfngRpNxwUXod?=
 =?us-ascii?Q?gHZAWrgveKfM7a/hzQz3Ry1r9ETzG8JSsvo6fuGIe2HJOMcJSHBXslfgeh2i?=
 =?us-ascii?Q?3VjsPlfQanCBMyOWDTtr4+XYIDMXeSx1GrEOXHIBjZnYyA0DQ9s5GFLkCPzB?=
 =?us-ascii?Q?9+4u5zHNNVLT75cL33JTFW8aKzxqzpNreyfIKnURjvXNvHa1Ca4E7lUareGB?=
 =?us-ascii?Q?TXXW31zEmrAkLiTRdN2fkg37u/xWfZE9B1GRpt471QiynGMfvZbPnAE4DL/f?=
 =?us-ascii?Q?ZL9neSBvTn5myerjQpAbZJ03fhlxBG/JACBMQ5iWM0uwOfICro1VqHiNHMq2?=
 =?us-ascii?Q?Mmh5uEjk/ZMuIxw7UYnnUi4CoyNN4+O/YpRUdGF3WSJ8f4CjnRBN0Q0sVRpi?=
 =?us-ascii?Q?n2Uyf9ZZLvrWfJJtLOC4LhshEaFCCyOF4ig+V18DLjnX77T/I/GQBqLHc9vc?=
 =?us-ascii?Q?EVnRmiz/LxE6WEZwCczDwEzwCRWoFwCH0VZ2kCQv1vQnXSKlczyHVO7i6wMY?=
 =?us-ascii?Q?v5TKP8Aiy2rGBhlBt0LaFHpmU/wpsW25wtSX0Sxye8WnFrR6wrY6Qx8dCX3k?=
 =?us-ascii?Q?Kkp+GCDXHyYvtQbntmqM6ZM2tAz131KCfBa7CuyUFDoFQdRBUF5vG52ooYwq?=
 =?us-ascii?Q?gzxC4FIBowKpx9yWd36ZQaSswT+S/qV1tdfXoYDYDAUlK1eOXzhZOZLOMeSr?=
 =?us-ascii?Q?cS0fLcwdiWtbdoB4EpuTQL/NoVk9KcCB4/bdpWrrfduZT9YGDUS+5kmS5Iag?=
 =?us-ascii?Q?luBWUY5WcCiRkMhSpaOsgsRhgr6hYXCCkvua0R8tFO/3LK1UIfBRaQ78g9aU?=
 =?us-ascii?Q?02fMbkC7rf4vx5xXduCKWdiIFdxoyeQBEEyzolb88qYj1qUVI3t8haz4Tix+?=
 =?us-ascii?Q?CMyDBQIEoDJXKHROBS5sA3//nDdWsrkUNuaQLtTvDTB8gY3c0FTLoWM0YGUc?=
 =?us-ascii?Q?SADDKs9KuKFIdar8Wy82EINlzKmS8vlrskOReuUNly3rFgGSs9hN+rLzr7NV?=
 =?us-ascii?Q?gULZLITT/cSCrNnBpwLxxdcPNjerfzAx9gAUVEHv855dDBSAqnobGmguord8?=
 =?us-ascii?Q?KLjCvlewCRiLnKEHjM/PtXzQqOM7Q0TqcLl0SwcnFJ5xIZGq+eJvviWLrwEs?=
 =?us-ascii?Q?tsElkX8FUMRygUsAIh3IQWVB/HgOENqPLEuIGVUTiYqlu3k1osE250DE7spk?=
 =?us-ascii?Q?HAsb0wiXxPzcJnPtnLjdGcNmFXb++72GuWdNU8eB2xp2xLs3bXPWKcPcMxOH?=
 =?us-ascii?Q?5HHtOV2o4oKIBuTCDacRkbEDTICKgPAG0QcIRSFk7ma59o0Z5/OqJgMKxwbM?=
 =?us-ascii?Q?MesoxsJO549OUM/L9Bq0lpM0OZMlPT43bEDB3b7jfEOociaJC8qHjlWgELFn?=
 =?us-ascii?Q?3KXcrGWk4OgYWe5CoVeUGZEWlsBUzGTWenHqvPFJex1lBDAw0NLw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a053a979-c24f-4b66-d33f-08df12957147
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 19:21:57.1835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PYkB6j/hNMPT1vSO6VHceiwXwu0bITmuHe8p+lsx4jKIg3WQjssbFmu/LFUNA0Kweo1ybGL5Q5D62t9ZiaA2epgtMblrK7ZIddHES/NjCzywqEt1AyNQ4xhAu6JaOdv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9377

On Mon, Aug 31, 2026 at 11:37:00AM +0800, Guoniu Zhou wrote:
> The i.MX952 ISI is reused from the i.MX95 ISI with a minor silicon
> revision. It can process up to 8 image sources simultaneously and
> obtain image data from up to 4 pixel link sources.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Consider patch 6 extension, it is okay to add drvdata.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 13 +++++++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h |  2 +-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index e627054bbc8e..d492631dfb6d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -384,6 +384,18 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
>  	.has_36bit_dma		= true,
>  };
>
> +static const struct mxc_isi_plat_data mxc_imx952_data = {
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
> @@ -574,6 +586,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx91-isi", .data = &mxc_imx91_data },
>  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ .compatible = "fsl,imx95-isi", .data = &mxc_imx95_data },
> +	{ .compatible = "fsl,imx952-isi", .data = &mxc_imx952_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
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
