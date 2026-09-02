Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677403A1A27;
	Wed,  2 Sep 2026 19:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378026; cv=fail; b=rv+cNaXvlUhHEmHRemKDJGzKzHWKvp660zTNZw80rqi9RxrsKVb6pCjDlthZYVDhYOlQ0RGIlTsTai5sRrnKHztcb5gmKAHcylZLmpgp9o8omk6hGIZ5ur7pXQSOzIzATEFm8ZxhTUKhUqWAOzVUV57XttXXdGX0MVHzFv/moqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378026; c=relaxed/simple;
	bh=jD0FTFRibwQoSPaZLkuHPxn/2t/2q+MlOgfOLhPte6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IYNe50caEYgBHirsKuFW8uFmIl2ZzQTwKMa0ahYqF7iESrpIWZ9tKbhspRrjoMu7i+PhPQR8RXb8PUFsfWpiKz2S9PtTGV2olInado1eAKgx4S9aPzDUk/girIqCN6fVJk4XSuYt9umllIsu0G0V7FTH13dNzBQMEZ4sTg+eubg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vLikekTD; arc=fail smtp.client-ip=40.107.159.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vLikekTD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3bdkNJQl6RqMDp3xNWVd7lLbiIriXz54z36QpODr2FcKlAAWL5P+OMSegmdSDcgLtI1ihCo7SLZwuOoiUyl16/euH6/nPxNm0bpbTs109Annz52MGF9ybfoUwCKw2TlVfeDxR3HV6bvCXzpg3phwbtvoBsr3wGQXRwLI/bfBye39bJ/rzDf3rcKs0qMEVunWS1y/+0ilEw56ma7VWxJ9Ep9VxBPAMvDzJrodjaMWSuOUU2TzThpFAEDFiOvUjQirM1fVtf5Tc7xGW1MQVTusRIz9c4yiTj7kpwXz8e1Jzn7ddZh3BeAY54BFeZ0ibMbZK+UhE/nNRXA74Z/TRw3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buYmzYWFN1cBgBCPk+jteGaGBvPGs8PAzjbMZu1dgD4=;
 b=Yqr3rAilECIAacDD+7O/Hf0YTcmNRGrUJJ8vVgz/WMM24bIjUOXUQoUA7jByqYACzsOa0iHN6l3tOe4Fri5m0UvFxm5ZliZlVjiB3PEiW1xSMrTMXx/145BeW7gYH2ogPubYRmlb6xo98/lQ1KYDPKKxzP5y3NOeTn++oQGkSO/jYn++xYkd8A4wNu1ALx8zjZO/kkUoIYH4zFWSTrYJ9JwBmX0POqkl2d6zenvVhsGgaetUhlp0zbuDIbVMs2fhmpeKnU7DftlHzU6w9c0d1cbtXW7S7R6xOL0Ik+pscluJXYOdNPjDncgHfNPfo33IxaX2FBJj9ZyJVdIMD3UNjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buYmzYWFN1cBgBCPk+jteGaGBvPGs8PAzjbMZu1dgD4=;
 b=vLikekTDlF2FSbA3sTxIwD2+8yir+hZXXQ/dvvb3BylpEMph9lb0zLrWf64f1+Wi/PCUBbzKriL8XRU74na4B9qaS7evqTw0Fn0Xt1IpyvmixCXpu2Pv2ePZ93/+KcVFUfiiVMzyBJ+D3pW2uJcoh5zKqIvpURHO/IiLluK9DaCCWGPrbky1xUR2WkFmICV8BEIN5qMmjcX4Xun3RjOhx0lcGRZbDuRzUJpYA4I8KTvR+WbZEYbE2cKSumeFwVIlJXi+kCscU8lY5AM7zbk4m+o+vBiB3a/1+c2sJDTGJpBwqkP4VGFbdyP41MdTvzdZqG7KOSLR2Cmt2tuqlCk6nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB6950.eurprd04.prod.outlook.com (2603:10a6:20b:105::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:40:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:40:04 +0000
Date: Wed, 2 Sep 2026 15:39:55 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: imx-audmux: Replace tabs with
 spaces
Message-ID: <aph7i3bre7KF_KWf@lizhi-Precision-Tower-5810>
References: <20260830084046.14679-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830084046.14679-2-krzysztof.kozlowski@oss.qualcomm.com>
X-ClientProxiedBy: CY5PR15CA0213.namprd15.prod.outlook.com
 (2603:10b6:930:88::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 012c3374-93fb-45ce-38fe-08df0929fc21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|19092799006|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Y1BhBANUHpt22b8IOSr6YOVj2Tq51+eM8A1fCCW08FKp6ed0W5LXAyOhAPB1hJB3haNUtvm3Fpfa6rfDOWMifOBMaFX3hpA0JKxyfZZx0BnuIZ6lvpPgahlhAdwhtC6a25CV2MJj1HT8XLMDw3mn1I+/SFtm2YUkKNE8ZvmgJ/8tF6hyctxZH+A5KmUk+LjV94lAbxF1ATc59giJEfs6EBs4pqN/il4rXrXv5qloKNPdMbB94XZFqZXZdEdgRyJiGcQkuvTcYhJddtgia0ofZYjdKipFf0nSrlOQKx+tvy0M0UsZseqqprhtGdMj4OLR/MKk3tuaXx6gR0cXIEl9TQdimFC3q62iS6UJRIU532YM4+lDhetrXb88hITw79oc+2Fp9f+hRwNGLo2LVqcuoTeiV6xg9ejNfDLqNEso/aGKV0ToNagZz/WeI3TGyg2AaadhtuAT3LORuggFkxRqqTECNIlO5Mdb3pvReELz9KzrgxLPdMrMClpZscZ3qfVKrKT+8bZsobOD18tz6iPmn/RntTFaRXF0B35VZsEQXVy6TILBW6jPJ2IPOwojVGf1myPu2/a4H6K+JUCtRyLoNx3G3NjgXCu28vuRlaZYQ+tXqGdQrqbb9oZWB6OrZ78YtY1ttRSmdzFKrWPWfhKIHc2zHCar6LZoutFlZg5sDec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(19092799006)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Z1r4X3/V4f38QiAl2HXC+wjNWhq/cfZBIv9YAyIHWWwgbaFg8r+psIBtMIz?=
 =?us-ascii?Q?Mceo6GqMbdaUFf7I563aH2Wv0/h4rOD0NBJrZ9jZ/csI8Xmrxw0T14lBvSrl?=
 =?us-ascii?Q?k36IVzNACmskjG685TiPo4twdumoSDG+W7P69lHz37rsz4fzOshEaHSLc2MA?=
 =?us-ascii?Q?yrSeaxgd/JpgPG6KJUaNIJCnn/AiAN7KgHgaexR6dgbbToTcwillq2Dv7J9B?=
 =?us-ascii?Q?qBhpbMzQxIk2FuNX+MawDOHUPc8vkJXQ2bKku67wvj9WMsGTdhWBNuRpuv6d?=
 =?us-ascii?Q?8Clu8s62eXPU5sesnqSNZOvXKheSdir/McmaTM+HUUm+FVKKTmnpEwRuvcrR?=
 =?us-ascii?Q?szdLe+v6qs2ZpDi3RcEl41Vxot+nbC8GYSBgYsocfkw4+awmlb0Fb8GjBGDk?=
 =?us-ascii?Q?R0+yXhodck8O32GnVYArUBJl1f4A+8YC3lOZOPoB3FzdcOGctOhdWG4Cp7t3?=
 =?us-ascii?Q?+MlxsmfALpGl4jGtbsqLUysurqCGFbRlPzN6yX1RcGGIAxhSz2ICSeGhiJob?=
 =?us-ascii?Q?kO6GjYIgrbc3psPuTxd1BTbvbc4nIrYRS2Z03c3VTnF/A3f7FzIwfpX84NKX?=
 =?us-ascii?Q?3FdeuUFMxtfWTUZawss+Hl/xpi3ilp1YDqPMBsNK7azHvIJn6f5eaRWs6EhF?=
 =?us-ascii?Q?4Cg8c1hv+LRR7AbYTuWJYOsNDFEpWtOY7uLUIIJJp2KVb9B8h0H11kwtnd1u?=
 =?us-ascii?Q?nuygUpioe+wVDT76ionWrwqYZveV/qwMksg9UBL9E7MFwr1SthCt+B4VKSdp?=
 =?us-ascii?Q?2rwENwt0KqX7gPWpBWSoyHvNjjv2XWlFBiBzT/NAgrkpha3D/EuYKt0eEDgC?=
 =?us-ascii?Q?Amj7IDk0N45wquru35pNDNw6jaxcJLLf+EE2C64a949EkkDk3AcdBnjeV83Y?=
 =?us-ascii?Q?/TV89oUNFqaiYMClp7MHf8uE+nkxnCxPW0Bog3usNugDlJ7/di3wnerO5wL1?=
 =?us-ascii?Q?3ni020HcMumFsMKsba0Na5UYL2ZPhSRDtNi3FDxYeorf0xYjTviIoT66tpMP?=
 =?us-ascii?Q?U0SLCm8Kl7rPdvHicj/ElqfN1EBvkPm0Qp5hBxvxr0W7//XSNVTUUJZlReg3?=
 =?us-ascii?Q?yU017Jne2a3IG1RqF2TMvK1MMFPydAMe48kkxP7SA6RTXEBKDCugF5wRuCEw?=
 =?us-ascii?Q?+jLU7iZpRgB+cWmyAEuL7uhl3Kwn974sFyBEhUjkLcl6Axggqg4111B6JSQT?=
 =?us-ascii?Q?38iQKr/P+BPLd34rOtsPsILy0VL5Vezdt58+gXKu9acdc6+hOxLPhlpjYznd?=
 =?us-ascii?Q?czq3JgzkDZ35tYvC6C+UuB/YcSAW06WRHvzHPv83fHwZPWTeCOBhSEXWYilA?=
 =?us-ascii?Q?xnU9DMM3/++gpK+WvEonhXWDyED4YR4HysW2FxwQFw0lQSx5T0/5TJ6nApO/?=
 =?us-ascii?Q?o750paW3OveRBFqJbt0O7S+lNALjb0Mfo1AnPfgI9h03rCoMCp+RwG7FZQG5?=
 =?us-ascii?Q?DzcgQwJDs9ccJLjsJHDbJFtPFbhg8RrqGT07HJ6+SsXPmUhH5xCt8kXVUKRZ?=
 =?us-ascii?Q?I8Y7snMHc0FWJsT1eKWJlbIRszfdZEBg4mufkk1csfQveQYW2g/vjO3g413W?=
 =?us-ascii?Q?++im37p2cGT8zwlyN12A1//fl8cBaueLPsQpbo35x1q9R0k7R6uunnPt6LtC?=
 =?us-ascii?Q?OTquFNgzz9MexvEd2ccgrJZJuW0BJcMET7paSb4rpVTQQw1X8nq1RDc4JNWl?=
 =?us-ascii?Q?mSuilHObm3lGpewH4kjBcZ+GxVCRAZc60ZPESJLMbWslKw9p3j7Eh3xJbot0?=
 =?us-ascii?Q?uJTWq1H5yV5Y3uLR5UwZ1+5M679WV6+4r+ef0DLYm1SA1NAYOos5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 012c3374-93fb-45ce-38fe-08df0929fc21
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:40:03.9906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GofBZCohiKr5QNmmESPyhmUCOHb/FbtkQGx8FNpogX2xNV2BSAktRfENab0CHV0NJVUFEzlBSGajzbRIzmMcTvWTpeNDfQrSYqbpexI14uR12gkXiwiTcss746Jy8ZXq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6950

On Sun, Aug 30, 2026 at 10:40:47AM +0200, Krzysztof Kozlowski wrote:
> YAML files do not use tabs, even within the values in DTS.  No
> functional change, although dt-style-check will warn about it
> ("[tab-in-yaml] tab character not allowed in DTS example").
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Changes in v2:
> 1. Correct logic in commit msg spaces->tabs
> ---
>  Documentation/devicetree/bindings/sound/imx-audmux.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/imx-audmux.yaml b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
> index dab45c310670..501af1add3c1 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audmux.yaml
> +++ b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
> @@ -101,10 +101,10 @@ examples:
>          mux-ssi1 {
>              fsl,audmux-port = <0>;
>              fsl,port-config = <
> -                IMX_AUDMUX_V2_PTCR_SYN		0
> -                IMX_AUDMUX_V2_PTCR_TFSEL(2)	0
> -                IMX_AUDMUX_V2_PTCR_TCSEL(2)	0
> -                IMX_AUDMUX_V2_PTCR_TFSDIR	0
> +                IMX_AUDMUX_V2_PTCR_SYN      0
> +                IMX_AUDMUX_V2_PTCR_TFSEL(2) 0
> +                IMX_AUDMUX_V2_PTCR_TCSEL(2) 0
> +                IMX_AUDMUX_V2_PTCR_TFSDIR   0
>                  IMX_AUDMUX_V2_PTCR_TCLKDIR      IMX_AUDMUX_V2_PDCR_RXDSEL(2)
>                >;
>          };
> --
> 2.53.0
>
