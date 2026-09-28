Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010042.outbound.protection.outlook.com [52.101.84.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85CC3D955B;
	Mon, 28 Sep 2026 19:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625142; cv=fail; b=sFnLg4tPwU20F0Cm17ZG0IlipCuDI1q4psOfQ4bASJFcKkXMGOdKm+9wCDs+Invf85+V1In7P/6P0052TdWCMU9pTbFVKu/cTjo7WP83mda+hGJi61pn9nwylhVC1b0nw0IKj7Em2EjtJjXhCstBEBqQ5kTkSSVuHztpQbYJXB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625142; c=relaxed/simple;
	bh=VHJlIJxuPcugWhAuaee0y41hVoja8pLMvjv3YEVTbEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q5HtCRTaDuKhSeaXVVjbAnpJ9XciRR4uzKR8ry90aI25EF1KtMd59EXD6bQ+bLl5gCivO6oRpzbNrAi9gp8XAX0zd7JL2KbcyOOU3YHgq9PXg4l97k/obAB0mFrQxo2cjXc/4LzrcfR+nG13Z/QNySlwNvriJk7hkOZqkx84ojM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VIYfSr3n; arc=fail smtp.client-ip=52.101.84.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VIYfSr3n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEs6USC8eKhtzU158izbyYrRYy77MC0mlZSTZxPwXfiCLI1saV+kwHnbrD59IOTiSGXMdHyrh9KyeKELsk2OJdZ9L+rsKfSD0vJzwNBdeZXc/Ltw48RkpDVdd+rlLFD0tAlxZIKVF41udPWVH3KMm8z+TVwy7LMDv1IjJr7z2sF+6a94qzjTXjgimnP+++iHA1MWvgkPzurrrY3ziGO4r3xaVv7wHgUqpKt1W44M4HLLwH8Uq8+JZ1gy9KN0N9Y9aXqdfSHA4gz9vZGOixGGn2POm4B9prIOMD7NBY5pW5IoNwewxXh0Q5jBXUgKE3HNLUSzMjCsTlnYElbonBez5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0jNub02ndjHCvcwuu1on0MOyceOtdNIBr+naXTJ6lk=;
 b=DgetnHEyjwilya8wbInN1pkVCNyNacmHZ5/YZ9Z0La/q9NKoK8lpKJDaSKmNAbHBcuCAE8ftKY6jQCGQMz/K+bKpuTEwYNbnU0oAJpB/oAELaAyQ5EMuqxu0JtQsMgwC7BKO8SxceTyQuCVR0rSDusDxIEIKrxT3R80m0Wk5fhIUZxgIO3Qeb51DCZattzDFKmaT6/nZqjDe96eIXDXSMjJzCX5WiSz4MR70IYf0LjeAob+4ukl5Rjdhf8PnM6HyCtCQk1qg3ZtxZZruavyNEn6pT3Y54Vx52S0RjyRTYOzMUZ2epo1MT4wH4NiiHUDIaPLc5IR5aR5x3cVMEQq/1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0jNub02ndjHCvcwuu1on0MOyceOtdNIBr+naXTJ6lk=;
 b=VIYfSr3nEll9BgRgvM+KyA8lsH77z46XRa9MeD+ehdpp/IGkNE3AedKmVl7rtDWyBGvV5/qlH/xaIl/P7e5YxkwQV/ttnTRoh3EUutbKuFbH26hrpkcw2omdQK8VGOr/iNhIMVid0ZUCKtQ3F9nxTBHJ1aiHm8p5HgXGk3YFkDcmJordh3IRDrEcHxxXFH/YjKCIloR5NCoGYLNoyZ8MEy1YKnzKWMCpiDOkQH+ja6vrtKe4Dw07eKWw1EdWqANctTDcKcRDtVEcYhbicEBQpeJPSvMX9l9KMfTQx1y1yoCtZmWszKp4TCvzbAktqqo098wh5pRc1UiTawQdyMKVrA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by AM9PR04MB8397.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 19:52:18 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 19:52:17 +0000
Date: Mon, 28 Sep 2026 14:51:59 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: vjardin@free.fr
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: lx2160a: set #pinctrl-cells on the pinmux
 node
Message-ID: <arrFXz-IsivCPBi6@SMW015318>
References: <20260928-for-upstream-lx2160a-pinctrl-cells-v1-1-4faa8a341cdd@free.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-for-upstream-lx2160a-pinctrl-cells-v1-1-4faa8a341cdd@free.fr>
X-ClientProxiedBy: CY5PR15CA0002.namprd15.prod.outlook.com
 (2603:10b6:930:14::32) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|AM9PR04MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: aac1c1f1-cfa4-4952-ce41-08df1d9a0053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|23010399003|56012099006|260925022911599003|6133799003|260925021911599003|10067099003|260925021311599003|11063799006|5023799004|22082099003|18002099003|41080700001|15866825006;
X-Microsoft-Antispam-Message-Info:
	BXb7W9S9DTDYEUtaD8wp2mVE6+/B/mFQC+GOP7fXe5P6v+f/jaQqUYftl8XeZQwVdTbLMoOsLViSu/4PWJUFo0NqDu2WPrSuk0SQOO+dIcI26hYUF6Jq4dd+Ma5JZdhWTXDxOqpRipTw4WGcO2Sfw0iqF3nOeilmHWoJFmDPHvPZlVoJ3HT8khTjpc3Agl364uhJCAEu0Wi/fjNTv3YDULqk+B+ibglfZ3CNbrWUMb+t07vPu6Bt6ZSK/hakgU8aTQpgqIaOVt6uhC4H0uG+eD+4/wydBCnV79duSK3V3Ru8flusR002OxzAjouYY4c3rt2xn5C7PNptw+zGVU5cfmOtCxGMN2AHGjZXwurDp+mew183nswJWVWvG3vKVQfFKRCehStyzPo/evaNyHO85izSM92UfYhYwl5zGmSFJSxcZAjtAktNzAfTb9ZoJx0saHXInKw5yWfA5prSKY+3pM+QLuVQeHkZWbM1kxEHeuJc3lcY5fyq1hjzVDxojQ+Jyq6TqZqvNTQ+5/ImgyoQGk/mtI46fprkxHDcvOb3KTrcOSVKlB0uKysspFB7/kKesEu6t8sSMRJtvwe+2WzyhOl/vwxim1juIIKIUdhMrGZH82rGatjlREn8dT7G7T/S9wVEonhXOOj8vj9PlKGo6Z2XGRtfrNghGGXNwcursAeyXoFhMsx7pB5hnNFGlfnlLXCLNe2Dw5WNNColHpjdSRndFC1FKcEp869yJAYwq5Q1NGvdDxOHEBnD7ysWsCz3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(23010399003)(56012099006)(260925022911599003)(6133799003)(260925021911599003)(10067099003)(260925021311599003)(11063799006)(5023799004)(22082099003)(18002099003)(41080700001)(15866825006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sPRcLSgJmAXC7DVmgrRcs1MSN2FyaO06K/8E+YpPlV4kWG24FU1fK62P3wOj?=
 =?us-ascii?Q?FoTuj4vqUThGUBTblFOWpBgtTMvHeqUOC/foitTA4+DDaTwpDe573747mV67?=
 =?us-ascii?Q?DCNW5pF6oGFGh43L9Z7MUy8DzivvkBitGE7o3D2uLutc0CNF5pJZjSTWqqpp?=
 =?us-ascii?Q?NYDJNhtu7Lh98LPdLgGSM5UgAaamDQ4RYf91O8lJzl4fQ1jOpMfqbzCRs9Gg?=
 =?us-ascii?Q?xtKEo4w7VApf2trUDFgahaj+Vab++ndD9ph5tBI+NEK43iXirE+RQzJiXHjt?=
 =?us-ascii?Q?TGlinckW7MU7JIYz7+m/GjAnZdvlvYzfmyraHQsCoTHlsqNpPtXWLKl+dZ0E?=
 =?us-ascii?Q?OFmzpEM5kpUw70+0LGSLqN5hnyL6qS3mC8NTOTXMz4m4DalnjC2EiJwQFyPY?=
 =?us-ascii?Q?a00+tMrBNfEaopfFlZRRltb+lRgP4D17PScHP10r5mFcPuiyUPXGlKw/CWIC?=
 =?us-ascii?Q?QBFaIWqz/B+pVwmFnJScXyZSXzjbEi0bVYuP+P9P4c4hAbqJEP0m3bMLySeF?=
 =?us-ascii?Q?oTSC8av+ARhXmSAwmAg7nxVfV0qmNb1NdY87QUW1wxR2613nnmikqJOeBagB?=
 =?us-ascii?Q?OvAoaZQGcrOO5meSPujaJ0+TklpTu99hvKEPyRuaxwUeg0IRDvOVUQgF0Na/?=
 =?us-ascii?Q?FSbyYaiTSKqHHNb1vkfFROKHM+oygR5Otn7AGOBLDkX/AnP7B+CxqH8wEaSh?=
 =?us-ascii?Q?tdBCSJR517U6J6aVE4wqjwV/lC1rrZlpo36DZHgEVGBjlxiKkfkvPrZBxfqe?=
 =?us-ascii?Q?aRuLzrPIkKvS3Va77lYMevtHxoo6eIbQJktFAIFIjwMA5syn1XyqHK4H9Ff3?=
 =?us-ascii?Q?EQVr2b51r15lJUA6GvkbizfA+m37Ggq8Bwg702r54MFNrxjuJuYM9YpIyYdI?=
 =?us-ascii?Q?ay+1bn6u81GwLgBb5UQQQmyUotQgBMlIrjscASy5AeXOoZBH9CERuN2lpscF?=
 =?us-ascii?Q?DcG+YoBE+I8khLrrtyfBsq9tkRF2llyxuxbA/k5/8j2B7ZEnftKDYu9n16pL?=
 =?us-ascii?Q?P0WSpmo4ha6PJ8P4LkE4JE3HQkjMSHphma4hFQl/jy44FrvjuepsCVDD0R71?=
 =?us-ascii?Q?h8nICqWwEYIX0iEW8ujRv77a0zfRTDyvLySb2CdBqfEPGbE+ufA4tcbfFSAz?=
 =?us-ascii?Q?cfogdEXNkv2O6CNrdfzgGsAQe9TXGdGJ1RzI/813ltGns4H2lnm4E6sB2W2K?=
 =?us-ascii?Q?YCEkuW8Hr7kYZP9dZF+8ufhMbbpTmGFJTYAUkhKYe3Jgzl+3lfXwZ5TgesG6?=
 =?us-ascii?Q?fmDzdo9MtZIJgaKUPushQv/VfAkVBca9OWGzByESQ0JphEMEIrQ3ay6a1F08?=
 =?us-ascii?Q?FspyLo27mR/5dr9qHetsCqX1M8bdlwrwOnZmVno7yH98cA01bWBvKsMJ3uRZ?=
 =?us-ascii?Q?fZwnaFJGBurfBM2p6rWaTPdoRDUvHivWoDMmaTTFWhB53LIrfYujQP+FIQUN?=
 =?us-ascii?Q?XrbpO1pRsVW7vYD3JyonrWkJggxtCTODIcV0SULpvnFlFEjXLQvTU97AeTS5?=
 =?us-ascii?Q?bdqhavuJutPkTEhNv2TVY5m8+Ci6qzWoRVRGCFG5/4c92Ytr0rfmpvbq/IeW?=
 =?us-ascii?Q?Up6cFPoZua070bognIStM3J+QR93odiuTcEyBxrySAna0muIZEliMD2UOFsW?=
 =?us-ascii?Q?cua5MrKAT10M/jHa77FLY1DPn9nXD8RWSm4z1+W6L4WuRcFBkX0At/gMKKJT?=
 =?us-ascii?Q?8Tbc8OoCym6iH9u3b72J4n3l+Ka8pEqPXZZP4K04NLKEUKt31Nnpt63T9ePR?=
 =?us-ascii?Q?wSmlBYzeBoXYXhLrsgvvhWF/rdmO7Dv9gDoZLWm/Tkdbn3qKTvrQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac1c1f1-cfa4-4952-ce41-08df1d9a0053
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:52:17.9326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldNbGo6gtRP10VdOIs3suSR/RXsdqPrwoKrmGey3nsgyGvY1cpuGYh3IUcCZX5+EETTIcU4slUyDV0GTsNomAcpS3eV97GCtqnTadKGQ+0bE32GBoMUYhaZyNzHMCfM+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8397

On Mon, Sep 28, 2026 at 03:49:49PM +0200, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
>
> Currently, we have this message at boot time:
>   pinctrl-single 70010012c.pinmux: please update dts to use #pinctrl-cells = <2>

Avoid use "we have" ..

Just said

The below message show at boot time
...


>
> Let's declare it in the DT instead, the value is the one the
> driver already uses, so nothing else changes.

Add missing #pinctrl-cells = <2> to fix it.

Frank

>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
> index bccf2d673023..2085362ab0ea 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
> @@ -1536,6 +1536,7 @@ pinmux_i2crv: pinmux@70010012c {
>  			reg = <0x00000007 0x0010012c 0x0 0xc>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +			#pinctrl-cells = <2>;
>  			pinctrl-single,bit-per-mux;
>  			pinctrl-single,register-width = <32>;
>  			pinctrl-single,function-mask = <0x7>;
>
> ---
> base-commit: bf184a29ad1b33bd8922029eb0ca3f2866007258
> change-id: 20260928-for-upstream-lx2160a-pinctrl-cells-729533182b85
>
> Best regards,
> --
> Vincent Jardin <vjardin@free.fr>
>
>
>
