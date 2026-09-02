Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013068.outbound.protection.outlook.com [52.101.83.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6294AA034;
	Wed,  2 Sep 2026 16:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365487; cv=fail; b=uBbFD25EwhdlrEqNsWfYSQ70iCPuXfd/72feJgRr3jQcKT3dpKnk+UHK3HQX2z9do8twEkYekT3Meuv5QN18LF46oNAiAaSPtUQSvpOBQZ81zzxsWk2MchbXiBKngCQVp2C19GAO3HrShFuU0+a06lAXVdPJNdB+V81CNhH33Kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365487; c=relaxed/simple;
	bh=p2rE1DiWl/xrganrhLzCwA6WlLzs/Y1mj01wr+139gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UhJKQYO6V+/8s3cAu2SXLBOfRixkYXvegxvovowVUK4QiloUoibBYrYbPEtlv0Dg5TZ2Q4t7qJPIwSCmLCkHaLs5qfFM43IYMkYv99GBxavToOYuushTX+skLCJ08HMaMiTnTVd9GBuo/w5F2DGOlW+Lv68Sf0whMHmtjrsdAoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KDUtVbI1 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.83.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KDUtVbI1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyw1hdjPq6N4YtuSOqXwFzTfU93xiPZC83FxBSpcYycgjku2ifwHoxfkGi6m/6kHLklkcWnSJOlsx+9KhFBlNgoy50DMHSON8MOhXcXXK2bdF54V7FFYscwcXey6IF7y6gPxVTSgCfCeugdUrcoK2p6y7INj3kABjNoT2+J3Cyak4klOKxx1c9umYMlPloK9ohCFNULSBcYSyMko2IFeh6yn+Eq3Cz2hpECYvVd7e2aPpsY7oPE7V4N8zaYMNx+7wNSoBTcgrGrfFhHLtUZEZH+beO1iL3cfId11sKJWa1cz1wOkdX/YyTLxMknh2WAKRkc/ginnnohlaPJLOYo9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V38/JnoaGUHPBp6RKhQusg6Vn77g0RbRe7WSdlCE6Jw=;
 b=HoeiEjH8B5QdanHmMY6E4eCTYEoZMDEaPONs1Te0Y/Z5OhwI4K1ICuVsSpMlhRFxAy4bwNyMsKuUF+u+REPUJcfCYYsCJnH0oOcWijr5MxRo/0okuqiKYBDYeYQsh2AMrfSFQb8MTy40ZsWg0QMxJQlKvnEGX6gGxDlix8TvZxBxZHXQdWWGkO+w3uFd+8OohxuXOkoIIN9IqRVs2g+6ALGwgAs4YnbAzX3nIkAA4etZRVxiNt08BTV6BoncvU98mJv9ce3syxY1z40YF5jOOUsbSkQ1pXh4zNxm+hHCj67KG58OBKg6xVYC2eGb8SBx+SnZJMO1LaPnapz8Rbjl+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V38/JnoaGUHPBp6RKhQusg6Vn77g0RbRe7WSdlCE6Jw=;
 b=KDUtVbI13h6Vc/nFBCoaSIf/HPsyQVMEBoopOTOgBs5lXMKaEQhZI8lj8Cfpxu/rpza/KTj+EPR+r6zdTN7T2xSZKaPcvgdw8gjcZWGhzuBF7rqFHNbDyGOE1463huDpg2jPqAeR7zIC7GM0VUsf5qX9mSuWY+T7u1po6HT6GLtV3IoWl2UxLHsaHxy+8IMmeiYCLc0xLkseFETpmX9NklU52auTjp1pOFm33ztmc/n2W+icIx1CT9i3m6QkwyFsPZ0wIVd4v05KN/c+vfM8muIOvwyUJ0dze3ZoGLvuHuF6q3KyXI/ogK47zGKMFGbGAQmaXBiULs/Th7E59TArlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB12338.eurprd04.prod.outlook.com (2603:10a6:150:321::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 16:11:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 16:11:20 +0000
Date: Wed, 2 Sep 2026 11:11:10 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: imx7-tqma7: correctly specify PMIC voltage
 constraints
Message-ID: <aphKnnReHQed9ahY@SMW015318>
References: <9a916f24b610cc60e0efd13296f281e00b41391e.1788335665.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a916f24b610cc60e0efd13296f281e00b41391e.1788335665.git.nora.schiffer@ew.tq-group.com>
X-ClientProxiedBy: PH7PR17CA0069.namprd17.prod.outlook.com
 (2603:10b6:510:325::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB12338:EE_
X-MS-Office365-Filtering-Correlation-Id: fcdff392-a7d4-4f30-aea4-08df090cd381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|7416014|376014|10067099003|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BpOzeQiAR5y7x+LdHbNcYRLTjR6bSpdGOY3ifGeOCuJuE3B3nYWxDrZ1Be9e/KaOqf8wH7HKZsWOQbRXdC88zAxI1WEsbWLhLZ9FHziA/CudC2U1afwo8js0UyhQc/J4AXqtv4AInVrZHK0THMXoX42zfSLD/oSmJS2yAEED4MPhDXqDVktjb2hjQpCehlJFpBEDpW5Xd1yjEUbVTdTsS/2ANZXGfmnvceWWfhJCZlMwITmTMAtJk93fpNJjFkiciqe3OcoGNj2YX+iCKbK3w9A7XyxPD5cs7GNaD80ZQ5hBA2SLnXIFWSTlRUSAp914Uo+Gm0ObM7rJnE4WuyNKdUrYnS2VagujynL2BCxJpVmpQVOhk0FBDpbCb/KzWfHVdij1jTDRzvf0MB5aiiyrQ6knLJjc1HE5QEt+3I1oPI+IgrluVt1tbSy5RZOr1lWhHddXKpCwMVr6x8KoGYHQ8aNiUdyYoHooix7Q5Oh6mtmlIj8KNQkg65FZxAjE8OHrClyfcXMdzRaqlU/WPA1V0je7i2wfDKoKnDS1uVXTOn1Ddyle3KGU3F/4hJrq0IEh4RIaNCKnyDJfwzYFA+DySduoOgyXqqUwe/BKjlhzqBk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(7416014)(376014)(10067099003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?GvdoqmUf5S9J21c0+3m8owsD8eJNUl74MlKG4tc3kZQgnOBtWAmcMf08tG?=
 =?iso-8859-1?Q?AQPnD3HTi+LjKS47jictrDN+fsnS5SQb2KCWFMoo0g8cwWGKIvFMgVH7H3?=
 =?iso-8859-1?Q?nM2j4fjZzjX8yMoLq/KPtggdmajQWv5hI/vN0Vh4t4nCvFYYRddNa7ZpnB?=
 =?iso-8859-1?Q?NccrRgfXqBvW8zqwdcrtl9zYDjK+1k2SejV0CoZFGlT2jOL+Nb4tUpVXfA?=
 =?iso-8859-1?Q?+bIpExKYkWKrMoA6xpULrrwqYg+gUGgk6HaDsbT3z0EDgUneHGk0QSpgrZ?=
 =?iso-8859-1?Q?BiYMHXvvZg9E146I7SBA5bYI3iUkpfeXuhy65fLy/jVJLng12ecGc+PG1h?=
 =?iso-8859-1?Q?soBnvhj+7VI5Uzg7FKOiDAUdlEa9/HU5dXULjRffSHB0ubvonjhl433NYS?=
 =?iso-8859-1?Q?xJ/S+s1HCobccfEVFYBx9c4tC81WEYkaeEccKjWhBJtiZ0eqRtKo/NdN7f?=
 =?iso-8859-1?Q?QzvbHtJ6B231VPcFZEpxEJk6WdWTv93ao0iNF2x4sFapGUliph5yrCKodg?=
 =?iso-8859-1?Q?78zpiZtzPWr5LQVa7wA7O0oao4zaVZDWeVhuaqj0tiXohPvOOWCTO1760c?=
 =?iso-8859-1?Q?NCTmeZa+RieGpV2ZhwYZ58Yt6fvpJJOysNl7z4OtsjzAmvM0ulEQSG+60v?=
 =?iso-8859-1?Q?uv46kTNrXuqPN7JaDhEXooPZsn+5mxXJ1UKvnhAOdhFYMVcwOBd/k/T0mX?=
 =?iso-8859-1?Q?XD9OgX7d5HMDpnsHN4N7dO3DCHaHzt34+bSA+NZTnLT9ZMV/VqryAyvPP6?=
 =?iso-8859-1?Q?74SqLFdVrNpibvdtSwu8a5ZLHStgJGkqN+g1Fqe7JUz4/5zMLzoPscAxL5?=
 =?iso-8859-1?Q?TVOU8w0x6kZ7PWFhd1/2euenRXW7R9neQM6jkCu5ZtMcCXjNSr5K+nx+LS?=
 =?iso-8859-1?Q?B9ykcAe3AO3tO7oNMdxaA44W0ZwC5cJYfeYFnGwJZAaAcAs1oWxNa3E/hL?=
 =?iso-8859-1?Q?vuG78/yjqPeTNEpwspGnGCheJ74HxrcTXicbfXPgyI+RjyBABstKu1gQ8Y?=
 =?iso-8859-1?Q?+Vqf2YYXYoNZcVJ5O2x0Ea2fiJ8mmPwWDObpTWEHQuoMUx4SnSMkmekaZ/?=
 =?iso-8859-1?Q?obKi5f/gTDVC8ev7RG51WqTrxsam9sQCDJFYPz9lUa/bScrKQ8p98R3Yu8?=
 =?iso-8859-1?Q?amg2Z1FFu7IgM7/6/u73827EnvMR6U2JW0Wz27KJTfKtiHphpv7vbccHZL?=
 =?iso-8859-1?Q?39enl+NOSChFNOnNNvqv/D/4gXgyJh7o1rbWOC7S0r0G8evG0B5FXfpI0I?=
 =?iso-8859-1?Q?hagXlJoIFgPhBkothJEzjJvCQ6bYEhKFAYSwLPUIHnYCbiq81eaMgUNdj+?=
 =?iso-8859-1?Q?svG2c4bWraUCPwtCW9bFAGjXJB2j+kxi6C/QBfqPnAlwdKxPCHYUX54bZk?=
 =?iso-8859-1?Q?I3gLOOipFC4nuhyECkdZJUEixe5qMsoEmCupz2rxbNtu+ykaHAM3pDKxb7?=
 =?iso-8859-1?Q?/LPHyjkPwh6+jthlzTDAAgPHdwbr7/fqUrKjxFfxMBp+/yLCk7+k+MlBOd?=
 =?iso-8859-1?Q?SENFG/lZS8J18ZG9T+vEXi+1MnEDo1m5JQc3wlRHk+MzG7WxpgappIqgjA?=
 =?iso-8859-1?Q?zlPIo81VCi8fse6NDYvUSLvx7ICeLVvunCaoNgpLsBmhad5c9fLq6MW6As?=
 =?iso-8859-1?Q?tbchJr1/GptQFC11Wnk89XwCH4FrsWTpQybpnVCauFYGuZEF63XLCdOisk?=
 =?iso-8859-1?Q?uGpLpPFgX560W/vv/M59JzBsw1IAI05oC5aKz8p7kmw0ELDnY20OaEFFrX?=
 =?iso-8859-1?Q?9hstPnkeSL77wwEuE+/2MuvsxerizhWMp62zuaeQZHMNYJ0pbJOgAm/mRv?=
 =?iso-8859-1?Q?7h5bRk/tyIYoHmVV7VJgFrOIGb4iPQO/up/UBZzjlAYPX0amltE4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdff392-a7d4-4f30-aea4-08df090cd381
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:11:20.6647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCaOvzOA9dzpfqqucVp8MBYUhdn7BJwRXbQ7muI/RNh9fgFXRIXlXJxgFpTInYo0y2b8v7Qje8GwVtye+kjiRpiWZDCcxsl96vDhphsqifTTuYeMfbaZ7ncba4Jh4EWB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12338

On Wed, Sep 02, 2026 at 10:05:37AM +0200, Nora Schiffer wrote:
> regulator-(min|max)-microvolt refer to the supported voltages according
> to board design, not the possible range of the regulators themselves.

I think make sense, but any document or mail list can be refer to?

Frank

> Update the configuration for the TQMa7x's PMIC and also add a comment
> regarding the PMIC's VCC_SD switching feature.
>
> Fixes: a80a1af6ec8a ("ARM: dts: tq imx7 common board support")
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 40 +++++++++++++----------
>  1 file changed, 23 insertions(+), 17 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
> index e1f740edfb763..7f49c80fef4c6 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
> @@ -46,8 +46,8 @@ pfuze3000: pmic@8 {
>
>  		regulators {
>  			sw1a_reg: sw1a {
> -				regulator-min-microvolt = <700000>;
> -				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1225000>;
>  				regulator-boot-on;
>  				regulator-always-on;
>  				regulator-ramp-delay = <6250>;
> @@ -55,34 +55,33 @@ sw1a_reg: sw1a {
>
>  			/* use sw1c_reg to align with pfuze100/pfuze200 */
>  			sw1c_reg: sw1b {
> -				regulator-min-microvolt = <700000>;
> -				regulator-max-microvolt = <1475000>;
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1000000>;
>  				regulator-boot-on;
>  				regulator-always-on;
>  				regulator-ramp-delay = <6250>;
>  			};
>
>  			sw2_reg: sw2 {
> -				regulator-min-microvolt = <1500000>;
> -				regulator-max-microvolt = <1850000>;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
>  				regulator-boot-on;
>  				regulator-always-on;
>  			};
>
>  			sw3a_reg: sw3 {
> -				regulator-min-microvolt = <900000>;
> -				regulator-max-microvolt = <1650000>;
> +				regulator-min-microvolt = <1350000>;
> +				regulator-max-microvolt = <1350000>;
>  				regulator-boot-on;
>  				regulator-always-on;
>  			};
>
>  			swbst_reg: swbst {
> -				regulator-min-microvolt = <5000000>;
> -				regulator-max-microvolt = <5150000>;
> +				/* Not connected and left unconfigured */
>  			};
>
>  			snvs_reg: vsnvs {
> -				regulator-min-microvolt = <1000000>;
> +				regulator-min-microvolt = <3000000>;
>  				regulator-max-microvolt = <3000000>;
>  				regulator-boot-on;
>  				regulator-always-on;
> @@ -95,18 +94,25 @@ vref_reg: vrefddr {
>
>  			vgen1_reg: vldo1 {
>  				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <3300000>;
> +				regulator-max-microvolt = <1800000>;
>  				regulator-always-on;
>  			};
>
>  			vgen2_reg: vldo2 {
> -				regulator-min-microvolt = <800000>;
> -				regulator-max-microvolt = <1550000>;
> +				regulator-min-microvolt = <1500000>;
> +				regulator-max-microvolt = <1500000>;
>  				regulator-always-on;
>  			};
>
>  			vgen3_reg: vccsd {
> -				regulator-min-microvolt = <2850000>;
> +				/*
> +				 * Specified values refer to 3.3V operation; voltage for 1.8V
> +				 * operation is derived from this.
> +				 *
> +				 * The base board should usually mux GPIO1_IO08 to SD1_VSELECT for
> +				 * automatic switching of SD card IO voltage.
> +				 */
> +				regulator-min-microvolt = <3300000>;
>  				regulator-max-microvolt = <3300000>;
>  				regulator-always-on;
>  			};
> @@ -118,13 +124,13 @@ vgen4_reg: v33 {
>  			};
>
>  			vgen5_reg: vldo3 {
> -				regulator-min-microvolt = <1800000>;
> +				regulator-min-microvolt = <3300000>;
>  				regulator-max-microvolt = <3300000>;
>  				regulator-always-on;
>  			};
>
>  			vgen6_reg: vldo4 {
> -				regulator-min-microvolt = <1800000>;
> +				regulator-min-microvolt = <3300000>;
>  				regulator-max-microvolt = <3300000>;
>  				regulator-always-on;
>  			};
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/
>
>
