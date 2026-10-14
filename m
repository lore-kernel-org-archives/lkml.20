Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312CC535FC9;
	Wed, 14 Oct 2026 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986485; cv=fail; b=oxa9Ou7uVA9r2M+I34Uy2azzezV1mtQ/D7cuBfIH0C82m85eGc4QSXrUf2+U8iQ83nht2JcX1AnKHKY8vidorHEb1hUZIyLcv/j1pFPvw7LOJ64G4vSWuTU4kA7CuXYZE4IRQGqNVAWmYKasOW9y22N7kbJBw9KWP9OctbgcO+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986485; c=relaxed/simple;
	bh=v6e0Pk7DoDq5A+W+bbNL9Fmvbp1aov0/HFfCjeIfDiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X8CVsxEv8YC/deuFTaMKXVAMRVsPlcsCL/ClrvxiQeLJ8EdDNWmRE/ELG/R5vfW4DX51UG+jwMd7nxWlF0ML5Xu120fk5WG5tMDNMQLa0MKi0k97QQRehh8wLJ+mTSYsaNqHTZLWm8lzEkjphK7OxQ1RyI7mCf+C/ik7XFq+ygE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Bs4LUEWE; arc=fail smtp.client-ip=52.101.69.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Bs4LUEWE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAhSEqH7Rzv3BD+xtp1VaNDnZE5M4cHeZPWH4t+7u/dq6UqKGMTb9JWNFcVM8vpqER94OkQZL+zw2idBs5Z1AmDEF/5Er65fjiVtxCT8yFnb3Op/rW07lNwLeqXlxJDaMzuudjF4cnr44quN8lrgbOLqmLlrWpIg/aEiryTP8/tIdTKFU0xo16cilPrkXj9xVK0DBGkboPYRsaazBbE7xs5WbOTO28E2eSeWsn3V2+pAHMeBRhLYW4atDKC0Ojlk2rDMVnA75jX4gQBksZoCZ0hoxRPGBoNXSzOuNLvvm+1OjUZLRtUdBh5jWbaaGu/Qy0gf0GVBnaDgmK+lHF5hZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eh0fb6mxjQfV8C6oGy7c03WfalWm6dcl0C1kvYE/KI8=;
 b=YSAjwfKTHjsyV8a4VxDC0E+x/azWkJvHXPNLf89Zm3+I/WtCDR5CpbCzOugPsbvDohjUn9NtODEZSOYLGqf/fU3mjx/jec1Mw3ykc08HMNTgRKOzRW5EvyL7sbLM41Sr92I9l3tzJToAKmdherb3XpolhkaebM6VuWvnC/49gqnS5DGZGwItIzk6Z2/uzok3064sce09A41USiR/q+J1ClKP+opQmVO/zc5fNAtYkOd+9L5a3UIU78DjhtR992V6PrnJS7NGLsT589zVqvwxnkbJx0fnE43dyz5lSfWMSAmYH1z1mtAwsOr3PXphcEhc/o5za8RvfGUGcY0lKz6RSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eh0fb6mxjQfV8C6oGy7c03WfalWm6dcl0C1kvYE/KI8=;
 b=Bs4LUEWEIW+M9O0gGzBATaXp2tqyf554ds7zQho6R6T5oZXc72MZx/Rw+ANAchrdA9qxViuap+vfvMfSd8FmUAJpdohlRPcMGOZ6Yjnp19xWQSRLwPAfI5hxM4PCHTK/ZJJbEiAg2xVdKRcP/xnfXonkOPlG1J+cYBjEBGN4SIg4Mh802Fgs+ytKg08frRnbT7zAcvCJz1s3nWDpKdCWtDyEuBXKNPyO9eksIL7Af6ibBgPjcD+eAbXVMaXE+Sj5lRiz0Kp3hGdcKxbthXsWTkqVIZfSHeHOeadI78yh9LySwCOyspRRqDNdBoMzz2G7Z/yIWFUKrKGsptduMDVB2g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MIWPR04MB710340.eurprd04.prod.outlook.com (2603:10a6:290:ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 14:01:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:01:14 +0000
Date: Wed, 14 Oct 2026 09:01:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, Liu Ying <victor.liu@nxp.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH v2 3/5] arm64: dts: imx8qxp: Add MIPI-LVDS combo
 subsystems
Message-ID: <as-LIGGpmBc1NJYj@SMW015318>
References: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-4-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014071657.118378-4-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: CYXPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:930:d0::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MIWPR04MB710340:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb8dd8a-4ce2-4b1a-6a8d-08df29fb9c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|7416014|376014|1800799024|10067099003|18002099003|22082099003|3023799007|11063799006|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	vV4j7/fA+Wl0Xhpe/IqQhbYd5iFFhqAI7w+LT4VDzOp4zi+upmdl7kmwSrMh+3xY+wWD9GmdbV7svfFXagEbictajwYihrQvU/2kBPoBpXrTXgO9is8J/D1Y+dt1LlRHcymHX3Wz25G8QyArOA/h4vuN34O6QS6wDnqA0ej7CClTtPVTees0gD1M0Mv+d/QQabg3y7AiUriqEMo6tnEiiftab02xBVuuu0DxF1tcPLZPoHlADXFZXBYJqyShXnNtCdnEyZ+8c8ZAXENMN6YKKJjUv1dGzxM/OzTHQl6ITOlox0+/40rJgZYdq+gYKYvH2Dw1qBO7HW0GbE4ep5J/xUB9mTJ5wPwO6VAJT0w0E9DkxxklS0h2e4ZmZKduuE6dsTxwD0ntMaYl1QKY1VlggxZM8jNBHHv0i8a4Drudp02nCgy5ueb2DpAvW3CGv+zvMTiLXdrn8PM5M2xXkIYhdhdcM6K86JyuS33sGxLu2QJ0xyvNslrz0zjWj3bmKgsb6zChSVWVh6swCA89476zgx4dCaEu0CYSUx+bRIKITYIeAL2IWVR6ehaPbUWiGfssxy/wtbQ/yYlxjdOIOZQ/GiBqE0nMPIvupYrJngheaZ/AVU9l3lVd7srh+KEvRO27vix8TQR+QW1OxkrDfrJBHzF/I3ZU3wQBgavfda0p5jE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(3023799007)(11063799006)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wWYSemMVuEit5bdLLLmWBEo9VNa9BoOMhYD4OFTaaimowOXEO8Ub3iRAZJhc?=
 =?us-ascii?Q?BjLMMA8HTcFrB+MTq583fIHJkuaB0Ifsz5KC/RqayTyJMf8k92WBBTNDysF5?=
 =?us-ascii?Q?3a7+0B4Z/g7Kc/ANs06rmvYaHK1JGTjarYcmRVA9z04TDyQYJSwYR3yjIXqy?=
 =?us-ascii?Q?kRoxDte0CS5yCS8MvBvziyRed5XcH1sWZR7AYT0LdvIB2wgvEPFvrfZTqfx7?=
 =?us-ascii?Q?mUXeP0L47muLZDQcIrH1LmEjF5/eCBgN/goFu0KdJ+DMkCd0FTyp2YgMknQl?=
 =?us-ascii?Q?YbcIL33Tg1XCOqB1sh+vnZR868ZnoMxhIx7/HwYzzVPbKyXQxuz+r+ta5KHq?=
 =?us-ascii?Q?mV1L83LAu5aTqJYFmISgxL7pd+OFjWGaja8mPo6LdZm64hJczi/SR6KBqPQU?=
 =?us-ascii?Q?CAwoK8XJSGAOowl3ovilhCXQoacbk8vSY/GlI5NznKMCANiXlubEQcbA6ODB?=
 =?us-ascii?Q?R9GG540icQv9qDdgbAYw5ssTYSNcjgwDHtCePYhff1twandpPv/zJwAXmNna?=
 =?us-ascii?Q?SGA/sVmkh7DIKOLYXAC/W9A+s2iARgg/AwGls9oqSMnP0NlHN4WGjfRUsiz/?=
 =?us-ascii?Q?Doo7YyK9zXr5FHc8IxQmLFjHGPjo62ezG0OuICmG4AeLHj02MoJ+hF4urknr?=
 =?us-ascii?Q?3v2s+YBqK10w0cjc5Ni9zE8bzQXLtcGK5d/VW0a/4kwO0cdTyHckttsslzkr?=
 =?us-ascii?Q?fRMD1acARf1M0j2W8MlPIZTrLx+aU1I1/3ZswkK0rF9KIj638nGUXDXZcroY?=
 =?us-ascii?Q?2GFTHkhmgbyOH3pop8JUeEaotfd9d69y5Y3EITLvBnU7nAAz0zTSHynKEWWo?=
 =?us-ascii?Q?ThXwukXUn8CePtGbh9cOV9b2oIVjMrmOCNN7Owg8nB1kR5eWWe7o7UEfrD/J?=
 =?us-ascii?Q?6iRfHB6zg9fF2wmd/uq2cMyse6CjKYnn/VPlHiJxcU5KOa5UGdckxKsHBT7W?=
 =?us-ascii?Q?oTeGZHl/F+AmHvDHHw2YnojmRicJit7Wh2/HRa5QKd0Npxehn/j5jSCNStJf?=
 =?us-ascii?Q?1RcI6MUEKsMVGEDG2XLKcxnTEWqiSeTZOeH2nhQWdZqXKeQ9XXGVlXa7TkXa?=
 =?us-ascii?Q?BsLY/b9VfInYcbvQZIteKiKPaFpXlAEsJSssz4A8khadLbMy/zZc20/DX45H?=
 =?us-ascii?Q?Y4b7VB4+jA95CVDvZ+49YHn18DRlO/QEa9looo/KWIWtUs5sMrTWZwInK7SO?=
 =?us-ascii?Q?2c2SoZYXQuKdyqGmRZZKuFUmYFloMStzPbvNn/6CKTHig7F62czHngnnUa7a?=
 =?us-ascii?Q?/2oPYAmZOPMx0w1T9PRpSyy4mYfTxsfQ72qvZjqOgPQ3LJ+5b4KPnsG+f6lg?=
 =?us-ascii?Q?SVamMQVoMD5EIj6MDPWdzapDmvkJmpwKBGti8ewxu3sLst196W8Q5sXNaz2w?=
 =?us-ascii?Q?yqQIc8Jv+8NeJUT7pJq+fKoqMaFe9M3Fnj+XRn4+pXqwpeMb6/SXHNXspCa5?=
 =?us-ascii?Q?p3DcKtv+MSINS3emTmwQ32g0rFnG6fEZLRWVCUQrVkSQx6eWrRwH44jpv+sP?=
 =?us-ascii?Q?w/wuhD5yTxyWhh902qCjRdeYf4F+u4L65rIkA05Re97A/RnPgkT19IbNkerL?=
 =?us-ascii?Q?LAeOh6D9uQIMIZU1wAOfQFWMVlyWe1PrFDGDOc5Zg6w1/alK0WZIOrGaF1A7?=
 =?us-ascii?Q?f9s5mvptarZQ7V1Zxkm2MGljc5rzn+ZZKG6SC6+sgVPTX0hWyNBiboiSIs9N?=
 =?us-ascii?Q?Jmgr3MZwoFSct627ccF7H9gWLTWHCl4Fk7QHbXHCsDSGcYVuUYzY/EpHaIpt?=
 =?us-ascii?Q?0Eugf/Bv61NKuUa87+gz7ump3jsK/YqLLHGXcurIJ8W4XD1f+fwE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb8dd8a-4ce2-4b1a-6a8d-08df29fb9c41
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:01:14.8301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sFlj0z8LX5Li6NWqm9EPc2lKX8PiZQ7/kkPjo8bK56mLgJb8lUv6qaYPkIV/matRyYz2GWKFPiEIYxKtFqRXgwT7g6kabqvTr70xnKQ6y0rTznVo5SkUy3yg2Xds4RD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB710340

On Wed, Oct 14, 2026 at 09:16:47AM +0200, Alexander Stein wrote:
> From: Liu Ying <victor.liu@nxp.com>
>
> The MIPI-LVDS combo subsystems are peripherals of pixel link MSI
> bus in i.MX8qxp display controller subsystem.  Add the MIPI-LVDS
> combo subsystems.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * None
>
>  .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     |   4 +
>  .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 443 ++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   3 +
>  3 files changed, 450 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
> index 647ee3348f494..9916a06669c87 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
> @@ -156,10 +156,12 @@ port@1 {
>
>  				dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
>  					reg = <0>;
> +					remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link0>;
>  				};
>
>  				dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
>  					reg = <1>;
> +					remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link0>;
>  				};
>  			};
>
> @@ -211,10 +213,12 @@ port@1 {
>
>  				dc0_pixel_link1_mipi_lvds_1_pxl2dpi: endpoint@0 {
>  					reg = <0>;
> +					remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link1>;
>  				};
>
>  				dc0_pixel_link1_mipi_lvds_0_pxl2dpi: endpoint@1 {
>  					reg = <1>;
> +					remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link1>;
>  				};
>  			};
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
> new file mode 100644
> index 0000000000000..67f5392cfc803
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
> @@ -0,0 +1,443 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include <dt-bindings/clock/imx8-lpcg.h>
> +#include <dt-bindings/firmware/imx/rsrc.h>
> +
> +/ {
> +	mipi_lvds_0_ipg_clk: clock-mipi-lvds0-ipg {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <120000000>;
> +		clock-output-names = "mipi_lvds_0_ipg_clk";
> +	};
> +
> +	mipi_lvds_1_ipg_clk: clock-mipi-lvds1-ipg {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <120000000>;
> +		clock-output-names = "mipi_lvds_1_ipg_clk";
> +	};
> +};
> +
> +&dc0_pl_msi_bus {
> +	mipi_lvds_0_irqsteer: interrupt-controller@56220000 {
> +		compatible = "fsl,imx-irqsteer";
> +		reg = <0x56220000 0x1000>;
> +		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-controller;
> +		interrupt-parent = <&gic>;
> +		#interrupt-cells = <1>;
> +		clocks = <&mipi_lvds_0_lis_lpcg IMX_LPCG_CLK_4>;
> +		clock-names = "ipg";
> +		fsl,channel = <0>;
> +		fsl,num-irqs = <32>;
> +	};
> +
> +	mipi_lvds_0_csr: bus@56221000 {
> +		compatible = "simple-pm-bus", "syscon";
> +		reg = <0x56221000 0x1000>;
> +		clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
> +		clock-names = "ipg";
> +		#address-cells = <1>;
> +		#size-cells = <1>;

Does any children nodes have address?

> +		ranges;
> +
> +		mipi_lvds_0_pxl2dpi: pxl2dpi {
> +			compatible = "fsl,imx8qxp-pxl2dpi";
> +			fsl,sc-resource = <IMX_SC_R_MIPI_0>;
> +			power-domains = <&pd IMX_SC_R_MIPI_0>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0>;
> +
> +					mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
> +						reg = <0>;
> +						remote-endpoint = <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
> +						status = "disabled";
> +					};
> +
> +					mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
> +						reg = <1>;
> +						remote-endpoint = <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
> +						status = "disabled";
> +					};
> +				};
> +
> +				port@1 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <1>;
> +
> +					mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
> +						reg = <0>;
> +						remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
> +						status = "disabled";
> +					};
> +
> +					mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
> +						reg = <1>;
> +						remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
> +						status = "disabled";
> +					};
> +				};
> +			};
> +		};
> +
> +		mipi_lvds_0_ldb: ldb {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "fsl,imx8qxp-ldb";

compatible should be first property, check others

> +			clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
> +				 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
> +			clock-names = "pixel", "bypass";
> +			assigned-clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>;
> +			assigned-clock-parents = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
> +			power-domains = <&pd IMX_SC_R_LVDS_0>;
> +			status = "disabled";
> +
> +			channel@0 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <0>;

reg should be first one.


Frank
