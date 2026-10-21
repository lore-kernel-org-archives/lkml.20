Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792615527;
	b=VGgSDOQtyYJXgstzCdw/XIgnQzsFLb/11SINq3emPj5YodnFqY9mfIJoKG/TvQ50Wc2t
	 51bG3ICpv+Sl2zTrUEOXbzYah2y2mNgvc1nj555TNSw6K+4bCzudkMgr6v1CLHX9wUG/D
	 lBudq2kgA3EqBfuLCybq2gpqQf/hkvggvxRpCrz+gJJYlJ+zXjo/iqsK1CKYsYHJGP0pJ
	 yniZ5RvPRjjMT6vcAKYSGis6e/BEJhi82iTV5kPnnUrPlKQSrr/zuQv7s5EaJL8xxzlfr
	 ISADxBHjBeiyRVFTFY58fdQXpjKcAbYpaPd/Fs8KjD9BPdCWnLb8ulKILym8tZH0xeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615527;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ov0+XC3xLT1rVHG+ZYpStv339MBhTuoi90aqs1QB8rc=;
	b=i8EabGomf7SHgmMPnqZUhEEzHhPoEimDVRbbn5Wy8Z6QV3gjARYtft5xvKNvh2uKvMoM
	 PJTFzAt6Wz6VwsLInmlVcr0BnHC2kvFAp8apMyyaUKY83sBocc7J2p/a+64tKG4HyNLFG
	 WYtrvXdrfZIqOL9h4+Nv5j/GyZov0UvPciA0k1w3UPqB9SewDrrALt/PSEcgU28l9GLs5
	 kZB5EpjX5/vfdYC2Gs0sX99t3D+GZ2gFHlAYK4Sjv5m3yhWZZmDKMsonX/YmhBgGSxBCt
	 YMx4cOCDotU9hDXHWneTxTZR4HpZXIHn9bgD0YPHciIfWkWDq0NBHZvGvlMgXzuuL1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wweK7SKN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.70
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E21B606A323;
	Wed, 21 Oct 2026 20:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E21B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wweK7SKN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cl916+zGkAz2nKa6hRhpTZpi2w+frt9DYnNbyoj/NJMCo3x/ehTnqghe09usI/8FlJ6lcxfWvCVPXnQwdpmzz5CFXQzDW16fSyB6hAI4DETHW+oxLqntLN/zuu7SJU0n2p4ULAXWhEv9VzINAQRZoy+kGSCm7o4wNer/zURFhi+nxXQgWQ862iGD09ABdZ9BWvgdmo9yc3g52bDUpZw2LN3ipV83rSxIkhXz2U2583+Umi0g+1DXezZNQDGWbLSViL2OskjRBUzj/9uwQEditHhepYR67m0O+8c5ad36OUVzhE/j2ScSUjI88kUbr4QOnWAQg8JFSwLCN+l9vbHreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ov0+XC3xLT1rVHG+ZYpStv339MBhTuoi90aqs1QB8rc=;
 b=x8y0+PWoFB1ojX7VVCI2eReNigXEFaDgb75VpJdYMkAXhqO+bg3N0pv46iCPRf4M+8gp9SavGQdItbuGJEM0iF2/OkcNUaOUl5iqUnuOxOUlNN0gxijbIrcrJaMxLNP2luUwhiQK8tY528XDiTmJDvk6KoK7hCkUClb68w2eWvzz9umk9Yj9MsRaR9z9Voy8fVBH8ZU5vABmoaW/Emru4xReInfVtN5qeHrrfcmkYnhZdisvXFGc6GD9joT42UVXqqRZXGvHvnXsBwZh+552rgsNr8n6cL75DS8EbcM0AAT9vT+CGhOsGV2kF2guWNmUcTudie88fiRmnFq6EhrdEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ov0+XC3xLT1rVHG+ZYpStv339MBhTuoi90aqs1QB8rc=;
 b=wweK7SKN1v4c6L83hJ8ax2gaE8SYipWNXHgXYvdwYaKgvvfZ1OWjAR95ZHw07neyS38FrrxVdaukX9IdVmjnhZLuevB0nPyCmNO0NPqi+NK9RDS7d3CDwwYJ/Lv8+9/iJ6yoyOLhg51/iWSnCgtJV0bwJyar/+37OS+oC+L7J3Ahn+nvf8IVJGsJWXIXbSloM92J7PP975Ja2ONwFwtpkFcs3dAXBnK41ZMnQ6eC2hLYEu36GGTiZZ0b8tMqSkoAAOkrfCpmLIx/1NJyua96UZXzBneklPlH6UDlDKv95wn8nMpP5rfVzpbH5vT0t4xC8w7eAM43lHZ06qTw7IbMJA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by BR0PR04MB337759.eurprd04.prod.outlook.com (2603:10a6:2c8:60::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 20:45:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 20:45:23 +0000
From: Frank.Li@oss.nxp.com
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Priyanka Jain <priyanka.jain@nxp.com>,
	Tao Yang <b31903@freescale.com>,
	Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
	Santan Kumar <santan.kumar@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] arm64: dts: freescale: ls208xa: correct USB compatible strings
Date: Wed, 21 Oct 2026 16:45:15 -0400
Message-ID: <20261021204516.4031644-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0024.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::30) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|BR0PR04MB337759:EE_
X-MS-Office365-Filtering-Correlation-Id: 362a144f-814e-41bd-ca6d-08df2fb43ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|1800799024|23010399003|376014|10067099003|18002099003|261021123027099003|261009223027099003|11063799006|921020|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	8huErkNFNyb4ZniO8tp5Q5crTBQSzWmoua45BeCqHO+FB/4zddLvUdiKMqFxauTmvTM1XFf7sR79Yyzb5FyifndUiZWcma5GIzlZsgvCJclxVmgJ9ryaAcxKlAN7ZkVZ1t60m5OAA6NmKetryAjE9zJorPziykY0OdqCjeXgCWyZiEn4o9uA2uW72pEmlNHX7n7S+ZF5QkgDCI38TI+7HgewaVmiyh9zoLpZOKgIpwx56SfAaxUkPwPbDhOZq/c3xJ5NNQ+Of/lAeIvEp6M9bJnLYm4K226jX92Fn3xzpr06aeoJU/NofQ/F0lBDFbM8lxkHpyhLt7BwqN9chh5/7wlCwEdnOaCykjQsphD9S6Kp0wB2/tttU05ig3e+ogtveqcRfPACdwzOpA+X1T4zp0qowQZLbpQ71bMr2PYCO8QYf0oMdYwXUaSHjaM/XvJYAl7uxhe4LzfIpXRHkeOBQrBQVjsPtGRW0dzgSg/X0Pvl0RrfJKyUAKfhRsH/UDizr0O9lkUDrDhLbSEYhlkpwWXe5d/iI1A+ECAQlcj9LgtZKRbjM/U/EEbaTC9WCKUpqNGR36gLkG3hEayuGd+sH3ABoHBuB9pKehcRRv+LcC506zhDjsJIqRVfo2QT7TG54/BxjXCgtUWLlECRXkju4nSX9YHtZo2WXYbqPSlMXAbyIRrND3bnmkCoHksV/3gQbLrYfXI4E5zeZ+Zc+Tl7Pw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(261021123027099003)(261009223027099003)(11063799006)(921020)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4MHnEXzaJ0h2G04jgPrWPWR45AsmVtAg6bP/o5yvysQ1Q4nJ7bJGOam2f4Le?=
 =?us-ascii?Q?Vus4azdq13qk6EPy40A5SUghOwR/GzuyZWwE7bdJZT8Tcl6ATO1bwP6gxIs1?=
 =?us-ascii?Q?i+aR3g7lnYhFbsxG38gngpHeAUpJlE//nHz5/J42VzsE2C1O5z1xAaEb/o2j?=
 =?us-ascii?Q?3urVBmf5zH9Oe7Xolomjy5VINGga9VLTX8ktAW6z0JWxcjMoVhb40AycnAYr?=
 =?us-ascii?Q?nLcxmpltVRjXuWvMtIfieK9HhvKaWEcY9uconwLI7KUitLVh8rtuPGnpZ4In?=
 =?us-ascii?Q?jewxzh2jQbqhPCv1bfL/wqUTvEX6t9rrd3zEDrYpIvEPOrYjU5euqADAvSoQ?=
 =?us-ascii?Q?pola0Imy0JXlJuCtCKCmYcuX6GMUigb2s1g9cJMDo5okXtomT0KjMk7XN7ir?=
 =?us-ascii?Q?x6fBgxIxAtieRUvKUtgjnK7QF9CbkEhLI/peG/FMz8ryZKw1/83vWd7YoQQg?=
 =?us-ascii?Q?EaboU10wdcflmSoMNto87g5FnKlgpvlLanmdJ4AAItJp0ImTcERVQvwDxIEO?=
 =?us-ascii?Q?7e3Jf2K3hpyD3/ucy77PqssLuZbtguFRzB78rG6r24cc1fKoTZwvvp67wteB?=
 =?us-ascii?Q?DYBx04ZbMVGpw1EV+IKXuRfFnnxXieqZG346GFYMGBTsTJ+bhBSTFH4VAq4h?=
 =?us-ascii?Q?UbBzDeOT+IkYZqTzljB9DZUZzROVudi5qh+aQcTlmJvkPzkBoUbFIhU3I3D+?=
 =?us-ascii?Q?6H5HPj5OX/Sq4SoqA7j8SO/KdhqtzW4hkJ5J7+c/l6wvxtm7KYFdi7q9MArF?=
 =?us-ascii?Q?6Y6Sc4/r+LCuRD5pEKSmmLuqAHAluBns1NcPBnSEJZv5Y/B4jI1LCreSIzD0?=
 =?us-ascii?Q?GqTQipTTR+SNRVWdYELwCLqQ1Gw1tyRFAAqTs2rqTD41XTxFJtd+LRImkjCF?=
 =?us-ascii?Q?vrbnKQd4xbE+eEzM6iret0WF6ua+iKEa+GEXCe2dM4F1WH2gX02CpQiUUDas?=
 =?us-ascii?Q?g2FcUmEpZSNBPpRcFuy0nPy1dDp4VNc4lAsYQXf2Iv67qisAL2H8YHeTyWGk?=
 =?us-ascii?Q?ufkIcrU0iYS7SKtZbaxXM14cs1Baq3ijcF5mxA+rPmAWNf7Cn8R4I7cFpwGv?=
 =?us-ascii?Q?EJbBnN6862STjlR7YvWk+i+V63nmBveyOx5NnRG7R7zX3e+H14s6Bk27cHjI?=
 =?us-ascii?Q?TNdnLKit9B0EcrKBt6xHS0MlWhQcynp+0v3AWYhyH/FGZ5IVZAjgGamESKQp?=
 =?us-ascii?Q?2Aq9CL3ngGw5Y/MyDTGMlzoTvUmJcfzHqjZfwE0e4/2N4WG3JdF/7PwYNk+S?=
 =?us-ascii?Q?b7CP+3WF9UYfVoQlODLY5+laQoVUW1zejqM5htwn8xqQKe6s2fxTWI8QOaCY?=
 =?us-ascii?Q?54yMWNVIPKQoea0+VsQ0zhRZF0AW1tbp7upc7TXmp8mHPlGn0vJ9T1lxu6QT?=
 =?us-ascii?Q?3wayjqWrtCYopsRJIaUjkDh/vUZKk6YtDFvpkzpqLOqM4rQGKJAWNcag7StJ?=
 =?us-ascii?Q?Siuu6HYkZO3gwc01mMZB2AYOFcssRPKmYMfU+4RMLwymGws1w++IGJAYoxz1?=
 =?us-ascii?Q?eQHWSCYLP/FGaksDL4Hfi/woFcZoBozjH6jZZfhnWuPYd9OKAHb3/VlVJZdE?=
 =?us-ascii?Q?5vSndKqE0LfnoPIDESfY9r4ktWqrTWBYmLcO7/I/cRZM75c7ua+n7bCO9+1D?=
 =?us-ascii?Q?JlDAwRsWVEx0AdDIS5x1WcydTBwoaydyIqjqQEYdteJcQUWjUGAgDrOba4h4?=
 =?us-ascii?Q?E3iPlanI+BpXGjvRNQQu0mCZgaf+AL55ziA1/F3ld7ZDKMtClORYfwQkuljk?=
 =?us-ascii?Q?6jFDzeXhRuURIrDjA8LQaOyWQPCifoSAijUrmf4gd9U+nCyUlH86?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 362a144f-814e-41bd-ca6d-08df2fb43ad4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 20:45:23.8550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGSpc6jV5BMHkk+DntuZI8jNWLb1w2eu2rHiwXd5kPbAlBytZ3APycN3iDTUh9crOwq455zuQMogUFxeB9ungYm3vThvAKjXQm9tTDttbXVWIHP+Xjl1AhWJsE48aOJ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB337759

From: Frank Li <Frank.Li@nxp.com>

Correct usb0 and usb1 compatible strings from generic "snps,dwc3"
to SoC-specific "fsl,ls208xa-dwc3" with "fsl,ls1028a-dwc3" fallback.

It requires updating the specific gsbuscfg0 value compared to the
generic snps,dwc3.

Depends on commit 1c97fc901fb6 ("usb: dwc3: dwc3-generic-plat: Add
layerscape dwc3 support").

Due to complex dts renaming, the Fixes tag below points to the first
commit where enable usb0 and usb1.

Fixes: ad5b6611e1574 ("arm64: dts: ls2081a-rdb: Add DTS for NXP LS2081ARDB")
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index cc1a64e63ed55..3b0a26bf609cc 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -1288,7 +1288,7 @@ bus: bus {
 			dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x00000000>;
 
 			usb0: usb@3100000 {
-				compatible = "snps,dwc3";
+				compatible = "fsl,ls208xa-dwc3", "fsl,ls1028a-dwc3";
 				reg = <0x0 0x3100000 0x0 0x10000>;
 				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 				dr_mode = "host";
@@ -1299,7 +1299,7 @@ usb0: usb@3100000 {
 			};
 
 			usb1: usb@3110000 {
-				compatible = "snps,dwc3";
+				compatible = "fsl,ls208xa-dwc3", "fsl,ls1028a-dwc3";
 				reg = <0x0 0x3110000 0x0 0x10000>;
 				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 				dr_mode = "host";
-- 
2.43.0

