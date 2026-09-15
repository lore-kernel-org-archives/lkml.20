Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE65D4A2048;
	Tue, 15 Sep 2026 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483815; cv=fail; b=FzSuhLRKmey4+4oHwGdRechm1jlyipfgfULfiXHesXCq3+Jq7W9eqjtt4xo04jRTnW/DWKNK+eSYZ/SEuBL5u5EyM4IT1F+9yHBBixlthF2zz9WADnT9b3B/R7PCseP8v/zMs/nO9Ue4crf/guNrfE075sxKQAmcFrsP4t8rafw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483815; c=relaxed/simple;
	bh=Yz/ia7hvOekUSNy4dmeNwRsu7OcySzQG59RbsHcl2so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SMZMtfPwzbOtwdzY8ge4u6pSWiDf7fvqZLdBYOb5O76Nwl7P522vBvVHPiGOE518d+BL9c7GMjcrhs9VvZNwMdFCY7GUk1RKC6cT5vzbRgaP2dgM3A0VQioT/tQ0/FvbosnsQPcOuciwgFZEW0LXiI42xcRNcMaN6pOPwIidlMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IPRqEAph; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IPRqEAph"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8Y9ty2CDRkN7rVd0H75AfbKX+/TKdnk6Edbb3F/5Be+dYbdBzhiJZSCJ2y6tDdH4Fl4U3DtA+Rzr/Okf9LPk7GkpDyeudRdYgssxxvGCILlD4RxlghQ5Krt33gL1fl/YlbtaVW3trKR7ZNGvnBgj2d7Y8jI8dHFix2PVL3vFpHS6JN5z4tmE9nFkONhzH3qn1FqbT9LbP3z0WTByIJsSj+mxU2gufweKqqlrD0pR89Aws1nWhyxSUJ78Re4aV45DIlVmLOV8tmFWTcGET3oE1qotynCZAXeD3670IOpHf5iOMpnKVKaUZ1uawIYV0PQw4Fpigid/FcSBwrYdDqmdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwDucxnevTlXp/gysVNTRFypXDGaQQvBRBNpel0cp1I=;
 b=ihhEIQaoPZebVAbNJk19XPwXW9g1FrRZ01p/c15KJ3fby8pbcem9LxnjR6SxsMUCn8sBgRU40X17wAfu+QjDliyOVzPs63J5M+2SOXkOT8vXl4hM50Ns2xojmo8APPESK6fWsW2BiHR5Vxjm8jBYWrwOkFI3A0rqhLOPChCo6V18YF80h5LRNhbPEg6IPYNL+xM6coQORhgCST8C3Pl8Lx/ZviiAsx4USGKrUva/EgW+G+VmwahuhyYeTP6fZ119JoSaMJ2t0YGSlVngSjt6vHLRLINkPgQMh06o5JKmBE6SrrspOobvy/SfGJcg6V0+il2g9d3P8QgrLQa1mfbm+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwDucxnevTlXp/gysVNTRFypXDGaQQvBRBNpel0cp1I=;
 b=IPRqEAph/bavm8fYNih892sNdTDCnjjNo6l/5UJEe5Iupru4uKa7LQnFvzofKEfeVVk7P462WD9egvkNoUOhCUbnvJ++nJ6CXYvJV+5GI/YkUoUN9yBZtJ/poTO/2pFCq6XNG4kyvgcWWVOg5eWQFyWjpoRrnovqz7PGNyvmLNmq1Q0TevqErS8HjL94Lw23lrLD8ydQ+krECWFUljOPteQuFzae2CNzou5u2unN1n34ilGYKgOee0rHES/zycAv1i2Pt7SH0aO5eOz9r7QITmirHQhlItu5PLiJIcIDMVPKeCMVIi4//b07e3A9zhB0nviLbSWvFrReR3W355vU9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9638.eurprd04.prod.outlook.com (2603:10a6:102:273::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 14:50:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 14:50:08 +0000
Date: Tue, 15 Sep 2026 09:49:59 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: Drop unsupported opp-hz-real in OPP
 tables
Message-ID: <aqlbFwMZp_TAExFq@SMW015318>
References: <20260915072308.64047-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915072308.64047-2-krzysztof.kozlowski@oss.qualcomm.com>
X-ClientProxiedBy: CYZPR19CA0020.namprd19.prod.outlook.com
 (2603:10b6:930:8e::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9638:EE_
X-MS-Office365-Filtering-Correlation-Id: 594189c1-ddc5-40e9-8bee-08df1338a2a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|19092799006|366016|18002099003|22082099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Pmuuesz4YORTQXGNcZq0z025UXkE5ITM0cV/mKt9SQ3WNTPTA2RbinWhuhSUV+u+vXif0fp8ZekHBXViSIw1OZx/ZAlfGfIrT+7TgvlHfbKsXjXiLYhIRLdLESuVdWR6YIPK6brLjkAt6txcEVJZ4wJOVimzvN2AuMrf6TsvvJ3HQ69E+Echg/mwVItwsgF4HxQRhWDWOu6HlmZzClOO0HN0n+YcvO9K0bXg8BhqJxmmJyQepJizstg9zF5Da8DLiEJAp3lGuejPNFeCKblpW0vk/R1/Hy8U4UQ5k3aAF9Wcmd9Wo3eNVVKnL0WNdzemrI5ig2CsjoYfpn1pi5wkN7DuuTajPNl4y9bdi58uNz/Y+OLA0lS1PhSB8M3g+yA+ZK/iyb9ankUMFdHX9klgs20pIHe+jH4XYLGyHczu2MdoZ/Q5tBxtR8UqdLr3Ofe4G0XsAE5tD+ceKwKJaWhKTh4/9ipqNSpmUxvFChc1nRVfstftnqqSRs/R+XXyhFdNzmB5JhTZXE/8Yk4t5w0U7ae4XZKYxP3RZ7bXmNVye41fSRsg6xudMgYHD+8hqci9/VttwN7y14HEv7BGeLutdKwIoDaF/Nkv/81eBEuQk8Us/HZJA9MVGy+mIsc4YYaB9I6h5IebaF8fy6jiVV5hIKBNJgU1cFNdfprcNOJ3ESI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(19092799006)(366016)(18002099003)(22082099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K2L5d53+KGgFdWe915zJHIKFXHSxFPjQUkPlSibnUQ9j3jEe0gFi42x9XI1I?=
 =?us-ascii?Q?YqkokUE8I8JT9HU+0N5Zuk+3QqpQNg4LmoyrEq3VFsaYDvuuroA11KIorgKd?=
 =?us-ascii?Q?haaSm+0wYt+KbEQSB/u34iuI6FwKqccJpAgEqIGlI8cnog5e9lfSutgOWDam?=
 =?us-ascii?Q?5LiCkxjXWVz9bUyNe/KN0N4Dvu0dEUwAopMj2EvFXWvJF5wNECogthB8IrWs?=
 =?us-ascii?Q?7VMwFCxFd9wg4IyHPluKAqCEufmDHlPgtbOttDiIBqN4Nl54J0Yjpuz4/Kel?=
 =?us-ascii?Q?tzwhswMitirPP2imyOql0LqCcuiR/BvuW0El2fS9JUYQpQZkUCSEzgPOeBoV?=
 =?us-ascii?Q?U1jeJKf8TcmNLPnmSZdyWPtLokoZhsXiZUf9dOj8nlEVhvuHryiFI8PJD4VW?=
 =?us-ascii?Q?GDTZzYpfFsIvN4cNNFcZS//X4U1gRlp62DZykgXBcVidzfaAv2zBGVruRduX?=
 =?us-ascii?Q?4Ukp1HlopQw6W29Wi63N75A/hvQbsKkxOun2Rwi3WHfdJcZoEwTsgl2BDXl8?=
 =?us-ascii?Q?g69or9c3W1UNvF5XTpNhP+fUHGcsc/prkLJIxS478/4PdUmitkWrU/hH0E+a?=
 =?us-ascii?Q?RbnAD06i1r8IdmXfsyDcDjezjeRtZTPdOkaTeQ3p695K+f0ovNjKBntb3UQF?=
 =?us-ascii?Q?0OnRTy88wDhZQiJk01RBeeax8V8/bks1Yao3zNp62N/TZTIwBgX2Fy5cO6AZ?=
 =?us-ascii?Q?TUYvNS9GvuzP/GSbP2Lv2vTR9PWZhCcgbcWRwImprv/HijDtFVlPkIvRBsbJ?=
 =?us-ascii?Q?PE6DK98zKKR4p2wbYH6cDwEmAaqL8J/XbmBtnVfd2+R0YAHE6IMaLto8mMMG?=
 =?us-ascii?Q?dtk94sU6OEyx1b25Hq+CTNcp9ZmR8ixlGpEJZ40gcQ+iGi7J4ZuyeItyBxSE?=
 =?us-ascii?Q?RK6N13Q4iA0yjYLgjPxuhY6hId4FRBsG4Wif3BKvdmYiqFiV2sT23Kne7MrE?=
 =?us-ascii?Q?qSBVxnw2432cTHQw3cHRU63XjChlqVGLSorwB7DIouaRlOcWQkolbvRfyMO6?=
 =?us-ascii?Q?c+RtGUZ+ig0UOnaDm2lisKns3xaJDE8Hhy2jpGEJhHc1elYLNHby/A+ciwZ+?=
 =?us-ascii?Q?Wk0o47qGPZ70/GtTuvVPV/a30tH0coNWM6HwEZ5LKEm3EmYu/TDSfOATrlCI?=
 =?us-ascii?Q?fmGGMMfBqT6ltkAAS0NH7ZlsMElrd1KnmJqK3Bv4tSu0I48uOjXH94xN64bj?=
 =?us-ascii?Q?/49nNLuWi/izf0MK3aPh8BXy63uMH8kCoBtBmTkGQaSm5l3KOruzQWwey+pW?=
 =?us-ascii?Q?C3Ap6HVSpyonSj/IUFaNkvLVGr9A6/A0bI0g2UywBAViukAMuskwoWci/+Fr?=
 =?us-ascii?Q?XWBW4PHiFLaHtv2Bh3X6ioWN2XqLjYh/Tmq/vNtMwysJmXfeJ/aAcs9Skk2l?=
 =?us-ascii?Q?LB5Gtlzs4v2lSLI3Wzvb9wxS+K34lt1E4FR8vnt19k2/xlbiJVrW6ZieiWB1?=
 =?us-ascii?Q?gouw86wc4mSRF/p6hT1m/+ssNSvGw6fgSdeH69ctxP5FKE8k2jCljZWwVya5?=
 =?us-ascii?Q?npC1zQOTJBOflWKajfaJkYNJHPT9/X3u5cJpVNqHkyuHIMHtr0UzWEg2/wsB?=
 =?us-ascii?Q?cD5e7ULx+BSe9VpHVelgIWKNm9SnR6HtJqM2BrowBvbqWTNsw+Ell+F/CuFm?=
 =?us-ascii?Q?F+OFLsQYWsTAms+cjJmoC2ZlbD0VH6jsQ0WLL1FPiJER+xXKJfegSLP6ajNb?=
 =?us-ascii?Q?gJSppO7rt8ZLCDzFmLWnGZR2vB2EovdvhJ00V9+htNJp3wkw4mO5/54/lvRz?=
 =?us-ascii?Q?O3BzC5haYLibgJ+gdwk+JnbV0itQ2eICfsVu4ojcc2P6CLJTkOpm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594189c1-ddc5-40e9-8bee-08df1338a2a1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:50:08.0459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fp+bHq4YuMmORMNyiBQfJOa0k7R79tQali/IHxkw/ojcv1ygYU4qbUZTxfvfvDO5nvvVTP0YP9uFlOC87JLkJt7OUP+4pp7jIc5T06nlvhs1i+3EJi9m6Ydr8xwJYevD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9638

On Tue, Sep 15, 2026 at 09:23:09AM +0200, Krzysztof Kozlowski wrote:
> There is no "opp-hz-real" property at all defined in the bindings and
> new DTS is not allowed to bring undocumented properties.  Fix dtbs_check
> warnings like:
>
>   imx95-15x15-evk-pcie0-ep.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'

I run below command, have not found above warning

make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8 CHECK_DTBS=y freescale/imx95-15x15-evk-pcie0-ep.dtb
  DTC [C] arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb
  DTC     arch/arm64/boot/dts/freescale/imx-m2-pcie.dtbo
  DTC     arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtbo
  OVL [C] arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb
  OVL [C] arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb

Anything wrong?

Frank

>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi  | 3 ---
>  arch/arm64/boot/dts/freescale/imx952.dtsi | 3 ---
>  2 files changed, 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 1cb8eb15e5c7..99c72d5cd125 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -255,19 +255,16 @@ gpu_opp_table: opp-table {
>
>  		opp-500000000 {
>  			opp-hz = /bits/ 64 <500000000>;
> -			opp-hz-real = /bits/ 64 <500000000>;
>  			opp-microvolt = <920000>;
>  		};
>
>  		opp-800000000 {
>  			opp-hz = /bits/ 64 <800000000>;
> -			opp-hz-real = /bits/ 64 <800000000>;
>  			opp-microvolt = <920000>;
>  		};
>
>  		opp-1000000000 {
>  			opp-hz = /bits/ 64 <1000000000>;
> -			opp-hz-real = /bits/ 64 <1000000000>;
>  			opp-microvolt = <920000>;
>  		};
>  	};
> diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
> index 887abb1c4784..306239de096e 100644
> --- a/arch/arm64/boot/dts/freescale/imx952.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
> @@ -323,19 +323,16 @@ gpu_opp_table: opp-table {
>
>  		opp-500000000 {
>  			opp-hz = /bits/ 64 <500000000>;
> -			opp-hz-real = /bits/ 64 <500000000>;
>  			opp-microvolt = <920000>;
>  		};
>
>  		opp-800000000 {
>  			opp-hz = /bits/ 64 <800000000>;
> -			opp-hz-real = /bits/ 64 <800000000>;
>  			opp-microvolt = <920000>;
>  		};
>
>  		opp-1000000000 {
>  			opp-hz = /bits/ 64 <1000000000>;
> -			opp-hz-real = /bits/ 64 <1000000000>;
>  			opp-microvolt = <920000>;
>  		};
>  	};
> --
> 2.53.0
>
>
