Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011004.outbound.protection.outlook.com [52.101.125.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D814367B72;
	Thu, 27 Aug 2026 10:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826933; cv=fail; b=PpSgjjOJwCxRvxMWviSAYP2m251SeJ7y////AqN63+6ZhtBeTRZDc498GA1R5TYyn8sEmO7gdvlhH5LGs7LCE9Ei8qTZ/n4L8uMkbszeUGnKuRRnSCWV2U9NCOtZ+wk3L/aHtGFckSF0BksTD3HrW+9/9y9lQCvk3FXJCdh9ogQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826933; c=relaxed/simple;
	bh=QqCTbfy0Orb1NFvpTNizl/UrTWGSiMrm6dNiYqi1pM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MjwOd7f+LYWa0+oR9hGGKDjqLnNOEWTLQyqfUnD0QOnBHs4sXIFs8orJ/MG/900LmMkI6AbNsPO+BJ0Phbb/unOWxYfPvmfZBfpY5v/TzC/Mb71eWYDEjKhqLqWrzSK3E4+d22+1ZAL0Xo1w92kxog0QtED37CfYBqAqpRcTjto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FhuTSXxj; arc=fail smtp.client-ip=52.101.125.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FhuTSXxj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyK/DfI95j2Moudqas3G0ltn2cCVU+7fjrsIpszHDFjBnGEv97G5nADLptswreGVGKxehXf1LctNZRslh/GkBVtQWKjYdXkHocYwLj3rCLFD/A48DItaj/Zv/Th4133GnUpMk35G/sfFN7lnR8CLdfENWHnOeXhtUyS/6q+tajUgEcxC5EV6ng8l21w2ES+P7FJPSCyEoyJOQwU8uzHg2YtpG9Jbot54ajW21wZd050T4hPBW1mYxiOQnolaQ01ugiU92BklQmZDhHrDxlDmx5mxzq5pNNdK+nGQbqox5PbIRXOP+1JaERcSGmVTQQCaHKY7jfYGtv/z0uUvJe0WbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIr0WfsbNWSpffvsdBrZESHvLctgfBoZf302gZJsYKU=;
 b=Xvnk3hnnXcSRIBkS0Mf1ahiH8K43H8pBh+HKOhA5j8AsXO1QFu3Mzzz1ozCOKEYdHEUw2uqdnPmedXiavcJnkNjoZ71fuDGG/OQ/UGT8sMoROh9FqpBEYS4O0auq+BHhzkGQNG9TnY1NXY9A/WVjYbm+43x1H2bZ5sEknL9oCWvyKuIoKOHsqnTftwKgMMiT2G5+xBo0idePRbre7q2hm5DUQpeBkeragiZcgdV9EzWGouwdV0U0NHy6KFGqAZAsSyIC3CxkpDqxBgueiTcXiTNXQhpfh5tcfmTObvbduQPYZjxCZVr1z6cwzvBHU7vDeyeacXZV72L6GkLq3UIIhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIr0WfsbNWSpffvsdBrZESHvLctgfBoZf302gZJsYKU=;
 b=FhuTSXxj9tCG+78Big8l0LtKmcz+HZuuz/y2AGEW3UaWtAKGk6J9yQnUQtjya5lAwP/tt5+ffVLaRNjm7gIfIX4UlvgHKBDIaHZcjqRhofxEFKUaniaZ3gxjmqActO2r3nwond/jAsS4GK76cIG9WtygJICdLHl7ad0VWmLgwbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OSCPR01MB14369.jpnprd01.prod.outlook.com (2603:1096:604:3a0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Thu, 27 Aug
 2026 10:35:30 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 10:35:29 +0000
Date: Thu, 27 Aug 2026 12:35:19 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 08/13] arm64: dts: renesas: r9a08g046: Add fcpvd node
Message-ID: <apAS50JiLKRBgKs1@tom-desktop>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-9-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826174854.199139-9-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0233.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::15) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OSCPR01MB14369:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc25579-7fac-426f-cba2-08df0426ea44
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|1800799024|376014|10067099003|4143699003|22082099003|18002099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	ZBpkWxHd0geUUR1h5gDzmDQEnGf5+AVrFl5CN0cEKV4AYEmoH0t7tzR1+4Adq5OzDrpGeAUyc8K6x/uq9gkotk4Yp0iFWE2mW4sCCovss+mzScPKvxlY6It0M3bDU1JoK1wLm4DKTEUpWd7fIw65IaSBgdxKJkQ2+2tp20hBKIlJS5xymbADG974bfCEhqV67D1vri1btNUxQdaG47bFJtXCJKJuw0BFOi51lqfeM3Ht3E2vdhdkMLhymfXQkpA+UTwTjXxud8z7ckW/3Ssi6qoZTpe4ztSKfaUs10uFsELAI+7FAvYpU983ap4z/KoVMfQlbN2Ktr5NRNckgvY4IUznbBVwMeA6IwbOTAKYpz2CBvSIUcmEWf1Maby7X1WqURr5SlTw8aqoFFi/tKCPOgqRkzgR0PHnipXI6BzyAUK/mIEdhbSdpSTreL3y5shhnpPmfRb5NbVmn+gt74L2fBmj+M3TdUngASyz7CPwFWlRxG5eZ6tv6E0OBx1k/Hv2lP/bJg1wUQc/xVkCzjkNr/I+475vsDQZMROvdRTGWYv+9fENcCoNmIGGkvSUd6ePeeLlwvm8We2nl6z8LF2Ps2q6cdOqBFEh+K7s8s9K4uRu6jiMyQ/n3wO+rujOmomg2kvIgetpD3+9uEPTVKAi2J23UMx+5pWbCtzLRRXHaYfTSEMGF6YAvSXRktjzAYVSnePa/TlsVwIO/11xMRj67g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(1800799024)(376014)(10067099003)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YQ1qi3ZofU0jnq3PkalQ5iB+wLdrTAUFCiesKHQKR40SkSdcu/mwBJM/xkPs?=
 =?us-ascii?Q?swsFeWiHQIf4VVEvAAZzc+5YWCkhh1djJ46QJMy2RFzPXyRFCkxHZfuTME+S?=
 =?us-ascii?Q?jhXB3wKKjU7D/vngGN+357BvO/r3+CtllmNqw0tU14WAKXyctY0QlEUrlENI?=
 =?us-ascii?Q?7Q/MYUJlIvYgEhkSL9lSSbB2kA9IKPxJiJjdDkC8gB2H073y7pg6H8I6W9pF?=
 =?us-ascii?Q?y3FQ92P3WuJInKs8gy+bTp4UihAeu9cC9wN41ipzOHxiTwJAikok+J6V2Rln?=
 =?us-ascii?Q?5gqAgOo7Ii5PD3qn0Dc63ecOYS94cSZn0B7gIIfOflBr5LfPd2V6TklcgfR0?=
 =?us-ascii?Q?ECghYpZ/X9AmnzFfqFMOgfnIfHIPeDgF+SbLlLXRs8GVm+q/PP1CkjPBnUqY?=
 =?us-ascii?Q?Vyp0rGRvfmyS7dfCJXzviCofzwhBN1ouRL4At9Cgl4+dpuRGZ5moKFl0aoWk?=
 =?us-ascii?Q?kv66hQytV1YnQSmPhhPKVlOaOx8PdPS8thbuJUIOZNsifpjMO/COGG2EhvWl?=
 =?us-ascii?Q?31LWXKVM01nvUu+F6T0mHL6w8QgBeUSUjXJLvJlQtCx6TkZhCUjewxSPgteS?=
 =?us-ascii?Q?GUkAeJASQeVwVnmMCdX6pSkABRLXDgQQD7R56zai+er3s2n8tLQkq7/HlxbK?=
 =?us-ascii?Q?s5ZSVg8exvJ+XWc74iZbE8co1rJA10SpbrtBLRLcP/GOaSuHTM7wD2oqkb5J?=
 =?us-ascii?Q?okftC7o40HWb9SKuNByMMO26IP71MWiU6plckDdPrdUDJhKBMLyQC1OeZCwD?=
 =?us-ascii?Q?SI1uRH8agsQaJZgiC+cYvFHvNGNx79IgtbfQ7JS232QwxBuipZXkiiF0pYCi?=
 =?us-ascii?Q?Yo78DyFSkij69rv4oT68j22X58+Q1TRwJzpTUaQSKhlH3cLzGMQMhbmLWkLe?=
 =?us-ascii?Q?FxulkhQSpTeV2jAL2xN4qPkzYp7OdGjq9h9sb9SiUbomk71STL6u3kGpuAz0?=
 =?us-ascii?Q?5dGrcZVumX3XtF5bE0AJK5BbA9GTSFep8kfl2+6rpaRHZU0V5OFBdh1C30EX?=
 =?us-ascii?Q?4Qtqddj77v1rGjwiGiOlz5frtqjnh9FTi7OTynRlyVLIEBqqgSWY60nMHzLS?=
 =?us-ascii?Q?SatuGLcIZElN1foA0A30nPvfNely4PgDP9Dc7DzGeWYP5yJGSYOB/CGAbjGc?=
 =?us-ascii?Q?3wkDaAzKca9zUUDK6vTnOgW1yJG/K7joPVmgUDwaDVeQwOzxd9xOQSBIvtzq?=
 =?us-ascii?Q?Jmn5MRw5rReNbvyJ7YI3oaZoCX3D9k0SmU0m1b+cB+tp9E10NoNEY7i5id5Q?=
 =?us-ascii?Q?UKbUaXxzemG7pB6u727VAdJA3KxgFFICdxqeRCDn/vPehRSbpEFmAAywIhfv?=
 =?us-ascii?Q?/UWkH26nW2MXHmtjnchNUsJb7CwkS2YQyANWF9XEO0UimvtSNDazjtuAZdEq?=
 =?us-ascii?Q?j8eBcbLgHnnHW0cBlg1/9hK1ELVjLHUViRyD0W9NJ1iRHA7WNjM7JVmtZwCm?=
 =?us-ascii?Q?EbOjRggeJg65SCOzQLRhtdhELiF12ExYgyTp3IfiunWTF+kufeEqc393sxMG?=
 =?us-ascii?Q?KJwRQU6NwHImlP99Zxn4aUfDSt9w889z5mwWhZ9R9/7QgMrrusXuUGtzq5yf?=
 =?us-ascii?Q?4fP1nwYIK4Pn6rP3LAED9BtEV0NCm2qD2FwSA4A4W7nY/lGJWmDKa2L7tyZh?=
 =?us-ascii?Q?ZliZAR9CBeyMFaDko3PAp9OZbyEf3tIGS6uatgl1j1gGMPWCj5KX5mSF93B0?=
 =?us-ascii?Q?DkE0pKovo6Lh2J64xFIghVag5Ca0eRDg1JWH000j+fWW6ttc9u1NvktM3LTF?=
 =?us-ascii?Q?MNPC3Ixf6kFkV+fS3RyRWKLuX1YyP7usHXnPmL0YN4N5iSPS8p9W?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc25579-7fac-426f-cba2-08df0426ea44
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:35:29.8913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGjk4FoCKOjUabuhEKuykTDgFWadvzyRG41lBpbgsywFzW01/+LLq8cqrhnEL0DhRjPjRmMl7qfHERAeJkA7fZX4Io/0By3Nad6sU17Z7xvnAikXj1qfPPcDT/Y4xzW0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14369

Hi Biju,
Thanks for your patch.

On Wed, Aug 26, 2026 at 06:48:42PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add fcpvd node to RZ/G3L SoC DTSI.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change.
> v1->v2:
>  * No change.
> ---
>  arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> index 9f5ea62efc2c..ad38aee2efb3 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -696,6 +696,17 @@ ssi3: ssi@100e4c00 {
>  			status = "disabled";
>  		};
>  
> +		fcpvd: fcp@10880000 {
> +			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
> +			reg = <0 0x10880000 0 0x10000>;
> +			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
> +				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
> +				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
> +			clock-names = "aclk", "pclk", "vclk";
> +			resets = <&cpg R9A08G046_LCDC_RESET_N>;
> +			power-domains = <&cpg>;

Maybe for consistency with:

	- arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
	- arch/arm64/boot/dts/renesas/r9a07g044.dtsi
	- arch/arm64/boot/dts/renesas/r9a07g054.dtsi

You can move reset entry to the latest position.
Apart from that LGTM.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind regards,
Tommaso

> +		};
> +
>  		gpu: gpu@108b0000 {
>  			compatible = "renesas,r9a08g046-mali",
>  				     "arm,mali-bifrost";
> -- 
> 2.43.0
> 
