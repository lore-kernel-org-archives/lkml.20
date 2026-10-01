Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD5B1F1534;
	Thu,  1 Oct 2026 16:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871982; cv=fail; b=nAehaw3H3RrRFBHmvUkO/wbLS9Vp2OkP0V/510ZoeRNg19+u7pDG/RzYiEtt4Z3zk6auClScYFSq0Je977uO3viUD01jOwwEWuNWTkbUStrPoTXrmm4YY4ycSs4b+rUqN+hJ1KBAG9v3BWA5CgTgn8bC6zvvCDE9LEkHvDQeGZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871982; c=relaxed/simple;
	bh=SeI3X48NIFTRXyZOUHoO/onQjGEOGV2HISdwdtfcVIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dsaKUKRxgPF6YmjcFvFOagpgSZATWDSLCmnLvMayG7V0pERm35zByWiHubGkaD2IDhGxoeIahmL1Y/k/GGsWWvNllpGI2H+/p8rTN4o8lYdW9LZNUXTp3MrbsfkWwkJA79jfNxms6YUOPeOLUlm9YzlFXb3THDrvvwETtC0IGbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gZvYaEPJ; arc=fail smtp.client-ip=40.107.159.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gZvYaEPJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5WyG2T5ta0TxoZOzVw2VKp8HT61Z1/W8HsxIQuxLbJgbsv8d70JytH6au+xfTLEUBxMt3wRT9UWz9XXsUGHwy3fkWpNzTd4fqXiLmUaOqPubEw5Bc6ryL6YJEKX44SKrqKrLmX1HxOjxrUkDo72mzX1AH96k6JWV5J/qfb6QiyyQtxwDNPevj4fu5ahO89FKVYccQmAMP844KYeT/rO/iKUmOCIox+6mAfXMy3WZU+yBnlqqyU7ZBSuDOJBdqyQnIkdGZwCLXyqxf6nDlD8ESGF/E8K6wFBER0lxB+VAhpqDK1YHFduVSVKLLoqdola/uSHXqCeAKsjL40c+ZSeOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOgZd6VLdZnRsvYndlXC8GHgusDHdMdjS+sKtbYYN6s=;
 b=L2zqS8/gu0vkEf55I97yX04zI9ZquqHVIKIfUBjYIXqGYvCxEQxHUr9EuH0YS0BehvtUatSeHJHR0HjpeUJa8AVP54SGwN10TTROJVSaVHge9aDXhklx9Z52HVeDVnI7fpabof0WVS3poLnwGUzYrraHm6gRLce+/mkfYtbITRfIPh/YS669HGDOqRLlWeXzXsu7bjiiFubcjjsdSMFu+60+i1ZbjAURRvniJQmfJSqXHPQFA7PcaS7+45wYo84ej2Ad7pTDBKucdTUSxDJKxC8Fj2cC4JIfQbmhyw/ZM6Axp5AyFkCk39mBZVmqMcC19EqeLS5tlWrgfOAVW7it7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOgZd6VLdZnRsvYndlXC8GHgusDHdMdjS+sKtbYYN6s=;
 b=gZvYaEPJs82gq7xaDWujoE2fRGMStq5GZ69ZnWj9mzX6nTjaz4OBBfhLKMaiX+GJ5AfJpwsANhuBfL0UOJPhL3sDQXTm64JhgtPGT4/rDCny6B8rzM0cJRrGPAQikVOehKpU1OwWmri4xjn78nr4WV7+lVBqduD7d8TeKj478+9tQ9O0wmPJvqfyP0FlnxcM5YyiIUzL3XNBBha/IbD8nR9bOgEwPxCTjqiHl1FoBIXzc4m144DI1WenlmkOSTnXxw0w30iH7kgXNBT3uJh/6G4XOIA8Eg9BFt6sUOIE6ljr53EVA2KKbQGFssrWYLnpUuiKV6d5DQcP2qymVr/z2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB9045.eurprd04.prod.outlook.com (2603:10a6:20b:440::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 16:26:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 16:26:16 +0000
Date: Thu, 1 Oct 2026 11:26:05 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com, hvilleneuve@dimonoff.com,
	marex@nabladev.com, stefano.r@variscite.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch
 Display 10.1" LVDS
Message-ID: <ar6JnZp1jBvlc8bx@SMW015318>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
 <20261001155412.3177428-4-leoreis.costa@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001155412.3177428-4-leoreis.costa@gmail.com>
X-ClientProxiedBy: CY8P222CA0013.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:930:6b::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8ce04c-4560-49ee-9759-08df1fd8b745
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|7416014|18002099003|22082099003|13003099007|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	83hZjgUj/LY5WXlTYNe9LckLS9MmPS40adl37Z/9e8+lYGwVG9W3VAcdfso1k16cpGtWmltUqtoYdgy3WBh4ruJx6sq5R4rTbjqRMbesOAIEJwNVum6dLKlsaBF49lWTtdnpmgVyPFn2yy/deMuVuULFH/olkG8QeB0lPx6BxCDhHk5tRMNd//LdX9RMft7gdAEOiPmIFP1GsNEhrBoZhl2NC7+7YHHaqB2QuAVrXjjx2KHiadBT3E+j27LPzk2vjdc6l83ZxTJ0gsXasubN4w5NHweG7MxiwO7F87MhUiSfu0HdKsWx3pc9GFf9rvOAh+kQQWovR8ddcL7nK7bi521aDf6uky2fc0f6eykXxhsgkjCMvS+x0MGPg0bokdATf1hlOAVdjVuYNqLK3yDxEPtOv6fG5VfRGpWLFJqKQIcLJITV3A/8rH3AAusDEoJl8TCuNIC6bzrDigqAXyagamdvIElp7UZYQMYPBxcLyD365DB7QuQi8wigFjxsiPTCMqMhoO4ti39tYUv8kK9gfCsFPcXxscoB9uMqGkU2WAm+qSiybHKw6B+BRHPcVuep1PtjGxErQNuDS/ZkPEEaZ0nQvJt5LbLXxec9WM1knpriSgdHuT4wpGrzkUNXGuTT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(13003099007)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QF2QoQZazHh/6VENqMK4QOm8oaouuMURFq9NvVfEHHFKrXw2jtBkQei4FBpO?=
 =?us-ascii?Q?3JRvObOKAroMSGLlT0yB+fCpPRTGav2ZnD6unhvnzswr/PSMgWbHQg4QZd7/?=
 =?us-ascii?Q?7x3yheaGImoVhfQut3aQ6n208FTtsiIxBdAu4ZAytprzu6XiBjtD8Y6pNjw6?=
 =?us-ascii?Q?daKjOO3omP1YZO2l65JFzBfMZl2y0OFl16rvMpYS2yjVrhliFJGQ+/tko062?=
 =?us-ascii?Q?+YBUfoCM7jy4SKEkKrUxNpiAA366qXxYVz/KLmyPMadM7Bq1Tmm9ghmc/+a6?=
 =?us-ascii?Q?BYEIimtIyk8m6GnnxPMP8tG0Y5zm4M9ECPaTiU5iv/MFeo0/HhS11Dxhvkmh?=
 =?us-ascii?Q?IBTq8M5JlrJ0T3SkAAAeEtwpr/l8eX4iMNze2W4BAKQq4sFbgqQ+AdexNZ27?=
 =?us-ascii?Q?ZsFlFRq7hNpm2hg7TwC07Q4qhMUc0g4aQTdmV0LJk28eU/ja7We7W2AhNUIb?=
 =?us-ascii?Q?JdCi3jGV/1lKqMpQVbOLVP3s7YxyprAsbYurwpPFMP42aPOrjAoJAYIqqMpw?=
 =?us-ascii?Q?2A43DoMMZZgn+xJFjjNnYyB1elUvnZfofip16Wiv9ehHl5KoK0NbR89kCVu4?=
 =?us-ascii?Q?vj7rUIoRdzm3MXGlhFYoUdM+AQD4fUJy2mC5bHpu+zvhJFzljShz9WvC/dNR?=
 =?us-ascii?Q?l6v+1cpvF6vDdtpatQ86gwGKFiHdSd5wLo2k/ddpmJkMmKArkRFBBjPaWN4r?=
 =?us-ascii?Q?VjagO+OBMbljZHPDK0VNaN1N1jl69iHBE06pE2U/Guqow70Ugg5Tg5ZEbHzK?=
 =?us-ascii?Q?7JtGqsLQyROT7ImDAoyyI+J+bUidaJz1JvYWMZPSvwz747/Qh5PC5q8UjH1A?=
 =?us-ascii?Q?2gAui/+x/GcxkXqxwtGZiNvhdK15pBpDdD0d7qVAet4ZPjj/UTP4kvEQzvPY?=
 =?us-ascii?Q?hzZOUVmjCydZpHAGTtcFuehQAED2ugQxImbhkxBbliU12TYJbddwS8b62A3K?=
 =?us-ascii?Q?Xh+bq42ZSBi8+nLABZ8Pr8JMcvqe4ekiWWA9wE76XgrFSugmRm9JioqFVipb?=
 =?us-ascii?Q?GyJZkqa3JY6emmSHLu+F0QtjwHe/8HqYf6igycgwksEQsUdrcMiaE8SAN7DG?=
 =?us-ascii?Q?+NB+3QEfI7osTixs3xeUT1eNihsIzf3VfotMVsi5a8z1MAD1yZa4r4w5M0FN?=
 =?us-ascii?Q?xO+AGZlZCTl61OOdHOoCsM0n4ZfCDxzTCh9IWKRJT8mo25LgOYqJZqE4IZjo?=
 =?us-ascii?Q?7K05dL34hXf0wbhRUSxkoMSKheBsAViOeCIYnkRu8XrrOLEOPCj5DUSF7hsG?=
 =?us-ascii?Q?1MVvhuF3k9xoWRuean179SOysM8WWXK/zPPBnfiL9PCegFK7AgWBhGX92go9?=
 =?us-ascii?Q?SdWPk1YgD52OinvNvnP0P6sX37SWpRdbUDjGQtLHiygvre1v1+NxJ8WqVtDt?=
 =?us-ascii?Q?yJH54Q3UYYsgZ06LqsWfv1u9Xg+bq94FevV8gtSXxtuD2Km9kUam6orwS+uL?=
 =?us-ascii?Q?P+2/ciWWOkh+ngQIvXTpaBvQtD00D7i2UCcnIa3NHtJjd9VO/wZajRBhgHv8?=
 =?us-ascii?Q?ThkkCIxx5OU4zPU6rp9izSpSGMEi7XuCiffUa+Ku/YjtyDhCqKo+Vq4LJ134?=
 =?us-ascii?Q?9dKt1dCT4zStTiuSBG+ko4SN3wl9A8IvwQrrit1w0uEE7oKhKB07wTbZOaR9?=
 =?us-ascii?Q?rbn9aF4qLB0A5FdFjN6vD5DU/unVJPL7DxQagDZ4FlKoU9QsH++yx2/jYz1J?=
 =?us-ascii?Q?zENKEUeV5TBrJPzRB7Ee+clKP+glp3sk20a/GqKKasU8x34pfZJTRKhzE/oS?=
 =?us-ascii?Q?X20dY7ozJlXEZdjeX9KY0R9ehK0OslTXoopukGPdGUfmIasbGZ3K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8ce04c-4560-49ee-9759-08df1fd8b745
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 16:26:16.1083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CuWYJmYrRBcuQTk3Gl1StTduBeDH6SRZHf1fWnrbT7hBIVUkx5fVX0TmY1XgEdHG+7swXG0Qb8q5WTojBkaa9lLcX7sNZvjCoMJHde6k8+cYSa3iLjPzly9wqENdxVB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9045

On Thu, Oct 01, 2026 at 12:52:53PM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
>
> Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
> LVDS connected via the Apalis iMX6 LDB.
>
> The panel is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the
> touch input is provided by an Atmel MaxTouch capacitive touch
> controller.
>
> Remove the panel-lvds node from the Apalis iMX6 dtsi, as it is an
> external component that does not exist at the SoM level.
>
> The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
> Board V1.2 device tree to provide a ready-to-use DTB.
>
> Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++
>  ...6q-apalis-panel-cap-touch-10inch-lvds.dtso | 53 +++++++++++++++++++
>  arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 13 -----
>  3 files changed, 59 insertions(+), 13 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso

similar 7" case, add panel module name in file

imx6q-apalis-lvds-panel-lt170410.dtso

>
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index 32d77a59c4358..23fcc80d7f309 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -99,6 +99,10 @@ imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
>  	imx6q-apalis-v1.2-ixora-v1.2.dtb \
>  	imx6q-apalis-hdmi.dtbo
>
> +imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds-dtbs := \
> +	imx6q-apalis-v1.2-ixora-v1.2.dtb \
> +	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo
> +
>  imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
>  	imx6q-dhcom-pdk2.dtb \
>  	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
> @@ -233,6 +237,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>  	imx6q-apalis-ixora-v1.1-hdmi.dtb \
>  	imx6q-apalis-ixora-v1.2.dtb \
>  	imx6q-apalis-ixora-v1.2-hdmi.dtb \
> +	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
>  	imx6q-apalis-v1.2-eval.dtb \
>  	imx6q-apalis-v1.2-eval-hdmi.dtb \
>  	imx6q-apalis-v1.2-eval-v1.2.dtb \
> @@ -243,6 +248,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>  	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
>  	imx6q-apalis-v1.2-ixora-v1.2.dtb \
>  	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
> +	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
>  	imx6q-apf6dev.dtb \
>  	imx6q-arm2.dtb \
>  	imx6q-b450v3.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
> new file mode 100644
> index 0000000000000..a84114e1d3fba
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Toradex Capacitive Touch Display 10.1" connected via Apalis iMX6 LDB
> + * on carrier boards with a Toradex standard LVDS display connector.
> + *
> + * https://docs.toradex.com/105952-10-1-inch-lvds-capacitive-touch-display-1280x800-datasheet.pdf
> + * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> + * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	panel-lvds {
> +		compatible = "logictechno,lt170410-2whc";
> +		backlight = <&backlight>;
> +		power-supply = <&reg_3v3_sw>;

use name reg_lvds_panel, it help improve reusablity.

Frank

> +
> +		port {
> +			lvds_panel_in: endpoint {
> +				remote-endpoint = <&lvds0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&atmel_mxt_ts {
> +	status = "okay";
> +};
> +
> +&backlight {
> +	status = "okay";
> +};
> +
> +&ldb {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	status = "okay";
> +
> +	lvds-channel@0 {
> +		reg = <0>;
> +
> +		status = "okay";
> +	};
> +};
> +
> +&lvds0_out {
> +	remote-endpoint = <&lvds_panel_in>;
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
> index 5fcd7cdb7001f..e52b55a386f7a 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
> @@ -95,18 +95,6 @@ lcd_panel_in: endpoint {
>  		};
>  	};
>
> -	panel_lvds: panel-lvds {
> -		compatible = "panel-lvds";
> -		backlight = <&backlight>;
> -		status = "disabled";
> -
> -		port {
> -			lvds_panel_in: endpoint {
> -				remote-endpoint = <&lvds0_out>;
> -			};
> -		};
> -	};
> -
>  	poweroff {
>  		compatible = "regulator-poweroff";
>  		cpu-supply = <&vgen2_reg>;
> @@ -738,7 +726,6 @@ port@4 {
>  			reg = <4>;
>
>  			lvds0_out: endpoint {
> -				remote-endpoint = <&lvds_panel_in>;
>  			};
>  		};
>  	};
>
