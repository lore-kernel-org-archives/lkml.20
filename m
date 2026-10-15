Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013029.outbound.protection.outlook.com [40.107.162.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74DE3E8328;
	Thu, 15 Oct 2026 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081596; cv=fail; b=aHxUsMVUA4LA3U/AdWVccmLrfvcNdxZr7XCsrdUDEAtZsxNDWm6c40zO7XZN/52i2GW2g/293GPhwX2Rbc6Z4GvJQK/PW8WY5PlhcccCyjzvP96RiDg/phM151k0BpNa9jH/ofJQU4MRiiTKw8uXcSr78To8C/MTXR+9FzrgAuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081596; c=relaxed/simple;
	bh=rEpXuw6ZUsKzYHb5OQflZjRgac4wQyAmJIFmabThIKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MGOZvEzXTHSy6V/aBUD45/pYsl7SRmipIQg9WMEMHz59trfDYJv2usGQDQ7L1jlNCH0Wv6nui37faEvHGMLJlmU/4jlOrcHQJSh7/uvdrf7+g0IXamWFT4Y28VdKyCnj/kWHtCLiPBwAeE48tTDrCOutsOekIcsfmJAPbABqLOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BV6RgfbL; arc=fail smtp.client-ip=40.107.162.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BV6RgfbL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/pt3C1yImNaQRJQaHl/620sLFSOHh79kr8d8Kp4wqu/GhfYe7cBtTO9zsYRL6hh238armzAJ9VUEk/hDQQWyUO2LRDKPrzhxO241YgPh6EulQJed9BZStUs5oCjwjEs0WVSaznNGNozukmFS+1tUZk7FhhQbo/0SGuyYc/r2KUZh7MYWORuXT6R1QSPbwrMn57bz13L62RuIM7lJdCIT/kvS8mDQc8dFUMr8TI95FuR9vqIfeVpjMzAPWZsopV/ywQuk+j3WdZvjLOj9qUESQanZ2wbcJdbmQ2bQ0Qvb7F2OkzL3NM2blLFa60VE5R31Bb14QOzvh/LDZ4rNPMb0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2q5wFWGH5XXfo1KOm5hOzjtSsfKt0mt/NhudM5oJXY=;
 b=Z6uDCZg1fCvirLLVJHYO+SJs3pKfO30voFr5OJiPsOa7BfBuxRHkbTs4UQZLC6TrBlMwLdrnjEGsXmI4yUZfTfuDPDErDtBCC6FhrpMfaECSm3MacfoCl8U19/l+AcyP/xxf+wE/zn/YoGqFB7heum6CtKGf934okOIFbRSn1ZhRgxZ1mdeJn1PFmKsWN0iFWgQ9a4H1pp+NB+T4nFrn+uSovCOwr5r8MkMEuyQpQsIPCbGLWqbFKgHTAWsok55LNFVMmZg4wluOzcH6v9DzHvngqxy5h7i3ZFg6KjfAIQV8XN9ZZ7vRyhigIY1uGto/72OnVs5yERNlztDH4JYOpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2q5wFWGH5XXfo1KOm5hOzjtSsfKt0mt/NhudM5oJXY=;
 b=BV6RgfbLN4uyqV2GgwoadcdEceVVOW9s3Lv8DMzpT/qAkEFF7cW162xcHry1FoCCyQJEx9Xdxz4mtD2si4JHavBeVXXK2THtirXLn4p8qOCFSvzGI9pXU2hSjYAE3TNEy/YXw8D9P/scpQKNJx5lOPFN1O3s4WwQexCmocWHFdjaup/THBvIsiphXQg4G+c4GMwhlUn7jDNgBAC/RtJA5WlXpTNumsmdpGroMhMHBgXIf0MpaqyTTo3kY2onRikpl8/ov7/CVCUgopfV0DriqdjKthCEq3H0T+CatNjd4nvRuVW/cb6tHKWn1K0774NNHq6tPCeQaZKe94zS99ij7A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB12060.eurprd04.prod.outlook.com (2603:10a6:150:2bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 16:26:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 16:26:20 +0000
Date: Thu, 15 Oct 2026 11:26:09 -0500
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
Subject: Re: [PATCH v1 1/2] arm64: dts: freescale: imx95-toradex-osm-dev:
 Remove ETH_A PHY interrupt
Message-ID: <atD-oWQMKKTmXXwL@SMW015318>
References: <20261014075812.29154-1-francesco@dolcini.it>
 <20261014075812.29154-2-francesco@dolcini.it>
 <as-Pp99xLXk0nRJd@SMW015318>
 <20261015073719.GA58156@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015073719.GA58156@francesco-nb>
X-ClientProxiedBy: PH8P223CA0022.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB12060:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dfd333c-09d6-499f-d119-08df2ad90b64
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|19092799006|366016|376014|10067099003|3023799007|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EbZGL1cuyDUSzRUn+WlAIx/LjcFI/CQkaI40hdJGXGEufq+SrAmctagOI7Tf9T49FmDLkWlGJBgQBQJSkck9JSVWTk0F8afdYXE+fmtvo5ljHkG/ez9YR/A9AWUMohBhmM15ALoOX3zW0HO61o3GEODZngav+ImfyU8d8eclcoctAcRUef77QEkTzB1ytUllj05YvtLhweNj7UDkdmfuuJfY4xkIR9B1NnRwawNPoLsH5Mj7FjPf62KmRRwlwQr92ZKOkjDsJJ+igHM4YdiizDfyIyrK+CxPuZJ949/b3pQtH/ItYkIo6KvHM9HS1r0vjY5XyFInqwg+VGRAwQU1jdqSXCnFPLVMNvwJH6KyAe0z2Xu1G+/8aT7FJ+Z+gqTqPea0fpf2EYNX0wYIZ4p3k96gUujBrFz9dnoCMfIcR8elSPstutPfH6DPlKierw0nQGVKNfmnzje2JpB3I883p+tRgMztpkjGulF5Uz6c8FW5MJKXGLinKw/Pa2bqyA4131EiYEwnhaIFImbcyqzRyz2woEc2zD9vhRugknRo2xyuN1ZfUPL+5tn59TfFtG5AP628LLg/X5915f917TsF81FkQuk0AobbVwTrexiUfnXBTP13tzwDkgRDAuGVvNx5ZDxRJvSEndAAm0ojrLZ+J1X8kLI9gOeVWaJm86Osw1k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(19092799006)(366016)(376014)(10067099003)(3023799007)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZXmtEhFngWuMulhD1wtXmh4z/rERH5l7Jj/8JdcrkE1AnUeBHO4MLrnUZ2ip?=
 =?us-ascii?Q?wmoAnGZfVdd7C1lryaN4E8Sjd4wuufU5xLVAMZ1hN+bkBiE7DpLMFz8ZW5pV?=
 =?us-ascii?Q?RioHDgaxHbwDFmAEzuRDJdk7+WOB5NbOtdYPFa0VbJvHsUm1RORloCzU9zTL?=
 =?us-ascii?Q?aY8LMICuI+X90+s7uW3T5t1dmS4qe1iS/juOYJ7mwiaRtrU3bHRoNL5i8xuQ?=
 =?us-ascii?Q?JM1SiBQcTp/+VvLklEk4ucNgF7lZHJfGac6L2fpXzDHfbgjtAZrNmqy4pVEI?=
 =?us-ascii?Q?oTwJXr8wpXJD81cnCBrEu4jHLKVAdCrFtYaOC3SVPJoCK3m3AhHYR2W+gbON?=
 =?us-ascii?Q?E1eJPPzG4Og0XjNH1K+Vf+4H+idXppj+1NMDgLfCurtkx9Aq+12A0gHczWSx?=
 =?us-ascii?Q?xrL/guH/6jfFyL9c6nwvwkuavWT2WM2yKfsuYMfKHdgZOdC8Bm4vhM5SR8Ch?=
 =?us-ascii?Q?jn7SgEAPj0j7T/IGtzIwv6cYEwshTXtb0+tUHgPPE7+m2DM7Xy0m9gZ46J+I?=
 =?us-ascii?Q?Xsa2kmh8LFdRYiDcepqiGBox1sw0XB0drDDIqDmfyGNnb8KSO9HQls5dgsCh?=
 =?us-ascii?Q?uYDvlJhUPoU5PtM2tb3uFshfhtHh6Fyrv5/GDAa93OmwElJS0MYIvW+0Ezkn?=
 =?us-ascii?Q?1D7HeaFmMj8c/ZolAmxOlAl7lXJzAmTlzCHC6topDcSRIQUtdWdSrxx1YqKG?=
 =?us-ascii?Q?i3fjhS97X4fFVoI5ldS7PsXQPIm+VCQY5IZDtPhO6VUdnX+g26eOBUmSLSuX?=
 =?us-ascii?Q?66au+5L8vKeX/jI3AohtKSjuzKWSK3xe0MuMPN2mr5cmUHveaqb0fqJG5RpZ?=
 =?us-ascii?Q?lnJkADkCJ2uaPv68Vyo389maoKNpE+/FxF/ev4x34TpUeQ5De5p6Qq2zLVK3?=
 =?us-ascii?Q?tSNMa1BswPqlDlFiqOh2rwIjYORg7PhO5gX4cJjtV9OYFft/7pRsz9Ow0PQq?=
 =?us-ascii?Q?4x9LwfkEprCEV18t/QU0/tvbBDGmVAaeRRKYawkkdjdFQPY26aToUXN+GTHc?=
 =?us-ascii?Q?7AYPYBPne413hH2gCGUe8YZw/dlXpWOBOjo5YTceCFTN/nIBgKl7D7JbNn0p?=
 =?us-ascii?Q?Xc8y7cyCR9PL9XYM7HJUCnt3lgiI1E50yV1BVEWb8XPHDghjgtjonbavhgua?=
 =?us-ascii?Q?oJ+ptjKRWydv/bfA/iJR6EGqxgRLj2VgYQQYxIkCIf1TpLCYivi5cOdMRDmH?=
 =?us-ascii?Q?fBH1jmZQoC3noOkdmEuZoq0pRlOm7KE+gxpgUp8YXIX4YWe3pUlfyed2yWZq?=
 =?us-ascii?Q?GHSl7c2I8AuhshjOV6DNmvSn36dFHcgOe3JvlsdEVYViV6aUFBxRuURmmlBX?=
 =?us-ascii?Q?h6YuSoPh8bNbdtjlovoKza6yUtnBf33vBTmoaKHkTSAWpAYmm4xm5uSZLgFz?=
 =?us-ascii?Q?5hPU0ciZX3gTSiAic2QTQbxlXAwCjY0BbpKSuXibDDFBZGP8fMbckKytL+El?=
 =?us-ascii?Q?VYjZ/yhbB8KI9PjuwFtuEc5ORat1mFOjbL+rYYysv57XOys5WfQB89WPI6TJ?=
 =?us-ascii?Q?YG2Czc6tNIOjgbqUavXsSPVKG4f0cmUo75tLvLc5lyVZHPRJ93KhFSNDsbN5?=
 =?us-ascii?Q?ZzGij/v/HgSS+2P9lkEvzgzDbMMJs3Z1os661pQeLk1B+eGAj2skU6ihOlov?=
 =?us-ascii?Q?6EfDDccwfZa+He2a1WmUrYke8SfWu3cRe88HnwOn1rX5OifLfKmchiT++1kc?=
 =?us-ascii?Q?bUACq9Rv+1Bc+gF2KPkLP4Tnn1V3tQxcNr3gJ+KiIJPI/TgyLznXFVgvlHHN?=
 =?us-ascii?Q?dz/KfukPLR0qWNkAzQ7DPGT9qVJSKppfoVYYsZ/vyg85/TWMESQF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dfd333c-09d6-499f-d119-08df2ad90b64
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 16:26:20.0349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNIPZbiJ1E7hXIWu9WeiTimGrePtWqOxFACXBUk656s6S09sPD4jNEUPpRnvCk/znxSYI6HTP8vw6ISuZJxa2Cvg8kwwFfHediZ4oWruCNrxw7Fmrl4msXyMCexxp/oU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12060

On Thu, Oct 15, 2026 at 09:37:19AM +0200, Francesco Dolcini wrote:
> Hello Frank,
>
> On Wed, Oct 14, 2026 at 09:20:23AM -0500, Frank Li wrote:
> > On Wed, Oct 14, 2026 at 09:58:09AM +0200, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > >
> > > GPIO_A7 is a boot strap on the OSM iMX95 module. The pull-up on the OSM
> > > Development Board Ethernet PHY interrupt line causes the module to enter
> > > USB loader mode instead of booting normally when the reset button is
> > > held for more than 0.5 seconds.
> > >
> > > The PHY interrupt connection has been removed from the carrier board,
> >
> > Look like it is hardware modification, can declear the version number here
> >
> > Since V_x.y, the PHY interrupt connection has been removed...
>
> Valid point. It deserves a better explanation.
>
>  1. There is no change in the actual board revision.
>  2. Moving from interrupt to polling works always, so it does not
>     require any change on the board.
>  3. On our board is possible to disconnect the interrupt just removing a
>     jumper. The actual board revision stay the same. This is a new
>     product, that is going to be generally available in a few days. We
>     are going to ship boards with such jumper removed to
>     solve the i.MX95 strap option issue on reset.

Please add this information at commit message, otherwise, it will be strange,
why wire trace suddently route to HEADER from irq line.

Frank

>  4. Future board revisions might completely disconnect the ethernet
>     interrupt, removing the actual connection from the schematics. Given
>     we work in polling (after this patch is merged), this will be a
>     transparent change that will not create any kind of software
>     incompatibility.
>
>
> Should I incorporate this detailed information in the commit message and
> send a v2 or the current commit message is fine ?
>
> Francesco
>
