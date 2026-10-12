Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013058.outbound.protection.outlook.com [52.101.83.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B844A9D59;
	Mon, 12 Oct 2026 16:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824253; cv=fail; b=PFsZkvJn52hBleRNG80TFak4H1+PL1ItJFfHGCASHZRiryFkLzLGGWPiYUrAVlrxNATB4AL6SB+IFf5GQo+MBjTyImJPDe1VU3bouYQIQOJAQ+LlUzKZQL+X/f1lcbM7/beTWSyJEQ1KNbbF8gbz1GwRHIesb8JIq4yvvLrwv8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824253; c=relaxed/simple;
	bh=WBC2kCwWQTgZVjzb3JWbY7w0Ev7IhBaV5jrW9nI0RMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AfJBxEjO+Xvj/Ug/AP6Estk+a/TluBKOi9qO2OexubnpfxiWudCZkC3iLcKQap7Tgir/Amz65Ru9vzMIyd1Dc457YkQa68P5Idkt0edGbscL9AEjIsJt5gOQj6RyQtJ0X+7ZRBRba9gl7IR4mP2jtt54TYhT3tzkUTZyDz6DuZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uDzCTAlW; arc=fail smtp.client-ip=52.101.83.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uDzCTAlW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0virF4yjEf9OXPf62uP6DBpDa7VoYsQQ0m9lkBn587l/0AYySXufLo1Cr5HuDgT5ZIhCNkIkZ6i+9Vu0rVBNDPrPoyCIIT9J3HiIUxl16GlDH2qd560Qhk3PKq8Hzq1a+PSWjQ333lua9fnw68hk9qOJhZOFEg7Kub9HIfen4MVUzUQ315PolEoSzZKpJybOXMp34TZRPdIpKUQf+7pWBvoK+4+SXz59y+G5J/Zi4Lc3YvQSzpUWx/3FMIafvMopnEmZzy5C/z/nK1VoTC+Nc7NFST1t7dFFjzlYCaqkIcQFGvJAdm68cGnx7gvIIaVwIa0MhL8oSZM3+YFruCBPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9fHc6qUpCd2u6N/9U7HE52WWVGOAMebo//FHo1swQI=;
 b=QydGY7Lt0Dy5Ac5vY/NCeMG17pRelA5tkCbnscyKPPircwn82+4NaFeBd/JzMgRAQdc1jW7HO93h01nS5mvkZdlebgTfbEEhkHOHC+sflI8O8c00mNeDXJRsAbkP5FzWWnrPkLIv+k8oGTaAKo/SgWOlOXCkJErvYaiu/mnif0/20gx2THoUyVjIfooIZUHDKh2MRsQGpZ91coS/17CrE6riFJodFzIP3D/0s3sd23KRPzXD3Tr4RMdwGD7gjqRQWJm8KeG8IFRtJEPqPvU7+e/q6ss68KVOoWMBGWGvz5hijadW8zuQaoW/JKasG/Is1xb/8HLqHM4Z2bKKhu2JvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9fHc6qUpCd2u6N/9U7HE52WWVGOAMebo//FHo1swQI=;
 b=uDzCTAlWh+m38TeS6Yo2nKS0+G6JfhwF/+in3P0h4OwQwQkoPbAss/VZ3duZ5Lh6/nBPGhgvvUnVOVDI/GUMBJFqCys5RUQV5MK7r+QJUr3BidTuPNBMzJbZ3mpm2hzmFmITJ+c3zSmaOvVOX2kSl5kke/NfU3bUA294NeFYWalVK58k9yHQOOmcN/0zOos37NTPzYvhyI16y3s+O0xQUx4knuYG9pb8SrwmE+3QLF7N/0kI/AsyR8o4d4VOpmyrAPOdsz+itBIEt4cxO1Y+LjFLIdWTP7sb2trUE/f/5QRw68INRz+4WttJI1SfDIdmsVQrswnRrpbBRm8iP8kn1A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB9021.eurprd04.prod.outlook.com (2603:10a6:102:217::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 16:57:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 16:57:25 +0000
Date: Mon, 12 Oct 2026 11:57:16 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	=?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 3/4] arm64: dts: imx8mp-skov-revc: convert to overlays
Message-ID: <as0RbA35EZOmFBcs@SMW015318>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
 <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-3-0906e57486a3@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-3-0906e57486a3@pengutronix.de>
X-ClientProxiedBy: PH7P221CA0043.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB9021:EE_
X-MS-Office365-Filtering-Correlation-Id: cba74a7d-c6c5-4346-04c4-08df2881e422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|366016|7416014|376014|10067099003|261009223027099003|4143699003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	8Qu4U1ipt+vju+v5wV76r/IYfd6KwTWMfrUfESvtGE2oqAgetTFmdFr0ZtPev2IAI1FPjKWrHKFoSZ6TGBcNNuayRTu7x+hiwSpqss7GJCBqwNbyYke33Bya5tmmhEdCMXcOWFoBa65gounq4Jx1RWXQgChLakhtSJAR/QKLrBXvZtSymBk1Mg1G6aqViKjavljHud9O59a5lGElJdOm2/oDVzwtUiw+goDb+uZUOb2Q9ojLa4Rpu/krHDwXeIV+HGiYeOgpMckH6U0c/lf8/SRXnWpAakzMmwFgxDyr0LzBV7yQ6BYw+WfYeiePH//pPN3Wor5iL5xtiQqmM4nIPogH38t+6Ww+XAL5+YSvggFoo63sav1Hm15uNzMlAAW0M3Xe42aHOHOKPQwjQFhPHexpprn222aBJ2giQceAcj7xThNkznQXcPWewx/nK/OhAgQzPARi7r40uNReQaf1WFD7U1r7XHf9FKNR9srT0gJrQPX8ctEgI25OO4FgUMsgdWwq7QZfsgo4zgjZ5LEmzF20krCByVN+LFLwk9rv15lOMdz1GzEKrrDfqFnS03WaHnItfnZgRASOnbQPxKkU8Gm8dGtq7aPvoH+eKA2TvJkiBubthepFA8wdHcyAVkpUKsd4bBKh8zaMAzeU1dG3F4Uy8nqkodNeqpJR7qJZO5I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(366016)(7416014)(376014)(10067099003)(261009223027099003)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VTgsWUt/8EmD14HCb6wlxbdrPbkuKe9hG845bTVsJ+tKPCYbnciA5VnQUYvX?=
 =?us-ascii?Q?V+SPxX8pRoJiBXVQSIwCCLc393M+1f6cv75ihhG/6Q0takSVmfNE1Jy0duAd?=
 =?us-ascii?Q?tEnYWRtDZgXT84UvKBLKGPoMjzcLT3C//N0MDE6i4DqnrYdItWQ3Wzv2Zums?=
 =?us-ascii?Q?znMpSjRk1i3dirE0H1toGumK0iU+p4THelug4eNFTCtue4jidyLincVv3Q91?=
 =?us-ascii?Q?zZoTrSDl+0RXTi04U172ylDvlGuGzkaT+DtBHwnZzn2xzNdmHdeATX8QWVtk?=
 =?us-ascii?Q?8/lIyX6kn2iiSiuWCHNYuuO1Tyw48Q+jh/H++iVQuROnZGBRAkJHj9h/A/nM?=
 =?us-ascii?Q?kScMMwWzJXqrpGTUPY6gN/OibDA8EqiRPyafeYIDy3zoMIlHQpXBBxP9NsYQ?=
 =?us-ascii?Q?Irw/xhZejqwkN2ZXl0maAQSg5GYi6BTtypc6jpDFTjvStt46CewDCNtMW+tD?=
 =?us-ascii?Q?OtZtROWymBOiQfMRcODmFqggSqF3f7sRTxUFeOd2ZoIaDCutmYbs5pkrCDx8?=
 =?us-ascii?Q?nGOT/7R/bS1QiymY1mzoDN7G54o2qt6M72JE0ASAL2IK+qaAXrVVp1qHsP62?=
 =?us-ascii?Q?C0pei+fU6JI7BiBz+kaOOGdos0EzvBq1xRqEsGU0RTQ72tT3vvP3inHQtyU4?=
 =?us-ascii?Q?U7UsHUlmoCvgqjX9jRUD4BG43W+anJJCRkjBcG89UfoLAbZJxzVXYg/KOSxP?=
 =?us-ascii?Q?EZ8oB40AG0V7vUpLHPGPNLV3T83c8AzipFTTb7E5yyoQdLmISkiUGpKo2Ype?=
 =?us-ascii?Q?OPBHB3ervhpC8eOQdUaJ40UoVQNsbtspC8mroA2igXQW3sQfn0rDAPeKgTV2?=
 =?us-ascii?Q?6jDnxxH3IJ4uKd9Wd9+MKh7GeABw483zQt7DX29k95zNV5aO6RgFmnjfZ8Jc?=
 =?us-ascii?Q?c08huaGgIc7Vo/0ouoFHm7Yx64ok+7m0VvbxvX2W40NtMXdKvyB4p4iynb2h?=
 =?us-ascii?Q?G0U3JZD+hR49MBIQ9+m40QCdpeGHRoTf3wzmzK1Fz5CUsvU1ts5JdI6cDV8M?=
 =?us-ascii?Q?Kwji0tlJWV57vOtvFnrbgiCNWlyRpzNQ4t1raQwpru/De/2/de9SRvREuVO1?=
 =?us-ascii?Q?0fcuUws4buJmSVVyP0af+vBYtaIU3AxohE822+/jnVQzLgsPFDPki1jQtCkR?=
 =?us-ascii?Q?asmHdTZf5KmSjfdWJxDeKann9byLjXElGpMjsjsg0pf5N178dXNsF8MrsMyF?=
 =?us-ascii?Q?A5J+0NMJlzpLvwMfDu/BitTomvRRQot/46Ff8axSvw+/prqrxVtlSbVFJRYz?=
 =?us-ascii?Q?skvzqDtw2a2KtJy1nlIfVOzO6pN1grhdzjMRj5XyicYmwVC64ixhAk4bJkyC?=
 =?us-ascii?Q?4N72BWBCFtWeJBTWvOjeUG74XyWH0zNV1sW55+S18fZ73Ezc+HqefMpRlUSJ?=
 =?us-ascii?Q?C6UvXAt8ZBaplhYTUOSvOtYogqE+T5VTKiHwmiHf5ZC/3uTrvQtFv0XbE4BW?=
 =?us-ascii?Q?5x6vEE7J+mi1konuTGxFlFR21cN65LiHiUaq0ID4gaaRjfKsOqRNhKXxB/2R?=
 =?us-ascii?Q?43ZOQ+6Gjs4w8dGSo8hzQsy/yxynFtjfEKxfvHHau9HLvIxoLixkyTwPYBPm?=
 =?us-ascii?Q?46QGj9b+B8BCSiGTWkhaKg2Vi0JXZ0wqeJuuRkH6N4Rr4xJePislBcZrVU9O?=
 =?us-ascii?Q?RQb4yfSrWkOG2uSQUvs/tTNoDFohK0G+4vrsnoyDGS1TfBqpHC1rVYy3fPXs?=
 =?us-ascii?Q?AYiQSxR/9FDCQeBRs7dixtxyf1U8HVcXRIpLTOl0Fqjz55eScK3R70yICxsA?=
 =?us-ascii?Q?XK/UbM1buTNSuWBwFusiBXSL+WWFe/1COKl0gfDJqZUfW3Cug42+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cba74a7d-c6c5-4346-04c4-08df2881e422
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 16:57:25.6003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvUc1b2eIO9SLmL7PBSxOzFzDR+jQC7F0sOQmNRVLcOlYXeonmAABCTyVLM9hifGW0l1eFLdnxSooaGEHzVajH1uYDt6Jsqbtuxjpc8wsCj5QrbOahHmErEIxqWaAkWM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9021

On Mon, Oct 12, 2026 at 08:30:32AM +0200, Steffen Trumtrar wrote:

subject:

arm64: dts: imx8mp-skov-revc: convert jutouch and tian to overlays

or something,  convert "what" to overlays.

> The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are pretty
> similar, apart from the Display and touch controller.
>
> Move the common bindings to imx8mp-skov-revc-touch.dts and convert both
> variants to use overlays applied on this base version.
>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
...

>
>  &lcdif2 {
> @@ -48,14 +35,17 @@ &lcdif2 {
>
>  &lvds_bridge {
>  	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
> -				 <&clk IMX8MP_VIDEO_PLL1>;
> +			  <&clk IMX8MP_VIDEO_PLL1>;

don't mix code style change in this patch.

Frnak
>  	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
> -	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
> -	assigned-clock-rates = <0>, <506800000>;
>  	status = "okay";
>
>  	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>  		port@1 {
> +			reg = <1>;
> +
>  			ldb_lvds_ch0: endpoint {
>  				remote-endpoint = <&in_lvds0>;
>  			};
>
> --
> 2.51.0
>
>
