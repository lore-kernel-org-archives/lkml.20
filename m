Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA2045560F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990733; cv=fail; b=NCVRxKC/KSRQlsjnxdZqp9B5HX/Y/wiqdXqdD2ikwQGiKPYSSxXc+3W3f+JVfPiuDeKhAEqaXenCayG9VZb6uHVGwyph/rsq9d4uMjtIqJonSn6vfVwfvkSRZt7nJGXunEutb21G4A83v/egIlDxPHW9J32Ux/+lfjz80mjBzd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990733; c=relaxed/simple;
	bh=WijsBKMvoD8O4wII/Un+iFjk3XHEEru6qg2bMeSfotY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BzB3LALj4j0Uzdz+6NI4GzbEAam4cXzhIKcpuQD/WVOMP1EQZIcTB+T8UxMJ7amYyE6rNiT05rUnEkVlEL1T6poAltQixRHzWKgJM0BjEcBXaWv1iZVCnXimObw4W5ro2w2R28noFaskAtXdDnpem+4jYl1cLhtbN8mB6VBB2A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JueGOe5+; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JueGOe5+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQMqmu1BZhwrEge7mqCpu4mRqN6BQHUXqUQG2CLa34b1a6u8cq3aUO/0GMTxIvWm+DF9NRO5VEgo/fCVDyZkdfwGGvzOqWU+0x7ISTq0j1NlddQchzT5QSftlF7oxcN0l3f9C4l1yxXXBbCMlIe2391t4jbgzLk+N3DcI2PEoLsg5acldGnuLrNPCQW53l9xsQPNscFKnYpxhapClIo3xIEibtHvP1K4LTAd+Ml/hP1OBW4eL9mLMWMsKrGQjrUMxB9oA1C8ciS//p6hW5omuRSBiMfPXuc24eXvo4RHJjaXslAZmIhN3fmKh4AeFJ1Ei2tH8WOCWsi4iNDGmfe/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7SJBtYkE3AzCdcA44jTnrdvNAfhN6ssyeKJHmro8xg=;
 b=TrCqF6y59eV0o9eiwVkR6wrMrtUj4oBrAbrEuHn7LuuRPZxfxRwX++UfQtjnwSqZ4DDSW+Oxyo5l1MpKEfgNuaLe+hofpp6QrDbNroue2i/ic1ieBI4+VuZO1RSs18MmcwV9JfU1ZJSo9cUKOTf2roI3jBI7kLgPVeXx6pAUq8Izn+Bxha45GUuwVzQloLgx/BEhGKO9me/22uyQURAI9AKkcbj0mW6TiLChHoV32kEcB2RPIsGGNC42YoejItv5wBmD9UnaiGU5NCuV1jbTu/86ho/ATcyX0GmCzc9H71INEBghA3Tx5MJpqOsXppo5Y0gI9HVND6hm0dyuJk4l0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7SJBtYkE3AzCdcA44jTnrdvNAfhN6ssyeKJHmro8xg=;
 b=JueGOe5+Y9mfQ71qGTOaukVot0PyD7fYwC4MFNu4iUNNGWuEnhdM93GtT6xcGJ7TrKmgctPoKlMz0R3N0Aok1GCpW3irIXJxNIeK91M0XZh0BuHA6ouySGkjNahDGmnKbFTy1vmYo3e+FLw7Ndgq9zMr5mr1aEVrwOYwamH6Fi+cRC9reJN5BRzQCP0xC+ZYsZ+uH+scofZwFILoQuU4q4BNG6pnAKW+OE+LVxSF3BLdaLCzsODYOf8hietfOI0D4X6skRk9dMOLDd1GRTLqNPMtvZ1Bu1Fa3+fshQINCBFzcefLygWJtrEC7AOyLcfYfe9eSMrsM+7bxNf7k1SelQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7521.eurprd04.prod.outlook.com (2603:10a6:20b:2df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 21:52:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 21:52:02 +0000
Date: Wed, 9 Sep 2026 17:51:55 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <aqHU-6RV_AapSu3M@lizhi-Precision-Tower-5810>
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906202747.4041389-4-samagazaryan@google.com>
X-ClientProxiedBy: PH2PEPF00003855.namprd17.prod.outlook.com
 (2603:10b6:518:1::75) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: dfde627d-e31d-436b-e08a-08df0ebc94e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|10067099003|3023799007|4143699003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	orGBLmKfkj8KtOwLL+umLUTWsgro329O39rAwSrjsRqwPVlDgB1fi1BNFzcMtgiGBZLnB80KRiuQC7yDMT0S85lHcGtHwpVuRPWtk4dC5145qiNRRtdKIGr9G0awUt1W/iNE4pBkrL6jxznEq6Nu5HAWH6MRNth9rYYeTq8n61Hzqp6t6tjnSe2FqCoWF7F3ovgedMw4SNmdowCV33dDdmbe4vXuKVzbPJKtsqTpdW0fTdPFkPhkHb2NyzDT/fOCsMvHVKQbQ9hUJJSEMo1KIpnbgYdCYCTGJUdBj2p/778hjD88mUc4RihTRP95lBI+V/01IMwjCedJ67hKLpLkAPwN5Kkp/QEKtxiEk3AmVs3Y2WOzy3I4TQTtodNycopOdjg7+09cGxip5jLvVBEg5dTknlgwJMm6N+fwrCoUvUt+uCOpfF95Uq9aXOfm3kJFXue/imaqCFSSXUGUWKF/AdJNtXpC+JCdLfawFlAc6AMTYp3HZzEnOt5+W8edbdkLWFm1aIEk12Bn2pnRSy0Oq6a979G4OVw+XmHYZ8ytWjypoRf5aXDSzFgAN1isMuM8kbFfg1HfYcVy1J7to/qreafM+NFHMo0nvGBjRxBPgth6pwN7qZaLir0dd54jACmoFzcfVK0N2sOhmt9CQJSNLRHnXB5249UuYudQ9PFJX94=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(10067099003)(3023799007)(4143699003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hE2lfpg6ZSjbpzBGJlWoi2IHcKuYMoc/vSV0MEQUSw/vdVzDqLbApU2CoXN1?=
 =?us-ascii?Q?6nIfp0yahu080wL8FliF4YaIxiUgY01v0IAtoiUkmyH4aRcoyXUVtqxFIFW/?=
 =?us-ascii?Q?EuaE6DdD9R7r8tdi/yGC/xr/uoR0ynnZwMDchig6IArJDKFqMRpNJqM/6YI4?=
 =?us-ascii?Q?8C9fiKvYqd8p44YqRSVWVCVr2X9WBGBN9Gzn6y0IFsnkgowjdcip4m3rbrA9?=
 =?us-ascii?Q?LaVf3s2GHSC1N6R52dkgsE7GynIKzRbAj0X+ZoxDZ6znj6JvvwugKeTq2RPM?=
 =?us-ascii?Q?cLNnLaO24ggv3uhuK/xndo7HQ//4cjS1QSS+p5w2zkORDTkr7M/zAjYEtxzK?=
 =?us-ascii?Q?cHTcSgePlnMfOgojio/W6p7GZjXkv//fJTsx5FDow7ktqTDmseJdQ2HffCux?=
 =?us-ascii?Q?rJBkoffUu5XWhA4MPpd53aE/WtXIoXQQ0z0PUH9B+oXPTjP9XT3PK7R8FDJw?=
 =?us-ascii?Q?LRhCiQSFdtQ88XerIHORjWapFrDvzyOcu3zPMzih3sWgo3SPlzmd9FN+sJiZ?=
 =?us-ascii?Q?s5VAm21HFJkUoXX8OEcxKfVJk8Ke3/s4LTVt1OMRsiq4mQlexhBGSSMzNbEl?=
 =?us-ascii?Q?LYE5KBc4sMUSEkICgM2OX5PNOUKto8CaSvr5+FwScthaGmnPVHQf4kjtf+Ba?=
 =?us-ascii?Q?jLIFyDRItjnDBH8yCrJbE8h6P3Yc/Ls4qbm95l3KNWvKwOtMjptODzohvV4H?=
 =?us-ascii?Q?Ta0PjjXk5iDprmcrCyiVMBkZvlZrNv4R82Z2UxtTQUZXup95FPNdH89DksRE?=
 =?us-ascii?Q?xHk7qXCv4VZvfTViz3NQGpRUspopeD1vNY3af8W6tZz5q0Fg5kRTLjrWGhXi?=
 =?us-ascii?Q?HIIHkaovC5ypi9XVMW9JALDsmyIeLmzVUPS+wcDd61RLL24mlq6CSCenvT/Z?=
 =?us-ascii?Q?mhoslX/PC980M6mVkC7KQ8F/PemmH9nUnKWAk6kPMvyt/HGzeDY/2iq9AZ14?=
 =?us-ascii?Q?mgS6MefaeH5S7HhYeriJQDQpIbVIjo1lKSxZ/3AK+bWfbQ96fCiqiP68kO1g?=
 =?us-ascii?Q?XnGpYjawlf4apIY0wr7yu2wKZofJ/GF4pKW4LMkurdE6UwZUkGEA1l0TNf4i?=
 =?us-ascii?Q?6qlXBbuHdfNPqq+SexyGTT2Gupd69jKNv+RNYo7ZKNifXqBbIrsUqPdtU4mK?=
 =?us-ascii?Q?u5d8LskmW1/HmOMXswMqBQTcqXwh1k2I6iZetyCiLo95eRp+0DNratKe+vUN?=
 =?us-ascii?Q?Hb8FHf/FVAUJYaq5aqDeh5+1ER8g/P258fEkZ6e6W5z7hI8eP53C3PrFnNvq?=
 =?us-ascii?Q?whvsf4V+F4ctfw3f6dRZ3px79EGtRemsatX9AtWRGV/dWSpDVxANYq8gjh9T?=
 =?us-ascii?Q?OcHu6XLMHktKG6oxCeXvXGC4NTNHhk8I0YTMu8OdH6eWHni3Y//qZYQOD2vo?=
 =?us-ascii?Q?xaVud3f7sfOWIZRzQzSIVkcdDhnWU9LnDMzwcyp9ORm0Fm6wYtPXVDkuGm/T?=
 =?us-ascii?Q?NH2+x6RSE0FXzDjqtUvBjhOqsLdHe+DyG5+IVGz2soeMD39gCmV3VTOTOboe?=
 =?us-ascii?Q?ZQjl7B2EK7gA/cbtoKC6yjiASq6Ra4x+bzaUzAWb6tuawI7hBQvkZWzmWhJa?=
 =?us-ascii?Q?Lu+STyUny9ZIW2hPyo9tbzVjF65zXwMwxPCGHAIdJzC/kbvRwfPW7hHwD0M8?=
 =?us-ascii?Q?nQKNMqHPpTBZTNsY5plybBdsA+oZ584In9CvXnJQQi5SqzR8raVczOOx0/zY?=
 =?us-ascii?Q?fs+9J5RFVCILzdwWxnpbKyCutfUHAi8AjYijy6P55wbvUVH2smEsD4EJziTZ?=
 =?us-ascii?Q?W85JaOWx4OBowcHs+7pV2JPEpcvIesepYCfEtF6pNvHYkrAI7kB4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfde627d-e31d-436b-e08a-08df0ebc94e7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:52:02.7639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLz1Wojx6fLZK8XgEzuv+KwBq9vpssiGIH4lBEkKjgGbM/P4l7nywm6sYtNuYhmoklAS9fOncl/VoWWShavjJTeEOhaMLM6xXK3oKfGJifmPVLKDMfHbd9rY/Pnl005Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7521

On Sun, Sep 06, 2026 at 08:27:47PM +0000, Sam Agazaryan wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
>
> This patch adds userspace character device support for I3C SDR private
> transfers via /dev.

Add userspace character device ...

Now frame already support HDR.

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
>   - Implements private SDR read/write transfers via I3C_IOC_PRIV_XFER ioctl
>     with 64-bit aligned UAPI data structures.

Consider PRIV for SDR, need unified HDR also,

I3C_IOC_XFER

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
>  drivers/i3c/i3cdev.c            | 445 ++++++++++++++++++++++++++++++++
>  include/uapi/linux/i3c/i3cdev.h |  37 +++
>  5 files changed, 495 insertions(+)
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
> index 000000000000..904ebfd48769
> --- /dev/null
> +++ b/drivers/i3c/i3cdev.c
> @@ -0,0 +1,445 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020 Synopsys, Inc. and/or its affiliates.

new post, should be 2026

> + *
> + * Author: Vitor Soares <soares@synopsys.com>
> + */
> +
> +#include <linux/cdev.h>
> +#include <linux/compat.h>
> +#include <linux/device.h>
> +#include <linux/fs.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +
> +#include <linux/i3c/i3cdev.h>
> +
> +#include "internals.h"
> +
> +struct i3cdev_data {
> +	struct i3c_device *i3c;
> +	struct device dev;
> +	struct mutex xfer_lock; /* prevent detach while transferring */
> +	struct cdev cdev;
> +	int id;
> +};
> +
> +static DEFINE_IDA(i3cdev_ida);
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
> +static struct i3cdev_data *get_free_i3cdev(struct i3c_device *i3c)
> +{
> +	struct i3cdev_data *i3cdev;
> +	int id;
> +
> +	id = ida_alloc(&i3cdev_ida, GFP_KERNEL);
> +	if (id < 0) {
> +		pr_err("i3cdev: no minor number available!\n");
> +		return ERR_PTR(id);
> +	}
> +
> +	i3cdev = kzalloc(sizeof(*i3cdev), GFP_KERNEL);

kzalloc_obj()

> +	if (!i3cdev) {
> +		ida_free(&i3cdev_ida, id);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	i3cdev->i3c = i3c;
> +	i3cdev->id = id;
> +	i3cdev_set_drvdata(i3c, i3cdev);
> +
> +	return i3cdev;
> +}
> +
> +static ssize_t
> +i3cdev_read(struct file *file, char __user *buf, size_t count, loff_t *f_pos)
> +{
> +	struct i3cdev_data *i3cdev = file->private_data;
> +	struct i3c_device *i3c;
> +	struct i3c_xfer xfers = {
> +		.rnw = true,
> +		.len = count,
> +	};
> +	int ret = -ENODEV;
> +	char *tmp;
> +
> +	mutex_lock(&i3cdev->xfer_lock);
> +	i3c = i3cdev->i3c;
> +	if (!i3c || i3c->dev.driver)
> +		goto err_out;
> +
> +	tmp = kzalloc(count, GFP_KERNEL);
> +	if (!tmp) {
> +		ret = -ENOMEM;
> +		goto err_out;
> +	}
> +
> +	xfers.data.in = tmp;
> +
> +	dev_dbg(&i3c->dev, "Reading %zu bytes.\n", count);
> +
> +	ret = i3c_device_do_xfers(i3c, &xfers, 1, I3C_SDR);

why force to SDR here.

> +	if (!ret)
> +		ret = copy_to_user(buf, tmp, xfers.len) ? -EFAULT : xfers.len;
> +
> +	kfree(tmp);
> +
> +err_out:
> +	mutex_unlock(&i3cdev->xfer_lock);
> +	return ret;
> +}
> +
> +static ssize_t
> +i3cdev_write(struct file *file, const char __user *buf, size_t count,
> +	     loff_t *f_pos)
> +{
> +	struct i3cdev_data *i3cdev = file->private_data;
> +	struct i3c_device *i3c;
> +	struct i3c_xfer xfers = {
> +		.rnw = false,
> +		.len = count,
> +	};
> +	int ret = -ENODEV;
> +	char *tmp;
> +
> +	mutex_lock(&i3cdev->xfer_lock);
> +	i3c = i3cdev->i3c;
> +	if (!i3c || i3c->dev.driver)
> +		goto err_out;
> +
> +	tmp = memdup_user(buf, count);
> +	if (IS_ERR(tmp)) {
> +		ret = PTR_ERR(tmp);
> +		goto err_out;
> +	}
> +
> +	xfers.data.out = tmp;
> +
> +	dev_dbg(&i3c->dev, "Writing %zu bytes.\n", count);
> +
> +	ret = i3c_device_do_xfers(i3c, &xfers, 1, I3C_SDR);
> +	kfree(tmp);
> +
> +err_out:
> +	mutex_unlock(&i3cdev->xfer_lock);

use cleanup guard()

> +	return (!ret) ? count : ret;
> +}
> +
> +static int
> +i3cdev_do_priv_xfer(struct i3c_device *dev, struct i3c_ioc_priv_xfer *xfers,
> +		    unsigned int nxfers)
> +{
> +	struct i3c_xfer *k_xfers;
> +	u8 **data_ptrs;
> +	int i, j, ret = 0;
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
> +		if (xfers[i].rnw) {
> +			data_ptrs[i] = kzalloc(xfers[i].len, GFP_KERNEL);
> +			if (!data_ptrs[i]) {
> +				ret = -ENOMEM;
> +				break;
> +			}
> +			k_xfers[i].rnw = true;
> +			k_xfers[i].data.in = data_ptrs[i];
> +		} else {
> +			data_ptrs[i] = memdup_user(u64_to_user_ptr(xfers[i].data),
> +						   xfers[i].len);
> +			if (IS_ERR(data_ptrs[i])) {
> +				ret = PTR_ERR(data_ptrs[i]);
> +				break;
> +			}
> +			k_xfers[i].rnw = false;
> +			k_xfers[i].data.out = data_ptrs[i];
> +		}
> +
> +		k_xfers[i].len = xfers[i].len;
> +	}
> +
> +	if (ret < 0)
> +		goto err_free_mem;
> +
> +	ret = i3c_device_do_xfers(dev, k_xfers, nxfers, I3C_SDR);
> +	if (ret)
> +		goto err_free_mem;
> +
> +	for (i = 0; i < nxfers; i++) {
> +		if (xfers[i].rnw) {
> +			if (copy_to_user(u64_to_user_ptr(xfers[i].data),
> +					 data_ptrs[i], xfers[i].len))

Use actual_len,

> +				ret = -EFAULT;
> +		}
> +	}
> +
> +err_free_mem:
> +	for (j = 0; j < i; j++)
> +		kfree(data_ptrs[j]);
> +	kfree(k_xfers);


use clean up __free(kfree) when alloc.

> +	return ret;
> +}
> +
> +static struct i3c_ioc_priv_xfer *
> +i3cdev_get_ioc_priv_xfer(unsigned int cmd, struct i3c_ioc_priv_xfer *u_xfers,
> +			 unsigned int *nxfers)
> +{
> +	u32 tmp = _IOC_SIZE(cmd);
> +
> +	if ((tmp % sizeof(struct i3c_ioc_priv_xfer)) != 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	*nxfers = tmp / sizeof(struct i3c_ioc_priv_xfer);
> +	if (*nxfers == 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	return memdup_user(u_xfers, tmp);
> +}
> +
> +static int
> +i3cdev_ioc_priv_xfer(struct i3c_device *i3c, unsigned int cmd,
> +		     struct i3c_ioc_priv_xfer *u_xfers)
> +{
> +	struct i3c_ioc_priv_xfer *k_xfers;
> +	unsigned int nxfers;
> +	int ret;
> +
> +	k_xfers = i3cdev_get_ioc_priv_xfer(cmd, u_xfers, &nxfers);
> +	if (IS_ERR(k_xfers))
> +		return PTR_ERR(k_xfers);
> +
> +	ret = i3cdev_do_priv_xfer(i3c, k_xfers, nxfers);
> +
> +	kfree(k_xfers);
> +
> +	return ret;
> +}
> +
> +static long
> +i3cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> +{
> +	struct i3cdev_data *i3cdev = file->private_data;
> +	struct i3c_device *i3c;
> +	int ret = -ENODEV;
> +
> +	if (_IOC_TYPE(cmd) != I3C_DEV_IOC_MAGIC)
> +		return -ENOTTY;
> +
> +	/* Use the xfer_lock to prevent device detach during ioctl call */
> +	mutex_lock(&i3cdev->xfer_lock);
> +	i3c = i3cdev->i3c;
> +	if (!i3c || i3c->dev.driver)
> +		goto err_no_dev;
> +
> +	dev_dbg(&i3c->dev, "ioctl, cmd=0x%02x, arg=0x%02lx\n", cmd, arg);
> +
> +	/* Check command number and direction */
> +	if (_IOC_NR(cmd) == _IOC_NR(I3C_IOC_PRIV_XFER(0)) &&
> +	    _IOC_DIR(cmd) == (_IOC_READ | _IOC_WRITE))
> +		ret = i3cdev_ioc_priv_xfer(i3c, cmd,
> +					(struct i3c_ioc_priv_xfer __user *)arg);
> +	else
> +		ret = -ENOTTY;
> +
> +err_no_dev:
> +	mutex_unlock(&i3cdev->xfer_lock);
> +	return ret;
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
> +	if (dev->type == &i3c_masterdev_type || dev->driver)
> +		return 0;
> +
> +	i3c = dev_to_i3cdev(dev);
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
> +	i3cdev_set_drvdata(i3c, NULL);
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
> +	i3cdev = i3cdev_get_drvdata(i3c);
> +	if (!i3cdev)
> +		return 0;
> +
> +	i3cdev_set_drvdata(i3c, NULL);
> +
> +	/* Prevent transfers while cdev removal */
> +	mutex_lock(&i3cdev->xfer_lock);
> +	i3cdev->i3c = NULL;
> +	mutex_unlock(&i3cdev->xfer_lock);
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
> +		return i3cdev_attach(dev, NULL);

Does all i3c devices attach this driver?

> +	case BUS_NOTIFY_DEL_DEVICE:
> +	case BUS_NOTIFY_REMOVED_DEVICE:
> +	case BUS_NOTIFY_BIND_DRIVER:
> +		return i3cdev_detach(dev, NULL);
> +	}
> +
> +	return 0;
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
> index 000000000000..5adc1e3e7c4f
> --- /dev/null
> +++ b/include/uapi/linux/i3c/i3cdev.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (c) 2020 Synopsys, Inc. and/or its affiliates.
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
> +/**
> + * struct i3c_ioc_priv_xfer - I3C SDR ioctl private transfer
> + * @data: Holds pointer to userspace buffer with transmit data.
> + * @len: Length of data buffer buffers, in bytes.
> + * @rnw: encodes the transfer direction. true for a read, false for a write
> + */
> +struct i3c_ioc_priv_xfer {
> +	__u64 data;
> +	__u16 len;
> +	__u8 rnw;

In HDR mode,  rnw is command.

> +	__u8 pad[5];
> +};
> +
> +#define I3C_PRIV_XFER_SIZE(N)	\
> +	((((sizeof(struct i3c_ioc_priv_xfer)) * (N)) < (1 << _IOC_SIZEBITS)) \
> +	? ((sizeof(struct i3c_ioc_priv_xfer)) * (N)) : 0)
> +
> +#define I3C_IOC_PRIV_XFER(N)	\
> +	_IOC(_IOC_READ|_IOC_WRITE, I3C_DEV_IOC_MAGIC, 30, I3C_PRIV_XFER_SIZE(N))

I3C_IOC_SDR_XFER, support DDR, TSP, TSL future.

Frank
> +
> +#endif
> --
> 2.55.0.979.g7e5102b832-goog
>
