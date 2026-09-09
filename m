Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013061.outbound.protection.outlook.com [52.101.83.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C601566C70;
	Wed,  9 Sep 2026 15:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967859; cv=fail; b=TT6ycMdVL6WwHUictxWIYxWZDB6f4tbKm09qMhjR+e/ZybXyfTBMFQOBxcBGLzPvCh/HcVdpqWsZyIRIEoOsDO7Bcr7QcVaEGGbhNhFFnDPRWlLAxh61/ZB8ieT2C2wOrErDLNGIl7kVQPX1tfdP4ZPABKF6SeZ9bi1JgJtQ0vA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967859; c=relaxed/simple;
	bh=GkVp6R/Gm9bQe5LHWiC15YBNwGnOtq7HGrdWzHclQDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eAnKh/HH6OATiCH1Y7p3OP/04MZCNhLhAS1cC2tPqNMAXkEfGn1HZIKaIQ0Cp81Yjo7jAKn/TCEjQQsh2v3c8oAiASz8WexT9fp3fPzr4DXHxHsEONr6L5AhMxVnTDH2D7YNUHj2uFPmQNRj384RjGzTGj1kIYto4UoDoH/2+/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pFRpy9x0; arc=fail smtp.client-ip=52.101.83.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pFRpy9x0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yhwhq2KBJgdLrgMSYtfPo0u+D9ZmEQW5UuRuyw7W80djFXDHfRewDKZAQ/uL7F4jLgaqtQFzbv8ipsK49nxG5UZWhQAePljTlfIH0XXapuhj1gWv9xAlApG8Qk9/l8Yr4p69gUWn6ys0MPlLyAzr2OGlXQr1Fgo/NSGdvC8iI4vo7HVfp9DoBpHZbLbbCwc99bxF2NAngUsG+i8OqHkKj+VIgYdiTDb6uSzQB2MCLr1Zc5KS2NLavHsMkLHaaAdgLfeP+aPSKfVEYVLW22/hHsjVluRMk0XDLSvLSx1sGw00QQPV6c4eKwYuEUgLXOQXeiw9zbx2k3ReI7FUpe1eew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3jNPCE1h/aS0Wnsnn/o7UByl5DghCcbq9/4rQPVu9c=;
 b=FSGpJJUYIzoUKAL9RnFaJR4adqYoA+Ib+zED9UuipOApYtL8LbE7eNOx/LYdXD5+wwmWfipj2j5Lr0uARVr61lmFzgAJAf5dIGS5r7FKZCoguqALLT7UUwVOId/lpU2aGCsTc49GjDU2P2gA1ZZa/f6mQ1RxO9ODqdw7mhTlYVNTiBG3jgOtHpqrinKbw6evK32ZfyS7M2sUfTWWCyhYDzTY37WjykIFuuvR8Pjiz8RO3tLWQP4O8Z8weHS8O9HNQyvDhnp6Duni5OFlPv1eAkfwsIMBDYoqFIJtdVJ93lo9mCuPf21VLdWSZFsvDgNQV1meJ0PiPrUzU9yffrs5lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3jNPCE1h/aS0Wnsnn/o7UByl5DghCcbq9/4rQPVu9c=;
 b=pFRpy9x0aCsq6406jZrXnxQNnuejSn9QtkQg5azNEspIf3bx4SnrMVKqZr+sHkqOuuQKvSzRYXjCHPpWG/Qkpl+BN56apms2NwZ5nggAzMBaqKZ4+mNdICVXVN/lEkX5i2sBHpMzS42herxc+wicPb2zRPoDaB68p1Ai143njpLqLim+EdNrryhDe/FqGmRdH4QnRd2yF7tQj82iFttEEPdNkBNzSbSgNGjmf4HT1NlktCqhTcQPMDHg0LxbqfF+mCoKMgBAIFviEEXGnFmHbv/eQkgpVfHVQkMPeBd7K741nyr/VwC62zBQ2XOicY1fYz/ZAuQZS02hBj6w3dllXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7493.eurprd04.prod.outlook.com (2603:10a6:20b:293::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 15:30:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 15:30:53 +0000
Date: Wed, 9 Sep 2026 10:30:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: vjardin@free.fr
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/3] arm64: dts: freescale: add Nodebox v3 CPU Module
Message-ID: <aqF7o9EYfwlfpYof@SMW015318>
References: <20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr>
 <20260908-for-upstream-nbxv3-dts-v3-3-1d88b2c11680@free.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-for-upstream-nbxv3-dts-v3-3-1d88b2c11680@free.fr>
X-ClientProxiedBy: PH8P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 82808c77-f64c-4268-77bf-08df0e8755e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|4143699003|11063799006|56012099006|3023799007|10067099003|6133799003|18002099003|22082099003|15866825006|41080700001;
X-Microsoft-Antispam-Message-Info:
	RgqZzNre0NgdeZ+txpHuXf8JVmoScaszzBu+27NSbieVizSzTUrwv2oZ7Tb7j19fQQWTqmk2vaZtknoLcgfwje8eVjLoxs0FJDc9BXSxYnsoPqtgXTDjMO+/EPqGrOfXBGx+9ods2FXp+yjWtbnidWDHCDA2TcoENjJWKxAXV/rVaqEedf8z7Rqog3F9CRL/5nyfNegA0MZzlOsf83L2v8srWy25EHJ1VZtG0I9elOhIZ3aLnNkwdPvIGwnk5boTCQAuO96qrmkxD86xxi2YvTv+Iizm7KrieasTnbWa3HyyiZs5uHYFA9No8t4sfu5J4BT9LmhB3NdhdBNEZwvSZoAzaN3LKLASsWVtfzcEbqc5E1L8u75ZrGCQX70Fo7U7X/3pN4mUNA0lbnHgocW75HNaIABxgurqliiDjTg0FPhrp9S2r2OwqbjH1Z74a2QX7aHOT5qeYwMMzqEG8hTG9HPzK1MohkzHZnXdGVX2hirxYKmN9Bs3zf7JINFBtkvqEmI6NLe9xfjkOHtWyniua95ZDJHYB+T29kf2BopfEdlgyPP/U11dLHeQCoxYGKAo7skflutjGe0Xa2jAFD/63i/dDwpvOnd2XIjorTOwJjZydTu1x5iMEtwttVCeP1/ZGWK1cc6ut5AjzhxGcDLHx8jYnl+k0SppBPH8UpBWoJF5hnpCk35sbA/9MItFIEmD6jEsGXAOQp3MTAGqRnAuGSCyZg0P5CRHXqUfMHLbLOKXpZpmV+w5O5DCHAFLxFCS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(4143699003)(11063799006)(56012099006)(3023799007)(10067099003)(6133799003)(18002099003)(22082099003)(15866825006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9cn8aPQCst7ZcQCe7G4q63SyMpVNvoTzZ2iEUQXDDfUHpUXwXXuUOQIrOOm7?=
 =?us-ascii?Q?9yKwPuPqKo6UBrvUTr0spAHm/+ZfPtbBSoXRo75pAlhKU/pKmJy1QmEBa+Zj?=
 =?us-ascii?Q?2TYw5PpTIh6tbUZ5EcY3N55D7qnwsZCvvH27LsMr0OJyQ2Iu+eJ1ArRNVO8u?=
 =?us-ascii?Q?OskxWpNe+f/ERY+opwVTrlMFQO6mfslLqlxycGC+R82G1WS5nPGk8TEJBoUV?=
 =?us-ascii?Q?kr4K1YdHJatE97ozamTqMCqki4VwxIcpwYba2pD5FUJZlUqc02/3YjhyVyJX?=
 =?us-ascii?Q?OTm71ZqphheQp6z1KVKoXSDVpxH51cSoDWZM1RAEZ+TBPjmwei0iHktY8mOh?=
 =?us-ascii?Q?9NENFdhrM4xtcbKECnnIlAZ+AxM0meXaotA4FGaafmbPdNSJgmI6UHNWme5S?=
 =?us-ascii?Q?8uPR80XpdjS6kPLHZwul0Iyuz16uLu+rPvaXTpdz3T5llYE235Z9my/tVcMM?=
 =?us-ascii?Q?MQAojyBv6A1EJI4aiVEvkikBR2XrURmDQ0Acq59mn/N3RBcQkXVyHUtz2QYO?=
 =?us-ascii?Q?htBD3s2rhc8lfTarCwwkZlBmELF+Be+b6hJ6XDYbKg3rO86aqCsRZhln1Hm+?=
 =?us-ascii?Q?a0eq9QAP085drJeXpMxENshNn1mYI8iWEsCat6SpXoshHW20wQXAHLSDc1rQ?=
 =?us-ascii?Q?Cn3WeEi6UuviUUl+TGgq+juB0HCj09Qnpd8Wiuo6KDbaWTNADeBIgml8aCdz?=
 =?us-ascii?Q?/eERT6darNtIhpKGMF8+zNqRyrhmQKU5dxZwjqdGnknrK0glEslcMfMyMFcR?=
 =?us-ascii?Q?l4SMdUFsqjncxZpL00OcsUrm4AE/kSmxgd6UDzbsgJtWFtWETiBq6F1TkSwY?=
 =?us-ascii?Q?zD2Ll0v0NhskcCg9vyC5EBx+5JEcH86ReWMf+smZGflfw2O/ovPnIm4qRz7f?=
 =?us-ascii?Q?ExdLO7803IUb3DdXOomPa9M3Xdajq+GNN8YT2a/Ui9zhYAo/R6atPSpy0FAZ?=
 =?us-ascii?Q?Hn/j4dd8rYlTNQLAnAhHQ2SYqEjD9+4JF3BPlOhCbx8aCMYtsCvT0EEsyzNq?=
 =?us-ascii?Q?DkaZqmfColARwoMn6x2rAW3vly54EzolA4yEqFMU09E3jxXjS4uKaBx7FVvZ?=
 =?us-ascii?Q?np1bjTszazv9cXWUpLpMmPOQmnGMtK4I0dSAn/qDr3E4fOXo/THRz1vjnEc5?=
 =?us-ascii?Q?HSJmXzeQb1M05RYqcjHwESqrLo/CTiZBnZs3pWzCwAwFuOC5/3K4f8QnW34S?=
 =?us-ascii?Q?ZnOZ3sUuovS5ELGcZKEBjbiwIR4T7v4rnuTraGzXwn/ox9tj2c1A1qNzC/ld?=
 =?us-ascii?Q?rkNPSaAHcafFdeGQ2eOvcTeLVJBuzNkwJU/McTsW2/U+U9XXs4sDttH4C0Rl?=
 =?us-ascii?Q?6PnWmtdcKCkyMLcPg1/CpW7KCP+FzapwWb16BBXTYCSJyd4g6jnFHBp+G6PS?=
 =?us-ascii?Q?ERPWQGPZJifouF1EubGX0rk2OUv1mQIZn/rbPibYdGqkwcU73dn6qQnbnvpm?=
 =?us-ascii?Q?Uucrt6G8D9HRbvlfNb9IQ2H279qaOR2E70MIfXl4mZP0xsjFCofUAwOsTF42?=
 =?us-ascii?Q?S1wBb6osGSiQUZ48Oz4yYSw7MV24CqvKDVD84vZlVgbQv/Qdoc4Gz0ZyxFtO?=
 =?us-ascii?Q?x5dp90v1IC3cI/qnkJ0s8bvfJAM4CvpCK0aGywpkBuaAFJuxb57Q4KFzLAmW?=
 =?us-ascii?Q?OC9J2FD+kIKhQRpt9NazGNGgcoGQ2Y2yFniqU1Cx1Wx2Cgpc+G0lvx2YZ70a?=
 =?us-ascii?Q?kBKia7M83Pvj+bR8nvtYtntX5e6B3kAeO2Ck2+DJO9ksRxQn833UyONEA9WM?=
 =?us-ascii?Q?ktUxjWGypulMkB9CNrtuScGBfDJGLnoC8DGeDJcAniKIbSV49zlf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82808c77-f64c-4268-77bf-08df0e8755e7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 15:30:53.8179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LplpRn0BqrT2C7se+oCVpMJ2g0McdWwTw6KdK7DzzVgc0/cFRpFYsxIAS1/alOeJzggUdPmlPR/HeyZyOZj1uOzRD88wx4Ic2s0Xt706TKZslaBnC7AtPZtVb0uTMHlD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7493

On Tue, Sep 08, 2026 at 04:12:45AM +0200, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
>
> The Nodebox v3 is a Free Mobile CPU module built around the NXP
> LX2160A (16x Cortex-A72, DPAA2).
>
> The same .dtsi is used by the U-Boot port, so both Linux and
> u-boot should not drift.

Needn't this paragraph.

>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>  .../arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts |  34 +++
>  .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      | 335 +++++++++++++++++++++
>  3 files changed, 371 insertions(+)
>
...
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
> +	pltrst-hog {
> +		gpio-hog;
> +		gpios = <29 GPIO_ACTIVE_LOW>;
> +		output-low;
> +		line-name = "pltrst#";
> +	};
> +
> +	/* Boot NOR reset, released: electrical high */
> +	flash-reset-hog {
> +		gpio-hog;
> +		gpios = <28 GPIO_ACTIVE_LOW>;
> +		output-low;
> +		line-name = "flash-reset#";
> +	};
> +
> +	/* Ethernet switch reset, released: electrical high */
> +	ethsw-reset-hog {
> +		gpio-hog;
> +		gpios = <31 GPIO_ACTIVE_LOW>;
> +		output-low;
> +		line-name = "ethsw-reset#";
> +	};

Does related devices have "reset" property to descript reset?

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
> +
> +	/* Low enables the carrier-side EMDIO2 level translator */
> +	ethsw-mdio-en-hog {
> +		gpio-hog;
> +		gpios = <25 GPIO_ACTIVE_LOW>;
> +		output-high;
> +		line-name = "ethsw-mdio-en";

The same here, most EN module as regualtor.

Frank
