Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CB43E5EFE;
	Thu, 15 Oct 2026 03:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035625; cv=fail; b=Rh9yvK08gKiaLNExjrs5IKzseQj2Iokmj8Pmytwm59irM8C6BefW2x+sWMFqsbjHuPBgrMw2/TZmJH4q3Y/bQYIhFj014fngZ64ZWwHQEsRHET1DN5hNcUOWWyXx+0TrZkOqjo3Ni5/Jiz6lMH7VWAr/vdRZMIM2n7Zic1HUyYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035625; c=relaxed/simple;
	bh=ykwQ+D7WilsPSIinxBAz/ZmZwQ3KnedKsAujWYBMp9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=psSSynMBigVTowCbOBPWn/APB6FUJflR0UjfNqaUsnm8CF4CW752Xh3rvtKFxKHorB1AKd+tw4uHpPq7QlyaW1uXQge8MKpe/WdivaYYnujtHlSL5o9s3PK8Uwu1QZ+G6EHQObzXzo3rXtF6oMg/tvpUVLBAzmBuLX5/QBeY7ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Sp07dtAU; arc=fail smtp.client-ip=52.101.72.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Sp07dtAU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7yJUqObDQnbkoAqSiEj3WdkysEGcCrlQj9DApUcNLDJ8vLtpCjGC4rpxktSXd2uNfH3StwSbzKkrEJ5rf8s85ouYLKee26ucHv0MWG6cI27T/I/s/Ciwwj/DbZwsT/AVAGrCNYIQfvahQ+wtTUlSFtDabzA4QNc/C0llgFLE34QkI5L+whkOKlkfkFlR3jZIYVmCBUviC5P+cNSvXgv7ysruF6f1ybAXMuDS2qnMrl9kAPXoQvORM+UHoRvKwLRG9q84Gwrde4JWV/u/SJ8bhW+BgZG6xvXGulZcZbttP5gy7k4bh3Sv9pD1GUN3Wa/EJ5I8fKBjBUSbimb7ceuOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPJDDRMvvglY5IJI7XgT8h1LKZ5Ofp+mKEQiteRdWRM=;
 b=ff3nDPMXCRUT7KeszgO9jlTxb9gFvp75GglnObNLJOtGBb71tSUjsUvqRPJc0O6CjXSIyd4A2fAoy1WRupsJyvfLgL2QErWgFyWyGhtBk+6mC+MiidnV/lEv3Qdh/Te7AKWJi+DDJ7sH/u2UooPnQiOO5cbd1nnMRaCLG0hrivK1srhAB3w3HE1PURlh5ucM/A22EYGbqg5kyIDq0qC8eWs2Vd7tS6BpGKVkoVgQKr8sUXjZvU0izj3aoOOrPbFZZLRNyDYxDo1GIMsEHHjn6LcuuEysU7jCqL+PMENvbsxAEa6UkKtFt0jGYRA0s9NrLJh/Tx56+Yde3Dnk/rBufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPJDDRMvvglY5IJI7XgT8h1LKZ5Ofp+mKEQiteRdWRM=;
 b=Sp07dtAUOlA6McMq4Y/plQAuL4/49wFFC9B/vcX8LYzERdYHdF8T8zraF7vCQRql7mLlwP4noKmhgR7Tkkj/4H5Z+b08ZFnBsgPnEhOA1b3oDvressXKVFARmCoHI8+4tiIOtI/VmW4fpJFghWQ4tZTbDLemWKbzxDxHZLuKOuCkNxCO7mM6nyQGUKr9WUkfkQSFsLti51z6jO/i24vl63Ywj8XITqiG281LlVQc9XdtRJpF9txKjeSPb1LbdIroclEQB+sh+w++vV+4CmVo6k52g3sS0vxTwRnmAaIvgDt+kCQ5I7WRudWywrCCg9w+DAfsb0L8JX7s3fctJSMWlw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com (2603:10a6:290:c0::7)
 by VI0PR04MB10685.eurprd04.prod.outlook.com (2603:10a6:800:264::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 03:40:17 +0000
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151]) by MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151%6]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 03:40:17 +0000
Date: Thu, 15 Oct 2026 11:41:54 +0800
From: Liu Ying <victor.liu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 2/5] arm64: dts: imx8qxp: Add display controller
 subsystem
Message-ID: <atBLglf0gSLS7XkW@raspi>
References: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014071657.118378-3-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: MA5P287CA0026.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::9) To MI9PR04MB350878.eurprd04.prod.outlook.com
 (2603:10a6:290:c0::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI9PR04MB350878:EE_|VI0PR04MB10685:EE_
X-MS-Office365-Filtering-Correlation-Id: cd341b8d-df1a-4e44-8970-08df2a6e07eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|19092799006|23010399003|56012099006|11063799006|18002099003|22082099003|4143699003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	iLVhc6xqlVynk26GRetnD8q4HmDaF6HqoWq1uDFha9pgU1feI2SwK0WTGMoOZQKqCUZQtrmz5eSAZTtTXQj82dApcKhKV2st0EcW7WUfwTL8m78g+tISt3Cuzbfpe2bGh5bVSt7ycTovRnHwJDTlz2vTAN4qmoYMRK+pNam2PwAfU2P/Vz/FdMeRahqC05I0Rg5/+9RLNH0rmTrRhPSzjl6EVjdHtm/13OSmdy673SqzzvHEh5RRXBZHdG55bsrpFl8jxb+KzGRpChqgydA4QHS5dooALVxRir3zpdSfLNDM2kYd2XGbb4VNZhU2ugrI70dv8NQ/lHa0mGQwgbNQQ02YfCONf2Q/15bIItuZaDpktgfEPvZ1RNnD0RDP5KDdlPWvDmfVK5gAYkDcSC75NuSI0vonVI/70dGZxgceQWgQxs42G92um/e47AsUEA9ttQAjrhbJ3vqDw0ep+aWpvv1aARaNIisYiJcZjlFsrFjlhEQvffZLO+ZMrvddOY/yCNtM0ru1On+UM4bzn12X0kooGvAJ/llkbDaVFel2FyNlGeNIFbNq0oD7yEYYLkXbT/Lv/0n+clpZYD24ipMtsN72ZiacavB59Z4Y0biJwYr5HNsujWSD8PcU+oCKGDYAM57Otjmz27heUXB+qxiVLUpqFMLD4MDm+ShTYtxW6Qg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB350878.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(19092799006)(23010399003)(56012099006)(11063799006)(18002099003)(22082099003)(4143699003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pTg3u3j/HkoENx9am5YIvlWK6eqJjG2AGGj06OlnARsMRnUhW2KfZJ5TorUO?=
 =?us-ascii?Q?mr5anv7UJ3FalP1A1+dRIFFOVcwpqezdPj3OFPfBBYgJVLuDcU0hA7i18KqV?=
 =?us-ascii?Q?IrLPF7yGLQZkewDe+1pLx58BmcuBkpHFIHE4TX7LBWa/KFs5IwN2tJBcBeYh?=
 =?us-ascii?Q?ogvl1PL1uNQiEbIXrDtafEUh2FBxTsGf3azKrhk7GLixcsEknzoI5W2Lnt4e?=
 =?us-ascii?Q?cxhiy862AEx5VJxi/+UxvY94m1PQTZxQ0nCvr4pEAW13HwU3teZWa0EYGSrY?=
 =?us-ascii?Q?goiNHtCHbcSPn6jbvAZjwceuVcnLTD4Cab2Gicplg0I0GMoRlmd3iBzXQ2yt?=
 =?us-ascii?Q?hsB8uV68cEFxIMzM47QQZ9ubQoSmcKfhSK5wyIGHSHVZvpqKjClJASa5paJb?=
 =?us-ascii?Q?hKKLuJ4XnbykBP593/EVBmovJyAGa8UHuiGk3/autUbjfgZQ7Oz19lWO9Ctn?=
 =?us-ascii?Q?oo03Vap4WY8TY+BFDQsmJNfBCIKOdohe5fQZk8ssDZy2FIiI6dQPYTlnaZwh?=
 =?us-ascii?Q?XVETthmGkQHMTd925eANd3ylpgnEL+T7QJ2dhtyggYvYIc/TgddaiVbzcXlv?=
 =?us-ascii?Q?H00JdNGxjq2qsaY9LP7P88PdYbRdE3zFjuhDrVDyzc4hg4RbXGxeLFRlxSFQ?=
 =?us-ascii?Q?SvHA+vVBBrMmko08dZIeunwtP0jPFT7EB1gzObjFhURek2bJafXeOkDHt8tt?=
 =?us-ascii?Q?Os+7raw87820DqW777d/SJTC39K2z6d1LH3qfgoLY5awvl4GpmO0Car+9Zri?=
 =?us-ascii?Q?qq5OyAuyi8SBs0OiWza7QSeoTy6sG1RQjtVxoymL2UHlnMZtxymu10yFCH0V?=
 =?us-ascii?Q?Y9AKRqiN2evbsag5jRg3ZCDk3NHXETyQNY3cSDpfaPyECu+GfzhuIr/+I99e?=
 =?us-ascii?Q?H4szBhsbdIobQ3mAjU5befWfnoaaAC0LFBbHM91em0Lp0i2Az7N8B3XzH4kY?=
 =?us-ascii?Q?wg9pMV0Q+0d6ZmvaDuKsm/EKFjOFUdNwtdGfJEsfMUPCgtOXNS2Is5YQaX/2?=
 =?us-ascii?Q?zW5Jo92vpDvMntLuKwVhiVITXWHF5yl65cqLrg6wBV4entmhjqjoXc3P8scc?=
 =?us-ascii?Q?Dk9f6QPRnj//BCE6e2UZzDdyb1yhAflx6WrjSzZolMRxyiohi7o4j2GLwA9h?=
 =?us-ascii?Q?2XTNTHEPjF+7qr9ptJ3SQ0v8c8wjwviDKVR0NG1BH31C65vbXmtm7B5w1hXI?=
 =?us-ascii?Q?wh115FH/t8jXvuluHlSIZ1SOv5DtvkoH9yV+TYN9dd8vTTLhYuNYenj1LQos?=
 =?us-ascii?Q?A2aatvE2VnafrrTIRijZWvvqAI/W9EgG/yHv17RwMnz/gH+nD30Ymbe2cgGa?=
 =?us-ascii?Q?HwELrSPf952qat9UoaShfS5qqEm0hsz1yuexVpb29lzAJeImJddtolgv6KHU?=
 =?us-ascii?Q?byLerB5Mlrsl3g8YOySsOplS95fkneJU9hK1bfLMb17Flhctj8jGYBvO/41L?=
 =?us-ascii?Q?OL5B3KDFkHePquZ23q3jES6b9rLTs7oleMBuZn3OCkc7+IAuowb5xCjkQBFX?=
 =?us-ascii?Q?eItBAyY49hCPSLXLa1ATwYwuDgcSwzhoC2AJ/3FwA01TDoxysOnNmAg2rPYQ?=
 =?us-ascii?Q?tqhqvFyH/6L0fMyUX9HxZ7A1tMMcIVNhXdVVhlMcMukUcXftdIMlBuRStgVm?=
 =?us-ascii?Q?4Vz4KVAZqeBz0xckDIltgvopyynopzWhruESwGSNokCjytRXMRIyhrHsMd9C?=
 =?us-ascii?Q?qxv097azTQO1Wz+0zZ90l1a2ylpHzu/0uMC9UXUjcmiCiuO0Pslidoy/BOU3?=
 =?us-ascii?Q?8D13DU4HZA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd341b8d-df1a-4e44-8970-08df2a6e07eb
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB350878.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 03:40:17.8357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Zc8TMRpZsufELqzzv6nKJShp7IfPz4jiTgmywJHuNjeKEUMVkCLhzx/FSOPFuQAD2iDv/U3l8PkKMmM4Mk0vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10685

Hi Alexander,

On Wed, Oct 14, 2026 at 09:16:46AM +0200, Alexander Stein wrote:

[...]

> +	dc0: display-controller@56180000 {
> +		reg = <0x56180000 0x40000>;
> +		clocks = <&dc0_lpcg IMX_LPCG_CLK_4>;
> +		power-domains = <&pd IMX_SC_R_DC_0>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +		status = "disabled";
> +
> +		dc0_intc: interrupt-controller@56180040 {
> +			reg = <0x56180040 0x60>;
> +			clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
> +			interrupt-controller;
> +			interrupt-parent = <&dc0_irqsteer>;
> +			#interrupt-cells = <1>;
> +			interrupts = <448>, <449>, <450>,  <64>,
> +				      <65>,  <66>,  <67>,  <68>,
> +				      <69>,  <70>, <193>, <194>,
> +				     <195>, <196>, <197>,  <72>,
> +				      <73>,  <74>,  <75>,  <76>,
> +				      <77>,  <78>,  <79>,  <80>,
> +				      <81>, <199>, <200>, <201>,
> +				     <202>, <203>, <204>, <205>,
> +				     <206>, <207>, <208>,   <5>,
> +				       <0>,   <1>,   <2>,   <3>,
> +				       <4>,  <82>,  <83>,  <84>,
> +				      <85>, <209>, <210>, <211>,
> +				     <212>;
> +			interrupt-names = "store9_shdload",
> +					  "store9_framecomplete",
> +					  "store9_seqcomplete",
> +					  "extdst0_shdload",
> +					  "extdst0_framecomplete",
> +					  "extdst0_seqcomplete",
> +					  "extdst4_shdload",
> +					  "extdst4_framecomplete",
> +					  "extdst4_seqcomplete",
> +					  "extdst1_shdload",
> +					  "extdst1_framecomplete",
> +					  "extdst1_seqcomplete",
> +					  "extdst5_shdload",
> +					  "extdst5_framecomplete",
> +					  "extdst5_seqcomplete",
> +					  "disengcfg_shdload0",
> +					  "disengcfg_framecomplete0",
> +					  "disengcfg_seqcomplete0",
> +					  "framegen0_int0",
> +					  "framegen0_int1",
> +					  "framegen0_int2",
> +					  "framegen0_int3",
> +					  "sig0_shdload",
> +					  "sig0_valid",
> +					  "sig0_error",
> +					  "disengcfg_shdload1",
> +					  "disengcfg_framecomplete1",
> +					  "disengcfg_seqcomplete1",
> +					  "framegen1_int0",
> +					  "framegen1_int1",
> +					  "framegen1_int2",
> +					  "framegen1_int3",
> +					  "sig1_shdload",
> +					  "sig1_valid",
> +					  "sig1_error",
> +					  "reserved",
> +					  "cmdseq_error",
> +					  "comctrl_sw0",
> +					  "comctrl_sw1",
> +					  "comctrl_sw2",
> +					  "comctrl_sw3",
> +					  "framegen0_primsync_on",
> +					  "framegen0_primsync_off",
> +					  "framegen0_secsync_on",
> +					  "framegen0_secsync_off",
> +					  "framegen1_primsync_on",
> +					  "framegen1_primsync_off",
> +					  "framegen1_secsync_on",
> +					  "framegen1_secsync_off";
> +		};
> +
> +		dc0_pixel_engine: pixel-engine@56180800 {
> +			reg = <0x56180800 0xac00>;
> +			clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			dc0_constframe0: constframe@56180960 {
> +				reg = <0x56180960 0xc>, <0x56184400 0x20>;
> +				reg-names = "pec", "cfg";
> +			};
> +
> +			dc0_extdst0: extdst@56180980 {
> +				reg = <0x56180980 0x1c>, <0x56184800 0x28>;
> +				reg-names = "pec", "cfg";
> +				interrupt-parent = <&dc0_intc>;
> +				interrupts = <3>, <4>, <5>;
> +				interrupt-names = "shdload", "framecomplete", "seqcomplete";
> +			};
> +
> +			dc0_constframe4: constframe@561809a0 {
> +				reg = <0x561809a0 0xc>, <0x56184c00 0x20>;
> +				reg-names = "pec", "cfg";
> +			};
> +
> +			dc0_extdst4: extdst@561809c0 {
> +				reg = <0x561809c0 0x1c>, <0x56185000 0x28>;
> +				reg-names = "pec", "cfg";
> +				interrupt-parent = <&dc0_intc>;
> +				interrupts = <6>, <7>, <8>;
> +				interrupt-names = "shdload", "framecomplete", "seqcomplete";
> +			};
> +
> +			dc0_constframe1: constframe@561809e0 {
> +				reg = <0x561809e0 0xc>, <0x56185400 0x20>;
> +				reg-names = "pec", "cfg";
> +			};
> +
> +			dc0_extdst1: extdst@56180a00 {
> +				reg = <0x56180a00 0x1c>, <0x56185800 0x28>;
> +				reg-names = "pec", "cfg";
> +				interrupt-parent = <&dc0_intc>;
> +				interrupts = <9>, <10>, <11>;
> +				interrupt-names = "shdload", "framecomplete", "seqcomplete";
> +			};
> +
> +			dc0_constframe5: constframe@56180a20 {
> +				reg = <0x56180a20 0xc>, <0x56185c00 0x20>;
> +				reg-names = "pec", "cfg";
> +			};
> +
> +			dc0_extdst5: extdst@56180a40 {
> +				reg = <0x56180a40 0x1c>, <0x56186000 0x28>;
> +				reg-names = "pec", "cfg";
> +				interrupt-parent = <&dc0_intc>;
> +				interrupts = <12>, <13>, <14>;
> +				interrupt-names = "shdload", "framecomplete", "seqcomplete";
> +			};
> +
> +			dc0_fetchwarp2: fetchwarp@56180a60 {
> +				reg = <0x56180a60 0x10>, <0x56186400 0x190>;
> +				reg-names = "pec", "cfg";
> +			};
> +
> +			dc0_fetchlayer0: fetchlayer@56180ac0 {
> +				reg = <0x56180ac0 0xc>, <0x56188400 0x404>;
> +				reg-names = "pec", "cfg";
> +			};
> +
> +			dc0_layerblend0: layerblend@56180ba0 {
> +				reg = <0x56180ba0 0x10>, <0x5618a400 0x20>;
> +				reg-names = "pec", "cfg";
> +			};
> +
> +			dc0_layerblend1: layerblend@56180bc0 {
> +				reg = <0x56180bc0 0x10>, <0x5618a800 0x20>;
> +				reg-names = "pec", "cfg";
> +			};
> +
> +			dc0_layerblend2: layerblend@56180be0 {
> +				reg = <0x56180be0 0x10>, <0x5618ac00 0x20>;
> +				reg-names = "pec", "cfg";
> +			};
> +
> +			dc0_layerblend3: layerblend@56180c00 {
> +				reg = <0x56180c00 0x10>, <0x5618b000 0x20>;
> +				reg-names = "pec", "cfg";
> +			};
> +		};
> +
> +		dc0_display_engine0: display-engine@5618b400 {
> +			reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
> +			reg-names = "top", "cfg";
> +			interrupt-parent = <&dc0_intc>;
> +			interrupts = <15>, <16>, <17>;
> +			interrupt-names = "shdload", "framecomplete", "seqcomplete";
> +			power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			dc0_framegen0: framegen@5618b800 {
> +				reg = <0x5618b800 0x98>;
> +				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
> +				interrupt-parent = <&dc0_intc>;
> +				interrupts = <18>, <19>, <20>, <21>,
> +					     <41>, <42>, <43>, <44>;
> +				interrupt-names = "int0", "int1", "int2", "int3",
> +						  "primsync_on", "primsync_off",
> +						  "secsync_on", "secsync_off";
> +			};
> +
> +			dc0_tcon0: tcon@5618c800 {
> +				reg = <0x5618c800 0x588>;
> +
> +				port {
> +					dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
> +						remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		dc0_display_engine1: display-engine@5618b420 {
> +			reg = <0x5618b420 0x14>, <0x5618d400 0x1c00>;
> +			reg-names = "top", "cfg";
> +			interrupt-parent = <&dc0_intc>;
> +			interrupts = <25>, <26>, <27>;
> +			interrupt-names = "shdload", "framecomplete", "seqcomplete";
> +			power-domains = <&pd IMX_SC_R_DC_0_PLL_1>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			dc0_framegen1: framegen@5618d400 {
> +				reg = <0x5618d400 0x98>;
> +				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_1>;
> +				interrupt-parent = <&dc0_intc>;
> +				interrupts = <28>, <29>, <30>, <31>,
> +					     <45>, <46>, <47>, <48>;
> +				interrupt-names = "int0", "int1", "int2", "int3",
> +						  "primsync_on", "primsync_off",
> +						  "secsync_on", "secsync_off";
> +			};
> +
> +			dc0_tcon1: tcon@5618e400 {
> +				reg = <0x5618e400 0x588>;
> +
> +				port {
> +					dc0_disp1_dc0_pixel_combiner_ch1: endpoint {
> +						remote-endpoint = <&dc0_pixel_combiner_ch1_dc0_disp1>;
> +					};
> +				};
> +			};
> +		};
> +	};

I'm thinking that it would be good to have a complete display controller
DT node in the first place, including those prefetch engines attached to
fetchunits through the fsl,prg property.  In this way, display controller
driver's life would be easier - all child/grandchild devices are always
available.  I'm considering to adding a check to the Linux display controller
driver to ensure the availability(at least for critical child/grandchild
devices).

-- 
Regards,
Liu Ying
