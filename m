Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B488A5221E6;
	Thu,  1 Oct 2026 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865001; cv=fail; b=EMgoUv2h/u5yaH2hMCLU9Oa5RiyXEkXzaijwCfWssUQ2YJhUXpqqp37AIw9PXh75KvtbDzl/wClvqHM1i5F+OuhVfej2KHY1+7equSZiWxqmnO3bh05QiD1SZFum/gLLMu3v65AshvvsZECtACWLWrsrp9iEdhv9VSYDziHVvFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865001; c=relaxed/simple;
	bh=aGjB84hZAsGgjdFGuwelSKlUyOiEXZ4FKiWZtrPEyaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sk6Ruc4UBHyKmBZnQAcGTOcjgv5a6sO1tpkbWsKQawEK5DH0Caa1I3WLQoHJIvWUAjEMBEvW+rr9lezkw/bGQjBKiP1UwpAYaQ/5gF5j0ugHQGk5WKl+m1PBTmCheu/G8XAbcKZfqrBiggYYuTiTt8NgmzT0oN8k67w3M5vhW/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QVcFHXaC; arc=fail smtp.client-ip=52.101.84.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QVcFHXaC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AyOWnBpBSKxx9ISQp98bi2cmNDjSDEjLMMHZolx0bptbM4IpXLZv9rEDuHNUnt2GZcGmpBmdPoGqywI9V5vLqnBOrqpCyXVkt8ZAeVSZQR8M8igiAfYNp9BzxcBd0aOSfIk17t4IJCw7YSyM32ZPvqOK+XEgsRX26xtXNm2bbdUHkkpB4CGTdmhBIUVI2HpqLrC6vZCKOgsWJrtEocfCFEEV0AgwblQw5wjkQViFiXLovQ0+WlaR2ZV/+pQeC6EGjKoigzIxXBjJTE3LGfcquISu5sd20AaMjaQ6kxDWLBoKATbtBR/sxzbrqigP/6qnn0ZAQM7BUSLU229blBmc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGjB84hZAsGgjdFGuwelSKlUyOiEXZ4FKiWZtrPEyaw=;
 b=aw6lLMfaT2bp0ZNDeFTKPisAniceKRo5s7bBin++QSEc37vnAc5EpWqwjPoAemCVioOQYXHwLeAUE88ctNXrMHl6ZXA086WVVr5pEbrNUQkg19PnXg83TmA/AlnPStwVKdbAztSyLhWDm8hlU5Hb+MmDEgaPFCry5J/qfyfcaoVNq8NHiLt2OfbvRIZAR1OmnVbgYVynxQyajGlJsZlodkDJCIH6iXbYKWaW6bv2Pb4KdtT33ZdbfM4Il2Z60OyHSoskSSW1DShb7I97RKGTei3qnb7rYFLeKJRHayZtEkYa1d+O9D4PzDOBwy2OoWA9atpsCLHDHQRRFk0U8FjgMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGjB84hZAsGgjdFGuwelSKlUyOiEXZ4FKiWZtrPEyaw=;
 b=QVcFHXaC1A4Q49ZTjO1UG1S4yFD/FInRu7xsHEPIr69zQA+aIYBkyTbJKwpQoTgJGpc3N20OKq9nfdSe6LCaN/GnZ7GCNkxej4x48xqvuuwuNr0w4ULogqmXmbnNVK3mMXZwYxwP3zIGDvzEljx2oJ8CvymubaAnDgWGtxMqyWdISGokZtUiAsvoNiEov+gndehVneii1fRvFJxjok6gYt5X5U4+YV1LDTH/d9VlVC4P9nx38tD7jHrG3a3BbbzDjB37+EGEoPVaA3J0ux1+HSqs6g86SKwtXRyRc0jyst4U+PwO1QrKObfgOpi0X7E1N78fBPext+uRNXqi0OBMFg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB11856.eurprd04.prod.outlook.com (2603:10a6:20b:6ff::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 14:29:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 14:29:45 +0000
Date: Thu, 1 Oct 2026 09:29:35 -0500
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
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Verdin iMX8M Plus overlays
Message-ID: <ar5uT0CLf-pVBCve@SMW015318>
References: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
 <rq5ndq2sqsyoqwhnbdy34etudy4xevdqpm7imgd65uu6gy55nj@wpt6jrgnq2vp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rq5ndq2sqsyoqwhnbdy34etudy4xevdqpm7imgd65uu6gy55nj@wpt6jrgnq2vp>
X-ClientProxiedBy: PH5P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB11856:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eee9cd1-73a4-4e27-6f87-08df1fc8707d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|7416014|376014|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zyfi+YYsBtCrsj4cWAEfrX10dQpJjcegi20A5pCouP7xBc67QyBh4EKbLcQOVQR5Xbe5yLMSj5T8IPo5ddo+Pr0Ddh7Y5OohyxRprTnDV6tAoQYcq+oSwk8yEC+L0GdUuhkohkPXRFABpe9P8e8xkuOCL/y78o9L6qk99SgBsFqxQDxkV696xqa4yTRu3wxxhoKphq2V06hmGs7p9HlGobbHMO0cb/trHyBqsTMqv7YykqfE9vZdHdktifsi1n8FSnO0WOsqqx3lbpvaPpfHxIKkWME5PjFTk4FgfbcKk0uJCUO11feE2qnWWjjvXEfcZL5atuioNaR21G0P82yuYjoVIgTWWW1UmH/uQsHOiJKXgnkuP2YWKTfgEaaHrjXgqGOIakxX073LsumGhzjAuFgBa27N9jQ7/qh1J/x2eZeZPp3SewyLBLTErOx/QBo9lFuOHLGxYYTCyuq7+/UdZdu5IoH4snT37p4kcraN3Pv7iImggW20UJWhiYcl5Iq/3NPqPIM+bPQlwQO9q4C01pkAR4ipw6u4SNFYxzlRqkItpz4DbSN2kq5Z+Ph9NixKjLAwD5BL0vvKudQn6KH+kOLbqYxQ1jXHa6les7tCMiMvZhXI5Dbednv+XMzJjRJo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(7416014)(376014)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8MzTMDdTKGvPbADRV5UwhZoTwTtsLqgNPKkVaoFb9JEc6B6Vnhd5LHJdEDTK?=
 =?us-ascii?Q?g7bpyLR8liFWY+NBoaD17ZNUX0a3DeLOxFDGMSzk+iUlaWiD66rUzHy1GOlQ?=
 =?us-ascii?Q?5NOl0Z6tc6MvVczivdMq97HZS0teQqQQtx4ASa6UFAkxwhWiVqDtyL0P1y0b?=
 =?us-ascii?Q?WbefnQs7rs75hfnctIa/f2MjyjbC4PFG0a7oNb5g2q1P5LJl4bCxHSiDQlR6?=
 =?us-ascii?Q?eb164K0QYh/12Mym22Qakt85xvhXxkk2CESRMzsDUYn4g7l2BFUIlskJNX4q?=
 =?us-ascii?Q?HZ66EnKtAYl1SQ/bIXiB76kleCfVVrXb1mJ+LGX2K9lK+gLBoPPWoGAZmOg1?=
 =?us-ascii?Q?XTNVHGTVU6C3TqMt1wi2Cmt0F9Ww12GlH0Q7ihh+ioirbdwqe03HIAttY+Gb?=
 =?us-ascii?Q?RYTW8QZvyi+Dl+RtvWVO57Db/aDuqIToev7KoMmzP8zLmilX8bunBfsi0TB6?=
 =?us-ascii?Q?60VsF+haqhlOWuWsJ6Jh3gkPtnr+xsX+DIz/DrQprt+kncg/+PxjAnH0ZcM3?=
 =?us-ascii?Q?oNqDhy3PvwLFLCf8wthUAknFUr7sE6tVQlGjFlQew+Nn4umIkj68WjaE0zEZ?=
 =?us-ascii?Q?1JxyzQm9D7tYYqe6pJ8AlUScamSl25GFborXDx15Y77IpyyH7j36RQz7NWsR?=
 =?us-ascii?Q?C7DRK7op89NgXLuZHlnY515l4OEw7972JziPfrFJymGMbWwVK5GDUrkRwyHH?=
 =?us-ascii?Q?tWoGGe9pIYPe9BM6tVP1Pm+IGQ7mmqZhMj3HFOOk/3hIsvqh8a+/jx6zqXOm?=
 =?us-ascii?Q?P7nF5jdoygz2Rpana90oVe+ou8KViJDX3MOwnFEsEpSlitw2ZCOUP+3dovWl?=
 =?us-ascii?Q?BKXFJPzBlRphxdslH6L399hZpZlTkUOcxFdFNa9I22+AP5lRkVxlZ+mawpMx?=
 =?us-ascii?Q?A8/ynng2zHVpoP+5AdUlgtTboGEQ8ZJtancEnADwopvQMGw260TnXJn3zVVm?=
 =?us-ascii?Q?dUplTJXg4suiWYbXxLtpMV2h+K/dxKGhhqNj7yc6ENAIIeurZjNkGOb+Q0oV?=
 =?us-ascii?Q?NDX5c3cY/T2dbGe0e/9JyV4a8i4gEDD2qRmJRepJM8469ls4eie3864nIhJE?=
 =?us-ascii?Q?N1dRkYCEXqlFKGfgyGSQZfJQFg49GUG3Ahmm9UgVAhjPmyohji9aKHQwQsC5?=
 =?us-ascii?Q?qGuH/z8b8e4pagPt3pixQY5Mm2f278e7A/UXoOV0k/w9kHpJHqmfPDvEIjLx?=
 =?us-ascii?Q?KBzXlBMc7wyPLZry73LWCuy3Gm/7HvwMGiAlQ0h4HkF3insK3AGPAcuHLInB?=
 =?us-ascii?Q?LsSvLzMhRLgbwWpJQPRBJHqkaMsMuoE6HGbWkGx5pv9ZlLmLg2epnMpRQUMJ?=
 =?us-ascii?Q?iA3CflxXd9s/QRBMDXlCqJCTKyEFR759RcP/HAlSEIE4f5vaDlvthIXKcoZ/?=
 =?us-ascii?Q?QlLLXDBPvFHtj3DPAkp35Fa5Jy3CRo9PAD5zSJ7cjXSDa+WKFKNA/wDimw4T?=
 =?us-ascii?Q?HoF1KajgVxDq5CR/k7Pu7aEIpzI2fG1zmXIfdYG8nVPGeBA5WCgpcVOsyTY7?=
 =?us-ascii?Q?PXn2n1bmggnyV6BnzKPf2bskdB7+lkftl+qxJi1wFLRxlpfYqK1vphYl8i2d?=
 =?us-ascii?Q?0sneNOBBbI2bGU63WD/A8T2q2UsTgt+07Aw/l9/5Ll3lBZwqRJ4bfsHZdlfX?=
 =?us-ascii?Q?GSGKfHgEAj82+xh5NUOijUra1coY86m7bklYYUwyg1eE3nfbsRtBIl3ISgw2?=
 =?us-ascii?Q?D1wjzafOlBmYFnsasa/j7QsKLm6KLu/1EVgql7xyc6B1efenu1wEBKzTQUV3?=
 =?us-ascii?Q?wpydwcghG3VjWWVP8lvw3OsGEZewEufltvcKv2fCugqH27B+vdRz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eee9cd1-73a4-4e27-6f87-08df1fc8707d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:29:45.3391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1H9RTcfZwvMznwTXN7sySS3xJWLZE1JNYoCjygOnZWILqn6vkAUo0Fw+aKT9mY78KB+v0UIiiVTA7cRdVX/3P2b7/owbX+d3+of3EfP7ywEQMEfrWAqLSgHvoHnGmreT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11856

On Thu, Oct 01, 2026 at 10:25:49AM +0200, Ernest Van Hoecke wrote:
> Hi Frank,
>
> Is there anything blocking this series from being picked up?

I defer all display overlay patches because clock nexus node support
already added.

I hope your ov5460 can move forward. I prefer use this method.

https://lore.kernel.org/imx/20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com/T/#m00174f8e2edb8c6304011e87551b42732e19f428

Frank

>
> Thank you and kind regards,
> Ernest
>
