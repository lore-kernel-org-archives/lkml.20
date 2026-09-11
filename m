Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943C236197E;
	Fri, 11 Sep 2026 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137743; cv=fail; b=MLQSsnVJ4E1SsHH1HD5CUlY8snvl5wePZEP7F//nZkY5BZyADDaqLusUEKOTrv1MEPfO2JDvnzPHNO+5wlxBO7X4A5KHs3rhYsX7e4EuwIxNEOkzdX5OpEv0Wghtbk8/hJOgkEcR5kiYqc2PiGBxJqvFmEImyI3wnE6OCVBdBjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137743; c=relaxed/simple;
	bh=0bkvtN9pn9DigXjpD1uXQXZmAP6Wv7LMlgzi2BfHf74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QbUAnsZix9q5V5VTUYDJ+WsXYSr33njxLDZIEHk2hSeXD0fAros4oy6Dh4hYCyJeUbkgRGHBivBudKMr1GvbRIrxsrsGXyZytmaT7R4UeVz08xDRbcZGd4UOhDG7l84j1AwTJ1/7ycM0J72q6Yao8QHkSoUX+BiXZ5f2EIOCTXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hABOk89c; arc=fail smtp.client-ip=52.101.66.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hABOk89c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mY3CBlmaaiDDsbMvxhstbX/GoDpqn8LCXhJCPDVEXKKq8nNW7kCXy+OC6Cf6LMbG9mJxOulox6qVBY0acGULlhXZdq1cLUutzcHBH9VmbcAbmLOY+ssPAXr0QixTUPwfcCOaI2Zmmpd9eK+r0Lp8CzNW1SB1fsW/G8Oydcq33Tmvg+vyQasYkRK+Ar6ldeYOYUgxsHdxWeJzLylvwroVdK7Zwg5AvIkxR/L6mDLJbN28dQufjLIKgDKeV9aDv+Sp939tcHtE6VGpBFMqrNGURqt8JMJSXfXu982NnqBhB/dlWSjgS04wrFqDulNBKxZFTSufl12S0OST8mTYKOnR5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLNYSItpqauwEflTrc+CaKNGkN9RI/IR/hd/+cvIUQQ=;
 b=MjM450DYhaZrntC9R/i1xIv0saxfakGbfCFyVHyDEss1lqMSgJymaUhMkyoTl3V8JFGz9a4pCS/u27aa0EIxWAuHF02xbHIO/2YZHFM8MbhCasH5OqX331e0W0dRYa1DTsPC7RLg/+Y9mqKEDpvo1XuX6QI0hxm1pLR6R2i7giTGX52tpy/rS+kK+bCyl6VnPOP98tGjg/n3LmOGVtc33IVIymm5b8Vbu3F+YJKR8B+C55rEJhvePRZTMmWdQd7AGi7H3HqfoZYd6DgyUq9HfImBYt0MpFpPTSgJHyFceTUnm3sW/1PSaFPfR6YWIFWOIZFepLWPR2bG+bCyerSvug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLNYSItpqauwEflTrc+CaKNGkN9RI/IR/hd/+cvIUQQ=;
 b=hABOk89cEFBv0FlzrE5xziBgVLkoBUSX0M+mC1xWNaV2xgyfb+hgVOpbF2ReXkQ5zCt9C3HpGNprS4SdC8SbwkTKsbLW+PheZi1DP2zug4rP1aL26/o+eIb11O2OdlWvWB6nROHDpE0EZTBVefJA3YnXapr09IUJoAFj05gpHWowFcJ7z+MPZsDu3T/Y8jhEUDZKfvxiwlsrfoNJTH9S+GI5d9bdgeVIPRk+cbKPROjafI8GZMxIYcPGSjbxMUiJrBhixQIp+KYZeOzP4rLVscNFW81RJleh2sjd1ktIBbDKyBImaWnGkApbXjeOJSKEoa4el9nhrkgg3qTzM9Q59Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB11676.eurprd04.prod.outlook.com (2603:10a6:102:50b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 14:42:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 14:42:13 +0000
Date: Fri, 11 Sep 2026 09:42:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: vjardin@free.fr
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/3] arm64: dts: freescale: add Nodebox v3 CPU Module
Message-ID: <aqQTOx4M3FqSJAYZ@SMW015318>
References: <20260911-for-upstream-nbxv3-dts-v4-0-2fd07d5575ab@free.fr>
 <20260911-for-upstream-nbxv3-dts-v4-3-2fd07d5575ab@free.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-for-upstream-nbxv3-dts-v4-3-2fd07d5575ab@free.fr>
X-ClientProxiedBy: PH7PR17CA0064.namprd17.prod.outlook.com
 (2603:10b6:510:325::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB11676:EE_
X-MS-Office365-Filtering-Correlation-Id: d9cbefbc-9ed8-4e7c-759c-08df1012de32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|7416014|4143699003|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006|11063799006|41080700001|15866825006;
X-Microsoft-Antispam-Message-Info:
	yjVMqOAUPCt/MZL2DCrj3rd0xa/zo4Fd/Ujrv0CVMdoQN+TZlJk3/CltIebGGEKpKWv9JY2bdp3Gc5PjK9CYz9ylgDGtjF9i6/nuARLC7F228iPdhYwZHlfYaCYfkm2pQIRVtsSNcqgv4k7+PnXER+nDN89iJE+4ZZzzvOHjER/PjI5zt/4rSA5EbwB5/kOo867p3y7dnBIACFu5zQYs3en9V0IUbAuFw+bjFI287n0hz4IRhEY6vnoAxvkTDjexDyp1OrmZEKMKclJKbJuav4xYjvK+M1z45FZ6FtMTkYTEnyzN5BRn7RIIp1afcSz2KIeTVpeonT8Jj9MqARBoC1JLrEeThMtU9aXysibR0wTCHTqUH543X4Y4sLuE3gkVv0d6N8avoTLXvzYQ/9k9i2jiKeggvcyG/wSXra6KphlWcNvI/6EKEdiGlyUcAqDYOkuWWX60rJFG5+b9aCU6NOaWhgeDzm12QDeGa2JM+BpBrmFCHaCVIN0WsyKItlAPepNIbaxBc4CS3JXoNFdka4avLl+YqaIdmjj/qCoyz99pYgj+qbqQdQhgAsZT6PZSpvulE6oY8yR8yNwrz12k1An6urdQAXaSTmrmdvPUBwbaWo/lJGLTcs+m0bq9zwcL/QC/y0qMRN2ZCnpuMqcvF3aiPICv93dNmHrDaYha+ElQ/MaFATgAcxaEtMjzIsI+uUHtobATBWnWAfjj0D1mogPexEn6MoTw0kS6iC1t/y/WGFL1XdZDGmi+KsVmWAxu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(7416014)(4143699003)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(41080700001)(15866825006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wYEc5YsNyLUROd+VuOZ8k0jwiio9M+Gp4ItxHLXMM7XNlN2aZ1Gf1qI/ILhN?=
 =?us-ascii?Q?QixUhQJTogSM1qH5J76WHE0cgkiwL1v3FDbkVv4+qi+a9HgyI2MlVr2aLsS+?=
 =?us-ascii?Q?fDzBwhtYuqUNQsy+SpzYrOR2SIKLoqFPKynCdrkRKzmAVA8r5sEFsuKUz31l?=
 =?us-ascii?Q?Cz+aZansDWmVhiBoPezPwN49r4BJOpx5w6iOZ5jTDKSaAw+ZesCfKOdD66Q5?=
 =?us-ascii?Q?MlOq0LZgNRh86a42wpueLYB2OIRZWMSKzcuK8FTEC5KkZ+l88NiYjKYmAuKv?=
 =?us-ascii?Q?9kUjCrNVHAfzjVLC2g72oGg7/9sLf+dOMRVRsHkxFLG5YW4Qoci2VM4Oids6?=
 =?us-ascii?Q?u+hq1VdG8gPpDV8sYoxjA/aIVN3AX/LD7tHmQa7GzmIhG5gMJzzJ5chaNRhq?=
 =?us-ascii?Q?mbZjymquaJbh5zcJ/qQ0blOWmuwgGmAhJY5OcXAtTM2y2N0qPspoem2xfFMX?=
 =?us-ascii?Q?O6FKe1DdxJb0mrp7yWrGAdTBcswly6CtssUGLBUgHDQ/MnkhNfEBb2xf8IiB?=
 =?us-ascii?Q?SVk/0dJ/8tcDbSDz7WSY3hyENVUIrTmJIXrNEr1R7rtkPn0f4LQbGABW6657?=
 =?us-ascii?Q?B7HsWWTyOR7J8jSm6HayJSxJIFQ7NMH0nwnvUkK/r18vYTWF3utAj3bCB2cT?=
 =?us-ascii?Q?23KAEq19kR3Evox78+3wrOh3pteKA/YkmPNg0WR8hXWN0B7PcNwUXHHnU+nU?=
 =?us-ascii?Q?xZGXs09OWssH5Ml88RsdzgITz3x70HVJJ/P8Oyhux7PLdS3c2EKUz54/ux5L?=
 =?us-ascii?Q?1+7atWCwITfVZVfea8zscPRji9N+D+zDIKXBVtJTjN6SVeWE4G4k832og3Y+?=
 =?us-ascii?Q?QK/bN3TV8eIpll4jmqX4pecezC6UVEp3FBXPEpUYshUC7f90J0t7B3OcL2yQ?=
 =?us-ascii?Q?TaA+2Dr99LTDT0cbuU5kaRW6R13mhwkgs79GJvyLV2/gxa6yy4NxEQWH2dxJ?=
 =?us-ascii?Q?nU+QaSVnV9KqO0BjlKctTcwIAGPvdPLT573Rmd9u4TiofErhdeiVSXtS2fb6?=
 =?us-ascii?Q?ptZT97BM0aIyXrCJVoYezOPHBKMpqwa2NGslFH6HVvI+uD9vDfahOc2iUAOy?=
 =?us-ascii?Q?w12Kc7y0m49ZsIiETohI/gZXOJaEInG6UEQ4Mb2xJPfNqOPzoFPPvaxRfQCR?=
 =?us-ascii?Q?+ZIWYjx5xmlu4u9X4st/WqnjOb3likdXJT3gtuQw+Xify6t3DI9XjFzMZGAn?=
 =?us-ascii?Q?NzzUct2VOOMyRDJ/Nr2YgZhapr8C6HB7T5oSDaXbDS7apmN2qi9LOu/rvAfv?=
 =?us-ascii?Q?S4ZTKRR0Tysho/xq3gDSmAOKI1KeAWVsJ0rIOz2jG05bqg78LN1k4vzsI5Ja?=
 =?us-ascii?Q?rW/wJgtUUBUnHPQPGDxaIw9vMwdhuWWRkpLqM7rTO28gs/IFosYvU0WZu6S2?=
 =?us-ascii?Q?GRKkTi1rXVvI5E8Bvg9itRqkhPQYK4k5gRMGVRr9k2LTn2M/BN4khV8ghhyC?=
 =?us-ascii?Q?+CLUV1x7HJy5wOAOjuFEh3Cvrqzpuaxr3puLU5EBtD6y8zXSfUNcV6vIp2FD?=
 =?us-ascii?Q?KolTQeYcnDyX7R4LzXhUeMQxAUjr5tA49cf+W+Z6pyRlW6nI/paGueLSEpfT?=
 =?us-ascii?Q?LE9Y/AvIkKCeIOEtcNY8zDV9Hdn0IhZ3QHYH4D/MWveN9mo91n4D2jYtKNFF?=
 =?us-ascii?Q?RfPWvp0CVTeZxWsqk74lfMi/B00V9gjso+G+xwdH2HIA8GPhGruJVl2N8ZC9?=
 =?us-ascii?Q?495lFb528oCjCdussOIKTR/odqO5bQVDXlYklkl2QYOY62LjeQOd7AoLsApJ?=
 =?us-ascii?Q?pnoY0VGuUuZCCmZ5GEcHt6+6ePyF/b9jUTE1lpuqGH76GJ7vX3/U?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cbefbc-9ed8-4e7c-759c-08df1012de32
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:42:13.5079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uF2Dagb3dnCZATh2rPUC0qEoDsK5RQLpBPEl2apGBpCc52NVYdwPr8N9whanliNDxQWJNiYDSPKk56rhFJ/rMQhoqWtI9ceIXm0jA7TC7ZJTIk6csm0BBpxG4jU1+GZD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11676

On Fri, Sep 11, 2026 at 02:08:35AM +0200, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
>
> The Nodebox v3 is a Free Mobile CPU module built around the NXP
> LX2160A (16x Cortex-A72, DPAA2).
>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>  .../arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts |  34 +++
>  .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      | 321 +++++++++++++++++++++
>  3 files changed, 357 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 95ae85ab4adf5..faab8bf0e1676 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -55,6 +55,8 @@ DTC_FLAGS_fsl-lx2160a-half-twins := -Wno-interrupt_map
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-half-twins.dtb
>  DTC_FLAGS_fsl-lx2160a-honeycomb := -Wno-interrupt_map
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-honeycomb.dtb
> +DTC_FLAGS_fsl-lx2160a-nbxv3 := -Wno-interrupt_map
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-nbxv3.dtb
>  DTC_FLAGS_fsl-lx2160a-qds := -Wno-interrupt_map
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-qds.dtb
>  DTC_FLAGS_fsl-lx2160a-rdb := -Wno-interrupt_map
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts
> new file mode 100644
> index 0000000000000..b07e9def0a529
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Free Mobile Nodebox v3 CPU Module (LX2160A)
> + *
> + * Copyright 2026 Free Mobile, Vincent Jardin
> + */
> +
> +/dts-v1/;
> +
> +#include "fsl-lx2160a-rev2.dtsi"
> +#include "fsl-lx2160a-nbxv3.dtsi"
> +
> +/ {
> +	model = "Free Mobile Nodebox v3 CPU Module (LX2160A)";
> +	compatible = "freemobile,nbxv3", "fsl,lx2160a";
> +};
> +
> +&fspi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&fspi_dqs_sck_cs10_pins>, <&fspi_data30_pins>;
> +};
> +
> +&gpio1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gpio1_31_28_pins>;
> +};
> +
> +&pcs_mdio13 {
> +	status = "okay";
> +};
> +
> +&pcs_mdio14 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
> new file mode 100644
> index 0000000000000..143b24d69d629
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Free Mobile Nodebox v3 CPU Module (LX2160A)
> + *
> + * Copyright 2026 Free Mobile, Vincent Jardin
> + *
> + * This file is shared by the Linux kernel and U-Boot.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio-restart {
> +		compatible = "gpio-restart";
> +		gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
> +		priority = <128>;
> +	};
> +
> +	reg_ethsw_mdio: regulator-ethsw-mdio {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ethsw-mdio-en";
> +		gpio = <&gpio3 25 GPIO_ACTIVE_LOW>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};
> +
> +&crypto {
> +	status = "okay";
> +};
> +
> +&dspi0 {
> +	status = "okay";
> +
> +	dpll@0 {
> +		compatible = "microchip,zl30733";
> +		reg = <0>;
> +		spi-max-frequency = <12500000>;
> +	};
> +};
> +
> +&dspi2 {
> +	status = "okay";
> +};
> +
> +&dpmac13 {
> +	status = "okay";

status should be last property before child nodes, check others.

Frank

> +	phy-handle = <&lan8023_phy_s0>;
> +	phy-connection-type = "10gbase-r";
> +};
> +
> +&dpmac14 {
> +	status = "okay";
> +	phy-handle = <&lan8023_phy_s1>;
> +	phy-connection-type = "10gbase-r";
> +};
> +
> +&dpmac17 {
> +	status = "okay";
> +	phy-handle = <&rtl8211fd>;
> +	phy-connection-type = "rgmii-id";
> +};
> +
> +&emdio1 {
> +	status = "okay";
> +
> +	/* Microchip LAN8023 dual 10G PCS/retimer, Clause 45 only, one address per slice */
> +	lan8023_phy_s0: ethernet-phy@2 {
> +		compatible = "ethernet-phy-ieee802.3-c45";
> +		reg = <2>;
> +	};
> +
> +	lan8023_phy_s1: ethernet-phy@3 {
> +		compatible = "ethernet-phy-ieee802.3-c45";
> +		reg = <3>;
> +	};
> +
> +	rtl8211fd: ethernet-phy@6 {
> +		compatible = "ethernet-phy-id001c.c916";
> +		reg = <6>;
> +	};
> +};
> +
> +&emdio2 {
> +	status = "okay";
> +};
> +
> +&esdhc1 {
> +	status = "okay";
> +	bus-width = <8>;
> +	non-removable;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +};
> +
> +&fspi {
> +	status = "okay";
> +
> +	/* GigaDevice GD55LB02GF, 256 MiB boot NOR */
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <150000000>;
> +		spi-rx-bus-width = <1>;
> +		spi-tx-bus-width = <1>;
> +		reset-gpios = <&gpio1 28 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&fsl_mc {
> +	status = "okay";
> +};
> +
> +&gpio0 {
> +	status = "okay";
> +	gpio-line-names =
> +		"", "",
> +		"altfn:iic1-sda", "altfn:iic1-scl",
> +		"altfn:uart4-sin", "altfn:uart4-sout",
> +		"altfn:uart2-sin", "altfn:uart2-sout",
> +		"altfn:uart3-sin", "altfn:uart3-sout",
> +		"altfn:uart1-sin", "altfn:uart1-sout",
> +		"altfn:spi3-pcs3", "altfn:spi3-pcs2",
> +		"altfn:spi3-pcs1", "altfn:spi3-pcs0",
> +		"altfn:spi1-sck", "altfn:spi1-sin",
> +		"altfn:spi1-pcs2", "altfn:spi1-pcs1",
> +		"altfn:spi1-pcs0", "altfn:spi1-sout",
> +		"altfn:iic6-sda", "altfn:iic6-scl",
> +		"altfn:spi3-sin", "altfn:spi3-sout",
> +		"altfn:iic4-sda", "altfn:iic4-scl",
> +		"altfn:iic3-sda", "altfn:iic3-scl",
> +		"altfn:iic2-sda", "altfn:iic2-scl";
> +};
> +
> +&gpio1 {
> +	status = "okay";
> +	gpio-line-names =
> +		"", "", "", "", "", "",
> +		"cfg-rcw-src2", "cfg-rcw-src3",
> +		"reset-req-b",
> +		"altfn:sdhc2-clk", "altfn:sdhc2-ds",
> +		"altfn:sdhc2-dat0", "altfn:sdhc2-dat1",
> +		"altfn:sdhc2-dat2", "altfn:sdhc2-dat3",
> +		"altfn:sdhc2-dat4", "altfn:sdhc2-dat5",
> +		"altfn:sdhc2-dat6", "altfn:sdhc2-dat7",
> +		"altfn:sdhc2-cmd",
> +		"cfg-svr1",
> +		"altfn:xspi1-cs0", "altfn:xspi1-sck",
> +		"altfn:xspi1-dqs",
> +		"altfn:xspi1-data0", "altfn:xspi1-data1",
> +		"", "",
> +		"flash-reset#", "pltrst#", "", "ethsw-reset#";
> +
> +	/* Platform reset, no consumer node: released at boot */
> +	pltrst-hog {
> +		gpio-hog;
> +		gpios = <29 GPIO_ACTIVE_LOW>;
> +		output-low;
> +		line-name = "pltrst#";
> +	};
> +};
> +
> +&gpio2 {
> +	status = "okay";
> +	gpio-line-names =
> +		"lan8023-mdint",
> +		"i2c2-alert#", "i2c4-alert#", "i2c6-alert#",
> +		"u800-tca9539-int#",
> +		"spi3-alert#",
> +		"wake0", "wake1",
> +		"carrier-hot#",
> +		"u1300-rtl8211fd-int#",
> +		"ethsw-int#",
> +		"", "",
> +		"u1700-zl30733-clk-gpio0", "u1700-zl30733-clk-gpio1",
> +		"u1700-zl30733-clk-gpio2", "u1700-zl30733-clk-gpio3",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "";
> +};
> +
> +&gpio3 {
> +	status = "okay";
> +	gpio-line-names =
> +		"altfn:ec1-txd3", "altfn:ec1-txd2",
> +		"altfn:ec1-txd1", "altfn:ec1-txd0",
> +		"altfn:ec1-tx-en", "altfn:ec1-gtx-clk",
> +		"altfn:ec1-rxd3", "altfn:ec1-rxd2",
> +		"altfn:ec1-rxd1", "altfn:ec1-rxd0",
> +		"altfn:ec1-rx-clk", "altfn:ec1-rx-dv",
> +		"", "",
> +		"ptp-refclk-in",
> +		"", "", "", "", "", "", "", "",
> +		"u1700-zl30733-pps-out",
> +		"",
> +		"ethsw-mdio-en",
> +		"usb01-oc#",	/* USB1_PWRFAULT and USB2_PWRFAULT share one net */
> +		"",
> +		"usb01-oc#",
> +		"altfn:spi3-sck",
> +		"", "";
> +};
> +
> +/* On-module management bus */
> +&i2c0 {
> +	status = "okay";
> +
> +	eeprom@52 {
> +		compatible = "atmel,24c32";
> +		reg = <0x52>;
> +		pagesize = <32>;
> +	};
> +
> +	/* Board ID straps */
> +	gpio@74 {
> +		compatible = "ti,tca9539";
> +		reg = <0x74>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-line-names =
> +			"boardid-0x0001", "boardid-0x0002",
> +			"boardid-0x0004", "boardid-0x0008",
> +			"boardid-0x0010", "boardid-0x0020",
> +			"boardid-0x0040", "boardid-0x0080",
> +			"boardid-0x0100", "boardid-0x0200",
> +			"boardid-0x0400", "boardid-0x0800",
> +			"boardid-0x1000", "boardid-0x2000",
> +			"boardid-0x4000", "boardid-0x8000";
> +	};
> +
> +	u800: gpio@75 {
> +		compatible = "ti,tca9539";
> +		reg = <0x75>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> +		gpio-line-names =
> +			"carrier-gpio0", "carrier-gpio1",
> +			"carrier-gpio2", "carrier-gpio3",
> +			"carrier-gpio4", "carrier-gpio5",
> +			"carrier-gpio6", "carrier-gpio7",
> +			"carrier-gpio8", "carrier-gpio9",
> +			"carrier-gpio10", "carrier-gpio11",
> +			"", "", "",
> +			"lan8023-rst";
> +	};
> +
> +	/* +0V8_VDD core rail, MPS MPQ8646 (MPQ8785 core) over PMBus */
> +	vdd08: regulator@10 {
> +		compatible = "mps,mpq8646";
> +		reg = <0x10>;
> +	};
> +
> +	/* SO-DIMM SPD temperature sensors */
> +	temperature-sensor@18 {
> +		compatible = "jedec,jc-42.4-temp";
> +		reg = <0x18>;
> +	};
> +
> +	temperature-sensor@19 {
> +		compatible = "jedec,jc-42.4-temp";
> +		reg = <0x19>;
> +	};
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +};
> +
> +&pcie3 {
> +	status = "okay";
> +};
> +
> +&pcie4 {
> +	status = "okay";
> +};
> +
> +&pcie5 {
> +	status = "okay";
> +};
> +
> +&pcie6 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&usb0 {
> +	status = "okay";
> +};
> +
> +&usb1 {
> +	status = "okay";
> +};
>
> --
> 2.43.0
>
>
>
