Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012019.outbound.protection.outlook.com [52.101.66.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD6223ABB9;
	Fri,  2 Oct 2026 14:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951861; cv=fail; b=p7Y9SWtJnQeG5N2/dTZBZEFIHgRTejv1/EI+Jr2NC/efb38JPrg9KYqiFr/wkhzWEbR2iBKNumK4g3UB+sZ9BxB2/QKUBdtQ4pE8IEHjK9T+nhDp87cDxuxn5tW5NYH9R8nkSqg8pQnirggTBobfbMztUy620u/olzZlnPw35YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951861; c=relaxed/simple;
	bh=rH5XrqQqHgPS7rBYcLs7Z4pr7dEp6zLfjuOnXSUaotA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uSeExKfvRvY6LniKnCVf9MCtO6T1tU0MNUD4Vdw8RkFXXIwuZfRAMgpMlPbBIWu5v4X4VdrOeKCHeBX9sDtE9S7xIX+hMqKqmco6Sl4odkZr1iSP9qmF/KwuY9t1HlfU+sDfTQXtSzKheD642SC/MPPydZj0lKq0p+jMODLKWl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wz2R2/KA; arc=fail smtp.client-ip=52.101.66.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wz2R2/KA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/PIp1iU+4VtXj5MhiRaEq4hhkr3eabxgkF9keRtpAHcJW4PYn//lKD/wLf3+sdyGl8x5bRMGP1lqGYvOBnofNdG7BDRQ3I+0sWuU4AkyAdZRb/GfGZp4+mkGenXFcgH/R4lkQmRpn92OiQXihvnhsVgXWbrPUVLkJQVB/W20yiRZFUPmjo8sBMDajP9bZotv19J2TG9X51Q9iT8G7tg73+Cv7WdFMlbm5LkzVxMjpB2vpph4KuzgKEAJ2jg1XQ4gEsqeZtj9sUmwSuNRtnM8SA62jOKWjZAwQibT5OkxoxNu0R6o+M0XlFlPYQQhKlQsb/JY34rBKolQFeS2kytIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyK9KF8BwI7l26n6Cuqk13fok4hb23usT40xtRevMDQ=;
 b=Je1kjm3HT3smKHF2IVzBcyFmTXPdoJkPy/bc3UqPC/njm39wAenaDqM6wT++np2pCr8ULdIKs/BeoOblbq2LXPKwsXx5eVGnupcS1Pc+QJiv0KsKZ+hioMjp5Ztv8TkqFoyPMZfnAO5OR/7mZrn+xe7MPwgfEe9faldSY8iN98ldvHJlY/M4Am0MgRr+wue1iXRnOlTFBx3usukcxK5SobX0nmE5dg8wjhM9mla55WtLnVeKI0qwnWFC/Q/ptF/0lK8bN44svaU/i62qz7rTSDv3/V/B4Va/2Okwzi6h/+CVQvUMsI566Hzt6lNdoqQP+FlBluP6NlVRjE1wkvt79A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyK9KF8BwI7l26n6Cuqk13fok4hb23usT40xtRevMDQ=;
 b=wz2R2/KAsO0EdPHMyepYQNuDxRi67y3r0/+LR3rKyHVXuOZLPVRPE+yXfyIXA4W3jhHSwtd69s8bWdqt1VcrxfnyD7Qf4whIIeKVDj7XZa/EWzaGcyIrf/MOwnE7nRcU2Y1EC9/C5b11oXu2/3ea340QEgHtCAoFO0zWjd4eVr9j2cr9oZiSPcTE5NBuHStJY6hC2jAVgKieIfNHI3V5NW3GPh6OVP2dfPcybOyhYSgmVi9H1bd5hAWW04WiPmVk4DW0WQ6i4DB5tpv4FYzpcZObgRFASeNlRORtgFd2ZZroMoMy+ED/Ryhr/CagSyOwdk0ZaQwhkWi0KcPs+KLZMg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 14:37:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 14:37:27 +0000
Date: Fri, 2 Oct 2026 09:37:17 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/8] ARM: dts: imx6ul: Add LVDS DT overlay for TQMa6ULx
Message-ID: <ar_BnRDhyiMpUs_T@SMW015318>
References: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
 <20261002081417.2092471-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002081417.2092471-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: CY5P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:ed::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf81ee8-8dfd-4571-6efb-08df2092ae4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|19092799006|23010399003|1800799024|11063799006|4143699003|56012099006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mO9l3kyLdckbnTSP7wvm08etQdZRswuOF5KPInr8cD3Xi7UjwMOeupW9ZiziPAaatEeDk/OWybAd7IhMyncn4f7bTcZMkNpEAoL1/i/3JH6oj5K0iURUQmjIOEKpglM4SoIJYh7VDbERPoF+4yOWdmnkrPYdPnTGolCHNlxAogUu9hxkwjcyaU0E5AYWp63PnvXdwZZjMc9n6CF7vJCNrA/bHhMgHCHZJSfGWc+tV+RbK7nvPQzIe5S8TiqZ2v9qdGr75L2/QjTsAdtxIN+aXytraVBfgguuCkMQyVt7QHH9sFr5e2VqtbJKlVz9nNffq3V/9+08BszlFu7r5qtFAYPGvW47AZQhENCK2j1cQ13NrRydXMN9GCdAu0v+SUqwQ9ItCoH0vlOA0V1rzF56qifqi0ixp01+R7w+B401taR0vT6Xs+o+JNS595nAab2vGhPVikIkGJuwcHibmptVJENnqnIs26PMCtCMi//6gIB4lhH2zA9whQvBpzJ3GxXoPxhM8h5eWObpdXLIX0eD6QzMGaluEXhmhiZnVCMIhVHWBOmKBQ5fZk77viMj4fsJ5B7G52VkVijJ6nRy0JZ91s+BQv+fAC0f8wNiEAk4Nfn2QSpbJd4sV7jVTp48I8ZBMTJKLZzzjvqMW5g7XpDnZZM2j6UR+dLbbF2n3LrA1Nc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(23010399003)(1800799024)(11063799006)(4143699003)(56012099006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?chRFZjpWUix8CDtv4R3gjOPOJ09viPQErjq4sHYUshIe/GCfHC0FylUf6L1o?=
 =?us-ascii?Q?tLHWDzHxWQDcs/9fA2M230dJCb8HWJVTED19qs0Ln6TMVA7FtEfw1k8WgSL+?=
 =?us-ascii?Q?U1pkn5pinFWXTuYdakTYOqKyHy+qrJJ4zOBjaflLxZmTFx0QarQUk/2MLd/A?=
 =?us-ascii?Q?4+DnkTfpw5oMXd+D6/xLqt591TcRc6uS16RWiE+8h2Or5Wjz+2yk90NEq1wH?=
 =?us-ascii?Q?ZOi+vRrE4IW6Y19YFYFzY6BXHVEyUKqdEkxdMd4ZTXvZBrKPPJUTwz/96P0G?=
 =?us-ascii?Q?3AQcHh7mQBT28LPiqAvfQrnaoC1n1VBev0YTyrPJz949nF8cxNVfkVb43XUB?=
 =?us-ascii?Q?uGcqWkCOOdKKfAw5WcLTQD6fjtAnmvr7Mmg6yOBnbiqTam56J/D4ulmm13Ys?=
 =?us-ascii?Q?jabCANK1ISJdAp6wKEbHXz1EnhveRZwNiE1DAp6HCK80QBvEUwkLR5ie8v5Z?=
 =?us-ascii?Q?EudqkDqFbJyy03X6ooyZydAm46x0J3bA7/h5A+lBdAYicUnXEffuws7GV64x?=
 =?us-ascii?Q?otYs0prfOv7w6424M5lY7UbPyQCKiKf8CDfAijPSHE8lRE8uxjpgdMqku2n4?=
 =?us-ascii?Q?KKe0MpIkZ22p9PlbG0FT+p0a7nmV4xfLqodaYGMzAqjkNxxm48iRNSaP+XAC?=
 =?us-ascii?Q?BTWHkuDD30oFLf6PcdYS+JbOnNFtc5zewC1/aoMgb6xFh0E6Vk2d33+RZfoU?=
 =?us-ascii?Q?0leHxgjBKmtHc1F7979UCHD3rBhdh6SnDQKr56FMzO5qQ7Vo2ZzIco0n9Yz1?=
 =?us-ascii?Q?3snYNRt0GgITIhQLj16cSXEJM49R3E2nTx30H8i114d5xdK60M6Xb5xzp31B?=
 =?us-ascii?Q?insyWBeJ5vWnAX32ypgu8ig8b7ShfBtHm7ZLgqtTY5OqyFOnyKSFiaFU1AUk?=
 =?us-ascii?Q?AxaOhskshZjXK165rjtpooRdZqtd0oDi1CWOmFoMltxohO5Pli5NxEOPUgFY?=
 =?us-ascii?Q?YPEY2xapPTueUy8ndpKX7zHwPs429FloK8qQt11l5edfPF/MMmoSCRTlaIZF?=
 =?us-ascii?Q?yFVNrTYQQz8gEUPQYOWjqgxjtbT/ZR7Yem4WmI2k/GrEd1etsbAEb9hxaXA6?=
 =?us-ascii?Q?JBGqdehBVuuw0Ywrt991YRhaC6Abu5c/wp3639+nYcGs+4CJWJie8UgZCjRQ?=
 =?us-ascii?Q?JQJ8CFkH+TaCGXQeOkusVAfflKwWt03PNlL96P6dswQGveJa21Z4DNa2E1M4?=
 =?us-ascii?Q?yAeaTDavJyR5P8QSjrgaZ3pTU9G2MgFCyy9uTfqNm+nPqAOCaCV4CPc00KH6?=
 =?us-ascii?Q?KAUwhPDfVc8i7J+05Qi1FpHV9ld5MifryvkIqtnxxwaqyqdPQfHxF7J4icyh?=
 =?us-ascii?Q?CF+vSrF65YhNl3fkOoPzNW14+aiOsacLOR3izcLKlh7aP0SpKCzXm52l7x8K?=
 =?us-ascii?Q?kjd/UiUJwvlVM9RNQ47kx+XvswgHIB6n6YZN/jnEiHFqQ9ycCGtbhlfa4p4a?=
 =?us-ascii?Q?pCWqkJevEY8h/UmAS8avEl2MDXAZ8+vhkYvekSzWyao8Bmv0q9QQCwcO26zf?=
 =?us-ascii?Q?b9mfneCIJk49uRZGz7VEOG6/P2pvF/WzfgP39e5d+xtIUK2YkhZNRVvGv5xC?=
 =?us-ascii?Q?ICOiQ76FmmJK2FETW0QwUDcyTrAslcR1tgQ3thO1moYVfhNQGjOC6YCl99+Z?=
 =?us-ascii?Q?VYGRU9LOWDdLssDBvgb9nzPt/iriM7xuw0+ED6rWeLcGu4ct3aVcxTgynb11?=
 =?us-ascii?Q?T/OBPReUtWxLPs8GwUF/EQXMz1ANcpVrc4w1gx1VTmFGU4HVOmovwNngyK+r?=
 =?us-ascii?Q?IM1Ub/XjQdWnyes6JL7kelsv71q8MO5SbZdEpKOw3CsSOJfTXmTg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf81ee8-8dfd-4571-6efb-08df2092ae4a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 14:37:27.3951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UtukmIiPgGGztBOlb55vC9BV+8cNL644HC7Dfw8Xvn4joVxLAk84pFXX0jvtjw2QXJNKR3RDdM9mQmZeJz38HxUgK7FrMH2cnvKQEg3gC65hq5+RLn4cNZG/9iE9uP0z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On Fri, Oct 02, 2026 at 10:14:02AM +0200, Alexander Stein wrote:
> The generic setup like pinmux and lcdif <-> display connection is done
> in the mainboard while LVDS specific setup is done in the overlay.
> As this mainboard also supports parallel display the LVDS connection
> using an LVDS encoder is done in the overlay.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            |  4 ++
>  ...6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtso | 69 +++++++++++++++++++
>  arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi        | 64 +++++++++++++++++
>  3 files changed, 137 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtso
>
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index c5caca92ea10c..ea0799ba1893e 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -420,6 +420,10 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ulz-14x14-evk.dtb \
>  	imx6ulz-bsh-smm-m2.dtb
>
> +imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
> +
> +dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtb
> +
>  imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
>  	imx7d-colibri-emmc-aster.dtb \
>  	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtso b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtso
> new file mode 100644
> index 0000000000000..e44b7461001ea
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtso
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright 2018-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Markus Niebel
> + * Author: Alexander Stein
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	lvds_encoder: lvds-encoder {
> +		compatible = "ti,sn75lvds83", "lvds-encoder";


Can you check if shared one overlay files with
ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso

I suppose use the model between two boards.

You use two labels like

reg_lvds: reg_mba6ul_3v3: regulator { ... } to create unified label naming
for regulator.

GPIO can use nexus node to do mapping.

https://lore.kernel.org/imx/20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com/

Frank

> +		powerdown-gpios = <&expander_out0 3 GPIO_ACTIVE_LOW>;
> +		power-supply = <&reg_mba6ul_3v3>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lvds_encoder_in: endpoint {
> +					remote-endpoint = <&lcdif_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				lvds_encoder_out: endpoint {
> +					remote-endpoint = <&display_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&backlight {
> +	pwms = <&pwm2 0 62500 0>;
> +	brightness-levels = <0 16 32 64 96 128 160 192 224 255>;
> +	default-brightness-level = <5>;
> +	status = "okay";
> +};
> +
> +&display {
> +	compatible = "tianma,tm070jvhg33";
> +	power-supply = <&reg_mba6ul_5v0>;
> +	status = "okay";
> +};
> +
> +&display_in {
> +	remote-endpoint = <&lvds_encoder_out>;
> +};
> +
> +/* for lcd reset != #stkrst */
> +/* place r2021, resolder r2022 and iomux following: */
> +/* MX6UL_PAD_LCD_RESET__GPIO3_IO04	0x79 */
> +&lcdif {
> +	status = "okay";
> +};
> +
> +&lcdif_out {
> +	remote-endpoint = <&lvds_encoder_in>;
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
> index fd05479bbffc9..ba79bb9760806 100644
> --- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
> @@ -30,6 +30,21 @@ beeper: beeper {
>  		gpios = <&expander_out1 6 GPIO_ACTIVE_HIGH>;
>  	};
>
> +	display: display {
> +		/*
> +		 * Display is not fixed, so compatible has to be added from
> +		 * DT overlay
> +		 */
> +		backlight = <&backlight>;
> +		status = "disabled";
> +
> +		port {
> +			display_in: endpoint {
> +				remote-endpoint = <&lcdif_out>;
> +			};
> +		};
> +	};
> +
>  	gpio_buttons: gpio-keys {
>  		compatible = "gpio-keys";
>  		pinctrl-names = "default";
> @@ -299,6 +314,17 @@ se97b: eeprom@51 {
>  	};
>  };
>
> +&lcdif {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lcdif>, <&pinctrl_lcdifctrl>;
> +
> +	port {
> +		lcdif_out: endpoint {
> +			remote-endpoint = <&display_in>;
> +		};
> +	};
> +};
> +
>  &pwm2 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_pwm2>;
> @@ -466,6 +492,44 @@ MX6UL_PAD_UART2_CTS_B__FLEXCAN2_TX	0x1b020
>  		>;
>  	};
>
> +	pinctrl_lcdif: lcdifgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_LCD_DATA00__LCDIF_DATA00	0x79
> +			MX6UL_PAD_LCD_DATA01__LCDIF_DATA01	0x79
> +			MX6UL_PAD_LCD_DATA02__LCDIF_DATA02	0x79
> +			MX6UL_PAD_LCD_DATA03__LCDIF_DATA03	0x79
> +			MX6UL_PAD_LCD_DATA04__LCDIF_DATA04	0x79
> +			MX6UL_PAD_LCD_DATA05__LCDIF_DATA05	0x79
> +			MX6UL_PAD_LCD_DATA06__LCDIF_DATA06	0x79
> +			MX6UL_PAD_LCD_DATA07__LCDIF_DATA07	0x79
> +			MX6UL_PAD_LCD_DATA08__LCDIF_DATA08	0x79
> +			MX6UL_PAD_LCD_DATA09__LCDIF_DATA09	0x79
> +			MX6UL_PAD_LCD_DATA10__LCDIF_DATA10	0x79
> +			MX6UL_PAD_LCD_DATA11__LCDIF_DATA11	0x79
> +			MX6UL_PAD_LCD_DATA12__LCDIF_DATA12	0x79
> +			MX6UL_PAD_LCD_DATA13__LCDIF_DATA13	0x79
> +			MX6UL_PAD_LCD_DATA14__LCDIF_DATA14	0x79
> +			MX6UL_PAD_LCD_DATA15__LCDIF_DATA15	0x79
> +			MX6UL_PAD_LCD_DATA16__LCDIF_DATA16	0x79
> +			MX6UL_PAD_LCD_DATA17__LCDIF_DATA17	0x79
> +			MX6UL_PAD_LCD_DATA18__LCDIF_DATA18	0x79
> +			MX6UL_PAD_LCD_DATA19__LCDIF_DATA19	0x79
> +			MX6UL_PAD_LCD_DATA20__LCDIF_DATA20	0x79
> +			MX6UL_PAD_LCD_DATA21__LCDIF_DATA21	0x79
> +			MX6UL_PAD_LCD_DATA22__LCDIF_DATA22	0x79
> +			MX6UL_PAD_LCD_DATA23__LCDIF_DATA23	0x79
> +		>;
> +	};
> +
> +	pinctrl_lcdifctrl: lcdifctrlgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_LCD_CLK__LCDIF_CLK		0x79
> +			MX6UL_PAD_LCD_ENABLE__LCDIF_ENABLE	0x79
> +			MX6UL_PAD_LCD_HSYNC__LCDIF_HSYNC	0x79
> +			MX6UL_PAD_LCD_VSYNC__LCDIF_VSYNC	0x79
> +		>;
> +	};
> +
>  	pinctrl_pwm2: pwm2grp {
>  		fsl,pins = <
>  			/* 100 k PD, DSE 120 OHM, SPEED LO */
> --
> 2.55.0
>
>
