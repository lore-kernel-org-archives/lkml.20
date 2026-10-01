Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011017.outbound.protection.outlook.com [52.101.70.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587332F87B;
	Thu,  1 Oct 2026 14:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790864064; cv=fail; b=gG+tH6EmOn9JhTM/nh6vpi2+USq5V41BBTiuzR3cFIzpWrruLmXb8LUIcQxLujRj8RlU/meUayjiV2acizkeUYqJMdIAXdwz85CZHXNxFBqWefS/np6lmF7khvKuLT+3OkNnsYZzDtz2yL6B6Vm8proTyRsQXsqtF85afPQPigc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790864064; c=relaxed/simple;
	bh=WfELk+O7oGm9/7oyZ93Hj9gKlZHuXL2Dg2/mE9Mv0L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FRB04B56ZXjwIovhI9sYvBr85y1P2en1lPrU938va/xOhrXw4N4RsceE6CTDGiqQ1pShoXCAMhIrVU0qjjZyfOl12webYkUYki/hKA0p5XsSFVimrLHP5ke1j3AyoPi3Q+uMWg4Tet10qJNXEA1i/pyMpNLsB0QLuLmc283T0WQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=M9metBCs; arc=fail smtp.client-ip=52.101.70.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="M9metBCs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOgF+0PZfK4xTgN9eH5nzuCeXgUteb5EwOUbKTrLbCailospH12JEot46RdvMl0v474RXHyWisPH1AydgLDbAyU6VGswXhN3+MIv7HD3i25zEBSMVHTqGgoQRKRERJHV8i8F7J+iJOUW5f1Ygte8oiaiGvmVvtx9o2fLqxIWEOZTfJnkN4RGSHV+D3Gg9FWvpXmeIFoHOTwESwX6hW30n+rRdNVAxJ7qrpCKUhuCEtpmYBASHAlyGqrDKW5vwGBHIv3gj/AaA35MdrYQYrQGQGyNW/mWfYhbKgG1Enzh5+dls90NnSnOOptU69zV2RYTx0po1cBHS4dlrsL3IQuh6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiyZBJgbOoYuz5RyNOY2DuPfXiiEPbb+XfqeoO5XTxs=;
 b=rT+O7nfaMSY2Sa5uuZ2Z9Hh7h/UyYMKy8/zt6WLgiUeb8MusUbTPZ/2gqBzgGygd5TOsOFhwPEtHByJ8DTGE3kZmdnq4mnlJgEO9+V7YEFbDawA9ut/mZchX1uDvwmsCJsve2QOXG/eCfaqCumq0u/2vV1n6emX4QeRigQpU2STcloHTjOgfOYDcZG2A967ys1nwjUdVLZ/0CavrDs2AVpoC71IQ0J1y/Ap0HNdxSZ2eQHj/s5ea/PoJ2iOLLeEX0G1cbKH5AqigIQJQ56b0cluhQMie/gYnM3evDEMEbOlpLBOBjJ+ZQv7dOPHvKMgBa8a4WYxOvnywGq8+3MYCfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiyZBJgbOoYuz5RyNOY2DuPfXiiEPbb+XfqeoO5XTxs=;
 b=M9metBCsxho81frc23hLrdDRQ16SSodus4Jdhs3sLdnvhrAvElTCNvsyeiXEsMto5MTtcCGRPG4wCHXLtqZjuL6/b7UaVPpdYMpUaA58DXG9hHqJQKpRP9vtCTS4IU+/1e7yis1PTcKAnxz+jKY1hv8D932xsCY8z6fagdkzp0FIrVNKMbFnOJ063n3z2ei7hYe9o7V7AnOUkP8MOkzeIiEj7QRXhnploGlTqWiDBngGG9TaorFl78/k+oxVwFao0ML7xefWJx/z3Hmaz3OW6LKbiI7v/FHaIhopZ8fl+vO6YcVFpKWkmFP7RgX08TnwVSgzpuSoJzJxdUClthOZww==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8302.eurprd04.prod.outlook.com (2603:10a6:102:1ca::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 14:14:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 14:14:15 +0000
Date: Thu, 1 Oct 2026 09:14:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: connector: Add Toradex camera
 connector
Message-ID: <ar5qrJNqp6pt40vY@SMW015318>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
X-ClientProxiedBy: PH0PR07CA0035.namprd07.prod.outlook.com
 (2603:10b6:510:e::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c11816e-8886-45cc-659b-08df1fc6463a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|7416014|23010399003|366016|10067099003|56012099006|11063799006|3023799007|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Al9TgdSbZgjTMekI33EI+By4MiPgnlmtwaqXrguU1gK27T5RN4+Ube7PvyQ6n34sw2iHX8+YoYZUCtHfa5O272TesorETfi3ezecbIDYA4p4q78eoaXvRx5Od4gSjI6w4G2Zd7AQTYRALhv/CR1FECc+jAJN+MSbdHEVeZj/rsCOUA4qhRrtqmEtfvFJb1Ehkx/7ZnlzgsD4t4UFjeIarqjjWtVfD/MaLK+7MPsZTjO5d9siYt3EwS+qdOHDtXEF40AdXxjYbopWboWCT3r5pNmTxv0MWWRQ/WCRjODEeUXAmizQCESHAp+EummVQ2eO78RuOHkyNt1JwSTwq5hdpOij4FayUGE0uDw47P5c7/1n+z9Vh2jPKPqwYgvyg2cIpTBe9tTrRanhT7U66zQ5i1IQn6BD4Nmqlro95qqEKVrl2DlaD0c521S0/edHygY1lAgUBIOJbEDreGh3js0aCXmoTspx8ATsJDsvggFkhm8eEyk4CdknUYXPc7sqoJ4lucOWINxYI99+i568Y0/oeC9Tx+TzGV3lgq0ndAAln25+uMGKtkZO/pws55E/D5svAgaKK4Z13X/MFEygvR4UDS3i4uoy9MvlM3l1QpvMMS01e150zOiqYMtSPcgEVV6m
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(7416014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(3023799007)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X5FhlsZvNBGfb4jo5J/YJiX2dj3e9EPPm2WnkZoGihy8b8uZXd5oxjkzi6IQ?=
 =?us-ascii?Q?+LpsNVUdSlLEV/dHwZTuKjKAhXAm1A7Cqxg7+NVd7Soj6vf4hamhj2n7Ql34?=
 =?us-ascii?Q?ItAd6wxstpbkrfr8Bns+k5dLgF0m29/Ivmq7JkP6Zpe/f8T2MtALqdZh0Lh+?=
 =?us-ascii?Q?5l2WDsHtJo0zDasZUQumBzWR3XXIo+a4uHYTwQawMNuPrOIs63KAe7333dhf?=
 =?us-ascii?Q?/lC54tAcM/61zpEJTXNWUh3sqaOWSerQnmKVAmvOUhBtw6LvdYMy5/PA+O30?=
 =?us-ascii?Q?S6ZPHTLQVjMllppiJaZbOevtahUQEXlILGZzFN+6LBp/Pq9m5i18EcpiLZIk?=
 =?us-ascii?Q?TrBJiGclJNXXFm6mEZF648zVbaExmDOEkAvhcDiF9iiUoBcNeh3RpLtENrvV?=
 =?us-ascii?Q?7OZC/jDlG4Cff69mKhWMJMJsQOveceg1vPcXpt+DHqeNohTabAjScIp0kpI4?=
 =?us-ascii?Q?LjZx2bsBZDrGcuGhfPMXeQCRby0jR9xVXJtVk56mnhmbX5E+z4/s2FnzVnSk?=
 =?us-ascii?Q?BB4wQ87hU1SL3ysGdfQAIA3YtRV7fIOxvizSa4wMMbltbKWWWpMdrnQzyn9u?=
 =?us-ascii?Q?3WDh0GIOOxyshwmhfqvESlX5MYJxaWHZkK72b1dAjd55NEGI5MT38sooJ/q7?=
 =?us-ascii?Q?rgP1HYAB/LTSko2BsxSI5XZZIZT0dUfjp7u6s8dSi3zT2miwpk3Xp4nLzv9W?=
 =?us-ascii?Q?zzohS8bjSYzmrI7VwhiAR7rgmPJ4w9GyjZcILy1v9bWegr9QCicf23GUovOB?=
 =?us-ascii?Q?9EBaDCWZORjIoJGjXxqopCmpbRRYqjheGeruPu/Kcj6KNi8NwEJRlsIDs4AB?=
 =?us-ascii?Q?D4F3yR1cIsa9zYqBZ2oLCwotU0bUh9LHsXmddVXVTPWII3A6D3jUHPMROaGY?=
 =?us-ascii?Q?nszGF83Dy4U0tD3N1sndlxhaB2dtAgwACUkFn/q0Jr0UiZEvFXuGt3yD+sD3?=
 =?us-ascii?Q?WQo9JRtYN4nHsdW42d/Av7W3SX75P0ABU3LVGbC7fldVVO41TzWOePcEFTLj?=
 =?us-ascii?Q?Uq/gEyyHH6HAyaRjArYOgR5KXaL87I21a7wTkDfARESAWhBBOsYyU7kKwlcE?=
 =?us-ascii?Q?oRNQe+sBSsDyBGsM7Rd2U4nF4KmbqMdHDh3zEQgcC6K2ze1cBo06z2t/EKTf?=
 =?us-ascii?Q?WRDdVmKIpW/nAWtbtkmGdspR6cKypuv2vfG6IAkYvwgzOiFRLZBw4rjiSLsJ?=
 =?us-ascii?Q?bo76HRcu3F9iTvi5zv2Q83X5Q478j0s1qUS0xS6Rv7/Dw39ntTbZXETfKB2y?=
 =?us-ascii?Q?8zFYRxF6OH8ggX9rSn4BVAODX4DHcqMmAXmkqoX6wMPxiKL6pcbOgnsA78ud?=
 =?us-ascii?Q?OVPqCDI7Lw9yUN/mmaP5RyDn5k49ByKbPfA0mdNbwT8+CZh8ofugClFCepjI?=
 =?us-ascii?Q?LDpP8DsMrNvjseuEpUPxuEnCxTDW7pJ2jU3wchGLnomqHIYZTTRSTqxZ4ZEq?=
 =?us-ascii?Q?fZ/2rva7yfplMJEIz+LGjpDzrVQXkKX+EDJBFPzf6B4i0To+iV1S/mbAGSXl?=
 =?us-ascii?Q?Yw/sG8xtpGj8pnYFruV/fHlVzGyBaPJDIxXXZnb6NqNeC1N8ZBhXeQqnhVIq?=
 =?us-ascii?Q?C9+jbvbZ228oUpOyG+vyAtCRABhP8E7oNUHKvXhLD0H1pkprZlGteUXDsfHV?=
 =?us-ascii?Q?B1sktPTiis/mH8RSfZQrGNYzre4iZU/QSrLAkyt26dEZRAySAVR0KCgI8jk/?=
 =?us-ascii?Q?zjXBbxoTILtFL8pJcv+TAJnDjSUsWIOMnKB1woiUM86RljA6liTar4/riffX?=
 =?us-ascii?Q?9rlds9cQD796liMfFv47agqrbKY+CaUBejYXODIqJgrVWyD8PSjp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c11816e-8886-45cc-659b-08df1fc6463a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:14:15.5288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+d7zhR0z3uXgXUX375N4C3vrMm/AC2qSfLoLVIpnTBdvBfMhK6VEaumm+nPa3HTR79g7EzrOkxHp3hR9yBDgPlBnhjzkZFGnKPNDCUuvfm3I03nUPn3TiqRe0979NMv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8302

On Thu, Oct 01, 2026 at 01:44:11PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> Toradex boards route the sideband signals of their 24-pin camera
> connectors to different GPIO controllers. Camera overlays which name
> those controllers directly must therefore be duplicated for each host
> board.
>
> Describe reset, power-down, detection and power-control as
> connector-local GPIO functions. This lets an accessory overlay remain
> independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> remain described separately because the GPIO nexus does not abstract
> them.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../connector/toradex,camera-connector.yaml        | 81 ++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> new file mode 100644
> index 000000000000..27fee3defde7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/base.yaml#
> +
> +title: Toradex camera connector GPIO nexus
> +
> +maintainers:
> +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> +
> +description: |
> +  Toradex carrier boards share a common 24-pin, 0.5 mm pitch FFC/FPC camera
> +  connector carrying MIPI CSI-2, I2C, clock, power, and sideband GPIO signals.
> +  This binding describes the sideband signals as a GPIO nexus. The other
> +  connector resources remain described by the surrounding board device tree.
> +
> +  The nexus exposes connector-local GPIO function numbers to camera overlays
> +  and maps the functions wired by a carrier board to their GPIO controllers.
> +  GPIO specifiers contain a function number followed by standard GPIO flags.
> +  A board may omit functions which it does not wire.
> +
> +  The function numbers are:
> +    - 0: Camera reset, connector pin 11
> +    - 1: Camera power-down, connector pin 22
> +    - 2: Camera identification, connector pin 23
> +    - 3: Camera power control, connector pin 24
> +
> +properties:
> +  compatible:
> +    const: toradex,camera-connector
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-map:
> +    minItems: 1
> +    maxItems: 4
> +
> +  gpio-map-mask:
> +    items:
> +      - const: 0xffffffff
> +      - const: 0
> +
> +  gpio-map-pass-thru:
> +    items:
> +      - const: 0
> +      - const: 0xffffffff
> +
> +required:
> +  - compatible
> +  - "#gpio-cells"
> +  - gpio-map
> +  - gpio-map-mask
> +  - gpio-map-pass-thru
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    camera-connector {
> +        compatible = "toradex,camera-connector";
> +        #gpio-cells = <2>;
> +        /*
> +         * 0: Camera reset, connector pin 11
> +         * 1: Camera power-down, connector pin 22
> +         * 2: Camera identification, connector pin 23
> +         * 3: Camera power control, connector pin 24
> +         */
> +        gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
> +                   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
> +                   <2 0 &gpio1 2 GPIO_ACTIVE_HIGH>,
> +                   <3 0 &gpio1 3 GPIO_ACTIVE_HIGH>;
> +        gpio-map-mask = <0xffffffff 0x0>;
> +        gpio-map-pass-thru = <0x0 0xffffffff>;
> +    };
> +
> +...
>
> --
> 2.43.0
>
>
