Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AA9496D29;
	Thu, 10 Sep 2026 21:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074276; cv=fail; b=KxM30I+yYdehrLv+O81ziqC4iTQnncGSImsray/8Xa24BvxcGIFG48pmc0LFFjJFNFXeZVHGJLFPsy77KsAAGizakGDCDtybIowhMwKm6AIQvgRdQvKDRpWcbFY75jN0suxmpMysL+89Yh1XVIiHk0Fq+XocJ2rKxxC9sqsZeqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074276; c=relaxed/simple;
	bh=9YFgbHNRgXCx6/7Jh0/zbifDaRX62OQ1Y43GYudqyhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E5L/UX2qI0twHGTTXa0oOnPwwQ+PvxXcJV2/fo5KJZ8XRdKLRP0tAYBqsy0dCsrsQGs9cubKhKtrWNfk2PHq+hBwtVEOv9vBMsbP2DUT6HZtN5rLl6DBQ6oncJyunWEU7wVWTzQK73UrQB18ZDGDKr1APVzzGhzhDZWlld7FNPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gKY+sh8D; arc=fail smtp.client-ip=52.101.65.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gKY+sh8D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHFZVs+0AyedhXDpOZ2kNpnIllo3P7iW+J+nilDh3w7IgBWOzzK2FHkVURLBYyjjoidfxVK/PRuRDHOOaL1GXBPUEjhrdAP47EX8cyL0i/o3GD+bQSSY/QGiBbhrc2PGZnr4WyuFqk4jKdTzfiLR5/IxzW4Y6hwrMAIqpdXHkaD1YoEh0PyyDlOKZ3GTSNXbeZQbtWpjn0nt+t8qT3El8x5JUWyn8Np602kc+4rml688HZhDrQt0lfLbvBiYK+i+HmF4GtSLSdLsHr8dFi2BRxUmFimFg8f8r73c7adiutPrmXirXod0NoDmVtwPZnolDvtiDQ5sm5OMepYUMuLFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KCdz+zvXXdSp2MiD0wXeQm1PaWpNCDiv4bcXhGVjg0=;
 b=w0kWgbKLjgGj4WjKCNm9yWyklXh5OX1+bF/8aYxfVOQHoasDwmqPn9wYrmFlwSJoEihPRj4jmEOBwxc4nZcRAWCsX9O48jua2m32YRUDUJAVC2Hgl4E8qWeo1rYR7MpvQ2I6N4b60PRpPuRNSHNxA6ZqKj+7zp9FvJW2kZ7wbfsk4lM7jsGK0aB/H2C/Wkw0rYtTMkdhDt0C/AFhKlTOYnDgTV1BjQYWLMB3OgQfKQIW7DL4ZQZbj8U+CCaV0XiMF2JIDq/NWYa9oU5wDm4XVCqUdxS97v0COw51tHWSZt18zZV1cdGWPXClV/VEd4/rhThDWpb30dHtfORPv+Ld9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KCdz+zvXXdSp2MiD0wXeQm1PaWpNCDiv4bcXhGVjg0=;
 b=gKY+sh8DcEGUvtSLMTHJYkmEnXxDx/GX1Y9un5AIWT/rRtGo2PeFUeTOEIxj0nIiYHIzGgUXBNfc/40NJaIQPrAL2WKre0YrkXn1UxaYb2UupI7HcMnqCwNCvxZKYg6qqcX8EIdDtiQvdaCDz251xYRy+eDGxNi0Q428Bm1D5pmIZERmUX1GJTny/CGI6Ad5FBzJAYpvZ6V/gArRZ9BXaVotEn4OgNXpCdHT7SPoa46oHEfeV4Z0zAkMPmSdTbFzEy9sGKUxjKTrZ2Sli8k+Rx3EL6uNPb0fCuduZxyX6rSMU6pOBOs2Z9XglUsD5pi9Z6Bs1O6LhgFk69sw3RUkRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by PAXPR04MB8960.eurprd04.prod.outlook.com (2603:10a6:102:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 21:04:28 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 21:04:27 +0000
Date: Thu, 10 Sep 2026 17:04:14 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org, Ming Qian <ming.qian@oss.nxp.com>
Subject: Re: [PATCH v7 8/9] media: chips-media: wave6: Add Wave6 control
 driver
Message-ID: <aqMbTg0oDTrjs7Hl@lizhi-Precision-Tower-5810>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <9a39dbcd48c8326394992cc048a635fb2472537e.1788496816.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a39dbcd48c8326394992cc048a635fb2472537e.1788496816.git.nas.chung@chipsnmedia.com>
X-ClientProxiedBy: PH7P220CA0072.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::31) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|PAXPR04MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: da12280f-2118-4c69-b48a-08df0f7f1993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|7416014|6133799003|22082099003|18002099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	mSftaw8N8dRAb4Emn2eACY+6+/BFJo36L8FMB9dNvxJ7hgSOMtrTYLKNkoDxTuApcEcXnepSwYzFFY1iR79VvEnCFcobcly8RvPnhqKtd6c0xe11OFOGUjUoIPmJEh+s1G+5oqImBXivHIMkRL6TjGWh60x5wXSkHzSRxVxQaEjJm6M07KZC5NFZe3ElocCNfnBlRDT0nwLkYYvA+p0UIsmPCUK3G8D5XZ9uRlr+TDOxeL9zshcpu2tihya5JcQsb1ZIZltKobWICaNAhldnpFhEAD79j8EoFTcZJHQMHvqw8yZVVE55LHOehp7YX6+rX0tbf7c1EiS9XvEWm8icp49+V9+JIfCWfywvZRmHhgCxbiryvfICXeQFnCYfr/MU+YkCwi/Hidp96GEsLmqN+fUViykl8yTQYnBfmWBmRLnvbNi6zBNVQ1ZhCof76wSHOiDI34eNxajiBGpT4Tf2cyKBaamWtiMJHbToUPxVeq2e/48W1BWrBorGww42Hr88Iy/hjdyjFHniHr7F1RdZyG/gc1rtEW1wf1YUAB8n/buTnwbSqsVSLaa/UgD5S0i66/Coai11VwEmHiEtBI8KMjZGvuLKbqmSJ1vQYjse3mB1wNC2r0n90ec+mqqhuxRLJ3mqlmaRD9bvelRaZSdBl/Q92PRdYcKPRINqeDlhYJM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(7416014)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U+ug8Lf+0X449c5RkYQM7wzbg5fepfjS3DD3kqjpkVBLw31y63xlVoX6zhbA?=
 =?us-ascii?Q?sYkjvBE90vbTb/V4M0SkoKSIEAcnoiFOfb8t52RJJ3UlnvV7trxoJNbb9/O6?=
 =?us-ascii?Q?Uu4NJdfG8Q3eZEI2/uuB0I07fKk0rWTO67Qzd49VOSqmfGeSydz2Ir8bI/GG?=
 =?us-ascii?Q?RG1JWKSuby159kVrfEKSqqAwOpbqCDBYdRXbMFlfFEG9/LME3U9p8mbar/tg?=
 =?us-ascii?Q?D/lFU47kd3nLxnvT5tibpJ5xfEdEqRbAoEbLAw4m2cgSvD4lHYymg5InWbBy?=
 =?us-ascii?Q?7TUENtsVDbQ9XdK8xW10ZG97To28WLJPd8/5r4ZXPUTO95P9zlb4t+5Mxakm?=
 =?us-ascii?Q?3RNfaYQaTwaBJQFCK+USyWujAruS4nVcX0Vk/N8NGUbrvTKhUVQIgYL/BG9l?=
 =?us-ascii?Q?MT07ciIUYLVFdNRVJNRbGVy2Pz7IhuaOibd4tozg09ZFMDl1n3qEM5ez9UzG?=
 =?us-ascii?Q?Grf/OOmCtSTv0ydSrAlwbNZ6JXDRQxrXffjXSo9n8cM0IJ04W0r81dmTRSRm?=
 =?us-ascii?Q?d4+TSLTtzwhFeCO0iZC0xQJeeZavFdrHXpoDvzoG5qg1aUELGhEdGzREtkEN?=
 =?us-ascii?Q?NZUS/xzqDnaR0puZ2KaGeSww21yS0L8i/NFMX4IeVyGkQY+y5+oX+gdcyvE1?=
 =?us-ascii?Q?czHWr9HNeMLyvzofW1LjgGuQmcDW4Ws7chzawqYC6bTGVL3gL/NeRDgySGaX?=
 =?us-ascii?Q?wxgTmumrdUjSdTiMn+zoDYtMsoRHgIf13QpRh4BecAOIXokPVcKNgv98b8jT?=
 =?us-ascii?Q?QOjdrFcfTua55cIBp56xrUqw9+QwfMXJ+w9UnGu9OUDGr0mTm0zjrYRDViOy?=
 =?us-ascii?Q?kwoMaOc7oWpgn6sCMFoeQrAa4dyYObZpzXtQrJ7/MJ1OXr2jJP1POySljOp5?=
 =?us-ascii?Q?XPzyuAXVhwjYdrLqsAW2xrTrclC5cOr5/5Ge7C2fgLxJpbu5bDfsLHcZ65A8?=
 =?us-ascii?Q?XQrApLbnWO6NTfPAYksP797+1EwQRu/8XYI+uydcE6z5M3R4tm/amAXmFw+P?=
 =?us-ascii?Q?s0uHTaOuqWEipNi2OApIeYTfy7S3Jc4rpWjI0KI7PJcbM6WBHoQeFFg+n25P?=
 =?us-ascii?Q?T+P+4IhLDcpEiQbY04yO04wdol/uLZD2ko7ZDlhuJPSGLIfnB7Vy0bHla6mr?=
 =?us-ascii?Q?XGqE3WelkwBHQYgr0zbARfPHcZRsXEztqLGTqHbjXWVUrBI941nBqrUxoDqB?=
 =?us-ascii?Q?6TPJgk7p14LYEvJH6adPwaG7jovCBrRUMCyHH9Wwol8jItuSBuOejZouovI+?=
 =?us-ascii?Q?2PE6TpTgzhdwMGaL2Rg3fYKfeP9zD2COx0XoK9b3n312gkrePcgSg0FGeH9L?=
 =?us-ascii?Q?eoQAEZywhuB+kQ0/MSJhP6r+fM3K1Bih5bE8PZ9EI8UawvNV1QCqj7dXxOOP?=
 =?us-ascii?Q?TnqQK6qIipQKkuY1em+GhIIYcJiJdY1MQ0sud/s52WxZ8QnIOCGFUQ2p9pAb?=
 =?us-ascii?Q?kXByqH6utYqZVe97TdTAJtgoi6sl8EVTnUaCZ6UfJs4+IlMvpLEHBi9oO0oi?=
 =?us-ascii?Q?HJeVHXqbbf5qLIYeRukQZ6muKJHpnRq/oT6hTF+FDPJ7vFZ3M4f52s31+cAE?=
 =?us-ascii?Q?IkLuF6p9/qCqpcaxLwcZ3Wj3S5g2SxlVlsRGlS4Y3O8mcBxZ0HLc734U3sWJ?=
 =?us-ascii?Q?UTdTBmcK2sv1/fW4ciHo8lIcwo1ZSwZpqq23irtuiUBY/5Ly9iUwv5L14ovg?=
 =?us-ascii?Q?eQt0OOKNRJDjNCBINV59lKjp27LZRt0DqEbqz5o3f5ZAh5bEyeALBP9FN+ue?=
 =?us-ascii?Q?doZvQi1+AkjZF4lPg/xRu/el/PAtpdelKlrpjuNdpmLG/Bv/qqmG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da12280f-2118-4c69-b48a-08df0f7f1993
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 21:04:27.8237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fyF6zSiCpbptp4LRvTIO3Y2TZGgorZVbDC2HVV8oz0a/esfnI6V/itJoabZRe3Ok08dUTp/vgEKtwEOr3K5Vf0p3Z3qWeZhkmffFZcfV/85RXTyWekED6fzS8vBg9epk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8960

On Fri, Sep 04, 2026 at 03:46:34PM +0900, Nas Chung wrote:
> Add the control driver for the Chips&Media Wave6 video codec IP.
>
> The hardware contains one control register region and four interface
> register regions for a shared video processing engine.
>
> This driver handles the control region and manages shared resources such
> as firmware loading, firmware memory allocation, and coordination required
> by the interface register regions.
>
> It also instantiates and coordinates with the `wave6-core` child devices
> for firmware and power state management.
>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
> ---

Look likes this driver is independent on other one, as parent devices, which
register children devices only.

You can move this patch just after binding.

Frank

>  drivers/media/platform/chips-media/Kconfig    |   1 +
>  drivers/media/platform/chips-media/Makefile   |   1 +
>  .../media/platform/chips-media/wave6/Kconfig  |  17 +
>  .../media/platform/chips-media/wave6/Makefile |  17 +
>  .../platform/chips-media/wave6/wave6-vpu.c    | 826 ++++++++++++++++++
>  .../platform/chips-media/wave6/wave6-vpu.h    | 143 +++
>  6 files changed, 1005 insertions(+)
>  create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
>  create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h
>
> diff --git a/drivers/media/platform/chips-media/Kconfig b/drivers/media/platform/chips-media/Kconfig
> index ad350eb6b1fc..8ef7fc8029a4 100644
> --- a/drivers/media/platform/chips-media/Kconfig
> +++ b/drivers/media/platform/chips-media/Kconfig
> @@ -4,3 +4,4 @@ comment "Chips&Media media platform drivers"
>
>  source "drivers/media/platform/chips-media/coda/Kconfig"
>  source "drivers/media/platform/chips-media/wave5/Kconfig"
> +source "drivers/media/platform/chips-media/wave6/Kconfig"
> diff --git a/drivers/media/platform/chips-media/Makefile b/drivers/media/platform/chips-media/Makefile
> index 6b5d99de8b54..b9a07a91c9d6 100644
> --- a/drivers/media/platform/chips-media/Makefile
> +++ b/drivers/media/platform/chips-media/Makefile
> @@ -2,3 +2,4 @@
>
>  obj-y += coda/
>  obj-y += wave5/
> +obj-y += wave6/
> diff --git a/drivers/media/platform/chips-media/wave6/Kconfig b/drivers/media/platform/chips-media/wave6/Kconfig
> new file mode 100644
> index 000000000000..63d79c56c7fc
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config VIDEO_WAVE6_VPU
> +	tristate "Chips&Media Wave6 Codec Driver"
> +	depends on V4L_MEM2MEM_DRIVERS
> +	depends on VIDEO_DEV && OF
> +	depends on ARCH_MXC || COMPILE_TEST
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_MEM2MEM_DEV
> +	select GENERIC_ALLOCATOR
> +	help
> +	  Chips&Media Wave6 stateful codec driver.
> +	  The wave6 driver manages shared resources such as firmware memory.
> +	  The wave6-core driver provides encoding and decoding capabilities
> +	  for H.264, HEVC, and other video formats.
> +	  To compile this driver as modules, choose M here: the
> +	  modules will be called wave6 and wave6-core.
> diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
> new file mode 100644
> index 000000000000..06f8ac9bef14
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/Makefile
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# tell define_trace.h where to find the trace header
> +CFLAGS_wave6-vpu-core.o := -I$(src)
> +
> +wave6-objs += wave6-vpu.o \
> +	      wave6-vpu-thermal.o
> +obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6.o
> +
> +wave6-core-objs += wave6-vpu-core.o \
> +		   wave6-vpu-v4l2.o \
> +		   wave6-vpu-dbg.o \
> +		   wave6-vpuapi.o \
> +		   wave6-vpu-dec.o \
> +		   wave6-vpu-enc.o \
> +		   wave6-hw.o
> +obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6-core.o
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
> new file mode 100644
> index 000000000000..40948063b058
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
> @@ -0,0 +1,826 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Wave6 series multi-standard codec IP - wave6 driver
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/property.h>
> +#include <linux/of_irq.h>
> +#include <linux/firmware.h>
> +#include <linux/interrupt.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/pm_domain.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/iopoll.h>
> +#include <linux/genalloc.h>
> +
> +#include "wave6-vpuconfig.h"
> +#include "wave6-regdefine.h"
> +#include "wave6-vpu.h"
> +
> +static const struct wave6_vpu_resource wave633c_data = {
> +	.fw_name = "cnm/wave633c_imx9_codec_fw.bin",
> +	/* For HEVC, AVC, 4096x4096, 8bit */
> +	.sram_size = 0x14800,
> +};
> +
> +static const struct wave6_vpu_core_resource wave633c_core_data = {
> +	.codec_types = WAVE633_CODEC_TYPE,
> +	.compatible_fw_version = WAVE633_COMPATIBLE_FW_VERSION,
> +};
> +
> +static const char *wave6_vpu_state_name(enum wave6_vpu_state state)
> +{
> +	switch (state) {
> +	case WAVE6_VPU_STATE_OFF:
> +		return "off";
> +	case WAVE6_VPU_STATE_PREPARE:
> +		return "prepare";
> +	case WAVE6_VPU_STATE_ON:
> +		return "on";
> +	case WAVE6_VPU_STATE_SLEEP:
> +		return "sleep";
> +	default:
> +		return "unknown";
> +	}
> +}
> +
> +static bool wave6_vpu_valid_transition(struct wave6_vpu_device *vpu,
> +				       enum wave6_vpu_state next)
> +{
> +	switch (vpu->state) {
> +	case WAVE6_VPU_STATE_OFF:
> +		/* to PREPARE: first boot attempt */
> +		/* to ON: already booted before, skipping boot */
> +		if (next == WAVE6_VPU_STATE_PREPARE ||
> +		    next == WAVE6_VPU_STATE_ON)
> +			return true;
> +		break;
> +	case WAVE6_VPU_STATE_PREPARE:
> +		/* to OFF: boot failed */
> +		/* to ON: boot successful */
> +		if (next == WAVE6_VPU_STATE_OFF ||
> +		    next == WAVE6_VPU_STATE_ON)
> +			return true;
> +		break;
> +	case WAVE6_VPU_STATE_ON:
> +		/* to OFF: sleep failed */
> +		/* to SLEEP: sleep successful */
> +		if (next == WAVE6_VPU_STATE_OFF ||
> +		    next == WAVE6_VPU_STATE_SLEEP)
> +			return true;
> +		break;
> +	case WAVE6_VPU_STATE_SLEEP:
> +		/* to OFF: resume failed */
> +		/* to ON: resume successful */
> +		if (next == WAVE6_VPU_STATE_OFF ||
> +		    next == WAVE6_VPU_STATE_ON)
> +			return true;
> +		break;
> +	}
> +
> +	dev_err(vpu->dev, "invalid transition: %s -> %s\n",
> +		wave6_vpu_state_name(vpu->state), wave6_vpu_state_name(next));
> +
> +	return false;
> +}
> +
> +static void wave6_vpu_set_state(struct wave6_vpu_device *vpu,
> +				enum wave6_vpu_state state)
> +{
> +	if (!wave6_vpu_valid_transition(vpu, state))
> +		return;
> +
> +	dev_dbg(vpu->dev, "set state: %s -> %s\n",
> +		wave6_vpu_state_name(vpu->state), wave6_vpu_state_name(state));
> +
> +	vpu->state = state;
> +}
> +
> +static int wave6_vpu_wait_busy(struct vpu_core_device *core)
> +{
> +	u32 val;
> +
> +	return read_poll_timeout(wave6_vdi_readl, val, !val,
> +				 W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
> +				 false, core->reg_base, W6_VPU_BUSY_STATUS);
> +}
> +
> +static int wave6_vpu_check_result(struct vpu_core_device *core)
> +{
> +	if (wave6_vdi_readl(core->reg_base, W6_RET_SUCCESS))
> +		return 0;
> +
> +	return wave6_vdi_readl(core->reg_base, W6_RET_FAIL_REASON);
> +}
> +
> +static u32 wave6_vpu_get_code_buf_size(struct wave6_vpu_device *vpu)
> +{
> +	return min_t(u32, vpu->code_buf.size, W6_MAX_CODE_BUF_SIZE);
> +}
> +
> +static void wave6_vpu_remap_code_buf(struct wave6_vpu_device *vpu)
> +{
> +	dma_addr_t code_base = vpu->code_buf.dma_addr;
> +	u32 i, reg_val;
> +
> +	for (i = 0; i < wave6_vpu_get_code_buf_size(vpu) / W6_MAX_REMAP_PAGE_SIZE; i++) {
> +		reg_val = REMAP_CTRL_ON |
> +			  REMAP_CTRL_INDEX(i) |
> +			  REMAP_CTRL_PAGE_SIZE_ON |
> +			  REMAP_CTRL_PAGE_SIZE(W6_MAX_REMAP_PAGE_SIZE);
> +		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CTRL_GB, reg_val);
> +		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_VADDR_GB,
> +				 i * W6_MAX_REMAP_PAGE_SIZE);
> +		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_PADDR_GB,
> +				 code_base + i * W6_MAX_REMAP_PAGE_SIZE);
> +	}
> +}
> +
> +static void wave6_vpu_init_code_buf(struct wave6_vpu_device *vpu)
> +{
> +	if (vpu->code_buf.size < W6_CODE_BUF_SIZE) {
> +		dev_warn(vpu->dev,
> +			 "code buf size (%zu) is too small\n", vpu->code_buf.size);
> +		memset(&vpu->code_buf, 0, sizeof(vpu->code_buf));
> +		return;
> +	}
> +
> +	vpu->code_buf.vaddr = devm_memremap(vpu->dev,
> +					    vpu->code_buf.phys_addr,
> +					    vpu->code_buf.size,
> +					    MEMREMAP_WC);
> +	if (!vpu->code_buf.vaddr) {
> +		memset(&vpu->code_buf, 0, sizeof(vpu->code_buf));
> +		return;
> +	}
> +
> +	vpu->code_buf.dma_addr = dma_map_resource(vpu->dev,
> +						  vpu->code_buf.phys_addr,
> +						  vpu->code_buf.size,
> +						  DMA_BIDIRECTIONAL,
> +						  0);
> +	if (dma_mapping_error(vpu->dev, vpu->code_buf.dma_addr)) {
> +		memset(&vpu->code_buf, 0, sizeof(vpu->code_buf));
> +		return;
> +	}
> +}
> +
> +static void wave6_vpu_allocate_work_buffers(struct wave6_vpu_device *vpu)
> +{
> +	struct vpu_buf *buf;
> +	int i;
> +
> +	for (i = 0; i < MAX_NUM_INSTANCE; i++) {
> +		buf = &vpu->work_buffers[i];
> +		buf->size = W637DEC_WORKBUF_SIZE_FOR_CQ;
> +
> +		if (wave6_vdi_alloc_dma(vpu->dev, buf)) {
> +			dev_warn(vpu->dev, "Failed to allocate work_buffers\n");
> +			return;
> +		}
> +
> +		vpu->work_buffers_alloc++;
> +	}
> +}
> +
> +static void wave6_vpu_free_work_buffers(struct wave6_vpu_device *vpu)
> +{
> +	int i;
> +
> +	for (i = 0; i < vpu->work_buffers_alloc; i++)
> +		wave6_vdi_free_dma(&vpu->work_buffers[i]);
> +
> +	vpu->work_buffers_alloc = 0;
> +	vpu->work_buffers_avail = 0;
> +}
> +
> +static int wave6_vpu_init_work_buf(struct wave6_vpu_device *vpu,
> +				   struct vpu_core_device *core)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&vpu->lock);
> +
> +	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
> +	wave6_vdi_writel(core->reg_base, W6_COMMAND, W6_CMD_INIT_WORK_BUF);
> +	wave6_vdi_writel(core->reg_base, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
> +
> +	ret = wave6_vpu_wait_busy(core);
> +	if (ret) {
> +		dev_err(vpu->dev, "init work buf failed\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = wave6_vpu_check_result(core);
> +	if (ret) {
> +		dev_err(vpu->dev, "init work buf failed, reason 0x%x\n", ret);
> +		return -EIO;
> +	}
> +
> +	vpu->work_buffers_avail = vpu->work_buffers_alloc;
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_init_vpu(struct wave6_vpu_device *vpu,
> +			      struct vpu_core_device *core)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&vpu->lock);
> +
> +	/* try init directly as firmware is running */
> +	if (wave6_vdi_readl(core->reg_base, W6_VPU_VCPU_CUR_PC))
> +		goto init_done;
> +
> +	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_PREPARE);
> +
> +	wave6_vpu_remap_code_buf(vpu);
> +
> +	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
> +	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
> +			 vpu->sram_buf.dma_addr);
> +	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
> +			 vpu->sram_buf.size);
> +	wave6_vdi_writel(vpu->reg_base, W6_COMMAND_GB, W6_CMD_INIT_VPU);
> +	wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CORE_START_GB,
> +			 REMAP_CORE_START_ON);
> +
> +	ret = wave6_vpu_wait_busy(core);
> +	if (ret) {
> +		dev_err(vpu->dev, "init vpu timeout\n");
> +		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
> +		return -EINVAL;
> +	}
> +
> +	ret = wave6_vpu_check_result(core);
> +	if (ret) {
> +		dev_err(vpu->dev, "init vpu fail, reason 0x%x\n", ret);
> +		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
> +		return -EIO;
> +	}
> +
> +init_done:
> +	ret = wave6_vpu_init_work_buf(vpu, core);
> +	if (ret)
> +		return ret;
> +
> +	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_sleep(struct wave6_vpu_device *vpu,
> +			   struct vpu_core_device *core)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&vpu->lock);
> +
> +	if (!wave6_vdi_readl(core->reg_base, W6_VPU_VCPU_CUR_PC)) {
> +		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
> +		return 0;
> +	}
> +
> +	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
> +	wave6_vdi_writel(core->reg_base, W6_COMMAND, W6_CMD_SLEEP_VPU);
> +	wave6_vdi_writel(core->reg_base, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
> +
> +	ret = wave6_vpu_wait_busy(core);
> +	if (ret) {
> +		dev_err(vpu->dev, "sleep vpu timeout\n");
> +		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
> +		return -EINVAL;
> +	}
> +
> +	ret = wave6_vpu_check_result(core);
> +	if (ret) {
> +		dev_err(vpu->dev, "sleep vpu fail, reason 0x%x\n", ret);
> +		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
> +		return -EIO;
> +	}
> +
> +	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_SLEEP);
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_wakeup(struct wave6_vpu_device *vpu,
> +			    struct vpu_core_device *core)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&vpu->lock);
> +
> +	/* try wakeup directly as firmware is running */
> +	if (wave6_vdi_readl(core->reg_base, W6_VPU_VCPU_CUR_PC))
> +		goto wakeup_done;
> +
> +	wave6_vpu_remap_code_buf(vpu);
> +
> +	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
> +	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
> +			 vpu->sram_buf.dma_addr);
> +	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
> +			 vpu->sram_buf.size);
> +	wave6_vdi_writel(vpu->reg_base, W6_COMMAND_GB, W6_CMD_WAKEUP_VPU);
> +	wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CORE_START_GB,
> +			 REMAP_CORE_START_ON);
> +
> +	ret = wave6_vpu_wait_busy(core);
> +	if (ret) {
> +		dev_err(vpu->dev, "wakeup vpu timeout\n");
> +		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
> +		return -EINVAL;
> +	}
> +
> +	ret = wave6_vpu_check_result(core);
> +	if (ret) {
> +		dev_err(vpu->dev, "wakeup vpu fail, reason 0x%x\n", ret);
> +		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
> +		return -EIO;
> +	}
> +
> +wakeup_done:
> +	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_try_boot(struct wave6_vpu_device *vpu,
> +			      struct vpu_core_device *core)
> +{
> +	u32 product_code;
> +	int ret;
> +
> +	lockdep_assert_held(&vpu->lock);
> +
> +	if (vpu->state != WAVE6_VPU_STATE_OFF && vpu->state != WAVE6_VPU_STATE_SLEEP)
> +		return 0;
> +
> +	product_code = wave6_vdi_readl(core->reg_base, W6_VPU_RET_PRODUCT_CODE);
> +	if (!wave6_is_product_w_series(product_code)) {
> +		dev_err(vpu->dev, "unknown product : %08x\n", product_code);
> +		return -EINVAL;
> +	}
> +
> +	if (vpu->state == WAVE6_VPU_STATE_SLEEP) {
> +		ret = wave6_vpu_wakeup(vpu, core);
> +		return ret;
> +	}
> +
> +	ret = wave6_vpu_init_vpu(vpu, core);
> +
> +	return ret;
> +}
> +
> +static int wave6_vpu_get(struct wave6_vpu_device *vpu,
> +			 struct vpu_core_device *core)
> +{
> +	int ret;
> +
> +	if (WARN_ON(!vpu || !core))
> +		return -EINVAL;
> +
> +	guard(mutex)(&vpu->lock);
> +
> +	if (!vpu->fw_available)
> +		return -EINVAL;
> +
> +	/* Only the first core executes boot; others return */
> +	if (atomic_inc_return(&vpu->core_count) > 1)
> +		return 0;
> +
> +	ret = pm_runtime_resume_and_get(vpu->dev);
> +	if (ret)
> +		goto error_pm;
> +
> +	ret = wave6_vpu_try_boot(vpu, core);
> +	if (ret)
> +		goto error_boot;
> +
> +	return 0;
> +
> +error_boot:
> +	pm_runtime_put_sync(vpu->dev);
> +error_pm:
> +	atomic_dec(&vpu->core_count);
> +
> +	return ret;
> +}
> +
> +static void wave6_vpu_put(struct wave6_vpu_device *vpu,
> +			  struct vpu_core_device *core)
> +{
> +	if (WARN_ON(!vpu || !core))
> +		return;
> +
> +	guard(mutex)(&vpu->lock);
> +
> +	if (!vpu->fw_available)
> +		return;
> +
> +	/* Only the last core executes sleep; others return */
> +	if (atomic_dec_return(&vpu->core_count) > 0)
> +		return;
> +
> +	wave6_vpu_sleep(vpu, core);
> +
> +	if (!pm_runtime_suspended(vpu->dev))
> +		pm_runtime_put_sync(vpu->dev);
> +}
> +
> +static void wave6_vpu_require_work_buffer(struct wave6_vpu_device *vpu,
> +					  struct vpu_core_device *core)
> +{
> +	struct vpu_buf *vb;
> +	u32 size;
> +
> +	if (WARN_ON(!vpu || !core))
> +		return;
> +
> +	size = wave6_vdi_readl(core->reg_base, W6_CMD_SET_WORK_BUF_SIZE);
> +	if (!size)
> +		return;
> +
> +	if (WARN_ON(size > W637DEC_WORKBUF_SIZE_FOR_CQ))
> +		goto exit;
> +
> +	if (WARN_ON(vpu->work_buffers_avail == 0))
> +		goto exit;
> +
> +	vpu->work_buffers_avail--;
> +	vb = &vpu->work_buffers[vpu->work_buffers_avail];
> +
> +	wave6_vdi_writel(core->reg_base, W6_CMD_SET_WORK_BUF_ADDR, vb->daddr);
> +
> +exit:
> +	wave6_vdi_writel(core->reg_base, W6_CMD_SET_WORK_BUF_SIZE, SET_WORK_BUF_SIZE_ACK);
> +}
> +
> +static int wave6_vpu_create_cores(struct wave6_vpu_device *vpu)
> +{
> +	struct device_node *child;
> +	int num_cores = 0;
> +
> +	for_each_available_child_of_node(vpu->dev->of_node, child) {
> +		struct platform_device_info info = {};
> +		struct platform_device *pdev;
> +		struct resource res[2];
> +		int irq;
> +
> +		if (num_cores >= W6_VPU_MAX_NUM_CORE) {
> +			of_node_put(child);
> +			break;
> +		}
> +
> +		if (of_address_to_resource(child, 0, &res[0])) {
> +			dev_warn(vpu->dev, "%pOF: missing reg property\n", child);
> +			continue;
> +		}
> +
> +		irq = of_irq_get(child, 0);
> +		if (irq < 0) {
> +			dev_warn(vpu->dev, "%pOF: missing interrupts property\n", child);
> +			continue;
> +		}
> +		res[1] = DEFINE_RES_IRQ(irq);
> +
> +		info.fwnode = of_fwnode_handle(child);
> +		info.parent = vpu->dev;
> +		info.name = WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME;
> +		info.id = num_cores;
> +		info.dma_mask = DMA_BIT_MASK(32);
> +		info.res = res;
> +		info.num_res = ARRAY_SIZE(res);
> +		info.data = &wave633c_core_data;
> +		info.size_data = sizeof(wave633c_core_data);
> +
> +		pdev = platform_device_register_full(&info);
> +		if (IS_ERR(pdev)) {
> +			dev_err(vpu->dev, "Failed to register core %d: %ld\n",
> +				num_cores, PTR_ERR(pdev));
> +			continue;
> +		}
> +
> +		vpu->core_pdevs[num_cores] = pdev;
> +		num_cores++;
> +	}
> +
> +	return num_cores;
> +}
> +
> +static void wave6_vpu_destroy_cores(struct wave6_vpu_device *vpu)
> +{
> +	int i;
> +
> +	for (i = 0; i < W6_VPU_MAX_NUM_CORE; i++) {
> +		struct platform_device *pdev = vpu->core_pdevs[i];
> +
> +		if (!pdev)
> +			continue;
> +
> +		platform_device_unregister(pdev);
> +		vpu->core_pdevs[i] = NULL;
> +	}
> +}
> +
> +static void wave6_vpu_release(struct wave6_vpu_device *vpu)
> +{
> +	guard(mutex)(&vpu->lock);
> +
> +	vpu->fw_available = false;
> +	wave6_vpu_destroy_cores(vpu);
> +	wave6_vpu_free_work_buffers(vpu);
> +	if (vpu->sram_pool && vpu->sram_buf.vaddr) {
> +		dma_unmap_resource(vpu->dev,
> +				   vpu->sram_buf.dma_addr,
> +				   vpu->sram_buf.size,
> +				   DMA_BIDIRECTIONAL,
> +				   0);
> +		gen_pool_free(vpu->sram_pool,
> +			      (unsigned long)vpu->sram_buf.vaddr,
> +			      vpu->sram_buf.size);
> +	}
> +	if (vpu->code_buf.dma_addr)
> +		dma_unmap_resource(vpu->dev,
> +				   vpu->code_buf.dma_addr,
> +				   vpu->code_buf.size,
> +				   DMA_BIDIRECTIONAL,
> +				   0);
> +}
> +
> +static void wave6_vpu_load_firmware(const struct firmware *fw, void *context)
> +{
> +	struct wave6_vpu_device *vpu = context;
> +
> +	guard(mutex)(&vpu->lock);
> +
> +	if (!fw || !fw->data) {
> +		dev_err(vpu->dev, "No firmware.\n");
> +		return;
> +	}
> +
> +	if (!vpu->fw_available)
> +		goto exit;
> +
> +	if (fw->size + W6_EXTRA_CODE_BUF_SIZE > wave6_vpu_get_code_buf_size(vpu)) {
> +		dev_err(vpu->dev, "firmware size (%zd > %zd) is too big\n",
> +			fw->size, vpu->code_buf.size);
> +		vpu->fw_available = false;
> +		goto exit;
> +	}
> +
> +	memcpy(vpu->code_buf.vaddr, fw->data, fw->size);
> +
> +	vpu->get_vpu = wave6_vpu_get;
> +	vpu->put_vpu = wave6_vpu_put;
> +	vpu->req_work_buffer = wave6_vpu_require_work_buffer;
> +
> +	if (!wave6_vpu_create_cores(vpu)) {
> +		dev_err(vpu->dev, "Failed to create VPU cores\n");
> +		vpu->fw_available = false;
> +	}
> +
> +exit:
> +	release_firmware(fw);
> +}
> +
> +static void wave6_vpu_detach_pm_domains(struct wave6_vpu_device *vpu)
> +{
> +	if (!vpu->num_pm_domains)
> +		return;
> +
> +	for (int i = 0; i < vpu->num_pm_domains; i++) {
> +		struct device *pd_dev = vpu->pd_list->pd_devs[i];
> +
> +		if (!IS_ERR_OR_NULL(pd_dev) && !pm_runtime_suspended(pd_dev))
> +			pm_runtime_force_suspend(pd_dev);
> +	}
> +
> +	dev_pm_domain_detach_list(vpu->pd_list);
> +	vpu->pd_list = NULL;
> +	vpu->num_pm_domains = 0;
> +}
> +
> +static int wave6_vpu_attach_pm_domains(struct wave6_vpu_device *vpu)
> +{
> +	int ret;
> +
> +	vpu->num_pm_domains = of_count_phandle_with_args(vpu->dev->of_node,
> +							 "power-domains",
> +							 "#power-domain-cells");
> +	if (vpu->num_pm_domains < 0) {
> +		dev_err(vpu->dev, "No power domains defined for vpu node\n");
> +		return vpu->num_pm_domains;
> +	}
> +
> +	if (vpu->num_pm_domains == 1) {
> +		/* genpd_dev_pm_attach() attach automatically if count is 1 */
> +		vpu->num_pm_domains = 0;
> +		return 0;
> +	}
> +
> +	ret = dev_pm_domain_attach_list(vpu->dev, NULL, &vpu->pd_list);
> +	if (ret < 0) {
> +		dev_err(vpu->dev, "Can't attach pm domains, ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	vpu->num_pm_domains = ret;
> +
> +	return 0;
> +}
> +
> +static struct device *wave6_vpu_get_performance_dev(struct wave6_vpu_device *vpu)
> +{
> +	int index;
> +
> +	if (!vpu->num_pm_domains)
> +		return vpu->dev;
> +
> +	index = of_property_match_string(vpu->dev->of_node,
> +					 "power-domain-names", "perf");
> +	if (index < 0 || index >= vpu->num_pm_domains)
> +		return NULL;
> +
> +	return vpu->pd_list->pd_devs[index];
> +}
> +
> +static int wave6_vpu_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np;
> +	struct wave6_vpu_device *vpu;
> +	const struct wave6_vpu_resource *res;
> +	int ret;
> +
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
> +		return ret;
> +	}
> +
> +	res = device_get_match_data(&pdev->dev);
> +	if (!res)
> +		return -ENODEV;
> +
> +	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
> +	if (!vpu)
> +		return -ENOMEM;
> +
> +	ret = devm_mutex_init(&pdev->dev, &vpu->lock);
> +	if (ret)
> +		return ret;
> +
> +	atomic_set(&vpu->core_count, 0);
> +	dev_set_drvdata(&pdev->dev, vpu);
> +	vpu->dev = &pdev->dev;
> +	vpu->res = res;
> +	vpu->reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(vpu->reg_base))
> +		return PTR_ERR(vpu->reg_base);
> +
> +	ret = devm_clk_bulk_get_all(&pdev->dev, &vpu->clks);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "failed to get clocks\n");
> +
> +	vpu->num_clks = ret;
> +
> +	ret = wave6_vpu_attach_pm_domains(vpu);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to attach pm domains\n");
> +
> +	np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
> +	if (np) {
> +		struct resource mem;
> +
> +		ret = of_address_to_resource(np, 0, &mem);
> +		of_node_put(np);
> +		if (!ret) {
> +			vpu->code_buf.phys_addr = mem.start;
> +			vpu->code_buf.size = resource_size(&mem);
> +			wave6_vpu_init_code_buf(vpu);
> +		} else {
> +			dev_warn(&pdev->dev, "memory-region is not available.\n");
> +		}
> +	}
> +
> +	vpu->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> +	if (vpu->sram_pool) {
> +		vpu->sram_buf.size = vpu->res->sram_size;
> +		vpu->sram_buf.vaddr = gen_pool_dma_alloc(vpu->sram_pool,
> +							 vpu->sram_buf.size,
> +							 &vpu->sram_buf.phys_addr);
> +		if (!vpu->sram_buf.vaddr) {
> +			vpu->sram_buf.size = 0;
> +		} else {
> +			vpu->sram_buf.dma_addr = dma_map_resource(&pdev->dev,
> +								  vpu->sram_buf.phys_addr,
> +								  vpu->sram_buf.size,
> +								  DMA_BIDIRECTIONAL,
> +								  0);
> +			if (dma_mapping_error(&pdev->dev, vpu->sram_buf.dma_addr)) {
> +				gen_pool_free(vpu->sram_pool,
> +					      (unsigned long)vpu->sram_buf.vaddr,
> +					      vpu->sram_buf.size);
> +				memset(&vpu->sram_buf, 0, sizeof(vpu->sram_buf));
> +			}
> +		}
> +	}
> +
> +	vpu->thermal.dev = wave6_vpu_get_performance_dev(vpu);
> +	if (vpu->thermal.dev) {
> +		ret = wave6_vpu_cooling_init(vpu->dev, &vpu->thermal);
> +		if (ret)
> +			dev_err(&pdev->dev, "failed to initialize thermal cooling, %d\n", ret);
> +	}
> +
> +	wave6_vpu_allocate_work_buffers(vpu);
> +
> +	pm_runtime_enable(&pdev->dev);
> +	vpu->fw_available = true;
> +
> +	request_module("platform:%s", WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME);
> +
> +	ret = firmware_request_nowait_nowarn(THIS_MODULE,
> +					     vpu->res->fw_name,
> +					     &pdev->dev,
> +					     GFP_KERNEL,
> +					     vpu,
> +					     wave6_vpu_load_firmware);
> +	if (ret) {
> +		dev_err(&pdev->dev, "request firmware fail, ret = %d\n", ret);
> +		goto error;
> +	}
> +
> +	return 0;
> +
> +error:
> +	wave6_vpu_release(vpu);
> +	pm_runtime_disable(&pdev->dev);
> +	wave6_vpu_detach_pm_domains(vpu);
> +
> +	return ret;
> +}
> +
> +static void wave6_vpu_remove(struct platform_device *pdev)
> +{
> +	struct wave6_vpu_device *vpu = dev_get_drvdata(&pdev->dev);
> +
> +	wave6_vpu_release(vpu);
> +	pm_runtime_disable(vpu->dev);
> +	wave6_vpu_detach_pm_domains(vpu);
> +}
> +
> +static int wave6_vpu_runtime_suspend(struct device *dev)
> +{
> +	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(vpu->num_clks, vpu->clks);
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_runtime_resume(struct device *dev)
> +{
> +	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(vpu->num_clks, vpu->clks);
> +}
> +
> +static const struct dev_pm_ops wave6_vpu_pm_ops = {
> +	RUNTIME_PM_OPS(wave6_vpu_runtime_suspend,
> +		       wave6_vpu_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +			    pm_runtime_force_resume)
> +};
> +
> +static const struct of_device_id wave6_vpu_ids[] = {
> +	{ .compatible = "nxp,imx95-vpu", .data = &wave633c_data },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, wave6_vpu_ids);
> +
> +static struct platform_driver wave6_vpu_driver = {
> +	.driver = {
> +		.name = WAVE6_VPU_PLATFORM_DRIVER_NAME,
> +		.of_match_table = wave6_vpu_ids,
> +		.pm = pm_ptr(&wave6_vpu_pm_ops),
> +	},
> +	.probe = wave6_vpu_probe,
> +	.remove = wave6_vpu_remove,
> +};
> +
> +module_platform_driver(wave6_vpu_driver);
> +MODULE_DESCRIPTION("chips&media Wave6 VPU driver");
> +MODULE_AUTHOR("CHIPS&MEDIA INC");
> +MODULE_FIRMWARE("cnm/wave633c_imx9_codec_fw.bin");
> +MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.h b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
> new file mode 100644
> index 000000000000..ec3c9299526b
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
> @@ -0,0 +1,143 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Wave6 series multi-standard codec IP - wave6 driver
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#ifndef __WAVE6_VPU_H__
> +#define __WAVE6_VPU_H__
> +
> +#include <linux/device.h>
> +#include "wave6-vpu-thermal.h"
> +#include "wave6-vdi.h"
> +#include "wave6-vpuapi.h"
> +
> +#define WAVE6_VPU_PLATFORM_DRIVER_NAME "wave6-vpu"
> +#define WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME "wave6-vpu-core"
> +
> +struct wave6_vpu_device;
> +struct vpu_core_device;
> +
> +/**
> + * enum wave6_vpu_state - VPU states
> + * @WAVE6_VPU_STATE_OFF:	VPU is powered off
> + * @WAVE6_VPU_STATE_PREPARE:	VPU is booting
> + * @WAVE6_VPU_STATE_ON:		VPU is running
> + * @WAVE6_VPU_STATE_SLEEP:	VPU is in a sleep mode
> + */
> +enum wave6_vpu_state {
> +	WAVE6_VPU_STATE_OFF,
> +	WAVE6_VPU_STATE_PREPARE,
> +	WAVE6_VPU_STATE_ON,
> +	WAVE6_VPU_STATE_SLEEP
> +};
> +
> +/**
> + * struct wave6_vpu_dma_buf - VPU buffer from reserved memory or gen_pool
> + * @size:	Buffer size
> + * @dma_addr:	Mapped address for device access
> + * @vaddr:	Kernel virtual address
> + * @phys_addr:	Physical address of the reserved memory region or gen_pool
> + *
> + * Represents a buffer allocated from pre-reserved device memory regions or
> + * SRAM via gen_pool_dma_alloc(). Used for code and SRAM buffers only.
> + * Managed by the VPU device.
> + */
> +struct wave6_vpu_dma_buf {
> +	size_t size;
> +	dma_addr_t dma_addr;
> +	void *vaddr;
> +	phys_addr_t phys_addr;
> +};
> +
> +/**
> + * struct wave6_vpu_resource - VPU device compatible data
> + * @fw_name:	Firmware name for the device
> + * @sram_size:	Required SRAM size
> + */
> +struct wave6_vpu_resource {
> +	const char *fw_name;
> +	u32 sram_size;
> +};
> +
> +#define WAVE6_IS_ENC				BIT(0)
> +#define WAVE6_IS_DEC				BIT(1)
> +
> +#define WAVE633_CODEC_TYPE			(WAVE6_IS_ENC | WAVE6_IS_DEC)
> +#define WAVE633_COMPATIBLE_FW_VERSION		0x2010000
> +
> +/**
> + * struct wave6_vpu_core_resource - VPU CORE device compatible data
> + * @codec_types:		Bitmask of supported codec types
> + * @compatible_fw_version:	Firmware version compatible with driver
> + */
> +struct wave6_vpu_core_resource {
> +	int codec_types;
> +	u32 compatible_fw_version;
> +};
> +
> +/**
> + * struct wave6_vpu_device - VPU driver structure
> + * @get_vpu:		Function pointer, boot or wake the device
> + * @put_vpu:		Function pointer, power off or suspend the device
> + * @req_work_buffer:	Function pointer, request allocation of a work buffer
> + * @dev:		Platform device pointer
> + * @reg_base:		Base address of MMIO registers
> + * @clks:		Array of clock handles
> + * @num_clks:		Number of entries in @clks
> + * @state:		Device state
> + * @lock:		Mutex protecting device data, register access
> + * @fw_available:	Firmware availability flag
> + * @res:		Device compatible data
> + * @sram_pool:		Genalloc pool for SRAM allocations
> + * @sram_buf:		Optional SRAM buffer
> + * @code_buf:		Firmware code buffer
> + * @work_buffers:	Array of work buffers
> + * @work_buffers_alloc:	Number of allocated work buffers
> + * @work_buffers_avail:	Number of available work buffers
> + * @thermal:		Thermal cooling device
> + * @core_count:		Number of available VPU core devices
> + *
> + * @get_vpu, @put_vpu, @req_work_buffer are called by VPU core devices.
> + *
> + * Buffers such as @sram_buf, @code_buf, and @work_buffers are managed
> + * by the VPU device and accessed exclusively by the firmware.
> + */
> +struct wave6_vpu_device {
> +	int (*get_vpu)(struct wave6_vpu_device *vpu,
> +		       struct vpu_core_device *core);
> +	void (*put_vpu)(struct wave6_vpu_device *vpu,
> +			struct vpu_core_device *core);
> +	void (*req_work_buffer)(struct wave6_vpu_device *vpu,
> +				struct vpu_core_device *core);
> +	struct device *dev;
> +	void __iomem *reg_base;
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> +	enum wave6_vpu_state state;
> +	struct mutex lock; /* Protects device data, register access */
> +
> +	/* Prevents boot or sleep sequence if firmware is unavailable. */
> +	bool fw_available;
> +
> +	const struct wave6_vpu_resource *res;
> +	struct gen_pool *sram_pool;
> +	struct wave6_vpu_dma_buf sram_buf;
> +	struct wave6_vpu_dma_buf code_buf;
> +
> +	/* Allocates per-instance, used for storing instance-specific data. */
> +	struct vpu_buf work_buffers[MAX_NUM_INSTANCE];
> +	u32 work_buffers_alloc;
> +	u32 work_buffers_avail;
> +
> +	struct vpu_thermal_cooling thermal;
> +	atomic_t core_count;
> +
> +	int num_pm_domains;
> +	struct dev_pm_domain_list *pd_list;
> +
> +	struct platform_device *core_pdevs[W6_VPU_MAX_NUM_CORE];
> +};
> +
> +#endif /* __WAVE6_VPU_H__ */
> --
> 2.31.1
>
