Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013065.outbound.protection.outlook.com [52.101.83.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E7949CF23
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350741; cv=fail; b=kKNv2zt1NQUwr3kqpH82atN2ByZpTCgFuP6FjNLS/dy60nr3xn+bHheWuKknTPJXI79JJSHje1/NWuM9OPWKPPvNKZ469hPZFbHBee9zB8ETuE3u22Zi/93saqCQkCZz6uTGbMHd+QVkneR86fdJsHqhmsmWCtDeSYxTyq6LnUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350741; c=relaxed/simple;
	bh=W3A+nzO5k+TXb6bAjlKv8/c15Xn3jDpRmG4rxaqs2Io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uC3oY0Ff8domvVX3lJbf3eHfAZtgP2u9O9gKggNGOBU1cNm5f+GjdZ1+pN0yHPeQERK1c16SrHZ3V0CUQjTU7xV+fGK0TyilaHwV/LivhXJRuzgWphlgxO3qZaeh0ncP2FQkKxT63KgplejMz+PsXrmnJ31Q8QqINxA1iQvcMC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SmHf3K28; arc=fail smtp.client-ip=52.101.83.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SmHf3K28"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8JPpXwK6tqydojsBGn8Sn+GmOUn8ICpDjNH0vv6/ezSeJUDzU4nbvDXoGP0yy0zx9lf6pyQqjEPWzLWsEE5e0IvmJZHnf48TPQRLZhfz8LOTTQZW39qfmWl5w73AJXJnCcK0Ii0Fo2mUuUYECIR8JxaxQVDtTlHVY/TgF7U3wa3jqqm7KDzlVJko72X2F9BAglsyfkMez48iVYUtd1XrPmxv+5XU8VWhWRiBGFeD6LVNRqx+HJVI5vDSAIt75kmFg+Y3fXzIYPLZ6Cd3etsZdQ9pRidotTlbVnRmZBtCHjZw+f/LLE+Smu5CtOf4YsgZQhhsdgHyrmJS57w+YGUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yU3RlO4egFQFjPKnrhz/PXicW2nek+E0RnpagCE8J0c=;
 b=qw8k+JDJPPM6sWEGj9KxkyNTRDtHta1Ty7tiJQbhX13ZG7/Yud4S3w12FeoOE7oaEmMZe7EMoHbXildLI/iTodQ5FCWwZw2VEzxDw6zbLqpqloFEjDeU6/HhCHQUAzpeaOyCnMM4EYp+BTlbGUVCa5CyR82+8GsKuc+VP+3CnSC9IM5dbYTIGeJRDze0Ye8zLxeFVq9/jN4PR3r0KdA7aNnVhn56ZHxkhDgv8TajYxjcRgSmtnZaTrBnMXd9s/xL5uQ2eC/d4mxFsnEzVwNP7nD3h4oFYGzvw9w+SZMDnpTSccYewugDxV6T5tymVrmxdNcIQt1R6RJ16BC1xhPrLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yU3RlO4egFQFjPKnrhz/PXicW2nek+E0RnpagCE8J0c=;
 b=SmHf3K28vgxGjlYUq9B4RSrbx5Anqptlh3tnVxYM4RDDejuTFyBlE7cywdnzCoKPS8juiIQGlzbu/OlgH9ZSdof1BR9WXeQXMVyc03rTfh1niDpG6VEh1ur7MB1vF5S8ez/1yfK3741uCz1F6ONusjt5aea41VAcAz9p+ExggF0p0fW+2OuxGaqWv6Ga8BZwsP3a7aJELrcznfOZdTI/qZk/P+kzF9jPOcZvby7XKBmuABA2FFWXGA0yEn2SOr0OKCkGYu/52/g3sbGjirIITnn5NZ3tmdvTl27cWw7oFc2bAQbDMV0nORokZ5Gvd25JKftoMgITJz7cNvtECvcang==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8884.eurprd04.prod.outlook.com (2603:10a6:20b:42f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 15:38:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 15:38:55 +0000
Date: Fri, 25 Sep 2026 11:38:47 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <araVh6bbUTGcOf0a@lizhi-Precision-Tower-5810>
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <20260921230603.2518652-5-samagazaryan@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921230603.2518652-5-samagazaryan@google.com>
X-ClientProxiedBy: PH5P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c29769d-46d2-4ee3-daac-08df1b1b1bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|19092799006|10067099003|56012099006|3023799007|6133799003|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	b9H0QW8aHtOEQVuv55TBHQ5QfXJzpZ6Q1pRiQrljnh+A+SNDBV0S9uaD/kJHuZ6xSp92oJdvnTaGGKWJFwzythgcEY7MlpLF7SGWdGPFtCwUFy7C8T7ztMThgZFZ0My6xzZbeElUDhngBpNz/mcab5KeeEKXmVoIm7MM7RVLb8p8KsY/k0+FdH0DW/bLhWu8pUHDkyT/kKUZD5R2PzpbXSQXDtxF4lFxFVVk95k1g0hOXTbZy9MTaQ3f5NbIsTLHvqsGqqVZoJhdZ5pAWP81P4mRf9SIQ1hCIMXgKyGUmEEOjjwy+mkcgoc9ACSWPgsCdNzyQrCqnp5zYEGtq3sxI9h9VlkSJVXuTIl1tJkOI0SQPS8+Cm3xaDsTD3FR6QuhTFm9eMLeqUD3RQqDuZIDaj9g671IVcGe23j/0fE+Yy7ZC6pI5XoRSsJl6ZU40FbLizEXIQG6y9G0641fdhY9RPIfnG5vm6+9lljoej0l0KE+ouCsFBLQYxB0qQKCoUHwHCmpRQpNp+FUoB3iUUI32KyptjWVX+RNtiutTWyupVEIhs7SFUCnTh0A/acgj3ZXwCPkbobNq6PkxDFr6DYN5sLG0lXo+2OdQ4JZ9QEZHNy06oWHIjEqcmQn3O8v9wCB3HSXMmlVrKdpxXtK5lemlSxYXCZ1GgRYXq+X5bTf0/o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(19092799006)(10067099003)(56012099006)(3023799007)(6133799003)(4143699003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HcKS5VBtvl5CfPlpMWcrwygRdpCjOuEnV/eyS7KXefKORbaXqKwUF1fn6vpa?=
 =?us-ascii?Q?a3YLf38FTIk3Cq9x0e0gn6RMJRN32wMgZYN4UW4HPfx+LaI1JcLq5EuAqpCm?=
 =?us-ascii?Q?4dqGA1vQ7LNXaP5UFlaA8XzfHCZqJRYWhiKykHi6w3uZT/DLYCEZ4/6l5k9l?=
 =?us-ascii?Q?HpoRXED/wZbz3togA1OmvOlyefy27GDP2bj3Xcw52PybtApqIPwhyhNz9b6I?=
 =?us-ascii?Q?OwdKK72mommVUjINCtFqCb0LK6v02EkOvs5MwGZdIiyfP5Qq6yycYLVcrdZK?=
 =?us-ascii?Q?dtVF4kUN4FO6vKkzvGNyXUtU7xwF4mbVJYi1HUas9lTt1pdiLVkywrqnrCfB?=
 =?us-ascii?Q?HyipusyrMVArTahE/6jYSmZj79M3rWysxLWJjvp6qPcBD/RbZzvdaShIbw0s?=
 =?us-ascii?Q?AGtn5gS1rH2a/HZeZfld/d3Cv7Fq3hopYGFX2smvfoyHJ95UtRCsCJfk5cs+?=
 =?us-ascii?Q?m4DET/7nY+OfO1JTp+cBx3QzDjRgo9eoLVmxIvYgncV+Yx3vKm8N1Bm8bLPZ?=
 =?us-ascii?Q?6d2V6ziMGRp9Eq22DZTMOd1zxNaPRkeqcroypZWV2hOiKM8fQTIDZdgtYbV3?=
 =?us-ascii?Q?Q43GjNw8hPWHXchQS6ui8BKLQYTJnDDFtcvjIk1akMKtAZUeH+6/81P21qEZ?=
 =?us-ascii?Q?BBCGgCd6MLfQPtUNRr9dIsgA/JYMYVdWVGaJMR6OZO4eUsWLG3iGkj30l6yS?=
 =?us-ascii?Q?9PYq3tSXbinp661ca/v0RwzqwYmiR/4vXn4YrOJXoLZlzuRUQVF4/kGrD2Pd?=
 =?us-ascii?Q?IKepiCeq/1wQOW0Lia4FEjPjDh46I6OLRufwV+oiE9tPCGSzKnNj0Kpqrhk7?=
 =?us-ascii?Q?GY1h+7fc159t7SqwXJX1lHHiEv2jyVm8XY+pJq3SuXdSzepqetHGE/jk6BJp?=
 =?us-ascii?Q?AJ0rMp+6eiDr1BCwVzpQWonmrk+aRANZJRJurdLATYmND37ZZ9A9KRWqHl23?=
 =?us-ascii?Q?MTDaT/UevZ9cnSYVdAZMsAOEsUgdh02sijpgHAukXXIfYXf1w37n2Qgr63mG?=
 =?us-ascii?Q?pZGXqO5MaWQ4btEICbLi2fO+XjVWy0VgpX023zMowU0s0jX1s993PSAugk0Q?=
 =?us-ascii?Q?LtuX51mX7gOdjXdXGdQ4CX7ml34I1Cgf29Oqtu5ftN8di/UEmerwhDJDSPxe?=
 =?us-ascii?Q?Uy9fep4DbpDG0zDnb2sO4qnPP8x+K4tEjWVZkb5ZE/MJ0v5EBj845BCWgapP?=
 =?us-ascii?Q?/dkdj2lEQuo9N5oBxsclPM1soCFFaLrsPq9sZAUq2TLT4Mz04tOvf5z/5cqy?=
 =?us-ascii?Q?5khNCUiHW9wKjX3m16WShAM0gBw91dK1hVF4SZz/fWREGVdP2/iBYSey/LNZ?=
 =?us-ascii?Q?3i8dI0wXQcN+lBAAncMhAntrxulK5R/haP7J88Bcup7MU3CFvNm/Kl1F19yu?=
 =?us-ascii?Q?cyWbeNCNAIqTOeAn0RrnTwxfg8HWMclGzVjjwVTf+JE+9vuqnd+eaNu/o/xX?=
 =?us-ascii?Q?5q6YANMW5rZf4KUBvQRltRpuYFruf9/TV9Q13lO0sDTbKXcTAxzVv02xlHzy?=
 =?us-ascii?Q?c/9eK98U1dQ1SydT7EqbzRriBY3oDy5eRdPm9Ob22DpnbhCTW9+BqOSrzI4p?=
 =?us-ascii?Q?t3YI4EtDcxJZGpPpjEZ2BFFHfrT7iz/8LDatdcg2aJEq1a7tapZ9NBqzQjVX?=
 =?us-ascii?Q?1P0Rss+wNv/mW7kVt/ZYMa5y1ckKUkKD4gmcX+lmNnMsZTXI6UOStq3e1pqG?=
 =?us-ascii?Q?CNKe62NonIO2igUo1Uoz1z5tenDIxM2fe8cQdlLDcyu2lWjVTS5nozAr5PHQ?=
 =?us-ascii?Q?WVIdHy5xtJo/9qauSFP0gISpJGTZYkx+qhj0wU5RzHjvFPf3sbg0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c29769d-46d2-4ee3-daac-08df1b1b1bb2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 15:38:55.5455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnXRo2gX65tbDNz/HimnMo4eN97JV7s0OmKEEMQBWFQYbNAnQJ9uFnm2q43s9ISuZBRvsjPM413Qqz6/34RXD8nZGZ0LYvEM9RYcCWTTBhUSMRkARbVpAt8oTILKnGwx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8884

On Mon, Sep 21, 2026 at 11:06:02PM +0000, Sam Agazaryan wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
>
> Add userspace character device support for I3C transfers via /dev.
>
> The module allows userspace programs to interact directly with I3C
> targets that do not have a kernel driver bound to them, such as devices
> in ROM/bootloader recovery mode (e.g. OCP Secure Firmware Recovery v1.1
> and Caliptra Silicon Root of Trust recovery flows).
>
> Features:
>   - Dynamically exposes /dev/bus/i3c/<device> character devices for I3C
>     devices when unbound from kernel drivers.
>   - Dynamically allocates character device minor numbers using the IDA
>     allocator.
>   - Implements SDR and HDR transfers via I3C_IOC_XFER ioctl with 64-bit
>     aligned UAPI data structures and actual_len read reporting.
>   - Supports compat_ptr_ioctl for 32-bit userspace on 64-bit kernels.
>   - Uses cdev_device_add/cdev_device_del with device refcounting to ensure
>     safe lifecycle management and prevent use-after-free on driver detach.
>
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> Co-developed-by: Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>
> Signed-off-by: Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>
> Co-developed-by: Sam Agazaryan <samagazaryan@google.com>
> Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
> ---
>  MAINTAINERS                     |   1 +
>  drivers/i3c/Kconfig             |  11 +
>  drivers/i3c/Makefile            |   1 +
>  drivers/i3c/i3cdev.c            | 491 ++++++++++++++++++++++++++++++++
>  include/uapi/linux/i3c/i3cdev.h |  57 ++++
>  5 files changed, 561 insertions(+)
>  create mode 100644 drivers/i3c/i3cdev.c
>  create mode 100644 include/uapi/linux/i3c/i3cdev.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 81a9a02c919d..30a5cb12c4f0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12364,6 +12364,7 @@ F:	Documentation/driver-api/i3c
>  F:	drivers/i3c/
>  F:	include/dt-bindings/i3c/
>  F:	include/linux/i3c/
> +F:	include/uapi/linux/i3c/
>
>  IBM Operation Panel Input Driver
>  M:	Eddie James <eajames@linux.ibm.com>
> diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
> index 626c54b386d5..166875837ec6 100644
> --- a/drivers/i3c/Kconfig
> +++ b/drivers/i3c/Kconfig
> @@ -20,6 +20,17 @@ menuconfig I3C
>  	  will be called i3c.
>
>  if I3C
> +
> +config I3CDEV
> +	tristate "I3C device interface"
> +	help
> +	  Say Y here to use i3c-* device files, usually found in the /dev
> +	  directory on your system.  They make it possible to have user-space
> +	  programs use the I3C devices.
> +
> +	  This support is also available as a module.  If so, the module
> +	  will be called i3cdev.
> +
>  source "drivers/i3c/master/Kconfig"
>  endif # I3C
>
> diff --git a/drivers/i3c/Makefile b/drivers/i3c/Makefile
> index 11982efbc6d9..606d422841b2 100644
> --- a/drivers/i3c/Makefile
> +++ b/drivers/i3c/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  i3c-y				:= device.o master.o
>  obj-$(CONFIG_I3C)		+= i3c.o
> +obj-$(CONFIG_I3CDEV)		+= i3cdev.o
>  obj-$(CONFIG_I3C)		+= master/
> diff --git a/drivers/i3c/i3cdev.c b/drivers/i3c/i3cdev.c
> new file mode 100644
> index 000000000000..309ce8181209
> --- /dev/null
> +++ b/drivers/i3c/i3cdev.c
> @@ -0,0 +1,491 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020 Synopsys, Inc. and/or its affiliates.
> + * Copyright (c) 2026 Google LLC
> + *
> + * Author: Vitor Soares <soares@synopsys.com>
> + * Author: Sam Agazaryan <samagazaryan@google.com>
> + */
> +
> +#include <linux/cdev.h>
> +#include <linux/cleanup.h>
> +#include <linux/compat.h>
> +#include <linux/device.h>
> +#include <linux/fs.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/overflow.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +
> +#include <linux/i3c/i3cdev.h>
> +
> +#include "internals.h"
> +
> +struct i3cdev_data {
> +	struct list_head list;
> +	struct i3c_device *i3c;
> +	struct device dev;
> +	struct mutex xfer_lock; /* prevent detach while transferring */
> +	struct cdev cdev;
> +	int id;
> +};
> +
> +static DEFINE_IDA(i3cdev_ida);
> +static LIST_HEAD(i3cdev_list);
> +static DEFINE_MUTEX(i3cdev_attach_lock);
> +static dev_t i3cdev_number;
> +#define I3C_MINORS (MINORMASK + 1)
> +
> +static void i3cdev_dev_release(struct device *dev)
> +{
> +	struct i3cdev_data *i3cdev = container_of(dev, struct i3cdev_data, dev);
> +
> +	ida_free(&i3cdev_ida, i3cdev->id);
> +	kfree(i3cdev);
> +}
> +
> +static struct i3cdev_data *i3cdev_get_by_i3c(struct i3c_device *i3c)
> +{
> +	struct i3cdev_data *i3cdev;
> +
> +	list_for_each_entry(i3cdev, &i3cdev_list, list) {
> +		if (i3cdev->i3c == i3c)
> +			return i3cdev;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct i3cdev_data *get_free_i3cdev(struct i3c_device *i3c)
> +{
> +	struct i3cdev_data *i3cdev;
> +	int id;
> +
> +	id = ida_alloc_max(&i3cdev_ida, MINORMASK, GFP_KERNEL);
> +	if (id < 0) {
> +		pr_err("i3cdev: no minor number available!\n");
> +		return ERR_PTR(id);
> +	}
> +
> +	i3cdev = kzalloc_obj(*i3cdev, GFP_KERNEL);
> +	if (!i3cdev) {
> +		ida_free(&i3cdev_ida, id);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	i3cdev->i3c = i3c;
> +	i3cdev->id = id;
> +	list_add_tail(&i3cdev->list, &i3cdev_list);
> +
> +	return i3cdev;
> +}
> +
> +static ssize_t
> +i3cdev_read(struct file *file, char __user *buf, size_t count, loff_t *f_pos)
> +{
> +	char *tmp __free(kfree) = NULL;
> +	struct i3cdev_data *i3cdev = file->private_data;
> +	struct i3c_xfer xfers = {
> +		.rnw = true,
> +	};
> +	struct i3c_device *i3c;
> +	int ret;
> +
> +	count = min_t(size_t, count, type_max(xfers.len));
> +	xfers.len = count;
> +
> +	tmp = kzalloc(count, GFP_KERNEL);

cleanup.h prefer declear tmp here

	char *tmp __free(kfree) = kzalloc(count, GFP_KERNEL);

check others

> +	if (!tmp)
> +		return -ENOMEM;
> +
> +	guard(mutex)(&i3cdev->xfer_lock);
> +	i3c = i3cdev->i3c;
> +	if (!i3c || i3c->dev.driver)
> +		return -ENODEV;
> +
> +	xfers.data.in = tmp;
> +
> +	dev_dbg(&i3c->dev, "Reading %zu bytes.\n", count);
> +
> +	ret = i3c_device_do_xfers(i3c, &xfers, 1, I3C_SDR);
> +	if (ret)
> +		return ret;
> +
> +	if (copy_to_user(buf, tmp, xfers.actual_len))
> +		return -EFAULT;
> +
> +	return xfers.actual_len;
> +}
> +
> +static ssize_t
> +i3cdev_write(struct file *file, const char __user *buf, size_t count,
> +	     loff_t *f_pos)
> +{
> +	void *tmp __free(kfree) = NULL;
> +	struct i3cdev_data *i3cdev = file->private_data;
> +	struct i3c_xfer xfers = {
> +		.rnw = false,
> +	};
> +	struct i3c_device *i3c;
> +	int ret;
> +
> +	count = min_t(size_t, count, type_max(xfers.len));
> +	xfers.len = count;
> +
> +	tmp = memdup_user(buf, count);
> +	if (IS_ERR(tmp))
> +		return PTR_ERR(tmp);
> +
> +	guard(mutex)(&i3cdev->xfer_lock);
> +	i3c = i3cdev->i3c;
> +	if (!i3c || i3c->dev.driver)
> +		return -ENODEV;
> +
> +	xfers.data.out = tmp;
> +
> +	dev_dbg(&i3c->dev, "Writing %zu bytes.\n", count);
> +
> +	ret = i3c_device_do_xfers(i3c, &xfers, 1, I3C_SDR);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static int
> +i3cdev_do_xfer(struct i3c_device *dev, struct i3c_ioc_xfer *xfers,
> +	       struct i3c_ioc_xfer __user *u_xfers, unsigned int nxfers)
> +{
> +	struct i3c_xfer *k_xfers __free(kfree) = NULL;
> +	enum i3c_xfer_mode mode = xfers[0].mode;
> +	u8 **data_ptrs;
> +	int i, j, nalloc, ret = 0;
> +
> +	/* Since we have nxfers we may allocate k_xfer + *data_ptrs together */
> +	k_xfers = kcalloc(nxfers, sizeof(*k_xfers) + sizeof(*data_ptrs),
> +			  GFP_KERNEL);
> +	if (!k_xfers)
> +		return -ENOMEM;
> +
> +	/* set data_ptrs to be after nxfers * i3c_xfer */
> +	data_ptrs = (void *)k_xfers + (nxfers * sizeof(*k_xfers));
> +
> +	for (i = 0; i < nxfers; i++) {
> +		bool is_read;
> +
> +		if (xfers[i].mode != mode) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		if (memchr_inv(xfers[i].pad, 0, sizeof(xfers[i].pad))) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		if (mode == I3C_SDR) {
> +			if (xfers[i].rnw != I3C_DEV_DIR_WRITE &&
> +			    xfers[i].rnw != I3C_DEV_DIR_READ) {
> +				ret = -EINVAL;
> +				break;
> +			}
> +			is_read = xfers[i].rnw == I3C_DEV_DIR_READ;
> +		} else {
> +			is_read = xfers[i].cmd & 0x80;
> +		}
> +
> +		if (is_read) {
> +			data_ptrs[i] = kzalloc(xfers[i].len, GFP_KERNEL);
> +			if (!data_ptrs[i]) {
> +				ret = -ENOMEM;
> +				break;
> +			}
> +			k_xfers[i].data.in = data_ptrs[i];
> +		} else {
> +			data_ptrs[i] = memdup_user(u64_to_user_ptr(xfers[i].data),
> +						   xfers[i].len);
> +			if (IS_ERR(data_ptrs[i])) {
> +				ret = PTR_ERR(data_ptrs[i]);
> +				break;
> +			}
> +			k_xfers[i].data.out = data_ptrs[i];
> +		}
> +
> +		k_xfers[i].cmd = xfers[i].cmd;
> +		k_xfers[i].len = xfers[i].len;
> +	}
> +	nalloc = i;
> +
> +	if (ret < 0)
> +		goto err_free_mem;
> +
> +	ret = i3c_device_do_xfers(dev, k_xfers, nxfers, mode);
> +	if (ret)
> +		goto err_free_mem;
> +
> +	for (i = 0; i < nxfers; i++) {
> +		bool is_read = (mode == I3C_SDR) ?
> +			       (xfers[i].rnw == I3C_DEV_DIR_READ) :
> +			       (xfers[i].cmd & 0x80);
> +
> +		if (is_read) {
> +			if (copy_to_user(u64_to_user_ptr(xfers[i].data),
> +					 data_ptrs[i], k_xfers[i].actual_len) ||
> +			    put_user(k_xfers[i].actual_len,
> +				     &u_xfers[i].actual_len)) {
> +				ret = -EFAULT;
> +				break;
> +			}
> +		}
> +	}
> +
> +err_free_mem:
> +	for (j = 0; j < nalloc; j++)
> +		kfree(data_ptrs[j]);
> +	return ret;
> +}
> +
> +static struct i3c_ioc_xfer *
> +i3cdev_get_ioc_xfer(unsigned int cmd, struct i3c_ioc_xfer __user *u_xfers,
> +		    unsigned int *nxfers)
> +{
> +	u32 tmp = _IOC_SIZE(cmd);
> +
> +	if ((tmp % sizeof(struct i3c_ioc_xfer)) != 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	*nxfers = tmp / sizeof(struct i3c_ioc_xfer);
> +	if (*nxfers == 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	return memdup_user(u_xfers, tmp);
> +}
> +
> +static int
> +i3cdev_ioc_xfer(struct i3c_device *i3c, unsigned int cmd,
> +		struct i3c_ioc_xfer __user *u_xfers)
> +{
> +	struct i3c_ioc_xfer *k_xfers __free(kfree) = NULL;
> +	unsigned int nxfers;
> +
> +	k_xfers = i3cdev_get_ioc_xfer(cmd, u_xfers, &nxfers);
> +	if (IS_ERR(k_xfers))
> +		return PTR_ERR(k_xfers);
> +
> +	return i3cdev_do_xfer(i3c, k_xfers, u_xfers, nxfers);
> +}
> +
> +static long
> +i3cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> +{
> +	struct i3cdev_data *i3cdev = file->private_data;
> +	struct i3c_device *i3c;
> +
> +	if (_IOC_TYPE(cmd) != I3C_DEV_IOC_MAGIC)
> +		return -ENOTTY;
> +
> +	/* Use the xfer_lock to prevent device detach during ioctl call */
> +	guard(mutex)(&i3cdev->xfer_lock);
> +	i3c = i3cdev->i3c;
> +	if (!i3c || i3c->dev.driver)
> +		return -ENODEV;
> +
> +	dev_dbg(&i3c->dev, "ioctl, cmd=0x%02x, arg=0x%02lx\n", cmd, arg);
> +
> +	/* Check command number and direction */
> +	if (_IOC_NR(cmd) == _IOC_NR(I3C_IOC_XFER(0)) &&
> +	    _IOC_DIR(cmd) == (_IOC_READ | _IOC_WRITE))
> +		return i3cdev_ioc_xfer(i3c, cmd,
> +				       (struct i3c_ioc_xfer __user *)arg);
> +
> +	return -ENOTTY;
> +}
> +
> +static int i3cdev_open(struct inode *inode, struct file *file)
> +{
> +	struct i3cdev_data *i3cdev = container_of(inode->i_cdev,
> +						  struct i3cdev_data,
> +						  cdev);
> +	file->private_data = i3cdev;
> +
> +	return 0;
> +}
> +
> +static int i3cdev_release(struct inode *inode, struct file *file)
> +{
> +	file->private_data = NULL;
> +
> +	return 0;
> +}
> +
> +static const struct file_operations i3cdev_fops = {
> +	.owner		= THIS_MODULE,
> +	.read		= i3cdev_read,
> +	.write		= i3cdev_write,
> +	.unlocked_ioctl	= i3cdev_ioctl,
> +	.compat_ioctl	= compat_ptr_ioctl,
> +	.open		= i3cdev_open,
> +	.release	= i3cdev_release,
> +};
> +
> +/* ------------------------------------------------------------------------- */
> +
> +static const struct class i3cdev_class = {
> +	.name = "i3cdev",
> +};
> +
> +static int i3cdev_attach(struct device *dev, void *dummy)
> +{
> +	struct i3cdev_data *i3cdev;
> +	struct i3c_device *i3c;
> +	int res;
> +
> +	if (dev->type == &i3c_masterdev_type)
> +		return 0;
> +
> +	i3c = dev_to_i3cdev(dev);
> +
> +	guard(mutex)(&i3cdev_attach_lock);
> +	if (dev->driver || i3cdev_get_by_i3c(i3c))
> +		return 0;
> +
> +	/* Get a device */
> +	i3cdev = get_free_i3cdev(i3c);
> +	if (IS_ERR(i3cdev))
> +		return PTR_ERR(i3cdev);
> +
> +	mutex_init(&i3cdev->xfer_lock);
> +	cdev_init(&i3cdev->cdev, &i3cdev_fops);
> +	i3cdev->cdev.owner = THIS_MODULE;
> +
> +	device_initialize(&i3cdev->dev);
> +	i3cdev->dev.devt = MKDEV(MAJOR(i3cdev_number), i3cdev->id);
> +	i3cdev->dev.class = &i3cdev_class;
> +	i3cdev->dev.parent = &i3c->dev;
> +	i3cdev->dev.release = i3cdev_dev_release;
> +
> +	res = dev_set_name(&i3cdev->dev, "bus!i3c!%s", dev_name(&i3c->dev));
> +	if (res)
> +		goto error_put_dev;
> +
> +	res = cdev_device_add(&i3cdev->cdev, &i3cdev->dev);
> +	if (res)
> +		goto error_put_dev;
> +
> +	pr_debug("i3cdev: I3C device [%s] registered as minor %d\n",
> +		 dev_name(&i3c->dev), i3cdev->id);
> +	return 0;
> +
> +error_put_dev:
> +	list_del(&i3cdev->list);
> +	put_device(&i3cdev->dev);
> +	return res;
> +}
> +
> +static int i3cdev_detach(struct device *dev, void *dummy)
> +{
> +	struct i3cdev_data *i3cdev;
> +	struct i3c_device *i3c;
> +
> +	if (dev->type == &i3c_masterdev_type)
> +		return 0;
> +
> +	i3c = dev_to_i3cdev(dev);
> +
> +	guard(mutex)(&i3cdev_attach_lock);
> +	i3cdev = i3cdev_get_by_i3c(i3c);
> +	if (!i3cdev)
> +		return 0;
> +
> +	list_del(&i3cdev->list);
> +
> +	/* Prevent transfers while cdev removal */
> +	scoped_guard(mutex, &i3cdev->xfer_lock)
> +		i3cdev->i3c = NULL;
> +
> +	cdev_device_del(&i3cdev->cdev, &i3cdev->dev);
> +	put_device(&i3cdev->dev);
> +
> +	pr_debug("i3cdev: device [%s] unregistered\n", dev_name(&i3c->dev));
> +
> +	return 0;
> +}
> +
> +static int i3cdev_notifier_call(struct notifier_block *nb,
> +				unsigned long action,
> +				void *data)
> +{
> +	struct device *dev = data;
> +
> +	switch (action) {
> +	case BUS_NOTIFY_ADD_DEVICE:
> +	case BUS_NOTIFY_UNBOUND_DRIVER:
> +	case BUS_NOTIFY_DRIVER_NOT_BOUND:
> +		i3cdev_attach(dev, NULL);
> +		break;
> +	case BUS_NOTIFY_DEL_DEVICE:
> +	case BUS_NOTIFY_REMOVED_DEVICE:
> +	case BUS_NOTIFY_BIND_DRIVER:
> +		i3cdev_detach(dev, NULL);
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block i3cdev_notifier = {
> +	.notifier_call = i3cdev_notifier_call,
> +};
> +
> +static int __init i3cdev_init(void)
> +{
> +	int res;
> +
> +	/* Dynamically request unused major number */
> +	res = alloc_chrdev_region(&i3cdev_number, 0, I3C_MINORS, "i3c");
> +	if (res)
> +		goto out;
> +
> +	/* Register device class to populate sysfs entries */
> +	res = class_register(&i3cdev_class);
> +	if (res)
> +		goto out_unreg_chrdev;
> +
> +	/* Keep track of busses which have devices to add or remove later */
> +	res = bus_register_notifier(&i3c_bus_type, &i3cdev_notifier);
> +	if (res)
> +		goto out_unreg_class;
> +
> +	/* Bind to already existing device without driver right away */
> +	i3c_for_each_dev(NULL, i3cdev_attach);
> +
> +	return 0;
> +
> +out_unreg_class:
> +	class_unregister(&i3cdev_class);
> +out_unreg_chrdev:
> +	unregister_chrdev_region(i3cdev_number, I3C_MINORS);
> +out:
> +	pr_err("%s: Driver Initialisation failed\n", __FILE__);
> +	return res;
> +}
> +
> +static void __exit i3cdev_exit(void)
> +{
> +	bus_unregister_notifier(&i3c_bus_type, &i3cdev_notifier);
> +	i3c_for_each_dev(NULL, i3cdev_detach);
> +	class_unregister(&i3cdev_class);
> +	unregister_chrdev_region(i3cdev_number, I3C_MINORS);
> +}
> +
> +MODULE_AUTHOR("Vitor Soares <soares@synopsys.com>");
> +MODULE_DESCRIPTION("I3C /dev entries driver");
> +MODULE_LICENSE("GPL");
> +
> +module_init(i3cdev_init);
> +module_exit(i3cdev_exit);
> diff --git a/include/uapi/linux/i3c/i3cdev.h b/include/uapi/linux/i3c/i3cdev.h
> new file mode 100644
> index 000000000000..69e901017378
> --- /dev/null
> +++ b/include/uapi/linux/i3c/i3cdev.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (c) 2020 Synopsys, Inc. and/or its affiliates.
> + * Copyright (c) 2026 Google LLC
> + *
> + * Author: Vitor Soares <vitor.soares@synopsys.com>
> + */
> +
> +#ifndef _UAPI_I3C_DEV_H_
> +#define _UAPI_I3C_DEV_H_
> +
> +#include <linux/types.h>
> +#include <linux/ioctl.h>
> +
> +/* IOCTL commands */
> +#define I3C_DEV_IOC_MAGIC	0x07
> +
> +#define I3C_DEV_DIR_WRITE	0
> +#define I3C_DEV_DIR_READ	1
> +
> +#define I3C_XFER_MODE_HDR_DDR	0
> +#define I3C_XFER_MODE_HDR_TSP	1
> +#define I3C_XFER_MODE_HDR_TSL	2
> +#define I3C_XFER_MODE_SDR	31
> +
> +/**
> + * struct i3c_ioc_xfer - I3C ioctl transfer
> + * @data: Holds pointer to userspace buffer with transmit/receive data.
> + * @len: Length of data buffer, in bytes.
> + * @actual_len: Actual length of data transferred on read, in bytes (output).
> + * @rnw: Transfer direction for SDR mode (I3C_DEV_DIR_WRITE or I3C_DEV_DIR_READ).
> + * @cmd: Command byte for HDR mode (0x00-0x7f write, 0x80-0xff read).
> + * @mode: Transfer mode (I3C_XFER_MODE_SDR, I3C_XFER_MODE_HDR_DDR, etc.).
> + * @pad: Reserved for future extensions; must be zeroed.
> + */
> +struct i3c_ioc_xfer {
> +	__u64 data;
> +	__u16 len;
> +	__u16 actual_len;
> +	union {
> +		__u8 rnw;
> +		__u8 cmd;
> +	};
> +	__u8 mode;
> +	__u8 pad[2];
> +};

Can we share the above information include MODE* with i3c system to avoid
duplicate it?

Frank

> +
> +#define __I3C_XFER_SIZE(type)	\
> +	((((sizeof(struct i3c_ioc_xfer)) * (type)) < (1 << _IOC_SIZEBITS)) \
> +	? ((sizeof(struct i3c_ioc_xfer)) * (type)) : 0)
> +
> +#define I3C_XFER_SIZE(N)	__I3C_XFER_SIZE(N)
> +
> +#define I3C_IOC_XFER(N)	\
> +	_IOC(_IOC_READ | _IOC_WRITE, I3C_DEV_IOC_MAGIC, 30, I3C_XFER_SIZE(N))
> +
> +#endif
> --
> 2.55.0.1082.g2b9226bbc0-goog
>
