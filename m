Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E006442FDF;
	Wed, 23 Sep 2026 20:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195444; cv=fail; b=jPEq/HZOespLr171fWCw2vTma9VoZkN10gKdHpXUqlzKc3eo75FmxzIeIIAIFOCisZFfOtUFY2fU3G2U4ZFTZocTEDgEFYxwDR7gVSKa+kkxY6xUtbc67xljBFSVX4UE8JVxkXSNFjf6jd8ZLJy89JImek2wWozKx7tUOpEq3XI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195444; c=relaxed/simple;
	bh=h8jZCpDi3cVoDOgdCFnUcPUoUDdlgXQdEWYkEzT6YjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CQrTZHSwCYNfkSfST+U2s2kITNEuNBPRuNGb4ug2dvbrGkgIsn9n//xqiCw3+lw3C6nrYksXGfRZZWjFmofTSEYS2cVdhBoXR2euMGhj8wRagN2l4a7ryGyfe7ImK0LLwsgfTY54Fgm2HGjy19bV7EjA0g4JX/yxRNeLWU+bHLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DiVPTimH; arc=fail smtp.client-ip=52.101.70.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DiVPTimH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G776j9wSVw7FBd8HvvCJeBiv565Yanh8MKs+Rqs1adP58nLPGFYAQCe2dHXHNBlVjor33Cox3RdMnMVra645AVNrjSIScLFL7IsNY02Z8ZLAHA7PMAK4zWEGFUgLPxgEO5M/34w7NKZAesoMuivMCeYkOmPB1eKQ/pDcnzcGaA4Zn4fouffnY2Ok/XXGK1Kw4MnlTkHtgTnJIDqJ02NfWZcPgypj2s/buoda8D3qNkLzXoB5YU1GZVFOhNQeCJoa+fjKk1tRTj/qs4fIQXhsVzSytF72MVyQzp2gKBRGBrikPE0zh0uaZgqwiqT7/RX9kQbwLECpz6UJ+bmfGxbtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETidI3hBVOTF6v3F2jCjgXuklpL70iE/AneCEZoGDVc=;
 b=iiX/XU6Xo/+SDg/aEGF8O46PCKVjuZGpFaLWr5jLyfUGwDcEKBvy+799w+bbCBi92M412q5zfhIAW+GU7ofYNuT8HiTczMM4HZXF5Kx0DGfCLVHeaH3yl4FR+rMAt2IZbQ38fKA2KLDLILL0cJODPqp1yjBjwe54z0G1a5bmZRUJS1SXIQqt6gtQIRoRUC0bUYSEF+igdBO0e47pZFetMFVpal9+duaSygK2X//ZqdpjpbJvHh8Ldwe3V3U+VMM2XCKnNPxxhtMnD6kyohMGziIAaR+ouD1YGTdQf8A4PAVhWPpl2KGaCqJKWtGnxyE8Ou6wU62u7m0IpbpvB40iZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETidI3hBVOTF6v3F2jCjgXuklpL70iE/AneCEZoGDVc=;
 b=DiVPTimHfrXmOQU0V0Ld+W0YOwvUdPfu5Y7ZwNkKzs15Zfd4WUj/MxmefGMW0NEb69cuIH/n+1YRCjo5FT4xoEin+Fv8ZMV8rPvWDCgmqXJfHgwktztkalpmAyLZylAibMWvaIp/knNIwOKc1Nfsxg/0R4csN61nFax9dJLN04DnUX0B5MaRin85/zth2/REYLS/+jLxmS2W//b96dIcrITzj2NXdpcis3nh3zIW6R4r296y5Y8+r6q6RIexSYx8Kv+oJ5F+cI+Ld9Sg2u2TZf8ocICnlhogZyN4M6VYLFISTOzzlNK5fmi6finRWAvbTA04JcTs2FHy8u6rKINwMg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 20:30:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 20:30:35 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add #phy-cells for usbphynop2
Date: Wed, 23 Sep 2026 16:30:27 -0400
Message-ID: <179019542416.3758044.11467792578504713630.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145803.838836-1-Frank.Li@oss.nxp.com>
References: <20260917145803.838836-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: 71cf0add-a048-4a78-31f7-08df19b185be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|19092799006|366016|11063799006|56012099006|3023799007|10067099003|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RNZm0izKvxE8jXVhewOuP4br+4pDadvRbwdV98y2X1loB+QYHKVJnVBoM41rELTVZp90trlbx4tvGbVLurkRf5T7SlPHK/lCScmIKr/n/9lBOkOgzSiK/bE5R3fBn5FaI57BLs1Q/S5xn2bf+/UEjrejmOVx6dYIDXQD48u4G7/Yj2Sg8v97SraWM8UxaeHsO+VfIUa4243Ig0OJmD+T9+UIlFCmaUzppzesbKOeuiu/D5+4GzZ6e0SkqifKGnIBuOAORNkZZAH3moSRsVbm9cwiOw47l9ixlHJ9te9piUftT8QQZuK3XZ2C8boUjp6YV17IiP0K46tXJZrOhiphJr0+Mb+3tPVVV+SLo9qeNOM91TxrDHk3GNnDXoHlsxM/gWCQKCqv/CUJzl0kQebAN1ouAjK1qBksi1/65cBW7fRDxHG4x22plNyxOtlYP4Q5pUXay3XIBVdBGcKE22Obm1jZcMJl8afzWPklZX3dR5KhuQlPOI0iN0uHqxc/JUxpXhKqm1ynONYgJRbij0WITqj5XDxX7Q5f67NSdUjJqFVkxrsT88zmgClv6wyP4qcaXJZ+NNVxhnkYIPr+ilSoa8dH2+ba1cnYgOB+KsIjZucScCCg9PA4hIyeURfMusfejtB/pT8kdhS3gTMTvLKCuFgZuM7VjB+vaaFZyae8ajA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(19092799006)(366016)(11063799006)(56012099006)(3023799007)(10067099003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEl5ZFlaRzV2WVVnK2tDK09mMWFOeWxuTFoxQ1VoWGlnRUdWUmRXS1BwVVJY?=
 =?utf-8?B?c0gvMVAvcklFcllMcmp2MUVETi9XZGpMZ3pXMmJsdjdncEczcS8zM0RZYUtX?=
 =?utf-8?B?RnpFcXF4ejlnMk9QNnkyK1F3R3ZVLzJPbCtFczhyRzExZjdZTVg4QS9tRlY5?=
 =?utf-8?B?eENxYW5GbkJRZmVDMkw0bzdNK1Q0cVFKWW5XWTlGTzJxazdrTG45YVJUdXU0?=
 =?utf-8?B?QXZlWWtHOVJoV1N0V3hYK3VkREFwZkt1elF5Mk9GYXNtaHdiZTcvbEJjQlVr?=
 =?utf-8?B?NWVmaW8vTVhJaFFSNTBzRXdSZVU3VnJob2lsUHgxdWJldVF0eUV0d1ZYTE43?=
 =?utf-8?B?d1ZaTXMyUFVGang1QndwWDZDQW5JUkU4NVhzNU1HNEhiaFB2SS92eC91Qnor?=
 =?utf-8?B?WVgyTEErcXhpY3RCWXFUaE5MekFIYjZLZjJ3Y1p5Q3h2Q2taQml5cGVpdkRT?=
 =?utf-8?B?S2hqUUhxelRIaWpIU2VYck1kMVZFdlIvUmMzUjdvZWNUOUlNajZtNkpNU0x6?=
 =?utf-8?B?amM2KzFrcDVlVlYrTGI3TC9seERDNk14TEVNNVZ6Zy85RHdmeGV2eGwvekta?=
 =?utf-8?B?ZWpBSkJJZzRkMEtSdEIxSzliRnhoVXZTaGdVa2V1M3psUmlyYnQ3QlNYVUlj?=
 =?utf-8?B?TkpWRWVPY21QdHM2M29WcTI5Vm9nekxGRk43NnAwSnpKaHZwcjJLVlp5Mkg0?=
 =?utf-8?B?c1hCb3pueGhsWE8za0RLd2laVURuTzVLY1M3a0NLQzlnNGlPSXlUY3Q3ZG93?=
 =?utf-8?B?RmZFYi9VaFJ4SHVrTGl2b0NzTGJwU0xBWVlmK2ViVU9UYnpibU91NUFsT3k4?=
 =?utf-8?B?eEYwZlp5cEc2bFNGanpFeCtSTXV5YXZwbkttd2FJbTJwd2c5akJBdEt0cHBC?=
 =?utf-8?B?TkxFeitXbDRnSk1GNEs0YU9pOHZaWEhrUkR6N2k0RnAvSUYxRDhzMDJ6bE1t?=
 =?utf-8?B?Nm1jQVlvNVl2Q1daTWwxbFBhRUJnYjlUZzVydDNham1uelF0QlZHdWRZZUtG?=
 =?utf-8?B?Q0JONEJnVW80TXJMZmpkQzUxK3dXb1ZEaW5WRDloUS9tSEFuUm1CV1NxSXRm?=
 =?utf-8?B?U1BRWU9iZzlxOGNIM043NXdtUnVJamZKa05sVlVPOEw3UnJOSENoQTJZYmp4?=
 =?utf-8?B?eThhSGM5RmFCeVRiN3BWcVcrdWxWdy93RnJHK0hLb1FNYW8va05QYjk5SDI3?=
 =?utf-8?B?MFhQWVplZXpaR1ZCVDh1QWRRVWx1TWh3VUpSczFqeFFJb082aU00L3hFTHA5?=
 =?utf-8?B?NnBWMDZzSk5mUnlnRkxNY1pzdHZISVhSWGR4bzFabldDdDFyQlgwTU8rRTBq?=
 =?utf-8?B?c1RZUTNxRHJaSnBTY3hIVmJHNkhyS28vL0RDRktsSzlZZzdFSUp2bjAwYVVv?=
 =?utf-8?B?RUlJbDJUbnl6aTBRbDF1dGJEOFJFdXMvYTFBejZocHE2RGdYUVNmZUJDWm1S?=
 =?utf-8?B?Q0FxOC9lNFNNeHhwWlVvM1dhUHJndWhWUW10UFhRRmdIT29aUDFweVVvODND?=
 =?utf-8?B?MW5MaWE1NmxsWlp5Qk1jN0tPVGpaWmF4MFFaZTRGSG9mc1J5ckZKTSsrSXMy?=
 =?utf-8?B?ZWFKdG5ZN3ZwaFpzTmFXWGtTWFZXbnZtY3Aza3JyMjcwdi92anFPWE9yZUFh?=
 =?utf-8?B?K2tlQ2txR2ZsRUhuUUdDRWxKd3RlRXN1R0NlZFJVeXI4eFc2ODFMS3ZJbVRI?=
 =?utf-8?B?VStFQ1JsK3pudkJuUS81OGl4VGZXZXpOMUVsQkFjeUxBQnV2WVd2WlZwSTNQ?=
 =?utf-8?B?VldDZkF4SWg0YmpyUGxkek1TUEtFbUZqb3R2TGdVeFFocFpuWkNvWjU4TmtP?=
 =?utf-8?B?QkZ4RWZQU1lNL3NQdjg2cFF6SWJiSFNKemZPbm95WE5rYXh4b2Q5YmRFcmdl?=
 =?utf-8?B?TWZOTWRSMnQycGZqbjV4cEZxcXl4TGdkNUxzekFGQlp0UVBSVGtoaDhKOFBS?=
 =?utf-8?B?WWZJazRUVWw4UlRzbUthRG1jUEEvY0poRVg4Z1UzQTdtb21FY1FxK0pGcFVi?=
 =?utf-8?B?aGNGV0lCMEdMY0srMXZ0ZXpLVEt3ckNSdTBBZUU2NVcrK2JJam1qT3h4eG5E?=
 =?utf-8?B?U1poOTBrWUt3OGgxanVIeEdCUW4vU0RPU2xoN1ZYcjEyNkdhSWFkNXZXSkk3?=
 =?utf-8?B?clY4eFFCcWJzeXppeGZIWnJmM1VVRjBja3M5MStobVVHbGNwS3dJTWlMQXZE?=
 =?utf-8?B?dzRudkVpTlRlTkJPM1VaRWU4VkhtV1B0WnlENWYvUVhZdTJGZXZockNLcVV3?=
 =?utf-8?B?VXVFZTlEbjBhS0ZVSDVsU2xUbi8wajJ4Sko0clJ4NUxDUGltYTFqdGEzTE0z?=
 =?utf-8?B?SnhVempoMHBpVW9tcFBDQW0wV2wrWEp6YzQxU0tWdExGRENRd1V3V2R0MmxB?=
 =?utf-8?Q?IOxyYn/Feb3o1PRm0xGKcqcRvKLgOmdO5gp64?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cf0add-a048-4a78-31f7-08df19b185be
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:30:35.5167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9S5RkxHeQWvRgJFFVJekjjyBKk2ucKAOwJKYavA8rHPdLPfLG/1Y12gkZTF+LYOg875GjuSWr2xC6HavJlSzdg0HkJrlVeapGo339WQT4nDLI34cWDQ7GXasuyvQsDV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9183

From: Frank Li <Frank.Li@nxp.com>


On Thu, 17 Sep 2026 10:58:01 -0400, Frank.Li@oss.nxp.com wrote:
> Add required property #phy-cells for usbphynop2 to fix below CHECK_DTBS
> warnings:
> 
>   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
> 
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: imx8qm-ss-conn: add #phy-cells for usbphynop2
      commit: 262e301dfa27dbd66d95170f929e97afcd517364
[2/2] arm64: dts: imx8qm-ss-conn: update usbphynop2's power-domain to IMX_SC_R_USB_1_PHY
      commit: e0a7a6e9dd2e434251e4672900521ff43cdeeb30

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
