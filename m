Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011060.outbound.protection.outlook.com [40.107.130.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DC34CC26B;
	Mon, 12 Oct 2026 20:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791838202; cv=fail; b=Ca0jgtFOpkaLpvwhF7o0ys583rjx/S2w/8ejoQL9pXKVjPQ/tjc+R32SxR7aOdzXiJhPhryAwKMh37ZTrrJ4uj7Oe7LLa6bi8OewRCVSzYwuE4AsA50gvBuziCk0Msfne8x9UpGVzwrz8CoJqTY2bZetXRo+fLmXFh0y7nee1GA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791838202; c=relaxed/simple;
	bh=7KPQVyGn0JUNn6oiLey36RtOjLpKGYCYIrNkwO8ckuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JqkaNw1v5VM9wvJIrCpdJFc8wlfOnrX8UYHON910aMK6VBy3pbwKy2nmEOwPMzs7OJQd2A0r8vIuv3KFW7isAtc84ZkyxeINzVoSnl0cTzFstBKAHdDH4thK6ZBAIs55MjmR71LNC5GzRBZBj12GpcXrfXMgHlA7xGto9NCF5V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HgvCQnQy; arc=fail smtp.client-ip=40.107.130.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HgvCQnQy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmvYhegnCsS0stGrFqH8Sgmt/Ho3yw5emxmxLDarrBIHSqTKwQLC0AjiSEsQOY6IbvDe3oGlXYs+ANxzgKMLC7gGwu3G3IN+XNY3bY6uS40NS25jW+PxSCEJ1KqbeVrrViSZqbtfvWih7oWfRNf1Nh4W5YEUcSCyRW50TFS63iTOPUzkqd6SDP41iHaBOMc0FTuWdpvVByP3lpo6NofmbgMm10uQC/wD4mi3W8vH77hUxSvVyGGuR506hODagQfLCRBrZlhCXH3vBxE2qgIdsZwsL/OcE8jSFyhSUXL3b9Oq2JFvwsab0nLHsdUx1G4NWxuefvRoEPhlqWOYNy2PLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmbsKCyxwdPyHYEkTdAV8g4RStqFRtYWCgJyCp6azIg=;
 b=bYx8764wGY+bDdPl5oKYFt1rIx3SNeEfd1K5bgNfm0rlJ4G569OgQulimkAYJXxvUSEvTgXWAQNNGDq8x8sK0T+JyBa1SNOkkuy+Vf1XQYwHldToVeDKwvXGT5aNuaG1+t5HB9M6SPjvoHsMWRLwT579IAY2W/cI7w3L3vjB/gEoIb5/r5jEtwKL3/wGsUweuU+Zjc3rc2EdIro2UxXhZMV3nKIfWn/8zslkstD+6c2LtDdCZ07EIx2FY8XDgmuLGhfke6kr/ufWVNPW3apU+u1rRunXy5iucCdH+iS8C9YWrclqUstSCRwhy7ar6K92CIDc6+w7fIlmMZ7FmeSRIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmbsKCyxwdPyHYEkTdAV8g4RStqFRtYWCgJyCp6azIg=;
 b=HgvCQnQygx62hxCRadL3ToaqCCYSHXm8q5upRr5DlN13fhQ6vl2tfyGloKihil3L9QkY4+qfUQejEFwJ/QsPGr9XbjT0A/E/OKWalPKCn/cNmOxp9sTd+bCpw7fSY/Z+EQ83Rowtp9RB/x1SEaGCdT/ED9FxxdMZt344tdUYiwbKdLcrD1ykarm3nSWlDxQ0wA0DzgpTHcia8KmngMhKs8FyBuPQKVoW9hjLG6sqOmkR1c9E2Dwud9bnf6ZevSopZuHd3+5gbyc1ORIGkgRlQ+UcQWM6nyDuAmE8S6q7o7+kWEbPVotKjC2wvYS0D3kJ4GqE7GDDXwsm9QOEmSGnAw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9493.eurprd04.prod.outlook.com (2603:10a6:10:350::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 20:49:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 20:49:58 +0000
Date: Mon, 12 Oct 2026 16:49:49 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: pdsj2807@gmail.com
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, Frank.Li@nxp.com,
	mchehab@kernel.org, gregkh@linuxfoundation.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: imx: fix function call formatting
Message-ID: <as1H7d-x8NhsGwCy@lizhi-Precision-Tower-5810>
References: <20261006065203.3645059-1-pdsj2807@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006065203.3645059-1-pdsj2807@gmail.com>
X-ClientProxiedBy: CY5PR18CA0038.namprd18.prod.outlook.com
 (2603:10b6:930:13::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a96d027-7abe-4ee6-431c-08df28a26086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|7416014|376014|18002099003|22082099003|10067099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	iMsYgI0Fbnb2CoLPOcQKZJOqNIWZ4o9N8pxyMF7gq/c+KT2O4tJVciUrA+jqhRqs6TLNfBQrJI5DPOaXXCgpdUcHQLFm2e+EyOx5FCz73/GvWcLOzgWzIWSaZQ/22VhI0XEb9Hz2loiYnMGDtSAmwNrQebr7woE0WQ+wbFK1nNqB77LkXVud+aRCxayBBc/XPZOgnVNvLQ+4AeCb61+xP666YRpbF3zqSkVvl/u6VDqk1I2RnG5NsXcNe1Y0pEqWtykQPG2LTAbPGN7a5sg3r7EzLsYFImB3KYS70kQnVQs9207XJbLTbc5OD2oIl3cN8l79m7uncAc61rlGBlm0rOSqsUouQ43zv5BFE/BOxte9jVM0zgvsPBgV3QKHHXdvwNHphbf40zNrsey81ZY4BAlbfnhdRrCNjmaZvuYOL7CKblVegflcnxPo30ImqcbNBKYb6WWWXEArvAbfb5Hur1QyXYN8tKcNBsg+J34PxSHyS5wCF426DvyJ9tFlRa2s23Lv+u2VDXXpWhJ2BXalMu34kuh0PbzpPQRatPoPXxq9BrgPq3jh/AWn8XcI7NrkkhxDr7RWFZXzME2IaIU2JXsSZ7we0GQpPVfEbAYrvsCxxJvx8/M9GnS4s9jJT0eqwP6OUsj6CctkcSMs3gzZt0nh4zLZeSqcfP6gVfWKay4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(10067099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o7u6EzSOW2Ych4wwdUhHnzavhPFiCGw4UnL7EDhJmkETvcdtPPhg6kUdI8E0?=
 =?us-ascii?Q?/M6KfV0KpzAxDMU9047/W1UFE6RyMqnNlPcR82TQPsGk115SeOBPeRZspGpR?=
 =?us-ascii?Q?iGV4aRoOh/s4Icrs4AAxBtK/BzLyAUdYoMh+eWZk/UEBqrt9ij0BS71icpYK?=
 =?us-ascii?Q?9ksVwGse3itAc5a3FxtPSi2QpeDe04x0tYgJnoCrrBWsoECwT6JpfyycNVTu?=
 =?us-ascii?Q?eOtCjHThnps7H/otyZH227eTXnjDJ6yPgQdGg9zg11HWlESKbSN7pCVdpM1H?=
 =?us-ascii?Q?IUQyytXG/iZ0mfAtL3d45ZQCl1Pu//Ta1+sWdjAhobnlJW9A1Zv5yhlDF9NX?=
 =?us-ascii?Q?+FihY4kQ7Nc4tU6A+Tr2V/z1Z36m663sulMVXpQPPx7/gneUhEPRzTQ9/viQ?=
 =?us-ascii?Q?QGhcB12yUHnWyf8HktOpbEzoDPOvTcVAX9o2h/6q32QCoaLqB8LgqWglR7Zp?=
 =?us-ascii?Q?Y/gy00rWraKs+Hm3fclImgTB6emy67AOPO17GZem1kRicneWqzimAu3LbewW?=
 =?us-ascii?Q?ABsJSAJKpGM9g6XrGrh7ZKrR3aK08Xd2lls738sSZ8iDL5Sgwze6daT2BQjf?=
 =?us-ascii?Q?ZZvwwVIVYE45MB7E6n8XJJ2WjiAHwlbkCrNt286QG10lbcTqtH/NhUOWDfKv?=
 =?us-ascii?Q?aSWUViv+F8u05eB/I4WqH4RiFuqIYGEW7TIA4depb2W91pJSOGCFtjzNooEB?=
 =?us-ascii?Q?JyFhRKwmv9oEbKUuzs9C6FRVCTAk3TLt+CIk7RlJTvfA+dHAfznLJnAiygm4?=
 =?us-ascii?Q?2jt5Quc2jcaGuPePMPaO8DWRNEI8HfXtWUpWAwDcP5kjq6nNkNvlR4e5vJZS?=
 =?us-ascii?Q?S0KkMLpg4pkXI66nXXkmlgTlqBVppxuVGgHdjObziU0D2g9yNV2kmDVLfhAy?=
 =?us-ascii?Q?GG2P5YHWq1jhEVolpGIal9g2d32KRRxMyqUj3aTZCFjnK6QWULNdZKEiyYbj?=
 =?us-ascii?Q?S2MLCgeeuS/EE3rQ3SyS7nR2FrFrXims1VHKQ4bK4O3W3JP5fSKKGU4cvlmQ?=
 =?us-ascii?Q?YSw8g5Bd7mq9Weo+k3B7p5J6q8W7oha2fOGsirCcuiZG6QSrZOZytwWwMxPY?=
 =?us-ascii?Q?lMqeVgMb2wlW7USfEzt06fqYRQ5LlIibNVgzvW8qDwQuZbEqagg+KlAEJ6np?=
 =?us-ascii?Q?RAcNtypg4oUrZPXPetHSH4fmjjOALFP3fcNPYBsXAOCNqMnN4lZ9IXG0rUNF?=
 =?us-ascii?Q?2mdhNpm5z4h4tyA64DUQims2bChIVxSxFwqFbu0+/HjKA3ik6quZx0pqnFPb?=
 =?us-ascii?Q?iIGCJJEr7T2aBQ4ldNvV9C9bU/43SYnYzy5kW2AEwlm482ffLbE2ff5Xf5ul?=
 =?us-ascii?Q?ADGoTGo1x5EhIBurdPPOtpuRagKljeYOk2gtvUWnedrn1Nz0e0pDKPjxsEeO?=
 =?us-ascii?Q?C46Q8lbWIml523jIDvnmKDT3D2IQULDhaJRjzVQiPVNWeMCSMqSd2wi41NGV?=
 =?us-ascii?Q?NzQ96AjtdLaScM/yo64vIhghySYCIb2m59julXsB3lIAF8dvADM6v7lhab9e?=
 =?us-ascii?Q?SR21x7ImZsQ6xgjn90qNdecQhEgNY0yZ+k1Wlg5/Z9+r8uPKoloAXUCOYxvv?=
 =?us-ascii?Q?7TbeRKnXNE32ILB/2fefiNPfjAein0S+Nd0tf/uz1CQpYpBZJY5+lmkXSUpx?=
 =?us-ascii?Q?4hnlJ6Rnni7MBMABw24ZviE1n64RG6ov6ibcYMolzSINdEqxXuDnZKmqcIh8?=
 =?us-ascii?Q?gJBuUuZWAigSbmLOKCMiXlOw5ErlNztKsAp8FxFUxo9k4b9c9ZjW9ljFtsxB?=
 =?us-ascii?Q?Es/7hcTmUulLA3IA6lTe07/Z4W72h5+FVDoHeL6NIbB6bTuIT3CU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a96d027-7abe-4ee6-431c-08df28a26086
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:49:58.1296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDvmFS5fYKq5VGipCWBU6BPVrC88G9T3y6CWTlselvn1afswaUDO8UGodAlmJamUUsvuFUu5PKx/0ZcZippsCPIH/ouzA5t/Hem1QNNS+NmVqnfGDhwBw+4nCcznzStk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9493

On Tue, Oct 06, 2026 at 12:22:00PM +0530, pdsj2807@gmail.com wrote:
> From: Palak Raval <pdsj2807@gmail.com>
>
> Move the first argument of IMX_BUS_FMTS() to the same line as the
> opening parenthesis to address the checkpatch warning.
>
> Signed-off-by: Palak Raval <pdsj2807@gmail.com>
> ---
>  drivers/staging/media/imx/imx-media-utils.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index f119477cac6b..978770cf3907 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -16,8 +16,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
>  	/*** YUV formats start here ***/
>  	{
>  		.fourcc	= V4L2_PIX_FMT_UYVY,
> -		.codes  = IMX_BUS_FMTS(
> -			MEDIA_BUS_FMT_UYVY8_2X8,
> +		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
>  			MEDIA_BUS_FMT_UYVY8_1X16

It does not help much.

prefer format:
IMX_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
	     MEDIA_BUS_FMT_UYVY8_1X16),

I suggest help contribute more meanful change, such as move out stage.

Frank

>  		),
>  		.cs     = IPUV3_COLORSPACE_YUV,
> --
> 2.43.0
>
