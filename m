Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010011.outbound.protection.outlook.com [52.101.69.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C434F4CFB;
	Mon, 21 Sep 2026 18:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016155; cv=fail; b=jUK+zAZgL8+LSbfeqMX5iTKUoYBjJ1FzX5mivmWY2AX43OFszu2rAOr2fX3j4O4qozGoLdL4lWGPyksfIivHR2Taca8zSWxTkI5OkInWCXtWeHBe1mhSKN4h7ETW0cRQ2D7aJfjLWePcidWlPtp3TncJP/O9rxtLodCJSuYgp7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016155; c=relaxed/simple;
	bh=UnLrzxxbfTOzTKFCfmNYdtp/d/V9ZN7f6c1ICUgxXnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dNY7M8CthM3fKaCwFY+i/XQpiMHDz/q+dZPVQrgKBRbqx32xP47mrDAdl0ee/NKgeLQcj7grObEshne1u1F1dFcXXkq4WiExBYjFIZ28AURwOCN9S42Z4PN1tItoi2PXGMa0P8mng/cdx5b/UDdmSAbB/19viOmravFzS9VIHl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jMhESKex; arc=fail smtp.client-ip=52.101.69.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jMhESKex"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmdDLrXiYcKrC7hiSFN/QFSRvijZxSQQkNWI2KhnYwB7IdDklSXBQtTrTu91kfJa9Q9mg/0Eqb1DiNa9bdWK0I6mnLhcgkoHUMlC6dlHMsTuk2uiWFaY9Y0CMyXP8cvJcNTCvU0FGGMYLyViVH1XPreDgAtvk3/3vYcbbJkufR0xopP9O79xyqd8MlNR3sRhg1k6D1Z0iOKNqmLtTr/MjBUGFKddHsKAxZYAtEY3JuXcBW0gjHeLoxYcW9aHazJYdkG9IwzL+pG9/UMIprQYi4g1FZEue3GXNWidQg0S7Nmf/uDU4IlO4OtRdIYzWieGDS/Xhsxgo567SdMrb39BJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTLWjyYcjIzJy2vG6vETbQujy0BaTLG3foR8/dCX1qo=;
 b=vGhj5WJAMjkGISEEQsSQe16Oy1V+qjfxMpekt7HpErazU3LsK0BhklZ9Shb/c3RtdLbmyd+gU8NUoaPrjZ2hs7xMjKHcDPa3CqG8urgtyT5COlCmf/EyH62yAwKGInrWFeZeNJjnT/C0hQlB5sQRq7xfFpGdaBxIQLxRiLsvW8tDjpncUIlfkTBTzdG7XlZ+n6XDU51TkguT15jy55WwgFF0BEU7a7qmmX+auogr+jnFJLkliOrBUrLcFTabSCS39MkBsFa+05ofqe5rHLzhgSv0RKkkdhT2hI+CBTaPvuN178Ydx0vMQ5JyeZe9q10KWny422U88EQG4aQfXaF/4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTLWjyYcjIzJy2vG6vETbQujy0BaTLG3foR8/dCX1qo=;
 b=jMhESKexKxi9ge5nl4uysgPJzOudxfqqwSBMDjr0KNf8SkbZLvixbNfZIGmymufJvTznloucZqF5C6Q5ockckhGWb+tC/dSCElIBmadLgkTrN2EP1rucpGLjkb0waJf+9d/RIdtgBC6q1wrq/krXV6fXhWHn1lMmdYP59fdLGOAgWC8jhSIziQMd61F/45/IcgEFiwU0K9zjAvmF7VDRHm9+waUpxjxvgrM44g/F4RM3Er5J2sesrsKDw3J3rikIz6rGrXc44zcM7LqqaMfrLdEhuO70xKErjw+YJlOFeSLAtOZ+1z4VCDZGAQbxZnVGaswbOuqZcXuLYnBQXzvNZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB11065.eurprd04.prod.outlook.com (2603:10a6:150:227::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 18:42:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 18:42:26 +0000
Date: Mon, 21 Sep 2026 14:42:17 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: zain_zhou@realsil.com.cn
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	Lakshay Piplani <lakshay.piplani@nxp.com>,
	devicetree@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
	Wei Wang <wei_wang@realsil.com.cn>
Subject: Re: [RFC PATCH 4/4] i3c: hub: Add Realtek RTS490x I3C hub support
Message-ID: <arF6ifEpWAlO10B3@lizhi-Precision-Tower-5810>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
 <20260920100501.4091351-5-zain_zhou@realsil.com.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920100501.4091351-5-zain_zhou@realsil.com.cn>
X-ClientProxiedBy: CYXP220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:ee::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB11065:EE_
X-MS-Office365-Filtering-Correlation-Id: cb731d64-0000-4c81-1735-08df18101505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|1800799024|376014|19092799006|10067099003|3023799007|6133799003|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	nkhn7QFHf7gIolsjmvy5tvdS0C21p3MYU/4RbCb+5q3NW6LnkR9QhRXgLFtZPR22fg5NwlgsISbY6ZEWEdHWbE3k17ctGFExKPdAAIyTkgjXolL6OtgPd6Vsi+uucbOkpTl3yQqr6AxeRt5/pjoHGNQgMJ6+N4jJTk0zf+PtU57h3EuLBlXvrn6upPDrtSW0qXet6Cjqawg0B8TyIE2IioVAMjKXcLKSqbHt9VCQLGQyABTRKy63JBobE4E/K3sxExC0ikJpGmOU6M4koW8QFVK/0klGWDH/4CD/AXMo33GUgtGYoEotbw28dLjq5c9w5S5b+/aOX3urNAqiDaS/GkKpZFLvPOQedlEbVUCb0Yk15suTfobsACFinbrgAqvmG3xhTEmtJgW3A0OByMm0MGB8kl6ROKh4rxCgz5VGS7IPy3jDTFF9hmQNfAJewHOGXLHUe4w3VkF++J9SpRG382zM5m+jkW7ZnhpBVWvm85NUOs/NCiQhk+peCnEYMxekhSDrTo5JTch6R9nHcm1lIvpeGtI0TQoAKf85GqbxPcIf3zrn000/fZt5g8Lx4f1A678DcfWbthKkEvr4OmfE6KSZ0/QWVxmlga+YHMqs6xkFA75uV53EE+/q6x39X8PK/f4FOU6PBnBOIYkG3wNz4JDE5NFdNbzhnDtvkJg61Dw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(1800799024)(376014)(19092799006)(10067099003)(3023799007)(6133799003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D3DHCq53LvSWQ8izMNMUZ4H20ZgUSERmcotQBHLIfg6oEdpIu/iFYtO7BBli?=
 =?us-ascii?Q?psM5QDa6Pv9bzybry59rvNtdKs04Fr471sXkRJC8b88x+4fWCch3pd6t7S37?=
 =?us-ascii?Q?BOSCrXdZ7pZIM5WiBx1MvWlinxtXcQNHw84tfeIZyAxWs7TZg2mHXgHntKkU?=
 =?us-ascii?Q?f5K5Xcm7yN9afki6ILvhkbYGLoV288qaXrhlrm9CZdRCZ0lJibVbLDlSVhnv?=
 =?us-ascii?Q?xJh0wyYZ5UFY1XvkJjR0kXwHXMPkyOu4ya5Qy8ZROCwdlwlL3CqrrZRQRDsm?=
 =?us-ascii?Q?6ipIVVXN1Dkn5vzdTBB47Tu8xAwyr/LOa9WoMf2M8KSBYarIC1dxt2+1jOvX?=
 =?us-ascii?Q?vUwFLoKveG4bbLpBNgd7bqZ5LbTwvOFTgsqW2HHn00QBXJh737PjnXL1V1rD?=
 =?us-ascii?Q?ZFaT+aIPJKBYHdK2fPMcAb/L2s4FmG/ZwOlioObKPez9xxYVTyqbqhi/CsJZ?=
 =?us-ascii?Q?LCc9S2TIoOSmmD0Q81lQ/KdH75udjAgJFZzyD4O2t6CEVcohvKvhIGicjLtB?=
 =?us-ascii?Q?cB3gHtkSdpqwMKgEU1wOi/FrUpIymRiuV4y3LAjRk18MOvtEeo9ZY0h4Rp+3?=
 =?us-ascii?Q?ptKcTViJP5eCyh6iFTMBJhNwZgxJMrhnNGuETEg5rrRZK1ma0FK29aIynnIP?=
 =?us-ascii?Q?MyB79w1ypOdY5kztjtj5IoFzcNVHOPtp3Umwiq1wAZ6S2cZypiJ5SBI0K51K?=
 =?us-ascii?Q?mqaJLVtzd7sD2nl+asnfyULMjyalteKD59M3iCkjt58AIw5MvXqH/MwHmFSc?=
 =?us-ascii?Q?cjUQ0iMXPk3YyQRgjsg4dg9GBNpxT3GvJObe+qnSdBxMbIiSNnFpKuIzXPQg?=
 =?us-ascii?Q?thX6zN8NZvvG2jTnvDx/YLmQfHCXtAzv+IMCf9Uwv8aMFr23j/Wfme1s4y0n?=
 =?us-ascii?Q?qLJv/jv7V3CjK8hroqAN4/EEHCTKrl6UJwQ4ZeaVmrMxW4bS8ZDEpgQVUxf5?=
 =?us-ascii?Q?v7nqMBly1lkC13ds4oR+7vmADN1tlUACAoKpTgoAwXIEwCrqIje06LWbRkeK?=
 =?us-ascii?Q?p2IuvOXklU6mIirjAPMMKhBJa7TbOiA1+O741ZuG+yl8uXCYd1yYy81yfd5l?=
 =?us-ascii?Q?F+KMrE12Wc+8O0VfvmzP9ryK0QFjBroqdsi6ycL26csaAfwZ3Q5hHKw4IgSh?=
 =?us-ascii?Q?eMjvedyxTyJthfG9BvGURs7jFuG+MqyF+SbXtrdQUoDlLWmVYw9t6sh5DqW0?=
 =?us-ascii?Q?GAFWuIldF4DGMr3JAIzgLoeZ0IU43byP4ITDZLRpoNPOcNxilsIm13Mu2/k6?=
 =?us-ascii?Q?j+fLz4q5eYgzRhnhEvDryjf/f6Z1E1gPIPEHG4KAAiLOoKC9cLE95JS6ulGH?=
 =?us-ascii?Q?mgqnDtJ6Lhj9xQ1aqFMo63St8wzXHmQxz3Nl6xnC5mXk6YN+fBtJWJRLSor/?=
 =?us-ascii?Q?Kp/6zQQsGONp9oUl1k8fJ+3S3kxCy/cLPXy/tApMsQmndgTAdIIJ+VYXpXzB?=
 =?us-ascii?Q?2r6milWbnIHRRXBY/Gpndx3Rh9M+5SyNpqje8UpY+2INVha7BblNP2l3Wp9+?=
 =?us-ascii?Q?Rc01yOUWdUkB8DvOvl91EMMDhG4MbrpRznjlPXl5HU24AFCZFcuZ8KS2JB88?=
 =?us-ascii?Q?43zwMSMrXxw5MxLfZFyhmWsF6RrrjrSl433RYsQChNTiQvAic9I7Za2J/BR4?=
 =?us-ascii?Q?lxqks+jZKwPLT4j6zHHu2bsupZUKJT8+1yHefazS6MAbKA5w6v5ciW0XVl8G?=
 =?us-ascii?Q?FCf4HEWoGZuaVBsk9PNBBwL3d0AzJvpAPnBuo+HGQlnLVaFJgqQfCfZN4WV8?=
 =?us-ascii?Q?tv+eKd44ueZUQiz4bYm+i3gFa2tElhX5jMIQk/jTMpPXkLguplqK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb731d64-0000-4c81-1735-08df18101505
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 18:42:26.4358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUN4PjUCWn0xZqB5MwEZ5LQp+FZekrnsAWI4mVZ97uR2Tao6PEyOx7pme3B0vz72fnas4UN+lhdTjgPtupBzRZu/VlunRi07wF1Cp8DlxOK0urIRa2H7pZejsb0EPxE8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11065

On Sun, Sep 20, 2026 at 06:05:01PM +0800, zain_zhou@realsil.com.cn wrote:
> From: Yin Zhou <zain_zhou@realsil.com.cn>
>
> Add I3C and SMBus downstream port support for the Realtek RTS490x
> family of I3C hubs.
>
> I3C ports are exposed through the generic I3C hub framework. SMBus
> ports are exposed as Linux I2C adapters and support controller-agent
> transfers and target receive events through the hub IBI.
>
> Signed-off-by: Yin Zhou <zain_zhou@realsil.com.cn>
> ---
>  MAINTAINERS                             |   1 +
>  drivers/i3c/hub/Kconfig                 |  11 +
>  drivers/i3c/hub/Makefile                |   3 +
>  drivers/i3c/hub/rts490x-i3c-hub-core.c  | 444 +++++++++++++
>  drivers/i3c/hub/rts490x-i3c-hub-i3c.c   | 150 +++++
>  drivers/i3c/hub/rts490x-i3c-hub-smbus.c | 839 ++++++++++++++++++++++++
>  drivers/i3c/hub/rts490x-i3c-hub.h       | 150 +++++
>  7 files changed, 1598 insertions(+)
>  create mode 100644 drivers/i3c/hub/rts490x-i3c-hub-core.c
>  create mode 100644 drivers/i3c/hub/rts490x-i3c-hub-i3c.c
>  create mode 100644 drivers/i3c/hub/rts490x-i3c-hub-smbus.c
>  create mode 100644 drivers/i3c/hub/rts490x-i3c-hub.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6e7cb4ca92f6..761a9d16305b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22998,6 +22998,7 @@ L:	linux-i3c@lists.infradead.org
>  L:	linux-kernel@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/realtek,rts490x.yaml
> +F:	drivers/i3c/hub/rts490x*
>  F:	drivers/mfd/rts490x-core.c
>  F:	drivers/regulator/rts490x-regulator.c
>  F:	include/linux/mfd/rts490x.h
> diff --git a/drivers/i3c/hub/Kconfig b/drivers/i3c/hub/Kconfig
> index 969bb1f637dd..e5f618d08c49 100644
> --- a/drivers/i3c/hub/Kconfig
> +++ b/drivers/i3c/hub/Kconfig
> @@ -9,3 +9,14 @@ config P3H2X4X_I3C_HUB
>  	  connect to a host via I3C/I2C/SMBus and allow communication with
>  	  multiple downstream peripherals. Say Y or M here to enable the
>  	  P3H2x4x I3C HUB driver.
> +
> +config RTS490X_I3C_HUB
> +	tristate "Realtek RTS490x I3C hub support"
> +	depends on MFD_RTS490X
> +	depends on I2C
> +	select I3C_HUB
> +	help
> +	  Enable support for the I3C and SMBus target ports provided by
> +	  Realtek RTS490x I3C hub devices. I3C ports are exposed through
> +	  the generic I3C hub framework, while SMBus ports are exposed as
> +	  Linux I2C adapters.
> diff --git a/drivers/i3c/hub/Makefile b/drivers/i3c/hub/Makefile
> index 9dbd8a7b4184..e9c8de3c021a 100644
> --- a/drivers/i3c/hub/Makefile
> +++ b/drivers/i3c/hub/Makefile
> @@ -2,3 +2,6 @@
>  # Copyright 2025 NXP
>  p3h2840_i3c_hub-y := p3h2840_i3c_hub_common.o p3h2840_i3c_hub_i3c.o p3h2840_i3c_hub_smbus.o
>  obj-$(CONFIG_P3H2X4X_I3C_HUB)	+= p3h2840_i3c_hub.o
> +rts490x_i3c_hub-y := rts490x-i3c-hub-core.o rts490x-i3c-hub-i3c.o \
> +			 rts490x-i3c-hub-smbus.o
> +obj-$(CONFIG_RTS490X_I3C_HUB)	+= rts490x_i3c_hub.o
> diff --git a/drivers/i3c/hub/rts490x-i3c-hub-core.c b/drivers/i3c/hub/rts490x-i3c-hub-core.c
> new file mode 100644
> index 000000000000..b26977066ac7
> --- /dev/null
> +++ b/drivers/i3c/hub/rts490x-i3c-hub-core.c
> @@ -0,0 +1,444 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2025-2026 Realtek Semiconductor Corp. */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/i3c/device.h>
> +#include <linux/iopoll.h>
> +#include <linux/mfd/rts490x.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/util_macros.h>
> +
> +#include "rts490x-i3c-hub.h"
> +
> +#define RTS490X_TP_ENABLE			0x12
> +#define RTS490X_IO_STRENGTH			0x14
> +#define RTS490X_TP_IO_MODE_CONF			0x17
> +#define RTS490X_TP_SMBUS_AGENT_ENABLE		0x18
> +#define RTS490X_CP_MUX_SET			0x38
> +#define RTS490X_CP_MUX_STATUS			0x39
> +#define RTS490X_CONTROLLER_PORT_MUX_REQ		BIT(0)
> +#define RTS490X_CONTROLLER_PORT_MUXED		BIT(0)
> +#define RTS490X_TP_PULLUP_ENABLE		0x53
> +#define RTS490X_ONCHIP_TD_AND_SMBUS_AGENT_CONF	0x6c
> +#define RTS490X_TARGET_AGENT_BUF_FULL_SDA_LOW_EN	BIT(5)
> +

This register is the exactly same as P3H2X4X. Can you direct reuse
p3h2x*'s driver.

Frank

> +#define RTS490X_TP0145_IO_STRENGTH_MASK	GENMASK(1, 0)
> +#define RTS490X_TP2367_IO_STRENGTH_MASK	GENMASK(3, 2)
> +#define RTS490X_CP0_IO_STRENGTH_MASK	GENMASK(5, 4)
> +#define RTS490X_CP1_IO_STRENGTH_MASK	GENMASK(7, 6)
> +#define RTS490X_TP0145_PULLUP_MASK	GENMASK(7, 6)
> +#define RTS490X_TP2367_PULLUP_MASK	GENMASK(5, 4)
> +
> +#define RTS490X_SMBUS_DEFAULT_FREQUENCY		400000
> +#define RTS490X_CP_MUX_POLL_US			100
> +#define RTS490X_CP_MUX_TIMEOUT_US		100000
> +
> +static void rts490x_put_port_fwnodes(void *data)
> +{
> +	struct rts490x_hub *hub = data;
> +	int i;
> +
> +	for (i = 0; i < hub->rts490x->num_target_ports; i++) {
> +		fwnode_handle_put(hub->ports[i].fwnode);
> +		hub->ports[i].fwnode = NULL;
> +	}
> +}
> +
> +static void rts490x_clear_hub_backpointer(void *data)
> +{
> +	struct rts490x *rts490x = data;
> +
> +	rts490x->hub = NULL;
> +}
> +
> +static int rts490x_read_config(struct rts490x_hub *hub)
> +{
> +	struct rts490x_config *config = &hub->config;
> +	struct device *dev = hub->dev;
> +
> +	config->tp0145_pullup_configured =
> +		!device_property_read_u32(dev, "realtek,tp0145-pullup-ohms",
> +					  &config->tp0145_pullup_ohms);
> +	config->tp2367_pullup_configured =
> +		!device_property_read_u32(dev, "realtek,tp2367-pullup-ohms",
> +					  &config->tp2367_pullup_ohms);
> +	config->cp0_io_strength_configured =
> +		!device_property_read_u32(dev, "realtek,cp0-io-strength-ohms",
> +					  &config->cp0_io_strength_ohms);
> +	config->cp1_io_strength_configured =
> +		!device_property_read_u32(dev, "realtek,cp1-io-strength-ohms",
> +					  &config->cp1_io_strength_ohms);
> +	config->tp0145_io_strength_configured =
> +		!device_property_read_u32(dev, "realtek,tp0145-io-strength-ohms",
> +					  &config->tp0145_io_strength_ohms);
> +	config->tp2367_io_strength_configured =
> +		!device_property_read_u32(dev, "realtek,tp2367-io-strength-ohms",
> +					  &config->tp2367_io_strength_ohms);
> +
> +	return 0;
> +}
> +
> +static int rts490x_parse_ports(struct rts490x_hub *hub)
> +{
> +	struct device_node *node = dev_of_node(hub->dev);
> +	struct rts490x_port *port;
> +	u64 index;
> +	int ret;
> +
> +	for_each_available_child_of_node_scoped(node, child) {
> +		enum rts490x_port_mode mode;
> +
> +		if (of_node_name_eq(child, "i3c"))
> +			mode = RTS490X_PORT_I3C;
> +		else if (of_node_name_eq(child, "smbus"))
> +			mode = RTS490X_PORT_SMBUS;
> +		else
> +			continue;
> +
> +		ret = of_property_read_reg(child, 0, &index, NULL);
> +		if (ret)
> +			return dev_err_probe(hub->dev, ret,
> +					     "failed to read reg for %pOF\n", child);
> +
> +		if (index >= hub->rts490x->num_target_ports)
> +			return dev_err_probe(hub->dev, -EINVAL,
> +					     "invalid target port %llu\n", index);
> +
> +		port = &hub->ports[index];
> +		if (port->fwnode)
> +			return dev_err_probe(hub->dev, -EINVAL,
> +					     "duplicate target port %llu\n", index);
> +
> +		port->fwnode = fwnode_handle_get(of_fwnode_handle(child));
> +		port->hub = hub;
> +		port->index = index;
> +		port->mask = BIT(index);
> +		port->mode = mode;
> +		port->pullup_enabled =
> +			of_property_read_bool(child, "realtek,pullup-enable");
> +
> +		if (mode == RTS490X_PORT_SMBUS) {
> +			port->clock_frequency = RTS490X_SMBUS_DEFAULT_FREQUENCY;
> +			of_property_read_u32(child, "clock-frequency",
> +					     &port->clock_frequency);
> +			if (!rts490x_smbus_frequency_supported(port->clock_frequency))
> +				return dev_err_probe(hub->dev, -EINVAL,
> +						     "unsupported SMBus frequency %u Hz on port %llu\n",
> +						     port->clock_frequency, index);
> +		}
> +
> +		if (mode == RTS490X_PORT_I3C)
> +			hub->i3c_port_mask |= port->mask;
> +		else
> +			hub->smbus_port_mask |= port->mask;
> +	}
> +
> +	return 0;
> +}
> +
> +static u8 rts490x_pullup_to_reg(u32 pullup_ohms)
> +{
> +	static const int pullup_table[] = { 250, 500, 1000, 2000 };
> +
> +	return find_closest(pullup_ohms, pullup_table,
> +			    ARRAY_SIZE(pullup_table));
> +}
> +
> +static u8 rts490x_io_strength_to_reg(u32 io_strength_ohms)
> +{
> +	static const int io_strength_table[] = { 20, 30, 40, 50 };
> +
> +	return find_closest(io_strength_ohms, io_strength_table,
> +			    ARRAY_SIZE(io_strength_table));
> +}
> +
> +static int rts490x_enable_supplies(struct rts490x_hub *hub)
> +{
> +	static const char * const supplies[] = {
> +		"vcc-cp0",
> +		"vcc-cp1",
> +		"vcc-tp0145",
> +		"vcc-tp2367",
> +	};
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(supplies); i++) {
> +		ret = devm_regulator_get_enable_optional(hub->dev, supplies[i]);
> +		if (ret && ret != -ENODEV)
> +			return dev_err_probe(hub->dev, ret,
> +					     "failed to enable %s supply\n",
> +					     supplies[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rts490x_configure_pullups(struct rts490x_hub *hub)
> +{
> +	struct rts490x_config *config = &hub->config;
> +	u8 mask = 0;
> +	u8 pullup = 0;
> +
> +	if (config->tp0145_pullup_configured) {
> +		mask |= RTS490X_TP0145_PULLUP_MASK;
> +		pullup |= FIELD_PREP(RTS490X_TP0145_PULLUP_MASK,
> +				      rts490x_pullup_to_reg(config->tp0145_pullup_ohms));
> +	}
> +
> +	if (config->tp2367_pullup_configured) {
> +		mask |= RTS490X_TP2367_PULLUP_MASK;
> +		pullup |= FIELD_PREP(RTS490X_TP2367_PULLUP_MASK,
> +				      rts490x_pullup_to_reg(config->tp2367_pullup_ohms));
> +	}
> +
> +	return regmap_update_bits(hub->regmap, RTS490X_LDO_AND_PULLUP_CONF,
> +				  mask, pullup);
> +}
> +
> +static int rts490x_configure_io_strength(struct rts490x_hub *hub)
> +{
> +	struct rts490x_config *config = &hub->config;
> +	u8 strength = 0;
> +	u8 mask = 0;
> +
> +	if (config->cp0_io_strength_configured) {
> +		u8 value = rts490x_io_strength_to_reg(config->cp0_io_strength_ohms);
> +
> +		mask |= RTS490X_CP0_IO_STRENGTH_MASK;
> +		strength |= FIELD_PREP(RTS490X_CP0_IO_STRENGTH_MASK, value);
> +	}
> +
> +	if (config->cp1_io_strength_configured) {
> +		u8 value = rts490x_io_strength_to_reg(config->cp1_io_strength_ohms);
> +
> +		mask |= RTS490X_CP1_IO_STRENGTH_MASK;
> +		strength |= FIELD_PREP(RTS490X_CP1_IO_STRENGTH_MASK, value);
> +	}
> +
> +	if (config->tp0145_io_strength_configured) {
> +		u8 value = rts490x_io_strength_to_reg(config->tp0145_io_strength_ohms);
> +
> +		mask |= RTS490X_TP0145_IO_STRENGTH_MASK;
> +		strength |= FIELD_PREP(RTS490X_TP0145_IO_STRENGTH_MASK, value);
> +	}
> +
> +	if (config->tp2367_io_strength_configured) {
> +		u8 value = rts490x_io_strength_to_reg(config->tp2367_io_strength_ohms);
> +
> +		mask |= RTS490X_TP2367_IO_STRENGTH_MASK;
> +		strength |= FIELD_PREP(RTS490X_TP2367_IO_STRENGTH_MASK, value);
> +	}
> +
> +	return regmap_update_bits(hub->regmap, RTS490X_IO_STRENGTH,
> +				  mask, strength);
> +}
> +
> +static int rts490x_configure_ports(struct rts490x_hub *hub)
> +{
> +	u8 port_mask = GENMASK(hub->rts490x->num_target_ports - 1, 0);
> +	u8 pullup_mask = 0;
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < hub->rts490x->num_target_ports; i++) {
> +		if (hub->ports[i].pullup_enabled)
> +			pullup_mask |= hub->ports[i].mask;
> +	}
> +
> +	ret = regmap_update_bits(hub->regmap, RTS490X_TP_PULLUP_ENABLE,
> +				 port_mask, pullup_mask);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(hub->regmap, RTS490X_TP_IO_MODE_CONF,
> +				 port_mask, hub->smbus_port_mask);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(hub->regmap, RTS490X_TP_SMBUS_AGENT_ENABLE,
> +				 port_mask, hub->smbus_port_mask);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_clear_bits(hub->regmap,
> +				RTS490X_TP_SMBUS_AGENT_IBI_CONFIG, port_mask);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < hub->rts490x->num_target_ports; i++) {
> +		if (!(hub->smbus_port_mask & BIT(i)))
> +			continue;
> +
> +		ret = regmap_write(hub->regmap,
> +				   RTS490X_TP0_SMBUS_AGENT_STATUS + i,
> +				   RTS490X_TARGET_BUFFER_STATUS_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (hub->i3c_port_mask) {
> +		unsigned int status;
> +
> +		ret = regmap_write(hub->regmap, RTS490X_CP_MUX_SET,
> +				   RTS490X_CONTROLLER_PORT_MUX_REQ);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_read_poll_timeout(hub->regmap, RTS490X_CP_MUX_STATUS,
> +					       status,
> +					       status & RTS490X_CONTROLLER_PORT_MUXED,
> +					       RTS490X_CP_MUX_POLL_US,
> +					       RTS490X_CP_MUX_TIMEOUT_US);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return regmap_update_bits(hub->regmap, RTS490X_TP_ENABLE, port_mask,
> +				  hub->i3c_port_mask | hub->smbus_port_mask);
> +}
> +
> +static int rts490x_configure_hardware(struct rts490x_hub *hub)
> +{
> +	unsigned int protection;
> +	bool restore;
> +	int ret, ret2;
> +
> +	ret = rts490x_enable_supplies(hub);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&hub->rts490x->protected_reg_lock);
> +
> +	ret = regmap_read(hub->regmap, RTS490X_PROTECTION_CODE, &protection);
> +	if (ret)
> +		goto unlock;
> +
> +	restore = protection != RTS490X_REGISTERS_UNLOCK_CODE;
> +	if (restore) {
> +		ret = regmap_write(hub->regmap, RTS490X_PROTECTION_CODE,
> +				   RTS490X_REGISTERS_UNLOCK_CODE);
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +	ret = rts490x_configure_pullups(hub);
> +	if (!ret)
> +		ret = rts490x_configure_io_strength(hub);
> +	if (!ret)
> +		ret = rts490x_configure_ports(hub);
> +	if (!ret && hub->smbus_port_mask) {
> +		/* Hold SDA low when both target buffers are full. */
> +		ret = regmap_set_bits(hub->regmap,
> +				      RTS490X_ONCHIP_TD_AND_SMBUS_AGENT_CONF,
> +				      RTS490X_TARGET_AGENT_BUF_FULL_SDA_LOW_EN);
> +	}
> +
> +	if (restore) {
> +		ret2 = regmap_write(hub->regmap, RTS490X_PROTECTION_CODE,
> +				    protection);
> +		if (!ret && ret2)
> +			ret = ret2;
> +	}
> +
> +unlock:
> +	mutex_unlock(&hub->rts490x->protected_reg_lock);
> +
> +	return ret;
> +}
> +
> +static int rts490x_hub_probe(struct platform_device *pdev)
> +{
> +	struct rts490x *rts490x = dev_get_drvdata(pdev->dev.parent);
> +	struct rts490x_hub *hub;
> +	int ret;
> +
> +	if (!rts490x || !rts490x->i3cdev)
> +		return -ENODEV;
> +
> +	hub = devm_kzalloc(&pdev->dev, sizeof(*hub), GFP_KERNEL);
> +	if (!hub)
> +		return -ENOMEM;
> +
> +	hub->dev = &pdev->dev;
> +	hub->rts490x = rts490x;
> +	hub->regmap = rts490x->regmap;
> +	platform_set_drvdata(pdev, hub);
> +	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
> +
> +	ret = devm_mutex_init(&pdev->dev, &hub->page_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_mutex_init(&pdev->dev, &hub->target_lock);
> +	if (ret)
> +		return ret;
> +
> +	spin_lock_init(&hub->controller_lock);
> +
> +	ret = rts490x_read_config(hub);
> +	if (ret)
> +		return ret;
> +
> +	ret = rts490x_parse_ports(hub);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(&pdev->dev, rts490x_put_port_fwnodes, hub);
> +	if (ret)
> +		return ret;
> +
> +	ret = rts490x_configure_hardware(hub);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to configure hub hardware\n");
> +
> +	i3c_hub_init(&hub->hub, &rts490x_hub_ops, rts490x->i3cdev);
> +
> +	/* The IBI handler obtains the child context through the MFD parent. */
> +	rts490x->hub = hub;
> +	ret = devm_add_action_or_reset(&pdev->dev,
> +				       rts490x_clear_hub_backpointer, rts490x);
> +	if (ret)
> +		return ret;
> +
> +	ret = rts490x_register_i3c_ports(hub);
> +	if (ret)
> +		return ret;
> +
> +	ret = rts490x_setup_ibi(hub);
> +	if (ret)
> +		return ret;
> +
> +	ret = rts490x_register_smbus_ports(hub);
> +	if (ret) {
> +		rts490x_unregister_smbus_ports(hub);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(&pdev->dev,
> +					rts490x_unregister_smbus_ports, hub);
> +}
> +
> +static const struct platform_device_id rts490x_hub_ids[] = {
> +	{ "rts490x-i3c-hub" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(platform, rts490x_hub_ids);
> +
> +static struct platform_driver rts490x_hub_driver = {
> +	.driver.name = "rts490x-i3c-hub",
> +	.probe = rts490x_hub_probe,
> +	.id_table = rts490x_hub_ids,
> +};
> +module_platform_driver(rts490x_hub_driver);
> +
> +MODULE_AUTHOR("Yin Zhou <zain_zhou@realsil.com.cn>");
> +MODULE_DESCRIPTION("Realtek RTS490x I3C hub driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/i3c/hub/rts490x-i3c-hub-i3c.c b/drivers/i3c/hub/rts490x-i3c-hub-i3c.c
> new file mode 100644
> index 000000000000..7ddd7d171ef0
> --- /dev/null
> +++ b/drivers/i3c/hub/rts490x-i3c-hub-i3c.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2025-2026 Realtek Semiconductor Corp. */
> +
> +#include <linux/i3c/device.h>
> +#include <linux/mfd/rts490x.h>
> +#include <linux/regmap.h>
> +
> +#include "rts490x-i3c-hub.h"
> +
> +#define RTS490X_TP_NET_CON_CONF			0x51
> +
> +static struct rts490x_port *
> +rts490x_port_from_controller(struct i3c_master_controller *controller)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +
> +	hub_controller = container_of(controller, struct i3c_hub_controller,
> +				      controller);
> +
> +	return container_of(hub_controller, struct rts490x_port, hub_controller);
> +}
> +
> +static int rts490x_set_port_connected(struct rts490x_port *port, bool connected)
> +{
> +	if (connected)
> +		return regmap_set_bits(port->hub->regmap, RTS490X_TP_NET_CON_CONF,
> +				       port->mask);
> +
> +	return regmap_clear_bits(port->hub->regmap, RTS490X_TP_NET_CON_CONF,
> +				 port->mask);
> +}
> +
> +static void rts490x_enable_port(struct i3c_master_controller *controller)
> +{
> +	struct rts490x_port *port = rts490x_port_from_controller(controller);
> +	int ret;
> +
> +	if (port->always_enable)
> +		return;
> +
> +	ret = rts490x_set_port_connected(port, true);
> +	if (ret)
> +		dev_warn(port->hub->dev, "failed to connect target port %u: %d\n",
> +			 port->index, ret);
> +}
> +
> +static void rts490x_disable_port(struct i3c_master_controller *controller)
> +{
> +	struct rts490x_port *port = rts490x_port_from_controller(controller);
> +	int ret;
> +
> +	if (port->always_enable)
> +		return;
> +
> +	ret = rts490x_set_port_connected(port, false);
> +	if (ret)
> +		dev_warn(port->hub->dev, "failed to disconnect target port %u: %d\n",
> +			 port->index, ret);
> +}
> +
> +const struct i3c_hub_ops rts490x_hub_ops = {
> +	.enable_port = rts490x_enable_port,
> +	.disable_port = rts490x_disable_port,
> +};
> +
> +static void rts490x_unregister_i3c_controller(void *data)
> +{
> +	struct i3c_master_controller *controller = data;
> +
> +	i3c_master_unregister(controller);
> +}
> +
> +static void rts490x_disable_i3c_ports(void *data)
> +{
> +	struct rts490x_hub *hub = data;
> +	int i;
> +
> +	for (i = 0; i < hub->rts490x->num_target_ports; i++)
> +		hub->ports[i].always_enable = false;
> +
> +	if (regmap_clear_bits(hub->regmap, RTS490X_TP_NET_CON_CONF,
> +			      hub->i3c_port_mask))
> +		dev_warn(hub->dev, "failed to disconnect I3C target ports\n");
> +}
> +
> +static int rts490x_reserve_port_addresses(struct rts490x_port *port)
> +{
> +	return i3c_hub_reserve_parent_addrslots_from_dt(&port->hub_controller,
> +							 to_of_node(port->fwnode));
> +}
> +
> +static int rts490x_register_port_controller(struct rts490x_port *port)
> +{
> +	return i3c_master_register_fwnode(&port->hub_controller.controller,
> +					  port->hub->dev, port->fwnode,
> +					  &i3c_hub_master_ops, false);
> +}
> +
> +int rts490x_register_i3c_ports(struct rts490x_hub *hub)
> +{
> +	struct i3c_master_controller *parent;
> +	struct rts490x_port *port;
> +	int ret;
> +	int i;
> +
> +	parent = i3c_dev_get_master(hub->rts490x->i3cdev->desc);
> +
> +	for (i = 0; i < hub->rts490x->num_target_ports; i++) {
> +		port = &hub->ports[i];
> +		if (port->mode != RTS490X_PORT_I3C)
> +			continue;
> +
> +		port->hub_controller.parent = parent;
> +		port->hub_controller.hub = &hub->hub;
> +		dev_set_drvdata(&port->hub_controller.controller.dev,
> +				&port->hub_controller);
> +
> +		ret = rts490x_reserve_port_addresses(port);
> +		if (ret)
> +			return ret;
> +
> +		ret = rts490x_register_port_controller(port);
> +		if (ret)
> +			return ret;
> +
> +		ret = devm_add_action_or_reset(hub->dev,
> +					       rts490x_unregister_i3c_controller,
> +					       &port->hub_controller.controller);
> +		if (ret)
> +			return ret;
> +
> +		port->registered = true;
> +		port->always_enable = true;
> +	}
> +
> +	if (hub->i3c_port_mask) {
> +		ret = regmap_set_bits(hub->regmap, RTS490X_TP_NET_CON_CONF,
> +				      hub->i3c_port_mask);
> +		if (ret)
> +			return dev_err_probe(hub->dev, ret,
> +					     "failed to connect I3C target ports\n");
> +
> +		ret = devm_add_action_or_reset(hub->dev,
> +					       rts490x_disable_i3c_ports, hub);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/i3c/hub/rts490x-i3c-hub-smbus.c b/drivers/i3c/hub/rts490x-i3c-hub-smbus.c
> new file mode 100644
> index 000000000000..88db3879660a
> --- /dev/null
> +++ b/drivers/i3c/hub/rts490x-i3c-hub-smbus.c
> @@ -0,0 +1,839 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2025-2026 Realtek Semiconductor Corp. */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/i2c.h>
> +#include <linux/i3c/device.h>
> +#include <linux/mfd/rts490x.h>
> +#include <linux/regmap.h>
> +
> +#include "rts490x-i3c-hub.h"
> +
> +#define RTS490X_DEV_AND_IBI_STATUS		0x20
> +#define RTS490X_TP_SMBUS_AGENT_IBI_STATUS	0x21
> +#define RTS490X_TP_SMBUS_AGENT_TRANS_START	0x50
> +#define RTS490X_PAGE_PTR			0x7f
> +#define RTS490X_CONTROLLER_BUFFER_PAGE		0x10
> +#define RTS490X_CONTROLLER_PAGES_PER_PORT	4
> +#define RTS490X_TARGET_BUFFER_0_PAGE_OFFSET	2
> +#define RTS490X_TARGET_BUFFER_1_PAGE_OFFSET	3
> +#define RTS490X_CONTROLLER_AGENT_BUFFER		0x80
> +#define RTS490X_CONTROLLER_AGENT_BUFFER_DATA	0x84
> +#define RTS490X_TARGET_BUFFER_LENGTH		0x80
> +#define RTS490X_TARGET_BUFFER_ADDRESS		0x81
> +#define RTS490X_TARGET_BUFFER_DATA		0x82
> +#define RTS490X_CONTROLLER_BUFFER_SIZE		88
> +#define RTS490X_SMBUS_DESCRIPTOR_SIZE		4
> +#define RTS490X_SMBUS_PAYLOAD_SIZE		\
> +	(RTS490X_CONTROLLER_BUFFER_SIZE - RTS490X_SMBUS_DESCRIPTOR_SIZE)
> +
> +#define RTS490X_SMBUS_RATE_100KHZ		0
> +#define RTS490X_SMBUS_RATE_200KHZ		BIT(1)
> +#define RTS490X_SMBUS_RATE_400KHZ		BIT(2)
> +#define RTS490X_SMBUS_RATE_1MHZ			(BIT(1) | BIT(2))
> +#define RTS490X_SMBUS_REPEATED_START		BIT(0)
> +
> +#define RTS490X_SMBUS_AGENT_EVENT		BIT(4)
> +#define RTS490X_CONTROLLER_FINISH		BIT(0)
> +#define RTS490X_TARGET_BUFFER_0_RECEIVED	BIT(1)
> +#define RTS490X_TARGET_BUFFER_1_RECEIVED	BIT(2)
> +#define RTS490X_TARGET_BUFFER_OVERFLOW		BIT(3)
> +#define RTS490X_CONTROLLER_RETURN_CODE_MASK	GENMASK(7, 4)
> +#define RTS490X_CONTROLLER_SUCCESS		0
> +#define RTS490X_CONTROLLER_ADDRESS_NACK		1
> +#define RTS490X_CONTROLLER_DEVICE_BUSY		2
> +#define RTS490X_CONTROLLER_READ_NOT_READY	3
> +#define RTS490X_CONTROLLER_SYNC_RECOVERED	4
> +#define RTS490X_CONTROLLER_SYNC_BUS_CLEAR	5
> +#define RTS490X_CONTROLLER_BUS_FAULT		6
> +#define RTS490X_CONTROLLER_ARBITRATION_LOST	7
> +#define RTS490X_CONTROLLER_SCL_TIMEOUT		8
> +
> +#define RTS490X_SMBUS_TIMEOUT_MS		1000
> +#define RTS490X_IBI_MAX_PAYLOAD_LENGTH		2
> +#define RTS490X_IBI_SLOTS			6
> +
> +#define RTS490X_I2C_SUPPORTED_FLAGS		(I2C_M_RD | I2C_M_DMA_SAFE)
> +
> +enum rts490x_smbus_xfer_type {
> +	RTS490X_SMBUS_WRITE,
> +	RTS490X_SMBUS_READ,
> +	RTS490X_SMBUS_WRITE_READ,
> +};
> +
> +enum rts490x_smbus_descriptor_index {
> +	RTS490X_SMBUS_DESC_ADDRESS,
> +	RTS490X_SMBUS_DESC_TYPE,
> +	RTS490X_SMBUS_DESC_WRITE_LENGTH,
> +	RTS490X_SMBUS_DESC_READ_LENGTH,
> +};
> +
> +bool rts490x_smbus_frequency_supported(u32 frequency)
> +{
> +	switch (frequency) {
> +	case 100000:
> +	case 200000:
> +	case 400000:
> +	case 1000000:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static u8 rts490x_smbus_frequency_to_reg(u32 frequency)
> +{
> +	switch (frequency) {
> +	case 100000:
> +		return RTS490X_SMBUS_RATE_100KHZ;
> +	case 200000:
> +		return RTS490X_SMBUS_RATE_200KHZ;
> +	case 1000000:
> +		return RTS490X_SMBUS_RATE_1MHZ;
> +	default:
> +		return RTS490X_SMBUS_RATE_400KHZ;
> +	}
> +}
> +
> +static int rts490x_smbus_status_to_errno(struct rts490x_port *port,
> +					 unsigned int status)
> +{
> +	u8 code = FIELD_GET(RTS490X_CONTROLLER_RETURN_CODE_MASK, status);
> +
> +	switch (code) {
> +	case RTS490X_CONTROLLER_SUCCESS:
> +		return 0;
> +	case RTS490X_CONTROLLER_ADDRESS_NACK:
> +	case RTS490X_CONTROLLER_READ_NOT_READY:
> +		return -ENXIO;
> +	case RTS490X_CONTROLLER_DEVICE_BUSY:
> +		return -EREMOTEIO;
> +	case RTS490X_CONTROLLER_SYNC_RECOVERED:
> +	case RTS490X_CONTROLLER_SYNC_BUS_CLEAR:
> +	case RTS490X_CONTROLLER_ARBITRATION_LOST:
> +		return -EAGAIN;
> +	case RTS490X_CONTROLLER_SCL_TIMEOUT:
> +		return -ETIMEDOUT;
> +	case RTS490X_CONTROLLER_BUS_FAULT:
> +	default:
> +		dev_err(port->hub->dev,
> +			"SMBus controller error %#x on target port %u\n",
> +			code, port->index);
> +		return -EIO;
> +	}
> +}
> +
> +static int rts490x_smbus_recover_controller(struct rts490x_port *port)
> +{
> +	struct rts490x_hub *hub = port->hub;
> +	unsigned long flags;
> +	unsigned int status;
> +	bool recovering;
> +	int ret;
> +
> +	spin_lock_irqsave(&hub->controller_lock, flags);
> +	recovering = port->controller_recovering;
> +	spin_unlock_irqrestore(&hub->controller_lock, flags);
> +	if (!recovering)
> +		return 0;
> +
> +	ret = regmap_read(hub->regmap,
> +			  RTS490X_TP0_SMBUS_AGENT_STATUS + port->index, &status);
> +	if (ret)
> +		return ret;
> +
> +	if (status & RTS490X_CONTROLLER_FINISH) {
> +		ret = regmap_write(hub->regmap,
> +				   RTS490X_TP0_SMBUS_AGENT_STATUS + port->index,
> +				   RTS490X_CONTROLLER_FINISH);
> +		if (ret)
> +			return ret;
> +
> +		spin_lock_irqsave(&hub->controller_lock, flags);
> +		port->controller_recovering = false;
> +		spin_unlock_irqrestore(&hub->controller_lock, flags);
> +		return 0;
> +	}
> +
> +	spin_lock_irqsave(&hub->controller_lock, flags);
> +	recovering = port->controller_recovering;
> +	spin_unlock_irqrestore(&hub->controller_lock, flags);
> +
> +	return recovering ? -EAGAIN : 0;
> +}
> +
> +static int rts490x_smbus_wait_for_completion(struct rts490x_port *port)
> +{
> +	struct rts490x_hub *hub = port->hub;
> +	unsigned long flags;
> +	unsigned long timeout;
> +	unsigned int status;
> +	bool done;
> +	int error;
> +
> +	timeout = wait_for_completion_timeout(&port->completion,
> +					      port->smbus_adapter->timeout);
> +
> +	spin_lock_irqsave(&hub->controller_lock, flags);
> +	done = port->controller_done;
> +	if (!done) {
> +		port->controller_pending = false;
> +		if (!timeout)
> +			port->controller_recovering = true;
> +		spin_unlock_irqrestore(&hub->controller_lock, flags);
> +		return timeout ? -EIO : -ETIMEDOUT;
> +	}
> +
> +	port->controller_pending = false;
> +	port->controller_done = false;
> +	status = port->controller_status;
> +	error = port->controller_error;
> +	spin_unlock_irqrestore(&hub->controller_lock, flags);
> +
> +	if (error)
> +		return error;
> +
> +	return rts490x_smbus_status_to_errno(port, status);
> +}
> +
> +static int
> +rts490x_smbus_write_controller_buffer(struct rts490x_port *port,
> +				      const u8 *descriptor, const u8 *data,
> +				      unsigned int length)
> +{
> +	struct rts490x_hub *hub = port->hub;
> +	u8 page = RTS490X_CONTROLLER_BUFFER_PAGE +
> +		  RTS490X_CONTROLLER_PAGES_PER_PORT * port->index;
> +	int ret, ret2;
> +
> +	guard(mutex)(&hub->page_lock);
> +
> +	ret = regmap_write(hub->regmap, RTS490X_PAGE_PTR, page);
> +	if (!ret)
> +		ret = regmap_bulk_write(hub->regmap,
> +					RTS490X_CONTROLLER_AGENT_BUFFER,
> +					descriptor, RTS490X_SMBUS_DESCRIPTOR_SIZE);
> +	if (!ret && length)
> +		ret = regmap_bulk_write(hub->regmap,
> +					RTS490X_CONTROLLER_AGENT_BUFFER_DATA,
> +					data, length);
> +
> +	ret2 = regmap_write(hub->regmap, RTS490X_PAGE_PTR, 0);
> +	return ret ?: ret2;
> +}
> +
> +static int
> +rts490x_smbus_read_controller_buffer(struct rts490x_port *port, u8 *data,
> +				     unsigned int offset, unsigned int length)
> +{
> +	struct rts490x_hub *hub = port->hub;
> +	u8 page = RTS490X_CONTROLLER_BUFFER_PAGE +
> +		  RTS490X_CONTROLLER_PAGES_PER_PORT * port->index;
> +	int ret, ret2;
> +
> +	guard(mutex)(&hub->page_lock);
> +
> +	ret = regmap_write(hub->regmap, RTS490X_PAGE_PTR, page);
> +	if (!ret)
> +		ret = regmap_bulk_read(hub->regmap,
> +				       RTS490X_CONTROLLER_AGENT_BUFFER_DATA + offset,
> +				       data, length);
> +
> +	ret2 = regmap_write(hub->regmap, RTS490X_PAGE_PTR, 0);
> +	return ret ?: ret2;
> +}
> +
> +static int rts490x_smbus_xfer_one(struct rts490x_port *port,
> +				  struct i2c_msg *write,
> +				  struct i2c_msg *read,
> +				  enum rts490x_smbus_xfer_type type)
> +{
> +	struct rts490x_hub *hub = port->hub;
> +	u8 descriptor[RTS490X_SMBUS_DESCRIPTOR_SIZE] = { };
> +	unsigned long flags;
> +	u8 *read_buffer = NULL;
> +	u8 address;
> +	unsigned int write_length = write ? write->len : 0;
> +	unsigned int read_length = read ? read->len : 0;
> +	unsigned int status_reg = RTS490X_TP0_SMBUS_AGENT_STATUS + port->index;
> +	int ret;
> +
> +	if ((write && write->flags & ~RTS490X_I2C_SUPPORTED_FLAGS) ||
> +	    (read && read->flags & ~RTS490X_I2C_SUPPORTED_FLAGS))
> +		return -EOPNOTSUPP;
> +
> +	if (write_length + read_length > RTS490X_SMBUS_PAYLOAD_SIZE)
> +		return -EOPNOTSUPP;
> +
> +	address = i2c_8bit_addr_from_msg(write ?: read);
> +	descriptor[RTS490X_SMBUS_DESC_ADDRESS] = address;
> +	descriptor[RTS490X_SMBUS_DESC_TYPE] =
> +		rts490x_smbus_frequency_to_reg(port->clock_frequency);
> +	descriptor[RTS490X_SMBUS_DESC_WRITE_LENGTH] = write_length;
> +	descriptor[RTS490X_SMBUS_DESC_READ_LENGTH] = read_length;
> +
> +	if (type == RTS490X_SMBUS_WRITE_READ)
> +		descriptor[RTS490X_SMBUS_DESC_TYPE] |= RTS490X_SMBUS_REPEATED_START;
> +
> +	if (read_length) {
> +		read_buffer = i2c_get_dma_safe_msg_buf(read, 1);
> +		if (!read_buffer)
> +			return -ENOMEM;
> +	}
> +
> +	guard(mutex)(&port->xfer_lock);
> +
> +	ret = rts490x_smbus_recover_controller(port);
> +	if (ret)
> +		goto out;
> +
> +	ret = rts490x_smbus_write_controller_buffer(port, descriptor,
> +						    write ? write->buf : NULL,
> +						    write_length);
> +	if (ret)
> +		goto out;
> +
> +	/* Clear any completion left by an earlier controller-agent transaction. */
> +	ret = regmap_write(hub->regmap, status_reg, RTS490X_CONTROLLER_FINISH);
> +	if (ret)
> +		goto out;
> +
> +	reinit_completion(&port->completion);
> +	spin_lock_irqsave(&hub->controller_lock, flags);
> +	port->controller_status = 0;
> +	port->controller_error = 0;
> +	port->controller_done = false;
> +	port->controller_pending = true;
> +	spin_unlock_irqrestore(&hub->controller_lock, flags);
> +
> +	ret = regmap_write(hub->regmap, RTS490X_TP_SMBUS_AGENT_TRANS_START,
> +			   port->mask);
> +	if (ret) {
> +		spin_lock_irqsave(&hub->controller_lock, flags);
> +		port->controller_pending = false;
> +		spin_unlock_irqrestore(&hub->controller_lock, flags);
> +		goto out;
> +	}
> +
> +	ret = rts490x_smbus_wait_for_completion(port);
> +	if (ret)
> +		goto out;
> +
> +	if (read_length)
> +		ret = rts490x_smbus_read_controller_buffer(port, read_buffer,
> +							   write_length,
> +							   read_length);
> +
> +out:
> +	if (read_length)
> +		i2c_put_dma_safe_msg_buf(read_buffer, read, !ret);
> +
> +	return ret;
> +}
> +
> +static bool rts490x_smbus_can_combine(const struct i2c_msg *write,
> +				      const struct i2c_msg *read)
> +{
> +	return !(write->flags & I2C_M_RD) && (read->flags & I2C_M_RD) &&
> +	       write->addr == read->addr &&
> +	       write->len + read->len <= RTS490X_SMBUS_PAYLOAD_SIZE;
> +}
> +
> +static int rts490x_smbus_xfer(struct i2c_adapter *adapter,
> +			      struct i2c_msg *messages, int num)
> +{
> +	struct rts490x_port *port = i2c_get_adapdata(adapter);
> +	struct i2c_msg *read = NULL;
> +	struct i2c_msg *write = NULL;
> +	enum rts490x_smbus_xfer_type type;
> +	int ret;
> +
> +	if (!num)
> +		return 0;
> +
> +	if (num == 2) {
> +		if (!rts490x_smbus_can_combine(&messages[0], &messages[1]))
> +			return -EOPNOTSUPP;
> +
> +		write = &messages[0];
> +		read = &messages[1];
> +		type = RTS490X_SMBUS_WRITE_READ;
> +	} else if (num == 1 && messages[0].flags & I2C_M_RD) {
> +		read = &messages[0];
> +		type = RTS490X_SMBUS_READ;
> +	} else if (num == 1) {
> +		write = &messages[0];
> +		type = RTS490X_SMBUS_WRITE;
> +	} else {
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ret = rts490x_smbus_xfer_one(port, write, read, type);
> +	return ret ? ret : num;
> +}
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static int rts490x_smbus_register_target(struct i2c_client *target)
> +{
> +	struct rts490x_port *port = i2c_get_adapdata(target->adapter);
> +	struct rts490x_hub *hub = port->hub;
> +	int ret;
> +
> +	guard(mutex)(&hub->target_lock);
> +
> +	if (!hub->ibi_ready)
> +		return -EOPNOTSUPP;
> +
> +	if (target->flags & I2C_CLIENT_TEN)
> +		return -EOPNOTSUPP;
> +
> +	if (port->target)
> +		return -EBUSY;
> +
> +	ret = regmap_write(hub->regmap,
> +			   RTS490X_TP0_SMBUS_AGENT_STATUS + port->index,
> +			   RTS490X_TARGET_BUFFER_STATUS_MASK);
> +	if (ret)
> +		return ret;
> +
> +	port->target = target;
> +
> +	return 0;
> +}
> +
> +static int rts490x_smbus_unregister_target(struct i2c_client *target)
> +{
> +	struct rts490x_port *port = i2c_get_adapdata(target->adapter);
> +	struct rts490x_hub *hub = port->hub;
> +
> +	guard(mutex)(&hub->target_lock);
> +
> +	if (port->target != target)
> +		return -EINVAL;
> +
> +	port->target = NULL;
> +
> +	return 0;
> +}
> +#endif
> +
> +static u32 rts490x_smbus_functionality(struct i2c_adapter *adapter)
> +{
> +	u32 functionality;
> +
> +	functionality = (I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL) &
> +			~I2C_FUNC_SMBUS_PEC;
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	struct rts490x_port *port = i2c_get_adapdata(adapter);
> +
> +	if (port->hub->ibi_ready)
> +		functionality |= I2C_FUNC_SLAVE;
> +#endif
> +
> +	return functionality;
> +}
> +
> +static const struct i2c_adapter_quirks rts490x_smbus_quirks = {
> +	.flags = I2C_AQ_COMB_WRITE_THEN_READ,
> +	.max_read_len = RTS490X_SMBUS_PAYLOAD_SIZE,
> +	.max_write_len = RTS490X_SMBUS_PAYLOAD_SIZE,
> +	.max_comb_1st_msg_len = RTS490X_SMBUS_PAYLOAD_SIZE - 1,
> +	.max_comb_2nd_msg_len = RTS490X_SMBUS_PAYLOAD_SIZE - 1,
> +};
> +
> +static const struct i2c_algorithm rts490x_smbus_algorithm = {
> +	.xfer = rts490x_smbus_xfer,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	.reg_target = rts490x_smbus_register_target,
> +	.unreg_target = rts490x_smbus_unregister_target,
> +#endif
> +	.functionality = rts490x_smbus_functionality,
> +};
> +
> +static int rts490x_read_target_buffer(struct rts490x_port *port,
> +				      unsigned int page_offset,
> +				      u8 *address, unsigned int *length)
> +{
> +	struct rts490x_hub *hub = port->hub;
> +	u8 page = RTS490X_CONTROLLER_BUFFER_PAGE +
> +		  RTS490X_CONTROLLER_PAGES_PER_PORT * port->index + page_offset;
> +	unsigned int value;
> +	int ret, ret2;
> +
> +	guard(mutex)(&hub->page_lock);
> +
> +	ret = regmap_write(hub->regmap, RTS490X_PAGE_PTR, page);
> +	if (ret)
> +		goto restore_page;
> +
> +	ret = regmap_read(hub->regmap, RTS490X_TARGET_BUFFER_LENGTH, &value);
> +	if (ret)
> +		goto restore_page;
> +
> +	if (!value) {
> +		ret = -ENODATA;
> +		goto restore_page;
> +	}
> +
> +	*length = value - 1;
> +	if (*length > RTS490X_SMBUS_TARGET_PAYLOAD_SIZE) {
> +		ret = -EMSGSIZE;
> +		goto restore_page;
> +	}
> +
> +	ret = regmap_read(hub->regmap, RTS490X_TARGET_BUFFER_ADDRESS, &value);
> +	if (ret)
> +		goto restore_page;
> +
> +	*address = value;
> +	if (*length)
> +		ret = regmap_bulk_read(hub->regmap, RTS490X_TARGET_BUFFER_DATA,
> +				       hub->target_buffer, *length);
> +
> +restore_page:
> +	ret2 = regmap_write(hub->regmap, RTS490X_PAGE_PTR, 0);
> +	return ret ?: ret2;
> +}
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static void rts490x_deliver_target_write(struct rts490x_port *port,
> +					 u8 address, unsigned int length)
> +{
> +	struct i2c_client *target = port->target;
> +	u8 value = 0;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!target || target->addr != address >> 1)
> +		return;
> +
> +	ret = i2c_slave_event(target, I2C_SLAVE_WRITE_REQUESTED, &value);
> +	if (!ret) {
> +		for (i = 0; i < length; i++) {
> +			value = port->hub->target_buffer[i];
> +			ret = i2c_slave_event(target, I2C_SLAVE_WRITE_RECEIVED,
> +					      &value);
> +			if (ret)
> +				break;
> +		}
> +	}
> +
> +	i2c_slave_event(target, I2C_SLAVE_STOP, &value);
> +}
> +#endif
> +
> +static void rts490x_process_target_buffer(struct rts490x_port *port,
> +					  unsigned int page_offset, u8 flag)
> +{
> +	struct rts490x_hub *hub = port->hub;
> +	unsigned int length = 0;
> +	u8 address = 0;
> +	int ret;
> +
> +	ret = rts490x_read_target_buffer(port, page_offset, &address, &length);
> +	if (ret == -EMSGSIZE)
> +		dev_warn_ratelimited(hub->dev,
> +				     "SMBus target message too large on port %u\n",
> +				     port->index);
> +	else if (ret && ret != -ENODATA)
> +		dev_warn_ratelimited(hub->dev,
> +				     "failed to read SMBus target buffer on port %u: %d\n",
> +				     port->index, ret);
> +
> +	if (regmap_write(hub->regmap,
> +			 RTS490X_TP0_SMBUS_AGENT_STATUS + port->index, flag))
> +		dev_warn_ratelimited(hub->dev,
> +				     "failed to acknowledge SMBus target buffer on port %u\n",
> +				     port->index);
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	if (!ret)
> +		rts490x_deliver_target_write(port, address, length);
> +#endif
> +}
> +
> +static void rts490x_process_smbus_target_status(struct rts490x_port *port,
> +						unsigned int status)
> +{
> +	struct rts490x_hub *hub = port->hub;
> +	int ret;
> +
> +	if (status & RTS490X_TARGET_BUFFER_0_RECEIVED)
> +		rts490x_process_target_buffer(port,
> +					      RTS490X_TARGET_BUFFER_0_PAGE_OFFSET,
> +					      RTS490X_TARGET_BUFFER_0_RECEIVED);
> +
> +	if (status & RTS490X_TARGET_BUFFER_1_RECEIVED)
> +		rts490x_process_target_buffer(port,
> +					      RTS490X_TARGET_BUFFER_1_PAGE_OFFSET,
> +					      RTS490X_TARGET_BUFFER_1_RECEIVED);
> +
> +	if (status & RTS490X_TARGET_BUFFER_OVERFLOW) {
> +		ret = regmap_write(hub->regmap,
> +				   RTS490X_TP0_SMBUS_AGENT_STATUS + port->index,
> +				   RTS490X_TARGET_BUFFER_OVERFLOW);
> +		if (ret)
> +			dev_warn_ratelimited(hub->dev,
> +					     "failed to clear SMBus target overflow on port %u: %d\n",
> +					     port->index, ret);
> +		else
> +			dev_warn_ratelimited(hub->dev,
> +					     "SMBus target buffer overflow on port %u\n",
> +					     port->index);
> +	}
> +}
> +
> +static void rts490x_complete_smbus_controller(struct rts490x_port *port,
> +					      unsigned int status)
> +{
> +	struct rts490x_hub *hub = port->hub;
> +	unsigned long flags;
> +	bool notify = false;
> +	int ret;
> +
> +	if (!(status & RTS490X_CONTROLLER_FINISH))
> +		return;
> +
> +	ret = regmap_write(hub->regmap,
> +			   RTS490X_TP0_SMBUS_AGENT_STATUS + port->index,
> +			   RTS490X_CONTROLLER_FINISH);
> +
> +	spin_lock_irqsave(&hub->controller_lock, flags);
> +	if (port->controller_pending) {
> +		port->controller_status = status;
> +		port->controller_error = ret;
> +		port->controller_done = true;
> +		notify = true;
> +	} else if (port->controller_recovering && !ret) {
> +		port->controller_recovering = false;
> +	}
> +	spin_unlock_irqrestore(&hub->controller_lock, flags);
> +
> +	if (ret)
> +		dev_warn_ratelimited(hub->dev,
> +				     "failed to acknowledge SMBus controller completion on port %u: %d\n",
> +				     port->index, ret);
> +
> +	if (notify)
> +		complete(&port->completion);
> +}
> +
> +static void rts490x_process_smbus_status(struct rts490x_port *port)
> +{
> +	struct rts490x_hub *hub = port->hub;
> +	unsigned int status;
> +	int ret;
> +
> +	ret = regmap_read(hub->regmap,
> +			  RTS490X_TP0_SMBUS_AGENT_STATUS + port->index, &status);
> +	if (ret) {
> +		dev_warn_ratelimited(hub->dev,
> +				     "failed to read SMBus status on port %u: %d\n",
> +				     port->index, ret);
> +		return;
> +	}
> +
> +	rts490x_complete_smbus_controller(port, status);
> +
> +	guard(mutex)(&hub->target_lock);
> +	rts490x_process_smbus_target_status(port, status);
> +}
> +
> +static void rts490x_ibi_handler(struct i3c_device *i3cdev,
> +				const struct i3c_ibi_payload *payload)
> +{
> +	struct rts490x *rts490x = i3cdev_get_drvdata(i3cdev);
> +	struct rts490x_hub *hub = rts490x->hub;
> +	const u8 *data = payload->data;
> +	unsigned int pending;
> +	unsigned int status;
> +	int ret;
> +	int i;
> +
> +	if (!hub)
> +		return;
> +
> +	if (payload->len && data) {
> +		status = data[0];
> +	} else {
> +		ret = regmap_read(hub->regmap, RTS490X_DEV_AND_IBI_STATUS, &status);
> +		if (ret)
> +			return;
> +	}
> +
> +	if (!(status & RTS490X_SMBUS_AGENT_EVENT))
> +		return;
> +
> +	if (payload->len >= RTS490X_IBI_MAX_PAYLOAD_LENGTH && data) {
> +		pending = data[1];
> +	} else {
> +		ret = regmap_read(hub->regmap,
> +				  RTS490X_TP_SMBUS_AGENT_IBI_STATUS, &pending);
> +		if (ret)
> +			return;
> +	}
> +
> +	pending &= hub->smbus_port_mask;
> +
> +	for (i = 0; i < hub->rts490x->num_target_ports; i++) {
> +		if (pending & BIT(i))
> +			rts490x_process_smbus_status(&hub->ports[i]);
> +	}
> +}
> +
> +static const struct i3c_ibi_setup rts490x_ibi_setup = {
> +	.handler = rts490x_ibi_handler,
> +	.max_payload_len = RTS490X_IBI_MAX_PAYLOAD_LENGTH,
> +	.num_slots = RTS490X_IBI_SLOTS,
> +};
> +
> +static int rts490x_set_smbus_ibi(struct rts490x_hub *hub, bool enable)
> +{
> +	unsigned int protection;
> +	u8 value = enable ? hub->smbus_port_mask : 0;
> +	bool restore;
> +	int ret, ret2;
> +
> +	guard(mutex)(&hub->rts490x->protected_reg_lock);
> +
> +	ret = regmap_read(hub->regmap, RTS490X_PROTECTION_CODE, &protection);
> +	if (ret)
> +		return ret;
> +
> +	restore = protection != RTS490X_REGISTERS_UNLOCK_CODE;
> +	if (restore) {
> +		ret = regmap_write(hub->regmap, RTS490X_PROTECTION_CODE,
> +				   RTS490X_REGISTERS_UNLOCK_CODE);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_update_bits(hub->regmap,
> +				 RTS490X_TP_SMBUS_AGENT_IBI_CONFIG,
> +				 hub->smbus_port_mask, value);
> +
> +	if (restore) {
> +		ret2 = regmap_write(hub->regmap, RTS490X_PROTECTION_CODE, protection);
> +		if (!ret && ret2)
> +			ret = ret2;
> +	}
> +
> +	return ret;
> +}
> +
> +static void rts490x_free_ibi(void *data)
> +{
> +	struct rts490x_hub *hub = data;
> +
> +	hub->ibi_ready = false;
> +	if (rts490x_set_smbus_ibi(hub, false))
> +		dev_warn(hub->dev, "failed to disable SMBus event IBI\n");
> +	if (i3c_device_disable_ibi(hub->rts490x->i3cdev))
> +		dev_warn(hub->dev, "failed to disable hub IBI\n");
> +	i3c_device_free_ibi(hub->rts490x->i3cdev);
> +}
> +
> +int rts490x_setup_ibi(struct rts490x_hub *hub)
> +{
> +	int ret;
> +
> +	if (!hub->smbus_port_mask)
> +		return 0;
> +
> +	ret = i3c_device_request_ibi(hub->rts490x->i3cdev, &rts490x_ibi_setup);
> +	if (ret)
> +		return dev_err_probe(hub->dev, ret, "failed to request hub IBI\n");
> +
> +	ret = i3c_device_enable_ibi(hub->rts490x->i3cdev);
> +	if (ret) {
> +		i3c_device_free_ibi(hub->rts490x->i3cdev);
> +		return dev_err_probe(hub->dev, ret, "failed to enable hub IBI\n");
> +	}
> +
> +	ret = devm_add_action_or_reset(hub->dev, rts490x_free_ibi, hub);
> +	if (ret)
> +		return ret;
> +
> +	ret = rts490x_set_smbus_ibi(hub, true);
> +	if (ret)
> +		return ret;
> +
> +	hub->ibi_ready = true;
> +	return 0;
> +}
> +
> +static void rts490x_unregister_smbus_adapter(struct rts490x_port *port)
> +{
> +	struct i2c_adapter *adapter = port->smbus_adapter;
> +	struct fwnode_handle *fwnode;
> +
> +	if (!adapter)
> +		return;
> +
> +	fwnode = dev_fwnode(&adapter->dev);
> +	i2c_del_adapter(adapter);
> +	fwnode_handle_put(fwnode);
> +	port->smbus_adapter = NULL;
> +	port->registered = false;
> +}
> +
> +void rts490x_unregister_smbus_ports(void *data)
> +{
> +	struct rts490x_hub *hub = data;
> +	int i;
> +
> +	for (i = 0; i < hub->rts490x->num_target_ports; i++)
> +		rts490x_unregister_smbus_adapter(&hub->ports[i]);
> +}
> +
> +int rts490x_register_smbus_ports(struct rts490x_hub *hub)
> +{
> +	struct rts490x_port *port;
> +	struct i2c_adapter *adapter;
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < hub->rts490x->num_target_ports; i++) {
> +		port = &hub->ports[i];
> +		if (port->mode != RTS490X_PORT_SMBUS)
> +			continue;
> +
> +		ret = devm_mutex_init(hub->dev, &port->xfer_lock);
> +		if (ret)
> +			return ret;
> +
> +		init_completion(&port->completion);
> +
> +		adapter = devm_kzalloc(hub->dev, sizeof(*adapter), GFP_KERNEL);
> +		if (!adapter)
> +			return -ENOMEM;
> +
> +		adapter->owner = THIS_MODULE;
> +		adapter->algo = &rts490x_smbus_algorithm;
> +		adapter->quirks = &rts490x_smbus_quirks;
> +		adapter->dev.parent = hub->dev;
> +		adapter->timeout = msecs_to_jiffies(RTS490X_SMBUS_TIMEOUT_MS);
> +		adapter->retries = 3;
> +		device_set_node(&adapter->dev, fwnode_handle_get(port->fwnode));
> +		snprintf(adapter->name, sizeof(adapter->name),
> +			 "rts490x-i3c-hub target port %u", port->index);
> +		i2c_set_adapdata(adapter, port);
> +
> +		port->smbus_adapter = adapter;
> +		ret = i2c_add_adapter(adapter);
> +		if (ret) {
> +			fwnode_handle_put(dev_fwnode(&adapter->dev));
> +			device_set_node(&adapter->dev, NULL);
> +			port->smbus_adapter = NULL;
> +			return dev_err_probe(hub->dev, ret,
> +					     "failed to register SMBus target port %u\n",
> +					     port->index);
> +		}
> +
> +		port->registered = true;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/i3c/hub/rts490x-i3c-hub.h b/drivers/i3c/hub/rts490x-i3c-hub.h
> new file mode 100644
> index 000000000000..cab489de0aa8
> --- /dev/null
> +++ b/drivers/i3c/hub/rts490x-i3c-hub.h
> @@ -0,0 +1,150 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (c) 2025-2026 Realtek Semiconductor Corp. */
> +#ifndef _RTS490X_I3C_HUB_H
> +#define _RTS490X_I3C_HUB_H
> +
> +#include <linux/bits.h>
> +#include <linux/completion.h>
> +#include <linux/i2c.h>
> +#include <linux/i3c/hub.h>
> +#include <linux/mfd/rts490x.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +
> +#define RTS490X_SMBUS_TARGET_PAYLOAD_SIZE	78
> +
> +#define RTS490X_TP_SMBUS_AGENT_IBI_CONFIG	0x1b
> +#define RTS490X_TP0_SMBUS_AGENT_STATUS		0x64
> +#define RTS490X_TARGET_BUFFER_STATUS_MASK	GENMASK(3, 1)
> +
> +struct device;
> +struct fwnode_handle;
> +struct regmap;
> +struct rts490x;
> +
> +enum rts490x_port_mode {
> +	RTS490X_PORT_UNUSED,
> +	RTS490X_PORT_I3C,
> +	RTS490X_PORT_SMBUS,
> +};
> +
> +/**
> + * struct rts490x_config - static hub configuration
> + * @tp0145_pullup_ohms: pull-up resistance for target ports 0/1/4/5
> + * @tp2367_pullup_ohms: pull-up resistance for target ports 2/3/6/7
> + * @cp0_io_strength_ohms: controller port 0 output impedance
> + * @cp1_io_strength_ohms: controller port 1 output impedance
> + * @tp0145_io_strength_ohms: target ports 0/1/4/5 output impedance
> + * @tp2367_io_strength_ohms: target ports 2/3/6/7 output impedance
> + * @tp0145_pullup_configured: target port group 0/1/4/5 pull-up is configured
> + * @tp2367_pullup_configured: target port group 2/3/6/7 pull-up is configured
> + * @cp0_io_strength_configured: controller port 0 impedance is configured
> + * @cp1_io_strength_configured: controller port 1 impedance is configured
> + * @tp0145_io_strength_configured: target group 0/1/4/5 impedance is configured
> + * @tp2367_io_strength_configured: target group 2/3/6/7 impedance is configured
> + */
> +struct rts490x_config {
> +	u32 tp0145_pullup_ohms;
> +	u32 tp2367_pullup_ohms;
> +	u32 cp0_io_strength_ohms;
> +	u32 cp1_io_strength_ohms;
> +	u32 tp0145_io_strength_ohms;
> +	u32 tp2367_io_strength_ohms;
> +	bool tp0145_pullup_configured;
> +	bool tp2367_pullup_configured;
> +	bool cp0_io_strength_configured;
> +	bool cp1_io_strength_configured;
> +	bool tp0145_io_strength_configured;
> +	bool tp2367_io_strength_configured;
> +};
> +
> +/**
> + * struct rts490x_port - per-target-port state
> + * @hub_controller: generic I3C hub controller for an I3C port
> + * @fwnode: firmware node describing the target-port bus
> + * @smbus_adapter: adapter registered for an SMBus port
> + * @target: target client registered on an SMBus port
> + * @hub: parent RTS490x hub state
> + * @xfer_lock: serializes SMBus controller-agent transfers on this port
> + * @completion: signaled when the controller agent reports FINISH through IBI
> + * @controller_status: controller-agent status captured by the IBI handler
> + * @controller_error: IBI completion processing error
> + * @controller_pending: a controller-agent transfer is waiting for IBI
> + * @controller_done: the pending transfer has been completed by IBI
> + * @controller_recovering: reject new transfers until a late completion is acked
> + * @mode: target-port operating mode
> + * @clock_frequency: SMBus controller-agent bus rate in Hz
> + * @index: target-port index
> + * @mask: target-port register mask
> + * @pullup_enabled: use the on-chip target-port pull-up
> + * @registered: an I3C controller or SMBus adapter is registered for this port
> + * @always_enable: skip the enable_port/disable_port hooks; the route stays
> + *		   connected between operations
> + */
> +struct rts490x_port {
> +	struct i3c_hub_controller hub_controller;
> +	struct fwnode_handle *fwnode;
> +	struct i2c_adapter *smbus_adapter;
> +	struct i2c_client *target;
> +	struct rts490x_hub *hub;
> +	/* Serializes controller-agent transactions on this target port. */
> +	struct mutex xfer_lock;
> +	struct completion completion;
> +	unsigned int controller_status;
> +	int controller_error;
> +	bool controller_pending;
> +	bool controller_done;
> +	bool controller_recovering;
> +	enum rts490x_port_mode mode;
> +	u32 clock_frequency;
> +	u8 index;
> +	u8 mask;
> +	bool pullup_enabled;
> +	bool registered;
> +	bool always_enable;
> +};
> +
> +/**
> + * struct rts490x_hub - Realtek-specific I3C hub child state
> + * @dev: hub child device
> + * @rts490x: shared MFD state
> + * @regmap: register map shared with the MFD parent
> + * @hub: generic I3C hub context
> + * @page_lock: serializes paged-register transactions
> + * @controller_lock: protects controller completion state against timeout/IBI races
> + * @target_lock: serializes target registration and IBI delivery
> + * @target_buffer: shared buffer for SMBus target writes delivered by IBI
> + * @config: static hardware configuration
> + * @ports: per-target-port state
> + * @i3c_port_mask: target ports configured as I3C buses
> + * @smbus_port_mask: target ports configured as SMBus buses
> + * @ibi_ready: hub-device IBI has been requested and enabled
> + */
> +struct rts490x_hub {
> +	struct device *dev;
> +	struct rts490x *rts490x;
> +	struct regmap *regmap;
> +	struct i3c_hub hub;
> +	/* Serializes page selection and access across all target ports. */
> +	struct mutex page_lock;
> +	/* Protects controller completion state against timeout and IBI races. */
> +	spinlock_t controller_lock;
> +	/* Serializes target registration and IBI delivery. */
> +	struct mutex target_lock;
> +	u8 target_buffer[RTS490X_SMBUS_TARGET_PAYLOAD_SIZE];
> +	struct rts490x_config config;
> +	struct rts490x_port ports[RTS490X_MAX_TARGET_PORTS];
> +	u8 i3c_port_mask;
> +	u8 smbus_port_mask;
> +	bool ibi_ready;
> +};
> +
> +extern const struct i3c_hub_ops rts490x_hub_ops;
> +
> +int rts490x_register_i3c_ports(struct rts490x_hub *hub);
> +int rts490x_setup_ibi(struct rts490x_hub *hub);
> +int rts490x_register_smbus_ports(struct rts490x_hub *hub);
> +void rts490x_unregister_smbus_ports(void *data);
> +bool rts490x_smbus_frequency_supported(u32 frequency);
> +
> +#endif /* _RTS490X_I3C_HUB_H */
> --
> 2.34.1
>
