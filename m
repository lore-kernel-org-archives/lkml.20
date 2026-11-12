Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794498110;
	b=JGa4OIgTEt9XUecoZIV+mV8hA8PBbQRcsAqBUuaIgs03bcvQGYjN5wlPiR6ajxWbuTdD
	 d/QHF6KfkdbU0hUUljm9Tcg6+o4Me8NwW1WL00mjrWla3HUPVm5l/StrZ/CeykWermISr
	 6qGNi1KQeGSn0hJvf69fStm5yF0krNh+/l9gV+SmUJa+E28tbUfQ8eBQCx8sM/+C1H34l
	 nem6l8hf3PVZwzIsatbczp8X5SHRJtJdWwwrn++TjerYXtcBYML9OTlaZhiDA+a7ElaY6
	 7nc7YKPvKDz7RvwhWGyEUuUv9D6t5B/dq/VZ7l0h/j7x9aSMaK6oGCz2cUGjkBqqvNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498110;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=0ZxCiTjqI99z+31RvYjXWlycXecIXu0k6MWQV8ev4wc=;
	b=lI2PnKaYHmfqFh4EZS5pMZNbK3JOuDaYEz3S3QH3DBhrcXkacJ5kpS7VH62QuHRNd0Jh
	 1XrySkiav9TcMbd6AnFeBc3Irr63P8XGwerxUTn8QAYK+N8KVB+U+actpqalBpCFRhztI
	 yvtvd5YPxSlBcX+Wcez4ZyL2+TQ9BONEg8tXQfiPhmC/FGMMQ7a4JbdBT4HxtORQVrltG
	 8VK07g6fR9ZdedhnM9stAFPllGx0CKKfRWj/+e9iWfvQm8pl95ga23m14iayVJGCJE4IE
	 h1QemeiuBfnmQ3+gJQo1jeVV44M8EwINwK1oDmeRvCTaGmg6/oAPFL9ohSMYXoXileQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=t4udxffN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.11
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DDF606A31C;
	Thu, 12 Nov 2026 15:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48DDF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=t4udxffN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbyOSItZDkt0NwxfVVQCN95m2hQzJ3X0QnDCGhhgp/e25xhgnlh93ixw0Dup34m9JeTGdX/JT5dZjw08Dv3MJBfWYWB0f0+oQ2cJMvxPOkQrx7uZs9ofrPIWFBNQeD90MGxY9oqRC5LV6j/FotuQLFVq+yOIpW5+flR+E9GmXU42hSou+ZorRXFwmrcBfnd80acD3HxMIg+F8FrzitaFjHRYC+S2e7XfT5JWa3fPW0Znrdm5DTl857VzwTE1laZ3I7vtL8841GnPnIgkZLFNSyJqN+FYENlHjKY476hVShGpFzYxx7d4Tei5oR+E06rdC6v9SAAisGZJ54Gz2M/yWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZxCiTjqI99z+31RvYjXWlycXecIXu0k6MWQV8ev4wc=;
 b=WCZPh7NImHwJjbspevwXPp2UPFvxi79KLADVkNTOXa6c0BFdO0JZrYVOHgHrGDf0LMO5nreWsgWYqgsv0xVK6mOTvYTxmzYVJCAnhU8XoLiL2WbdYhCTKm4NDMi575SabdLrxylwY1RPCpWPM8Uiw1VOtnRxIBbp4Rj72QL/1q9FSMpZRzsnkSmwp4PIpcLGBNyrZ720ZiARTc5eM6ymF7WqNYSX4+SPUx0eQGj3w8SgP6sIDXKbBvsIkK/O9O7PJ0z9WmYvCJ5jvihiMtxm+yXw/yezg7Pp7+JgScHTHuCn2Gu2wbavhC96O+0+lVXBtc/Tf5iZC+Yf1ZZ+nmp5vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZxCiTjqI99z+31RvYjXWlycXecIXu0k6MWQV8ev4wc=;
 b=t4udxffNqL7HfEwZV0LHK/uFGwiPKSEQ2+zJ5pfqL57oHw4xRbl7RSrWkNFHYY7+nioAdjaj00rdzmFNzHnvMf53kOpymlo7vgwerafZdi1pj+NvV5a7Lf1LLDAksDLDztnKOKFN20EV7xGL6MeHrqZjtkr8k2Otw7KunQYX2p73cloPeW0Wmw77OewmiAJnOXm02dTi/FPGL5HOyI35gjigv+vMW9V9MJSG9AVWaMbX4v1KsN20tjwkw6LRoBx9MIb67eozpoL73PL0tMiQKmpSGJk81tBY5PwWw86ntbn6U+mgFCzg0/U2Qyn30N9NWfxegkjesRN4H37t97Si1w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB10431.eurprd04.prod.outlook.com (2603:10a6:150:1eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 15:41:41 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 15:41:41 +0000
Date: Thu, 12 Nov 2026 09:41:31 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-bsp@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/11] arm64: dts: freescale: imx8mm-verdin: Add SPI
 alias
Message-ID: <avXeK-IRXbKqI-pc@SMW015318>
References: <20261112150236.164850-1-francesco@dolcini.it>
 <20261112150236.164850-2-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112150236.164850-2-francesco@dolcini.it>
X-ClientProxiedBy: PH8P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::22) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB10431:EE_
X-MS-Office365-Filtering-Correlation-Id: 15b3e0e8-1fbd-4507-20c1-08df40d37267
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|19092799006|261026121527099003|11063799006|4143699003|261026140227099003|261021121427099003|10067099003|261021123027099003|261009223027099003|261102123227099003|56012099006|261022105027099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/XoY8XWr7ewtd+VCSAUTi2vT/V1Nfdu+IqbtmQ8cGlPAfLlttCHct+TFoz9LUsG8My9n504gFZKPkq6F9PoCILcvZPKC4vLnFSqlCu6EL1dETpN4FzukOuh8iAXsV4Jy54UUEwLafWYV5WIr1AlEnVPdLNET0qCpnjfU60azRPx/3SspCEGFIKFA3717TbHgGiSjV7ug/OIr1779uNnMNzZqUlocno/EqIuScZZVmcB/pR6tAETA/xdTZ5h9Vf5AnqJzPaEvC2I7Zd/mbM/GP5AjT5PnLO4/SGvMU7kSAqP3sxbNz0w0LZfSRojAqMMMEV748yFwXx6DVKDCULlRILcTP9G3+LaldTiPELWfQ/kp9vuNPhhI+3ErI+6eFzLj55WRW4zNwpxhfMMA6UWA/3E29ETQ6kYK5ouV6fbtGN6uj7+LKezX8Hrh/43yZ1PBGnBezVVvcbN85D4ItxVMVooXhXDswWj68pBsNKLvH+EqZMjDmYoKdh0orpMLivkUO9Zup/e6W0o975+tdp2bk7N21Av4Zh/k0NfACW+brYyHliGuizyoof9ZgFJeDildysI+DsGqVqUh8rlZ/s4i8vOViHNa2L5sR0NGEhTbiHrkeOEYg/TwHzAC16ASnQ4ANxg6LGovtOAIyolL5Lx05hETye/a3JY5JLKFif6pkzw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(19092799006)(261026121527099003)(11063799006)(4143699003)(261026140227099003)(261021121427099003)(10067099003)(261021123027099003)(261009223027099003)(261102123227099003)(56012099006)(261022105027099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IdpjwePp72vASqEj8XgLlHzBYF5RTaxBfXefdx0C1f238vmNK6PdbOQ2LjZZ?=
 =?us-ascii?Q?yJXOARQ/fYbNca3DqYGYUY6cU3LIgNFRSu2BkLVj4rJnrLDYmzsXKb97Jr+e?=
 =?us-ascii?Q?rnR32v3FlG9hHIO7j6lcK51JH8am0Hvb35LaCeddZMKXsP+yd+H1/f9XB5Jn?=
 =?us-ascii?Q?kGBhzviKYzbZBdHCAGv4PUSYEEccvi1A76kEZsAJKx6WXOrPipyFbJ8C85LN?=
 =?us-ascii?Q?lyljMRoVQ7mbOFvMv+EaVuWAShC3yk1d3HtuqLf+rwQon1+e6gNDrsvbQIZH?=
 =?us-ascii?Q?iepisV4yGw4Msn15aiyu3Q9v2xRXEf1mV91N+tkNhvwZlZYjg6dogJswQVpX?=
 =?us-ascii?Q?TFeB/iCNSci5ZerUZhuXfETiZ3R9NPVpiqJroNGQe2k1Xpx6YTLN2L9kWfmt?=
 =?us-ascii?Q?QiuJw8VO9bxRlTTehYl6vOZ2aA8U9XcAANMXm/6ofpfx+5GZTGvDlpj17IK/?=
 =?us-ascii?Q?sDP38e3prDIyhOlGpN5SNX9vYIbnIggIszfJY/S4f4ppYQ2ktHgG/ER+G53w?=
 =?us-ascii?Q?JwagMuj7NOXeVwZb1A3xHMaMLAlpVc27nUGY6aKmnSopVvsPtlbrud3oHIZm?=
 =?us-ascii?Q?hPASUvN+NTkIDceljLVs5BEPNOskwoLByKD63bq4uOayJUJSBCNOSxJ6DsAD?=
 =?us-ascii?Q?j4MMawVD6HZeDegsxoXm32aYJQjQokXOw+w9SLEEIInV0pf2nrUJDDfX03Fv?=
 =?us-ascii?Q?3X8qtwnBB0/Z1GC0aOr2lDgmRHIyo1ATz++BfDvgRQ7AM8DdGQSmRIsLpFg7?=
 =?us-ascii?Q?qSmndJg8RuFhAz2bbguOQY8QNl21SE1P3rds5wydvP9AKP7Sc7zHRwf5YANQ?=
 =?us-ascii?Q?no/WQT7vRFxJcIvcfWby4j1lxTVP06iTTPlJVuUPnkk8iKfpC9T+VRnH5jC6?=
 =?us-ascii?Q?4qwMlRt8/AKN6yvBTzDU9Y/0oMpUFESoHLaBwQFgQOw7v4kQnEZImQcQjiRY?=
 =?us-ascii?Q?uj+eAg9qzEFVwroIdAdqjOUOPviElkq72wnJIVycMdU6TcRpzwi8oLN+r0L2?=
 =?us-ascii?Q?mv/Go2V53QSaT2pzd9S3rXvuY/tpgPgV6Q6vkS0zg91tkvGwWzuDGYSmJUqS?=
 =?us-ascii?Q?efAPuELAnsDFS0913TVVrtZLcdliUQ9DaJEUpMoJ+y7lfQAlMJL8ajbt+Ekz?=
 =?us-ascii?Q?0fz1IC6Ta5emNn3BtBhw+1otAvXug559MEGFUBGCK2z/8cOmk65+CvgEArd+?=
 =?us-ascii?Q?Ja59pCgyVPH1vFsfWuYo06gFxm/1lPmfWvE8uBg1vptd4/vJ4pXA2eN/Te1R?=
 =?us-ascii?Q?vtvFo7bKaKB1G5RJdw66RsalJRckjSaAs2XM24Lnd2gCDrP64JyLutDtILg2?=
 =?us-ascii?Q?xcqodpB3YmV3HvpNtmfKMNXvHhOLXHE4LQklcUQWNIzecq1clk3PBDHQvdnv?=
 =?us-ascii?Q?LIUfPLwRoAMTdK2wXMjXT7Y2wTOfELeoOZFosPzkDPwJSS7Y7GFTyQKaIZjL?=
 =?us-ascii?Q?mOIVfrpvj+pAgvdHRmAU6A5fUlQB/Rj9Fn4bbdh4N2uagWCBzWsbGAM+ZXaZ?=
 =?us-ascii?Q?8KLE1OCr2wlaDD8anmmalMxgwMvhrAK9ZcKJMK6WW947Xjwdt8wQIzgvgkvd?=
 =?us-ascii?Q?GO7SRLHZewAVM7Sc3xJn/nJVQt42z4UNwChg+LvAX3nNkqO0FhKIX0h9YLvu?=
 =?us-ascii?Q?xqnuPBtPR1rt22brH9ipO7qfLs42H405A6YE9x4hWkIZvGYlgtD0cuTXkbzT?=
 =?us-ascii?Q?ygwR182EQON1fefqMVSJvt6NbxWnKaBunwKru4ZL6nZ3gR0auv+R5kozWDcv?=
 =?us-ascii?Q?1JVwPjySnk7VRkBF3uz4/2xLFazCUjMdcZOGr08Nt2+ptUYZNoPv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b3e0e8-1fbd-4507-20c1-08df40d37267
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 15:41:41.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Uk7vIgf+zWohaw89nWPj84cUEdoa3W+s/UtDiXYe3IVIh1PEHb0ae9FIW7/64blxvNfp7h3C8H+Js7kWgd6JzR06f33PUJu34TjK/4ES8Cu/L4kSGxXBxpvHVd5BqKg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10431

On Thu, Nov 12, 2026 at 04:02:23PM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> The Verdin family pinout defines the SoM interfaces and their
> numbering, SPI_1 being the SPI bus available to the carrier board,
> implemented by ecspi2 on Verdin iMX8MM.
>
> imx8mm.dtsi numbers ecspi2 as spi1, so the Linux bus number in sysfs
> and the spidev name do not match the Verdin interface. Add a spi0
> alias in the SoM dtsi and delete the inherited spi1, so ecspi2 is
> bus 0, zero-based with SPI_1 being spi0, and carries a single alias.
> ecspi3, internal to the SoM with the CAN controller and the TPM, keeps
> the spi2 alias inherited from the SoC.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> index 1ac9d000d415..0369803a4d46 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> @@ -16,6 +16,8 @@ chosen {
>  	aliases {
>  		rtc0 = &rtc_i2c;
>  		rtc1 = &snvs_rtc;
> +		spi0 = &ecspi2;
> +		/delete-property/ spi1;

Can you avoid delete property for new platform?

Frank

>  	};
>
>  	/* Fixed clock dedicated to SPI CAN controller */
> --
> 2.47.3
>
>
