Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013050.outbound.protection.outlook.com [40.107.162.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB5151EDEC;
	Thu,  1 Oct 2026 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866197; cv=fail; b=eIStTiDaJFMbwqtHqzGp0JUz6idOCPeQPHKq8YYv3yhmO1OsyDWtNcFuv1qhTwTJjWv0ZT203itE6rbpJIsZBPtdiZvnbpg0dn+PtmOxHs2fIA9eKr7kl26MTVj2PIvMK5ENE7obRGrY+zbRBjT7wE4VbkSzqlzLpk254M0DP0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866197; c=relaxed/simple;
	bh=+QHhUG8t672nn9qxsfyIDzMMX0snjQhLpuV5BPEtFLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RfV2mA7BgAlsjMNx4TARC86DyrZilLW9gFKkwd9exH6fKZb74cyReGJh9Vx/skfVGZlIQqgq4uNH/56cepMyT9uXss6NB7kS6eVJ0mteKVO29jZX+jcCMlwQNSae39Sv0bV6rGpO7PoCNeVnvY2Sgzce9o+b0q9WqxjUQOfvNJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sdIkBwLZ; arc=fail smtp.client-ip=40.107.162.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sdIkBwLZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqEXDMuzkOxjoGxh/+Z1fETDrzg9OvI2V/IQMEYwR6PYhYXMZtoFjRncSefd7ffB+sukx3n6tggWgSFmgxUii1yomtbOyu9Bxf3xW/2OKkcSNCaKH+NtzoyCzUQIKHhwZfroBpSrwq91rgzjc/fg6/4mzNZdcCtBHggp4CXOn7bTJENrqEezQRu2hDnAT34LJdbxFxpQKXtRNh8QsBeRNOyv75ZDmp5I6pKVZXpGFGSuP5zGfZZf+pznEzxj498QtfKXLrjElEO/7iYnjV7pA4e7W4Yx9Xm+Iy9FjWvV0yOG6u+r2aUbFs+TtF1qwPOL7H0R9NXWx9/xKmuFNVMuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckxfA4Q41cskYde/9HvCT0D+V6kP29MW4Z5Kjh6/mCM=;
 b=n/8Wfe7Wbrwba2BLrqO9DXzC3Wj3DAxfLql3bqlwMCW3dR0w5XVNj70NYqXtK28sKsUwBl1bLEk9pEUI6YfWi9L1kL3KLn/QrWjIfRhWQqa9YSzHSVGJHewh2YyT3+UI/CLPv3l0Fz+WhDB/4DgmTHlAfl8AHK/7IgtiWuHN07z7uFYExN2Tv4Y2Ged4yOHoF4o5gWgndD8JGmjB2yJUuFQBmkf1AxM2yX8C/MMUEWv9zPSiWm/OjTEc9N4NlhJEsqSxkXRHetsWcPdF/5YQDPziPuil8JDa1CwhXPK7u5fWFb4INaw21nxg9yEPSl7fCyRZiY/U927g8jB3yrtnRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckxfA4Q41cskYde/9HvCT0D+V6kP29MW4Z5Kjh6/mCM=;
 b=sdIkBwLZgE29mNrN7cdMItzjs66MIQtoF037+YG1uiI1c/01olPM625aZ9DbNgYWcsUlIOakMUKPUKtAjSjj/5Y3y6WW+ARc+DcCPJQBIkpQY8PeJG9KmPkCvEPZ4E77JALgA3B9UZ4+hcix1yotSTfefdyMqrGS5rtZZZcUSy3Qf0Io1qzfV4YmkeNY/sGHwrXFk8jfvj+iOLkQVPsvy9F+00NrUjNEnr78J7RWVf+0aVWKoJ9ydMKxGAhOww9u8x+DL6lXdLVhYADuRG4ks8r4KhitIn5/qub0Z9S7vEbWnyEvZZu6Y4PA9rbItr5cEAWkznnyz4vxdIz0Ke41yg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA2PR04MB10312.eurprd04.prod.outlook.com (2603:10a6:102:414::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 14:49:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 14:49:43 +0000
Date: Thu, 1 Oct 2026 09:49:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 0/3] ARM: dts: imx6: phycore-som: PMIC and PHY fixes
Message-ID: <ar5y_StTTBYDeck3@SMW015318>
References: <20261001070947.1815279-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001070947.1815279-1-primoz.fiser@norik.com>
X-ClientProxiedBy: CYXPR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:930:cf::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA2PR04MB10312:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a15edb-7164-4da5-47ad-08df1fcb3a2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dMEVYstpqNaMPRiw4/O6WOfV6eO61wM4pEa3OCTeS68fBNsuoIL1gKLTc3FXhroyrgllqlGWoIl2fRW1LvXi5gtZBu9txJ9o/omXYxd0jlKDt/+qTnrLEP5YaruQMF8DI39nIdCMihmfIvhuIWE0j2iJmQlKg5cr9353yVuR8wJaDB0WXLpCpFW6kiDPXAPBUENu+zpab234K5JFfEwzWX3MQTzggftsmblK728kq9A24CmsO1/L6GKvh+0vYU9OFG0F5uJfp1MdB3a9+xJeXis/D+sezPbAqQo1eJJuFp85P+FwydcS0emO5Hxv2OlWaCaF+SJUPAjlMVt/FaqZe07foaPCozcdHXm3Aiua6oeHyCsqbMtw+KbHgGsxgSR2cUWZL2sZ8I9Q9yrgBssGdXHhJeFJh4EBYM9rlUnUdzZbDcaM7JLOKDpFdNbjtF1Qy0crU9WjGJoDc46sQ9kpUi1ZcNjzXvPrccTV5Ou4romMgYTt25QOaS94EGulEEHAAY7fjM9qTLS717FaHdm3P083xxIeZ3aBh77FRdhd1YMHN2rvnIzPQwQVtCkHW0A0nGC75oT7wS4Lj7wrzhygXfCouyMCWG/fPT14lkyEXZnXUZ5n/dyCRwfOp+AlfD0N2SquUwskrLs+XhrT0X5dubuQAoh4cuiDZH+0QExTeAQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BCUFKXaqucNOSZQUlZjFV+Rr2dt+9HLp76JyDhUHEl7aFAo/Zltb9/JY5KV1?=
 =?us-ascii?Q?Vsy8TcHPPZHpwWgTObz/xuR3c281skfPzx1H4z9IWeUywlunhVRYVKiRSy8i?=
 =?us-ascii?Q?0Gs7jg+pdoTBiMcUC74+MU9W0IpKgBe4AHyJ4jR45V9hDVF5rjrFcFEayW4S?=
 =?us-ascii?Q?21hDe+i1g8uAg4aL805vDdvjXd41m+oGnG/6cpiJUCyqRvVvsH51mJMD7O2A?=
 =?us-ascii?Q?R3IjBhBKeDz2z8/9o+8/KLLhm/Nyo0MHHC53oeDWauBvtVwAiYmUYALHobS6?=
 =?us-ascii?Q?s6ssVofWFrzmN2pKdx5Uqle4yfq+eOqaD0nRefzHLcdUj7Kwkts7KwqmVohs?=
 =?us-ascii?Q?5oEMpsUOOw8G/h+NAffgYDCs2kywJHWC7DbTNtwbAoI/dt4USF9LDb1fYDvr?=
 =?us-ascii?Q?hUSZWi/9BDHXi74ja/gmagrGhPAuK95MuSnQzuOu4J3hsX5QPVxm/IAYHpMl?=
 =?us-ascii?Q?Jp4uCKAuT1kos+dghfTPnoj4FCxZ0umFTY1/IvOPXseVKnw2O3weCPoUHU3K?=
 =?us-ascii?Q?zzwzef4UsAo6RvjRB+vkBcTAjzLj7LW+5Y+3y0inOPZmg6Zhmi8KbGBLIbBB?=
 =?us-ascii?Q?KeyivWAKT2gdwCXpry3JGhIhuAiLKYUQmw16q3DTdIItdPkHVYhZ6a63b8Ka?=
 =?us-ascii?Q?CG9JrDLDqlVgG2WdW51zUSnLnjXbQaJpC5fPcfgWR8VXVKHadsd6M+r20L3V?=
 =?us-ascii?Q?AavzgbwAPv6hgcqobubtjdS+mQT4wxrfoJCCCKiuXiYqeeeEkngPG9D+dTRs?=
 =?us-ascii?Q?5vCqoBfhMyYiSgHcr4/8Gf2Txia9KYwGvQjQf2yxb3A9kI2jbfpzbMMDWCSa?=
 =?us-ascii?Q?FJM8HwTLWfr9/U0gaoAg0Zuf/XDn6HTl6wAWs9XvQAqd11e+BTwMO9geuPGG?=
 =?us-ascii?Q?M4wgq8tsDQQClnlyJGpjYJrR79rnVYpUDlWuoArag53hkvcjWD2WXSWhZLYc?=
 =?us-ascii?Q?k/OraA8NjQarY6sp1DauQ7HL9tuQmc9W7o0R9a5iZarf1zem7Iwkk4AWFzYR?=
 =?us-ascii?Q?hGBW1zXo8ws0JtyMcG+AFlyxmt/hkfgcGsd11lXHFRhAzl3zPfBduVfUKHCK?=
 =?us-ascii?Q?Fp69XhA8fNKArS3Rsld6Q6XghD40pGZGPEfbQvdP1AHZnUXKF8MlNkIozkNQ?=
 =?us-ascii?Q?B4T45cxI1k9qOmyxP2ide43Ugw4jUr5ojCi5uyXlgcRJHche5zK/rH1Gw7UI?=
 =?us-ascii?Q?GlFIQDUFzhjgt5gt2SxQItcVT8eCCkKcghoIBwwtV/boK6059h6YQEBeB+st?=
 =?us-ascii?Q?MX3ZguhfYkScZY0HbANpNSiLio5IP24amroqNFwOj0BM91l05zYGrZTlZ2Rk?=
 =?us-ascii?Q?0y5yGK5ZUbDO0lnFJAZwnraQqpZTS9gK5kf+hsek770x23bBgzvlJD4u5LMH?=
 =?us-ascii?Q?sAAmbEJ7fL8dVBF7LJabKIERWnSWYcvcQk/xu3plNwE9DLiOih116tYle0vy?=
 =?us-ascii?Q?8X9nGpF0+1ttDOgQpwi2s7aYTp4bLYxgvECC5yyNQUPedmTwkiSf0mWWRR6y?=
 =?us-ascii?Q?zFh/yo0J9Zc0kloyB4eyYKwNnmRYS3kqdRGgaEYp0/+KB1z9CPVFCgLt58Eh?=
 =?us-ascii?Q?pH/tTTNpXJ/aC2lWuS1fpJQ997UFgG5LL35bgdr5a/HKzcB7SVVxklY6pSr2?=
 =?us-ascii?Q?3RKA5lOWvMytkRaY1QN2Q57vCm43H1qIiCKJHoIL1LyTiEW43QBEfMW7ZNem?=
 =?us-ascii?Q?cA7JVLunLlQYuv1gBNP9rzGa3dcYNEScf0y6OZIyv6ch74hUIzK5eGCTWJUk?=
 =?us-ascii?Q?+wErghiD87t04uMNQb7HllWSBTIxjiJFlvoTUwUOc5vX13BsYYu2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a15edb-7164-4da5-47ad-08df1fcb3a2f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:49:42.9077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyIpMHvHS+LCOQh3a/3BqzgQW9nefM4i3HL8Ifp06OiOWrAxNqWv5r341rsh5aVeuUPg4XaWe+KsaWyjEb7GlCoUTyCGjZ9fEQS6YGZ4qHTfE/PO82WrQGCfRxYN7SCg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10312

On Thu, Oct 01, 2026 at 09:09:44AM +0200, Primoz Fiser wrote:
> A few small fixes for the PHYTEC phyCORE-i.MX6 SOM:
>
> - Pin the DA9062 PMIC watchdog to /dev/watchdog0 (1/4).
> - Raise the PMIC's SOC/ARM buck ceiling to 1.5V, needed once the
>   1.2GHz OPP tier ([1]] requests 1.3V for VDD_ARM and the anatop
>   LDO's 125mV dropout is added on top (2/4).
> - Add phy-reset-duration to fec node for more robust reset pulse (3/4)
>
> [1] https://lore.kernel.org/all/20260923070505.494949-1-primoz.fiser@norik.com/
>
> Link to v1: https://lore.kernel.org/all/20260930102532.2262700-1-primoz.fiser@norik.com/
>
> Changes in v2:
> - Drop patch #3 from v1 (converting to reset-gpios) due to potential
>   backwards compatibility as suggested by Frank
> - Convert patch #4 from v1 to patch #3 in v2 (use phy-reset-duration)

What branch do you work on? I can't apply.

Frank

>
> Primoz Fiser (3):
>   ARM: dts: imx6: phycore-som: Set PMIC watchdog alias as default
>   ARM: dts: imx6: phycore-som: Increase PMIC max SOC and ARM voltage
>   ARM: dts: imx6: phycore-som: Add phy-reset-duration
>
>  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> --
> 2.34.1
>
>
