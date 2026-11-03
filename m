Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793710434;
	b=rU6kuJNS2YLEtkepbF4rVfde+/NL/lzRH9ZFk6t/p5USDdTXrPu7qxQqd6LOSbMvIPfW
	 yA9t4EzXwwC5PovDSm18EWQ5BGCuonyHfCC0TL0OJIlVwh2m+bh7uH7WG2PxYPzAULhvz
	 g1a6qK/gs3ttV/husBzPinb/fQAR3kEuDRCOlKrbd/Qq++Kl0XMPt/OrACI+kwFna5RcN
	 l9h8BuPCLoWU3LvO0O1sy/+mT4CUWu/A1faR2HX8jJWvH6MVLeH7cYJN/KC23QdYqx0eP
	 l2Tq/yZZVQZkxN2xmfoK80BGGqCJHyCHsdIgmZB/g+rhJXF1WWVENrv0kGdGnAS5QlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710434;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:X-LD-Processed:
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
	bh=bT1P7GmItRId3FpV16mQL4w7fSNWMMsdW8Ts6KuiJl4=;
	b=IvaSqiwTkkcRCqvLYW8fxvSolAY1eOrPhu690vPNY6CY4yJ8Va8dGK1zkoyxxc8q2qpq
	 yqbxO4woXXC88DMtOpja/Ec2LgX4KVjDoWpJBBSjO6EhLnfBPklBW0xB10jBXGk3BQGJt
	 dPEt3gS6Nrgt2WhMuKeF6unQV29TYSfCGDrugcNPevMCWlIVZPv5eMelve6IrrWpUNzyy
	 dxVdyG6vXCv1rz129Ch3f3pJcPmmokrC/+yJsZh+WxkDZXU73IEVHLBY8qbfolsBFdlMm
	 lQ9TTDd3Kl1x6CjRs9ZInsz9YqcsJFG3ULAgM94Hd/VMzxlQQ+0OAoAkKTOLQJ02UVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TC5AN08k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.60
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7848E606A324;
	Tue,  3 Nov 2026 12:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7848E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TC5AN08k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ekg+/amWb8NXX3cFF9lggFYrUxufA/UD5/Bu+2sByogRSWbm06foki5MblNFZxI1sJU9Vd1EmIHwUdD3QPlC2PI2fQ4VtYC8JQBRUae8uR2ertqvFdnRWj5FDxDX6jm9wg/cg9RBPRer5niJPRDVora4Z8bDUPKjdwgQwYIOfvVZudD/WsE5p9aycuK6F9g4wU3VB/dFqFIxqCOzvTGRHuM4/h33D4vEF7UxgsVQpLlqqpn2OHs45g5iP+7iR6AWlrvrmLPcmlXt9ixDyaveO4M3BMDrTqwWgErRG38a+tV2ldgQa2AlPv1JitwWCTgZmKuM2510OaAwRjSm728i4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bT1P7GmItRId3FpV16mQL4w7fSNWMMsdW8Ts6KuiJl4=;
 b=AcvetmRcjfyyMGjDcz+aMSGSp/KWX60OXyY4Us8q/RU6x8qyRogT89UE7KZEgBji8HYVAXALW7R1bDwrUnfrx450enDCtLZTLQspauWg89/xnoerHoxEA6X52uMyFzTgQteY1Ac2fafEiEXTtVSdUtbzw+HEz/gQL0/WLwTez5gVj77N5kItk84B/ryT/p3mFWoolP5DpewHmZLyvR67HoQBTGpAQnig74BEtiuBDZL78YwXoHPAAp1OVMMUBgT2woWO0lYaeBVpwRP+fsrHqPl+SQMnkxd6ytPjYuA+t85Q1ekxKprO6kYhhqE9oflk/GSFdOaTVM+tQD1jVZVxQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bT1P7GmItRId3FpV16mQL4w7fSNWMMsdW8Ts6KuiJl4=;
 b=TC5AN08kDN8rN+kGbY+zEObBQm64/AO03svA2PJLfPLTc726OEyzq82k2zfB5GUZEKibnIjY72XMo5fQOWRQSvzptTNNUDqjvultrXRNVr9ONNmq8fNgcp23rFE8uVx0b3vGlievJZGzs8+dXgbRjeTy4Ki3MgsVK+9EpXod6GTYp2A5nXchbrY0G5BwmU7W1VLCk7dNkRGGsK2Dc6IDBfpQP4q+h6D3TGmGwlZ0txL27E1wrrnDrP1+2rz9Profik+eR4u22Itox4UoCBToWd0s6sYmrCqqL8O2rpb7Ygip/Hy3hbEKldDG4vCl/eHWZDf4tG3ojvAc/yCOFoVd+w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by AM9PR04MB8684.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 12:53:49 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%3]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 12:53:49 +0000
Date: Tue, 3 Nov 2026 14:53:44 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] arm64: dts: freescale: imx95-aquila-clover: Keep
 DP_PWR always enabled
Message-ID: <aunZS4GSfuiDnrXG@vm>
References: <20261103105323.2394012-1-francesco@dolcini.it>
 <20261103105323.2394012-3-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103105323.2394012-3-francesco@dolcini.it>
X-ClientProxiedBy: AS4P190CA0050.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::12) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|AM9PR04MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b732df-261b-4c2c-6c23-08df39a98157
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|10067099003|22082099003|18002099003|56012099006|4143699003|11063799006|261022105027099003|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	TvX9Ri6/bRkobGLNdAzEnbfEqAgdLvdtaGKpWXDYPdTz7fHEAlxm/Xrrmu4UuSvZ4A/LTJ9q/439szlD2mKH8marcXmrDbSAnEUN1FqcHOJfluDyNkiKKwh9tfTRmF/SFYGYY2sN5/asOUj7narmCI84EaUEnQhXUqgaCcHK4oRXHK5W/4YQ+EuqKYrhnJqAygezD+qgaD39oTEGjuO/8omwMzRagDSFz2g8qQBk4yGSt+q+b00i18DfoOt+G8PlTdiAoeSHUhnkdOKJNs+rLLNiBrHm1V6JakvMdqXOK0idmm3l4tfXeRP/fvovd7MxSr2Aa9RrSHhDpSO2PVHfWxcuQ6AqhAiAO7yYp8ofAU1lG4jpeMfPI/niRcWp/peca8AEt5z575hXEzH/g7hl2P4xZcU0W30xVKu1ah4WPeVk1i7OSXEVdgY+ysALQt4YUUhxlsN+JZ3DS3p5jAChRhWbrVo1loYk9X6QLEQhhHfrwjHfEvlN7AHO6L68y0V/xSFshSYOdSivuj9EF0Vt0OITLLpHWeMWwxl0BjxQXfXO2aYODlholwG36WP39SEcNSPp3OMjJFLiDQIQUqFFc/nq6SE/+9Qog7D7dvLxlnaAhV3gzQYsuB3Bj1aA+By5bCTpSWFFBY4xjlfcjDOnxru8H4dk0QioQ3vh0KbtP18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dc1y9gyRJRXMLUH2HS6JP32Abvu5aJcfTH/44+DZDjwi9aOJqO3H/A5sb7Sc?=
 =?us-ascii?Q?XNLarppHr3Aaf54JXUQL/jkYlfOGzdNZGaDT+PnAIsqlVbnocbx6fMbvyoMd?=
 =?us-ascii?Q?OTymVKkTEhfWJ4LqyLABtaSBfceNyOZZJYjTO74Y+X4Wkae3dcIiEZQmrbk0?=
 =?us-ascii?Q?f+Ox9LPZCyEELSl2U5mV7knmFTAv68oruFMfZVFMd2GlxQByBAuAPdheE0Gk?=
 =?us-ascii?Q?w7k/6FGN5WD2n0J296alzvq26U86YC3GdzZgPbbxZL/JbtuhH1X3GFlTHphh?=
 =?us-ascii?Q?4EBJbY8wXCqWPi+V4eXe3boXfGfbQKpSeqH9pAyqf667Qfm96UKcyV8xTXB9?=
 =?us-ascii?Q?/x+KAmnbMFHc3/KDOeFXmPHEv0tOxPxCJbW6QaqUBzjzMZTIHZSBSicf9yiy?=
 =?us-ascii?Q?93X/zUjmTxGyO2ZmaxHzX7GsZdufc4YjUPymjrh8oQ9U0LCrfjIV3XERgkG0?=
 =?us-ascii?Q?KJ25w/9WuUDGyCCvSVHoJqfgkNYumntkxmZVxZGNVzPFQz6umNUNQ4WI1AOC?=
 =?us-ascii?Q?BYif8R+dZwH0rqnrbFeNGsR5Jay0/lH0kg7eytxoMP0lU7Oere0+l0a73Lvt?=
 =?us-ascii?Q?IPxX790mNkfYPN6fKEstYznL6U9EhT1+034fRQyi8ePyAVosGhcjZoIYGqbo?=
 =?us-ascii?Q?diqEf7elZx1Nr0H4CUNJKjMYs16OdKCkG2zraYxhL6BKSFPQm+UfGouNzFGY?=
 =?us-ascii?Q?M9r49Gi/GAnUIgww6zDmBk31Fy8kwv09YYQqso7L8+7UFOrzGW+RJVcAzYQc?=
 =?us-ascii?Q?Dk5WXGYKP6dNQOmuSLPBJgqjPwbXnCKBllcnQwNQfcICrC5vmXMZzGmhhVST?=
 =?us-ascii?Q?T29DYGl/aW43+6V9/a+F237cgg9P5TMo9zOuXXV6d/DReXn8yAKmMp+IHRyD?=
 =?us-ascii?Q?fC0w8fBc2tf30mS8qyTm7i5dRjlK6v1Cd0pz9RY00xLBozPYmdOKZ/Xb+3o4?=
 =?us-ascii?Q?bIHahGefaDoQJaulcG9WPBn5B7whdkUzZEQ2mocltXUvKBx4GFBP62erZ/jO?=
 =?us-ascii?Q?yiPkAFTWEL5ndnObaR0Yxx8KGdjvZiNyFssXlGvOnC8V4W7HyV2N0munyQDB?=
 =?us-ascii?Q?JDPqJyZjLsdxcBMq9gktRlxwvcADxIHxd+HZHUaWdHkGQ2fg58Q7yuS2Z60z?=
 =?us-ascii?Q?MCs6oOULF65R6pl01QIC5269HaSOFqauwHRGqtD/r86HR4XwFQlChLdweaU/?=
 =?us-ascii?Q?IdaGRH0qS6N9YvXpSmEP/oVQbyWJpawtIe/C6axqTkTU5M2iJKeYYulbZeXL?=
 =?us-ascii?Q?s91iMH2Dr2RAM4h8Hr1t5PKraxh7+zAPw2ajZhWgn26g2ZKUXsZTE1M5mXbC?=
 =?us-ascii?Q?lMO7oMaUxSbTyR1pk8a/0AXuIw6Z00wXxJxpoqOLOu2U7weMgr0k0FKHHuQk?=
 =?us-ascii?Q?m7SNvGEv1P9m1n4CgQD0017i//6fLd2qA45GcnKNu/YqtvOj36LYGQrXNQlQ?=
 =?us-ascii?Q?5Zz9pVEKGDbyM6nqvQ5+6OVo0zZPBiw5uMbdBm9uNCm+iZdaoIftOQ81f4pd?=
 =?us-ascii?Q?OVG7rU/33jCyMUZE5hgIxQqMlk8PjF+aKP6+zkpsUKyTYe3icd2t/egCJQHA?=
 =?us-ascii?Q?Cz/nUthZQfPhjj707bXX58Gyjv/QQR77BbtoL5stM9bGWvnQE73rxmt/LI+5?=
 =?us-ascii?Q?2XzJej3r4jj90wnv+gkay4JlUbz2DUMyt75tKJ+/8XI1H1IlJdY1HC2vbJo8?=
 =?us-ascii?Q?hI83gDUUq9K0nh7cUcKsK3ZXi/gsQ3cTi6sbt8fu0+3Vu6DQvFplaHlYuzcp?=
 =?us-ascii?Q?oFFuhA0PRdyZJd5rxXtQFmOJjSdn3UI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b732df-261b-4c2c-6c23-08df39a98157
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 12:53:49.3423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uu4uzSJ09xN2XZibOHIQkEE8nkekHCBh/ZeZ1HuQ+GYWq1E7BXZUnu8W8uneMxqmXOmuUAOlxY1ZpDRBP1XmcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8684

On Tue, Nov 03, 2026 at 11:53:16AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> DP_PWR on the DisplayPort connector powers active DP cables and
> adapters, which do not work without it. Keep it always enabled, and mark
> it boot-on so that the firmware, e.g. U-Boot, enables it at boot,
> whether or not a display driver is available.
> 
> Fixes: 3f519121e120 ("arm64: dts: freescale: imx95-aquila: Add Clover carrier board")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Acked-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

-- 
Thanks,
Laurentiu
