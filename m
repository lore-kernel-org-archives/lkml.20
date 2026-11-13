Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794586285;
	b=5mfCbvcORijkLkp30t9q+IBExj1wQXZFlmIgKA4SGu6Bx2RC2jXy1XmlFksk5efeF8ml
	 Bq0A+JSA77jnkCIoTCPFKQLpwMzDZtwULH5VZXH6vm4XiPZ8ZQszM5M2CM722jZzjxHnR
	 xSeeChS4EzVmAwRSvu2KojMYlMPZsZ0xS4aJFVmDqhnmqwA1HvXjUmPYPtv+XcR/eUFcw
	 Agepy/id1klX3FEtCADknWahJXUBmp4OCIYEtfQk8xWrIbtOCYeuAp9loDnTjP46bXMWg
	 vE77KTSKfG5yezEcs/3MECHMC8aRvWHYfxozZnIohVV2SNT5QHuIANFq28W453Vwp2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586285;
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
	bh=eAPfq/R6CwxqWhlqzqL44UHzEuZD4SzMZlg9S0S0FrY=;
	b=CqSQfwksMqgRAgfs7wIfPX5x4duyt8tcV2Aq+D+5woAnmzXV1azZF+ZbI7wFvUTdbw1B
	 SywoTIV9+FDVsywSaqJC8ONoQq+bUi1VzufCxZsL2umo7vdonkiFaUeMMQ4a2GRwS2Key
	 21JouXc8mrjBT8csaBIXi3gulfLq6/AIhDcN2W4k/4jQFpf4rQZnWf/e4srwRdQG8j0PE
	 DjhakHj2tzHFkJrN/p1qz2Ea8AGLagZ4F2Xd4Wr13u/CrzmgWCT/cIw+0Uee192ChCAXx
	 PgtwqU7XeQp0X+qjJd8DZ5LbEpETJCl8Qhb6LSnJ9yVtlWx+Vfq0iCj1INct5LyXJtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aOqJlV8V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.8
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013008.outbound.protection.outlook.com [52.101.83.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF57606A891;
	Fri, 13 Nov 2026 16:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF57606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aOqJlV8V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJs+opKvQeiKXU/i/K5oENboMfhNJiKRdvH/BXMTK3tG161wsaLt+Y0gxzFTxMlyr1E2Tyoz/5LkyN4eqaAfQ1RQKKcvBxZAJJxvInOWc8b0qKpSkbgk7eic00jJ1xpvMCC/sNh8T069gxke54eTqu/uvdX8H3aecGr2M6p3jpVVs8gwRQ3mU1WZ8iJ0zFA7ozKLD4x7G8zsdU22rKF3X5rverBBo3jOmkEwZSP486c7T3nwMdJieWpUChag7NcsbjWbaZEkD37QEpqRzHyW3nONaRg+IMNiXzAvZgVC5UgmqT/9WsLHBpbxwq0E/cM6Syr+rkxxgiohiGwgTR9SeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAPfq/R6CwxqWhlqzqL44UHzEuZD4SzMZlg9S0S0FrY=;
 b=fK71rnIPERE+phg2Gm1Ez7uT+4mkgZiW4ztvvVJcpWlrHy/oPLIhIZpgygclYhsZuhCT3G5mby3l7XS7t3YD7bhOHriN1H8rGwJ5tgKA1iOTZrc/sETG+KQ/NxKmqa0E9b0i3ylAvRrOBGCkrpjaxenmePQ74Z5PGRiKpxk8zc1nwAZv8xXwiRgJeWdAxCtAOXJ7/94jeo2KA1BgeOFjgPWlHmpubOIGnR3/gsce03sK/5bhJUamb+UUYze+Z11iuP6t5tNgIu6zvkpC8rYPqtaToAkhpqg/q5FuPKf4EERrG2SAx82G4BRhsFCWxlWgzWaAByi/3JVK4LW2sNMz1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAPfq/R6CwxqWhlqzqL44UHzEuZD4SzMZlg9S0S0FrY=;
 b=aOqJlV8VFEf0Xt86VV7CP6ciTt41XhLpcQNAfrB7a4NuWnOcrJPEtmIRaLCyVvdSHtur6SDz9g+RhhaaOxGfL36Wvdr9ovRLs19YQCXIK4u8+yTGA8zEBpRz3ICzS7Tu5y4qlAFXJUYk7gWkiooqWcpcqmWrsMtEWcmNLDo7An+y76XU3S+uSUMxAiUaEjWi7MLFVHnChQw2fVSHJNwL6l+N5vXLdGHjNDhrZefUISnPblZ/LWkjal5cCfeFQWmt+DXswf8o3KGHC4vPnmxXW6X9HMDX9Z+pdKMC6dFcyhPZphTLnXTMjMK/7XLTOa5AXqkHuv0YwyNrvqa1PJWHKw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI2PR04MB11004.eurprd04.prod.outlook.com (2603:10a6:800:27e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Fri, 13 Nov
 2026 16:11:20 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 16:11:20 +0000
Date: Fri, 13 Nov 2026 10:11:11 -0600
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
Message-ID: <avc2nzql-JV7a-JH@SMW015318>
References: <20261112150236.164850-1-francesco@dolcini.it>
 <20261112150236.164850-2-francesco@dolcini.it>
 <avXeK-IRXbKqI-pc@SMW015318>
 <20261113073135.GA8515@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113073135.GA8515@francesco-nb>
X-ClientProxiedBy: DS1P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:8:453::19) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI2PR04MB11004:EE_
X-MS-Office365-Filtering-Correlation-Id: 60509ec2-1b42-4859-e416-08df41a0c125
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|23010399003|7416014|4143699003|261028144727099003|56012099006|11063799006|261009223027099003|261021121427099003|261021123027099003|10067099003|261022105027099003|261022075727099003|261026140227099003|261102123227099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZDlpLEXHk3yf66gMFpr8ztBAYvzSjahn8HBuVo6MMNm0zIU8MZvDYbbjf+Rkt8FSH5dX5Z8Xn/sWlySW2ukOv/WAQC+xfFfK+zvtoLU2LY6apmWoeF+4HJxNb3wd1FM+gRbj9Jb6BqYhwqFqFR2YTZNHQI0BkIRfRc1dq/TPP7XAJXgXfSKeTrVBSQN5McJsg8v7ooLdPAh9EVafGxuiwD9rOS/jYvulzJxRKGIWsc1ica4yAnBlR8FLWcZj7KDVBH4ytfQDyMbnVmvSJwTUmV1FJ5/ccpwGOJulJkT5TsSKRmI0RTBsfwLlv3VAo6Wnhoifl5P9Kim8HWx62FjuknisvXTrEcrbGAr+TjRnKAQXXNnFmQmPQHSQhOtsbUPTvXuraOn8lJIquh6+4Off6TCwsFdM3fJXyQ/XAth7zY7yoXM4IcQRnmSdfGeWYQxySjMXmEpUjQMSEKjclisF3q6kRfiAMnX3evymsZNYSnXv6CY81ljg7oTMeyn1Cg+FYBUaWeI01Z+vQ28jtRwOWVL9RPAMo6uZvO2ZjegD94TvrV0KF92k/ygbpr8L8hDDYMvS0oITAtZ4Wx1MjtfXYFHpwHgH+1vENZggrj/oMCSuBopjK8rLpROR21pbeT3D
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(23010399003)(7416014)(4143699003)(261028144727099003)(56012099006)(11063799006)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(261022105027099003)(261022075727099003)(261026140227099003)(261102123227099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pHR5x6+h7b7753hHssoSQCwkFQguTJc2iniMeYwc+lNg0uBcMmZG4aJ+Fzb4?=
 =?us-ascii?Q?+rqCuGFwlO/LhwzaWBcewYd3jW9vbd3P9zFoNw5LTZ1VHsihiN0ybSC0XxRf?=
 =?us-ascii?Q?633CSzk10qGQbmjsaTt2uVC4yI0eo8L3r2l+iM18PCYngVKrE0MTyRt64hMH?=
 =?us-ascii?Q?hAY0MewfOZbbpkQD6LVfIXvSfv9u5rGR9JP8RZj5qZGbKFs9ytZRJoBnDXSK?=
 =?us-ascii?Q?DjIfk1hebKuQtp9p2I0cgJ9ofCqzsZB3xazGYDpiD3KOzwWrznQvL/Sxu2cd?=
 =?us-ascii?Q?vnRF1IjY6njqC5r+AQ/Ly5xL4LLP5CsUxM/oQxkGFctD6yCYdQBlZe9l2lP8?=
 =?us-ascii?Q?xzf6KP9MfofhbKadt6WmfwxcFXs2smI8TdO7twCe0z2kQCBFooMNdDjhcZHc?=
 =?us-ascii?Q?XVpjShLHb0MdXvo0yPooWwO1NvwQ+KWSupX887qzbf/5dy3kJBrMEdIlEHRW?=
 =?us-ascii?Q?ZTbnUeEhglloUwQ7r6gxWyJ8c6z4XsL0H2MA5JzTWWvr57yS2APjT+s15o2m?=
 =?us-ascii?Q?97T1kojAFYe4UMxpItMSzF4GynTAzzEgbI6ZShsjSAZCGfAnR+Jc0bdtEFUs?=
 =?us-ascii?Q?mOMjfXTUW4TQGzITftDUWRjEO6U0KV+gM75imcbkSCH4MgczEPWCUjn6/eL1?=
 =?us-ascii?Q?QYxfRt6AtQvyeryRxhEvugoEzBbYRqsKm3acDoGCTCsCTwbq8gm53Hf/Vn8w?=
 =?us-ascii?Q?0382HJMEAVgRgHsDersV7OwbFlmUDsB276WQIk2pHUoqEmLfr3ghplFu36+Q?=
 =?us-ascii?Q?0VrjZSu9OE2TudSP2+Zk4uI3gONGfsbjGCywPonS6vGMnR+hJwUKv936UeR3?=
 =?us-ascii?Q?A6kXttpqujZsfsFe3tY3TPmjiYrwSiwKdFzNxQYfPTpE2yte0iqn2kuuN0Gb?=
 =?us-ascii?Q?pv66isSjgXfFWZGqgRCzIu0uq3e2HOz+KSbBJP0JRHLOgsVln33HrMmD31T7?=
 =?us-ascii?Q?KKAo1+mej1izMgH85Xlw0jEywqUbFSscyYl/EVyLk85L/UaB1aBnt4AhIXlU?=
 =?us-ascii?Q?JrxgO39uicAWn3tNEZIAJXR5n+ogSwY9C659CxE4w7RW95DzzofjAB7HK3/H?=
 =?us-ascii?Q?RMtxQa0fWk29Xi9Uvv/RWOzMubZ17esDP9FTe0gOmjYCuYcj4qjEUtJehNDV?=
 =?us-ascii?Q?TmbfNyOfNZGmnyqobFBcAF+489fqMzka4XNBvC1/QT0jjHuniZ9LUuv3XK1Z?=
 =?us-ascii?Q?GsDPy4ASWovvi1ZgSzQHke8JsNY9YLE1blMoWQmeaISlMyUzVgXf+DQX2nAF?=
 =?us-ascii?Q?YL0ct8eJ/cj7sRL/roACE2X1oHXoy48EE0CzIAHm/7XS3U6YD61SBLSBNmzG?=
 =?us-ascii?Q?r+Io9hiyaf/eATJMEb2PeyvscB/6q6exmI32QX9juEbMAf/6X4Gl9ksAGapZ?=
 =?us-ascii?Q?AVUtJocITzlDQNO+LR1hkFpvMbWJSWhVK6/1O2Av413bmWeZRHDQyQWY+AUl?=
 =?us-ascii?Q?hAufdZ59LjPTda+zfjFyiVpR7DG9K+RN/aPCAzjY/QgMuqKUrEOkiKKiHwHQ?=
 =?us-ascii?Q?lX6ouaLRm69YPYuBupU1XdvtgX04CSLTabpPOPrrnpUPs1xvjFv7GXyZcNuC?=
 =?us-ascii?Q?USk8GjV9d5YWU8eVWBJHM2lVUiwh7pRO39U0sEyA5Xm/YCJrlvOLksap+6+p?=
 =?us-ascii?Q?jdm5fbcGQqLmPDhz0evoWL2F8+HoF8Cf7i8Md77mJzpQ8acYBZhTH21gJWbV?=
 =?us-ascii?Q?EAprT8rLUO+4f3vZ50QKhOZqCvTGB9x0FgCkr2noWhgkbo3uOdq/aQoLwwtf?=
 =?us-ascii?Q?H6lxBj/ivNZZ0RrcDkBNYuY1FdqCgdLfcKD2Dmj7bNZjrav85bD6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60509ec2-1b42-4859-e416-08df41a0c125
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:11:20.3040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVtdC5t87OxUINJFBWesR8UuN2xtrhORy4g5qwDhdlYXGhZIWY2m0mpjcY/kgt41tgegtEtDbYusxd1/1W8c/+5xyLVBKAyV84C/7HI6jp/KcaG8tfmVUXMsWUfHcSH5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11004

On Fri, Nov 13, 2026 at 08:31:35AM +0100, Francesco Dolcini wrote:
> Hello Frank,
>
> On Thu, Nov 12, 2026 at 09:41:31AM -0600, Frank Li wrote:
> > On Thu, Nov 12, 2026 at 04:02:23PM +0100, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > >
> > > The Verdin family pinout defines the SoM interfaces and their
> > > numbering, SPI_1 being the SPI bus available to the carrier board,
> > > implemented by ecspi2 on Verdin iMX8MM.
> > >
> > > imx8mm.dtsi numbers ecspi2 as spi1, so the Linux bus number in sysfs
> > > and the spidev name do not match the Verdin interface. Add a spi0
> > > alias in the SoM dtsi and delete the inherited spi1, so ecspi2 is
> > > bus 0, zero-based with SPI_1 being spi0, and carries a single alias.
> > > ecspi3, internal to the SoM with the CAN controller and the TPM, keeps
> > > the spi2 alias inherited from the SoC.
> > >
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > index 1ac9d000d415..0369803a4d46 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > @@ -16,6 +16,8 @@ chosen {
> > >  	aliases {
> > >  		rtc0 = &rtc_i2c;
> > >  		rtc1 = &snvs_rtc;
> > > +		spi0 = &ecspi2;
> > > +		/delete-property/ spi1;
> >
> > Can you avoid delete property for new platform?
>
> Unfortunately this is needed.
>
> The included imx8mm.dtsi has
>
>   spi1 = &ecspi2;

Create patch move aliase to each boards' dts from imx8mm.dtsi, which is
board feature, not soc features.

Frank

>
> so, without the /delete-property/ we will have both
>
>   spi0 = &ecspi2;
>   spi1 = &ecspi2;
>
> and what is happening with that is implementation dependent, and this
> would not be ok.
>
> The original issue is that imx8mm.dtsi should not define the aliases in
> the first place, unfortunately removing it now is no longer possible,
> it will introduce regressions everywhere [0][1].
>
> This issue, and the reason I have the delete-property, is already
> explained in the commit message.
>
> Francesco
>
> [0] https://lore.kernel.org/all/20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org/
> [1] https://lore.kernel.org/all/aca3addbe510c58524af8d3fd069fe2ae4b1cd24.camel@pengutronix.de/
