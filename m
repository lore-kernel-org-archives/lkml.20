Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792682930;
	b=a5qbgbhlxvxVxgHq+eN7tESVcDrp1Psr0/1as10ibdZCNsepOB0jlMFslkY/ehv8JyBC
	 uceSMwEQYsjHI6jSZbVuowCb4mnAbrQ/2Wi1gUj6lDm5OkJSIK81be+F/uDIcbES/vcUx
	 KeW449gBYV18SyfMCYyrxhgyqkVYSWVtN1ly9Ffa8aa4H2npivKM8bvgQmVknLng6xRGK
	 kgvJUAajkxrlDJz7G8sFPnKgx9YGJDNpEDVfWILZFRzBGLxomw7CPAE8qrhFesYULbMA3
	 PWCaf7m8BNptuIl8piXXgaT0z5esUS1KEkK7L8wBu8kAKCs/R4g5pqWUAcU6HYvQ2fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682930;
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
	bh=epjv7Oi8axsWWJtEzRuR93iuS63sV2iQW6uO0nh8ibw=;
	b=L3RpZZhvFU6miF49p3fq1XW31pm6uIg5pWGj1S6LsvKcHPzHdEqnGB4TMGWbXIRs1ZhJ
	 f1G0ZoOJomY7IbGpnAsLwkWK8+0pYS987C+3TgkwwnqHsGGYpLKnLowCkAwjR6MEOaFFX
	 j7E/aX+gyptBhkMn/b2Yw5HFR7P9cRny2gISP+PDb2NdSgxs6E2x0bJcq+3iChZ9tj8yS
	 eg/sH2/a5dIAZzpAXCKF+Z+St5eLhIumo+8diYOems9pblpwmzz2jcSCWoaBoRW14F48Z
	 G69iaOuk2SOPFovymkw8lzTTa/56x9+W5V3501fr5OzookAMgb9ZOmF68nX8wjCCiAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KKHqehe5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.50
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011050.outbound.protection.outlook.com [40.107.130.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15FF606A31A;
	Thu, 22 Oct 2026 15:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D15FF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KKHqehe5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNFHnOGLAw6nS2VghiO8Epe2H4M9C6k9Fn0QhMC0hSstuTeU59Q1p4TdfHqiqgu43ksrbj16J9o1QvKeLLunZvCFGHUGIRxuRXdevFkMIldqo/Lp5bW9e2GSCskRNDAauaPLYo4SePmsaefflzn587Ua8AhfB2G7PcumTtnrC/wLaMPx/azGX9dnG0TiFzqAgAM0VQmGcys+xP1mbujFBiG16iLmBUrrNsWHQHLsCwJnvYFulcEJgXGFCTBBYImt/f6hWnt2Fc46eIOdpje9FkdUxt06dbYiGpYhxNSP1oERUJr27FIlHSEviEWguQvm6XCcxQSltrkPcDMnExa9tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epjv7Oi8axsWWJtEzRuR93iuS63sV2iQW6uO0nh8ibw=;
 b=mFcf2Th+xnu5YTm/73sthXVdekdYjgThe10zzKQXzE4SCZNICDDxd9jl7h7Doj35roAYEAmt6lm7H7h/fQEEchPsOp8bjOFTcMRKZW7AJQkyY46jRft/RCCXbl5B5E78u+trYxzZfX5HPFrQ9RCZral3fNs8jOc6YAU3+Otz2vfroJPWxZPjCev3QsUZFFo6AYk8wa9tmBJ6NdMg+jRekQTweiHz9gwN4uOWZD7yTndNulHcVjZq9AwtMtH83YBzqj4xCVDkU7dWlnSXG1IvEYOKbfLnsNM6Mv0yBUKQiChs7A8gNFlegv+IjlIcbuEAfqsLBaFsja/wSMKLhC4EdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epjv7Oi8axsWWJtEzRuR93iuS63sV2iQW6uO0nh8ibw=;
 b=KKHqehe5oCQzf/EZ8iu4CuEmdrs6VJ4LThGPpw3GJWUq9jIfMyHn+kq5aEgrttqmEMwiupUTyxiiIeLxE5eqX2gndfC1B+RYrBQOQk3rAqwk2EpmNve9Q2zrzxafkCG1Cx6o+ljSkArBkunyT57/l751cEnTNzJnfPHTwHr5W7HXkp9Vm/OQXOITgczfJ2kD7SKVxXKWuOSRZxPScZYhy6llKxFjw6Z4oH2ZZyn5bC5rQili7DjAlKYNlXPmruY17IfAlctsq5ALS/J11FkKSs6WqkE38w411Er7md9agSgWhoylbuDkEJ6xIQksZfBs0XA3hZUYPanB/qwm/QFHyA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB10780.eurprd04.prod.outlook.com (2603:10a6:150:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 15:28:44 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 15:28:44 +0000
Date: Thu, 22 Oct 2026 10:28:34 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ernest.vanhoecke@toradex.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <atoroujFLVinCK-h@SMW015318>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
 <t77enz5e4sywcigwdjwpes66jywhtsruzrtf7opde2umfuaock@3aouga4ng3gc>
 <atjShkhCdLzf921d@SMW015318>
 <7fhtj462lymwxqcaakvocw3cngvauksghxavv25mmfbjxtz3gr@b2r6lb2b2djn>
 <atkGl7o2Z2D2qIcP@SMW015318>
 <k4khlrkmuqdigphq5q5irhkegtrxvb3z3sljt7blazq3bjtzlq@l25wykhzg7ys>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <k4khlrkmuqdigphq5q5irhkegtrxvb3z3sljt7blazq3bjtzlq@l25wykhzg7ys>
X-ClientProxiedBy: DM6PR02CA0110.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB10780:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0277b0-0ed3-4b5a-5a1d-08df305128c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|19092799006|23010399003|56012099006|5023799004|11063799006|4143699003|261021121427099003|261021123027099003|261009223027099003|261009221227099003|10067099003|18002099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	0v1zml3gOQCoLV1ZdS07pPYn5WuSxC3S2mHvqamI2y1UkXI+VEQoLjzpVcCl4vpanPvebuajHat8fLR/vSnbrrF9iDP6LQkhxvGrEWTGwezDw26ryAK7nZGLX82xiaUsQfIHYW+1IdlPj6+MwVB95f5y2gyDkFvbhLynlxcDyjbE1twtweHH+Yr44OWy2tD5ACp1vx1jsAFPSzSXKZpXvB+2BlT2oRf/yJeQkOQngEpYN9WWRyNNWv6UxPn9NIn/WGT59elm3lNtk5qgSJQ823En0zqkG0NeqVQ65Q38xJcTIwzJe7AEX31nbMBkvzLGE+Qflxpbf4FNoxeZ9E7OUigHXxT2xe0TOo4ywJSKFG1Hhhshx2QuthfKNb/FHjmvxJqrGt8wMgByTKSA5PJEc74rklGAgBDN6EROLsb5Adq3mA9T0PUHjl46Gu6OgewxLDaZ3LMGf81G1RSd1N7lDBI0IPwknqIk9m0tIrxXingklNC6b7QiClrXSr2207vNdqZiB9vgF4egpULzTIh630NuafNhNSv9kRWQHJMLzQ8ln4m+IPg4eukxLTJ3v4BUF3cEhil0/hwg1Yu2SxHSsOMh9hyF3sC42qLwlrw7T+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(19092799006)(23010399003)(56012099006)(5023799004)(11063799006)(4143699003)(261021121427099003)(261021123027099003)(261009223027099003)(261009221227099003)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xqf9K6yBgG6/B37UCb32ByAWH+0JjaYvyrrLIDCYMH5ZAu/yVbNkmKc8Rxsd?=
 =?us-ascii?Q?pvnHD3A4Wvwv5fAk1e6jhTh8kNuIGdD+dAxVFdFLwFX512uyqcTAhDganV3r?=
 =?us-ascii?Q?IU1l/UhrxENoJIYxe6jIloAeuQimeU6d5UImbYDiELPzcct6N/1iyTkNdXNe?=
 =?us-ascii?Q?kIwypXabOl1EQTffOEH5IwXV6yWMCom9TSSUBNTIgy7CNlbbdF7iPBMVZwGK?=
 =?us-ascii?Q?5v2ScIh+DYNZ+S9rP9Ml3EfPsKMZuSiQSgx2iHlODf01KV5YHOoRUNflxToT?=
 =?us-ascii?Q?ONna9jkyIaCwl5DBFgjFH1gB7M6OO84GfdfIcRxeLM2+ct9GofDXSczbHYQa?=
 =?us-ascii?Q?xfMeoa1/TUyLIiR0ook0NfOj4byzgUyVo1mKQ6OxEaeMNAfslJpEbRuEq5Bd?=
 =?us-ascii?Q?dmQCaJFOGRgnJRrjI+kgnXE8Qzcp4hv6w3PfmstYpC8jLgAxlnuKCpM52+VK?=
 =?us-ascii?Q?607aMWqqNU0K1BhccrannjZWlcoVUIDL/dy5G5aByuYXL7bSzd9X+rSuJhZg?=
 =?us-ascii?Q?6/yOskPAuNfZgo543tnIb98KxJExIKdDamZyYHQ8m2dd3it8vt0f1XFx9055?=
 =?us-ascii?Q?uy73KMtazWDwJhN7/+zgIwTKX10f5Uj2lClRodwX5fAb44PeqMn1jrC60DFV?=
 =?us-ascii?Q?7HPslVfUIus4pimxPlzt8u7sdSj8f8wSKLCp5FZtmLwKAM/wPmPdc0mMtFrx?=
 =?us-ascii?Q?NEHfCQjqJwoLZCJCZA9nVbWK6M3JAmlURdCl7nPojROFVhrqeYtCuDOYiKKy?=
 =?us-ascii?Q?Cl9PtC7rqIHf+ezhdfP1YlawRLMrwftau1L2xsZWNFZs9gHdFDJVmlBW+hoc?=
 =?us-ascii?Q?GAYPbkK6l4xj3J9SfukKogLnf6ggxyqKUigc4q9LZqZG40CQ5U8/oTqaBG7I?=
 =?us-ascii?Q?LzcezHOUBUSSeiAHgK3Grjj4FUb850KN3hRWaIzzlPF17zra5T1xXNL8dDK5?=
 =?us-ascii?Q?S31F/ooargOkfhN70z4V8twm5MasL4qxIzuNpwW9VBUWYNsX4yyEFY/LljIx?=
 =?us-ascii?Q?K9HVhxfQKlw+Tw6PooItx3+SnTWOKf88nwNRAF+wwonCj/GgD1K36WD3xanM?=
 =?us-ascii?Q?Od+Y8xleXdBZgd1SG23sKBHTrmsKahky4DuUw2hauy5sYuiBbnNLKBFKZJVG?=
 =?us-ascii?Q?UT7rEF4rWoiQlDmHpLjAOYZvGzO46az/Fw8+43Lj7EiLxFMCPbjvnTwVvsx4?=
 =?us-ascii?Q?owTZ9iG0Wezr/AYQNv8wzCf1+70EclkdKulVngLflOwmn+V2glwgY81qqhsj?=
 =?us-ascii?Q?ZfVt7NHiRyZ0oYXdKaBd4WgQeqLazMuwm+OqdTf5bagjraUt4+jhpjspMHGZ?=
 =?us-ascii?Q?mseDmOJVmSvjBxPYi5FOPrCB47ZGB3RnsRUk+Mh+YmIk33KGNoLsWOvi61wV?=
 =?us-ascii?Q?sOYL9Jz4ZZxLTCWIw9bqCSX2eX1a1DMuJc84H6g70r3cn4EOojx810LfpOTz?=
 =?us-ascii?Q?AMOtGdw8lzoKRiWdBEowuhM195AHngQ56ipfAiD5h25Pd0Ui2KU8Xq4OYI0D?=
 =?us-ascii?Q?jO4Mu8Z/NBB52DsxHJXK9Cx8MJCSfgSTXvjfhPxfOIN+vnN3EcSIFhnIuPC/?=
 =?us-ascii?Q?zR2KPfQaY+ABRcHyLEUv5fhrJIJ321k5f4yJGbTM58PWVZroHf9nqICqbiud?=
 =?us-ascii?Q?hYn4TYHRHq9TocTyo8ogN8RTgD1g5+AIuxrw5fFNDo80gcCw3zDVVo2BGKWg?=
 =?us-ascii?Q?iuF2XEKkwUOvFNC4tRUNPOT25qUOf6AFBGxUMpEEOGf6MsdLCi/4wncRqrC1?=
 =?us-ascii?Q?0N4OwloaBdx4x8hoO0l0CuBA55oa6LLh7OVaECi94BJISTr0PLfq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0277b0-0ed3-4b5a-5a1d-08df305128c4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 15:28:44.5816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8XZhd0wuyHDa1Rg7rkMWiHR/eLXyzrVoRe5plV+x/xaEJuSQ/MTSWpp5cZZBGXkMaPBBi+wIosAZ3NzL9VMuJ9T2wiZ4TF46DmY7BSuWoDgrODvuwjFeoLJGnYV3vkBU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10780

On Thu, Oct 22, 2026 at 09:53:51AM -0300, Leonardo Costa wrote:
> On Wed, Oct 21, 2026 at 01:38:15PM -0500, Frank Li wrote:
> > On Wed, Oct 21, 2026 at 03:28:54PM -0300, Leonardo Costa wrote:
> > > Hi Frank,
> > >
> > > On Wed, Oct 21, 2026 at 09:56:06AM -0500, Frank Li wrote:
> > > > On Wed, Oct 21, 2026 at 07:39:36AM -0300, Leonardo Costa wrote:
> > > > > Hi Frank,
> > > > >
> > > > > On Thu, Aug 13, 2026 at 11:15:04AM -0500, Frank Li wrote:
> > > > > > On Thu, Aug 13, 2026 at 12:43:29PM -0300, Leonardo Costa wrote:
> > > > > > > On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> > > > > > > > On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > > > > > > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > > > > >
> > > > > > > > > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > > > > > > > > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > > > > > > > > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > > > > > > > > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > > > > > > > > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > > > > > > > > by an ILITEK ILI251x capacitive touch controller.
> > > > > > > > >
> > > > > > > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > > > > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > > > > > > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > > > > > ---
> > > > > > > >
> > > > > > > > what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> > > > > > > >
> > > > > > > > why not share one dtso?
> > > > > > > >
> > > > > > > > Frank
> > > > > > >
> > > > > > > Hi Frank,
> > > > > > >
> > > > > > > There are two main differences:
> > > > > > >
> > > > > > > 1. The mezzanine one uses different backlight controll pins, so here we
> > > > > > > use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
> > > > > > > in the one without the mezzanine.
> > > > > > >
> > > > > > > 2. The touchscreen GPIO and interrupt pins are also different with the
> > > > > > > mezzanine board.
> > > > > >
> > > > > >
> > > > > > And there are for imx8mm
> > > > > > https://lore.kernel.org/imx/20260724-v1-verdin-imx8mm-dtbos-v2-3-9d7988bd76f6@toradex.com/
> > > > > >
> > > > > > https://lore.kernel.org/imx/sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl/
> > > > > >
> > > > > > Any ways, it is too late for 7.3, we have enough time for 7.4 to discuss
> > > > > > work on optimization solution.
> > > > > >
> > > > > > If use nexus connectors, we can share one dtso now if there are not
> > > > > > clock settings.
> > > > > >
> > > > > > clock patches is close to pick up
> > > > > > https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-1-8785f9531cf0@bootlin.com/
> > > > > >
> > > > > > Frank
> > > > >
> > > > > We tried to make the change to have a single overlay for the boards with and
> > > > > without the Mezzanine. However, in the current state of nexus connectors, this
> > > > > can't be done cleanly yet. When trying to describe the hardware at the level it
> > > > > exists in, following DT guidelines, and using nexus connectors, we still need
> > > > > two separate overlays to enable the native LVDS with and without the Mezzanine,
> > > > > so we don't really reduce the maintenance effort.
> > > > >
> > > > > See the changes at the end of the email, this is the closest we got to a
> > > > > correct and clean implementation that would allow the usage of a single
> > > > > overlay.
> > > > >
> > > > > The root cause of the issue is that we need to claim pinctrl_i2s_2_d_in_gpio
> > > > > and pinctrl_i2s_2_sync_gpio for the touchscreen on the Mallow Carrier Board.
> > > > > Ideally, they would be defined in the nexus connector, as shown in the diff.
> > > > > However, after enabling the connectors in the overlay, the pinctrl groups
> > > > > remain unclaimed. The reason is that nexus connectors have no driver to claim
> > > > > the groups.
> > > > >
> > > > >     root@verdin-imx8mp-14777535:~# cat /sys/kernel/debug/pinctrl/30330000.pinctrl/pinmux-pins
> > > > >     ...
> > > > >     pin 112 (MX8MP_IOMUXC_SAI3_RXD): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> > > > >     pin 113 (MX8MP_IOMUXC_SAI3_TXFS): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> > > > >     ...
> > > > >
> > > > > There is nowhere else in the carrier dtsi's where the pinctrls belong.
> > > > >
> > > > > The pinctrl groups thus need to be added to the touchscreen node defined in the
> > > > > overlay. However, the pins on the Development Board (which uses the Mezzanine)
> > > > > are muxed by pinctrl_gpio2 and pinctrl_gpio3. These groups are in the SoM dtsi,
> > > > > and we cannot claim them in the overlay. Because of this, the Mezzanine needs
> > > > > a different overlay, which doesn't claim any pinctrl.
> > > >
> > > > I met similar problem, see below.
> > > >
> > > > >
> > > > > We like the idea of a single overlay for both carriers, but sadly the nexus
> > > > > connectors, as they currently are, are not ready to enable this. We therefore
> > > > > have to move forward normally and once connector support matures, we're happy
> > > > > to refactor this and try to reduce the amount of overlays for the Verdin iMX8MP
> > > > > and for other modules.
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > > > > index 72a4f846d694..d73a7e9042ea 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > > > > @@ -4,6 +4,41 @@
> > > > >   */
> > > > >
> > > > >  / {
> > > > > +	lvds_connector: lvds-mezzanine-connector {
> > > > > +		compatible = "toradex,lvds-connector";
> > > > > +		#gpio-cells = <2>;
> > > > > +		/* LVDS_BKL_EN_CON - Verdin GPIO 4 (SODIMM 212) */
> > > > > +		gpio-map = <0 0 &gpio1 6 0>;
> > > > > +		gpio-map-mask = <0xffffffff 0x0>;
> > > > > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > > > > +
> > > > > +		#pwm-cells = <3>;
> > > > > +		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
> > > > > +		pwm-map = <0 0 0 &pwm2 0 0 0>;
> > > > > +		pwm-map-mask = <0x0 0x0 0x0>;
> > > > > +		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
> > > > > +
> > > > > +		status = "disabled";
> > > > > +	};
> > > > > +
> > > > > +	touch_connector: touch-mezzanine-connector {
> > > > > +		compatible = "toradex,touch-connector";
> > > > > +		#gpio-cells = <2>;
> > > > > +		/* LVDS_TOUCH_RESET_CON# - Verdin GPIO_2 (SODIMM 208) */
> > > > > +		gpio-map = <0 0 &gpio1 1 0>;
> > > > > +		gpio-map-mask = <0xffffffff 0x0>;
> > > > > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > > > > +
> > > > > +		#address-cells = <0>;
> > > > > +		#interrupt-cells = <2>;
> > > > > +		/* LVDS_TOUCH_INT_CON# - Verdin GPIO_3 (SODIMM 210) */
> > > > > +		interrupt-map = <0 IRQ_TYPE_EDGE_FALLING &gpio1 5 IRQ_TYPE_EDGE_FALLING>,
> > > > > +				<0 IRQ_TYPE_EDGE_RISING &gpio1 5 IRQ_TYPE_EDGE_RISING>;
> > > > > +		interrupt-map-mask = <0xffffffff 0xffffffff>;
> > > > > +
> > > > > +		status = "disabled";
> > > > > +	};
> > > > > +
> > > > >  	native-hdmi-connector {
> > > > >  		compatible = "hdmi-connector";
> > > > >  		label = "X37";
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > > > > index 846b36706821..736f034c7550 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > > > > @@ -11,6 +11,46 @@
> > > > >  #include <dt-bindings/leds/common.h>
> > > > >
> > > > >  / {
> > > > > +	lvds_connector: lvds-connector {
> > > > > +		compatible = "toradex,lvds-connector";
> > > > > +
> > > > > +		#gpio-cells = <2>;
> > > > > +		/* LVDS_BKL_EN_CON - Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
> > > > > +		gpio-map = <0 0 &gpio5 1 0>;
> > > > > +		gpio-map-mask = <0xffffffff 0x0>;
> > > > > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > > > > +
> > > > > +		#pwm-cells = <3>;
> > > > > +		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
> > > > > +		pwm-map = <0 0 0 &pwm2 0 0 0>;
> > > > > +		pwm-map-mask = <0x0 0x0 0x0>;
> > > > > +		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
> > > > > +
> > > > > +		status = "disabled";
> > > > > +	};
> > > > > +
> > > > > +	touch_connector: touch-connector {
> > > > > +		compatible = "toradex,touch-connector";
> > > > > +		pinctrl-names = "default";
> > > > > +		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>,
> > > > > +			    <&pinctrl_i2s_2_sync_gpio>;
> > > >
> > > > Thank you try this method.  Can make a pre-defined label for it, such
> > > > such as touch_conn0_pinctrl_gpio0, touch_conn0_pinctrl_gpio1, ....
> > > >
> > > > So touch overlay use this label directly, like other port, i2c ...
> > > >
> > > > After nexus improve by support mapping pinctrl, only few line needs be
> > > > changes.
> > > >
> > > > The bad things is that it need define NULL pintctrl for i2c gpio expander.
> > > >
> > > > It is worth to try.
> > >
> > > Just to clarify, do you mean doing something like this in the Dev Board
> > > dtsi?
> > >
> > >     &iomuxc {
> > >         touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {
> > >             fsl,pins = <>;
> > >         };
> >
> > In your board,
> > 	fsl,pins = <MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30 0x1c4>;   /* SODIMM 48 */
> >
> > If use i2c gpio expander, which have not pinctrl, you can try
> > 	touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {};
> > Do you meet this case in your board design?
> >
> > Frank
>
> On the dev board, these pins don't come from a GPIO expander, but I
> tried both methods:
>
>     &iomuxc {
>         touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {
>             fsl,pins =
>                 <MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01		0x1c4>;	/* SODIMM 208 */
>         };
>
>         touch_conn0_pinctrl_gpio1: touchconn0gpio1grp {
>             fsl,pins =
>                 <MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x184>;	/* SODIMM 210 */
>         };
>     };
>
> This doesn't work, as the touch controller driver isn't able to claim
> the pin muxes, and its probe function fails:
>
>     [    8.181431] imx8mp-pinctrl 30330000.pinctrl: pin MX8MP_IOMUXC_GPIO1_IO01 already requested by 30330000.pinctrl; cannot claim for 1-0041
>     [    8.181468] imx8mp-pinctrl 30330000.pinctrl: error -EINVAL: pin-6 (1-0041)
>     [    8.181483] imx8mp-pinctrl 30330000.pinctrl: error -EINVAL: could not request pin 6 (MX8MP_IOMUXC_GPIO1_IO01) from group touchconn0gpio0grp on device 30330000.pinctrl
>

Can you send me whole your dts file/or patches?

Frank

> The other alternative was to use empty pinctrls:
>
>     &iomuxc {
>         touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {};
>
>         touch_conn0_pinctrl_gpio1: touchconn0gpio1grp {};
>     };
>
> This does work, but it also gives warnings on the dtbs_check:
>
>     arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pinctrl@30330000 (fsl,imx8mp-iomuxc): touchconn0gpio0grp: 'fsl,pins' is a required property
>             from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml
>     arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pinctrl@30330000 (fsl,imx8mp-iomuxc): touchconn0gpio1grp: 'fsl,pins' is a required property
>             from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml
>
> I also tried a few more configurations, but there is no alternative that
> works and also adheres to DT guidelines, while passing dtbs_check.
>
> Leonardo
