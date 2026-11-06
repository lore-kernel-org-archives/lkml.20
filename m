Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983661;
	b=SRXCL6ReYvnqEauLxBIFiP89ITWg2hL5WAZRxYzfRUBroZ52BhyDwPXQNaomr+FpcZxr
	 uxBP2jXkCkUekHQjtTN5kOzEtYjI8YCnL/dY5OgWgrZXDSh8ugGHSGXHdSHEGmte/HSh+
	 50abgcIPAwjj3tNxQNdjzXmdtzgYvWkDCBXhOxu7alH0y/0WSUNsqfHQAksQgea+vSmOI
	 txdpqzvAIgpRvvViPKQyP92fqhEDKhq+97ucq72/fjMG1yC8ZOqnAcCRyYkwbYX15GN9Q
	 9gYoXP0ge3vritTbxks0A2EIM0HVm5T9DFRAU2R4BU6G0r3bSPr8/YrTU5Gqi6HMx2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983661;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=sA72syNsEojY02ASAdhXT00NGGKnJKJbR+gA7p8G8oo=;
	b=E7PfPvnJX7u61euR96K9EPYsXjLK91KFZdWa7CC2jkKhaIxpZVfjpPgvzvyLlbPzszJa
	 lgdfwpRvihqq8G0i6XArGQNnkhsB+lZ4P/qHazKEt2RD+vLd0DWaB5X679hWHuxgEOIFD
	 tpHeTW6bpCU39KDWF9MoWQuSNV7bCjyGM8WTKQ9OuUseAiiVKLE96cs2PBgAM4D92GUhB
	 apTTQ/OTXfRmtgs/dhhpUUMcpWbFGsI6/Ywil9IgZTADAFiqqabv1aSwBObAf4bnRVhK9
	 stAhJI5pKK4CUc4Oerb8geYbJmmNq+zyIBwCZTZBpYZBcF4X7KtfAfYWUxyKNgJRYlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JG7c5a8V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.25
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013025.outbound.protection.outlook.com [52.101.83.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B09606D802;
	Fri,  6 Nov 2026 16:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B09606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JG7c5a8V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=am4xf44k+i4FTgZCV/3AtQsAKywBsQybf15azHwLhysHIF71AyqIVWkNudX7bs8H9lbag2xEgdbJGeb4Y/Wkz2WMe2r+jKVvktXAkCbyODo8yEYM59DePy2/rLJbCVX4PxCVOlJRkiPWRZeP/ditie1pEkqgKUeK6hn43GrRzekJrUmCaJXKEGXGQy4NnXHD7RFB26o9WW3ef1fwmeBuBLEmD1lvA0hI7WvuFmzkglSbaa5pVbq+kyipFSW53mX9ch9tGeBA5OfXH4e+gjtBtr3+X37XI21inQKLEzEbDCHfpWS4GlCBv6Mr39AVG3md2sBTfSpyCdR1KxcQXl1ReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sA72syNsEojY02ASAdhXT00NGGKnJKJbR+gA7p8G8oo=;
 b=OYMC6Oadb7UfTSf/nPDhdkNi+woGf7Vzhovy+sRgQ9wfgTQUN5XEoeav4xjI2dEYPvQqLT/5vmmsDecxaXm+Ru7+Td4njb3Ey0r228XTsJPW8lyUebI217brxB84eW9aXIctkpFQTkiJAq40vrvfv87544GXLYBHWw/4SzpGfU/rcc7U0OlDIFi4ANCPnRdPtvvWkn5ZQLwOnZ0SeJlrCo/1NJ4C8Yw3aDwMBYzq//Uv5d5TxzlgHuZghxjySjc4sOMc05BGvB5fO/7L7catutDcKf73Qr7PcfCwZLo1OdG98wpY5z3ZqAFN/k+aPUc2M0qmUwqvubHcvRWeqDBI5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sA72syNsEojY02ASAdhXT00NGGKnJKJbR+gA7p8G8oo=;
 b=JG7c5a8VG1cli2jZdwFQ5GTXCeF9nV8F1Rbw1VwfF/dNAZvckkT3PXyEIvN3omQ0r0+H8ZlA1BHJu962Uo/fwi8fFuGv1dBGjX9ecP9m/G76pQ5Xi/3gNqTb0TL3wKsPGB6dKdUKi53ate1jzHkVz8Bms0FQ/WDXlDsl4rdxIiXg6klDVEluxCu4lT+2MXcXRhZtMncIkkY3G1ZH6y0nWRff3T6xaKEVvil7gN7bu4tFz9iNHepo7Licf1YvuIVYQErx2xoQDb+AaNpSJJaNEeBPr6A/ygeO4sbXsfV0CRE4jjdHwyJaXpmMy7RfgM8vw/gCGjyA1UHXfNRgDSnYLw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB7880.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 16:47:36 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 16:47:36 +0000
Date: Fri, 6 Nov 2026 10:47:25 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Leonhard Hesse <leonhard.hesse@bshg.com>
Subject: Re: [PATCH v2 3/8] ARM: dts: imx6ulz: Adjust BSH SMM-M2 Wi-Fi and
 Bluetooth pin settings
Message-ID: <au4EnWiIRT4xoT-6@SMW015318>
References: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
 <20261105-add-bsh-smm-m2-v2-3-fb5ffc7da486@cn.bosch.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-add-bsh-smm-m2-v2-3-fb5ffc7da486@cn.bosch.com>
X-ClientProxiedBy: PH8P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::25) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: d9332814-636f-4fbd-b0e3-08df3c25a972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|366016|1800799024|22082099003|18002099003|10067099003|11063799006|56012099006|4143699003|261021121427099003|261102123227099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	aUIa6XC94nfHYugYpQGJLtuaT8waFi8OWEkG7Nur+FAWCPknmJqxNzttpFJfiMAWBf+ozeNOwOIgljqDLHDnRmtGk48iCtoCrQ37FgKp8YmIl1HpfsDY8nnVQr+rusED9QsNUZD8vNk71p7YHjIfzCr/mPVGN4Y9XvPtdoy+ZJ9GHspwsKAmZZH799KLDatQ8GI5eH/r9gG4bvin+2X0tRlC6PbcNyWbFs+5SnIP7GtDuof4EnfqXQ+tolFzgnC4bcA6xa4pASWdw43IOCR5Jt3+n7fVjOkH/gRDz9nngIeCLIybFQJ7NS7oEDpaX2ZgcXczsqoIUF9q4oh+jdN+aNcNmA18zcj8/z6xljmpIFfiEIE9LmP4FnDhBAGk9qJkMl2HeF0/dzZkvzFj1KfJ70xwY655N0lYl6ngWvdrkTZEP6PZf9H1GsDhoBoyjUOWoiT9cYb2h7gjAXe3J9jXjD8sIihsMiG7Yy7weQkGAbOEB2omKXEs/ZzT/xwJ7lLnMSReoMM2Ww0c3MDmiSSXAYO7+PitpdPnYkySSU4SGsO6DL9k38auHTF41uHsp0jdGpD9Nc7bRsNWUkHtXMsMifZmUm6zIleufBT7JPhHnkcoQm7ozN9mOjCJh8NxWQd2z3P5SAP5JKeboJCavqDXYACrz98z/4WupPmVkAcGEZ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(4143699003)(261021121427099003)(261102123227099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KvI1Zd/hjcDVw1GenqK1Ny4+cL3G6Or0Xjb6h7QQDVpfM8tO4kMB5T5+Rq96?=
 =?us-ascii?Q?jOLmcPEOBddRa7JcruJhSbnJeCNFccfvzX3vcheyAHgoDfbcC7qt3ErKwFDb?=
 =?us-ascii?Q?/cofKlqiNpi++3NML8GmPtbfonN4VbWzHCys1zmGiYaLm+fHrwLxQa64Ov7c?=
 =?us-ascii?Q?qSs1aPAehRkdkpFoTVKeb2QMP0wgreDl2WGiNoQ+NP1U45JPbcUuwwpAy95f?=
 =?us-ascii?Q?60djzZZiLxn5FUJx0vij3PGWO8n7tOV/GKOF0anzJNIdGT+Jk2s6oQo3xvxn?=
 =?us-ascii?Q?NsmPEtdF3zc/juDgG5NssIuYpO2U5aRSe3pvuY3ULUUO3FNNY2FslZgs52rM?=
 =?us-ascii?Q?H83lmboctWlkCgOadpzJpxS9aPbK2jqc8sLHfpBajRW+MJtZfmQ9JjLyPCiY?=
 =?us-ascii?Q?kxfMgJ1lWaOt/1OuIzgxHNlMYy2/5P1HduMfnR03M/afAjafPYH4fUQOVItQ?=
 =?us-ascii?Q?duP7iZwPUc12uWQdd8E7I8Ob1D1YosTweSX4/lx8UVLQLFYIcWCZaCg41d8m?=
 =?us-ascii?Q?I6SniEqyZUKds6P7eoKRkXVWlE95Cq13NQCahxS75G73zZac5Jnmqc2NYZo3?=
 =?us-ascii?Q?b5u18UHgUz+DXpm1nHsEYK/WxAkiEor/Xk+H0XgNY+jkdpMYFfx+F4Xr4EF1?=
 =?us-ascii?Q?O5M+hXaj/PIIOnYGRcB06jPjwhkgfaI59mt1kyNRw4G0VZBc0WJmG1izcEOM?=
 =?us-ascii?Q?4D33HBwSUn8rL6bt5N81iQH4bA1k2KrWcuyOqFpH4dFmnHQkENiUvkxxjg7u?=
 =?us-ascii?Q?QkobLh/fRpuVZsEy3H5gESRJ6bZP+ppy2tt8CXZ4kRLoJKpgzvlfNEzcbibr?=
 =?us-ascii?Q?YA4A5xkQnld25U2kNw196hvqFvaMSkzJho2QnZ5yQAO719AHMjjyMxLKY9Pj?=
 =?us-ascii?Q?Laj95vKtOaY6yA9aF6lTl1lh1P8VUAiEejGPBhJgbY1yMmbaSP1SSUa8PVCe?=
 =?us-ascii?Q?/uO9TLI5bIIQt9aByHPFf4EDsndbF29VRwBXSm+o+U404KYTLUpP98EB5Uz/?=
 =?us-ascii?Q?D+PW4OiZDdyF7G7y/XE1o7+i0f5xB8vrsfXhQF7axRq7AQLxwskV/PngbPtv?=
 =?us-ascii?Q?jDbYXqjJKJV/0M7Nzbd9OOex8+OB1kkHgZvaInJzJjdafnY6QErHzzDq/iWz?=
 =?us-ascii?Q?x3vv4pq/oOK7zRWWJst5/EojUBUA4ii2rO18cXUOoXQHzuGwimHX7MwaZoaY?=
 =?us-ascii?Q?8/dYeHKyQwLD9d1OalAjk2NOvEVIQ7BCRB/4N2EtRc3pBvVnM4ppBMBBmWXa?=
 =?us-ascii?Q?5+008i3p6S3rHwC2I93mQXGEgJAvndZrEkVIrAf4i8470/zvqlajr+Ttw/RQ?=
 =?us-ascii?Q?TBvhm6n3uCUJvG9Pd+snyh4LGq2UJuMzekVKLPcfmcPoIU4Kyx6833QHJh3k?=
 =?us-ascii?Q?WLp3jwm9qCIqCVEBQgRnc38SYWCsxfgUsM3QKPGyAhYxEIw8xk4LBXNm+y2h?=
 =?us-ascii?Q?pUW7kyrh4qC7TupknbnY57/q8D+q9+TfRYXkh+iTVX5MyRBqg2aDEnuy6cbQ?=
 =?us-ascii?Q?oGHYH8FitYPItms+ws2AWFBsB67XmMRC2D4KRUX1CGvVwSqb40E8LF+maZxd?=
 =?us-ascii?Q?NRvkLrnulmKCEDk3U5Vowj1/o5BKl2Crw1Vkg0O1pgtztsW8o9lJcvqWVxiJ?=
 =?us-ascii?Q?s0FDqvhOT4DjAYfJpq7tXe5sq8WequODiiG+I2yLNoOI3Sl7NnuRubm0278F?=
 =?us-ascii?Q?kbHhVSuHHdYn1JGFUbdxB0b1aj68F4car2oP+OKlPgOO+DeYACeCUrVbxmTa?=
 =?us-ascii?Q?yraVr/aJz9l8F7s+sn+KDOVc3Og0ghJrEk1Ynhprj5RFOi8ntK5K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9332814-636f-4fbd-b0e3-08df3c25a972
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:47:36.6330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GicaSJZNzfWOQ+EHqg/n5KonBTWN8If9j/QW5/Dg8O4SSWeLllIXex7CtrjDZxsxDYXSOGzuHpHmRYyBbao7HesZrPj1a49DNCPLOQnxjOiHH4BL/6zJ7GaJTstSI8LC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7880

On Thu, Nov 05, 2026 at 10:41:17AM +0800, Haoning Cheng wrote:
> From: Leonhard Hesse <leonhard.hesse@bshg.com>
>
> Adjustment of wifi and bluetooth REG_ON pin settings.
> Tests have shown that minor changes in drive strength, slew rate
> and speed resulted in the best performance.

It is just GPIO, why strength, slew rate impact performace?

Frank

>
> Signed-off-by: Leonhard Hesse <leonhard.hesse@bshg.com>
> Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> index aac211a9f9eb..dabe17222f13 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> @@ -125,7 +125,7 @@ MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
>  			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b099
>  			MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b1
>  			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b099
> -			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x79		/* BT_REG_ON */
> +			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x100b1		/* BT_REG_ON */
>  			MX6UL_PAD_SD1_CLK__GPIO2_IO17		0x100b1		/* BT_DEV_WAKE out */
>  			MX6UL_PAD_ENET2_TX_EN__GPIO2_IO13	0x1b0b0		/* BT_HOST_WAKE in */
>  		>;
> @@ -146,7 +146,7 @@ MX6UL_PAD_CSI_DATA00__USDHC2_DATA0	0x17059
>  			MX6UL_PAD_CSI_DATA01__USDHC2_DATA1	0x17059
>  			MX6UL_PAD_CSI_DATA02__USDHC2_DATA2	0x17059
>  			MX6UL_PAD_CSI_DATA03__USDHC2_DATA3	0x17059
> -			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x79		/* WL_REG_ON */
> +			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x3029		/* WL_REG_ON */
>  			MX6UL_PAD_UART2_CTS_B__GPIO1_IO22	0x100b1		/* WL_DEV_WAKE - WiFi_GPIO_4 - WiFi FW UART */
>  			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x1b0b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
>  			MX6UL_PAD_ENET1_RX_EN__OSC32K_32K_OUT	0x4001b031	/* OSC 32Khz wifi clk in */
>
> --
> 2.43.0
>
>
