Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6693C4DD3B2;
	Mon, 12 Oct 2026 19:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833891; cv=fail; b=ANxVVB2VpMaWwNt3e+qQH/GHtoWshkABFxYs/U72/+y7XjohkXyLz/GOG5ws0oYXHAiSuSwgruAZ3wycqetZKuezIrjrnvYe1Zg5TLz4kOODMN+LcFK4UZ7JaNxFQeldhkpax8UBi3nRo21vMB8jeifnhPZGb5rAk/gkusSu45o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833891; c=relaxed/simple;
	bh=whmRED53R05XWtPIKTAu1c6t9Ig73ZdlQ6gG2gTKr3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Kmc/LowrbCUk++Aig7fgZ4UMBgf3Nzr2IpwHFW/H3e8cpS0zsHP0Qnvg5204neDvbI0p0/ZIWUZsrcXgvLS+VFRUqB8OoL/jWGSK3mm1B5DYcg5ewDb/lPFY4PaEVhjjT6Cx9TlGrikDAY4I5jsWR9sw+bNg6qnD8Lrxb/k+aOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JbuA5irY; arc=fail smtp.client-ip=40.107.130.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JbuA5irY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvzS00S/c966HO54GlOU3uC+NGULZw5oyzcAKEjI1golDM4zwBxB3WSjB3V+NCkXUMK5xn/oSB1qgA6TMI8SD5LsskuPI9Nj0Qq24PKXjdjOXA/ugr02t/rz09V1Wm82RubnwgpBzvkWe2LL6x2d6wMQ4OW1s/7om/HDkdzskP4TjIc+EPmDSdDx3MDCYsE3tt11j/ScGwn+3UMIQ2ocJzxi3GGhA/J8TKC6oV/pK5P11n5o1BNsBMicu+4t2hV5Ji5xOgIQRuFbfy2nfvBBRAcqh0tvVNqYexjHTECDaA67boPqwbETTVD6S1Xsaicmj5El29YVrIo+lBMk+Z6wmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFx7q2gw969qniP021RhhbzLfMyq69zDXvyzx/KYCbM=;
 b=Le1HtPxtT/gI9eaAKmjkXKmnfOMDD9kjIvGRuGjFXpaW+KMvWBHUyKpAeoJWYv+spSw+WUD8M+JJSt6LthyncNYuucojfce21L4nbYtCWG+aMkA1um3xcXpmemC8FxsL+gOGcO18R5X8Tuve4h8TckA3pmN8I97yx8MIZCGuQGUmck1wyMhvn/4UzmiqTw5glO7GwVwwpP3W6Jp9UaSNMbsnvkCDAkVw+nITygamj5Y5UtJJMvL9VzhMzH8ghxvWPLT37ldN1LzgG66ESeWfVzRgVObknNJl/tFcQS95QIXPC+TFu9Yk/typhKiAvJPyye8bMVkRKAGaiEXq+MAZkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFx7q2gw969qniP021RhhbzLfMyq69zDXvyzx/KYCbM=;
 b=JbuA5irYB80cqE0PuEJ41/b1dxWDokyq+qxhV50btZJv/D8tY2Sz9YT2kxIAcSVRLA6zCd3TijbSL5KzbOe2yJQwT3Vz8L5qLTQ6ZVRVR5zMKvbqWi/K+libK1NkUdAObVEgVhxIfhignf/uuTsWnKK1ivqiMSzCz6Qnz98L7wbYQCD9j0u2QaQruy3aLRlC0Ly2BgdaXODJZQeN/GnI2QxBlnpB/TOAUY3Lcwv+s9Dn11AgZittn9kegjjfmZHQ4sd4Y+yMsLe5c6qLzhg5hAItIVygH7MdtJuWPD3hwOqKro+DfOxK5GzAbrRItP+StV5k6G6L7BJP7zrnk1melw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI3PR04MB213044.eurprd04.prod.outlook.com (2603:10a6:800:375::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 19:38:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 19:38:07 +0000
Date: Mon, 12 Oct 2026 14:37:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH] media: imx-mipi-csis: add support for
 MEDIA_BUS_FMT_YUYV8_1X16
Message-ID: <as03FYJTi__INJZL@SMW015318>
References: <20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com>
X-ClientProxiedBy: PH7P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI3PR04MB213044:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1c441f-912a-4b77-ea8a-08df28985704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|7416014|1800799024|366016|376014|10067099003|22082099003|18002099003|3023799007|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	hV9KGk+j+cG8/DCN3/4wB9mkr4+1XseJYJljQ3oLpRh3MvwTB+kRRhO83eNxIQ0bbODI3JJ33voCiSFm3xE/gMO3O69pDPASl2Bppg4prWHJWezz0k2uLl2J4h1u7boEZ3URANoGCiVmYyvk+RDkA8nwwFk2o29GRz6U8uUBdY8I/r9XcCqr4IA6d5iEJ22aA7fv10BdgyCJvr+gbRdI4yCzcAAjU3KqIoFWmVv90RPUvJWQVdTuHLoVA8+faD5gefM+YsDFqSXLpGXZQVVLtalUjFWSnbG3gfffNrL4lH0zFKzufPyWn0kG2mtzP4vdynuKQPcuEShqN50pWqJD0ORBTellUp1ejGYEBAwnhC5Mz4pkF4jbGrIf46EtQvfYMkojssceZRJO7SdTFxtNOu55FyzIjsGYzvn+Ltd+zN+Bw0+h0i2ZJFJXyehwZ7Tcd+3G3xEKf0Xlzzwre2ojfLxSrdouG/lpsJCjED/jb+C4FnA4P/ISei9Jwd2y9Wl0BEmjPv4E1uqYt28tL2DAWsfnGU16J2DnIyvDp4KhzDiDQuKsBeTneKtGFhtLNcKCluCKtwZoHrDwCTHqcB+7m1SgUhlC2FgKlrm96gztb4K8ghEEBABRmz9WgWNV7hw6EcLGDMql3vz7CdI11BDwJXjUUKiHEM0Z6ucegdIIKOY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(1800799024)(366016)(376014)(10067099003)(22082099003)(18002099003)(3023799007)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6lrl6liDvOl8kpbXOfNFyoiYXFAnhMLwU50eI+6OJb15f3MJpyaNHy9hu3i8?=
 =?us-ascii?Q?MbKGyrw/s98Iu4Kg2wtf+lJapcioJPBYQKp3a+Sr/Iy59qx1z5MT4pU0fLrs?=
 =?us-ascii?Q?xIdPLH/UsQ1fK1sc1iFG0PC1CAki6+LtHONjahLhd8IzIAGiHpagCNmNoPJP?=
 =?us-ascii?Q?2zHHJSmpPMi6IF0M3E7T/03FmMplM+1mVxy84hVEuHoJ7JhIHdgrYqzlydpE?=
 =?us-ascii?Q?Ok+j/0HPHGMAaeI4MwVgfnp9CpiL1GU50duRr1XVH747FhO6JM5B6fuBybUG?=
 =?us-ascii?Q?MLov3pDG+oYRQR0IMTZmF8dAv9jJrCe3Vz/5GUHewX4bMPnyjNiBDVBmgSKr?=
 =?us-ascii?Q?uzZ7UtBUxAmMyXc7vJS5emxJJ8GKYrhR/YwGYO7tlC9fKBIhEZVzLkOCYk8X?=
 =?us-ascii?Q?f5x8yiucw5RwlnpjGni/DN1BmrcdGh1KvzyH5wxOuoxliguAokcBQUjLIIVE?=
 =?us-ascii?Q?r7R8Whno+YQm7HDft8ErH2kXdGr0FoZbNX1P3KORldWjgWtNDD76zTcy+a8W?=
 =?us-ascii?Q?drLM6v7ud6yRLWi1LwUL4pyS8gUZvH4DdZm99vwabs2efirajbgGQkqPQfs0?=
 =?us-ascii?Q?QlRIgt8LHsDs2EaeKr7LrzdMCvU8+RIpzDmztAv/ZXn1TI62ydTNGlEhPxKK?=
 =?us-ascii?Q?5m1f0vz8XHjSoxtRfRY02wEYemZJcTAGhzHguhJvTL/MMTO7dZYouvXP2WUW?=
 =?us-ascii?Q?614Vmd9IN5ylLRA2lOZn8/SDJEmL5drs4Ygz8VRCBWOFGy/35IQytRJ2zB6q?=
 =?us-ascii?Q?NKjxlImjsAHXNBnWrKPIT4aDXvUw4iT61ZHlcKGoVPFq4kyQabL5jkE6a8n1?=
 =?us-ascii?Q?u8UHs6JtGw51pJLuAGX4A3gcYmfWp9N8nWJBHZEEF6T1QgdYzFlj/vEPkKeH?=
 =?us-ascii?Q?HyUnoF2/wToP4A72YifeLlo8oZbGZMU1biE5sSkep4olulHJB5iQMspTNEw8?=
 =?us-ascii?Q?ZuxiKChivwjASgUFsXwSRjOC0O0jJZpMeel36/Xm/lvBCVcnqt7cZ3GLPvWu?=
 =?us-ascii?Q?oZg9N8Fip3uYf8kMk9zKu8vZQnfuj9m2yLdUKQtLpUMhWjI33EMUk9CZwMaz?=
 =?us-ascii?Q?w4IdCvHMLTr989XutE+RpHwxkCrWAc/sB8TA6M4hU9UNIevk3TbpeRHT1bH0?=
 =?us-ascii?Q?2i014b0rYfgNywd3ZJzcCyK0e4jqxennc6XLtPNc1USmt0gvv7r+XbAUDypB?=
 =?us-ascii?Q?Gx/7bqwGPt9wsknvnoamLLIHSoOWC6BRG4/6kqdUvVEEcqVdP3dBQKxqn3Qc?=
 =?us-ascii?Q?aoltt5PZsUp++08J9APQM8YvjFRDQwWnKDTqpBEL52fqMSjo6WJIMRZCq7IC?=
 =?us-ascii?Q?3VRiPqgCtuWCUaL5yak4HNoxwLa2e8wsjt808hHIsYNxJrdc/rJ7E6zg7xKs?=
 =?us-ascii?Q?iy+2EIjent4XX5Fp4RJ2tj7dRKUZUOFG179Z3k+mmXwBOBJm5+UvX2miuHsT?=
 =?us-ascii?Q?DRJF6MKWe+bpjDlu4yBTJbbIpF9EW7d1KlwcQnbaC+0C8TWVydHa1EaM8LZj?=
 =?us-ascii?Q?DYWBsAumrGlWP+rIVnOWl8WyxqufGT6GbAMZC2kMk7vWWVXvEod2Osf0yvqE?=
 =?us-ascii?Q?pddy3Pl7ciKOPKj4WJVm3llOHqzxfh7wlGysGpR/hE3wo0Ipo2dEafTJfwJD?=
 =?us-ascii?Q?hOxgZGy+OOH7E+smVXgI9EVVxHuaFJlXQlPdgWYY9rGRt6v6HtbbS95x+lTS?=
 =?us-ascii?Q?BNW+u4oKfgmEjcC1NKMxG3HR/9rgPIPtCzr4eQ3EZsAL7jRCQoPv1977flcD?=
 =?us-ascii?Q?13wYq8gTTzJGc0h0LO6uuzbMsWzxITl9ZNpLjzT5twe1zIBVo2y8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1c441f-912a-4b77-ea8a-08df28985704
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 19:38:07.2866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6Symnd84yFwnEuSAwAcPxZMyV2C9QNjE38H/MWUoHLkZB6ZaWrHUmrlDmAaUGJzB4cSYbUxabd5ApmFHODdVP5sScik8aQIbNwwqm8a+kz3FhmGQjRqOITZ2i+hfMoC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI3PR04MB213044

On Fri, Oct 09, 2026 at 06:58:41PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
>
> Add MEDIA_BUS_FMT_YUYV8_1X16 to the list of supported bus formats.
>
> The format uses the same CSI-2 YUV422 8-bit data type and 16-bit
> parallel bus width as MEDIA_BUS_FMT_UYVY8_1X16, but with a different
> component ordering. Supporting YUYV allows sensors and bridge devices
> that output YUYV formatted YUV422 data to be used with the i.MX MIPI
> CSIS driver without requiring format conversion.
>
> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx-mipi-csis.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 5f9691d76434..14a00b9fcedf 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -382,6 +382,11 @@ static const struct csis_pix_format mipi_csis_formats[] = {
>  		.output = MEDIA_BUS_FMT_UYVY8_1X16,
>  		.data_type = MIPI_CSI2_DT_YUV422_8B,
>  		.width = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.output = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.data_type = MIPI_CSI2_DT_YUV422_8B,
> +		.width = 16,
>  	},
>  	/* RGB formats. */
>  	{
>
> ---
> base-commit: b38d06ad1e13c32970d58039c154f009b81a3368
> change-id: 20261009-csis_sam-c5c10ed12322
>
> Best regards,
> --
> Guoniu Zhou <guoniu.zhou@oss.nxp.com>
>
>
