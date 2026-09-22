Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013018.outbound.protection.outlook.com [52.101.83.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61305349B7;
	Tue, 22 Sep 2026 16:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093280; cv=fail; b=SfMiZJXRNCSnTe8O+DQ6JOMl8QG3ftC4r+Krxs/0L3m3614BUmLHjuNo+PgFPyymmYavaINRyq60mF6ovImNwIvQu7QU6bUcuZ0OaHAoUAh002DszqPkl5ei18Gn803lMh0mGTzwS4Gc+xwqRCJjp94iWzXToaxHe7EAtkAU5lY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093280; c=relaxed/simple;
	bh=2/EPjNqBRnMBtvcMMQKoFYZodH52cPfVTLSNk8p9svE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ea0oXhcAXrQgLdXdch9B3ZblEbTpyiND1nd6WuRTXDrco0lQETqKH+u4By2+itwYSDBbDKJyvKjgPaQrNfhq/OPILRrwVceAaE6ylvj7M2SkrXjqr5AWwXkJr5xjP15MbyBSpidUIw4WW/t2LqtO2XHqWboZLIPum1BTpLYOf+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uMjRbW1c; arc=fail smtp.client-ip=52.101.83.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uMjRbW1c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVrVMIUcGHYh+IgR5/AoUoe0KfSD1XPRle14/3NDKYD9kAHiw0vJe2RUYyPyAV8Bt9Ff7TB6FWQs8cxEdd7hskUdKjzuBAKBOcIk1zGdSfComKwnuKbM8tbE5poSHmc6SwjwUzLA6KbDDM/PaK7YsLZjwzB6cTNbVG9roPbrSIL0c9fdh7EZh3eG8VNuVHW1FdV97TjK9VYR9LcbzGURAWJ2kQ8QzlPIUeZWAPIVnYoJdk/Bd5Rw/dvr4+4eBpAkl/HmrFfiuJz1FXIckRKcAjMztsoSfVip0E/zrBByp/UDfruMl5LqhYd+QmufL41o07jplJzV1kO1TQrhL+i1AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQyGkfzhwklEkBQo+2E5KgVDjHcqnex+q7xadudm5e4=;
 b=ODn4xzkJHByMGyeMSLyg3a0okccnx+l4RGYFPjOw+1Xx5CC1xHqiZolYrqzAjoZAu+0Ohabb2zgzM3gLSLAecUhTQsrqoTZvMKUy+EzlrbG5QrP2yMIT6/u711fkeMf3OcIkMb9wa2rm6v+6cvyR/Th4wuW//j9OQJwbpO/woHYHoPYNCD3cIunTjuUQaun3mdqkJ33+0jYXsmDlNhjQ5tEU1S/ELrFEorTHmKGRIfcyvpHv0PooBCJRTk464dr2akCKyQp7S2+WT81/haXaWAV++KeOXc2UCb6nly4R4vNHIkHMptTJ/6QIzxqyJW5hn94IXI8FaWB+qiERXtxHKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQyGkfzhwklEkBQo+2E5KgVDjHcqnex+q7xadudm5e4=;
 b=uMjRbW1c/Q5rgoiZ357SCkTwS1+2tTOuaU1lDDXbB9Qqys/KCMlm6tiwjuq8bx+v/jzJ3zIoCmgdBOWLlTSQupzISWm6Z++R+5HYR9scCAA5YKoQWiwEQX6ZNz09OLLx8967Ohwb8sQPUQUkXlwVah6ieuoyN/+DcF8yF74E14SO80IGTBw2kO8UvwgkNeG548FDSJ+sXfdCeEfH3Jp8mBKRET9paBEVkBsZou79lShfelzwYLY3CjAnIMW4vDQRTy78d4tfIFaMCWNuvhyQEBX0+x9HhzkFR8S3T53q4MvWha2X0a0OlplEeA5H0drLBiFRa13v5mT1DqUSlcpT7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB11195.eurprd04.prod.outlook.com (2603:10a6:800:291::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 16:07:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 16:07:53 +0000
Date: Tue, 22 Sep 2026 11:07:44 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Toradex iMX95 overlays
Message-ID: <arKn0LhC5fty7dHN@SMW015318>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
X-ClientProxiedBy: CYXPR03CA0045.namprd03.prod.outlook.com
 (2603:10b6:930:d2::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB11195:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b1b30b-a1b5-4d67-c903-08df18c3a886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|19092799006|7416014|6133799003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dJKgqS5HcAevq1XOA44VzhQ1vOz8t3N/Nuu0BE94Mp+FVHpx7KoL96iFgSeFHXmCw8G26ogiGZhCwJVT5k/Silr254kKz4ss2QChQtpzyQIAFafs1Y/uNmZC948Z5a8mSIMIhaQmqRRJlpKNxWzrKhzREQgp3KLbQVQjKKZegs77suo/R3FwJVQQiBT5pd7UwFCdaxN9MaPvMeUq4lQne6niK31xcXBJTro1CctgEu9JzZyUj2KGQHRIjdVylSs/pri0vPEBBLUTdw0oKsny9KJgymh/HuRv/VJoHlnWF3Rf5FOB7CFGuzoUIv3UpWxjEFkl2dlxiuYqjeUjY2SYSHWXribKpBNHo9tARoiJ44g+FUCzJoW5IDx75XbeblxXzqe3Iq3bSDz3ldXy7vast6gPCxJb6U2ziyZPBcDlj5DV5lQ3TiG5khLatluIHTNVS36+bQHjobQFKc69IZyGE1dnC4vygtg1iVp4VAqjPOs0iEg0qtGd0ZH11G70Kn8KmwEdFknMff8dHZnMRu8ihkXyhZY7EE268/o0wz0f3g9NhR24+2m0/b6GA9b+SIU61ocFQvCeoAWTWNaXir65q3v6E+Efd8MRZxxSoB4JfJCS095bA0QAdsVuQWjEujj6wnolILVL4+DA9IopKdpYyfoabCqFsU/gv+6HqHVWCok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(19092799006)(7416014)(6133799003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WQ/y2rtWALdjZoI/KjlMroXoSTJzXZPyV7idTYm9JKoWBULDhVYnDKFmbDoR?=
 =?us-ascii?Q?ty+LOv51znga383afKcsRsmuAv7KgnZkOa3D9c4iFvP0EMVOae6qGzmzs1Hq?=
 =?us-ascii?Q?5O4R5ZAOlDfSPgfkBQLvLZHraukblmh55cZgJuQdjs4XASDl4eSTlGt6RDwN?=
 =?us-ascii?Q?2HXKls//6BzRmc1XFE4/KCbbjxmjpoEFXpjr0ekt8PbQeFyoLsgSdHZykcuF?=
 =?us-ascii?Q?luFt5/lnJzLzRfoNBssUWmuMUzdsgRqhBDhB+yJpH+KiObaDCGUbo4s3iZyd?=
 =?us-ascii?Q?2l+nXHdi3E5oX+pUPjjsu+38TlWG3mUNGaVA6PTUjIECwDHvndPsQIUJ3Bp7?=
 =?us-ascii?Q?RqI7pAx+bVvafHKNcMs1xaRTTPNslrCH13QtJK8P+VoUbv+h2mmg54DB0WXA?=
 =?us-ascii?Q?fBcnNezxT95yWsZDegQD+mtWyxVvCccXNud+EICJEL2ZWsZm64n7EB0tf7Nj?=
 =?us-ascii?Q?daTGmA9Q7NnfpHDCUTlbNfGembqtmrmR8JFxJOciBCmQeGDiPHaGtpLMCCy/?=
 =?us-ascii?Q?Te+98d26xx8dR+r6If6ZxFDGqEcbVpdy4ilwZdwJDMNiWspmiPERHOTJHcls?=
 =?us-ascii?Q?Crwrq4vcGLyjSiuOa/cVXbWH2GQ5qtwxLtqnzk3IxL9oFuC2SJAO5URIvOyT?=
 =?us-ascii?Q?TqqitOBm4gRwAsPQ6rJJi41suR/Eli/LenO/o0sya8uo0OCwYBxgskWk+rwd?=
 =?us-ascii?Q?VwiHPPFUOKAkNLyIutnDza5YIenDj7PLCTtnbC7I/rmlIHJxIpKub4KZN9bf?=
 =?us-ascii?Q?/Szl445q0SgQjuadWDaMU1OKoQ7ZKRV60yW4b4F0rkNJGYPnSOVLBzIatHMG?=
 =?us-ascii?Q?HRJvOEKRhBNi9Dyd+QlZFRYOs3ULWLlQI7YKnM6eBg3qFrY5Y4e7u9VtaU9O?=
 =?us-ascii?Q?sRjMroWAWgQEF9xkPc2ZzNhcm3w4o0jvPNobjwxzr2pGQ7jYwBZ83ig9tF2F?=
 =?us-ascii?Q?An8PwI09G4mETcOzV4/C5++texsvTUJwAvMCtr46FnTtINph6RCdlEp6qFIC?=
 =?us-ascii?Q?O+kfLMRLLNnBCID5C/qls05LrDVtLy5eHlI6ILkcklG9TmfON8aLHkgUE6LW?=
 =?us-ascii?Q?IIIK7LctIPuGC4YtvZk1sZsWRi7u3rLHU5zqV6ip/I48MrTkXSMGlSxMyb1s?=
 =?us-ascii?Q?hStRHXkM6HiijIjE9gszYSHnFFBjgdIbyNs3ZgD9oj61F+YC6JLH5U5Umitd?=
 =?us-ascii?Q?vMD4J4Z6LPug7LkuvNrC+IWCLx/dC0xtAoJYsZIkhfld3SN1lwfSrhD7BcNO?=
 =?us-ascii?Q?DTySfZBvuL+iEfc5Db3azPb7CsirDEh13SPDhm7b+gDe2gy8a+XYfFArhFRl?=
 =?us-ascii?Q?/yhHIKX0hX05SOwfUo0pTgI9lCE+eoxyfoxnBd124Ut4RwdBXScZyJj8/t+t?=
 =?us-ascii?Q?BD9h+2VsoStzm6+tGuK2mr+CI+P27v1qyyiXcYOu2b/q5+OKW0hEEKu60Xni?=
 =?us-ascii?Q?2398HgG58rIjNDRCRbfD0GcLZif6j/+2nOyG9+2iNaLzELsN9MfHrEK6+qjx?=
 =?us-ascii?Q?lZMNp8GGbu8XrzXLjMl5ZKMyvSPpSiao6/0/mZ2RyXatxZZmyhwVfFkRVLBA?=
 =?us-ascii?Q?Xz1sFrh/Xya1/NSg76+WE9kfb+4UtQYUt08UtLn20bOuAba1nBFz4I1jnszS?=
 =?us-ascii?Q?mwdbOzWbtv39e7Ckod1wBLBsrNzfgATcmm/LVO79WOF3YKpREnV4OkhRgtgC?=
 =?us-ascii?Q?pZi7qtq9/+f8rDAcKLMs9FRMXQcgNHNoT2pUM0oT2uUljbrwQaAYR0PaTXXt?=
 =?us-ascii?Q?gLNQlOE0DO9iJVRkFyz/ZQS8vlgBrFKO+5Vh3JRtgBHcrHhtEy3R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b1b30b-a1b5-4d67-c903-08df18c3a886
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 16:07:53.8369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NzJsR93CLy7tr6J1CjeFMvxc7Iz/OgJU2XxJFDWTPsb2tbWLOUUPtxG6jcsayOipsEnp/7d2Qaj6o7wHJ2EB3Y7BPxv3DEdB4aAVkcBjjP57wBfro+zq6MPd5dlVXE4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11195

On Tue, Sep 22, 2026 at 04:33:45PM +0200, Ernest Van Hoecke wrote:
> This series adds device tree overlays for the Toradex Verdin, Aquila,
> and SMARC iMX95 SoMs.
>
> The series adds support for:
> - NAU8822 Bridge Tied Load configuration on the Verdin Development Board
> - UART_4 reservation for Cortex-M7 firmware on Verdin and Aquila
> - SER0 reservation for Cortex-M7 firmware on SMARC
>
> The UART overlays mark the port as reserved so Linux does not claim it.
> Firmware remains responsible for configuring the UART and its pads.
>
> The Makefile entries build standalone DTBOs and ready-to-use composed
> DTBs for the corresponding Development Boards.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
> Ernest Van Hoecke (4):
>       arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
>       arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
>       arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay

both reserved lpuart2, can you share one dtso?

Frank

>       arm64: dts: freescale: imx95-toradex-smarc: Add Cortex-M7 SER0 overlay
>
>  arch/arm64/boot/dts/freescale/Makefile                    | 15 +++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso | 14 ++++++++++++++
>  .../boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso  | 14 ++++++++++++++
>  .../boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso  | 14 ++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso | 14 ++++++++++++++
>  5 files changed, 71 insertions(+)
> ---
> base-commit: 478f68c644732750f8386e4de7c909c5ffb26ab2
> change-id: 20260922-v1-imx95-overlays-89b3a9185b93
>
> Best regards,
> --
> Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
>
