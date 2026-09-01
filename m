Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18B143F4BC;
	Tue,  1 Sep 2026 16:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279748; cv=fail; b=DpeqwzVTxK6lOg/+prLO17JdtcdCC2dYK+LuyDqJppJtEBjPYcDhPoRJO0Lcc0V3c0+GhPaa+G3c/+rEn00bJkAX0scvqgXdm6+rgMkI6aYNFmrghBE/+MDOJrLldgW6a3k2XKrsnbcgeQs6LviXnVgwguC5ycr/x6YWAzH8vcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279748; c=relaxed/simple;
	bh=w9tdbDCLB+ZpmsenYUClUoOLkdGiK+jSp2IYqm9UQYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rKDUh1HXUFCAGAnUDXoG/0jcprajNXTBO9k+qvXFizyPKfXMkSw0L/6m7AIUBJd35fseYJitXCnQKu1Mgos19aS8n1aaZjVd+WhOIM8/0VWY4ct41L+cdgZ94ZXdrzrR998vqQm0QeSZvhsv/Mh3kaS1TCswC4wKs//iWRPngwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P9ISoi6c; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P9ISoi6c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETLTRmMxWODQYHMZbc08AJooyaO4uDlfgK/FG0XTkQef/5G1j8lQfMbcdjMySCK2gyaO9EjrD0wSBv2s0+i2vyHJXrS1tzBE75zU3ZK3/FVSUpoH4hCUhz3xu9JWhXCqZygL5au0RNwL2enKidmHYSpGjPM2m52CGtIjkyhysRpxLT+EUeSK9WyIXwj+/ZEpmpM9zOYzKxVBJ/Zi6Msq4XkQGf8Ps07vulWQXN656si68jGSErk5lcY8mbsGD3WdsuL3LXFZGpz1FMEhYUTZRyUcQ00Ds2D2NYLHqUqXNZCQ1QaIgGbQ+hUk12QwuECcvigsVs6CjgoPK32aK59r8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRzq4DATOT4BTNahFXb6FPpCVG7a5y9MznbuZIqT4lI=;
 b=mxmNW3aSb3N/+jI8c15K7SbH/xqCbOGAUMl89BftFNrt8WFBV4bGseHopORzxgFeKX3FpK5K9c3TNKI/4sYmZXnJ0ObN0+3gH1bfRvTE3KEk+NYXMzACyjwnc9oiP5mvA/IVr4nYKeiGHVvedhxl0y06zMKbO9bKJATR45aVdHqK5wQXc+3K1gZ6PYvnMn1PeMooLDkEpq1KI9tqHf3lm3h1yKlH950ZfTmnLqOoOITcPpuYYcUFHqzmXypF9kYue/d905EqdwtRHq98THXPSnI5KNCZEBruOSYvKBL2T+mMe5opbZ5JayYsq+IioladUb6D0UUb/R+Y+XkNUFWpbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRzq4DATOT4BTNahFXb6FPpCVG7a5y9MznbuZIqT4lI=;
 b=P9ISoi6cxMsqiX5DBR3349Y2avayHpDzeqAob7w6mB4JTIb3Mp141zO0KXBRJUjV3+YQS6iFLRnGnC41zzpSo0ikzMiRnWk/y++wDMX8nHSFGkXgGzgEWZa5g8zBM4T6gJa1ZgoABstJ+IKbQG7GEc9WdOVv0yQL0qozcoGLfcpvUWIiGdgCpuYZtzWL9bQbefA4/ztigcLfXEYEn6Zc73/3BSSAlucjkVPog+9wklhncQ/NpNmV76QKd3SAOfwEc532deDGLX1zHgc4vy3qoS9p+9acpvAkoF4kcFCAO+EjBUBfRCBTx/3NQ6E4FradBXsobw9Yl0Tx9ZMxZGefiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7579.eurprd04.prod.outlook.com (2603:10a6:10:1f5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 16:22:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 16:22:23 +0000
Date: Tue, 1 Sep 2026 11:22:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: dts: imx7d-colibri-emmc: Add VGA overlay
Message-ID: <apb7tZfjXTdULZtj@SMW015318>
References: <20260901124921.78635-1-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901124921.78635-1-francesco@dolcini.it>
X-ClientProxiedBy: CY5PR22CA0096.namprd22.prod.outlook.com
 (2603:10b6:930:65::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: ada43df4-1af0-4b98-0103-08df084533de
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|19092799006|366016|11063799006|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	C/kqEtuE2nX8wN5NoYxbYf/q2beD/UplD8ZvcnC37D8bKTmoL97aVZNDhoPw78AfgLKK6IY1Jzok1e6eXvgxuH0rCO1zo/icoRr/djZYYJpaRWW1ZIl/X8oee5bh6ctrT7q17jAi9bFrRr81V9O5lQLP22/m7kiJR6m+NuCEwW/wK1KgNl7UfdQRsAVpInv0JWAB9bHCwh3FbucezIV9QZ9DyU50nBD/4asmMoxf1aDK0ad8njtgq+WrfstmkVPoAiJ9FCsIfx4Kxtk3idanwVtLJQkJJzVTk7uWW5XrvDueBhPfeAxy1q/qTItutAgbEfB57pihXyOoSACHUHy6Mv85CEhx820K3mNmRru2dQUF1avSDYr7OWWF8lfR2hebNjKOWRg0KMbhEcRrhjVYLFSCuSWR+4sOs9H/bYfyLt5JKkOwmrPao4bgKtylwQ9CG0nyqlZu9ojsiYIZ0PmTXjUKyJLpqfPgaMnOCPtdbc53hkTCWZbD25VaJtVyg3gjCzBYiy/ZSD3gTMEqLPLXFQG1ETlkzHgOIJWLNf0B7pa6A4227NvqSCRBf8QH9CdjnFuzP+R+3+LiEJ1T10pF9mIR1mbqFZc0IecYp0BKvouMFCgopEReZkQpODlHwo9/HJ9+7c3y1hHlpRG2QuPOVutgeV4jSRCg6gc5VeEtXQs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(19092799006)(366016)(11063799006)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WiaAyHVPUiW8DwexObT6VIyn9OoUv6jsi+sft+zoVy08kXgg1drd2DCgmGj7?=
 =?us-ascii?Q?J25fAwIdd6DkLymXuOGGjCfY7D70kFueS5h2IGxol30yE/9h6AL64OE9akTb?=
 =?us-ascii?Q?U9OyUiLPYJjZuUsv+mAUXjFJ3cjEgG3ajzgZDWYFnL9JyidxdQvvWwTH8Vtz?=
 =?us-ascii?Q?KM7711PGXmFUlfaV1Qmu04mk/tg73xgITyiaDTWDQ4CnDo/qKbDI2DLlvyFc?=
 =?us-ascii?Q?EsjJi8E2Uepl8hIAOPcL4gb6P0qB13qtvyzVPafN/t4UJGy/wxSzBUvoyh9a?=
 =?us-ascii?Q?fJRZlBzOUvjWGrWQAVUoemGADCpBZZQrc6R6BOm72+ukZhfWJp+fci83vcFY?=
 =?us-ascii?Q?bWz4Bfk5NW1Ww6fe5wz14GmUk63IloP/+gO3fUxA3gHJEAU22UwM55SBd4JL?=
 =?us-ascii?Q?CDvEO0ZqbK0X5RWB7rGV2kj3WIOwXCGrCwsQMW8ijsE8DwDGUZlYJqiP/J8U?=
 =?us-ascii?Q?pPtXQfydpKF7KUrtj6bl1Jp/9hjEaNmHWqTbWQLM1jPWE6BJ5fUkzxXhv6cO?=
 =?us-ascii?Q?lZ46X+5uuVzRkXTvYp7QezC+2T9DuzmlVF0sG/zhoefehMcwu2Er0aseW2Dr?=
 =?us-ascii?Q?/hZEV3Ccz0lnO89KwwOknxSGmSeztX1/Z7soXqzhkiMX6Tex+AY/ZdZOIjwt?=
 =?us-ascii?Q?VReTfa8g4c19wuh5Wdm5EmFWg63rz4tvaldLFUgJ+9Eu/IM92plXwh9jqyUv?=
 =?us-ascii?Q?XvRKZj5/zJD6STKfQdM1C/yPkTNcgv3iri7TDzww7yb7OfBr1UbNzeClu/+m?=
 =?us-ascii?Q?h2ku7tfcmvdnCZHbbae2k63GjLEcTLnz4gObN3T6fIjQuaE3YIARUOm5AD1h?=
 =?us-ascii?Q?YQpccF7bjspP9qMGf8aBUyw3B8wm+tC/MiUDOP0mhvrvLWh0CwCFfUWwfdLN?=
 =?us-ascii?Q?nYLBCrXHfll+dc6RPN2BjAsygQuZk1KjCHzBasxuafc+N1yLU6izDMtCEXLV?=
 =?us-ascii?Q?B54dZsaiMBUCgKKzFaN6fWWNPyMp/nAKZnO5fJpuJcrsA9QADAYiby0NpRHM?=
 =?us-ascii?Q?hIOwd8VC0txuTPumMtRhXxTHPYTzJ+0bEev7SK2Mr3lTHRyAaHEaMMlF8Kg8?=
 =?us-ascii?Q?SftIyCSnFECYC0R3npHBV0MSJoO/0C4sL7+PqsgymKVsXtbwGyDNPR6Gw7jg?=
 =?us-ascii?Q?IfX+4AZyG4czq2e4mqr9qoE+P+mNaF0yKyw7jtWlHMuEcjEitS4an9bC9keP?=
 =?us-ascii?Q?17tr4FMtuam6aIKxG/F+lceRARx/t7RoQjYUuUip86OVwpT9Dgj2ZEf9qmAx?=
 =?us-ascii?Q?b5O8gygVqBubkP3OidNWWFx4DoIK7aMhJfSun+fldSVCcTGEbHJO5TVYF+IK?=
 =?us-ascii?Q?uY/XxX6eT5z5Iq7rnz7EHxljcPS9gKMjvXL+74uT9o8bQcP5f17TcBhoeDdY?=
 =?us-ascii?Q?qNq9HUg46BwvI8rnuGo3h6Gqznlpup0WVgfCgWWpF7f1wRkFr9pxGVxyYivN?=
 =?us-ascii?Q?Gw8bFZjyqccjAofOWRorOuzxdxqQviyAvPFVWCRNAaMkISXMsAhzN+HhMZyd?=
 =?us-ascii?Q?jqiuA4jxF35cmDRAwPfaOfLodG6BFQoOO9ALluhdhSi5sxmCv/F6DhZk2teU?=
 =?us-ascii?Q?vGIQV4n/Jq+RwULLu37XTJpIM8rP9/VaK+76HuvqfjQsbYX/wG+9xGBOZ4L/?=
 =?us-ascii?Q?ab9dveG6yZlnshi6n/G2HCYiiaWrl/1iqWqmbOlyiqfPfif15VCelQDFHruK?=
 =?us-ascii?Q?H57dVyU01bs3tXK9erxxvp2oMtIxeeIvKZvSjc9mKrDgszR2kSMdVGhdEsuB?=
 =?us-ascii?Q?F6qlWS2gkGtsyFxzlvGFkxHbHe39hUOimMof2K7+2Vq3WoFX+w43?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada43df4-1af0-4b98-0103-08df084533de
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 16:22:22.9624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oIn3VGDS01AYr5M49/gyWnrGZ647lcYe9QEkFx5FclGlAgqwvmJ84nnw+fRegi+AWI37TxCt2GLBNB1+yfobQWrUjbFJNBig3O/qkdx+lB5Pdz29kZ89QNImrGfHxoF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7579

On Tue, Sep 01, 2026 at 02:49:20PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> Add a device tree overlay for the VGA output on the Colibri iMX7 parallel
> RGB LCD interface. The VGA output is driven through a non-programmable
> video DAC without VESA DDC I2C signals to a DVI connector.
>
> The overlay is also combined with the Aster, Evaluation Board v3, Iris
> and Iris v2 carrier board device trees to provide ready-to-use DTBs.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> this patch is on top of https://lore.kernel.org/all/20260723105225.194366-1-francesco@dolcini.it/
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            | 21 +++++++
>  .../dts/nxp/imx/imx7d-colibri-emmc-vga.dtso   | 59 +++++++++++++++++++
>  2 files changed, 80 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
>
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index e9f95c3b8353..d1272104ef27 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -436,18 +436,39 @@ imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
>  	imx7d-colibri-emmc-eval-v3.dtb \
>  	imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtbo
>
> +imx7d-colibri-emmc-aster-vga-dtbs := \
> +	imx7d-colibri-emmc-aster.dtb \
> +	imx7d-colibri-emmc-vga.dtbo
> +
> +imx7d-colibri-emmc-eval-v3-vga-dtbs := \
> +	imx7d-colibri-emmc-eval-v3.dtb \
> +	imx7d-colibri-emmc-vga.dtbo
> +
> +imx7d-colibri-emmc-iris-vga-dtbs := \
> +	imx7d-colibri-emmc-iris.dtb \
> +	imx7d-colibri-emmc-vga.dtbo
> +
> +imx7d-colibri-emmc-iris-v2-vga-dtbs := \
> +	imx7d-colibri-emmc-iris-v2.dtb \
> +	imx7d-colibri-emmc-vga.dtbo
> +

Thanks for reuse overlay file.

Frank

>  dtb-$(CONFIG_SOC_IMX7D) += \
>  	imx7d-cl-som-imx7.dtb \
>  	imx7d-colibri-aster.dtb \
>  	imx7d-colibri-emmc-aster.dtb \
>  	imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel.dtb \
> +	imx7d-colibri-emmc-aster-vga.dtb \
>  	imx7d-colibri-emmc-iris.dtb \
> +	imx7d-colibri-emmc-iris-vga.dtb \
>  	imx7d-colibri-emmc-iris-v2.dtb \
>  	imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
> +	imx7d-colibri-emmc-iris-v2-vga.dtb \
>  	imx7d-colibri-emmc-eval-v3.dtb \
>  	imx7d-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
>  	imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel.dtb \
> +	imx7d-colibri-emmc-eval-v3-vga.dtb \
>  	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
> +	imx7d-colibri-emmc-vga.dtbo \
>  	imx7d-colibri-eval-v3.dtb \
>  	imx7d-colibri-iris.dtb \
>  	imx7d-colibri-iris-v2.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
> new file mode 100644
> index 000000000000..cda214c13876
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * VGA output connected to the Colibri parallel RGB LCD interface through a
> + * non-programmable video DAC with a DVI connector.
> + *
> + * The VGA output is available on multiple carrier boards (including Iris,
> + * Eval, Aster) without VESA DDC I2C signals.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	vga-encoder {
> +		compatible = "dumb-vga-dac";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				vga_enc_in: endpoint {
> +					remote-endpoint = <&lcdif_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				vga_enc_out: endpoint {
> +					remote-endpoint = <&dvi_connector_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	dvi-connector {
> +		compatible = "dvi-connector";
> +		analog;
> +
> +		port {
> +			dvi_connector_in: endpoint {
> +				remote-endpoint = <&vga_enc_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&lcdif {
> +	status = "okay";
> +};
> +
> +&lcdif_out {
> +	remote-endpoint = <&vga_enc_in>;
> +};
> --
> 2.47.3
>
>
