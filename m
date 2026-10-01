Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013012.outbound.protection.outlook.com [40.107.159.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E2F2EEE9E;
	Thu,  1 Oct 2026 16:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871574; cv=fail; b=H3hCEGCap7UzC9VcZRdeBRSJdNyLJUwbQlbrArNEyGzZkOmXU9+ELsv+FFFJtFFK4dgSwXXyGoP7Kwv/+zW6w6zpihm9viL23mD2qyBDu8VKgNDm5EjM+H+7sz/BlvvAp7OUswQ6ES6qYNcSoGggLmumND4SXGoIRZB7M/pXt2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871574; c=relaxed/simple;
	bh=ApQh/c8Z15XQe/PqxrPxW4XUWgr2VNulpRtu8lAEwRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OYiaABxkK9qp2KGK4Z0CNgZiszRYAL4BbwpSlMZTcRXEWUSGVvmRxmmRSd9gpCqT4SR4SKgxXVzTYR5NOQlzjUsIiOPiHJntx3HEzGFwGzAlObnt2NZgkCxwf9hQn2dCYqEHHf+SBmoOuUZOaPZyU4c4WNFPDmHHUvk1dFVBmcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D7VqWzKi; arc=fail smtp.client-ip=40.107.159.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D7VqWzKi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukcQ+igV6uK7IRgpHa0D7lrHWgoZArhP4GC7gY2cL4KWnXY8zUoPHtaseAj1KTGCKABb2k0gvf1JzRdAHi3Pp9o3jkfPRD4rUC2v0uTRFTnaa2njq+XX/nC3NIeuCzSBMrEc6ldvIig/gmkaGijwa7oxpLoCZFOCzbhGcRXGUJvbWeSP3OqfZgi8xwObV54Ckexi7d82WbuUC8+0hG8y17vMz+7RmpQsyeywo1MOr6R0HFHetxaxvb7zj7OKJ1fUdeKg34vcPkiBzAzGSK7CR51p/IjVvK5jCYm5ZCGflf794AYawvw+y+XV8LpppRJZxP3yBczK3ocnGAsZ7muzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOmjIWuuFskKaVt9lkoQ9vyv6lpnJE3hOcThbRySXY4=;
 b=EhwEdsN+07h6rCTZxuNb0ha3fwh802iPdQbQQhJd4SmwSZPoazB856WawwiQSurZ4nDhzzjx+6yOxuXtbI9Ib/jCf4QGLsODr50IAmpKgDKBZS36zIn55BZramMho3dNdvsJgUJ1lEmbg5J104r3uHHQLYRC3mKlCUnqHCoAtNRCkASwLAV2HdLun0HaknmvEtW+0Zo8XNJAOe8/xa7wRx/5vKOy7YIyto97fzx/U85DqqGzZxz36MRpiuZbOlW8EwtXiz5fdR3TwRCFAdQgdm6cARFzcdD3wY0STQkAk2CVVsM4keJhozNNbh0+guismsIeltNeS1Dkt5lSVm1sww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOmjIWuuFskKaVt9lkoQ9vyv6lpnJE3hOcThbRySXY4=;
 b=D7VqWzKiuZmiAaiKCRTHXYlbhNqksuwB6YFSBp74Tl/BBCGbrjTLvhX8hNzEP+Cxf9tXzIhx8/wuSE9kGSZ1nX4OzlIThZmuyA2jNmiRW4FZk3OISbSSH0s9iIQ74XdTJbQcMNCZ0i5BvXEAoAEIeJ6g5F8qeGBbSHmZuVJFyKorccuHtCH7ArDcoYKW5BARU1//YctnkTuq+ur0RzzycalcCLMaJq5aU6L9ybZGLg2DmrJhUw18XWljtudlwk047SX4UkD5K4Hjkd9JNhMUyxuRPrJ3SzTFy7oJe9y07eFICJtsfTG9A5ejnim8UmymPQWQrMJ0F70ovoEVnhB3gw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMZPR04MB301662.eurprd04.prod.outlook.com (2603:10a6:20b:7c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Thu, 1 Oct
 2026 16:19:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 16:19:27 +0000
Date: Thu, 1 Oct 2026 11:19:16 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com, hvilleneuve@dimonoff.com,
	marex@nabladev.com, stefano.r@variscite.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] ARM: dts: imx6q-apalis: Add Toradex Resistive Touch
 Display 7" Parallel
Message-ID: <ar6IBEngz1w3T_Di@SMW015318>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
 <20261001155412.3177428-6-leoreis.costa@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001155412.3177428-6-leoreis.costa@gmail.com>
X-ClientProxiedBy: CY5P221CA0133.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:1f::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMZPR04MB301662:EE_
X-MS-Office365-Filtering-Correlation-Id: 161e0719-985f-4843-e30c-08df1fd7c38d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|7416014|1800799024|19092799006|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	xCD5hwjc2JK0MIwpBdY9UXCEizlNrJvoQvfjparolLjbFWVRL8ngVdG5N80JL2bUgYczIJLrHQYqIKCO+o1gA09USY1gGMAw/g3dGoQqOOW0N/xU5nho8Wd9cdDVhKzHLQinCo21IVrEnzDpbbi6scC9St/5jzXPdqGaBM4r6ed5Z1xjC1DQldMnqQnAb1LI8fz51Ga0/PjKDTmLIRbv87K05M2btGbJARbE6rXBOi5otSp/K9P/LQmFo+wGH6D1ZfsBpH6N4mdsrzQGV4J+WilgEzp8rC//KRTX8WpIAA4EqPKGDHp9jPKrhi/T0eCpxXby4XGkJH1wTegCGH0otXx64uH4kCg12ZG5uNwniOPdgTXw4P7Slcts14cJqYYszJMQU8qgdY2rdG+Scdy1FF5SywDx6wnW6lGyCTMTktt9VU/ViN9IVMh9JLmi75u8/0aA89n11ndB662pf66ERAoqyF7yYZI4tcTW7wYOWppajT2NEUyWRN+25Mo5nhwLdMlLyWPzTWME0WH2dun9kP81sYJS9wx4AtMkWresDYMnt4WFAgQEHS72NrF/R0lse5ZxzuU5WsEJW7FpGn1S8CoqIIEuP3KJOwL0VAasCcq2271pC624fqC3JcERQbKf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(7416014)(1800799024)(19092799006)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qZffyVJjCrUrg4rzfYe6aVE9MqI7wWJyR9TcjZ7PoyRTPm4AoNCti9i/1G78?=
 =?us-ascii?Q?cSAQCPIlUI6X9+eG+4XgMxucIPqITWJGTx2JoeJvg7JVyGZ5tFQIsBXPS8HZ?=
 =?us-ascii?Q?TSG22H9Or1uCD5LuN4kUCDcgryQ2mHBC45Ogssn+3QmXRXxsY0qpbe8Lx9G+?=
 =?us-ascii?Q?71pjFO09+7C/ZRNYb0LpbEf8SKqSv+EeqfSFkpJbExYSEXaejvRTthIpqbFs?=
 =?us-ascii?Q?x18oDbsVV7Sy0/3qM+9MAFvq99wIZwpkedG4LYvuyehWmTjT4BGHk+Jb02Od?=
 =?us-ascii?Q?HzpKRzOYhM3OI3019xQyy5kWXGGADapeAmZ/NQtJX2YBaCU7XVle5H5LS/gq?=
 =?us-ascii?Q?W8M2O9R+ZaRDnHp8rSaQODnOSQg+r0M6HwxwojXt57L+kS6PC13ebH9ytFLA?=
 =?us-ascii?Q?MU5zTIXvizpqjvoPV4FJFfLDRNHDMDmL3pBz4mTXMwvMRrJ9ubq1nXewuNP8?=
 =?us-ascii?Q?5WN4qf+nZvWK6pXiXm1uH0kgPeoa93BZn7sepCc/t6zVdcZbuFiXty+qUsGU?=
 =?us-ascii?Q?6nkU1gPB+Ueag5Jm/qfYnVRqJG1xnWTmuYNg7/FhwQv6w+JBWmAlPjCEVBCn?=
 =?us-ascii?Q?0i+1mIMBHzj9JMb321m/1AsXtKZQ5+E+n5z5ttNcGEK/tbTv56FLbssyRDEs?=
 =?us-ascii?Q?19QGziYSXytiko4NmfK8QdYRzbxeb151nhbW6ztiLvO9+G3tnfesNrVd34FX?=
 =?us-ascii?Q?rD/SBQZexzKaxsvQ5FV733ad67WaR9tPviHR60pvOCx9Yw75ZgraJtvt1CCQ?=
 =?us-ascii?Q?ahwthpKT9wzMcsMmjYqMZy9+D4mvrSRgLTZHx/yIK+cyscAHA1g5woAKBsuo?=
 =?us-ascii?Q?DmVDxC3XhdPKNLPuLhHgz5FMdWym9991128tjxiaFbXBy8kCPbneMPt/VuIa?=
 =?us-ascii?Q?s9UPUqEDVZoiHR6Yn98RWpSwbMDHmy4h+i3ymHMIYu0W6HpXRq5LDl9yYoiz?=
 =?us-ascii?Q?kfNSW9TFT0RCDxzH7EIpecyUifHQtYPL7sW7zb1Y6Zue5SrbSLv3tCOlPvGF?=
 =?us-ascii?Q?eaS0IopSvTEB27U6YIegMdC6MU3egXNT+UWhKRVje2sEdpcguknyhITTNMSy?=
 =?us-ascii?Q?IFxcKwSSCiXxj+4LvWcEjVoSWIQimv8wFLYEu27Jo/96bfX1xtRwXLBPYmk4?=
 =?us-ascii?Q?LvZ0DpmZrLHEk9rOBpWdpUpFVoy1909h3dFbMm+R2FNBqGoNo8/ZNx72ZqwU?=
 =?us-ascii?Q?fw6RCi2P8k4gG5FsD8kDeiQFfmZB+eip7RUuVo3gZP7BxH2IWOMQI5kdapNO?=
 =?us-ascii?Q?bkRhK3B4VVghwmBeKVSaj73y/NhllX7NzPYEA8tYrogm+c+Q1lu4ewHK2Agb?=
 =?us-ascii?Q?/sQ8iQ3Dg+poomk8ECH6Gn4i82Kj6U4bJ5F0+e4/tWDBehdF7mezGBKPkKoz?=
 =?us-ascii?Q?Vn0pbV13OV3zDMrU+VgSBwGuE8rY1xRfvV9tM1KhQCea/KTA3Y2ENPKd51lP?=
 =?us-ascii?Q?/xs2a7xkGdStB/TjK+diYxLuMQyFC3G57i0UUnA2/43TWP4ynzO2ugla+HkP?=
 =?us-ascii?Q?+wtU0MiklLk93skspe8oMhyf+rB1iXrwGmchqJ+MHdjS9bl24HrI0FzWibKF?=
 =?us-ascii?Q?gY+SiAwNB3kHjlCaR+a+Rn7NDNfPXDbUSI0T0BzBDIHNerEs5MuXJZ7H6cCa?=
 =?us-ascii?Q?Fbkw9XoEwiZd8lfyZm9dQ+TFpYACkYGM+U01oYQQmRhE7f2yF76PMLB6ZDIB?=
 =?us-ascii?Q?gN6D+6FD5NnoIY92+SaLu1IJwE719w3J5WBMlcTwrsO8pRbXFQ1I3OjSZ/fj?=
 =?us-ascii?Q?DGRXM14HX/e7yTSnXmXxUKwTdqmUUWtkhoZTbQQP/OI16nEoh7uD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161e0719-985f-4843-e30c-08df1fd7c38d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 16:19:27.3912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nimmf/BD48ZMA9c6WbgY7eU+q1a5+IGJ2bZ1bMx1cE4iuH2kY2/PGq33rfzlsf/X944diUte27dVc3QbdbC9NOKg7ITMIfgj/iTB+wU2RgHSmYy5RDdn+SlgkkYUztC/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB301662

On Thu, Oct 01, 2026 at 12:52:55PM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
>
> Add a device tree overlay for the Resistive Touch Display 7" Parallel
> on the Apalis iMX6 parallel RGB LCD interface.
>
> The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
> with a resistive touch.
>
> The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
> Board V1.2 device tree to provide a ready-to-use DTB.
>
> Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            |  6 ++++
>  ...apalis-panel-res-touch-7inch-parallel.dtso | 30 +++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso
>
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index 5f35771cc3626..cd1b095ce06f4 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -107,6 +107,10 @@ imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel-dtbs := \
>  	imx6q-apalis-v1.2-ixora-v1.2.dtb \
>  	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo
>
> +imx6q-apalis-v1.2-ixora-v1.2-panel-res-touch-7inch-parallel-dtbs := \
> +	imx6q-apalis-v1.2-ixora-v1.2.dtb \
> +	imx6q-apalis-panel-res-touch-7inch-parallel.dtbo
> +
>  imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
>  	imx6q-dhcom-pdk2.dtb \
>  	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
> @@ -243,6 +247,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>  	imx6q-apalis-ixora-v1.2-hdmi.dtb \
>  	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
>  	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo \
> +	imx6q-apalis-panel-res-touch-7inch-parallel.dtbo \
>  	imx6q-apalis-v1.2-eval.dtb \
>  	imx6q-apalis-v1.2-eval-hdmi.dtb \
>  	imx6q-apalis-v1.2-eval-v1.2.dtb \
> @@ -255,6 +260,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>  	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
>  	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
>  	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel.dtb \
> +	imx6q-apalis-v1.2-ixora-v1.2-panel-res-touch-7inch-parallel.dtb \
>  	imx6q-apf6dev.dtb \
>  	imx6q-arm2.dtb \
>  	imx6q-b450v3.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso
> new file mode 100644
> index 0000000000000..be2164dcd0369
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso

imx6q-apalis-panel-lt161010.dtso, in case other 7inch panel added. it may
be end of life in future.

or imx6q-apalis-parallel-panel-lt161010

> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
> + * Unified Interface Display connector (as featured on Ixora carrier board and
> + * Apalis Evaluation Board). Touchscreen is available only on Apalis iMX6 v1.2.
> + *
> + * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
> + * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
> + * https://www.toradex.com/accessories/resistive-touch-display
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&backlight {
> +	status = "okay";
> +};
> +
> +&lcd_display {
> +	status = "okay";
> +};
> +
> +&panel_dpi {
> +	compatible = "logictechno,lt161010-2nhr";
> +	power-supply = <&reg_3v3_sw>;

You'd better use additional unified name reg_lcd_panel

in main board dts,
reg_lcd_panel: reg_3v3_sw: regulator... {
}

So this dtso may be easy shared in future.

Frank
> +
> +	status = "okay";
> +};
>
